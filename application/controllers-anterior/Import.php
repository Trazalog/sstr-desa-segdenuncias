<?php
defined("BASEPATH") OR die("El acceso directo al script está prohibido");

class Import extends CI_Controller{

	public function __construct(){

		parent::__construct();
		$this->load->helper("url","form");
		$this->load->database();
		$this->load->library("form_validation"); 
		$this->load->model("Imports");
	}

	public function index($permission){

		$data['permission'] = $permission;
		$this->load->view("import/view_",$data);
	}

	public function to_mysql(){

    	//obtenemos el archivo subido mediante el formulario
		$file = $_FILES['excel']['name'];   
	    //comprobamos si existe un directorio para subir el excel
	    //si no es así, lo creamos
		if(!is_dir("./excel_files/")) 
			mkdir("./excel_files/", 0777);

    	//comprobamos si el archivo ha subido para poder utilizarlo
		if ($file && copy($_FILES['excel']['tmp_name'],"./excel_files/".$file)){

      		//queremos obtener la extensión del archivo
			$trozos = explode(".", $file);

      		//solo queremos archivos excel
			if($trozos[1] != "xlsx" && $trozos[1] != "xls") return;

			/** archivos necesarios */
			require_once APPPATH . 'libraries/Classes/PHPExcel.php';
			require_once APPPATH . 'libraries/Classes/PHPExcel/Reader/Excel2007.php';

      		//creamos el objeto que debe leer el excel
			$objReader = new PHPExcel_Reader_Excel2007();
			$objPHPExcel = $objReader->load('./excel_files/'.$file);

      		//número de filas del archivo excel
			$rows = $objPHPExcel->getActiveSheet()->getHighestRow();   

      		//obtenemos el nombre de la tabla que el usuario quiere insertar el excel
			$table_name = trim($this->security->xss_clean($this->input->post("table")));

			$fields_table = array('/A','ALTURA','ALTURA/#agg','CALLE','CUIT','CUIT/#agg','DESCRIPCION_x0020_PROGRAMA','DPTO','ESTABLECIMIENTO_x0020_EMPRESA_x0020_ID','ESTABLECIMIENTO_x0020_EMPRESA_x0020_ID/#agg','FECHA_x0020_DE_x0020_VERIFICACION_x0020_DE_x0020_LA_x0020_DENUNCIA','FECHA_x0020_DENUNCIA','INTERSECCION','LATITUD','LATITUD/#agg','LOCALIDAD','LONGITUD','LONGITUD/#agg','MOTIVOS_x0020_INFRINGIDOS','NRO_x0020_ACTA_x0020_ANTERIOR_x0020_A_x0020_LA_x0020_VERIFICACION','NRO_x0020_OBRA','NRO_x0020_OBRA/#agg','NROS_x0020_ACTAS_x0020_POSTERIORES_x0020_A_x0020_LA_x0020_VERIFICACION','PISO','PROGRAMA_x0020_INCLUSION','RAZON_x0020_SOCIAL','RIESGO_x0020_GRAVE_x0020_O_x0020_INMINENTE');

      		//inicializamos sql como un array
			$sql = array();

      		//array con las letras de la cabecera de un archivo excel
			$letras = array(
				"A","B","C","D","E","F","G",
				"H","I","J","K","L","M","N",
				"O","P","Q","R","S","T","U",
				"V","W","X","Y","Z","AA","AB");

      		// recorremos el excel y creamos un array para después insertarlo en la base de datos
      		// $i=3 xq arrancade la fila 3 (1 y 2 son titulos)
			for($i = 3;$i <= $rows; $i++){
        		//arma el array con todas las celdas por fila(1 registro de excel por iteracion)
				for($z = 0; $z < count($fields_table); $z++){
					
					$sql[$i][trim($fields_table[$z])] = $objPHPExcel->getActiveSheet()->getCell($letras[$z].$i)->getCalculatedValue();					
				}
			} 
			
			$tamaño = 3 + count($sql); //  xq el array empieza desde 3.
			$y = 0; // variable para array inconsistencias
			$e = 0; // variable para array de cuit no inscriptos en BD
			$f = 0; // variable para array de establec no inscriptos en BD
			$nueva = 0;	//variable de nueva denuncia
			// recorre arreglo $sql buscando... 
			for ($i=3; $i < $tamaño; $i++) { 
			
				$CUIT  = $sql[$i]['CUIT'];
				$CALLE = $sql[$i]['CALLE'];
				$FECHA_DENUNCIA = $sql[$i]["FECHA_x0020_DENUNCIA"];	
				$MOTIVO = $sql[$i]["MOTIVOS_x0020_INFRINGIDOS"];
				// si el empleador esta registrado devuelve el id de empleador
				if ($idEmpleador = $this->Imports->matchCuit($CUIT)) {		
					// si existe el establecimiento trae el id
					if ($idEstab = $this->Imports->matchEstablecimiento($idEmpleador, $CALLE)) {
						// busca en Bd registro que coincida en motivos, fecha e id estab		
						$registro = $this->Imports->matchRegistro($FECHA_DENUNCIA,$MOTIVO,$idEstab);
						// si existe un registro, se guarda	en $inconsistencias					
						if ($registro) {
							//echo "  Existe la denuncia, el id es: ".$registro;
							$inconsistencias[$y] = $sql[$i];
							$y++;
						}else{							
							//echo "La denuncia no existe en BD, guardar!!";
							$nuevaDenuncia[$nueva] = $sql[$i];
							$nueva++;					
						}
					}else{
						$noEstabl[$f] = $CALLE;
						$f++;
						echo "no coinciden datos de empleador (calle/s)";
					}
				}else{
					//echo "no esta registrado el cuit de empleador: ".$CUIT;
					$noCuit[$e]= $CUIT;
					$e++;
				}
			}
    		
		}else{
			echo "Debes subir un archivo";
		}

		//finalmente, eliminamos el archivo pase lo que pase
		unlink("./excel_files/".$file);

		// si existen nuevas denuncias se arman y se guardan
		if (isset($nuevaDenuncia)) {
			$denListas = $this->armarDenunciasNuevas($nuevaDenuncia, $idEstab);
			$response['respGuardado'] = $this->Imports->setDenuncias($denListas);
		}else{
			$response['respGuardado'] = 'sin denuncias';
		}
		// si existen denuncias ya cargadas anteriormente se devuelven para mostrar
		if (isset($inconsistencias)){
			$response['inconsistencias'] = $inconsistencias;	
		}else{
			$response['inconsistencias'] = array();
		}
		// si existen cuits sin registrar se devuelven
		if (isset($noCuit)) {			
			$response['noCuit'] = $noCuit;
		}else{
			$response['noCuit'] = array();
		}
		// si existen establecimientos sin registrar se devuelven
		if (isset($noEstabl)) {			
			$response['noEstabl'] = $noEstabl;
		}else{
			$response['noEstabl'] = array();
		}		

		echo json_encode($response);
		
	}

