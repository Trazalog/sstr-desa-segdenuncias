<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Tareas extends CI_Model
{
	function __construct(){

		parent::__construct();
	}
	// trae tareas de BPM
	 function getTareas($param){

	 	$userdata = $this->session->userdata('user_data');
	 	$usrId= $userdata[0]["usrId"];
	 	//$tareas = file_get_contents(BONITA_URL.'API/bpm/humanTask?p=0&c=10&f=user_id%3D5', false, $param);
	 	$resource = 'API/bpm/humanTask?p=0&c=1000&f=user_id%3D';
	 	$url = BONITA_URL.$resource.$usrId;
	 	$tareas = file_get_contents($url, false, $param);

	 	$tar = $this->AgregarDatos($tareas);

	 	return $tar;
	 }

	function getUsuariosBPM($param){

		// $resource = 'API/identity/user?f=group_id=19';
		$resource = 'API/identity/user?p=0&c=50';
	 	$url = BONITA_URL.$resource;
		$usrs = file_get_contents($url, false, $param);
		return json_decode($usrs,true) ;
	}

	function AgregarDatos($tareas){
		//dump_exit($tareas);
		$tar = json_decode($tareas,true);

		foreach ($tar as $key => $value) {

			$caseId = $tar[$key]["caseId"];
			$datos = $this->getDatPedidoTrabajo($caseId);

			$tar[$key]['petr_id'] = $datos[0]['petr_id'];
			$tar[$key]['cod_interno'] = $datos[0]['cod_interno'];
		}

		return $tar;
	}
	// trae cod interno de pedido trabajo en funcion del caseId de BPM
	function getDatPedidoTrabajo($caseId){

		$this->db->select('trj_pedido_trabajo.petr_id,
							trj_pedido_trabajo.cod_interno');
		$this->db->from('trj_pedido_trabajo');
		$this->db->where('trj_pedido_trabajo.bpm_id',$caseId);

		$query = $this->db->get();

		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
	}

	function getIdPedTrabajo($caseId){
		$this->db->select('trj_pedido_trabajo.petr_id,trj_pedido_trabajo.cod_interno');
		$this->db->from('trj_pedido_trabajo');
		$this->db->where('trj_pedido_trabajo.bpm_id', $caseId);

		$query = $this->db->get();

		if ($query->num_rows()!=0){
			return $query->result_array();
			//return $query->row('petr_id');
	 	}else{
	 		return false;
	 	}
	}

	// Estado GENERICO
	function estadocuenta($idTarBonita,$param){

		$resource = 'API/bpm/userTask/';
		$com = '/execution';
		$url = BONITA_URL.$resource.$idTarBonita.$com;
		// $response = file_get_contents(BONITA_URL.'API/bpm/userTask/78/execution',false, $param);
		$response = file_get_contents($url,false, $param);

		return $response;
	}
	// Estado de cuenta
	function estadocuentaOk($idTarBonita,$param){

		$resource = 'API/bpm/userTask/';
		$com = '/execution';
		$url = BONITA_URL.$resource.$idTarBonita.$com;
		file_get_contents($url,false, $param);
		$response = $this->parseHeaders( $http_response_header );

		return $response;
	}
	//Espera regularizacion
	function esperandoRegularizacion($idTarBonita,$param){
		//$response = file_get_contents(BONITA_URL.'API/bpm/userTask/78/execution',false, $param);

		$resource = 'API/bpm/userTask/';
		$com = '/execution';
		$url = BONITA_URL.$resource.$idTarBonita.$com;
		$response = file_get_contents($url,false, $param);

		return $response;
	}
	//Precisa Anticipo
	function precisaAnticipo($idTarBonita,$param){
		//$response = file_get_contents(BONITA_URL.'API/bpm/userTask/78/execution',false, $param);

		$resource = 'API/bpm/userTask/';
		$com = '/execution';
		$url = BONITA_URL.$resource.$idTarBonita.$com;
		$response = file_get_contents($url,false, $param);

		return $response;
	}

	//obtener Comentarios
	function ObtenerComentariosBPM($caseId,$param){
		$processInstance = 'processInstanceId%3D'.$caseId;
		$comentarios = file_get_contents(BONITA_URL.'API/bpm/comment?f='.$processInstance.'&o=postDate%20DESC&p=0&c=200&d=userId',false,$param);
		return json_decode($comentarios,true);
	}
	//Guardar Comentarios
	function GuardarComentarioBPM($param){
		$respuesta = file_get_contents(BONITA_URL.'API/bpm/comment',false,$param);
		return $respuesta;
	}

	// FIXME: CAMBIE ID TAR BONITA PO ID DE USR
	// Terminar Tarea
	function terminarTarea($idTarBonita,$param){

		$userdata = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId'];
		$method = '/execution';
		$resource = 'API/bpm/userTask/';
		$url = BONITA_URL.$resource.$idTarBonita.$method;
		//$url = BONITA_URL.$resource.$usrId.$method;
		file_get_contents($url, false, $param);
		$response = $this->parseHeaders( $http_response_header );
		return $response;
	}

	function terminarPlanificacion($idTarBonita,$param){

		$method = '/execution';
		$resource = 'API/bpm/userTask/';
		$url = BONITA_URL.$resource.$idTarBonita.$method;
		//var_dump($url);
		file_get_contents($url, false, $param);
		$response = $this->parseHeaders( $http_response_header );
		return $response;
	}

	// Terminar Tarea
	function terminarTareaStandarenBPM($idTarBonita,$param){

		$userdata = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId'];
		$method = '/execution';
		$resource = 'API/bpm/userTask/';
		$url = BONITA_URL.$resource.$idTarBonita.$method;
		//$url = BONITA_URL.$resource.$usrId.$method;
		file_get_contents($url, false, $param);
		$response = $this->parseHeaders( $http_response_header );
		return $response;
	}

	// guarda task id de BPM en bpm_task_id de tbl_listareas
	function updateTaskEnListarea($id_listarea,$idTarBonita){


		$sql= "UPDATE tbl_listarea SET tbl_listarea.bpm_task_id = $idTarBonita  WHERE tbl_listarea.id_listarea = 280";
		$query= $this->db->query($sql);

		return $query;
	}


	// Tomar Tareas
	function tomarTarea($idTarBonita,$param){

		try {
			$resource = 'API/bpm/humanTask/';
			$url = BONITA_URL.$resource.$idTarBonita;

			file_get_contents($url, false, $param);
			$response = $this->parseHeaders( $http_response_header );

			return $response;
		}catch (Exception $e) {
			var_dump($e->getMessage());
		 }
	}

	function validarEstOT($idTarBonita,$idPedido){

		$this->db->select('orden_trabajo.petr_id,
							orden_trabajo.bpm_task_id_plan');
		$this->db->from('orden_trabajo');
		$this->db->where('orden_trabajo.bpm_task_id_plan', $idTarBonita);
		$this->db->where('orden_trabajo.petr_id', $idPedido);
		$query = $this->db->get();

		if ($query->num_rows()>0){
			return true;
		}else{
			return false;
		}
	}

	function validarEstOTporCodInterno($cod_interno){
		$this->db->select('orden_trabajo.id_orden');
		$this->db->from('orden_trabajo');
		$this->db->where('orden_trabajo.nro', $cod_interno);
		//$this->db->where('orden_trabajo.petr_id', $idPedido);
		$query = $this->db->get();

		if ($query->num_rows()>0){
			return true;
		}else{
			return false;
		}
	}

	// Generar OT vacia
	function setOTInicial($idTarBonita,$idPedido,$cod_interno,$detalle){

		$userdata = $this->session->userdata('user_data');
		$usrId    = $userdata[0]['usrId'];
		//$usrNick  = $userdata[0]['usrNick'];

		$data = array(
			'nro'=> $cod_interno,
			'fecha_inicio'=> date('Y-m-d H:i:S'),
			'descripcion'=> $detalle,
			'cliId' => '1',
			'estado' => 'C',
			'id_usuario' =>$usrId,
			//'nombre_usuario' =>$usrNick, // Agregar a la tabla tbl_listarea
			'id_usuario_a' =>1,
			'id_sucursal' => 1,
			'id_proveedor' => 1,
			'petr_id' => $idPedido,
			'bpm_task_id_plan'=>$idTarBonita
		   );
		$query = $this->db->insert("orden_trabajo",$data);

		return $query;
	}
	// Soltar Tareas
	function soltarTarea($idTarBonita,$param){

		$resource = 'API/bpm/humanTask/';
		$url = BONITA_URL.$resource.$idTarBonita;
		file_get_contents($url, false, $param);
		$response = $this->parseHeaders( $http_response_header );
		return $response;
	}

	// toma la respuesta del server y devuelve el codigo de respuesta solo
	function parseHeaders( $headers ){
		$head = array();
		foreach( $headers as $k=>$v ){
			$t = explode( ':', $v, 2 );
			if( isset( $t[1] ) )
				$head[ trim($t[0]) ] = trim( $t[1] );
			else{
				$head[] = $v;
				if( preg_match( "#HTTP/[0-9\.]+\s+([0-9]+)#",$v, $out ) )
					$head['reponse_code'] = intval($out[1]);
			}
		}
		return $head;
	}

	// devuelve id de OT por case_id
	function getIdOrdenTrabajoPorCaseId($caseId){

		$this->db->select('orden_trabajo.id_orden');
		$this->db->from('orden_trabajo');
		$this->db->join('trj_pedido_trabajo', 'orden_trabajo.petr_id = trj_pedido_trabajo.petr_id');
		$this->db->where('trj_pedido_trabajo.bpm_id', $caseId);
		$query = $this->db->get();

		if($query->num_rows()>0){
	    	return $query->row('id_orden');
	    }
	    else{
	    	return false;
	    }
	}

	// devuelve id de ot por caseId
	function getIdOTPorCaseId($caseId){

		$this->db->select('orden_trabajo.id_orden');
		$this->db->from('orden_trabajo');
		$this->db->join('trj_pedido_trabajo', 'trj_pedido_trabajo.petr_id = orden_trabajo.petr_id');
		$this->db->where('trj_pedido_trabajo.bpm_id', $caseId);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('id_orden');
	 	}else{
	 		return 0;
	 	}
	}

	// devuelve ptrId por caseId
	function getPtrIdPorCaseId($caseId){

		$this->db->select('trj_pedido_trabajo.petr_id');
		$this->db->from('trj_pedido_trabajo');
		$this->db->where('trj_pedido_trabajo.bpm_id', $caseId);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('petr_id');
	 	}else{
	 		return 0;
	 	}
	}



	// Devuelve el id de tareas de trazaj correspond al id_tarea bonita para detatareas
	// NO TOCAR
	function getIdTareaTraJobs($idBonita,$param){

		$urlResource = 'API/bpm/activityVariable/';
		$idListEnBPM = '/trazajobsTaskId';

		try {
			$idTJ = @file_get_contents(BONITA_URL.$urlResource.$idBonita.$idListEnBPM , false, $param);
			$idTJobs = json_decode($idTJ,true); //sin true no se puede acceder
			$id_listarea = $idTJobs["value"];
		} catch (Exception $e) {
			echo 'Excepción capturada: ',  $e->getMessage(), "\n";
			$id_listarea = 0;
		}

		return $id_listarea;
	}

	// devuelve detalle de tareas para notificacion standart a partir de id_listarea
	function detaTareas($id_listarea){

	 	$this->db->select('tbl_listarea.id_listarea,
							tbl_listarea.id_orden,
							tareas.duracion_std,
							tbl_listarea.tareadescrip,
							tbl_listarea.id_tarea,
							tbl_listarea.id_usuario,
							tbl_listarea.estado,
							tbl_listarea.fecha');
	 	$this->db->from('tbl_listarea');
		$this->db->join('tareas', 'tareas.id_tarea = tbl_listarea.id_tarea');
		$this->db->where('tbl_listarea.id_listarea', $id_listarea);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->result_array();
	 	}else{
	 		return false;
	 	}
	}

	function getOtNroyDurStdTarea($id_listarea){


		$this->db->select('tbl_listarea.id_listarea,
							tbl_listarea.id_orden,
							tbl_listarea.id_tarea,
							tbl_listarea.duracion_prog,
							orden_trabajo.nro AS nroOT,
							tareas.duracion_std');
		$this->db->from('tbl_listarea');
		$this->db->join('orden_trabajo', 'orden_trabajo.id_orden = tbl_listarea.id_orden');
		$this->db->join('tareas', 'tareas.id_tarea = tbl_listarea.id_tarea');

		$this->db->where('tbl_listarea.id_listarea',$id_listarea);
		$query = $this->db->get();

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
	}

	//devuelve el id de tarea estandar asociada a listarea
	function getTarea_idListarea($id_listarea){

		$this->db->select('tbl_listarea.id_tarea');
		$this->db->from('tbl_listarea');
		$this->db->where('tbl_listarea.id_listarea', $id_listarea);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('id_tarea');
	 	}else{
	 		return false;
	 	}
	}


	function getDatosBPM($idTarBonita,$param){

		// $response = file_get_contents(BONITA_URL.'API/bpm/humanTask/54', false, $param);
		// echo "response: ";
		// return $response;

		$urlResource = BONITA_URL.'API/bpm/humanTask/';

		$data = file_get_contents($urlResource.$idTarBonita , false, $param);


		return $data;
	}

	function getIdOtPorIdBPM($idTarBonita){

		$this->db->select('orden_trabajo.id_orden');
		$this->db->from('orden_trabajo');
		$this->db->where('orden_trabajo.bpm_task_id_plan', $idTarBonita);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('id_orden');
	 	}else{
	 		return 0;
	 	}
	}



