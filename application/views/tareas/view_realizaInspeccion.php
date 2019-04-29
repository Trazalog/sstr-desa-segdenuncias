<input type="hidden" id="permission" value="<?php echo $permission;?>">

<section class="content">
	<?php cargarCabecera($TareaBPM["caseId"]); ?>
	<div class="row">
		<div class="col-xs-12">
			<div class="box">

				<div class="box-body">
					<div class="row">
						<div class="col-xs-12">
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
													<div class="clearfix"></div>
													<div class="form-group">
														<div class="col-sm-6 col-md-6">
															<label for="fecha">Fecha de Creación</label>
															<input type="text" class="form-control" id="fecha" placeholder="" value="<?php echo $TareaBPM['last_update_date'] ?>"
															 disabled>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12 col-md-12">
															<label for="detalle">Detalle</label>
															<textarea class="form-control" id="detalle" rows="3" disabled><?php echo $TareaBPM['displayDescription']?></textarea>
														</div>
													</div>
												</div>															
											</div>
											<br>
                          
											<form enctype="multipart/form-data" id="formInspeccion" class="form-horizontal" style="padding:0px 15px;" role="form" action="" method="" >
											
												<div class="row">
													<?php //dump( $datosBorrador[0] ) ?>
													<input type="hidden" name="actaid" id="actaid" value="<?php echo ($datosBorrador[0]['actaid']) ?>">
													<!-- Tipo de Acta     -->															
													<div class="col-xs-12 col-lg-6">
														<h4>Tipo de Acta *</h4>
														<div class="btn-group" data-toggle="buttons">
															<label class="btn btn-primary">
																<input type="radio" name="tipoActa" id="inspeccion" value="inspeccion" <?php echo ($datosBorrador[0]['tipoActa'] == 'inspeccion') ? 'checked="checked"' : ''; ?> /> Inspección 
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="tipoActa" id="verificacion" value="verificacion" <?php echo ($datosBorrador[0]['tipoActa'] == 'verificacion') ? 'checked="checked"' : ''; ?> /> Verificación
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="tipoActa" id="suspension" value="suspension" <?php echo ($datosBorrador[0]['tipoActa'] == 'suspension') ? 'checked="checked"' : ''; ?> /> Suspensión
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="tipoActa" id="infraccion" value="infraccion" <?php echo ($datosBorrador[0]['tipoActa'] == 'infraccion') ? 'checked="checked"' : ''; ?> /> Infracción
															</label>
														</div>
													</div>	
													<div class="col-xs-12 col-lg-6">
														<h4>Subir Acta</h4>
														<table class="table">
															<tr data-idacta="<?php echo $datosBorrador[0]['actaid'] ?>">
															<?php if($datosBorrador[0]['acta'] == null || $datosBorrador[0]['acta'] == '')
															{
																echo '<td style="text-align: left" width="10%" class="accionAdjunto">
																<i class="fa fa-plus-square agregaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Agregar adjunto de Acta"></i>';
															}
															else {
																echo '<td style="text-align: left" width="10%" class="accionAdjunto">
																<i class="fa fa-times-circle eliminaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Eliminar adjunto de Acta"></i>
																<i class="fa fa-pencil editaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Editar adjunto de Acta"></i>
																<a href="'.base_url().$datosBorrador[0]['acta'].'" id="adjunto" target="_blank" >Ver Acta</a></td>';    
															} ?>
															</tr>
														</table>
														<!--<div class="fileinput fileinput-new" data-provides="fileinput">
															<span class="btn btn-default btn-file"><span>Examinar...</span><input type="file" id="filePdf" name="filePdf" /></span>
															<span class="fileinput-filename"></span><span class="fileinput-new">Ningún archivo seleccionado</span>
														</div>
														<a id="adjunto" href="" target="_blank">Ver Archivo Adjunto</a>-->
													</div>	

													<!-- Acciones -->
													<div class="col-xs-12 col-lg-6">		
														<h4>Acciones *</h4>                          
														<div class="btn-group" data-toggle="buttons">
															<label class="btn btn-primary">
																<input type="radio" name="accion" id="option1" value="cierre-acta" <?php echo ($datosBorrador[0]['accion'] == 'cierre-acta') ? 'checked="checked"' : ''; ?> /> Cierre 
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="accion" id="option2" value="ampliacion-plazo" <?php echo ($datosBorrador[0]['accion'] == 'ampliacion-plazo') ? 'checked="checked"' : ''; ?> /> Prórroga
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="accion" id="option3" value="infraccion" <?php echo ($datosBorrador[0]['accion'] == 'infraccion') ? 'checked="checked"' : ''; ?> /> Infracción
															</label>
															<label class="btn btn-primary">
																<input type="radio" name="accion" id="option4" value="plazos" <?php echo ($datosBorrador[0]['accion'] == 'plazos') ? 'checked="checked"' : ''; ?> /> Plazos
															</label>
														</div>
													</div>

													<div class="col-xs-12 col-lg-6">	
														<label for="fechaProrroga"><h4>Fecha de Prórroga *</h4></label>
														<input type="date" name="fechaProrroga" class="form-control" id="fechaProrroga" value="<?php echo $datosBorrador[0]['fechaProrroga'] ?>">
													</div>
												</div>
										<!--</div>-->		
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
						<button type="button" id="cerrar" class="btn btn-primary" onclick="inspeccionBorrador()">Borrador</button>
						<button type="button" class="btn btn-success" id="hecho" onclick="tareaTerminada()">Guardar</button>
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
$(':input:checked').parent('.btn').addClass('active');

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

		if ( $("#fechaProrroga").val() == '' ) {
			alert('Por favor ingrese fecha de prórroga...');
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

	// Guarda los datos en borrador
	function inspeccionBorrador() {
		var formData = new FormData($("#formInspeccion")[0]);
		/* Ajax de Grabado en BD */
		$.ajax({
			url: 'index.php/Tarea/inspeccionBorrador',
			type: 'POST',
			data: formData,
			cache: false,
			contentType: false,
			processData: false,
			success: function(data) {
				console.table(data);
				$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
			},
			error: function(data) {
				console.table(data);
			}
		});
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
	



//abrir modal agregar adjunto
$(document).on("click",".agregaAdjunto",function(){
  $('#btnAgregarEditar').text("Agregar");
  $('#modalAgregarAdjunto .modal-title').html('<span class="fa fa-fw fa-plus-square text-light-blue"></span> Agregar');

  $('#modalAgregarAdjunto').modal('show');
  var idActa = $(this).closest('tr').data('idacta');
  $('#idAgregaAdjunto').val(idActa);
});
//abrir modal editar adjunto
$(document).on("click",".editaAdjunto",function(){
  $('#btnAgregarEditar').text("Editar");
  $('#modalAgregarAdjunto .modal-title').html('<span class="fa fa-fw fa-pencil text-light-blue"></span> Editar');

  $('#modalAgregarAdjunto').modal('show');
  var idActa = $(this).closest('tr').data('idacta')
  $('#idAgregaAdjunto').val(idActa);
});
//abrir modal eliminar adjunto
$(document).on("click",".eliminaAdjunto",function(){
  //console.log( $(this).closest('tr').data('idacta') );
  $('#modalEliminarAdjunto').modal('show');
  var idActa = $(this).closest('tr').data('idacta');
  $('#idAdjunto').val(idActa);
});

//agregar/editar adjunto
$("#formAgregarAdjunto").submit(function (event){
  $('#modalAgregarAdjunto').modal('hide');

  event.preventDefault();  
  if (document.getElementById("inputPDF").files.length == 0) {
    $('#error').fadeIn('slow');
  }
  else{
    $('#error').fadeOut('slow');
    var formData = new FormData($("#formAgregarAdjunto")[0]);
    //debugger
    $.ajax({
      cache:false,
      contentType:false,
      data:formData,
      dataType:'json',
      processData:false,
      type:'POST',
      url:'index.php/Inspeccion/agregarAdjunto',
    })
    .done( function(data){     
      //console.table(data); 
      llenar_adjunto( data['adjunto'],data['idActa']  );
    })                
    .error( function(result){                      
      console.error(result);
    }); 
  }
});
//eliminar adjunto
function eliminarAdjunto() {
  $('#modalEliminarAdjunto').modal('hide');
  var idActa = $('#idAdjunto').val();
  $.ajax({
    data: { idActa:idActa },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Inspeccion/eliminarAdjunto',
  }) 
  .done( function(data){     
    //console.table(data); 
    let adjunto = '';
    llenar_adjunto(adjunto, idActa);
  })                
  .error( function(result){                      
    console.error(result);
  }); 
}


//llena los datos de archivo adjunto
function llenar_adjunto(adjunto, idActa) {
  let celdaAdjunto = $('tr[data-idacta="'+idActa+'"] td.accionAdjunto');

  if( adjunto == null || adjunto == '') {
    var accion = '<i class="fa fa-plus-square agregaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Agregar Adjunto"></i>';
  } else {
    var accion = '<i class="fa fa-times-circle eliminaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Eliminar Adjunto"></i>'+'<i class="fa fa-pencil editaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Editar Adjunto"></i>'+
      '<a href="'+adjunto+'" id="adjunto" target="_blank">Ver Acta</a>';
  }

  celdaAdjunto.html(accion);
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

<!-- Modal Eliminar Adjunto -->
<div class="modal" id="modalEliminarAdjunto">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="idAdjunto">
        <h4>¿Desea eliminar Archivo Adjunto?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarAdjunto();">Eliminar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Agregar adjunto -->
<div class="modal" id="modalAgregarAdjunto">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span class="fa fa-fw fa-plus-square text-light-blue"></span> Agregar</h4>
      </div>

      <form id="formAgregarAdjunto">
        <div class="modal-body">
          <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
            <h4><i class="icon fa fa-ban"></i> Error!</h4>
            Seleccione un Archivo Adjunto
          </div>
          <input type="hidden" id="idAgregaAdjunto" name="idAgregaAdjunto">
          <input id="inputPDF" name="inputPDF" type="file" class="form-control input-md">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary" id="btnAgregarEditar">Agregar</button>
        </div>
      </form>
    </div>
  </div>
</div>