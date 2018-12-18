<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Denuncia extends CI_Controller {
  
  function __construct(){
		parent::__construct();
		$this->load->model('Denuncias');
	}
  // lista en pantalla las denuncias de oficio
	public function index($permission){
    $data['permission'] = $permission;
    $data['list'] = $this->Denuncias->denunciasList();    
    $this->load->view('denuncias/list', $data);
  }
  // trae empleadores activos
  public function getDenominacionSocial(){

		$result= $this->Denuncias->getDenominacionSocial();
		echo json_encode($result);
	}
  // trae establecimientos por estado AC
  public function getEstablecimiento(){
		$id=$_POST['empleaid'];
		$result=$this->Denuncias->getEstablecimientos($id);
		echo json_encode($result);
	}
  // guarda denuncia de oficio nueva
  public function setDenunciaOficio(){
    $result = $this->Denuncias->setDenunciaOficio($this->input->post());
  	echo json_encode($result);  
  }
  //borra denuncia por id
  public function deleteDenuncia(){
    $result = $this->Denuncias->deleteDenuncia($this->input->post('id'));
  	echo json_encode($result);
  }
  // trae denncia por id
  public function getDenPorId(){
    $result = $this->Denuncias->getDenPorId($this->input->post('id'));
    //var_dump($result);
  	echo json_encode($result);
  }
  // actualiza denuncia editada
  public function updateDenuncia(){
    $result = $this->Denuncias->updateDenuncia($this->input->post());
  	echo json_encode($result);
  }
  
}