<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
        <h4><i class="icon fa fa-warning"></i> Error!</h4>
        Revise que todos los campos obligatorios esten seleccionados
      </div>
    </div>
  </div>
  <?php
    /*dump($permission, "permission");
    dump($provincias, "provincias");
    dump($liquidacion, "liquidacion");
    dump($actividad, "actividad");
    dump_exit($list, "list");*/
  ?>
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Empleadores</h3>
        </div><!-- /.box-header -->
        <div class="box-body">
        
        <div class="nav-tabs-custom">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">Información Personal</a></li>
            <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">Libros</a></li>
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
                    <input type='text' class="form-control" id="fecha" value="<?php echo date("Y-m-d H:i:s") ?>">
                  </div>
                </div>
              </div><!-- /.row -->

              <div class="row">
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label for="nro-inscripcion">Nº Inscripción *</label>
                    <input type="text" class="form-control" id="nro-inscripcion" value="">
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label for="expediente">Expediente *</label>
                    <input type="text" class="form-control" id="expediente" value="">
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label for="cuit">CUIT *</label>
                    <input type="text" class="form-control" id="cuit" value="">
                  </div>
                </div>
              </div><!-- /.row -->

              <div class="row">
                <div class="col-xs-12">
                  <div class="form-group">
                    <label for="razon-social">Razón Social *</label>
                    <input type="text" class="form-control" id="razon-social" value="">
                  </div>
                </div>
              </div><!-- /.row -->

              <div class="row">
                <div class="col-xs-12">
                  <div class="form-group">
                    <label for="domicilio-legal">Domicilio Legal *</label>
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
                        <div class="col-xs-12">
                          <div class="alert alert-danger alert-dismissable" id="errorAddEstablec" style="display: none">
                            <h4><i class="icon fa fa-warning"></i> Error!</h4>
                            Revise que todos los campos obligatorios esten seleccionados
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="calle">Calle *</label>
                            <input type="text" class="form-control" id="calle" value="">
                          </div>
                        </div><!-- /.row -->
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="altura">Altura *</label>
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
                            <label for="provincias">Provincia *</label>
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
                            <label for="departamentos">Departamento *</label>
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
                            <button type="button" class="btn btn-primary pull-right" id="add-establecimiento">Agregar Establecimiento</button>
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
                        <div class="col-xs-12">
                          <div class="alert alert-danger alert-dismissable" id="errorAddActividad" style="display: none">
                            <h4><i class="icon fa fa-warning"></i> Error!</h4>
                            Revise que todos los campos obligatorios esten seleccionados
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="actividad">Actividad *</label>
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
                            <label for="rubro">Rubro *</label>
                            <input type="text" class="form-control" id="rubro" value="">
                          </div>
                        </div>
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="convenio">Convenio *</label>
                            <input type="text" class="form-control" id="convenio" value="">
                          </div>
                        </div>
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <br>
                            <button type="button" class="btn btn-primary pull-right" id="add-actividad">Agregar Actividad</button>
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
                    <label for="liquidacion">Sistema de Liquidación *</label>
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
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_2">
              
              <div class="row">
                <div class="col-xs-12">
                  <div class="alert alert-danger alert-dismissable" id="errorAddLibro" style="display: none">
                    <h4><i class="icon fa fa-warning"></i> Error!</h4>
                    Revise que todos los campos obligatorios esten seleccionados
                  </div>
                </div>
              </div>

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
                    <input type="text" class="form-control" id="fecha-tomo" value="<?php echo date("Y-m-d H:i:s") ?>">
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
            </div><!-- /.tab-pane -->
          </div><!-- /.tab-content -->
        </div>

        </div><!-- /.box-body -->
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="btnVolver">Volver al listado</button>
          <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
        </div><!-- box-footer -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<script>

  /* formato de cuit */
  $('#cuit').inputmask({
    mask: '99-99999999-9'
  })


	/* trae departamentos al seleccionar la provincia */
	$("#provincias").on("change", function() {
		id_provincia = $(this).val();
    //console.info( 'provincia: '+ id_provincia );
    $("#departamentos").removeAttr( "disabled" );
    traerDepartamentos( id_provincia );
  });
  /* Trae los departamentos de la provincia */
  function traerDepartamentos( id_provincia ) {
  	//console.info( 'provinciaAjax: '+ id_provincia );
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
        WaitingClose();
      },
      error: function(result){
        //alert(result);
        console.error("problemas al llenar los departamentos: " + result);
        WaitingClose();
      },
    });
  }


  /* ajusto el anocho de la cabecera de la tabla */
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // https://datatables.net/reference/api/columns.adjust() states that this function is trigger on window resize
      $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
  });
  /*  */
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

    // validar
    hay_error = false;
    $('#errorAddEstablec').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    //
    if ( establecalle == '') {
      $("#calle").parent().addClass("has-error");
      hay_error = true;
    }
    if ( establealtura == '') {
      $("#altura").parent().addClass("has-error");
      hay_error = true;
    }
    if ( provid == '-1') {
      $("#provincias").parent().addClass("has-error");
      hay_error = true;
    }
    if ( dptoid == null || dptoid == '-1' ) {
      $("#departamentos").parent().addClass("has-error");
      hay_error = true;
    }
    //
    if( hay_error ) {
      $('#errorAddEstablec').fadeIn('slow');
      WaitingClose();
      return;
    }
    //
    hay_error = false;
    $('#errorAddEstablec').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    
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
  /* elimina fila de la tabla establecimientos */
  $(document).on("click",".elirow",function() {
    $('#tbl-establecimiento').DataTable().row( $(this).closest('tr') ).remove().draw();
  });

  /* agrego actividades */
  $("#add-actividad").click(function (e) {
    var id_actividad = $('#actividad').val();
    var actividad    = $("#actividad option:selected").val();
    var rubro        = $('#rubro').val();
    var convenio     = $('#convenio').val();

    // validar
    hay_error = false;
    $('#errorAddActividad').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    //
    if ( actividad == '-1') {
      $("#actividad").parent().addClass("has-error");
      hay_error = true;
    }
    if ( rubro == '') {
      $("#rubro").parent().addClass("has-error");
      hay_error = true;
    }
    if ( convenio == '') {
      $("#convenio").parent().addClass("has-error");
      hay_error = true;
    }
    //
    if( hay_error ) {
      $('#errorAddActividad').fadeIn('slow');
      WaitingClose();
      return;
    }
    //
    hay_error = false;
    $('#errorAddActividad').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

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
  $(document).on("click",".elirow",function() {
    $('#tbl-actividad').DataTable().row( $(this).closest('tr') ).remove().draw();
  });

  /* agrego libros */
  $("#add-libro").click(function (e) {
		var tomo       = $('#tomo').val();
		var fecha_tomo = $('#fecha-tomo').val();

    // validar
    hay_error = false;
    $('#errorAddLibro').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    //
    if ( fecha_tomo == '') {
      $("#fecha-tomo").parent().addClass("has-error");
      hay_error = true;
    }
    if ( tomo == '') {
      $("#tomo").parent().addClass("has-error");
      hay_error = true;
    }
    //
    if( hay_error ) {
      $('#errorAddLibro').fadeIn('slow');
      WaitingClose();
      return;
    }
    //
    hay_error = false;
    $('#errorAddLibro').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

		//agrego valores a la tabla
		$('#tbl-libros').DataTable().row.add( [
			"<i class ='fa fa-ban elirow text-primary' style='cursor:pointer'></i>",
			tomo,
      fecha_tomo,
    ]).draw();

		//limpio formulario
		$('#tomo').val('');
    //var output = getFechaHoraFormateada( new Date() ); //dia actual formateado
		$('#fecha-tomo').val();//val(output);
	});
  /* elimina fila de la tabla */
  $(document).on("click",".elirow",function() {
    $('#tbl-libros').DataTable().row( $(this).closest('tr') ).remove().draw();
  });



  /* volver al listado de empleadores */
  $("#btnVolver").on("click", function(e){
    WaitingOpen('Cargando Empleadores');
    $('#content').empty();
    $("#content").load( '<?php echo base_url() ?>index.php/Empleador/index/<?php echo $permission ?>' );
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
    //var empleacui            = $('#cuit').val(); 
    var cuitformateado       = $('#cuit').val();
        cuitformateado       = cuitformateado.split('-');
    var empleacui            = cuitformateado[0]+cuitformateado[1]+cuitformateado[2]; 
    var emplearazsoc         = $('#razon-social').val(); 
    var empleadomicilior     = null;
    var empleadomiciliolegal = $('#domicilio-legal').val(); 
    var empleadepid          = 0;
    var emplealocid          = 0;//$('#departamentos').val(); 
    var empleaprovid         = 0;//$('#provincias').val();  
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
      'empleadomicilior' : empleadomicilior,
      'empleadomiciliolegal' : empleadomiciliolegal, 
      'empleadepid' : empleadepid, 
      'emplealocid' : emplealocid, 
      'empleaprovid' : empleaprovid,
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
    
    // validado que ingresen soloo numeros en la inscripción
    //https://oscargascon.es/validacion-simple-de-formularios-con-jquery/
    var namePattern = "^[0-9]{1,30}$";
    var respuesta = $("#nro-inscripcion").val().match(namePattern) ? true : false;
    if (!respuesta) {
      hay_error = true;
      $("#nro-inscripcion").val("");
      $("#nro-inscripcion").attr("placeholder", "Ingrese solo números");
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
        Refrescar();
      },
      error: function(result){
        console.error("problemas al guardar empleador: " + result);
        WaitingClose();
      },
		});
  });

  function Refrescar(){
    $('#content').empty();
    $("#content").load( '<?php echo base_url() ?>index.php/Empleador/index/<?php echo $permission ?>' );
    $('#modalEmpleador').modal('hide');
    WaitingClose();
  }
  //cierro el backdrop del modal 
  $('#modalEmpleador').on('shown.bs.modal', function () {
    $(".modal-backdrop.in").hide();
  })
  /*temporal para prueba * /
  function borrar() {
  	$('[class*="has-error"]').removeClass("has-error");
  	$('#error').fadeOut('slow');
  }*/


  /* cargo plugin DataTable (debe ir al final de los script) */
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
      "order": [[0, "asc"]],
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
      "order": [[0, "asc"]],
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
      "order": [[0, "asc"]],
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


  // cargo plugin DateTimePicker
  $('#fecha, #fecha-tomo, #libroFecha').datetimepicker({
    format: 'YYYY-MM-DD H:mm:ss',
    locale: 'es',
  });
</script>
