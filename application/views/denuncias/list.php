<input type="hidden" id="permission" value="<?php echo $permission;?>">

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Denuncias</h3>
				</div><!-- /.box-header -->
				<div class="box-body">
					<?php
					if (strpos($permission,'Add') !== false) {
						echo '<div class="form-group">';
						echo '<button class="btn btn-primary" id="btnAdd" data-toggle="modal" data-target="#modalAgregar">Agregar</button>';
						echo '</div>';
					}
					?>
					<table id="tbl-denuncias" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th style="width:12%;">Acción</th>							
								<th>Fecha</th>
								<th>Motivo</th>								
								<th>Razón Social</th>
								<th>Calle</th>
                <th>Altura</th>
							</tr>
						</thead>
						<tbody>
              <?php 
              //if(is_array($list)) {
                //var_dump($list);
                //foreach( (array)$list as $e )
                foreach( $list as $e )
  							{
                  //var_dump($e);
                  $id=$e['denunciaid'];
                  //var_dump($id);
                  echo '<tr id="'.$id.'" class="'.$id.'" >';
  	              	echo '<td>';
                    if (strpos($permission,'View') !== false) {
                      echo '<i class="fa fa-fw fa-search text-light-blue btnView" style="cursor: pointer; margin-left: 15px;" data-denunciaid="'.$id.'"></i>';
                    }
                    if (strpos($permission,'Add') !== false) {
                      echo '<i class="fa fa-fw fa-pencil text-light-blue btnEdit" style="cursor: pointer; margin-left: 15px;" data-denunciaid="'.$id.'" data-toggle="modal" data-target="#modaleditar" ></i>';
                    }
  	                if (strpos($permission,'Del') !== false) {
  	                	echo '<i class="fa fa-fw fa-times-circle text-light-blue btnDelete" style="cursor: pointer; margin-left: 15px;" data-denunciaid="'.$id.'"></i>';
  	                }
  	                // if (strpos($permission,'View') !== false) {
                    //   echo '<i class="fa fa-fw fa-sticky-note text-light-blue btnNote" style="cursor: pointer; margin-left: 15px;" data-denunciaId="'.$id.'"></i>';
  	                // }
  	                echo '</td>';
  									echo '<td>'.$e['denunciasfecha'].'</td>';
                    echo '<td>'.$e['denunciamotivos'].'</td>';
  									echo '<td>'.$e['emplearazsoc'].'</td>';
  									echo '<td>'.$e['establecalle'].'</td>';
  									echo '<td>'.$e['establealtura'].'</td>';
                    
  									//echo '<td>'.$e['empleaid'].'</td>';
  									// echo '<td>'.$e['sisliquidescrip'].'</td>';
  									// echo '<td>'.$e['empleapmasc'].'</td>';
  									// echo '<td>'.$e['empleapfem'].'</td>';
  								echo '</tr>';
  							}
              //} 
            ?>
						</tbody>
					</table>
				</div><!-- /.box-body -->
			</div><!-- /.box -->
		</div><!-- /.col -->
	</div><!-- /.row -->
</section><!-- /.content -->



<!-- ver segundo modal -->
<style type="text/css">
  #notaImgModal {
    z-index: 10000 !important;
  }
</style>


