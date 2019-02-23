-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-01-2019 a las 15:32:33
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
-- Estructura de tabla para la tabla `sisgroupsactions`
--

CREATE TABLE `sisgroupsactions` (
  `grpactId` int(11) NOT NULL,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisgroupsactions`
--

INSERT INTO `sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES
(144, 1, 6),
(145, 1, 7),
(146, 1, 8),
(147, 1, 9),
(148, 1, 10),
(149, 1, 11),
(150, 1, 12),
(151, 1, 13),
(152, 1, 14),
(153, 1, 15),
(154, 1, 16),
(155, 1, 17),
(156, 1, 18),
(157, 1, 19),
(158, 1, 20),
(159, 1, 21),
(160, 1, 22),
(161, 1, 23),
(162, 1, 24),
(163, 1, 25),
(164, 1, 26),
(165, 1, 27),
(166, 1, 28),
(167, 1, 29),
(168, 1, 30),
(169, 1, 31),
(170, 1, 32),
(171, 1, 33),
(172, 1, 42),
(173, 1, 43),
(174, 1, 44),
(175, 1, 45),
(176, 1, 46),
(177, 1, 47),
(178, 1, 48),
(179, 1, 49),
(180, 1, 50),
(181, 1, 51),
(182, 1, 52),
(183, 1, 53),
(184, 1, 54),
(185, 1, 55),
(186, 1, 56),
(187, 1, 57),
(188, 1, 58),
(189, 1, 59),
(190, 1, 60),
(191, 1, 62),
(197, 2, 9),
(198, 2, 10),
(199, 2, 11),
(200, 2, 13),
(201, 2, 17),
(202, 2, 22),
(203, 2, 23),
(204, 2, 24),
(205, 2, 25),
(206, 3, 42),
(207, 3, 43),
(208, 3, 44),
(209, 3, 45),
(210, 3, 57),
(211, 3, 58),
(212, 3, 59),
(213, 3, 60),
(214, 3, 61),
(215, 3, 62),
(216, 1, 63),
(217, 1, 64),
(218, 1, 65),
(219, 1, 66),
(220, 1, 67),
(221, 1, 68),
(222, 1, 69),
(223, 1, 70),
(224, 1, 71),
(225, 1, 72),
(226, 1, 73),
(227, 1, 74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenu`
--

CREATE TABLE `sismenu` (
  `id` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sismenu`
--

INSERT INTO `sismenu` (`id`, `parent`, `name`, `icon`, `slug`, `number`) VALUES
(0, NULL, '', '', '', 0),
(2, NULL, 'Seguridad', 'fa fa-lock', '', 2),
(3, 2, 'Usuarios', 'fa fa-fw fa-user', 'user', 2),
(4, 2, 'Grupos', 'fa fa-fw fa-users', 'group', 1),
(5, 2, 'Menu', 'fa fa-fw fa-bars', 'menu', 3),
(6, 2, 'Database', 'fa fa-fw fa-database', 'backup', 4),
(7, 18, 'ABM Empleadores', 'fa fa-fw fa-user', 'Empleador', 4),
(8, 18, 'ABM Actividades', 'fa fa-fw fa-list', 'Actividad', 5),
(9, 18, 'ABM Liquidaciones', 'fa fa-fw fa-calculator', 'Liquidacion', 6),
(10, 18, 'ABM Inspectores', 'fa fa-male', 'inspector', 7),
(12, NULL, 'Denuncias', 'fa fa-upload', '', 9),
(14, NULL, 'Inspecciones', 'fa fa-clipboard', 'inspeccion', 3),
(15, 12, 'Carga Masiva', 'fa fa-upload', 'import', 0),
(16, NULL, 'Panel Empleadores', 'fa fa-fw fa-tasks', 'panelEmpleador', 1),
(17, 12, 'Alta Denuncias', 'fa fa-clipboard', 'Denuncia', 0),
(18, NULL, 'Administración', 'fa fa-briefcase', '', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenuactions`
--

CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sismenuactions`
--

INSERT INTO `sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 3, 1),
(7, 3, 2),
(8, 3, 3),
(9, 3, 4),
(10, 4, 1),
(11, 4, 2),
(12, 4, 3),
(13, 4, 4),
(14, 5, 1),
(15, 5, 2),
(16, 5, 3),
(17, 5, 4),
(18, 6, 1),
(19, 6, 2),
(20, 6, 3),
(21, 6, 4),
(22, 7, 1),
(23, 7, 2),
(24, 7, 3),
(25, 7, 4),
(26, 8, 1),
(27, 8, 2),
(28, 8, 3),
(29, 8, 4),
(30, 9, 1),
(31, 9, 2),
(32, 9, 3),
(33, 9, 4),
(34, 8, 1),
(35, 8, 2),
(36, 8, 3),
(37, 8, 4),
(38, 9, 1),
(39, 9, 2),
(40, 9, 3),
(41, 9, 4),
(42, 10, 1),
(43, 10, 2),
(44, 10, 3),
(45, 10, 4),
(46, 11, 1),
(47, 11, 2),
(48, 11, 3),
(49, 11, 4),
(50, 12, 1),
(51, 12, 2),
(52, 12, 3),
(53, 12, 4),
(54, 13, 1),
(55, 13, 2),
(56, 13, 3),
(57, 14, 1),
(58, 14, 2),
(59, 14, 3),
(60, 15, 1),
(61, 15, 2),
(62, 15, 3),
(63, 16, 1),
(64, 16, 2),
(65, 16, 3),
(66, 16, 4),
(67, 17, 1),
(68, 17, 2),
(69, 17, 3),
(70, 17, 4),
(71, 18, 1),
(72, 18, 2),
(73, 18, 3),
(74, 18, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sisgroupsactions`
--
ALTER TABLE `sisgroupsactions`
  ADD PRIMARY KEY (`grpactId`),
  ADD KEY `grpId` (`grpId`) USING BTREE,
  ADD KEY `menuAccId` (`menuAccId`) USING BTREE;

--
-- Indices de la tabla `sismenu`
--
ALTER TABLE `sismenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indices de la tabla `sismenuactions`
--
ALTER TABLE `sismenuactions`
  ADD PRIMARY KEY (`menuAccId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sisgroupsactions`
--
ALTER TABLE `sisgroupsactions`
  MODIFY `grpactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;
--
-- AUTO_INCREMENT de la tabla `sismenu`
--
ALTER TABLE `sismenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `sismenuactions`
--
ALTER TABLE `sismenuactions`
  MODIFY `menuAccId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
