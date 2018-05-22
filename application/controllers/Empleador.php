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
					"fecha" => $fechaEntregaNota,
					"res" => $resolucion,											
					"imagen" => $data['upload_data']['file_name'],
					"empleaid" => $idEmpleador,
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
		//dump( $_POST );
		//dump ( $_FILES );
		$idEmpleador = $this->input->post("mEmpleadorId");
		$idNota = $this->input->post("mNotaId");
		$fecEntrega = $this->input->post("mFecha");
		$resolucion = $this->input->post("mResolucion");
		$nomcodif = $this->codifNombre($idEmpleador,$idNota);   //codifico nombre para guardar 

		// si trae imagen nueva
		if(isset($_FILES)){

			$config = [
				"upload_path" => "./assets/notas",
				'allowed_types' => "png|jpg",
				'file_name' => $nomcodif
			];
			$this->load->library("upload",$config);

			// si subio la imagen
			//if ($this->upload->do_upload('myimage')) {
			if ($this->upload->do_upload('myimage')) {

				$datos = array(
					"fecha" => $fecEntrega,
					"res" => $resolucion,           
					"imagen" => $nomcodif.$this->upload->data('file_ext')
				);

				if($this->Empleadores->updateNota($datos,$idNota) == true){
					//elimina el archivo en servidor
					//unlink("./assets/notas".$file);     
					$response['notas'] = $this->Empleadores->getEmpleadorNotas($idEmpleador);
					echo json_encode($response);
				}else{
					echo json_encode(false);
				}
			}
   
		// update de nombre y fecha solamente
		}else{
			//update nnombre fecha e imagen y borro anterior
			echo "vacio!!!";
			echo json_encode(false);
		}
	}

	// Codifica nombre de imagen para no repetir en servidor
	// formato "12_11_2018-05-21-15-26-24" idempleador_idnota_fecha(año-mes-dia-hora-min-seg)
	function codifNombre($idempleador,$idnota){
		$guion       = '_';
		$guion_medio = '-';
		$hora        = date('Y-m-d H:i:s');// hora actual del sistema 
		$delimiter   = array(" ",",",".","'","\"","|","\\","/",";",":");
		$replace     = str_replace($delimiter, $delimiter[0], $hora);
		$explode     = explode($delimiter[0], $replace);
		
		$strigHora   = $explode[0].$guion_medio.$explode[1].$guion_medio.$explode[2].$guion_medio.$explode[3];
		
		$nomImagen   = $idempleador.$guion.$idnota.$guion.$strigHora;
		
		return $nomImagen;
	}

	// Elimina nota
	public function deleteNotaPorId(){
		$idNota      = $this->input->post('notid');
		$idEmpleador = $this->input->post('empleadorid');
		$response['isOk']  = $this->Empleadores->deleteNota($idNota );
		$response['notas'] = $this->Empleadores->getEmpleadorNotas($idEmpleador);
		echo json_encode($response);
	}

}
