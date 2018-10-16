<input type="hidden" id="permission" style="width: 100%" value="<?php echo $permission;?>">
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
      <h4><i class="icon fa fa-ban"></i> Error!</h4>
      Revise que todos los campos obligatorios esten completos
    </div>
  </div>
</div>

<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h2 class="box-title ">Programación de Tareas</h2>         
        </div><!-- /.box-header -->
        <div class="box-body">    
          <?php
        // if (strpos($permission,'Add') !== false) {
          //echo '<button class="btn btn-block btn-success" style="width: 100px;" id="listado">Ver Listado</button>';
        // }

          //// USUARIO LOGUEADO Y GRUPO DE USUARIO
          $userdata = $this->session->userdata('user_data');
          $usrId = $userdata[0]['usrId'];     
          $grpId = $userdata[0]['grpId']; 
          //var_dump($userdata);

          echo' <input type="hidden"  id="usrId" name="usrId" value="'.$usrId.'">';
          echo' <input type="hidden"  id="grpId" name="grpId" value="'.$grpId.'">' ;
          echo' <input type="hidden"  id="idTarBonita" name="idTarBonita" value="'.$idTarBonita.'">' ;

          ?>
          <br><br>
          <div class="row" >
            <div class="col-sm-12 col-md-12">
             <div role="tabpanel" class="tab-pane"> 
              <div class="form-group"> 
                <div class="panel panel-default"> 
                  <div class="panel-body">
                    <div class="">       
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class=""><a  id="tabCalend" href="#Calendario" aria-controls="Calendario" role="tab" data-toggle="tab">Calendario</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Tareas</a></li>    
                      </ul>
                      <!-- Tab panes -->                            
                      <div class="tab-content">

                        <!-- tabpanel  Calendario -->  
                        <div role="tabpanel" class="tab-pane active" id="Calendario">
                          <br>
                          <div class="col-xs-6">Sectores 
                            <select id="sectSelect" name="sectSelect" class="form-control " placeholder="" value="" ></select>
                          </div>
                          <div class="col-xs-6">Equipos 
                            <select id="equiPSelect" name="equiPSelect" class="form-control " placeholder="" value="0" ></select>
                          </div>

                          <div class="col-xs-6" >
                            <!-- Calendario -->
                            <div id="calendar"></div>
                          </div>  
                          <div class="col-xs-6">
<!----------listado en calendario----------->
                            <table id="calendarList" class="table table-bordered table-hover tbCalendario">
                              <thead>
                                <tr>
                                  <th width="2%"></th> <!-- icono -->
                                  <th width="25%"></th><!-- tarea -->
                                  <th width="10%"></th><!--  -->
                                  <th width="10%"></th><!--  -->
                                  <th width="5%"></th><!--  -->
                                  <th width="2%"></th>   <!--  -->                         
                                </tr>
                              </thead>
                              <tbody>  
                               
                    		  </tbody>
                  </table>

<!------------------------ / listado en calendario------------------------------>
                </div>
              </div>
              <!-- / tabpanel  Calendario -->  

              <!--  tabpanel  TAREAS -->
              <div role="tabpanel" class="tab-pane" id="profile">
<!----------------------- TAREAS-------------------------------------------->
              <style>
               #id {margin-top: 20px;}
             </style>
             <div class="col-sm-12 col-md-12">
              <br>
              <div class="col-xs-8">Tarea
                <select id="tarea" name="tarea" class="form-control " placeholder="" value="" ></select>
              </div>                 
              <div class="col-xs-2">
                <button type="button" class="btn btn-success" id="agregar" style="margin-top: 20px;"><i class="  fa fa-plus"></i>Agregar</button>
              </div>             
              <div class="col-xs-8">Plantilla 
                <select id="plantilla" name="plantilla" class="form-control " placeholder="" value="" ></select>
              </div>
              <div class="col-xs-4">
                <input type="hidden"  id="numord" name="numord" value="<?php echo $id_orden;?>"> 
              </div>  
              <br><div class="clearfix"></div>

              <br>
              <br>
              <table id="orden" class="table table-bordered table-hover" width="80%" >
                <!--<br>
                  <div class="col-xs-4" align="center"><label>Listado de tareas</label></div>-->
                  <thead>
                    <tr>
                      <th width="2%">Programar</th> 
                      <th width="25%">Tareas</th>
                      <th width="10%">Asignado</th>
                      <th width="5%">Fecha</th>
                      <th width="5%">Duración</th>             
                      <th width="3%">Accion</th>
                    </tr>
                  </thead>
                  <tbody>  
                 
               </tbody>
             </table>
           </div>
           <table id="tablaTareas" class="table table-bordered table-hover" width="80%" >
                <!--<br>
                  <div class="col-xs-4" align="center"><label>Listado de tareas</label></div>-->
                  <thead>
                    <tr>
                      <!-- <th width="2%">Terminar</th> -->
                      <th width="2%"></th> <!-- icono -->
                      <th width="25%"></th><!-- tarea -->
                      <th width="10%"></th><!--  -->
                      <th width="10%"></th><!--  -->
                      <th width="5%"></th><!--  -->
                      <th width="2%"></th>   <!--  --> 
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
            </table>       


<!------------------------ / TAREAS------------------------------------------->  
         </div>
         <!--  / tabpanel  TAREAS --> 



       </div><!-- / tab-content -->
       <!-- / Tab panes --> 

     </div><!-- / ."" --> 
   </div><!-- / panel-body -->  

 </div><!-- / panel panel-default --> 
</div><!-- / form-group --> 
</div><!-- / tab-pane --> 
</div><!-- /.col-sm-12 col-md-12 --> 




</div><!-- /.row -->

<div class="modal-footer">              
  <button type="button" id="guardar" class="botones btn btn-primary" onclick="validarInicio()">Terminar Planificacion</button>
  <!-- <button type="button" id="guardar" class="botones btn btn-primary" onclick="guardarInfo()">Terminar Planificacion</button> -->
</div>  <!-- /.modal footer -->            

