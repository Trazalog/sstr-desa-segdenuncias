<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
        <h4><i class="icon fa fa-warning"></i> Error!</h4>
        Revise que todos los campos obligatorios esten seleccionados
      </div>
    </div>
  </div>
  <?php
    //dump($permission, "permission");
    //dump($idEmpleador, "idEmpleador");
    //dump($provincias, "provincias");*/
    //dump($departamentos, "deptos");
    //dump($empleador, "empleador");
    //dump($establecimientos, "establecimientos");
    //dump($actividad, "actividades");
    //dump($actividadE, "actividad empleador");
    //dump($liquidacion, "liquidacion");
    //dump($notas, "notas");
    //dump($libros, "libros");
  ?>
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Empleadores</h3>
        </div><!-- /.box-header -->
        <div class="box-body">
        
        <div class="nav-tabs-custom">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">Información Personal</a></li>
            <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">Libros</a></li>
            <li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false">Observaciones</a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab_1">

              <div class="row">
                <div class="col-xs-12">
                  <div class="alert alert-danger alert-dismissable" id="errorEmpleador" style="display: none">
                    <h4><i class="icon fa fa-warning"></i> Error!</h4>
                    Revise que todos los campos obligatorios esten seleccionados
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-xs-12 col-md-4">
                  <div class="radio">
                    <label>
                      <input type="radio" name="tipoEmpleador" value="L" checked> Locales
                    </label>
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="radio">
                    <label>
                      <input type="radio" name="tipoEmpleador" value="C"> Centralización
                    </label>
                  </div>
                </div>
                <div class="col-xs-12 col-md-4 form-inline">
                  <div class="form-group">
                    <label for="fecha">Fecha *</label>
                    <input type='text' class="form-control" id="fecha" value="<?php echo $empleador[0]['empleafecha'];?>">
                  </div>
                </div>
              </div><!-- /.row -->

              <div class="row">
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label for="nro-inscripcion">Nº Inscripción *</label>
                    <input type="text" class="form-control" id="nro-inscripcion" value="<?php echo $empleador[0]['empleainscrip'];?>">
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label for="expediente">Expediente *</label>
                    <input type="text" class="form-control" id="expediente" value="<?php echo $empleador[0]['empleaexp'];?>">
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label for="cuit">CUIT *</label>
                    <input type="text" class="form-control" id="cuit" value="<?php echo $empleador[0]['empleacui'];?>">
                  </div>
                </div>
              </div><!-- /.row -->

              <div class="row">
                <div class="col-xs-12">
                  <div class="form-group">
                    <label for="razon-social">Razón Social *</label>
                    <input type="text" class="form-control" id="razon-social" value="<?php echo $empleador[0]['emplearazsoc'];?>">
                  </div>
                </div>
              </div><!-- /.row -->

              <div class="row">
                <div class="col-xs-12">
                  <div class="form-group">
                    <label for="domicilio-legal">Domicilio Legal *</label>
                    <input type="text" class="form-control" id="domicilio-legal" value="<?php echo $empleador[0]['empleadomiciliolegal'];?>">
                  </div>
                </div>
              </div><!-- /.row -->

              <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                  <div class="panel-heading heading-estableciemientos" role="tab" id="headingOne">
                    <h4 class="panel-title">
                      <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="btn-block">
                        Establecimientos <i class="fa fa-angle-right"></i>
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                      
                      <div class="row">
                        <div class="col-xs-12">
                          <div class="alert alert-danger alert-dismissable" id="errorAddEstablec" style="display: none">
                            <h4><i class="icon fa fa-warning"></i> Error!</h4>
                            Revise que todos los campos obligatorios esten seleccionados
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="calle">Calle *</label>
                            <input type="text" class="form-control" id="calle" value="">
                          </div>
                        </div><!-- /.row -->
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="altura">Altura *</label>
                            <input type="text" class="form-control" id="altura" value="">
                          </div>
                        </div>
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="piso">Piso</label>
                            <input type="text" class="form-control" id="piso" value="">
                          </div>
                        </div>
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="dpto">Dpto</label>
                            <input type="text" class="form-control" id="dpto" value="">
                          </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                          <div class="form-group">
                            <label for="provincias">Provincia *</label>
                            <select class="form-control" id="provincias">
                              <option value='-1'>Seleccione la provincia...</option>
                              <?php foreach ($provincias as $provincia) {
                                # code... /*if($provincia['id'] == $provinciaId) echo 'selected';*/
                                echo "<option value=".$provincia['id'].">".$provincia['provincia']."</option>";
                              }
                              ?>
                            </select>
                          </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                          <div class="form-group">
                            <label for="departamentos">Departamento *</label>
                            <select class="form-control" id="departamentos" disabled="disabled">
                              <!-- -->
                            </select>
                          </div>
                        </div>

                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="latitud">Latitud</label>
                            <input type="text" class="form-control" id="latitud" value="">
                          </div>
                        </div>
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="longitud">Longitud</label>
                            <input type="text" class="form-control" id="longitud" value="">
                          </div>
                        </div>

                        <div class="col-xs-12 col-md-3 col-md-offset-3">
                          <div class="form-group">
                            <br>
                            <button type="button" class="btn btn-primary pull-right" id="add-establecimiento">Agregar Establecimiento</button>
                          </div>
                        </div>
                      </div><!-- /.row -->
                      <hr>
                      <table id="tbl-establecimiento" class="table table-bordered table-hover">
                        <thead>
                          <tr>
                            <th>Acción</th>
                            <th>Calle</th>
                            <th>Altura</th>
                            <th>Piso</th>
                            <th>Depto</th>
                            <th>Provincia</th>
                            <th>Departamento</th>
                            <th>Latitud</th>
                            <th>Longitud</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php if(is_array($establecimientos )) {
                            foreach( (array)$establecimientos  as $est )
                            {
                              $id=$est['estableid'];
                              echo '<tr id="'.$id.'" data-provid="'.$est['provid'].'" data-dptoid="'.$est['dptoid'].'">';
                                echo '<td>';
                                if (strpos($permission,'Add') !== false) {
                                  echo '<i class="fa fa-fw fa-pencil text-light-blue btnEditEstablecimiento" style="cursor: pointer; margin-left: 15px;" data-estableid="'.$id.'"></i>';
                                }
                                if (strpos($permission,'Del') !== false) {
                                  echo '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteEstablecimiento" style="cursor: pointer; margin-left: 15px;" data-estableid="'.$id.'"></i>';
                                }
                                echo '</td>';
                                echo '<td>'.$est['establecalle'].'</td>';
                                echo '<td>'.$est['establealtura'].'</td>';
                                echo '<td>'.$est['establepiso'].'</td>';
                                echo '<td>'.$est['establedpto'].'</td>';
                                /*$keyProv = array_search($est['provid'], array_column($provincias, 'id'));
                                echo '<td datta-prov="">'.$provincias[$keyProv]['provincia'].'</td>';
                                $keyDpto = array_search($est['dptoid'], array_column($departamentos, 'id'));
                                echo '<td datta-dpto="">'.$departamentos[$keyDpto]['localidad'].'</td>';*/
                                echo '<td>'.$est['provincia'].'</td>';
                                echo '<td>'.$est['localidad'].'</td>';
                                echo '<td>'.$est['establelatitud'].'</td>';
                                echo '<td>'.$est['establelongitud'].'</td>';
                              echo '</tr>';
                            }
                          } ?>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div><!-- /.panel -->

                <div class="panel panel-default">
                  <div class="panel-heading heading-actividad" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                      <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" class="btn-block">
                        Actividad <i class="fa fa-angle-right"></i>
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                      
                      <div class="row">
                        <div class="col-xs-12">
                          <div class="alert alert-danger alert-dismissable" id="errorAddActividad" style="display: none">
                            <h4><i class="icon fa fa-warning"></i> Error!</h4>
                            Revise que todos los campos obligatorios esten seleccionados
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="actividad">Actividad *</label>
                            <select class="form-control" id="actividad">
                              <option value='-1'>Seleccione la actividad...</option>
                              <?php foreach ($actividad as $act) {
                                # code...
                                echo "<option value=".$act['actividadid']." title=".$act['descripciongeneral']." >".$act['descripcion']."</option>";
                              }
                              ?>
                            </select>
                          </div>
                        </div><!-- /.row -->
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="rubro">Rubro *</label>
                            <input type="text" class="form-control" id="rubro" value="">
                          </div>
                        </div>
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <label for="convenio">Convenio *</label>
                            <input type="text" class="form-control" id="convenio" value="">
                          </div>
                        </div>
                        <div class="col-xs-12 col-md-3">
                          <div class="form-group">
                            <br>
                            <button type="button" class="btn btn-primary pull-right" id="add-actividad">Agregar Actividad</button>
                          </div>
                        </div>
                      </div><!-- /.row -->
                      <hr>
                      <table id="tbl-actividad" class="table table-bordered table-hover">
                        <thead>
                          <tr>
                            <th>Acción</th>
                            <th>Actividad</th>
                            <th>Rubro</th>
                            <th>Convenio Colectivo Ley</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php if(is_array($actividadE )) {
                            foreach( (array)$actividadE  as $actE )
                            {
                              $id    =$actE['detaactivid'];
                              $actId =$actE['actividadid'];
                              echo '<tr id="'.$id.'" class="'.$id.'" >';
                                echo '<td>';
                                if (strpos($permission,'Add') !== false) {
                                  echo '<i class="fa fa-fw fa-pencil text-light-blue btnEditActividad" style="cursor: pointer; margin-left: 15px;" data-actividadid="'.$actId.'" data-idactividad="'.$id.'"></i>';
                                }
                                if (strpos($permission,'Del') !== false) {
                                  echo '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteActividad" style="cursor: pointer; margin-left: 15px;" data-idactividad="'.$id.'"></i>';
                                }
                                echo '</td>';
                                echo '<td>'.$actE['descripcion'].'</td>';
                                echo '<td>'.$actE['detaactivrubro'].'</td>';
                                echo '<td>'.$actE['detaactivconvenio'].'</td>';
                              echo '</tr>';
                            }
                          } ?>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div><!-- /.panel -->
              </div>

              <div class="row">
                <div class="col-xs-12 col-md-6">
                  <div class="form-group">
                    <label for="liquidacion">Sistema de Liquidación *</label>
                    <select class="form-control" id="liquidacion">
                      <option value='-1'>Seleccione el sistema de liquidación...</option>
                      <?php foreach ($liquidacion as $liquida) {
                      	# code...
                      	echo "<option value=".$liquida['sisliquiid']."  
                        ".($liquida['sisliquiid'] == $empleador[0]['empleasliquiid'] ? 'selected' : '')."
                        >".$liquida['descripcion']."</option>";
                      }
                      ?>
                    </select>
                  </div>
                </div>
              </div><!-- /.row -->

              <div class="row">
                <div class="col-xs-12 col-md-6">
                  <div class="form-group">
                    <label for="personal-masculino">Personal Masculino</label>
                    <input type="text" class="form-control" id="personal-masculino" value="<?php echo $empleador[0]['empleapmasc'];?>">
                  </div>
                </div>
                <div class="col-xs-12 col-md-6">
                  <div class="form-group">
                    <label for="personal-femenino">Personal Femenino</label>
                    <input type="text" class="form-control" id="personal-femenino" value="<?php echo $empleador[0]['empleapfem'];?>">
                  </div>
                </div>
              </div><!-- /.row -->
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_2">
              <div class="row">
                <div class="col-xs-12">
                  <div class="alert alert-danger alert-dismissable" id="errorAddLibro" style="display: none">
                    <h4><i class="icon fa fa-warning"></i> Error!</h4>
                    Revise que todos los campos obligatorios esten seleccionados
                  </div>
                </div>
              </div>
              <div class="row">
              	<div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label for="tomo">Tomo</label>
                    <input type="text" class="form-control" placeholder="" id="tomo" value="">
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                    <label for="fecha-tomo">Fecha de entrega</label>
                    <input type="text" class="form-control" id="fecha-tomo" value="">
                  </div>
                </div>
                <div class="col-xs-12 col-md-4">
                  <div class="form-group">
                  	<br>
                    <button type="button" class="btn btn-primary pull-right" id="add-libro">Agregar Libro</button>
                  </div>
                </div>
              </div><!-- /.row -->
              <hr>
              <table id="tbl-libros" class="table table-bordered table-hover">
                <thead>
                  <tr>
                  	<th>Acción</th>
                    <th>Tomo</th>
                    <th>Fecha de Entrega</th>
                  </tr>
                </thead>
                <tbody>
    							<?php if(is_array($libros )) {
                    foreach( (array)$libros as $lib )
                    {
                      $id=$lib['libroid'];
                      echo '<tr id="'.$id.'" class="'.$id.'" >';
                        echo '<td>';
                          echo '<i class="fa fa-fw fa-pencil text-light-blue btnEditLibro" style="cursor: pointer; margin-left: 15px;" data-libroid="'.$id.'"></i>';
                          echo '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteLibro" style="cursor: pointer; margin-left: 15px;" data-libroid="'.$id.'"></i>';
                        echo '</td>';
                        echo '<td>'.$lib['librotomo'].'</td>';
                        echo '<td>'.$lib['librofechaentrega'].'</td>';
                      echo '</tr>';
                    }
                  } ?>
                </tbody>
              </table>
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_3">
              <table id="tbl-nota" class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Acción</th>
                    <th>Id Nota</th>
                    <th>Fecha</th>
                    <th style="display:none">Observacion original</th>
                    <th>Observación</th>
                    <th>Imagen</th>
                  </tr>
                </thead>
                <tbody>
                  <?php if(is_array($notas )) {
                    foreach( (array)$notas as $nota )
                    {
                      $id=$nota['notid'];
                      echo '<tr id="'.$id.'">';
                        echo '<td>';
                        if (strpos($permission,'Add') !== false) {
                          echo '<i class="fa fa-fw fa-pencil text-light-blue btnEditNota" style="cursor: pointer; margin-left: 15px;" data-notaid="'.$id.'"></i>';
                        }
                        if (strpos($permission,'Del') !== false) {
                          echo '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteNota" style="cursor: pointer; margin-left: 15px;" data-notaid="'.$id.'"></i>';
                        }
                        echo '</td>';
                        echo '<td>'.$nota['notid'].'</td>';
                        echo '<td>'.$nota['fecha'].'</td>';
                        echo '<td style="display:none">'.$nota['observacion'].'</td>';
                        $observacion = substr( strip_tags( $nota['observacion'], ''), 0, 200);
                        if(strlen($observacion) == 200) { $observacion = $observacion."..."; }
                        echo '<td>'.$observacion.'</td>';
                        echo '<td><a href="#" class="pop"><img style="width: 20px; height: 20px;" src="'.base_url().'assets/notas/'.$nota['imagen'].'"></a></td>';
                      echo '</tr>';
                    }
                  } ?>
                </tbody>
              </table>
            </div><!-- /.tab-pane -->
          </div><!-- /.tab-content -->
        </div>

        </div><!-- /.box-body -->
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="btnVolver">Volver al listado</button>
          <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
        </div><!-- box-footer -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<script>
  // formateo texto para mostrar en tabla
  function text_en_tabla(content) {
    //filtro tags html
    var fragmento   = document.createDocumentFragment();
    var elementoDiv = document.createElement('div');
    fragmento.appendChild(elementoDiv);
    elementoDiv.innerHTML = content;
    var cadena = fragmento.firstChild.innerText;
    // elimino espacio al inicio y final
    cadena = cadena.trim();
    // recorto texto a 200 caracteres
    cadena = cadena.substring(0,200);
    //agrego puntos suspensivos
    if(cadena.length == 200) {
      cadena = cadena + "...";
    }
    return cadena;
  }

  // formato de cuit 
  $('#cuit').inputmask({
    mask: '99-99999999-9'
  })
  // cargo plugin DateTimePicker
  $('#fecha, #fecha-tomo, #libroFecha').datetimepicker({
    format: 'YYYY-MM-DD H:mm:ss',
    locale: 'es',
  });



  /***   EMPLEADOR   ***/

  // Selecciono el tipo de empleador
  tipo = '<?php echo $empleador[0]["empleatipo"]; ?>';
  $("input[name='tipoEmpleador'][value='"+tipo+"']").prop('checked', true);

  // trae departamentos al seleccionar la provincia 
  $("#provincias").on("change", function() {
    id_provincia = $(this).val();
    $("#departamentos").removeAttr( "disabled" );
    traerDepartamentos( id_provincia );
  });
  // Trae los departamentos de la provincia 
  function traerDepartamentos( id_provincia ) {
    //console.info( 'provinciaAjax: '+ id_provincia );
    WaitingOpen('Cargando Departamentos');
    $('#departamentos').empty();
    $.ajax({
      type: 'POST',
      data: {id_provincia},
      dataType: 'json',
      url: 'index.php/Empleador/getLocalidadPorId',
      success: function(result){
        //console.info("trae los deptos correctamente, del provincia seleccionado: "+result);
        var opcion  = "<option value='-1'>Todos los departamentos</option>";
        $('#departamentos').empty();
        $('#departamentos').append(opcion);
        for(var i=0; i < result.length ; i++)
        {
          var opcion = "<option value='"+result[i]['id']+"'>" +result[i]['localidad']+ "</option>" ;
          $('#departamentos').append(opcion);
        }
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al llenar los departamentos: " + result);
        WaitingClose();
      },
    });
  }
  function traerDepartamentosEdit( id_provincia, id_departamento ) {
    console.info( id_provincia, id_departamento );
    WaitingOpen('Cargando Departamentos');
    $('#mDptos').empty();
    $.ajax({
      type: 'POST',
      data: {id_provincia},
      dataType: 'json',
      url: 'index.php/Empleador/getLocalidadPorId',
      success: function(result){
        //console.info("trae los deptos correctamente, del provincia seleccionado: "+result);
        var opcion  = "<option value='-1'>Todos los departamentos</option>";
        $('#mDptos').empty();
        $('#mDptos').append(opcion);
        for(var i=0; i < result.length ; i++)
        {
          var opcion = "<option value='"+result[i]['id']+"'>" +result[i]['localidad']+ "</option>" ;
          $('#mDptos').append(opcion);
        }
        if (id_departamento !== 'undefined') {
          //console.info( id_departamento + "-" + id_provincia  );
          $("#mDptos option[value='"+id_departamento+"']").attr("selected","selected");
        }
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al llenar los departamentos: " + result);
        WaitingClose();
      },
    });
  }

  /* volver al listado de empleadores */
  $("#btnVolver").on("click", function(e){
    WaitingOpen('Cargando Empleadores');
    $('#content').empty();
    $("#content").load( '<?php echo base_url() ?>index.php/Empleador/index/<?php echo $permission ?>' );
    WaitingClose();
  });

  /* Guarda Empleador */
  $("#btnSave").on("click", function(e){
    e.preventDefault();

    WaitingOpen('Guardando Empleador');
    
    // informacion personal 
    var empleatipo           = document.querySelector('input[name="tipoEmpleador"]:checked').value; 
    
    var cuit                 = $('#cuit').val();
    var cuitSinguiones       = cuit.split("-", 3);
    var empleacui            = cuitSinguiones[0] + cuitSinguiones[1] + cuitSinguiones[2];    
    var empleafecha          = $('#fecha').val(); 
    var empleainscrip        = $('#nro-inscripcion').val(); 
    var emplearazsoc         = $('#razon-social').val(); 
    var empleaexp            = $('#expediente').val(); 
    var empleadomicilior     = null;
    var empleadomiciliolegal = $('#domicilio-legal').val(); 
    var empleadepid          = 0;
    var emplealocid          = 0;//$('#departamentos').val(); 
    var empleaprovid         = 0;//$('#provincias').val(); 
    var empleasliquiid       = $('#liquidacion').val(); 
    var empleapmasc          = $('#personal-masculino').val(); 
    var empleapfem           = $('#personal-femenino').val(); 
    var ampleafechaalta      = getFechaHoraFormateada( new Date() ); 
    var empleaestado         = "AC";
    var empleador = { 
      'empleatipo' : empleatipo, 
      'empleafecha' : empleafecha, 
      'empleainscrip' : empleainscrip, 
      'empleaexp' : empleaexp, 
      'empleacui' : empleacui, 
      'emplearazsoc' : emplearazsoc, 
      'empleadomicilior' : empleadomicilior,
      'empleadomiciliolegal' : empleadomiciliolegal, 
      'empleadepid' : empleadepid, 
      'emplealocid' : emplealocid, 
      'empleaprovid' : empleaprovid,
      'empleasliquiid' : empleasliquiid, 
      'empleapmasc' : empleapmasc, 
      'empleapfem' : empleapfem, 
      'ampleafechaalta': empleafecha 
    };
    var idEmpleador = '<?php echo $idEmpleador ?>';
    var permission  = '<?php echo $permission ?>';
    // valido datos 
    hay_error = false;
    $('#errorEmpleador').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
  
    if ( empleacui == '') {
      $("#cuit").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleafecha == '') {
      $("#fecha").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleainscrip == '') {
      $("#nro-inscripcion").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleaexp == '') {
      $("#expediente").parent().addClass("has-error");
      hay_error = true;
    }
    if ( emplearazsoc == '') {
      $("#razon-social").parent().addClass("has-error");
      hay_error = true;
    }
    if ( empleadomiciliolegal == '') {
      $("#domicilio-legal").parent().addClass("has-error");
      hay_error = true;
    }

    if ( empleasliquiid == '-1') {
      $("#liquidacion").parent().addClass("has-error");
      hay_error = true;
    }

    if( hay_error ) {
      $('#errorEmpleador').fadeIn('slow');
      WaitingClose();
      return;
    } 
    hay_error = false;
    $('#errorEmpleador').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

    // llamada ajax 
    $.ajax({
      data: {empleador:empleador, idEmpleador:idEmpleador, permission:permission},
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/updateEmpleadorPorId',
      success: function(data){
        var url = "<?php echo base_url(); ?>index.php/Empleador/editEmpleador/<?php echo $permission; ?>/"+idEmpleador;
        //alert(url);
        $('#content').empty();
        $("#content").load(url);
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al guardar empleador: " + result);
        WaitingClose();
      },
    });
  });



  /***   ESTABLECIMIENTO   ***/
  
  // trae departamentos al seleccionar la provincia 
  $("#mProvincias").on("change", function() {
    id_provincia = $(this).val();
    traerDepartamentosEdit( id_provincia );
  });

  // Levanto Modal Editar Establecimiento 
  $(document).on("click", ".btnEditEstablecimiento", function(e){
    e.preventDefault();
    var empleadorid     = '<?php echo $idEmpleador ?>';
    var estableid       = $(this).data("estableid")
    var establecalle    = $(this).closest("tr > td:first-child").next().text();
    var establealtura   = $(this).closest("tr > td:first-child").next().next().text();
    var establepiso     = $(this).closest("tr > td:first-child").next().next().next().text();
    var establedpto     = $(this).closest("tr > td:first-child").next().next().next().next().text();
    var provincia       = $(this).closest("tr > td:first-child").next().next().next().next().next().text();
    var provid          = $(this).parent().parent().data("provid");
    var localidad       = $(this).closest("tr > td:first-child").next().next().next().next().next().next().text();
    var dptoid          = $(this).parent().parent().data("dptoid");
    var establelatitud  = $(this).closest("tr > td:first-child").next().next().next().next().next().next().next().text();
    var establelongitud = $(this).closest("tr > td:first-child").next().next().next().next().next().next().next().next().text();
    console.debug( "provid: "+provid );
    $("#mEmpleaid").val(empleadorid);
    $("#mEstableid").val(estableid);
    $("#mCalle").val(establecalle);
    $("#mAltura").val(establealtura);
    $("#mPiso").val(establepiso);
    $("#mDpto").val(establedpto);
    $("#mProvincias option[value='"+provid+"']").attr("selected","selected");
    traerDepartamentosEdit( provid, dptoid );
    //$("#mDptos option[value='"+dptoid+"']").attr("selected","selected");
    //$("#mProvincias").val(provincia);
    //$("#mDptos").val(establedpto);
    $("#mLatitud").val(establelatitud);
    $("#mLongitud").val(establelongitud);

    $('#modalEditEstablecimientos').modal('show');
  });
  // Agregar Establecimiento
  $(document).on("click", "#add-establecimiento", function(e){
    e.preventDefault();
    e.stopImmediatePropagation();
    WaitingOpen('Agregando Establecimiento');

    //var estableid       = $("#tomo").val();
    var establecalle    = $("#calle").val();
    var establealtura   = $("#altura").val();
    var establepiso     = $("#piso").val();
    var establedpto     = $("#dpto").val();
    var establelatitud  = $("#latitud").val();
    var establelongitud = $("#longitud").val();
    var provid          = $("#provincias option:selected").val();
    var dptoid          = $("#departamentos option:selected").val();
    var empleaid        = '<?php echo $idEmpleador ?>';

    // validar
    hay_error = false;
    $('#errorAddEstablec').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    //
    if ( establecalle == '') {
      $("#calle").parent().addClass("has-error");
      hay_error = true;
    }
    if ( establealtura == '') {
      $("#altura").parent().addClass("has-error");
      hay_error = true;
    }
    if ( provid == '-1') {
      $("#provincias").parent().addClass("has-error");
      hay_error = true;
    }
    if ( dptoid == null || dptoid == '-1' ) {
      $("#departamentos").parent().addClass("has-error");
      hay_error = true;
    }
    //
    if( hay_error ) {
      $('#errorAddEstablec').fadeIn('slow');
      WaitingClose();
      return;
    }
    //
    hay_error = false;
    $('#errorAddEstablec').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    
    // llamada ajax
    $.ajax({
      data: {establecalle:establecalle, establealtura:establealtura, establepiso:establepiso, establedpto:establedpto, establelatitud:establelatitud, establelongitud:establelongitud, provid:provid, dptoid:dptoid, empleaid:empleaid, empleaestado:'AC'},
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/setEstablecimiento',
      success: function(data){
        $('#tbl-establecimiento').DataTable().clear().draw();
        for(i = 0; i < data['establec'].length; i++) {
          var id              = data['establec'][i]['estableid'];
          var establecalle    = data['establec'][i]['establecalle'];
          var establealtura   = data['establec'][i]['establealtura'];
          var establepiso     = data['establec'][i]['establepiso'];
          var establedpto     = data['establec'][i]['establedpto'];
          var establelatitud  = data['establec'][i]['establelatitud'];
          var establelongitud = data['establec'][i]['establelongitud'];
          var provin          = data['establec'][i]['provincia'];
          var dptoid          = data['establec'][i]['localidad'];

          //agrego valores a la tabla
          $('#tbl-establecimiento').DataTable().row.add( [
              '<i class="fa fa-fw fa-pencil text-light-blue btnEditEstablecimiento" style="cursor: pointer; margin-left: 15px;" data-estableid="'+id+'"></i>'+
              '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteEstablecimiento" style="cursor: pointer; margin-left: 15px;" data-estableid="'+id+'"></i>',
              establecalle,
              establealtura,
              establepiso,
              establedpto,
              provin,
              dptoid,
              establelatitud,
              establelongitud
            ]
          ).draw();
        }
        //limpio formulario
        $('#calle').val('');
        $('#altura').val('');
        $('#piso').val('');
        $('#dpto').val('');
        $("#provincias").val('-1');
        $("#departamentos").val('-1');
        $('#latitud').val('');
        $('#longitud').val('');
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al agregar establecimiento: " + result);
        WaitingClose();
      },
    });
  });
  // Editar Establecimiento
  $(document).on("click", "#editEstablecimiento", function(e){
    e.preventDefault();
    WaitingOpen('Editando Establecimiento');

    var estableid       = $('#mEstableid').val();
    var establecalle    = $('#mCalle').val();
    var establealtura   = $('#mAltura').val();
    var establepiso     = $('#mPiso').val();
    var establedpto     = $('#mDpto').val();
    var establelatitud  = $('#mLatitud').val();
    var establelongitud = $('#mLongitud').val();
    var provid          = $("#mProvincias option:selected").val();
    var dptoid          = $("#mDptos option:selected").val();
    var empleaid        = $('#mEmpleaid').val();
    
    // validar
    hay_error = false;
    $('#errorEstablecimiento').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    //
    if ( establecalle == '') {
      $("#mCalle").parent().addClass("has-error");
      hay_error = true;
    }
    if ( establealtura == '') {
      $("#mAltura").parent().addClass("has-error");
      hay_error = true;
    }
    if ( provid == '-1') {
      $("#mProvincias").parent().addClass("has-error");
      hay_error = true;
    }
    if ( dptoid == null || dptoid == '-1' ) {
      $("#mDptos").parent().addClass("has-error");
      hay_error = true;
    }
    //
    if( hay_error ) {
      $('#errorEstablecimiento').fadeIn('slow');
      WaitingClose();
      return;
    }
    //
    hay_error = false;
    $('#errorEstablecimiento').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    
    // llamada ajax
    $.ajax({
      data: {estableid:estableid, establecalle:establecalle, establealtura:establealtura, establepiso:establepiso, establedpto:establedpto, establelatitud:establelatitud, establelongitud:establelongitud, provid:provid, dptoid:dptoid, empleaid:empleaid},
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/updateEstablecimientoPorId',
      success: function(data){
        tabla = $('#tbl-establecimiento').DataTable();
        tabla.clear().draw();
        for(i = 0; i < data['establec'].length; i++) {
          var id              = data['establec'][i]['estableid'];
          var establecalle    = data['establec'][i]['establecalle'];
          var establealtura   = data['establec'][i]['establealtura'];
          var establepiso     = data['establec'][i]['establepiso'];
          var establedpto     = data['establec'][i]['establedpto'];
          var establelatitud  = data['establec'][i]['establelatitud'];
          var establelongitud = data['establec'][i]['establelongitud'];
          var provid          = data['establec'][i]['provid'];
          var provincia       = data['establec'][i]['provincia'];
          var dptoid          = data['establec'][i]['dptoid'];
          var departamento    = data['establec'][i]['localidad'];

          //agrego valores a la tabla
          tablaCompleta = tabla.row.add( [
              '<i class="fa fa-fw fa-pencil text-light-blue btnEditEstablecimiento" style="cursor: pointer; margin-left: 15px;" data-estableid="'+id+'"></i>'+
              '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteEstablecimiento" style="cursor: pointer; margin-left: 15px;" data-estableid="'+id+'"></i>',
              establecalle,
              establealtura,
              establepiso,
              establedpto,
              provincia,
              departamento,
              establelatitud,
              establelongitud,
            ] );
          tablaCompleta.node().id = id;
          tablaCompleta.nodes().to$().attr("data-provid", provid);
          tablaCompleta.nodes().to$().attr("data-dptoid", dptoid);
          tabla.draw();
        }
        $('#modalEditEstablecimientos').modal('hide');
        /* nosexq bacdrop no se va... entonces lo oculto */
        $('#modalEditEstablecimientos').on('hidden.bs.modal', function () {
          $(".modal-backdrop.in").hide();
        });
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al guardar empleador: " + result);
        WaitingClose();
      },
    });
  });
  // Elimino Establecimiento 
  $(document).on("click", ".btnDeleteEstablecimiento", function(e){
    e.preventDefault();
    WaitingOpen('Eliminando Establecimiento');
    var empleadorid = '<?php echo $idEmpleador ?>';
    var estableid   = $(this).data("estableid");
    //console.info( estableid );
    $.ajax({
      data: { estableid:estableid, empleadorid:empleadorid },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/deleteEstablecimientoPorId',
      success: function(data){
        tabla = $('#tbl-establecimiento').DataTable();
        tabla.clear().draw();
        for(i = 0; i < data['establec'].length; i++) {
          var id              = data['establec'][i]['estableid'];
          var establecalle    = data['establec'][i]['establecalle'];
          var establealtura   = data['establec'][i]['establealtura'];
          var establepiso     = data['establec'][i]['establepiso'];
          var establedpto     = data['establec'][i]['establedpto'];
          var establelatitud  = data['establec'][i]['establelatitud'];
          var establelongitud = data['establec'][i]['establelongitud'];
          var provid          = data['establec'][i]['provid'];
          var provincia       = data['establec'][i]['provincia'];
          var dptoid          = data['establec'][i]['dptoid'];
          var departamento    = data['establec'][i]['localidad'];

          //agrego valores a la tabla
          tablaCompleta = tabla.row.add( [
              '<i class="fa fa-fw fa-pencil text-light-blue btnEditEstablecimiento" style="cursor: pointer; margin-left: 15px;" data-estableid="'+id+'"></i>'+
              '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteEstablecimiento" style="cursor: pointer; margin-left: 15px;" data-estableid="'+id+'"></i>',
              establecalle,
              establealtura,
              establepiso,
              establedpto,
              provincia,
              departamento,
              establelatitud,
              establelongitud,
            ] );
          tablaCompleta.node().id = id;
          tablaCompleta.nodes().to$().attr("data-provid", provid);
          tablaCompleta.nodes().to$().attr("data-dptoid", dptoid);
          tabla.draw();
        }
        WaitingClose();
      },
      error: function(result){
        console.error("Error eliminando Empleador");
        WaitingClose();
      },
    });
  });



  /***   ACTIVIDAD   ***/

  // Levanto Modal Editar Actividad
  $(document).on("click", ".btnEditActividad", function(e){
    e.preventDefault();
    var detaactivid       = c
    var actividadid       = $(this).data("actividadid");
    var empleaid          = '<?php echo $idEmpleador ?>';
    var descripcion       = $(this).closest("tr > td:first-child").next().text();
    var detaactivrubro    = $(this).closest("tr > td:first-child").next().next().text();
    var detaactivconvenio = $(this).closest("tr > td:first-child").next().next().next().text();
    //console.info(detaactivid, actividadid, empleaid, descripcion, detaactivrubro, detaactivconvenio);

    $("#mEmpleaid").val(empleaid);
    $("#mActividad option[value='"+actividadid+"']").attr("selected","selected");
    $("#mActividadid").val(detaactivid);
    $("#mRubro").val(detaactivrubro);
    $("#mConvenio").val(detaactivconvenio);
    
    $('#modalact').modal('show');
  });
  // Agregar Actividad
  $(document).on("click", "#add-actividad", function(e){
    e.preventDefault();
    WaitingOpen('Agregando Actividad');

    var empleaid  = '<?php echo $idEmpleador ?>';
    var actividad = $("#actividad option:selected").val();
    var rubro     = $('#rubro').val();
    var convenio  = $('#convenio').val();

    // validar
    hay_error = false;
    $('#errorAddActividad').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    //
    if ( actividad == '-1') {
      $("#actividad").parent().addClass("has-error");
      hay_error = true;
    }
    if ( rubro == '') {
      $("#rubro").parent().addClass("has-error");
      hay_error = true;
    }
    if ( convenio == '') {
      $("#convenio").parent().addClass("has-error");
      hay_error = true;
    }
    //
    if( hay_error ) {
      $('#errorAddActividad').fadeIn('slow');
      WaitingClose();
      return;
    }
    //
    hay_error = false;
    $('#errorAddActividad').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

    //console.info(empleaid, actividad, rubro, convenio);
    // llamada ajax
    $.ajax({
      data: { empleaid:empleaid, actividadid:actividad, detaactivrubro:rubro, detaactivconvenio:convenio },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/setActividad',
      success: function(data){
        $('#tbl-actividad').DataTable().clear().draw();
        for(i = 0; i < data['actividad'].length; i++) {
          var detaactivid = data['actividad'][i]['detaactivid'];
          var actividadid = data['actividad'][i]['actividadid'];
          var actividad   = data['actividad'][i]['descripcion'];
          var rubro       = data['actividad'][i]['detaactivrubro'];
          var convenio    = data['actividad'][i]['detaactivconvenio'];

          $('#tbl-actividad').DataTable().row.add( [
            '<i class="fa fa-fw fa-pencil text-light-blue btnEditActividad" style="cursor: pointer; margin-left: 15px;" data-idactividad="'+detaactivid+'" data-actividadid="'+actividadid+'"></i>'+
            '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteActividad" style="cursor: pointer; margin-left: 15px;" data-idactividad="'+detaactivid+'"></i>',
            actividad,
            rubro,
            convenio]
          ).node().id = actividadid;
          $('#tbl-actividad').DataTable().draw();
        }

        //limpio formulario
        $("#actividad").val('-1');
        $('#rubro').val('');
        $('#convenio').val('');
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al agregar empleador: " + result);
        WaitingClose();
      },
    });
  });
  // Editar Actividad
  $(document).on("click", "#editActividad", function(e){
    //errorActividad
    e.preventDefault();
    WaitingOpen('Editando Actividad');

    var detaactivid       = $('#mActividadid').val();
    var empleaid          = '<?php echo $idEmpleador ?>';
    var actividadid       = $("#mActividad option:selected").val();
    var detaactivrubro    = $('#mRubro').val();
    var detaactivconvenio = $('#mConvenio').val();
    var detaactivestado   = 'AC';

    // validar
    hay_error = false;
    $('#errorActividad').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    //
    if ( actividadid == '-1') {
      $("#mActividad").parent().addClass("has-error");
      hay_error = true;
    }
    if ( detaactivrubro == '') {
      $("#mRubro").parent().addClass("has-error");
      hay_error = true;
    }
    if ( detaactivconvenio == '') {
      $("#mConvenio").parent().addClass("has-error");
      hay_error = true;
    }
    //
    if( hay_error ) {
      $('#errorActividad').fadeIn('slow');
      WaitingClose();
      return;
    }
    //
    hay_error = false;
    $('#errorActividad').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

    // ajax
    $.ajax({
      data: {detaactivid:detaactivid, empleaid:empleaid, actividadid:actividadid, detaactivrubro:detaactivrubro, detaactivconvenio:detaactivconvenio, detaactivestado:detaactivestado},
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/updateActividadPorId',
      success: function(data){
        $('#tbl-actividad').DataTable().clear().draw();
        for(i = 0; i < data['actividad'].length; i++) {
          var id_actividad = data['actividad'][i]['detaactivid'];
          var actividadid  = data['actividad'][i]['actividadid'];
          var actividad    = data['actividad'][i]['descripcion'];
          var rubro        = data['actividad'][i]['detaactivrubro'];
          var convenio     = data['actividad'][i]['detaactivconvenio'];

          $('#tbl-actividad').DataTable().row.add( [
            '<i class="fa fa-fw fa-pencil text-light-blue btnEditActividad" style="cursor: pointer; margin-left: 15px;" data-idactividad="'+id_actividad+'" data-actividadid="'+actividadid+'"></i>'+
            '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteActividad" style="cursor: pointer; margin-left: 15px;" data-idactividad="'+id_actividad+'"></i>',
            actividad,
            rubro,
            convenio,
            ] ).node().id = actividadid;
          $('#tbl-actividad').DataTable().draw();
        }

        $('#modalact').modal('hide');
        // nosexq bacdrop no se va... entonces lo oculto 
        $('#modalact').on('hidden.bs.modal', function () {
          $(".modal-backdrop.in").hide();
        });
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al guardar empleador: " + result);
        WaitingClose();
      },
    });
  });
  // Elimino Actividad 
  $(document).on("click", ".btnDeleteActividad", function(e){
    e.preventDefault();
    WaitingOpen('Eliminando Actividad');

    var empleadorid = '<?php echo $idEmpleador ?>';
    var detaactivid = $(this).data("idactividad");
    //console.info( detaactivid, empleadorid );

    $.ajax({
      data: { detaactivid:detaactivid, empleadorid:empleadorid },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/deleteActividadPorId',
      success: function(data){
        $('#tbl-actividad').DataTable().clear().draw();
        for(i = 0; i < data['actividad'].length; i++) {
          var actividadid  = data['actividad'][i]['actividadid'];
          var id_actividad = data['actividad'][i]['detaactivid'];
          var actividad    = data['actividad'][i]['descripcion'];
          var rubro        = data['actividad'][i]['detaactivrubro'];
          var convenio     = data['actividad'][i]['detaactivconvenio'];
          //agrego valores a la tabla
          $('#tbl-actividad').DataTable().row.add( [
              '<i class="fa fa-fw fa-pencil text-light-blue btnEditActividad" style="cursor: pointer; margin-left: 15px;" data-idactividad="'+id_actividad+'" data-actividadid="'+actividadid+'"></i>'+
              '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteActividad" style="cursor: pointer; margin-left: 15px;" data-idactividad="'+id_actividad+'"></i>',
              actividad,
              rubro,
              convenio
            ] ).node().id = id_actividad;
          $('#tbl-actividad').DataTable().draw();

          //limpio formulario
          $("#actividad").val('-1');
          $('#rubro').val('');
          $('#convenio').val('');
        }
        WaitingClose();
      },
      error: function(result){
        //console.error("Error eliminando Empleador", result);
        WaitingClose();
      },
    });
  });



  /***   LIBRO   ***/

  // Levanto Modal Editar Libro 
  $(document).on("click", ".btnEditLibro", function(e){
    e.preventDefault();
    var empleadorid = '<?php echo $idEmpleador ?>';
    var libroid    = $(this).data("libroid");
    var libroTomo  = $(this).closest("tr > td:first-child").next().text();
    var libroFecha = $(this).closest("tr > td:first-child").next().next().text();
    console.debug( libroid, libroFecha, libroTomo );
    $("#libroId").val(libroid);
    $("#libroFecha").val(libroFecha);
    $("#libroTomo").val(libroTomo);
    $('#modalEditLibros').modal('show');
  });
  // Agregar Libro
  $(document).on("click", "#add-libro", function(e){
    e.preventDefault();
    e.stopImmediatePropagation();
    WaitingOpen('Agregando Libro');

    var empleadorid = '<?php echo $idEmpleador ?>';
    var libroFecha  = $("#fecha-tomo").val();
    var libroTomo   = $("#tomo").val();

    // validar
    hay_error = false;
    $('#errorAddLibro').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    //
    if ( libroFecha == '') {
      $("#fecha-tomo").parent().addClass("has-error");
      hay_error = true;
    }
    if ( libroTomo == '') {
      $("#tomo").parent().addClass("has-error");
      hay_error = true;
    }
    //
    if( hay_error ) {
      $('#errorAddLibro').fadeIn('slow');
      WaitingClose();
      return;
    }
    //
    hay_error = false;
    $('#errorAddLibro').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

    // llamada ajax
    $.ajax({
      data: {librofechaentrega:libroFecha, librotomo:libroTomo, empleaid:empleadorid, libroestado:'AC'},
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/setLibro',
      success: function(data){
        var idEmpleador = '<?php echo $idEmpleador ?>';
        var url = "<?php echo base_url(); ?>index.php/Empleador/editEmpleador/<?php echo $permission; ?>/"+idEmpleador;
        //alert(url);
        $('#content').empty();
        $("#content").load(url,function(result){      
          $('.nav-tabs li.active, .tab-pane.active').removeClass("active");
          $('.nav-tabs li:first-child').next().addClass("active");
          $('#tab_2').addClass("active");
          $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
        });
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al agregar empleador: " + result);
        WaitingClose();
      },
    });
  });
  // Edita Libro
  $(document).on("click", "#editLibro", function(e){
    e.preventDefault();
    WaitingOpen('Editando Libro');

    var empleadorid = '<?php echo $idEmpleador ?>';
    var libroid     = $("#libroId").val();
    var libroFecha  = $("#libroFecha").val();
    var libroTomo   = $("#libroTomo").val();
    
    // validar
    hay_error = false;
    $('#errorLibro').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");
    //
    if ( libroFecha == '') {
      $("#libroFecha").parent().addClass("has-error");
      hay_error = true;
    }
    if ( libroTomo == '') {
      $("#libroTomo").parent().addClass("has-error");
      hay_error = true;
    }
    //
    if( hay_error ) {
      $('#errorLibro').fadeIn('slow');
      WaitingClose();
      return;
    }
    //
    hay_error = false;
    $('#error').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error").css("color","inherit");

    // llamada ajax 
    $.ajax({
      data: {libroid:libroid, librofechaentrega:libroFecha, librotomo:libroTomo, empleaid:empleadorid, libroestado:'AC'},
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/updateLibroPorId',
      success: function(data){
        $('#modalEditLibros').modal('toggle');
        /* nosexq bacdrop no se va... entonces lo oculto */
        $('#modalEditLibros').on('hidden.bs.modal', function () {
          $(".modal-backdrop.in").hide();
        });
        var idEmpleador = data['libros']['0']['empleaid'];
        var url = "<?php echo base_url(); ?>index.php/Empleador/editEmpleador/<?php echo $permission; ?>/"+idEmpleador;
        //alert(url);
        $('#content').empty();
        $("#content").load(url,function(result){      
          //$("#tab_2").tab('show');
          $('.nav-tabs li.active, .tab-pane.active').removeClass("active");
          $('.nav-tabs li:first-child').next().addClass("active");
          $('#tab_2').addClass("active");
          $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
        });
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al guardar libro: " + result);
        WaitingClose();
      },
    });
  });
  // Elimino Libro 
  $(document).on("click", ".btnDeleteLibro", function(e){
    e.preventDefault();
    WaitingOpen('Eliminando Libro');
    var empleadorid = '<?php echo $idEmpleador ?>';
    var libroid = $(this).data("libroid");
    $.ajax({
      data: { libroid : libroid, empleadorid: empleadorid },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/deleteLibroPorId',
      success: function(data){
        $('#tbl-libros').DataTable().clear().draw();
        for(i = 0; i < data['libros'].length; i++) {
          var librofechaentrega = data['libros'][i]['librofechaentrega'];
          var librotomo         = data['libros'][i]['librotomo'];
          var id                = data['libros'][i]['libroid'];
          //agrego valores a la tabla
          $('#tbl-libros').DataTable().row.add( [
              '<i class="fa fa-fw fa-pencil text-light-blue btnEditLibro" style="cursor: pointer; margin-left: 15px;" data-libroid="'+id+'"></i>'+
              '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteLibro" style="cursor: pointer; margin-left: 15px;" data-libroid="'+id+'"></i>',
              librotomo,
              librofechaentrega,
            ] ).node().id = id;
          $('#tbl-libros').DataTable().draw();
        }
        WaitingClose();
      },
      error: function(result){
        console.error("Error eliminando Empleador");
        WaitingClose();
      },
    });
  });



  /***   NOTAS   ***/

  // Levanto Modal Editar Notas 
  $(document).on("click", ".btnEditNota", function(e){
    e.preventDefault();
    //console.debug("click modal");
    var empleaid = '<?php echo $idEmpleador ?>';
    var notid    = $(this).data("notaid");
    var fecha    = $(this).closest("tr > td:first-child").next().next().text();
    var observac = $(this).closest("tr > td:first-child").next().next().next().text();
    var img      = $(this).closest("tr > td:first-child").next().next().next().next().next().find("img").attr("src");
    console.debug( empleaid, notid, fecha, observac, img );

    $("#mEmpleadorId").val(empleaid);
    $("#mNotaId").val(notid);
    $("#mFecha").val(fecha);
    $("#mObservacion").text(observac);
    $("#mImg").attr("src", img);

    $('#modalEditNotas').modal('show');
  });
  // Edita nota
  $("#frmNotaModal").on("submit", function(e){
    e.preventDefault();
    WaitingOpen('Editando Nota');

    var empleaid = $("#mEmpleadorId").val();
    var notid    = $("#mNotaId").val();
    var fecha    = $("#mFecha").val();
    var observac = $("#mObservacion").text();
    var img      = '';
    
    //valido datos
    hay_error = false;
    max_char = false;
    $(".list-errors").empty();
    $('#errorNotaModal').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error");

    if ( observac.length > 21844 ) { 
      //maximos caracteres permitidos en un campo text con codificacion utf-8: 21,844 caracteres
      // https://stackoverflow.com/questions/4420164/how-much-utf-8-text-fits-in-a-mysql-text-field
      $("#mObservacion").parent().addClass("has-error");
      max_char = true;
    }

    if ( fecha == '') {
      $("#mFecha").parent().addClass("has-error");
      hay_error = true;
    }

    if( hay_error ) {
      $('#errorNotaModal').fadeIn('slow');
      $(".list-errors").html('Complete los campos obligatorios');
      WaitingClose();
      if( max_char ) {
        $('#errorNotaModal').fadeIn('slow');
        $(".list-errors").append('<br>El texto debe tener un máximo de 21844 caracteres');
        WaitingClose();
        return;
      }
      return;
    }
    if( max_char ) {
      $('#errorNotaModal').fadeIn('slow');
      $(".list-errors").html('El texto debe tener un máximo de 21844 caracteres');
      WaitingClose();
      return;
    } 
    hay_error = false;
    max_char = false;
    $('#errorNotaModal').fadeOut('slow');
    $('[class*="has-error"]').removeClass("has-error");
    
    //Preparo los datos para enviarlos al controlador
    var formData = new FormData(document.getElementById("frmNotaModal"));
    formData.append('empleaid', empleaid);
    formData.append('notid', notid); 
    formData.append('fecha', fecha);
    formData.append('observacion', observac);

    /*/ Display the key/value pairs
    for (var pair of formData.entries()) {
        console.log(pair[0]+ ', ' + pair[1]);
    }//*/
    /*/ Display the values
    for (var value of formData.values()) {
       console.log(value);
    }//*/

    //ajax
    $.ajax({
      cache: false,
      contentType: false,
      data: formData,
      dataType: "html",
      processData: false,
      type: "POST",
      url: "index.php/Empleador/editarNota",
      success: function(data){
        console.debug(data);
        data = JSON.parse(data);
        tabla = $('#tbl-nota').DataTable();
        tabla.clear().draw();
        for(i = 0; i < data['notas'].length; i++) {
          var notid       = data['notas'][i]['notid'];
          var fecha       = data['notas'][i]['fecha'];
          var observacion = data['notas'][i]['observacion'];
          observaciontxt  = text_en_tabla(observacion);
          var imagen      = data['notas'][i]['imagen'];
          console.info(observacion);
          //agrego valores a la tabla
          tablaCompleta = tabla.row.add( [
            '<i class="fa fa-fw fa-pencil text-light-blue btnEditNota" style="cursor: pointer; margin-left: 15px;" data-notaid="'+notid+'"></i>'+
            '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteNota" style="cursor: pointer; margin-left: 15px;" data-notaid="'+notid+'"></i>',
            notid,
            fecha,
            observacion,
            observaciontxt,
            '<a href="#" class="pop"><img style="width: 20px; height: 20px;" src="<?php echo base_url() ?>assets/notas/'+imagen+'"></a>',
            ] );
          tablaCompleta.node().id = notid;
          var nodes = tabla.column(3).nodes();
          $(nodes).addClass('hidden');
          tabla.draw();
        }

        $('#modalEditNotas').modal('hide');
        // nosexq bacdrop no se va... entonces lo oculto 
        $('#modalEditNotas').on('hidden.bs.modal', function () {
          $(".modal-backdrop.in").hide();
        });
        WaitingClose();
      },
      error: function(result){
        console.error("Error al editar nota");
        WaitingClose();
      },
    });
  });
  // Elimino nota 
  $(document).on("click", ".btnDeleteNota", function(e){
    e.preventDefault();
    WaitingOpen('Eliminando Nota');
    var empleadorid = '<?php echo $idEmpleador ?>';
    var notid       = $(this).data("notaid");
    console.info( empleadorid, notid);
    $.ajax({
      data: { notid:notid, empleadorid:empleadorid },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Empleador/deleteNotaPorId',
      success: function(data){
        $('#tbl-nota').DataTable().clear().draw();
        for(i = 0; i < data['notas'].length; i++) {
          var notid      = data['notas'][i]['notid'];
          var fecha      = data['notas'][i]['fecha'];
          var resolucion = data['notas'][i]['observacion'];
          var imagen     = data['notas'][i]['imagen'];
          //agrego valores a la tabla
          $('#tbl-nota').DataTable().row.add( [
            '<i class="fa fa-fw fa-pencil text-light-blue btnEditNota" style="cursor: pointer; margin-left: 15px;" data-notaid="'+notid+'"></i>'+
            '<i class="fa fa-fw fa-times-circle text-light-blue btnDeleteNota" style="cursor: pointer; margin-left: 15px;" data-notaid="'+notid+'"></i>',
            notid,
            fecha,
            resolucion,
            '<a href="#" class="pop"><img style="width: 20px; height: 20px;" src="<?php echo base_url() ?>assets/notas/'+imagen+'""></a>',
            ] ).node().id = notid;
          $('#tbl-nota').DataTable().draw();
        }
        WaitingClose();
      },
      error: function(result){
        console.error("Error eliminando Nota");
        WaitingClose();
      },
    });
  });




  /***   DATATABLES   ***/

  // ajusto el anocho de la cabecera de las tablas dentro de Tabs
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // https://datatables.net/reference/api/columns.adjust() states that this function is trigger on window resize
      $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
  });

  // cambio icono al abrir/cerrar collapse establecimientos
  $('#collapseOne').on('shown.bs.collapse', function () {
    // y ajusto el anocho de la cabecera
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
    $('#headingOne .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  $('#collapseOne').on('hidden.bs.collapse', function () {
    $('#headingOne .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  // cambio icono al abrir/cerrar collapse Actividad
  $('#collapseTwo').on('shown.bs.collapse', function () {
    // y ajusto el anocho de la cabecera
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
    $('#headingTwo .fa').toggleClass('fa-angle-right fa-angle-down');
  })
  $('#collapseTwo').on('hidden.bs.collapse', function () {
    $('#headingTwo .fa').toggleClass('fa-angle-right fa-angle-down');
  })

  // cargo plugin DataTable (debe ir al final de los script) 
  $("#tbl-establecimiento").DataTable({
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
  $("#tbl-actividad").DataTable({
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
  $("#tbl-libros").DataTable({
    "createdRow" :function( row, data, dataIndex ){
        $( row ).find('td:eq(1)').attr('data-name', 'librofechaentrega');
        $( row ).find('td:eq(2)').attr('data-name', 'librotomo');
      },
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
  $("#tbl-nota").DataTable({
      "aLengthMenu": [ 10, 25, 50, 100 ],
      "autoWidth": true,
      "columnDefs": [ {
          "targets": [ 0, 4 ], //no busco en acciones
          "searchable": false
      },
      {
          "targets": [ 0, 4 ], //no ordena columna 0
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

<!-- Modal Editar Libro -->
<div class="modal" id="modalEditLibros" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Editar Libro</h4>
      </div><!-- /.modal-header -->
      <div class="modal-body">
        
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorLibro" style="display: none">
              <h4><i class="icon fa fa-warning"></i> Error!</h4>
              Revise que todos los campos obligatorios esten seleccionados
            </div>
          </div>
        </div>

        <input class="form-control" id="libroId" value="" type="hidden">
        <div class="row">
          <div class="col-xs-12 col-md-6">
            <div class="form-group">
              <label for="libroTomo">Tomo</label>
              <input class="form-control" placeholder="" id="libroTomo" value="" type="text">
            </div>
          </div>
          <div class="col-xs-12 col-md-6">
            <div class="form-group">
              <label for="libroFecha">Fecha de entrega</label>
              <input class="form-control" id="libroFecha" value="" type="text">
            </div>
          </div>
        </div>

      </div><!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="editLibro">Editar Libro</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal Editar Establecimiento -->
<div class="modal" id="modalEditEstablecimientos" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Editar Establecimiento</h4>
      </div><!-- /.modal-header -->
      <div class="modal-body">
        
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorEstablecimiento" style="display: none">
              <h4><i class="icon fa fa-warning"></i> Error!</h4>
              Revise que todos los campos obligatorios esten seleccionados
            </div>
          </div>
        </div>
        
        <input type="hidden" id="mEmpleaid" value="">
        <input type="hidden" id="mEstableid" value="">
        <div class="row">
          <div class="col-xs-12 col-md-3">
            <div class="form-group">
              <label for="mCalle">Calle *</label>
              <input type="text" class="form-control" id="mCalle" value="">
            </div>
          </div><!-- /.row -->
          <div class="col-xs-12 col-md-3">
            <div class="form-group">
              <label for="mAltura">Altura *</label>
              <input type="text" class="form-control" id="mAltura" value="">
            </div>
          </div>
          <div class="col-xs-12 col-md-3">
            <div class="form-group">
              <label for="mPiso">Piso</label>
              <input type="text" class="form-control" id="mPiso" value="">
            </div>
          </div>
          <div class="col-xs-12 col-md-3">
            <div class="form-group">
              <label for="mDpto">Dpto</label>
              <input type="text" class="form-control" id="mDpto" value="">
            </div>
          </div>

          <div class="col-xs-12 col-md-6">
            <div class="form-group">
              <label for="mProvincias">Provincia *</label>
              <select class="form-control" id="mProvincias">
                <option value='-1'>Seleccione la provincia...</option>
                <?php foreach ($provincias as $provincia) {
                  # code... /*if($provincia['id'] == $provinciaId) echo 'selected';*/
                  echo "<option value=".$provincia['id'].">".$provincia['provincia']."</option>";
                } ?>
              </select>
            </div>
          </div>
          <div class="col-xs-12 col-md-6">
            <div class="form-group">
              <label for="mDptos">Departamento *</label>
              <select class="form-control" id="mDptos">
                <!-- -->
              </select>
            </div>
          </div>

          <div class="col-xs-12 col-md-3">
            <div class="form-group">
              <label for="mLatitud">Latitud</label>
              <input type="text" class="form-control" id="mLatitud" value="">
            </div>
          </div>
          <div class="col-xs-12 col-md-3">
            <div class="form-group">
              <label for="mLongitud">Longitud</label>
              <input type="text" class="form-control" id="mLongitud" value="">
            </div>
          </div>
        </div>
      </div><!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="editEstablecimiento">Editar establecimiento</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal Editar Establecimiento -->
<div class="modal fade" id="modalact" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">Editar Establecimiento</h4>
      </div><!-- /.modal-header -->
      <div class="modal-body">
        
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorActividad" style="display: none">
              <h4><i class="icon fa fa-warning"></i> Error!</h4>
              Revise que todos los campos obligatorios esten seleccionados
            </div>
          </div>
        </div>
        
        <input type="hidden" id="mEmpleaid" value="">
        <input type="hidden" id="mActividadid" value="">
        <div class="row">
          <div class="col-xs-12 col-md-4">
            <div class="form-group">
              <label for="mActividad">Actividad *</label>
              <select class="form-control" id="mActividad">
                <option value='-1'>Seleccione la actividad...</option>
                <?php foreach ($actividad as $act) {
                  # code...
                  echo "<option value=".$act['actividadid']." title=".$act['descripciongeneral']." >".$act['descripcion']."</option>";
                }
                ?>
              </select>
            </div>
          </div><!-- /.row -->
          <div class="col-xs-12 col-md-4">
            <div class="form-group">
              <label for="mRubro">Rubro *</label>
              <input type="text" class="form-control" id="mRubro" value="">
            </div>
          </div>
          <div class="col-xs-12 col-md-4">
            <div class="form-group">
              <label for="mConvenio">Convenio *</label>
              <input type="text" class="form-control" id="mConvenio" value="">
            </div>
          </div>
        </div><!-- /.row -->
      </div><!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="editActividad">Editar establecimiento</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal Notas-->
<div class="modal fade" id="modalEditNotas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <form method="POST" id="frmNotaModal" enctype="multipart/form-data" accept-charset="utf-8">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel"><span id="modalAction"></span>Editar Notas</h4>
        </div><!-- /.modal-header -->
        <div class="modal-body" id="modalBodyUsr">

          <div class="alert alert-danger alert-dismissable" id="errorNotaModal" style="display: none">
            <h4><i class="icon fa fa-warning"></i> Error!</h4>
            <span class="list-errors"></span>
          </div>

          <input type="hidden" name="mEmpleadorId" id="mEmpleadorId" value="">
          <input type="hidden" name="mNotaId" id="mNotaId" value="">
          <div class="row">
            <div class="col-xs-12 col-md-6">
              <div class="form-group">
                <label for="mFecha">Fecha de entrega</label>
                <input type="date" name="mFecha" class="form-control" id="mFecha" value="">
              </div>
            </div>
            <div class="col-xs-12">
              <div class="form-group">
                <label for="mObservacion">Observación</label>
                <textarea name="mObservacion" class="form-control" id="mObservacion"></textarea>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="fileinput fileinput-exists" data-provides="fileinput" data-name="myimage">
                <input type="hidden" name="myimage" value="1" />
                <div class="fileinput-new thumbnail" style="width: 150px; height: 150px; line-height: 20px;">
                  <img src="<?php echo base_url() .'assets/notas/default.png' ?>" />
                </div>
                <div class="fileinput-preview fileupload-exists thumbnail" style="max-width: 400px; max-height: 400px; line-height: 20px;">
                  <img id="mImg" src="" />
                </div>
                <div>
                  <span class="btn btn-default btn-file">
                    <span class="fileinput-new">Seleccionar imagen</span>
                    <span class="fileinput-exists">Cambiar</span>
                    <input type="file" />
                  </span>
                  <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Borrar</a>
                </div>
              </div><!-- END .fileinput -->
            </div>
          </div><!-- /.row -->

        </div><!-- /.modal-body -->
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary" id="btnNotasSave">Guardar</button>
        </div><!-- /.modal-footer -->
      
      </form>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
