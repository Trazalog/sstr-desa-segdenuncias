<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Liquidaciones</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-success" style="width: 100px; margin-top: 10px;" data-toggle="modal"  data-target="#modalAgregar" id="btnAdd">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="liquidaciones" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>ID</th>
                <th>Descripción</th>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach($list as $c)
                    {
                    $id=$c['sisliquiid'];

                    echo '<tr id="'.$id.'" class="'.$id.'" >';
                    echo '<td>';
                    if (strpos($permission,'Edit') !== false) {
                        echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;"></i>';
                    }
                    if (strpos($permission,'Del') !== false) {
                        echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar"></i>';
                    }
                    

                    echo '</td>';
                    echo '<td>'.$c['sisliquiid'].'</td>';
                    echo '<td>'.$c['descripcion'].'</td>';
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
    function guardarLiquidacion(){
      var descripcion=$('#descripcion').val();

    var hayError = false;
    if($('#descripcion').val() == '')
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
             data: { "descripcion": descripcion },
             url: 'index.php/Liquidacion/Guardar_liquidacione', 
             success: function(result){

                WaitingClose();
                $('#modalAgregar').modal('hide');
                regresa();


            },
            error: function(result){
              WaitingClose();
                alert("OPERACIÓN FALLIDA");
            }
            });
    }
    var sisliquiid ="";
    $(".fa-pencil").click(function (e) { 

        sisliquiid = $(this).parents('tr').find('td').eq(1).html();
        var descripcion = $(this).parents('tr').find('td').eq(2).html();


        $('#cuerpoModalEditar').html(' <div class="row">'+
          '<div class="col-xs-12">'+
            '<div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">'+
             '<h4><i class="icon fa fa-ban"></i> Error!</h4>'+
             'Revise que todos los campos esten completos'+
           '</div>'+
         '</div>'+
       '</div>'+
       ' <div class="row">'+
            '<div class="col-xs-4">'+
                '<label style="margin-top: 7px;">Descripción <strong style="color: #dd4b39">*</strong>: </label>'+
            '</div>'+
            '<div class="col-xs-5">'+
                '<input type="text" class="form-control"  id="descripcionE"  value="'+descripcion+'">'+

            '</div>'+
        '</div><br>'
        );
        $('#modalEditar').modal('show');

    });

    function editarLiquidacion(){
     var id=sisliquiid;
     var descripcion=$('#descripcionE').val();
     console.log(id +""+descripcion);
     var hayError = false;
    if($('#descripcionE').val() == '')
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
       data: {"sisliquiid" : id,  "descripcion": descripcion },
       url: 'index.php/Liquidacion/Modificar_liquidacione', 
       success: function(result){
        WaitingClose();
        $('#modalEditar').modal('hide');
        regresa();     

    },
    error: function(result){
      WaitingClose();
        alert("OPERACIÓN FALLIDA");
        console.log(result);
    }

});

 }

$(".fa-times-circle").click(function (e) { 

    id= $(this).parents('tr').find('td').eq(1).html();
    $('#modalEliminar').modal('show');
    
  });
 
    //eliminar 
    function eliminarLiquidacion(){
      WaitingOpen();
        $.ajax({
                type: 'POST',
                data: { "sisliquiid": id},
                url: 'index.php/Liquidacion/Eliminar_liquidacione', 
                success: function(data){
                  WaitingClose();
                        console.log(data);
                        regresa();
                      
                      },
                  
                error: function(result){
                  WaitingClose();
                      alert("OPERACIÓN FALLIDA");
                   }
        });
    }


    function regresa(){
        $('#content').empty();
        $("#content").load("<?php echo base_url(); ?>index.php/Liquidacion/index/<?php echo $permission; ?>");
        
    }

$(function(){
    /* cargo plugin DataTable (debe ir al final de los script) */
    $("#liquidaciones").DataTable({
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
            "sLengthMenu":     "Mostrar MENU registros",
            "sZeroRecords":    "No se encontraron resultados",
            "sEmptyTable":     "Ningún dato disponible en esta tabla",
            "sInfo":           "Mostrando registros del START al END de un total de TOTAL registros",
            "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered":   "(filtrado de un total de MAX registros)",
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

<style type="text/css">
    .contenedor{ width: 350px; float: center;}
    #camara, #foto, #imgCamera{
        width: 320px;
        min-height: 240px;
        border: 1px solid #008000;
    }
</style>

<!-- Modal -->
<div class="modal" id="modalAgregar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Agregar Liquidación</h4>
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
          <label style="margin-top: 7px;">Descripción <strong style="color: #dd4b39">*</strong>: </label>
        </div>
        <div class="col-xs-5">
          <input type="text" class="form-control"  id="descripcion" >

        </div>
      </div><br>

      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-primary" onclick="guardarLiquidacion()" >Guardar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<div class="modal" id="modalEditar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Editar Liquidación</h4>
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

        <button type="button" class="btn btn-primary" onclick="editarLiquidacion()" >Guardar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal" id="modalEliminar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Eliminar Liquidacion</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
       <h5>¿Desea eliminar el registro?</h5> 
      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarLiquidacion()" >Eliminar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->