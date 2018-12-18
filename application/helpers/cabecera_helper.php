<?php defined('BASEPATH') OR exit('No direct script access allowed');

if(!function_exists('cargarCabecera')){
    
		function cargarCabecera($caseId){
			// echo "bpm id: ";
			// var_dump($caseId);
			//get main CodeIgniter object
			$ci =& get_instance();			
			//load databse library
			$ci->load->database();			
			//get data from database	
			$ci->db->select('tbl_empleadores.empleaid,
										tbl_empleadores.empleatipo,
										tbl_empleadores.empleacui,
										tbl_empleadores.empleafecha,
										tbl_empleadores.empleainscrip,
										tbl_empleadores.emplearazsoc,
										tbl_empleadores.empleaexp,
										tbl_empleadores.empleadomicilior,
										tbl_empleadores.empleadomiciliolegal,
										tbl_empleadores.empleadepid,
										tbl_empleadores.emplealocid,
										tbl_empleadores.empleaprovid,
										tbl_empleadores.empleasliquiid,
										tbl_empleadores.empleapmasc,
										tbl_empleadores.empleapfem,
										tbl_empleadores.ampleafechaalta,
										tbl_empleadores.empleaestado,
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

			if($query->num_rows() > 0){
					$result = $query->row_array();
			}

			
			$ci->db->select('tbl_denuncias.denunciaid,
											tbl_denuncias.denunciasfecha,
											tbl_denuncias.denunciariesgo,
											tbl_denuncias.denunciaprograma,
											tbl_denuncias.denunciafechaverif,
											tbl_denuncias.denunciainclucion,
											tbl_denuncias.denuncianroobra,
											tbl_denuncias.denuncianroacta,
											tbl_denuncias.denunciamotivos,
											tbl_denuncias.estableid,
											tbl_denuncias.denunciaestado,
											tbl_denuncias.denunciatipo,
											tbl_establecimiento.establecalle,
											tbl_establecimiento.establealtura,
											tbl_inspecciones.inspeccionid,
											tbl_inspecciones.accion,
											tbl_inspecciones.fechaProrroga');

			$ci->db->from('tbl_denuncias');
			$ci->db->join('trg_inspecciondenuncia', 'tbl_denuncias.denunciaid = trg_inspecciondenuncia.denunciaid');
			$ci->db->join('tbl_inspecciones', 'tbl_inspecciones.inspeccionid = trg_inspecciondenuncia.inspeccionid');
			$ci->db->join('tbl_establecimiento', 'tbl_denuncias.estableid = tbl_establecimiento.estableid');

			$ci->db->where('tbl_inspecciones.bpm_id', $caseId);
			$queryDenuncias = $ci->db->get();
			if ($queryDenuncias->num_rows()!=0){ 
				$resultDenuncias = $queryDenuncias->result_array();  
		 		 
			} 
			
			//var_dump($resultDenuncias);

			echo '<div id="collapseDivCli" class="box box-default collapsed-box box-solid">
					<div class="box-header with-border">
						<h3 id="tituloInfo" class="box-title">Empresa: '.$result['empleacui'].' - '.$result['emplearazsoc'].' / Mas Detalles</h3>

						<div class="box-tools pull-right">
								<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" onclick="mostrarCliente()">
										<i class="fa fa-plus"></i>
								</button>
						</div>
						<!-- /.box-tools -->
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">

							<div class="col-xs-12 col-sm-4">
									<div class="form-group">
											<label style="margin-top: 7px;">CUIT: </label>
											<input type="text" id="cuit" class="form-control" value="'.$result['empleacui'].'" disabled/>
									</div>
							</div>

							<div class="col-xs-12 col-sm-4">
									<div class="form-group">
											<label style="margin-top: 7px;">Razón Social: </label>
											<input type="text" id="razon" class="form-control" value="'.$result['emplearazsoc'].'" disabled/>
									</div>
							</div>

							<div class="col-xs-12 col-sm-4">
									<div class="form-group">
											<label style="margin-top: 7px;">Domicilio Legal: </label>
											<input type="text" id="domicilio" class="form-control" value="'.$result['empleadomiciliolegal'].'" disabled/>
									</div>
							</div>

							<div class="col-xs-12">
								<h5>Establecimiento</h5>		
							</div>	

							<!-- <div class="col-xs-12">
									<label style="margin-top: 7px;">Domicilio Legal: </label>
									<input type="text" id="domicilio" class="form-control"  value="'.$result['empleadomiciliolegal'].'" disabled/>
							</div> -->
							<div class="col-xs-12 col-sm-4">
									<div class="form-group">
											<label style="margin-top: 7px;">Calle: </label>
											<input type="text" id="calle" class="form-control" value="'.$result['establecalle'].'  '.$result['establealtura'].'" disabled/>
									</div>
							</div>
								
							<div class="col-xs-12 col-sm-4">
									<div class="form-group">
											<label style="margin-top: 7px;">Localidad: </label>
											<input type="text" id="localidad" class="form-control" value="'.$result['localidad'].'" disabled/>
									</div>
							</div>
							<div class="col-xs-12 col-sm-4">
									<div class="form-group">
											<label style="margin-top: 7px;">Provincia: </label>
											<input type="text" id="provincia" class="form-control" value="'.$result['provincia'].'" disabled/>
									</div>
							</div>
						</div>

					</div>
					<!-- /.box-body -->
				</div>

				';



			echo '<div id="collapseDiv" class="box box-default collapsed-box box-solid">
			<div class="box-header with-border">
					<h3 id="pedidoInfo" class="box-title">Inspeccion Nº: '.$resultDenuncias[0]['inspeccionid'].'</h3> 

					<input type="text" id="idDenuncia" class="form-control hidden" value="'.$resultDenuncias[0]['inspeccionid'].'" disabled/>

					<div class="box-tools pull-right">
							<button id="infoCliente" type="button" class="btn btn-box-tool" data-widget="collapse" >
									<i class="fa fa-plus"></i>
							</button>
					</div>
					<!-- /.box-tools -->
			</div>

			<div class="box-body">
				<div class="row">
					<div class="col-xs-12 col-sm-4">


							<table class="table table-bordered table-hover" id="" width= 100%>
								<tr>
									<th >Fecha Acta</th>
									<th>Nº Denuncia</th>
									<th>Motivos</th>
									<th>Dom. Establecimiento</th>
									<th>Tipo Denuncia</th>
									<th>Tipo Tipo Acta</th>
									<th>Prórroga</th>
									
								</tr>';

								foreach ($resultDenuncias as $f) {
									//dump_exit($f);
									echo '<tr>';
									
									echo '<td style="text-align: left" width="10%">'.$f['denunciasfecha'].'</td>';
									echo '<td style="text-align: left" width="10%">'.$f['denunciaid'].'</td>';
									echo '<td style="text-align: left" width="10%">'.$f['denunciamotivos'].'</td>';
									echo '<td style="text-align: left" width="10%">'.$f['establecalle'].' '.$f['establealtura'].'</td>';
									echo '<td style="text-align: left" width="10%">'.$f['denunciatipo'].'</td>';
									echo '<td style="text-align: left" width="10%">'.$f['accion'].'</td>';
									echo '<td style="text-align: left" width="10%">'.$f['fechaProrroga'].'</td>';
									
									echo '</tr>';
									
								}

							echo '</table> 

					</div>
				</div>				
			</div> <!-- /.box-body -->
		</div>		';		
		
			}
} 