//////////////  form dinamico  //////////////////

	// verifica que el form tenga todos los campos validado en 1
	function validarFormGuardado($idValor,$id_listarea){

		// $this->db->select('frm_formularios_completados.VALO_ID');
		// $this->db->from('frm_formularios_completados');
		// $this->db->where('frm_formularios_completados.VALIDADO', 0);	// no validado
		// $this->db->where('frm_formularios_completados.VALO_ID', $idValor);
		// $this->db->where('frm_formularios_completados.LITA_ID', $id_listarea);
		// $query = $this->db->get();

	 	// if ($query->num_rows() > 0){
	 	// 	return $query->row('VALO_ID');
	 	// }else{
	 	// 	return 0;
	 	// }

		// cuenta los campos que estan en 0 y son obligatorios
		 $sql ="SELECT
		 COUNT(*) as novalidos
		 FROM
		 frm_formularios_completados
		 WHERE
		 frm_formularios_completados.LITA_ID = $id_listarea AND
		 VALIDADO = 0";

		 $query = $this->db->query($sql);

		 if( $query->row('novalidos') > 0 ){

	     	return false;
	     }
	     else{
	     	return true;
	     }
	}

	// Comprueba si hay form guardado asoc a id de orden y de tarea
	function getEstadoForm($bpm_task_id){
		$this->db->select('frm_formularios_completados.LITA_ID');
		$this->db->from('frm_formularios_completados');
		$this->db->where('frm_formularios_completados.LITA_ID', $bpm_task_id);
		$query = $this->db->get();

		if ($query->num_rows()>0){
	 		return true;
	 	}else{
	 		return false;
	 	}
	}

	// Trae form asoc a id de tarea
	function getFormTarea($id_tarea){

		$this->db->select('tareas.form_asoc');
		$this->db->from('tareas');
		$this->db->where('tareas.id_tarea', $id_tarea);

		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('form_asoc');
	 	}else{
	 		return false;
	 	}
	}

	// Devuelve form asociado a una tarea std
	function getIdFormPorIdTareaSTD($idTareaStd){

		$this->db->select('tareas.form_asoc');
		$this->db->from('tareas');
		$this->db->where('tareas.id_tarea', $idTareaStd);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('form_asoc');
	 	}else{
	 		return 0;
	 	}
	}

	// devuelve id tarea y form asociado por nomb de tarea BPM
	function getidFormTareaBPM($nomtarea){

		$this->db->select('tareas.id_tarea,
							tareas.form_asoc');
		$this->db->from('tareas');
		$this->db->where('tareas.descripcion', $nomtarea);
		$query = $this->db->get();

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
	}

	// Trae form para dibujar pantalla (agregar where de id de form)
	function get_form($bpm_task_id,$idFormAsoc){

		// para buscar buscar por id de form agregar:

		// $sql = "SELECT	form.form_id,
			// 	form.nombre,
			// 	form.habilitado,
			// 	form.fec_creacion,
			// 	cate.NOMBRE AS nomCategoria,
			// 	cate.CATE_ID AS idCategoria,
			// 	grup.NOMBRE AS nomGrupo,
			// 	tida.NOMBRE AS nomTipoDatos,
			// 	grup.GRUP_ID AS idGrupo,
			// 	valo.NOMBRE AS nomValor,
			// 	valo.VALO_ID AS idValor,
			// 	valo.VALOR_DEFECTO,
			// 	valo.LONGITUD,
			// 	valo.OBLIGATORIO,
			// 	valo.PISTA
			// 	FROM
			// 	frm_formularios form,
			// 	frm_categorias cate,
			// 	frm_grupos grup ,
			// 	frm_tipos_dato tida,
			// 	frm_valores valo
			// 	where form.FORM_ID = cate.FORM_ID
			// 	AND cate.CATE_ID = grup.CATE_ID
			// 	AND grup.GRUP_ID = valo.GRUP_ID
			// 	AND tida.TIDA_ID = valo.TIDA_ID
			// 	AND form.form_id = $idFormAsoc
			// 	ORDER BY cate.ORDEN,grup.ORDEN,valo.ORDEN";

		$sql = "SELECT foco.FOCO_ID AS idValor,	
					foco.FORM_ID,
					foco.FORM_NOMBRE,
					'' AS habilitado,
					foco.FEC_CREACION,
					foco.CATE_NOMBRE AS nomCategoria,
					'' AS idCategoria,
					foco.GRUP_NOMBRE AS nomGrupo,
					foco.TIDA_NOMBRE AS nomTipoDatos,
					'' AS idGrupo,
					foco.VALO_NOMBRE AS nomValor,
					foco.TIDA_ID,
					
					foco.VALOR AS valDefecto,
					'' AS LONGITUD,
					'' AS OBLIGATORIO,
					'' AS PISTA
					FROM
					frm_formularios_completados foco
					where foco.FORM_ID = $idFormAsoc
					AND foco.LITA_ID = $bpm_task_id
					ORDER BY foco.ORDEN";

		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
	}

	// Trae valores validos por ID de formularios
	function getValValidos($idForm){

		$sql = "SELECT
				frm_grupos.GRUP_ID,
				frm_valores.NOMBRE,
				frm_valores.VALO_ID As idValor,
				frm_valores_validos.VALOR,
				frm_valores_validos.VAPO_ID As idvalvalido
				FROM
				frm_valores_validos
				INNER JOIN frm_valores ON frm_valores_validos.VALO_ID = frm_valores.VALO_ID
				INNER JOIN frm_grupos ON frm_valores.GRUP_ID = frm_grupos.GRUP_ID
				INNER JOIN frm_categorias ON frm_grupos.CATE_ID = frm_categorias.CATE_ID

				WHERE frm_categorias.FORM_ID = $idForm";

		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
	}

	// devuelve array con id de valor y url de la imag
	function getImgValor($idForm,$idPedTrabajo){
		//frm_formularios_completados.VALO_ID AS valoid,
		$sql ="SELECT
				frm_formularios_completados.FOCO_ID AS valoid,
				
				frm_formularios_completados.VALOR As valor
				FROM
				frm_formularios_completados
				WHERE
				frm_formularios_completados.FORM_ID = $idForm AND
				frm_formularios_completados.TIDA_NOMBRE = 'input_archivo'
				AND PETR_ID = $idPedTrabajo";
		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
	}

	// Trae configuracion de form inicial para guardar en frm_frm_completados
	function getFormInicial($idFormAsoc){
		// trae i de tarea estandar por id listarea
		//$id_tarea = $this->getTarea_idListarea($id_listarea);
		// trae id de form asociado a tarea

		//$idFormAsoc = $this->getFormTarea($id_tarea);


		$sql = "SELECT
				form.form_id AS FORM_ID,
				form.nombre AS FORM_NOMBRE,
				form.fec_creacion AS FEC_CREACION,
				cate.NOMBRE AS CATE_NOMBRE,
				grup.NOMBRE AS GRUP_NOMBRE,
				tida.NOMBRE AS TIDA_NOMBRE,
				tida.TIDA_ID AS TIDA_ID,
				valo.NOMBRE AS VALO_NOMBRE,
				valo.VALO_ID AS VALO_ID,
				valo.ORDEN AS ORDEN
				FROM
				frm_formularios form,
				frm_categorias cate,
				frm_grupos grup ,
				frm_tipos_dato tida,
				frm_valores valo
				where form.FORM_ID = cate.FORM_ID
				AND cate.CATE_ID = grup.CATE_ID
				AND grup.GRUP_ID = valo.GRUP_ID
				AND tida.TIDA_ID = valo.TIDA_ID
				AND form.form_id = $idFormAsoc
				ORDER BY cate.ORDEN,grup.ORDEN,valo.ORDEN";

		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
	}

	// Guarda la configuracion inicial del formulario
	function setFormInicial($bpm_task_id,$idFormAsoc,$ptr_id) { //$id_listarea){

		$userdata = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId'];     // guarda usuario logueado
        $i=0;
        $dat= array();

        // Trae la info del form sin valores validos desp se actualiza al guardar
        $form = $this->getFormInicial($idFormAsoc); //$id_listarea);

        // Agrego id de usuario y ptr_id al array para insertar
        foreach ($form as $key) {

        	$key['USUARIO'] = $usrId;
			$key['LITA_ID'] = $bpm_task_id; //$id_listarea;
			$key['PETR_ID'] = $ptr_id;
        	$i++;
        	$dat[$i] =  $key;
        }

        $response = $this->db->insert_batch('frm_formularios_completados', $dat);
	}


	function setPtrIdEnFormsCompletados($pedTrab,$idTarBonita){
		$this->db->where('LITA_ID', $idTarBonita);	//
		$response = $this->db->update('PETR_ID', $pedTrab);
		return $response;
	}

	// devuelve ptrId por id de OT
	function getPtridPorIdOT($idOT){

		$this->db->select('orden_trabajo.petr_id');
		$this->db->from('orden_trabajo');
		$this->db->where('orden_trabajo.id_orden', $idOT);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('petr_id');
	 	}else{
	 		return 0;
	 	}
	}

	// Arma array p/ insertar en frm_formularios_completados por focoId
	function getDatos($focoId){
				
		$sql ="SELECT frm_formularios_completados.*
		FROM frm_formularios_completados
		WHERE FOCO_ID = $focoId";	
		$query= $this->db->query($sql);
		
		foreach ($query->result_array() as $row){
	        $response['FORM_ID'] = $row['FORM_ID'];
	        $response['FORM_NOMBRE'] = $row['FORM_NOMBRE'];
	        $response['CATE_NOMBRE'] = $row['CATE_NOMBRE'];
	        $response['GRUP_NOMBRE'] = $row['GRUP_NOMBRE'];
	        $response['VALO_NOMBRE'] = $row['VALO_NOMBRE'];
	        $response['TIDA_NOMBRE'] = $row['TIDA_NOMBRE'];
	        $response['VALOR'] 		 = $row['VALOR'];
		}

		return $response;
	}

	// Inserta datos de Form en frm_formularios_completados
	function UpdateForm($datos,$key){

		$this->db->where('FOCO_ID', $key);	
		$response = $this->db->update('frm_formularios_completados', $datos);
		return $response;
	}

		//ARCHIVO
		function GuardarCotizacion($idPedido,$data){
			$this->db->where('PETR_ID',$idPedido);
			$result = $this->db->update('frm_formularios_completados',$data);
			return $result;
		}
		//ARCHIVO

		//Ver Cotizacion en Presupuesto
		function ObtenerCotizacion($idPedido){
				$this->db->select('VALOR');
				$this->db->where('PETR_ID',$idPedido);
				$this->db->where('NOM_VAR',"cotizacion");
				$query = $this->db->get('frm_formularios_completados');
				if($query->num_rows()!=0){
					return $query->result_array()[0]['VALOR'];
				}else{
					return '';
				}

			}


	/**
     * Tarea::tareasPorSector()
     * Método que muestra el listado de tareas a evaluar por el coordinador.
     *
     * @return   Tareas
     */
	function tareasPorSector($idTarBonita){
		$idOT     = $this->getIdOTPorCaseId($idTarBonita);
		$userdata = $this->session->userdata('user_data');
		$usrNick  = $userdata[0]["usrNick"];
		$rolId    = $userdata[0]["rolId"];
		// TODO: validar que el usuario sea coordinador
		//$clave    = array_search(46, $rolId);//rol46=coordinador
		$this->db->select('
			tareas.form_asoc, tareas.id_tarea,
			tbl_listarea.id_listarea, tbl_listarea.id_orden, tbl_listarea.tareadescrip, tbl_listarea.fecha, tbl_listarea.id_usuario, tbl_listarea.id_equipo, tbl_listarea.estado, tbl_listarea.bpm_task_id,
			tbl_subsector.usuario_coordinador, tbl_subsector.descripcion AS subsector_descripcion,
			tbl_equipos.id_subsector,
			orden_trabajo.descripcion as orden_descripcion');
		$this->db->from('tbl_subsector');
		$this->db->join('tbl_equipos', 'tbl_subsector.id_subsector = tbl_equipos.id_subsector');
		$this->db->join('tbl_listarea', 'tbl_listarea.id_equipo = tbl_equipos.id_equipo');
		$this->db->join('tareas', 'tareas.id_tarea = tbl_listarea.id_tarea');
		$this->db->join('orden_trabajo', 'orden_trabajo.id_orden = tbl_listarea.id_orden');
		$this->db->where('tbl_subsector.usuario_coordinador', $usrNick);
		// TODO: Agrupar por orden de trabajo!!!
		$this->db->where('orden_trabajo.id_orden', $idOT);
		$query = $this->db->get();
		return $query->result_array();
	}

			/**
     * Preinforme::index()
     * Método que muestra el listado de diagnósticos a evaluar por el coordinador.
     *
     * @param   Array   $parametros  Devuleve los parametros para ser usados en ejecuciones API REST.
     *
     * @return   Tareas
     */
	function rehacerTareaIds($parametros, $idsTareaTrazajob, $idTarBonita)
    {
		//$parametros = stream_context_create($parametros);
        $dataBPM = array(
            "idTareaTrazajobs" => $idsTareaTrazajob
        );
        $parametros["http"]["method"]  = "POST";
        $parametros["http"]["content"] = json_encode($dataBPM);
        $contexto                      = stream_context_create($parametros);
        //dump($parametros);
        $method   = '/execution';
        $resource = 'API/bpm/userTask/';
        $url      = BONITA_URL.$resource.$idTarBonita.$method;
        file_get_contents($url, false, $contexto);
        $response = $this->parseHeaders( $http_response_header );
        //dump($response);
		return $response;
    }


    public function GuardarValorPresupuesto($data){
			$this->db->where('PETR_ID',$data['PETR_ID']);
			$this->db->where('FORM_ID',$data['FORM_ID']);
			$query = $this->db->update('frm_formularios_completados',array('NOM_VAR'=>'presupuesto'));
			return $query;
		}

		public function GuardarValorCotizacion($data){
			$this->db->where('PETR_ID',$data['PETR_ID']);
			$this->db->where('FORM_ID',$data['FORM_ID']);
			$query = $this->db->update('frm_formularios_completados',array('NOM_VAR'=>'cotizacion'));
			return $query;
		}

		public function GuardarValorInfoTecnico($data){
			$this->db->where('PETR_ID',$data['PETR_ID']);
			$this->db->where('FORM_ID',$data['FORM_ID']);
			$query = $this->db->update('frm_formularios_completados',array('NOM_VAR'=>'infotecnico'));
			return $query;
		}

    /*function getIdListTarea($idTareaRevisionB)
    {
    	$this->db->select('tbl_listarea.id_listarea');
		$this->db->from('tbl_listarea');
		$this->db->where('tbl_listarea.bpm_task_id', $idTareaStd);
		//$this->db->where('tbl_listarea.id_orden', $idOT);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('id_listarea');
	 	}else{
	 		return 0;
	 	}
    }*/

}
