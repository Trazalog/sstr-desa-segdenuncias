<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Inspectores extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

 		function Listado_Inspectores()
   		{
        $this->db->where('inspectorestado', 'AC');
		$query=$this->db->get('tbl_inspectores');

		if ($query->num_rows()!=0)
			{
			 return $query->result_array();	
			}
			else{
				return array();
			}
		}


		function Obtener_Inspectores($id){
		$this->db->where('inspectorid', $id);
		$query=$this->db->get('tbl_inspectores');
		   
		    if ($query->num_rows()!=0)
		        {   
		            return $query->result_array();  
		        }
		}

		function Guardar_Inspectores($data){
		$query = $this->db->insert("tbl_inspectores",$data);
		return $query;
		}


		function Modificar_Inspectores($data){
		$query =$this->db->update('tbl_inspectores', $data, array('inspectorid' => $data['inspectorid']));
		return $query;
		}


	    function Eliminar_Inspectores($id){
	
		$this->db->set('inspectorestado', 'AN');
		$this->db->where('inspectorid', $id);
		$query=$this->db->update('tbl_inspectores');
		return $query;

	}



}	

?>