<input type="hidden" id="permission" value="<?php echo $permission;?>">
 <div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
          <h4><i class="icon fa fa-ban"></i> ERROR!</h4>
          INGRESE TAREA A REALIZAR!! 
      </div>
  </div>
</div>


<section class="content">
  
  <div class="row">
    <div class="col-sm-12 col-md-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title"> Asignación de tareas</h3>
          <br><br>
          <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Calendario</a></li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Tareas</a></li>    
          </ul>
        </div> <!-- / box-header-->
      </div> <!-- /box -->

      <!-- Calendario -->
      <div role="tabpanel" class="tab-pane active" id="home">        
          <style>            input.prevent{border: none; padding-left: 5px; width: 100%;} 
            .selmes{margin-bottom: 10px;}     
          </style>             
          <!-- CALENDARIO -->
          <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-body">
                  <div class="fa fa-fw fa-print" style="color: #A4A4A4; cursor: pointer; margin-left: 15px; border-radius: 18px; " title="Imprimir" >                    
                  </div>
                  <div id="calendar"></div>

<!------------------------listado en calendario------------------------------>
        <table id="orden" class="table table-bordered table-hover" width="80%" >
              <!--<br>
              <div class="col-xs-4" align="center"><label>Listado de tareas</label></div>-->
                <thead>
                  <tr>
                    <th width="2%"></th>
                    <th width="25%"></th>
                    <th width="10%"></th>
                    <th width="10%"></th>
                    <th width="5%"></th>
                  
                    <th width="2%"></th>
                    <th width="2%"></th>
                    <!-- <th width="2%"></th> -->
                  </tr>
                </thead>
                <tbody>  
                 <?php
                 //echo "<pre>";  
                  //var_dump($list);
                  if(count($list) > 0) {
                    $userdata = $this->session->userdata('user_data');
                    $usrId= $userdata[0]['usrId'];  
                  
                 
                    foreach($list as $a){

                      // Muestra listado de tareas que no estan inactivas
                      if($a['estado']!=='IN'){ // || $a['estado']== 'RE' $a['id_usuario']==$usrId  && $a['grpId']==1
                     
                        $id=$a['id_listarea'];
                        echo '<tr id="'.$id.'" class="'.$id.'">';
                        echo '<td>';

                        echo '<i class="fa fa-calendar cous" style="color: #006400 ; cursor: pointer; margin-left: 15px;" title="Programar tarea" data-toggle="modal" data-target="#modalProgramacion" ></i>';
                        //onclick="fill_Prevent('.$p['prevId'].')"


                        // si tiene permiso OP y ususrio logueado y estado RE
                        // if (strpos($permission,'OP') !== false && ($a['usrId']==$usrId) && ($a['estado']!='RE')){
                        //   echo '<i class="fa fa-check-circle-o" style="color: #006400 ; cursor: pointer; margin-left: 15px;" title="Confirmar tarea"></i>';
                        // }
                        // else {    // si tiene solo estado 'RE' (reparacion)
                        //   if($a['estado']=='RE'){
                        //        echo '<i   class="fa fa-check-circle" style="color: #A9A9A9 ; cursor: pointer; margin-left: 15px;" title="Tarea finalizada"></i>';     
                        //   }
                        // }                                
                        echo '</td>';
                        
                        echo '<td style="text-align: left">'.$a['tareadescrip'].'</td>';
                        
                        
                        if($a['usrName']!= null ){
                            //echo '<td style="text-align: left">'.$a['usrName'].'</td>';
                          echo '<td style="text-align: left">'.$a['usrLastName'].' '.$a['usrName'].'</td>';
                         }
                          else echo '<td style="text-align: left"></td>';

                        if($a['fecha']!= null){
                          echo '<td style="text-align: left">'.date_format(date_create($a['fecha']), 'd-m-Y').'</td>';


                        }
                          else echo '<td style="text-align: left"></td>';

                          echo '<td style="text-align: center">'.($a['estado'] == 'C' ? '<small class="label label-default">Curso</small>' : ($a['estado'] == 'RE' ? '<small class="label label-default">Finalizada</small>' : '<small class="label label-default">Eliminada</small>')).'</td>';

                        echo '<td>';

                        if (strpos($permission,'Del') !== false && ($a['id_usuario_a']==$usrId || $usrId==1) && ($a['estado']!='RE') ){
                          echo '<i class="fa fa-times-circle" style="color: #A9A9A9 ; cursor: pointer;" title="Eliminar"></i>';
                                  
                        }     
                                    
                        echo '</td>';
                        echo '<td>';

                        if (strpos($permission,'Edit') !== false && ($a['id_usuario']==$usrId || $usrId==1) && ($a['estado']!='RE') ){
                                  
                          echo '<i class="fa fa-user" style="color: #A9A9A9 ; cursor: pointer;"" title="Asignación de usuario" data-toggle="modal" data-target="#modalSale"></i>';
                                
                        }

                        echo '</td>';
                        
                        // duracion standar de tarea
                        echo '<td class="hidden" style="text-align: left">'.$a['duracion_std'].'</td>';

                        // echo '<td>';

                        // if (strpos($permission,'Add') !== false && ($a['id_usuario']==$usrId || $usrId==1) && ($a['estado']!='RE') ){
                                  
                        //   echo '<i class="fa fa-calendar cous" style="color: #A9A9A9 ; cursor: pointer;"" title="Asignación de Fecha" data-toggle="modal" data-target="#modalfecha" id="cous"></i>';
                        // }
                                        
                        // echo '</td>';
                        echo '</tr>';

                      } 

                    }               
                  }
                 ?> 
                </tbody>
              </table>

