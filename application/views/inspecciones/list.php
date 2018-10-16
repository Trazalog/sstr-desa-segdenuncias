<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <!-- <center>
            <h2> Inspecciones </h2>  
          </center> -->
          <h3 class="box-title">Inspecciones</h3>
          <br><br>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-success" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd" title="Nueva">Agregar</button>';
          }
          ?>

        </div><!-- /.box-header -->
        <div class="box-body">
         
          <!-- <div class="row">
            <div class="col-sm-12 col-md-12">
                <h4>Criterios de Búsqueda</h4>
                <div class="btn-group" data-toggle="buttons">
                  <label class="btn btn-primary">
                    <input type="radio" name="accion" id="inspeccion" autocomplete="off"  value="inspeccion"> Inspeccion
                  </label>
                  <label class="btn btn-primary">
                    <input type="radio" name="accion" id="verificacion" autocomplete="off"  value="verificacion"> Verificación
                  </label>
                  <label class="btn btn-primary">
                    <input type="radio" name="accion" id="suspension" autocomplete="off"  value="suspension"> Suspensión
                  </label>
                  
                  <label class="btn btn-primary" style="margin-left:20px;">
                    <input type="radio" name="accion" id="cierre" autocomplete="off" value="cierre">Cierre
                  </label>
                  <label class="btn btn-primary">
                    <input type="radio" name="accion" id="ampliacion" autocomplete="off" value="ampliacion">Ampliación Plazos
                    </label>
                  <label class="btn btn-primary">
                    <input type="radio" name="accion" id="infraccion" autocomplete="off" value="infraccion">Infracción
                  </label>
                </div>
            </div>    <!- - /col-sm-12 col-md-12- ->
          </div>   -->

          <div class="row" style="margin-top:20px;">
         
            <table id="inspeccion" class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th width="12%">Acciones</th>
                  <th>Nro</th>
                  <th>Fecha</th>
                  <th style="display:none">idEmpleador</th> 
                  <th>Empleador</th> 
                  <th style="display:none">idEstablecimiento</th>
                  <th>Establecimiento</th>
                  <th style="display:none">idInspector</th>
                  <th>Inspector</th>
                  <th width="5%">Estado</th>
                  <th style="display:none">detalleInspeccion</th>
                </tr>
              </thead>
              <tbody>
                <?php
                foreach($list as $f)
                {

                  echo '<tr>';
                  echo '<td>';
                  

                if (strpos($permission,'Edit') !== false) {
                //echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;"></i>';
                }
                if (strpos($permission,'Del') !== false) {
                //echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar"></i>';
                }

                echo '<i class="fa fa-fw fa-search text-light-blue btnView" style="cursor: pointer; margin-left: 15px;" data-idempleador="1"></i>';

                echo '</td>';
                echo '<td style="text-align: left">'.$f['inspeccionid'].'</td>';
                echo '<td style="text-align: left">'.$f['inspeccionfechaasigna'].'</td>';
                echo '<td style="text-align: left;display:none">'.$f['empleaid'].'</td>';
                echo '<td style="text-align: left">'.$f['emplearazsoc'].'</td>';
                echo '<td style="text-align: left;display:none">'.$f['estableid'].'</td>';
                echo '<td style="text-align: left">'.$f['direccionCompleta'].'</td>';
                echo '<td style="text-align: left;display:none">'.$f['inspectorid'].'</td>';
                echo '<td style="text-align: left">'.$f['inspectornombre'].'</td>';
                echo '<td style="text-align: left">'.($f['inspeestado'] == 'C' ? '<small class="label pull-left bg-green">Curso</small>' :'<small class="label pull-left bg-yellow">Asignado</small>').'</td>';


                echo '<td style="text-align: left;display:none">'.$f['inspecciondescrip'].'</td>';
                echo '</tr>';

              }

              ?>
            </tbody>
            </table>

          </div>

        </div><!-- /.box-body -->
    </div><!-- /.box -->
  </div><!-- /.col -->
</div><!-- /.row -->
</section><!-- /.content -->

