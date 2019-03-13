<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <h3>Detalle de Inspección</h3>
  <?php cargarCabeceraEditaActa($idTarBonita); ?>
  <input id="idTarBonita" class="hidden" value="<?php echo $idTarBonita;?>">

  <div class="modal-footer">
    <button type="button" id="btnInsp" class="btn btn-primary">Volver a Inspecciones</button>
  </div>
</section>

<!-- Modal Eliminar Adjunto -->
<div class="modal" id="modalEliminarAdjunto">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="idAdjunto">
        <h4>¿Desea eliminar Archivo Adjunto?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarAdjunto();">Eliminar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Agregar adjunto -->
<div class="modal" id="modalAgregarAdjunto">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span class="fa fa-fw fa-plus-square text-light-blue"></span> Agregar</h4>
      </div>

      <form id="formAgregarAdjunto">
        <div class="modal-body">
          <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
            <h4><i class="icon fa fa-ban"></i> Error!</h4>
            Seleccione un Archivo Adjunto
          </div>
          <input type="hidden" id="idAgregaAdjunto" name="idAgregaAdjunto">
          <input id="inputPDF" name="inputPDF" type="file" class="form-control input-md">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary" id="btnAgregarEditar">Agregar</button>
        </div>
      </form>
    </div>
  </div>
</div>



<script>
//abrir modal agregar adjunto
$(document).on("click",".agregaAdjunto",function(){
  $('#btnAgregarEditar').text("Agregar");
  $('#modalAgregarAdjunto .modal-title').html('<span class="fa fa-fw fa-plus-square text-light-blue"></span> Agregar');

  $('#modalAgregarAdjunto').modal('show');
  var idActa = $(this).closest('tr').data('idacta');
  $('#idAgregaAdjunto').val(idActa);
});
//abrir modal editar adjunto
$(document).on("click",".editaAdjunto",function(){
  $('#btnAgregarEditar').text("Editar");
  $('#modalAgregarAdjunto .modal-title').html('<span class="fa fa-fw fa-pencil text-light-blue"></span> Editar');

  $('#modalAgregarAdjunto').modal('show');
  var idActa = $(this).closest('tr').data('idacta')
  $('#idAgregaAdjunto').val(idActa);
});
//abrir modal eliminar adjunto
$(document).on("click",".eliminaAdjunto",function(){
  //console.log( $(this).closest('tr').data('idacta') );
  $('#modalEliminarAdjunto').modal('show');
  var idActa = $(this).closest('tr').data('idacta');
  $('#idAdjunto').val(idActa);
});

//agregar/editar adjunto
$("#formAgregarAdjunto").submit(function (event){
  $('#modalAgregarAdjunto').modal('hide');

  event.preventDefault();  
  if (document.getElementById("inputPDF").files.length == 0) {
    $('#error').fadeIn('slow');
  }
  else{
    $('#error').fadeOut('slow');
    var formData = new FormData($("#formAgregarAdjunto")[0]);
    //debugger
    $.ajax({
      cache:false,
      contentType:false,
      data:formData,
      dataType:'json',
      processData:false,
      type:'POST',
      url:'index.php/Inspeccion/agregarAdjunto',
    })
    .done( function(data){     
      //console.table(data); 
      llenar_adjunto( data['adjunto'],data['idActa']  );
    })                
    .error( function(result){                      
      console.error(result);
    }); 
  }
});
//eliminar adjunto
function eliminarAdjunto() {
  $('#modalEliminarAdjunto').modal('hide');
  var idActa = $('#idAdjunto').val();
  $.ajax({
    data: { idActa:idActa },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Inspeccion/eliminarAdjunto',
  }) 
  .done( function(data){     
    //console.table(data); 
    let adjunto = '';
    llenar_adjunto(adjunto, idActa);
  })                
  .error( function(result){                      
    console.error(result);
  }); 
}


//llena los datos de archivo adjunto
function llenar_adjunto(adjunto, idActa) {
  let celdaAdjunto = $('tr[data-idacta="'+idActa+'"] td.accionAdjunto');

  if( adjunto == null || adjunto == '') {
    var accion = '<i class="fa fa-plus-square agregaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Agregar Adjunto"></i>';
  } else {
    var accion = '<i class="fa fa-times-circle eliminaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Eliminar Adjunto"></i>'+'<i class="fa fa-pencil editaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Editar Adjunto"></i>'+
      '<a href="'+adjunto+'" id="adjunto" target="_blank">Ver Acta</a>';
  }

  celdaAdjunto.html(accion);
}


/* ver inspecciones por denuncia */ // LISTO!
$("#btnInsp").on("click", function(e){
  e.preventDefault();    
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Inspeccion/index/<?php echo $permission; ?>/");
  WaitingClose(); 
});
</script>

