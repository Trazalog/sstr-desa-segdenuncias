<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          
          <h3 class="box-title">Inspecciones</h3>
          <br><br>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-success" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd" title="Nueva">Agregar</button>';
          }
          ?>

        </div><!-- /.box-header -->
        <div class="box-body">
         
           <div class="row">
            <div class="col-sm-12 col-md-12">
                <h4>Criterios de Búsqueda</h4>
                
                <input type="text" class="hidden" name="" id="criterio" autocomplete="off"  value="">

                <input type="text" class="hidden" name="accion" id="tipoAccion" autocomplete="off"  value="tipoAccion">

                <div class="btn-group" data-toggle="buttons">
                  
                <label class="btn btn-primary">
                    <input type="radio" name="accion" id="todas" autocomplete="off"  value="todas"> Todas
                  </label>

                  <label class="btn btn-primary" style="margin-left:20px;">
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
                    <input type="radio" name="accion" id="ampliacion" autocomplete="off" value="ampliacion-plazo">Ampliación Plazos
                    </label>
                  <label class="btn btn-primary">
                    <input type="radio" name="accion" id="infraccion" autocomplete="off" value="infraccion">Infracción
                  </label>

                  <label class="btn btn-primary" style="margin-left:20px;">
                      <input type="radio" name="accion" id="inspectorAsignado" autocomplete="off" value="inspectorAsignado">Inspector
                  </label>
                  <div class="clearfix"></div>
                  <div class="col-sm-3 col-md-3">
                    <select name="inspAsig" class="form-control inspAsig" id="inspAsig" style="display:none;">
                        <option value="-1">Seleccione inspector...</option>
                    </select>  
                  </div>  
                </div>
            </div>    <!-- /col-sm-12 col-md-12-->
          </div>   

          <div class="row" style="margin-top:20px;">
            <div class="fa fa-fw fa-print" style="color: #A4A4A4; cursor: pointer; margin-left: 15px; border-radius: 18px; " title="Imprimir"  ></div>
                  
          </div>  
          <div class="row" style="margin-top:20px;">
            <div class="col-xs-12" id="tablaImp">
              <table id="tbl_inspeccion" class="table table-hover">
                <thead>
                  <tr>
                    <th width="" class="acciones">Acciones</th>
                    <th>Nro</th>
                    <th>Fecha</th>                    
                    <th>Empleador</th>                  
                    <th>Establecimiento</th>           
                    <th>Inspector</th>   
                  </tr>
                </thead>
                <tbody>
                <?php
                //var_dump($list[0]['bpm_id']);
                  foreach($list as $f){

                    echo '<tr>';
                      echo '<td class="acciones">';
                        echo '<i class="fa fa-fw fa-search text-light-blue btnView no_imprimir no-print" style="cursor: pointer; margin-left: 15px;" data-bpmId="'.$f['bpm_id'].'"></i>';
                      echo '</td>';
                      echo '<td style="text-align: left">'.$f['inspeccionid'].'</td>';
                      echo '<td style="text-align: left">'.$f['inspeccionfechaasigna'].'</td>';                  
                      echo '<td style="text-align: left">'.$f['emplearazsoc'].'</td>';                
                      echo '<td style="text-align: left">'.$f['direccionCompleta'].'</td>';                
                      echo '<td style="text-align: left">'.$f['inspectornombre'].'</td>';              
                    echo '</tr>';
                  }
                ?>

                </tbody>
              </table>
            </div>
          </div>

        </div><!-- /.box-body -->
    </div><!-- /.box -->
  </div><!-- /.col -->
</div><!-- /.row -->
</section><!-- /.content -->


<style>
  @media print
{    
    /* .no_imprimir, .no_imprimir *
    {
        display: none !important;
    } */
}
</style>

<script>

// var table = $('#tbl_inspeccion').DataTable();
 
//  new $.fn.dataTable.Buttons( table, {
//      buttons: [
//          'print'
//      ]
//  } );
  
