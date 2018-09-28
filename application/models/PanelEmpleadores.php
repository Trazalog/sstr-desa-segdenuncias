<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * panelEmpleadores Class
 *
 * Clase para el manejo del panel de Empleadores
 * que extiende de la clase CI_Model.
 *
 * @author      Pablo Andrés Rojo
 */
class panelEmpleadores extends CI_Model {
    
    /**
     * Clase constructora
     * Método constructor de la clase panelEmpleadores.
     *
     * @return  void
     */
    function __construct()
    {
        parent::__construct();
    }

    /**
     * Devuelve listado de id, cuit y razón social de todos los Empleadores.
     * Para funcionar con el campo de búsqueda y el plugin Twitter Typeahead.js
     *
     * @uses    panelEmpleadores::get_cuit_list()
     * @return  array|bool   Arreglo con id, cuit y razón social de empleadores, o FALSE si hay algun error.
     */
    function get_cuit_list()
    {
        $this->db->select('tbl_empleadores.empleaid as id, tbl_empleadores.empleacui as cuit, tbl_empleadores.emplearazsoc as nombre');
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

    /**
     * Devuelve los Datos de un Empleador determinado.
     *
     * @uses    panelEmpleadores::get_empleador_por_ids($idEmpleador);
     * @return  arra|bool   Arreglo con los datos del empleador, o false si hay algún error.
     */
    function get_empleador_por_ids($idEmpleador){
        $this->db->select('tbl_empleadores.*, tbl_sisliqui.descripcion as sisliquidescrip');
        $this->db->join('tbl_sisliqui','tbl_sisliqui.sisliquiid = tbl_empleadores.empleasliquiid');
        $this->db->from('tbl_empleadores');
        $this->db->where('tbl_empleadores.empleaestado', 'AC');
        $this->db->where('tbl_empleadores.empleaid', $idEmpleador);
        $query = $this->db->get();

        if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }

    /**
     * Devuelve las Actividades de un Empleador determinado.
     *
     * @uses    panelEmpleadores::get_empleador_actividades($idEmpleador);
     * @return  arra|bool   Arreglo con las actividades del empleador, o false si hay algún error.
     */
    function get_empleador_actividades($idEmpleador){
        $this->db->select('tbl_actividad.actividadid,
            tbl_detaactiv.detaactivconvenio,
            tbl_actividad.descripcion,
            tbl_actividad.descripciongeneral,
            tbl_detaactiv.detaactivid,
            tbl_detaactiv.detaactivrubro
            ');
        $this->db->from('tbl_detaactiv');
        $this->db->join('tbl_actividad', 'tbl_detaactiv.actividadid = tbl_actividad.actividadid');
        $this->db->join('tbl_empleadores', 'tbl_detaactiv.empleaid = tbl_empleadores.empleaid');
        $this->db->where('tbl_empleadores.empleaid', $idEmpleador);
        $this->db->where('tbl_detaactiv.detaactivestado', 'AC');
        $query = $this->db->get();
        
        if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }

    /**
     * Devuelve los Establecimientos de un Empleador determinado.
     *
     * @uses    panelEmpleadores::get_empleador_establecimientos($idEmpleador);
     * @return  arra|bool   Arreglo con los establecimientos del empleador, o false si hay algún error.
     */
    function get_empleador_establecimientos($idEmpleador){
        $this->db->select('tbl_establecimiento.*, provincias.provincia, localidades.localidad');
        $this->db->from('tbl_establecimiento');
        $this->db->join('provincias', 'tbl_establecimiento.provid = provincias.id');
        $this->db->join('localidades', 'localidades.id = tbl_establecimiento.dptoid');
        $this->db->where('tbl_establecimiento.empleaid', $idEmpleador);
        $this->db->where('tbl_establecimiento.estableestado', 'AC');

        $result = $this->db->get();             
        
        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }

    /**
     * Devuelve las denuncias de un Establecimiento determinado.
     *
     * @uses    panelEmpleadores::get_denuncia_por_ids($idEstablecimiento);
     * @return  arra|bool   Arreglo con las denuncias del establecimiento, o false si hay algún error.
     */
    function get_denuncia_por_ids($idEstablecimiento){
        $this->db->select('tbl_denuncias.*');
        $this->db->from('tbl_denuncias');
        $this->db->where('tbl_denuncias.denunciaestado', 'AC');
        $this->db->where('tbl_denuncias.estableid', $idEstablecimiento);
        $query = $this->db->get();

        if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }

    /**
     * Devuelve las inspecciones de un Establecimiento determinado.
     *
     * @uses    panelEmpleadores::get_inspeccion_por_ids($idEstablecimiento);
     * @return  arra|bool   Arreglo con las inspecciones del establecimiento, o false si hay algún error.
     */
    function get_inspeccion_por_ids($idEstablecimiento){
        $this->db->select('tbl_inspecciones.*, tbl_inspectores.inspectornombre as inspector');
        $this->db->from('tbl_inspecciones');
        $this->db->join('tbl_inspectores', 'tbl_inspecciones.inspectorid = tbl_inspectores.inspectorid');
        $this->db->where('tbl_inspecciones.inspeestado', 'AC');
        $this->db->where('tbl_inspecciones.estableid', $idEstablecimiento);
        $query = $this->db->get();

        if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }

}
