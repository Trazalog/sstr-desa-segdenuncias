<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Denuncias extends CI_Model
{
	function __construct(){
			parent::__construct();
	}
	// lista en pantalla denuncia nueva de oficio
	function denunciasList(){
		
		$this->db->select('tbl_denuncias.denunciaid,
											tbl_denuncias.denunciasfecha,      
											tbl_denuncias.denunciafechaverif,      
											tbl_denuncias.denuncianroacta,
											tbl_denuncias.denunciamotivos,
											tbl_denuncias.estableid,
											tbl_denuncias.denunciaestado,
											tbl_denuncias.denunciatipo,
											tbl_establecimiento.establecalle,
											tbl_establecimiento.establealtura,
											provincias.provincia,
											localidades.localidad,
											tbl_empleadores.emplearazsoc');
		$this->db->from('tbl_denuncias');
		$this->db->join('tbl_establecimiento', 'tbl_denuncias.estableid = tbl_establecimiento.estableid');
		$this->db->join('localidades', 'localidades.id = tbl_establecimiento.dptoid');
		$this->db->join('provincias', 'provincias.id = tbl_establecimiento.provid');
		$this->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');
		$result = $this->db->get();
		if($result->num_rows()>0){
				return $result->result_array();
		}
		else{
				return false;
		}
	}
	// guarda denuncia nueva de oficio
	function setDenunciaOficio($data){      
		$response = $this->db->insert('tbl_denuncias', $data);
		return $response;
	}
  //borra denuncia por id
  function deleteDenuncia($id){
		//var_dump($id);
    $this->db->where('denunciaid', $id);
		$response = $this->db->delete('tbl_denuncias');
		return $response;
	}
	//borra denuncia por id
  function getDenPorId($id){
		
		$this->db->select('tbl_denuncias.denunciaid,
												tbl_denuncias.denunciasfecha,      
												tbl_denuncias.denunciafechaverif,      
												tbl_denuncias.denuncianroacta,
												tbl_denuncias.denunciamotivos,
												tbl_denuncias.estableid,
												tbl_denuncias.denunciaestado,
												tbl_denuncias.denunciatipo,
												tbl_establecimiento.establecalle,
												tbl_establecimiento.establealtura,												
												tbl_empleadores.emplearazsoc,
												tbl_empleadores.empleaid');
		$this->db->from('tbl_denuncias');
		$this->db->join('tbl_establecimiento', 'tbl_denuncias.estableid = tbl_establecimiento.estableid');
		$this->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');
    $this->db->where('tbl_denuncias.denunciaid', $id);
		$result = $this->db->get();
		if($result->num_rows()>0){
				return $result->result_array();
		}
		else{
				return false;
		}
	}
	
	function updateDenuncia($data){
		var_dump($data["denuncias"][0]["value"]);
		foreach ($data["denuncias"] as $key => $value) {
			echo $key;
			echo $value;
			
		}

	}
}    