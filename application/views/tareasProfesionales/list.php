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
          <h3 class="box-title">Registro de Tareas Profesionales</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd" title="Agregar Equipo">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->

        <div class="box-body">
          <table id="tbl-tareaProfesional" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Id</th>
                <th>Tipo</th>
                <th>Fecha</th>
                <th>Profesional</th>
                <th>Vencimiento</th>
              </tr>
            </thead>
            <tbody>
            <?php
              foreach($list as $e)
              {
                echo '<tr id="'.$e['tare_id'].'">';
                  echo '<td>';
                  echo '<i class="fa fa-fw fa-search text-light-blue btnVer" style="cursor:pointer; margin-left:15px;" title="Ver"></i>';
                  if (strpos($permission,'Edit') !== false) {
                    echo '<i class="fa fa-fw fa-pencil text-light-blue btnEditar" style="cursor:pointer; margin-left:15px;" title="Editar"></i>';
                  }
                  if (strpos($permission,'Del') !== false) {
                    echo '<i class="fa fa-fw fa-times-circle text-light-blue btnDel" style="cursor:pointer; margin-left:15px;" title="Eliminar"></i>';
                  }
                  echo '</td>';
                  echo '<td>'.$e['tare_id'].'</td>';
                  echo '<td>'.$e['tipoNombre'].'</td>';
                  echo '<td>'.$e['fecha'].'</td>';
                  echo '<td>'.$e['profesionalNombre'].'</td>';
                  echo '<td>'.$e['vencimiento'].'</td>';
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


<!-- Modal agregar Tarea Profesional -->
<div class="modal" id="modalAgregar" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Registro de Tareas Profesionales</h4>
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

        <form class="form-horizontal" id="formTareaProfesional">
          
          <div class="form-group">
            <label for="tipo" class="col-sm-4 pull-left">Tipo<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <select class="form-control" id="tipo" name="tipo">
                <!-- -->
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="fecha" class="col-sm-4 pull-left">Fecha<strong class="text-red">*</strong>:</label>
            <div class="col-sm-8">
              <input type="date" class="form-control" id="fecha" name="fecha">
            </div>
          </div>

          <div class="form-group">
            <label for="profesional" class="col-xs-12 col-sm-4 pull-left">Profesional<strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <div class="input-group">
                <input type="text" class="form-control" id="profesional" name="profesional" disabled/>
                <div class="input-group-btn">
                  <button class="btn btn-primary btnBuscarProfesional">
                    <span class="glyphicon glyphicon-search"></span>
                  </button>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label for="observaciones" class="col-sm-4 pull-left">Observaciones<strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <textarea class="form-control" id="observaciones" name="observaciones"></textarea>
            </div>
          </div>

          <div class="form-group">
            <label for="vencimiento" class="col-sm-4 pull-left">Vencimiento<strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="date" class="form-control" id="vencimiento" name="vencimiento">
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


<!-- Modal eliminar Tarea Profesional -->
<div class="modal" id="modalEliminar">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-minus-square text-light-blue"></span> Eliminar Tarea Profesional</h4>
      </div>

      <div class="modal-body" id="cuerpoModalEditar">
        <input type="hidden" name="tare_id" id="tare_id">
        <p>¿Desea eliminar la tarea profesional?</p> 
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarTareaProfesional()">Eliminar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal editar Tarea Profesional -->
<div class="modal" id="modalEditar" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-pencil text-light-blue"></span> Editar Registro de Tareas Profesionales</h4>
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

        <form class="form-horizontal" id="formTareaProfesionalE">
          <input type="hidden" id="tare_idE" name="tare_idE">
          
          <div class="form-group">
            <label for="tipoE" class="col-sm-4 pull-left">Tipo<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <select class="form-control" id="tipoE" name="tipoE">
                <!-- -->
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="fechaE" class="col-sm-4 pull-left">Fecha<strong class="text-red">*</strong>:</label>
            <div class="col-sm-8">
              <input type="date" class="form-control" id="fechaE" name="fechaE">
            </div>
          </div>

          <div class="form-group">
            <label for="profesionalE" class="col-xs-12 col-sm-4 pull-left">Profesional<strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <div class="input-group">
                <input type="text" class="form-control" id="profesionalE" name="profesionalE" disabled/>
                <div class="input-group-btn">
                  <button class="btn btn-primary btnBuscarProfesional">
                    <span class="glyphicon glyphicon-search"></span>
                  </button>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label for="observacionesE" class="col-sm-4 pull-left">Observaciones<strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <textarea class="form-control" id="observacionesE" name="observacionesE"></textarea>
            </div>
          </div>

          <div class="form-group">
            <label for="vencimientoE" class="col-sm-4 pull-left">Vencimiento<strong class="text-red">*</strong></label>
            <div class="col-sm-8">
              <input type="date" class="form-control" id="vencimientoE" name="vencimientoE">
            </div>
          </div>

        </form>
      </div><!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnEditar" onclick="editarTareaProfesional()">Editar</button>
      </div>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal listado de Profesionales -->
<div class="modal" id="modalProfesionales">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-search text-light-blue"></span> Buscar Profesional</h4>
      </div>

      <div class="modal-body" id="cuerpoModalProfesionales">
        <button class="btn btn-block btn-primary" style="width: 100px; margin-bottom: 10px;" id="btnAddProfesional" title="Agregar Profesional" data-toggle="modal" data-target="#modalAgregarProfesional">Agregar</button>

        <table id="tbl-profesionales" class="table table-bordered table-hover">
          <thead>
            <tr>
              <th>Acciones</th>
              <th>Id</th>
              <th>Nombre y Apellido</th>
              <th>CUIT / CUIL</th>
              <th>Título</th>
              <th>Matrícula</th>
            </tr>
          </thead>
          <tbody>
            <!-- -->
          </tbody>
        </table>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal agregar profesional -->
<div class="modal" id="modalAgregarProfesional" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Profesional</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorProfesional" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-xs-12">
            <div class="form-group">
              <label for="nombreProfesional">Nombre y Apellido: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="nombreProfesional" name="nombreProfesional">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="cuitProfesional">CUIT / CUIL: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="cuitProfesional" name="cuitProfesional">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="tituloProfesional">Título: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="tituloProfesional" name="tituloProfesional">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="matriculaProfesional">Matrícula: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="matriculaProfesional" name="matriculaProfesional">
            </div>
          </div>
        </div>
      </div><!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="agregarProfesional()">Agregar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<script>
/*----------  Llena selects del modal agregar  ----------*/
$("#btnAdd").click(function (e) { 
  WaitingOpen('Cargando datos...');
  getTipos();
  WaitingClose();
});
/*----------  trae tipos y llena el select  ----------*/
function getTipos(){
  $("#tipo").html("");
  $.ajax({
    data: {},
    dataType: 'json',
    method: 'POST',
    url: "index.php/TareaProfesional/getTipos",
  })
  .done( (data) => {
    if( data.length > 0 ) {
      $('#tipo').append( "<option value='-1'>Seleccione tipo de tarea profesional...</option>" );
      for(let i=0; i < data.length ; i++) 
      {
        let nombre = data[i]['nombre'];
        let opcion = "<option value='"+data[i]['tita_id']+"'>" +nombre+ "</option>";
        $('#tipo').append(opcion); 
      }
    } else {
      $('#tipo').append( "<option value='-1'>No hay tipos de tareas profesionales cargados...</option>" );
    }
  })
  .fail( () => alert('Error al traer tipos de tareas profesionales') )
  .always( () => WaitingClose() );
}


/*----------  Agregar TareaProfesional  ----------*/
$("#btnAgregar").on("click", function(e){
  e.preventDefault();
  WaitingOpen('Guardando registro de tarea profesional...');

  hay_error = false;
  $('#error').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
  
  if ( $('#tipo').val() == '-1') {
    $("#tipo").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#fecha').val() == '') {
    $("#fecha").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#profesional').val() == '') {
    $("#profesional").parent().parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#observaciones').val() == '') {
    $("#observaciones").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#vencimiento').val() == '') {
    $("#vencimiento").parent().parent().addClass("has-error");
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
    url: 'index.php/TareaProfesional/agregarTareaProfesional',
  })
  .done( (data) => {     
    $('#modalAgregar').modal('hide');
    verListado();
  })
  .fail( () => {
    alert("Error al guardar registro de tarea profesional");
  })
  .always( () => WaitingClose() );
});


