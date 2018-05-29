  /* formato de cuit * /
  $('#cuit').inputmask({
    mask: '99-99999999-9'
  })


  /* trae departamentos al seleccionar la provincia * /
  $("#provincias").on("change", function() {
    id_provincia = $(this).val();
    //console.info( 'provincia: '+ id_provincia );
    $("#departamentos").removeAttr( "disabled" );
    traerDepartamentos( id_provincia );
  });
  /* Trae los departamentos de la provincia * /
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


  /* ajusto el anocho de la cabecera de la tabla * /
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // https://datatables.net/reference/api/columns.adjust() states that this function is trigger on window resize
      $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
  });
  /*  * /
  $('#collapseOne').on('shown.bs.collapse', function () {
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
    $('#headingOne .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  $('#collapseOne').on('hidden.bs.collapse', function () {
    $('#headingOne .fa').toggleClass('fa-angle-right fa-angle-down');
  })

  /* habilita el boton agregar actividad * /
  $("#actividad").on("change", function() {
    $("#add-actividad").removeClass("disabled");
  });
  /* agrego actividades * /
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
  /* elimina fila de la tabla * /
  $(document).on("click",".elirow",function() {
    $('#tbl-actividad').DataTable().row( $(this).closest('tr') ).remove().draw();
  });

  /* agrego libros * /
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
    var output = getFormattedDate(); //dia actual formateado
    $('#fecha-tomo').val(output);
  });
  /* elimina fila de la tabla * /
  $(document).on("click",".elirow",function() {
    $('#tbl-libros').DataTable().row( $(this).closest('tr') ).remove().draw();
  });

  /* Guarda Empleador */
  $('#btnSave').click(function(){
    // informacion personal 
    var empleatipo           = document.querySelector('input[name="tipoEmpleador"]:checked').value;
    var empleafecha          = $('#fecha').val();
    var empleainscrip        = $('#nro-inscripcion').val();
    var empleaexp            = $('#expediente').val();
    var empleacui            = $('#cuit').val();
    var emplearazsoc         = $('#razon-social').val();
    var empleadomicilior     = $('#domicilio-real').val();
    var empleaprov           = $('#provincias').val();
    var empleadepid          = $('#departamentos').val();
    var empleadomiciliolegal = $('#domicilio-legal').val();
    var empleasliquiid       = $('#liquidacion').val();
    var empleapmasc          = $('#personal-masculino').val();
    var empleapfem           = $('#personal-femenino').val();
    var empleador = {
      'empleatipo' : empleatipo,
      'empleafecha' : empleafecha,
      'empleainscrip' : empleainscrip,
      'empleaexp' : empleaexp,
      'empleacui' : empleacui,
      'emplearazsoc' : emplearazsoc,
      'empleadomicilior' : empleadomicilior,
      'empleaprov' : empleaprov,
      'empleadepid' : empleadepid,
      'empleadomiciliolegal' : empleadomiciliolegal,
      'empleasliquiid' : empleasliquiid,
      'empleapmasc' : empleapmasc,
      'empleapfem' : empleapfem,
    };

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
    var hay_error = false;
    if ( empleafecha == '') {
      //$("#fecha").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleainscrip == '') {
      //$("#nro-inscripcion").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleaexp == '') {
      //$("#expediente").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleacui == '') {
      //$("#cuit").parent().addClass("has-error");
      hay_error = true;
    }
    if ( emplearazsoc == '') {
      //$("#razon-social").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleadomicilior == '') {
      //$("#domicilio-real").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleaprov == '-1') {
      //$("#provincias").parent().addClass("has-error");
      hay_error = true;
    }
    //if ( (empleadepid == null) || (empleadepid == '-1') ) {
    if ( empleadepid == null ) {
      //$("#departamentos").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleadomiciliolegal == '') {
      //$("#domicilio-legal").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleasliquiid == '-1') {
      //$("#liquidacion").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleapmasc == '') {
      //$("#personal-masculino").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleapfem == '') {
      //$("#personal-femenino").parent().addClass("has-error");
      hay_error = true;
    }

    if( hay_error ) {
      $('#error').fadeIn('slow');
      return;
    } //else {
      hay_error = false;
      $('#error').fadeOut('slow');
      $('[class*="has-error"]').removeClass("has-error");

      // llamada ajax 
      $.ajax({
        data: {empleador:empleador, actividad:actividad, libro:libro},
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Empleador/setEmpleador',
        success: function(data){
          Refrescar();
          WaitingClose();
        },
        error: function(result){
          console.error("problemas al guardar empleador: " + result);
          WaitingClose();
        },
      });
    //}
  });

  function Refrescar(){
    $('#content').empty();
    $('#content').load('<?php echo base_url(); ?>index.php/Empleador/index/<?php echo $permission; ?>');
    WaitingClose();
  }

/* fecha actual -> pasar a js * /
  function getFormattedDate() {
    var date = new Date();
    var str = date.getFullYear() + "-" + getFormattedPartTime(date.getMonth()) + "-" + getFormattedPartTime(date.getDate()) + " " +  getFormattedPartTime(date.getHours()) + ":" + getFormattedPartTime(date.getMinutes()) + ":" + getFormattedPartTime(date.getSeconds());

    return str;
  }
  function getFormattedPartTime(partTime) {
    if (partTime<10)
      return "0"+partTime;
    return partTime;
  }


  /* cargo plugin DataTable (debe ir al final de los script) * /
  $("#tbl-actividad").DataTable({
      /*"createdRow" :function( row, data, dataIndex ){
        $( row ).find('td:eq(1)').attr('data-name', 'actividad');
        $( row ).find('td:eq(2)').attr('data-name', 'rubro');
        $( row ).find('td:eq(3)').attr('data-name', 'convenio');
      },* /
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














    /* llama vista agregar proveedor*/
    $('#btnAdd').click( function(){
    LoadEmpleador();
  });
  function LoadEmpleador(){
    action = $('#btnAdd').attr('data-action');

    LoadIconAction('modalAction', action );
    WaitingOpen('Agregar Empleador');

    $.ajax({
        data: { action:action },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Empleador/getEmpleador',
        success: function(result){
            $("#modalBodyUsr").html(result.html);
            setTimeout("$('#modalEmpleador').modal('show')",800);
            WaitingClose();
        },
        error: function(result){
            console.error("Error en getEmpleador");
            WaitingClose();
        },
    });
  }

  /* cargo plugin DataTable (debe ir al final de los script) * /
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
  */