</div><!-- /.box-body -->
</div><!-- /.box -->
</div><!-- /.col -->
</div><!-- /.row -->
</section><!-- /.content -->






<script>


// Recarga la tabla de Calendario
// function llenaTabla(){

//     var tbl = $('#calendarList');
//     var numord= $('#numord').val(); 
//     //alert(numord);
//     $.ajax({
//       type: 'POST',
//       data: { numord: numord},
//       url: 'index.php/Otrabajo/llenarPlanificacion', 
//       success: function(data){ 
//               $('#calendarList tbody tr').remove();
//               //console.table(data['list'][1]['id_listarea']);                  
//               for (var i=0; i< data['list'].length; i++) {                  

//                 var tr = "<tr id='"+data['list'][i]['id_listarea']+"'>"+
//                   "<td  style='text-align: center' ><i class='fa fa-calendar cous' style='color: #006400 ; cursor: pointer;' title='Programar tarea'  data-idTarea='"+data['list'][i]['id_tarea']+"' ></i></td>"+
    
//                   "<td  class='hidden idTareaTrazajobs' style='text-align: left'>"+data['list'][i]['id_listarea']+"</td>" +
    
//                   "<td style='text-align: left'> "+data['list'][i]['tareadescrip']+" </td>"+ 


//  // if(data['list'][i]['usrName'] == undefined  ){
//  //    tr2 = "<td class='usrasign' style='text-align: left'> "+data['list'][i]['usrName']+" "+data['list'][i]['usrLastName'] +" </td>";
//  //   }else{
//  //     tr2 = "<td class='usrasign' style='text-align: left'></td>"
//  //   }


//                "<td class='usrasign' style='text-align: left'> "+data['list'][i]['usrName']+" "+data['list'][i]['usrLastName'] +" </td>"+

    
//                   "<td class='fecha' id='fecha' style='text-align: left'> "+data['list'][i]['fecha']+"</td>"+

//                   "<td class='fecha' id='fecha' style='text-align: left'> "+data['list'][i]['duracion_std']+"</td>"+

//                   "<td><i class='fa fa-times-circle' style='color: #A9A9A9;  cursor: pointer' title='Eliminar'></i></td>"+                   
    
//                 "</tr>";
//                  // <i class=' fa fa-user' style='color: #A9A9A9; margin-left:7px'; cursor: 'pointer' title='asignar'></i> 
                
//                 $(tbl).append(tr);
//               }                                                   
//             },              
//       error: function(result){
//               console.log(result);
//             },
//       dataType: 'json'      
//     });
// }

// function llenaTabla(){

//     var tbl = $('#calendarList');
//     var numord= $('#numord').val(); 
//     var trow = "";
//     //alert(numord);
//     $.ajax({
//       type: 'POST',
//       data: { numord: numord},
//       url: 'index.php/Otrabajo/llenarPlanificacion', 
//       success: function(data){ 
//               $('#calendarList tbody tr').remove();
//               //console.table(data['list'][1]['id_listarea']);                  
//               for (var i=0; i< data['list'].length; i++) {                  

//                 var tr = "<tr id='"+data['list'][i]['id_listarea']+"'>";
//                 var tdIcono =  "<td  style='text-align: center' ><i class='fa fa-calendar cous' style='color: #006400 ; cursor: pointer;' title='Programar tarea'  data-idTarea='"+data ['list'][i]['id_tarea']+"' ></i></td>" +   
//                                 "<td  class='hidden idTareaTrazajobs' style='text-align: left'>"+data['list'][i]['id_listarea']+"</td>" +    
//                                 "<td style='text-align: left'> "+data['list'][i]['tareadescrip']+" </td>"; 

//                 var tdUsr = "<td class='usrasign' style='text-align: left'> "+data['list'][i]['usrName']+" "+data['list'][i]['usrLastName'] +" </td>" ; 

//                 var tdUsrNull = "<td class='usrasign' style='text-align: left'>No Asignado</td>"; 

//                 var tdFecha = "<td class='fecha' id='fecha' style='text-align: left'> "+data['list'][i]                       ['fecha']+"</td>"+
//                               "<td class='fecha' id='fecha' style='text-align: left'> "+data['list'][i]['duracion_std']+"</td>"+
//                               "<td><i class='fa fa-times-circle' style='color: #A9A9A9;  cursor: pointer' title='Eliminar'></i></td>";                  
    
//                 var trCierre = "</tr>";
//                 // si no esta asignado muestra vacio el campo
//                 if(data['list'][i]['usrName'] == undefined  ){ 
//                   trow = tr + tdIcono + tdUsrNull + tdFecha + trCierre;
//                 }else{ 
//                   trow = tr + tdIcono + tdUsr + tdFecha + trCierre;
//                 } 
                
