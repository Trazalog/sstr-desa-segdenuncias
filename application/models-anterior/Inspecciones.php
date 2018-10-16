<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Inspecciones extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	function Listado_Inspecciones(){

		$this->db->select('*,concat(C.establecalle," - ",C.establealtura," - ",E.localidad) as direccionCompleta');
		$this->db->from('tbl_inspecciones as A');
		$this->db->join('tbl_inspectores as B','A.inspectorid=B.inspectorid');
		$this->db->join('tbl_establecimiento as C','A.estableid=C.estableid');
		$this->db->join('tbl_empleadores D','C.empleaid=D.empleaid');
		$this->db->join('localidades as E','C.dptoid=E.id');
		$this->db->where('A.inspeestado= "C" ');
		
		$query=$this->db->get();


		if ($query->num_rows()!=0)    
		{
			return $query->result_array();	
		}
		else{
				return array();
			}

	}


	function getEstablecimientos($id){

		$this->db->select('tbl_establecimiento.estableid,concat(establecalle," " 
			,establealtura,"-",localidad) as establecalle');
		$this->db->from('jobs24_segdenuncias.tbl_establecimiento');
		$this->db->join('localidades',"id=dptoid");
		$this->db->where('empleaid',$id);
		$query=$this->db->get();
		if ($query->num_rows()!=0){
			return $query->result_array();
		}	    

	}

	function getDenominacionSocial(){

		$this->db->select('tbl_empleadores.empleaid,tbl_empleadores.emplearazsoc');
		$this->db->from('tbl_empleadores');
		$query = $this->db->get();				
		$i=0;
		foreach ($query->result() as $row){

			$empleadores[$i]['label'] = $row->emplearazsoc;
			$empleadores[$i]['value'] = $row->empleaid;
			$i++;
		}

		return $empleadores;
		

	}

	function Obtener_Inspecciones($id){
		$this->db->where('inspeccionid', $id);
		$query=$this->db->get('tbl_inspecciones');
		
		if ($query->num_rows()!=0)
		{   
			return $query->result_array();  
		}
	}

	function Guardar_Inspecciones($data){

		$query = $this->db->insert("tbl_inspecciones",$data);
		return $query;
	}

	function Modificar_Inspecciones($data){

		$query =$this->db->update('tbl_inspecciones', $data, array('inspeccionid' => $data['inspeccionid']));
		return $query;
	}

	function Eliminar_Inspecciones($id){
	
		$this->db->set('inspeestado', 'AN');
		$this->db->where('inspeccionid', $id);
		$query=$this->db->update('tbl_inspecciones');
		return $query;

	}
	
}	

?>