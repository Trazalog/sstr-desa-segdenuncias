
--agrego denuncia Laboral al menu
INSERT INTO `jobs24_segdenuncias`.`sismenu` (`id`, `parent`, `name`, `icon`, `slug`, `number`) VALUES ('22', '12', 'Alta Denuncia Laboral', 'fa fa-clipboard', 'DenunciaLaboral', '2');
--pongo orden a alta de denuncia
UPDATE `jobs24_segdenuncias`.`sismenu` SET `number` = '1' WHERE (`id` = '17');


--agrego a sismenuactions
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('87', '22', '1');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('88', '22', '2');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('89', '22', '3');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('90', '22', '4');


--agrego a sisgroupactions
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('240', '1', '87');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('241', '1', '88');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('242', '1', '89');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('243', '1', '90');







-- Estructura de tabla para la tabla `tbl_denunciaslaborales`
CREATE TABLE `tbl_denunciaslaborales` (
  `denunciaid` int(11) NOT NULL,
  `denunciasfecha` datetime DEFAULT NULL,
  `denunciariesgo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `denunciaprograma` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `denunciafechaverif` date DEFAULT NULL,
  `denunciainclucion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `denuncianroobra` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `denuncianroacta` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `denunciamotivos` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estableid` int(11) DEFAULT NULL,
  `denunciaestado` varchar(4) COLLATE utf8_spanish_ci DEFAULT 'SRT',
  `denunciatipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `denunciadenunciante` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `denunciacuit` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


ALTER TABLE `jobs24_segdenuncias`.`tbl_denunciaslaborales` 
CHANGE COLUMN `denunciaid` `denunciaid` INT(11) NOT NULL AUTO_INCREMENT ;


-- Indices de la tabla `tbl_denunciaslaborales`
ALTER TABLE `tbl_denunciaslaborales`
  ADD PRIMARY KEY (`denunciaid`),
  ADD KEY `estableid` (`estableid`) USING BTREE;