//                 $(tbl).append(trow);
//               }                                                   
//             },              
//       error: function(result){
//               console.log(result);
//             },
//       dataType: 'json'      
//     });
// }
llenaTabla();
function llenaTabla(){

    var tbl = $('#calendarList');
    var tblorden = $('#orden'); 
    var numord= $('#numord').val(); 
    var trow = "";
    $.ajax({
      type: 'POST',
      data: { numord: numord},
      url: 'index.php/Otrabajo/llenarPlanificacion', 
      success: function(data){ 
              $('#calendarList tbody tr').remove();
              $('#orden tbody tr').remove();           
              for (var i=0; i< data['list'].length; i++) {                  

                var tr = "<tr id='"+data['list'][i]['id_listarea']+"'>";
                var tdIcono =  "<td class='icoCalendario' style='text-align: center' ><i class='fa fa-calendar cous' style='color:#006400 ; cursor: pointer;' title='Programar tarea'  data-idTarea='"+data['list'][i]['id_tarea']+"' ></i></td>" +   
                                "<td  class='hidden idTareaTrazajobs' style='text-align: left'>"+data['list'][i]['id_listarea']+"</td>" +    
                                "<td style='text-align: left'> "+data['list'][i]['tareadescrip']+" </td>"; 

                var tdUsr = "<td class='usrasign' style='text-align: left'> "+data['list'][i]['usrName']+" "                +data['list'][i]['usrLastName'] +" </td>" ; 

                var tdUsrNull = "<td class='usrasign' style='text-align: left'>No Asignado</td>"; 

                var tdFecha = "<td class='fecha' id='fecha' style='text-align: left'> "+data['list'][i]                       ['fecha']+"</td>";
               
                var tdFechNull = "<td class='fecha' id='fecha' style='text-align: left'>No Programado</td>";

                var tdFinal =  "<td class='fecha' id='fecha' style='text-align: left'> "+data['list'][i]                       ['duracion_std']+"</td>"+
                              "<td><i class='fa fa-times-circle' style='color: #A9A9A9;  cursor: pointer' title='Eliminar'></i></td>";                  
    
                var trCierre = "</tr>";
                // si no esta asignado muestra vacio el campo
                if(data['list'][i]['usrName'] == undefined  ){
                  // sino tiene fecha 
                  if (data['list'][i]['fecha'] == null) {
                    trow = tr + tdIcono + tdUsrNull + tdFechNull + tdFinal + trCierre;
                  }else{
                    trow = tr + tdIcono + tdUsrNull + tdFecha + tdFinal + trCierre;
                  }                   
                }else{ 
                  if (data['list'][i]['fecha'] == null) {
                    trow = tr + tdIcono + tdUsrNull + tdFechNull + tdFinal + trCierre;
                  }else{
                    trow = tr + tdIcono + tdUsrNull + tdFecha + tdFinal + trCierre;
                  }                   
                } 
                // Agrego a tabla
                $(tbl).append(trow);
                //$('#orden td.icoCalendario').remove();
                $(tblorden).append(trow);
              }                                                   
            },              
      error: function(result){
              console.log(result);
            },
      dataType: 'json'      
    });
}

// A hacer click en tab calend recarga la lista
$('#tabCalend').click(function(e){  
  //recargar();
  recargaCalendario();
  llenaTabla();
});

// Toma id de subsector y me en curso para recargar
function recargaCalendario(){
  
  var idsubsector = $('#sectSelect option:selected').val();    
  var idequipo = $('#equiPSelect option:selected').val();
  getMesResources(month_,idsubsector,idequipo);
}

// trae eventos caendarizados por subsector
function getMesResources(mont_,idSubsector,idequipo) {
  console.log('Recargando Eventos...');
  console.log('Mes: '+mont_+' idSubsector:'+idSubsector);
  $.ajax({
      type: 'POST',
      dataType: 'json',
      url: 'index.php/Otrabajo/getcalendTareasSector',
      data: {
          'month': month_,
          'idSubsector': idSubsector,
          'idequipo' : idequipo
      },
      success:function(data) {
        //console.log(data);
        //ELIMINA EVENTOS ACTUALES DEL CALENDARIO
        $("#calendar").fullCalendar('removeEvents');
        //AGREGA NUEVO EVENTOS QUE TRAE EL AJAX AL CALENDARIO
        $("#calendar").fullCalendar("addEventSource",data);
        console.log('Recargando Eventos...OK');

      },
      error:function(){
        console.log('error');
      }
  });
}




// Valida que no hayan tareas sin asignar ni sin programar 
function validarInicio(){  
  
   var contCeldas = 0;
   var programadas = 0;
   var asignadas = 0;
   var celFecha = "";
   var tbl_Calendario = $('.tbCalendario tbody tr');
  
   $(tbl_Calendario).each(function(){    
      
       // cuenta programadas
       celFecha = $(this).find('td.fecha').html();
       console.log('Validacion - fecha asignacion: ');
       console.log(celFecha);
       if(celFecha !== undefined){
         programadas ++;
       }

       // cuent asignadas
    //     celAsign = $(this).find('td.usrasign').html();
    //     console.log('Validacion - asignado: ');
    //     console.log(celAsign);
    //     if(celAsign !== undefined){
    //       asignadas ++;
    //     }

    //     // suma cantidad filas
       contCeldas++;
       //console.log(celFecha);
   });

   if (contCeldas > programadas) {
     alert('Existen tareas sin programar...');
   }else{
      cerrarPlanificacion();
     //alert(contCeldas +' '+ programadas);
   }

  // if (contCeldas > asignadas) {
  //   alert('Existen tareas sin asignar, por favor asígnelas antes de terminar la Planificación');
  // }else{
  //   //alert(contCeldas +' '+ asignadas);
  //   console.log('Validación de tareas completada.');
  //   //guardarInfo();
  //   cerrarPlanificacion();
  // }
}

