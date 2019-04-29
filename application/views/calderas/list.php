<input type="hidden" id="permission" value="<?php echo $permission;?>">
<?php
if (strpos($permission,'Del') == false) {
  msjeSinPermisoVista();
  exit;
}
?>
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Calderas y Recipientes a Presión</h3>  
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd" title="Agregar Equipo">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->

        <div class="box-body">
          <table id="tbl-calderas" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Tipo</th>
                <th>Empresa</th>
                <th>Establecimiento Identificador</th>
                <th>Nombre Fabricante</th>
                <th>Nro Serie</th>
                <th>Año Fabricación</th>
              </tr>
            </thead>
            <tbody>
            <?php 
              foreach($list as $e)
              {
                echo '<tr id="'.$e['cald_id'].'">';
                  echo '<td>';
                  echo '<i class="fa fa-fw fa-search text-light-blue btnVer" style="cursor:pointer; margin-left:15px;" title="Ver"></i>';
                  if (strpos($permission,'Edit') !== false) {
                    echo '<i class="fa fa-fw fa-pencil text-light-blue btnEditar" style="cursor:pointer; margin-left:15px;" title="Editar"></i>';
                  }
                  if (strpos($permission,'Del') !== false) {
                    echo '<i class="fa fa-fw fa-times-circle text-light-blue btnDel" style="cursor:pointer; margin-left:15px;" title="Eliminar"></i>';
                  }
                  echo '</td>';
                  echo '<td>'.$e['tipo'].'</td>';
                  echo '<td>'.$e['empresa'].'</td>';
                  echo '<td>'.$e['establecalle'].' '.$e['establealtura'].'</td>';
                  echo '<td>'.$e['nom_fabricante'].'</td>';
                  echo '<td>'.$e['num_serie'].'</td>';
                  echo '<td>'.$e['anioFabricacion'].'</td>';
                echo '</tr>';
              }
            ?>
            </tbody>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<!-- Modal agregar caldera -->
<div class="modal" id="modalAgregar" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar</h4>
      </div>

      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos
            </div>
          </div>
        </div>

        <form class="form-horizontal" id="formCaldera">
          <div class="form-group">
            <label for="tipo" class="col-sm-4 pull-left">Tipo: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <select class="form-control" id="tipo" name="tipo">
                <!-- -->
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="empresa" class="col-sm-4 pull-left">Empresa: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="empresa" name="empresa">
            </div>
          </div>

          <div class="form-group">
            <label for="establecimiento" class="col-sm-4 pull-left">Establecimiento: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <select class="form-control" id="establecimiento" name="establecimiento">
                <!-- -->
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="nom_fabricante" class="col-sm-4 pull-left">Nombre del Fabricante: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="nom_fabricante" name="nom_fabricante">
            </div>
          </div>

          <div class="form-group">
            <label for="max_presion" class="col-sm-4 pull-left">Presión máxima adminsible de trabajo: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="max_presion" name="max_presion">
            </div>
          </div>

          <div class="form-group hidden">
            <label for="superficieCalefaccion" class="col-sm-4 pull-left">Superficie de calefacción: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="superficieCalefaccion" name="superficieCalefaccion">
            </div>
          </div>

          <div class="form-group hidden">
            <label for="max_capacidadVapor" class="col-sm-4 pull-left">Capacidad máxima de producción de vapor de diseño: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="max_capacidadVapor" name="max_capacidadVapor">
            </div>
          </div>

          <div class="form-group hidden">
            <label for="temperaturaPresionMaxima" class="col-sm-4 pull-left">Temperatura para la presión máxima admisible de trabajo: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="temperaturaPresionMaxima" name="temperaturaPresionMaxima">
            </div>
          </div>

          <div class="form-group">
            <label for="num_serie" class="col-sm-4 pull-left">Número de serie del fabricante: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="num_serie" name="num_serie">
            </div>
          </div>

          <div class="form-group">
            <label for="codigoNorma" class="col-sm-4 pull-left">Código de norma de diseño y fabricación: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="codigoNorma" name="codigoNorma">
            </div>
          </div>

          <div class="form-group">
            <label for="anioFabricacion" class="col-sm-4 pull-left">Año de fabricación: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="anioFabricacion" name="anioFabricacion">
            </div>
          </div>

          <div class="form-group">
            <label for="num_registro" class="col-sm-4 pull-left">Número de registro asignado por la unidad de aplicación: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="num_registro" name="num_registro">
            </div>
          </div>

          <div class="form-group">
            <label for="documentacion" class="col-sm-4 pull-left">Documentación presentada: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="documentacion" name="documentacion">
            </div>
          </div>
        </form>
      </div><!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnAgregar">Agregar</button>
      </div>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal eliminar caldera -->
