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
	
	/* funciones nuevas SST */

	public function cerrarTarea(){	

		$userdata = $this->session->userdata('user_data');
		$usrId = $userdata[0]['usrId'];		
		$tipoActa = $this->input->post('tipoActa');
		$accion = $this->input->post('accion');
		$fechaProrroga = $this->input->post('fechaProrroga');		
		$tipoTarea =  $this->input->post('tipoTarea');	
		$idTarBonita = $this->input->post('id');
		$idCaseBonita = $this->input->post('case_id');	 		
		
		//cierra el proceso
		$contract = array (				
			"tipoActa"	=>	$tipoActa,
			"accion" => $accion,
			"fechaProrroga" => $fechaProrroga."T00:00"
		);	
	 	$parametros = $this->Bonitas->conexiones();	 
		$parametros["http"]["method"] = "POST";
		$parametros["http"]["content"] = json_encode($contract);	 	
	 	$param = stream_context_create($parametros);
		$response = $this->Tareas->cerrarTarea($idTarBonita,$param);	
		//dump($response["reponse_code"],' response : ');
		if ($response["reponse_code"] == 204) {

			//sube pdf
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
			
			$idInspeccion = $this->Tareas->getIdInspPoridCase($idCaseBonita);

			// graba en trg_actas
			$data['acta'] = "assets/inspecciones/".$nom;
			$data['tipoActa'] = $tipoActa;
			$data['accion'] = $accion;
			$data['fechaProrroga'] = $fechaProrroga; 
			$data['inspeccionid'] = $idInspeccion; 
			$this->Tareas->setDatosInspeccion($data, $idInspeccion);	
			// actualiza en tb_inspecciones
			$datos['tipoActa'] = $tipoActa;
			$datos['accion'] = $accion;		
			$this->Tareas->actualizaInspeccion($idInspeccion,$datos);
		}
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
		echo json_encode($response);
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

}
?>