<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Otrabajos extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function otrabajos_List(){

		$this->db->select('orden_trabajo.id_orden, orden_trabajo.nro,orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, orden_trabajo.fecha_aviso, orden_trabajo.fecha_entregada, orden_trabajo.descripcion, orden_trabajo.cliId, orden_trabajo.estado, orden_trabajo. id_usuario, orden_trabajo.id_usuario_a, user1.usrName AS nombre, orden_trabajo.id_usuario_e, orden_trabajo.id_sucursal, admcustomers.cliLastName,admcustomers.cliName, sisusers.usrName,sucursal.descripc, sisgroups.grpId');
		$this->db->from('orden_trabajo');
		$this->db->join('admcustomers', 'admcustomers.cliId = orden_trabajo.cliId');
		$this->db->join('sisusers', 'sisusers.usrId = orden_trabajo.id_usuario');
		$this->db->join('sisusers AS user1', 'user1.usrId = orden_trabajo.id_usuario_a');
		$this->db->join('sucursal', 'sucursal.id_sucursal = orden_trabajo.id_sucursal');
		$this->db->join('sisgroups', 'sisgroups.grpId = sisusers.grpId');
		$this->db->group_by('orden_trabajo.id_orden');
						
		$query= $this->db->get();
		
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{	
			return false;
		}
	}

	
	
	function getotrabajos($data = null){

		if($data == null)
		{
			return false;
		}
		else
		{
			$action = $data['act'];
			$otid = $data['id'];
			$data = array();
			$query= $this->db->get_where('orden_trabajo',array('id_orden'=>$otid));

			if ($query->num_rows() != 0)
			{
				
				$f = $query->result_array();
				$data['ot'] = $f[0];
			} else {
				$ot = array();
				$ot['nro'] = '';
				$ot['fecha_inicio'] = '';
				$ot['fecha_fecha_entrega'] = '';
				$ot['descripcion'] = '';
				$ot['cliId'] = '';
				$ot['estado'] = '';
				$ot['id_usuario'] = '';
				$ot['id_sucursal'] = '';
				$data['ot'] = $ot;
			}

			//Readonly
			$readonly = false;
			if($action == 'Del' || $action == 'View'){
				$readonly = true;
			}
			$data['read'] = $readonly;
				$query= $this->db->get('sucursal');
			if ($query->num_rows() != 0)
			{
				$data['sucursal'] = $query->result_array();	
			}

				$query= $this->db->get('admcustomers');
			if ($query->num_rows() != 0)
			{
				$data['clientes'] = $query->result_array();	
			}
			

			return $data;
		}
	}
	
	function setotrabajos($data = null){

		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
			$nro = $data['nro'];
			$fech = $data['fech'];
			$deta = $data['deta'];
			$sucid = $data['sucid'];
			$act = $data['act'];
			$cli=$data['cli'];
			$usu=1;
			$estado='C';

			$data = array(
					   'nro' => $nro,
					    'fecha_inicio' => $fech,
					    'descripcion' => $deta,
					    'id_sucursal' => $sucid,
					     'cliId' => $cli,
					     'id_usuario' => $usu,
					     'id_usuario_a' => $usu,
					      'id_usuario_e' => $usu,
					      'estado' => $estado
					   
					);

			switch($act)
			{
				case 'Add':
					//Agregar familia
					if($this->db->insert('orden_trabajo', $data) == false) {
						return false;
					}
					break;

				case 'Edit':
					//Actualizar nombre
					if($this->db->update('orden_trabajo', $data, array('id_orden'=>$id)) == false) {
						return false;
					}
					break;

				case 'Del':
					//Eliminar familia
					if($this->db->delete('orden_trabajo', $data, array('id_orden'=>$id)) == false) {
						return false;
					}
					
					break;
			}

			return true;

		}
	}

	function getasigna($id){

	    $sql="SELECT * 
	    	  FROM orden_trabajo
	    	  JOIN admcustomers ON admcustomers.cliId= orden_trabajo.cliId
	    	  WHERE id_orden=$id
	    	  ";
	    
	    $query= $this->db->query($sql);
	    
	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();	
	    } 
	    else {
	      return 0;
	    }
	}
	//PEDIDOS
	function getorden($id){

	    $sql="SELECT * 
	    	  FROM orden_pedido
	    	  WHERE id_orden=$id
	    	  ";
	    
	    $query= $this->db->query($sql);

	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();	
	    } 
	    else {
	      return 0;
	    }
	}

	//pediso a entregar x fecha
	function getpedidos($id){

	    $sql="SELECT * 
	    	  FROM orden_trabajo
	    	  JOIN admcustomers ON admcustomers.cliId= orden_trabajo.cliId
	    	  WHERE id_orden=$id
	    	  ";
	    
	    $query= $this->db->query($sql);  
	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();	
	    } 
	    else {
	      return 0;
	    }
	}

	function getcliente($data = null){

		if($data == null)
		{
			return false;
		}
		else{
			
			$idcli = $data['idcliente'];
			//Datos del usuario
			$query= $this->db->get_where('admcustomers',array('cliId'=>$idcli));
			if($query->num_rows()>0){
                return $query->result();
            }
            else{
                return false;
            }
			
		}
		
	}
	//esto se cambio para subir 
	function getusuario(){

		$query= $this->db->get_where('sisusers');
		if($query->num_rows()>0){
	        return $query->result();
	    }
	    else{
	        return false;
	    }		
	}

	/*	  function getusuario(){
        $query = $this->db->query("SELECT * FROM sisusers");
        $i=0;
        foreach ($query->result() as $row)
        {	
        	$insumos[$i]['label'] = $row->usrName;
            $insumos[$i]['value'] = $row->usrId;
            $i++;
        }
        return $insumos;
    }*/



	function traer_sucursal(){

		$query= $this->db->get_where('sucursal');
		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }		
	}

	function traer_cli(){
			
        $sql="SELECT * 
    	  FROM admcustomers
    	  WHERE estado= 'C'
    	 
    	  ";
	    $query= $this->db->query($sql);   
	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();	
	    } 
	    else {
	      return false;
	    }
		
	}

	function getnums($id){

		$query= "SELECT id_orden
	        FROM orden_pedido
	        WHERE nro_trabajo=$id";

		$query= $this->db->query($sql);

		if($query!=""){

			foreach ($query->result_array() as $row){		
			$data = $row['id_orden'];
			}
		return $data;
		}
		else
			{
			return 0;
			}

	}

	function getproveedor(){

		$query= $this->db->get_where('abmproveedores');
		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }	
	}
	
	function agregar_usuario($data){
                   
        $query = $this->db->insert("sisusers",$data);
    	return $query;
        
    }
    
	function guardar_agregar($data){
                   
        $query = $this->db->insert("orden_trabajo",$data);
    	return $query;
        
    }

    function agregar_pedidos($data){
                   
        $query = $this->db->insert("orden_pedido",$data);
    	return $query;
        
    }
        
    function update_guardar($id, $datos){

        $this->db->where('id_orden', $id);
        $query = $this->db->update("orden_trabajo",$datos);
        return $query;
    }

    
    function update_ordtrab($id, $datos){
         
        $this->db->where('id_orden', $id);
        $query = $this->db->update("orden_trabajo",$datos);
        return $query;
    }
		
		// seleccionar el grupo
	function getgrupo(){

       $query= $this->db->get_where('sisgroups');
		if($query->num_rows()>0){
			 return $query->result();
        }
        else{
            return false;
        }
		
	}

	//insertar pedido 
	function insert_pedido($data)
    {
        $query = $this->db->insert("orden_pedido",$data);
        return $query;
    }

   	


	function get_pedido($id){

		$query= "SELECT *
				 FROM orden_pedido 
				 WHERE id_orden=$id";

        $result = $this->db->query($query);
		if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
		
	}
	//agrega proveedor
	function agregar_proveedor($data){
                   
        $query = $this->db->insert("proveedores",$data);
    	return $query;
        
    }

    function getdatos($m){ //id_trabajo

		$sql= "SELECT orden_pedido.*,abmproveedores.provnombre
		FROM orden_pedido
		jOIN abmproveedores ON abmproveedores.provid=orden_pedido.id_proveedor
		

		WHERE orden_pedido.id_trabajo= $m  

		 ";

		$query= $this->db->query($sql);

		if($query->num_rows()>0){
                return $query->result();
            }
            else{
                return false;
         }
		
	}
	  
	function eliminacion($data){

       	$this->db->where('id_orden', $data);
		$query =$this->db->delete('orden_trabajo');
        return $query;
    }

    function update_cambio($idequipo,$fecha){

    	$consulta= "UPDATE orden_trabajo SET estado='T',
    										fecha_terminada='$fecha'
                               
				WHERE id_orden=$idequipo" ;

		$query= $this->db->query($consulta);
        
		return $query;

    }

	function update_edita($idequipo,$data) {


        $this->db->where('id_orden', $idequipo);
        $query = $this->db->update("orden_trabajo",$data);
        return $query;

    }
    function getpencil($id){ 
    //JOIN grupo ON grupo.id_grupo=equipos.id_grupo
	    $sql="SELECT orden_trabajo.nro, orden_trabajo.fecha_inicio,orden_trabajo.descripcion,orden_trabajo.cliId, orden_trabajo.estado, orden_trabajo.id_usuario, orden_trabajo.id_usuario_a, orden_trabajo.id_usuario, sucursal.descripc, admcustomers.cliName,admcustomers.cliLastName, sisusers.usrNick,abmproveedores.provid,  abmproveedores.provnombre
	    	  FROM orden_trabajo
	    	  JOIN admcustomers ON admcustomers.cliId=orden_trabajo.cliId
	    	  JOIN sucursal ON sucursal.id_sucursal=orden_trabajo.id_sucursal
	    	  jOIN sisusers ON sisusers.usrId=orden_trabajo.id_usuario
	    	  JOIN abmproveedores ON abmproveedores.provid= orden_trabajo.id_proveedor
	    	 
	    	  WHERE orden_trabajo.id_orden=$id
	    	  ";
	    
	    $query= $this->db->query($sql);
	    
	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();	
	    } 
	    else {
	      return 0;
	    }
	 }

	function getArticulos(){

		$sql= "SELECT *
			FROM sisusers
			
			"; //
			$query= $this->db->query($sql);

        //$query = $this->db->query("SELECT `artId`, `artBarCode` FROM `articles`");
        $i=0;
        foreach ($query->result() as $row)
        {	
        	$insumos[$i]['label'] = $row->usrName;
            $insumos[$i]['value'] = $row->usrId;
            
            
            $i++;
        }
        return $insumos;
    }

    function EliminarTareas($idor,$data){
    	
        $this->db->where('id_listarea', $idor);
        $query = $this->db->update("tbl_listarea",$data);
        return $query;

    }



    function ModificarFechas($idta,$datos){
    	
        $this->db->where('id_listarea', $idta);
        $query = $this->db->update("tbl_listarea",$datos);
        return $query;

    }
    
    function CambioParcials($idor,$datos){
    	
        $this->db->where('id_orden', $idor);
        $query = $this->db->update("orden_trabajo",$datos);
        return $query;

    }

 
    function agregar_pedidos_fecha($fecha,$id){
    	
        $this->db->where('id_orden', $id);
        $query = $this->db->update("orden_pedido",$fecha);
        return $query;

    }


    ///////// Calendario Hugo