<script>
  


  function guardarInspeccion(){
    var inspeccionfechaasigna=$('#fecha').val();
    var inspeccionfecharecp=$('#fecha').val();
    var inspectorid=$('#inspe').val();
    var inspecciondescrip=$("#nota").val();
    var estableid=$('#estable').val();     
    var inspeestado="C";
    // arma array de ids de denuncias
    var idsTr = $('#tblDenEstab tbody tr');
    var idsDenuncias = [];
    
    $(idsTr).each(function(){       
      celId = $(this).find('td.denunciaId').html();
      idsDenuncias.push(celId);    
    });  
    
    console.log('ids de denuncias');
    console.table(idsDenuncias);
    $('#modalAgregar').modal('hide');
    // var hayError = false;
    // if(inspeccionfechaasigna == '' || inspeccionfecharecp == '' || inspectorid == '-1' || inspecciondescrip == '' || estableid == '-1'){
    //   hayError = true;
    // }
    // if(hayError == true){
    //   $('#error').fadeIn('slow');
    //   return;
    // }
    // $('#error').fadeOut('slow');   
    // WaitingOpen();
    $.ajax({
      type: 'POST',
      data: {"inspeccionfechaasigna":inspeccionfechaasigna,  
              "inspeccionfecharecp":inspeccionfecharecp,  
              "inspectorid":inspectorid,  
              "inspecciondescrip":inspecciondescrip,  
              "estableid":estableid,  
              "inspeestado":inspeestado,
              "idsDenuncias": idsDenuncias
              },
      url: 'index.php/Inspeccion/Guardar_Inspeccion', 
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
    //console.log("Inspeccion Guardada");
  }

//var dataF;
  $( function() {
     var dataF = function () {
      var tmp = null;
      $.ajax({
        'async': false,
        'type': "POST",
        'global': false,
        'dataType': 'json',
        'url': "Inspeccion/getDenominacionSocial",
        'success': function (result) {
          console.log(result);
          tmp = result;
        }
      });
      return tmp;
    }
  });


   //$( 
    autocompEmp();
    function autocompEmp() {  
    $( "#busEmpleador" ).autocomplete({
      source: "Inspeccion/getDenominacionSocial",
      minLength: 1,
      select: function( event, ui ) {        
        $( "#busEmpleador" ).val(ui.item.value);
        $("#empleaid").val(ui.item.id);
        
        //getEstablecimientos(idEmpleador,-1,$('#estable'));
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

 
  function getEstablecimientos(idEmpleador,idEstablecimiento,selector){

    var id =  idEmpleador;
    console.log(id);
    $.ajax({
      async: true,
      global: false,
      url: "Inspeccion/getEstablecimiento",
      type: 'POST',
      dataType : "json",
      data: {"empleaid" : id },
      'success': function (result) {
        selector.html('');
        if(result!=null){
         var opcion  = "<option value='-1'>Seleccione...</option>" ; 
         selector.append(opcion); 
         for(var i=0; i < result.length ; i++) 
         {    
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
      },

    });
  }

  // $(".fa-pencil").click(function (e) { 
  //   id_=$(this).parents('tr').find('td').eq(1).html();
  //   var idInspector=$(this).parents('tr').find('td').eq(7).html();
  //   $('select#inspeE').val(idInspector);
  //   var nombreEmplador = $(this).parents('tr').find('td').eq(4).html();
  //   $(".busEmpleadorE").val(nombreEmplador);
  //   var idEmpleador=$(this).parents('tr').find('td').eq(3).html();
  //   var idEstablecimiento=$(this).parents('tr').find('td').eq(5).html();
  //   getEstablecimientos(idEmpleador,idEstablecimiento,$('#estableE'));
  //   var detalle=$(this).parents('tr').find('td').eq(10).html();
  //   $('textarea#notaE').val(detalle);
  //   $('#modalEditar').modal('show');

  // });
//

  $('#Guardar').click(function (e) { 

   var id=id_;
   var inspeccionfechaasigna=$('#fechaE').val();
   var inspeccionfecharecp=$('#fechaE').val();
   var inspectorid=$('#inspeE').val();
   var inspecciondescrip=$('#notaE').val();
   var estableid=$('#estableE').val();
   var inspeestado="C";
   var hayError = false;
   if(inspeccionfechaasigna == '' || inspeccionfecharecp == '' || inspectorid == '-1' || inspecciondescrip == '' || estableid == '-1')
   {
    hayError = true;
    }
    if(hayError == true){
      $('#errorE').fadeIn('slow');
      return;
    }
    $('#errorE').fadeOut('slow');
    WaitingOpen('Guardando cambios');
    $.ajax({
    type: 'POST',
    dataType : "json",
    data: {"inspeccionid":id,"inspeccionfechaasigna":inspeccionfechaasigna,  "inspeccionfecharecp":inspeccionfecharecp,  "inspectorid":inspectorid,  "inspecciondescrip":inspecciondescrip,  "estableid":estableid,  "inspeestado":inspeestado },
    url: 'index.php/Inspeccion/Modificar_Inspeccion', 
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



  });


  // $(".fa-times-circle").click(function (e) { 

  //   id_ = $(this).parents('tr').find('td').eq(1).html();
  //   $('#modalEliminar').modal('show');
    
  // });


  // function eliminarInspeccion(){
  //   WaitingOpen();
  //   $.ajax({
  //     type: 'POST',
  //     data: { "inspeccionid": id_},
  //     url: 'index.php/Inspeccion/Eliminar_Inspeccion', 
  //     success: function(data){
  //       WaitingClose();
  //       ActualizarPagina();                
  //     },

  //     error: function(result){
  //       WaitingClose();
  //       alert("OPERACION FALLIDA");
  //     }
  //   });}


  function reset(){

    $('#errorE').fadeOut('slow');
    $('#error').fadeOut('slow');

    }

  
  // datatable
  // $(function () {

  //   $('#inspeccion').DataTable({
  //     "paging": true,
  //     "lengthChange": true,
  //     "searching": true,
  //     "ordering": true,
  //     "info": true,
  //     "autoWidth": true,
  //     "language": {
  //       "lengthMenu": "Ver _MENU_ filas por página",
  //       "zeroRecords": "No hay registros",
  //       "info": "Mostrando pagina _PAGE_ de _PAGES_",
  //       "infoEmpty": "No hay registros disponibles",
  //       "infoFiltered": "(filtrando de un total de _MAX_ registros)",
  //       "sSearch": "Buscar:  ",
  //       "oPaginate": {
  //         "sNext": "Sig.",
  //         "sPrevious": "Ant."
  //       }
  //     }
  //   });
  // });



  //Funcion Resfresca
  function ActualizarPagina(){ 

    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Inspeccion/index/<?php echo $permission; ?>");
  }

// FUNCIONES NUEVAS HUGO
  // carga modal ver 
  $(".btnView").on("click", function(e){
    e.preventDefault();
    
    id_=$(this).parents('tr').find('td').eq(1).html();
    var idInspector=$(this).parents('tr').find('td').eq(8).html();
    $('#inspVer').val(idInspector);
    var nombreEmplador = $(this).parents('tr').find('td').eq(4).html();
    $("#empleadVer").val(nombreEmplador);
    // var idEmpleador=$(this).parents('tr').find('td').eq(3).html();
    var estableVer=$(this).parents('tr').find('td').eq(6).html();
    $("#estabVer").val(estableVer);
   
    var detalle=$(this).parents('tr').find('td').eq(10).html();
    $('textarea#detalleVer').val(detalle);
    $('#modalView').modal('show');
    console.info(idEmpleador);
    //WaitingOpen('Cargando Empleador');
    //$('#btnSave').hide();

    $.ajax({
      data: { id_empleador : idEmpleador },
      dataType: 'json',
      type: 'POST',
      //url: 'index.php/Empleador/getEmpleadorPorId',
      success: function(data){
            //console.table(data);
            
            
            
            
            
            
            WaitingClose();
      },
      error: function(result){
        //console.error("Error cargando Empleador");
        //WaitingClose();
      },
    });
  });

  // carga denuncias por establecimiento en modal agregar
  $('#estable').change(function(){
    
    var idEstab = $('#estable option:selected').val();
    var tbl = $('#tblDenEstab');
    
    $.ajax({
      data: { idEstab : idEstab },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Inspeccion/getDenPorEstabId',
      success: function(data){             
              $('#tblDenEstab tbody tr').remove();
              var trow = ""; 
              for (var i=0; i< data.length; i++) {                  

                var tr = "<tr id='"+data['denunciaid']+"'>";
                var tdDenunciaId = "<td class='denunciaId hidden' style='text-align: left'> "+data[i]['denunciaid'] +" </td>" ;
                  var tdnroacta = "<td class='' style='text-align: left'> "+data[i]['denuncianroacta'] +" </td>" ;
                  var tdfecha = "<td class='' style='text-align: left'> "+data[i]['denunciasfecha'] +" </td>" ; 
                  var tdmotivos = "<td class='' id='fecha' style='text-align: left'> "+data[i]['denunciamotivos']+"</td>";
                var trCierre = "</tr>";
              
                trow = tr + tdDenunciaId + tdnroacta + tdfecha + tdmotivos;
                // Agrego a tabla
                $(tbl).append(trow);                                  
              }             
             
      },
      error: function(result){
        console.error("Error cargando denuncias por estabelcimiento");
      },
    });

  });

  // busca inspecciones segun distintos criterios 
  $('input:radio[name=accion]').change(function() {
      
    if (this.value == 'inspeccion') {
        //alert("inspeccion");
        getInspecciones('inspeccion');
    }
    if (this.value == 'verificacion') {
        //alert("verificacion");
        getInspecciones('verificacion');      
    }
    if (this.value == 'suspension') {
        //alert("suspension"); 
        getInspecciones('suspension');                   
    }
    if (this.value == 'cierre') {
        //alert("cierre"); 
        getInspecciones('cierre');                   
    }
    if (this.value == 'ampliacion') {
        //alert("ampliacion"); 
        getInspecciones('ampliacion');                   
    }
    if (this.value == 'infraccion') {
        //alert("infraccion"); 
        getInspecciones('infraccion');                   
    }
  });  
  function getInspecciones(criterio){
    
    $.ajax({
      type: 'POST',
      data: {criterio},
      dataType: 'json',
      url: 'index.php/Inspeccion/getInspeccionesCriterio',
      success: function(result){
        
      },
      error: function(result){
        //alert(result);
        console.error("error al cargar inspecciones por criterios: " + result);
        WaitingClose();
      },
    });
  }


</script>


<!-- Modal Ver -->
<div class="modal fade" id="modalView" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Detalles de Inspección</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
       <div class="row">
        <div class="col-xs-12">
          <div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">
           <h4><i class="icon fa fa-ban"></i> Error!</h4>
           Revise que todos los campos esten completos
         </div>
       </div>
     </div>
     <div class="row"> 

      <div class="col-xs-3">
        <label style="margin-top: 7px;">Empleador: </label>
      </div><br>
      <br>
      <div class="col-xs-9">
        <input type="text" class="form-control empleadVer" placeholder="Buscar Empleador..." id="empleadVer" name="empleadVer" style="width: 80%;" disabled>
      
      </div> 
      <br>
      <br>

      <div class="col-xs-3">
        <label style="margin-top: 7px;">Establecimiento: </label>
      </div><br>
      <br>
      <div class="col-xs-9">
        <input name="estabVer" class="form-control" id="estabVer" style="width: 80%;" disabled>
      </div><br><br>

      <div class="col-xs-3">
        <label style="margin-top: 7px;">Inspector: </label>
      </div><br><br>
      <div class="col-xs-9">
        <input name="inspVer" class="form-control" id="inspVer" style="width: 80%;" disabled>
      </div><br><br>

      <div class="col-xs-3">
        <label style="margin-top: 9px;">Fecha: </label>
      </div><br>
      <br>
      <div class="col-xs-6">
        <input type="text" class="form-control" id="fechaE" name="fechaE" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>"  disabled/>
      </div><br><br>

      <div class="col-xs-3">
        <label style="margin-top: 9px;">Observacion:</label>
      </div><br><br>
      <div class="col-xs-9">
        <textarea placeholder="Agregar detalle" class="form-control" rows="3" id="detalleVer" value="" disabled></textarea>
      </div><br><br>

    </div>
    <div class="modal-footer">

      
      <button type="button" class="btn btn-default" data-dismiss="modal" onclick="reset()">Cerrar</button>
    </div>
  </div>
</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal Agregar -->
<div class="modal fade" id="modalAgregar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Agregar Inspección</h4>
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

        <div class="col-xs-3">
          <label style="margin-top: 7px;">Empleador: </label>
        </div><br>
        <br>
        <div class="col-xs-9">
          <input type="text" class="form-control busEmpleador" placeholder="Buscar Empleador..." id="busEmpleador" name="busEmpleador" style="width: 80%;">
          <input type="text" class="hidden empleaid" id="empleaid" name="empleaid">
        </div> 
        <br>
        <br>

        <div class="col-xs-3">
          <label style="margin-top: 7px;">Establecimiento<strong style="color: #dd4b39">*</strong>: </label>
        </div><br>
        <br>
        <div class="col-xs-9">
          <select name="estable" class="form-control estable" id="estable" style="width: 80%;">
            <option value="-1" placeholder="Seleccione..."></option>
          </select>
        </div><br><br>
            
        <div class="col-xs-9">  
          <table id="tblDenEstab" class="table table-bordered table-hover">
              <thead>
                <tr>                
                  <th>Nro Acta</th>
                  <th>Fecha</th>               
                  <th>Motivo de la Denuncia</th>                 
                </tr>
              </thead>
              <tbody>
                
              </tbody>
          </table>
        </div>
        <div class= "clearfix"></div>  

        <div class="col-xs-3">
          <label style="margin-top: 7px;">Inspector<strong style="color: #dd4b39">*</strong>: </label>
        </div><br><br>
        <div class="col-xs-9">
          <select name="inspe" class="form-control inspe" id="inspe" style="width: 80%;">
            <option value="-1" placeholder="Seleccione...">Seleccione...</option>
            <?php 
            foreach ($inspectores as $i) {
              echo '<option value="'.$i['inspectorid'].'" >'.$i['inspectornombre'].'</option>';
            }

            ?>
          </select>
        </div><br><br>

        <div class="col-xs-3">
          <label style="margin-top: 9px;">Fecha<strong style="color: #dd4b39">*</strong>: </label>
        </div><br>
        <br>
        <div class="col-xs-6">
          <input type="text" class="form-control" id="fecha" name="fecha" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>"  disabled/>
        </div><br><br>

        <div class="col-xs-6">
          <label style="margin-top: 9px;">Detalle de la inspección:</label>
        </div><br><br>
        <div class="col-xs-9">
          <textarea placeholder="Agregar detalle" class="form-control" rows="3" id="nota" value=""></textarea>
        </div><br><br>
      </div>
      <br>
    </div> <!--/ .modal-body -->
    <div class="modal-footer">
      <button type="button" class="btn btn-default" onclick="reset()" data-dismiss="modal">Cancelar</button>
      <button type="button" class="btn btn-primary"  onclick="guardarInspeccion()">Guardar</button>
    </div>
  </div> <!-- / .modal-conten -->
</div>
</div>

<!-- Modal Editar -->
<div class="modal" id="modalEditar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Editar Inspeccion</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
       <div class="row">
        <div class="col-xs-12">
          <div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">
           <h4><i class="icon fa fa-ban"></i> Error!</h4>
           Revise que todos los campos esten completos
         </div>
       </div>
     </div>
     <div class="row"> 

      <div class="col-xs-3">
        <label style="margin-top: 7px;">Empleador<strong style="color: #dd4b39">*</strong>: </label>
      </div><br>
      <br>
      <div class="col-xs-9">
        <input type="text" class="form-control busEmpleadorE" placeholder="Buscar Empleador..." id="busEmpleadorE" name="busEmpleadorE" style="width: 80%;">
        <input type="text" class="hidden empleaidE" id="empleaidE" name="empleaidE">
      </div> 
      <br>
      <br>

      <div class="col-xs-3">
        <label style="margin-top: 7px;">Establecimiento<strong style="color: #dd4b39">*</strong>: </label>
      </div><br>
      <br>
      <div class="col-xs-9">
        <select name="estableE" class="form-control" id="estableE" style="width: 80%;"></select>
      </div><br><br>

      <div class="col-xs-3">
        <label style="margin-top: 7px;">Inspector<strong style="color: #dd4b39">*</strong>: </label>
      </div><br><br>
      <div class="col-xs-9">
        <select name="inspeE" class="form-control" id="inspeE" style="width: 80%;">
          <option value="-1" placeholder="Seleccione...">Seleccionar...</option>
          <?php 
          foreach ($inspectores as $i) {
            echo '<option value="'.$i['inspectorid'].'">'.$i['inspectornombre'].'</option>';
          }

          ?>
        </select>
      </div><br><br>

      <div class="col-xs-3">
        <label style="margin-top: 9px;">Fecha<strong style="color: #dd4b39">*</strong>: </label>
      </div><br>
      <br>
      <div class="col-xs-6">
        <input type="text" class="form-control" id="fechaE" name="fechaE" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>"  disabled/>
      </div><br><br>

      <div class="col-xs-3">
        <label style="margin-top: 9px;">Observacion:</label>
      </div><br><br>
      <div class="col-xs-9">
        <textarea placeholder="Agregar detalle" class="form-control" rows="3" id="notaE" value=""></textarea>
      </div><br><br>

    </div>
    <div class="modal-footer">

      <button type="button" class="btn btn-primary" id="Guardar" >Guardar</button>
      <button type="button" class="btn btn-default" data-dismiss="modal" onclick="reset()">Cerrar</button>
    </div>
  </div>
</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal Eliminar -->
<div class="modal" id="modalEliminar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Eliminar Inspeccion</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
       <h5>¿Desea eliminar el registro?</h5> 
     </div>
     <div class="modal-footer">

      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarInspeccion()" >Eliminar</button>
      <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>

    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->