<div class="modal" id="modalEliminar">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-minus-square text-light-blue"></span> Eliminar Profesional</h4>
      </div>

      <div class="modal-body" id="cuerpoModalEditar">
        <input type="hidden" name="cald_id" id="cald_id">
        <p>¿Desea eliminar la caldera / el recipiente de presión?</p> 
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarCaldera()">Eliminar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script>
/*----------  Llena selects del modal agregar  ----------*/
$("#btnAdd").click(function (e) { 
  WaitingOpen('Cargando datos...');
  getTipos();
  getEstablecimientos();
  WaitingClose();
});
/*----------  trae tipos y llena el select  ----------*/
function getTipos(){
  $("#tipo").html("");
  $.ajax({
    data: {},
    dataType: 'json',
    method: 'POST',
    url: "index.php/Caldera/getTipos",
  })
  .done( (data) => {
    if( data.length > 0 ) {
      $('#tipo').append( "<option value='-1'>Seleccione tipo...</option>" );
      for(let i=0; i < data.length ; i++) 
      {
        let nombre = data[i]['nombre'];
        let opcion = "<option value='"+data[i]['tipo_id']+"'>" +nombre+ "</option>";
        $('#tipo').append(opcion); 
      }
    } else {
      $('#tipo').append( "<option value='-1'>No hay tipos cargados...</option>" );
    }
  })
  .fail( () => alert('Error al traer tipos') )
  .always( () => WaitingClose() );
}
/*----------  trae establecimientos y llena select  ----------*/
function getEstablecimientos(){
  $("#establecimiento").html("");
  $.ajax({
    data: {},
    dataType: 'json',
    method: 'POST',
    url: "index.php/Caldera/getEstablecimientos",
  })
  .done( (data) => {
    if( data.length > 0 ) {
      $('#establecimiento').append( "<option value='-1'>Seleccione establecimiento...</option>" );
      for(let i=0; i < data.length ; i++) 
      {
        let nombre = data[i]['establecalle']+' '+data[i]['establealtura']+' - '+data[i]['localidad'];
        let opcion = "<option value='"+data[i]['estableid']+"'>" +nombre+ "</option>";
        $('#establecimiento').append(opcion); 
      }
    } else {
      $('#establecimiento').append( "<option value='-1'>No hay establecimientos cargados...</option>" );
    }
  })
  .fail( () => alert('Error al traer establecimientos') )
  .always( () => WaitingClose() );
}



/*----------  muestra/oculta inputs dependiendo si elige caldera o recipiente de presión  ----------*/
$('#tipo').on('change', function() {
  console.table( $('#tipo').val() );
  switch( $('#tipo').val() ) {
    case '1': //caldera
      $('#superficieCalefaccion').parent().parent().removeClass('hidden');
      $('#max_capacidadVapor').parent().parent().removeClass('hidden');
      
      $('#temperaturaPresionMaxima').parent().parent().addClass('hidden');
      $('#temperaturaPresionMaxima').val('');
      break;
    case '2': // recipiente presion
      $('#superficieCalefaccion').parent().parent().addClass('hidden');
      $('#max_capacidadVapor').parent().parent().addClass('hidden');
      $('#superficieCalefaccion').val('');
      $('#max_capacidadVapor').val('');

      $('#temperaturaPresionMaxima').parent().parent().removeClass('hidden');
      break;
    default:
      $('#superficieCalefaccion').parent().parent().addClass('hidden');
      $('#max_capacidadVapor').parent().parent().addClass('hidden');
      $('#temperaturaPresionMaxima').parent().parent().addClass('hidden');
      $('#superficieCalefaccion').val('');
      $('#max_capacidadVapor').val('');
      $('#temperaturaPresionMaxima').val('');
  }
});



/*----------  vuelve al listado de calderas  ----------*/
function verListado() {
  $('.content').empty();
  $(".content").load( '<?php echo base_url(); ?>index.php/Caldera/index/<?php echo $permission; ?>' );
}