<script>



  
  // autocompletar llena el empleador
  //$( 
    autocompEmp();
    function autocompEmp(){  
      $( "#busEmpleador" ).autocomplete({
        source: "index.php/Inspeccion/getDenominacionSocial",
        minLength: 1,
        select: function( event, ui ) {        
          $( "#busEmpleador" ).val(ui.item.value);
          $("#empleaid").val(ui.item.id);
        }
      });
  }
  //);
  // llena select de establecimientos
  $('#busEmpleador').on("change", function(){
    var selector = $('#estable');
    var idEmp = $("#empleaid").val();
    $.ajax({
        async: true,
        global: false,
        url: "Inspeccion/getEstablecimiento",
        type: 'POST',
        dataType : "json",
        data: {"empleaid" : idEmp },
        'success': function (result) {
                    
                    selector.html('');
                    if(result!=null){
                      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                      selector.append(opcion); 
                      for(var i=0; i < result.length ; i++){    
                        var direccion = result[i]['establecalle'];
                        var opcion  = "<option value='"+result[i]['estableid']+"'>" +direccion+ "</option>" ; 
                        selector.append(opcion); 
                      }
                      selector.val(idEstablecimiento);
                    }
                    else{
                      selector.append("<option value='-1'>No hay Establecimientos</option>");
                    }
                },
        'error' : function (result){
                  console.log('Funcion: getEstablecimientos ERROR');
                  alert('error');
              }
    });
  });
  // guarda denuncia nueva
  function guardarDenuncia(){
    var denuncias = $("#denunciaNueva").serializeArray();
    $.ajax({
      type:"POST",
      url: "index.php/Denuncia/setDenunciaOficio", 
      data:denuncias,
      success: function(data){
        console.log("Guardado con exito...");
        Refrescar();
      },          
      error: function(result){
          console.log("Error en guardado de Denuncia...");
          console.log(result);                 
      },
      dataType: 'json'
    });
  }  
  // toma id de denuncia para eliminar
  $(".btnDelete").on("click", function(e){
    e.preventDefault();
    var id = $(this).data('denunciaid');   
    //var id = $(this).parents("tr").attr('id');
    $('#iddenuncia').val(id);
    $('#confirmDelete').modal('show');
  });  
  //elimina denuncia por id
  function borrarDenuncia(){
    var idden = $('#iddenuncia').val();
    $('#confirmDelete').modal('hide');
    $.ajax({
      type:"POST",
      url: "index.php/Denuncia/deleteDenuncia", 
      data:{id:idden},
      success: function(data){
        console.log("borrado con exito...");
        Refrescar();
      },          
      error: function(result){
          console.log("Error en borrado de Denuncia...");
          console.log(result);                 
      },
      dataType: 'json'
    });
  }

  /*ver*/
  // toma id de denuncia para mostrar
  $(".btnView").on("click", function(e){
    e.preventDefault();
    var id = $(this).data('denunciaid');   
    //var id = $(this).parents("tr").attr('id');
    getDenPorIdView(id);
    $('#modalView').modal('show');
  });
  // trae denuncia por id para mostrar
  function getDenPorIdView(id){    
    $.ajax({
      type:"POST",
      url: "index.php/Denuncia/getDenPorId", 
      data:{id:id},
      success: function(data){                
        var calle = data[0]["establecalle"];
        var altura = data[0]["establealtura"];
        var estDireccion = calle + ' '+ altura;
        $('#busEmpleadorVer').val(data[0]["emplearazsoc"]);
        $('#estableVer').val(estDireccion);
        $('#fechaVer').val(data[0]["denunciasfecha"]);
        $('#motivosVer').val(data[0]["denunciamotivos"]); 
        $('#tipoVer').val(data[0]["denunciatipo"]);
      },          
      error: function(result){
          console.log("error en vuelta de datos denuncia...");
          console.log(result);                 
      },
      dataType: 'json'
    });
  }
/* /ver*/



