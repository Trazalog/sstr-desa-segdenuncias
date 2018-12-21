<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
              <h3 class="box-title">Importar Denuncias</h3>          
            </div><!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                  <div class="col-xs-12">
                    <div class="box-body">  
                        <form enctype="multipart/form-data" class="formulario">
													<input type="file" name="excel" id="excel" size="20" />
													<input class="hidden" type="text" name="table" value="articles" /><br /><br />
													<input class="hidden" type="text" name="fields" style="width:600px" value="" />
													<input type="button" id="importar" value="Importar" />
                        </form>
                        <br /><br />
                        <div class="alert alert-success" id="grabsuccess" role="alert" style="display: none">La planilla se ha grabado exitosamente.</div>
                        <div class="alert alert-danger" id="graberror" role="alert" style="display: none">Error! el formato del archvo a subir es incorrecto. Por favor guradelo con extension ".xsl".</div>   
                    </div>  
                  </div>
                </div>
                <!--div para visualizar mensajes-->
                <div class="messages"></div>
                <!--div para visualizar en el caso de imagen-->

                <!--div para visualizar mensajes de cuit-->
                <div id ="nocuit"></div> 
                <div id ="cuitNoReg"></div> <br /><br />     
                
                <!--div para visualizar mensajes de establecimientos-->
                <!-- <div id ="noestab"></div><br /><br />
                <div id ="estabNoReg"></div><br /><br /> -->
                
                <table id="tabladetalle" class="table table-bordered table-hover" style="text-align: center">
                    <thead>												
											<th>Cuit</th>
											<th>Fecha</th>
											<th>Motivos</th>
											<th>Establecimientos</th>
											<th>Coincidencia</th>
											<th>Otros Estab.</th>
                    </thead>
                    <tbody>  
                    </tbody>
                </table>
						</div> 
						
						<div class="modal-footer">							
							<button type="button" class="btn btn-primary" onclick="setDenuncias(event)">Guardar</button>
						</div><!-- box-footer -->


        </div>
    </div>
   </div>         
</section>  
 
