<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Denuncias Laborales</h3>
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
                <th>Tipo</th>
                <th>Denunciante</th>
								<th>Motivo</th>					
								<th>Razón Social</th>
								<th>Calle</th>
                <th>Nº Denuncia</th>
							</tr>
						</thead>
						<tbody>
              <?php               
              //var_dump($list);
                foreach( $list as $e ){                  
                  $id=$e['denunciaid'];
                  echo '<tr id="'.$id.'" class="'.$id.'" >';
  	              	echo '<td>';
                    if (strpos($permission,'View') !== false) {
                      echo '<i class="fa fa-fw fa-search text-light-blue btnView" style="cursor: pointer; margin-left: 15px;" data-denunciaid="'.$id.'" title="Ver detalle"></i>';
                    }
                    // if (strpos($permission,'Add') !== false) {
                    //   echo '<i class="fa fa-fw fa-pencil text-light-blue btnEdit" style="cursor: pointer; margin-left: 15px;" data-denunciaid="'.$id.'" data-toggle="modal" data-target="#modaleditar" ></i>';
                    // }  	                
  	                if (strpos($permission,'View') !== false) {
                      if ($e['inspeccionid'] > 0) {
                        echo '<i class="fa fa-fw fa-sticky-note text-light-blue btnInsp" style="cursor: pointer; margin-left: 15px;" data-denunciaId="'.$id.'" title="Ver inspecciones por Denuncia"></i>';
                      }                      
                    }
                    if (strpos($permission,'Del') !== false) {
  	                	echo '<i class="fa fa-fw fa-times-circle text-light-blue btnDelete" style="cursor: pointer; margin-left: 15px;" data-denunciaid="'.$id.'" title="Eliminar"></i>';
  	                }
  	                echo '</td>';
  									echo '<td>'.$e['denunciasfecha'].'</td>';
                    echo '<td>'.$e['denunciatipo'].'</td>';
                    echo '<td>'.$e['denunciadenunciante'].'</td>';
                    echo '<td>'.$e['denunciamotivos'].'</td>';
  									echo '<td>'.$e['emplearazsoc'].'</td>';
  									echo '<td>'.$e['establecalle'].' '.$e['establealtura'].'</td>';
                    echo '<td >'.($e['inspeccionid'] > 0 ? '<small class="label pull-left bg-green">Inspección</small>' : '<small class="label pull-left bg-yellow">S/Inspección</small>').'</td>';                    
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


<style type="text/css">
  #notaImgModal {
    z-index: 10000 !important;
  }
  .ui-autocomplete{
    z-index:1050;
  }
</style>


<script>
  
// autocompletar llena el empleador
autocompEmp();
function autocompEmp(){
  $( "#busEmpleador" ).autocomplete({
    source: "index.php/Denuncia/getDenominacionSocial",
    minLength: 1,
    select: function( event, ui ) {
      $( "#busEmpleador" ).val(ui.item.value);
      $("#empleaid").val(ui.item.id);
      getEstabecimiento();
    }
  });
}

// llena select de establecimientos
function getEstabecimiento(){
  var selector = $('#estable');
  var idEmp = $("#empleaid").val();
  $.ajax({
    async: true,
    global: false,
    url: "Denuncia/getEstablecimiento",
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
}    

// guarda denuncia nueva
function guardarDenuncia(){
  var denuncias = $("#denunciaNueva").serializeArray();
  $.ajax({
    data:denuncias,
    dataType: 'json',
    type:"POST",
    url: "index.php/DenunciaLaboral/setDenunciaOficio", 
    success: function(data){
      console.log("Guardado con exito...");
      Refrescar();
    },          
    error: function(result){
      console.log("Error en guardado de Denuncia...");
      console.log(result);                 
    },
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
    url: "index.php/DenunciaLaboral/deleteDenuncia", 
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
    url: "index.php/DenunciaLaboral/getDenPorId", 
    data:{id:id},
    success: function(data){                
      var calle = data[0]["establecalle"];
      var altura = data[0]["establealtura"];
      var estDireccion = calle + ' '+ altura;
      $('#busEmpleadorVer').val(data[0]["emplearazsoc"]);
      $('#estableVer').val(estDireccion);
      $('#fechaVer').val(data[0]["denunciasfecha"]);
      $('#tipoVer').val(data[0]["denunciatipo"]);
      $('#denuncianteVer').val(data[0]["denunciadenunciante"]); 
      $('#motivosVer').val(data[0]["denunciamotivos"]); 
    },          
    error: function(result){
        console.log("error en vuelta de datos denuncia...");
        console.log(result);                 
    },
    dataType: 'json'
  });
}
/* /ver*/


/* ver inspecciones por denuncia */ // LISTO!
$(".btnInsp").on("click", function(e){
  e.preventDefault();    
  var idDenuncia = $(this).data('denunciaid'); 
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Inspeccion/listInspPorDenuncia/<?php echo $permission; ?>/" + idDenuncia + "/");
  WaitingClose();
});
/*  / ver inspecciones por denuncia */

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
    data:{id:idEdit},
    dataType: 'json',
    type:"POST",
    url: "index.php/DenunciaLaboral/getDenPorId", 
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
  });
}

