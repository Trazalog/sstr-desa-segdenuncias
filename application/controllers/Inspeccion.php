<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Inspeccion extends CI_Controller {
	function __construct()
	{
		parent::__construct();
		$this->load->model('Inspecciones');
		$this->load->model('Inspectores');
	}

	public function index($permission)
	{
		$data['list'] = $this->Inspecciones->Listado_Inspecciones();
		$data['inspectores']= $this->Inspectores->Listado_Inspectores();
		$data['permission'] = $permission;
		$this->load->view('inspecciones/list', $data);
	}

	public function Obtener_Inspeccion(){
		$id=$_POST['inspeccionid'];
		$result = $this->Inspecciones->Obtener_Inspecciones($id);
		print_r($result);
		return $result;
	}

	public function Guardar_Inspeccion(){

		$inspeccionfechaasigna=$this->input->post('inspeccionfechaasigna');
		$inspeccionfecharecp=$this->input->post('inspeccionfecharecp');
		$inspectorid=$this->input->post('inspectorid');
		$inspeccionestado=$this->input->post('inspeccionestado');
		$estableid=$this->input->post('estableid');
		$inspeestado=$this->input->post('inspeestado');
		$data = array(
			'inspeccionfechaasigna' => $inspeccionfechaasigna,
			'inspeccionfecharecp' => $inspeccionfecharecp,
			'inspectorid' => $inspectorid,
			'inspeccionestado' => $inspeccionestado,
			'estableid' => $estableid,
			'inspeestado' => $inspeestado,
			'inspeccionelimina' =>"AC"
		);
		$sql = $this->Inspecciones->Guardar_Inspecciones($data);
		print_r($sql);
	}

	public function Modificar_Inspeccion(){
		$id=$this->input->post('inspeccionid');
		$inspeccionfechaasigna=$this->input->post('inspeccionfechaasigna');
		$inspeccionfecharecp=$this->input->post('inspeccionfecharecp');
		$inspectorid=$this->input->post('inspectorid');
		$inspeccionestado=$this->input->post('inspeccionestado');
		$estableid=$this->input->post('estableid');
		$inspeestado=$this->input->post('inspeestado');
		$data = array(
			'inspeccionid' => $id,
			'inspeccionfechaasigna' => $inspeccionfechaasigna,
			'inspeccionfecharecp' => $inspeccionfecharecp,
			'inspectorid' => $inspectorid,
			'inspeccionestado' => $inspeccionestado,
			'estableid' => $estableid,
			'inspeestado' => $inspeestado
		);
		$sql = $this->Inspecciones->Modificar_Inspecciones($data);
		print_r($sql);
	}


	public function Eliminar_Inspeccion(){

		$id=$_POST['inspeccionid'];	
		$result = $this->Inspecciones->Eliminar_Inspecciones($id);
		print_r($result);	
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
}	

?>