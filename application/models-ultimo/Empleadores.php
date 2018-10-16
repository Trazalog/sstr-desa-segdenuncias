<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Empleadores extends CI_Model
{
    function __construct(){
        parent::__construct();
    }


    /***   EMPLEADORES   ***/

    //Devuelve listado de empleadores
    function empleadores_List(){
        $this->db->select('tbl_empleadores.*, tbl_sisliqui.descripcion as sisliquidescrip');
        $this->db->join('tbl_sisliqui','tbl_sisliqui.sisliquiid = tbl_empleadores.empleasliquiid');
        $this->db->from('tbl_empleadores');
        $this->db->where('tbl_empleadores.empleaestado', 'AC');

        $result = $this->db->get();
        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }

	// Guarda datos de empleadores
    function setEmpleadores($data){
        //dump_exit($data);
        $empleador = $data['empleador'];
        $empleador['empleaestado'] = 'AC';
        $actividad = $data['actividad'];
        $libro = $data['libro'];
        $estab = $data['establecimiento'];

        /*dump($empleador);
        dump($estab);
        dump($actividad);
        dump($libro);*/
        $idEmpleador = $this->setInfoEmpleador($empleador);  

        if ($idEmpleador) {
            $this->setActividad($actividad,$idEmpleador);
        }
        if ($idEmpleador && ($libro != null)) {
            $this->setLibro($libro,$idEmpleador);
        }
        if($idEmpleador){
            $this->setEstablecimientos($estab,$idEmpleador);
        }

        return true;
    }

	// Guarda la informacion general del empleador
	function setInfoEmpleador($empleador){
		$this->db->insert('tbl_empleadores', $empleador);
		$id = $this->db->insert_id();
		
		if ($id!==0) {
			return $id;
		}else{
			return 0;
		}
	}

    // Devuelve datos por id de empleador
    function getEmpleadorPorIds($data){
        $this->db->select('tbl_empleadores.*');
        $this->db->from('tbl_empleadores');
        $this->db->where('tbl_empleadores.empleaid', $data);
        $query = $this->db->get();

        if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }

    // Actualiza Empleador
    function updateEmpleadorEdit($data, $idEmpleador){
        //dump_exit($data);
        $this->db->where('tbl_empleadores.empleaid', $idEmpleador);
        $response = $this->db->update('tbl_empleadores', $data);
        return $response;
    }

    // Cambia estado empleador a 'AN'
    function deleteEmpleadorPorIds($id){
        $this->db->where('empleaid', $id);
        $query = $this->db->update('tbl_empleadores', array('empleaestado' => 'AN'));
        return $query;
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
    //Devuelve listado de provincias
    function getProvincias(){
        $this->db->select('provincias.*');
        $this->db->from('provincias');
        $result = $this->db->get();    

        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }
    //Devuelve departamentos
    function getLocalidades(){
        $this->db->select('*');
        $this->db->from('localidades');
        $result = $this->db->get();    

        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }
    //Devuelve departamentos por id
    function getLocalidadPorIds($id){
        $this->db->select('localidades.*');
        $this->db->from('localidades');
        $this->db->join('provincias', 'provincias.id = localidades.id_privincia');
        $this->db->where('provincias.id',$id);
        $result = $this->db->get();    

        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }



    /***   ESTABLECIMIENTOS   ***/

    // Guarda establecimientos al agregar empeador
    function setEstablecimientos($estab,$idEmpleador){
        foreach ($estab as $comp) { 
            $dato['establecalle']    = $comp[0];
            $dato['establealtura']   = $comp[1];
            $dato['establepiso']     = $comp[2];
            $dato['establedpto']     = $comp[3];
            $dato['provid']          = $comp[4];
            $dato['dptoid']          = $comp[5];
            $dato['establelatitud']  = $comp[6];
            $dato['establelongitud'] = $comp[7];
            $dato['empleaid']        = $idEmpleador;
            $dato['estableestado']   = 'AC';
            
            $response = $this->db->insert('tbl_establecimiento', $dato);
        }   
        return $response;   
    }

    // Devuelve listado de Establecientos
    function getEmpleadorEstablecimientos($id){
        $this->db->select('tbl_establecimiento.*, provincias.provincia, localidades.localidad');
        $this->db->from('tbl_establecimiento');
        $this->db->join('provincias', 'tbl_establecimiento.provid = provincias.id');
        $this->db->join('localidades', 'localidades.id = tbl_establecimiento.dptoid');
        $this->db->where('tbl_establecimiento.empleaid', $id);
        $this->db->where('tbl_establecimiento.estableestado', 'AC');

        $result = $this->db->get();             
        
        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }

    // Guarda libros entregados al empleador
    function setEstablecimientoEdit($establecimiento){
        //dump_exit($establecimiento);
        $dato['establecalle']    = $establecimiento["establecalle"];
        $dato['establealtura']   = $establecimiento["establealtura"];
        $dato['establepiso']     = $establecimiento["establepiso"];
        $dato['establedpto']     = $establecimiento["establedpto"];
        $dato['provid']          = $establecimiento["provid"];
        $dato['dptoid']          = $establecimiento["dptoid"];
        $dato['establelatitud']  = $establecimiento["establelatitud"];
        $dato['establelongitud'] = $establecimiento["establelongitud"];
        $dato['empleaid']        = $establecimiento["empleaid"];
        $dato['estableestado']   = 'AC';
        
        $response = $this->db->insert('tbl_establecimiento', $dato);
        
        return $response;
    }

    // Actualiza datos de edicion de Establecimientos
    function updateEstablecimientoPorIds($estab,$id){
        $this->db->where('tbl_establecimiento.estableid', $id);
        $response = $this->db->update('tbl_establecimiento', $estab);
        return $response;
    }

    // Elimina Establecimiento
    function deleteEstablecimiento($id){
        $this->db->where('estableid', $id);
        $query = $this->db->update('tbl_establecimiento', array('estableestado' => 'AN'));
        
        return $query;
    }



    /***   LIBROS   ***/

    // Guarda libros entregados al agregar empleador
    function setLibro($libro,$idEmpleador){
        foreach ($libro as $comp) { 
            $dato['librofechaentrega'] = $comp[1];
            $dato['librotomo']         = $comp[2];
            $dato['empleaid']          = $idEmpleador;
            $dato['libroestado']       = 'AC';
            
            $response = $this->db->insert('tbl_libro', $dato);
        }   
        return $response;
    }

    // Devuelve libros por id de empleador
    function getEmpleadorLibros($id){
        $this->db->select('tbl_libro.*');
        $this->db->from('tbl_libro');
        $this->db->where('tbl_libro.empleaid', $id);
        $this->db->where('tbl_libro.libroestado', 'AC');
        $query = $this->db->get();

        if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }

    // Guarda libros entregados al empleador
    function setLibroEdit($libro){
        $dato['librofechaentrega'] = $libro['librofechaentrega'];
        $dato['librotomo']         = $libro['librotomo'];
        $dato['empleaid']          = $libro['empleaid'];
        $dato['libroestado']       = 'AC';
        
        $response = $this->db->insert('tbl_libro', $dato);

        return $response;
    }

    // Actualiza datos de edicion de Libros
    function updateLibroPorIds($libro,$id){ 
       //dump_exit($libro);
       $this->db->where('tbl_libro.libroid', $id);
       $response = $this->db->update('tbl_libro', $libro);
       return $response;
    }

    // Cambia a Estado 'AN' Libros
    function deleteLibros($id){
        $this->db->where('libroid', $id);
        $query = $this->db->update('tbl_libro', array('libroestado' => 'AN'));
        
        return $query;
    }



    /***   ACTIVIDAD   ***/

    // Crea la actividad del empleador (al crear empleador)
    function setActividad($actividad,$idEmpleador){
        foreach ($actividad as $comp) { 
            
            $dato['actividadid'] = $comp[0];
            $dato['detaactivrubro'] = $comp[1];
            $dato['detaactivconvenio'] = $comp[2];
            $dato['empleaid'] = $idEmpleador;
            
            $response = $this->db->insert('tbl_detaactiv', $dato);
        }   
        
        return $response;
    }

    // Devuelve actividades por id de empleador
    function getEmpleadorActividad($id){
        $this->db->select('tbl_detaactiv.detaactivrubro,
            tbl_detaactiv.detaactivconvenio,
            tbl_actividad.descripcion,
            tbl_actividad.descripciongeneral,
            tbl_detaactiv.detaactivid,
            tbl_actividad.actividadid,
            tbl_empleadores.empleaid
            ');
        $this->db->from('tbl_detaactiv');
        $this->db->join('tbl_actividad', 'tbl_detaactiv.actividadid = tbl_actividad.actividadid');
        $this->db->join('tbl_empleadores', 'tbl_detaactiv.empleaid = tbl_empleadores.empleaid');
        $this->db->where('tbl_empleadores.empleaid', $id);
        $this->db->where('tbl_detaactiv.detaactivestado', 'AC');
        $query = $this->db->get();
        
        if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }

    // Devuelve listado de actividades
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

    // Crea actividad
    function setActividadEdit($actividad){
        $dato['empleaid']          = $actividad['empleaid'];
        $dato['actividadid']       = $actividad['actividadid'];
        $dato['detaactivrubro']    = $actividad['detaactivrubro'];
        $dato['detaactivconvenio'] = $actividad['detaactivconvenio'];
        $dato['detaactivestado']   = 'AC';
        
        $response = $this->db->insert('tbl_detaactiv', $dato);

        return $response;
    }

    //
    function updateActividadPorIds($detaActiv,$idDetaActiv){
        $this->db->where('tbl_detaactiv.detaactivid', $idDetaActiv);
        $response = $this->db->update('tbl_detaactiv', $detaActiv);
        return $response;
    }

    // Cambia a estado 'AN' actividad
    function deleteActividad($id){
        //dump_exit($id);
        $this->db->where('detaactivid', $id);
        $query = $this->db->update('tbl_detaactiv', array('detaactivestado' => 'AN'));
        
        return $query;
    }




    /***   NOTAS   ***/

    // Guarda (crea) nota desde listado empleadores //setNota
    function guardarNota($data){
        return $this->db->insert('tbl_notas', $data);
    }

    // Devuelve listado de notas por id de empleador
    function getEmpleadorNotas($id){
        $this->db->select('tbl_notas.*');
        $this->db->from('tbl_notas');
        $this->db->where('tbl_notas.empleaid', $id);
        $this->db->where('tbl_notas.notaestado', 'AC');
        $result = $this->db->get();             
        
        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }

    // Cambia a estado 'AN' nota
    function deleteNota($id){
        $this->db->where('notid', $id);
        $query = $this->db->update('tbl_notas', array('notaestado' => 'AN'));
        
        return $query;
    }

    //Edita notas
    function updateNota($datos,$idNota){
        $this->db->where('notid', $idNota);
        $query = $this->db->update('tbl_notas', $datos);
        
        return $query;
    }
/*
    // Actualiza datos de edicion de Informacion de Empleador
    function updateEmpleadores($empleador,$id){
        $this->db->where('tbl_empleadores.empleaid', $id);
        $response = $this->db->update('tbl_empleadores', $empleador)
        return $response;
    }

    // Actualiza datos de edicion de Actividad (detaactividad)
    function updateActividadPorIds($actividad,$id){
       $this->db->where('tbl_detaactiv.empleaid', $id);
       $response = $this->db->update('tbl_detaactiv', $actividad)
       return $response;
    }
*/

}
