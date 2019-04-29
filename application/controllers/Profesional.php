<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profesional extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Profesionales');
    }

    /**
     * carga vista con listado de profesionales.
     *
     * @param   String  $permission     Permisos de ejecucion de la pantalla.
     */
    public function index($permission)
    {
        $data['list']       = $this->Profesionales->listadoProfesionales();
        $data['permission'] = $permission;
        $this->load->view('profesionales/list', $data);
    }

    /**
     * Trae listado de profesionales.
     *
     */
    public function obtenerProfesionales()
    {
        $response = $this->Profesionales->listadoProfesionales();
        echo json_encode($response);
    }

    /**
     * Agrega profesional.
     *
     */
    public function agregarProfesional()
    {
        $datos = $this->input->post('datos');
        $data  = array(
             'nombre'    => $datos['nombre'],
             'cuit'      => $datos['cuit'],
             'titulo'    => $datos['titulo'],
             'matricula' => $datos['matricula'],
             'estado'    => 'AC',
        );
        $response = $this->Profesionales->agregarProfesional($data);
        echo json_encode($response);
    }


    /**
     * Trae datos de profesional con id dado.
     * 
     * @return  String   Json con los datos del usuario.
     */
    public function eliminarProfesional()
    {
        $idProfesional = $this->input->post('idProfesional');
        $response      = $this->Profesionales->eliminarProfesional($idProfesional);
        echo json_encode($response);
    }


    /**
     * Trae datos de profesional con id dado.
     * 
     * @return  String   Json con los datos del usuario.
     */
    public function obtenerProfesional()
    {
        $idProfesional = $this->input->post('idProfesional');
        $response      = $this->Profesionales->obtenerProfesional($idProfesional);
        echo json_encode($response[0]);
    }


    /**
     * Edita datos de profesional.
     * 
     * @return  String   Json con los datos del usuario.
     */
    public function editarProfesional()
    {
        $idProfesional = $this->input->post('id');
        $datos         = $this->input->post('datos');
        $response      = $this->Profesionales->editarProfesional($idProfesional, $datos);
        echo json_encode($response);
    }

}

/* End of file Profesional.php */
/* Location: ./application/controllers/Profesional.php */