	// Procesa el array de denuncias para insertar en BD
	function armarDenunciasNuevas($nuevaDenuncia, $idEstab){

		for ($i=0; $i < count($nuevaDenuncia) ; $i++) { 
			$denuncia[$i]['denunciasfecha'] = $this->formatoFecha($nuevaDenuncia[$i]["FECHA_x0020_DENUNCIA"]);
			$denuncia[$i]['denunciariesgo'] = $nuevaDenuncia[$i]["RIESGO_x0020_GRAVE_x0020_O_x0020_INMINENTE"];
			$denuncia[$i]['denunciaprograma'] = $nuevaDenuncia[$i]["PROGRAMA_x0020_INCLUSION"];
			$denuncia[$i]['denunciafechaverif'] = $this->formatoFecha($nuevaDenuncia[$i]["FECHA_x0020_DE_x0020_VERIFICACION_x0020_DE_x0020_LA_x0020_DENUNCIA"]);
			$denuncia[$i]['denunciainclucion'] = $nuevaDenuncia[$i]['PROGRAMA_x0020_INCLUSION'];
			$denuncia[$i]['denuncianroobra'] = $nuevaDenuncia[$i]["NRO_x0020_OBRA"];
			$denuncia[$i]['denuncianroacta'] = $nuevaDenuncia[$i]["NRO_x0020_ACTA_x0020_ANTERIOR_x0020_A_x0020_LA_x0020_VERIFICACION"];
			$denuncia[$i]['denunciamotivos'] = $nuevaDenuncia[$i]["MOTIVOS_x0020_INFRINGIDOS"];
			$denuncia[$i]['estableid'] = $idEstab;
			$denuncia[$i]['denunciaestado'] = 'AC';
		}

		return $denuncia;
	}
	// Cambia el formato de fecha para insertar en BD
	function formatoFecha($fecha){
		$date = $fecha;
	    $date = explode('/', $date);                    
	    $date = $date[2].'-'.$date[1].'-'.$date[0];
	    return $date;
	}














	public function cleanArray($data){
		
		$data = explode("|", $data);
		$z=0;
		//dump_exit($data);
		for ($i=0; $i < count($data) ; $i++) { 
			if ($data[$i] != " ") {
				$motivos[$z] = $data[$i];
				$z++;				
			}
		}

		return $motivos;

		//dump_exit($motivos);
	}
}