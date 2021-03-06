<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Actividades extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	

 	function Listado_tbl_actividades()
   	{
    $this->db->where('actividadestado', 'AC');
	$query=$this->db->get('tbl_actividad');

		if ($query->num_rows()!=0)
				{
			 return $query->result_array();	
			}
			else{
				return array();
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
		return $query;
	}


    function Eliminar_tbl_actividades($id){
	
		$this->db->set('actividadestado', 'AN');
		$this->db->where('actividadid', $id);
		$query=$this->db->update('tbl_actividad');
		return $query;

	}
}	

?>