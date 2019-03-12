<?php defined('BASEPATH') OR exit('No direct script access allowed');

if(!function_exists('cargarCabecera')){
    
	function cargarCabecera($caseId)
	{
		$datos = getDatosCabecera($caseId);
		echoEmpresa($datos['result']);
		echoInspeccion($datos['resultInspecciones'], $datos['resultDenuncias']);
	}

	function getDatosCabecera($caseId)
	{
		$datos = null;
		// consulta para empleador y establecimiento
		$ci =& get_instance();			
		//load databse library
		$ci->load->database();			
		//get data from database	
		$ci->db->select('tbl_empleadores.*,
			tbl_establecimiento.establecalle,
			tbl_establecimiento.establealtura,
			tbl_establecimiento.dptoid,
			tbl_establecimiento.provid,
			tbl_inspecciones.bpm_id,
			tbl_establecimiento.establelongitud,
			provincias.provincia,
			localidades.localidad');
		$ci->db->from('tbl_establecimiento');
		$ci->db->join('tbl_inspecciones', 'tbl_inspecciones.estableid = tbl_establecimiento.estableid');
		$ci->db->join('tbl_empleadores', 'tbl_establecimiento.empleaid = tbl_empleadores.empleaid');
		$ci->db->join('provincias', 'provincias.id = tbl_establecimiento.provid');
		$ci->db->join('localidades', 'localidades.id = tbl_establecimiento.dptoid');
		$ci->db->where('tbl_inspecciones.bpm_id', $caseId);
		$query = $ci->db->get();
		if($query->num_rows() > 0)
		{
			$datos['result'] = $query->row_array();
		}

		// consulta para Inspecciones			
		$ci->db->select('trg_actas.actaid,trg_actas.acta,trg_actas.tipoActa AS tipo,trg_actas.accion AS accionacta,trg_actas.fechaProrroga,trg_actas.inspeccionid,tbl_inspecciones.*');
		$ci->db->from('trg_actas');
		$ci->db->join('tbl_inspecciones', 'tbl_inspecciones.inspeccionid = trg_actas.inspeccionid');			
		$ci->db->where('tbl_inspecciones.bpm_id',$caseId);
		$queryInspecciones = $ci->db->get();
		if ($queryInspecciones->num_rows()!=0){ 
			$datos['resultInspecciones'] = $queryInspecciones->result_array(); 
		} 

		//consulta para Denuncia 
		$ci->db->select('tbl_denuncias.*');
		$ci->db->from('tbl_denuncias');
		$ci->db->join('trg_inspecciondenuncia', 'tbl_denuncias.denunciaid = trg_inspecciondenuncia.denunciaid');
		$ci->db->join('tbl_inspecciones', 'tbl_inspecciones.inspeccionid = trg_inspecciondenuncia.inspeccionid');
		$ci->db->where('tbl_inspecciones.bpm_id',$caseId);

		$queryDenuncias = $ci->db->get();
		if ($queryDenuncias->num_rows()!=0){ 
			$datos['resultDenuncias'] = $queryDenuncias->result_array(); 
		} 

		return $datos;
	}

	function echoEmpresa($result)
	{
		echo '<div id="collapseDivCli" class="box box-default collapsed-box box-solid">
			<div class="box-header with-border">
				<h3 id="tituloInfo" class="box-title">Empresa: '.$result['empleacui'].' - '.$result['emplearazsoc'].' / Mas Detalles</h3>

				<div class="box-tools pull-right">
					<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" onclick="mostrarCliente()">
						<i class="fa fa-plus"></i>
					</button>
				</div><!-- /.box-tools -->
			</div><!-- /.box-header -->
			
			<div class="box-body">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-4">
						<div class="form-group">
							<label style="margin-top: 7px;">CUIT: </label>
							<input type="text" id="cuit" class="form-control" value="'.$result['empleacui'].'" disabled/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-4">
						<div class="form-group">
							<label style="margin-top: 7px;">Razón Social: </label>
							<input type="text" id="razon" class="form-control" value="'.$result['emplearazsoc'].'" disabled/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-4">
						<div class="form-group">
							<label style="margin-top: 7px;">Domicilio Legal: </label>
							<input type="text" id="domicilio" class="form-control" value="'.$result['empleadomiciliolegal'].'" disabled/>
						</div>
					</div>

					<div class="col-xs-12">
						<h3>Establecimiento</h3>		
					</div>	

					<div class="col-xs-12 col-sm-6 col-md-4">
						<div class="form-group">
							<label style="margin-top: 7px;">Calle: </label>
							<input type="text" id="calle" class="form-control" value="'.$result['establecalle'].'  '.$result['establealtura'].'" disabled/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-4">
						<div class="form-group">
							<label style="margin-top: 7px;">Localidad: </label>
							<input type="text" id="localidad" class="form-control" value="'.$result['localidad'].'" disabled/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-4">
						<div class="form-group">
							<label style="margin-top: 7px;">Provincia: </label>
							<input type="text" id="provincia" class="form-control" value="'.$result['provincia'].'" disabled/>
						</div>
					</div>
				</div>
			</div><!-- /.box-body -->
		</div>';
	}


	function echoInspeccion($resultInspecciones, $resultDenuncias)
	{
		echo '<div id="collapseDiv" class="box box-default collapsed-box box-solid">
			<div class="box-header with-border">
				<h3 id="pedidoInfo" class="box-title">Inspeccion Nº: '.$resultInspecciones[0]['inspeccionid'].'</h3> 

				<input type="text" id="idDenuncia" class="form-control hidden" value="'.$resultInspecciones[0]['inspeccionid'].'" disabled/>

				<div class="box-tools pull-right">
					<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" >
						<i class="fa fa-plus"></i>
					</button>
				</div><!-- /.box-tools -->
			</div>

			<div class="box-body">
				<div class="row">			
					<div class="col-xs-12 col-md-4">
						<div class="form-group">
							<label style="margin-top: 7px;">Fecha: </label>
							<input type="text" id="razon" class="form-control" value="'.$resultInspecciones[0]['inspeccionfechaasigna'].'" disabled/>
						</div>
					</div>
					<div class="col-xs-12 col-md-8">
						<label for="detalle">Detalle</label>
						<textarea class="form-control" id="detalle" rows="3" disabled> '.$resultInspecciones[0]['inspecciondescrip'].' </textarea>
					</div>


					<div class="col-xs-12">
						<h3>Actas</h3>
						<table class="table table-bordered table-hover" id="" width= 100%>
							<tr>
								<th>Tipo Acta</th>
								<th>Acción</th>
								<th >Fecha Prórroga</th>	
								<th>Adjunto</th>			
							</tr>';
							foreach ($resultInspecciones as $insp) {					
								echo '<tr>';
								echo '<td style="text-align: left" width="10%">'.$insp['tipo'].'</td>';
								echo '<td style="text-align: left" width="10%">'.$insp['accionacta'].'</td>';
								echo '<td style="text-align: left" width="10%">'.$insp['fechaProrroga'].'</td>';
								echo '<td style="text-align: left" width="10%"><a href="'.base_url().$insp['acta'].'" id="adjunto" target="_blank" >Ver Acta</a></td>';
								echo '</tr>';
							}
						echo '</table> 
					</div>

					<div class="col-xs-12">
						<h3>Denuncias</h3>
						<table class="table table-bordered table-hover" id="" width= 100%>
							<tr>
								<th>Nº Denuncia</th>
								<th >Fecha Acta</th>						
								<th>Motivos</th>			
							</tr>';
							foreach ($resultDenuncias as $f) {					
								echo '<tr>';					
								echo '<td style="text-align: left" width="10%">'.$f['denunciaid'].'</td>';	
								echo '<td style="text-align: left" width="10%">'.$f['denunciasfecha'].'</td>';						
								echo '<td style="text-align: left" width="10%">'.$f['denunciamotivos'].'</td>';
								echo '</tr>';						
							}
						echo '</table> 
					</div>	
				</div> <!-- /.row -->
			</div> <!-- /.box-body -->
		</div>';
	}




	function cargarCabeceraEditaActa($caseId)
	{
		$datos = getDatosCabecera($caseId);
		echoEmpresa($datos['result']);
		echoInspeccionEditaActa($datos['resultInspecciones'], $datos['resultDenuncias']);
	}

	function echoInspeccionEditaActa($resultInspecciones, $resultDenuncias)
	{
		echo '<div id="collapseDiv" class="box box-default box-solid">
			<div class="box-header with-border">
				<h3 id="pedidoInfo" class="box-title">Inspeccion Nº: '.$resultInspecciones[0]['inspeccionid'].'</h3> 

				<input type="text" id="idDenuncia" class="form-control hidden" value="'.$resultInspecciones[0]['inspeccionid'].'" disabled/>

				<div class="box-tools pull-right">
					<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" >
						<i class="fa fa-plus"></i>
					</button>
				</div><!-- /.box-tools -->
			</div>

			<div class="box-body">
				<div class="row">			
					<div class="col-xs-12 col-md-4">
						<div class="form-group">
							<label style="margin-top: 7px;">Fecha: </label>
							<input type="text" id="razon" class="form-control" value="'.$resultInspecciones[0]['inspeccionfechaasigna'].'" disabled/>
						</div>
					</div>
					<div class="col-xs-12 col-md-8">
						<label for="detalle">Detalle</label>
						<textarea class="form-control" id="detalle" rows="3" disabled> '.$resultInspecciones[0]['inspecciondescrip'].' </textarea>
					</div>


					<div class="col-xs-12">
						<hr><h3>Actas</h3>
						<table class="table table-bordered table-hover" id="tblActas" width= 100%>
							<thead>
								<tr>
									<th>Tipo Acta</th>
									<th>Acción</th>
									<th >Fecha Prórroga</th>	
									<th>Adjunto</th>			
								</tr>
							</thead>
							<tbody>';
								foreach ($resultInspecciones as $insp) {					
									echo '<tr data-idacta="'.$insp['actaid'].'">';
									echo '<td style="text-align: left" width="10%">'.$insp['tipo'].'</td>';
									echo '<td style="text-align: left" width="10%">'.$insp['accionacta'].'</td>';
									echo '<td style="text-align: left" width="10%">'.$insp['fechaProrroga'].'</td>';
									if($insp['acta'] == null || $insp['acta'] == '')
	                                {
	                                    echo '<td style="text-align: left" width="10%" class="accionAdjunto">
	                                        <i class="fa fa-plus-square agregaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Agregar adjunto de Acta"></i>';
	                                }
	                                else {
	                                    echo '<td style="text-align: left" width="10%" class="accionAdjunto">
	                                        <i class="fa fa-times-circle eliminaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Eliminar adjunto de Acta"></i>
	                                        <i class="fa fa-pencil editaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Editar adjunto de Acta"></i>
	                                        <a href="'.base_url().$insp['acta'].'" id="adjunto" target="_blank" >Ver Acta</a></td>';    
	                                }
									echo '</tr>';
								}
							echo '</tbody>
						</table> 
					</div>

					<div class="col-xs-12">
						<hr><h3>Denuncias</h3>
						<table class="table table-bordered table-hover" id="tblDenuncias" width= 100%>
							<thead>
								<tr>
									<th>Nº Denuncia</th>
									<th>Fecha Acta</th>						
									<th>Motivos</th>			
								</tr>
							</thead>
							<tbody>';
								foreach ($resultDenuncias as $f) {					
									echo '<tr>';					
									echo '<td style="text-align: left" width="10%">'.$f['denunciaid'].'</td>';	
									echo '<td style="text-align: left" width="10%">'.$f['denunciasfecha'].'</td>';						
									echo '<td style="text-align: left" width="10%">'.$f['denunciamotivos'].'</td>';
									echo '</tr>';						
								}
							echo '</tbody>
						</table> 
					</div>	
				</div> <!-- /.row -->
			</div> <!-- /.box-body -->
		</div>';
		echo '<script>
			$("#tblActas").DataTable({
				"aLengthMenu": [ 10, 25, 50, 100 ],
				"columnDefs": [ {
					"targets": [ 3 ], 
					"searchable": false
				},
				{
					"targets": [ 3 ], 
					"orderable": false
				} ],
				"order": [[2, "asc"]],
			});
			$("#tblDenuncias").DataTable({
				"aLengthMenu": [ 10, 25, 50, 100 ],
				"order": [[0, "asc"]],
			});
		</script>';
	}
} 