<script>
  
  $(document).ready(function(){

    //queremos que esta variable sea global
    var fileExtension = "";
    function examinar(){

			//queremos que esta variable sea global
			var fileExtension = "";
			//obtenemos un array con los datos del archivo
			var file = $("#excel")[0].files[0];
			//alert(file);
			//obtenemos el nombre del archivo
			var fileName = file.name;
			//obtenemos la extensión del archivo
			fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
			alert(fileExtension);
			//obtenemos el tamaño del archivo
			var fileSize = file.size;
			//obtenemos el tipo de archivo image/png ejemplo
			var fileType = file.type;
			//mensaje con la información del archivo
			showMessage("<span class='info'>Archivo para subir: "+fileName+", peso total: "+fileSize+" bytes.</span>");
		}
		// cambios de select con domicilios
		function cambioSelect(){
			$("select").change( function(){ 
				var idEst = $(this).val();
				if (idEst == -1) {
					$(this).parents("tr").find("td").eq(4).html("<span class='glyphicon glyphicon-remove' style='color: #e20909'></span>");
				} else {
					$(this).parents("tr").find("td").eq(4).html("<span class='glyphicon glyphicon-ok' style='color: #6aa61b'></span>");
				}				
			});
		}

    //sube el archivo excel al server
    $('#importar').click(function(event){	

			event.preventDefault();
			if ($('#excel').val() == '') {
				alert('Por favor suba un archivo formato .xsl...');
			} else {	
				//información del formulario
				var formData = new FormData($(".formulario")[0]);
				var message = ""; 			
				$.ajax({
						url: 'Import/to_mysql',  
						type: 'POST',            
						data: formData,
						//necesario para subir archivos via ajax
						cache: false,
						contentType: false,
						processData: false,
						//mientras enviamos el archivo
						beforeSend: function(){
								message = $("<span class='before'>Subiendo su archivo, por favor espere...</span>");
								showMessage(message);        
						},					
						success: function(data){
								$('#graberror').hide(100);
								$('#grabsuccess').show(800);
								$('#grabsuccess').delay(2000).hide(600);
								showMessage("");
								var datos = JSON.parse(data);								
								// si todos los CUIT estan inscriptos dibuja tabla
								//if (datos['noCuit'][0] == null) { 								
									tabla = $('#tabladetalle').DataTable();
									tabla.clear().draw();									
									for(i = 0; i < datos['denTemporales'].length; i++) {		
										var idEstab = datos['denTemporales'][i]['estableid'];
										var dom =	datos['denTemporales'][i]['establecalle'] + ' '+datos['denTemporales'][i]['establealtura'];
										var cuit = datos['denTemporales'][i]['denunciacuit'];
										var motivos = datos['denTemporales'][i]['denunciamotivos'];
										var fecha = datos['denTemporales'][i]['denunciasfecha'];
										var selDomic = 	"<select class='" + idEstab + "'><option>Seleccione Domicilio...</option></select>";
										var coincide = "";
										//agrego valores a la tabla
										$('#tabladetalle').DataTable().row.add([										
											cuit, fecha, motivos, dom, coincide, selDomic
										] );
										$('#tabladetalle').DataTable().draw();
									}	
									llenaSelect();
									cambioSelect();
									
									// si hay cuit no registrados los muestra
									if (datos['noCuit'][0] != null){
										infoCuit(datos);
										//cambioSelect();
									}
									
														
						},
						//si ha ocurrido un error
						error: function(){
								$('#graberror').show(800);
								showMessage("");
						}
				});
			}
		});			
	})

	$('#excel').click(function(event){
			//event.preventDefault();
			tabla = $('#tabladetalle').DataTable();
			tabla.clear().draw();
			$("#nocuit").html("");
			$('#cuitNoReg').html("");
	});

	$("#excel").change( function(){ 		
			var fileExtension = "";			
			var file = $("#excel")[0].files[0];		
			//nombre del archivo
			var fileName = file.name;
			//extensión del archivo
			fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
			
			if(fileExtension != 'xlsx'){
				alert("El formato de archivo no es el correcto...");
			}
	});

	// llena select de establecimientos ingresados por cuit de empleador
	function llenaSelect(){		

		var tabla = $("#tabladetalle tr");
		$.each(tabla, function (index) {
			cuit = $(this).find("td").eq(0).html();
			idEstab = $(this).find("td").eq(5).find("select").attr("class");			
			if(cuit!=undefined){
				getEstablecimientos(cuit,idEstab);
			}			
		});
	}
	// trae los establecimientos por cuit de denuncia
	function getEstablecimientos(cuit,idEstab){

		var selector = $('.' + idEstab);
		$.ajax({			
			type: 'POST',
			data: {idEstab:cuit},
			url: 'index.php/Import/getEstablecimientos',
			success: function (result) {

							selector.html('');
							if(result!=null){
								var opcion  = "<option value='-1'>Seleccione Establecimiento...</option>" ; 
								selector.append(opcion); 
								for(var i=0; i < result.length ; i++){    
									var direccion = result[i]['establecalle'] + ' '+ result[i]['establealtura'];
									var idEstablecimiento = result[i]['estableid'];
									var opcion  = "<option value='"+ idEstablecimiento+"'>" +direccion+ "</option>" ; 
									selector.append(opcion); 
								}					
								// si no tiene estab conocido selecciona la opc -1			
								if(idEstab == 1){
									selector.val(-1);	
								}else{
									selector.val(idEstab);	
								}
							}
							else{
								selector.append("<option value='-1'>No hay Establecimientos</option>");
							}
							matchEstablecimientos();
			},
			error: function (result) {

							console.log(result);
			},
			dataType: 'json'
		});
	}

	// compara si coinciden los domicilios de establecimientos en tabla
	function matchEstablecimientos(){
		var tabla = $('#tabladetalle tr');
		var domDenuncia = "";
		var domEstab = "";
		$.each(tabla, function( index ) {		
			
			domDenuncia = $( this ).find("td").eq(3).html();
			domEstab = $( this ).find("td").eq(5).find("select option:selected").text();
			if(domDenuncia == domEstab){				
				$( this ).find("td").eq(4).html("<span class='glyphicon glyphicon-ok' style='color: #6aa61b'></span>");
			}else{
				$( this ).find("td").eq(4).html("<span class='glyphicon glyphicon-remove' style='color: #e20909'></span>");
			}			
		});
	}

	//muestra mensajes varios
	function showMessage(message){
			$(".messages").html("").show();
			$(".messages").html(message);
	}

	function infoInconsistencias(datos){

			$('tr.celdas').remove();
			for (var i = 0; i < datos.inconsistencias.length; i++) {            
					var tr = "<tr class='celdas'>"+
					"<td>"+datos['inconsistencias'][i]["CALLE"]+"</td>"+
					"<td>"+datos['inconsistencias'][i]["CUIT"]+"</td>"+
					"<td>"+datos['inconsistencias'][i]["MOTIVOS_x0020_INFRINGIDOS"]+"</td>"+ 
					"<td>"+datos['inconsistencias'][i]["FECHA_x0020_DENUNCIA"]+"</td>"+
					"</tr>";
					$('#tabladetalle tbody').append(tr);
			}
	}

	function infoCuit(datos){
			mens = $("<span class='nohaycuit'><h4>Los siguientes CUIT que no estan registrados en el Sistema, por favor proceda dar el Alta a Empleadores</h4></span>");
			$("#nocuit").html("").show();
			$("#nocuit").html(mens);
			var cuit = 0;
			for (var i = 0 ; i < datos['noCuit'].length ; i++) {
					cuit = parseInt(datos['noCuit'][i]);
					mensNocuit = "<div>" + cuit + "</div>" 
					$('#cuitNoReg').append(mensNocuit);
			} 
	}

	function infoEstab(datos){
		// los establecimientos con las sig calles no se corresponden con empleadores inscriptos
		mensest = $("<span class='nohaycuit'>Hay Estabecimientos que no estan registrados en el Sistema...</span>");
		$("#noestab").html("").show();
		$("#noestab").html(mensest);
		var estab = 0;
		for (var i = 0 ; i < datos['noEstabl'].length ; i++) {
				estab = parseInt(datos['noEstabl'][i]);
				mensNoEstab = "<p>" + estab + "</p>" 
				$('#estabNoReg').append(mensNoEstab);
		} 
	}

	// valida que haya un domicilio seleccionado antes de guardar
	function validaDomicilios(){
		var tbl = $('#tabladetalle tbody tr');
		var validado = true;
		$.each(tbl, function( index ) {
			sel = $( this ).find("td").eq(5).find("select option:selected").val();	
			if(sel == -1){
				validado = false;
				return validado;
			}	
		});		
		return validado;		
	}

	// gurada las denuncias definitivas
	function setDenuncias(event){

		event.preventDefault();		
		var valido = validaDomicilios();
		
		if (valido) {
			var tabla = $('#tabladetalle tbody tr');
			var denuncias = [];
			var componente = {};
			$.each(tabla, function( index ) {
				componente = {};
				componente['denunciasfecha'] = $( this ).find("td").eq(1).html();
				componente['denunciamotivos'] = $( this ).find("td").eq(2).html();			
				sel = $( this ).find("td").eq(5).find("select option:selected").val();
				if(sel == -1){
					sel = 1;
				}	
				componente['estableid'] = sel;
				componente['denunciaestado'] = 'AC';
				componente['denunciatipo'] = 'SRT';
				denuncias.push(componente);
			});	

			INFO  = new FormData();
			info = JSON.stringify(denuncias);
			INFO.append('data', info);

			$.ajax({
				url: 'index.php/Import/setDenuncias',
				//type: 'POST',
				//data: {data:info},
				data: INFO,
				type: 'POST', 
				contentType: false,
				processData: false, 
				success: function (respuesta) {					

								WaitingOpen();
								$('#content').empty();
								$("#content").load("<?php echo base_url(); ?>index.php/Denuncia/index/<?php echo $permission; ?>/");
								WaitingClose();
				}
			});
		} else {
			alert('Se encuentran domicilios sin seleccionar...');
			return;
		}
		
		// var domDenuncia = "";
		// var domEstab = "";		
		
		// $.each(tabla, function( index ) {					
		// 	domDenuncia = $( this ).find("td").eq(3).html();
		// 	domEstab = $( this ).find("td").eq(5).find("select option:selected").text();
		// 	console.log('domicilio denuncia: ');
		// 	console.log(domDenuncia);
		// 	console.log('domicilio establecimiento: ');
		// 	console.log(domEstab);
		// 	//if(domDenuncia!=undefined){
		// 		if(domDenuncia == domEstab){
		// 			//alert('vamoooo putooo');
		// 			$( this ).find("td").eq(4).html("X");
		// 		}else{
		// 			$( this ).find("td").eq(4).html("Y");
		// 		}
		// 	//}
		// });
	}  

	// Datatable
	$('#tabladetalle').DataTable({
			"paging": true,
			"lengthChange": true,
			"searching": true,
			"ordering": true,
			"info": true,
			"autoWidth": true,
			"language": {
						"lengthMenu": "Ver _MENU_ filas por página",
						"zeroRecords": "No hay registros",
						"info": "Mostrando pagina _PAGE_ de _PAGES_",
						"infoEmpty": "No hay registros disponibles",
						"infoFiltered": "(filtrando de un total de _MAX_ registros)",
						"sSearch": "Buscar:  ",
						"oPaginate": {
								"sNext": "Sig.",
								"sPrevious": "Ant."
							}
			}
	});

</script>



