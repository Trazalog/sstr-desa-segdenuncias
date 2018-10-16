<?php
//defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * panelEmpleador Class
 * Clase para el manejo del panel de Empleadores.
 * que extiende de la clase CI_Controller.
 *
 * @author      Pablo Andrés Rojo
 */
class panelEmpleador extends CI_Controller {

	/**
	 * Clase constructora
	 * Método constructor de la clase panelEmpleador. Carga el modelo panelEmpleadores.
	 *
	 * @return	void
	 */
	function __construct()
    {
		parent::__construct();
		$this->load->model('panelEmpleadores');
	}

	/**
     * Llama y carga la vista del Panel De Empleadores.
     *
     * @uses    panelEmpleador::index()
     */
	public function index($permission)
	{
		$data['cuit'] = $this->panelEmpleadores->get_cuit_list();
		$data['permission'] = $permission;
		$this->load->view('panelEmpleadores/list', $data);
	}

    /**
     * Devuelve los Datos de un Empleador determinado. Además
     *
     * @uses    panelEmpleador::get_empleador_por_id();
     * @return  string  JSON con los datos del empleador. 
     */
    public function get_empleador_por_id()
    {
        $idEmpleador = $this->input->post('id');
        $response['empleador']        = $this->panelEmpleadores->get_empleador_por_ids($idEmpleador);
        $response['actividades']      = $this->panelEmpleadores->get_empleador_actividades($idEmpleador);
        $response['establecimientos'] = $this->panelEmpleadores->get_empleador_establecimientos($idEmpleador);
        echo json_encode($response);
    }

    /**
     * Devuelve los Datos (denuncias e inspecciones) de un Establecimiento determinado. Además
     *
     * @uses    panelEmpleador::get_establecimiento_datos_por_id();
     * @return  string  JSON con los datos del establecimiento. 
     */
    public function get_establecimiento_datos_por_id()
    {
        $idEstablecimiento = $this->input->post('id');
        $response['denuncias']    = $this->panelEmpleadores->get_denuncia_por_ids($idEstablecimiento);
        $response['inspecciones'] = $this->panelEmpleadores->get_inspeccion_por_ids($idEstablecimiento);
        //dump_exit( $response['inspecciones'] );
        echo json_encode($response);
    }
}