<!------------------------listado en calendario------------------------------>
                </div><!-- /.box-body -->
            </div><!-- /. box -->
          </div><!-- /.col -->         
      </div>  <!-- / Calendario --> 

<!----------------------- TAREAS-------------------------------------------->

  <div class="col-sm-12 col-md-12">
              <div class="col-xs-8">Tarea
                <select id="tarea" name="tarea" class="form-control " placeholder="" value="" ></select>
              </div>
              <div class="col-xs-2">
                <button type="button" class="btn btn-success" id="agregar"><i class="  fa fa-plus"></i>Agregar</button>
              </div>             
              <div class="col-xs-8">Plantilla 
                <select id="plantilla" name="plantilla" class="form-control " placeholder="" value="" ></select>
              </div>
              <div class="col-xs-4">
                <input type="hidden"  id="numord" name="numord" value="<?php echo $id_orden;?>"> </input>
              </div>  
              <br><div class="clearfix"></div>
              
              <br>
              <br>
              <table id="orden" class="table table-bordered table-hover" width="80%" >
              <!--<br>
              <div class="col-xs-4" align="center"><label>Listado de tareas</label></div>-->
                <thead>
                  <tr>
                    <th width="2%"></th>
                    <th width="25%"></th>
                    <th width="10%"></th>
                    <th width="10%"></th>
                    <th width="5%"></th>                   
                    <th width="2%"></th>
                    <th width="2%"></th>
                    <th width="2%"></th>
                  </tr>
                </thead>
                <tbody>  
                 <?php
                // echo "<pre>";  
                // var_dump($list);
                  if(count($list) > 0) {
                    $userdata = $this->session->userdata('user_data');
                    $usrId= $userdata[0]['usrId'];  
                  
                 
                    foreach($list as $a){

                      // Muestra listado de tareas que no estan inactivas
                      if($a['estado']!=='IN'){ // || $a['estado']== 'RE' $a['id_usuario']==$usrId  && $a['grpId']==1
                     
                        $id=$a['id_listarea'];
                        echo '<tr id="'.$id.'" class="'.$id.'">';
                        echo '<td>';

                        // si tiene permiso OP y ususrio logueado y estado RE
                        if (strpos($permission,'OP') !== false && ($a['usrId']==$usrId) && ($a['estado']!='RE')){
                          echo '<i class="fa fa-check-circle-o" style="color: #006400 ; cursor: pointer; margin-left: 15px;" data-idTarea="'.$a['id_tarea'].'" title="Confirmar tarea"></i>';
                        }
                        else {    // si tiene solo estado 'RE' (reparacion)
                          if($a['estado']=='RE'){
                               echo '<i   class="fa fa-check-circle" style="color: #A9A9A9 ; cursor: pointer; margin-left: 15px;" title="Tarea finalizada"></i>';     
                          }
                        }                                
                        echo '</td>';
                        
                        echo '<td style="text-align: left">'.$a['tareadescrip'].'</td>';
                        
                        
                        if($a['usrName']!= null ){
                            //echo '<td style="text-align: left">'.$a['usrName'].'</td>';
                          echo '<td style="text-align: left">'.$a['usrLastName'].' '.$a['usrName'].'</td>';
                         }
                          else echo '<td style="text-align: left"></td>';

                        if($a['fecha']!= null){
                          echo '<td style="text-align: left">'.date_format(date_create($a['fecha']), 'd-m-Y').'</td>';


                        }
                          else echo '<td style="text-align: left"></td>';

                          echo '<td style="text-align: center">'.($a['estado'] == 'C' ? '<small class="label label-default">Curso</small>' : ($a['estado'] == 'RE' ? '<small class="label label-default">Finalizada</small>' : '<small class="label label-default">Eliminada</small>')).'</td>';

                        echo '<td>';

                        if (strpos($permission,'Del') !== false && ($a['id_usuario_a']==$usrId || $usrId==1) && ($a['estado']!='RE') ){
                          echo '<i class="fa fa-times-circle" style="color: #A9A9A9 ; cursor: pointer;" title="Eliminar"></i>';
                                  
                        }     
                                    
                        echo '</td>';
                        echo '<td>';

                        // if (strpos($permission,'Edit') !== false && ($a['id_usuario']==$usrId || $usrId==1) && ($a['estado']!='RE') ){
                                  
                        echo '<i class="fa fa-cogs" style="color: #A9A9A9 ; cursor: pointer;"" title="Asignación de Equipo" data-id_tarea="'.$a['id_tarea'].'" data-toggle="modal" data-target="#modalAsignaEquipo"></i>';
                                
                        // }

                        // echo '</td>';
                        // echo '<td>';

                        // if (strpos($permission,'Add') !== false && ($a['id_usuario']==$usrId || $usrId==1) && ($a['estado']!='RE') ){
                                  
                        //   echo '<i class="fa fa-calendar cous" style="color: #A9A9A9 ; cursor: pointer;"" title="Asignación de Fecha" data-toggle="modal" data-target="#modalfecha" id="cous"></i>';
                        // }
                                        
                        echo '</td>';
                        echo '</tr>';

                      } 

                    }               
                  }
                 ?> 
                </tbody>
              </table>
            </div>

