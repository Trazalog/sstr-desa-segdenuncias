<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Empleador extends CI_Controller 
{
	function __construct(){
		parent::__construct();
		$this->load->model('Empleadores');
	}

	public function index($permission){
		/* arreglo provisorio */
		$userdata = $this->session->userdata('user_data');
		if( ($userdata[0]['grpId'] == 1) && ($permission == 'View') ) 
			$data['permission'] = 'Add-View-Edit-Del'; //llamar a los permisos en el footer dash
		else
			$data['permission'] = $permission;
		/* arreglo provisorio */

		$data['list'] = $this->Empleadores->empleadores_List();
		$data['liquidacion'] = $this->Empleadores->getSistLiquidacion();
		$data['actividad'] = $this->Empleadores->getActividad();
		$data['provincias'] = $this->Empleadores->getProvincias();
		$this->load->view('empleadores/list', $data);
	}

	public function getDatosEmpleador($permission){
		$data['liquidacion'] = $this->Empleadores->getSistLiquidacion();
		$data['actividad']   = $this->Empleadores->getActividad();
		$data['provincias']  = $this->Empleadores->getProvincias();
		$data['permission']  = $permission;
		$this->load->view('empleadores/view_', $data);
	}

	public function getEmpleador(){
		$data['liquidacion'] = $this->Empleadores->getSistLiquidacion();
		$data['actividad']   = $this->Empleadores->getActividad();
		$data['provincias']  = $this->Empleadores->getProvincias();
		$response['html']    = $this->load->view('empleadores/view_', $data, true);
		echo json_encode($response);
	}

	public function getEmpleadorPorId(){
		$id                           = $this->input->post('id_empleador');
		$response['empleador']        = $this->Empleadores->getEmpleadorPorIds($id);
		$response['establecimientos'] = $this->Empleadores->getEmpleadorEstablecimientos($id);
		$response['actividad']        = $this->Empleadores->getEmpleadorActividad($id);
		$response['libros']           = $this->Empleadores->getEmpleadorLibros($id);
		$response['notas']            = $this->Empleadores->getEmpleadorNotas($id);
		//dump_exit($response);
		echo json_encode($response);
	}
	
	public function editEmpleador($permission, $idEmpleador){
		//dump_exit($idEmpleador);
		$data['idEmpleador']      = $idEmpleador;
		$data['permission']       = $permission;
		$data['actividad']        = $this->Empleadores->getActividad();
		$data['provincias']       = $this->Empleadores->getProvincias();
		$data['departamentos']    = $this->Empleadores->getLocalidades();
		$data['liquidacion']      = $this->Empleadores->getSistLiquidacion();
		
		$data['empleador']        = $this->Empleadores->getEmpleadorPorIds($idEmpleador);
		$data['actividadE']       = $this->Empleadores->getEmpleadorActividad($idEmpleador);
		$data['libros']           = $this->Empleadores->getEmpleadorLibros($idEmpleador);
		$data['establecimientos'] = $this->Empleadores->getEmpleadorEstablecimientos($idEmpleador);
		$data['notas']            = $this->Empleadores->getEmpleadorNotas($idEmpleador);
		$this->load->view('empleadores/edit_', $data);
	}

	public function deleteEmpleadorPorId(){
		$id = $this->input->post('id_empleador');
		$response = $this->Empleadores->deleteEmpleadorPorIds($id);  
		echo json_encode($response);
	}

	public function getLocalidadPorId(){
		$id = $this->input->post('id_provincia');
		$response = $this->Empleadores->getLocalidadPorIds($id);  
		echo json_encode($response);
	}
	
	public function setEmpleador(){
		$data = $this->input->post();
		$response = $this->Empleadores->setEmpleadores($data);
		echo json_encode($response);
	}

	public function updateEmpleadorPorId(){
		$data        = $this->input->post('empleador');
		$idEmpleador = $this->input->post('idEmpleador');
		$permission  = $this->input->post('permission');

		$response['isOk']             = $this->Empleadores->updateEmpleadorEdit($data, $idEmpleador);
		//$this->editEmpleador($permission, $idEmpleador);
		$response['idEmpleador']      = $idEmpleador;
		$response['permission']       = $permission;
		$response['actividad']        = $this->Empleadores->getActividad();
		$response['provincias']       = $this->Empleadores->getProvincias();
		$response['departamentos']    = $this->Empleadores->getLocalidades();
		$response['liquidacion']      = $this->Empleadores->getSistLiquidacion();
		
		$response['empleador']        = $this->Empleadores->getEmpleadorPorIds($idEmpleador);
		$response['actividadE']       = $this->Empleadores->getEmpleadorActividad($idEmpleador);
		$response['libros']           = $this->Empleadores->getEmpleadorLibros($idEmpleador);
		$response['establecimientos'] = $this->Empleadores->getEmpleadorEstablecimientos($idEmpleador);
		$response['notas']            = $this->Empleadores->getEmpleadorNotas($idEmpleador);

		echo json_encode($response);
	}
	




	/***   ESTABLECIMIENTOS   ***/

	// Elimina establecimiento
	public function setEstablecimiento() {
		$data        = $this->input->post();
		$idEmpleador = $this->input->post('empleaid');
		$response['isOk']     = $this->Empleadores->setEstablecimientoEdit($data);
		$response['establec'] = $this->Empleadores->getEmpleadorEstablecimientos($idEmpleador);
		echo json_encode($response);
	}

	// Guarda edicion de establecimiento
	public function updateEstablecimientoPorId(){
		$data        = $this->input->post();
		$idEstable   = array_shift($data);
		$idEmpleador = $this->input->post('empleaid');
		$response['isOk']   = $this->Empleadores->updateEstablecimientoPorIds($data,$idEstable);
		$response['establec'] = $this->Empleadores->getEmpleadorEstablecimientos($idEmpleador);
		echo json_encode($response);
	}

	// Elimina establecimiento
	public function deleteEstablecimientoPorId() {
		$idEstable   = $this->input->post('estableid');
		$idEmpleador = $this->input->post('empleadorid');
		$response['isOk']     = $this->Empleadores->deleteEstablecimiento($idEstable);
		$response['establec'] = $this->Empleadores->getEmpleadorEstablecimientos($idEmpleador);
		echo json_encode($response);
	}



	/***   ACTIVIDAD   ***/

	//
	public function setActividad(){
		$data        = $this->input->post();
		$idEmpleador = $this->input->post('empleaid');
		//dump_exit($data);
		$response['isOk']      = $this->Empleadores->setActividadEdit($data);
		$response['actividad'] = $this->Empleadores->getEmpleadorActividad($idEmpleador);
		echo json_encode($response);
	}

	// Guarda en de actividades
	public function updateActividadPorId(){
		$data        = $this->input->post();
		$idDetaActiv = array_shift($data);
		$idEmpleador = $this->input->post('empleaid');
		//dump_exit($data);
		$response['isOk']   = $this->Empleadores->updateActividadPorIds($data,$idDetaActiv);
		$response['actividad'] = $this->Empleadores->getEmpleadorActividad($idEmpleador);
		echo json_encode($response);
	}
	// Elimina actividad
	public function deleteActividadPorId(){
		$idActividad = $this->input->post('detaactivid');
		$idEmpleador = $this->input->post('empleadorid');
		//dump_exit($idActividad);
		$response['isOk']      = $this->Empleadores->deleteActividad($idActividad);
		$response['actividad'] = $this->Empleadores->getEmpleadorActividad($idEmpleador);
		echo json_encode($response);
	}



	/***   LIBROS   ***/

	// Agrega libro
	public function setLibro(){
		$data        = $this->input->post();
		//dump_exit($data);
		$response['isOk']   = $this->Empleadores->setLibroEdit($data);
		echo json_encode($response);
	}

	// Guarda edicion de libros
	public function updateLibroPorId(){
		$data        = $this->input->post();
		$idLibro     = array_shift($data);
		$idEmpleador = $this->input->post('empleaid');
		//dump_exit($data);
		$response['isOk']   = $this->Empleadores->updateLibroPorIds($data,$idLibro);
		$response['libros'] = $this->Empleadores->getEmpleadorLibros($idEmpleador);
		echo json_encode($response);
	}

	// Elimina Libro
	public function deleteLibroPorId() {
		$idLibro     = $this->input->post('libroid');
		$idEmpleador = $this->input->post('empleadorid');
		$response['isOk']   = $this->Empleadores->deleteLibros($idLibro);
		$response['libros'] = $this->Empleadores->getEmpleadorLibros($idEmpleador);
		echo json_encode($response);
	}



	/***   NOTAS   ***/

	// agrega nota
	public function guardarNota(){
		//El metodo is_ajax_request() de la libreria input permite verificar
		//si se esta accediendo mediante el metodo AJAX 
		if ($this->input->is_ajax_request()) {			
			$fechaEntregaNota = $this->input->post("fechaEntregaNota");
			$resolucion = $this->input->post("resolucion");
			$idEmpleador = $this->input->post("idEmpleador");			
			$config = [
				"upload_path" => "./assets/notas",
				'allowed_types' => "png|jpg"
			];
			$this->load->library("upload",$config);
			if ($this->upload->do_upload('nota')) {
				$data = array("upload_data" => $this->upload->data());
				$datos = array(
					"fecha"      => $fechaEntregaNota,
					"res"        => $resolucion,											
					"imagen"     => $data['upload_data']['file_name'],
					"empleaid"   => $idEmpleador,
					"notaestado" => "AC"
				);
				if($this->Empleadores->guardarNota($datos) == true)
					echo "exito";
				else
					echo "error";
			}
			else{
				echo $this->upload->display_errors();
			}			
		}
		else
		{
			show_404();
		}
	}

	// Guarda edicion de Nota
	public function editarNota(){
		dump( $_POST );
		dump ( $_FILES );
		echo json_encode( true );
		// si viene $_FILES es porque no toco la imagen
		// por lo tanto hay que actualizar fecha y resolucion, pero no la imagen!!!
		// (no hice mas porque encontre errores que tuve que arreglar)

		/* esto esta en usuario * /
		$dataForm['id'] = $_POST['id'];
		$dataForm['act'] = $_POST['act'];
		$dataForm['usrNick'] = $_POST['usrNick'];
		if (isset($_POST['myimage']) && $_POST['myimage'] == 1) {
			$data['id'] = $_POST['id'];
			$data['act'] = 'View';
			$dataUser = $this->Users->getUser($data);
			$dataForm['usrimag'] = $dataUser['user']['usrimag'];
		} else {
			if( isset($_FILES['myimage']['size']) && $_FILES['myimage']['size'] != 0 ) {
				//Convertimos la información de la imagen en binario para insertarla en la BBDD
				$imagenBinaria = file_get_contents($_FILES['myimage']['tmp_name']);
				$dataForm['usrimag'] = $imagenBinaria;
			} else {
				$dataForm['usrimag'] = '';
			}
		}
		$data = $this->Users->setUser( $dataForm );
		/* hasta aca de usuarios */

		$idEmpleador = $_POST['empleaid'];
		$response['libros'] = $this->Empleadores->getEmpleadorNotas($idEmpleador);
		echo json_encode($response);
	}

	// Elimina libro
	public function deleteNotaPorId(){
		$idNota      = $this->input->post('notid');
		$idEmpleador = $this->input->post('empleadorid');
		$response['isOk']  = $this->Empleadores->deleteNota($idNota);
		$response['notas'] = $this->Empleadores->getEmpleadorNotas($idEmpleador);
		echo json_encode($response);
	}

}
