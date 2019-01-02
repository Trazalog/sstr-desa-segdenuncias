-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-01-2019 a las 13:04:20
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
-- Estructura de tabla para la tabla `tbl_inspecciones`
--

CREATE TABLE `tbl_inspecciones` (
  `inspeccionid` int(11) NOT NULL,
  `inspeccionfechaasigna` datetime DEFAULT NULL,
  `inspeccionfecharecp` datetime DEFAULT NULL,
  `inspectorid` int(11) DEFAULT NULL,
  `inspecciondescrip` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estableid` int(11) DEFAULT NULL,
  `inspeestado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `bpm_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trg_actas`
--

CREATE TABLE `trg_actas` (
  `actaid` int(11) NOT NULL,
  `acta` varchar(200) DEFAULT NULL,
  `tipoActa` varchar(50) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `fechaProrroga` date DEFAULT NULL,
  `inspeccionid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_inspecciones`
--
ALTER TABLE `tbl_inspecciones`
  ADD PRIMARY KEY (`inspeccionid`),
  ADD KEY `inspectorid` (`inspectorid`),
  ADD KEY `estableid` (`estableid`);

--
-- Indices de la tabla `trg_actas`
--
ALTER TABLE `trg_actas`
  ADD PRIMARY KEY (`actaid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_inspecciones`
--
ALTER TABLE `tbl_inspecciones`
  MODIFY `inspeccionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `trg_actas`
--
ALTER TABLE `trg_actas`
  MODIFY `actaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_inspecciones`
--
ALTER TABLE `tbl_inspecciones`
  ADD CONSTRAINT `tbl_inspecciones_ibfk_1` FOREIGN KEY (`inspectorid`) REFERENCES `tbl_inspectores` (`inspectorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_inspecciones_ibfk_2` FOREIGN KEY (`estableid`) REFERENCES `tbl_establecimiento` (`estableid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