/*----------  carga modal eliminar tipo  ----------*/
$(".btnDel").click(function (e) {
  $('#modalEliminar').modal('show');
  var tare_id = $(this).parent('td').parent('tr').attr('id');
  $('#tare_id').val(tare_id);
}); 
/*----------  eliminar tipo  ----------*/
function eliminarTareaProfesional() {
  WaitingOpen('Cargando datos de registro de tarea profesional...');

  var tare_id = $('#tare_id').val();
  $.ajax({
    data: { tare_id:tare_id },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/TareaProfesional/eliminarTareaProfesional',
  })
  .done( (data) => {
    $('#modalEliminar').modal('hide');
    verListado();
  })
  .fail( () => {
    alert("Error al eliminar registro de tarea profesional");
  })
  .always( () => WaitingClose() );
}


/*----------  carga modal editar TareaProfesional  ----------*/
$(".btnEditar").click(function (e) { 
  WaitingOpen('Cargando datos de registro de tarea profesional...');

  var tare_id = $(this).parent('td').parent('tr').attr('id');
  $.ajax({
    data: { tare_id:tare_id },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/TareaProfesional/obtenerTareaProfesional',
  })
  .done( (data) => {
    $('#tipoE, #fechaE, #observaciones, #vencimiento').prop('disabled', false);
    $('#modalEditar .modal-title').html('<span id="modalAction" class="fa fa-pencil text-light-blue"></span> Editar Registro de Tareas Profesionales');
    $('#btnEditar').show();

    llenarModalTareaProfesional(data);
    $('#modalEditar').modal('show');
  })
  .fail( () => {
    alert("Error al traer registro de tarea profesional");
  })
  .always( () => WaitingClose() );
});
/*----------  Agregar Caldera  ----------*/
function editarTareaProfesional() {
  WaitingOpen('Editando registro de tarea profesional');

  hay_error = false;
  $('#errorE').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

  if ( $('#tipoE').val() == '-1') {
    $("#tipoE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#fechaE').val() == '') {
    $("#fechaE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#profesionalE').val() == '') {
    $("#profesionalE").parent().parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#observacionesE').val() == '') {
    $("#observacionesE").parent().parent().addClass("has-error");
    hay_error = true;
  }
  if ( $('#vencimientoE').val() == '') {
    $("#vencimientoE").parent().parent().addClass("has-error");
    hay_error = true;
  }

  if( hay_error ) {
    $('#errorE').fadeIn('slow');
    WaitingClose();
    return;
  } 
  
  var formData = new FormData($("#formTareaProfesionalE")[0]);
  /* Ajax de Grabado en BD */
  $.ajax({
    cache: false,
    contentType: false,
    data: formData,
    dataType: 'json',
    processData: false,
    type: 'POST',
    url: 'index.php/TareaProfesional/editarTareaProfesional',
  })
  .done( (data) => {     
    $('#modalEditar').modal('hide');
    verListado();
  })
  .fail( () => {
    alert("Error al traer registro de tarea profesional");
  })
  .always( () => WaitingClose() );
}
/*----------  llena modal con datos de profesional  ----------*/
function llenarModalTareaProfesional(data) {
  console.table(data);
  $('#tare_idE').val( data['tare_id'] );
  llenarTipos( data['tipo'] );
  $('#fechaE').val( data['fecha'] );
  $('#profesionalE').val( data['profesionalNombre'] );
  $('#observacionesE').val( data['observaciones'] );
  $('#vencimientoE').val( data['vencimiento'] );
}



/*----------  carga modal editar registro de tarea profesional  ----------*/
$(".btnVer").click(function (e) { 
  WaitingOpen('Cargando datos registro de tarea profesional...');

  var tare_id = $(this).parent('td').parent('tr').attr('id');
  $.ajax({
    data: { tare_id:tare_id },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/TareaProfesional/obtenerTareaProfesional',
  })
  .done( (data) => {
    $('#formTareaProfesionalE').find(':input,:radio,:checkbox').prop('disabled', true);
    $('#modalEditar .modal-title').html('<span id="modalAction" class="fa fa-search text-light-blue"></span> Ver Registro de Tareas Profesionales');
    $('#btnEditar').hide();

    llenarModalTareaProfesional(data);
    $('#modalEditar').modal('show');
  })
  .fail( () => {
    alert("Error al traer registro de tarea profesional");
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
    url: "index.php/TareaProfesional/getTipos",
  })
  .done( (data) => {
    if( data.length > 0 ) {
      $('#tipoE').append( "<option value='-1'>Seleccione tipo de tarea profesional...</option>" );
      for(let i=0; i < data.length ; i++) 
      {
        let selectAttr = '';
        if( (typeof tipo !== 'undefined') && (data[i]['tita_id'] == tipo) ) { selectAttr = 'selected';}
        let nombre = data[i]['nombre'];
        let opcion = "<option value='"+data[i]['tita_id']+"' "+selectAttr+">" +nombre+ "</option>";
        $('#tipoE').append(opcion); 
      }
    } else {
      $('#tipoE').append( "<option value='-1'>No hay tipos de tareas profesionales cargados...</option>" );
    }
  })
  .fail( () => alert('Error al traer registro de tarea profesional') )
  .always( () => WaitingClose() );
}

/*----------  vuelve al listado de registro de Tarea Profesional  ----------*/
function verListado() {
  $('.content').empty();
  $(".content").load( '<?php echo base_url(); ?>index.php/TareaProfesional/index/<?php echo $permission; ?>' );
}






$(".btnBuscarProfesional").click(function (e) { 
  e.preventDefault();
  cargarDatosProfesional();
});

function cargarDatosProfesional() {
  WaitingOpen('Cargando datos de profesional...');
  $.ajax({
    data: {},
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Profesional/obtenerProfesionales',
  })
  .done( (data) => {
    llenoTablaProfesionales(data);
    $('#modalProfesionales').modal('show');
  })
  .fail( () => {
    alert("Error al traer profesional");
  })
  .always( () => WaitingClose() );
}

function llenoTablaProfesionales(data) {
  $('#tbl-profesionales').DataTable().clear().draw();
  for(i = 0; i < data.length; i++) {
    var prof_id   = data[i]['prof_id'];
    var nombre    = data[i]['nombre'];
    var cuit      = data[i]['cuit'];
    var matricula = data[i]['matricula'];
    var titulo    = data[i]['titulo'];
    //agrego valores a la tabla
    $('#tbl-profesionales').DataTable().row.add( [
        '<button class="btn btn-primary btnSeleccionarProfesional" title="Seleccionar Profesional">Seleccionar</button>',
        prof_id,
        nombre,
        cuit,
        titulo,
        matricula
      ]
    ).node().id = prof_id;
    $('#tbl-profesionales').DataTable().draw();
  }
}

$(document).on("click",".btnSeleccionarProfesional",function(e) {
  e.preventDefault();
  var profesional = $(this).parent('td').parent('tr').find("td:eq(2)").text();
  $('#profesional, #profesionalE').val( profesional );
  $('#modalProfesionales').modal('hide');
});






/*----------  Formato de cuil/cuit  ----------*/
$('#cuitProfesional').inputmask({
  mask: '99-99999999-9'
});

/*----------  Agregar Profesional  ----------*/
function agregarProfesional() {
  WaitingOpen('Guardando Profesional');

  hay_error = false;
  $('#errorProfesional').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
  
  var nombre    = $('#nombreProfesional').val();
  var cuit      = $('#cuitProfesional').val();
  var titulo    = $('#tituloProfesional').val();
  var matricula = $('#matriculaProfesional').val();
  var datos = {
    'nombre'    : nombre,
    'cuit'      : cuit,
    'titulo'    : titulo,
    'matricula' : matricula,
  };

  if ( nombre == '') {
    $("#nombreProfesional").parent().addClass("has-error");
    hay_error = true;
  }
  if ( cuit == '') {
    $("#cuitProfesional").parent().addClass("has-error");
    hay_error = true;
  }
  if ( titulo == '') {
    $("#tituloProfesional").parent().addClass("has-error");
    hay_error = true;
  }
  if ( matricula == '') {
    $("#matriculaProfesional").parent().addClass("has-error");
    hay_error = true;
  }

  if( hay_error ) {
    $('#errorProfesional').fadeIn('slow');
    WaitingClose();
    return;
  } 
      
  $.ajax({
    data: { datos:datos },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Profesional/agregarProfesional',
  })
  .done( (data) => {     
    $('#modalAgregarProfesional').modal('hide');
    cargarDatosProfesional();
  })
  .fail( () => {
    alert("Error al traer profesional");
  })
  .always( () => WaitingClose() );
}




/*----------  ajusto el ancho de la cabecera de las tablas al cargar el modal  ----------*/
$('#modalProfesionales, #modalAgregarProfesional').on('shown.bs.modal', function (e) {
  $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
});





/*----------  limpio de errores los modales al cerrar modal  ----------*/
$('#modalAgregar, #modalEditar').on('hide.bs.modal', function (e) {
  $('#error, #errorE').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
})



/*----------  carga database en tabla listado de profesionales  ----------*/
$('#tbl-tareaProfesional, #tbl-profesionales').DataTable({
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