/* Editar */
// toma id de denuncia para editar
$(".btnEdit").on("click", function(e){
    e.preventDefault();
    var idEdit = $(this).data('denunciaid');   
    //var id = $(this).parents("tr").attr('id');
    $('#denunciaId').val(idEdit);
    getDenPorIdEdit(idEdit);
    $('#modalEditar').modal('show');
  });
  // trae denuncia por id para mostrar
  function getDenPorIdEdit(idEdit){    
    $.ajax({
      type:"POST",
      url: "index.php/Denuncia/getDenPorId", 
      data:{id:idEdit},
      success: function(data){                
        var calle = data[0]["establecalle"];
        var altura = data[0]["establealtura"];
        //var estDireccion = calle + ' '+ altura;
        $('#busEmpleadorEdit').val(data[0]["emplearazsoc"]);
        //$('#estableEdit').val(estDireccion);
        $('#fechaEdit').val(data[0]["denunciasfecha"]);
        $('#motivosEdit').val(data[0]["denunciamotivos"]);        
        var empId = data[0]["empleaid"];
        getEstablecimientos(empId);
      },          
      error: function(result){
          console.log("error en vuelta de datos denuncia...");
          console.log(result);                 
      },
      dataType: 'json'
    });
  }

  function getEstablecimientos(idEmpleador){
    var selector = $('#estableEdit');
    //console.log(id);
    $.ajax({
      async: true,
      global: false,
      url: "Inspeccion/getEstablecimiento",
      type: 'POST',
      dataType : "json",
      data: {"empleaid" : idEmpleador },
      'success': function (result) {
                  selector.html('');
                  if(result!=null){
                  var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                  selector.append(opcion); 
                    for(var i=0; i < result.length ; i++){    
                      var direccion = result[i]['establecalle'];
                      var opcion  = "<option value='"+result[i]['estableid']+"'>" +direccion+ "</option>" ; 
                      selector.append(opcion);
                    }
                    selector.val(idEstablecimiento);
                  }
                  else{
                    selector.append("<option value='-1'>No hay Establecimientos</option>");
                  }
                },
      'error' : function (result){
        console.log('Funcion: getEstablecimientos ERROR');
        //alert('error');
      },
    });
  }

  //actualiza a denuncia 
  function updateDenuncia(){

    var denuncias = $("#denuciaEditar").serializeArray();
    var iddenuncia = $('#denunciaId').val();
    $.ajax({
      type:"POST",
      url: "index.php/Denuncia/updateDenuncia", 
      data:{denuncias:denuncias,
            id:iddenuncia},
      success: function(data){
        console.log("Guardado con exito...");
        Refrescar();
      },          
      error: function(result){
          console.log("Error en guardado de Denuncia...");
          console.log(result);                 
      },
      dataType: 'json'
    });
  }
/* / Editar */

  
  
  // recarga la pagina
  function Refrescar(){
    $('#content').empty();
    $("#content").load( '<?php echo base_url() ?>index.php/Denuncia/index/<?php echo $permission ?>' );
    //$('#modalAgregar').modal('hide');
    WaitingClose();
  }



  // cargo plugin DateTimePicker
  $('#fecha, #fechaEdit').datetimepicker({
    format: 'YYYY-MM-DD H:mm:ss',
    locale: 'es',
  });

</script>



