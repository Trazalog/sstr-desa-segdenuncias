<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class liquidaciones extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

function Listado_liquidaciones(){

 $query= $this->db->get('liquidaciones');

 if ($query->num_rows()!=0)
{
 return $query->result_array();	
}

 }
function Obtener_liquidaciones($id){
    $this->db->where('sisliquiid', $id);
    $query=$this->db->get('liquidaciones');
   
    if ($query->num_rows()!=0)
        {   
            return $query->result_array();  
        }
}
function Guardar_liquidaciones($data){

		$query = $this->db->insert("liquidaciones",$data);
                                  return $query;

	}
	function Modificar_liquidaciones($data){

		$query =$this->db->update('liquidaciones', $data, array('sisliquiid' => $data['sisliquiid']));
		print_r($query);
	}
	function Eliminar_liquidaciones($data){
    	
        $this->db->where('sisliquiid', $data);
        $this->db->delete('liquidaciones');
        if ($this->db->affected_rows() > 0) {
			return true;
		}
		else{
			return false;
		}

    }
}	

?>