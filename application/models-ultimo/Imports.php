<?php
defined("BASEPATH") OR exit("El acceso directo al script no está permitido!!!");

class Imports extends CI_Model{
  
  public function __construct(){

    parent::__construct();
  } 

  //funciona bien
  function matchCuit($CUIT){        

    $this->db->select('tbl_empleadores.empleaid');
    $this->db->from('tbl_empleadores');
    $this->db->where('tbl_empleadores.empleacui', $CUIT);     
    $query = $this->db->get();
    $row = $query->row();
    
    if (isset($row)){        
      
      return $row->empleaid;        
    }else{
      return false;
    }
  }
  
  // Devuelve id de Establecimiento si coinc Id Empleador y Calle de Establecimiento //funciona bien
  function matchEstablecimiento($idEmpleador, $CALLE){
      
    $this->db->select('tbl_establecimiento.estableid');
    $this->db->from('tbl_establecimiento');    
    $this->db->join('tbl_empleadores','tbl_establecimiento.empleaid = tbl_empleadores.empleaid');    
    $this->db->where('tbl_empleadores.empleaid', $idEmpleador);
    $this->db->where('tbl_establecimiento.establecalle', $CALLE); 
    $query = $this->db->get();
    $row = $query->row();    
    
    if (isset($row)){ 
      return $row->estableid;        
    }else{
      return false;
    }
  }

  //devuelve el id de denuncia segun motivo, fecha y el id de establecimiemto
  function matchRegistro($FECHA_DENUNCIA,$MOTIVO,$idEstab){
    
    $date = $FECHA_DENUNCIA;
    $date = explode('/', $date);                    
    $date = $date[2].'-'.$date[1].'-'.$date[0];   
    
    $this->db->select('tbl_denuncias.denunciaid');
    $this->db->from('tbl_denuncias');
    $this->db->join('tbl_establecimiento', 'tbl_establecimiento.estableid = tbl_denuncias.estableid');
    $this->db->where('tbl_denuncias.denunciasfecha', $date);    
    $this->db->where('tbl_denuncias.denunciamotivos', $MOTIVO);
    $this->db->where('tbl_denuncias.estableid', $idEstab);
    $query = $this->db->get();
    $row = $query->row(); 
    
    if (isset($row)){  
      return $row->denunciaid;        
    }else{
      return false;
    }
  }

  function setDenuncias($denListas){
    
      $response = $this->db->insert_batch("tbl_denuncias", $denListas);        
      return $response;      
  }    












  

  // Devuelve id de empleador si coinc Cuit y Calle de Establecimiento
  function matchEmpleador($CUIT, $CALLE){
        
    $this->db->select('tbl_empleadores.empleaid');
    $this->db->from('tbl_empleadores');
    $this->db->join('tbl_establecimiento', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');
    $this->db->where('tbl_empleadores.empleacui', $CUIT);
    $this->db->where('tbl_establecimiento.establecalle', $CALLE);
    $query = $this->db->get();
    $row = $query->row();    

    if (isset($row)){        
      return $row->empleaid;        
    }else{
      return false;
    }
  }

  //probar
  function matchCalle($CALLE,$idEmpleador){
    
    $this->db->select('tbl_establecimiento.estableid');
    $this->db->from('tbl_establecimiento');
    $this->db->where('tbl_establecimiento.empleaid', $idEmpleador);
    $this->db->where('tbl_establecimiento.establecalle', $CALLE);
    $query = $this->db->get();

    if($query->num_rows() > 0){
      dump_exit($query->result_array());
      return $query->result_array();
    }else{
      return false;
    }

  }
  function matchFechaMotivo($FECHA_DENUNCIA,$MOTIVO){

  }
  function procesarDenuncia($sql){

  }
}