<!------------------------ / TAREAS------------------------------------------->

    </div> <!-- /col-sm-12 col-md-12-->
  </div>  <!-- /row -->


</section> 


<script>
/////////////////////   CALENDARIO //////////////////////////

 var mes = "";

    $(function () {    

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

            var evento = $.ajax({
                              //url: 'index.php/Calendario/getcalendarot',
                              data: { month: month_ },
                              dataType: 'json',
                              type: 'POST',
                              success: function(doc) {
                                  var events = [];
                                  getTablas(month_);
                                  $(doc).each(function() {

                                      var tarea = $(this).attr('descripcion');
                                      // console.log('Tarea: ');
                                      // console.log(tarea);
                                      
                                      var desde = $(this).attr('fecha_program'); //ultimo preventivo hecho
                                      var from = new Date(desde);                            
                                      
                                      // sumo los minutos
                                      var minutos = parseInt(from.getMinutes());
                                      var duracion = parseInt($(this).attr('duracion'));
                                      var totalminutos = minutos + duracion;
                                      // console.log('fecha OT: ');
                                      // console.log(from);
                                      // console.log('Duracion: ');
                                      // console.log(duracion);


                                      var hasta = new Date(from);
                                      hasta = hasta.setMinutes(totalminutos);
                                      
                                      var to = new Date(hasta);
                                      // console.log('fecha con duracion: ');
                                      // console.log(to);                            

                                      // asigna colores en funcion del tipo de orden
                                      var  Color = '';
                                      switch ($(this).attr('tipo')) {
                                        case '1':
                                                Color = '#3c8dbc';    //Orden Trabajo (celeste)
                                                break;
                                                case '2':
                                                Color = '#f56954';    //Correctivo (rojo)
                                                break;
                                                case '3':
                                                Color = '#39CCCC';   //Preventivo (turquesa)
                                                break;
                                                case '4':
                                                Color = '#ff851b';   //Backlog (naranja)
                                                break;
                                                case '5':
                                                Color = '#00a65a';    //Predictivo (verde)
                                                break;
                                                case '6':
                                                Color = '#D81B60';   //Correctivo Programado (fucsia)
                                                break;
                                      };

                                      events.push({
                                              // title: $(this).attr('descripcion') + ',' + $(this).attr('id_tarea'),
                                              //start:to,
                                              start:from,
                                              end:to,
                                              title:  $(this).attr('descripcion'),
                                              codigo: $(this).attr('nro'),
                                              equipo: $(this).attr('codigo'),
                                              id_orden: $(this).attr('id_orden'),
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

            console.log('Titulo:');
            console.log(event.title);
            //setTimeout("$('#modalPrevent').modal('show')",0);
            $('#title').remove();
            $('#codigo_equipo').remove();
            $('#numero').remove();
            $('#modal_desc').remove();
            $('#modal_prev tbody').append(

              '<tr id="modal_desc">'+
              '<td class="tit"><input type="text" class="numero prevent" id="numero" value=" '+ event.id_orden +' " placeholder=""></td>'+
              '<td class="cod" id="cod"><input type="text" class="codigo_equipo prevent" id="codigo_equipo" value=" '+ event.equipo +' " placeholder=""></td>'+
              '<td class="tit"><input type="text" class="title prevent" id="title" value=" '+ event.title +' " placeholder=""></td>'+          
              '</tr>'
              );

              $('#modalPrevent').modal('show');
          },

          editable: true,
          droppable: true, // this allows things to be dropped onto the calendar !!!

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
                          var id_OT = event.id_orden;                    

                          if (!confirm("Realmente desea hacer este cambio?")) {
                              
                              revertFunc();
                          }else{
                              resultado = updateDia(id_OT,nuevoDia);
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
                          var id_OT = event.id_orden;
                              duracion = duracion/60000;
                          //alert("Se agrego o resto: " + duracion + " cambio su duración y finalizará  " + event.end.format("h:mm:ss a"));

                          if (!confirm("Realmente desea hacer este cambio?")) {
                            
                              revertFunc();
                          }else{
                              
                              result = updateHora(id_OT,duracion);                        
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
    });
    $(".fa-print").click(function (e) {
      $("#calendar").printArea();
    });

    
  

     

/////////////////////   CALENDARIO //////////////////////////



//////////////////////listado tareas y pantillas hugo/////////////////////////////

  
  /// Trae tarea standar - Listo
  $(function(){
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
  });

  /// Trae equipos - Listo
  $(function(){
    var equipos = $('#equipo');
     $.ajax({
          type: 'POST',
          data: { idtarea: idtarea},
          url: 'index.php/Otrabajo/getEquipo', 
          success: function(data){ 
                  //var opc = ; 

                  equipos.append($('<option />', 
                      { value: "-1", 
                        text: "Seleccione..." }));

                  for (var i = 0; i< data.length; i++) {                     
                    //console.log(data[i].length);
                    equipos.append($('<option />', 
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
  });

  /// Plantillas
  $(function(){

    // Trae plantillas y llena select
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

    // Al seleccionar plantilla llena tabla
    $(plantilla).change(
        function(){
          var idPlantilla = $("#plantilla option:selected").val();
          $.ajax({
                type: 'POST',
                data: { idPlantilla: idPlantilla},
                url: 'index.php/Otrabajo/getTareasPlantilla', 
                success: function(data){ 
                        //console.log(data);
                        llenarTabla(data);                                           
                      },                  
                error: function(result){
                        console.log(result);
                      },
                dataType: 'json'      
          }); 
        }
    ); 
  });

  // llena tabla tareas
  function llenarTabla(data){
    var numOT = $('#numord').val();
    var tr = "";
    var idsTareas = [];
    console.log('descripcion: ');
    console.log(data[0]['descripcion']);    
    
    for(var i=0; i<data.length; i++){
      tr = "<tr id='"+numOT+"'>"+
              "<td  style='text-align: center' ><i class='fa fa-check-circle-o' style='color: #006400 '; cursor: 'pointer' data-idTarea='"+data[i]['id_tarea']+"'  title='Confirmar tarea'></i></td>"+
              "<td>"+data[i]['descripcion']+"</td>"+
              "<td></td>"+
              "<td></td>"+
              "<td style='text-align: center' ><small class='label label-default' >Curso</td>"+
              "<td><i class='fa fa-times-circle' style='color: #A9A9A9 '; cursor: 'pointer' title='Eliminar'></i></td>"+
              "<td><i class=' fa fa-user' style='color: #A9A9A9 '; cursor: 'pointer' title='Asignacion de usuario' data-toggle='modal' data-target='#modalSale'></i></td>"+
              "<td  ><i class='fa fa-cogs' style='color: #A9A9A9    '; cursor: 'pointer' title='Fecha' data-toggle='modal' data-target='#modalAsignaEquipo'></i></td>"+
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




//////////////////////  / listado tareas y pantillas hugo////////////////////////










/////////////////////////////////////////
  var codglo= "";
  var tareaglob= "";
  var idglob= "";
  var idtarea="";
  var idtarea1="";
  var idu=";"
  var no="";
  $(document).ready(function(event) {
    // Vuelve al listado de ordenes de trabajo
    $('#listado').click( function cargarVista(){
      WaitingOpen();
      $('#content').empty();
      $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/listOrden/<?php echo $permission; ?>");
      WaitingClose();
    });

    // Agrega una tarea - Listo
    $('#agregar').click(function (e) {      
      var numord= $('#numord').val();
      no=numord;      
      var tarea1= $('#tarea').val(); 
      tareaglob= tarea1;
      var tr = "<tr id='"+numord+"'>"+
                  "<td  style='text-align: center' ><i class='fa fa-check-circle-o' style='color: #006400 '; cursor: 'pointer' title='Confirmar tarea'></i></td>"+
                  "<td>"+tarea1+"</td>"+
                  "<td></td>"+
                  "<td></td>"+
                  "<td style='text-align: center' ><small class='label label-default' >Curso</td>"+
                  "<td><i class='fa fa-times-circle' style='color: #A9A9A9 '; cursor: 'pointer' title='Eliminar'></i></td>"+
                  "<td><i class=' fa fa-user' style='color: #A9A9A9 '; cursor: 'pointer' title='Asignacion de usuario' data-toggle='modal' data-target='#modalSale'></i></td>"+
                  "<td  ><i class='fa fa-cogs' style='color: #A9A9A9    '; cursor: 'pointer' title='Fecha' data-toggle='modal' data-target='#modalAsignaEquipo'></i></td>"+
                "</tr>";          
      console.log(tr); 
      var hayError = false;
      if (tarea1){
        $('#orden tbody').append(tr);
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
        'estado': 'C'   
      };
      // guarda tarea de a una
      $.ajax({
        type: 'POST',
        data: { parametros:parametros},
        url: 'index.php/Otrabajo/agregar_tarea', 
        success: function(data){
              console.log(data);
              var datos= parseInt(data);
              idtarea= datos; 
              },
        error: function(result){
              
              console.log(result);
            }           
      });  
       
      $('#tarea').val(''); 
    }); 

    //check de tarea realizada cambia estado a RE por id de tarea - Listo
    $(".fa-check-circle-o").click(function (e) { 
      var idtarea= $(this).data("idtarea");
      alert(idtarea);  
      var id_orden = $(this).parent('td').parent('tr').attr('id'); 
      console.log("Estoy realizando una tarea");
      console.log("id de tarea es:");
      console.log(id_orden);  
      $.ajax({
        type: 'GET',
        data: { idtarea: idtarea},
        url: 'index.php/Otrabajo/TareaRealizada',
        success: function(data){
                console.log(data);
                regresa1();
                             
              },
          
        error: function(result){
              
              console.log(result);
            }
           // dataType: 'json'
        });      
    });
    
    //ELIMINAR
    $(".fa-times-circle").click(function (e) { 
        
      console.log("Estoy eliminando tarea");
      var idt = $(this).parent('td').parent('tr').attr('id'); 
      console.log("id de tarea es:");
      console.log(idt); 
      idtarea=idt;  
      $.ajax({
              type: 'POST',
              data: { idtarea: idtarea},
              url: 'index.php/Otrabajo/EliminarTarea', //index.php/
              success: function(data){
                      console.log("TAREA ELIMINADA");
                      console.log(data);
                      //alert("TAREA ELIMINADA");
                      regresa1();
                    
                    },
                
              error: function(result){
                    console.log(result);
                 }
      });
    });

    //ASIGNAR FECHA 
    $(".fa-calendar").click(function (e) { 
      $('#descTareaModal').empty() 
      var idta2 = $(this).parent('td').parent('tr').attr('id'); 
      console.log("id de tarea es:");
      console.log(idta2); 
      idtarea=idta2; 

      var descTar = $(this).parents("tr").find("td").eq(1).html();
      var text ='<h5>'+ descTar + '</h5>';
      $('#descTareaModal').append(text);

      var duracion = $(this).parents("tr").find("td").eq(7).html();     
      $('#duracion').val(duracion);

    });

    //ASIGNAR USUARIO
    $(".fa-user").click(function (e) { 
        
      var idtar = $(this).parent('td').parent('tr').attr('id'); 
      console.log("id de tarea es: estoy asignando usuario");
      console.log(idtar); 
      idtarea=idtar;      
    });

    //ASIGNAR EQUIPO 
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
});

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
                      regresa1();                    
                    },                
              error: function(result){
                    console.log(result);
                 }
  });
}

traer_usuarios();
function traer_usuarios(){

      $.ajax({
        type: 'POST',
        data: { },
        url: 'index.php/Otrabajo/getusuario', //index.php/
        success: function(data){
               
                var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                $('#nomusu').append(opcion); 
                for(var i=0; i < data.length ; i++) {

                      var nombre = data[i]['usrLastName']+' '+data[i]['usrName'];
                      //data[i]['usrName'];

                      var opcion  = "<option value='"+data[i]['usrId']+"'>" +nombre+ "</option>" ; 

                    $('#nomusu').append(opcion); 
                                   
                }
              },
        error: function(result){
              
              console.log(result);
            },
            dataType: 'json'
      });
}

//guardando usuario asignado
function guardarmodif(){

  console.log("Estoy guardando usuario asignado");
  var idusu= $('#nomusu').val();
  //idu=idusu;
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
                        
                        regresa1();
                      
                      },
                  
                error: function(result){
                      console.log(result);
                   }
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
                        
                        regresa1();
                      
                      },
                  
                error: function(result){
                      console.log(result);
                   }
        });
   
}

function regresa1(){
//   var idusu= $('#nomusu').val();
 // no=idusu;
  var numord= $('#numord').val();
  no=numord;
  console.log(no);

  //$('#content').empty(); //listOrden
  //$('#modalSale').empty();  
  //$('#modalfecha').empty(); 
  $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/cargartarea/<?php echo $permission; ?>/"+no+"");
  //WaitingClose();
 // WaitingClose();
  //WaitingClose();
}

// cargo plugin DateTimePicker
  $('#fecha, #fecha-tomo, #libroFecha').datetimepicker({
    format: 'YYYY-MM-DD H:mm:ss',
    locale: 'es',
  });

</script>

<!-- Modal Asigna usuario -->
<div class="modal fade" id="modalSale" tabindex="2000" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog" role="document" style="width: 40%">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerro()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalActionSale" class="fa fa-user" style="color: #A9A9A9" > </span> Asignación de usuario</h4> 
      </div>

      <div class="modal-body" id="modalBodySale">
        <div class="row" >
          <div class="col-sm-12 col-md-12">
            <fieldset> </fieldset>
            <br>
            <div class="col-xs-6">Usuario
              <select id="nomusu" name="nomusu" value="" class="form-control "></select>
            <!--  <input type="text" id="nomusu" name="nomusu" value=""  class="nomusu">-->
            </div>
                                                        
          </div>
        </div>
      </div>       
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cerro()">Cancelar</button>
        <button type="button" class="btn btn-primary" id="reset" data-dismiss="modal" onclick="guardarmodif()">Guardar</button>
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

        <div class="form-group">
          <label for="fecha">Fecha *</label>
          <input type='text' class="form-control input-md" id="fecha" value="<?php echo date("Y-m-d H:i:s") ?>">
        </div>

        <div class="form-group">
          <label for="fecha">Duración Standar (en minnutos) *</label>
          <input type='text' class="form-control input-md" id="duracion" value="" disabled>
        </div>
        

      </div>    
      <div class="clearfix"></div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="CancCorrec()">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setOtCorrectivo()">Programar</button>
      </div>
    </div>
  </div>
</div>

<!--------------------  // PROGRAMACION DE TAREAS CALENDARIO --------------> 

