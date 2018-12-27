<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Tarea extends CI_Controller {
	function __construct(){
		parent::__construct();
		$this->load->model('Tareas');
		$this->load->model('Bonitas');
		//$this->load->model('Notapedidos');
		$this->load->model('Overviews');
	}
	// Carga lista de OT
	public function index($permission){

		//$metodo = "POST";
		$parametros = $this->Bonitas->conexiones();
		$param = stream_context_create($parametros);
		$data['list'] = $this->Tareas->getTareas($param);
		//dump_exit($data);

		$data['permission'] = "Add-Edit-Del-View-";//$permission;

		$this->load->view('tareas/list', $data);
	}

	public function getInspector(){
		
		$result = $this->Tareas->getInspector();
		echo json_encode($result);
	}

	public function getUsuariosBPM(){

		$parametros = $this->Bonitas->LoggerAdmin();
		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "GET";
		$param = stream_context_create($parametros);
		$users = $this->Tareas->getUsuariosBPM($param);
		echo json_encode($users,true);
		//dump_exit($users);

	 }

	// ver el usr dinamico
	public function ObtenerTareaBPM(){

		$userdata = $this->session->userdata('user_data');
    $usrId = $userdata[0]['usrId'];     // guarda usuario logueado
		

		$idTarBonita = $this->input->post('idTarBonita');

		$estado = array (
		  "assigned_id"	=>	$usrId
		);

		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();

		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "GET";
		$parametros["http"]["content"] = json_encode($estado);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$response = $this->Tareas->tomarTarea($idTarBonita,$param);

		return $response;
	}

	// Trae datos de BPM para notif estandar
	public function getDatosBPM($idTarBonita){

		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();

		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "GET";

		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$response = $this->Tareas->getDatosBPM($idTarBonita,$param);

		return $response;
	}

	// devuelve id de ot por caseId
	public function getIdOTPorCaseId(){
		$caseId = $this->input->post('caseId');
		$response = $this->Tareas->getIdOTPorCaseId($caseId);
		echo json_encode($response);
	}


	// Estado cuenta BOTON HECHO
	public function estadoCuenta(){

		$idTarBonita = $this->input->post('idTarBonita');
		$valor = $this->input->post('estado');
		$estado = array (
		  //"estadoCuentaClienteOk"	=>	"$valor"
		);
		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();

		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";
		//$parametros["http"]["content"] = json_encode($estado);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$result = $this->Tareas->estadoCuenta($idTarBonita,$param);
		echo json_encode($result);
	}
	// Estado cuenta
	public function estadoCuentaOk(){

		$idTarBonita = $this->input->post('idTarBonita');
		$valor = $this->input->post('estado');
		$estado = array (
		  "estadoCuentaClienteOk"	=>	"$valor"
		);
		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();

		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";
		$parametros["http"]["content"] = json_encode($estado);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$result = $this->Tareas->estadoCuentaOk($idTarBonita,$param);
		echo json_encode($result);
	}
	// Esperando Regularizacion
	public function esperandoRegularizacion(){

		$idTarBonita = $this->input->post('idTarBonita');
		$valor = $this->input->post('espera');
		$espera = array (
		  "seguirEsperandoRegularizacion"	=>	"$valor"
		);
		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();

		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";
		$parametros["http"]["content"] = json_encode($espera);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$result = $this->Tareas->esperandoRegularizacion($idTarBonita,$param);
		echo json_encode($result);
	}

	// Precisa Anticipo
	public function precisaAnticipo(){

		$idTarBonita = $this->input->post('idTarBonita');
		$valor = $this->input->post('precisa');
		$precisa = array (
		  "precisaAnticipo"	=>	"$valor"
		);
		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();

		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";
		$parametros["http"]["content"] = json_encode($precisa);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$result = $this->Tareas->precisaAnticipo($idTarBonita,$param);
		echo json_encode($result);
	}

	public function GuardarComentario(){
		$comentario = $this->input->post();
		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();

		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";
		$parametros["http"]["content"] = json_encode($comentario);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$response = $this->Tareas->GuardarComentarioBPM($param);
		echo json_encode($response);
	}

	// Trae id de tarea de trazajobs segun id de tarea bonita - NO TOCAR
	public function getIdTareaTraJobs($idTarBonita){

		try {
			$metodo = "POST";
			$parametros = $this->Bonitas->conexiones();
			$param = stream_context_create($parametros);
			$idTJobs = $this->Tareas->getIdTareaTraJobs($idTarBonita,$param);
		} catch (Exception $e) {
			$idTJobs = 0;
			echo 'Excepción capturada: ',  $e->getMessage(), "\n";
		}

		return $idTJobs;
	}
	// verifica que el form tenga todos los campos validado en 1
	// public function validarFormGuardado(){

		// 	$id_listarea = $this->input->post('id_listarea');
		// 	$response = $this->Tareas->validarFormGuardado($id_listarea);
		// 	echo json_encode($response);
		// }

	

	public function terminarTareaStandarenBPM(){

	 	$idTarBonita = $this->input->post('idTarBonita');
	 	$id_listarea = $this->input->post('id_listarea');
	 	// trae la cabecera
	 	$parametros = $this->Bonitas->conexiones();
	 	// Cambio el metodo de la cabecera a "PUT"
	 	$parametros["http"]["method"] = "POST";
	 	// Variable tipo resource referencia a un recurso externo.
	 	$param = stream_context_create($parametros);
	 	$response = $this->Tareas->terminarTareaStandarenBPM($idTarBonita,$param);

	 	// guarda el taskId de BPM en tbl_listareas
	 	$resp = $this->Tareas->updateTaskEnListarea($id_listarea,$idTarBonita);

	 	echo json_encode($response);
	}

	/* funciones nuevas SST */

	public function cerrarNotificacion(){

	}

	public function cerrarTarea(){	

		$userdata = $this->session->userdata('user_data');
		$usrId = $userdata[0]['usrId'];		
		$tipoActa = $this->input->post('tipoActa');
		$accion = $this->input->post('accion');
		$fechaProrroga = $this->input->post('fechaProrroga');		
		$tipoTarea =  $this->input->post('tipoTarea');		
		$contract = array (				
			"tipoActa"	=>	$tipoActa,
			"accion" => $accion,
			"fechaProrroga" => $fechaProrroga."T00:00"
		);		
		$idTarBonita = $this->input->post('id');
		$idCaseBonita = $this->input->post('case_id');	
	 	// trae la cabecera
	 	$parametros = $this->Bonitas->conexiones();	 
		$parametros["http"]["method"] = "POST";
		$parametros["http"]["content"] = json_encode($contract);
	 	// Variable tipo resource referencia a un recurso externo.
	 	$param = stream_context_create($parametros);
		$response = $this->Tareas->cerrarTarea($idTarBonita,$param);	
		//actualiza la tbl:inspecciones
		$config = [
			'upload_path' => './assets/inspecciones/',
			'allowed_types' => 'pdf'
		];
		$this->load->library("upload",$config);
		if($this->upload->do_upload('filePdf')){
		}else{
			$this->upload->display_errors('<p>', '</p>');
		}
		$dataImag = array("upload_data" => $this->upload->data());
		$nom = $dataImag['upload_data']['file_name'];
		$data['adjunto'] = "assets/inspecciones/".$nom;
		$data['tipoActa'] = $tipoActa;
		$data['accion'] = $accion;
		$data['fechaProrroga'] = $fechaProrroga; 
		$this->Tareas->setDatosInspeccion($data,$idCaseBonita);			
	 	echo json_encode($response);
	}

	public function reasignarInspector(){

		$idInspector = $this->input->post('idInspector');
		$idTarBonita = $this->input->post('id');		
		$contract = array (
			"idInspector"	=>	$idInspector			
		);
	 	// trae la cabecera
	 	$parametros = $this->Bonitas->conexiones();
	 	// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";
		$parametros["http"]["content"] = json_encode($contract);
	 	// Variable tipo resource referencia a un recurso externo.
	 	$param = stream_context_create($parametros);
		 
		//$response = $this->Tareas->reasignarInspector($idTarBonita,$param);
		$response = $this->Tareas->cerrarTarea($idTarBonita,$param);
		echo json_encode($response);
	}

	/* fin funciones nuevas SST */





	// Trae id de ot por id de BPM
	public function getIdOT(){
		$idTarBonita = $this->input->post('idTarBonita');
		$response = $this->Tareas->getIdOtPorIdBPM($idTarBonita);
		//dump_exit($response);
		echo json_encode($response);
	}

	// terminar planifica
	public function terminarPlanificacion(){
		$idTarBonita = $this->input->post('idTarBonita');
		$idOrdenTrabajo =  $this->Tareas->getIdOtPorIdBPM($idTarBonita);
		//dump_exit($idOrdenTrabajo);
		 $idOT = array (
		 			"ordenTrabajoDiagnostico"	=>	$idOrdenTrabajo
		 		);
		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();
		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";
		$parametros["http"]["content"] = json_encode($idOT);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$response = $this->Tareas->terminarPlanificacion($idTarBonita,$param);
		echo json_encode($response);
	}

	//TODO: AGRAGUE ESTE METODO
	public function terminarAsigPersPlanificacion(){
		$idTarBonita = $this->input->post('idTarBonita');
		$idOT = $this->input->post('idOT');
		//var_dump($idTarBonita);
		//dump_exit($idOT);
		// $idOT = array (
		// 	"ordenTrabajoDiagnostico"	=>	$idOT
		// );
		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();
		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";
		//$parametros["http"]["content"] = json_encode($idOT);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$response = $this->Tareas->terminarPlanificacion($idTarBonita,$param);
		echo json_encode($response);

	}

	// Usr Toma tarea en BPM (Vista de planificacion)
	public function tomarTareaPlanificacion(){

		$userdata = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId'];     // guarda usuario logueado

		$idTarBonita = $this->input->post('idTarBonita');

		$estado = array (
		  "assigned_id"	=>	$usrId
		);

		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();

		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "PUT";
		$parametros["http"]["content"] = json_encode($estado);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$response['respRest'] = $this->Tareas->tomarTarea($idTarBonita,$param);
		$idPedido = $this->input->post('idPedido');
		$cod_interno = $this->input->post('cod_interno');
		$detalle = $this->input->post('detalle');
		// Valida exitencia y genera OT inicial
		//if (!$this->Tareas->validarEstOT($idTarBonita,$idPedido)) {
		if (!$this->Tareas->validarEstOTporCodInterno($cod_interno)) {
				//echo "NOOO hay orden guardada";
				$this->Tareas->setOTInicial($idTarBonita,$idPedido,$cod_interno,$detalle);
				$insert_id = $this->db->insert_id();
		}else{
				$insert_id = 0;
		}
		$response['resInsert'] = $insert_id;
		echo json_encode($response);
	}
	// Usr Toma tarea en BPM (Vistas tareas comunes)
	public function tomarTarea(){
		$userdata = $this->session->userdata('user_data');
    $usrId = $userdata[0]['usrId'];     // guarda usuario logueado
		//dump_exit($usrId);
		$idTarBonita = $this->input->post('idTarBonita');
		$estado = array (
 		  "assigned_id"	=>	$usrId
 		);
 		// trae la cabecera
 		$parametros = $this->Bonitas->conexiones();
 		// Cambio el metodo de la cabecera a "PUT"
 		$parametros["http"]["method"] = "PUT";
 		$parametros["http"]["content"] = json_encode($estado);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$response = $this->Tareas->tomarTarea($idTarBonita,$param);
		echo json_encode($response);
	}
	// Usr Toma tarea en BPM   CAMBIAR EL USR POR USR LOGUEADO !!!!!!!
	public function soltarTarea(){

		$idTarBonita = $this->input->post('idTarBonita');

		$estado = array (
		  "assigned_id"	=>	""
		);
		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();
		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "PUT";
		$parametros["http"]["content"] = json_encode($estado);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$response = $this->Tareas->soltarTarea($idTarBonita,$param);
		echo json_encode($response);
	}

	// trae datos para llenar notificaion estandar y formulario asociado
	public function detaTarea($permission,$idTarBonita){		

		//OBTENER DATOS DE TAREA SELECCIONADA DESDE BONITA
		$data['TareaBPM'] = json_decode($this->getDatosBPM($idTarBonita),true);
		$data['permission'] = $permission;
		//OBTENER DATOS DE TAREA SELECCIONADA DESDE BONITA
		$data['TareaBPM'] = json_decode($this->getDatosBPM($idTarBonita),true);
		$caseId = $data['TareaBPM']["caseId"];			
		// trae datos de inspeccion por case_id
		$data['datos'] = $this->Tareas->detaInspecciones($caseId);	
		$data['idTarBonita'] = $idTarBonita;	
	
		$data['comentarios'] = $this->ObtenerComentariosBPM($caseId);
		$data['timeline'] = $this->ObtenerLineaTiempo($caseId);

		switch ($data['TareaBPM']['displayName']) {
			
			case 'Reasignar Inspector a Inspección':
						$this->load->view('tareas/view_reasignarInspector', $data);
						break;

			case 'Realiza Inspección':
						$this->load->view('tareas/view_realizaInspeccion', $data);
						break;	

			default:				
						$this->load->view('tareas/view_', $data);				
						break;
		}
	}

	public function getDenPorBpmId(){
		$bpm_Id = $this->input->post('bpm_Id');	
		$response = $this->Tareas->getDenPorBpmId($bpm_Id);
		//var_dump($response);
		echo json_encode($response);

	}

	public function detaTareaRevisionDiagnosticoCoordinador(){
		//$idTareaRevisionB = 20696;
		//$idOTRevision = 379;
		//$id_listarea = 333;
		$idTareaRevisionB = $this->input->post('idTareaRevisionB');
		$id_listarea = $this->input->post('id_listarea');
		//dump($id_listarea);

		// trae id de form asociado a tarea std (las tareas de BPM se cargaran para asociar a form).
		$idTareaStd = $this->Tareas->getTarea_idListarea($id_listarea);
		$idForm = $this->Tareas->getIdFormPorIdTareaSTD($idTareaStd); // si es 0 no hay form asociado

		// confirma si hay form guardado de esa listarea
		//$this->Tareas->getEstadoForm($idTareaRevisionB);

		// si hay formulario
		if($idForm != 0){
			$data['idForm']	= $idForm;
			// carga datos del formulario para modal
			$data['form'] = $this->Tareas->get_form($idTareaRevisionB,$idForm);
			//dump($data);
		}else{
			$data['idForm'] = 0;
		}
		//dump_exit($data);
		$response['html'] = $this->load->view('tareas/view-modal-form-revDiagCoord', $data, true);
		echo json_encode($response);
	}


	public function rehacerTareaIds()
	{
		$idsTareaTrazajob = $this->input->post('idsTareaTrazajob');
		$idTarBonita      = $this->input->post('idTarBonita');
		$parametros       = $this->Bonitas->conexiones();
		$response         = $this->Tareas->rehacerTareaIds($parametros, $idsTareaTrazajob, $idTarBonita);
		echo json_encode($response);
	}

	//////////////  form dinamico  //////////////////

	// trae valores validos para llenar componentes del formulario
	public function getValValido(){

		$idForm = $this->input->post('idForm');
		//dump_exit($idForm);
		$response = $this->Tareas->getValValidos($idForm);
		echo json_encode($response);
	}

	// trae el valor de la imagen guardada
	public function getImgValor(){
		$idForm = $this->input->post('idForm');
		$idPedTrabajo = $this->input->post('idPedTrabajo');
		$response = $this->Tareas->getImgValor($idForm,$idPedTrabajo);
		//$response = $this->Tareas->getImgValor($idForm);
		echo json_encode($response);
	}

	public function GuardarCotizacion(){
		$idPedTrabajo = $this->input->post('idPedTrabajo');
		$config = [
			'upload_path' => "./assets/documentosMTB/cotizaciones",
			'allowed_types' => "*",
			'max_size' => "5000"
		];
		$this->load->library("upload",$config);
		if($this->upload->do_upload('cotizacion')){
			$documento = array("upload_data" => $this->upload->data());
			$data = array(
				'NOM_VAR' => 'cotizacion',
				'VALOR' => "./assets/documentosMTB/cotizaciones/".$documento['upload_data']['file_name']
			);
		 	$resultBD = $this->Tarea->GuardarCotizacion($idPedTrabajo,$data);
		 	if($resultBD==false){
		 		echo 'error';
		 	}else{
		 		echo base_url().$data['VALOR'];
			}

			}else{
				echo $this->upload->display_errors();
		}

	}

	// verifica que el form tenga todos los campos validado en 1
	// public function validarFormGuardado(){

	// 	$response = true;
	// 	$obligArrayIds = $this->input->post('obligArrayIds');
	// 	$id_listarea = $this->input->post('id_listarea');

	// 	foreach ($obligArrayIds as $idValor) {

	// 		$result = $this->Tareas->validarFormGuardado($idValor,$id_listarea);

	// 		if ($result == $idValor) {
	// 			//echo "valor validado";
	// 		}else{
	// 			$response = $result;
	// 		}
	// 	}
	// 	echo json_encode($response);
	// }
	// verifica que el form tenga todos los campos validado en 1
	public function validarFormGuardado(){

		$cont = 0;
		$obligArrayIds = $this->input->post('obligArrayIds');
		$id_listarea = $this->input->post('id_listarea');

		foreach ($obligArrayIds as $idValor) {

			$result = $this->Tareas->validarFormGuardado($idValor,$id_listarea);
			if(!$result){
				$cont++;
			}
		}
		if($cont>0){
			$response = false;
		}else{
			$response = true;
		}
		echo json_encode($response);
	}


	// guarda  form commpletado (revisar no funciona bien)
	public function guardarForm(){

		//  array con id de dato->valor(dato es FOCO_ID)
		$datos = $this->input->post();
		//dump_exit($datos);
		$userdata = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId'];     // guarda usuario logueado
        $listarea = $datos['id_listarea'];
        $idformulario = $datos['idformulario'];
        $i = 1;// para guardar el orden de categorias, grupos y valores
        $j = 0;
		
		foreach ($datos as $key => $value) {

			// Si no son los primeros dos campos id listarea e id formulario
			if (($key != 'id_listarea') && ($key != 'idformulario')) {
				//trae array con info de dato por id				
				$data = $this->Tareas->getDatos($key);		
				// Agrego datos adicionales al formulario
				$data['USUARIO'] = $usrId;
				
				// Solo si los valores vienen con info guarda
				if (($value != "") || ($value != -1) ) {
					$data['VALOR'] = $value;
				}
				// si el valor es -1 guarda Seleccione..
				if (($value == -1) ) {
					$data['VALOR'] = 'Seleccione...';
				}

				// Si un componente viene "" o -1  o "notilde" guarda 0 (no validado)
				if( ($value == "") || ($value == -1) || ($value == "notilde") )  {
					$data['VALIDADO'] = 0;
				}else{
					$data['VALIDADO'] = 1;
				}

				$tipoComp = $data['TIDA_NOMBRE'];
				// Si el tipo de dato es "input_archivo"			
				if ($tipoComp == "input_archivo") {					
					// si el value no esta vacio
					if($value != ""){							
						$config = [
							'upload_path' => './assets/imgformularios/',
							'allowed_types' => 'png|jpg'
						];
						$this->load->library("upload",$config);	
						if($this->upload->do_upload($key)){
							echo "subio ok";
						}else{
							$this->upload->display_errors('<p>', '</p>');
							echo "error en subida";
						}
						$dataImag = array("upload_data" => $this->upload->data());
						$nom = $dataImag['upload_data']['file_name'];							
						$data['VALOR'] = "assets/imgformularios/".$nom;	
						
					}else{
						echo $data['VALOR'];
					}
				}

				$this->Tareas->UpdateForm($data,$key); // key es FOCO_ID
				
				$i++;
			}

		}
	}

	// Codifica nombre de imagen para no repetir en servidor
	// formato "12_11_2018-05-21-15-26-24" id_listarea_usrId_fecha(año-mes-dia-hora-min-seg)
	function codifNombre($listarea, $usrId){
		$guion       = '_';
		$guion_medio = '-';
		$hora        = date('Y-m-d H:i:s');// hora actual del sistema
		$delimiter   = array(" ",",",".","'","\"","|","\\","/",";",":");
		$replace     = str_replace($delimiter, $delimiter[0], $hora);
		$explode     = explode($delimiter[0], $replace);

		$strigHora   = $explode[0].$guion_medio.$explode[1].$guion_medio.$explode[2].$guion_medio.$explode[3];

		$nomImagen   = $listarea.$guion.$usrId.$guion.$strigHora;

		return $nomImagen;
	}

	function ObtenerComentariosBPM($caseId){
		//$metodo = "POST";
		$parametros = $this->Bonitas->conexiones();
		$param = stream_context_create($parametros);
		return $this->Tareas->ObtenerComentariosBPM($caseId,$param);
	}

	public function ObtenerLineaTiempo($caseId){
		$parametros = $this->Bonitas->LoggerAdmin();
		$parametros["http"]["method"] = "GET";
		$param = stream_context_create($parametros);
        $data['listAct'] = $this->Overviews->ObtenerActividades($caseId,$param);
        $data['listArch'] = $this->Overviews->ObtenerActividadesArchivadas($caseId,$param);
        return $data;
    }

    public function GuardarValorPresupuesto(){
		$data = $this->input->post();
		$result = $this->Tareas->GuardarValorPresupuesto($data);
		echo json_encode($result);
	}

	public function GuardarValorCotizacion(){
		$data = $this->input->post();
		$result = $this->Tareas->GuardarValorCotizacion($data);
		echo json_encode($result);
	}
	public function GuardarValorInfoTecnico(){
		$data = $this->input->post();
		$result = $this->Tareas->GuardarValorInfoTecnico($data);
		echo json_encode($result);
	}
}
?>