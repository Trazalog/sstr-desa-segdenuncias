<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
	<?php cargarCabecera($idTarBonita); ?>
	<input id="idTarBonita" class="hidden" value="<?php echo $idTarBonita;?>">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div role="tabpanel" class="tab-pane">
								<div class="form-group">
									<!-- Nav tabs -->
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Vista Global
                      </a></li>                      
                      <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Comentarios</a></li>  
									</ul>
									<!-- Tab panes -->
									<div class="tab-content">
                    <!-- Linea de tiempo  -->
										<div role="tabpanel" class="tab-pane active" id="messages">
											<div class="panel-body">
												<div class="panel panel-primary">
													<div class="panel-heading">Línea de Tiempo</div>
													<div class="panel-body" style="max-height: 500px;overflow-y: scroll;">
														<style type="text/css">
														</style>
														<div class="container">
															<ul class="timeline">
																<?php

																	$userdata = $this->session->userdata('user_data');
																	$usrId = $userdata[0]['usrId'];     // guarda usuario logueado 
																	$usrName =  $userdata[0]['usrName'];
																	$usrLastName = $userdata[0]["usrLastName"];

																	echo "<input type='text' class='hidden' id='usrName' value='$usrName' >";
																	echo "<input type='text' class='hidden' id='usrLastName' value='$usrLastName' >";


																	echo '<h2 style="margin-left:50px;">Actividades Pendientes</h2>';
																	foreach ($timeline['listAct'] as $f) {       
																	echo '<li>
																			<div class="timeline-badge info"><i class="glyphicon glyphicon-time"></i></div>
																			<div class="timeline-panel">
																					<div class="timeline-heading">
																					<h4 class="timeline-title">'.$f['displayName'].'</h4>
																					<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> '.date_format(date_create($f['last_update_date']),'H:i  d/m/Y').'</small></p>
																					</div>
																					<div class="timeline-body">';
																					if(array_key_exists ( 'assigned_id' , $f ) && $f['assigned_id']!=''){
																							echo '<p>Usuario: '.$f['assigned_id']['firstname'].' '.$f['assigned_id']['lastname'].'</p>';
																					}else{
																							echo '<p>Usuario: Sin Asignar</p>';
																					}
																	echo   '<p>Descripción: '.$f['displayDescription'].'</p>
																					<p>Case: '.$f['caseId'].'</p>
																					</div>
																			</div>
																			</li>';
																	}
																	echo '<h2 style="margin-left:50px;">Actividades Terminadas</h2>';
																	foreach ($timeline['listArch'] as $f) {
																	
																	echo '<li>
																			<div class="timeline-badge danger"><i class="glyphicon glyphicon-check"></i></div>
																			<div class="timeline-panel">
																					<div class="timeline-heading">
																					<h4 class="timeline-title">'.$f['displayName'].'</h4>
																					<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> '.date_format(date_create($f['last_update_date']),'H:i  d/m/Y').'</small></p>
																					</div>
																					<div class="timeline-body">';
																						if(array_key_exists ( 'assigned_id' , $f )){
																								echo '<p>Usuario: '.$f['assigned_id']['firstname'].' '.$f['assigned_id']['lastname'].'</p>';
																						}else{
																								echo '<p>Usuario: Sin Asignar</p>';
																						}
																					echo '<p>Descripción: '.$f['displayDescription'].'</p>           
																						<p>Case: '.$f['caseId'].'</p>
																					</div>
																			</div>
																			</li>';
																	}
																?>
															</ul>
														</div>

													</div>
												</div>
											</div>
                    </div>
                    <!-- comentarios         -->
										<div role="tabpanel" class="tab-pane" id="profile">
											<div class="panel-body">
												<div class="panel panel-primary">
													<div class="panel-heading">Comentarios</div>
													<div class="panel-body" style="max-height: 500px;overflow-y: scroll;">
														<ul id="listaComentarios">
															<?php 
																foreach($comentarios as $f){

																	if(strcmp($f['userId']['userName'],'System')!=0){
																	echo '<hr/>';
																	echo '<li><h4>'.$f['userId']['firstname'].' '.$f['userId']["lastname"].'<small style="float: right">'.date_format(date_create($f['postDate']),'H:i  d/m/Y').'</small></h4>';
																	echo '<p>'.$f['content'].'</p></li>';
																	}
																}
															?>
														</ul>
													</div>
												</div>
												<textarea id="comentario" class="form-control" placeholder="Nuevo Comentario..."></textarea>
												<br/>
												<button class="btn btn-primary" id="guardarComentario" onclick="guardarComentario()">Agregar</button>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div><!-- /.row -->
					<div class="modal-footer">
						<button type="button" id="btnInsp" class="btn btn-primary">Volver a Inspecciones</button>
						<!-- <button type="button" class="btn btn-success" id="hecho" onclick="terminarTarea()">Hecho</button> -->
						<!-- <button type="button" class="btn btn-success" id="hecho" onclick="tareaTerminada()">Hecho</button> -->
					</div> <!-- /.modal footer -->
				</div><!-- /.box body -->
			</div> <!-- /.box  -->
		</div><!-- /.col -->
	</div><!-- /.row -->
