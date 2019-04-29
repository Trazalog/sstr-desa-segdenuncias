--Agrego columna para saber si la tarea est{a archivada o no
ALTER TABLE `jobs24_segdenuncias`.`trg_actas` 
ADD COLUMN `archivada` VARCHAR(4) NOT NULL AFTER `inspeccionid`;
