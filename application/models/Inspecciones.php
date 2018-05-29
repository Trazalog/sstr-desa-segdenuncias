<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Inspecciones extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	function Listado_Inspecciones(){

		$query= $this->db->query('SELECT E.*,F.inspectorid,F.inspectornombre FROM (SELECT D.*,C.empleainscrip FROM tbl_empleadores as C JOIN (SELECT A.*,B.empleaid,concat(B.establecalle," " ,B.establealtura,"--",B.localidad) as establecalle FROM jobs24_segdenuncias.tbl_inspecciones as A JOIN (SELECT * FROM tbl_establecimiento JOIN localidades on id=dptoid) as B on A.estableid=B.estableid WHERE A.inspeccionelimina="AC") as D ON C.empleaid=D.empleaid) as E JOIN tbl_inspectores as F on E.inspectorid=F.inspectorid;');

		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}

	}

	function getEstablecimientos($id){

		$this->db->SELECT('tbl_establecimiento.estableid,concat(establecalle," " ,establealtura,"-",localidad) as establecalle');
		$this->db->FROM('jobs24_segdenuncias.tbl_establecimiento');
		$this->db->JOIN('localidades',"id=dptoid");
		$this->db->WHERE('empleaid',$id);
		$query=$this->db->get();
		if ($query->num_rows()!=0){
			return $query->result_array();
		}	    

	}

	function getDenominacionSocial(){

		$this->db->select('tbl_empleadores.empleaid,tbl_empleadores.empleainscrip');
		$this->db->from('tbl_empleadores');
		$query = $this->db->get();				
		$i=0;
		foreach ($query->result() as $row){

			$empleadores[$i]['label'] = $row->empleainscrip;
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
		print_r($query);
	}

	function Eliminar_Inspecciones($id){
	
		$this->db->set('inspeccionelimina', 'AN');
		$this->db->where('inspeccionid', $id);
		$query=$this->db->update('tbl_inspecciones');
		print_r($query);

	}
	
}	

?>