//  table.buttons().container()
//      .appendTo( $('.acciones', table.table().container() ) );
  
  // $('#tbl_inspeccion').DataTable( {
  //       dom: 'Bfrtip',
  //       buttons: [
  //           'print'
  //       ]
  //   } );

  
  function getEstablecimientos(){
    var selector = $('#estable');
    var idEmpleador = $("#empleaid").val();
    
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
                alert('error');
      },
    });
  }
  // trae todos los inspectores
  getInspector();
  function getInspector(){
    
    var selector = $('#inspAsig');
    $.ajax({
      async: true,
      global: false,
      url: "Inspeccion/getInspector",
      type: 'POST',
      dataType : "json",
      //data: {"empleaid" : idEmpleador },
      'success': function (result) {
                
                selector.html('');
                if(result!=null){
                  var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                  selector.append(opcion); 
                  for(var i=0; i < result.length ; i++){    
                    var nombre = result[i]['inspectornombre'];
                    var opcion  = "<option value='"+result[i]['inspectorid']+"'>" +nombre+ "</option>" ; 
                    selector.append(opcion); 
                  }
                }
                else{
                  selector.append("<option value='-1'>No hay Inspectores</option>");
                }
      },
      'error' : function (result){
                console.log('Funcion: getInspector ERROR');
                //alert('error');
      }
    });
  } 
  function reset(){

    $('#errorE').fadeOut('slow');
    $('#error').fadeOut('slow');

  }

  //Funcion Resfresca
  function ActualizarPagina(){ 

    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Inspeccion/index/<?php echo $permission; ?>");
  }

