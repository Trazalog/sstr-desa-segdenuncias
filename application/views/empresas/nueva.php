<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Empleadores</h3>
        </div><!-- /.box-header -->
        <div class="box-body">

          <div class="row">
            <div class="col-xs-12 col-md-4">
              <div class="checkbox">
                <label>
                  <input type="checkbox"> Locales
                </label>
              </div>
            </div>
            <div class="col-xs-12 col-md-4">
              <div class="checkbox">
                <label>
                  <input type="checkbox"> Centralización
                </label>
              </div>
            </div>
            <div class="col-xs-12 col-md-4 form-inline">
              Fecha <input type="date" class="form-control" placeholder="" id="" value="">
            </div>
          </div><!-- /.row -->

          <div class="row">
            <div class="col-xs-12 col-md-4">
              <div class="form-group">
                Nº Inscripción
                <input type="text" class="form-control" placeholder="" id="" value="">
              </div>
            </div>
            <div class="col-xs-12 col-md-4">
              <div class="form-group">
                Expediente
                <input type="text" class="form-control" placeholder="" id="" value="">
              </div>
            </div>
            <div class="col-xs-12 col-md-4">
              <div class="form-group">
                CUIT
                <input type="text" class="form-control" placeholder="" id="" value="">
              </div>
            </div>
          </div><!-- /.row -->

          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                Razón Social
                <input type="text" class="form-control input-sm" placeholder="" id="" value="">
              </div>
            </div>

            <div class="col-xs-12">
              <div class="form-group">
                Domicilio Real
                <input type="text" class="form-control" placeholder="" id="" value="">
              </div>
            </div>
          </div><!-- /.row -->

          <div class="row">
            <div class="col-xs-12 col-md-6">
              <div class="form-group">
                Departamento
                <select class="form-control">
                  <option>1</option>
                  <option>2</option>
                </select>
              </div>
            </div>
            <div class="col-xs-12 col-md-6">
              <div class="form-group">
                Localidad
                <select class="form-control">
                  <option>1</option>
                  <option>2</option>
                </select>
              </div>
            </div>
          </div><!-- /.row -->

          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                Domicilio Legal
                <input type="text" class="form-control" placeholder="" id="" value="">
              </div>
            </div>
          </div><!-- /.row -->

          <div class="row">
            <div class="col-xs-12 col-md-6">
              <div class="form-group">
                Sistema de liquidación
                <select class="form-control">
                  <option>1</option>
                  <option>2</option>
                </select>
              </div>
            </div>
          </div><!-- /.row -->

          <div class="row">
            <div class="col-xs-12 col-md-6">
              <div class="form-group">
                Personal Masculino
                <input type="text" class="form-control" placeholder="" id="" value="">
              </div>
            </div>
            <div class="col-xs-12 col-md-6">
              <div class="form-group">
                Personal Femenino
                <input type="text" class="form-control" placeholder="" id="" value="">
              </div>
            </div>
          </div><!-- /.row -->

          <div class="row">
            <div class="col-xs-12">
              <div class="panel panel-default">
                <div class="panel-heading">Actividad</div>
                <div class="panel-body">

                  <div class="row">
                    <div class="col-xs-12 col-md-3">
                      <div class="form-group">
                        Actividad
                        <select class="form-control">
                          <option>1</option>
                          <option>2</option>
                        </select>
                      </div>
                    </div><!-- /.row -->
                    <div class="col-xs-12 col-md-3">
                      <div class="form-group">
                        Rubro
                        <input type="text" class="form-control" placeholder="" id="" value="">
                      </div>
                    </div>
                    <div class="col-xs-12 col-md-3">
                      <div class="form-group">
                        Convenio
                        <input type="text" class="form-control" placeholder="" id="" value="">
                      </div>
                    </div>
                    <div class="col-xs-12 col-md-3">
                      <div class="form-group">
                        <br>
                        <button type="button" class="btn btn-primary pull-right">Agregar Actividad</button>
                      </div>
                    </div>
                  </div>
                  <hr>
                  <table id="actividad" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>Actividad</th>
                        <th>Rubro</th>
                        <th>Convenio Colectivo Ley</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Comercial</td>
                        <td>Venta de producto de supermercado</td>
                        <td>Ley 130/75</td>
                      </tr>
                      <tr>
                        <td>Rural</td>
                        <td>Cría de ganado bobino</td>
                        <td>Ley 2679</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div><!-- /.row -->

          <div class="row">
            <div class="col-xs-12">
              <div class="panel panel-default">
                <div class="panel-heading">Libros</div>
                <div class="panel-body">

                  <div class="row">
                    <div class="col-xs-12">
                      <div class="form-group">
                        <button type="button" class="btn btn-primary">Agregar Libro</button>
                      </div>
                    </div>
                  </div><!-- /.row -->

                  <div class="row">
                    <div class="col-xs-12">
                      <table id="libros" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>Número</th>
                        <th>Fecha de Entrega</th>
                        <th>Tomo</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>01/01/2016</td>
                        <td>001</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>01/01/2017</td>
                        <td>002</td>
                      </tr>
                    </tbody>
                  </table>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div><!-- /.row -->

        </div><!-- /.box-body -->
        <div class="box-footer">
          <button type="button" class="btn btn-primary pull-right" onclick="guardar()">Guardar</button>
        </div><!-- box-footer -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<script>
$(function(){
    /* cargo plugin DataTable (debe ir al final de los script) */
    $("#actividad").DataTable({
        "aLengthMenu": [ 10, 25, 50, 100 ],
        "autoWidth": true,
        /*"columnDefs": [ {
            "targets": [ 0 ], //no busco en acciones
            "searchable": false
        },
        {
            "targets": [ 0 ], //no ordena columna 0
            "orderable": false
        } ],*/
        "info": true,
        "ordering": true,
        "order": [[0, "asc"]],
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

    $("#libros").DataTable({
        "aLengthMenu": [ 10, 25, 50, 100 ],
        "autoWidth": true,
        /*"columnDefs": [ {
            "targets": [ 0 ], //no busco en acciones
            "searchable": false
        },
        {
            "targets": [ 0 ], //no ordena columna 0
            "orderable": false
        } ],*/
        "info": true,
        "ordering": true,
        "order": [[0, "asc"]],
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
});
</script>

<!-- Modal -->
<div class="modal fade" id="modalCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Cliente</h4>
      </div>
      <div class="modal-body" id="modalBodyCustomer">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
      </div>
    </div>
  </div>
</div>