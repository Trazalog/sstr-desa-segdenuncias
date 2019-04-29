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
          <h3 class="box-title">Profesionales</h3>  
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd" title="Agregar Profesional">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->

        <div class="box-body">
          <table id="tbl-profesionales" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Nro</th>
                <th>Nombre y Apellido</th>
                <th>CUIT / CUIL</th>
                <th>Título</th>
                <th>Matrícula</th>
              </tr>
            </thead>
            <tbody>
            <?php
              foreach($list as $p)
              {
                echo '<tr id="'.$p['prof_id'].'">';
                  echo '<td>';
                  echo '<i class="fa fa-fw fa-search text-light-blue btnVer" style="cursor:pointer; margin-left:15px;" title="Ver"></i>';
                  if (strpos($permission,'Edit') !== false) {
                        echo '<i class="fa fa-fw fa-pencil text-light-blue btnEditar" style="cursor:pointer; margin-left:15px;" title="Editar"></i>';
                    }
                    if (strpos($permission,'Del') !== false) {
                        echo '<i class="fa fa-fw fa-times-circle text-light-blue btnDel" style="cursor:pointer; margin-left:15px;" title="Eliminar"></i>';
                    }
                  echo '</td>';
                  echo '<td>'.$p['prof_id'].'</td>';
                  echo '<td>'.$p['nombre'].'</td>';
                  echo '<td>'.$p['cuit'].'</td>';
                  echo '<td>'.$p['titulo'].'</td>';
                  echo '<td>'.$p['matricula'].'</td>';
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



<!-- Modal agregar profesional -->
<div class="modal" id="modalAgregar" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Profesional</h4>
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

        <div class="row">
          <div class="col-xs-12">
            <div class="form-group">
              <label for="nombre">Nombre y Apellido: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="nombre" name="nombre">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="cuit">CUIT / CUIL: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="cuit" name="cuit">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="titulo">Título: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="titulo" name="titulo">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="matricula">Matrícula: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="matricula" name="matricula">
            </div>
          </div>
        </div>
      </div><!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnAgregar">Agregar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal eliminar profesional -->
<div class="modal" id="modalEliminar">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-minus-square text-light-blue"></span> Eliminar Profesional</h4>
      </div>

      <div class="modal-body" id="cuerpoModalEditar">
        <input type="hidden" name="idProfesional" id="idProfesional">
        <p>¿Desea eliminar el profesional?</p> 
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarProfesional()">Eliminar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal editar profesional -->
<div class="modal" id="modalEditar" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-pencil text-light-blue"></span> Editar Profesional</h4>
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

        <input type="hidden" class="form-control" id="idE" name="idE">
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group">
              <label for="nombreE">Nombre y Apellido: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="nombreE" name="nombreE">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="cuitE">CUIT / CUIL: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="cuitE" name="cuitE">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="tituloE">Título: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="tituloE" name="tituloE">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="matriculaE">Matrícula: <strong class="text-red">*</strong></label>
              <input type="text" class="form-control" id="matriculaE" name="matriculaE">
            </div>
          </div>
        </div>
      </div><!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnEditar" onclick="editarProfesional()">Editar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<script>
/*----------  Formato de cuil/cuit  ----------*/
$('#cuit, #cuitE').inputmask({
  mask: '99-99999999-9'
});


/*----------  Agregar Profesional  ----------*/
$("#btnAgregar").on("click", function(e){
  e.preventDefault();
  WaitingOpen('Guardando Profesional');

  hay_error = false;
  $('#error').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
  
  var nombre    = $('#nombre').val();
  var cuit      = $('#cuit').val();
  var titulo    = $('#titulo').val();
  var matricula = $('#matricula').val();
  var datos = {
    'nombre'    : nombre,
    'cuit'      : cuit,
    'titulo'    : titulo,
    'matricula' : matricula,
  };

  if ( nombre == '') {
    $("#nombre").parent().addClass("has-error");
    hay_error = true;
  }
  if ( cuit == '') {
    $("#cuit").parent().addClass("has-error");
    hay_error = true;
  }
  if ( titulo == '') {
    $("#titulo").parent().addClass("has-error");
    hay_error = true;
  }
  if ( matricula == '') {
    $("#matricula").parent().addClass("has-error");
    hay_error = true;
  }

  if( hay_error ) {
    $('#error').fadeIn('slow');
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
    $('#modalAgregar').modal('hide');
    verListado();
  })
  .fail( () => {
    alert("Error al traer profesional");
  })
  .always( () => WaitingClose() );
});