function cerrarPlanificacion(){
  
  var idTarBonita = $('#idTarBonita').val();
  //var idOT = $('#idOT').val();
  $.ajax({
          type: 'POST',
          data: { idTarBonita: idTarBonita},
                  //idOT: idOT},
          url: 'index.php/Tarea/terminarPlanificacion', 
          success: function(data){ 
                  console.log('respuesta cerrar planif: ');
                  console.log(data);                  
                  // toma a tarea exitosamente
                  if(data['reponse_code'] == 204){
                          $("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
                  }else{
                    alert('Ocurrio un problema con la conexion al BPM...');
                  }                                 
                },              
          error: function(result){
                  console.log(result);
                },
          dataType: 'json'      
    });
}

function cargarListadoTask(){   
   
    WaitingOpen('Cargando Tareas...');
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
    WaitingClose();  
}


  /////////////////////   CALENDARIO //////////////////////////

  var mes = "";
  // variables globales para filtrar por id de grupos y usuarios
  var usrId = $('#usrId').val();
  var grpId = $('#grpId').val();
  var permiso = "";

calendario();
function calendario(){

  
      //  CALENDARIO

     /* initialize the external events
     -----------------------------------------------------------------*/
     function ini_events(ele) {
        ele.each(function () {
            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
              title: $.trim($(this).text()) // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);

            // make the event draggable using jQuery UI
            $(this).draggable({
              zIndex: 1070,
              revert: true, // will cause the event to go back to its
              revertDuration: 0  //  original position after the drag
            });

        });
      }
      ini_events($('#external-events div.external-event'));

      /* initialize the calendar
      -----------------------------------------------------------------*/
      //Date for the calendar events (dummy data)
      var date = new Date();
      var d = date.getDate(),
      m = date.getMonth(),
      y = date.getFullYear();     
      
      // Permisos para cambiar la fecha y hora de programacion      
        if (grpId == 1) {
          permiso = true;
        }else{
          permiso = false;
        }

      $('#calendar').fullCalendar({
          header: {
            left  : 'prev,next today',
            center: 'title',
            right : 'month,agendaWeek,agendaDay'
          },
          buttonText: {
            today: 'Hoy',
            month: 'Mes',
            week : 'Semana',
            day  : 'Día'
          },
          // desde aca busca los preventivos
          events: function(start, end, timezone, callback) {
            //WaitingOpen('Cargando trabajo');
            var date_ = new Date($("#calendar").fullCalendar('getDate'));
            var month_ = date_.getMonth();
            var idOrden = $('#numord').val();

            var evento = $.ajax({
                              //url: 'index.php/Otrabajo/getcalendTareasSector',
                              url: 'index.php/Otrabajo/getcalendTareas',
                              data: { month: month_,
                                      idOrden: idOrden },
                              dataType: 'json',
                              type: 'POST',
                              success: function(doc) {
                                  var events = [];
                                  //getTablas(month_);

                                
                                  $(doc).each(function() {

                                      var tarea = $(this).attr('tareaDescripcion');
                                      
                                      var desde = $(this).attr('fecha');
                                      var from = new Date(desde);                            
                                      
                                      // sumo los minutos
                                      var minutos = parseInt(from.getMinutes());
                                      var duracion = parseInt($(this).attr('duracion_prog'));
                                      var totalminutos = minutos + duracion;

                                      var aaaa = $(this).attr('duracion_prog');
                                      console.log('duracion: ');
                                      console.log(aaaa);

                                      var hasta = new Date(from);
                                      hasta = hasta.setMinutes(totalminutos);
                                      
                                      var to = new Date(hasta);

                                      // asigna colores en funcion del tipo de orden
                                      var  Color = '';
                                      // switch ($(this).attr('tipo')) {
                                        //   case '1':
                                        //           Color = '#3c8dbc';    //Orden Trabajo (celeste)
                                        //           break;
                                        //           case '2':
                                        //           Color = '#f56954';    //Correctivo (rojo)
                                        //           break;
                                        //           case '3':
                                        //           Color = '#39CCCC';   //Preventivo (turquesa)
                                        //           break;
                                        //           case '4':
                                        //           Color = '#ff851b';   //Backlog (naranja)
                                        //           break;
                                        //           case '5':
                                        //           Color = '#00a65a';    //Predictivo (verde)
                                        //           break;
                                        //           case '6':
                                        //           Color = '#D81B60';   //Correctivo Programado (fucsia)
                                        //           break;
                                        // };

                                      events.push({
                                              // title: $(this).attr('descripcion') + ',' + $(this).attr('id_tarea'),
                                              //start:to,
                                              start:from,
                                              end:to,
                                              title:  $(this).attr('tareaDescripcion'),
                                              // codigo: $(this).attr('nro'),
                                              equipo: $(this).attr('equipoDescripcion'),
                                              // id_orden: $(this).attr('id_orden'),
                                              idtarea: $(this).attr('id_listarea'), 
                                              allDay: false,
                                              backgroundColor: Color,
                                            });
                                  });
                                
                                  callback(events);
                                  WaitingClose();
                              },

                              error: function(doc) {
                                WaitingClose();
                                //alert('Sin datos para este mes');
                                      //alert("Error en ajax calendario:" + doc);
                              }
                          });
          },

          eventClick: function(event) {
            //// console.log('eventossss');
            // console.log(evento);
            var idOT = $('#numord').val();
            console.log('Titulo:');
            console.log(event.title);
            //setTimeout("$('#modalPrevent').modal('show')",0);
            $('#title').remove();
            $('#codigo_equipo').remove();
            $('#numero').remove();
            $('#modal_desc').remove();
            $('#modal_prev tbody').append(

              '<tr id="modal_desc">'+
              '<td class="tit"><input type="text" class="numero prevent" id="numero" value=" '+ idOT +' " placeholder=""></td>'+              
              '<td class="cod" id="cod"><input type="text" class="codigo_equipo prevent" id="codigo_equipo" value=" '+ event.equipo +' " placeholder=""></td>'+                  
              '<td class="tit"><input type="text" class="title prevent" id="title" value=" '+ event.title +' " placeholder=""></td>'+          
              '</tr>'
              );

              $('#modalTarea').modal('show');
          },

          editable: true,
          droppable: true,
          //editable: permiso,
          //droppable: permiso, // this allows things to be dropped onto the calendar !!!

          drop: function (date, allDay) { // this function is called when something is dropped
                  // retrieve the dropped element's stored Event Object
                  var originalEventObject = $(this).data('eventObject');
                  // we need to copy it, so that multiple events don't have a reference to the same object
                  var copiedEventObject = $.extend({}, originalEventObject);
                  // assign it the date that was reported
                  copiedEventObject.start = date;
                  copiedEventObject.allDay = allDay;
                  copiedEventObject.backgroundColor = $(this).css("background-color");
                  copiedEventObject.borderColor = $(this).css("border-color");
                  // render the event on the calendar
                  // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                  $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
                  // is the "remove after drop" checkbox checked?
                  if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                  }
          },
          // Triggered when dragging stops and the event has moved to a different day/time.
          eventDrop: function(event, delta, revertFunc) {
                      //alert("La Tarea: " + event.title + " cambio su programacion al dia " + event.start.format());
                      var resultado = "";
                      var nuevoDia = event.start.format();
                      var id_listarea = event.idtarea;
                      if (!confirm("Realmente desea hacer este cambio?")) {                          
                          revertFunc();
                      }else{
                          resultado = updateDia(id_listarea,nuevoDia);
                          if (resultado == 'false') {
                            revertFunc();
                            alert("No pudo realizarse el cambio");
                          }else{
                            //alert("Cambio exitoso");
                          }
                      }
          },
          // Triggered when resizing stops and the event has changed in duration.          
          eventResize: function(event, delta, revertFunc) {
                        var result = "";
                        var duracion = delta; 
                        var id_LT = event.idtarea;
                            duracion = duracion/60000;
                        //alert("Se agrego o resto: " + duracion + " cambio su duración y finalizará  " + event.end.format("h:mm:ss a"));
                        if (!confirm("Realmente desea hacer este cambio?")) {                          
                            revertFunc();
                        }else{                            
                            result = updateHora(id_LT,duracion);                        
                            if (result == 'false') {
                              revertFunc();
                              alert("No pudo realizarse el cambio");
                            }else{
                              //alert("Cambio exitoso");
                            }
                        }
          }  
      });

      /* ADDING EVENTS */
        var currColor = "#3c8dbc"; //Red by default
        //Color chooser button
        var colorChooser = $("#color-chooser-btn");
        $("#color-chooser > li > a").click(function (e) {
          e.preventDefault();
          //Save color
          currColor = $(this).css("color");
          //Add color effect to button
          $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
        });
        $("#add-new-event").click(function (e) {
            e.preventDefault();
            //Get value and make sure it is not null
            var val = $("#new-event").val();
            if (val.length == 0) {
              return;
            }

            //Create events
            var event = $("<div />");
            event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
            event.html(val);
            $('#external-events').prepend(event);

            //Add draggable funtionality
            ini_events(event);

            //Remove event from text input
            $("#new-event").val("");
        });   

}
    
