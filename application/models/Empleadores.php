<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Empleadores extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	//Devuelve listado de empleadores
	function empleadores_List(){

		$this->db->select('tbl_empleadores.*');
		$this->db->from('tbl_empleadores');
		$result = $this->db->get();
		if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }

	}
	//Devuelve tipo que liquidaciones
	function getSistLiquidacion(){

		$this->db->select('tbl_sisliqui.*');
		$this->db->from('tbl_sisliqui');
		$result = $this->db->get();	
		
		if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
	}
	//Devuelve listado de actividades
	function getActividad(){

		$this->db->select('tbl_actividad.*');
		$this->db->from('tbl_actividad');
		$result = $this->db->get();				
		
		if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
	}


}