/*----------  carga modal eliminar profesional  ----------*/
$(".btnDel").click(function (e) {
  $('#modalEliminar').modal('show');
  var idProfesional = $(this).parent('td').parent('tr').attr('id');
  $('#idProfesional').val(idProfesional);
}); 
/*----------  eliminar profesional  ----------*/
function eliminarProfesional() {
  WaitingOpen('Cargando datos de Profesional...');

  var idProfesional = $('#idProfesional').val();
  $.ajax({
    data: { idProfesional:idProfesional },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Profesional/eliminarProfesional',
  })
  .done( (data) => {
    $('#modalEliminar').modal('hide');
    verListado();
  })
  .fail( () => {
    alert("Error al eliminar profesional");
  })
  .always( () => WaitingClose() );
}


/*----------  carga modal editar profesional  ----------*/
$(".btnEditar").click(function (e) { 
  WaitingOpen('Cargando datos de Profesional...');

  var idProfesional = $(this).parent('td').parent('tr').attr('id');
  $.ajax({
    data: { idProfesional:idProfesional },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Profesional/obtenerProfesional',
  })
  .done( (data) => {
    $('#nombreE, #cuitE, #tituloE, #matriculaE').prop('disabled', false);
    $('#modalEditar .modal-title').html('<span id="modalAction" class="fa fa-pencil text-light-blue"></span> Editar Profesional');
    $('#btnEditar').show();

    llenarModalEditar(data);
    $('#modalEditar').modal('show');
  })
  .fail( () => {
    alert("Error al traer profesional");
  })
  .always( () => WaitingClose() );
});
/*----------  Editar Profesional  ----------*/
function editarProfesional() {
  WaitingOpen('Guardando Profesional');

  hay_error = false;
  $('#errorE').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
  
  var id        = $('#idE').val();
  var nombre    = $('#nombreE').val();
  var cuit      = $('#cuitE').val();
  var titulo    = $('#tituloE').val();
  var matricula = $('#matriculaE').val();
  var datos = {
    'nombre'    : nombre,
    'cuit'      : cuit,
    'titulo'    : titulo,
    'matricula' : matricula,
  };

  if ( nombre == '') {
    $("#nombreE").parent().addClass("has-error");
    hay_error = true;
  }
  if ( cuit == '') {
    $("#cuitE").parent().addClass("has-error");
    hay_error = true;
  }
  if ( titulo == '') {
    $("#tituloE").parent().addClass("has-error");
    hay_error = true;
  }
  if ( matricula == '') {
    $("#matriculaE").parent().addClass("has-error");
    hay_error = true;
  }

  if( hay_error ) {
    $('#errorE').fadeIn('slow');
    WaitingClose();
    return;
  } 
  
  $.ajax({
    data: { id:id, datos:datos },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Profesional/editarProfesional',
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
  $('#idE').val( data['prof_id'] );
  $('#nombreE').val( data['nombre'] );
  $('#cuitE').val( data['cuit'] );
  $('#tituloE').val( data['titulo'] );
  $('#matriculaE').val( data['matricula'] );
}


/*----------  carga modal editar profesional  ----------*/
$(".btnVer").click(function (e) {
  WaitingOpen('Cargando datos de Profesional...');

  var idProfesional = $(this).parent('td').parent('tr').attr('id');
  $.ajax({
    data: { idProfesional:idProfesional },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Profesional/obtenerProfesional',
  })
  .done( (data) => {
    $('#nombreE, #cuitE, #tituloE, #matriculaE').prop('disabled', true);
    $('#modalEditar .modal-title').html('<span id="modalAction" class="fa fa-search text-light-blue"></span> Ver Profesional');
    $('#btnEditar').hide();

    llenarModalEditar(data);
    $('#modalEditar').modal('show');
  })
  .fail( () => {
    alert("Error al traer profesional");
  })
  .always( () => WaitingClose() );
});


/*----------  vuelve al listado de profesionales  ----------*/
function verListado() {
  $('.content').empty();
  $(".content").load( '<?php echo base_url(); ?>index.php/Profesional/index/<?php echo $permission; ?>' );
}



/* fix backdrop modal queda colgado */
/*$("#modalAgregar").on('hidden.bs.modal', function(e) {
  $('body').removeClass('modal-open');
  $('.modal-backdrop').remove();
});*/


/*----------  limpio de errores los modales al cerrar modal  ----------*/
$('#modalAgregar, #modalEditar').on('hide.bs.modal', function (e) {
  $('#error, #errorE').fadeOut('slow');
  $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
})



/*----------  carga database en tabla listado de profesionales  ----------*/
$('#tbl-profesionales').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "columnDefs": [ {
      "targets": [ 0 ], 
      "searchable": false
  },
  {
      "targets": [ 0 ], 
      "orderable": false
  },
  {
    "targets": [ 1 ],
    "type": "num",
  } ],
  "order": [[1, "asc"]],
});
</script>