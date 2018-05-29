<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Dump helper. Función que vuelca variables en pantalla de una manera bien formateada. Basada en el helper 'Dump Helper' de Joos Van Veen.
 * @author Pablo Andrés Rojo
 * @version 1.0
 */

if (!function_exists('dump')) {
    /**
     * dump
     * Volcado de variable en pantalla, de una manera bien formateada.
     *
     * @var    string  $var    Variable a volcar
     * @var    string  $label  Nombre a mostrar de la variable
     * @var    bool    $echo   Si muestra o devuelve la variable
     * @return string|void     Vuleca la variable o no devuelve nada
     */
    function dump ($var, $label = 'Dump', $echo = TRUE)
    {
        // Almacenar volcado en variable
        ob_start();
        var_dump($var);
        $output = ob_get_clean();

        // Agregar formato
        $output = preg_replace("/\]\=\>\n(\s+)/m", "] => ", $output);
        $output = '<pre style="background: #FFFEEF; color: #000; border: 1px dotted #000; padding: 10px; margin: 10px 0; text-align: left;">' . $label . ' => ' . $output . '</pre>';

        // Output
        if ($echo == TRUE) {
            echo $output;
        }
        else {
            return $output;
        }
    }
}

// --------------------------------------------------------------------

if (!function_exists('dump_exit')) {
    /**
     * dump_exit
     * Volcado de variable en pantalla, de una manera bien formateada, y termina la ejecución.
     *
     * @var    string  $var    Variable a volcar
     * @var    string  $label  Nombre a mostrar de la variable
     * @return void
     */
    function dump_exit($var, $label = 'Dump') {
        dump ($var, $label, $echo = TRUE);
        exit;
    }
}

// --------------------------------------------------------------------


/**
 * Filtra entradas basadas en una lista blanca. Este filtro elimina todos los caracteres que no son:
 * - letras
 * - números
 * - Caracteres especiales de marcado de texto ( _-.*#;:|!"+%{}@ ).
 *
 * Este filtro también pasa caracteres como é y ü.
 *
 * Basada en el helper de Joos Van Veen.
 *
 * Uso típico:
 * $string = '_ - . * # ; : | ! " + % { } @ abcdefgABCDEFG12345 áéíóúüÁÉÍÓÚÜ ' . "\nY otra línea!";
 * echo textile_sanitize($string);
 *
 * @author Pablo Andrés Rojo
 * @param  string   $string
 * @return string   The sanitized string
 */
function textile_sanitize($string){
    $whitelist = '/[^a-zA-Z0-9а-áéíóúü-ÁÉÍÓÚÜ \.\*\+\\n|#;:!"%@{} _-]/';
    return preg_replace($whitelist, '', $string);
}

function escape($string){
    return textile_sanitize($string);
}

// --------------------------------------------------------------------


/**
 * Filtra texto para usar en cadenas de javascript.
 *
 * @author Pablo Andrés Rojo
 * @param  string   $string
 * @return string   The sanitized string
 */
function javascript_escape($string) {
  return str_replace("\n", '\n', str_replace('"', '\"', addcslashes(str_replace("\r", '', (string)$string), "\0..\37'\\")));
}
