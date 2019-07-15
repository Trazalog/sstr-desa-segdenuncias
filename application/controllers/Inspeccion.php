<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Inspeccion extends CI_Controller {
	function __construct(){

		parent::__construct();
		$this->load->model('Inspecciones');
		$this->load->model('Inspectores');
		$this->load->model('Bonitas');
		$this->load->model('Overviews');
		$this->load->model('Tareas');
	}

	public function index($permission){
		$data['list']        = $this->Inspecciones->Listado_Inspecciones();
		$data['inspectores'] = $this->Inspectores->Listado_Inspectores();
		$data['permission']  = $permission;
		$rolBonita           = $this->getRolBonita();
		$data['rolBonita']   = $rolBonita->role_id;
		$this->load->view('inspecciones/list', $data);
	}

	public function Obtener_Inspeccion(){
		$id=$_POST['inspeccionid'];
		$result = $this->Inspecciones->Obtener_Inspecciones($id);
		echo json_encode($result);
	}
	
	public function Modificar_Inspeccion(){
		$id=$this->input->post('inspeccionid');
		$inspeccionfechaasigna=$this->input->post('inspeccionfechaasigna');
		$inspeccionfecharecp=$this->input->post('inspeccionfecharecp');
		$inspectorid=$this->input->post('inspectorid');
		$inspecciondescrip=$this->input->post('inspecciondescrip');
		$estableid=$this->input->post('estableid');
		
		$data = array(
			'inspeccionid' => $id,
			'inspeccionfechaasigna' => $inspeccionfechaasigna,
			'inspeccionfecharecp' => $inspeccionfecharecp,
			'inspectorid' => $inspectorid,
			'inspecciondescrip' => $inspecciondescrip,
			'estableid' => $estableid,
			'inspeestado' =>"C"
		);
		$sql = $this->Inspecciones->Modificar_Inspecciones($data);
		echo json_encode($sql);
	}


	public function Eliminar_Inspeccion(){

		$id=$_POST['inspeccionid'];	
		$result = $this->Inspecciones->Eliminar_Inspecciones($id);
		echo json_encode($result);	
	}

	public function getEstablecimiento(){
		$id=$_POST['empleaid'];
		$result=$this->Inspecciones->getEstablecimientos($id);
		echo json_encode($result);
	}

	public function getDenominacionSocial(){

		$result= $this->Inspecciones->getDenominacionSocial();
		echo json_encode($result);
	}

	public function getDenPorEstabId(){
		$idEstab = $this->input->post('idEstab');
		$response = $this->Inspecciones->getDenPorEstabIds($idEstab);
		//var_dump($response);
		echo json_encode($response);
	}

	
	/* FUNCIONES NUEVAS */

	public function getRolBonita()
	{
		$userdata   = $this->session->userdata('user_data');
		$usrId      = $userdata[0]["usrId"];
		//$usrId = 1;		//lia.busatto
		//$usrId = 2;		//juan.perez
		$parametros = $this->Bonitas->conexiones();
		$param      = stream_context_create($parametros);
	 	$resource   = 'API/identity/membership?p=0&c=1000&f=user_id%3D';
	 	$url        = BONITA_URL.$resource.$usrId;
		$membresia  = file_get_contents($url, false, $param);
		$membresia  = json_decode($membresia);
		return $membresia[0];
	}

	// trae detalle de inspeccion por Id BPM para editar
	public function getEditInspeccion($permission,$idTarBonita)
	{
		$data['idTarBonita'] = $idTarBonita;
		$data['permission']  = $permission;
		$data['comentarios'] = $this->ObtenerComentariosBPM($idTarBonita);
		$data['timeline']    = $this->ObtenerLineaTiempo($idTarBonita);

		$this->load->view('inspecciones/view_editinspeccion',$data);
	}

	// trae detalle de inspeccion por Id BPM
	public function getGetDetaInspeccion($permission,$idTarBonita){

		$data['idTarBonita'] = $idTarBonita;
		$data['permission'] = $permission;
		$data['comentarios'] = $this->ObtenerComentariosBPM($idTarBonita);
		$data['timeline'] = $this->ObtenerLineaTiempo($idTarBonita);

		$this->load->view('inspecciones/view_',$data);
	}

	// trea comentarios de BPM para mostrar en detalle de inspeccion
	function ObtenerComentariosBPM($caseId){
	
		$parametros = $this->Bonitas->conexiones();
		$param = stream_context_create($parametros);
		return $this->Tareas->ObtenerComentariosBPM($caseId,$param);
	}
	// trea lineade tiempo de BPM para mostrar en detalle de inspeccion
	function ObtenerLineaTiempo($caseId){
		
		$parametros = $this->Bonitas->LoggerAdmin();
		$parametros["http"]["method"] = "GET";
		$param = stream_context_create($parametros);
		$data['listAct'] = $this->Overviews->ObtenerActividades($caseId,$param);
		$data['listArch'] = $this->Overviews->ObtenerActividadesArchivadas($caseId,$param);
		return $data;
  }
	//trae todos los inspectores
	public function getInspector(){

		$result = $this->Inspecciones->getInspector();
		echo json_encode($result);
	}

	// Guarda inspeccion nueva
	public function Guardar_Inspeccion()
	{
		$inspeccionfechaasigna = $this->input->post('inspeccionfechaasigna');
		$inspeccionfecharecp   = $this->input->post('inspeccionfecharecp');
		$inspectorid           = $this->input->post('inspectorid');
		$inspecciondescrip     = $this->input->post('inspecciondescrip');
		$estableid             = $this->input->post('estableid');
		$idsDenuncias          = $this->input->post('idsDenuncias');
		//dump_exit($this->input->post());
		// convierte a formato datetime para guardar en BD
		$date                  = date_create($inspeccionfechaasigna);
		$fecha_actual          = date_format($date, 'Y-m-d H:i:s');
		// Lanza proceso de inspeccion (retorna case_id)
		$result                = $this->lanzarProcesoBPM($inspectorid);
		$caseId                = json_decode($result, true)['caseId'];
		// si lanza proceso exitosamente		
		if ($caseId)
		{
			$data = array(
				'inspeccionfechaasigna' => $fecha_actual,
				'inspeccionfecharecp'   => $fecha_actual,
				'inspectorid'           => $inspectorid,
				'inspecciondescrip'     => $inspecciondescrip,
				'estableid'             => $estableid,
				'inspeestado'           => "C",
				'bpm_id'                => $caseId
			);	
			$idInsercion = $this->Inspecciones->Guardar_Inspecciones($data);
			
			if($idInsercion > 0)
			{
				// si hay denuncias, las guarda
				if($idsDenuncias!= null)
				{
					$datosInspDenun = $this->armarBatch($idInsercion,$idsDenuncias);
					$response = $this->Inspecciones->setInsDenIds($datosInspDenun);
					echo json_encode($response);
				}else
				{
					$response = true;
					echo json_encode($response);
				}				
			}
			else
			{
				$response = false;
				echo json_encode($response);
			}
		} 
		else
		{
			$response = false;
			echo json_encode($response);
		}				
	}
	
	// arma batch de relacion denuncias/inspecciones
	function armarBatch($idInsercion,$idsDenuncias){
		
		$batch = array();
		foreach ($idsDenuncias as $value) {
			$comp = array('denunciaid' => $value,
										'inspeccionid'=> $idInsercion);
			array_push($batch,$comp); 
		}
		return $batch;
	}
	// lanza proceso en BPM (inspección)
	function lanzarProcesoBPM($inspectorid){

		$parametros = $this->Bonitas->conexiones();
		$parametros["http"]["method"] = "POST";
		$idInspector = array (
		  "idInspector"	=>	$inspectorid
		);	
		$parametros["http"]["content"] = json_encode($idInspector);
		$param = stream_context_create($parametros);
		$result = $this->Inspecciones->lanzarProcesoBPM($param);
		//dump($result, 'Result:');
		return $result;		
	}
	// filtar inspecciones por distintos criterios
	public function getInspeccionesCriterio(){
		
		$tipoOaccion = $this->input->post('criterio');
		$idInspector = $this->input->post('idinspectorAsig');
		$response = $this->Inspecciones->getInspeccionesCriterio($tipoOaccion, $idInspector);	
			
		if($response != null){
			echo json_encode($response);
		}else{
			$response = array();
			echo json_encode($response);
		}
				
	}

	public function getInspeccionesporFecha(){
		$fi = $this->input->post('fi');
		$ff = $this->input->post('ff');
		echo json_encode($this->Inspecciones->Listado_Inspecciones_por_Fecha($fi,$ff));
	}
	// devuelve listado de inspecciones por denuncia
	public function listInspPorDenuncia($permission, $idDenuncia){
	
		$data['list'] = $this->Inspecciones->listInspPorDenuncia($idDenuncia);
		$data['inspectores']= $this->Inspectores->Listado_Inspectores();
		$data['permission'] = $permission;
		$this->load->view('inspecciones/list_inspdenuncia', $data);
	}


	// Codifica nombre de imagen para no repetir en servidor
	// formato "12_6_2018-05-21-15-26-24" idpreventivo_idempresa_fecha(año-mes-dia-hora-min-seg)
	function codifNombre($ultimoId,$empId)
	{
		$guion       = '_';
		$guion_medio = '-';
		$hora        = date('Y-m-d H:i:s');// hora actual del sistema	
		$delimiter   = array(" ",",",".","'","\"","|","\\","/",";",":");
		$replace     = str_replace($delimiter, $delimiter[0], $hora);
		$explode     = explode($delimiter[0], $replace);
		$strigHora   = $explode[0].$guion_medio.$explode[1].$guion_medio.$explode[2].$guion_medio.$explode[3];
		$nomImagen   = $ultimoId.$guion.$empId.$guion.$strigHora;
		
		return $nomImagen;
	}

	/**
	 * Inspeccion:agregarAdjunto();
	 *
	 * @return String nomre de archivo adjunto
	 */
	public function agregarAdjunto()
	{
		$userdata     = $this->session->userdata('user_data');
		$empId        = $userdata[0]['id_empresa'];

		$idActa   = $this->input->post('idAgregaAdjunto');
		$nomcodif = $this->codifNombre($idActa, $empId); // codificacion de nombre
		$nomcodif = 'acta'.$nomcodif;
		$config   = [
			"upload_path"   => "./assets/inspecciones",
			'allowed_types' => "png|jpg|pdf|xlsx",
			'file_name'     => $nomcodif
		];

		$this->load->library("upload",$config);
		if ($this->upload->do_upload('inputPDF')) 
		{	
			$data     = array("upload_data" => $this->upload->data());
			$extens   = $data['upload_data']['file_ext'];//guardo extesnsion de archivo
			$nomcodif = $nomcodif.$extens;
			$adjunto  = array('acta' => 'assets/inspecciones/'.$nomcodif);
			$response = $this->Inspecciones->updateAdjuntoActa($adjunto,$idActa);
		}else{
			$response = false;
		}

		echo json_encode($response);
	}
	
	/**
	 * Inspeccion:eliminarAdjunto();
	 *
	 * @return Bool 	True si se eliminó el archivo o false si hubo error
	 */
	public function eliminarAdjunto()
	{
		$idActa   = $this->input->post('idActa');
		$response = $this->Inspecciones->eliminarAdjunto($idActa);
		echo json_encode($response);
	}
}	
