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
  
  // Devuelve id de Establecimiento si coinc Id Empleador, Calle y Altura de Establecimiento //funciona bien
  function matchEstablecimiento($idEmpleador, $CALLE, $ALTURA){
      
    $this->db->select('tbl_establecimiento.estableid');
    $this->db->from('tbl_establecimiento');    
    $this->db->join('tbl_empleadores','tbl_establecimiento.empleaid = tbl_empleadores.empleaid');    
    $this->db->where('tbl_empleadores.empleaid', $idEmpleador);
    $this->db->where('tbl_establecimiento.establecalle', $CALLE);
    $this->db->where('tbl_establecimiento.establealtura', $ALTURA); 
    $query = $this->db->get();
    $row = $query->row();    
    
    if (isset($row)){ 
      return $row->estableid;        
    }else{
      return 0;
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

  // borrado inical de los registros cargados por el usuario logueado
  function deleteDenuncias(){
    //// USUARIO LOGUEADO
    $userdata = $this->session->userdata('user_data');
    $usrId = $userdata[0]['usrId'];    
    $this->db->where('usrId', $usrId);
    $response = $this->db->delete('tbl_denuncias_temp');
    return $response;
  }

  // guarda denuncias en tabla temporal de cuit coincidentes con cuits inscriptos
  function setDenunciasTemp($denListas){
    
    $response = $this->db->insert_batch("tbl_denuncias_temp", $denListas);        
    return $response;      
  }    

  // guarda las denuncias definitivas
  function setDenuncias($denuncias){

    $response = $this->db->insert_batch("tbl_denuncias", $denuncias);        
    return $response;   
  }

  // devuelve denuncias cargadas en tabla temporal por id de usr logueado
  function getDenTemporales(){
    //// USUARIO LOGUEADO
    $userdata = $this->session->userdata('user_data');
    $usrId = $userdata[0]['usrId'];
    // $this->db->select('tbl_denuncias_temp.denunciaid_temp,
      //                   tbl_denuncias_temp.denunciasfecha,
      //                   tbl_denuncias_temp.denunciariesgo,
      //                   tbl_denuncias_temp.denunciaprograma,
      //                   tbl_denuncias_temp.denunciafechaverif,
      //                   tbl_denuncias_temp.denunciainclucion,
      //                   tbl_denuncias_temp.denuncianroobra,
      //                   tbl_denuncias_temp.denuncianroacta,
      //                   tbl_denuncias_temp.denunciamotivos,
      //                   tbl_denuncias_temp.estableid,
      //                   tbl_denuncias_temp.denunciaestado,
      //                   tbl_denuncias_temp.usrId,
      //                   tbl_empleadores.empleacui,
      //                   tbl_empleadores.empleaid,
      //                   tbl_establecimiento.estableid,
      //                   tbl_establecimiento.establecalle,
      //                   tbl_establecimiento.establealtura');
      // $this->db->from('tbl_denuncias_temp');
      // $this->db->join('tbl_establecimiento', 'tbl_denuncias_temp.estableid = tbl_establecimiento.estableid');
      // $this->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');
      // $this->db->where('tbl_denuncias_temp.usrId', $usrId);

    $this->db->select('tbl_denuncias_temp.*,                                          
                      tbl_establecimiento.estableid,
                      tbl_establecimiento.establecalle,
                      tbl_establecimiento.establealtura');
    $this->db->from('tbl_denuncias_temp');
    $this->db->join('tbl_establecimiento', 'tbl_denuncias_temp.estableid = tbl_establecimiento.estableid');    
    $this->db->where('tbl_denuncias_temp.usrId', $usrId);
    $query = $this->db->get();
		if ($query->num_rows()!=0){   
			return $query->result_array();  
		}
  }

  function getEstablecimientos($cuit){
    
    // if($idEstab != 0){
      //   $sql = "SELECT
      //     tbl_establecimiento.estableid,
      //     tbl_establecimiento.establecalle,
      //     tbl_establecimiento.establealtura,
      //     tbl_establecimiento.empleaid,
      //     tbl_establecimiento.estableestado
      //     FROM
      //     tbl_establecimiento
      //     INNER JOIN tbl_empleadores ON tbl_establecimiento.empleaid = tbl_empleadores.empleaid
      //     WHERE
      //     tbl_establecimiento.empleaid = (SELECT
      //                                     tbl_empleadores.empleaid
      //                                     FROM
      //                                     tbl_establecimiento
      //                                     INNER JOIN tbl_empleadores ON tbl_establecimiento.empleaid = tbl_empleadores.empleaid
      //                                     WHERE
      //                                     tbl_establecimiento.estableid = $idEstab)";
      //     $query = $this->db->query($sql);
      //     if ($query->num_rows()!=0){   
      //       return $query->result_array();  
      //     }else{
      //       return array();
      //     }
      // }else{
      //   return array();
      // }

    $this->db->select('tbl_establecimiento.estableid,
                        tbl_establecimiento.establecalle,
                        tbl_establecimiento.establealtura');
    $this->db->from('tbl_establecimiento');
    $this->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');    
    $this->db->where('tbl_empleadores.empleacui', $cuit);
    $query = $this->db->get();
		if ($query->num_rows()!=0){   
			return $query->result_array();  
		}

    

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