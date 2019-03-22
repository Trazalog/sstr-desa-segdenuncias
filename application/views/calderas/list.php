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


<!-- Modal editar caldera -->
<div class="modal" id="modalEditar" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-pencil text-light-blue"></span> Editar</h4>
      </div>

      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos
            </div>
          </div>
        </div>

        <form class="form-horizontal" id="formCalderaE">
          <input type="hidden" id="cald_idE" name="cald_idE">

          <div class="form-group">
            <label for="tipoE" class="col-sm-4 pull-left">Tipo: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <select class="form-control" id="tipoE" name="tipoE">
                <!-- -->
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="empresaE" class="col-sm-4 pull-left">Empresa: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="empresaE" name="empresaE">
            </div>
          </div>

          <div class="form-group">
            <label for="establecimientoE" class="col-sm-4 pull-left">Establecimiento: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <select class="form-control" id="establecimientoE" name="establecimientoE">
                <!-- -->
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="nom_fabricanteE" class="col-sm-4 pull-left">Nombre del Fabricante: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="nom_fabricanteE" name="nom_fabricanteE">
            </div>
          </div>

          <div class="form-group">
            <label for="max_presionE" class="col-sm-4 pull-left">Presión máxima adminsible de trabajo: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="max_presionE" name="max_presionE">
            </div>
          </div>

          <div class="form-group hidden">
            <label for="superficieCalefaccionE" class="col-sm-4 pull-left">Superficie de calefacción: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="superficieCalefaccionE" name="superficieCalefaccionE">
            </div>
          </div>

          <div class="form-group hidden">
            <label for="max_capacidadVaporE" class="col-sm-4 pull-left">Capacidad máxima de producción de vapor de diseño: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="max_capacidadVaporE" name="max_capacidadVaporE">
            </div>
          </div>

          <div class="form-group hidden">
            <label for="temperaturaPresionMaximaE" class="col-sm-4 pull-left">Temperatura para la presión máxima admisible de trabajo: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="temperaturaPresionMaximaE" name="temperaturaPresionMaximaE">
            </div>
          </div>

          <div class="form-group">
            <label for="num_serieE" class="col-sm-4 pull-left">Número de serie del fabricante: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="num_serieE" name="num_serieE">
            </div>
          </div>

          <div class="form-group">
            <label for="codigoNormaE" class="col-sm-4 pull-left">Código de norma de diseño y fabricación: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="codigoNormaE" name="codigoNormaE">
            </div>
          </div>

          <div class="form-group">
            <label for="anioFabricacionE" class="col-sm-4 pull-left">Año de fabricación: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="anioFabricacionE" name="anioFabricacionE">
            </div>
          </div>

          <div class="form-group">
            <label for="num_registroE" class="col-sm-4 pull-left">Número de registro asignado por la unidad de aplicación: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="num_registroE" name="num_registroE">
            </div>
          </div>

          <div class="form-group">
            <label for="documentacionE" class="col-sm-4 pull-left">Documentación presentada: <strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="documentacionE" name="documentacionE">
            </div>
          </div>
        </form>
      </div><!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnEditar" onclick="editarCaldera()">Editar</button>
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



