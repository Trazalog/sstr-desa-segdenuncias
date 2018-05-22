<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Actividad extends CI_Controller {
	function __construct()
        {
		parent::__construct();
		$this->load->model('Actividades');
	}

	public function index($permission)
	{
		$data['list'] = $this->Actividades->Listado_tbl_actividades();
		$data['permission'] = $permission;
		$this->load->view('actividades/list', $data);
	}

	public function Obtener_tbl_actividade(){
		$id=$_POST['actividadid'];
		$result = $this->Actividades->Obtener_tbl_actividades($id);
		print_r($result);
		return $result;

	}

	public function Guardar_tbl_actividade(){
	    $descripcion=$this->input->post('descripcion');
	    $descripciongeneral=$this->input->post('descripciongeneral');
	    $data = array(
				'descripcion' => $descripcion,
				'descripciongeneral' => $descripciongeneral
				);
	    $sql = $this->Actividades->Guardar_tbl_actividades($data);
	    print_r($sql);
	   
  	}

	public function Modificar_tbl_actividade(){
  	$id=$this->input->post('actividadid');
	$descripcion=$this->input->post('descripcion');
	$descripciongeneral=$this->input->post('descripciongeneral');
	$data = array(
	    	    'actividadid' => $id,
				'descripcion' => $descripcion,
				'descripciongeneral' => $descripciongeneral
				);
	    $sql = $this->Actividades->Modificar_tbl_actividades($data);
	    print_r($sql);

  	}


	public function Eliminar_tbl_actividade(){
	$id=$_POST['actividadid'];	
	$result = $this->Actividades->Eliminar_tbl_actividades($id);
	print_r($result);	
	}


}	

?>