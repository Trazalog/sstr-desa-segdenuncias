<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <?php //dump( json_encode( $cuit ) ) ?>
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Panel de Empleadores</h3>
        </div><!-- /.box-header -->
        <div class="box-body">

          <div class="row">
            <div class="col-xs-6 ">
              <div class="form-group">
                <label class="" for="panelSearch">Buscar empleador por CUIT o Razón Social</label>
                <div class="input-group">
                  <input type="text" class="form-control" id="search-input" placeholder="Buscar...">
                  <input type="hidden" id="empleador-input" name="empleador-input">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
                  </span>
                </div><!-- /input-group -->
              </div>
            </div>
          </div><!-- /.row -->

          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title">
                  <a class="btn-block" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Empleador <i class="fa fa-angle-right"></i>
                  </a>
                </h4>
              </div>
              <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">



                  <div class="row">
                    <div class="col-xs-12 col-md-4">
                      <div class="radio disabled">
                        <label>
                          <input type="radio" name="tipoEmpleador" value="L" checked disabled> Locales
                        </label>
                      </div>
                    </div>
                    <div class="col-xs-12 col-md-4">
                      <div class="radio disabled">
                        <label>
                          <input type="radio" name="tipoEmpleador" value="C" disabled> Centralización
                        </label>
                      </div>
                    </div>
                    <div class="col-xs-12 col-md-4 form-inline">
                      <div class="form-group">
                        <label for="fecha">Fecha</label>
                        <input type='text' class="form-control" id="fecha" value="" disabled>
                      </div>
                    </div>
                  </div><!-- /.row -->

                  <div class="row">
                    <div class="col-xs-12 col-md-4">
                      <div class="form-group">
                        <label for="nro-inscripcion">Nº Inscripción</label>
                        <input type="text" class="form-control" id="nro-inscripcion" value="" disabled>
                      </div>
                    </div>
                    <div class="col-xs-12 col-md-4">
                      <div class="form-group">
                        <label for="expediente">Expediente</label>
                        <input type="text" class="form-control" id="expediente" value="" disabled>
                      </div>
                    </div>
                    <div class="col-xs-12 col-md-4">
                      <div class="form-group">
                        <label for="cuit">CUIT</label>
                        <input type="text" class="form-control" id="cuit" value="" disabled>
                      </div>
                    </div>
                  </div><!-- /.row -->

                  <div class="row">
                    <div class="col-xs-12">
                      <div class="form-group">
                        <label for="razon-social">Razón Social</label>
                        <input type="text" class="form-control" id="razon-social" value="" disabled>
                      </div>
                    </div>
                  </div><!-- /.row -->

                  <div class="row">
                    <div class="col-xs-12">
                      <div class="form-group">
                        <label for="domicilio-legal">Domicilio Legal</label>
                        <input type="text" class="form-control" id="domicilio-legal" value="" disabled>
                      </div>
                    </div>
                  </div><!-- /.row -->

                  <div class="row">
                    <div class="col-xs-12 col-md-6">
                      <div class="form-group">
                        <label for="liquidacion">Sistema de Liquidación</label>
                        <select class="form-control" id="liquidacion" disabled>
                          <!-- -->
                        </select>
                      </div>
                    </div>
                  </div><!-- /.row -->

                  <div class="row">
                    <div class="col-xs-12 col-md-6">
                      <div class="form-group">
                        <label for="personal-masculino">Personal Masculino</label>
                        <input type="text" class="form-control" id="personal-masculino" value="" disabled>
                      </div>
                    </div>
                    <div class="col-xs-12 col-md-6">
                      <div class="form-group">
                        <label for="personal-femenino">Personal Femenino</label>
                        <input type="text" class="form-control" id="personal-femenino" value="" disabled>
                      </div>
                    </div>
                  </div><!-- /.row -->
                  
                  <div class="row">
                    <div class="col-xs-12">
                      <div class="form-group">
                        <label for="personal-masculino">Actividad</label>
                        <div class="panel panel-default">
                        <div class="panel-body">
                        <table id="tbl-actividad" class="table table-bordered table-hover">
                          <thead>
                            <tr>
                              <th>Actividad</th>
                              <th>Rubro</th>
                              <th>Convenio Colectivo Ley</th>
                            </tr>
                          </thead>
                          <tbody>
                            <!-- -->
                          </tbody>
                        </table>
                      </div></div></div>
                    </div>
                  </div><!-- /.row -->



                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                  <a class="btn-block" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Establecimientos <i class="fa fa-angle-right"></i>
                  </a>
                </h4>
              </div>
              <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="panel-body">
                  <table id="tbl-establecimiento" class="table table-bordered table-hover table-striped">
                    <thead>
                      <tr>
                        <th></th>
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
                  </table>
                </div>
              </div>
            </div>
          </div>



        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<style type="text/css">
  td.details-control:before {
    content: "\f0fe"; 
    font-family: FontAwesome;
    color: #00a65a;
    cursor: pointer;
  }
  tr.shown td.details-control:before {
    content: "\f146"; 
    font-family: FontAwesome;
    color: #dd4b39;
    cursor: pointer;
  }