</section><!-- /.content -->

<!-- estilos de linea de tiempo -->
<style type="text/css">
	.timeline {
		
		padding: 0 0 20px;
		position: relative;
		margin-top: -15px;
		margin-left: 70px;
	}

	.timeline:before {
		top: 30px;
		bottom: 25px;
		position: absolute;
		content: " ";
		width: 3px;
		background-color: #ccc;
		left: 25px;
		margin-right: -1.5px;
	}

	.timeline>li,
	.timeline>li>.timeline-panel {
		margin-bottom: 5px;
		position: relative;
	}

	.timeline>li:after,
	.timeline>li:before {
		content: " ";
		display: table;
	}

	.timeline>li:after {
		clear: both;
	}

	.timeline>li>.timeline-panel {
		margin-left: 55px;
		float: left;
		top: 19px;
		padding: 4px 10px 8px 15px;
		border: 1px solid #ccc;
		border-radius: 5px;
		width: 45%;
	}

	.timeline>li>.timeline-badge {
		color: #fff;
		width: 36px;
		height: 36px;
		line-height: 36px;
		font-size: 1.2em;
		text-align: center;
		position: absolute;
		top: 26px;
		left: 9px;
		margin-right: -25px;
		background-color: #fff;
		z-index: 100;
		border-radius: 50%;
		border: 1px solid #d4d4d4;
	}

	.timeline>li.timeline-inverted>.timeline-panel {
		float: left;
	}

	.timeline>li.timeline-inverted>.timeline-panel:before {
		border-right-width: 0;
		border-left-width: 15px;
		right: -15px;
		left: auto;
	}

	.timeline>li.timeline-inverted>.timeline-panel:after {
		border-right-width: 0;
		border-left-width: 14px;
		right: -14px;
		left: auto;
	}

	.timeline-badge.primary {
		background-color: #2e6da4 !important;
	}

	.timeline-badge.success {
		background-color: #3f903f !important;
	}

	.timeline-badge.warning {
		background-color: #f0ad4e !important;
	}

	.timeline-badge.danger {
		background-color: #d9534f !important;
	}

	.timeline-badge.info {
		background-color: #5bc0de !important;
	}

	.timeline-title {
		margin-top: 0;
		color: inherit;
	}

	.timeline-body>p,
	.timeline-body>ul {
		margin-bottom: 0;
		margin-top: 0;
	}

	.timeline-body>p+p {
		margin-top: 5px;
	}

	.timeline-badge>.glyphicon {
		margin-right: 0px;
		color: #fff;
	}

	.timeline-body>h4 {
		margin-bottom: 0 !important;
	}
</style>


<script>



	/* ver inspecciones por denuncia */ // LISTO!
	$("#btnInsp").on("click", function(e){
    e.preventDefault();    
    var idDenuncia = $('#idDenuncia').val(); 
    //alert(idDenuncia);
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Inspeccion/listInspPorDenuncia/<?php echo $permission; ?>/" + idDenuncia + "/");
    WaitingClose();
  });
  /*  / ver inspecciones por denuncia */

	
	
	//Funcion COMENTARIOS
	function guardarComentario() {
		console.log("Guardar Comentarios...");
		var id = $('#idTarBonita').val();
		
		var nombUsr = $('#usrName').val();
		var apellUsr = $('#usrLastName').val();;

		var comentario = $('#comentario').val();
		$.ajax({
			type: 'POST',
			data: { 'processInstanceId': id, 'content': comentario },
			url: 'index.php/Tarea/GuardarComentario',
			success: function (result) {
				console.log("Submit");
				var lista = $('#listaComentarios');
				lista.prepend(' <hr/><li><h4>' + nombUsr + ' ' + apellUsr + '<small style="float: right">Hace un momento</small></h4><p>' + comentario + '</p></li>');
				$('#comentario').val('');
			},
			error: function (result) {
				console.log("Error");
			}
		});
	}
	
	$('.fecha').datepicker({
		autoclose: true
	});

</script>
