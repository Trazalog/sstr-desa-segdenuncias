<input type="hidden" id="permission" value="<?php echo $permission;?>">
<?php
	//dump($permission, "permission");
	//dump($provincias, "provincias");
	//dump($liquidacion, "liquidacion");
	//dump($actividad, "actividad");
	//dump($list);
?>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Empleadores</h3>
				</div><!-- /.box-header -->
				<div class="box-body">
					<?php
					if (strpos($permission,'Add') !== false) {
						echo '<div class="form-group">';
						echo '<button class="btn btn-primary" id="btnAdd" data-action="Add">Agregar</button>';
						echo '</div>';
					}
					?>
					<table id="tbl-empleadores" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Acción</th>
								<th>Nro Inscripción</th>
								<th>Fecha</th>
								<th>Expediente</th>
								<th>CUIT</th>
								<th>Razón Social</th>
								<th>Domicilio Legal</th>
								<th>Liquidación</th>
								<th>Personal Masculino</th>
								<th>Personal Femenino</th>
							</tr>
						</thead>
						<tbody>
							<?php if(is_array($list)) {
  							foreach( (array)$list as $e )
  							{
  								$id=$e['empleaid'];
                  echo '<tr id="'.$id.'" class="'.$id.'" >';
  	              	echo '<td>';
                    if (strpos($permission,'View') !== false) {
                      echo '<i class="fa fa-fw fa-search text-light-blue btnView" style="cursor: pointer; margin-left: 15px;" data-idempleador="'.$id.'" title="Ver Detalle"></i>';
                    }
                    if (strpos($permission,'Add') !== false) {
                      echo '<i class="fa fa-fw fa-pencil text-light-blue btnEdit" style="cursor: pointer; margin-left: 15px;" data-idempleador="'.$id.'" title="Editar"></i>';
                    }
  	                if (strpos($permission,'Del') !== false) {
                      echo '<i class="fa fa-fw fa fa-times text-light-blue btnBorrado" style="cursor: pointer; margin-left: 15px;" data-idempleador="'.$id.'" title="Eliminar"></i>';
                      
  	                }
  	                if (strpos($permission,'View') !== false) {
                      echo '<i class="fa fa-fw fa-sticky-note text-light-blue btnNote" style="cursor: pointer; margin-left: 15px;" data-idempleador="'.$id.'" title="Notas"></i>';
  	                }
  	                echo '</td>';
  									echo '<td>'.$e['empleatipo'].'-'.$e['empleainscrip'].'</td>';
  									echo '<td>'.$e['empleafecha'].'</td>';
  									echo '<td>'.$e['empleaexp'].'</td>';
  									echo '<td>'.$e['empleacui'].'</td>';
  									echo '<td>'.$e['emplearazsoc'].'</td>';
  									echo '<td>'.$e['empleadomiciliolegal'].'</td>';
  									echo '<td>'.$e['sisliquidescrip'].'</td>';
  									echo '<td>'.$e['empleapmasc'].'</td>';
  									echo '<td>'.$e['empleapfem'].'</td>';
  								echo '</tr>';
  							}
              } ?>
						</tbody>
					</table>
				</div><!-- /.box-body -->
			</div><!-- /.box -->
		</div><!-- /.col -->
	</div><!-- /.row -->
</section><!-- /.content -->