function getEstablecimientos(idEmpleador){
  var selector = $('#estableEdit');

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
          var opcion  = "<option value='"+result[i]['estableid']+"'>" +direccion+ "</option>";
          selector.append(opcion);
        }
      }
      else{
        selector.append("<option value='-1'>No hay Establecimientos</option>");
      }
    },
    'error' : function (result){
      console.log('Funcion: getEstablecimientos ERROR');
    },
  });
}

//actualiza a denuncia 
function updateDenuncia(){
  var denuncias = $("#denuciaEditar").serializeArray();
  var iddenuncia = $('#denunciaId').val();
  $.ajax({
    type:"POST",
    url: "index.php/DenunciaLaboral/updateDenuncia", 
    data:{denuncias:denuncias, id:iddenuncia},
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
  $("#content").load( '<?php echo base_url() ?>index.php/DenunciaLaboral/index/<?php echo $permission ?>' );
}


function resetModal(){
  $('#busEmpleador').val('');
}

// cargo plugin DateTimePicker
$('#fecha, #fechaEdit').datetimepicker({
  format: 'YYYY-MM-DD H:mm:ss',
  locale: 'es',
});
  
/* cargo plugin DataTable (debe ir al final de los script) */
$("#tbl-denuncias").DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "columnDefs": [ {
    "targets": [ 0 ], //no busco en acciones
    "searchable": false
  },
  {
    "targets": [ 0 ], //no ordena columna 0
    "orderable": false
  } ],
});
</script>


