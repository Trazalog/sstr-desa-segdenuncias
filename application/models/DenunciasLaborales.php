<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class DenunciasLaborales extends CI_Model
{
	function __construct(){
			parent::__construct();
	}

	// lista en pantalla denuncia nueva de oficio
	function DenunciasLaboralesList(){
		
		$this->db->select('tbl_denunciaslaborales.*,
		trg_inspecciondenuncia.inspeccionid,
		tbl_establecimiento.establecalle,
		tbl_establecimiento.establealtura,
		tbl_empleadores.emplearazsoc');
		$this->db->from('tbl_denunciaslaborales');
		$this->db->join('trg_inspecciondenuncia', 'tbl_denunciaslaborales.denunciaid = trg_inspecciondenuncia.denunciaid', 'left');	
		$this->db->join('tbl_establecimiento', 'tbl_denunciaslaborales.estableid = tbl_establecimiento.estableid');
		$this->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');
		$this->db->group_by('denunciaid');
		
		$result = $this->db->get();
		if($result->num_rows()>0){
				return $result->result_array();
		}
		else{
				return array();
		}
	}

	// trae empleadores activos
	function getDenominacionSocial(){

		$this->db->select('tbl_empleadores.empleaid,tbl_empleadores.emplearazsoc');
		$this->db->from('tbl_empleadores');
		$this->db->where('tbl_empleadores.empleaestado','AC');
		$query = $this->db->get();				
		$i=0;
		foreach ($query->result() as $row){
			$empleadores[$i]['label'] = $row->emplearazsoc;
			$empleadores[$i]['id'] = $row->empleaid;
			$i++;
		}

		return $empleadores;
	}
	// trae establecimientos por estado AC
	function getEstablecimientos($id){

		$this->db->select('tbl_establecimiento.estableid,concat(establecalle," " 
			,establealtura,"-",localidad) as establecalle');
		$this->db->from('tbl_establecimiento');
		$this->db->join('localidades',"id=dptoid");
		$this->db->where('empleaid',$id);
		$this->db->where('estableestado','AC');
		$query=$this->db->get();
		if ($query->num_rows()!=0){
			return $query->result_array();
		}else{
			return array();
		}	    

	}	

	// guarda denuncia nueva de oficio
	function setDenunciaOficio($data){      
		$response = $this->db->insert('tbl_denunciaslaborales', $data);
		return $response;
	}

	//borra denuncia por id
	function deleteDenuncia($id)
	{
		$this->db->where('denunciaid', $id);
		$response = $this->db->delete('tbl_denunciaslaborales');
		return $response;
	}
	
	//borra denuncia por id
  	function getDenPorId($id)
  	{
		$this->db->select('tbl_denunciaslaborales.denunciaid,
			tbl_denunciaslaborales.denunciasfecha,      
			tbl_denunciaslaborales.denunciafechaverif,      
			tbl_denunciaslaborales.denuncianroacta,
			tbl_denunciaslaborales.denunciamotivos,
			tbl_denunciaslaborales.estableid,
			tbl_denunciaslaborales.denunciaestado,
			tbl_denunciaslaborales.denunciadenunciante,
			tbl_denunciaslaborales.denunciatipo,
			tbl_establecimiento.establecalle,
			tbl_establecimiento.establealtura,												
			tbl_empleadores.emplearazsoc,
			tbl_empleadores.empleaid');
		$this->db->from('tbl_denunciaslaborales');
		$this->db->join('tbl_establecimiento', 'tbl_denunciaslaborales.estableid = tbl_establecimiento.estableid');
		$this->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');
		$this->db->where('tbl_denunciaslaborales.denunciaid', $id);
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