<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class TareasProfesionales extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }


    /**
     * Devuleve el listado de calderas.
     *
     * @return  Array    Arreglo con listado de calderas.
     */
    function listadoTareasProfesionales()
    {
        $this->db->select('trg_tareasprofesionales.*, trg_profesionales.nombre AS profesionalNombre, trg_tipotareaprofesional.nombre AS tipoNombre');
        $this->db->from('trg_tareasprofesionales');
        $this->db->join('trg_profesionales','trg_profesionales.prof_id = trg_tareasprofesionales.profesional');
        $this->db->join('trg_tipotareaprofesional', 'trg_tipotareaprofesional.tita_id = trg_tareasprofesionales.tipo');
        $this->db->where('trg_tareasprofesionales.estado', 'AC');

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
        $this->db->select('trg_tipotareaprofesional.*');
        $this->db->from('trg_tipotareaprofesional');
        $this->db->where('trg_tipotareaprofesional.estado', 'AC');

        $result = $this->db->get();
        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
    }

    /**
     * Inserta registro de tareas profesionales.
     *
     * @param   Array   $datos  Datos de la caldera.
     * @return  Bool            Arreglo con datos de caldera.
     */
    function agregarTareaProfesional($datos)
    {
        //dump_exit($datos);
        $tipo          = $datos['tipo'];
        $fecha         = $datos['fecha'];
        $profesional   = $this->getIdProfesional($datos['profesional']);
        $observaciones = $datos['observaciones'];
        $vencimiento   = $datos['vencimiento'];
        $caldera       = $datos['calderaId'];
        $estado        = 'AC';
                
        $data = Array (
            'tipo'          => $tipo,
            'fecha'         => $fecha,
            'profesional'   => $profesional,
            'observaciones' => $observaciones,
            'vencimiento'   => $vencimiento,
            'caldera'       => $caldera,
            'estado'        => $estado,
        );

        $result = $this->db->insert('trg_tareasprofesionales',$data);
        return $result;
    }

    /**
     * Trae el nombre del profesional con su id;
     *
     * @param   Int     $idProfesional  Id de profesional
     * @return  String                  Nombre de profesional
     */
    public function getIdProfesional($nombreProfesional)
    {
        $this->db->select('trg_profesionales.prof_id');
        $this->db->from('trg_profesionales');
        $this->db->where('trg_profesionales.nombre', $nombreProfesional);

        $result = $this->db->get();
        if($result->num_rows()>0){
            $id = $result->result_array();
            return $id[0]['prof_id'];
        }
        else{
            return false;
        }
    }
    
    /**
     * Elimina registro de tarea profesionales.
     *
     * @param   Int     $tare_id  Datos dela tarea .
     * @return  Bool              resultado de la consulta.
     */
    function eliminarTareaProfesional($tare_id)
    {
        $this->db->set('trg_tareasprofesionales.estado', 'AN');
        $this->db->where('trg_tareasprofesionales.tare_id', $tare_id);
        $result=$this->db->update('trg_tareasprofesionales');
        return $result;
    }

    /**
     * Devuelve caldera con ID dado.
     *
     * @param   Int     $tare_id    Id del profesional.
     * @return  Array               Arreglo con datos de caldera.
     */
    function obtenerTareaProfesional($tare_id)
    {
        $query = $this->db->get('trg_tareasprofesionales');

        $this->db->select('trg_tareasprofesionales.*, trg_profesionales.nombre AS profesionalNombre');
        $this->db->from('trg_tareasprofesionales');
        $this->db->join('trg_profesionales','trg_profesionales.prof_id = trg_tareasprofesionales.profesional');
        $this->db->where('trg_tareasprofesionales.tare_id', $tare_id);

        $result = $this->db->get();
        if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }

        if ($query->num_rows()!=0)
        {
            return $query->result_array(); 
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
    function editarTareaProfesional($datos)
    {
        $tare_id       = $datos['tare_idE'];
        $tipo          = $datos['tipoTareaE'];
        $fecha         = $datos['fechaE'];
        $profesional   = $this->getIdProfesional($datos['profesionalE']);
        $observaciones = $datos['observacionesE'];
        $vencimiento   = $datos['vencimientoE'];
                
        $data = Array (
            'tipo'          => $tipo,
            'fecha'         => $fecha,
            'profesional'   => $profesional,
            'observaciones' => $observaciones,
            'vencimiento'   => $vencimiento,
        );

        $result = $this->db->update('trg_tareasprofesionales', $data, array('trg_tareasprofesionales.tare_id' => $tare_id));
        return $result;
    }

}