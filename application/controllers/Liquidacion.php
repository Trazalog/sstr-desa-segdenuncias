<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Liquidacion extends CI_Controller {
	function __construct()
    {
		parent::__construct();
		$this->load->model('Liquidaciones');
	}


	public function index($permission)
	{
		$data['list'] = $this->Liquidaciones->Listado_Liquidaciones();
		$data['permission'] = $permission;
		$this->load->view('liquidaciones/list', $data);
	}


	public function Obtener_liquidacione(){
		$id=$_POST['sisliquiid'];
		$result = $this->Liquidaciones->Obtener_Liquidaciones($id);
		echo json_encode($result);

	}


	public function Guardar_liquidacione(){

	    $descripcion=$this->input->post('descripcion');
	    $data = array('descripcion' => $descripcion,
		'sisliquiestado' =>"AC");
	    $sql = $this->Liquidaciones->Guardar_Liquidaciones($data);
	   	echo json_encode($sql);
	   
  	}

  	
	public function Modificar_liquidacione(){

  		$id=$this->input->post('sisliquiid');
	    $descripcion=$this->input->post('descripcion');
	    $data = array(
	    	    		   'sisliquiid' => $id,
						    'descripcion' => $descripcion
					   );
	    $sql = $this->Liquidaciones->Modificar_Liquidaciones($data);
	  	echo json_encode($sql);

  	}

	public function Eliminar_liquidacione(){
	
		$id=$_POST['sisliquiid'];	
		$result = $this->Liquidaciones->Eliminar_Liquidaciones($id);
		echo json_encode($result);
		
	}
}	

?>