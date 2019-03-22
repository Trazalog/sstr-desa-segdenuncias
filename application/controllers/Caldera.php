<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Caldera extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Calderas');
    }

    /**
     * carga vista con listado de Calderes.
     *
     * @param   String  $permission     Permisos de ejecucion de la pantalla.
     */
    public function index($permission)
    {
        $data['list']       = $this->Calderas->listadoCalderas();
        $data['permission'] = $permission;
        $this->load->view('calderas/list', $data);
    }

    /**
     * Trae tipos
     *
     * @return null
     */
    public function getTipos()
    {
        $response = $this->Calderas->getTipos();
        echo json_encode($response);
    }
    
    /**
     * Trae establecimientos
     *
     * @return null
     */
    public function getEstablecimientos()
    {
        $response = $this->Calderas->getEstablecimientos();
        echo json_encode($response);
    }

    /**
     * Agrega una caldera nueva a la base de datos.
     *
     * @return  Bool    True si agrega y false si hay error.
     */
    public function agregarCaldera()
    {
        $datos    = $this->input->post();
        $response = $this->Calderas->agregarCaldera($datos);
        echo json_encode($response);
    }
    
    /**
     * Trae datos de caldera con id dado.
     * 
     * @return  String   Json con los datos de la consulta.
     */
    public function eliminarCaldera()
    {
        $cald_id  = $this->input->post('cald_id');
        $response = $this->Calderas->eliminarCaldera($cald_id);
        echo json_encode($response);
    }

    /**
     * Trae datos de caldera con id dado.
     * 
     * @return  String   Json con los datos de la caldera.
     */
    public function obtenerCaldera()
    {
        $cald_id  = $this->input->post('cald_id');
        $response = $this->Calderas->obtenerCaldera($cald_id);
        echo json_encode($response[0]);
    }

    /**
     * Edita datos de caldera.
     * 
     * @return  String   Json con los datos de la caldera.
     */
    public function editarCaldera()
    {
        $datos    = $this->input->post();
        $response = $this->Calderas->editarCaldera($datos);
        echo json_encode($response);
    }
}

/* End of file Caldera.php */
/* Location: ./application/controllers/Caldera.php */