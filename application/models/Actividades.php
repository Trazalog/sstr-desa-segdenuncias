<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Actividades extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	// function Listado_tbl_actividades(){

	//  $query= $this->db->get('tbl_actividad');

	//  if ($query->num_rows()!=0)
	// {
	//  return $query->result_array();	
	// }

	// }


 	function Listado_tbl_actividades()
   	{
    $this->db->where('actividadelimina', 'AC');
	$query=$this->db->get('tbl_actividad');

		if ($query->num_rows()!=0)
				{
			 return $query->result_array();	
			}
		}


	function Obtener_tbl_actividades($id){
    $this->db->where('actividadid', $id);
    $query=$this->db->get('tbl_actividad');
   
    if ($query->num_rows()!=0)
        {   
            return $query->result_array();  
        }
	}

	function Guardar_tbl_actividades($data){

		$query = $this->db->insert("tbl_actividad",$data);
            return $query;

	}

	function Modificar_tbl_actividades($data){

		$query =$this->db->update('tbl_actividad', $data, array('actividadid' => $data['actividadid']));
		print_r($query);
	}


	// function Eliminar_tbl_actividades($data){
    	
	//        $this->db->where('actividadid', $data);
	//        $this->db->delete('tbl_actividad');
	//        if ($this->db->affected_rows() > 0) {
	// 		return true;
	// 	}
	// 	else{
	// 		return false;
	// 	}

 	//    }


    function Eliminar_tbl_actividades($id){
	
		$this->db->set('actividadelimina', 'AN');
		$this->db->where('actividadid', $id);
		$query=$this->db->update('tbl_actividad');
		print_r($query);

	}
}	

?>