$(".fa-print").click(function (e) {
    $("#calendar").printArea();
});

    
  

 //////////  ACTUALIZA DIA Y HORA

  function updateDia(id_listarea,nuevoDia){

    var resultado = $.ajax({
                        type: 'POST', 
                        data: {id:id_listarea,
                               prog:nuevoDia},
                        url: 'index.php/Otrabajo/updateDiaProgTarea',  
                        success: function(data){
                              
                                 console.log(data);
                              },
                        error: function(data){

                              console.log(data);
                            },
                        dataType: 'json'    
                    });
    return resultado;                 
  }

  function updateHora(id_LT,duracion) {
    
    var resultad = $.ajax({
                        type: 'POST', 
                        data: {id:id_LT,
                               duracion:duracion}, // duracion adicional
                        url: 'index.php/Otrabajo/updateDurTarea',  
                        success: function(data){
                               // recargar();
                                 console.log(data);
                              },
                        error: function(data){

                              console.log(data);
                            },
                        dataType: 'json'    
                    }); 
    
    return resultad;
  }
    

/////////////////////   CALENDARIO //////////////////////////



//////////////////////listado tareas y pantillas hugo/////////////////////////////

  // trae tareas estandar y llena select
  getTareasEstandar();
  function getTareasEstandar(){
    var tarea = $('#tarea');
     $.ajax({
          type: 'POST',
          data: { idtarea: idtarea},
          url: 'index.php/Otrabajo/getTareaSdt', 
          success: function(data){ 
                  
                  tarea.append($('<option />', 
                      { value: "-1", 
                        text: "Seleccione..." }));

                  for (var i = 0; i< data.length; i++) {                     
                    //console.log(data[i].length);
                    tarea.append($('<option />', 
                      { value: data[i]['id_tarea'], 
                        text: data[i]['descripcion'] }
                    ));
                  };                   
                },            
          error: function(result){
                  console.log(result);
                },
          dataType: 'json'      
    }); 
  }

  /// Plantillas llena select y tablas al seleccionar
  getPlantillas();
  function getPlantillas(){
    var plantilla = $('#plantilla');
    $.ajax({
          type: 'POST',
          //data: { idtarea: idtarea},
          url: 'index.php/Otrabajo/getPlantilla', 
          success: function(data){ 

                  plantilla.append($('<option />', 
                      { value: "-1", 
                        text: "Seleccione..." }));

                  for (var i = 0; i< data.length; i++) {                      
                    plantilla.append($('<option />', 
                      { value: data[i]['id_plantilla'], 
                        text: data[i]['descripcion'] }
                    ));
                  };                   
                },              
          error: function(result){
                  console.log(result);
                },
          dataType: 'json'      
    });
  }
  $('#plantilla').change(
        function(){
          var idPlantilla = $("#plantilla option:selected").val();
          $.ajax({
                type: 'POST',
                data: { idPlantilla: idPlantilla},
                url: 'index.php/Otrabajo/getTareasPlantilla', 
                success: function(data){ 
                        //console.log(data);
                        llenarTablaTareasSeleccionadas(data);                                           
                      },                  
                error: function(result){
                        console.log(result);
                      },
                dataType: 'json'      
          }); 
        }
  );

  /// Trae subsectores - Listo
  getSubsectores();
  function getSubsectores(){
    var sectSelect = $('#sectSelect');
    $.ajax({
          type: 'POST',
          //data: { idtarea: idtarea},
          url: 'index.php/Otrabajo/getSubsectores', 
          success: function(data){ 
                  
                  sectSelect.append($('<option />', 
                      { value: "-1", 
                        text: "Todos los Subsectores..." }));

                  for (var i = 0; i< data.length; i++) {   
                    sectSelect.append($('<option />', 
                      { value: data[i]['id_subsector'], 
                        text: data[i]['descripcion'] }
                    ));
                  };                   
                },            
          error: function(result){
                  console.log(result);
                },
          dataType: 'json'      
    });  
  }

////////////////////////////////////////////////////////////////////


