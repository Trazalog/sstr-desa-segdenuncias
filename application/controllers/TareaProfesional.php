<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class tareaProfesional extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('TareasProfesionales');
    }

    /**
     * carga vista con listado de Calderes.
     *
     * @param   String  $permission     Permisos de ejecucion de la pantalla.
     */
    public function index($permission)
    {
        $data['list']       = $this->TareasProfesionales->listadoTareasProfesionales();
        $data['permission'] = $permission;
        $this->load->view('tareasProfesionales/list', $data);
    }

    /**
     * Trae tipos
     *
     * @return null
     */
    public function getTipos()
    {
        $response = $this->TareasProfesionales->getTipos();
        echo json_encode($response);
    }
    
    /**
     * Agrega una caldera nueva a la base de datos.
     *
     * @return  Bool    True si agrega y false si hay error.
     */
    public function agregarTareaProfesional()
    {
        $datos    = $this->input->post();
        $response = $this->TareasProfesionales->agregarTareaProfesional($datos);
        echo json_encode($response);
    }
    
    /**
     * Trae datos de caldera con id dado.
     * 
     * @return  String   Json con los datos de la consulta.
     */
    public function eliminarTareaProfesional()
    {
        $tare_id  = $this->input->post('tare_id');
        $response = $this->TareasProfesionales->eliminarTareaProfesional($tare_id);
        echo json_encode($response);
    }

    /**
     * Trae datos de caldera con id dado.
     * 
     * @return  String   Json con los datos de la caldera.
     */
    public function obtenerTareaProfesional()
    {
        $tare_id  = $this->input->post('tare_id');
        $response = $this->TareasProfesionales->obtenerTareaProfesional($tare_id);
        echo json_encode($response[0]);
    }

    /**
     * Edita datos de caldera.
     * 
     * @return  String   Json con los datos de la caldera.
     */
    public function editarTareaProfesional()
    {
        $datos    = $this->input->post();
        $response = $this->TareasProfesionales->editarTareaProfesional($datos);
        echo json_encode($response);
    }
}

/* End of file Caldera.php */
/* Location: ./application/controllers/Caldera.php */