<script>
  // formateo texto para mostrar en tabla
  function text_en_tabla(content) {
    //filtro tags html
    var fragmento   = document.createDocumentFragment();
    var elementoDiv = document.createElement('div');
    fragmento.appendChild(elementoDiv);
    elementoDiv.innerHTML = content;
    var cadena = fragmento.firstChild.innerText;
    // elimino espacio al inicio y final
    cadena = cadena.trim();
    // recorto texto a 200 caracteres
    cadena = cadena.substring(0,200);
    //agrego puntos suspensivos
    if(cadena.length == 200) {
      cadena = cadena + "...";
    }
    return cadena;
  }


  /* formato de cuit */
  $('#cuit').inputmask({
    mask: '99-99999999-9'
  });
  /* cargo plugin datetimepicker */
  $('#fecha').datetimepicker({
    format: 'YYYY-MM-DD H:mm:ss',
    locale: 'es',
  });


  /* trae departamentos al seleccionar la provincia */
  $("#provincias").on("change", function() {
    id_provincia = $(this).val();
    //console.info( 'provincia: '+ id_provincia );
    $("#departamentos").removeAttr( "disabled" );
    traerDepartamentos( id_provincia );
  });
  /* Trae los departamentos de la provincia */
  function traerDepartamentos( id_provincia, id_departamento ) {
    //console.info( 'provinciaAjax: '+ id_provincia );
    //console.info( 'departamentoAjax: '+ id_departamento );
    WaitingOpen('Cargando Departamentos');
    $('#departamentos').empty();
    $.ajax({
      type: 'POST',
      data: {id_provincia},
      dataType: 'json',
      url: 'index.php/Empleador/getLocalidadPorId',
      success: function(result){
        //console.info("trae los deptos correctamente, del provincia seleccionado: "+result);
        var opcion  = "<option value='-1'>Todos los departamentos</option>";
        $('#departamentos').empty();
        $('#departamentos').append(opcion);
        for(var i=0; i < result.length ; i++)
        {
          var opcion = "<option value='"+result[i]['id']+"'>" +result[i]['localidad']+ "</option>" ;
          $('#departamentos').append(opcion);
        }
        if (id_departamento !== 'undefined') {
          console.info( id_departamento + "-" + id_provincia  );
          $("#departamentos option[value='"+id_departamento+"']").attr("selected","selected");
        }
        WaitingClose();
      },
      error: function(result){
        //alert(result);
        console.error("problemas al llenar los departamentos: " + result);
        WaitingClose();
      },
    });
  }



  /* ajusto el ancho de la cabecera de las tablas al cambiar de tab */
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // https://datatables.net/reference/api/columns.adjust() states that this function is trigger on window resize
      $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
  });


  /* modal empleador * /
  $('#modalEmpleador').on('shown.bs.modal', function (e) {
    $(document).on('click', '.delEstablecimiento'); //habilito el evento click
    $(document).on('click', '.delActividad');
    $(document).on('click', '.delLibro'); 
    $(document).on('click', '.delNote'); 
  });//*/

  /* ajusto el ancho de la cabecera de las tablas al cargar el modal */
  $('#modalNotas').on('shown.bs.modal', function (e) {
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
  });



  /* cambio el icono al expandir/contraer el collapse de actividades */
  $('#collapseOne').on('shown.bs.collapse', function () {
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
    $('#headingOne .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  $('#collapseOne').on('hidden.bs.collapse', function () {
    $('#headingOne .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  /*  */
  $('#collapseTwo').on('shown.bs.collapse', function () {
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
    $('#headingTwo .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  $('#collapseTwo').on('hidden.bs.collapse', function () {
    $('#headingTwo .fa').toggleClass('fa-angle-right fa-angle-down');
  })


  /* habilita el boton agregar establecimiento */
  $("#provincias").on("change", function() {
    $("#add-establecimiento").removeClass("disabled");
  });
  /* agrego establecimientoes */
  $("#add-establecimiento").click(function (e) {
    var establecalle    = $('#calle').val();
    var establealtura   = $('#altura').val();
    var establepiso     = $('#piso').val();
    var establedpto     = $('#dpto').val();
    var establelatitud  = $('#latitud').val();
    var establelongitud = $('#longitud').val();
    var provid          = $("#provincias option:selected").val();
    var dptoid          = $("#departamentos option:selected").val();

    //agrego valores a la tabla
    $('#tbl-establecimiento').DataTable().row.add( [
        "<i class ='fa fa-ban elirow text-primary' style='cursor:pointer'></i>",
        establecalle,
        establealtura,
        establepiso,
        establedpto,
        provid,
        dptoid,
        establelatitud,
        establelongitud
      ]
    ).draw();

    //limpio formulario
    $('#calle').val('');
    $('#altura').val('');
    $('#piso').val('');
    $('#dpto').val('');
    $("#provincias").val('-1');
    $("#departamentos").val('-1');
    $('#latitud').val('');
    $('#longitud').val('');
  });
  /* elimina fila de la tabla estableciemientos */
  $(document).on("click",".delEstablecimiento",function() {
    $('#tbl-establecimiento').DataTable().row( $(this).closest('tr') ).remove().draw();
  });

  /* habilita el boton agregar actividad */
  $("#actividad").on("change", function() {
    $("#add-actividad").removeClass("disabled");
  });
  /* agrego actividades */
  $("#add-actividad").click(function (e) {
    var id_actividad = $('#actividad').val();
    var actividad    = $("#actividad option:selected").text();
    var rubro        = $('#rubro').val();
    var convenio     = $('#convenio').val();

    //agrego valores a la tabla
    $('#tbl-actividad').DataTable().row.add( [
          "<i class ='fa fa-ban elirow text-primary' style='cursor:pointer'></i>",
          actividad,
          rubro,
          convenio]
    ).node().id = id_actividad;
    $('#tbl-actividad').DataTable().draw();

    //limpio formulario
    $("#actividad").val('-1');
    $('#rubro').val('');
    $('#convenio').val('');
  });
  /* elimina fila de la tabla actividad */
  $(document).on("click",".delActividad",function() {
    $('#tbl-actividad').DataTable().row( $(this).closest('tr') ).remove().draw();
  });

  /* agrego libros */
  $("#add-libro").click(function (e) {
    var tomo       = $('#tomo').val();
    var fecha_tomo = $('#fecha-tomo').val();

    //agrego valores a la tabla
    $('#tbl-libros').DataTable().row.add( [
      "<i class ='fa fa-ban elirow text-primary' style='cursor:pointer'></i>",
      fecha_tomo,
      tomo]
    ).draw();

    //limpio formulario
    $('#tomo').val('');
    var output = getFechaHoraFormateada( new Date() ); //dia actual formateado
    $('#fecha-tomo').val(output);
  });
  /* elimina fila de la tabla libros */
  $(document).on("click",".delLibro",function() {
    $('#tbl-libros').DataTable().row( $(this).closest('tr') ).remove().draw();
  });


	var hay_error = false;
  var max_char = false;
  function limpiarValidacion() {
    hay_error = false;
    max_char = false;
    $('#error').hide();
    $(".has-error").removeClass("has-error");
  }
  function limpiarValues(){
    // limpio los values de los input
    $("#frmArchivo")[0].reset();
    // limpio los select a su valor original
    $("#provincias option[value='-1']").attr("selected","selected");
    $("#departamentos option[value='-1']").attr("selected","selected");
    $("#liquidacion option[value='-1']").attr("selected","selected");

    $("#frmArchivo").find('input:text, input:password, input:file, select, textarea').val('');
    $("#frmArchivo").find('input:radio, input:checkbox')
           .removeAttr('checked').removeAttr('selected');
  }

  function Refrescar(){
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Empleador/index/<?php echo $permission; ?>");
    WaitingClose();
  }

  /* llama vista agregar proveedor*/
  $('#btnAdd').on("click", function(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Empleador/getDatosEmpleador/<?php echo $permission; ?>");
    WaitingClose();
  });
  /* Edito empleador */
  $(".btnEdit").on("click", function(e){
    WaitingOpen();
    var idEmpleador = $(this).data("idempleador");
    var url = "<?php echo base_url(); ?>index.php/Empleador/editEmpleador/<?php echo $permission; ?>/"+idEmpleador;
    //alert(url);
    $('#content').empty();
    $("#content").load(url);
    WaitingClose();
  });
  /* Elimino empleador */
  //$(".btnDelete").on("click", function(e){
   // e.preventDefault();
    //$('#confirmDelete').modal('show');
   // var idEmpleador = $(this).data("idempleador");
   // console.info(idEmpleador);
    //WaitingOpen('Eliminando Empleador');
    // $.ajax({
    //   data: { id_empleador : idEmpleador },
    //   dataType: 'json',
    //   type: 'POST',
    //   url: 'index.php/Empleador/deleteEmpleadorPorId',
    //   success: function(result){
    //     Refrescar();
    //   },
    //   error: function(result){
    //     console.error("Error eliminando Empleador");
    //     WaitingClose();
    //   },
    // });
  //});

  $(".btnBorrado").on("click", function(e){
    e.preventDefault();   

    if(confirm('Desea realmente eliminar este Empleador?')){

      var idEmpleador = $(this).data("idempleador");
      WaitingOpen('Eliminando Empleador');
      $.ajax({
          data: { id_empleador : idEmpleador },
          dataType: 'json',
          type: 'POST',
          url: 'index.php/Empleador/deleteEmpleadorPorId',
          success: function(result){
            Refrescar();
          },
          error: function(result){
            console.error("Error eliminando Empleador");
            WaitingClose();
          },
      });
    }else{
      console.log('nnnnoooooo');
    }   
  });
  /* Ver empleador */
  $(".btnView").on("click", function(e){
    e.preventDefault();
    //$('#confirmDelete').modal('show');
    var idEmpleador = $(this).data("idempleador");
    console.info(idEmpleador);
    WaitingOpen('Cargando Empleador');
    $('#btnSave').hide();

    $.ajax({
      data: { id_empleador : idEmpleador },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/getEmpleadorPorId',
      success: function(data){
        console.table(data);
        tipo = data['empleador'][0]['empleatipo'];

        $("input[name='tipoEmpleador'][value='"+tipo+"']").prop('checked', true);
        $("input[name='tipoEmpleador']").prop("disabled", true);
        $('#fecha').val( data['empleador'][0]['empleafecha'] );
        $('#fecha').prop("disabled", true);
        $('#nro-inscripcion').val( data['empleador'][0]['empleainscrip'] );
        $('#nro-inscripcion').prop("disabled", true);
        $('#expediente').val( data['empleador'][0]['empleaexp'] );
        $('#expediente').prop("disabled", true);
        $('#cuit').val( data['empleador'][0]['empleacui'] );
        $('#cuit').prop("disabled", true);
        $('#razon-social').val( data['empleador'][0]['emplearazsoc'] );
        $('#razon-social').prop("disabled", true);
        $('#domicilio-legal').val( data['empleador'][0]['empleadomiciliolegal'] );
        $('#domicilio-legal').prop("disabled", true);

        idProvincia = data['empleador'][0]['empleaprovid'];
        $("#provincias option[value='"+idProvincia+"']").attr("selected","selected");
        $('#provincias').prop("disabled", true);
        idDepartamento = data['empleador'][0]['empleadepid'];
        idDepartamento = parseInt(idDepartamento);
        traerDepartamentos( idProvincia, idDepartamento );
        //console.info(idDepartamento);
        $("#departamentos option[value='"+idDepartamento+"']").attr("selected","selected");
        $('#departamentos').prop("disabled", true);

        idLiquidacion = data['empleador'][0]['empleasliquiid']
        $("#liquidacion option[value='"+idLiquidacion+"']").attr("selected",true);
        $("#liquidacion").prop("disabled", true);

        $('#personal-masculino').val( data['empleador'][0]['empleapmasc'] ); 
        $('#personal-masculino').prop("disabled", true);
        $('#personal-femenino').val( data['empleador'][0]['empleapfem'] );
        $('#personal-femenino').prop("disabled", true);

        //cargo establecimientos
        $('#tbl-establecimiento_wrapper').prev().hide();
        $('#tbl-establecimiento_wrapper').prev().prev().hide();
        $('#tbl-establecimiento').DataTable().clear().draw();
        for(i = 0; i < data['establecimientos'].length; i++) {
          var establecalle    = data['establecimientos'][i]['establecalle'];
          var establealtura   = data['establecimientos'][i]['establealtura'];
          var establepiso     = data['establecimientos'][i]['establepiso'];
          var establedpto     = data['establecimientos'][i]['establedpto'];
          var establelatitud  = data['establecimientos'][i]['establelatitud'];
          var establelongitud = data['establecimientos'][i]['establelongitud'];
          var provid          = data['establecimientos'][i]['provid'];
          var dptoid          = data['establecimientos'][i]['dptoid'];

          //agrego valores a la tabla
          $('#tbl-establecimiento').DataTable().row.add( [
              "<i class ='fa fa-ban elirow text-primary' style='cursor:not-allowed'></i>",
              establecalle,
              establealtura,
              establepiso,
              establedpto,
              provid,
              dptoid,
              establelatitud,
              establelongitud,
            ]
          ).draw();
        }
        //cargo actividades
        $('#tbl-actividad_wrapper').prev().hide();
        $('#tbl-actividad_wrapper').prev().prev().hide();
        $('#tbl-actividad').DataTable().clear().draw();
        for(i = 0; i < data['actividad'].length; i++) {
          var actividad = data['actividad'][i]['descripcion'];
          var rubro     = data['actividad'][i]['detaactivrubro'];
          var convenio  = data['actividad'][i]['detaactivconvenio'];

          //agrego valores a la tabla
          $('#tbl-actividad').DataTable().row.add( [
              '<i class ="fa fa-ban elirow text-primary" style="cursor:not-allowed"></i>',
              actividad,
              rubro,
              convenio
            ]
          ).draw();
        }
        //cargo libros
        $('#tbl-libros_wrapper').prev().hide();
        $('#tbl-libros_wrapper').prev().prev().hide();
        $('#tbl-libros').DataTable().clear().draw();
        for(i = 0; i < data['libros'].length; i++) {
          var librofechaentrega = data['libros'][i]['librofechaentrega'];
          var librotomo         = data['libros'][i]['librotomo'];
          //agrego valores a la tabla
          $('#tbl-libros').DataTable().row.add( [
              '<i class ="fa fa-ban elirow text-primary" style="cursor:not-allowed"></i>',
              librotomo,
              librofechaentrega,
            ]
          ).draw();
        }
        // cargo notas 
        $('#tbl-nota').DataTable().clear().draw();
        for(i = 0; i < data['notas'].length; i++) {
          var notid       = data['notas'][i]['notid'];
          var fecha       = data['notas'][i]['fecha'];
          var observacion = data['notas'][i]['observacion'];
          observacion     = text_en_tabla(observacion);
          var imagen      = data['notas'][i]['imagen'];
          //agrego valores a la tabla
          $('#tbl-nota').DataTable().row.add( [
                '<i class ="fa fa-ban elirow text-primary" style="cursor:not-allowed"></i>',
                notid,
                fecha,
                observacion,
                '<a href="#" class="pop"><img style="width: 20px; height: 20px;" src="<?php echo base_url() ?>assets/notas/'+imagen+'""></a>']
          ).draw();
        }

        $('#modalEmpleador').modal('show');
        WaitingClose();
      },
      error: function(result){
        console.error("Error cargando Empleador");
        WaitingClose();
      },
    });
  });
  /* Agregar Nota */ 
  $(".btnNote").on("click", function(e){
    e.preventDefault();
    var idEmpleador = $(this).data("idempleador");
    //console.info(idEmpleador);
    WaitingOpen('Agregar Empleador');
    //elimino errores
    $('#errorNota').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error");
    //limpio inputs
    //$('#frmNotas').reset();
    //$("#frmNotas :input").val(null);
    $("#observacion, #fecha-entrega-nota").val('');
    $("#nota").replaceWith($("#nota").val(null).clone(true));
    //$('#frmNotas')[0].reset();

    $('#id-empleador').val(idEmpleador);

    $('#modalNotas').modal('show');
    WaitingClose();    
  });
  /* Guarda Empleador */
  $("#btnSave").on("click", function(e){
    e.preventDefault();

    WaitingOpen('Guardando Empleador');
    
    // informacion personal 
    var empleatipo           = document.querySelector('input[name="tipoEmpleador"]:checked').value; 
    var empleafecha          = $('#fecha').val(); 
    var empleainscrip        = $('#nro-inscripcion').val(); 
    var empleaexp            = $('#expediente').val(); 
    var empleacui            = $('#cuit').val(); 
    var emplearazsoc         = $('#razon-social').val(); 
    var empleaprov           = $('#provincias').val(); 
    var empleadepid          = $('#departamentos').val(); 
    var empleadomiciliolegal = $('#domicilio-legal').val(); 
    var empleasliquiid       = $('#liquidacion').val(); 
    var empleapmasc          = $('#personal-masculino').val(); 
    var empleapfem           = $('#personal-femenino').val(); 
    var fecha_actual         = getFechaHoraFormateada( new Date() ); 
    var empleador = { 
      'empleatipo' : empleatipo, 
      'empleafecha' : empleafecha, 
      'empleainscrip' : empleainscrip, 
      'empleaexp' : empleaexp, 
      'empleacui' : empleacui, 
      'emplearazsoc' : emplearazsoc, 
      'empleaprovid' : empleaprov, 
      'empleadepid' : empleadepid, 
      'empleadomiciliolegal' : empleadomiciliolegal, 
      'empleasliquiid' : empleasliquiid, 
      'empleapmasc' : empleapmasc, 
      'empleapfem' : empleapfem, 
      'ampleafechaalta': empleafecha 
    };

    // establecimiento 
    var establecimiento = new Array(); 
    var j = 0;
    $("#tbl-establecimiento tbody tr").each(function (index) {
        var est = new Array();
        var id_establecimiento = $(this).attr('id');
        var i = 0;
        $(this).children("td").each(function (index2) {
          if (index2) {
            est[i] = $(this).text();
            i++;
          }
        });
        //est[0]=id_establecimiento;
        establecimiento[j] = est;
        j++;
    });
    console.log(establecimiento);
    // actividad 
    var actividad = new Array(); 
    var j = 0;
    $("#tbl-actividad tbody tr").each(function (index) {
        var act = new Array();
        var id_actividad = $(this).attr('id');
        var i = 0;
        $(this).children("td").each(function (index2) {
          if (index2) {
            act[i] = $(this).text();
            i++;
          }
        });
        act[0]=id_actividad;
        actividad[j] = act;
        j++;
    });
    console.log(actividad);
    // libros 
    var libro = new Array(); 
    var j = 0;
    $("#tbl-libros tbody tr").each(function (index) {
      var lib = new Array();
      var id_libro = $(this).attr('id');
      var i = 1;
      $(this).children("td").each(function (index2) {
        if (index2) {
          lib[i] = $(this).text();
          i++;
        }
      });
      lib[0] = id_libro;
      libro[j] = lib;
      j++;
    });
    console.log(libro);

    // valido datos 
    hay_error = false;
    $('#error').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

    if ( empleafecha == '') {
      $("#fecha").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleainscrip == '') {
      $("#nro-inscripcion").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleaexp == '') {
      $("#expediente").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleacui == '') {
      $("#cuit").parent().addClass("has-error");
      hay_error = true;
    }
    if ( emplearazsoc == '') {
      $("#razon-social").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleadomiciliolegal == '') {
      $("#domicilio-legal").parent().addClass("has-error");
      hay_error = true;
    }

    if ( empleasliquiid == '-1') {
      $("#liquidacion").parent().addClass("has-error");
      hay_error = true;
    }

    if ( ! $('#tbl-establecimiento').DataTable().data().any() ) {
      console.info("tabla establecimiento vacia");
      $("#tbl-establecimiento .dataTables_empty, .heading-estableciemientos").addClass("has-error");
      $("#tbl-establecimiento .dataTables_empty.has-error, .heading-estableciemientos.has-error").css("color","#dd4b39");
      hay_error = true;
    }
    if ( ! $('#tbl-actividad').DataTable().data().any() ) {
      console.info("tabla actividad vacia");
      $("#tbl-actividad .dataTables_empty, .heading-actividad").addClass("has-error");
      $("#tbl-actividad .dataTables_empty.has-error, .heading-actividad.has-error").css("color","#dd4b39");
      hay_error = true;
    }
    if ( ! $('#tbl-libros').DataTable().data().any() ) {
      console.info("tabla libros vacia");
      libro = null;
    }

    if( hay_error ) {
      $('#error').fadeIn('slow');
      WaitingClose();
      return;
    } 
    hay_error = false;
    $('#error').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

    // llamada ajax 
    $.ajax({
      data: {empleador:empleador, actividad:actividad, libro:libro, establecimiento:establecimiento},
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/setEmpleador',
      success: function(data){
        $('#modalEmpleador').modal('hide');
        /* nosexq bacdrop no se va... entonces lo oculto */
        $('#modalEmpleador').on('hidden.bs.modal', function () {
          $(".modal-backdrop.in").hide();
        });
        Refrescar();
      },
      error: function(result){
        console.error("problemas al guardar empleador: " + result);
        WaitingClose();
      },
    });
  });


  /* cargo plugin DataTable (debe ir al final de los script) */
  $("#tbl-empleadores").DataTable({
    "aLengthMenu": [ 10, 25, 50, 100 ],
    "autoWidth": true,
    "columnDefs": [ {
      "targets": [ 0 ], //no busco en acciones
      "searchable": false
    },
    {
      "targets": [ 0 ], //no ordena columna 0
      "orderable": false
    } ],
    "info": true,
    "ordering": true,
    "order": [[1, "asc"]],
    "paging": true,
    "language": {
      "sProcessing":     "Procesando...",
      "sLengthMenu":     "Mostrar _MENU_ registros",
      "sZeroRecords":    "No se encontraron resultados",
      "sEmptyTable":     "Ningún dato disponible en esta tabla",
      "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
      "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
      "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
      "sInfoPostFix":    "",
      "sSearch":         "Buscar:",
      "sUrl":            "",
      "sInfoThousands":  ",",
      "sLoadingRecords": "Cargando...",
      "oPaginate": {
        "sFirst":    "Primero",
        "sLast":     "Último",
        "sNext":     "Sig.",
        "sPrevious": "Ant."
      },
      "oAria": {
        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
      }
    },
    "lengthChange": true,
    "searching": true,
    "sPaginationType": "full_numbers",
    "sScrollX": '100%',
    "sScrollXInner": "100%",
    "bScrollCollapse": true,
  });
  $("#tbl-establecimiento").DataTable({
      /*"createdRow" :function( row, data, dataIndex ){
        $( row ).find('td:eq(1)').attr('data-name', 'actividad');
        $( row ).find('td:eq(2)').attr('data-name', 'rubro');
        $( row ).find('td:eq(3)').attr('data-name', 'convenio');
      },*/
      "aLengthMenu": [ 10, 25, 50, 100 ],
      "autoWidth": true,
      "columnDefs": [ {
          "targets": [ 0 ], //no busco en acciones
          "searchable": false
      },
      {
          "targets": [ 0 ], //no ordena columna 0
          "orderable": false
      } ],
      "info": true,
      "ordering": true,
      "order": [[1, "asc"]],
      "paging": true,
      "language": {
          "sProcessing":     "Procesando...",
          "sLengthMenu":     "Mostrar _MENU_ registros",
          "sZeroRecords":    "No se encontraron resultados",
          "sEmptyTable":     "Ningún dato disponible en esta tabla",
          "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
          "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
          "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
          "sInfoPostFix":    "",
          "sSearch":         "Buscar:",
          "sUrl":            "",
          "sInfoThousands":  ",",
          "sLoadingRecords": "Cargando...",
          "oPaginate": {
              "sFirst":    "Primero",
              "sLast":     "Último",
              "sNext":     "Sig.",
              "sPrevious": "Ant."
          },
          "oAria": {
              "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
              "sSortDescending": ": Activar para ordenar la columna de manera descendente"
          }
      },
      "lengthChange": true,
      "searching": true,
      "sPaginationType": "full_numbers",
      "sScrollX": '100%',
      "sScrollXInner": "100%",
      "bScrollCollapse": true,
  });
  $("#tbl-actividad").DataTable({
      "aLengthMenu": [ 10, 25, 50, 100 ],
      "autoWidth": true,
      "columnDefs": [ {
          "targets": [ 0 ], //no busco en acciones
          "searchable": false
      },
      {
          "targets": [ 0 ], //no ordena columna 0
          "orderable": false
      } ],
      "info": true,
      "ordering": true,
      "order": [[1, "asc"]],
      "paging": true,
      "language": {
          "sProcessing":     "Procesando...",
          "sLengthMenu":     "Mostrar _MENU_ registros",
          "sZeroRecords":    "No se encontraron resultados",
          "sEmptyTable":     "Ningún dato disponible en esta tabla",
          "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
          "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
          "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
          "sInfoPostFix":    "",
          "sSearch":         "Buscar:",
          "sUrl":            "",
          "sInfoThousands":  ",",
          "sLoadingRecords": "Cargando...",
          "oPaginate": {
              "sFirst":    "Primero",
              "sLast":     "Último",
              "sNext":     "Sig.",
              "sPrevious": "Ant."
          },
          "oAria": {
              "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
              "sSortDescending": ": Activar para ordenar la columna de manera descendente"
          }
      },
      "lengthChange": true,
      "searching": true,
      "sPaginationType": "full_numbers",
      "sScrollX": '100%',
      "sScrollXInner": "100%",
      "bScrollCollapse": true,
  });
  $("#tbl-libros").DataTable({
    "createdRow" :function( row, data, dataIndex ){
        $( row ).find('td:eq(1)').attr('data-name', 'librofechaentrega');
        $( row ).find('td:eq(2)').attr('data-name', 'librotomo');
      },
      "aLengthMenu": [ 10, 25, 50, 100 ],
      "autoWidth": true,
      "columnDefs": [ {
          "targets": [ 0 ], //no busco en acciones
          "searchable": false
      },
      {
          "targets": [ 0 ], //no ordena columna 0
          "orderable": false
      } ],
      "info": true,
      "ordering": true,
      "order": [[1, "asc"]],
      "paging": true,
      "language": {
          "sProcessing":     "Procesando...",
          "sLengthMenu":     "Mostrar _MENU_ registros",
          "sZeroRecords":    "No se encontraron resultados",
          "sEmptyTable":     "Ningún dato disponible en esta tabla",
          "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
          "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
          "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
          "sInfoPostFix":    "",
          "sSearch":         "Buscar:",
          "sUrl":            "",
          "sInfoThousands":  ",",
          "sLoadingRecords": "Cargando...",
          "oPaginate": {
              "sFirst":    "Primero",
              "sLast":     "Último",
              "sNext":     "Sig.",
              "sPrevious": "Ant."
          },
          "oAria": {
              "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
              "sSortDescending": ": Activar para ordenar la columna de manera descendente"
          }
      },
      "lengthChange": true,
      "searching": true,
      "sPaginationType": "full_numbers",
      "sScrollX": '100%',
      "sScrollXInner": "100%",
      "bScrollCollapse": true,
  });
  $("#tbl-notas").DataTable({
      "aLengthMenu": [ 10, 25, 50, 100 ],
      "autoWidth": true,
      "columnDefs": [ {
          "targets": [ 0, 4 ], //no busco en acciones
          "searchable": false
      },
      {
          "targets": [ 0, 4 ], //no ordena columna 0
          "orderable": false
      } ],
      "info": true,
      "ordering": true,
      "order": [[1, "asc"]],
      "paging": true,
      "language": {
          "sProcessing":     "Procesando...",
          "sLengthMenu":     "Mostrar _MENU_ registros",
          "sZeroRecords":    "No se encontraron resultados",
          "sEmptyTable":     "Ningún dato disponible en esta tabla",
          "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
          "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
          "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
          "sInfoPostFix":    "",
          "sSearch":         "Buscar:",
          "sUrl":            "",
          "sInfoThousands":  ",",
          "sLoadingRecords": "Cargando...",
          "oPaginate": {
              "sFirst":    "Primero",
              "sLast":     "Último",
              "sNext":     "Sig.",
              "sPrevious": "Ant."
          },
          "oAria": {
              "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
              "sSortDescending": ": Activar para ordenar la columna de manera descendente"
          }
      },
      "lengthChange": true,
      "searching": true,
      "sPaginationType": "full_numbers",
      "sScrollX": '100%',
      "sScrollXInner": "100%",
      "bScrollCollapse": true,
  });
  $("#tbl-nota").DataTable({
      "aLengthMenu": [ 10, 25, 50, 100 ],
      "autoWidth": true,
      "columnDefs": [ {
          "targets": [ 0, 4 ], //no busco en acciones
          "searchable": false
      },
      {
          "targets": [ 0, 4 ], //no ordena columna 0
          "orderable": false
      } ],
      "info": true,
      "ordering": true,
      "order": [[1, "asc"]],
      "paging": true,
      "language": {
          "sProcessing":     "Procesando...",
          "sLengthMenu":     "Mostrar _MENU_ registros",
          "sZeroRecords":    "No se encontraron resultados",
          "sEmptyTable":     "Ningún dato disponible en esta tabla",
          "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
          "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
          "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
          "sInfoPostFix":    "",
          "sSearch":         "Buscar:",
          "sUrl":            "",
          "sInfoThousands":  ",",
          "sLoadingRecords": "Cargando...",
          "oPaginate": {
              "sFirst":    "Primero",
              "sLast":     "Último",
              "sNext":     "Sig.",
              "sPrevious": "Ant."
          },
          "oAria": {
              "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
              "sSortDescending": ": Activar para ordenar la columna de manera descendente"
          }
      },
      "lengthChange": true,
      "searching": true,
      "sPaginationType": "full_numbers",
      "sScrollX": '100%',
      "sScrollXInner": "100%",
      "bScrollCollapse": true,
  });
</script>

<!-- ver segundo modal -->
<style type="text/css">
  #notaImgModal {
    z-index: 10000 !important;
  }
</style>

<script>
  /* guardar nota */
  $("#frmNotas").submit(function(event){
    event.preventDefault();
    WaitingOpen('Guardando Nota');

    //valido datos
    hay_error = false;
    max_char = false;
    $(".list-errors").empty();
    $('#errorNota').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error");

    //console.info("chars: "+$("#observacion").val().length);
    if ( $("#observacion").val().length > 21844 ) { 
      //maximos caracteres permitidos en un campo text con codificacion utf-8: 21,844 caracteres
      // https://stackoverflow.com/questions/4420164/how-much-utf-8-text-fits-in-a-mysql-text-field
      $("#observacion").parent().addClass("has-error");
      max_char = true;
    }
    if ( $("#fecha-entrega-nota").val() == '') {
      $("#fecha-entrega-nota").parent().addClass("has-error");
      hay_error = true;
    }
    if ( $("#nota").val() == '') {
      $("#nota").parent().parent().parent().addClass("has-error");
      hay_error = true;
    }

    if( hay_error ) {
      $('#errorNota').fadeIn('slow');
      $(".list-errors").html('Complete los campos obligatorios');
      WaitingClose();
      if( max_char ) {
        $('#errorNota').fadeIn('slow');
        $(".list-errors").append('<br>El texto debe tener un máximo de 21844 caracteres');
        WaitingClose();
        return;
      }
      return;
    }
    if( max_char ) {
      $('#errorNota').fadeIn('slow');
      $(".list-errors").html('El texto debe tener un máximo de 21844 caracteres');
      WaitingClose();
      return;
    }
    max_char = false;
    hay_error = false;
    $('#errorNota').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error");
    
    var formData = new FormData($("#frmNotas")[0]);
    $.ajax({
      url:$("#frmNotas").attr("action"),
      type:$("#frmNotas").attr("method"),
      data:formData,
      cache:false,
      contentType:false,
      processData:false,
      success:function(respuesta){
        if (respuesta==="exito") {
          //console.info("La nota ha sido guardada correctamente");
          $("#error").hide();
          //$("#frmNotas")[0].reset();
          $('#modalNotas').modal('hide');
          WaitingClose();
        }
        else if(respuesta==="error"){
          //console.error("La nota no se ha podido guardar");
          $(".list-errors").html(respuesta);
          $('#errorNota').fadeIn('slow');
          WaitingClose();
        }
        else{
          //console.error("Error al guardar la nota");
          $(".list-errors").html(respuesta);
          $('#errorNota').fadeIn('slow');
          WaitingClose();
        }
      }
    });
  });

  /* Cerrar Nota (cerrar segundo modal) */
  $('.btnUploadCancel').click(function(){
    $('#notaImgModal').modal('toggle');
  });
  /* Ver nota tamaño grande (abrir segundo modal) */
  var $img = null;
  $(document).on('click', '.pop', function(evt){
    $img = $(this).find('img').attr('src');
    console.log( "img: "+$img );
    $('#notaImgModal').on('shown.bs.modal', function (e) {
      $('.imagepreview').attr('src', $img);
    }).modal('show');
  });
</script>

<!-- Modal Empleador -->
<div class="modal fade" id="modalEmpleador" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <form method="POST" id="frmArchivo" accept-charset="utf-8">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel"><span id="modalAction"></span> Empleador</h4>
        </div>
        <div class="modal-body" id="modalBodyUsr">

          <div class="row">
            <div class="col-xs-12">
              <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
                    <h4><i class="icon fa fa-warning"></i> Error!</h4>
                    Revise que todos los campos obligatorios esten seleccionados
                </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
                  
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">Información Personal</a></li>
                  <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">Libros</a></li>
                  <li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false">Observaciones</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
                    <div class="row">
                      <div class="col-xs-12 col-md-4">
                        <div class="radio">
                          <label>
                            <input type="radio" name="tipoEmpleador" value="L" checked> Locales
                          </label>
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="radio">
                          <label>
                            <input type="radio" name="tipoEmpleador" value="C"> Centralización
                          </label>
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4 form-inline">
                        <div class="form-group">
                          <label for="fecha">Fecha *</label>
                          <input type='text' class="form-control" id="fecha" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="row">
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="nro-inscripcion">Nº Inscripción</label>
                          <input type="text" class="form-control" id="nro-inscripcion" value="">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="expediente">Expediente</label>
                          <input type="text" class="form-control" id="expediente" value="">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="cuit">CUIT</label>
                          <input type="text" class="form-control" id="cuit" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label for="razon-social">Razón Social</label>
                          <input type="text" class="form-control" id="razon-social" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label for="domicilio-legal">Domicilio Legal</label>
                          <input type="text" class="form-control" id="domicilio-legal" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                      <div class="panel panel-default">
                        <div class="panel-heading heading-estableciemientos" role="tab" id="headingOne">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="btn-block">
                              Establecimientos <i class="fa fa-angle-right"></i>
                            </a>
                          </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                          <div class="panel-body">
                            <div class="row">
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="calle">Calle</label>
                                  <input type="text" class="form-control" id="calle" value="">
                                </div>
                              </div><!-- /.row -->
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="altura">Altura</label>
                                  <input type="text" class="form-control" id="altura" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="piso">Piso</label>
                                  <input type="text" class="form-control" id="piso" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="dpto">Dpto</label>
                                  <input type="text" class="form-control" id="dpto" value="">
                                </div>
                              </div>

                              <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                  <label for="provincias">Provincia</label>
                                  <select class="form-control" id="provincias">
                                    <option value='-1'>Seleccione la provincia...</option>
                                    <?php foreach ($provincias as $provincia) {
                                      # code...
                                      echo "<option value=".$provincia['id'].">".$provincia['provincia']."</option>";
                                    }
                                    ?>
                                  </select>
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                  <label for="departamentos">Departamento</label>
                                  <select class="form-control" id="departamentos" disabled="disabled">
                                    <!-- -->
                                  </select>
                                </div>
                              </div>

                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="latitud">Latitud</label>
                                  <input type="text" class="form-control" id="latitud" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="longitud">Longitud</label>
                                  <input type="text" class="form-control" id="longitud" value="">
                                </div>
                              </div>

                              <div class="col-xs-12 col-md-3 col-md-offset-3">
                                <div class="form-group">
                                  <br>
                                  <button type="button" class="btn btn-primary pull-right disabled" id="add-establecimiento">Agregar Establecimiento</button>
                                </div>
                              </div>
                            </div><!-- /.row -->
                            <hr>
                            <table id="tbl-establecimiento" class="table table-bordered table-hover">
                              <thead>
                                <tr>
                                  <th>Acción</th>
                                  <th>Calle</th>
                                  <th>Altura</th>
                                  <th>Piso</th>
                                  <th>Depto</th>
                                  <th>Provincia</th>
                                  <th>Departamento</th>
                                  <th>Latitud</th>
                                  <th>Longitud</th>
                                </tr>
                              </thead>
                              <tbody>
                                <!-- -->
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div><!-- /.panel -->

                      <div class="panel panel-default">
                        <div class="panel-heading heading-actividad" role="tab" id="headingTwo">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" class="btn-block">
                              Actividad <i class="fa fa-angle-right"></i>
                            </a>
                          </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                          <div class="panel-body">
                            <div class="row">
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="actividad">Actividad</label>
                                  <select class="form-control" id="actividad">
                                    <option value='-1'>Seleccione la actividad...</option>
                                    <?php foreach ($actividad as $act) {
                                      # code...
                                      echo "<option value=".$act['actividadid']." title=".$act['descripciongeneral'].">".$act['descripcion']."</option>";
                                    }
                                    ?>
                                  </select>
                                </div>
                              </div><!-- /.row -->
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="rubro">Rubro</label>
                                  <input type="text" class="form-control" id="rubro" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="convenio">Convenio</label>
                                  <input type="text" class="form-control" id="convenio" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <br>
                                  <button type="button" class="btn btn-primary pull-right disabled" id="add-actividad">Agregar Actividad</button>
                                </div>
                              </div>
                            </div><!-- /.row -->
                            <hr>
                            <table id="tbl-actividad" class="table table-bordered table-hover">
                              <thead>
                                <tr>
                                  <th>Acción</th>
                                  <th>Actividad</th>
                                  <th>Rubro</th>
                                  <th>Convenio Colectivo Ley</th>
                                </tr>
                              </thead>
                              <tbody>
                                <!-- -->
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div><!-- /.panel -->
                    </div>

                    <div class="row">
                      <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                          <label for="liquidacion">Sistema de Liquidación</label>
                          <select class="form-control" id="liquidacion">
                            <option value='-1'>Seleccione el sistema de liquidación...</option>
                            <?php foreach ($liquidacion as $liquida) {
                              # code...
                              echo "<option value=".$liquida['sisliquiid'].">".$liquida['descripcion']."</option>";
                            }
                            ?>
                          </select>
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="row">
                      <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                          <label for="personal-masculino">Personal Masculino</label>
                          <input type="text" class="form-control" id="personal-masculino" value="">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                          <label for="personal-femenino">Personal Femenino</label>
                          <input type="text" class="form-control" id="personal-femenino" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2">
                    <div class="row">
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="tomo">Tomo</label>
                          <input type="text" class="form-control" placeholder="" id="tomo" value="">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="fecha-tomo">Fecha de entrega</label>
                          <input type="date" class="form-control" id="fecha-tomo" value="<?php echo date("Y-m-d") ?>">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <br>
                          <button type="button" class="btn btn-primary pull-right" id="add-libro">Agregar Libro</button>
                        </div>
                      </div>
                    </div><!-- /.row -->
                    <hr>
                    <table id="tbl-libros" class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>Acción</th>
                          <th>Tomo</th>
                          <th>Fecha de Entrega</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- -->
                      </tbody>
                    </table>
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_3">
                     <table id="tbl-nota" class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>Acción</th>
                          <th>Id Nota</th>
                          <th>Fecha</th>
                          <th>Observación</th>
                          <th>Imagen</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- -->
                      </tbody>
                    </table>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div>

            </div><!-- /.col -->
          </div><!-- /.row -->

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
        </div>
      </form>
    </div>
  </div>

  <!--Modal mostrar nota al 100% -->
  <div class="modal" id="notaImgModal" tabindex="-1" role="dialog" aria-labelledby="notaImgModal-title" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close btnUploadCancel" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="notaImgModal-title">Nota</h4>
        </div>
        <div class="modal-body">

          <img src="" class="imagepreview" style="width: 100%;" >

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btnUploadCancel" aria-label="Close">Cerrar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
</div>

<!-- Modal Notas-->
<div class="modal fade" id="modalNotas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <form method="POST" id="frmNotas" accept-charset="utf-8" role="form" action="<?php base_url();?>Empleador/guardarNota">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel"><span id="modalAction"></span> Observaciones</h4>
        </div>
        <div class="modal-body" id="modalBodyUsr">
            
            <div class="alert alert-danger alert-dismissable" id="errorNota" style="display: none">
              <h4><i class="icon fa fa-warning"></i> Error!</h4>
              <span class="list-errors"></span>
            </div>

            <input type="hidden" name="idEmpleador" id="id-empleador" value="">
            <div class="row">
              <div class="col-xs-12 col-md-6">
                <div class="form-group">
                  <label for="fecha-entrega-nota">Fecha de entrega</label>
                  <input type="date" name="fechaEntregaNota" class="form-control" id="fecha-entrega-nota" value="<?php echo date("Y-m-d") ?>">
                </div>
              </div>
              <div class="col-xs-12 col-md-6">
                <div class="form-group">
                  <label for="nota">Nota</label>
                  <div class="fileinput fileinput-new" data-provides="fileinput">
                    <span class="btn btn-default btn-file"><span>Examinar...</span><input type="file" id="nota" name="nota"/></span>
                    <span class="fileinput-filename"></span><span class="fileinput-new">Ningún archivo seleccionado</span>
                  </div>
                </div>
              </div>
              <div class="col-xs-12">
                <div class="form-group">
                  <label for="observacion">Observación</label>
                  <textarea name="observacion" class="form-control" id="observacion"></textarea> 
                </div>
              </div>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary" id="btnNotasSave">Guardar</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Modal Eliminar-->
<div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <form method="POST" id="frmArchivo" accept-charset="utf-8">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel"><span id="modalAction"></span> ELIMINAAAAARRRRR</h4>
        </div>
        <div class="modal-body" id="modalBodyUsr">

          <div class="row">
            <div class="col-xs-12">
              <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
                    <h4><i class="icon fa fa-warning"></i> Error!</h4>
                    Revise que todos los campos obligatorios esten seleccionados
                </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
                  
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">Información Personal</a></li>
                  <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">Libros</a></li>
                  <li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false">Observaciones</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
                    <div class="row">
                      <div class="col-xs-12 col-md-4">
                        <div class="radio">
                          <label>
                            <input type="radio" name="tipoEmpleador" value="L" checked> Locales
                          </label>
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="radio">
                          <label>
                            <input type="radio" name="tipoEmpleador" value="C"> Centralización
                          </label>
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4 form-inline">
                        <div class="form-group">
                          <label for="fecha">Fecha *</label>
                          <input type='text' class="form-control" id="fecha" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="row">
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="nro-inscripcion">Nº Inscripción</label>
                          <input type="text" class="form-control" id="nro-inscripcion" value="">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="expediente">Expediente</label>
                          <input type="text" class="form-control" id="expediente" value="">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="cuit">CUIT</label>
                          <input type="text" class="form-control" id="cuit" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label for="razon-social">Razón Social</label>
                          <input type="text" class="form-control" id="razon-social" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label for="domicilio-legal">Domicilio Legal</label>
                          <input type="text" class="form-control" id="domicilio-legal" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                      <div class="panel panel-default">
                        <div class="panel-heading heading-estableciemientos" role="tab" id="headingOne">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="btn-block">
                              Establecimientos <i class="fa fa-angle-right"></i>
                            </a>
                          </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                          <div class="panel-body">
                            <div class="row">
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="calle">Calle</label>
                                  <input type="text" class="form-control" id="calle" value="">
                                </div>
                              </div><!-- /.row -->
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="altura">Altura</label>
                                  <input type="text" class="form-control" id="altura" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="piso">Piso</label>
                                  <input type="text" class="form-control" id="piso" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="dpto">Dpto</label>
                                  <input type="text" class="form-control" id="dpto" value="">
                                </div>
                              </div>

                              <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                  <label for="provincias">Provincia</label>
                                  <select class="form-control" id="provincias">
                                    <option value='-1'>Seleccione la provincia...</option>
                                    <?php foreach ($provincias as $provincia) {
                                      # code...
                                      echo "<option value=".$provincia['id'].">".$provincia['provincia']."</option>";
                                    }
                                    ?>
                                  </select>
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                  <label for="departamentos">Departamento</label>
                                  <select class="form-control" id="departamentos" disabled="disabled">
                                    <!-- -->
                                  </select>
                                </div>
                              </div>

                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="latitud">Latitud</label>
                                  <input type="text" class="form-control" id="latitud" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="longitud">Longitud</label>
                                  <input type="text" class="form-control" id="longitud" value="">
                                </div>
                              </div>

                              <div class="col-xs-12 col-md-3 col-md-offset-3">
                                <div class="form-group">
                                  <br>
                                  <button type="button" class="btn btn-primary pull-right disabled" id="add-establecimiento">Agregar Establecimiento</button>
                                </div>
                              </div>
                            </div><!-- /.row -->
                            <hr>
                            <table id="tbl-establecimiento" class="table table-bordered table-hover">
                              <thead>
                                <tr>
                                  <th>Acción</th>
                                  <th>Calle</th>
                                  <th>Altura</th>
                                  <th>Piso</th>
                                  <th>Depto</th>
                                  <th>Provincia</th>
                                  <th>Departamento</th>
                                  <th>Latitud</th>
                                  <th>Longitud</th>
                                </tr>
                              </thead>
                              <tbody>
                                <!-- -->
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div><!-- /.panel -->

                      <div class="panel panel-default">
                        <div class="panel-heading heading-actividad" role="tab" id="headingTwo">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" class="btn-block">
                              Actividad <i class="fa fa-angle-right"></i>
                            </a>
                          </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                          <div class="panel-body">
                            <div class="row">
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="actividad">Actividad</label>
                                  <select class="form-control" id="actividad">
                                    <option value='-1'>Seleccione la actividad...</option>
                                    <?php foreach ($actividad as $act) {
                                      # code...
                                      echo "<option value=".$act['actividadid']." title=".$act['descripciongeneral'].">".$act['descripcion']."</option>";
                                    }
                                    ?>
                                  </select>
                                </div>
                              </div><!-- /.row -->
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="rubro">Rubro</label>
                                  <input type="text" class="form-control" id="rubro" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <label for="convenio">Convenio</label>
                                  <input type="text" class="form-control" id="convenio" value="">
                                </div>
                              </div>
                              <div class="col-xs-12 col-md-3">
                                <div class="form-group">
                                  <br>
                                  <button type="button" class="btn btn-primary pull-right disabled" id="add-actividad">Agregar Actividad</button>
                                </div>
                              </div>
                            </div><!-- /.row -->
                            <hr>
                            <table id="tbl-actividad" class="table table-bordered table-hover">
                              <thead>
                                <tr>
                                  <th>Acción</th>
                                  <th>Actividad</th>
                                  <th>Rubro</th>
                                  <th>Convenio Colectivo Ley</th>
                                </tr>
                              </thead>
                              <tbody>
                                <!-- -->
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div><!-- /.panel -->
                    </div>

                    <div class="row">
                      <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                          <label for="liquidacion">Sistema de Liquidación</label>
                          <select class="form-control" id="liquidacion">
                            <option value='-1'>Seleccione el sistema de liquidación...</option>
                            <?php foreach ($liquidacion as $liquida) {
                              # code...
                              echo "<option value=".$liquida['sisliquiid'].">".$liquida['descripcion']."</option>";
                            }
                            ?>
                          </select>
                        </div>
                      </div>
                    </div><!-- /.row -->

                    <div class="row">
                      <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                          <label for="personal-masculino">Personal Masculino</label>
                          <input type="text" class="form-control" id="personal-masculino" value="">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                          <label for="personal-femenino">Personal Femenino</label>
                          <input type="text" class="form-control" id="personal-femenino" value="">
                        </div>
                      </div>
                    </div><!-- /.row -->
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2">
                    <div class="row">
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="tomo">Tomo</label>
                          <input type="text" class="form-control" placeholder="" id="tomo" value="">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <label for="fecha-tomo">Fecha de entrega</label>
                          <input type="date" class="form-control" id="fecha-tomo" value="<?php echo date("Y-m-d") ?>">
                        </div>
                      </div>
                      <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                          <br>
                          <button type="button" class="btn btn-primary pull-right" id="add-libro">Agregar Libro</button>
                        </div>
                      </div>
                    </div><!-- /.row -->
                    <hr>
                    <table id="tbl-libros" class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>Acción</th>
                          <th>Tomo</th>
                          <th>Fecha de Entrega</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- -->
                      </tbody>
                    </table>
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_3">
                     <table id="tbl-nota" class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>Acción</th>
                          <th>Id Nota</th>
                          <th>Fecha</th>
                          <th>Observación</th>
                          <th>Imagen</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- -->
                      </tbody>
                    </table>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div>

            </div><!-- /.col -->
          </div><!-- /.row -->

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
        </div>
      </form>
    </div>
  </div>

  <!--Modal mostrar nota al 100% -->
  <div class="modal" id="notaImgModal" tabindex="-1" role="dialog" aria-labelledby="notaImgModal-title" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close btnUploadCancel" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="notaImgModal-title">Nota</h4>
        </div>
        <div class="modal-body">

          <img src="" class="imagepreview" style="width: 100%;" >

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btnUploadCancel" aria-label="Close">Cerrar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
</div>



<!-- Modal Confirma Eliminar -->
<!-- <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-question-circle"></i>Confirmación de Eliminar</h4>
      </div>

      <div class="modal-body alert alert-warning">
        <p>Está seguro que desea continuar? Esta acción es irreversible.</p>
        <p>Quiere proceder?</p>
        <p class="debug-url"></p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <a class="btn btn-danger" id="btnConfirmDelete">Eliminar</a>
      </div>
    </div>
  </div>
</div> -->
