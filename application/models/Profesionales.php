<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profesionales extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }


    /**
     * Devuleve el listado de profesionales.
     *
     * @return  Array    Arreglo con listado de profesionales.
     */
    function listadoProfesionales()
    {
        $this->db->where('trg_profesionales.estado', 'AC');
        $query = $this->db->get('trg_profesionales');

        if ($query->num_rows()!=0)
        {
            return $query->result_array(); 
        }
        else{
            return array();
        }
    }


    /**
     * Inserta profesional.
     *
     * @param   Array   $data   Datos del profesional.
     * @return  Bool            Arreglo con listado de profesionales.
     */
    function agregarProfesional($data)
    {
        $result = $this->db->insert('trg_profesionales',$data);
        return $result;
    }


    /**
     * Elimina profesional.
     *
     * @param   Int     $idProfesional  Datos del profesional.
     * @return  Bool                    Arreglo con listado de profesionales.
     */
    function eliminarProfesional($idProfesional)
    {
        $this->db->set('trg_profesionales.estado', 'AN');
        $this->db->where('prof_id', $idProfesional);
        $result=$this->db->update('trg_profesionales');
        return $result;
    }


    /**
     * Devuelve profesional con ID dado.
     *
     * @param   Int     $idProfesional  Id del profesional.
     * @return  Array                   Arreglo con datos del profesional.
     */
    function obtenerProfesional($idProfesional)
    {
        $this->db->where('trg_profesionales.prof_id', $idProfesional);
        $query = $this->db->get('trg_profesionales');

        if ($query->num_rows()!=0)
        {
            return $query->result_array(); 
        }
        else{
            return array();
        }
    }


    /**
     * Edita profesional.
     *
     * @param   Int     $idProfesional  Datos del profesional.
     * @return  Bool                    Arreglo con listado de profesionales.
     */
    function editarProfesional($idProfesional, $datos)
    {
        $result = $this->db->update('trg_profesionales', $datos, array('trg_profesionales.prof_id' => $idProfesional));
        return $result;
    }

}

/* End of file Profesionales.php */
/* Location: ./application/models/Profesionales.php */