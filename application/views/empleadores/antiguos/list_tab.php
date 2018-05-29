<input type="hidden" id="permission" value="<?php echo $permission;?>">
<?php
	//dump($permission, "permission");
	//dump($provincias, "provincias");
	//dump($liquidacion, "liquidacion");
	//dump($actividad, "actividad");
	//dump($list);
?>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Empleadores</h3>
				</div><!-- /.box-header -->
				<div class="box-body">
					<?php
					if (strpos($permission,'Add') !== false) {
						echo '<div class="form-group">';
						echo '<button class="btn btn-success" id="btnAdd">Agregar</button>';
						echo '</div>';
					}
					?>
					<table id="tbl-empleadores" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Acción</th>
								<th>Nro Inscripción</th>
								<th>Fecha</th>
								<th>Expediente</th>
								<th>CUIT</th>
								<th>Razón Social</th>
								<th>Domicilio Real</th>
								<th>Provincia</th>
								<th>Departamento</th>
								<th>Domicilio Legal</th>
								<th>Liquidación</th>
								<th>Personal Masculino</th>
								<th>Personal Femenino</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach($list as $e)
							{
								$id=$e['empleaid'];
                echo '<tr id="'.$id.'" class="'.$id.'" >';
	              	echo '<td>';
	                if (strpos($permission,'Add') !== false) {
	                	echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" onclick="LoadEmpleador('.$id.',\'Edit\')"></i>';
	                }
	                if (strpos($permission,'Del') !== false) {
	                	echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" onclick="LoadEmpleador('.$id.',\'Del\')"></i>';
	                }
	                if (strpos($permission,'View') !== false) {
	                	echo '<i class="fa fa-fw fa-search text-light-blue" style="cursor: pointer; margin-left: 15px;" onclick="LoadEmpleador('.$id.',\'View\')"></i>';
	                }
	                echo '</td>';
									echo '<td>'.$e['empleatipo'].'-'.$e['empleainscrip'].'</td>';
									echo '<td>'.$e['empleafecha'].'</td>';
									echo '<td>'.$e['empleaexp'].'</td>';
									echo '<td>'.$e['empleacui'].'</td>';
									echo '<td>'.$e['emplearazsoc'].'</td>';
									echo '<td>'.$e['empleadomicilior'].'</td>';
									echo '<td>'.$e['provincia'].'</td>';
									echo '<td>'.$e['localidad'].'</td>';
									echo '<td>'.$e['empleadomiciliolegal'].'</td>';
									echo '<td>'.$e['sisliquidescrip'].'</td>';
									echo '<td>'.$e['empleapmasc'].'</td>';
									echo '<td>'.$e['empleapfem'].'</td>';
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
	/* llama vista agregar proveedor*/
	$('#btnAdd').click( function(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Empleador/getDatosEmpleador/<?php echo $permission; ?>");
    WaitingClose();
  });


	/* acciones proveedor */
	var id  = 0;
  var act = '';
  function LoadEmpleador(id_, action){
		id  = id_;
		act = action;

    LoadIconAction('modalAction',action);
    WaitingOpen('Cargando Usuario');

    $.ajax({
				data: { id : id_, act: action },
				dataType: 'json',
				type: 'POST',
				url: 'index.php/Empleador/getEmpleador',
        success: function(result){
            $("#modalBodyUsr").html(result.html);
            setTimeout("$('#modalEmpleador').modal('show')",800);
            WaitingClose();
        },
        error: function(result){
        		$("#modalBodyUsr").html(result.html);
            setTimeout("$('#modalEmpleador').modal('show')",800);
            console.error("Error en getEmpleador");
            WaitingClose();
        },
    });
  }

    /* cargo plugin DataTable (debe ir al final de los script) */
  $("#tbl-empleadores").DataTable({
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
</script>

<!-- Modal -->
<div class="modal fade" id="modalEmpleador" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form method="POST" id="frmArchivo" enctype="multipart/form-data" accept-charset="utf-8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Empleador</h4>
                </div>
                <div class="modal-body" id="modalBodyUsr">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" id="btnSave" onclick="guardar()">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>