/* Asignacion de Tareas */ 

    // Carga tareas en pantala asignacion por id de OT
	function cargartareas($idglob){

		// funcionando!!!!
			// $this->db->select('tbl_listarea.*,							
			// 					sisgroups.grpId,
			// 					sisusers.usrName,
			// 					sisusers.usrLastName,
			// 					tareas.duracion_std');
			// $this->db->from('tbl_listarea');
			// $this->db->join('sisusers', 'sisusers.usrId = tbl_listarea.id_usuario', 'left');
			// $this->db->join('sisgroups', 'sisgroups.grpId = sisusers.grpId', 'left');
			// $this->db->join('tareas', 'tareas.id_tarea = tbl_listarea.id_tarea');
			// $this->db->where('tbl_listarea.id_orden',$idglob);

		$this->db->select('tbl_listarea.*,
							tareas.duracion_std');
		$this->db->from('tbl_listarea');
		
		$this->db->join('tareas', 'tareas.id_tarea = tbl_listarea.id_tarea');
		$this->db->where('tbl_listarea.id_orden',$idglob);
		$this->db->where('tbl_listarea.estado !=', 'IN');

		
		$query= $this->db->get();

		if ($query->num_rows()!=0)
		{	
			return $query->result_array();
			
		}
		else
		{	
			return false;
		}
	} 

	// carga tareas para calendario segun id de BPM	
	function cargartareasParaAsignar($iort){
		//$idOt = $this->getidOTporIdTareaBonita($idTarBonita);
		// funcionando!!!!
		$this->db->select('tbl_listarea.*,							
							sisgroups.grpId,
							sisusers.usrName,
							sisusers.usrLastName,
							tareas.duracion_std');
		$this->db->from('tbl_listarea');
		$this->db->join('sisusers', 'sisusers.usrId = tbl_listarea.id_usuario', 'left');
		$this->db->join('sisgroups', 'sisgroups.grpId = sisusers.grpId', 'left');
		$this->db->join('tareas', 'tareas.id_tarea = tbl_listarea.id_tarea');
		$this->db->where('tbl_listarea.id_orden',$iort);
		
		$query= $this->db->get();

		if ($query->num_rows()!=0)
		{	
			return $query->result_array();
			
		}
		else
		{	
			return false;
		}
	}  

	//trae susuarios BPM para mostrar tareas en calendario 
	function getUsuariosBPM($param){
		// $resource = 'API/identity/user?f=group_id=19';
		$resource = 'API/identity/user?p=0&c=50';	 	
	 	$url = BONITA_URL.$resource;
		$usrs = file_get_contents($url, false, $param);
		return json_decode($usrs,true) ;
	}

	// devuelve el id de orden de trabajo segun el id de tarea guardado en la planificacion
	function getidOTporIdTareaBonita($idTarBonita){
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

	// devuelve id tarea bonita por id de orden trabajo
	function getIdBPMPorIdOt($idOT){		

		$this->db->select('orden_trabajo.bpm_task_id_plan AS idTarBonita');
		$this->db->from('orden_trabajo');
		$this->db->where('orden_trabajo.id_orden', $idOT);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('idTarBonita');	
	 	}else{	
	 		return 0;
	 	}
	}

    function getTareaSdt(){
    	$this->db->select('tareas.*');
		$this->db->from('tareas');
		$this->db->where('tareas.visible =', 1);
		$query = $this->db->get();
		
		if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }

    // trae equipos para asignar tareas 
    function getEquipos(){

		$this->db->select('tbl_equipos.*');
		$this->db->from('tbl_equipos');
		$query = $this->db->get();
		
		if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
	}

	// Trae plantillas de tareas
	function getPlantillas(){
		$this->db->select('plantilla.*');
		$this->db->from('plantilla');
		$query = $this->db->get();
		
		if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
	}

	// Trae tareas por id de plantillas
	function getTareasPlantillas($idPlantilla){
		
		$this->db->select('tareas.id_tarea,
							tareas.descripcion
							');
		$this->db->from('tbl_listplantilla');
		$this->db->join('plantilla', 'tbl_listplantilla.id_plantilla = plantilla.id_plantilla');
		$this->db->join('tareas', 'tbl_listplantilla.id_tarea = tareas.id_tarea');
		$this->db->where('plantilla.id_plantilla', $idPlantilla);
		$query = $this->db->get();
		
		if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
	}

	// Arma batch de datos para insertar en BD
	function armarBatch($numOT,$idsTareas){
		
		$batch = array();
		foreach ($idsTareas as $value) {
			$descrip = $this->getDesc($value);			
			$comp = array(
		                'id_orden' => $numOT,
		                'tareadescrip' => $descrip,
		                'id_tarea' => $value,
		                'estado'=> 'C'
		        		);			
			array_push($batch,$comp);
		}
		
		return $batch;		
	}

	// Devuelve descripcion de tareas por id
	function getDesc($value){
		
		$this->db->select('tareas.descripcion');
		$this->db->from('tareas');
		$this->db->where('tareas.id_tarea', $value);
		$query = $this->db->get();
		return $query->row('descripcion');
	}

	function setBatch($batch){
		$response = $this->db->insert_batch('tbl_listarea', $batch);
		return $response;
	}

	function setEquipos($id_listarea,$id_equipo){
		
		$this->db->where('id_listarea', $id_listarea);
		$response = $this->db->update('tbl_listarea', array('id_equipo' => $id_equipo));
	}

	// Asigna Usuario a Tarea - listo
    function ModificarUsuarios($idta,$datos){
    	
    	$datos['estado'] = 'AS';
        $this->db->where('id_listarea', $idta);
        $query = $this->db->update("tbl_listarea",$datos);
        return $query;
    }

    // Cambia estado a tarea realizada (por id de tarea) - listo 
    function TareaRealizadas($id, $datos){

        $this->db->where('id_tarea', $id);
        $query = $this->db->update("tbl_listarea",$datos);
        return $query;
    }




/* Programacion de tareas */

	// Trae subsectores para select
	function getSubsectores(){
    	$this->db->select('tbl_subsector.*');
        $this->db->from('tbl_subsector');       
        $query= $this->db->get();

        if ($query->num_rows() > 0)
        {
            return $query->result_array();             
        }
        else
        {
            return false;
        }
    }

    // Trae equipos de un sector por id de sector
    function getEquipPorIdSubsector($id_subsector){

   		$this->db->select('tbl_equipos.*');
        $this->db->from('tbl_equipos');
        $this->db->where('tbl_equipos.id_subsector', $id_subsector);  
        $query= $this->db->get();

        if ($query->num_rows() > 0)
        {
            return $query->result_array();
        }
        else
        {
            return false;
        }
   	}

   	// Trae tareas por mes y por id de OT para calendario
    function getcalendTareas($data){
    	$month = $data['month'] + 1 ;
    	$idOrden = $data['idOrden'];    

		$sql = "SELECT
				tbl_listarea.id_listarea,
				tbl_listarea.id_orden,
				tbl_listarea.tareadescrip,
				tbl_listarea.id_tarea,
				tbl_listarea.fecha,
				tbl_listarea.id_equipo,
				tbl_listarea.estado,
				tbl_listarea.duracion_prog,
				tbl_equipos.descripcion AS equipoDescripcion,
				tareas.descripcion AS tareaDescripcion,
				tareas.duracion_std
				FROM
				tbl_listarea
				LEFT JOIN tbl_equipos ON tbl_equipos.id_equipo = tbl_listarea.id_equipo
				INNER JOIN tareas ON tbl_listarea.id_tarea = tareas.id_tarea
				WHERE
				(tbl_listarea.estado = 'PR' OR tbl_listarea.estado = 'AS')
				AND month(tbl_listarea.fecha)  = $month
				AND id_orden = $idOrden";
				
		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
    }

    // Tareasfitradas por sector y mes p/ Calendario - Listo
    function getcalendTareasSect($data){
    	
    	$month = $data['month'] + 1 ;    	
    	$idSubsector = $data['idSubsector'];
    	//$idequipo = $data['idequipo'];
    	//////

		// $this->db->select('tbl_listarea.id_listarea,
		// 					tbl_listarea.id_orden,
		// 					tbl_listarea.tareadescrip AS title,
		// 					tbl_listarea.id_tarea,
		// 					tbl_listarea.fecha AS start,
		// 					tbl_listarea.id_equipo,
		// 					tbl_listarea.estado,
		// 					tbl_subsector.id_subsector,
		// 					tbl_subsector.descripcion,
		// 					tbl_equipos.id_equipo,
		// 					tbl_equipos.descripcion,
		// 					tareas.id_tarea,
		// 					tareas.descripcion');
		// $this->db->from('tbl_listarea');
		// $this->db->join('tareas', 'tbl_listarea.id_tarea = tareas.id_tarea');
		// $this->db->join('tbl_equipos', 'tbl_equipos.id_equipo = tbl_listarea.id_equipo','left');
		// $this->db->join('tbl_subsector', 'tbl_equipos.id_subsector = tbl_subsector.id_subsector');		
		  
		//  //TODO: FALTA LOS WHERE E IF'S
		  
		// $this->db->where('month(tbl_listarea.fecha)', $month);
		// $this->db->where('tbl_equipos.id_subsector', $idSubsector);
		// $this->db->where('tbl_listarea.estado', 'AS');
		// $this->db->or_where('tbl_listarea.estado', 'PR'); 	
		

  //   	$this->db->select('tbl_listarea.id_listarea,
		// 					tbl_listarea.id_orden,
		// 					tbl_listarea.tareadescrip AS title,
		// 					tbl_listarea.id_tarea,
		// 					tbl_listarea.fecha AS start,
		// 					tbl_listarea.id_equipo,
		// 					tbl_listarea.estado,
		// 					tbl_subsector.id_subsector,
		// 					tbl_subsector.descripcion,
		// 					tbl_equipos.id_equipo,
		// 					tbl_equipos.descripcion,
		// 					tareas.id_tarea,
		// 					tareas.descripcion');
		// $this->db->from('tbl_listarea');
		// $this->db->join('tareas', 'tbl_listarea.id_tarea = tareas.id_tarea');
		// $this->db->join('tbl_equipos', 'tbl_equipos.id_equipo = tbl_listarea.id_equipo','left');
		// $this->db->join('tbl_subsector', 'tbl_equipos.id_subsector = tbl_subsector.id_subsector');			
		// $this->db->where('month(tbl_listarea.fecha)', $month);	
		
		// if ($idSubsector != -1) {	// hay sector
			
		// 	if ($idequipo != -1) {	// hay sector y equipo
		// 		$this->db->where('tbl_equipos.id_subsector', $idSubsector);
		// 		$this->db->where('tbl_equipos.id_equipo', $idequipo);
		// 	}else{				// hay sector y no equipo
		// 		$this->db->where('tbl_equipos.id_subsector', $idSubsector);
		// 	}
		// }	//no hay sector ni equipo
		
		// //$this->db->where('tbl_equipos.id_subsector', $idSubsector);
		// //$this->db->where('tbl_listarea.estado', 'AS');
		// $this->db->where('tbl_listarea.estado', 'PR'); 



		// $query = $this->db->get();
		// if($query->num_rows()>0){
		// return $query->result_array();
		// }
		// else{
		// 	return false;
		// }    					

    	/////

		if($idSubsector != -1){
			$sql = "SELECT
				tbl_listarea.id_listarea,
				tbl_listarea.id_orden,
				tbl_listarea.tareadescrip AS title,
				tbl_listarea.id_tarea,
				tbl_listarea.fecha AS start,
				tbl_listarea.id_equipo,
				tbl_listarea.estado,
				tbl_subsector.id_subsector,
				tbl_subsector.descripcion,
				tbl_equipos.id_equipo,
				tbl_equipos.descripcion,
				tareas.id_tarea,
				tareas.descripcion
				FROM
				tbl_listarea
				INNER JOIN tareas ON tbl_listarea.id_tarea = tareas.id_tarea
				LEFT JOIN tbl_equipos ON tbl_equipos.id_equipo = tbl_listarea.id_equipo
				INNER JOIN tbl_subsector ON tbl_equipos.id_subsector = tbl_subsector.id_subsector
				WHERE
				
				(tbl_listarea.estado = 'AS' OR tbl_listarea.estado = 'PR')  
				AND
				month(tbl_listarea.fecha) = $month
				AND
				tbl_equipos.id_subsector =  $idSubsector";
		}else{
			$sql = "SELECT
				tbl_listarea.id_listarea,
				tbl_listarea.id_orden,
				tbl_listarea.tareadescrip AS title,
				tbl_listarea.id_tarea,
				tbl_listarea.fecha AS start,
				tbl_listarea.id_equipo,
				tbl_listarea.estado,
				tbl_subsector.id_subsector,
				tbl_subsector.descripcion,
				tbl_equipos.id_equipo,
				tbl_equipos.descripcion,
				tareas.id_tarea,
				tareas.descripcion
				FROM
				tbl_listarea
				INNER JOIN tareas ON tbl_listarea.id_tarea = tareas.id_tarea
				LEFT JOIN tbl_equipos ON tbl_equipos.id_equipo = tbl_listarea.id_equipo
				INNER JOIN tbl_subsector ON tbl_equipos.id_subsector = tbl_subsector.id_subsector
				WHERE
				
				(tbl_listarea.estado = 'AS' OR tbl_listarea.estado = 'PR')  
				AND
				month(tbl_listarea.fecha) = $month";
		}
		//(tbl_listarea.estado = 'C' OR tbl_listarea.estado = 'AS')

		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }		
    }

    // Trae tareas filtradas por mes y por equipo p/ Calendario - Listo
    function getcalendTareasEquipo($data){
    	$month = $data['month'] + 1 ;    	
    	$idequipo = $data['idequipo'];
    			
    	$sql = "SELECT
				tbl_listarea.id_listarea,
				tbl_listarea.id_orden,
				tbl_listarea.tareadescrip AS title,
				tbl_listarea.id_tarea,
				tbl_listarea.fecha AS start,
				tbl_listarea.id_equipo,
				tbl_listarea.estado,
				tbl_subsector.id_subsector,
				tbl_subsector.descripcion,
				tbl_equipos.id_equipo,
				tbl_equipos.descripcion,
				tareas.id_tarea,
				tareas.descripcion
				FROM
				tbl_listarea
				INNER JOIN tareas ON tbl_listarea.id_tarea = tareas.id_tarea
				LEFT JOIN tbl_equipos ON tbl_equipos.id_equipo = tbl_listarea.id_equipo
				INNER JOIN tbl_subsector ON tbl_equipos.id_subsector = tbl_subsector.id_subsector
				WHERE
				(tbl_listarea.estado = 'C' OR tbl_listarea.estado = 'AS') 
				AND
				month(tbl_listarea.fecha) = $month
				AND
				tbl_equipos.id_equipo =  $idequipo";				

		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
    }


    // Actualiza el nuevo dia programado para una tarea
    function updateDiaProgTareas($id, $diaNuevo){
    	$this->db->set('fecha', $diaNuevo);
		$this->db->where('id_listarea', $id);
		$resposnse = $this->db->update('tbl_listarea');
		return $resposnse;
    }

    // Actualiza la nueva duracion de la Tarea en listareas
   	function updateDurTarea($id,$duracion){
		echo "id list: ";   
		var_dump($id);
		echo "duracion: ";
		   var_dump($duracion);
   		$this->db->set('duracion_prog', $duracion);
		$this->db->where('id_listarea', $id);
		$resposnse = $this->db->update('tbl_listarea');
		return $resposnse;
	}
	   

   	// Calendariza Tareas y equipos en calendario
   	function programTareas($datos){

   		$id = $datos['id_listarea'];
   		$data['id_tarea'] = $datos['id_tarea'];
   		$data['fecha'] = $datos['fecha'];
   		$data['duracion_prog'] = $datos['duracion_prog'];
   		$data['id_equipo'] = $datos['id_equipo'];
		$data['estado'] = 'PR';
		
		
		$this->db->where('id_listarea', $id);
		$resposnse = $this->db->update('tbl_listarea',$data);
		return $resposnse;
		//dump_exit($datos);
   	}

   	// Trae duracion STD de tareas 
   	function getDuracTareaSTD($idTarea){

  		$this->db->select('tareas.duracion_std');
  		$this->db->from('tareas');
  		$this->db->where('tareas.id_tarea',$idTarea);
  		$query = $this->db->get();
  		return $query->row('duracion_std');
  	}

   	/// Guarda tarea nueva 
    function agregar_tareas($datos) {

        $query = $this->db->insert("tbl_listarea",$datos);
        return $query;
    }



}	

?>