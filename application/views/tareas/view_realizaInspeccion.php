<input type="hidden" id="permission" value="<?php echo $permission;?>">

<section class="content">
	<?php cargarCabecera($TareaBPM["caseId"]); ?>
	<div class="row">
		<div class="col-xs-12">
			<div class="box">

				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div role="tabpanel" class="tab-pane">
								<!-- <div class="form-group"> -->

									<!-- Nav tabs -->
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Tareas</a></li>
										<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Comentarios</a></li>
										<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Vista
												Global
											</a></li>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content">

										<div role="tabpanel" class="tab-pane active" id="home">
											<!-- <h4 class="panel-heading">Tarea</h4> -->
											<div class="panel-body">

												<?php
													
													echo "<input type='text' class='form-control hidden' id='asignado' value='".$TareaBPM["assigned_id"]."' >";												
													//if ($estadoTarea == "noasignado") {

															echo "<button class='btn btn-block btn-success' id='btontomar' style='width: 100px; margin-top: 10px ;display: inline-block;' onclick='tomarTarea()'>Tomar tarea</button>";
													//}else{
															echo "&nbsp"; 
															echo "&nbsp"; 
															echo "&nbsp";
															echo "<button class='btn btn-block btn-danger grupNoasignado' id='btonsoltr' style='width: 100px; margin-top: 10px; display: inline-block;' onclick='soltarTarea()'>Soltar tarea</button>";
													//	}    
															echo "</br>"; 
															echo "</br>"; 

															$userdata = $this->session->userdata('user_data');
															$usrId = $userdata[0]['usrId'];     // guarda usuario logueado 
															$usrName =  $userdata[0]['usrName'];
															$usrLastName = $userdata[0]["usrLastName"];
															
															echo "<input type='text' class='hidden' id='usrName' value='$usrName' >";
															echo "<input type='text' class='hidden' id='usrLastName' value='$usrLastName' >";
															echo "<input type='text' class='hidden' id='id_listarea' value='$id_listarea' >";

															echo "<input type='text' class='hidden' id='idPedTrabajo' value='$idPedTrabajo' >";

												?>												

												<input type="text" class="form-control hidden" id="caseId" value="<?php echo $TareaBPM ["caseId"] ?>"
												>

											
													<div class="panel panel-default">
														
														<div class="panel-heading">
															<h3 class="panel-title">Información:</h3>															
														</div>

														<div class="panel-body">
															<div class="form-group">
																<div class="col-sm-6 col-md-6">
																	<label for="tarea">Tarea</label>
																	<input type="text" class="form-control" id="tarea" value="<?php echo $TareaBPM['displayName'] ?>"
																	 disabled><!-- id de listarea -->
																	<input type="text" class="hidden" id="tbl_listarea" value="<?php echo $datos[0]['id_listarea'] ?>">
																	<input type="text" class="hidden" id="idform" value="<?php echo $idForm ?>">
																	<!-- id de task en bonita -->
																	<input type="text" class="hidden" id="idTarBonita" value="<?php echo $idTarBonita ?>">
																</div>
															</div>
	
															<div class="form-group">
																<div class="col-sm-6 col-md-6">
																	<label for="fecha">Fecha de Creación</label>
																	<input type="text" class="form-control" id="fecha" placeholder="" value="<?php echo $TareaBPM['last_update_date'] ?>"
																	 disabled>
																</div>
															</div><br>
	
															<div class="form-group">
																<div class="col-sm-12 col-md-12">
																	<label for="detalle">Detalle</label>
																	<textarea class="form-control" id="detalle" rows="3" disabled><?php echo $TareaBPM['displayDescription']?></textarea>
																</div>
															</div>
														</div>															

													</div>

										
												
												<br><br>
                              
												<form enctype="multipart/form-data" id="formInspeccion" class="form-horizontal" style="padding:0px 15px;" role="form" action="" method="" >
												
												<!-- Tipo de Acta     -->			
												<div class="col-sm-12 col-md-12">													
													<div class="col-sm-6 col-md-6">
														<h4>Tipo de Acta</h4>
														<div class="btn-group" data-toggle="buttons">
															<label class="btn btn-primary">
																<input type="radio" name="tipoActa" id="inspeccion" autocomplete="off" value="inspeccion"> Inspección 
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="tipoActa" id="verificacion" autocomplete="off" value="verificacion"> Verificación
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="tipoActa" id="suspension" autocomplete="off" value="suspension"> Suspensión
															</label>
														</div>
													</div>	
													<div></div>
													<div class="col-sm-6 col-md-6" style="margin-top:20px;">
														<div class="form-group">
															<label for="filePdf">Subir Acta</label>
															<div class="fileinput fileinput-new" data-provides="fileinput">
																<span class="btn btn-default btn-file"><span>Examinar...</span><input type="file" id="filePdf" name="filePdf" /></span>
																<span class="fileinput-filename"></span><span class="fileinput-new">Ningún archivo seleccionado</span>
															</div>
															<a id="adjunto" href="" target="_blank">Ver Archivo Adjunto</a>
														</div>
													</div>	
												</div>	<!-- /.col-sm-12 col-md-12 -->
													
													
												<!-- Acciones     -->
												<div class="col-sm-12 col-md-12">
													<div class="col-sm-6 col-md-6">		
														<h4>Acciones</h4>                          
														<div class="btn-group" data-toggle="buttons">
															<label class="btn btn-primary">
																<input type="radio" name="accion" id="option1" autocomplete="off" value="cierre-acta"> Cierre 
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="accion" id="option2" autocomplete="off" value="ampliacion-plazo"> Ampliación Plazos
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="accion" id="option3" autocomplete="off" value="infraccion"> Infracción
															</label>
														</div>
													</div>
													<div></div>
													<div class="col-sm-6 col-md-6" style="margin-top:20px;">	
														<div class="form-group">
															<div class="col-sm-6 col-md-6">
																<label for="fechaProrroga">Fecha de Prórroga</label>
																<input type="date" name="fechaProrroga" class="form-control" id="fechaProrroga" value="<?php echo date('Y-m-d') ?>">
															</div>		
														</div>
													</div>
												</div>		
													<br><br>

													<!-- Datos a guardar		 -->
                          <input type="text" name="case_id" class="form-control hidden" id="case_id" value="<?php echo $TareaBPM["caseId"] ?>">
													<input type="text" name="id" class="form-control hidden" id="id" value="<?php echo $TareaBPM["id"] ?>">
                          <input type="text" name="estableid" class="form-control hidden" id="estableid" value="<?php echo $datos[0]['estableid'] ?>">                          
                          <!-- <input type="text" name="inspectorid" class="form-control" id="inspectorid" value="<?php //echo $datos[0]['inspectorid'] ?>">
                          <textarea class="form-control" id="inspecciondescrip" name="inspecciondescrip" rows="3"><?php //echo $TareaBPM['displayDescription']?></textarea>	 -->

												</form>

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
												<br />
												<button class="btn btn-primary" id="guardarComentario" onclick="guardarComentario()">Agregar</button>
											</div>
										</div>
                    <!-- Linea de tiempo             -->
										<div role="tabpanel" class="tab-pane" id="messages">
											<div class="panel-body">
												<div class="panel panel-primary">
													<div class="panel-heading">Línea de Tiempo</div>
													<div class="panel-body" style="max-height: 500px;overflow-y: scroll;">
														<style type="text/css">
														</style>

														<div class="container">
															<ul class="timeline">
																<?php
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
																	echo    '<p>Descripción: '.$f['displayDescription'].'</p>           
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

									</div>
								<!-- </div> -->
							</div>
						</div>

					</div><!-- /.row -->

					<div class="modal-footer">
						<button type="button" id="cerrar" class="btn btn-primary" onclick="cargarVista()">Cerrar</button>
						<!-- <button type="button" class="btn btn-success" id="hecho" onclick="terminarTarea()">Hecho</button> -->
						<button type="button" class="btn btn-success" id="hecho" onclick="tareaTerminada()">Hecho</button>
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

	$('#filePdf').on('change', function() {
		$('#adjunto').attr("href",URL.createObjectURL(this.files[0])); 	            
	});
	evaluarEstado();
	function evaluarEstado() {

		var asig = $('#asignado').val();
		// si esta tomada la tarea
		if (asig != "") {
			habilitar();
		} else {
			deshabilitar();
		}
	}
	function habilitar() {
		// habilito btn y textarea       
		$("#btonsoltr").show();
		$("#hecho").show();
		$("#guardarComentario").show();
		$("#comentario").show();
		//desahilito btn tomar      
		$("#btontomar").hide();
		$("#formulario").show();
	}

	function deshabilitar() {
		// habilito btn tomar
		$("#btontomar").show();
		// habilito btn y textarea  
		$("#btonsoltr").hide();
		$("#hecho").hide();
		$("#guardarComentario").hide();
		$("#comentario").hide();
		$("#formulario").hide();
	}
	// Volver al atras
	$('#cerrar').click(function cargarVista() {
		WaitingOpen();
		$('#content').empty();
		$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
		WaitingClose();
	});

	/* Funciones BPM */
	//Ckeck Tarea realizada
	$('.btncolor').click(function (e) {
		
		console.log(id);
		var id_tarea = $(this).parents('tr').find('td').eq(1).html();
		console.log("Estoy finalizando una tarea");
		$.ajax({
			type: 'POST',
			data: {
				id_tarea: id_tarea,
			}, //Id tarea
			url: 'index.php/Taller/TareaRealizada', //index.php/
			success: function (data) {
				console.log(data);
				//alert("Se Finalizando la SUBTAREA");
				refresca(id);
			},
			error: function (result) {
				console.log(result);
				alert("NO se Finalizo la SUBTAREA");
				refresca(id);
			}
		});
	});
	// termina la tarea en BPM y guarda los datos en  BD	
	function tareaTerminada(){
		
		var errorInsp = true;
		
		if( $("input[name='tipoActa']:radio").is(':checked')	 ){
			//alert('chequeado tipo acta');
			errorInsp = false;			
		}else{
			alert('Por favor seleccione un tipo de Acta...');
			return;
		}

		if ( $("input[name='accion']:radio").is(':checked') ) {
			//alert('chequeado accion');
			errorInsp = false;
		} else {
			alert('Por favor seleccione una acción...');
			return;
		}

		if ($('#filePdf').val() == '') {
			alert('Por favor suba el acta en formato PDF...');
			return;
		} else {
			errorInsp = false;
		}

		if(errorInsp == false){
			var formData = new FormData($("#formInspeccion")[0]);
			/* Ajax de Grabado en BD */
			$.ajax({
				url: 'index.php/Tarea/cerrarTarea',
				type: 'POST',
				data: formData,
				cache: false,
				contentType: false,
				processData: false,
				success: function (data) {	
					var repuesta = JSON.parse(data);					
					// toma a tarea exitosamente
					if (repuesta['reponse_code'] == 204) {								
						$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
					}else{
						alert('Error en BPM. La tarea no ha podido ser completada...');
					}
				},
				error:function(data){
					console.table(data);
				}
			});
		}				
	}	
	// Toma tarea en BPM
	function tomarTarea() {

		WaitingOpen('Tomando tarea...');
		var idTarBonita = $('#idTarBonita').val();
		$.ajax({
			type: 'POST',
			data: {
				idTarBonita: idTarBonita
			},
			url: 'index.php/Tarea/tomarTarea',
			success: function (data) {
				console.log(data['reponse_code']);
				// toma a tarea exitosamente
				if (data['reponse_code'] == 200) {					
					WaitingClose();
					habilitar();
				}

			},
			error: function (result) {
				console.log(result);
			},
			dataType: 'json'
		});
	}
	// Soltar tarea en BPM
	function soltarTarea() {
		WaitingOpen('Soltando tarea...');
		var idTarBonita = $('#idTarBonita').val();		
		$.ajax({
			type: 'POST',
			data: {
				idTarBonita: idTarBonita
			},
			url: 'index.php/Tarea/soltarTarea',
			success: function (data) {
				console.log(data['reponse_code']);
				// toma a tarea exitosamente
				if (data['reponse_code'] == 200) {
					WaitingClose();				
					deshabilitar();			
				}
			},
			error: function (result) {
				console.log(result);
			},
			dataType: 'json'
		});
	}	

	$('.fecha').datepicker({
		autoclose: true
	});

	//Funcion COMENTARIOS
	function guardarComentario() {
		console.log("Guardar Comentarios...");
		var id = <?php echo json_encode($TareaBPM['caseId']);?>;
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
	

</script>

<div class="modal fade bs-example-modal-lg" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-body">
							<div class="row">
								<div class="col-sm-12 col-md-12">
									<?php
										if($form != ''){
												cargarFormulario($form);
										}                                    
									?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>