</style>

<script>
  var executed = false;
  /* Typeahead */
  var $jsonData = <?php echo json_encode( $cuit ) ?>;
  var dataId = new Bloodhound({
    datumTokenizer: function($jsonData) {
      return Bloodhound.tokenizers.whitespace($jsonData.id);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    local: $jsonData
  });
  var dataCuit = new Bloodhound({
    datumTokenizer: function($jsonData) {
      return Bloodhound.tokenizers.whitespace($jsonData.cuit);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    local: $jsonData
  });
  var dataNombre = new Bloodhound({
    datumTokenizer: function($jsonData) {
      return Bloodhound.tokenizers.whitespace($jsonData.nombre);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    local: $jsonData
  });

  dataId.initialize();
  dataCuit.initialize();
  dataNombre.initialize();

  $('#search-input').typeahead({
    autoSelect: true,
    highlight: true
  }, {
    name: 'dataCuit',
    displayKey: 'cuit',
    source: dataCuit.ttAdapter(),
  }, {
    name: 'dataNombre',
    displayKey: 'nombre',
    source: dataNombre.ttAdapter()
  });

  /* al cargar*/
  $('#search-input').on('typeahead:selected', function (e, data) {
    //console.log(data);
    $('#empleador-input').val(data.id);
    traeDatosEmpleador(data.id);
  });


  /* trae datos del empleador */
  function traeDatosEmpleador(id) {
    WaitingOpen("Cargando Empleador...");
    $.ajax({
      data: { id : id },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/panelEmpleador/get_empleador_por_id',
      success: function(data){
        WaitingClose();
        console.table(data);
        cargaDatos(data);
        //console.info( JSON.parse(data.establecimientos) );
      },
      error: function(result){
        console.error("error al traer empleador");
        WaitingClose();
      },
    });
  };

  /* carga de datos */
  function cargaDatos(data) {
    //console.info(data.empleador[0].empleaid);
    /* carga datos de empleador */
    $("input[name='tipoEmpleador'][value='"+data.empleador[0].empleatipo+"']").prop('checked', true);
    $('#fecha').val( data.empleador[0].empleafecha );
    $('#nro-inscripcion').val( data.empleador[0].empleainscrip );
    $('#expediente').val( data.empleador[0].empleaexp );
    $('#cuit').val( data.empleador[0].empleacui );
    $('#razon-social').val( data.empleador[0].emplearazsoc );
    $('#domicilio-legal').val( data.empleador[0].empleadomiciliolegal );
    var opcion = "<option value='"+data.empleador[0].empleasliquiid+"'>" +data.empleador[0].sisliquidescrip+ "</option>";
    $('#liquidacion option').remove();
    $('#liquidacion').append(opcion);
    $("#liquidacion option[value='"+data.empleador[0].empleasliquiid+"']").attr("selected",true);
    $('#personal-masculino').val( data.empleador[0].empleapmasc ); 
    $('#personal-femenino').val( data.empleador[0].empleapfem );
    /* carga actividades */
    //console.table(data.actividades);
    $('#tbl-actividad').DataTable().clear();
    for(i = 0; i < data.actividades.length; i++) {
      var actividad = data.actividades[i].descripcion;
      var rubro     = data.actividades[i].detaactivrubro;
      var convenio  = data.actividades[i].detaactivconvenio;
      //agrego valores a la tabla
      $('#tbl-actividad').DataTable().row.add( [
        actividad,
        rubro,
        convenio
        ]
      ).draw();
    }
    /* carga establecimientos */
    var table = $("#tbl-establecimiento").DataTable();
    table.clear();
    for(i = 0; i < data.establecimientos.length; i++) {
      var id              = data.establecimientos[i].estableid;
      var establecalle    = data.establecimientos[i].establecalle;
      var establealtura   = data.establecimientos[i].establealtura;
      var establepiso     = data.establecimientos[i].establepiso;
      var establedpto     = data.establecimientos[i].establedpto;
      var establelatitud  = data.establecimientos[i].establelatitud;
      var establelongitud = data.establecimientos[i].establelongitud;
      var provincia       = data.establecimientos[i].provincia;
      var departamento    = data.establecimientos[i].localidad;
      //agrego valores a la tabla
      var rowNode = table.row.add( [
        '<td></td>',
        establecalle,
        establealtura,
        establepiso,
        establedpto,
        provincia,
        departamento,
        establelatitud,
        establelongitud,
        ]
      ).node();
      rowNode.id = id;
      table.draw();
      $( rowNode ).find('td').eq(0).addClass('details-control');
    }


    /* Doy formato al collapse de la fila (en el mismo ambito donde defino var table) */
    function format ( data ) {
        //console.table(data);
        // `d` is the original data object for the row
        $html1 = '<div class="box box-solid box-default">'+
            '<div class="box-header"><h3 class="box-title">Denuncias</h3></div>'+
            '<div class="box-body">'+
                '<table id="tblchild-denuncias" class="table table-bordered table-hover table-striped">'+
                    '<thead><tr>'+
                        '<th>Fecha de denuncia</th>'+
                        '<th>Riesgo</th>'+
                        '<th>Programa</th>'+
                        '<th>Fecha verificación</th>'+
                        '<th>inclusión</th>'+
                        '<th>Obra</th>'+
                        '<th>Acta</th>'+
                        '<th>Motivos</th>'+
                    '</tr></thead>';
        
        for(i=0; i<data.denuncias.length; i++) {
            $html1 = $html1 + '<tr>'+
                        '<td>'+data.denuncias[i].denunciasfecha+'</td>'+
                        '<td>'+data.denuncias[i].denunciariesgo+'</td>'+
                        '<td>'+data.denuncias[i].denunciaprograma+'</td>'+
                        '<td>'+data.denuncias[i].denunciafechaverif+'</td>'+
                        '<td>'+data.denuncias[i].denunciainclucion+'</td>'+
                        '<td>'+data.denuncias[i].duncianroobra+'</td>'+
                        '<td>'+data.denuncias[i].denuncianroacta+'</td>'+
                        '<td>'+data.denuncias[i].denunciamotivos+'</td>'+
                    '</tr>';
        }
        
        $html1 = $html1 + '</table>'+
            '</div></div>';

        $html2 = '<div class="box box-solid box-default">'+
            '<div class="box-header"><h3 class="box-title">Inspecciones</h3></div>'+
            '<div class="box-body">'+
                '<table id="tblchild-inspecciones" class="table table-bordered table-hover table-striped">'+
                    '<thead><tr>'+
                        '<th>Fecha de asignación</th>'+
                        '<th>Fecha de recepción</th>'+
                        '<th>Descripcion</th>'+
                        '<th>Inspector</th>'+
                    '</tr></thead>';
        
        for(i=0; i<data.inspecciones.length; i++) {
            $html2 = $html2 + '<tr>'+
                        '<td>'+data.inspecciones[i].inspeccionfechaasigna+'</td>'+
                        '<td>'+data.inspecciones[i].inspeccionfecharecp+'</td>'+
                        '<td>'+data.inspecciones[i].inspecciondescrip+'</td>'+ 
                        '<td>'+data.inspecciones[i].inspector+'</td>'+
                    '</tr>';
        }
        
        $html2 = $html2 + '</table>'+
            '</div></div>';

        return $html1 + $html2;
    }
    /* Agrego un listener al evento expandir/colapsar fila (en el mismo ambito donde defino var table) */
    $('#tbl-establecimiento tbody').on('click', 'td.details-control', function(){
        var tr = $(this).closest('tr');
        var row = table.row( tr );
        var id = tr.attr('id');

        if(row.child.isShown()){
          // This row is already open - close it
          row.child.hide();
          tr.removeClass('shown');
        } else {
          WaitingOpen();
          // Open this row
          $.ajax({
            data: { id : id },
            dataType: 'json',
            type: 'POST',
            url: 'index.php/panelEmpleador/get_establecimiento_datos_por_id',
            success: function(data){
              console.table(data);
              row.child(format( data )).show();
              tr.addClass('shown');
              /**/
              cargaTablasHijas();
              WaitingClose();
            },
            error: function(result){
              console.error("error al traer denuncia");
              WaitingClose();
            },
          });
        }
    });

    /* Expando el collapse de empleadores */
    $("#collapseOne").collapse('show');
  }



  /***** TABLAS *****/

  /*  */
  $('#collapseOne').on('shown.bs.collapse', function () {
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
    $('#collapseTwo').collapse('hide');
    $('#headingOne .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  $('#collapseOne').on('hidden.bs.collapse', function () {
    $('#headingOne .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  /*  */
  $('#collapseTwo').on('shown.bs.collapse', function () {
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
    $('#collapseOne').collapse('hide');
    $('#headingTwo .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  $('#collapseTwo').on('hidden.bs.collapse', function () {
    $('#headingTwo .fa').toggleClass('fa-angle-right fa-angle-down');
  })

  /* inicializo datatable en la tabla tbl-actividad */
  $("#tbl-actividad").DataTable({
    "aLengthMenu": [ 10, 25, 50, 100 ],
    "autoWidth": true,
    /*"columnDefs": [ {
        "targets": [ 0 ], //no busco en acciones
        "searchable": false
      },
      {
        "targets": [ 0 ], //no ordena columna 0
        "orderable": false
      } ],*/
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
  /* inicializo datatable en la tabla tbl-establecimiento */
  $("#tbl-establecimiento").DataTable({
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

  /* función para ejecutar solamente una funcion!!! */
  function once(fn, context) { 
    var result;
    return function() { 
      if(fn) {
        result = fn.apply(context || this, arguments);
        fn = null;
      }
      return result;
    };
  }
  /* defino tablas hijas. Las ejecuto una sola vez (por si la llamo varias veces) */
  var cargaTablasHijas = once(function(){
    $('#tblchild-denuncias, #tblchild-inspecciones').DataTable({
                "aLengthMenu": [ 5, 10, 25 ],
                "autoWidth": true,
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
  });
</script>