<script>
  
  
   /* cargo plugin DataTable (debe ir al final de los script) */
   $("#tbl-denuncias").DataTable({
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
</script>

<!-- Modal Agregar -->
<div class="modal fade" id="modalAgregar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Agregar Denuncia</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
        <div class="row">

          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos...
            </div>
          </div>
          <style>
          .ui-autocomplete{
            z-index:1050;
          }
        </style>
      <form id="denunciaNueva">
        <div class="col-xs-3">
          <label style="margin-top: 7px;">Empleador: </label>
        </div><br>
        <br>
        <div class="col-xs-9">
          <input type="text" class="form-control busEmpleador" placeholder="Buscar Empleador..." id="busEmpleador" name="" style="width: 80%;">
          <input type="text" class="hidden empleaid" id="empleaid" name="">
          <input type="text" class="hidden denunciatipo" id="denunciatipo" name="denunciatipo" value="Oficio">
          <input type="text" class="hidden denunciaestado" id="denunciaestado" name="denunciaestado" value="AC">
        </div> 
        <br><br>
        <div class="col-xs-3">
          <label style="margin-top: 7px;">Establecimiento<strong style="color: #dd4b39">*</strong>: </label>
        </div><br>
        <br>
        <div class="col-xs-9">
          <select name="estableid" class="form-control estable" id="estable" style="width: 80%;">
            <option value="-1" placeholder="Seleccione..."></option>
          </select>
        </div><br><br>   
        <div class="col-xs-3">
          <label style="margin-top: 9px;">Fecha<strong style="color: #dd4b39">*</strong>: </label>
        </div><br><br>
        <div class="col-xs-6">         

          <input type='text' class="form-control" id="fecha" name="denunciasfecha" value="<?php echo date("Y-m-d H:i:s") ?>">
        </div><br><br>

        <div class="col-xs-3">
          <label style="margin-top: 7px;">Tipo Denuncia<strong style="color: #dd4b39">*</strong>: </label>
        </div><br>
        <br>
        <div class="col-xs-6">
          <select name="denunciatipo" class="form-control estable" id="tipo" style="width: 80%;">
            
            <option value="Denuncia" placeholder="">Denuncia</option>
            <option value="Oficio" placeholder="">Oficio</option>
            <option value="Denuncia por Expediente" placeholder="">Denuncia por Expediente</option>
            <option value="Nota levantamiento suspensión" placeholder="">Nota levantamiento suspensión</option>
          </select>
          <!-- <input type="text" class="form-control estableVer" placeholder="" id="estableVer" name="" style="width: 80%;" disabled> -->
        </div><br><br>

        <div class="col-xs-6">
          <label style="margin-top: 9px;">Detalle de la Denuncia:</label>
        </div><br><br>
        <div class="col-xs-9">
          <textarea placeholder="Agregar detalle" class="form-control" name="denunciamotivos" rows="3" id="nota" value=""></textarea>
        </div><br><br>
      </div>
    </form>  
      <br>
    </div> <!--/ .modal-body -->

    <div class="modal-footer">
      <button type="button" class="btn btn-default" onclick="reset()" data-dismiss="modal">Cancelar</button>
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardarDenuncia()">Guardar</button>
    </div>
  </div> <!-- / .modal-conten -->
</div>
</div>

<!-- Modal Ver -->
<div class="modal fade" id="modalView">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Denuncia</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
        <div class="row">

          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos...
            </div>
          </div>
          <style>
          .ui-autocomplete{
            z-index:1050;
          }
        </style>
      <form id="denunciaNueva">
        <div class="col-xs-3">
          <label style="margin-top: 7px;">Empleador: </label>
        </div><br>
        <br>
        <div class="col-xs-9">
          <input type="text" class="form-control busEmpleadorVer" placeholder="" id="busEmpleadorVer" name="" style="width: 80%;" disabled>
          
          <input type="text" class="hidden empleaid" id="iddenunciaVer" name="">
          <input type="text" class="hidden empleaid" id="empleaid" name="">
          <input type="text" class="hidden denunciatipo" id="denunciatipo" name="denunciatipo" value="Oficio">
          <input type="text" class="hidden denunciaestado" id="denunciaestado" name="denunciaestado" value="AC">
        </div> 
        <br><br>
        <div class="col-xs-3">
          <label style="margin-top: 7px;">Establecimiento<strong style="color: #dd4b39">*</strong>: </label>
        </div><br>
        <br>
        <div class="col-xs-9">
          <!-- <select name="estableid" class="form-control estable" id="estable" style="width: 80%;">
            <option value="-1" placeholder="Seleccione..."></option>
          </select> -->
          <input type="text" class="form-control estableVer" placeholder="" id="estableVer" name="" style="width: 80%;" disabled>
        </div><br><br>   
        <div class="col-xs-3">
          <label style="margin-top: 9px;">Fecha<strong style="color: #dd4b39">*</strong>: </label>
        </div><br><br>
        <div class="col-xs-6">         

          <input type='text' class="form-control" id="fechaVer" name="fechaVer" value="<?php echo date("Y-m-d H:i:s") ?>" disabled>
        </div><br><br>

        <div class="col-xs-3">
          <label style="margin-top: 7px;">Tipo Denuncia<strong style="color: #dd4b39">*</strong>: </label>
        </div><br>
        <br>
        <div class="col-xs-6">
          <!-- <select name="denunciatipo" class="form-control estable" id="estableEdit" style="width: 80%;">
            <option value="SRT" placeholder="">SRT</option>
            <option value="Denuncia" placeholder="">Denuncia</option>
            <option value="Oficio" placeholder="">Oficio</option>
            <option value="Denuncia por Expediente" placeholder="">Denuncia por Expediente</option>
            <option value="Nota levantamiento suspensión" placeholder="">Nota levantamiento suspensión</option>
          </select> -->
          <input type="text" class="form-control tipoVer" placeholder="" id="tipoVer" name="" style="width: 80%;" disabled>
        </div><br><br>

        <div class="col-xs-6">
          <label style="margin-top: 9px;">Detalle de la Denuncia:</label>
        </div><br><br>
        <div class="col-xs-9">
          <textarea placeholder="" class="form-control" name="denunciamotivos" rows="3" id="motivosVer" value="" disabled></textarea>
        </div><br><br>
      </div>
    </form>  
      <br>
    </div> <!--/ .modal-body -->

    <div class="modal-footer">
      <button type="button" class="btn btn-default" onclick="reset()" data-dismiss="modal">Cancelar</button>
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardarDenuncia()">Guardar</button>
    </div>
  </div> <!-- / .modal-conten -->
</div>
</div>



<!-- Modal Editar -->
<div class="modal fade" id="modalEditar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Editar Denuncia</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
        <div class="row">

          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos...
            </div>
          </div>
          <style>
          .ui-autocomplete{
            z-index:1050;
          }
        </style>
      <form id="denuciaEditar">
        <div class="col-xs-3">
          <label style="margin-top: 7px;">Empleador: </label>
        </div><br>
        <br>
        <div class="col-xs-9">
          <input type="text" class="form-control busEmpleadorEdit" placeholder="" id="busEmpleadorEdit" name="" style="width: 80%;" disabled>
          
          <!-- <input type="text" class="hidden empleaid" id="iddenunciaVer" name=""> -->
          <input type="text" class="hidden denunciaId" id="denunciaId" name="">
          
          <input type="text" class="hidden denunciaestado" id="denunciaestado" name="denunciaestado" value="AC">
        </div> 
        <br><br>
        <div class="col-xs-3">
          <label style="margin-top: 7px;">Establecimiento<strong style="color: #dd4b39">*</strong>: </label>
        </div><br>
        <br>
        <div class="col-xs-9">
          <select name="estableid" class="form-control estable" id="estableEdit" style="width: 80%;">
            <option value="-1" placeholder="Seleccione..."></option>
          </select>
          <!-- <input type="text" class="form-control estableVer" placeholder="" id="estableVer" name="" style="width: 80%;" disabled> -->
        </div><br><br>   
        <div class="col-xs-3">
          <label style="margin-top: 9px;">Fecha<strong style="color: #dd4b39">*</strong>: </label>
        </div><br><br>
        <div class="col-xs-6">
          <input type='text' class="form-control" id="fechaEdit" name="denunciasfecha" value="<?php echo date("Y-m-d H:i:s") ?>">
        </div><br><br>

        <div class="col-xs-3">
          <label style="margin-top: 7px;">Tipo Denuncia<strong style="color: #dd4b39">*</strong>: </label>
        </div><br>
        <br>
        <div class="col-xs-6">
          <select name="denunciatipo" class="form-control" id="tipoEdit" style="width: 80%;">
            <option value="SRT" placeholder="">SRT</option>
            <option value="Denuncia" placeholder="">Denuncia</option>
            <option value="Oficio" placeholder="">Oficio</option>
            <option value="Denuncia por Expediente" placeholder="">Denuncia por Expediente</option>
            <option value="Nota levantamiento suspensión" placeholder="">Nota levantamiento suspensión</option>
          </select>
          <!-- <input type="text" class="form-control estableVer" placeholder="" id="estableVer" name="" style="width: 80%;" disabled> -->
        </div><br><br>        

        <div class="col-xs-6">
          <label style="margin-top: 9px;">Detalle de la Denuncia:</label>
        </div><br><br>
        <div class="col-xs-9">
          <textarea placeholder="" class="form-control" name="denunciamotivos" rows="3" id="motivosEdit" value=""></textarea>
        </div><br><br>
      </div>
    </form>  
      <br>
    </div> <!--/ .modal-body -->

    <div class="modal-footer">
      <button type="button" class="btn btn-default" onclick="reset()" data-dismiss="modal">Cancelar</button>
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updateDenuncia()">Guardar</button>
    </div>
  </div> <!-- / .modal-conten -->
</div>
</div>


<!-- Modal Confirma Eliminar -->
<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-question-circle"></i>Confirmación de Eliminar</h4>
      </div>
          <input id="iddenuncia" class="hidden">
      <div class="modal-body alert alert-warning">
        <p>Está seguro que desea continuar? Esta acción es irreversible.</p>
        <p>Quiere proceder?</p>
        <p class="debug-url"></p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <a class="btn btn-danger" id="btnConfirmDelete" onclick="borrarDenuncia()">Eliminar</a>
      </div>
    </div>
  </div>
</div>
