<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DenunciaLaboral extends CI_Controller {
  
  function __construct(){
		parent::__construct();
		$this->load->model('DenunciasLaborales');
	}
  // lista en pantalla las denuncias de oficio
	public function index($permission){
    $data['permission'] = $permission;
    $data['list'] = $this->DenunciasLaborales->DenunciasLaboralesList();    
    //dump($data['list'], 'listado');
    $this->load->view('DenunciasLaborales/list', $data);
  }
  // trae empleadores activos
  public function getDenominacionSocial(){

		$result= $this->DenunciasLaborales->getDenominacionSocial();
		echo json_encode($result);
	}
  // trae establecimientos por estado AC
  public function getEstablecimiento(){
		$id=$_POST['empleaid'];
		$result=$this->DenunciasLaborales->getEstablecimientos($id);
		echo json_encode($result);
	}

  // guarda denuncia de oficio nueva
  public function setDenunciaOficio(){
    $result = $this->DenunciasLaborales->setDenunciaOficio($this->input->post());
  	echo json_encode($result);  
  }
  
  //borra denuncia por id
  public function deleteDenuncia(){
    $result = $this->DenunciasLaborales->deleteDenuncia($this->input->post('id'));
  	echo json_encode($result);
  }
  // trae denncia por id
  public function getDenPorId(){
    $result = $this->DenunciasLaborales->getDenPorId($this->input->post('id'));
    //var_dump($result);
  	echo json_encode($result);
  }
  // actualiza denuncia editada
  public function updateDenuncia(){
    $result = $this->DenunciasLaborales->updateDenuncia($this->input->post());
  	echo json_encode($result);
  }
  
}