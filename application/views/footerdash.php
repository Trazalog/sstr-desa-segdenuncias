        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.0.0
            </div>
            <strong>Copyright &copy; 2015-<?php echo date('Y'); ?> <a href="http://trazalog.com">trazalog</a>.</strong> Todos los derechos reservados.
            <?php /*
            if (date_default_timezone_get()) {
                echo '<br />- date.timezone (sistema): ' . date_default_timezone_get();
            }

            if (ini_get('date.timezone')) {
                echo '<br />- date.timezone (ini.php): ' . ini_get('date.timezone');
            }
            echo '<br />- La Fecha-Hora es: ' . date('Y-m-d H:i:s')
            */?>
        </footer>

    </body>

    <script>
        //Esto dispara un evento para que se cargue el Dash en forma automatica cuando ingreso.
        cargarView('<?php echo $grpDash; ?>', 'index', 'View');
    </script>