/*----------  carga modal editar caldera  ----------*/
$(".btnEditar").click(function (e) { 
  WaitingOpen('Cargando datos de caldera / recipientes de presión...');

  var cald_id = $(this).parent('td').parent('tr').attr('id');
  $.ajax({
    data: { cald_id:cald_id },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Caldera/obtenerCaldera',
  })
  .done( (data) => {
    $('#formCalderaE').find(':input,:radio,:checkbox').prop('disabled', false);
    $('#modalEditar .modal-title').html('<span id="modalAction" class="fa fa-pencil text-light-blue"></span> Editar');
    $('#btnEditar').show();

    llenarModalEditar(data);
    $('#modalEditar').modal('show');
  })
  .fail( () => {
    alert("Error al traer caldera");
  })
  .always( () => WaitingClose() );
});
/*----------  Agregar Caldera  ----------*/
function editarCaldera() {
  WaitingOpen('Editando Caldera / Recipiente de presión');

  hay_error = false;
  $('#errorE').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

  if ( $('#tipoE').val() == '-1') {
    $("#tipoE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#empresaE').val() == '') {
    $("#empresaE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#establecimientoE').val() == '-1') {
    $("#establecimientoE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#nom_fabricanteE').val() == '') {
    $("#nom_fabricanteE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#max_presionE').val() == '') {
    $("#max_presionE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if( $('#tipoE').val() == '1') { //si es caldera valido supCalefaccion ni maxCapacidadVapor
    $("#superficieCalefaccionE").parent().parent().removeClass("has-error");
    $("#max_capacidadVaporE").parent().parent().removeClass("has-error");
    
    if ( $('#superficieCalefaccionE').val() == '') {
      $("#superficieCalefaccionE").parent().parent().addClass("has-error");
      hay_error = true;
    }
    if ( $('#max_capacidadVaporE').val() == '') {
      $("#max_capacidadVaporE").parent().parent().addClass("has-error");
      hay_error = true;
    }
  } else if( $('#tipoE').val() == '2') { //si es recipiente de presion valido temperaturaPresionMaxima
    $("#temperaturaPresionMaximaE").parent().parent().removeClass("has-error");

    if ( $('#temperaturaPresionMaximaE').val() == '') {
      $("#temperaturaPresionMaximaE").parent().parent().addClass("has-error");
      hay_error = true;
    }
  }

  if ( $('#num_serieE').val() == '') {
    $("#num_serieE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#codigoNormaE').val() == '') {
    $("#codigoNormaE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#anioFabricacionE').val() == '') {
    $("#anioFabricacionE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#num_registroE').val() == '') {
    $("#num_registroE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#documentacionE').val() == '') {
    $("#documentacionE").parent().parent().addClass("has-error");
    hay_error = true;
  }

  if( hay_error ) {
    $('#errorE').fadeIn('slow');
    WaitingClose();
    return;
  } 
  
  var formData = new FormData($("#formCalderaE")[0]);
  /* Ajax de Grabado en BD */
  $.ajax({
    cache: false,
    contentType: false,
    data: formData,
    dataType: 'json',
    processData: false,
    type: 'POST',
    url: 'index.php/Caldera/editarCaldera',
  })
  .done( (data) => {     
    $('#modalEditar').modal('hide');
    verListado();
  })
  .fail( () => {
    alert("Error al traer tareas");
  })
  .always( () => WaitingClose() );
}
/*----------  llena modal con datos de profesional  ----------*/
function llenarModalEditar(data) {
  $('#cald_idE').val( data['cald_id'] );
  llenarTipos( data['tipo'] );
  $('#empresaE').val( data['empresa'] );
  llenarEstablecimientos( data['establecimiento'] );
  $('#nom_fabricanteE').val( data['nom_fabricante'] );
  $('#max_presionE').val( data['max_presion'] );
  $('#superficieCalefaccionE').val( data['superficieCalefaccion'] );
  $('#max_capacidadVaporE').val( data['max_capacidadVapor'] );
  $('#temperaturaPresionMaximaE').val( data['temperaturaPresionMaxima'] );
  $('#num_serieE').val( data['num_serie'] );
  $('#codigoNormaE').val( data['codigoNorma'] );
  $('#anioFabricacionE').val( data['anioFabricacion'] );
  $('#num_registroE').val( data['num_registro'] );
  $('#documentacionE').val( data['documentacion'] );
}



/*----------  carga modal editar caldera  ----------*/
$(".btnVer").click(function (e) { 
  WaitingOpen('Cargando datos de caldera / recipientes de presión...');

  var cald_id = $(this).parent('td').parent('tr').attr('id');
  $.ajax({
    data: { cald_id:cald_id },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Caldera/obtenerCaldera',
  })
  .done( (data) => {
    $('#formCalderaE').find(':input,:radio,:checkbox').prop('disabled', true);
    $('#modalEditar .modal-title').html('<span id="modalAction" class="fa fa-search text-light-blue"></span> Ver');
    $('#btnEditar').hide();

    llenarModalEditar(data);
    $('#modalEditar').modal('show');
  })
  .fail( () => {
    alert("Error al traer caldera");
  })
  .always( () => WaitingClose() );
});



/*----------  trae tipos y llena el select editar  ----------*/
function llenarTipos(tipo){
  $("#tipoE").html("");
  $.ajax({
    data: {},
    dataType: 'json',
    method: 'POST',
    url: "index.php/Caldera/getTipos",
  })
  .done( (data) => {
    if( data.length > 0 ) {
      $('#tipoE').append( "<option value='-1'>Seleccione tipo...</option>" );
      for(let i=0; i < data.length ; i++) 
      {
        let selectAttr = '';
        if( (typeof tipo !== 'undefined') && (data[i]['tipo_id'] == tipo) ) { selectAttr = 'selected';}
        let nombre = data[i]['nombre'];
        let opcion = "<option value='"+data[i]['tipo_id']+"' "+selectAttr+">" +nombre+ "</option>";
        $('#tipoE').append(opcion); 
      }
    } else {
      $('#tipoE').append( "<option value='-1'>No hay tipos cargados...</option>" );
    }
  })
  .fail( () => alert('Error al traer tipos') )
  .always( () => WaitingClose() );
}

/*----------  trae establecimientos y llena select editar  ----------*/
function llenarEstablecimientos(establecimiento){
  $("#establecimientoE").html("");
  $.ajax({
    data: {},
    dataType: 'json',
    method: 'POST',
    url: "index.php/Caldera/getEstablecimientos",
  })
  .done( (data) => {
    if( data.length > 0 ) {
      $('#establecimientoE').append( "<option value='-1'>Seleccione establecimiento...</option>" );
      for(let i=0; i < data.length ; i++) 
      {
        let selectAttr = '';
        if( (typeof establecimiento !== 'undefined') && (data[i]['estableid'] == establecimiento) ) { selectAttr = 'selected';}
        let nombre = data[i]['establecalle']+' '+data[i]['establealtura']+' - '+data[i]['localidad'];
        let opcion = "<option value='"+data[i]['estableid']+"' "+selectAttr+">" +nombre+ "</option>";
        $('#establecimientoE').append(opcion); 
      }
    } else {
      $('#establecimientoE').append( "<option value='-1'>No hay establecimientos cargados...</option>" );
    }
  })
  .fail( () => alert('Error al traer establecimientos') )
  .always( () => WaitingClose() );
}

/*----------  vuelve al listado de calderas  ----------*/
function verListado() {
  $('.content').empty();
  $(".content").load( '<?php echo base_url(); ?>index.php/Caldera/index/<?php echo $permission; ?>' );
}

/*----------  muestra/oculta inputs dependiendo si elige caldera o recipiente de presión  ----------*/
$('#tipoE').on('change', function() {
  console.table( $('#tipoE').val() );
  switch( $('#tipoE').val() ) {
    case '1': //caldera
      $('#superficieCalefaccionE').parent().parent().removeClass('hidden');
      $('#max_capacidadVaporE').parent().parent().removeClass('hidden');
      
      $('#temperaturaPresionMaximaE').parent().parent().addClass('hidden');
      break;
    case '2': // recipiente presion
      $('#superficieCalefaccionE').parent().parent().addClass('hidden');
      $('#max_capacidadVaporE').parent().parent().addClass('hidden');

      $('#temperaturaPresionMaximaE').parent().parent().removeClass('hidden');
      break;
    default:
      $('#superficieCalefaccionE').parent().parent().addClass('hidden');
      $('#max_capacidadVaporE').parent().parent().addClass('hidden');
      $('#temperaturaPresionMaximaE').parent().parent().addClass('hidden');
  }
});



/*----------  limpio de errores los modales al cerrar modal  ----------*/
$('#modalAgregar, #modalEditar').on('hide.bs.modal', function (e) {
  $('#error, #errorE').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
})



/*----------  carga database en tabla listado de profesionales  ----------*/
$('#tbl-calderas').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "columnDefs": [ {
      "targets": [ 0 ], 
      "searchable": false
  },
  {
      "targets": [ 0 ], 
      "orderable": false
  } ],
  "order": [[1, "asc"]],
});
</script>