<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Empleador extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Empleadores');
	}

	public function index($permission){
		
		// $data['list'] = $this->Empleadores->empleadores_List();
		// $data['permission'] = $permission;
		// $this->load->view('empleadores/list', $data);

		$data['liquidacion'] = $this->Empleadores->getSistLiquidacion();
		$data['actividad'] = $this->Empleadores->getActividad();
		$data['permission'] = $permission;
		$this->load->view('empleadores/view_', $data);
	}

	public function getDatosEmpleador(){

		$data['liquidacion'] = $this->Empleadores->getSistLiquidacion();
		$data['actividad'] = $this->Empleadores->getActividad();
		$data['permission'] = $permission;
		$this->load->view('empleadores/view_', $data);

	}
}