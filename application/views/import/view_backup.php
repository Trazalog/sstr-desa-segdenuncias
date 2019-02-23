<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
              <h3 class="box-title">Importar Denuncias</h3>          
            </div><!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                  <div class="col-xs-12">
                    <div class="box-body">  
                        <form enctype="multipart/form-data" class="formulario">                           
                            <input type="file" name="excel" id="excel" size="20" />
                            <input class="hidden" type="text" name="table" value="articles" /><br /><br />
                            <input class="hidden" type="text" name="fields" style="width:600px" value="" />
                            <input type="button" value="Importar" />
                        </form>
                        <br /><br />
                        <div class="alert alert-success" id="grabsuccess" role="alert" style="display: none">La planilla se ha grabado exitosamente.</div>
                        <div class="alert alert-danger" id="graberror" role="alert" style="display: none">Error! el formato del archvo a subir es incorrecto. Por favor guradelo con extension ".xsl".</div>
                    
                    </div>  
                  </div>
                </div>
                <!--div para visualizar mensajes-->
                <div class="messages"></div><br /><br />
                <!--div para visualizar en el caso de imagen-->

                <!--div para visualizar mensajes de cuit-->
                <div id ="nocuit"></div><br /><br />
                <div id ="cuitNoReg"></div><br /><br />      
                
                <!--div para visualizar mensajes de establecimientos-->
                <div id ="noestab"></div><br /><br />
                <div id ="estabNoReg"></div><br /><br />
                
                <table id="tabladetalle" class="table table-bordered table-hover" style="text-align: center">
                    <thead>
                        <th>Calle</th>
                        <th>Cuit</th>
                        <th>Motivos</th>
                        <th>fecha</th>
                    </thead>
                    <tbody>  
                    </tbody>
                </table>
            </div> 
        </div>
    </div>
   </div>         
</section>  
 
<script>
  
  $(document).ready(function(){

    //queremos que esta variable sea global
    var fileExtension = "";
    function examinar(){

        //queremos que esta variable sea global
        var fileExtension = "";
        //obtenemos un array con los datos del archivo
        var file = $("#excel")[0].files[0];
        //alert(file);
        //obtenemos el nombre del archivo
        var fileName = file.name;
        //obtenemos la extensión del archivo
        fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
        //obtenemos el tamaño del archivo
        var fileSize = file.size;
        //obtenemos el tipo de archivo image/png ejemplo
        var fileType = file.type;
        //mensaje con la información del archivo
        showMessage("<span class='info'>Archivo para subir: "+fileName+", peso total: "+fileSize+" bytes.</span>");
    }

    //al enviar el formulario
    $(':button').click(function(){
        //información del formulario
        var formData = new FormData($(".formulario")[0]);
        var message = ""; 
        //hacemos la petición ajax  
        $.ajax({
            url: 'Import/to_mysql',  
            type: 'POST',            
            data: formData,
            //necesario para subir archivos via ajax
            cache: false,
            contentType: false,
            processData: false,
            //mientras enviamos el archivo
            beforeSend: function(){
                message = $("<span class='before'>Subiendo su archivo, por favor espere...</span>");
                showMessage(message);        
            },
            //una vez finalizado correctamente
            success: function(data){
                $('#graberror').hide(100);
                $('#grabsuccess').show(800);
                $('#grabsuccess').delay(2000).hide(600);
                showMessage("");
                var datos = JSON.parse(data);
                console.log("Respuesta de guardado: ");
                //console.info(datos['inconsistencias'][0]["DESCRIPCION_x0020_PROGRAMA"]);
                console.log(" - Inconsistencias: ");
                console.info(datos);

                if (datos['inconsistencias'] == "") {                    
                    //alert("no hay inconsistencias");
                }else{
                    infoInconsistencias(datos);
                    //alert("hay incosistencias");
                }

                if (datos['noCuit'] == "") {                    
                    //alert("noCuit");
                }else{
                    infoCuit(datos);
                    //alert("hay noCuit");
                }

                if (datos['noEstabl'] == "") {                    
                    //alert("noEstabl");
                }else{
                    infoEstab(datos);
                    //alert("hay noEstabl");
                }               
                
                //console.log(data[0]["DESCRIPCION_x0020_PROGRAMA"]);
            },
            //si ha ocurrido un error
            error: function(){
                $('#graberror').show(800);
                showMessage("");
            }
        });
    });
})

    //como la utilizamos demasiadas veces, creamos una función para 
    //evitar repetición de código
    function showMessage(message){
        $(".messages").html("").show();
        $(".messages").html(message);
    }

    function infoInconsistencias(datos){

        $('tr.celdas').remove();
        for (var i = 0; i < datos.inconsistencias.length; i++) {            
            var tr = "<tr class='celdas'>"+
            "<td>"+datos['inconsistencias'][i]["CALLE"]+"</td>"+
            "<td>"+datos['inconsistencias'][i]["CUIT"]+"</td>"+
            "<td>"+datos['inconsistencias'][i]["MOTIVOS_x0020_INFRINGIDOS"]+"</td>"+ 
            "<td>"+datos['inconsistencias'][i]["FECHA_x0020_DENUNCIA"]+"</td>"+
            "</tr>";
            $('#tabladetalle tbody').append(tr);
        }
    }

    function infoCuit(datos){
        mens = $("<span class='nohaycuit'>Hay CUIT que no estan registrados en el Sistema...</span>");
        $("#nocuit").html("").show();
        $("#nocuit").html(mens);
        var cuit = 0;
        for (var i = 0 ; i < datos['noCuit'].length ; i++) {
            cuit = parseInt(datos['noCuit'][i]);
            mensNocuit = "<p>" + cuit + "</p>" 
            $('#cuitNoReg').append(mensNocuit);
        } 
    }

    function infoEstab(datos){
        // los establecimientos con las sig calles no se corresponden con empleadores inscriptos
        mensest = $("<span class='nohaycuit'>Hay Estabecimientos que no estan registrados en el Sistema...</span>");
        $("#noestab").html("").show();
        $("#noestab").html(mensest);
        var estab = 0;
        for (var i = 0 ; i < datos['noEstabl'].length ; i++) {
            estab = parseInt(datos['noEstabl'][i]);
            mensNoEstab = "<p>" + estab + "</p>" 
            $('#estabNoReg').append(mensNoEstab);
        } 
    }

    $('#tabladetalle').DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "language": {
              "lengthMenu": "Ver _MENU_ filas por página",
              "zeroRecords": "No hay registros",
              "info": "Mostrando pagina _PAGE_ de _PAGES_",
              "infoEmpty": "No hay registros disponibles",
              "infoFiltered": "(filtrando de un total de _MAX_ registros)",
              "sSearch": "Buscar:  ",
              "oPaginate": {
                  "sNext": "Sig.",
                  "sPrevious": "Ant."
                }
        }
    });

</script>