//////////////// Filtrado de calendario ////////////////////////
  var resources = '';
  var date_ = new Date($("#calendar").fullCalendar('getDate'));
  var month_ = date_.getMonth();

  //EVENTO CAMBIO SELECTOR SUBSECTORES
  $('#sectSelect').change(function(){

    var idsubsector = $('#sectSelect option:selected').val();
    var idequipo = $('#equiPSelect option:selected').val();
    $('#equiPSelect option').remove();

    //borrar y llamas 
    
    //carga equipos en select equipos por subsector
    getEquipPorIdSubsector(idsubsector); 
    
    if (idsubsector != '-1') {
      //LLAMA FUNCION QUE TRAE EVENTOS A REDIBUJAR EN EL CALENDARIO
      getMesResources(month_,idsubsector);
      //alert(idsubsector);
    }else{
      //alert(idsubsector);      
      recargar();
    }
    //carga equipos een select equipos por subsector
    //getEquipPorIdSubsector(idsubsector);

  });

  

  //EVENTO CAMBIO SELECTOR EQUIPPOS
  $('#equiPSelect').change(function(){


    var idequipo = $('#equiPSelect option:selected').val(); 
    
    if (idequipo != '-1') {
      //LLAMA FUNCION QUE TRAE EVENTOS A REDIBUJAR EN EL CALENDARIO
      getEquipResources(month_,idequipo);
      //alert(idequipo);
    }else{
     // alert(idequipo);      
      recargar();
    }
    

  });

  function getEquipResources(month_,idequipo){
    console.log('Recargando Eventos...');
    console.log('Mes: '+month_+' idequipo:'+idequipo);
    $.ajax({
        type: 'POST',
        dataType: 'json',
        url: 'index.php/Otrabajo/getcalendTareasEquipo',
        data: {
            'month': month_,
            'idequipo': idequipo
        },
        success:function(data) {
          console.log(data);
          //ELIMINA EVENTOS ACTUALES DEL CALENDARIO
          $("#calendar").fullCalendar('removeEvents');
          //AGREGA NUEVO EVENTOS QUE TRAE EL AJAX AL CALENDARIO
          $("#calendar").fullCalendar("addEventSource",data);
          console.log('Recargando Eventos...OK');

        },
        error:function(){
          console.log('error');
        }
    });
  }
  
//////////////// Filtrado calendario ////////////////////////


////////////////////////////////////////////////////////////////
  // Trae equipos por subsector 
  function getEquipPorIdSubsector(idsubsector){
    
    var equiPSelect = $('#equiPSelect');
    id_subsector =1;
    $.ajax({
          type: 'POST',
          data: { idsubsector: idsubsector},
          url: 'index.php/Otrabajo/getEquipPorIdSubsector', 
          success: function(data){                 
                    equiPSelect.append($('<option />', 
                        { value: "-1", 
                          text: "Seleccione..." }));
                    for (var i = 0; i< data.length; i++) {
                      equiPSelect.append($('<option />', 
                        { value: data[i]['id_equipo'], 
                          text: data[i]['descripcion'] }
                      ));
                    };                   
                  },
            
          error: function(result){
                  console.log(result);
                 },
          dataType: 'json'      
    });  
  }

  // Llena tabla tareas al seleccionar una tarea del selector
  function llenarTablaTareasSeleccionadas(data){
    
    var numOT = $('#numord').val();
    var tr = "";
    var idsTareas = [];
    console.log('descripcion: ');
    console.log(data[0]['descripcion']);    
    
    for(var i=0; i<data.length; i++){
      tr = "<tr id='"+numOT+"'>"+              
              
              "<td>"+data[i]['descripcion']+"</td>"+
              
              "<td></td>"+
              
              "<td></td>"+
              
              "<td><i class='fa fa-times-circle' style='color: #A9A9A9 ; cursor: pointer;' title='Eliminar'></i></td>"+

          "</tr>";
      $('#orden tbody').append(tr); 
      idsTareas.push(data[i]['id_tarea']);
    }     

    // guarda tareas plantilla
    var numOT= $('#numord').val();
      $.ajax({
        type: 'POST',
        data: { numOT:numOT,
                idsTareas: idsTareas},
        url: 'index.php/Otrabajo/setTareasPlant', 
        success: function(data){
              // console.log(data);
              
              },
        error: function(result){
              
              console.log(result);
            }           
      });  
  }  

  // Programa fecha y equipo elegido en selector de equipos
  function programTarea(){
   


  // oculto  modal programacion
  $('#modalProgramacion').modal('hide');

    var idListTarea = $('#idListTarea').val();
    var id_tarea  = $('#idTarea').val();
    var fecha = $('#fechaProgNueva').val();
    var idEquip = $('#idEquip').val();
    var duracion = $('#duracion').val(); //guardar en duracion programada 
    $('.fecha').html(fecha);
    $.ajax({
          type: 'POST',
          data: { id_listarea: idListTarea,
                  id_tarea: id_tarea,
                  fecha: fecha,
                  duracion_prog: duracion, 
                  id_equipo: idEquip},
          url: 'index.php/Otrabajo/programTarea', 
          success: function(data){ 
                  calendario();
                  //recargar();
                  //alert('programacion exitosa');
                  recargaCalendario();

                  llenaTabla();
                  //$('.fecha').html(fecha); 
                  //alert(fecha);                  
                },            
          error: function(result){
                  console.log(result);
                },
          dataType: 'json'      
    }); 
  }

  

  //ASIGNAR FECHA 
    //$(".fa-calendar").click(function (e) { 
    $(document).on("click", ".fa-calendar", function() {  
      if(!validarEquipselect()){
        return;
      }else{   

        $('#descTareaModal').empty(); //limpio modal 
        $('#modalProgramacion').modal('show');      
        
        var idEquipo = $('#equiPSelect option:selected').val();
        var idSubsector = $('#sectSelect option:selected').val(); 
        
              var idListarea = $(this).parent('td').parent('tr').attr('id'); //id lis_tarea      
              var idTarea = $(this).data('idtarea'); // id de tarea standar      
        
              $('#idListTarea').val(idListarea);
              $('#idTarea').val(idTarea);
              $('#idEquip').val(idEquipo);
              console.log("id_listarea es:");
              console.log(idListarea); 
              console.log('id de tarea: ');
              console.log(idTarea);      
              console.log('id equipo: ');
              console.log(idEquipo);

              var descTar = $(this).parents("tr").find("td").eq(2).html();
              var text ='<h5>'+ descTar + '</h5>';
              $('#descTareaModal').append(text);

              var duracion = $(this).parents("tr").find("td").eq(7).html();     
              $('#duracion').val(duracion);    
      }
    });
    
    function validarEquipselect(){
      var valorEquip = $('#equiPSelect').val();
      var validado = true;
      if((valorEquip == null)||(valorEquip == -1)){
        alert('Por favor seleccione un equipo para planificar la tarea...');
        validado = false;
      }      
      return validado;
    }


