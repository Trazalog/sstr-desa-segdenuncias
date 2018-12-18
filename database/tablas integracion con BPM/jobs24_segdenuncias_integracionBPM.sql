-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2018 a las 11:01:27
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jobs24_segdenuncias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admcustomers`
--

CREATE TABLE `admcustomers` (
  `cliId` int(11) NOT NULL,
  `cliName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliLastName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDni` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDateOfBirth` date DEFAULT NULL,
  `cliNroCustomer` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliAddress` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliPhone` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliMovil` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliEmail` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliImagePath` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonaId` int(11) DEFAULT NULL,
  `cliDay` int(11) DEFAULT '30',
  `cliColor` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `admcustomers`
--

INSERT INTO `admcustomers` (`cliId`, `cliName`, `cliLastName`, `cliDni`, `cliDateOfBirth`, `cliNroCustomer`, `cliAddress`, `cliPhone`, `cliMovil`, `cliEmail`, `cliImagePath`, `zonaId`, `cliDay`, `cliColor`, `estado`) VALUES
(20, 'CERRO VANGUARDIA SA', 'CERRO SA', '61872532', '2000-01-01', NULL, 'ZAPIOLA 331 - RIO GALLEGOS SANTA CRUZ', '', '', '', NULL, 16, 29, NULL, 'C'),
(21, 'Hugo', 'GALLARDO', '13216546', '0000-00-00', NULL, 'calle 13', '15555555', '422222', '', NULL, 12, 1, NULL, 'AN'),
(22, 'Hugo', 'Gallardo', '123113', '0000-00-00', NULL, 'calle del cliente', '42222222', '15555555', '15555555', NULL, 12, 1, NULL, 'AN'),
(23, 'Hugo', 'Gallardo', '123546', '2017-08-07', NULL, 'calle 1', '422222', '1555555', '1555555', NULL, 12, 1, NULL, 'AN'),
(24, 'dd', 'dd', '3333', '2018-03-09', NULL, 'sadas', '', '', '', NULL, 10, 1, NULL, 'AN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_trabajo`
--

CREATE TABLE `orden_trabajo` (
  `id_orden` int(11) NOT NULL,
  `nro` varchar(100) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `fecha_terminada` datetime NOT NULL,
  `fecha_aviso` datetime NOT NULL,
  `fecha_entregada` datetime NOT NULL,
  `descripcion` text NOT NULL,
  `cliId` int(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT '1',
  `id_usuario_a` int(11) NOT NULL,
  `id_usuario_e` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `cod_interno` varchar(30) NOT NULL,
  `petr_id` int(11) NOT NULL,
  `bpm_task_id_plan` int(11) NOT NULL,
  `bpm_task_id_asig` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden_trabajo`
--

INSERT INTO `orden_trabajo` (`id_orden`, `nro`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `cod_interno`, `petr_id`, `bpm_task_id_plan`, `bpm_task_id_asig`) VALUES
(1, 'COM-0143-18', '2018-09-18 03:08:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 1, 60646, 0),
(2, 'COM-0144-18', '2018-09-18 04:19:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 3, 60666, 0),
(3, 'TC-0145-18', '2018-09-18 04:32:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 4, 60698, 0),
(4, 'TC-0146-18', '2018-09-18 04:35:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 5, 60699, 0),
(5, 'TC-0147-18', '2018-09-18 04:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 6, 60700, 0),
(6, 'TV-0148-18', '2018-09-18 11:48:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 7, 60737, 0),
(7, 'CA-0149-18', '2018-09-18 14:50:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 8, 60748, 0),
(8, 'CI-0150-18', '2018-09-18 15:21:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 9, 60776, 0),
(9, 'IT-0151-18', '2018-09-18 15:45:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 10, 60797, 0),
(10, 'BI-0153-18', '2018-09-18 16:35:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 12, 60822, 0),
(11, '', '2018-09-18 19:35:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 32, 1, 0, 1, 1, '', 0, 60412, 0),
(12, 'TV-0154-18', '2018-09-19 18:04:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 13, 60859, 0),
(13, 'TC-0155-18', '2018-09-20 16:22:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Planifique el trabajo a realizar para obtener un diagnóstico', 1, 'C', 28, 1, 0, 1, 1, '', 14, 60870, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id_tarea` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `duracion_std` int(11) NOT NULL,
  `form_asoc` int(11) DEFAULT NULL,
  `visible` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id_tarea`, `descripcion`, `duracion_std`, `form_asoc`, `visible`) VALUES
(4, 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 120, 1, 1),
(5, 'REVISE LA BOMBA DE AGUA', 60, 1, 1),
(6, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 60, 1, 1),
(7, 'CAMBIE EL FILTRO DE ADMISIÓN DE AIRE', 60, 1, 1),
(8, 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 60, 1, 1),
(9, 'CAMBIE LOS FILTROS DE ACEITE.', 60, 1, 1),
(10, 'CAMBIE EL FILTRO DE COMBUSTIBLE DE MOTOR.', 60, 1, 1),
(12, 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 60, 1, 1),
(13, 'COMPRUEBE EL MOTOR DE ARRANQUE', 60, 1, 1),
(14, 'REVISE EL SENSOR DE TEMPERATURA.', 60, 1, 1),
(15, 'TOMAR MUESTRA DE ACEITE PARA ANÁLISIS DE LABORATORIO. USAR PROCEDIMIENTO PR0004EM', 60, 1, 1),
(16, 'REALIZAR ANÁLISIS DE TEMPERATURA. UTIIZAR CÁMARA TERMOMÉTRICA O PIRÓMETRO', 60, 1, 1),
(17, 'tarea de rectificacion subsector 2', 120, 1, 1),
(18, 'tarea 1  plantilla  4', 80, 1, 1),
(19, 'tarea 2 pantilla 4', 70, 1, 1),
(20, 'tarea 3 plantilla 4', 150, 1, 0),
(21, 'Recepcione el componente del cliente', 11, 1000, 0),
(22, 'Notificación de Recepción del Legajo', 55, 2500, 1),
(23, 'Cotización de trabajo Industrial', 13, 5000, 0),
(24, 'Confección de Presupuesto Industrial', 10, 6000, 0),
(25, 'Revisión Diagnóstico', 9, 7000, 1),
(26, 'tarea test hugo 1', 150, 1, 1),
(27, 'tarea test hugo 2', 100, 1, 1),
(28, 'tarea test hugo 3', 80, 1, 1),
(29, 'tarea test hugo 4', 30, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_listarea`
--

CREATE TABLE `tbl_listarea` (
  `id_listarea` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tarea_realizada` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_equipo` int(11) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `duracion_prog` int(11) DEFAULT NULL,
  `bpm_task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_listarea`
--

INSERT INTO `tbl_listarea` (`id_listarea`, `id_orden`, `tareadescrip`, `id_tarea`, `id_usuario`, `fecha`, `tarea_realizada`, `id_equipo`, `fecha_inicio`, `fecha_fin`, `estado`, `duracion_prog`, `bpm_task_id`) VALUES
(1, 1, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 6, 34, '2018-09-18 03:08:39', NULL, 2, NULL, NULL, 'AS', 0, 60646),
(2, 2, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 6, 34, '2018-09-18 04:20:00', NULL, 2, NULL, NULL, 'AS', 0, 60666),
(3, 3, 'REVISE LA BOMBA DE AGUA', 5, 42, '2018-09-18 04:33:06', NULL, 2, NULL, NULL, 'AS', 0, 60698),
(4, 3, 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 4, NULL, '2018-09-18 04:33:06', NULL, 7, NULL, NULL, 'IN', 0, 0),
(5, 3, 'REVISE LA BOMBA DE AGUA', 5, NULL, '2018-09-18 04:33:06', NULL, 6, NULL, NULL, 'IN', 0, 0),
(6, 4, 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 4, 42, '2018-09-18 04:35:20', NULL, 2, NULL, NULL, 'IN', 0, 0),
(7, 4, 'REVISE LA BOMBA DE AGUA', 5, 42, '2018-09-18 04:35:20', NULL, 2, NULL, NULL, 'AS', 0, 0),
(8, 4, 'tarea de rectificacion subsector 2', 17, 42, '2018-09-18 04:35:20', NULL, 6, NULL, NULL, 'AS', 0, 60699),
(9, 5, 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 4, 42, '2018-09-22 04:36:52', NULL, 2, NULL, NULL, 'AS', 0, 0),
(10, 5, 'REVISE LA BOMBA DE AGUA', 5, 42, '2018-09-22 04:36:52', NULL, 2, NULL, NULL, 'AS', 0, 0),
(11, 5, 'REVISE EL SENSOR DE TEMPERATURA.', 14, 42, '2018-09-22 04:36:52', NULL, 6, NULL, NULL, 'AS', 0, 60700),
(12, 5, 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 8, 42, '2018-09-22 04:36:52', NULL, 6, NULL, NULL, 'IN', 0, 60700),
(13, 5, 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 12, 42, '2018-09-22 04:36:52', NULL, 9, NULL, NULL, 'AS', 0, 60700),
(14, 5, 'CAMBIE EL FILTRO DE ADMISIÓN DE AIRE', 7, 42, '2018-09-22 04:36:52', NULL, 10, NULL, NULL, 'AS', 0, 60700),
(15, 6, 'tarea test hugo 1', 26, NULL, '2018-09-18 12:52:35', NULL, 10, NULL, NULL, 'PR', 0, 60737),
(16, 6, 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 4, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 120, 60737),
(17, 7, 'REVISE LA BOMBA DE AGUA', 5, 34, '2018-09-27 14:50:57', NULL, 2, NULL, NULL, 'AS', 0, 60748),
(18, 6, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 6, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60737),
(19, 6, 'CAMBIE EL FILTRO DE ADMISIÓN DE AIRE', 7, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60737),
(20, 8, 'REVISE LA BOMBA DE AGUA', 5, 34, '2018-09-18 15:21:19', NULL, 2, NULL, NULL, 'AS', 0, 60776),
(21, 9, 'REVISE LA BOMBA DE AGUA', 5, 34, '2018-09-20 15:45:59', NULL, 3, NULL, NULL, 'AS', 0, 60797),
(22, 10, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 6, 42, '2018-09-27 15:35:27', NULL, 2, NULL, NULL, 'AS', 0, 0),
(23, 10, 'CAMBIE EL FILTRO DE ADMISIÓN DE AIRE', 7, 42, '2018-09-28 11:35:27', NULL, 2, NULL, NULL, 'AS', 0, 0),
(24, 10, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 6, 42, '2018-09-28 10:35:27', NULL, 2, NULL, NULL, 'AS', 0, 60822),
(25, 12, 'tarea test hugo 1', 26, NULL, '2018-09-09 19:51:35', NULL, 2, NULL, NULL, 'IN', 0, 60859),
(26, 12, 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 4, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 120, 60859),
(27, 12, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 6, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60859),
(28, 12, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 6, NULL, '2018-09-19 20:37:15', NULL, 2, NULL, NULL, 'IN', 0, 60859),
(29, 12, 'REVISE LA BOMBA DE AGUA', 5, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60859),
(30, 12, 'CAMBIE EL FILTRO DE ADMISIÓN DE AIRE', 7, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60859),
(31, 12, 'REVISE LA BOMBA DE AGUA', 5, NULL, '2018-09-19 21:47:36', NULL, 10, NULL, NULL, 'IN', 0, 60859),
(32, 12, 'CAMBIE LOS FILTROS DE ACEITE.', 9, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60859),
(33, 12, 'TOMAR MUESTRA DE ACEITE PARA ANÁLISIS DE LABORATORIO. USAR PROCEDIMIENTO PR0004EM', 15, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60859),
(34, 12, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 6, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60859),
(35, 12, 'REVISE EL SENSOR DE TEMPERATURA.', 14, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60859),
(36, 12, 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 12, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60859),
(37, 12, 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 8, NULL, '2018-09-20 23:55:49', NULL, 2, NULL, NULL, 'PR', 0, 60859),
(38, 12, 'CAMBIE LOS FILTROS DE ACEITE.', 9, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 60, 60859),
(39, 0, 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 4, NULL, NULL, NULL, 0, NULL, NULL, 'IN', NULL, 0),
(40, 0, 'REVISE LA BOMBA DE AGUA', 5, NULL, NULL, NULL, 0, NULL, NULL, 'IN', NULL, 0),
(41, 0, 'tarea 1  plantilla  4', 18, NULL, NULL, NULL, 0, NULL, NULL, 'IN', 80, 0),
(42, 13, 'REVISE LA BOMBA DE AGUA', 5, 42, '2018-09-23 16:22:53', NULL, 2, NULL, NULL, 'AS', 0, 60870);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trj_pedido_trabajo`
--

CREATE TABLE `trj_pedido_trabajo` (
  `petr_id` int(11) NOT NULL,
  `parte_vehiculo` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `patente` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `indice` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `motor` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `num_motor` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `num_chasis` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `condicion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fec_entrega` date DEFAULT NULL,
  `observacion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `familia_producto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subfamilia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cod_interno` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `clie_id` int(11) NOT NULL,
  `entrega_servicio` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion_entrega` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_cliente` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_repuesto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden_compra` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bpm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `trj_pedido_trabajo`
--

INSERT INTO `trj_pedido_trabajo` (`petr_id`, `parte_vehiculo`, `patente`, `indice`, `motor`, `num_motor`, `num_chasis`, `condicion`, `fec_entrega`, `observacion`, `familia_producto`, `subfamilia`, `cod_interno`, `clie_id`, `entrega_servicio`, `direccion_entrega`, `tipo_cliente`, `proveedor_repuesto`, `orden_compra`, `bpm_id`) VALUES
(1, 'Fernando Test 2', 'Fernando Test 2', 'CAT.3126', 'CATERPILLAR 3126 DIESEL( 962G)*6CIL*110mm', '7777777', '7777777', 'Garantía', '2018-10-01', '', 'CI - Componente Industrial', 'MG - Motor Grande', 'COM-0143-18', 20, NULL, NULL, NULL, NULL, NULL, 3041),
(3, 'aaaaaaa', 'asdasd', 'CAT.3064', 'CATERPILLAR 3064 DIESEL*4CIL*102mm', '7777777', '7777777', 'Urgente', '2018-10-01', '', 'CI - Componente Industrial', 'MG - Motor Grande', 'COM-0144-18', 21, NULL, NULL, NULL, NULL, NULL, 3042),
(4, '306', '306', 'CAT.3064', 'CATERPILLAR 3064 DIESEL*4CIL*102mm', '306', '306', 'Normal', '2018-10-01', '306', 'CI - Componente Industrial', 'MG - Motor Grande', 'TC-0145-18', 20, NULL, NULL, NULL, NULL, NULL, 3043),
(5, '404', '404', '404', 'PEUGEOT 404 NAF.*4CIL* 84mm', '404', '404', 'Normal', '2018-09-26', '404', 'CI - Componente Industrial', 'MM - Motor Mediano', 'TC-0146-18', 20, NULL, NULL, NULL, NULL, NULL, 3044),
(6, '504', '504', '504 1.6/8', 'PEUGEOT 504 NAF.1600-1800*4CIL* 85mm', '504', '504', 'Normal', '2018-09-23', '504', 'CI - Componente Industrial', 'MSA - Motor Semiarmado', 'TC-0147-18', 20, NULL, NULL, NULL, NULL, NULL, 3045),
(7, 'aas', 'sdad', 'CAT.924', 'CATERPILAR 3056 (PERKINS ) DIESEL *6CIL* 100mm', '243', '2134', 'Normal', '2018-10-02', '', 'CI - Componente Industrial', 'MG - Motor Grande', 'TV-0148-18', 21, NULL, NULL, NULL, NULL, NULL, 3046),
(8, 'Radiador', 'AB197CG', 'CHEROKEE VM', 'CHEROKEE VM TURBO DIESEL *4CIL*92MM', '11111', '', 'Normal', '2018-10-02', '', 'CI - Componente Industrial', 'MG - Motor Grande', 'CA-0149-18', 21, NULL, NULL, NULL, NULL, NULL, 3047),
(9, 'Motor', 'Test1', 'CAT.924', 'CATERPILAR 3056 (PERKINS ) DIESEL *6CIL* 100mm', '11111', '33', 'Normal', '2018-10-02', '', 'CI - Componente Industrial', 'MG - Motor Grande', 'CI-0150-18', 20, NULL, NULL, NULL, NULL, NULL, 3048),
(10, 'Test1', 'AAC111DF', 'CUMM.KT1150', 'CUMMINS KT1150 DIESEL *6CIL* 158.75mm', '212121', '', 'Normal', '2018-10-02', '', 'CI - Componente Industrial', 'MG - Motor Grande', 'IT-0151-18', 21, NULL, NULL, NULL, NULL, NULL, 3049),
(11, 'Partes Test', 'Pantente Test', 'CAT.3064', 'CATERPILLAR 3064 DIESEL*4CIL*102mm', '1111111', '1111111', 'Normal', '2018-10-02', '', 'CI - Componente Industrial', 'MG - Motor Grande', 'COM-0152-18', 20, NULL, NULL, NULL, NULL, NULL, 3050),
(12, 'fsdf', 'sfsf', 'CAT.924', 'CATERPILAR 3056 (PERKINS ) DIESEL *6CIL* 100mm', 'sfdca', '234', 'Normal', '2018-09-06', '', 'CI - Componente Industrial', 'MG - Motor Grande', 'BI-0153-18', 20, 'Semi-Armado', '132 Avenida José Ignacio de la Roza Oeste', 'Minera', 'Cliente', '815L97OECdL._SL1500_2.jpg', 3051),
(13, 'asd', '132', '123', 'wty', '367', '345', 'Normal', '2018-10-03', '', 'CI - Componente Industrial', 'MG - Motor Grande', 'TV-0154-18', 21, NULL, NULL, NULL, NULL, NULL, 3052);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admcustomers`
--
ALTER TABLE `admcustomers`
  ADD PRIMARY KEY (`cliId`);

--
-- Indices de la tabla `orden_trabajo`
--
ALTER TABLE `orden_trabajo`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `orden_trabajo_ibfk_1` (`cliId`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_usuariosolicitante` (`id_usuario_a`),
  ADD KEY `usuario_entrega` (`id_usuario_e`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`);

--
-- Indices de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  ADD PRIMARY KEY (`id_listarea`);

--
-- Indices de la tabla `trj_pedido_trabajo`
--
ALTER TABLE `trj_pedido_trabajo`
  ADD PRIMARY KEY (`petr_id`),
  ADD UNIQUE KEY `cod_interno_UNIQUE` (`cod_interno`),
  ADD KEY `cliente_fk_idx` (`clie_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admcustomers`
--
ALTER TABLE `admcustomers`
  MODIFY `cliId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `orden_trabajo`
--
ALTER TABLE `orden_trabajo`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  MODIFY `id_listarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `trj_pedido_trabajo`
--
ALTER TABLE `trj_pedido_trabajo`
  MODIFY `petr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
