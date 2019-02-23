<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Tareas extends CI_Model
{
	function __construct(){

		parent::__construct();
	}
	// trae tareas de BPM
	 function getTareas($param){

	 	$userdata = $this->session->userdata('user_data');
		$usrId= $userdata[0]["usrId"];
		//FIXME: SACAR HARDCODEO 
		//$usrId = 2;		//lia.busatto
		//$usrId = 3;		//juan.perez
	 	//$tareas = file_get_contents(BONITA_URL.'API/bpm/humanTask?p=0&c=10&f=user_id%3D5', false, $param);
	 	$resource = 'API/bpm/humanTask?p=0&c=1000&f=user_id%3D';
	 	$url = BONITA_URL.$resource.$usrId;
	 	$tareas = file_get_contents($url, false, $param);
		// agrega datos de inspeccion para mostrar en bandeja entrada
	 	$tar = $this->AgregarDatos($tareas);
		return $tar;
	 }	

	function getInspector(){
		$sql= "SELECT *
					FROM tbl_inspectores";

		$query= $this->db->query($sql);
		if ($query->num_rows()!=0){
			return $query->result_array();	
		}
		else{
			return false;
		}
	}

	// agrega datos de inspeccion a lista de bpm para mostrar en bandeja entrada	
	function AgregarDatos($tareas){
		
		$tar = json_decode($tareas,true);
		foreach ($tar as $key => $value) {
			$caseId = $tar[$key]["caseId"];
			// trae datos de inspeccion por case_id
			$datos = $this->getDatInspeccion($caseId);
			$tar[$key]['establecalle'] = $datos[0]['establecalle'];
			$tar[$key]['establealtura'] = $datos[0]['establealtura'];
			$tar[$key]['empleacui'] = $datos[0]['empleacui'];
			$tar[$key]['emplearazsoc'] = $datos[0]['emplearazsoc'];
		}
		//var_dump($tar);
		return $tar;
	}
	// trae datos establecimiento en funcion del caseId de BPM
	function getDatInspeccion($caseId){	

		$this->db->select('tbl_establecimiento.establecalle,
											tbl_establecimiento.establealtura,
											tbl_empleadores.empleacui,
											tbl_empleadores.emplearazsoc,
											tbl_establecimiento.estableid');		
		$this->db->from('tbl_inspecciones');
		$this->db->join('tbl_establecimiento', 'tbl_inspecciones.estableid = tbl_establecimiento.estableid');
		$this->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');		
		$this->db->where('tbl_inspecciones.bpm_id', $caseId);
		$query = $this->db->get();
		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
	}

	function getUsuariosBPM($param){

		// $resource = 'API/identity/user?f=group_id=19';
		$resource = 'API/identity/user?p=0&c=50';
	 	$url = BONITA_URL.$resource;
		$usrs = file_get_contents($url, false, $param);
		return json_decode($usrs,true) ;
	}

	//obtener Comentarios
	function ObtenerComentariosBPM($caseId,$param){
		$processInstance = 'processInstanceId%3D'.$caseId;
		$comentarios = file_get_contents(BONITA_URL.'API/bpm/comment?f='.$processInstance.'&o=postDate%20DESC&p=0&c=200&d=userId',false,$param);
		return json_decode($comentarios,true);
	}
	//Guardar Comentarios
	function GuardarComentarioBPM($param){
		$respuesta = file_get_contents(BONITA_URL.'API/bpm/comment',false,$param);
		return $respuesta;
	}

	// cerrar tarea SST
	function cerrarTarea($idTarBonita,$param){
		///API/bpm/userTask/:userTaskId/execution
		$method = '/execution';
		$resource = 'API/bpm/userTask/';
		$url = BONITA_URL.$resource.$idTarBonita.$method;
		file_get_contents($url, false, $param);
		$response = $this->parseHeaders( $http_response_header );
		return $response;
	}	
	// devuelve id de isnpeccion por id case
	function getIdInspPoridCase($idCaseBonita){
		$this->db->select('tbl_inspecciones.inspeccionid');
		$this->db->from('tbl_inspecciones');
		$this->db->where('tbl_inspecciones.bpm_id', $idCaseBonita);
		$query = $this->db->get();
		$response = $query->row('inspeccionid');
		return $response;
	}
	// guarda eel acta de inspeccion
	function setDatosInspeccion($data){
		
		$response = $this->db->insert("trg_actas",$data);	
		return $response;
	}
	// actualiza en tbl_inspecciones
	function actualizaInspeccion($idInspeccion,$datos){
		$this->db->where('inspeccionid', $idInspeccion);
		$query=$this->db->update('tbl_inspecciones',$datos);
		return $query;
	}

	function getDenPorBpmId($bpm_Id){	
		$this->db->select('tbl_denuncias.*');
		$this->db->from('tbl_denuncias');
		$this->db->join('trg_inspecciondenuncia', 'tbl_denuncias.denunciaid = trg_inspecciondenuncia.denunciaid');
		$this->db->join('tbl_inspecciones', 'tbl_inspecciones.inspeccionid = trg_inspecciondenuncia.inspeccionid');

		$this->db->where('tbl_inspecciones.bpm_id', $bpm_Id);
		$query = $this->db->get();
		if ($query->num_rows()!=0){   
			return $query->result_array();  
		}
	}



	
	// Terminar Tarea
	function terminarTarea($idTarBonita,$param){

		$userdata = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId'];
		$method = '/execution';
		$resource = 'API/bpm/userTask/';
		$url = BONITA_URL.$resource.$idTarBonita.$method;
		//$url = BONITA_URL.$resource.$usrId.$method;
		file_get_contents($url, false, $param);
		$response = $this->parseHeaders( $http_response_header );
		return $response;
	}

	// Tomar Tareas
	function tomarTarea($idTarBonita,$param){

		try {
			$resource = 'API/bpm/humanTask/';
			$url = BONITA_URL.$resource.$idTarBonita;

			file_get_contents($url, false, $param);
			$response = $this->parseHeaders( $http_response_header );
			//dump_exit($response);
			return $response;
		}catch (Exception $e) {
			var_dump($e->getMessage());
		 }
	}

	// Soltar Tareas
	function soltarTarea($idTarBonita,$param){

		$resource = 'API/bpm/humanTask/';
		$url = BONITA_URL.$resource.$idTarBonita;
		file_get_contents($url, false, $param);
		$response = $this->parseHeaders( $http_response_header );
		return $response;
	}

	// toma la respuesta del server y devuelve el codigo de respuesta solo
	function parseHeaders( $headers ){
		$head = array();
		foreach( $headers as $k=>$v ){
			$t = explode( ':', $v, 2 );
			if( isset( $t[1] ) )
				$head[ trim($t[0]) ] = trim( $t[1] );
			else{
				$head[] = $v;
				if( preg_match( "#HTTP/[0-9\.]+\s+([0-9]+)#",$v, $out ) )
					$head['reponse_code'] = intval($out[1]);
			}
		}
		return $head;
	}

	// Devuelve el id de tareas de trazaj correspond al id_tarea bonita para detatareas
	// NO TOCAR
	function getIdTareaTraJobs($idBonita,$param){

		$urlResource = 'API/bpm/activityVariable/';
		$idListEnBPM = '/trazajobsTaskId';

		try {
			$idTJ = @file_get_contents(BONITA_URL.$urlResource.$idBonita.$idListEnBPM , false, $param);
			$idTJobs = json_decode($idTJ,true); //sin true no se puede acceder
			$id_listarea = $idTJobs["value"];
		} catch (Exception $e) {
			echo 'Excepción capturada: ',  $e->getMessage(), "\n";
			$id_listarea = 0;
		}

		return $id_listarea;
	}

	function detaInspecciones($caseId){

		$this->db->select('tbl_inspecciones.*');
		$this->db->from('tbl_inspecciones');	 
		$this->db->where('tbl_inspecciones.bpm_id', $caseId);
		$query = $this->db->get();

	 if ($query->num_rows()!=0){
			return $query->result_array();
		}else{
			return false;
		}
 }
	
	function getDatosBPM($idTarBonita,$param){

		// $response = file_get_contents(BONITA_URL.'API/bpm/humanTask/54', false, $param);
		// echo "response: ";
		// return $response;

		$urlResource = BONITA_URL.'API/bpm/humanTask/';

		$data = file_get_contents($urlResource.$idTarBonita , false, $param);


		return $data;
	}

}