<!-- Modal Agregar -->
<div class="modal fade" id="modalAgregar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Denuncia Laboral</h4>
      </div>
      <div class="modal-body" id="cuerpoModalAgregar">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos...
            </div>
          </div>
        </div>

        <form id="denunciaNueva" class="form-horizontal">
          <div class="form-group">
            <label for="busEmpleador" class="col-sm-4 pull-left">Empleador<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type="text" class="form-control busEmpleador" placeholder="Buscar Empleador..." id="busEmpleador" name="">
              <input type="hidden" class="empleaid" id="empleaid" name="">
              <input type="hidden" class="denunciaestado" id="denunciaestado" name="denunciaestado" value="AC">
            </div>
          </div>

          <div class="form-group">
            <label for="estableid" class="col-sm-4 pull-left">Establecimiento<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <select name="estableid" class="form-control estable" id="estable">
                <option value="-1" placeholder="Seleccione..."></option>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="denunciasfecha" class="col-sm-4 pull-left">Fecha<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type='text' class="form-control" id="fecha" name="denunciasfecha" value="<?php echo date("Y-m-d H:i:s") ?>">
            </div>
          </div>

          <div class="form-group">
            <label for="denunciatipo" class="col-sm-4 pull-left">Tipo Denuncia<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <select name="denunciatipo" class="form-control estable" id="estable">
                <option value="Individual">Individual</option>
                <option value="Plurindividual">Plurindividual</option>
                <option value="Sindical">Sindical</option>
                <option value="Oficio">Oficio</option>
                <option value="Por inscripción">Por inscripción</option>
                <option value="Constatación de documentación laboral">Constatación de documentación laboral</option>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="denunciadenunciante" class="col-sm-4 pull-left">Denunciante<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type='text' class="form-control" id="denunciadenunciante" name="denunciadenunciante" placeholder="Ingrese Denunciante">
            </div>
          </div>

          <div class="form-group">
            <label for="denunciamotivos" class="col-sm-4 pull-left">Detalle de la Denuncia<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <textarea placeholder="Agregar detalle" class="form-control" name="denunciamotivos" rows="3" id="nota" value=""></textarea>
            </div>
          </div>
        </form>
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
        <h4 class="modal-title"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Denuncia Laboral</h4>
      </div>
      <div class="modal-body" id="cuerpoModalVer">
        <form id="denunciaNueva" class="form-horizontal">
          <div class="form-group">
            <label for="busEmpleadorVer" class="col-sm-4 pull-left">Empleador<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type="text" class="form-control busEmpleadorVer" placeholder="Buscar Empleador..." id="busEmpleadorVer" name="" disabled>
              <input type="hidden" class="empleaid" id="empleaid" name="">
              <input type="hidden" class="denunciaestado" id="denunciaestado" name="denunciaestado" value="AC">
            </div>
          </div>

          <div class="form-group">
            <label for="estableVer" class="col-sm-4 pull-left">Establecimiento<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type="text" class="form-control estableVer" placeholder="" id="estableVer" name="" disabled>
            </div>
          </div>

          <div class="form-group">
            <label for="fechaVer" class="col-sm-4 pull-left">Fecha<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type='text' class="form-control" id="fechaVer" name="fechaVer" value="<?php echo date("Y-m-d H:i:s") ?>" disabled>
            </div>
          </div>

          <div class="form-group">
            <label for="tipoVer" class="col-sm-4 pull-left">Tipo Denuncia<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type="text" class="form-control tipoVer" placeholder="" id="tipoVer" name="" disabled>
            </div>
          </div>

          <div class="form-group">
            <label for="denuncianteVer" class="col-sm-4 pull-left">Denunciante<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type='text' class="form-control" id="denuncianteVer" name="denuncianteVer" disabled>
            </div>
          </div>

          <div class="form-group">
            <label for="motivosVer" class="col-sm-4 pull-left">Detalle de la Denuncia<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <textarea placeholder="Agregar detalle" class="form-control" name="motivosVer" rows="3" id="motivosVer" value="" disabled></textarea>
            </div>
          </div>
        </form>
      </div> <!--/ .modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="reset()" data-dismiss="modal">Cancelar</button>
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
        <h4 class="modal-title"><span id="modalAction" class="fa fa-pencil text-light-blue"></span> Editar Denuncia Laboral</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos...
            </div>
          </div>
        </div>

        <form id="denuciaEditar" class="form-horizontal">
          <div class="form-group">
            <label for="busEmpleadorEdit" class="col-sm-4 pull-left">Empleador<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type="text" class="form-control busEmpleadorEdit" placeholder="Buscar Empleador..." id="busEmpleadorEdit" name="">
              <input type="hidden" class="empleaid" id="empleaid" name="">
              <input type="hidden" class="denunciaestado" id="denunciaestado" name="denunciaestado" value="AC">
            </div>
          </div>

          <div class="form-group">
            <label for="estableid" class="col-sm-4 pull-left">Establecimiento<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <select name="estableid" class="form-control estable" id="estableEdit">
                <option value="-1" placeholder="Seleccione..."></option>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="denunciasfecha" class="col-sm-4 pull-left">Fecha<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type='text' class="form-control" id="fechaEdit" name="denunciasfecha" value="<?php echo date("Y-m-d H:i:s") ?>">
            </div>
          </div>

          <div class="form-group">
            <label for="denunciatipo" class="col-sm-4 pull-left">Tipo Denuncia<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <select name="denunciatipo" class="form-control estable" id="tipoEdit">
                <option value="Individual">Individual</option>
                <option value="Plurindividual">Plurindividual</option>
                <option value="Sindical">Sindical</option>
                <option value="Oficio">Oficio</option>
                <option value="Por inscripción">Por inscripción</option>
                <option value="Constatación de documentación laboral">Constatación de documentación laboral</option>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="denunciadenunciante" class="col-sm-4 pull-left">Denunciante<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <input type='text' class="form-control" id="denunciadenuncianteEdit" name="denunciadenunciante" placeholder="Ingrese Denunciante">
            </div>
          </div>

          <div class="form-group">
            <label for="denunciamotivos" class="col-sm-4 pull-left">Detalle de la Denuncia<strong class="text-red">*</strong>: </label>
            <div class="col-sm-8">
              <textarea placeholder="Agregar detalle" class="form-control" name="denunciamotivos" id="motivosEdit" ></textarea>
            </div>
          </div>
        </form>
      </div> <!--/ .modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="reset()" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updateDenuncia()">Guardar</button>
      </div>
    </div> <!-- / .modal-conten -->
  </div>
</div>


<!-- Modal confirma eliminar -->
<div class="modal" id="confirmDelete">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction" class="fa fa-trash text-light-blue"></span> Eliminar Profesional</h4>
      </div>

      <div class="modal-body" id="cuerpoModalEliminar">
        <input type="hidden" name="iddenuncia" id="iddenuncia">
        <p><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Está seguro que desea continuar? Esta acción es irreversible.</p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="borrarDenuncia()">Eliminar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

