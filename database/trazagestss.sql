/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : trazagestss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-19 11:42:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_actividad
-- ----------------------------
DROP TABLE IF EXISTS `tbl_actividad`;
CREATE TABLE `tbl_actividad` (
  `actividadid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `descripciongeneral` text,
  PRIMARY KEY (`actividadid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_actividad
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_detaactiv
-- ----------------------------
DROP TABLE IF EXISTS `tbl_detaactiv`;
CREATE TABLE `tbl_detaactiv` (
  `detaactivid` int(11) NOT NULL,
  `empleaid` int(11) DEFAULT NULL,
  `actividadid` int(11) DEFAULT NULL,
  `detaactivrubro` varchar(255) DEFAULT NULL,
  `detaactivconvenio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`detaactivid`),
  KEY `empleaid` (`empleaid`),
  KEY `actividadid` (`actividadid`),
  CONSTRAINT `tbl_detaactiv_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_detaactiv_ibfk_2` FOREIGN KEY (`actividadid`) REFERENCES `tbl_actividad` (`actividadid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_detaactiv
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_empleadores
-- ----------------------------
DROP TABLE IF EXISTS `tbl_empleadores`;
CREATE TABLE `tbl_empleadores` (
  `empleaid` int(11) NOT NULL AUTO_INCREMENT,
  `empleacui` varchar(255) DEFAULT NULL,
  `empleafecha` datetime DEFAULT NULL,
  `empleainscrip` varchar(255) DEFAULT NULL,
  `empleaexp` varchar(255) DEFAULT NULL,
  `empleadomicilior` varchar(255) DEFAULT NULL,
  `empleadepid` int(11) DEFAULT NULL,
  `emplealocid` int(11) DEFAULT NULL,
  `empleadomiciliolegal` varchar(255) DEFAULT NULL,
  `empleasliquiid` int(11) DEFAULT NULL,
  `empleapmasc` decimal(10,0) DEFAULT NULL,
  `empleapfem` decimal(10,0) DEFAULT NULL,
  `ampleafechaalta` date DEFAULT NULL,
  PRIMARY KEY (`empleaid`),
  KEY `empleasliquiid` (`empleasliquiid`),
  CONSTRAINT `tbl_empleadores_ibfk_1` FOREIGN KEY (`empleasliquiid`) REFERENCES `tbl_sisliqui` (`sisliquiid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_empleadores
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_libro
-- ----------------------------
DROP TABLE IF EXISTS `tbl_libro`;
CREATE TABLE `tbl_libro` (
  `libroid` int(11) NOT NULL AUTO_INCREMENT,
  `librofechaentrega` datetime DEFAULT NULL,
  `librotomo` int(11) DEFAULT NULL,
  `empleaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`libroid`),
  KEY `empleaid` (`empleaid`),
  CONSTRAINT `tbl_libro_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_libro
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sisliqui
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sisliqui`;
CREATE TABLE `tbl_sisliqui` (
  `sisliquiid` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sisliquiid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_sisliqui
-- ----------------------------
