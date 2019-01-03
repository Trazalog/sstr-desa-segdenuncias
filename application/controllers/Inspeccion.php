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
		$data['list'] = $this->Inspecciones->Listado_Inspecciones();
		$data['inspectores']= $this->Inspectores->Listado_Inspectores();
		$data['permission'] = $permission;
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
	public function Guardar_Inspeccion(){

		$inspeccionfechaasigna=$this->input->post('inspeccionfechaasigna');
		$inspeccionfecharecp=$this->input->post('inspeccionfecharecp');
		$inspectorid=$this->input->post('inspectorid');
		$inspecciondescrip=$this->input->post('inspecciondescrip');
		$estableid=$this->input->post('estableid');
		$idsDenuncias = $this->input->post('idsDenuncias');
		
		// convierte a formato datetime para guardar en BD
		$date = date_create($inspeccionfechaasigna);
		$fecha_actual = date_format($date, 'Y-m-d H:i:s');
		// Lanza proceso de inspeccion (retorna case_id)
		$result = $this->lanzarProcesoBPM($inspectorid);
		$caseId = json_decode($result, true)['caseId'];
		
		// si lanza proceso exitosamente		
		if ($caseId) {		
			
			$data = array(
				'inspeccionfechaasigna' => $fecha_actual,
				'inspeccionfecharecp' => $fecha_actual,
				'inspectorid' => $inspectorid,
				'inspecciondescrip' => $inspecciondescrip,
				'estableid' => $estableid,
				'inspeestado' =>"C",
				'bpm_id' =>$caseId
			);	
			$idInsercion = $this->Inspecciones->Guardar_Inspecciones($data);
			
			if($idInsercion > 0){
				// si hay denuncias, las guarda
				if($idsDenuncias!= null){
					$datosInspDenun = $this->armarBatch($idInsercion,$idsDenuncias);
					$response = $this->Inspecciones->setInsDenIds($datosInspDenun);
					echo json_encode($response);
				}else{
					$response = true;
					echo json_encode($response);
				}				
			}else{
				$response = false;
				echo json_encode($response);
			}
		} else{
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
	// devuelve listado de inspecciones por denuncia
	public function listInspPorDenuncia($permission, $idDenuncia){
	
		$data['list'] = $this->Inspecciones->listInspPorDenuncia($idDenuncia);
		$data['inspectores']= $this->Inspectores->Listado_Inspectores();
		$data['permission'] = $permission;
		$this->load->view('inspecciones/list_inspdenuncia', $data);
	}

	
}	

?>