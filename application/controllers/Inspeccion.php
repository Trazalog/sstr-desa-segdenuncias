<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Inspeccion extends CI_Controller {
	function __construct()
	{
		parent::__construct();
		$this->load->model('Inspecciones');
		$this->load->model('Inspectores');
		$this->load->model('Bonitas');
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
		var_dump($result);
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
			$datosInspDenun = $this->armarBatch($idInsercion,$idsDenuncias);
			$response = $this->Inspecciones->setInsDenIds($datosInspDenun);

			if($response){
				echo json_encode($response);
			}
		}else{
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
		return $result;		
	}

	public function getInspeccionesCriterio(){

		$response = $this->Inspecciones->getInspeccionesCriterio($this->input->post('criterio'));		
		echo json_encode($result);		
	}

	
}	

?>