//////////////////////  / listado tareas y pantillas hugo////////////////////////


/////////////////////////////////////////
  var codglo= "";
  var tareaglob= "";
  var idglob= "";
  var idtarea="";
  var idtarea1="";
  var idu=";"
  var no="";
 // $(document).ready(function(event) {
    // Vuelve al listado de ordenes de trabajo
    $('#listado').click( function cargarVista(){
      WaitingOpen();
      $('#content').empty();
      $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/listOrden/<?php echo $permission; ?>");
      WaitingClose();
    });

    // Agrega una tarea - Listo
    $('#agregar').click(function (e) { 

      var opcion = $('#tarea').val();

      if(opcion == -1){
        alert('Por favor seleccione una tarea para agregar...');
        //return;
      }else{

        var idTarBonita= $('#idTarBonita').val();
        var numord= $('#numord').val();
        no=numord;      
        var tarea1= $('#tarea option:selected').text(); 
        var tareaId = $('#tarea option:selected').val();
        tareaglob= tarea1;
        
        var hayError = false;
        if (tarea1){
          //$('#orden tbody').append(tr);
          //$('#calendarList tbody').append(trPlanif);
          $('#error').fadeOut('slow');
        }
        else {
          var hayError = true;
          $('#error').fadeIn('slow');
          return;
        }
        if(hayError == false){
        
          $('#error').fadeOut('slow');
        }
        var parametros = {       
          'id_orden': numord,
          'tareadescrip': tarea1,
          'id_tarea': tareaId,
          'estado': 'C',
          'bpm_task_id':idTarBonita   
        };
        //guarda tarea de a una
        $.ajax({
          type: 'POST',
          data: { parametros:parametros},
          url: 'index.php/Otrabajo/agregar_tarea', 
          success: function(data){
                console.log(data);
                var datos= parseInt(data);
                idtarea= datos;
                llenaTabla(); 
                },
          error: function(result){
                
                console.log(result);
              }           
        });  
      } 
     // $('#tarea').val(-1); 
    });     
       
// ELLIMINA TAREAS
$(document).on('click','div i.fa-times-circle',function(e) {
    if(e.handled !== true){ // This will prevent event triggering more then once
    
      e.preventDefault();
      e.stopImmediatePropagation();

      var idtarea = $(this).parent('td').parent('tr').attr('id');      
      WaitingOpen('Eliminando Tarea...');
      $.ajax({
              type: 'POST',
              data: { idtarea: idtarea},
              url: 'index.php/Otrabajo/EliminarTarea', 
              success: function(data){                        
                        WaitingClose();
                        recargaCalendario();
                        llenaTabla();                     
                      },                
              error: function(result){
                      console.log(result);
                    }
      });
    }
}); 

    //ASIGNAR USUARIO
    $(".fa-user").click(function (e) { 
        
      var idtar = $(this).parent('td').parent('tr').attr('id'); 
      console.log("id de tarea es: estoy asignando usuario");
      console.log(idtar); 
      idtarea=idtar;     
      $('#modalSale').modal('show');  
    });

    //ASIGNAR EQUIPO no se usa se hace desde calendarizar Pop Up
    $(".fa-cogs").click(function (e) { 
        // guarda el id_listarea en input de modal
        var idtar = $(this).parent('td').parent('tr').attr('id');
        alert(idtar);
        $('#id_listarea').val(idtar);
    }); 

    // datepicker
    $("#fecha").datepicker({
        changeMonth: true,
        changeYear: true
    });

//});

// Asigna equipo a tarea por id de tarea y por id equipo - LISTO
function setEquipo(){
  var equipo = $("#equipo").val();
  var id_listarea = $("#id_listarea").val();
  $.ajax({
              type: 'POST',
              data: { id_equipo: equipo,
                      id_listarea: id_listarea},
              url: 'index.php/Otrabajo/setEquipo', //index.php/
              success: function(data){                             
                      recargar();                    
                    },                
              error: function(result){
                    console.log(result);
                 }
  });
}
//TODO: traer usuarios de bpm
traer_usuarios();
function traer_usuarios(){
  $.ajax({
         type: 'POST',
         data: { },
         url: 'index.php/Tarea/getUsuariosBPM', 
         success: function(data){            

                 var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                 $('#nomusu').append(opcion); 
                 for(var i=0; i < data.length ; i++) {

                      var nombre = data[i]["firstname"]+' '+data[i]['lastname'];
                      var opcion  = "<option value='"+data[i]["id"]+"'>" +nombre+ "</option>" ; 

                      $('#nomusu').append(opcion);                                    
                 }
               },
         error: function(result){
              
               console.log(result);
             },
             dataType: 'json'
       });
}

//guardando usuario asignado - listo
function guardarmodif(){

  console.log("Estoy guardando usuario asignado");
  var idusu= $('#nomusu').val();
  
  if (idusu == -1) {
    $('.errorSelec').show();
    return;
  }else{
    $('.errorSelec').hide();
    $('#modalSale').modal('hide'); 
  }


  console.log("El id de usuario es:");
  console.log(idusu);
  console.log("El id de tarea es :");
  console.log(idtarea);
        $.ajax({
                type: 'POST',
                data: { idtarea: idtarea, idusu:idusu },
                url: 'index.php/Otrabajo/ModificarUsuario', //index.php/
                success: function(data){

                        console.log(data);                        
                        recargar();                      
                      },
                  
                error: function(result){
                      console.log(result);
                   },
                dataType: 'json'
        });
   
}