/*----------  Agregar caldera  ----------*/
$("#btnAgregar").on("click", function(e){
  e.preventDefault();
  WaitingOpen('Guardando caldera...');

  hay_error = false;
  $('#error').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
  
  if ( $('#tipo').val() == '-1') {
    $("#tipo").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#empresa').val() == '') {
    $("#empresa").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#establecimiento').val() == '-1') {
    $("#establecimiento").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#nom_fabricante').val() == '') {
    $("#nom_fabricante").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#max_presion').val() == '') {
    $("#max_presion").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if( $('#tipo').val() == '1') { //si es caldera valido supCalefaccion ni maxCapacidadVapor
    $("#superficieCalefaccion").parent().parent().removeClass("has-error");
    $("#max_capacidadVapor").parent().parent().removeClass("has-error");
    
    if ( $('#superficieCalefaccion').val() == '') {
      $("#superficieCalefaccion").parent().parent().addClass("has-error");
      hay_error = true;
    }
    if ( $('#max_capacidadVapor').val() == '') {
      $("#max_capacidadVapor").parent().parent().addClass("has-error");
      hay_error = true;
    }
  } else if( $('#tipo').val() == '2') { //si es recipiente de presion valido temperaturaPresionMaxima
    $("#temperaturaPresionMaxima").parent().parent().removeClass("has-error");

    if ( $('#temperaturaPresionMaxima').val() == '') {
      $("#temperaturaPresionMaxima").parent().parent().addClass("has-error");
      hay_error = true;
    }
  }

  if ( $('#num_serie').val() == '') {
    $("#num_serie").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#codigoNorma').val() == '') {
    $("#codigoNorma").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#anioFabricacion').val() == '') {
    $("#anioFabricacion").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#num_registro').val() == '') {
    $("#num_registro").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#documentacion').val() == '') {
    $("#documentacion").parent().parent().addClass("has-error");
    hay_error = true;
  }

  if( hay_error ) {
    $('#error').fadeIn('slow');
    WaitingClose();
    return;
  } 
  
  var formData = new FormData($("#formCaldera")[0]);
  console.table(formData);
  /* Ajax de Grabado en BD */
  $.ajax({
    cache: false,
    contentType: false,
    data: formData,
    dataType: 'json',
    processData: false,
    type: 'POST',
    url: 'index.php/Caldera/agregarCaldera',
  })
  .done( (data) => {     
    $('#modalAgregar').modal('hide');
    verListado();
  })
  .fail( () => {
    alert("Error al guardar caldera");
  })
  .always( () => WaitingClose() );
});



/*----------  carga modal eliminar tipo  ----------*/
$(".btnDel").click(function (e) {
  $('#modalEliminar').modal('show');
  var cald_id = $(this).parent('td').parent('tr').attr('id');
  $('#cald_id').val(cald_id);
}); 
/*----------  eliminar tipo  ----------*/
function eliminarCaldera() {
  WaitingOpen('Cargando datos de caldera / recipiente de presión...');

  var cald_id = $('#cald_id').val();
  $.ajax({
    data: { cald_id:cald_id },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Caldera/eliminarCaldera',
  })
  .done( (data) => {
    $('#modalEliminar').modal('hide');
    verListado();
  })
  .fail( () => {
    alert("Error al eliminar caldera / recipiente de presión");
  })
  .always( () => WaitingClose() );
}



$(".btnEditar").click(function (e) { 
  var idCaldera = $(this).parent('td').parent('tr').attr('id');
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Caldera/verCaldera/<?php echo $permission; ?>/"+idCaldera+"/editar");
  WaitingClose(); 
});

$(".btnVer").click(function (e) { 
  var idCaldera = $(this).parent('td').parent('tr').attr('id');
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Caldera/verCaldera/<?php echo $permission; ?>/"+idCaldera+"/ver");
  WaitingClose(); 
});



/*----------  carga database en tabla listado de profesionales  ----------*/
$('#tbl-calderas').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "columnDefs": [ {
    "targets": [ 0 ], 
    "searchable": false,
    "orderable": false
  },
  {
    "targets": [ 1 ],
    "type": "num",
  } ],
  "order": [[1, "asc"]],
});
</script>