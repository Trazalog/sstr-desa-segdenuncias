# ABM Profesionales
--creo la tabla tbl_profesionales
CREATE TABLE `jobs24_segdenuncias`.`trg_profesionales` (
  `prof_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `cuit` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `matricula` VARCHAR(45) NULL,
  `estado` VARCHAR(4) NULL,
  PRIMARY KEY (`prof_id`));
--Agrego ABM Profesionales a sismenu
INSERT INTO `jobs24_segdenuncias`.`sismenu` (`id`, `parent`, `name`, `icon`, `slug`, `number`) VALUES ('19', '18', 'ABM Profesional', 'fa fa-fw fa-address-card', 'Profesional', '5');
--Ordeno items submenu Administración (que tiene los abm)
UPDATE `jobs24_segdenuncias`.`sismenu` SET `number`='1' WHERE `id`='8';
UPDATE `jobs24_segdenuncias`.`sismenu` SET `number`='2' WHERE `id`='7';
UPDATE `jobs24_segdenuncias`.`sismenu` SET `number`='3' WHERE `id`='10';
UPDATE `jobs24_segdenuncias`.`sismenu` SET `number`='4' WHERE `id`='9';
--Agrego permisos de ejecución
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('75', '19', '1');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('76', '19', '2');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('77', '19', '3');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('78', '19', '4');
--Agrego permisos de visualización
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('228', '3', '75');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('229', '3', '76');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('230', '3', '77');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('231', '3', '78');



# CALDERAS
--creo la tabla trg_calderas
CREATE TABLE `jobs24_segdenuncias`.`trg_calderas` (
  `cald_id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `empresa` VARCHAR(45) NOT NULL,
  `establecimiento` INT NOT NULL,
  `nom_fabricante` VARCHAR(45) NULL,
  `num_serie` VARCHAR(45) NULL,
  `anioFabricacion` VARCHAR(45) NULL,
  `max_presion` INT NULL,
  `codigoNorma` VARCHAR(45) NULL,
  `num_registro` VARCHAR(45) NULL,
  `documentacion` VARCHAR(45) NULL,
  `superficieCalefaccion` INT NULL,
  `max_capacidadVapor` INT NULL,
  `temperaturaPresionMaxima` INT NULL,
  PRIMARY KEY (`cald_id`));
--creo tabla tipo de calderas 
CREATE TABLE `jobs24_segdenuncias`.`trg_tipocaldera` (
  `tipo_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`tipo_id`));

--creo clave foranea entre trg_calderas y tbl_establecimiento
ALTER TABLE `jobs24_segdenuncias`.`trg_calderas` 
ADD INDEX `esta_id_idx` (`establecimiento` ASC);
;
ALTER TABLE `jobs24_segdenuncias`.`trg_calderas` 
ADD CONSTRAINT `esta_id`
  FOREIGN KEY (`establecimiento`)
  REFERENCES `jobs24_segdenuncias`.`tbl_establecimiento` (`estableid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
-- creo clave foranea entre trg_calderas y trg_tipocalderas
ALTER TABLE `jobs24_segdenuncias`.`trg_calderas` 
ADD INDEX `tipo_id_idx` (`tipo` ASC);
;
ALTER TABLE `jobs24_segdenuncias`.`trg_calderas` 
ADD CONSTRAINT `tipo_id`
  FOREIGN KEY (`tipo`)
  REFERENCES `jobs24_segdenuncias`.`trg_tipocaldera` (`tipo_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- agrego datos a trg_tipocalderas
INSERT INTO `jobs24_segdenuncias`.`trg_tipocaldera` (`tipo_id`, `nombre`, `estado`) VALUES ('1', 'Caldera', 'AC');
INSERT INTO `jobs24_segdenuncias`.`trg_tipocaldera` (`tipo_id`, `nombre`, `estado`) VALUES ('2', 'Recipiente a presión', 'AC');





-- creo tabla registro de tareas profesionales
CREATE TABLE `jobs24_segdenuncias`.`trg_tareasprofesionales` (
  `tare_id` INT NOT NULL AUTO_INCREMENT,
  `tipo` INT NOT NULL,
  `fecha` VARCHAR(45) NULL,
  `profesional` INT NOT NULL,
  `observaciones` VARCHAR(45) NULL,
  `vencimiento` DATE NULL,
  `estado` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`tare_id`));

-- creo tabla tipo de tarea profesional
CREATE TABLE `jobs24_segdenuncias`.`trg_tipotareaprofesional` (
  `tita_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`tita_id`));

INSERT INTO `jobs24_segdenuncias`.`trg_tipotareaprofesional` (`tita_id`, `nombre`, `estado`) VALUES ('1', 'Inspecciín Interna', 'AC');
INSERT INTO `jobs24_segdenuncias`.`trg_tipotareaprofesional` (`tita_id`, `nombre`, `estado`) VALUES ('2', 'Inspección Externa', 'AC');




--Agrego caldera a sismenu
INSERT INTO `jobs24_segdenuncias`.`sismenu` (`id`, `name`, `icon`, `slug`, `number`) VALUES ('20', 'Caldera / Recipiente Presión', 'fa fa-tachometer', 'Caldera', '11');
--Agrego permisos de ejecución
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('79', '20', '1');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('80', '20', '2');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('81', '20', '3');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('82', '20', '4');
--Agrego permisos de visualización
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('232', '3', '79');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('233', '3', '80');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('234', '3', '81');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('235', '3', '82');

--Agrego registro de tareas profesionales a sismenu
INSERT INTO `jobs24_segdenuncias`.`sismenu` (`id`, `name`, `icon`, `slug`, `number`) VALUES ('21', 'Registro de Tareas Profesionales', 'fa fa-list-alt', 'TareaProfesional', '12');
--Agrego permisos de ejecución
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('83', '21', '1');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('84', '21', '2');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('85', '21', '3');
INSERT INTO `jobs24_segdenuncias`.`sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES ('86', '21', '4');
--Agrego permisos de visualización
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('236', '3', '83');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('237', '3', '84');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('238', '3', '85');
INSERT INTO `jobs24_segdenuncias`.`sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES ('239', '3', '86');












--"arreglo" ids de departamentos

UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '732' WHERE (`estableid` = '14');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '741' WHERE (`estableid` = '13');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '734' WHERE (`estableid` = '31');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '751' WHERE (`estableid` = '30');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '750' WHERE (`estableid` = '29');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '735' WHERE (`estableid` = '28');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '748' WHERE (`estableid` = '27');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '742' WHERE (`estableid` = '26');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '742' WHERE (`estableid` = '25');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '735' WHERE (`estableid` = '24');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '733' WHERE (`estableid` = '23');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '612' WHERE (`estableid` = '22');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '746' WHERE (`estableid` = '21');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '281' WHERE (`estableid` = '20');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '741' WHERE (`estableid` = '16');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '732' WHERE (`estableid` = '12');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '735' WHERE (`estableid` = '15');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '735' WHERE (`estableid` = '17');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '735' WHERE (`estableid` = '18');
UPDATE `jobs24_segdenuncias`.`tbl_establecimiento` SET `dptoid` = '749' WHERE (`estableid` = '19');