function guardarfecha(){

  var idusu= $('#nomusu').val();
  idu=idusu;
  var fe= $('#fecha').val();
  var idt2 = $(this).parent('td').parent('tr').attr('id');     
  console.log(idusu);
  console.log("La fechaa a guardar es :");
  console.log(fe);
  console.log("El id de tarea es :");
  console.log(idt2);
  console.log(idtarea);

        $.ajax({
                type: 'POST',
                data: { idtarea: idtarea, idusu:idusu, fe:fe},
                url: 'index.php/Otrabajo/ModificarFecha', //index.php/
                success: function(data){

                        console.log(data);                        
                        recargar();                      
                      },
                  
                error: function(result){
                      console.log(result);
                   }
        });   
}

function recargar(){
  var numord= $('#numord').val();  
  console.log(no);  
  $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/cargarPlanificacion/<?php echo $permission; ?>/"+numord+"");
}


// No se hace desde aca sino desde BPM
    //check de tarea realizada cambia estado a RE por id de tarea - Listo
    // $(".fa-check-circle-o").click(function (e) { 
    //   var idtarea= $(this).data("idtarea");
    //   alert(idtarea);  
    //   var id_orden = $(this).parent('td').parent('tr').attr('id'); 
    //   console.log("Estoy realizando una tarea");
    //   console.log("id de tarea es:");
    //   console.log(id_orden);  
    //   $.ajax({
    //     type: 'GET',
    //     data: { idtarea: idtarea},
    //     url: 'index.php/Otrabajo/TareaRealizada',
    //     success: function(data){
    //             console.log(data);
    //             recargar();
                             
    //           },
          
    //     error: function(result){
              
    //           console.log(result);
    //         }
    //        // dataType: 'json'
    //     });      
    // });
$('#fechaProgNueva').datetimepicker(
  {format: 'YYYY-MM-DD H:mm:ss',
    locale: 'es'}
);


</script>

<!-- Modal Asigna usuario -->
<div class="modal fade" id="modalSale" tabindex="2000" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog" role="document" style="width: 40%">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerro()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalActionSale" class="fa fa-user" style="color: #A9A9A9" > </span> Asignación de usuario</h4> 
      </div>

      <div class="errorSelec" style="display: none">
        <h4>Para guardar, seleccione un usuario de la lista por favor...</h4>
      </div>

      <div class="modal-body" id="modalBodySale">
        <div class="row" >
          <div class="col-sm-12 col-md-12">
            <div class="errorSelec" style="display: none">
              <h5>Para guardar, seleccione un usuario de la lista por favor...</h5>
            </div>
            <fieldset> </fieldset>
            <br>
            <div class="form-group">Usuario
              <select id="nomusu" name="nomusu" value="" class="form-control input-md"></select>
            <!--  <input type="text" id="nomusu" name="nomusu" value=""  class="nomusu">-->
            </div>
                                                        
          </div>
        </div>
      </div>       
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cerro()">Cancelar</button>
        <button type="button" class="btn btn-primary" id="reset" onclick="guardarmodif()">Guardar</button>
      </div>

    </div>
  </div>
</div>

<!-- Modal Asignación de Fecha -->
<div class="modal fade" id="modalfecha" tabindex="2000" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog" role="document" style="width: 40%">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerro()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalActionSale" class="fa fa-user" style="color: #A9A9A9" > </span> Asignación de Fecha</h4> 
      </div>

      <div class="modal-body" id="modalBodySale">
        <div class="row" >
          <div class="col-sm-12 col-md-12">
            <fieldset> </fieldset>
            <br>
            <div class="col-xs-6">Fecha
              <input type="text" id="fecha" name="fecha" value="" class="datepicker">
            </div>
                                                        
          </div>
        </div>
      </div>       
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cerro()">Cancelar</button>
        <button type="button" class="btn btn-primary" id="reset" data-dismiss="modal" onclick="guardarfecha()">Guardar</button>
      </div>

    </div>
  </div>
</div>

<!-- Modal Asigna equipo -->
<div class="modal fade" id="modalAsignaEquipo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Asigna Equipo</h4>
      </div>
      <div class="modal-body">
        <h5>Seleccione Equipo</h5> 
        <div class="form-group">
          <div class="col-xs-8">Equipo
            <select id="equipo" name="equipo" class="form-control " placeholder="" value="" ></select>
            <input type="text" id="id_listarea" name="id_listarea" value="" class="hidden">
          </div>
        </div>        
      </div>    
      <div class="clearfix"></div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="CancEquipo()">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setEquipo()">Asignar</button>
      </div>
    </div>
  </div>
</div>


<!-------------------- PROGRAMACION DE TAREAS CALENDARIO --------------> 

<!-- Modal fecha de Programación-->
<div class="modal fade" id="modalProgramacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Programacion Tarea</h4>
      </div>
      <div class="modal-body" id="infoTarea">
        
        <h5 id="descTareaModal"></h5>      

        <input type='text' class="hidden" id="idTarea">
        <input type='text' class="hidden" id="idListTarea">
        <input type='text' class="hidden" id="idEquip">

        <div class="form-group">
          <label for="fechaProgNueva">Fecha *</label>
          <input type='text' class="form-control input-md" id="fechaProgNueva" value="<?php echo date("Y-m-d H:i:s") ?>">
          <!-- <input type='text' class="form-control input-md" id="fechaProgNueva" value=""> -->
        </div>

        <div class="form-group">
          <label for="fecha">Duración Estandar (en minutos)</label>
          <input type='text' class="form-control input-md" id="duracion" value="" disabled>
        </div>

        
        

      </div>    
      <div class="clearfix"></div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="programTarea()">Programar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Tarea-->
<div class="modal fade" id="modalTarea" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span id="modalAction_2">Detalle de Tarea</span></h4>
      </div>
      <div class="modal-body" id="modalPrev">
        <table class="table table-condensed table-responsive modal_prev" id="modal_prev">
            <thead>
              <tr>
                <th style="width: 5%;">Nº de Orden</th>                
                <th style="width: 15%;">Equipo</th>
                <th>Tarea</th>
              </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="aceptar">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!--------------------  // PROGRAMACION DE TAREAS CALENDARIO --------------> 

