<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Inspector extends CI_Controller {
	function __construct()
    {
		parent::__construct();
		$this->load->model('Inspectores');
	}


	public function index($permission)
	{
		$data['list'] = $this->Inspectores->Listado_Inspectores();
		$data['permission'] = $permission;
		$this->load->view('inspectores/list', $data);
	}


	public function Obtener_Inspector(){
	$id=$_POST['inspectorid'];
	$result = $this->Inspectores->Obtener_Inspectores($id);
	print_r($result);
	return $result;

	}


	public function Guardar_Inspector(){

	    $inspectornombre=$this->input->post('inspectornombre');
	    $inspectormail=$this->input->post('inspectormail');
	    $inspectorcel=$this->input->post('inspectorcel');
	    $inspectorsector=$this->input->post('inspectorsector');
	    $data = array(
						    'inspectornombre' => $inspectornombre,
						    'inspectormail' => $inspectormail,
						    'inspectorcel' => $inspectorcel,
						    'inspectorsector' => $inspectorsector
	    );
	    $sql = $this->Inspectores->Guardar_Inspectores($data);
	    print_r($sql);
	   
  	}



	public function Modificar_Inspector(){
  		$id=$this->input->post('inspectorid');
	    $inspectornombre=$this->input->post('inspectornombre');
	    $inspectormail=$this->input->post('inspectormail');
	    $inspectorcel=$this->input->post('inspectorcel');
	    $inspectorsector=$this->input->post('inspectorsector');
	    $data = array(
	    	    		   'inspectorid' => $id,
						    'inspectornombre' => $inspectornombre,
						    'inspectormail' => $inspectormail,
						    'inspectorcel' => $inspectorcel,
						    'inspectorsector' => $inspectorsector
					   );
	    $sql = $this->Inspectores->Modificar_Inspectores($data);
	    print_r($sql);
  	}


	public function Eliminar_Inspector(){
	
		$id=$_POST['inspectorid'];	
		$result = $this->Inspectores->Eliminar_Inspectores($id);
		print_r($result);
		
	}

	
}	

?>