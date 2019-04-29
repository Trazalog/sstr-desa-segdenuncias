<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Calderas extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }


    /**
     * Devuleve el listado de calderas.
     *
     * @return  Array    Arreglo con listado de calderas.
     */
    function listadoCalderas()
    {
        $this->db->select('trg_calderas.*, tbl_establecimiento.establecalle, tbl_establecimiento.establealtura');
        $this->db->join('tbl_establecimiento','tbl_establecimiento.estableid = trg_calderas.establecimiento');
        $this->db->from('trg_calderas');
        $this->db->where('trg_calderas.estado', 'AC');

        $result = $this->db->get();
        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }

    /**
     * Devuleve datos de tipos.
     *
     * @return  Array   Datos de Tipos.
     */
    public function getTipos()
    {
        $this->db->select('trg_tipocaldera.*');
        $this->db->from('trg_tipocaldera');
        $this->db->where('trg_tipocaldera.estado', 'AC');
        $this->db->order_by('trg_tipocaldera.nombre', 'asc');

        $result = $this->db->get();
        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }

    /**
     * Devuelve datos de establecimientos para llenar selects
     *
     * @return  Array   Datos de establecimientos.
     */
    public function getEstablecimientos()
    {
        $this->db->select('tbl_establecimiento.*, localidades.localidad');
        $this->db->from('tbl_establecimiento');
        $this->db->join('localidades', 'tbl_establecimiento.dptoid = localidades.id', 'left');
        $this->db->where('tbl_establecimiento.estableestado', 'AC');
        $this->db->order_by('tbl_establecimiento.establecalle', 'asc');

        $result = $this->db->get();
        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }

    /**
     * Inserta caldera.
     *
     * @param   Array   $datos  Datos de la caldera.
     * @return  Bool            Arreglo con datos de caldera.
     */
    function agregarCaldera($datos)
    {
        $datos['estado'] = 'AC';
        $result = $this->db->insert('trg_calderas',$datos);
        return $result;
    }

    /**
     * Elimina caldera.
     *
     * @param   Int     $cald_id  Datos del caldera.
     * @return  Bool                    Arreglo con listado de profesionales.
     */
    function eliminarCaldera($cald_id)
    {
        $this->db->set('trg_calderas.estado', 'AN');
        $this->db->where('trg_calderas.cald_id', $cald_id);
        $result=$this->db->update('trg_calderas');
        return $result;
    }

    /**
     * Devuelve caldera con ID dado.
     *
     * @param   Int     $cald_id    Id del profesional.
     * @return  Array               Arreglo con datos de caldera.
     */
    function obtenerCaldera($cald_id)
    {
        $this->db->where('trg_calderas.cald_id', $cald_id);
        $query = $this->db->get('trg_calderas');

        if ($query->num_rows()!=0)
        {
            $caldera = $query->result_array(); 

            $this->db->select('trg_tareasprofesionales.*, trg_profesionales.nombre AS profesionalNombre, trg_tipotareaprofesional.nombre AS tipoNombre');
            $this->db->from('trg_tareasprofesionales');
            $this->db->join('trg_profesionales','trg_profesionales.prof_id = trg_tareasprofesionales.profesional');
            $this->db->join('trg_tipotareaprofesional', 'trg_tipotareaprofesional.tita_id = trg_tareasprofesionales.tipo');
            $this->db->where('trg_tareasprofesionales.estado', 'AC');
            $this->db->where('trg_tareasprofesionales.caldera', $caldera[0]["cald_id"]);

            $query2 = $this->db->get();
            if($query2->num_rows()>0){
                $caldera[0]['tareasProfesionales'] = $query2->result_array();
            }
            else{
                $caldera[0]['tareasProfesionales'] = array();
            }

            return $caldera; 
        }
        else{
            return array();
        }
    }

    /**
     * Edita caldera.
     *
     * @param   Array     $datos  Datos de la caldera.
     * @return  Bool              Arreglo con listado de profesionales.
     */
    function editarCaldera($datos)
    {
        $cald_id                  = $datos['cald_idE'];
        $tipo                     = $datos['tipoE'];
        $empresa                  = $datos['empresaE'];
        $establecimiento          = $datos['establecimientoE'];
        $nom_fabricante           = $datos['nom_fabricanteE'];
        $max_presion              = $datos['max_presionE'];
        $superficieCalefaccion    = $datos['superficieCalefaccionE'];
        $max_capacidadVapor       = $datos['max_capacidadVaporE'];
        $temperaturaPresionMaxima = $datos['temperaturaPresionMaximaE'];
        $num_serie                = $datos['num_serieE'];
        $codigoNorma              = $datos['codigoNormaE'];
        $anioFabricacion          = $datos['anioFabricacionE'];
        $num_registro             = $datos['num_registroE'];
        $documentacion            = $datos['documentacionE'];
        if( $tipo == 1 ) {
            // si es caldera no guardo temperaturaPresionMaxima
            $temperaturaPresionMaxima = null;
        } elseif( $tipo == 2) {
            // si es recipiente a presión no guarda sup calefaccion ni capacidad max vapor
            $superficieCalefaccion = null;
            $max_capacidadVapor    = null;
        }

        $data = Array (
            'tipo'                     => $tipo,
            'empresa'                  => $empresa,
            'establecimiento'          => $establecimiento,
            'nom_fabricante'           => $nom_fabricante,
            'max_presion'              => $max_presion,
            'superficieCalefaccion'    => $superficieCalefaccion,
            'max_capacidadVapor'       => $max_capacidadVapor,
            'temperaturaPresionMaxima' => $temperaturaPresionMaxima,
            'num_serie'                => $num_serie,
            'codigoNorma'              => $codigoNorma,
            'anioFabricacion'          => $anioFabricacion,
            'num_registro'             => $num_registro,
            'documentacion'            => $documentacion
        );

        $result = $this->db->update('trg_calderas', $data, array('trg_calderas.cald_id' => $cald_id));
        return $result;
    }
}