// FUNCIONES NUEVAS HUGO
 
  $('.btnView').on("click", function(){
    var idTarBonita = $(this).data("bpmid");
    //alert(idTarBonita);
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Inspeccion/getGetDetaInspeccion/<?php echo $permission; ?>/" + idTarBonita+ "/");
    WaitingClose();
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
                  var tdnroacta = "<td class='' style='text-align: left'> "+data[i]['denunciaid'] +" </td>" ;
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

  // al cargar la pantalla graba el criterio de filtrado
  $('#criterio').val('todas');
  
  // busca inspecciones segun distintos criterios 
  $('input:radio[name=accion]').change(function() {
    
    var idInsp = 0;
    
    if (this.value == 'todas') {   
      $('#inspAsig').hide(300); 
      $('#criterio').val('Todas');    
      getInspecciones('todas', idInsp);
    }
    if (this.value == 'inspeccion') {   
      $('#inspAsig').hide(300);
      $('#criterio').val('Inspeccion');     
      getInspecciones('inspeccion', idInsp);
    }
    if (this.value == 'verificacion') {
      $('#inspAsig').hide(300);
      $('#criterio').val('Verificacion');
      getInspecciones('verificacion', idInsp);      
    }
    if (this.value == 'suspension') {
      $('#inspAsig').hide(300);
      $('#criterio').val('Suspension');
      getInspecciones('suspension', idInsp);                   
    }
    if (this.value == 'cierre') {
      $('#inspAsig').hide(300);
      $('#criterio').val('Cierre');
      getInspecciones('cierre', idInsp);                   
    }
    if (this.value == 'ampliacion-plazo') {
      $('#inspAsig').hide(300);
      $('#criterio').val('Ampliación Plazo');
      getInspecciones('ampliacion-plazo', idInsp);                   
    }
    if (this.value == 'infraccion') {
      $('#inspAsig').hide(300);
      $('#criterio').val('Infraccion');
      getInspecciones('infraccion', idInsp);                   
    }
    if (this.value == 'inspectorAsignado') { 
      $('#inspAsig').show(300);
      $('#criterio').val('Inspector'); 
      // guarda el tipo de busqueda    
      $('#tipoAccion').val('inspectorAsignado');                          
    }
  });  

  $('#inspAsig').change(function(){

    var criterio = $('#tipoAccion').val();
    var idInsp = $('#inspAsig option:selected').val();
    getInspecciones(criterio, idInsp);
  });

  function getInspecciones(criterio, idinspectorAsig){
    
    $.ajax({
      type: 'POST',
      data: {criterio: criterio,
            idinspectorAsig:idinspectorAsig},
      dataType: 'json',
      url: 'index.php/Inspeccion/getInspeccionesCriterio',
      success: function(data){
        //console.table(data);
        tabla = $('#tbl_inspeccion').DataTable();
        tabla.clear().draw();

        for(i = 0; i < data.length; i++) {
          
          var inspeccionid = data[i]['inspeccionid'];
          var inspeccionfechaasigna = data[i]['inspeccionfechaasigna'];
          var emplearazsoc = data[i]['emplearazsoc'];
          var direccion = data[i]['direccion'];
          var inspectornombre = data[i]['inspectornombre'];
          //agrego valores a la tabla
          $('#tbl_inspeccion').DataTable().row.add( [
            '<i class="fa fa-fw fa-search text-light-blue btnView" style="cursor: pointer; margin-left: 15px;" data-idempleador="1"></i>',
            inspeccionid,
            inspeccionfechaasigna,
            emplearazsoc,
            direccion,
            inspectornombre              
          ] );
          $('#tbl_inspeccion').DataTable().draw();        
        }
      },
      error: function(result){
        //alert(result);
        console.error("error al cargar inspecciones por criterios: " + result);
        WaitingClose();
      }
    });
  }

  // guarda inspeccion nueva
  function guardarInspeccion(){
    
    var inspeccionfechaasigna=$('#fecha').val();
    var inspeccionfecharecp=$('#fecha').val();    
    var inspectorid=$('#inspe').val();    // id inspector
    var inspecciondescrip=$("#nota").val(); // detalle inspeccion
    var estableid=$('#estable').val();   // id establecimiento      
    var inspeestado="C";
    // arma array de ids de denuncias
    var idsTr = $('#tblDenEstab tbody tr');
    var idsDenuncias = [];    
    $(idsTr).each(function(){       
      celId = $(this).find('td.denunciaId').html();
      idsDenuncias.push(celId);    
    });  
    
    var hayError = false;
    
    if(inspectorid == '-1' || inspecciondescrip == '' || estableid == '-1'){
      hayError = true;
    }

    if(hayError == true){
        $('#error').fadeIn('slow');        
        return;
    }else{
      $('#modalAgregar').modal('hide');
      //$('#error').fadeOut('slow');   
        WaitingOpen();
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
                  ActualizarPagina();
          },
          error: function(result){
                  WaitingClose();
                  alert("Error! No se pudo guarda la nueva inspeccion...");
          }
        });
        console.log("Inspeccion Guardada");
    }    
  }

  // autocompletar empleadores   
  autocompEmp();
  function autocompEmp() {  
    $( "#busEmpleador" ).autocomplete({
      source: "Inspeccion/getDenominacionSocial",
      minLength: 1,
      select: function( event, ui ) {        
        $("#busEmpleador").val(ui.item.label);
        $("#empleaid").val(ui.item.id);
        //alert('calgo');
        getEstablecimientos();
      }
    });
  }

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

  // imprime listado de inspecciones
  $(".fa-print").click(function (e) {
    var critFilt = $('#criterio').val();
    var fecha = getFecha();
    var html = "<h4 id='listTitulo'>Listado de Inspecciones al " + fecha + "</h4>";
    var filt = "<h4 id='critdefiltrado'>Filtrado por: " + critFilt + "</h4>";
    $(html + filt).prependTo("#tablaImp");    
    
    $('.acciones, .dataTables_filter, .dataTables_length, .dataTables_info, .dataTables_paginate paging_full_numbers').addClass('no-print');  
    $('a[href]').addClass('no-print'); 
    $("#tablaImp").printArea();
    
    $("#listTitulo").remove();
    $("#critdefiltrado").remove();    
  });

  function getFecha(){
    var d = new Date();
    var month = d.getMonth()+1;
    var day = d.getDate();
    var output = ((''+day).length<2 ? '0' : '') + day + '/'+
                  ((''+month).length<2 ? '0' : '') + month + '/' +
                  d.getFullYear();
    return output;
  }

  /* cargo plugin DataTable (debe ir al final de los script) */
  $("#tbl_inspeccion").DataTable({
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
    "bScrollCollapse": true//,
    //"dom": 'B<"clear">lfrtip'//,
    //"buttons": [
    //    'print'
    //]
  });


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
            <div class="alert alert-danger alert-dismissable" id="errorAgregar" style="display: none">
             <h4><i class="icon fa fa-ban"></i> Error!</h4>
             Revise que todos los campos esten completos
           </div>
         </div>
       </div>
        
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
                  <th>Nº Denuncia</th>
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