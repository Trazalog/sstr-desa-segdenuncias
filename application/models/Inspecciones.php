<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Inspecciones extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	// Devuelve inspecciones en estado Curso 
	function Listado_Inspecciones(){

		$this->db->select('*,concat(C.establecalle," - ",C.establealtura," - ",E.localidad) as direccionCompleta');
		$this->db->from('tbl_inspecciones as A');
		$this->db->join('tbl_inspectores as B','A.inspectorid=B.inspectorid');
		$this->db->join('tbl_establecimiento as C','A.estableid=C.estableid');
		$this->db->join('tbl_empleadores D','C.empleaid=D.empleaid');
		$this->db->join('localidades as E','C.dptoid=E.id');
		$this->db->where('A.inspeestado= "C" ');		
		$query=$this->db->get();
		if ($query->num_rows()!=0)    
		{
			return $query->result_array();	
		}
		else{
				return array();
			}
	}
		// Devuelve inspecciones en estado Curso 
		function Listado_Inspecciones_por_Fecha($fi,$ff){

			$this->db->select('*,concat(C.establecalle," - ",C.establealtura," - ",E.localidad) as direccionCompleta');
			$this->db->from('tbl_inspecciones as A');
			$this->db->join('tbl_inspectores as B','A.inspectorid=B.inspectorid');
			$this->db->join('tbl_establecimiento as C','A.estableid=C.estableid');
			$this->db->join('tbl_empleadores D','C.empleaid=D.empleaid');
			$this->db->join('localidades as E','C.dptoid=E.id');
			$this->db->where('A.inspeestado= "C" ');		
			$this->db->where('date(A.inspeccionfecharecp)>=',$fi);$this->db->where('date(A.inspeccionfecharecp)<=',$ff);
			$query=$this->db->get();
			if ($query->num_rows()!=0)    
			{
				return $query->result_array();	
			}
			else{
					return array();
			}
		}
	// Devuelve establecimientos por ID de empleadores Activos
	function getEstablecimientos($id){

		$this->db->select('tbl_establecimiento.estableid,
											concat(establecalle," ",establealtura,"-",localidad) as establecalle');
		$this->db->from('tbl_establecimiento');
		$this->db->join('localidades',"localidades.id = tbl_establecimiento.dptoid");
		$this->db->where('empleaid',$id);
		$this->db->where('tbl_establecimiento.estableestado', 'AC');
		$query=$this->db->get();
		if ($query->num_rows()!=0){
			return $query->result_array();
		}	   
	}
	// Devuelve empleadores Activos
	function getDenominacionSocial(){

		$this->db->select('tbl_empleadores.empleaid,tbl_empleadores.emplearazsoc');
		$this->db->from('tbl_empleadores');
		$this->db->where('tbl_empleadores.empleaestado', 'AC');
		$query = $this->db->get();				
		$i=0;
		foreach ($query->result() as $row){
			$empleadores[$i]['label'] = $row->emplearazsoc;
			$empleadores[$i]['id'] = $row->empleaid;
			$i++;
		}
		return $empleadores;
	}
	// Devuelve inspecciones por ID
	function Obtener_Inspecciones($id){
		$this->db->where('inspeccionid', $id);
		$query=$this->db->get('tbl_inspecciones');
		
		if ($query->num_rows()!=0)
		{   
			return $query->result_array();  
		}
	}

	function Modificar_Inspecciones($data){

		$query =$this->db->update('tbl_inspecciones', $data, array('inspeccionid' => $data['inspeccionid']));
		return $query;
	}

	function Eliminar_Inspecciones($id){
	
		$this->db->set('inspeestado', 'AN');
		$this->db->where('inspeccionid', $id);
		$query=$this->db->update('tbl_inspecciones');
		return $query;

	}
	

	
	/* FUNCIONES NUEVAS */
	// trae detalle de inspeccion
	function getGetDetaInspeccion(){

	}

	// trae todos los inspectores 
	function getInspector(){
		$this->db->select('tbl_inspectores.inspectorid, tbl_inspectores.inspectornombre');
		$this->db->from('tbl_inspectores');	
		$query=$this->db->get();
		if ($query->num_rows()!=0){
			return $query->result_array();
		}	
	}
	
	function getDenPorEstabIds($idEstab){		

		$this->db->select('tbl_denuncias.denunciaid,
											tbl_denuncias.denunciasfecha,
											tbl_denuncias.denunciariesgo,
											tbl_denuncias.denunciaprograma,
											tbl_denuncias.denunciafechaverif,
											tbl_denuncias.denunciainclucion,
											tbl_denuncias.denuncianroobra,
											tbl_denuncias.denuncianroacta,
											tbl_denuncias.denunciamotivos,
											tbl_denuncias.estableid,
											tbl_denuncias.denunciaestado');
		$this->db->from('tbl_denuncias');
		$this->db->where('tbl_denuncias.estableid', $idEstab);
		$query = $this->db->get();
		if ($query->num_rows()!=0){   
			return $query->result_array();  
		}
	}

	// guarda inspecciones nuevas
	function Guardar_Inspecciones($data){

		$query = $this->db->insert("tbl_inspecciones",$data);
		$idIns = $this->db->insert_id();
		return $idIns;
	}

	// guarda la relacion de denuncias en inspecciones
	function setInsDenIds($datosInspDenun){
		$response = $this->db->insert_batch('trg_inspecciondenuncia', $datosInspDenun);
		return $response;
	}

	// lanza proceso en BPM
	function lanzarProcesoBPM($param){
		$resource = 'API/bpm/process/';
		$url = BONITA_URL.$resource;
		$com = '/instantiation';
		try {
			$result = file_get_contents($url.BPM_PROCESS_ID.$com, false, $param);
		} catch (Exception $e) {
			echo 'Excepción capturada: ',  $e->getMessage(), "\n";
			echo 'respuestas: ';
			var_dump( $http_response_header);
		} 
			
		return $result;
	}

	// devuelve inspecciones por tipo acta o accion
	function getInspeccionesCriterio($data,$idInspector){		
	
		$this->db->select('tbl_inspecciones.*,
											concat(tbl_establecimiento.establecalle, " ",tbl_establecimiento.establealtura) as direccion,
											tbl_inspectores.inspectornombre,
											tbl_empleadores.emplearazsoc,
											tbl_empleadores.empleaid');
		$this->db->from('tbl_inspecciones');
		$this->db->join('tbl_establecimiento', 'tbl_inspecciones.estableid = tbl_establecimiento.estableid');
		$this->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');
		$this->db->join('tbl_inspectores', 'tbl_inspecciones.inspectorid = tbl_inspectores.inspectorid');
		
		if( ($data == 'inspeccion') || ($data == 'verificacion') || ($data == 'suspension') ){
			$this->db->where('tbl_inspecciones.tipoacta', $data);
		}
		if( ($data =='cierre-acta') || ($data =='ampliacion-plazo') || ($data =='infraccion') ){
			$this->db->where('tbl_inspecciones.accion', $data);
		}			
		if( ($data == 'inspectorAsignado') ){
			$this->db->where('tbl_inspecciones.inspectorid', $idInspector);
		}

		$query = $this->db->get();
		if ($query->num_rows()!=0){   
			return $query->result_array();  
		}
	}

	// devuelve listado de inspecciones por id de denuncia
	function listInspPorDenuncia($idDenuncia){
	
		$this->db->select('*,concat(tbl_establecimiento.establecalle," - ",tbl_establecimiento.establealtura," - ",localidades.localidad) as direccionCompleta');
		$this->db->from('tbl_inspecciones');
		$this->db->join('tbl_inspectores', 'tbl_inspecciones.inspectorid = tbl_inspectores.inspectorid');
		$this->db->join('tbl_establecimiento', 'tbl_inspecciones.estableid = tbl_establecimiento.estableid');
		$this->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');
		$this->db->join('localidades', 'localidades.id = tbl_establecimiento.provid');
		$this->db->join('provincias', 'provincias.id = localidades.id_privincia');
		$this->db->join('trg_inspecciondenuncia', 'tbl_inspecciones.inspeccionid = trg_inspecciondenuncia.inspeccionid');
		$this->db->where('tbl_inspecciones.inspeestado= "C" ');
		$this->db->where('trg_inspecciondenuncia.denunciaid', $idDenuncia);
			
		$query=$this->db->get();
		if ($query->num_rows()!=0)    
		{
			return $query->result_array();	
		}
		else{
				return array();
			}
	}

	




}	

?>