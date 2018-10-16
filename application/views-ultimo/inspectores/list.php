<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <center>
          <h2> Inspectores </h2>  
          </center>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-success" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd" title="Nueva">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="Inspector" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th width="20%">Acciones</th>
                <th>Nro</th>
                <th>Nombre y Apellido</th>
                <th>Mail</th>
                <th>Telefono</th>
                <th>Sector</th>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach($list as $f)
                {

                  echo '<tr>';
                  echo '<td>';
                  
                  if (strpos($permission,'Edit') !== false) {
                        echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;"></i>';
                    }
                    if (strpos($permission,'Del') !== false) {
                        echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar"></i>';
                    }
                  echo '</td>';
                  echo '<td style="text-align: left">'.$f['inspectorid'].'</td>';
                  echo '<td style="text-align: left">'.$f['inspectornombre'].'</td>';
                  echo '<td style="text-align: left">'.$f['inspectormail'].'</td>';
                  echo '<td style="text-align: left">'.$f['inspectorcel'].'</td>';
                  echo '<td style="text-align: left">'.$f['inspectorsector'].'</td>';
                  
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

<script>
function guardarInspector(){
      var inspectornombre=$('#inspectornombre').val();
      var inspectormail=$('#inspectormail').val();
      var inspectorcel=$('#inspectorcel').val();
      var inspectorsector=$('#inspectorsector').val();

    var hayError = false;
    if($('#inspectornombre').val() == '' || $('#inspectormail').val() == '' || $('#inspectorcel').val() == '' || $('#inspectorsector').val() == '' )
    {
      hayError = true;
    }
    if(hayError == true){
      $('#error').fadeIn('slow');
      return;
    }
    $('#error').fadeOut('slow');        
    WaitingOpen();  
    $.ajax({
             type: 'POST',
             data: {    "inspectornombre":inspectornombre,  "inspectormail":inspectormail,  "inspectorcel":inspectorcel,  "inspectorsector":inspectorsector },
             url: 'index.php/Inspector/Guardar_Inspector', 
             success: function(result){
                WaitingClose();
                $('#modalAgregar').modal('hide');
                 ActualizarPagina();
            },
            error: function(result){
              WaitingClose();
                alert("OPERACIÓN FALLIDA");
            }
          });
    }
    var id_ ="";
    $(".fa-pencil").click(function (e) { 

        id_ = $(this).parents('tr').find('td').eq(1).html();
        var inspectornombre = $(this).parents('tr').find('td').eq(2).html();
        var inspectormail = $(this).parents('tr').find('td').eq(3).html();
        var inspectorcel = $(this).parents('tr').find('td').eq(4).html();
        var inspectorsector = $(this).parents('tr').find('td').eq(5).html();

        $('#cuerpoModalEditar').html(' <div class="row">'+
          '<div class="col-xs-12">'+
            '<div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">'+
             '<h4><i class="icon fa fa-ban"></i> Error!</h4>'+
             'Revise que todos los campos esten completos'+
           '</div>'+
         '</div>'+
       '</div>'+
          '<div class="row">'+
            '<div class="col-xs-4">'+
               ' <label style="margin-top: 7px;">inspector nombre <strong style="color: #dd4b39">*</strong>: </label>'+
            '</div>'+
            '<div class="col-xs-5">'+
                '<input type="text" class="form-control"  id="inspectornombreE" value="'+inspectornombre+'" >'+
            '</div>'+
        '</div><br>'+
          '<div class="row">'+
            '<div class="col-xs-4">'+
               ' <label style="margin-top: 7px;">inspector mail <strong style="color: #dd4b39">*</strong>: </label>'+
            '</div>'+
            '<div class="col-xs-5">'+
                '<input type="text" class="form-control"  id="inspectormailE" value="'+inspectormail+'" >'+
            '</div>'+
        '</div><br>'+
          '<div class="row">'+
            '<div class="col-xs-4">'+
               ' <label style="margin-top: 7px;">inspector cel <strong style="color: #dd4b39">*</strong>: </label>'+
            '</div>'+
            '<div class="col-xs-5">'+
                '<input type="text" class="form-control"  id="inspectorcelE" value="'+inspectorcel+'" >'+
            '</div>'+
        '</div><br>'+
          '<div class="row">'+
            '<div class="col-xs-4">'+
               ' <label style="margin-top: 7px;">inspector sector <strong style="color: #dd4b39">*</strong>: </label>'+
            '</div>'+
            '<div class="col-xs-5">'+
                '<input type="text" class="form-control"  id="inspectorsectorE" value="'+inspectorsector+'" >'+
            '</div>'+
        '</div><br>'        );
        $('#modalEditar').modal('show');

    });    function editarInspector(){
     var id=id_;
      var inspectornombre=$('#inspectornombreE').val();
      var inspectormail=$('#inspectormailE').val();
      var inspectorcel=$('#inspectorcelE').val();
      var inspectorsector=$('#inspectorsectorE').val();
     
    var hayError = false;
    if($('#inspectornombreE').val() == '' || $('#inspectormailE').val() == '' || $('#inspectorcelE').val() == '' || $('#inspectorsectorE').val() == '' )
    {
      hayError = true;
    }
    if(hayError == true){
      $('#errorE').fadeIn('slow');
      return;
    }
    $('#errorE').fadeOut('slow');
    WaitingOpen();
     $.ajax({
       type: 'POST',
       dataType : "json",
       data: {"inspectorid" : id,  "inspectornombre":inspectornombre,  "inspectormail":inspectormail,  "inspectorcel":inspectorcel,  "inspectorsector":inspectorsector },
       url: 'index.php/Inspector/Modificar_Inspector', 
       success: function(result){
        WaitingClose();
       $('#modalEditar').modal('hide');
        ActualizarPagina();
        },
        error: function(result){
          WaitingClose();
            alert("OPERACIÓN FALLIDA");
            console.log(result);
        }

       });

    }
  $(".fa-times-circle").click(function (e) { 

    id_ = $(this).parents('tr').find('td').eq(1).html();
    $('#modalEliminar').modal('show');
    
  });

  function eliminarInspector(){
    WaitingOpen();
    $.ajax({
      type: 'POST',
      data: { "inspectorid": id_},
      url: 'index.php/Inspector/Eliminar_Inspector', 
      success: function(data){
        WaitingClose();
        ActualizarPagina();                
      },

      error: function(result){
        WaitingClose();
        alert("OPERACION FALLIDA");
      }
    });

  }function ActualizarPagina(){ //Funcion Resfresca
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Inspector/index/<?php echo $permission; ?>");

}$(function () {
      
      $('#plantilla').DataTable({
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
    });</script>
<div class="modal" id="modalAgregar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Agregar Inspector</h4>
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
        <div class="col-xs-4">
                        <label style="margin-top: 7px;">Nombre y Apellido:<strong style="color: #dd4b39">*</strong>: </label>
                        </div>
                        <div class="col-xs-5">
                        <input type="text" class="form-control"  id="inspectornombre" >
                        </div>
</div><br>
        <div class="row"> 
        <div class="col-xs-4">
                        <label style="margin-top: 7px;">Mail <strong style="color: #dd4b39">*</strong>: </label>
                        </div>
                        <div class="col-xs-5">
                        <input type="text" class="form-control"  id="inspectormail" >
                        </div>
</div><br>
        <div class="row"> 
        <div class="col-xs-4">
                        <label style="margin-top: 7px;">Telefono <strong style="color: #dd4b39">*</strong>: </label>
                        </div>
                        <div class="col-xs-5">
                        <input type="text" class="form-control"  id="inspectorcel" >
                        </div>
</div><br>
        <div class="row"> 
        <div class="col-xs-4">
                        <label style="margin-top: 7px;">Sector <strong style="color: #dd4b39">*</strong>: </label>
                        </div>
                        <div class="col-xs-5">
                        <input type="text" class="form-control"  id="inspectorsector" >
                        </div>
</div><br>

      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-primary" onclick="guardarInspector()" >Guardar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- Modal -->
<div class="modal" id="modalEditar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Editar Inspector</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
       <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
             <h4><i class="icon fa fa-ban"></i> Error!</h4>
             Revise que todos los campos esten completos
           </div>
         </div>
       </div>

         
      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-primary" onclick="editarInspector()" >Guardar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- Modal -->


<div class="modal" id="modalEliminar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Eliminar Inspector</h4>
      </div>
      <div class="modal-body" >
       <h5>¿Desea eliminar el registro?</h5> 
      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarInspector()" >Eliminar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->