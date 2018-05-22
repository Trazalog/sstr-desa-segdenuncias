<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Inspectores extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

		// function Listado_Inspectores(){
		// $query= $this->db->get('tbl_inspectores');

		//   if ($query->num_rows()!=0)
		// 	{
		// 	 return $query->result_array();	
		// 	}
		//  }


 		function Listado_Inspectores()
   		{
        $this->db->where('inspectorelimina', 'AC');
		$query=$this->db->get('tbl_inspectores');

		if ($query->num_rows()!=0)
				{
			 return $query->result_array();	
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
		print_r($query);
		}


		// function Eliminar_Inspectores($data){
	 	//    $this->db->where('inspectorid', $data);
	 	//    $this->db->delete('tbl_inspectores');
	 	//        if ($this->db->affected_rows() > 0) {
		// 		return true;
		// 	}
		// 	else{
		// 		return false;
		// 	}
	 	//    }

	    function Eliminar_Inspectores($id){
	
		$this->db->set('inspectorelimina', 'AN');
		$this->db->where('inspectorid', $id);
		$query=$this->db->update('tbl_inspectores');
		print_r($query);

	}



}	

?>