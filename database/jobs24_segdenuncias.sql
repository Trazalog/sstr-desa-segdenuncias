-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jobs24_segdenuncias
-- ------------------------------------------------------
-- Server version	5.6.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `confzone`
--

DROP TABLE IF EXISTS `confzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confzone` (
  `zonaId` int(11) NOT NULL AUTO_INCREMENT,
  `zonaName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`zonaId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confzone`
--

LOCK TABLES `confzone` WRITE;
/*!40000 ALTER TABLE `confzone` DISABLE KEYS */;
INSERT INTO `confzone` VALUES (10,'Caucete'),(11,'Zonda'),(12,'Rivadavia'),(13,'Sarmiento'),(14,'Los Berros'),(15,'El EncÃ³n');
/*!40000 ALTER TABLE `confzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `id_empresa` int(50) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `empcuit` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empdir` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emptelefono` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empemail` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliImagePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `localidadid` int(11) DEFAULT NULL,
  `provinciaid` int(11) DEFAULT NULL,
  `paisid` int(11) DEFAULT NULL,
  `gps` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empcelular` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonaId` int(11) DEFAULT NULL,
  `emlogo` blob,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Hospital Dr. Guillermo Rawson','20111111119','Av. Guillermo Rawson 494 sur','0264 422-4005','controloperatihrawson@gmail.com',NULL,NULL,NULL,NULL,NULL,'',12,NULL),(2,'Oficinas Ayinco','30125612569','Caseros 619 Sur','0264 427-4296','',NULL,NULL,NULL,NULL,NULL,'',12,NULL),(3,'Finning','27111111116','Gral. Mariano Acha 1476','0264 427-2829',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Clorox S.A.','20989898985','Av. Benavidez 4845 oeste','0264 423-6464','',NULL,NULL,NULL,NULL,NULL,'',10,NULL),(5,'Hospital Ventura Lloveras','21221458977','25 de Mayo 230','0264 494-1004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_privincia` int(11) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2383 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,1,'25 de Mayo'),(2,1,'3 de febrero'),(3,1,'A. Alsina'),(4,1,'A. GonzÃ¡les ChÃ¡ves'),(5,1,'Aguas Verdes'),(6,1,'Alberti'),(7,1,'Arrecifes'),(8,1,'Ayacucho'),(9,1,'Azul'),(10,1,'BahÃ­a Blanca'),(11,1,'Balcarce'),(12,1,'Baradero'),(13,1,'Benito JuÃ¡rez'),(14,1,'Berisso'),(15,1,'BolÃ­var'),(16,1,'Bragado'),(17,1,'Brandsen'),(18,1,'Campana'),(19,1,'CaÃ±uelas'),(20,1,'Capilla del SeÃ±or'),(21,1,'CapitÃ¡n Sarmiento'),(22,1,'Carapachay'),(23,1,'Carhue'),(24,1,'CarilÃ³'),(25,1,'Carlos Casares'),(26,1,'Carlos Tejedor'),(27,1,'Carmen de Areco'),(28,1,'Carmen de Patagones'),(29,1,'Castelli'),(30,1,'Chacabuco'),(31,1,'ChascomÃºs'),(32,1,'Chivilcoy'),(33,1,'ColÃ³n'),(34,1,'Coronel Dorrego'),(35,1,'Coronel Pringles'),(36,1,'Coronel Rosales'),(37,1,'Coronel Suarez'),(38,1,'Costa Azul'),(39,1,'Costa Chica'),(40,1,'Costa del Este'),(41,1,'Costa Esmeralda'),(42,1,'Daireaux'),(43,1,'Darregueira'),(44,1,'Del Viso'),(45,1,'Dolores'),(46,1,'Don Torcuato'),(47,1,'Ensenada'),(48,1,'Escobar'),(49,1,'ExaltaciÃ³n de la Cruz'),(50,1,'Florentino Ameghino'),(51,1,'GarÃ­n'),(52,1,'Gral. Alvarado'),(53,1,'Gral. Alvear'),(54,1,'Gral. Arenales'),(55,1,'Gral. Belgrano'),(56,1,'Gral. Guido'),(57,1,'Gral. Lamadrid'),(58,1,'Gral. Las Heras'),(59,1,'Gral. Lavalle'),(60,1,'Gral. Madariaga'),(61,1,'Gral. Pacheco'),(62,1,'Gral. Paz'),(63,1,'Gral. Pinto'),(64,1,'Gral. PueyrredÃ³n'),(65,1,'Gral. RodrÃ­guez'),(66,1,'Gral. Viamonte'),(67,1,'Gral. Villegas'),(68,1,'GuaminÃ­'),(69,1,'Guernica'),(70,1,'HipÃ³lito Yrigoyen'),(71,1,'Ing. Maschwitz'),(72,1,'JunÃ­n'),(73,1,'La Plata'),(74,1,'Laprida'),(75,1,'Las Flores'),(76,1,'Las Toninas'),(77,1,'Leandro N. Alem'),(78,1,'Lincoln'),(79,1,'Loberia'),(80,1,'Lobos'),(81,1,'Los Cardales'),(82,1,'Los Toldos'),(83,1,'Lucila del Mar'),(84,1,'LujÃ¡n'),(85,1,'Magdalena'),(86,1,'MaipÃº'),(87,1,'Mar Chiquita'),(88,1,'Mar de AjÃ³'),(89,1,'Mar de las Pampas'),(90,1,'Mar del Plata'),(91,1,'Mar del TuyÃº'),(92,1,'Marcos Paz'),(93,1,'Mercedes'),(94,1,'Miramar'),(95,1,'Monte'),(96,1,'Monte Hermoso'),(97,1,'Munro'),(98,1,'Navarro'),(99,1,'Necochea'),(100,1,'OlavarrÃ­a'),(101,1,'Partido de la Costa'),(102,1,'PehuajÃ³'),(103,1,'Pellegrini'),(104,1,'Pergamino'),(105,1,'PigÃ¼Ã©'),(106,1,'Pila'),(107,1,'Pilar'),(108,1,'Pinamar'),(109,1,'Pinar del Sol'),(110,1,'Polvorines'),(111,1,'Pte. PerÃ³n'),(112,1,'PuÃ¡n'),(113,1,'Punta Indio'),(114,1,'Ramallo'),(115,1,'Rauch'),(116,1,'Rivadavia'),(117,1,'Rojas'),(118,1,'Roque PÃ©rez'),(119,1,'Saavedra'),(120,1,'Saladillo'),(121,1,'SalliquelÃ³'),(122,1,'Salto'),(123,1,'San AndrÃ©s de Giles'),(124,1,'San Antonio de Areco'),(125,1,'San Antonio de Padua'),(126,1,'San Bernardo'),(127,1,'San Cayetano'),(128,1,'San Clemente del TuyÃº'),(129,1,'San NicolÃ¡s'),(130,1,'San Pedro'),(131,1,'San Vicente'),(132,1,'Santa Teresita'),(133,1,'Suipacha'),(134,1,'Tandil'),(135,1,'TapalquÃ©'),(136,1,'Tordillo'),(137,1,'Tornquist'),(138,1,'Trenque Lauquen'),(139,1,'Tres Lomas'),(140,1,'Villa Gesell'),(141,1,'Villarino'),(142,1,'ZÃ¡rate'),(143,2,'11 de Septiembre'),(144,2,'20 de Junio'),(145,2,'25 de Mayo'),(146,2,'Acassuso'),(147,2,'AdroguÃ©'),(148,2,'Aldo Bonzi'),(149,2,'Ãrea Reserva CinturÃ³n EcolÃ³gico'),(150,2,'Avellaneda'),(151,2,'Banfield'),(152,2,'Barrio Parque'),(153,2,'Barrio Santa Teresita'),(154,2,'Beccar'),(155,2,'Bella Vista'),(156,2,'Berazategui'),(157,2,'Bernal Este'),(158,2,'Bernal Oeste'),(159,2,'Billinghurst'),(160,2,'Boulogne'),(161,2,'Burzaco'),(162,2,'Carapachay'),(163,2,'Caseros'),(164,2,'Castelar'),(165,2,'Churruca'),(166,2,'Ciudad Evita'),(167,2,'Ciudad Madero'),(168,2,'Ciudadela'),(169,2,'Claypole'),(170,2,'Crucecita'),(171,2,'Dock Sud'),(172,2,'Don Bosco'),(173,2,'Don Orione'),(174,2,'El JagÃ¼el'),(175,2,'El Libertador'),(176,2,'El Palomar'),(177,2,'El Tala'),(178,2,'El TrÃ©bol'),(179,2,'Ezeiza'),(180,2,'Ezpeleta'),(181,2,'Florencio Varela'),(182,2,'Florida'),(183,2,'Francisco Ãlvarez'),(184,2,'Gerli'),(185,2,'Glew'),(186,2,'GonzÃ¡lez CatÃ¡n'),(187,2,'Gral. Lamadrid'),(188,2,'Grand Bourg'),(189,2,'Gregorio de Laferrere'),(190,2,'Guillermo Enrique Hudson'),(191,2,'Haedo'),(192,2,'Hurlingham'),(193,2,'Ing. Sourdeaux'),(194,2,'Isidro Casanova'),(195,2,'ItuzaingÃ³'),(196,2,'JosÃ© C. Paz'),(197,2,'JosÃ© Ingenieros'),(198,2,'JosÃ© Marmol'),(199,2,'La Lucila'),(200,2,'La Reja'),(201,2,'La Tablada'),(202,2,'LanÃºs'),(203,2,'Llavallol'),(204,2,'Loma Hermosa'),(205,2,'Lomas de Zamora'),(206,2,'Lomas del MillÃ³n'),(207,2,'Lomas del Mirador'),(208,2,'Longchamps'),(209,2,'Los Polvorines'),(210,2,'Luis GuillÃ³n'),(211,2,'Malvinas Argentinas'),(212,2,'MartÃ­n Coronado'),(213,2,'MartÃ­nez'),(214,2,'Merlo'),(215,2,'Ministro Rivadavia'),(216,2,'Monte Chingolo'),(217,2,'Monte Grande'),(218,2,'Moreno'),(219,2,'MorÃ³n'),(220,2,'MuÃ±iz'),(221,2,'Olivos'),(222,2,'Pablo NoguÃ©s'),(223,2,'Pablo PodestÃ¡'),(224,2,'Paso del Rey'),(225,2,'Pereyra'),(226,2,'PiÃ±eiro'),(227,2,'PlÃ¡tanos'),(228,2,'Pontevedra'),(229,2,'Quilmes'),(230,2,'Rafael Calzada'),(231,2,'Rafael Castillo'),(232,2,'Ramos MejÃ­a'),(233,2,'Ranelagh'),(234,2,'Remedios de Escalada'),(235,2,'SÃ¡enz PeÃ±a'),(236,2,'San Antonio de Padua'),(237,2,'San Fernando'),(238,2,'San Francisco Solano'),(239,2,'San Isidro'),(240,2,'San JosÃ©'),(241,2,'San Justo'),(242,2,'San MartÃ­n'),(243,2,'San Miguel'),(244,2,'Santos Lugares'),(245,2,'SarandÃ­'),(246,2,'Sourigues'),(247,2,'Tapiales'),(248,2,'Temperley'),(249,2,'Tigre'),(250,2,'Tortuguitas'),(251,2,'TristÃ¡n SuÃ¡rez'),(252,2,'Trujui'),(253,2,'Turdera'),(254,2,'ValentÃ­n Alsina'),(255,2,'Vicente LÃ³pez'),(256,2,'Villa Adelina'),(257,2,'Villa Ballester'),(258,2,'Villa Bosch'),(259,2,'Villa Caraza'),(260,2,'Villa Celina'),(261,2,'Villa Centenario'),(262,2,'Villa de Mayo'),(263,2,'Villa Diamante'),(264,2,'Villa DomÃ­nico'),(265,2,'Villa EspaÃ±a'),(266,2,'Villa Fiorito'),(267,2,'Villa Guillermina'),(268,2,'Villa Insuperable'),(269,2,'Villa JosÃ© LeÃ³n SuÃ¡rez'),(270,2,'Villa La Florida'),(271,2,'Villa Luzuriaga'),(272,2,'Villa Martelli'),(273,2,'Villa Obrera'),(274,2,'Villa Progreso'),(275,2,'Villa Raffo'),(276,2,'Villa Sarmiento'),(277,2,'Villa Tesei'),(278,2,'Villa Udaondo'),(279,2,'Virrey del Pino'),(280,2,'Wilde'),(281,2,'William Morris'),(282,3,'AgronomÃ­a'),(283,3,'Almagro'),(284,3,'Balvanera'),(285,3,'Barracas'),(286,3,'Belgrano'),(287,3,'Boca'),(288,3,'Boedo'),(289,3,'Caballito'),(290,3,'Chacarita'),(291,3,'Coghlan'),(292,3,'Colegiales'),(293,3,'ConstituciÃ³n'),(294,3,'Flores'),(295,3,'Floresta'),(296,3,'La Paternal'),(297,3,'Liniers'),(298,3,'Mataderos'),(299,3,'Monserrat'),(300,3,'Monte Castro'),(301,3,'Nueva Pompeya'),(302,3,'NÃºÃ±ez'),(303,3,'Palermo'),(304,3,'Parque Avellaneda'),(305,3,'Parque Chacabuco'),(306,3,'Parque Chas'),(307,3,'Parque Patricios'),(308,3,'Puerto Madero'),(309,3,'Recoleta'),(310,3,'Retiro'),(311,3,'Saavedra'),(312,3,'San CristÃ³bal'),(313,3,'San NicolÃ¡s'),(314,3,'San Telmo'),(315,3,'VÃ©lez SÃ¡rsfield'),(316,3,'Versalles'),(317,3,'Villa Crespo'),(318,3,'Villa del Parque'),(319,3,'Villa Devoto'),(320,3,'Villa Gral. Mitre'),(321,3,'Villa Lugano'),(322,3,'Villa Luro'),(323,3,'Villa OrtÃºzar'),(324,3,'Villa PueyrredÃ³n'),(325,3,'Villa Real'),(326,3,'Villa Riachuelo'),(327,3,'Villa Santa Rita'),(328,3,'Villa Soldati'),(329,3,'Villa Urquiza'),(330,4,'Aconquija'),(331,4,'Ancasti'),(332,4,'AndalgalÃ¡'),(333,4,'Antofagasta'),(334,4,'BelÃ©n'),(335,4,'CapayÃ¡n'),(336,4,'Capital'),(337,4,'4'),(338,4,'Corral Quemado'),(339,4,'El Alto'),(340,4,'El Rodeo'),(341,4,'F.Mamerto EsquiÃº'),(342,4,'FiambalÃ¡'),(343,4,'HualfÃ­n'),(344,4,'Huillapima'),(345,4,'IcaÃ±o'),(346,4,'La Puerta'),(347,4,'Las Juntas'),(348,4,'Londres'),(349,4,'Los Altos'),(350,4,'Los Varela'),(351,4,'MutquÃ­n'),(352,4,'PaclÃ­n'),(353,4,'Poman'),(354,4,'Pozo de La Piedra'),(355,4,'Puerta de Corral'),(356,4,'Puerta San JosÃ©'),(357,4,'Recreo'),(358,4,'S.F.V de 4'),(359,4,'San Fernando'),(360,4,'San Fernando del Valle'),(361,4,'San JosÃ©'),(362,4,'Santa MarÃ­a'),(363,4,'Santa Rosa'),(364,4,'Saujil'),(365,4,'Tapso'),(366,4,'Tinogasta'),(367,4,'Valle Viejo'),(368,4,'Villa Vil'),(369,5,'AviÃ¡ TeraÃ­'),(370,5,'Barranqueras'),(371,5,'Basail'),(372,5,'Campo Largo'),(373,5,'Capital'),(374,5,'CapitÃ¡n Solari'),(375,5,'Charadai'),(376,5,'Charata'),(377,5,'Chorotis'),(378,5,'Ciervo Petiso'),(379,5,'Cnel. Du Graty'),(380,5,'Col. BenÃ­tez'),(381,5,'Col. Elisa'),(382,5,'Col. Popular'),(383,5,'Colonias Unidas'),(384,5,'ConcepciÃ³n'),(385,5,'Corzuela'),(386,5,'Cote Lai'),(387,5,'El Sauzalito'),(388,5,'Enrique Urien'),(389,5,'Fontana'),(390,5,'Fte. Esperanza'),(391,5,'Gancedo'),(392,5,'Gral. Capdevila'),(393,5,'Gral. Pinero'),(394,5,'Gral. San MartÃ­n'),(395,5,'Gral. Vedia'),(396,5,'Hermoso Campo'),(397,5,'I. del Cerrito'),(398,5,'J.J. Castelli'),(399,5,'La Clotilde'),(400,5,'La Eduvigis'),(401,5,'La Escondida'),(402,5,'La Leonesa'),(403,5,'La Tigra'),(404,5,'La Verde'),(405,5,'Laguna Blanca'),(406,5,'Laguna Limpia'),(407,5,'Lapachito'),(408,5,'Las BreÃ±as'),(409,5,'Las Garcitas'),(410,5,'Las Palmas'),(411,5,'Los Frentones'),(412,5,'Machagai'),(413,5,'MakallÃ©'),(414,5,'Margarita BelÃ©n'),(415,5,'Miraflores'),(416,5,'MisiÃ³n N. Pompeya'),(417,5,'Napenay'),(418,5,'Pampa AlmirÃ³n'),(419,5,'Pampa del Indio'),(420,5,'Pampa del Infierno'),(421,5,'Pdcia. de La Plaza'),(422,5,'Pdcia. Roca'),(423,5,'Pdcia. Roque SÃ¡enz PeÃ±a'),(424,5,'Pto. Bermejo'),(425,5,'Pto. Eva PerÃ³n'),(426,5,'Puero Tirol'),(427,5,'Puerto Vilelas'),(428,5,'Quitilipi'),(429,5,'Resistencia'),(430,5,'SÃ¡enz PeÃ±a'),(431,5,'SamuhÃº'),(432,5,'San Bernardo'),(433,5,'Santa Sylvina'),(434,5,'Taco Pozo'),(435,5,'Tres Isletas'),(436,5,'Villa Ãngela'),(437,5,'Villa Berthet'),(438,5,'Villa R. Bermejito'),(439,6,'Aldea Apeleg'),(440,6,'Aldea Beleiro'),(441,6,'Aldea Epulef'),(442,6,'Alto RÃ­o Sengerr'),(443,6,'Buen Pasto'),(444,6,'Camarones'),(445,6,'CarrenleufÃº'),(446,6,'Cholila'),(447,6,'Co. Centinela'),(448,6,'Colan ConhuÃ©'),(449,6,'Comodoro Rivadavia'),(450,6,'Corcovado'),(451,6,'Cushamen'),(452,6,'Dique F. Ameghino'),(453,6,'DolavÃ³n'),(454,6,'Dr. R. Rojas'),(455,6,'El Hoyo'),(456,6,'El MaitÃ©n'),(457,6,'EpuyÃ©n'),(458,6,'Esquel'),(459,6,'Facundo'),(460,6,'GaimÃ¡n'),(461,6,'Gan Gan'),(462,6,'Gastre'),(463,6,'Gdor. Costa'),(464,6,'Gualjaina'),(465,6,'J. de San MartÃ­n'),(466,6,'Lago Blanco'),(467,6,'Lago Puelo'),(468,6,'Lagunita Salada'),(469,6,'Las Plumas'),(470,6,'Los Altares'),(471,6,'Paso de los Indios'),(472,6,'Paso del Sapo'),(473,6,'Pto. Madryn'),(474,6,'Pto. PirÃ¡mides'),(475,6,'Rada Tilly'),(476,6,'Rawson'),(477,6,'RÃ­o Mayo'),(478,6,'RÃ­o Pico'),(479,6,'Sarmiento'),(480,6,'Tecka'),(481,6,'Telsen'),(482,6,'Trelew'),(483,6,'Trevelin'),(484,6,'Veintiocho de Julio'),(485,7,'Achiras'),(486,7,'Adelia Maria'),(487,7,'Agua de Oro'),(488,7,'Alcira Gigena'),(489,7,'Aldea Santa Maria'),(490,7,'Alejandro Roca'),(491,7,'Alejo Ledesma'),(492,7,'Alicia'),(493,7,'Almafuerte'),(494,7,'Alpa Corral'),(495,7,'Alta Gracia'),(496,7,'Alto Alegre'),(497,7,'Alto de Los Quebrachos'),(498,7,'Altos de Chipion'),(499,7,'Amboy'),(500,7,'Ambul'),(501,7,'Ana Zumaran'),(502,7,'Anisacate'),(503,7,'Arguello'),(504,7,'Arias'),(505,7,'Arroyito'),(506,7,'Arroyo Algodon'),(507,7,'Arroyo Cabral'),(508,7,'Arroyo Los Patos'),(509,7,'Assunta'),(510,7,'Atahona'),(511,7,'Ausonia'),(512,7,'Avellaneda'),(513,7,'Ballesteros'),(514,7,'Ballesteros Sud'),(515,7,'Balnearia'),(516,7,'BaÃ±ado de Soto'),(517,7,'Bell Ville'),(518,7,'Bengolea'),(519,7,'Benjamin Gould'),(520,7,'Berrotaran'),(521,7,'Bialet Masse'),(522,7,'Bouwer'),(523,7,'Brinkmann'),(524,7,'Buchardo'),(525,7,'Bulnes'),(526,7,'Cabalango'),(527,7,'Calamuchita'),(528,7,'Calchin'),(529,7,'Calchin Oeste'),(530,7,'Calmayo'),(531,7,'Camilo Aldao'),(532,7,'Caminiaga'),(533,7,'CaÃ±ada de Luque'),(534,7,'CaÃ±ada de Machado'),(535,7,'CaÃ±ada de Rio Pinto'),(536,7,'CaÃ±ada del Sauce'),(537,7,'Canals'),(538,7,'Candelaria Sud'),(539,7,'Capilla de Remedios'),(540,7,'Capilla de Siton'),(541,7,'Capilla del Carmen'),(542,7,'Capilla del Monte'),(543,7,'Capital'),(544,7,'Capitan Gral B. OÂ´Higgins'),(545,7,'Carnerillo'),(546,7,'Carrilobo'),(547,7,'Casa Grande'),(548,7,'Cavanagh'),(549,7,'Cerro Colorado'),(550,7,'ChajÃ¡n'),(551,7,'Chalacea'),(552,7,'ChaÃ±ar Viejo'),(553,7,'ChancanÃ­'),(554,7,'Charbonier'),(555,7,'Charras'),(556,7,'ChazÃ³n'),(557,7,'Chilibroste'),(558,7,'Chucul'),(559,7,'ChuÃ±a'),(560,7,'ChuÃ±a Huasi'),(561,7,'Churqui CaÃ±ada'),(562,7,'Cienaga Del Coro'),(563,7,'Cintra'),(564,7,'Col. Almada'),(565,7,'Col. Anita'),(566,7,'Col. Barge'),(567,7,'Col. Bismark'),(568,7,'Col. Bremen'),(569,7,'Col. Caroya'),(570,7,'Col. Italiana'),(571,7,'Col. Iturraspe'),(572,7,'Col. Las Cuatro Esquinas'),(573,7,'Col. Las Pichanas'),(574,7,'Col. Marina'),(575,7,'Col. Prosperidad'),(576,7,'Col. San Bartolome'),(577,7,'Col. San Pedro'),(578,7,'Col. Tirolesa'),(579,7,'Col. Vicente Aguero'),(580,7,'Col. Videla'),(581,7,'Col. Vignaud'),(582,7,'Col. Waltelina'),(583,7,'Colazo'),(584,7,'Comechingones'),(585,7,'Conlara'),(586,7,'Copacabana'),(587,7,'7'),(588,7,'Coronel Baigorria'),(589,7,'Coronel Moldes'),(590,7,'Corral de Bustos'),(591,7,'Corralito'),(592,7,'CosquÃ­n'),(593,7,'Costa Sacate'),(594,7,'Cruz Alta'),(595,7,'Cruz de CaÃ±a'),(596,7,'Cruz del Eje'),(597,7,'Cuesta Blanca'),(598,7,'Dean Funes'),(599,7,'Del Campillo'),(600,7,'DespeÃ±aderos'),(601,7,'Devoto'),(602,7,'Diego de Rojas'),(603,7,'Dique Chico'),(604,7,'El AraÃ±ado'),(605,7,'El Brete'),(606,7,'El Chacho'),(607,7,'El CrispÃ­n'),(608,7,'El FortÃ­n'),(609,7,'El Manzano'),(610,7,'El Rastreador'),(611,7,'El Rodeo'),(612,7,'El TÃ­o'),(613,7,'Elena'),(614,7,'Embalse'),(615,7,'Esquina'),(616,7,'EstaciÃ³n Gral. Paz'),(617,7,'EstaciÃ³n JuÃ¡rez Celman'),(618,7,'Estancia de Guadalupe'),(619,7,'Estancia Vieja'),(620,7,'Etruria'),(621,7,'Eufrasio Loza'),(622,7,'Falda del Carmen'),(623,7,'Freyre'),(624,7,'Gral. Baldissera'),(625,7,'Gral. Cabrera'),(626,7,'Gral. Deheza'),(627,7,'Gral. Fotheringham'),(628,7,'Gral. Levalle'),(629,7,'Gral. Roca'),(630,7,'Guanaco Muerto'),(631,7,'Guasapampa'),(632,7,'Guatimozin'),(633,7,'Gutenberg'),(634,7,'Hernando'),(635,7,'Huanchillas'),(636,7,'Huerta Grande'),(637,7,'Huinca Renanco'),(638,7,'Idiazabal'),(639,7,'Impira'),(640,7,'Inriville'),(641,7,'Isla Verde'),(642,7,'ItalÃ³'),(643,7,'James Craik'),(644,7,'JesÃºs MarÃ­a'),(645,7,'Jovita'),(646,7,'Justiniano Posse'),(647,7,'Km 658'),(648,7,'L. V. Mansilla'),(649,7,'La Batea'),(650,7,'La Calera'),(651,7,'La Carlota'),(652,7,'La Carolina'),(653,7,'La Cautiva'),(654,7,'La Cesira'),(655,7,'La Cruz'),(656,7,'La Cumbre'),(657,7,'La Cumbrecita'),(658,7,'La Falda'),(659,7,'La Francia'),(660,7,'La Granja'),(661,7,'La Higuera'),(662,7,'La Laguna'),(663,7,'La Paisanita'),(664,7,'La Palestina'),(665,7,'12'),(666,7,'La Paquita'),(667,7,'La Para'),(668,7,'La Paz'),(669,7,'La Playa'),(670,7,'La Playosa'),(671,7,'La PoblaciÃ³n'),(672,7,'La Posta'),(673,7,'La Puerta'),(674,7,'La Quinta'),(675,7,'La Rancherita'),(676,7,'La Rinconada'),(677,7,'La Serranita'),(678,7,'La Tordilla'),(679,7,'Laborde'),(680,7,'Laboulaye'),(681,7,'Laguna Larga'),(682,7,'Las Acequias'),(683,7,'Las Albahacas'),(684,7,'Las Arrias'),(685,7,'Las Bajadas'),(686,7,'Las Caleras'),(687,7,'Las Calles'),(688,7,'Las CaÃ±adas'),(689,7,'Las Gramillas'),(690,7,'Las Higueras'),(691,7,'Las Isletillas'),(692,7,'Las Junturas'),(693,7,'Las Palmas'),(694,7,'Las PeÃ±as'),(695,7,'Las PeÃ±as Sud'),(696,7,'Las Perdices'),(697,7,'Las Playas'),(698,7,'Las Rabonas'),(699,7,'Las Saladas'),(700,7,'Las Tapias'),(701,7,'Las Varas'),(702,7,'Las Varillas'),(703,7,'Las Vertientes'),(704,7,'LeguizamÃ³n'),(705,7,'Leones'),(706,7,'Los Cedros'),(707,7,'Los Cerrillos'),(708,7,'Los ChaÃ±aritos (C.E)'),(709,7,'Los Chanaritos (R.S)'),(710,7,'Los Cisnes'),(711,7,'Los Cocos'),(712,7,'Los CÃ³ndores'),(713,7,'Los Hornillos'),(714,7,'Los Hoyos'),(715,7,'Los Mistoles'),(716,7,'Los Molinos'),(717,7,'Los Pozos'),(718,7,'Los Reartes'),(719,7,'Los Surgentes'),(720,7,'Los Talares'),(721,7,'Los Zorros'),(722,7,'Lozada'),(723,7,'Luca'),(724,7,'Luque'),(725,7,'Luyaba'),(726,7,'MalagueÃ±o'),(727,7,'Malena'),(728,7,'Malvinas Argentinas'),(729,7,'Manfredi'),(730,7,'Maquinista Gallini'),(731,7,'Marcos JuÃ¡rez'),(732,7,'Marull'),(733,7,'Matorrales'),(734,7,'Mattaldi'),(735,7,'Mayu Sumaj'),(736,7,'Media Naranja'),(737,7,'Melo'),(738,7,'Mendiolaza'),(739,7,'Mi Granja'),(740,7,'Mina Clavero'),(741,7,'Miramar'),(742,7,'Morrison'),(743,7,'Morteros'),(744,7,'Mte. Buey'),(745,7,'Mte. Cristo'),(746,7,'Mte. De Los Gauchos'),(747,7,'Mte. LeÃ±a'),(748,7,'Mte. MaÃ­z'),(749,7,'Mte. Ralo'),(750,7,'NicolÃ¡s Bruzone'),(751,7,'Noetinger'),(752,7,'Nono'),(753,7,'Nueva 7'),(754,7,'Obispo Trejo'),(755,7,'Olaeta'),(756,7,'Oliva'),(757,7,'Olivares San NicolÃ¡s'),(758,7,'Onagolty'),(759,7,'Oncativo'),(760,7,'OrdoÃ±ez'),(761,7,'Pacheco De Melo'),(762,7,'Pampayasta N.'),(763,7,'Pampayasta S.'),(764,7,'Panaholma'),(765,7,'Pascanas'),(766,7,'Pasco'),(767,7,'Paso del Durazno'),(768,7,'Paso Viejo'),(769,7,'Pilar'),(770,7,'PincÃ©n'),(771,7,'PiquillÃ­n'),(772,7,'Plaza de Mercedes'),(773,7,'Plaza Luxardo'),(774,7,'PorteÃ±a'),(775,7,'Potrero de Garay'),(776,7,'Pozo del Molle'),(777,7,'Pozo Nuevo'),(778,7,'Pueblo Italiano'),(779,7,'Puesto de Castro'),(780,7,'Punta del Agua'),(781,7,'Quebracho Herrado'),(782,7,'Quilino'),(783,7,'Rafael GarcÃ­a'),(784,7,'Ranqueles'),(785,7,'Rayo Cortado'),(786,7,'ReducciÃ³n'),(787,7,'RincÃ³n'),(788,7,'RÃ­o Bamba'),(789,7,'RÃ­o Ceballos'),(790,7,'RÃ­o Cuarto'),(791,7,'RÃ­o de Los Sauces'),(792,7,'RÃ­o Primero'),(793,7,'RÃ­o Segundo'),(794,7,'RÃ­o Tercero'),(795,7,'Rosales'),(796,7,'Rosario del Saladillo'),(797,7,'Sacanta'),(798,7,'Sagrada Familia'),(799,7,'Saira'),(800,7,'Saladillo'),(801,7,'SaldÃ¡n'),(802,7,'Salsacate'),(803,7,'Salsipuedes'),(804,7,'Sampacho'),(805,7,'San AgustÃ­n'),(806,7,'San Antonio de Arredondo'),(807,7,'San Antonio de LitÃ­n'),(808,7,'San Basilio'),(809,7,'San Carlos Minas'),(810,7,'San Clemente'),(811,7,'San Esteban'),(812,7,'San Francisco'),(813,7,'San Ignacio'),(814,7,'San Javier'),(815,7,'San JerÃ³nimo'),(816,7,'San JoaquÃ­n'),(817,7,'San JosÃ© de La Dormida'),(818,7,'San JosÃ© de Las Salinas'),(819,7,'San Lorenzo'),(820,7,'San Marcos Sierras'),(821,7,'San Marcos Sud'),(822,7,'San Pedro'),(823,7,'San Pedro N.'),(824,7,'San Roque'),(825,7,'San Vicente'),(826,7,'Santa Catalina'),(827,7,'Santa Elena'),(828,7,'Santa Eufemia'),(829,7,'Santa Maria'),(830,7,'Sarmiento'),(831,7,'Saturnino M.Laspiur'),(832,7,'Sauce Arriba'),(833,7,'SebastiÃ¡n Elcano'),(834,7,'Seeber'),(835,7,'Segunda Usina'),(836,7,'Serrano'),(837,7,'Serrezuela'),(838,7,'Sgo. Temple'),(839,7,'Silvio Pellico'),(840,7,'Simbolar'),(841,7,'Sinsacate'),(842,7,'Sta. Rosa de Calamuchita'),(843,7,'Sta. Rosa de RÃ­o Primero'),(844,7,'Suco'),(845,7,'Tala CaÃ±ada'),(846,7,'Tala Huasi'),(847,7,'Talaini'),(848,7,'Tancacha'),(849,7,'Tanti'),(850,7,'Ticino'),(851,7,'Tinoco'),(852,7,'TÃ­o Pujio'),(853,7,'Toledo'),(854,7,'Toro Pujio'),(855,7,'Tosno'),(856,7,'Tosquita'),(857,7,'TrÃ¡nsito'),(858,7,'Tuclame'),(859,7,'Tutti'),(860,7,'Ucacha'),(861,7,'Unquillo'),(862,7,'Valle de Anisacate'),(863,7,'Valle Hermoso'),(864,7,'VÃ©lez Sarfield'),(865,7,'Viamonte'),(866,7,'VicuÃ±a Mackenna'),(867,7,'Villa Allende'),(868,7,'Villa Amancay'),(869,7,'Villa Ascasubi'),(870,7,'Villa Candelaria N.'),(871,7,'Villa Carlos Paz'),(872,7,'Villa Cerro Azul'),(873,7,'Villa Ciudad de AmÃ©rica'),(874,7,'Villa Ciudad Pque Los Reartes'),(875,7,'Villa ConcepciÃ³n del TÃ­o'),(876,7,'Villa Cura Brochero'),(877,7,'Villa de Las Rosas'),(878,7,'Villa de MarÃ­a'),(879,7,'Villa de Pocho'),(880,7,'Villa de Soto'),(881,7,'Villa del Dique'),(882,7,'Villa del Prado'),(883,7,'Villa del Rosario'),(884,7,'Villa del Totoral'),(885,7,'Villa Dolores'),(886,7,'Villa El Chancay'),(887,7,'Villa Elisa'),(888,7,'Villa Flor Serrana'),(889,7,'Villa Fontana'),(890,7,'Villa Giardino'),(891,7,'Villa Gral. Belgrano'),(892,7,'Villa Gutierrez'),(893,7,'Villa Huidobro'),(894,7,'Villa La Bolsa'),(895,7,'Villa Los Aromos'),(896,7,'Villa Los Patos'),(897,7,'Villa MarÃ­a'),(898,7,'Villa Nueva'),(899,7,'Villa Pque. Santa Ana'),(900,7,'Villa Pque. Siquiman'),(901,7,'Villa Quillinzo'),(902,7,'Villa Rossi'),(903,7,'Villa Rumipal'),(904,7,'Villa San Esteban'),(905,7,'Villa San Isidro'),(906,7,'Villa 21'),(907,7,'Villa Sarmiento (G.R)'),(908,7,'Villa Sarmiento (S.A)'),(909,7,'Villa Tulumba'),(910,7,'Villa Valeria'),(911,7,'Villa Yacanto'),(912,7,'Washington'),(913,7,'Wenceslao Escalante'),(914,7,'Ycho Cruz Sierras'),(915,8,'Alvear'),(916,8,'Bella Vista'),(917,8,'BerÃ³n de Astrada'),(918,8,'Bonpland'),(919,8,'CaÃ¡ Cati'),(920,8,'Capital'),(921,8,'ChavarrÃ­a'),(922,8,'Col. C. Pellegrini'),(923,8,'Col. Libertad'),(924,8,'Col. Liebig'),(925,8,'Col. Sta Rosa'),(926,8,'ConcepciÃ³n'),(927,8,'Cruz de Los Milagros'),(928,8,'CuruzÃº-CuatiÃ¡'),(929,8,'Empedrado'),(930,8,'Esquina'),(931,8,'EstaciÃ³n Torrent'),(932,8,'Felipe YofrÃ©'),(933,8,'Garruchos'),(934,8,'Gdor. AgrÃ³nomo'),(935,8,'Gdor. MartÃ­nez'),(936,8,'Goya'),(937,8,'Guaviravi'),(938,8,'Herlitzka'),(939,8,'Ita-Ibate'),(940,8,'ItatÃ­'),(941,8,'ItuzaingÃ³'),(942,8,'JosÃ© Rafael GÃ³mez'),(943,8,'Juan Pujol'),(944,8,'La Cruz'),(945,8,'Lavalle'),(946,8,'Lomas de Vallejos'),(947,8,'Loreto'),(948,8,'Mariano I. Loza'),(949,8,'MburucuyÃ¡'),(950,8,'Mercedes'),(951,8,'MocoretÃ¡'),(952,8,'Mte. Caseros'),(953,8,'Nueve de Julio'),(954,8,'Palmar Grande'),(955,8,'Parada Pucheta'),(956,8,'Paso de La Patria'),(957,8,'Paso de Los Libres'),(958,8,'Pedro R. Fernandez'),(959,8,'PerugorrÃ­a'),(960,8,'Pueblo Libertador'),(961,8,'Ramada Paso'),(962,8,'Riachuelo'),(963,8,'Saladas'),(964,8,'San Antonio'),(965,8,'San Carlos'),(966,8,'San Cosme'),(967,8,'San Lorenzo'),(968,8,'20 del Palmar'),(969,8,'San Miguel'),(970,8,'San Roque'),(971,8,'Santa Ana'),(972,8,'Santa LucÃ­a'),(973,8,'Santo TomÃ©'),(974,8,'Sauce'),(975,8,'Tabay'),(976,8,'TapebicuÃ¡'),(977,8,'Tatacua'),(978,8,'Virasoro'),(979,8,'YapeyÃº'),(980,8,'YataitÃ­ Calle'),(981,9,'AlarcÃ³n'),(982,9,'Alcaraz'),(983,9,'Alcaraz N.'),(984,9,'Alcaraz S.'),(985,9,'Aldea AsunciÃ³n'),(986,9,'Aldea Brasilera'),(987,9,'Aldea Elgenfeld'),(988,9,'Aldea Grapschental'),(989,9,'Aldea Ma. Luisa'),(990,9,'Aldea Protestante'),(991,9,'Aldea Salto'),(992,9,'Aldea San Antonio (G)'),(993,9,'Aldea San Antonio (P)'),(994,9,'Aldea 19'),(995,9,'Aldea San Miguel'),(996,9,'Aldea San Rafael'),(997,9,'Aldea Spatzenkutter'),(998,9,'Aldea Sta. MarÃ­a'),(999,9,'Aldea Sta. Rosa'),(1000,9,'Aldea Valle MarÃ­a'),(1001,9,'Altamirano Sur'),(1002,9,'Antelo'),(1003,9,'Antonio TomÃ¡s'),(1004,9,'Aranguren'),(1005,9,'Arroyo BarÃº'),(1006,9,'Arroyo Burgos'),(1007,9,'Arroyo ClÃ©'),(1008,9,'Arroyo Corralito'),(1009,9,'Arroyo del Medio'),(1010,9,'Arroyo Maturrango'),(1011,9,'Arroyo Palo Seco'),(1012,9,'Banderas'),(1013,9,'Basavilbaso'),(1014,9,'Betbeder'),(1015,9,'Bovril'),(1016,9,'Caseros'),(1017,9,'Ceibas'),(1018,9,'Cerrito'),(1019,9,'ChajarÃ­'),(1020,9,'Chilcas'),(1021,9,'Clodomiro Ledesma'),(1022,9,'Col. Alemana'),(1023,9,'Col. Avellaneda'),(1024,9,'Col. Avigdor'),(1025,9,'Col. AyuÃ­'),(1026,9,'Col. Baylina'),(1027,9,'Col. Carrasco'),(1028,9,'Col. Celina'),(1029,9,'Col. Cerrito'),(1030,9,'Col. Crespo'),(1031,9,'Col. Elia'),(1032,9,'Col. Ensayo'),(1033,9,'Col. Gral. Roca'),(1034,9,'Col. La Argentina'),(1035,9,'Col. Merou'),(1036,9,'Col. Oficial NÂª3'),(1037,9,'Col. Oficial NÂº13'),(1038,9,'Col. Oficial NÂº14'),(1039,9,'Col. Oficial NÂº5'),(1040,9,'Col. Reffino'),(1041,9,'Col. Tunas'),(1042,9,'Col. VirarÃ³'),(1043,9,'ColÃ³n'),(1044,9,'ConcepciÃ³n del Uruguay'),(1045,9,'Concordia'),(1046,9,'Conscripto Bernardi'),(1047,9,'Costa Grande'),(1048,9,'Costa San Antonio'),(1049,9,'Costa Uruguay N.'),(1050,9,'Costa Uruguay S.'),(1051,9,'Crespo'),(1052,9,'Crucecitas 3Âª'),(1053,9,'Crucecitas 7Âª'),(1054,9,'Crucecitas 8Âª'),(1055,9,'Cuchilla Redonda'),(1056,9,'Curtiembre'),(1057,9,'Diamante'),(1058,9,'Distrito 6Âº'),(1059,9,'Distrito ChaÃ±ar'),(1060,9,'Distrito Chiqueros'),(1061,9,'Distrito Cuarto'),(1062,9,'Distrito Diego LÃ³pez'),(1063,9,'Distrito Pajonal'),(1064,9,'Distrito Sauce'),(1065,9,'Distrito Tala'),(1066,9,'Distrito Talitas'),(1067,9,'Don CristÃ³bal 1Âª SecciÃ³n'),(1068,9,'Don CristÃ³bal 2Âª SecciÃ³n'),(1069,9,'Durazno'),(1070,9,'El CimarrÃ³n'),(1071,9,'El Gramillal'),(1072,9,'El Palenque'),(1073,9,'El Pingo'),(1074,9,'El Quebracho'),(1075,9,'El RedomÃ³n'),(1076,9,'El Solar'),(1077,9,'Enrique Carbo'),(1078,9,'9'),(1079,9,'Espinillo N.'),(1080,9,'EstaciÃ³n Campos'),(1081,9,'EstaciÃ³n EscriÃ±a'),(1082,9,'EstaciÃ³n Lazo'),(1083,9,'EstaciÃ³n RaÃ­ces'),(1084,9,'EstaciÃ³n YerÃºa'),(1085,9,'Estancia Grande'),(1086,9,'Estancia LÃ­baros'),(1087,9,'Estancia Racedo'),(1088,9,'Estancia SolÃ¡'),(1089,9,'Estancia YuquerÃ­'),(1090,9,'Estaquitas'),(1091,9,'Faustino M. Parera'),(1092,9,'Febre'),(1093,9,'FederaciÃ³n'),(1094,9,'Federal'),(1095,9,'Gdor. EchagÃ¼e'),(1096,9,'Gdor. Mansilla'),(1097,9,'Gilbert'),(1098,9,'GonzÃ¡lez CalderÃ³n'),(1099,9,'Gral. Almada'),(1100,9,'Gral. Alvear'),(1101,9,'Gral. Campos'),(1102,9,'Gral. Galarza'),(1103,9,'Gral. RamÃ­rez'),(1104,9,'Gualeguay'),(1105,9,'GualeguaychÃº'),(1106,9,'Gualeguaycito'),(1107,9,'Guardamonte'),(1108,9,'Hambis'),(1109,9,'Hasenkamp'),(1110,9,'Hernandarias'),(1111,9,'HernÃ¡ndez'),(1112,9,'Herrera'),(1113,9,'Hinojal'),(1114,9,'Hocker'),(1115,9,'Ing. Sajaroff'),(1116,9,'Irazusta'),(1117,9,'Isletas'),(1118,9,'J.J De Urquiza'),(1119,9,'Jubileo'),(1120,9,'La Clarita'),(1121,9,'La Criolla'),(1122,9,'La Esmeralda'),(1123,9,'La Florida'),(1124,9,'La Fraternidad'),(1125,9,'La Hierra'),(1126,9,'La Ollita'),(1127,9,'La Paz'),(1128,9,'La Picada'),(1129,9,'La Providencia'),(1130,9,'La Verbena'),(1131,9,'Laguna BenÃ­tez'),(1132,9,'Larroque'),(1133,9,'Las Cuevas'),(1134,9,'Las Garzas'),(1135,9,'Las Guachas'),(1136,9,'Las Mercedes'),(1137,9,'Las Moscas'),(1138,9,'Las Mulitas'),(1139,9,'Las Toscas'),(1140,9,'Laurencena'),(1141,9,'Libertador San MartÃ­n'),(1142,9,'Loma Limpia'),(1143,9,'Los Ceibos'),(1144,9,'Los Charruas'),(1145,9,'Los Conquistadores'),(1146,9,'Lucas GonzÃ¡lez'),(1147,9,'Lucas N.'),(1148,9,'Lucas S. 1Âª'),(1149,9,'Lucas S. 2Âª'),(1150,9,'MaciÃ¡'),(1151,9,'MarÃ­a Grande'),(1152,9,'MarÃ­a Grande 2Âª'),(1153,9,'MÃ©danos'),(1154,9,'Mojones N.'),(1155,9,'Mojones S.'),(1156,9,'Molino Doll'),(1157,9,'Monte Redondo'),(1158,9,'Montoya'),(1159,9,'Mulas Grandes'),(1160,9,'Ã‘ancay'),(1161,9,'NogoyÃ¡'),(1162,9,'Nueva Escocia'),(1163,9,'Nueva Vizcaya'),(1164,9,'OmbÃº'),(1165,9,'Oro Verde'),(1166,9,'ParanÃ¡'),(1167,9,'Pasaje Guayaquil'),(1168,9,'Pasaje Las Tunas'),(1169,9,'Paso de La Arena'),(1170,9,'Paso de La Laguna'),(1171,9,'Paso de Las Piedras'),(1172,9,'Paso Duarte'),(1173,9,'Pastor Britos'),(1174,9,'Pedernal'),(1175,9,'Perdices'),(1176,9,'Picada BerÃ³n'),(1177,9,'Piedras Blancas'),(1178,9,'Primer Distrito Cuchilla'),(1179,9,'Primero de Mayo'),(1180,9,'Pronunciamiento'),(1181,9,'Pto. Algarrobo'),(1182,9,'Pto. Ibicuy'),(1183,9,'Pueblo Brugo'),(1184,9,'Pueblo Cazes'),(1185,9,'Pueblo Gral. Belgrano'),(1186,9,'Pueblo Liebig'),(1187,9,'Puerto YeruÃ¡'),(1188,9,'Punta del Monte'),(1189,9,'Quebracho'),(1190,9,'Quinto Distrito'),(1191,9,'Raices Oeste'),(1192,9,'RincÃ³n de NogoyÃ¡'),(1193,9,'RincÃ³n del Cinto'),(1194,9,'RincÃ³n del Doll'),(1195,9,'RincÃ³n del Gato'),(1196,9,'Rocamora'),(1197,9,'Rosario del Tala'),(1198,9,'San Benito'),(1199,9,'San Cipriano'),(1200,9,'San Ernesto'),(1201,9,'San Gustavo'),(1202,9,'San Jaime'),(1203,9,'San JosÃ©'),(1204,9,'San JosÃ© de Feliciano'),(1205,9,'San Justo'),(1206,9,'San Marcial'),(1207,9,'San Pedro'),(1208,9,'San RamÃ­rez'),(1209,9,'San RamÃ³n'),(1210,9,'San Roque'),(1211,9,'San Salvador'),(1212,9,'San VÃ­ctor'),(1213,9,'Santa Ana'),(1214,9,'Santa Anita'),(1215,9,'Santa Elena'),(1216,9,'Santa LucÃ­a'),(1217,9,'Santa Luisa'),(1218,9,'Sauce de Luna'),(1219,9,'Sauce Montrull'),(1220,9,'Sauce Pinto'),(1221,9,'Sauce Sur'),(1222,9,'SeguÃ­'),(1223,9,'Sir Leonard'),(1224,9,'Sosa'),(1225,9,'Tabossi'),(1226,9,'Tezanos Pinto'),(1227,9,'Ubajay'),(1228,9,'Urdinarrain'),(1229,9,'Veinte de Septiembre'),(1230,9,'Viale'),(1231,9,'Victoria'),(1232,9,'Villa Clara'),(1233,9,'Villa del Rosario'),(1234,9,'Villa DomÃ­nguez'),(1235,9,'Villa Elisa'),(1236,9,'Villa Fontana'),(1237,9,'Villa Gdor. Etchevehere'),(1238,9,'Villa Mantero'),(1239,9,'Villa Paranacito'),(1240,9,'Villa Urquiza'),(1241,9,'Villaguay'),(1242,9,'Walter Moss'),(1243,9,'YacarÃ©'),(1244,9,'Yeso Oeste'),(1245,10,'Buena Vista'),(1246,10,'Clorinda'),(1247,10,'Col. Pastoril'),(1248,10,'Cte. Fontana'),(1249,10,'El Colorado'),(1250,10,'El Espinillo'),(1251,10,'Estanislao Del Campo'),(1252,10,'10'),(1253,10,'FortÃ­n Lugones'),(1254,10,'Gral. Lucio V. Mansilla'),(1255,10,'Gral. Manuel Belgrano'),(1256,10,'Gral. Mosconi'),(1257,10,'Gran Guardia'),(1258,10,'Herradura'),(1259,10,'Ibarreta'),(1260,10,'Ing. JuÃ¡rez'),(1261,10,'Laguna Blanca'),(1262,10,'Laguna Naick Neck'),(1263,10,'Laguna Yema'),(1264,10,'Las Lomitas'),(1265,10,'Los Chiriguanos'),(1266,10,'Mayor V. VillafaÃ±e'),(1267,10,'MisiÃ³n San Fco.'),(1268,10,'Palo Santo'),(1269,10,'PiranÃ©'),(1270,10,'Pozo del Maza'),(1271,10,'Riacho He-He'),(1272,10,'San Hilario'),(1273,10,'San MartÃ­n II'),(1274,10,'Siete Palmas'),(1275,10,'Subteniente PerÃ­n'),(1276,10,'Tres Lagunas'),(1277,10,'Villa Dos Trece'),(1278,10,'Villa Escolar'),(1279,10,'Villa Gral. GÃ¼emes'),(1280,11,'Abdon Castro Tolay'),(1281,11,'Abra Pampa'),(1282,11,'Abralaite'),(1283,11,'Aguas Calientes'),(1284,11,'Arrayanal'),(1285,11,'Barrios'),(1286,11,'Caimancito'),(1287,11,'Calilegua'),(1288,11,'Cangrejillos'),(1289,11,'Caspala'),(1290,11,'CatuÃ¡'),(1291,11,'Cieneguillas'),(1292,11,'Coranzulli'),(1293,11,'Cusi-Cusi'),(1294,11,'El Aguilar'),(1295,11,'El Carmen'),(1296,11,'El CÃ³ndor'),(1297,11,'El Fuerte'),(1298,11,'El Piquete'),(1299,11,'El Talar'),(1300,11,'Fraile Pintado'),(1301,11,'HipÃ³lito Yrigoyen'),(1302,11,'Huacalera'),(1303,11,'Humahuaca'),(1304,11,'La Esperanza'),(1305,11,'La Mendieta'),(1306,11,'La Quiaca'),(1307,11,'Ledesma'),(1308,11,'Libertador Gral. San Martin'),(1309,11,'Maimara'),(1310,11,'Mina Pirquitas'),(1311,11,'Monterrico'),(1312,11,'Palma Sola'),(1313,11,'PalpalÃ¡'),(1314,11,'Pampa Blanca'),(1315,11,'Pampichuela'),(1316,11,'Perico'),(1317,11,'Puesto del MarquÃ©s'),(1318,11,'Puesto Viejo'),(1319,11,'Pumahuasi'),(1320,11,'Purmamarca'),(1321,11,'Rinconada'),(1322,11,'Rodeitos'),(1323,11,'Rosario de RÃ­o Grande'),(1324,11,'San Antonio'),(1325,11,'San Francisco'),(1326,11,'San Pedro'),(1327,11,'San Rafael'),(1328,11,'San Salvador'),(1329,11,'Santa Ana'),(1330,11,'Santa Catalina'),(1331,11,'Santa Clara'),(1332,11,'Susques'),(1333,11,'Tilcara'),(1334,11,'Tres Cruces'),(1335,11,'Tumbaya'),(1336,11,'Valle Grande'),(1337,11,'Vinalito'),(1338,11,'VolcÃ¡n'),(1339,11,'Yala'),(1340,11,'YavÃ­'),(1341,11,'Yuto'),(1342,12,'Abramo'),(1343,12,'Adolfo Van Praet'),(1344,12,'Agustoni'),(1345,12,'Algarrobo del Aguila'),(1346,12,'Alpachiri'),(1347,12,'Alta Italia'),(1348,12,'Anguil'),(1349,12,'Arata'),(1350,12,'Ataliva Roca'),(1351,12,'Bernardo Larroude'),(1352,12,'Bernasconi'),(1353,12,'CaleufÃº'),(1354,12,'Carro Quemado'),(1355,12,'CatrilÃ³'),(1356,12,'Ceballos'),(1357,12,'Chacharramendi'),(1358,12,'Col. BarÃ³n'),(1359,12,'Col. Santa MarÃ­a'),(1360,12,'Conhelo'),(1361,12,'Coronel Hilario Lagos'),(1362,12,'Cuchillo-CÃ³'),(1363,12,'Doblas'),(1364,12,'Dorila'),(1365,12,'Eduardo Castex'),(1366,12,'Embajador Martini'),(1367,12,'Falucho'),(1368,12,'Gral. Acha'),(1369,12,'Gral. Manuel Campos'),(1370,12,'Gral. Pico'),(1371,12,'GuatrachÃ©'),(1372,12,'Ing. Luiggi'),(1373,12,'Intendente Alvear'),(1374,12,'Jacinto Arauz'),(1375,12,'La Adela'),(1376,12,'La Humada'),(1377,12,'La Maruja'),(1378,12,'12'),(1379,12,'La Reforma'),(1380,12,'Limay Mahuida'),(1381,12,'Lonquimay'),(1382,12,'Loventuel'),(1383,12,'Luan Toro'),(1384,12,'MacachÃ­n'),(1385,12,'Maisonnave'),(1386,12,'Mauricio Mayer'),(1387,12,'Metileo'),(1388,12,'Miguel CanÃ©'),(1389,12,'Miguel Riglos'),(1390,12,'Monte Nievas'),(1391,12,'Parera'),(1392,12,'PerÃº'),(1393,12,'Pichi-Huinca'),(1394,12,'Puelches'),(1395,12,'PuelÃ©n'),(1396,12,'Quehue'),(1397,12,'QuemÃº QuemÃº'),(1398,12,'QuetrequÃ©n'),(1399,12,'Rancul'),(1400,12,'RealicÃ³'),(1401,12,'Relmo'),(1402,12,'RolÃ³n'),(1403,12,'Rucanelo'),(1404,12,'Sarah'),(1405,12,'Speluzzi'),(1406,12,'Sta. Isabel'),(1407,12,'Sta. Rosa'),(1408,12,'Sta. Teresa'),(1409,12,'TelÃ©n'),(1410,12,'Toay'),(1411,12,'Tomas M. de Anchorena'),(1412,12,'Trenel'),(1413,12,'Unanue'),(1414,12,'Uriburu'),(1415,12,'Veinticinco de Mayo'),(1416,12,'Vertiz'),(1417,12,'Victorica'),(1418,12,'Villa Mirasol'),(1419,12,'Winifreda'),(1420,13,'Arauco'),(1421,13,'Capital'),(1422,13,'Castro Barros'),(1423,13,'Chamical'),(1424,13,'Chilecito'),(1425,13,'Coronel F. Varela'),(1426,13,'Famatina'),(1427,13,'Gral. A.V.PeÃ±aloza'),(1428,13,'Gral. Belgrano'),(1429,13,'Gral. J.F. Quiroga'),(1430,13,'Gral. Lamadrid'),(1431,13,'Gral. Ocampo'),(1432,13,'Gral. San MartÃ­n'),(1433,13,'Independencia'),(1434,13,'Rosario Penaloza'),(1435,13,'San Blas de Los Sauces'),(1436,13,'Sanagasta'),(1437,13,'Vinchina'),(1438,14,'Capital'),(1439,14,'Chacras de Coria'),(1440,14,'Dorrego'),(1441,14,'Gllen'),(1442,14,'Godoy Cruz'),(1443,14,'Gral. Alvear'),(1444,14,'GuaymallÃ©n'),(1445,14,'JunÃ­n'),(1446,14,'La Paz'),(1447,14,'Las Heras'),(1448,14,'Lavalle'),(1449,14,'LujÃ¡n'),(1450,14,'LujÃ¡n De Cuyo'),(1451,14,'MaipÃº'),(1452,14,'MalargÃ¼e'),(1453,14,'Rivadavia'),(1454,14,'San Carlos'),(1455,14,'San MartÃ­n'),(1456,14,'San Rafael'),(1457,14,'Sta. Rosa'),(1458,14,'TunuyÃ¡n'),(1459,14,'Tupungato'),(1460,14,'Villa Nueva'),(1461,15,'Alba Posse'),(1462,15,'Almafuerte'),(1463,15,'ApÃ³stoles'),(1464,15,'AristÃ³bulo Del Valle'),(1465,15,'Arroyo Del Medio'),(1466,15,'Azara'),(1467,15,'Bdo. De Irigoyen'),(1468,15,'Bonpland'),(1469,15,'CaÃ¡ Yari'),(1470,15,'Campo Grande'),(1471,15,'Campo RamÃ³n'),(1472,15,'Campo Viera'),(1473,15,'Candelaria'),(1474,15,'CapiovÃ­'),(1475,15,'Caraguatay'),(1476,15,'Cdte. GuacurarÃ­'),(1477,15,'Cerro Azul'),(1478,15,'Cerro CorÃ¡'),(1479,15,'Col. Alberdi'),(1480,15,'Col. Aurora'),(1481,15,'Col. Delicia'),(1482,15,'Col. Polana'),(1483,15,'Col. Victoria'),(1484,15,'Col. Wanda'),(1485,15,'ConcepciÃ³n De La Sierra'),(1486,15,'Corpus'),(1487,15,'Dos Arroyos'),(1488,15,'Dos de Mayo'),(1489,15,'El AlcÃ¡zar'),(1490,15,'El Dorado'),(1491,15,'El Soberbio'),(1492,15,'Esperanza'),(1493,15,'F. Ameghino'),(1494,15,'Fachinal'),(1495,15,'GaruhapÃ©'),(1496,15,'GarupÃ¡'),(1497,15,'Gdor. LÃ³pez'),(1498,15,'Gdor. Roca'),(1499,15,'Gral. Alvear'),(1500,15,'Gral. Urquiza'),(1501,15,'GuaranÃ­'),(1502,15,'H. Yrigoyen'),(1503,15,'IguazÃº'),(1504,15,'ItacaruarÃ©'),(1505,15,'JardÃ­n AmÃ©rica'),(1506,15,'Leandro N. Alem'),(1507,15,'Libertad'),(1508,15,'Loreto'),(1509,15,'Los Helechos'),(1510,15,'MÃ¡rtires'),(1511,15,'15'),(1512,15,'MojÃ³n Grande'),(1513,15,'Montecarlo'),(1514,15,'Nueve de Julio'),(1515,15,'OberÃ¡'),(1516,15,'Olegario V. Andrade'),(1517,15,'PanambÃ­'),(1518,15,'Posadas'),(1519,15,'Profundidad'),(1520,15,'Pto. IguazÃº'),(1521,15,'Pto. Leoni'),(1522,15,'Pto. Piray'),(1523,15,'Pto. Rico'),(1524,15,'Ruiz de Montoya'),(1525,15,'San Antonio'),(1526,15,'San Ignacio'),(1527,15,'San Javier'),(1528,15,'San JosÃ©'),(1529,15,'San MartÃ­n'),(1530,15,'San Pedro'),(1531,15,'San Vicente'),(1532,15,'Santiago De Liniers'),(1533,15,'Santo Pipo'),(1534,15,'Sta. Ana'),(1535,15,'Sta. MarÃ­a'),(1536,15,'Tres Capones'),(1537,15,'Veinticinco de Mayo'),(1538,15,'Wanda'),(1539,16,'Aguada San Roque'),(1540,16,'AluminÃ©'),(1541,16,'Andacollo'),(1542,16,'AÃ±elo'),(1543,16,'Bajada del Agrio'),(1544,16,'Barrancas'),(1545,16,'Buta Ranquil'),(1546,16,'Capital'),(1547,16,'CaviahuÃ©'),(1548,16,'Centenario'),(1549,16,'Chorriaca'),(1550,16,'Chos Malal'),(1551,16,'Cipolletti'),(1552,16,'Covunco Abajo'),(1553,16,'Coyuco Cochico'),(1554,16,'Cutral CÃ³'),(1555,16,'El Cholar'),(1556,16,'El HuecÃº'),(1557,16,'El Sauce'),(1558,16,'GuaÃ±acos'),(1559,16,'Huinganco'),(1560,16,'Las Coloradas'),(1561,16,'Las Lajas'),(1562,16,'Las Ovejas'),(1563,16,'LoncopuÃ©'),(1564,16,'Los Catutos'),(1565,16,'Los Chihuidos'),(1566,16,'Los Miches'),(1567,16,'Manzano Amargo'),(1568,16,'16'),(1569,16,'Octavio Pico'),(1570,16,'Paso Aguerre'),(1571,16,'PicÃºn LeufÃº'),(1572,16,'Piedra del Aguila'),(1573,16,'Pilo Lil'),(1574,16,'Plaza Huincul'),(1575,16,'Plottier'),(1576,16,'Quili Malal'),(1577,16,'RamÃ³n Castro'),(1578,16,'RincÃ³n de Los Sauces'),(1579,16,'San MartÃ­n de Los Andes'),(1580,16,'San Patricio del ChaÃ±ar'),(1581,16,'Santo TomÃ¡s'),(1582,16,'Sauzal Bonito'),(1583,16,'Senillosa'),(1584,16,'TaquimilÃ¡n'),(1585,16,'Tricao Malal'),(1586,16,'Varvarco'),(1587,16,'Villa CurÃ­ Leuvu'),(1588,16,'Villa del Nahueve'),(1589,16,'Villa del Puente PicÃºn LeuvÃº'),(1590,16,'Villa El ChocÃ³n'),(1591,16,'Villa La Angostura'),(1592,16,'Villa Pehuenia'),(1593,16,'Villa Traful'),(1594,16,'Vista Alegre'),(1595,16,'Zapala'),(1596,17,'Aguada Cecilio'),(1597,17,'Aguada de Guerra'),(1598,17,'AllÃ©n'),(1599,17,'Arroyo de La Ventana'),(1600,17,'Arroyo Los Berros'),(1601,17,'Bariloche'),(1602,17,'Calte. Cordero'),(1603,17,'Campo Grande'),(1604,17,'Catriel'),(1605,17,'Cerro PolicÃ­a'),(1606,17,'Cervantes'),(1607,17,'Chelforo'),(1608,17,'Chimpay'),(1609,17,'Chinchinales'),(1610,17,'Chipauquil'),(1611,17,'Choele Choel'),(1612,17,'Cinco Saltos'),(1613,17,'Cipolletti'),(1614,17,'Clemente Onelli'),(1615,17,'ColÃ¡n Conhue'),(1616,17,'Comallo'),(1617,17,'ComicÃ³'),(1618,17,'Cona Niyeu'),(1619,17,'Coronel Belisle'),(1620,17,'Cubanea'),(1621,17,'Darwin'),(1622,17,'Dina Huapi'),(1623,17,'El BolsÃ³n'),(1624,17,'El CaÃ­n'),(1625,17,'El Manso'),(1626,17,'Gral. Conesa'),(1627,17,'Gral. Enrique Godoy'),(1628,17,'Gral. Fernandez Oro'),(1629,17,'Gral. Roca'),(1630,17,'Guardia Mitre'),(1631,17,'Ing. Huergo'),(1632,17,'Ing. Jacobacci'),(1633,17,'Laguna Blanca'),(1634,17,'Lamarque'),(1635,17,'Las Grutas'),(1636,17,'Los Menucos'),(1637,17,'Luis BeltrÃ¡n'),(1638,17,'MainquÃ©'),(1639,17,'Mamuel Choique'),(1640,17,'Maquinchao'),(1641,17,'MencuÃ©'),(1642,17,'Mtro. Ramos Mexia'),(1643,17,'Nahuel Niyeu'),(1644,17,'Naupa Huen'),(1645,17,'Ã‘orquinco'),(1646,17,'Ojos de Agua'),(1647,17,'Paso de Agua'),(1648,17,'Paso Flores'),(1649,17,'PeÃ±as Blancas'),(1650,17,'Pichi Mahuida'),(1651,17,'Pilcaniyeu'),(1652,17,'Pomona'),(1653,17,'Prahuaniyeu'),(1654,17,'RincÃ³n Treneta'),(1655,17,'RÃ­o Chico'),(1656,17,'RÃ­o Colorado'),(1657,17,'Roca'),(1658,17,'San Antonio Oeste'),(1659,17,'San Javier'),(1660,17,'Sierra Colorada'),(1661,17,'Sierra Grande'),(1662,17,'Sierra PailemÃ¡n'),(1663,17,'Valcheta'),(1664,17,'Valle Azul'),(1665,17,'Viedma'),(1666,17,'Villa LlanquÃ­n'),(1667,17,'Villa Mascardi'),(1668,17,'Villa Regina'),(1669,17,'YaminuÃ©'),(1670,18,'A. Saravia'),(1671,18,'Aguaray'),(1672,18,'Angastaco'),(1673,18,'AnimanÃ¡'),(1674,18,'Cachi'),(1675,18,'Cafayate'),(1676,18,'Campo Quijano'),(1677,18,'Campo Santo'),(1678,18,'Capital'),(1679,18,'Cerrillos'),(1680,18,'Chicoana'),(1681,18,'Col. Sta. Rosa'),(1682,18,'Coronel Moldes'),(1683,18,'El Bordo'),(1684,18,'El Carril'),(1685,18,'El GalpÃ³n'),(1686,18,'El JardÃ­n'),(1687,18,'El Potrero'),(1688,18,'El Quebrachal'),(1689,18,'El Tala'),(1690,18,'EmbarcaciÃ³n'),(1691,18,'Gral. Ballivian'),(1692,18,'Gral. GÃ¼emes'),(1693,18,'Gral. Mosconi'),(1694,18,'Gral. Pizarro'),(1695,18,'Guachipas'),(1696,18,'HipÃ³lito Yrigoyen'),(1697,18,'IruyÃ¡'),(1698,18,'Isla De CaÃ±as'),(1699,18,'J. V. Gonzalez'),(1700,18,'La Caldera'),(1701,18,'La Candelaria'),(1702,18,'La Merced'),(1703,18,'La Poma'),(1704,18,'La ViÃ±a'),(1705,18,'Las Lajitas'),(1706,18,'Los Toldos'),(1707,18,'MetÃ¡n'),(1708,18,'Molinos'),(1709,18,'Nazareno'),(1710,18,'OrÃ¡n'),(1711,18,'Payogasta'),(1712,18,'Pichanal'),(1713,18,'Prof. S. Mazza'),(1714,18,'RÃ­o Piedras'),(1715,18,'Rivadavia Banda Norte'),(1716,18,'Rivadavia Banda Sur'),(1717,18,'Rosario de La Frontera'),(1718,18,'Rosario de Lerma'),(1719,18,'SaclantÃ¡s'),(1720,18,'18'),(1721,18,'San Antonio'),(1722,18,'San Carlos'),(1723,18,'San JosÃ© De MetÃ¡n'),(1724,18,'San RamÃ³n'),(1725,18,'Santa Victoria E.'),(1726,18,'Santa Victoria O.'),(1727,18,'Tartagal'),(1728,18,'Tolar Grande'),(1729,18,'Urundel'),(1730,18,'Vaqueros'),(1731,18,'Villa San Lorenzo'),(1732,19,'AlbardÃ³n'),(1733,19,'Angaco'),(1734,19,'Calingasta'),(1735,19,'Capital'),(1736,19,'Caucete'),(1737,19,'Chimbas'),(1738,19,'Iglesia'),(1739,19,'Jachal'),(1740,19,'Nueve de Julio'),(1741,19,'Pocito'),(1742,19,'Rawson'),(1743,19,'Rivadavia'),(1745,19,'San MartÃ­n'),(1746,19,'Santa LucÃ­a'),(1747,19,'Sarmiento'),(1748,19,'Ullum'),(1749,19,'Valle FÃ©rtil'),(1750,19,'Veinticinco de Mayo'),(1751,19,'Zonda'),(1752,20,'Alto Pelado'),(1753,20,'Alto Pencoso'),(1754,20,'Anchorena'),(1755,20,'Arizona'),(1756,20,'Bagual'),(1757,20,'Balde'),(1758,20,'Batavia'),(1759,20,'Beazley'),(1760,20,'Buena Esperanza'),(1761,20,'Candelaria'),(1762,20,'Capital'),(1763,20,'Carolina'),(1764,20,'CarpinterÃ­a'),(1765,20,'ConcarÃ¡n'),(1766,20,'Cortaderas'),(1767,20,'El Morro'),(1768,20,'El Trapiche'),(1769,20,'El VolcÃ¡n'),(1770,20,'FortÃ­n El Patria'),(1771,20,'Fortuna'),(1772,20,'Fraga'),(1773,20,'Juan Jorba'),(1774,20,'Juan Llerena'),(1775,20,'Juana Koslay'),(1776,20,'Justo Daract'),(1777,20,'La Calera'),(1778,20,'La Florida'),(1779,20,'La Punilla'),(1780,20,'La Toma'),(1781,20,'Lafinur'),(1782,20,'Las Aguadas'),(1783,20,'Las Chacras'),(1784,20,'Las Lagunas'),(1785,20,'Las Vertientes'),(1786,20,'Lavaisse'),(1787,20,'Leandro N. Alem'),(1788,20,'Los Molles'),(1789,20,'LujÃ¡n'),(1790,20,'Mercedes'),(1791,20,'Merlo'),(1792,20,'Naschel'),(1793,20,'Navia'),(1794,20,'NogolÃ­'),(1795,20,'Nueva Galia'),(1796,20,'Papagayos'),(1797,20,'Paso Grande'),(1798,20,'Potrero de Los Funes'),(1799,20,'Quines'),(1800,20,'Renca'),(1801,20,'Saladillo'),(1802,20,'San Francisco'),(1803,20,'San GerÃ³nimo'),(1804,20,'San MartÃ­n'),(1805,20,'San Pablo'),(1806,20,'Santa Rosa de Conlara'),(1807,20,'Talita'),(1808,20,'Tilisarao'),(1809,20,'UniÃ³n'),(1810,20,'Villa de La Quebrada'),(1811,20,'Villa de Praga'),(1812,20,'Villa del Carmen'),(1813,20,'Villa Gral. Roca'),(1814,20,'Villa Larca'),(1815,20,'Villa Mercedes'),(1816,20,'Zanjitas'),(1817,21,'Calafate'),(1818,21,'Caleta Olivia'),(1819,21,'CaÃ±adÃ³n Seco'),(1820,21,'Comandante Piedrabuena'),(1821,21,'El Calafate'),(1822,21,'El ChaltÃ©n'),(1823,21,'Gdor. Gregores'),(1824,21,'HipÃ³lito Yrigoyen'),(1825,21,'Jaramillo'),(1826,21,'Koluel Kaike'),(1827,21,'Las Heras'),(1828,21,'Los Antiguos'),(1829,21,'Perito Moreno'),(1830,21,'Pico Truncado'),(1831,21,'Pto. Deseado'),(1832,21,'Pto. San JuliÃ¡n'),(1833,21,'Pto. 21'),(1834,21,'RÃ­o Cuarto'),(1835,21,'RÃ­o Gallegos'),(1836,21,'RÃ­o Turbio'),(1837,21,'Tres Lagos'),(1838,21,'Veintiocho De Noviembre'),(1839,22,'AarÃ³n Castellanos'),(1840,22,'Acebal'),(1841,22,'AguarÃ¡ Grande'),(1842,22,'Albarellos'),(1843,22,'Alcorta'),(1844,22,'Aldao'),(1845,22,'Alejandra'),(1846,22,'Ãlvarez'),(1847,22,'Ambrosetti'),(1848,22,'AmenÃ¡bar'),(1849,22,'AngÃ©lica'),(1850,22,'Angeloni'),(1851,22,'Arequito'),(1852,22,'Arminda'),(1853,22,'Armstrong'),(1854,22,'Arocena'),(1855,22,'Arroyo Aguiar'),(1856,22,'Arroyo Ceibal'),(1857,22,'Arroyo Leyes'),(1858,22,'Arroyo Seco'),(1859,22,'ArrufÃ³'),(1860,22,'Arteaga'),(1861,22,'Ataliva'),(1862,22,'Aurelia'),(1863,22,'Avellaneda'),(1864,22,'Barrancas'),(1865,22,'Bauer Y Sigel'),(1866,22,'Bella Italia'),(1867,22,'BerabevÃº'),(1868,22,'Berna'),(1869,22,'Bernardo de Irigoyen'),(1870,22,'Bigand'),(1871,22,'Bombal'),(1872,22,'Bouquet'),(1873,22,'Bustinza'),(1874,22,'Cabal'),(1875,22,'Cacique Ariacaiquin'),(1876,22,'Cafferata'),(1877,22,'CalchaquÃ­'),(1878,22,'Campo Andino'),(1879,22,'Campo Piaggio'),(1880,22,'CaÃ±ada de GÃ³mez'),(1881,22,'CaÃ±ada del Ucle'),(1882,22,'CaÃ±ada Rica'),(1883,22,'CaÃ±ada RosquÃ­n'),(1884,22,'Candioti'),(1885,22,'Capital'),(1886,22,'CapitÃ¡n BermÃºdez'),(1887,22,'Capivara'),(1888,22,'CarcaraÃ±Ã¡'),(1889,22,'Carlos Pellegrini'),(1890,22,'Carmen'),(1891,22,'Carmen Del Sauce'),(1892,22,'Carreras'),(1893,22,'Carrizales'),(1894,22,'Casalegno'),(1895,22,'Casas'),(1896,22,'Casilda'),(1897,22,'Castelar'),(1898,22,'Castellanos'),(1899,22,'CayastÃ¡'),(1900,22,'Cayastacito'),(1901,22,'Centeno'),(1902,22,'Cepeda'),(1903,22,'Ceres'),(1904,22,'ChabÃ¡s'),(1905,22,'ChaÃ±ar Ladeado'),(1906,22,'Chapuy'),(1907,22,'Chovet'),(1908,22,'Christophersen'),(1909,22,'Classon'),(1910,22,'Cnel. Arnold'),(1911,22,'Cnel. Bogado'),(1912,22,'Cnel. Dominguez'),(1913,22,'Cnel. Fraga'),(1914,22,'Col. Aldao'),(1915,22,'Col. Ana'),(1916,22,'Col. Belgrano'),(1917,22,'Col. Bicha'),(1918,22,'Col. Bigand'),(1919,22,'Col. Bossi'),(1920,22,'Col. Cavour'),(1921,22,'Col. Cello'),(1922,22,'Col. Dolores'),(1923,22,'Col. Dos Rosas'),(1924,22,'Col. DurÃ¡n'),(1925,22,'Col. Iturraspe'),(1926,22,'Col. Margarita'),(1927,22,'Col. Mascias'),(1928,22,'Col. Raquel'),(1929,22,'Col. Rosa'),(1930,22,'Col. San JosÃ©'),(1931,22,'Constanza'),(1932,22,'Coronda'),(1933,22,'Correa'),(1934,22,'Crispi'),(1935,22,'CululÃº'),(1936,22,'Curupayti'),(1937,22,'Desvio ArijÃ³n'),(1938,22,'Diaz'),(1939,22,'Diego de Alvear'),(1940,22,'Egusquiza'),(1941,22,'El ArazÃ¡'),(1942,22,'El RabÃ³n'),(1943,22,'El Sombrerito'),(1944,22,'El TrÃ©bol'),(1945,22,'Elisa'),(1946,22,'Elortondo'),(1947,22,'Emilia'),(1948,22,'Empalme San Carlos'),(1949,22,'Empalme Villa Constitucion'),(1950,22,'Esmeralda'),(1951,22,'Esperanza'),(1952,22,'EstaciÃ³n Alvear'),(1953,22,'Estacion Clucellas'),(1954,22,'Esteban Rams'),(1955,22,'Esther'),(1956,22,'Esustolia'),(1957,22,'Eusebia'),(1958,22,'Felicia'),(1959,22,'Fidela'),(1960,22,'Fighiera'),(1961,22,'Firmat'),(1962,22,'Florencia'),(1963,22,'FortÃ­n Olmos'),(1964,22,'Franck'),(1965,22,'Fray Luis BeltrÃ¡n'),(1966,22,'Frontera'),(1967,22,'Fuentes'),(1968,22,'Funes'),(1969,22,'Gaboto'),(1970,22,'Galisteo'),(1971,22,'GÃ¡lvez'),(1972,22,'Garabalto'),(1973,22,'Garibaldi'),(1974,22,'Gato Colorado'),(1975,22,'Gdor. Crespo'),(1976,22,'Gessler'),(1977,22,'Godoy'),(1978,22,'Golondrina'),(1979,22,'Gral. Gelly'),(1980,22,'Gral. Lagos'),(1981,22,'Granadero Baigorria'),(1982,22,'Gregoria Perez De Denis'),(1983,22,'Grutly'),(1984,22,'Guadalupe N.'),(1985,22,'GÃ¶deken'),(1986,22,'Helvecia'),(1987,22,'Hersilia'),(1988,22,'HipatÃ­a'),(1989,22,'Huanqueros'),(1990,22,'Hugentobler'),(1991,22,'Hughes'),(1992,22,'Humberto 1Âº'),(1993,22,'Humboldt'),(1994,22,'Ibarlucea'),(1995,22,'Ing. Chanourdie'),(1996,22,'Intiyaco'),(1997,22,'ItuzaingÃ³'),(1998,22,'Jacinto L. ArÃ¡uz'),(1999,22,'Josefina'),(2000,22,'Juan B. Molina'),(2001,22,'Juan de Garay'),(2002,22,'Juncal'),(2003,22,'La Brava'),(2004,22,'La Cabral'),(2005,22,'La Camila'),(2006,22,'La Chispa'),(2007,22,'La Clara'),(2008,22,'La Criolla'),(2009,22,'La Gallareta'),(2010,22,'La Lucila'),(2011,22,'La Pelada'),(2012,22,'La Penca'),(2013,22,'La Rubia'),(2014,22,'La Sarita'),(2015,22,'La Vanguardia'),(2016,22,'Labordeboy'),(2017,22,'Laguna Paiva'),(2018,22,'Landeta'),(2019,22,'Lanteri'),(2020,22,'Larrechea'),(2021,22,'Las Avispas'),(2022,22,'Las Bandurrias'),(2023,22,'Las Garzas'),(2024,22,'Las Palmeras'),(2025,22,'Las Parejas'),(2026,22,'Las Petacas'),(2027,22,'Las Rosas'),(2028,22,'Las Toscas'),(2029,22,'Las Tunas'),(2030,22,'Lazzarino'),(2031,22,'Lehmann'),(2032,22,'Llambi Campbell'),(2033,22,'LogroÃ±o'),(2034,22,'Loma Alta'),(2035,22,'LÃ³pez'),(2036,22,'Los Amores'),(2037,22,'Los Cardos'),(2038,22,'Los Laureles'),(2039,22,'Los Molinos'),(2040,22,'Los Quirquinchos'),(2041,22,'Lucio V. Lopez'),(2042,22,'Luis Palacios'),(2043,22,'Ma. Juana'),(2044,22,'Ma. Luisa'),(2045,22,'Ma. Susana'),(2046,22,'Ma. Teresa'),(2047,22,'Maciel'),(2048,22,'Maggiolo'),(2049,22,'Malabrigo'),(2050,22,'Marcelino Escalada'),(2051,22,'Margarita'),(2052,22,'Matilde'),(2053,22,'MauÃ¡'),(2054,22,'MÃ¡ximo Paz'),(2055,22,'MelincuÃ©'),(2056,22,'Miguel Torres'),(2057,22,'MoisÃ©s Ville'),(2058,22,'Monigotes'),(2059,22,'Monje'),(2060,22,'Monte Obscuridad'),(2061,22,'Monte Vera'),(2062,22,'Montefiore'),(2063,22,'Montes de Oca'),(2064,22,'Murphy'),(2065,22,'Ã‘anducita'),(2066,22,'NarÃ©'),(2067,22,'Nelson'),(2068,22,'Nicanor E. Molinas'),(2069,22,'Nuevo Torino'),(2070,22,'Oliveros'),(2071,22,'Palacios'),(2072,22,'PavÃ³n'),(2073,22,'PavÃ³n Arriba'),(2074,22,'Pedro GÃ³mez Cello'),(2075,22,'PÃ©rez'),(2076,22,'Peyrano'),(2077,22,'Piamonte'),(2078,22,'Pilar'),(2079,22,'PiÃ±ero'),(2080,22,'Plaza Clucellas'),(2081,22,'Portugalete'),(2082,22,'Pozo Borrado'),(2083,22,'Progreso'),(2084,22,'Providencia'),(2085,22,'Pte. Roca'),(2086,22,'Pueblo Andino'),(2087,22,'Pueblo Esther'),(2088,22,'Pueblo Gral. San MartÃ­n'),(2089,22,'Pueblo Irigoyen'),(2090,22,'Pueblo Marini'),(2091,22,'Pueblo MuÃ±oz'),(2092,22,'Pueblo Uranga'),(2093,22,'Pujato'),(2094,22,'Pujato N.'),(2095,22,'Rafaela'),(2096,22,'RamayÃ³n'),(2097,22,'Ramona'),(2098,22,'Reconquista'),(2099,22,'Recreo'),(2100,22,'Ricardone'),(2101,22,'Rivadavia'),(2102,22,'RoldÃ¡n'),(2103,22,'Romang'),(2104,22,'Rosario'),(2105,22,'Rueda'),(2106,22,'Rufino'),(2107,22,'Sa Pereira'),(2108,22,'Saguier'),(2109,22,'Saladero M. Cabal'),(2110,22,'Salto Grande'),(2111,22,'San AgustÃ­n'),(2112,22,'San Antonio de Obligado'),(2113,22,'San Bernardo (N.J.)'),(2114,22,'San Bernardo (S.J.)'),(2115,22,'San Carlos Centro'),(2116,22,'San Carlos N.'),(2117,22,'San Carlos S.'),(2118,22,'San CristÃ³bal'),(2119,22,'San Eduardo'),(2120,22,'San Eugenio'),(2121,22,'San FabiÃ¡n'),(2122,22,'San Fco. de Santa FÃ©'),(2123,22,'San Genaro'),(2124,22,'San Genaro N.'),(2125,22,'San Gregorio'),(2126,22,'San Guillermo'),(2127,22,'San Javier'),(2128,22,'San JerÃ³nimo del Sauce'),(2129,22,'San JerÃ³nimo N.'),(2130,22,'San JerÃ³nimo S.'),(2131,22,'San Jorge'),(2132,22,'San JosÃ© de La Esquina'),(2133,22,'San JosÃ© del RincÃ³n'),(2134,22,'San Justo'),(2135,22,'San Lorenzo'),(2136,22,'San Mariano'),(2137,22,'San MartÃ­n de Las Escobas'),(2138,22,'San MartÃ­n N.'),(2139,22,'San Vicente'),(2140,22,'Sancti Spititu'),(2141,22,'Sanford'),(2142,22,'Santo Domingo'),(2143,22,'Santo TomÃ©'),(2144,22,'Santurce'),(2145,22,'Sargento Cabral'),(2146,22,'Sarmiento'),(2147,22,'Sastre'),(2148,22,'Sauce Viejo'),(2149,22,'Serodino'),(2150,22,'Silva'),(2151,22,'Soldini'),(2152,22,'Soledad'),(2153,22,'Soutomayor'),(2154,22,'Sta. Clara de Buena Vista'),(2155,22,'Sta. Clara de Saguier'),(2156,22,'Sta. Isabel'),(2157,22,'Sta. Margarita'),(2158,22,'Sta. Maria Centro'),(2159,22,'Sta. MarÃ­a N.'),(2160,22,'Sta. Rosa'),(2161,22,'Sta. Teresa'),(2162,22,'Suardi'),(2163,22,'Sunchales'),(2164,22,'Susana'),(2165,22,'TacuarendÃ­'),(2166,22,'Tacural'),(2167,22,'Tartagal'),(2168,22,'Teodelina'),(2169,22,'Theobald'),(2170,22,'TimbÃºes'),(2171,22,'Toba'),(2172,22,'Tortugas'),(2173,22,'Tostado'),(2174,22,'Totoras'),(2175,22,'Traill'),(2176,22,'Venado Tuerto'),(2177,22,'Vera'),(2178,22,'Vera y Pintado'),(2179,22,'Videla'),(2180,22,'Vila'),(2181,22,'Villa Amelia'),(2182,22,'Villa Ana'),(2183,22,'Villa CaÃ±as'),(2184,22,'Villa ConstituciÃ³n'),(2185,22,'Villa EloÃ­sa'),(2186,22,'Villa Gdor. GÃ¡lvez'),(2187,22,'Villa Guillermina'),(2188,22,'Villa Minetti'),(2189,22,'Villa Mugueta'),(2190,22,'Villa Ocampo'),(2191,22,'Villa San JosÃ©'),(2192,22,'Villa Saralegui'),(2193,22,'Villa Trinidad'),(2194,22,'Villada'),(2195,22,'Virginia'),(2196,22,'Wheelwright'),(2197,22,'Zavalla'),(2198,22,'ZenÃ³n Pereira'),(2199,23,'AÃ±atuya'),(2200,23,'Ãrraga'),(2201,23,'Bandera'),(2202,23,'Bandera Bajada'),(2203,23,'BeltrÃ¡n'),(2204,23,'Brea Pozo'),(2205,23,'Campo Gallo'),(2206,23,'Capital'),(2207,23,'Chilca Juliana'),(2208,23,'Choya'),(2209,23,'Clodomira'),(2210,23,'Col. Alpina'),(2211,23,'Col. Dora'),(2212,23,'Col. El Simbolar Robles'),(2213,23,'El Bobadal'),(2214,23,'El Charco'),(2215,23,'El MojÃ³n'),(2216,23,'EstaciÃ³n Atamisqui'),(2217,23,'EstaciÃ³n Simbolar'),(2218,23,'FernÃ¡ndez'),(2219,23,'FortÃ­n Inca'),(2220,23,'FrÃ­as'),(2221,23,'Garza'),(2222,23,'Gramilla'),(2223,23,'Guardia Escolta'),(2224,23,'Herrera'),(2225,23,'IcaÃ±o'),(2226,23,'Ing. Forres'),(2227,23,'La Banda'),(2228,23,'La CaÃ±ada'),(2229,23,'Laprida'),(2230,23,'Lavalle'),(2231,23,'Loreto'),(2232,23,'Los JurÃ­es'),(2233,23,'Los NÃºÃ±ez'),(2234,23,'Los Pirpintos'),(2235,23,'Los Quiroga'),(2236,23,'Los Telares'),(2237,23,'Lugones'),(2238,23,'MalbrÃ¡n'),(2239,23,'Matara'),(2240,23,'MedellÃ­n'),(2241,23,'Monte Quemado'),(2242,23,'Nueva Esperanza'),(2243,23,'Nueva Francia'),(2244,23,'Palo Negro'),(2245,23,'Pampa de Los Guanacos'),(2246,23,'Pinto'),(2247,23,'Pozo Hondo'),(2248,23,'QuimilÃ­'),(2249,23,'Real Sayana'),(2250,23,'Sachayoj'),(2251,23,'San Pedro de GuasayÃ¡n'),(2252,23,'Selva'),(2253,23,'Sol de Julio'),(2254,23,'Sumampa'),(2255,23,'Suncho Corral'),(2256,23,'Taboada'),(2257,23,'Tapso'),(2258,23,'Termas de Rio Hondo'),(2259,23,'Tintina'),(2260,23,'Tomas Young'),(2261,23,'Vilelas'),(2262,23,'Villa Atamisqui'),(2263,23,'Villa La Punta'),(2264,23,'Villa Ojo de Agua'),(2265,23,'Villa RÃ­o Hondo'),(2266,23,'Villa Salavina'),(2267,23,'Villa UniÃ³n'),(2268,23,'Vilmer'),(2269,23,'Weisburd'),(2270,24,'RÃ­o Grande'),(2271,24,'Tolhuin'),(2272,24,'Ushuaia'),(2273,25,'Acheral'),(2274,25,'Agua Dulce'),(2275,25,'Aguilares'),(2276,25,'Alderetes'),(2277,25,'Alpachiri'),(2278,25,'Alto Verde'),(2279,25,'Amaicha del Valle'),(2280,25,'Amberes'),(2281,25,'Ancajuli'),(2282,25,'Arcadia'),(2283,25,'Atahona'),(2284,25,'Banda del RÃ­o Sali'),(2285,25,'Bella Vista'),(2286,25,'Buena Vista'),(2287,25,'BurruyacÃº'),(2288,25,'CapitÃ¡n CÃ¡ceres'),(2289,25,'Cevil Redondo'),(2290,25,'Choromoro'),(2291,25,'Ciudacita'),(2292,25,'Colalao del Valle'),(2293,25,'Colombres'),(2294,25,'ConcepciÃ³n'),(2295,25,'DelfÃ­n Gallo'),(2296,25,'El Bracho'),(2297,25,'El Cadillal'),(2298,25,'El Cercado'),(2299,25,'El ChaÃ±ar'),(2300,25,'El Manantial'),(2301,25,'El MojÃ³n'),(2302,25,'El Mollar'),(2303,25,'El Naranjito'),(2304,25,'El Naranjo'),(2305,25,'El Polear'),(2306,25,'El Puestito'),(2307,25,'El Sacrificio'),(2308,25,'El TimbÃ³'),(2309,25,'Escaba'),(2310,25,'Esquina'),(2311,25,'EstaciÃ³n ArÃ¡oz'),(2312,25,'FamaillÃ¡'),(2313,25,'Gastone'),(2314,25,'Gdor. Garmendia'),(2315,25,'Gdor. Piedrabuena'),(2316,25,'Graneros'),(2317,25,'Huasa Pampa'),(2318,25,'J. B. Alberdi'),(2319,25,'La Cocha'),(2320,25,'La Esperanza'),(2321,25,'La Florida'),(2322,25,'La Ramada'),(2323,25,'La Trinidad'),(2324,25,'Lamadrid'),(2325,25,'Las Cejas'),(2326,25,'Las Talas'),(2327,25,'Las Talitas'),(2328,25,'Los Bulacio'),(2329,25,'Los GÃ³mez'),(2330,25,'Los Nogales'),(2331,25,'Los Pereyra'),(2332,25,'Los PÃ©rez'),(2333,25,'Los Puestos'),(2334,25,'Los Ralos'),(2335,25,'Los Sarmientos'),(2336,25,'Los Sosa'),(2337,25,'Lules'),(2338,25,'M. GarcÃ­a FernÃ¡ndez'),(2339,25,'Manuela Pedraza'),(2340,25,'Medinas'),(2341,25,'Monte Bello'),(2342,25,'Monteagudo'),(2343,25,'Monteros'),(2344,25,'Padre Monti'),(2345,25,'Pampa Mayo'),(2346,25,'Quilmes'),(2347,25,'Raco'),(2348,25,'Ranchillos'),(2349,25,'RÃ­o Chico'),(2350,25,'RÃ­o Colorado'),(2351,25,'RÃ­o Seco'),(2352,25,'Rumi Punco'),(2353,25,'San AndrÃ©s'),(2354,25,'San Felipe'),(2355,25,'San Ignacio'),(2356,25,'San Javier'),(2357,25,'San JosÃ©'),(2358,25,'San Miguel de 25'),(2359,25,'San Pedro'),(2360,25,'San Pedro de Colalao'),(2361,25,'Santa Rosa de Leales'),(2362,25,'Sgto. Moya'),(2363,25,'Siete de Abril'),(2364,25,'Simoca'),(2365,25,'Soldado Maldonado'),(2366,25,'Sta. Ana'),(2367,25,'Sta. Cruz'),(2368,25,'Sta. LucÃ­a'),(2369,25,'Taco Ralo'),(2370,25,'TafÃ­ del Valle'),(2371,25,'TafÃ­ Viejo'),(2372,25,'Tapia'),(2373,25,'Teniente Berdina'),(2374,25,'Trancas'),(2375,25,'Villa Belgrano'),(2376,25,'Villa BenjamÃ­n Araoz'),(2377,25,'Villa Chiligasta'),(2378,25,'Villa de Leales'),(2379,25,'Villa Quinteros'),(2380,25,'YÃ¡nima'),(2381,25,'Yerba Buena'),(2382,25,'Yerba Buena (S)');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Buenos Aires-GBA'),(3,'Capital Federal'),(4,'Catamarca'),(5,'Chaco'),(6,'Chubut'),(7,'CÃ³rdoba'),(8,'Corrientes'),(9,'Entre RÃ­os'),(10,'Formosa'),(11,'Jujuy'),(12,'La Pampa'),(13,'La Rioja'),(14,'Mendoza'),(15,'Misiones'),(16,'NeuquÃ©n'),(17,'RÃ­o Negro'),(18,'Salta'),(19,'San Juan'),(20,'San Luis'),(21,'Santa Cruz'),(22,'Santa Fe'),(23,'Santiago del Estero'),(24,'Tierra del Fuego'),(25,'TucumÃ¡n');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisactions`
--

DROP TABLE IF EXISTS `sisactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisactions`
--

LOCK TABLES `sisactions` WRITE;
/*!40000 ALTER TABLE `sisactions` DISABLE KEYS */;
INSERT INTO `sisactions` VALUES (1,'Add','Agregar'),(2,'Edit','Editar'),(3,'Del','Eliminar'),(4,'View','Consultar'),(5,'Imprimir','Imprimir'),(6,'Saldo','Consultar Saldo'),(7,'Asignar','Asignar'),(8,'Finalizar','Finalizar'),(9,'OP','OP'),(10,'Pedidos','Pedidos'),(11,'Supervisor','Supervisor'),(12,'Entregar','Entrega de Ordenes'),(13,'Lectura','Lect horas equipos ');
/*!40000 ALTER TABLE `sisactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisgroups`
--

DROP TABLE IF EXISTS `sisgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpDash` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`grpId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisgroups`
--

LOCK TABLES `sisgroups` WRITE;
/*!40000 ALTER TABLE `sisgroups` DISABLE KEYS */;
INSERT INTO `sisgroups` VALUES (1,'Administrador','PanelEmpleador'),(2,'Operario','Equipo');
/*!40000 ALTER TABLE `sisgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisgroupsactions`
--

DROP TABLE IF EXISTS `sisgroupsactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisgroupsactions` (
  `grpactId` int(11) NOT NULL AUTO_INCREMENT,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL,
  PRIMARY KEY (`grpactId`),
  KEY `grpId` (`grpId`) USING BTREE,
  KEY `menuAccId` (`menuAccId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisgroupsactions`
--

LOCK TABLES `sisgroupsactions` WRITE;
/*!40000 ALTER TABLE `sisgroupsactions` DISABLE KEYS */;
INSERT INTO `sisgroupsactions` VALUES (47,2,1),(48,2,2),(49,2,3),(50,2,4),(51,2,9),(52,2,10),(53,2,11),(54,2,13),(55,2,17),(80,1,6),(81,1,7),(82,1,8),(83,1,9),(84,1,10),(85,1,11),(86,1,12),(87,1,13),(88,1,14),(89,1,15),(90,1,16),(91,1,17),(92,1,18),(93,1,19),(94,1,20),(95,1,21),(96,1,22),(97,1,23),(98,1,24),(99,1,25),(100,1,26),(101,1,27),(102,1,28),(103,1,29),(104,1,30),(105,1,31),(106,1,32),(107,1,33);
/*!40000 ALTER TABLE `sisgroupsactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sismenu`
--

DROP TABLE IF EXISTS `sismenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sismenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sismenu`
--

LOCK TABLES `sismenu` WRITE;
/*!40000 ALTER TABLE `sismenu` DISABLE KEYS */;
INSERT INTO `sismenu` VALUES (2,NULL,'Seguridad','fa fa-lock','',2),(3,2,'Usuarios','fa fa-fw fa-user','user',2),(4,2,'Grupos','fa fa-fw fa-users','group',1),(5,2,'Menu','fa fa-fw fa-bars','menu',3),(6,2,'Database','fa fa-fw fa-database','backup',4),(7,NULL,'Empleadores','fa fa-user','Empleador',4),(8,NULL,'ABM Actividades','fa fa-tasks','Actividad',5),(9,NULL,'ABM Liquidaciones','fa fa-list','Liquidacion',6);
/*!40000 ALTER TABLE `sismenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sismenuactions`
--

DROP TABLE IF EXISTS `sismenuactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sismenuactions`
--

LOCK TABLES `sismenuactions` WRITE;
/*!40000 ALTER TABLE `sismenuactions` DISABLE KEYS */;
INSERT INTO `sismenuactions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,3,1),(7,3,2),(8,3,3),(9,3,4),(10,4,1),(11,4,2),(12,4,3),(13,4,4),(14,5,1),(15,5,2),(16,5,3),(17,5,4),(18,6,1),(19,6,2),(20,6,3),(21,6,4),(22,7,1),(23,7,2),(24,7,3),(25,7,4),(26,8,1),(27,8,2),(28,8,3),(29,8,4),(30,9,1),(31,9,2),(32,9,3),(33,9,4);
/*!40000 ALTER TABLE `sismenuactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisusers`
--

DROP TABLE IF EXISTS `sisusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisusers` (
  `usrId` int(11) NOT NULL AUTO_INCREMENT,
  `usrNick` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrComision` int(11) NOT NULL,
  `usrPassword` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpId` int(11) NOT NULL,
  `usrimag` blob NOT NULL,
  PRIMARY KEY (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisusers`
--

LOCK TABLES `sisusers` WRITE;
/*!40000 ALTER TABLE `sisusers` DISABLE KEYS */;
INSERT INTO `sisusers` VALUES (0,'superadmin','Super','Admin',0,'21232f297a57a5a743894a0e4a801fc3',0,''),(1,'admin','Control','Operario',0,'21232f297a57a5a743894a0e4a801fc3',1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\È\0\0\0\È\0\0\0­X®\0\0 \0IDATx^\ì]t\\\Å\Õş¶\ïJ«^l\ÉE\î½aLÇ´PBM\èBøC	-z/¡wBI€\ĞH„\ZH c÷\Şe[½¬¶·ÿ\ÜûŞ¼7\ïí®´’\\V²\çyw_›yó\Ímß½cilmKbo|ñE<ş\è£Ø¸i£6»\Å\Å(*(†\Ó\á\ì“#d³\Ù\àp\Ø\'F\ÓöÁ\â´\à–;n\ÇG\Ù\'û¸½Ú²«¤­­<ø^xş9„\Ãag«\ÕÊ  n—g{ı½¾\İnC\"‘D\"‘H¹o~Q>Î¿\ä8ù”Sw\è3õ…›\ír\0!`\Üq\ë\íxõ\ÕWFø\å¹ó`–ô…w¶]qğğÁ¸ÿÑ‡0th\Ív¹~_½\è.!1{öY\r¤>U”Tt[…Š\Ç\âHB\ÑL­6«ò×¢ü\í\ËmÒ´IEB…B\Ü\r—\Û‡Ó‰ı8\0{\î5“\'O\é\Ë\İ\ëÑ³\ï\0ùø£p\é…¢¹¥™©»À µ$‹!\Ãb±@\Ñ\í=\Zğ¾võ\Ùò\ÃbB\á†\ÖÃ…_„“N9¥¯u¥G\ÏÛ¯BR\ã\æ\ëo\Äk¯½¢©R\Ëfm_D\"6n	ˆ\\E\"™\Ø)R«µ½­°X-8ñÄ“q\Ï÷¡¨¨¸G“¯/œ\Ôo²p\áœuúØ¼¹–\ï\ê\ÊA(\Ì/\ìò´ £=‹Á\îpÀ\étòù¹\Ò`IµÛ™j¥¡¥r\Õ\Õ\×\àš\ë¯Ï•!Ú¦\Ï\Ñ/ò\Ì\ï\Â-7ß¨I\rGW®ZZ‘#‘(\"\á0ƒ\Â\ívoÓ\î\í\ÅHš%“I8œ\n¹¤~mmÜ‚¶6</¿úJ¿³Sú@\Îù\éOñş?ş\Î\ï‘ğŠ\Ò\Ê.\ç&IúGÀpºœ=š€$e¬Vß‹Ü©¤–\Ñ\êm#‡@$\Za€\Ûì¶´—#›h[Ü«\ËgUº\Õ?¡\Ş\ÜÚ„ú\æz\Øv¼ô\ç¿ô«˜J¿\Ùÿ÷ÓŸaÖ¬\ÏX%\ZV=¬K[ƒ¤F0\ä\íñxºT¥(–`±Z\ÙH§ÿÇ¢1öb%\âŠŸLb›N\Ô\Åg’\ÉN¥?\Ñ\îª\"õk[6\Z[\ê¿9ğ\Ø\ÜÚ‚úæ­ 1}\è‘Gñóó\ÎÛ–·\İi\×\ê\0!pv\ĞAX¿~}zp¤Yù\èƒAF&ã›½UN‡¶rÇ£\ä\ÉJ0\ÒÜ²}‹$2IE%ø\Ù\Ü.w\æ\ã,\àg‹†S#\ät}¿\ßÏ¿÷ ôm/\àr9G4`\ÒñM-\Íhjk`üşù\çûE\à±\Ï„ÀqÀ\Şû`k\İV¸.4œW8\Ñ\èÿ‹\é\ê\éó‘hyyuŠ&©Y°\0Ir\ïF\ã\ÛD*Ğ¤¡‰Kª—\İnÏˆ%z6šl©z$5`\á\è4\Ø*8(NC\à µ±\'$bg\ÏI\×t\ç¹ B½#5µ½£Mmü>úô“>o“ôi€8>\à@lÚ´‘Á1´ºÄ¡\Í\ár\0	Ô@ À“Ô¼²0N;\É$¢‘hŠ\ÊÒ“IF\ç‚&Lg“•\0…Yšeœ˜À\íre\äV\ÑA>º·7\ßk@J©ƒBõ\Ì\Ï\Ï\ï²\Ûùùğwøµñ\êğù\Ğğ¡µ£%%¥˜3^Ÿv÷Y€\Èjc\ÈÀ¡†	\èö¸O\Ä\r*ƒ&Ÿa¢Z”(8Ø²”\érftr\0M0²OH£	\ß\Õ*.‚y¨HjT	\Ã)ê˜\Ğt½YPTdtk€\\.W—]£q¢…Â›@H\Ò\æ{u\Ğ3z\×\æoEG°GõC¼ò×¿vy\Ï\\= \Ï\ä\Ä\ãO`ƒœÀ1hÀ`\Ö\×E\Ë\Ë÷°\á\n)$Dj´²²ú\ÔC•#›H€ 4¹œY\0C\0‰¼?™b\Zô\Ì\î<K¢t*MHš\Ğ\ä–3//OûJ2\Í\0v˜8T<ú\Îf·\ë\0!®\Î7ƒ\×\íD Cqx\Ğó\Ğ8Ô·\Ö#\Z‹\à\Õ\×\ßè³­>	\Î=\ï¼ıOøAƒQ\à-0€ƒ_’_yY\ÔDp­+:˜¡	J×§À¢\Õfƒ\Ë\é\ê\Ô\0§ó	<\áT\é•ö¾¤N¹\İ,\Ù2I\rR\ÉhB§k²zE\à\êğw€T&yÌ’BG\×#\ïœ<®]¹’\İn]õ#U\Î\çó!¡®e+Š‹Šñİ‚\ïû¤ª\Õ\ç\0ò‡^ÀµW_\Å\àX:\ÅE:—^©)¾öm\Îb\á¶‡0¶	¤F‘±\ÌvC\'R [ÀSÁFx0”V\í8³\Ô÷¡¾\nû%Œ?À\äÊ¢¢\"\íQ\Ä*/$ğ|	&(\Ï\îd\ÉÑ‘®O…^ø|~q}_ \ívœş/pÿ\Ãuk(r\á\à>¢y\èaˆÆ¢(+*GYq™¶\"’AN†w{[»A\È\Æ\ÓÙ‹ @pœ#gp\"\ä$$šX4‰·İƒU)‹\ã,™€A}!U\Éhk˜ŸŞ‚‚// ²\Ñ.ƒFL^:“$\r5²´\ê+6™\Õ\è#·²İ‘1ñŠ®!\ì$’\ŞBŠ\Ğß†¶z\î×²U+ûœ\é3\0!£|\Ï)S\Ñ\ÚÖŠ\Âü\"”•i(ÿ^Õ›\"¯r\Ùzm\ä)&fr]’‘o¡É¢ºfi’u\É\Ë\Êm\ÎB’xN§ƒm²1\ÒEÄ©dCe\Ê\n”¯M’ƒ\Ô#\n€\Ê@._\ä\Íóx\Ñ\á\ë\àûGb‡İ¦¸¡eP\Ñg’Ğ²]—®O\ä\Õ\nª\0¡g&˜¼Zgÿ\ìü\æ‰\'rA0dı} \Çu¾ù\æk8.TWò‹\å\Õ\ÛhFc”<\Ñ21^9aµh\Ş šH4Yh’:»BÉ¤H ¥\ãIºufĞ²~\Ï\ÎO\ähD±aÒµl$Mj»U®p]‡‚!-_…®+€`\r\Ù8Dc!	\Ós\Ç\á°9hú8ˆ\0ašø‹x~!	YŠ$ğµûø§­-[ù:}MŠô	€¼õ\æ¸ğüóy€+‹ °°PS­\ÈcE“S¶;²^zy ˆ\Ğet\éè‚¢aµYXM\Ë\n\ÙEÜ¹*t},\áò\İù\ì¾%\é“\î‚`µ*ù\ê\ìy‹Gq\à´a8zÿÉ¸ó\Ù\Ù\'šYŠ¸\Ü\Î.ƒ§ôN„cAH,!E.¹ô—¸ó{z9ò;\îôœ©V{LŒööv{‹Q\è-\ÖÜ¤óz\É0l\ë\Ø&\Ñ\îl†yXú\ç\à{FBJä»³&$QgÇ±7f\Ã_6”\ÓJ–xŒ\ãn§‡ÁA“X\Îr”\Ï!wmBÍ€$iCR’\\\ãBb†\"A\ì5a^º\ã>í¦§\ŞÁ¿¾\\f¸­9\"O\0‡-ƒ\ë—%¤\Û\É]öŒ‘G‹\ì¶Úºúl†:\'\Éy€—®\Û\éFYa¹ÁUYP\ä\å »t·ù¨’q\Ê\ÉRv64\Ù6‰’Á^-\ê\ÎıE”®•\É#%_&x @ \ìGyQœv#„~7\'\Î\'iC\ê©ø\İ‚‘€tl[G\0g\ßş\"6mUT#V\Ñ`\áq\×øc\ÌÏƒ¿#±»DC!U@\Ô\á÷³œ¡\Í\ßÖ§ÈŒ9\r/¿˜…w¿„%\ár¹5\é‘\ÉkÕ	š\îX¶%l\nc•\'D2\Éj\Ù\n]IŠ®\î-\\\Ä\"v’\r(‚\á \â‰(\n½.«*\Çw\ËÖ¡ÀS¤\ÒtOz.\rIa`‹g‰D\Ãğ;P\â-1\ØT\íV\\söQ¸\è¤\ÃRû\Ë\ïW\àW½DR·Á„#¼vL\ät9R\ì>q1V)6f2ˆ\à#=\ç–\æ\Í3f,¾š=»«\áÊ‰\ßs\Z ûLŸ\ÕkV£0¯y…ºô°¾¹K]yU:e`g•\É›Z|Võ8¹vc\nk·7Mv\Ó\nÚ•MA÷\")@“š@QYZˆs;\0\Ç\ì?óWlÀMO½\r»…‚‡\Ê\ÄÀ ÿ{=z°”>“»6\r\à„™Sğ\å÷(j }Œøğ\ÎC—c\Ò\ÈÁ»wõc¯\á?ß¬6€Šö’©*Dİ­L\ï€\ìıo#÷;’hñ5#`\î‚}¢‚J\Î„\n-œyÚ©l„,Q\n”IÀA—ƒm\î41±4¶¯•7JŒ£+\ÏSW÷``Lu“w¨«F6\r3%ƒH\ÈÃ«+p\åO\Ä\ÑLc\éE\í’û_\ÆgsWÁ\åPr;şP\â‰¼oŠ4\éùP]Qˆ?\ßy!~ó\Ê\Çøì»µ|\Ù\å%nüı\Ñ+P\ä\Õi(™ñ@{‡±*“$«[fê»¸©¦Â«\'Œu’ˆÍ¾¦>8\ÌY€\éA’ƒ$ˆl(’\íA«Vº\\ˆ®&doR€@Etxš¬ˆl\Ô%1¹	Ê¿ò=.¾\×$\\r\êa˜<jˆ\æj¦\ëm¬k\Æ7=6_”\íS\"…\ÍFù(.8l:s™%F$ˆ²bş\Õ\é8`\ê¶\'¸ôqD\"	„c~œ{Â¸ö\ìc²‚\r[›p\Â\ÕOÀ\n£\ë—l’¼ü<m…¬t,h	Sqºµ­\Í[P^Q\ÅË—gı,;\ëÀœˆ°=H\ïXRrIR¬ƒDû¶²=\Òy}h²§˜üôbº\0ó‹\ä\Ì>‘˜\ÂÄ­©ªÀ9\ÇÈª\ÓĞª2—%øYm¾\0nü\İø\è\ë\Åğºù|›=‰\á\Õe¸\áÿ\Å\å¾†dR	\æ‘JŠ\ØFyòšŸ20D#\Ô?¿\\ˆ\ÑC\Ë4C–u{-Z½	?½\í¹Ğ…\\n7\Ó\ïEc¾V\Â(eŠ\ny\"	ø}I\Í\ÊI€\Ì\Üo?,]º„\í’23•\"\æ\ä\nM§÷\n\ã—Wu©¸[·gE/N0\0‚T§xE\Ş|\ì7i4.<ù\ì?e´\êb¥\0iQJp’´)úü\à\Ë\à\å÷¿B0EqA>¼yœy\ä>¸ğ¤C\Ñ\î\â\'·<‹\r[\ÚA`³X\Ø{\Âp\Üu\É\É: Ts\İ\Ò\ã\Ó\Ä~\á½\Ïp\å™?\ì0\ä!øô»¥¸ò\Ñ\×Ò‚„\\Ì†teó—\ÔZ\á\Ü –0ìªšuÅ•W\á–\Ûo\ï\ÅhoÿSs 6¬\Çô)Søe+\ÒÃª%ş\Ğ\nE\êUkK›Áf NŸ¼­‡T\ØdX“¾M€p;;lN:t:\Ù\Z†T\'¯ts1\Ä\ßö\0şù\Õ÷øvñzÌ˜Xƒ¦ŒÁeD‚O¿õ	\Şùt.FªÀ/O;GQ¯¨¢\ËDyß–}%Àx\í\Èw¥0H\årº]i’\îŞ²šµ¹©Ã‡À\ì¹s·\åcnók\å@.½ğ\"üõ¯¯\"Ï•‡’‚RöÂ‹\Äò­/J{Paƒ°Z*s›é‚´\0„QMI0 jªq\Ä>“pú{£¦ª\Ü`K\ÈBa¹[8¨ı4ñ½ù³|<KYò	”úw[\Ù4?¸\äAPxƒ‚\æFı¤”Î˜\ÓÂ›\Õ\Ô\Ş\ÈeNW¯_Ÿ\ÓÆœ\ÈÈ¡C\Ñ\Ö\ŞÆ0z	²z\Å\Æy ¬\éd\âİ¶t=–ªt \ïË‹‹0q\Ä`¶\×8Åu{½J®5³¤ PH™e™““ ’®¢´Y‚t‘\İ\ÔË\"üô¶g±lm«À\éZŠ\Ú%$Ş™\Z\æzq‡œ\È\ïÿ?;\ë,Ø¬6,­\âa\Ş+Vµ\n½ho%:´\à“ù	:}O\×1\ÎÒ½P‚\än%0°±©‚aÄ JL[ƒ#÷h0‚]C]\Ò\r„GÅ¦\Ğ	<¹¥\Ï\nˆ\Ä\ïb¶gş,l¶Y\ÒJ³M£ß¯—˜H{ú3o‚Gşü/Ø­nx2lA‹¥>\Ë)¤H\è=5´\Ö\ã\Ğ\Ã~€7\Ş~{{<\â6¹fN\ä\ÄNÀ¬\Ï?CQ~‘ø*(,\à¦ \Ù ¤^Éº¬²ˆŸDb[n›\Í\Î.QÎ‘ˆ\êi¸d7ˆFÃ²¢B\ì1vö›2N\Ói -~aøJ°\ŞiE\à\Ğ$‹\ncğE?\Ã\è\Ö2‰Š¡0·_\ëh\Ú&“$\ÓEHš\Üõü»xç³¹ õ„\"ùf°‰R®R)3|\É©¨¨Ä’+¶\ësö\æ\â9QÃ†¡µµÅ•\Ì²‘\ÔPƒƒ”g@\Ä@Z(¹G6\Èi5jlk€\Ç\å\Ä\İŸŠa\ä:\Ø\ëó\ÚG\ßb\á\ê\rŠ4r:0jˆ\"™\Ş†(\å€Yg\åtƒkšJ]±eC– ªD!wŸ¯\Ù b\å\ÏôW•ò¤—$Q¢(±\ÅL6Jo&JW\ç’\çó\ï\á\Û%«aµ\ØQ\à)ÔŒye\0U>¡ g_°Cr \Ä\ÚYSÃ“§ºl¿\Ùş(*.D[k;ƒ\0\"Kú\Ö:”\à«n\Í*B\Ü\Õ\Ë\Î\îwu\ÍN±9L6†&\Ò\Û\Êd6©c\Ğiu\é±T«\Ã$:\ĞIrIû}\Ç\î²G\ê\×=/¼‡’‚2VqÍ”y\á\î¥T\\J\É}ù/Á1\Ç*œ»\\k9a\Ö.\r”Ïœ”\çfö¨YzÔ·\ÔÁf³`Á«÷lwptjs˜$‡°1´%]M\\\Ò\ã&¯“P“4	£ªMf	¥¹r•Ù¯\\\Ï\ä\Õ\"\ì$I\"&ø\Å÷¿Œ¿Y\Êq,jrÁa‡ºK’?—3\rs gœr*şı\ïö‡TQI0ij4\è\"	\çON\ËJİ®«\ÍJ©)\Ş)\Ã\ê\å{]Ğz¥9¹ô„(Ñ¾I\ïb‹\Ã,\rº\èH•$\Û?Nbkbÿô\Ö\çTW½Qvˆ`÷9\n\ß|÷\İv}]=½x\Î\0d\Ü\ÈQhlj\ĞÜ»\Ô!a 9‘RjI4\Ó?Ñˆ\Ó\ãrÚ±ö\İG{\Úÿ,Ï“\Õ)s¼AUT/•,9[\Ã\ì\ÍR>KK¼)²®\Û\Â;¦y»d{]“º¤\ár©²\Ä\É I´\ëf\ÙûF<®ıÏ»•\Å•J…\ì\í„\Ş!9_674ô\ä6\Ûıœœ\ÈĞª*‚T•VkÆ(;\Ãlş A½\Òã¢“\Ç¸\İJ_\ØS\ã\ÊoR\àCú\Ì`0H\ãù\æH‰pá¦g˜\"\åºz%n \Ù&&³M²ı\ã$rWk¿Eù¥š«‚ˆ¢P¸P•\Ú\Z˜ŞŸ«Ãœß¨\r*Wrd–¨¦A%}D:ªğ€¬x\ë¡\íf{h6‡úÖŞ«\îI3\n84/V\Z/—<\é5\ÛB‹{(B–\0†\ãYb(\ê–&Ix¯£d1\Çm¶\×\êr\ä/\Âú-mœLMvºˆŠ\'\ÂP÷ÿÀ\Î\Ü^\Ò\ã\ë\æ@„‹(\İE\n@¤Ò—\Ä\à\r\Ã\\­š\Ğ]”–`Á«w÷¸ó\İ;\Ñ\èµ\ÒC7$‡A²ˆ»wY§%A2¸ù,“w*E’l)N¢‡Ü»\×õMÜ²‹\îû\Ê\nu±\Ğ\n„¡.\"\ê¹J\\\Ì	€z»\Ù5HABªZ\"\ìÁ=÷øCp\ß/O\í\á\ë\Ëş´´q4^«T›ƒ2ÿ¤øˆ\Æ\Ú53\ÅU\ÒK\n9.¢JUrI¡Š]’dğv\í[¤ú\è\Ë\Ø\Éj¢$ª(,\'<Y\'t2{ñ\Å\ì_\Ê:2g\"G`É‹\Õ\Ñ\á\ç\"d\ÔZ;Z9£\î?O\İ\Ø\í _\Ï\Ç5\Õ%	\ÍIksh`R\rtV·tz‰\ácF•r\\D\Ø\Ê_cÒ–\î\í\Òl‘1«Yr\â[[[›V¿w\Èà¡˜·ha\Ï_\Ïv:3§\0’\ïörijŠ‚¼…ˆÃ®\î\Ã\ßm§aQ.›>\îa¶!ôIo\àZ‰óµ\ë\È\à`Ó¹ZBmJ\'\Ñ$„R\ìN»Ÿ\Ğ9]ˆ8IB\ân¥go\ÏA¤û1¿z”½“\Ôd;Dx²j7¡¬´\Ë×¬ÙÒ£k\ç@D‚” \êJ+J\Ç\Ğo4 d\Ô/ş\ë½=\êtON\ê“8W‹{h&ˆI‹\â\ÎTÑ¥ªƒAş>E\Ò\â(Fo“B\'Q\Ã\ì\ÉC•*’maŒ“(RDf«¢\Æ`\è÷d<ºs¬f\ÉU\ã\Å;%Nõ±±µ­;—\İ!\Ç\æ>@\Ôa qLM°@>¯\ßw\Éö$5^ad\åJù\Â+ez\ÜC÷V™$L\Z‰’™\Û%\Ô&º¾*	„\Ä`Ib´A.Z„Š-ˆx‹8\Îy—\ã,¢@\Äö\ĞıÎ½\íq-‡D\ê‚úË®\Ş>a\Ô\í¸ø‡\ä½2DÀ’BÁŠ,J\ËC¸»Ô¿º\ä0IM4©“Zc°„6yµ„\È0\Ù\ê÷\æ\ßE\ä}g\Ù\"fÚ‰0Ô…«W\0$]½} \Â-øöƒ¿2\äfl•/«¸‡–\ç!lYbX•]­c¥e\Ò~\êäº•$Á\æQñ \0Ir°7Š>\ë¹¦~\Éñ!Ix³)’É›µ=Oº¦\â\î}™+cR\"\át\Ù\r/‚öı8t\æL­HƒÁ¡bgƒW–¾}\é\Î^#\èÎ¼\Ğ\\¸Š!!‘©º²1¤\ßYŠÈŸ\Õk©j—xs\ÜC.94	¡\Ú#Š\à$Œˆ ¾¨3»3==–xYg\ŞüŒf¨S~9a\Ä{\ïôúnÄµ7\Ü\Ğ\Ó\Ûl—órB‚P\Ï\È\è–\ã ²Kˆ(³]=X\él™e«1\Í\Ş(÷°j,M20”Šˆl”_¯pµ\èx%^bğfÉ’B²9xªSÁl:\ßô½°%´\àaBŠ¬›\"òf/\İv™aj½\ßq§^\Ï4\"yñ3$Y½} ¤¯R•\Ğu\ïmo‚¢:]\Ò\æ{\È\ÆHg$\ÕQlú^>Oú¬û¨”¥^õB\ÑÿS%GzD÷r™\â$i¹Y\Û\Æ\ë8\êRF$‚Àf€œq\ÆOğ\Ûg\Ş1”\å]r T¬\è\ì‚jb\ŞgO$I@\nó\İ;\Ä\ÅÛ•\rbˆœ5I\ãZ)6†ğf±Á.l\Ù&¡\ruX‚˜“¦”’Ÿ,)ø?\ê÷ªë—¨\ã\Â&¡¿lsÈ‘uU‚h’)7K8‘S(÷YÎ¢,#€\"ªL#\"\ï¤`F}ô±øÓ«¯dqµwH\Î\0„\è\î--\ÍZ±ye‹\0RR·ƒ9XÚ‚ob\í\êL\İôŞªTI!\'Kıÿ*4‰a²=Xª(±ó\Ğ\ã$\ÊozÀ\\’ \nj4¬é´”3\Ù ¢R \Â39d\ÈP\Ì[˜[\Ñôœ\ÈQ‡ı\0\ßÍ£³y%²¢\Ê8bŸ)x\é\×\ço\Ç7›.ÿ#{\×1Oë²’7‹¶^S\ã%’\Ñ%‹Eı]V›’HÒŠ¯n­\Ìq£jWZ\ï–\Z\'Q2wnD}\â\é7I§¶y\íF$ˆ\0È \êÁø~\É\â\íø^»\éœ\È\Ùgşÿü\çû\Z@¨+\" $„¢\è?\Üo\íi 5Šº°Ÿ»`\ïf²-´\ï\Õ=7T[„%‡EŠ—\Èt\ÍK%$ƒê©’¿W\Õ/V\"Ü®J\n)^¢E\Ô\åœõ—\"D~·»’%h_}\å/¸\ì’K…; \Ù\Ù \ä}’¼V\ì\íJ\ïÅ’m\r£M\"{Ã¤Á´\Ãdƒ˜\"\ê™lNóC²|G½9l7@z3z\0\å]\è©t9Q.\Æ,AN?b?<q\ÍO{y\ÇlOWÔ­\ÅAôh»!‚\ÎBC\ìŞ¤xºRr\Ú5I\"lTls°Pµ\ä\Ó\Ø ª\Ô\Ù\É6\Èn€d;\ß2\'’¦dÂ¢ˆ¸šòø\Õg\ãŒ#÷\í\å;9=‹8ˆ(Õ£€G˜Kj”\×0\Æ=Hô¸‡ô»©\Ê{&\èñ\rŠƒ—K”\â&–\Æ\Ùõ¸\Ògn¿ \áHR«r\"´ƒ\İ*V7F}@Y)ò\\ù\Ú š#®t)²Av\ÍDl3+;\Ä1§‹™l\å£\'I;L\Â\ë$E\É“Ceôª‘rc|Dño\é•O\Òä…ˆ›™rÜ»ñªº}\èn€t{\ÈRO W/\åˆXˆˆ¦›%ÈHz–­)¯\Ãañ:\ËWù,E\Ì\Ågõ|\rCº¤F\Ô#s’”\àj©sS¾H.p±¨k»²\r\0rò~Œÿ}õUJ^ú\Îˆ\Ü%\Ù‘A C^(U\"ˆ“4/•ú…ø¬%\ê¼,\rLZ¢¡\0‡¶\ÔóÌ’B\Ä<4q‘›W½\Ğ\Í\ÉQcyw$Kğ\\vñ%xõÕ¿h®^š”\ä/\ß\0‘«‡P>µò=8š¢Góf	¯–j“˜9]*À4G€T\×J‰_\Èl\\‹W‹s¤\ÏM\çBl,%‘\àxŠğ–‰xŠ¸¾\Ê!\Óh.Y¾°n–N‚ˆ÷*\0rğÁ‡\â­wÿÖ«nÿCs&B],Qú‡¾“9ú¼\ãmIˆ\ê\"j¹˜\Û\Â`W„ˆˆ®\ë,ık=ò®\Ù$)õ´ô¤tC&¡\"BÔ‡‘8Z\Ò÷\"\ßC\á1¦ñ^i©\ëø‡jym³\Ø@›w7Õ¤‹\áÛ¯‰\ê\ît¸ğd‰ŒBª\Å{\Û\'\à\'\Öë—§D¨e\Z‰ñ’\és\Ò\ÍUJ„·Jù&\'E\Ìğ(\ÉO²\×J\Ä#4µ\Êl\ÃHéµš+W\âH™%Šˆ{ˆ\Ú@5¬\ï•Ö¿Œ#)€\Ô\ë¡f$\Z\Õ÷s§…÷+!\0ròÉ§\â÷/<\ßû›m\Ã+\ä”¡~\í]…ˆ* \Ä\Å:ığ½ğğgörºùò3±z\ÅSh’ƒ—t€¨W\\\Ô\Õ=f4Ê¢\Ãd#¨\Ï*{µ”\Ûhœ,M\â«\nC^¹Eo+,2MFe\â÷t\Ğ\Ó\ÅA\Ì\Å\ãr±\Ê{\Î„X½–„U«\Æ\çt:y—) ‡Í˜°\ã¨&I \íeª¨\Õ\ä•X¹$I	e–$’\íb\Ú/DÓ‚\Äş!\æŒ@-JMºKQ‹\Ô\ïS2	¥j(ª·,myÓ\" ‹ó\ÒDlƒ r|vgf1ø“Æ…\ß\Ğb!‚ù)JÄ\Ù\á\0‘Ÿ[\Ä3´õ>}\\Dœ\"Š™k÷\Ê~FuO/(lõªijô\nYa ijóö’\Ò.²³x•†C\ÒDT59\és,ÀĞ¡5İ½ôv=>\ç$‘?ÿô3­>–¨\n.fOBúy4CCS¾¿m>?|A¬Ş¸mª\ìK(Z$\Z…\Ó\á\Ğ>l6+ŠóQ3h\0Š½=¬\Z3&†\ÃaW\"\ç\ÒJ©†bÚ£Pqw²Û­\æ…Jc¸›«¸›$G8ÁœE+±r\íf´ù:°®¶m\í\Ä\â÷‘:\ëpØ\çvñn\\^Š\nó±Ï´q4@/!\Ú\İY™ b\Ñ#»’v\Ş]ö\'‹Q}ğ\Şûğ\Øo~£\ÅB\è\âd‚´7aŒ·\í:d\ÏñªX­\í˜·d\r–¬\\µ›\ê\Ğ\Øêƒ¯İ’Ã¼ıEI\ØKr’Q6L\ë4û—\äü\r\Ò\Ã\é3¹w\å¿gG$\İ\0\0 \0IDAT´¿!¹‚óó=¨P†÷šŠ“\Ø[\ë-]—\Î14Ù¦1›C)Ÿ^\'¹¸œo~4_~»\0[\ë›\Ğ\áòB@\Çq_jöˆ\È11=Š\éÁ´~\Şm\ê9¬\ì&¦~;\í6ä£¢¬\Ã\rÀ„\ÑC±\Ç\Ä(ô*EªÓµttw¡6s³²\n,[½*‹²c\É9	B®Ş“Nø‘–8E\ÃAeóÃ‘„<Li\0Hcsşúş\çX´rK‡P8\Â?‹#–H OğD\É\ÔN7<\Ş¸\\n”V\ĞJô›„#“in\ØÊ“\Ï\×ÚŒD<Æ‡Q5z\nI»\Õ\Æq“XÒ‚«ğô¯Ï‡\×\ã2\íz+W5\î’)¢®{,ğBø\Å\íÏ¢¡¡–D‰dœcôO\î«\ÕfGAq)ß»´b \ì;È®K×¨ ts}\ï;ôû5mˆJ\ê¢\İfe\Ğ\Ğ_QoW\\\Ë\ãv¢²¬S\Ç\rÇ™\'‚‚|v ¤6»].\Ş\ÎB\"\Ï\Å=|\ÎD\åXQN¨Qm^G.?ÿñ=,Z¹7×¡F“ƒv»\Æ)ª„xSv»5#F¢zğŒ?“\'Œ\ÑWzU\éGb¨o\éĞ¾G\ãh>Ë“+¡µ©[6¬Cc\İ4\ÕmA\"c‰A ±\Ùmp\Ù\íUS…k~q*†VW\è{\Z\êl¥NY]n\è‘õ5·à¥·ş\ï­DG \È\à’\Ïjµ£|`5\ÊT¡jH\rŠ\Ë*\át¹Ó‚¡²\Ä§Ã¦¡”>»XM4Š—…KV`\é\Ò%Ø¼i#6¬YƒX,ª]úH‹‚\Ãf\ÕO67—ÓSF\ãòŸ€½~§–0E\0q\Ø\í`/–º\r\Û]÷Ü‹‹/½tÇŠ‡,\î–s\0¡g&\ÒbiA\ïtË«³\İ\Î/B\0dp±^›2-hµŒ\Æcˆ\Å2K	Ûƒf\îƒs\Î<cFH;,<5^Ÿ¤liõ¦º\ÍG~û0{RZıE¢G\â¨o\í\Ğ&Û—_|‰‹¢©®V»O$»\ãF\Â}×oÇ´¯ºy\ç*ù3P»µ	Ï¿ş/üû«y¼È­¼j0&\ï±7ö\ÜkºL¬(ö\Â\í´ñ¤¯,õò÷E^\nói±1\ÆiÀ¬cq¿\Ìq!ºçŠ•kğÒ«o\áóY\ß Ò·\Ü&°\êEµwS\ÔI\0[„bJF!½O:†$–ˆ|:k&O’Å”İ±‡\ä$@ö™>MõÍš«—t_§Ë©¤¦\Èk2‰H,\Æ\"º³vú)\Ç\ã¢ó\ÎB×›ş°”-ÿ\Ôü)”œÂ\Ò&“:Q™”k\Õkóª¼«-[\ëğ\Ìó/ãƒ>\ÓW]«ùn7n½\ì,\ì?}|\ÆG—#\Ù_}·wşö5–r;\æ¨Cp\áyg£z`¥V‹-)ıT\Ósµ**\\¶TP\ì3eH*`%‰2= ¯£\Ï<ÿüõ­¿¡\çv;\ç\àD\Ñ\ÍcµŒT<’ô‰x\ä\â\r\ÇÂ¨kjŞ±3?Ë»\å$@.:\ï||ø\Ï5W/õ…•\"¯$’¬A8h¹\ï¤\å{<xô[±\ç¯J)®T)§E²¹‚¾/GÌ“	D\"\ÎA ’\ë\\Ñ£‰ŠŠ[\ë\Zp\Õu·c\åÚ†\'¾\é\â3p\ÌÁ3x\É^¹¶«6l\á\É9ºfF\r£ı\Ü-ø\à\ÓÙ¸÷™¿\Z\Î=b(¾ÿv\âyµ…Br<(Ï§>—\êõŸù ‹J²d–™(I¤Ş¹[\ZôÀws\àª\î‚_\Ú;’N\'\Å\íTöº§Š\Æ\Ğ\Ówš\"\éA<Xe\åeX´|y–Sv\Ç–s\0i[ş\r>zı¸â‰·µJ|4$$ºiP³\È\í7^=<cM\æD<h(\0›İ‰XLQ™\ã@ù«©“ˆ:\àô\ä#‘ ÷¨6§v§ª¦h›\Ë*‘s±pkœ,öv\Ñ±À\ç÷\ã\×w?ŒÏ¿šcx\Ã\Ş<\ÅF\è\è\ê\n}\ÎôıA\ì;n¾\n^o¾B d\ï»©´j&|A\êƒ:¿\Ù[Gªh8„D,«\İÁŸ“‰8ll°³Jy.5»\Ñb·ƒÆˆ6\Øt¸ó:•ÿ\àß¸\ã¾\ÇR!€z=nV%#ñ8\Z#\ÊudŠy°š1÷^~&*÷9\Ãw,º¸[Nd\å\Ë7¡c\Ãb8\Üù8\äncZ‰\È\Ş\È {L™€\ç~÷ qÂ˜B—ztM=‘J\ê÷L‰…($	#	©†±V‡—G3¼™{¥r±”¸`¡Jwt¶Í†.¹ó,\é\Ñ$˜>u\"~ÿ\äı\Ê\äg‰a,	D@\ì\Â@ Iµú\"\Æ\î<Uª)pˆDcp:ªa®\Ö\íÒˆ˜ŠKWH\Î\Î$	]\ëüK¯K\Û/§\İË‰h<µÂ£¨\Ôÿ\äycb…ñXƒ<{ß£ñ\Ù\'\å@Ö¿û4/ü/ª\ÇNCù\Ğ\Ñ0—\Ì\'€”\Ú\Å{¯¿€\êª™I‚\İ\Æ\Í-mhinEGG\0\ÍÍ­ À`sK{§\×.).€7?¥%…¨¬,Eyqb˜d‚\' \Í\æPT­$–\Z? X¬\ØRWN=¯\Û\ï2?ÏƒWÿø[T\r¨ÀA,²9D\"IA_+¬VÕ£\äpaó\æ´´ø\Ğ\ÒÚ†¦–vE¦Fõ\Ë\át ¬´¥¥\Å\Û)--\ÑI\ÊNŞ¼¥\'œ–\Ú/OA‡[§D\\B\ìTLed\ã\Ñ(j—\ÏC\ë–õq\êM(\Z»O·\Çh{œ\0‰¶\Öc\áo/@a\Ù\0X¬vT™Šÿõ\rş\Ó\Ç;„€Œ»\"‹²™gºv\Ğş{\á\Ñn\Ïø»\Ï\çÇ·s`\ÃF\Ò÷•V^Q¼\Â\"x\n\n»\âRöx\Ñ\Ö\Ü\0_k+Bş6Ğ”‹G\" Y\Ğ\îóñ‚J\'©~#‡Wc\ÔğÁp»¬ˆ…#¬¶Ta„«¸+„6!<òø³x\Íd\Üvõr\Ï8\å\\}ùùH\Æ	\r	ER¨IT$-\Â~ll\'aùŠ\rØ´¥ \ÔHU¢}\ç£\É«ˆşP…E%(¯ª\æmš£‘0ˆ\Ã£q\ë::@ûwP#)3a\ÜHL›6!\íc\nw4\ÙYŸÿï»”c<.lV\ê\Âz\\„¢ª\îv{+\Şz\ÍõhÙ¼¾\æ:X\ìLºò]\r\Éù=\'\0²ş\İ\ÇĞºd†N\Ş\ë\æ›İ’Q\ÓqÈ¯‚×£l-·üDK\ÆÁ!\Û\ãøcOûûªU\ë1{\ÎD\"Q>\å£&¢jøheÁW9JŠ)’Äª%1\ç\ËO‰„Ùp8œ¨\Z<\Ş\Â\"Xm6Tƒ`\ÓVl]»\ÍM\Í|ş˜QC1q\Ü0‰X+\é\ïdcú\"$‰\rŸ}1\×Üœº;\ï\Ôñ#x\Ò\Ï_šº\ÙïŸ¸¤:’z\Åö\Êˆ†ü¬\Ş9\İ´´¶cşÂ•¨oh•n0¨\Z¥5c\à-¯\Ä\ì/ÿ‹\Úõk¸oôü^o!\ÇJ(\Ğ9¨f†¯ŒJ‡¡\ã\ÂÁ \ê\Ö,\Ç\ê¹\ß0XJKŠpÔ‘3\ár ¯¼ş7<úd*]\\\ÍN»[\ÃÆ˜\è\Ç4¿>uOÔ­Q\Ô\ÎaS÷\Ç\Ú\ï¿\Â\È‘\"9‰‚²\nxK*±iÉ·\È/©@\Å\Ğ\Ñ8ş–—\Ğ\Ò\×6¢³¾3€|ú\Ï\×Ø¥kfk8>ù\Ïü\Ò÷:\îD”\Ã¦NA±ò\á[­X8\çk¼÷Ú‹  \"©NXšp•\ÕCP\\ZÒŠhj¨\Ç‡\r—\Û\ÍvI\íâ¹¨]¹.§\rû\ì9EE^$‰÷”l¬£‰ig°øC!zô\Zˆ/ÿ\Ùñø\áA3PT@\Î\0…uKÌ€\ßüş b¼òş+(\È\ÏG<ƒ…($Ñ¨´\Ù\Ù6Z³¾_»\ÅÅ…¨\Z7ƒ\ÆO\á\ï~?\Ş|\éi4\Öm\æ?\ÙC\Ô\ï¢\â2T\r\Ê\Ñuò\æy0qú>\Ì\ĞşQ2‘`¾ğ’\ŞDc}cZˆ±Î¤fÙ­V\äy\\\Ø\Ô\"\"\è¾\é,8}V~ı1÷s\â!?ÂŠ¯ÿ‚\Ñ{£\æGW\ì)\Ñ\ÙMv:@‚uk±\ì¹+0d\â^ˆı¼’°J\rÃ¿şó9.ÿİ‡ğzŒ1w¼¶\î\Ç9³ş¡õ7\r!bıšõxûòªK¼®™¿¸¤\Ó\ç¹\İ_q‘JD\ê‰Í†ö–f<q\×up:]py<p¹<hokAaq	\\<TV\rAIy%B\áö9\è\ÏD#v©®ø\â#l\\²\Ç=e••z\é&4¯I\ám\Í8H1D~ò\á8÷”#¥ü5b±\à\Å7>\Ä\Şú7÷\í\ç\ï±W)™Œ«jVñp\0‰H\ß\Ì^€µ\ë·b\êŒ²š1|}·\Ç\Ã}ú\äı·ğ\í\çÿ†\Ã\î„+\Ï\r’c$Aˆ`%\Ğ¬Æ€ƒ\Ñ\á÷\á¨Ÿ—\Û\Ã<.’²\äV…\ÂCX¿d>ıÓ³5z$,v\Î>\çTX\È\Ş\Òy”üÿ3K™oDQ\Éw¹°UR±¨`u›¿+şr+¼¥•Ø¸h6Z\Èş\Øó`4o^\ÇÀxù»\Òüı\'Xÿ÷\Ç1şÀc°uõb$ZEH—¦6õŒ›a³™‚|I?š>\n_|gô>¯¼ø8Ñ°FÁhmiCqI¾ùz/[ƒã¯½ù7s¼\Ü7M¥}ö\á{x÷•§-mX°f3FŒ…|·\Ã+‹x2W„5+–\à\ê»\çI‡@¬c×¼7Á1?Ø—mg^`wò\ÄL\Â\ÊFğ*\é‰[/\ÄôI£Ã›@”Hğ§–T­\Ë\î|†›ıÙ»üI«D¨± Ÿ|·X¹f#–nhÁ\'\Ç—Û…<O>\Ünƒ\à\Î+\ÏE,\Z\å>Ú¬v\Ì_¹‘¤\r\ã\'Œƒ=Ô†\Òb/J\Ë(\ĞŒ›º\'>R.I\â´8‚¡0\Ö\Íş\ï¼ğ<®¿öÚ¤õ\ä\åÁbw\Â\âp³\ë˜\Úq\'ƒ­\rM†‰½ÿ´qø÷¼5H\Út2#\Ùã†–\âƒ\'¯\çc\Û\ëk±\îû¯XÅŠ„Ø¼|>&ıò98Š•g\ÛYm§K-Ÿ½Š­³^Ã”#N\Å\ê9ÿ\åq9\ãşFğ\Ğs¯\à•\Ï7\Z\Ô,·;Š¯^¸\r[\Zšq\Ó\ÃÄª\r[ùøi\Ç\à\éo\ÅüSÆ”€ò\Î{ÿ\ÆO\îzŠ=Q\Ä!\"uƒV8Aø\İ}·ğÄ·Ym\È/(\Äf/fÂ£\Ë\é\Â\ÈQ£\àHP\îu³\ê\èğ\á\â\îbı=\n²\î÷\à\ï c\Ëj\Ä\Ö~\Ë\Æ;¬v6Œ­®<8ò‹\à„p\è1ŠŠ5ëµ‡\Ô`Ÿ.9”\àòy\æ™\×ñq\ß|ò&¢­HFC&õ*bù\Ú\Í(;ğ\äÀ\ë\ÍC\'\ïñ¸±r\é\"<}ÿ­°\Úm¼9Ñ–?–¯Wœ´O\à°\á\Ã0´Ø‰P°ƒ¥à°‘cq\éwóÂ¢¢g(\Z\Åò\Ïş¹ÿù\0gœ\ŞKö–\Õ\îÄ…Wı\Zó.\ã{Œ\Z:÷^ó¨ª(Å¤\Óo…Ó®\ÇS¶4\Õ\â[\ÎÄ ½\ë\Åÿ}FL`‰Bsaô\Ù÷À[3igaƒ\ï›s\0q{‹1h\Ü4~¸\æ\Úu¬j\í{Îˆ\Äô¼·+Š¯^¼!üüú\ÇXWŸ6q4~ğ¦Œ\0¡\ã×®ÛŒš£\Ïù\ç)‡\ÃFôub¦ªö\ß\İ{36¬YÁöˆ\'¯\0|1W{Ad«.Ç2/\âñ{ˆ.¼\îŒ;Aa\Ç\ãğù:8ª\Ü\Ò\Öë‚¿£²¼p\Øa…\rv’Š6®¬\ÅEWÿ\ZÊ‹ñ\æ“7\éœ,ª\"×µ²Zñ\×>\ÌÀo\ï½\Ó\'\â`)ø’±(\Z[\à*­D|øLxóPP\àe–,y¥(³v\Å<ı\à¯YU´;XSÛˆ5µ\r†	w\Ä>\nD1r\ÜD\r L‚\äü™8“?W\Íz¥heI\ÜY»øº{1ñJ–\Ğx\à\nµ‰§\ß\n—\nr\ïz\\I\Ì~ş&DB~µÿûE•ƒvD`ò`ùV\Î\Æø™\Çğ\0•Ã ò\Â\à7o\Ì\æUZ<\é\Ç÷¯\è^ \ßüˆuu\"\0~ü\ÆS]®8±3\á\Ê/‚ƒ¨\é6O&6\Ø¼ò\Üø\î\ËOY**)Ç·‹V ˆˆj\Û{\Â0ö\ëœ<@\×\İÿ;—”³º#q,†@(„ö\Æ:ä­Ÿ\Å\Ş+º1m•UÖ^}ÿuĞ¸\å’3W°œó-}¾û©\×ğ\á\ç\ß\áWœ‰Ó=„=Xt_„I6\Ä\Çÿ\ÅE…pØ‰†®\Ø8ÔŸ–\æF\Üı¥üd[„cI|1_§t”\åc±5lkD£aL\ß÷`ü\ä‚\ËWóc\"hœA\ß8¶ö\Í\é\ÇVòˆq\ê%\Ì\Ól+\0¶6\á\ÄkŸF2¡\Ägh‹W\ï8\ï=…U«\Â\ÊAüıºù_\ÂSP¼ ò(“Š\Õğ¿·1ñ\ĞaÁ\Ço°‘F+\nI¢\Êj¶EH\Õ:\î\Ê\ÇP×¢d\Ãyó€Ï¹ö\n)R\ä´\Ë\ï\çÿÿ\ïı?t	„·Öš½xB	5‹¤¹g\Îı|\â~– —n—«6nå•›VÃ¢‚<ü>\Ä\"QŒ\Z;\ç_}+\ë\â±ó³(\Ø‰%\\õ9\í\r\\\í€tB\0\Å)(\Îs\İ]O`\Ö7óq\ÓE§\ã\èƒgH¬^‘¨\×\Ãú\à¿s˜‹5s\ïixğ\Ö\Ë9\ÚL†:¹‘I\Íc‰3öP8\n\Ê\ábGƒ•ûÅ´«\İu\êj7Â¡¦D“6l\Ú\Ú\È}9x\0\"\ÑKr\0º8r\Üd–\Äx‚¡q&…Ú–ü+#/K&V\îw\ì\Ïyü_\âMz|9o)®x\ì\Äcf\ïNª)Á\ßSTGy-\é=×­^Œ–9q·Š%f±lƒ˜\"$	\rÜ²«pÅŸ\æ\Ãbq2@şó\äp¸õÀ\ÓÏ¯”U‘—Ÿ¼D\æ\ë*õº£jO•UÁa·ò¤\".IRµº\ï\Î\ípº]tøaµY\Ø\Ğ%£=D\Æ1Y±Î¿ú63^µ	”\ÊM‰4¬Fr\Ó%3\\«VŠƒP2•\é&‡Ÿ¢¬²/\Ş%\Æ«\Öw„Rir’­\r\Í8õ²û4\éH®cR\ï(¨\ÇLf\"M\Ú]Hûœ.ƒƒ¼q\0Šß¬[¹\Ï=r\'\Ç<Z\Z›8ŸCK4\Â\ÉQdó3“ı¡\Ú\ä‘#\éAiMó>D©#– RŠñ\Ê5ğ³\Ëng\Û\ã\\¥-TŸ»?ô¦\ÂÉŠ´\ã\ç\ÎÀŒœ\0gb´Uz7@Ò¬\í2@–\Ízƒ\'\î\Åb¶­~³¦j\Ñ÷\ä\ÙøvkO¼¿G_>s\\ù\Ú\ï~šT‘¹¸\åŠóp\ìv)E\æ/XW\ÍTL>ğ<©C\â\"@8Àó\İ\r§Ãu«—*„@U\íQ\âÀ\É?»UUƒ\ìğ1Óƒçª¡ƒ[;\É@+\ß_\á`‘w—$Ñÿş\ï;\\\×l¼õ»[Ô­TÎ“¹6¯úù”_Şƒº\ÆV– \î;’`E•š&4T˜¹ö\Ê\á\èp\r„¿­…\ËôKyÀ\ĞaX¾x>\æ|ñ)|¾64n\İ\Ìj^\"FYˆŠ\"ğ\\|ı\İp\ç)q(©U\í\íøÏŸÆ¡3F€\n‰§kòBô\Ú;\âñ\ç_\ÃQM\Ç-\ëqÿ~ó=.~\è-t\Ûğ\îµGÁõ£¤ªC&)i\É2@XC\Øm¤\ëC-»y7,ş–½‰XT»\ÂıGg‚\Ç\ßş\Z.iÄœ®\Ë[¤eÀ½şÁ,<ù§¿\ã\è\Ãö\ÇmW_\Ğ%@\è€yó—°¨´j„\ÒU|½Q“§±«v\Ö\ÇÇ¬ÿH0À“’~«*/CQ~>£¢¬C(CÀ\àÁ\Ù\İ\ëq+v,6>@bµ\ØÙ…K“é‡Ÿ\Å??ù\n??\åœw\ÊQˆ…ƒ°»<Rş­XPı¯ğ9xù=\î\Û\í\×\\¨r±\â Ú¶\nq1\Î\çS†\ç®$Æ¦6´·w ¾\Ù\Ç¦\İD“?„úú­\Ìò%ge\Î<\êx\Ì<\â8\Ú\Û9İ–@³iõJ¬û\\\Öö™1	«*²\Z\Ï;¡¾ı—}<N;f¦rN2O¿™x2†VòbGM¸ó…šÕ¸a%O\ê¹y§\\ó\nl\î\Ìy\îY=T/\Ú\é^¬õ‹°òO7³k·¹v-Jª‡ñ„\ên\í\rŠq\èö!\ÔÑ†\Ï6DpÚ±‡¡¢¼Œ]‹\ÔV®ÛŒso|,\ÕP\ïªN\êR]·n#òZ[\Ú\Ñ\Ú\Ön ¼Ó¤#\08­T@\"EÅ´¿±{•š½\Êş Jƒ\ÒT4\î•jzE«ò–º&œôó«ùy\ßxò&TU–!\Ô\ŞwaYj\íñ\Ü\É$¶46\ã\Ô_\Ş\Ë\ç}ô\ÆS(\Ì\ÏW÷IOrĞ\îM6„B#\';$—¨%¬<\'M\Ôú\Æ„B4·ú\Ğ\Ö\ÖÁ\éÀz¥G†\r\Ì\ÇQlh\àÀŠ\ÎSõÂ‘\Úú‹÷]Á\Õ^¨½~õúZDš6!Ş¦¸\ãEa²1‰d\éoi`\íşO\ã=ny·—Ó»÷§\ït€\ÄC~,xø\'\Ì\âU\èÊ„\0Yü\é\ßX\0¡\ÉFŸ‡M\ÙV‡Ni…9\å—÷¢®©\Ür\Úo:ŸÓ•-bBe\ÉgjdjùI5-W]Úµ„B\Òg”Ğ¾RÈ€õ%\ÇB\Êñ~ô™?\ãõ÷>Æ3&\âşk\Ï\åş†\Ú[\à.T\\¡¦Œƒ(¹\á¡?\à‹9‹q\ŞONÀ?=Y9šóQ\ê;\å„(µ|•ø…v9q\ÕMFM\'±KU\é™\Ú.8i]$\Ëk7\×\éŸÿo.®¿ûI(+Æ›¿½IVr\ã&¢Q¬[ğ5{ó\è¡i‘£VXQaÓ”8©Yş–z”×ŒA\íòùH8ò0şOô~†÷ò\n; ôüó\îşÊ†ŒfşUÃ†•\ìA\Z0r\"3<\×|§¤«’§ƒ¤Ì¦%sXÒŒ\Ø\ã@\Ø\İP\ÜD4]\Í\Ú·]­G|»5F\êÊ­\í\Ü$\ï«\æV\Èû~(zÊ¾O¡\0Wƒ\×nE{¢„©Ï¹šó\'o»{L\Å\Øñ\Õ\×\ÂST\n›S\ÎQ—Šr¥y‹WrT\\\Ù\ï¼ôó²H©™‰·°º¥\ä\Ö˜-\\\êH\È%Ã2!U\Ş\0³	LJšmo\ê‹^w\Çc˜5û{ƒ{—/\ÔÑŠX(ˆ5ó¾@\é \á¨\Z=Ë¾ø€9\â¸M<ô\ÇÜ\Æ\r+\Ø\î¤wL\\,W\ÕhŒ8\í\æn½º\íqpN\0d\Å\Ë7!\é«Ç¨‡0\'‡‚E\ä§U…È‹Ô„û·e\Ó\Zl\\ú»ir\å°gˆš\ì\î}\ëÅ‡P= ¼wcf¨\ä œ™j‰–j\0@K[¥Û¥\'‰	\é1müüö×—j’­½~#òŠ\Ê9—Dó^‰²¦REºê¥¿ş\ÓON;\áp\\u\Ñ\Ùú&ö0T\ä7‘vÈ)•\Z\ê\î(™˜ ›\ë\Zqò¹\×òUd÷.y\Ü\ÂZ·n@ıº\å:iW\rE\í²ùhÚ¨\Ø\ã8†½Y\"`\Ò\ÂH\ŞÌ3\Ï@\ÕÁ½­¿\Üİ¥Ÿ\0\Ùø\áshüöL7!P8=y\ì\É ·Ÿ A\Óo\Ô\èwúu\Ğ\Øiœwa\ãX¥	oVwŒõ®†\ÑP!Q®hh\ØDTHL…\ÈÜ…Kq\ÉõJœ\æ\\1\ÃiºË¦U(¨¨\Ö%ˆ–û”Zå¤®±\'_ªHŸºÿLŸ¢}\Ğ\É)R¥F¡†‰*\ï&/YWı\Îô»÷ c„qnö^\Å\Â!N&#•)ğ3C‚>Y3½Ó’ªaˆ†É•¤©œ\0å¡¯y\ã^¯¤J\ÑjBu¡^\Ñ\Ë ‡¯¹W 1ûÁÁBWNf\Æ:›*E\Ì$øL‘”*\ï\â\Z™«üôÒ›±j\í&œrôL\\ùóµ›’·®m\ëz\ä—UqŞ»\Ò\Ì\ÓOFzú\Çÿğ\Şø\ç,\æxıùw÷tÚ´Uİ»g”u9@²ôs:1L)¿ñV|ı1«\Ğd€Û’¤5 $=„t\É\ßFck[\ç\åAº¢msÀ‚\Ï@AY%†N\Ú[ó‹K\0„V!6úbQf~\Z3ù¥•w/=\Í/\ï|\ß/]“\âò\Í<õ\Ò÷¡\ËıA$s7\İ\èüGş\æ÷x\é¡k˜$©d„\'\Ù\Å\ëk¨e#\İSX¦j=†]zt/“jQF\ä9\×=’&§ÿ\èH\\y\áY†[§H­Ê»ĞªR%Söo0uÒƒ’½~{\ÛEÚ¥8áª£\rş\æzÔ®øYº\Ô­D\0D¨X\"²ô‹7dbN\Ø90$\Ú;IZi\È\İG‰4\ä©\Z7ó\Í\ÔHı¢.8•\Ã\Æò\ê+\è\Öô»l‹ü\î¾\ë1}Ê¸\ì\ç@¦#»)9\èğ|ü\îzô9¾\â¼\Z£‡\çH¯öµ \ĞÚ¨\0¤ˆ\ì%}­\âı>\Ägm\Ö+¿¯XW‹Ÿ_÷ÿÿÖ«.À±‡w\"HW—\\\È\ÙL*8\æ.X†Ko|€/!\Ûô™1\Ê\ï!ÛƒlR‘I# )Aİ²/?€Ó‡q3\åÏ´ğQ•™‹¿\Í	¯—œ‘ ”—¾\è·°(b˜D2\é£\ä§&¹ˆ°S|$\Ğ\Ş\Â\Ş,›\Ãe P\ç‘b\r/ıö\Í\ë“İ„0RÏ6ˆZ¶F®\Ên2\Ì\éø\å«\×\ã’\ë\îe¯\Õ\å\çü§{\ÆH\ÕB‚-\r\ì\å!/\ÅBt\ï˜qs}¯Aİ¨ø\ë?ş‹\'^z—½ZO?x3F’V93\Öó2]W\ì\Òµ‹¼r\ç\\z;¶44¥x®hŒ£¡ \â\Ñ0{¯ò\nKØ+¤„°A((L€„E’¶‚òœp\ï\æ@èˆ\ÙÛ¶ô+Œ;ğh´\Õ\×2PhuYù\ÍÇœqH\âY\Ø\'u¥h«\â\îÍ‡\ÛKÁ;cq‘c~°?¯´Æ–­=\"E²´:R¦«\Ò\\[¾zƒ<·^z–$8D¼h¯\Û\ÈjD‘ ,\ÔuI¢>b¦}B\îú\í_ğ¯\Ï\æ@’~P\ã;zñ­şWvF\êQ$?ø\ÏW÷ø\ÃW\Z\nU\ÓÑ¡v\ÄB~Å¸\nË«5j;\Ùó³ß‘|a+/ŸÃš\ã…Ò©½\ß^¯§ı2Ÿ—3„WUŠ\Ğ\ÊBv©V\ä­/ˆ»#¤HAih\Å!‹T-ˆğï«½$ƒb”+rĞ¾{\à–«\Î3IHL+iZÉ‘aG(\Ú>ûj\î|\ä9–\n8~¢\Í\×kİ´Š£\àw>¬\0\0 \0IDAT¢2ˆ\\PM`E‰Ç˜w»\Õw¯½ë·¯h ¡ØŠ\Ù&Ñ¯+@™rÿ4V’w?ú>ÿz\ç|<y\ÛEZ\Ô\\›\\\ÉD¸wImnk¨e\Ç5’ş´\à¥D\ĞL(Hü¯\\H³•A’S\0¡£˜Hh\Ë*Œ\Øó \Û[5u‹\ìñY\Ø\"}«¹{\É5,h\'reºuşY\'\â˜Ã•\è­\Ò2I)\Î!&J\'„RmŸû\Ë\ßğ×¿}\ÄWepüR7 \ÍUÓ‰®ŞºY©^\â-§D¼Ô˜‘¦¤„!KR¡\îVAB\×:ı\ÇG\âü³~œA¥T%‰ğğ\Ç\ì}4üûK<ÿ\çwX­\Ê•^Bt!\á\Ş%5ŠR¨µlY\Ç\î\\‘\Æ@*3­Kd{\äZ\Ñ8^ôrÅ‹%¦+QO?yhÏ!g°\Äg²\rBb9\ĞÖ„\æ\Ú5\ì\î¥\êN\É\İ+ƒ„Œö{~=[\Ô(4‘f\î;=m01}\Ü\Ãl{\èò\×\ßı¯¾ı/­¸ô¹§‰óNı¡Z™P”\Ú\Ô7\ã¡\ëÛšhU²ûJ•úL¹¯Z‚H^\Ùu›Bß›´²\çÿúOü\áMœd—œy\ÒqÚH¸K{š\ï\'™ø?¹qÿùŸ/ñşÇ³°¥^\É5\'\Õ\ÍŸ¦\å{˜Ï£r­”\ÔE\îİ¢CQ6h8¿C¡‹\ã…jµnşWpWÆ˜Ÿ)|³\\j9\ZA`$ƒİ•—§­8ü[s=¯>dÀo^6W)\îŞ²J\í$\İ ÿó³9xá˜¯%\Z\Åöœ2cG\Ô``e)ö‚o|ŒiOB\"n­o\ä¼\ë9ó—`\Ş\"=Co\Úø‘8ï´£0}\âh\İ\æĞ¸X\Â{¥ümÛ¼–X\"6–›9\×\Â\àÍ’W{•‚¯\ÑMÀ{†¼ğú‡˜¿tµÖ¿=&\Å!û\ï‰\Ñ#©e¨¦ÊŒ¼ct\Ò\Ê\Õ¸\ÈöŠ5\ëñİ‚¥¿\ìóN=’“¼:k\äxğ7)\î\İò!£P=n¶3¼¤6«9 ¤!O…:¨f0©V;›¹›®O9	zP\áö:qo..-ôWúôVr†\nw¯L;\é\ì\Îúv>ølo\Ó&\êN™¯ª(\Ã@uO>Ÿ?`˜(\æc‰|xú1aú\ä1;6½\ä ø\0\æ\íuø2…†*\ì\à”\İg\ÉÖv§U%Š(°\ÍTEÁ“\no\Ï]¼’\ëj¹1S\Ûc’¾qPgı#Uj	#¸\nıÌ½º.  \è%Â½K‹q\ë\ÈÁB‹šh\Êlİ².§Üº\æñ\ÊY€Ğƒ.}örD›·`\è\ä½9#O¨Z¢$²[\ë7ƒ(\r\Ä\î5\ÓN²\Õó–¬ı#[…²÷D…”L\çÒ„!*÷¨aƒ0f\Ø 4´Õ˜fchGl`”ô©£q\Â~…\Ñ\ê-¯†\Ë[,Š62ß•\ç\ìa½\ê¼ş|zkµ$½fUµw0kö\"¬X¿	«\Öm\æ>fZ\Äõ(p`E)÷q	#ù_wZ<F4dö®\İ\é\ÄÀ‘“Ò¾7J¨]6/g8W™ú˜\Ó\0!¯\Ö\Ò\ç.‡;\Ï\Ëj–,¢©Cd“P-\á\îu\äh\'\İy±ò±´Á\Êuµ†¸\ÄÈšjR®¯\Â	—V|a›\èTq%\Îa´9x§’¤\Ñ(Zjõ\Í*Kf•Q\\V\á\Éû‘(ñ†\nS\Ú\Õ\ÏÄ±b/—ş»($KõDV\ã\èü¿\èŸ9”v´¥ş\é~¯Œ\ÑK¢Ÿ\æŞ¥\ÌAQãŒ®\Ç‹\ë\ç™³v‡\Ü\ïœ=¨\È8T\nŠù\rªı.¢\í‚\İ\ë–\ÄxO^°vÈŸP«\Èûg(\Ç(’Á\èÒ¥†\"H¤\Ï\ê9M›™‚A¢ÿ¥CTUG\ÊÑA\Ú\ÌGHm\Ò+_(%Ic8NıUwX\éq\Ãuz5`\Ê\É!_+\'¸‘m1z\ß#jÅ´\È>i­¯\å*\î¹P®«.\ç<@¨¤j\Å}\\}1][úùûp¡j\Ô$– ¢\ÚIW7ÿ{%y¯$ö®\0‡‘g”$Bb(%}‰Búy\Ë&…\æMrY¼ƒ”ŒD\ÉÑ¼K\êNQBb(û\èC“$\ÉBÛ¬©q!i@d›¥›Ş¬lÆ’ˆ‰$A„{wüAÇ¦œ\rú9~•+tö®ú\Õ\'\0\"¤—(%\×\Ü6,šÍ†û¨½…\İ\é†=\ÃÎ®]\r†\áwÓŠŞ¥1y«Rl‹ºô {\å•T ¯d \ßV9^Qo\ä¼e\ë(IB0\Ò\ä\Ïü…$ô\ã3I\ÍU,Kœ\ĞM\Ì\ã)\è%«¾ı”r\"¦{W¾\æzL¼,7½V)‹f®\ÅA2M\â\ÅOœ‡d4˜VŠĞ¾hª™²/¯\Êrµ“nƒ¢³|M\í\Òm– œ™G+»ú_M\Ò\Ä\ãhŞ¸\Âğ8…k\à\Ì+Tv¤’“¤Xˆ8‡²e.\Z%†¾?ˆ\0?\ïg´Ut\Å‘7f.¦zÑº5z¼G	©P\ë|\Í\ì]Á\ÜW\ékÒƒ\ß]_ˆ\"\"gD~u”‰¶ø¿CÙ (22…şŞ½\×,õŠ‡F	¢\ç~t\å½R~· \ĞÖ€`k£\áQŠª†+…­…½b`b‰\íwe/•²™¨&AD¤ÿ*qE\â(u°ˆŸo˜ùwñX\ÙG\Õ\Íc*\è\íMW£©v\r&òc.”\'7‘\ë\Ñlñ\Ü} ôÀ‹?»E+n->•-%\ï\ÈĞ‰3R\è\ï\Ù¤\ËºFy\×\rt\Å[+‹úVògE}jX½P\İDšÂ\Ã\à\Ê/”\"\îª\ä‘l\nQ‡‹«¿	¡ˆõ³R Ay³7\Ëü}:N—g\Ñ\â0\Ê3¦\ãfe\ZKAoß°x\ç¹\"¢81\ÊE/\Z@N\ìû‘õœ\è+„:$\çŒ8´<¥«bu\"\ÚI:ú{¶¢­ªa­}–ò8´É£fPg“òGò\\ÑŒ%(‘\êÑ¸~)\ÜùFÆ±» †(g\Ñ\ìvŒ&¨\0U†÷ lOÙ¸SŞW€D— BJ\ÈÁ\ëña\ë¨\è\ênù—”\á$ûƒT¨Us>\å”Q€\\(\Ø\×\ã.x,\çv²\ílnô)	\"JWÕ¤€”3Bti¢xË«zf‡¨†j\Æüt6ˆ0°5\Äÿ WõÆ•ùZR\0B/†¤¹¦i\êò>\ë\ÚNp©RG^!\Û#¡¶FNB¢v§·ù¥‰!I!A\Ì6‹lƒh’‡m\Z£D1rH!Jv¾\Ä\Ğ\"@P¢—¤Sƒ\És\å¬–“|«~\êˆ(ğ\î%\ÈY†r\Õ\Å\îI.ò?${AHƒ‘½Y\ê\ãşyW…eŠ\ÇJnT§\Ê[6ˆ)\ïr£j‹V‡‹¯…Û›¤m_s#†MŸ©T	D‘òñ\"È¨G\ä•;½e\êy\İ,U\0)\éµrö |Q[ W\n1t§‹}J‚P\ÇHŠ¬ø\ãõˆ¶\ÖaØ´ı9o„¿F±\ê\ÛOx\Ò\íÄœ†›Í ô<¢Ô•’½X<4u[jW£~\Í®û•©‘\ÊH;\íOE\à\â\á0\â±0¢Á\0s·\ä¶i\Ù|L9\êL]‚\È6ˆ\êÅ’\ry£Kõ‰ŒH™\ëe²A²3:F\ØL/q80j\ïh§\nÕªtò¡}\Êö\ès\0 Yöû\Ëñ5&–\Í\îdF´Q3\å\ï\å\ê\ïÙ¾l\í8‹··q…½²Á\ÃÒªY\İy6¢‘o\\:Óû™*AdoW\Z\é!\×\ÂRÿ¿­\ã ²ı!úBW\È\×\Æ\Û5”N:5?Ö«½w§¿;û\Ø>	¢Å·.û\âa?<FÀ]1\ë\Ş~¨\çvH–6ˆ\ÎÅ¢š¼Â‹¥²q…÷‡ÿªñ«Í›Ö v\Ùw¨\Õ5#¶³I\ÑŞ´‘pcö;\Ê1q´¤¸‰I‘X\ÄZ°°{õ_\Èşh«\Û\Èô’ÁGœÇ©¶¾õ\Ù/ŸvxŸ2\Ê\Íc\ßg’i-xğt.À´©ú{·W¢ns±L¬]a‹Id± y\Ó*4m\\w¾\rVñöŞ’rÎ¶S¶ˆ\ÖIŠö¦:ø[š‹†QR5„¥±—\Ç\ì{\Ç¶…Zn”¯ \ÕŠò÷Z\ä]\ÎQW\èö0‰øÇ–U‹hoÅ”\ë^\ëö5rù„~5½ş\r‹¸˜Cw\íô6ˆI2¨o\Í\æP#\ïü’¨¨F®vœ‘£E®PÊ¸kX¿.O{¨¨\ì¨\\ü.\ìhC,¬l@+4ñv‡\å\Ã\Ç+\Ş\'•K¥\ÅI4¯”\\\Õ\İ\Ñ\"\ì2¥³:Y]KaPq†üš\É9S\Ïj[®\ß¤aöß±\é£\ç g\è1/+KŒ¼ü»\ê­\Ò@b`ùšX¿f\ÉÂ“=\ã\îfj\ä\\\ÜTñNi\ë¼\ä½R¦²n(‚$]]ò^i—\í9Å\ìpG+\Ó\Ûs1§¼·@\éw\0	Ö­Å²\ç®\à\âÖ”m^™³°´u5¨\åyh\ÕMôˆs*\'Ë¸¥€!OD	|8X©÷“<Cfa—\Ş+\å<%óPf›>§\Éd\ÌV\İ\"ön\Û\Ö\rlôµ `Vs¡/EÒ³\é³\àÓ¹Œ)•\êy~H\ï\â!Ê³Jûo¨oN¦\Òûd¬¢¢|ŸÊ2\Øò@Ä¹z¬O¾)ş¡0 ³Ú”\ã(ÿ£¿\Úüû#@V¼t#¢M9Òü3›Õ°¢kD\Ñ\Ùõ<¡Ã§\É,d[Dör	¯—‰\r¬q¼\Òm4¥z§4ƒZP\Û\Óp¯û—¨¿kq\åzF¢^«WDĞ»Ã½bøªùÿğ\ß\ï\ì~ÁÙ¢xQ\ß\å\í²_*SY½B*¨\ÂA\È\Õô\Ğ¾²-¢g*Ek)6şSŠE \ÂRˆš1¡ın¸šN\ë\Õ\ä’QpôL‚Pş99ˆ\Õ\í~Q6hÈ„\\HŞ¦-+€dŒ‡ˆ”t!dI\"\Ù\"¦\í\Ìµ\Ê(i4¥äŸ¤‰K\È\Ş\'ƒ-!rÓ„\Ùr¯²©‹\Õ\ÙxQ\n´¯®–ùW£Ï¾Şš\Ş\Åx²z7;ø ~©b\Ñò¶n”2ttÚº½Y³¤şe€ˆ{ˆ+¥\ËQ\×\ëj	\é£t6G¦§\Ò35o\ë8I\é\0\Í\Ñ\Õ5U\Ô2P²õ@*/Ú´a%\ç\ä\Ê~\İ\íCW\Ç÷[€,}\æ2 \ì\ãütu{»\ZC\Ú}\Ë3å¨§·E´œu-7\İt\\\'D¿¿T•]\æZ™rÏ•\ã¯•(_ªe&fÅ½\ê:î¡›Z—ó?<Eÿ‹Ç³\Ò>wL¿UŠo]òF\íuH\êe¥¼\É\î\ÄERª\èAD=­D1\Ô5ù#\æ´\ÈL—#\à\æ·©4\î\Â5J\İ	–Frh´’\ÍYQÿjÕ·ÿE\éô£0\ä¨\ìö¦\ï\Ù\İv\ŞYı b[7²CòŠË·q~ˆ(¯Î¶\È !¤¼-\â®-ôú\Æ\Ì2‘0İ¾ \é\ê^¥—Y\Ä=zÈ½¢\éJ\ê\ÕŞ¸dN\Î\ì\'¸=`\Ôo¢%W©»Pu\Çİ›~ »ˆ‹È¢ d0I m\Ù\Æ1‡\ÔM\Ş\'ós\é‘òô’C\æ\\)6G\nùªGsJ¸wµük^\ÉÉºº=\êœ\é¤~\ê\çš\×\ïoõ\\.D[ES\í\Ş\î´N\ã\"²M!¸Q¯¬´»§ \î‚B.œ¦\\\'½—K‰K\è\àKÿYÛº—‹T©°£¹\Íu¨6†\Ùz]-9b\Şû¸‡;\ÚÚ™j|QyŸ‚‘\ÓûeüC[\ïúc PtN¸{õ=\Õ{^TN\ßùI™\ÌZD\\[˜/MÔ­«#‘ˆ«)\æV\ï®<¸¼LP´Ú•ymv¥\êG&Á¡\ÉÕù}\\‡8hG°½¶f\åY˜\\‰Šacùš©ù8º³B¤9VH­zb?u\ï\î\0¡N.}öWˆµ\Õ1y‘ª¤Ûª­\Ë9#tõ®òEL’„xJH‹;xB›i&B²=_\rÍ›*W+€\èì’¼Tv‡“iıù%•ğ–UjU\å…2p¯\Ìû£÷\Â@\'	IUKˆœ\è\Z0¢\Ï\å˜wù®w%‹Wôõ‹°òO7k5³¶Y\åE­6¯¤şhUN$™ Ï‰ù\Z‹ğv˜¢}1\è³r´b¨\ZI\Ùd\È+,f5\ÍSXW¾*}L!÷\Ô}\Ñe›£.\Ü³ˆ¤=¯¨}\Õ_ƒƒr÷ûµ\r\":ª\Ø\"ó0l\Ê> b\Ù\î#b\'\æ‹HÛš#\ç:w\ËP5D‹K¨\'J»\æj{ª,\\ù<!z4‰!]\Ï(ğô3s­ºÃ½û~P~üºß `\äı\Úö\ØeT,\ê(o\ëöÄ¹pº= ·/©Zd(U{\Ú\äH¸n“h+]VHÃ\ä[§M‘VüŒ\é\Zj„\İ\ï\á„™F‚³ı>V­È­	\å\îP=}›™\Î\Û%$u^”.\åIi\ë\Ê8\ìIKa7g\æIw-P›\Èñ\İô\Ğ%ƒnXg¼Ÿ9\Ï#m\äß€–t‘ Ÿ+—\Õ*×¶j\îQ§²<i—ÇºwC\Ë\ÂOYŠ.¿-*0\ê\ãldÿÊ…e ¹tµı\Ğ;%\Æ3e\Ã(¿Ô§\Ğw\ß\Éòõw}˜¨\ØNN’}µ|O\×=M\Ä.QS+Ò²C&\îÉ¶H¦í£³\Ğ\Î\ã$$Š`ãª†y\ëÖ\\İl#*\Ê@.\àX(ˆH8\Èj¿µ	GŒ‡\İ\í1UB\Ì,a2\çwt\ÏP§¢u´396.ş\Î\Ò*Œ9\çş~L÷\Îw)€\Ğ\0ğ¶n\Ï^\Æ\É>´\ÍtoA’H¦¹ø\È\Ç­‡¼lM[\ÑZ·	‰xœ«\Æ\ã1\Ş\Û\á¡B…\È/.…·l &o\ç\Ël\Ş^¸n\ÓõÁ9°\Ø9»m6‹YO\Ù\å\0BEy\ë+_ºA2b™¼j÷F’i#©UB:·Yôº\Ñf\ïSv¶NºüÓ±\ÛsC€ƒ\\\Ñk\æ\Í\â»FŸsŸ®o\Õ\íAPO\Ø%\"ƒ„\"\ÏC\'\Ì\Ø \É\è‘IP\Ğ ¹¡\ÌÆ…\ás\ï\r\î®&Š\rK\æ ‹\î²à ±\Úe¢\ä7p¶m£Ÿ\ÉFI±\ÒF\èS%C¦8Œ6\é{©f\íG\êò±KD€„\ÊQ\áhª¥E÷\í\Û\Ì³\és/\'{wŸ\"\ä)±iù÷»¼\ä\ã·\Ë„‚rG\Öÿ\íQ$º\ánµ;¹øuï‚‰\\‡¢•‰\ã•I²h‘t\í­õ\ÎÆŸŠ‚€\ÑP€\ãŠ·Šr;j~tŠ\Æ\î\Ó]œõ»\ãwD}¥d¸¯{\ça„\Z7qÑ¹ÂŠjf\É:\İyL•ï\è#‘P\0\ÉD\\\Û\Û\Ü]>\ÃN¼z—4\ÈÓ½\ã\İ\0‘F…\â$\ë\ßym«ç¢ ¢\ZU#\'²ƒŠ@B¥÷­s5*…eV³¶¡\Ú\ÅöF(À.\ç-«\Ã×°E£öDÍ¯Ş¥\â]½\Ó\İ\0I3B¢®\Ù%ƒ\ÇN\å \ÍA*W^W\ã\Ù\'~§\àD\Ø‘€gªƒ\Ï\ìÏ¿#r7@2Œ6\Û%\ï>Ê™sU#\' ¿´’U-§Ç»]\ì’ñ\Ò\ÉŞ \Üê“¿¹[V/\á>\í¶72şn€t23›6¯ÃŠW\î€;ÔŒb5·½¯\Ú%²½!r\É®bŒ;\ë”U\Ûø\ì“÷\Ø\r4¯mS}\îy\é/X·y+\\^/Nq¬\ÅDk#™«\Ã\Î\Õ\Z‰\Ü\Z\ï\áò#¡v\Å|\Înœ*\ÄkÁ\Z´45`¿Ip\ã\Ï~‚Á•\Ê~»›>»\"Í†6¿¿û=ü\å£ÿ`ø\àAˆ9\\ü«	\Ü\âü´½m«6h\ì4Ë‰—ônºŠø¢vù|Nİ¥r¯h‡‚¢\"¾xcC=ZššpşÃµgŞ»ö³³wD}¡~3·<ó`±¡tÀ\08ºthmiÁ­%+1zP:Z\ZycÊ²!#9—«¥P^	\íG˜K-™@8\èg{ƒJƒR.I¼‚’\n|¹®OwGi	\å\Â+È’µ7\Âf\î»\ä8jŸ¹Ô›ö,»<@Hj\Üöûñ\î\ç_bx\ÍPx‹J”š\Ô…\àk÷\á§›q\â„*\Ä\"|­ˆ†ü•‹sİ·{ô=»y\ÂRƒş…‚\ì\Â%\éA\ÛK\ç\Ã\ît\âOK\Zñ®\0Š‹\n\á”«ÕŠ–\Æl\ÜT‹S?·şül\å÷,©,»\'\Íı£vi€,Y»?¿û4µµc\Ì\è1°J“…^]8?H¹!V\Ä\Åc°ªACªXloeòa\Ù\à‘(©\Z\ÊR\Ä\ér\Ã\ê\Ø1“\îOD4\Â\ÏJ©±-[6 i\ÓjNUôk;mÅ¢Ü»Â†\ï;\ìü¬E^Ø¤@(‡Z¢Q,]¾ƒ*+ğ\ÌuW`\Âğ]×ˆ\ßeò\æ\'Ÿ\áš\'F~~>ÆƒH4n˜‘\ÑX¾?h“\ÌÆº­\ØwPn…[J\Ó%:¸¯µ‘\ã	+¡À\"\Ù&\\¤½\Û.÷vW½H…¢]pI\í#ÁG\îÛºõ+\Ôgr£ ¸‚™Ê¢…‚Ü¶Üok\ÛP1°\n6»E\Ş|ô›\ÓaÃ²¥\Ëğğ\å\ã”\Ã\î>bûÁ»$@®y\â)¼ù\É\ç8 ƒ†A85¼\Êx\"v_×šjmif\â\Ş>\Õ¸uT<o\Êk†ƒğ57ğqÒª\Zä—¨!‹•\'!\Ñ\êYúô\ÖVI&\Ø^ {\Åc1–\Ôü-\rhŞ²\Õ)›Í‚²\n.\ÚmnÁ€®õ\à³õ-°;(.-ƒ\ÍfE¡75¾\ã´;°i\Ó\Ô\×7\à„ƒÀW]\Ö¦|÷º°K„\ì\îy³—,Ã°š!(-¯@$\Z3Œ¥u·ù|,9H]inlD×‹ù<29O~a\Æ¦¢jö^\Íi\ßs\n.–VrRy\Ü.QYQ\\P#\Í5w	\ÔHZˆF\Ò+\èkA{s=K\r*CJÀ\È+*\í´8^\Ğ\ï\Ã\í\Ë\ìø¾%Š`GJ+*X\Õr\Ø\í(ğ¦\Úv›]Á\ë7lÂ´1£ğ\Ò\í7\îRv\É.\ÇI7Ü†\Õk1nmª\ãE,fT«x%D \r[7sú«\Ín\Ã8/pÿd ¿ ¸\Ë%ˆ\ì*\Ê\Õ@\Ê=ˆ¶B¥†¨ô;O)?JÀÉ¦¡€\Úv™®ğñ©V\"Tzò\á\Î/\ÈjG_¿¯\r÷®°bvI¡8¯«¨ªf+\ß\ãË•j?Ù¬VıX±rjªâ½‡\ï\Ùe@²K\0„ŒñSnú5ÁÆ\rO¾1i5“4¢\Ã\àÍ\rˆE£p\ç\å!\á\äa.üßò‹²›\Ô\âšD%l\'D‰¥&`¤;†\0A4|ò˜¹òòº\Íó·µ\àµZ\'^]fP„~8œ.””•ó\íŠ\n@€07’n!¿+W­‚\Ç\í\Â[÷İ±K\ïı “o¼U©iS\'!–´\"$1\Ú\Ú;\Ø\Å\Ñ\ÚØ€¼¥¸\\2Å“S‘\å´J÷°HdAj\á€?+œ¸òÕ‡ò\æ{\Û¬¶¶\ã®5yDclg|>””WÀ\íñ€TªÂ‚T;‹\ïKd\äxK—.ƒ\Ãn\Ã\Û÷\ß\Ù\ïAÒ¯B\à8ñú\ÛS§NB<iM+9\èİ·wø‹\ÅXµª\ß\\Ëª\İaG4Á\àBR‹A\ã§ó\é­\è\í$\ï\éù$}`³¡v\é\\<\Ø<\Z\Ú9\ç…$$©n•ÕƒXªx<nx\\\n‹ ]£\ì˜E‹\Ãn·\á~’~Ç¯»•\'ü\Ô)“‡%#8È‹\å(«:\Ê\â‰8®;xf\\+®Á\ĞI{+\ÉEuYe\êK\Í\îp¡pÀÄ†E³±i\Óz\\·¶\Ía*3\äD8b\éA’„U­‚önejv°p\Ñb>\çú¯$\é—\0Y¸z\r\ä\ÉD’%G&µŠ^~\"™D[»OQ5::\àkoƒ\'?/pZ-øıø6Ç ±{pq\ÑÈ­\Z\îh\íqy‹u·3iI\Ñ(j—\Ïc\\¹¢­\ÑÜ<6\Ä\n‹\ÙkGÁ\ÃBo~Fj?©ğı\ÂEı\Z$ı $9~t\İ-\n8º4»;D\"QV¯š\ê\ë\àòxP\ï\Â\Ã#šP3|4“\Ó5\n\nk.\"E¸š)ˆ™®yqıÚ•¸em)6û£\Ø$IRV9\0v»y7Ü¨Z¤\Ù-I,X°ˆ\Õ%I¿\È\ÂÕ«q\Ò\r·g\r\Ù\Ô\Z\ê¶rm„h8‚I\ån\ÜYÓŒ¡“÷EñÀ!\Î}R¹hƒªŠ˜K\ÍE[ÀyY¥\ê¬Q\é\Ó\r¿\Æ\ã›K0«.¢H\Éd\åªø´\âÂ‚”(»|=†Ã’\Äü\ïöKô€È’c\Ú\ÔÉˆ&-i½Uò\Ëmóuğ1~_;«V‰xg\r³\áôª(F\ì93\ë8«j±«\\”±·3e<’J%&»zø\ê\ï>\Ç{[mx~m’\ã>…E\ÈóÀ\étÂ›—^‰\ë’G‹\È,ó¾_\Ğ\ï@\Ò/\0\Â\à¸ö¶#ö˜:1X@\\ª\ÎZ(A€‰ˆa\æZ\å»]¸m„ÓªKQ3u?\rô¤Q9S*<¥]¤\â?CO®Ÿ\îR¥Tˆ\Û\å\á’==iDb\\7ÿ+,\ŞÜˆ[\×\Ã1W‹xrû’1\ŞY#ZJ2eP°±¿x·ú<@\æ¯\\Sn¼mˆqc\ÇÀ[PˆP$Ò¹ZD«öv\Ä\ã	4\ÕoE¹ÇG4¡ºzFN?ñØ¶ñPQ&ñ´b‘0×\â}·A£¤-›\Ó\Åü.\â[m«\ÌF›Ã\Õ\ßı›7o\Äe+K\á\ÇP6` \ÓP(€\ØUs»œ\èhoÇ²\å+@ÿ\ïq’>\r¹\ËW\âô›\ï`iA\à(,*B \Ôõ\ä&\n;Q\Ù}-Íˆ;ğ\ì\ä\0\ÆL\Ü\Õc¦\"T(=m”­G™‡\é\Zƒ$‘\Ğ\0HÀÉ¦\ÙUif³»ø\Ú\Û\n\é\î\í\Ì/\Â\æeó±bñœ» Ÿƒ“E¥ei(\ækx=n´¶¶2H\\NgŸ7\Üû@Húxöüg\Î<,X¹š\ßOwÀO[·A¿-Mø\Íÿ\ãªÚ™R\"øM\ÙL\ÚÎ!5«§ªNo\ï½-\Îwy‹\Ğ\\ßˆ77\å\ãÎ·\ŞFiy9\Ós\È`Ï¦\Òd‘7MM\ÍjDr<t\Ïi8b\ï}.òó\0!’\á7‹—\âı/ÿ‡¾™\ÃÁ>·\Ë\r_‡b8Š‹‹\Ñe57|~?‚\0\ê·lÁµ§Ÿ†ƒ\ÆL…\ÃnÅˆ\ä\Ø\Â-Y]£«ƒˆÕ—kh…“n¬¶MB8\n¼7ÿ+¼ü\ÑGP]ü|/»~»j¢o>\ê5\ä\ç\ç!‰Àa³\á˜ı÷Á‘û\î}&\Ï\èü\0\0IDAT\Ïy\ÒcN„@ññ\ì\ïğY_\á¿s\çóû(/+E\éÿ—w-\ĞmV÷ı\'Y\ï‡%Y’-\Çv\âG;XJhH\ÙÆ–RXatmƒ\ÒÁX—®‡3\Ö\îtte\è\ÎÊ¶\Â\ÎzzX·•ucÀ–ôŒöÀZ m\ÃMYJ2;q\'~É¶$Ë¶\Şo\Ù;¿+}ŠlKÖ§G\â´\Üst\äD÷~÷~÷\Ş\ßı¿ÿ\×n”\nœ9\'<q	{‹¬/§\\`A¿7\\õ<ºÿB%\ìZ@*™\Æf\ã,ô\ÑQ9Z³N*\Z‚f\r·øº;¸ˆ˜W´cr±S¨v;;l\Ğ\ê\Ô\Øÿ\ä\ß\â\'##p´º`³Y¡”qù)­f#¼¾YªƒûûûEÈ²~óó¹\Ã\èú÷^…›®İ‹ö\ì¾,Ár\Ù\0„©v\È:½ô\Æ>+&\Ñ~\í®6´´´ ™\É \Z‰btô¼p\Ó&8œ\'‘\\`“œ\ÂÁY\Ï\ÚmV|\ë‘?_\Ödzz\ápN³®\Ô)¨2µ«k\áh–²²ˆœ±^\ê:10©\ìG,\İ£A‹ö\rÖ‚«I(Ã‡z‰l\Î6ŒÔ¾\ÒØ©şeL»\Ç\ç+€¤o\Ë˜¨”M˜›Ÿ\ÃôŒGD-²\ìİ¹\r¿²w`\Å.—D\ë\n	\Ï}\ïuœŸ“¤\Õj\áp\Ø\Ñ\Õ\Ñ!6…nFø\Ñ^1>6ŠX4&À\Ñ\êt\"‰Š\ß\äR÷\ä$4KÀK=Œ\æ^¹Á`>_P\Ê\Ú\Í8cƒP,U¯ªM\çm!j}¯X9®²\ÎZÊµ•^Rcºi3\æ\Ót+Z[-°Z—{\r§\ÓYœ:\ã\Æ=_yB\ØF:7vÉ¢\"\ìW£V	\Ìx½9\í–^\Ş^AQ\è\ë¥\×h\Ä|ONMÁ\ïŸC2™S\\l\ÙØ‰\ßxıºƒ\å’DbŸ^>ò^ûñ11Ô±‡N»]¨i%`ğw\ÑQa³\è‡\İÖ‚@”F>y\à\à3<^‚sóø\Ò]ûqEo\\\íV(•«\ïI\Ïd\áõ‰&…Kw‡!KtJ\È\ï+›Jˆ«\ÖK—ˆ­Z\Å@jx›6Á—\Ê€™\Ì:´:›¡V/·w\Ä\ã)¸\İó\"9ER—Á]<*¢\ÛZ[eCX§\ÑÀlĞ—	B–ja‚ena~¿³ş¹‚¡÷—w¿·ü\ÂûÖ…\r»d\0ù\îÑ·ñÊ›?ÂC‡kµX\àrµÁa·]»\0F2¹l\ãƒƒF@²](]\ÓWG–[±p8‚ñ\Ñóøú\ç?r§ºV«Bgg‹p\Ù.U\Ènù¼Ad²‹{`7.Â‡>=\'kc„¼\ãhn\Û$«n½•H=DÈ­Œl*\Ñ%3\æÔ›0—\Ì	\Û&“v‡:\íjc ƒ\×D“J‰«¯\î‡\ÕfÆ¼{ş\â1l\ê\é\Ù\\\Ù6\"½›Q«ƒA¯E$Á±\ã\'„R¢$\Å\ïO0\ÑÕ6#ÿ\Ü</Án<·½ÿ:!\àß¸\ç\Ò\äíº¨\0¡Jö\Å\×€^=$,³\Õ\Õ\Ù!@¡\×\å‰V\íh2)\\Ó‹Á16:Št2),\ä&“	¡h\Éq\äkm°P(÷\äü\í»q\ßG?„@ Š¡¡q\áV\ÒÔ¤@›\Ë\n³©¼f&ŒÁ?A:•¤^«„S„1>\âe»¦K¼\Şb¿$\Ú,²t\åØ¹,TÃŒ°ÒÀ¢<WTMJ\ØZL°ZôP–pi_\\\\\Â\ÌL\0‘HB°HW_3\0³\Ù \Zdşò\Ù\çğô‹ÿ‰Î®hn.£¿rrHE€J a;\æ\ë2\ê4P5©O$X˜¯KbÁŒznÿÀ>ü\Æûé¢ª²Pı\ß|\åUœsO‰9\"\Õ\æjÃ†¶6±É¥BŠM¬/p,^\ÑJ¾rQ|^B\0|/“K`\ÄbI\r!‘\È%C04hk³@£)\ï¦	\'P’ù6¹ETÂ¦M¢9\ë‡!5³Œ\r\ãõ\ÎLı£·´\ÔK *¶§R@—o_„\Ñ%BKfD”-ˆe/¸\Ì\è´\Ìbb„¥¹¼oU(‡\×‡•\ÍfÄ®«¶B£QO…Tò‚‡B\ÇG>†{Z\Û\\\ÇW\\òA\'$¹9VÁ ’J\ä(=\ÛIòŠ6-\É+·î»®áš°†\ä­Á“ø\æ+\ßÃ·\ßx³0TÍº\\.!WH…\Z\'\á•OŒPjvs\à8/<k%\ÊA;G</ÀU³\"\Ñh£\ç\Î\ãy\ZWn\îC:tœÜ±Q¦§\æ³\Ùp8šK\Ê&R¥T*ƒh4)N\×Xl¹K‹^«€®)#bP†§ OˆMt±J\Zj\ĞfŒe5¸P˜-„B©€Ù¬’‡@)™K\Ze®¹\Ù0\É4\ØnK_ºûr½\é|8€T÷ğ‰A\ã\ß\Ó\×+l#\Õ*¬F“`m\å‚D\0E¥\ÔG«¹“3+X0üsÖ\é‰(\Ü\ïİ¹½ša•­[@H-õ¾vğ%\Ìr|\"e‰…¢\\!núx*%>E™=K\Ì=1!62ÁÁg„c1$Vä®ª\æ\íOœÀ£÷\îÇ§o¿5c\Î{ùò‹\n\ÇpzØD<·Ù©ÿw:Í°X*\ßOHV$K!\ZK O/£.\Òø¸!\È\ŞkUYh‘‚Ih²a(³\åÙ³‡	@P \Î,5!£\Ô\"«ĞŠÇ³jd—V+H	“I£±r†\ÇP89>‹Ù¬Ã®][`0\é\Õ\à<­T£\ßû\å§pğû?\Ä\Î+¯¬f\nu9\ÇV“Q$‡ ûôCC\Ğhµ\è\è\\;´@¬O^ ×©Õ…Œt5’X°h\Ş&f·Zğû·}õR•š\0Bjñ\Ì}¯ı_ñ\ÒÅªYI®(œ¸\é\â©\äªüS\åfvzÊd\"\'s¡|\ZšV\"\ßhr|Û»:ğ­\ÇI©\ÕùSˆ \å ;16\ê\Å\ä\äl¡.\Åj@K£\ëVo\Är\ã!`\â‰4¨ıá¦“6^=\ã/Õ–§<\rd´\Z•ø\èô\Ü4ò’h“\núfCH%sÀ\Ğ\ë\Ô\è\îiG×¦6q€\Ñ\ê]*¹\ë\î\Şÿ{\Æ\Ø\Ô]{JR‚„\Öv~sƒÿ\äøq\Ù ‘\æƒ\Ä7¿¥BÀ­T\ßüó{ñ[7\İXU©\n ÿş\ê!<õ\ÂLûfª\Ùv—\ÔF­,”/\â\ÉT\Ù8ğR‹Np,f²Ø¹c{\Ñ’\é\åYk\Ùhs~?f¦§\áıöˆ\æ¤\"L\È epù¡\Òi‘\È=\é‡×³\0R©go±36¢¶\Ë<©	£Ÿ\Î0MhT%óT\æ‡z	q%Á¿/¤\Í\æI\É\ÍÎJ•û–l‡\\ \ÏW\"™A8C(’@&Ÿj•,XOo;\\\í96XbA×š\ç¶[nCû†\r°;r©‚j-Å”„ !%aöI9”¤¸OÊ¸z­F°`Å…Ú¯²`ş9±Û\Üÿñ\ÛqÛ¾\ëd¹\"@\ÈFÿòòwEh*\å\n\Ú+$\Õ\ìÊh¿ ¬ÀX\ïjÊ”{Rğ™\Û\ÄF	E\ãH\å3\nVóœRuñ8FÎ\ÅÁ/=Œk¯\ØQ¨\"…\á¥ü›,7p:Áô\Ì<¦\İşe€\'67”\Ñ\ÄP\Ô\Ú\â.\ê}—jÛ“’…C	!3 R17\ë±uK\'\ìN«  ¤|÷J\å\à\á7q\ïObó–-\Â\èWo!H(¸S³\Æ24<,(Jµ a[R}‚„6•bw‰£}…ò\n©\î]¼pÇ¯W\ê\Ë„V\î\Ïı\İ\×ğÖ‰Á‚\ËG±j¶xbhÍ–(†\\·\âö\î<8v\Ë8)G©\Änõ,\Æ\éS\'q\ÏM7\â\ÑOıN\É\Ç0Š\'4Á\"E¤\0ò\àñ\Ì#Ì¹CH…lÁb2\ê \Ókªb\Ã\êyJm9ÿB‰&(r^R¡g-å½½`2\ë…\Ë±R½¾Vw>ò8¾ÿö1lß¹³\ÒPdÿ\Î\Í\Ül44U\'‡‡‘ª$\ìT\Z\Õ\Ği´\àIƒ‘T\Æ3/(¯\\s\Å<ù\é{Ëº¶\0BJ1<6C\Ç\Şµ§Ï•T\Í¿53R\è^™\ßVö\Ì\äÕ¹\çÎ\Å\Ï\í\ÜµVªrkY¥>g¦\ÜpYšñúS_^»*3³\Ó\r‚±Ü¼\n`q)/¬RÁ\ç]X>jHN\r½\'˜Z8ù­¥5ª4^¹¿\'órN<–D<.¨®‹AA{G{»]­jAp\ÔR¶\ßıI°%m ,TfPk\ĞåŒ‰\'†N¢wó\æeW3\Ô\Ò\×E«&X4«\\õ\ÙÏ´\×¯Ç‹ş\Şnô´·c{o7~ó†}Ê¢x\ç\Ì\È\Òş\áŸqø\ØqA)t:-y!¹Ô€H¦\é”ÈˆŞ¨LU\ìÔ¤{z V«r›³Áeaa^ôq\æùoT$«\Å]“\îÏ „@;\n=gıA,\ÌGF„LQªPvP©›xø¡†I¥i‚)OM\ÆU‘µÿÎ»½\ĞC€.4”²Y~\Èş0\È*›÷I£\Õ|Q\\\×Pª_R6£Q«Õˆ‡ö–fa”X¨zÖŒ‡\è\Ö;\îAGW\'l¶Æª¯)§Å˜M\ÆfÁ‰\ã\'\Ğ\İ\Û®~®pP( 2´PVi*‘aŸ¡\Â\Ò\Ş\'pú6u	Ê¢\èúµ;–,V:;;…`L~í­£Gñ‹\×^[XsN*…\åX²¼f£\Şı\Ì\rLa\Ú\Ñæ‚µ\n\ë¬\Ü~©•93<Œzğó¸y\ï¹\ÍVÕ£öH\rIB5óiÅ’…b\"\â[2@\Ö\ÜI\r\éyk0\é`µš\Ä\Çh\Ô\å\0\Í!R	 \0VµX9Œg¾ó\ßxğ«\Ï`\ëÀ€H\æ\Ğ\È…\Å2=9	‡\Ã	k\Ñõp\ì‡ó¢SÓ¢Z¦ı:|\äö\î\ÙSÀ€{ÊŠ}ø§K\Å\Öm\æÈbû@?š\Í\æœ\í\"™jµX\ëe	’Y\ß,\Ú;;a¾WŒ\à\æ÷½Oö\â\ŞsÁ?™\Ì\ÙE˜)\ß4ÀñÿuŸ%,.\å©C	§KR\ÊE¤B¤>ü›˜Z\Ó$Rƒ\ÒøG9‚…€\à(c¡jdŸ*m\Ä[şø!¼szıÛ¶UªZ\Õ\ïñDRd¶dVK‡\Ó\Ñp\êTn0¤\â‘H£c\ãØ³ûªeUIIú\Âc\Ë\ÔM<u†Ïˆ‰nuU\çFPÕ¬”©\Ì‚¤»§gÍ¤eµôå†®I·¿ş\ÕZš_vmH\É$\Ãg=¬“\Ü\ë½ın0‘ö†\r\ä6©X¬Õ±L\Ú\×\Ú\Öz\ÉÀQ<0š\0x\Èl\î[%ó\0\Â	\'rŞ´ÁPS“Ø¶£qšŠŠ3UTº\ë` €¾\Í}P7ğ.r:.NŒ\á\Çÿø÷\ØX…»v5cÿY­;\æñ\âšOŞ‡\İ\İU9(Všù`~¶œ\ÎKP<®SCƒ\è\È;^RI@obIM,\0M$8$3y\ÖSCC\rŸŒJ“%ıNc\ÕüB\0¡ÀzûV£Z\îsVÖ“\Ş\ë+Ÿ½»~_­yW¶û\ë\à‰gÿ\r\Ûv\ì¨[³$M ³\ËLML\Âb³¡\Õé•¢Ñ“/š\Å\ïEªl`|ŠV\Åu÷ÿ\ÙR)5\í\Ù3g¯\Ûhu\Üd\ì8½o\ÃÁ@É¸¹\ÏYYozbØ½\ë¢\Ë!µ\ïrmw\Ë\áÄ¹QlÙºµ!C¤‰`\ìü¨\0‡Áh¸(2§œ2‚\îF=}}«ª“Š(ö~æ’&oº‰û¼¾š\Ò\än­:\"x*W\æ\Ñ\×\08ûóû|P/ef\äz\çYnû®\Ş	“\Å\Òùƒ”œ\r¼@Tn\æF¹ã¬¦\ÄQPö)\ç¶_ ’{F£yN¹/ n˜•®%ˆF‹F°uk¿\Ü\æe\ëI\î\ï¯=õW\Ø\Ù\ÛS÷ó\Ş\r<?Š\ë?óG5¹·—bsÏŒˆ+\Æ\Ü5¼«}=Šd[\Ëm¦,@8\à“ƒƒh¶4¯›U|±\rY-’¼®õ[p\éşş\Å\ßı>õ\á_]uù©\ëóñ}óÜ‹\r\á&&\'&„ŸÙ’…\ÏP­Ç¤Œ!\Z‰¬\é6³&@ÈŸ…C¡u\Ófq\Òx%³”œª@†x¶Õ©~öOOcW_¾ñ\Ğ\ë±.?u}~ğş?Á÷tI>½š—ñz< P\ÌûGXÖ“z°j¯\Ì\Ík€5\"Iø—’\Í\"kG;\"›…Fœ\â¸\r\Z\Äh¨’\Ü?ªY ©.\åX8„³\Ï?[Ków]›·\Ş)î”¯Ç½kxú\Ô)a_\ã\Z2&‡kh2\å?y«½q\à!,g\ä\î\íÿÕ”5S\æ\0\0\0\0IEND®B`‚'),(2,'Operario','Operario','Operario',0,'a33d0b9ee2738fb02ff3fbfa1ab8d3df',2,'');
/*!40000 ALTER TABLE `sisusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_actividad`
--

DROP TABLE IF EXISTS `tbl_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_actividad` (
  `actividadid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `descripciongeneral` text CHARACTER SET latin1,
  PRIMARY KEY (`actividadid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_actividad`
--

LOCK TABLES `tbl_actividad` WRITE;
/*!40000 ALTER TABLE `tbl_actividad` DISABLE KEYS */;
INSERT INTO `tbl_actividad` VALUES (1,'Comercial','venta '),(2,'Industrial','fabrico cosas'),(4,'actividad test','activ test editado'),(7,'actividad caso de prueba','actividad para testear abm');
/*!40000 ALTER TABLE `tbl_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_denuncias`
--

DROP TABLE IF EXISTS `tbl_denuncias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_denuncias` (
  `denunciaid` int(11) NOT NULL AUTO_INCREMENT,
  `denunciasfecha` date DEFAULT NULL,
  `denunciariesgo` varchar(255) DEFAULT NULL,
  `denunciaprograma` varchar(255) DEFAULT NULL,
  `denunciafechaverif` date DEFAULT NULL,
  `denunciainclucion` varchar(255) DEFAULT NULL,
  `duncianroobra` varchar(255) DEFAULT NULL,
  `denuncianroacta` varchar(255) DEFAULT NULL,
  `denunciamotivos` varchar(255) DEFAULT NULL,
  `estableid` int(11) DEFAULT NULL,
  `denunciaestado` varchar(4) NOT NULL,
  PRIMARY KEY (`denunciaid`),
  KEY `estableid` (`estableid`),
  CONSTRAINT `tbl_denuncias_ibfk_1` FOREIGN KEY (`estableid`) REFERENCES `tbl_establecimiento` (`estableid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_denuncias`
--

LOCK TABLES `tbl_denuncias` WRITE;
/*!40000 ALTER TABLE `tbl_denuncias` DISABLE KEYS */;
INSERT INTO `tbl_denuncias` VALUES (1,'2018-01-16','aa','aa','2018-02-01','aa','aa','aa','aa',11,'AC'),(2,'2018-04-01','bb','bb','2018-04-11','bb','bb','bb','bb',11,'AC');
/*!40000 ALTER TABLE `tbl_denuncias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detaactiv`
--

DROP TABLE IF EXISTS `tbl_detaactiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_detaactiv` (
  `detaactivid` int(11) NOT NULL AUTO_INCREMENT,
  `empleaid` int(11) DEFAULT NULL,
  `actividadid` int(11) DEFAULT NULL,
  `detaactivrubro` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `detaactivconvenio` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `detaactivestado` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`detaactivid`),
  KEY `empleaid` (`empleaid`),
  KEY `actividadid` (`actividadid`),
  CONSTRAINT `tbl_detaactiv_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_detaactiv_ibfk_2` FOREIGN KEY (`actividadid`) REFERENCES `tbl_actividad` (`actividadid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detaactiv`
--

LOCK TABLES `tbl_detaactiv` WRITE;
/*!40000 ALTER TABLE `tbl_detaactiv` DISABLE KEYS */;
INSERT INTO `tbl_detaactiv` VALUES (6,5,1,'textil','ley123/98','AC'),(7,5,2,'metalurgia','na','AC'),(8,23,2,'Minero','6543','AC'),(12,23,7,'Metalifero','Ley12.42/06','AC'),(21,23,2,'rubro 1405','ley14.005/13','AC'),(22,23,2,'zxcvxv','zxcvzxv','AC'),(29,23,4,'rubro test','convenio test','AC'),(30,23,1,'rubro comercial','convenio comercial','AC'),(31,11,1,'dfgdfgdfg','dfggfhfh','AC'),(33,23,4,'rubro caso de prueba','convenio caso de prueba','AC');
/*!40000 ALTER TABLE `tbl_detaactiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleadores`
--

DROP TABLE IF EXISTS `tbl_empleadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_empleadores` (
  `empleaid` int(11) NOT NULL AUTO_INCREMENT,
  `empleatipo` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `empleacui` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `empleafecha` datetime DEFAULT NULL,
  `empleainscrip` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `emplearazsoc` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `empleaexp` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `empleadomicilior` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `empleadomiciliolegal` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `empleadepid` int(11) NOT NULL DEFAULT '1',
  `emplealocid` int(11) NOT NULL,
  `empleaprovid` int(11) NOT NULL DEFAULT '1',
  `empleasliquiid` int(11) DEFAULT NULL,
  `empleapmasc` decimal(10,0) DEFAULT NULL,
  `empleapfem` decimal(10,0) DEFAULT NULL,
  `ampleafechaalta` date DEFAULT NULL,
  `empleaestado` varchar(4) NOT NULL,
  PRIMARY KEY (`empleaid`),
  KEY `empleasliquiid` (`empleasliquiid`),
  CONSTRAINT `tbl_empleadores_ibfk_1` FOREIGN KEY (`empleasliquiid`) REFERENCES `tbl_sisliqui` (`sisliquiid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleadores`
--

LOCK TABLES `tbl_empleadores` WRITE;
/*!40000 ALTER TABLE `tbl_empleadores` DISABLE KEYS */;
INSERT INTO `tbl_empleadores` VALUES (1,'L','202133339','2018-04-20 11:00:30','51616516','razon social','mm4566','casa','domicilio llegal',0,0,0,1,2,3,'2018-03-26','AC'),(5,'C','12-33345465-7','2018-04-26 00:00:00','123','qwerwer','exp123','wqerqwer','qwerqwer',0,0,0,2,0,0,'2018-04-26','AN'),(6,'L','04-45677832-2','2018-04-27 00:00:00','1234','Industrias TPM S.A.','2645778','libertador 1559 este','libertador 15559 este ',0,0,0,2,3,0,'2018-04-27','AC'),(7,'C','03-75857999-9','2018-04-27 00:00:00','444','Industrias Selso S.A.','73456','calle barrio','calle barrio 2',0,0,0,2,2,0,'2018-04-27','AC'),(11,'L','02-43876747-5','2018-04-27 00:00:00','444','industrias srl','237486','calle mi calle','jdsjhjkdfhb',0,0,0,1,1,0,'2018-04-27','AC'),(12,'C','12-34567890-0','2018-04-26 00:00:00','123','razon social','exp123','wqerqwer','domicilio legal',0,0,0,2,0,0,'2018-04-26','AC'),(13,'C','20-23456789-7','2018-05-07 00:00:00','20180507','Razon Social','exp-20180507',NULL,'Domicilio Legal',0,0,0,3,12,4,'2018-05-07','AC'),(22,'L','11-11111111-1','2018-05-14 10:52:45','00001','raz social 1405','exp-00001',NULL,'dom legal 1405',0,0,0,3,8,2,'2018-05-14','AC'),(23,'L','46-57567567-5','2018-05-16 17:57:20','zxcvxcvz','Empleador 23','exp-e23','','zxcvxcv',0,0,0,4,6,4,'2018-05-16','AC');
/*!40000 ALTER TABLE `tbl_empleadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_establecimiento`
--

DROP TABLE IF EXISTS `tbl_establecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_establecimiento` (
  `estableid` int(11) NOT NULL AUTO_INCREMENT,
  `establecalle` varchar(100) DEFAULT NULL,
  `establealtura` varchar(20) DEFAULT NULL,
  `establepiso` varchar(20) DEFAULT NULL,
  `establedpto` varchar(20) DEFAULT NULL,
  `establelatitud` varchar(20) DEFAULT NULL,
  `establelongitud` varchar(20) DEFAULT NULL,
  `provid` int(11) DEFAULT NULL,
  `dptoid` int(11) DEFAULT NULL,
  `empleaid` int(11) DEFAULT NULL,
  `estableestado` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`estableid`),
  KEY `tbl_establecimiento_ibfk_1` (`empleaid`),
  CONSTRAINT `tbl_establecimiento_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_establecimiento`
--

LOCK TABLES `tbl_establecimiento` WRITE;
/*!40000 ALTER TABLE `tbl_establecimiento` DISABLE KEYS */;
INSERT INTO `tbl_establecimiento` VALUES (1,'calle1405','1405','pb','D','lat1405','long1405',19,1734,23,'AC'),(2,'asdfsfd','67','57','567','123','546',8,947,23,'AC'),(3,'zxcvzxc','zxcvxc','1','C','123','123',7,486,23,'AN'),(7,'calle aa','altura aa','piso aa','dpto aa','lat aa','long aa',14,1456,23,'AC'),(8,'ccc','ccc','ccc','ccc','ccc','ccc',4,335,11,'AN'),(10,'erterytry','ertyryrt','','','erty','erty',4,359,11,'AC'),(11,'calle 13','189','2','A','2344','23424',16,1554,23,'AC');
/*!40000 ALTER TABLE `tbl_establecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estado` (
  `estadoid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`estadoid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado`
--

LOCK TABLES `tbl_estado` WRITE;
/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
INSERT INTO `tbl_estado` VALUES (1,'ACTIVO','AC'),(2,'TRANSITO','TR'),(3,'REPARACION','RE'),(4,'COMODATO','CO'),(5,'CURSO','C'),(6,'INACTIVO','IN'),(7,'SOLICITADO','S'),(8,'TAREA REALIZADA','RE'),(9,'TERMINADO PARCIAL','TE'),(10,'TERMINADO','T'),(11,'ENTREGADO','E'),(12,'PEDIDO','P'),(13,'ASIGNADO','As'),(14,'ANULADO','AN');
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inspecciones`
--

DROP TABLE IF EXISTS `tbl_inspecciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_inspecciones` (
  `inspeccionid` int(11) NOT NULL,
  `inspeccionfechaasigna` varchar(255) DEFAULT NULL,
  `inspeccionfecharecp` varchar(255) DEFAULT NULL,
  `inspectorid` int(11) DEFAULT NULL,
  `inspecciondescrip` varchar(255) DEFAULT NULL,
  `estableid` int(11) DEFAULT NULL,
  `inspeestado` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`inspeccionid`),
  KEY `inspectorid` (`inspectorid`),
  KEY `estableid` (`estableid`),
  CONSTRAINT `tbl_inspecciones_ibfk_1` FOREIGN KEY (`inspectorid`) REFERENCES `tbl_inspectores` (`inspectorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_inspecciones_ibfk_2` FOREIGN KEY (`estableid`) REFERENCES `tbl_establecimiento` (`estableid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inspecciones`
--

LOCK TABLES `tbl_inspecciones` WRITE;
/*!40000 ALTER TABLE `tbl_inspecciones` DISABLE KEYS */;
INSERT INTO `tbl_inspecciones` VALUES (1,'2018-05-30','2018-05-20',1,'inspeccion descript',11,'AC'),(2,'2018-06-01','2018-06-12',2,'inspec desc 02',11,'AC');
/*!40000 ALTER TABLE `tbl_inspecciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inspectores`
--

DROP TABLE IF EXISTS `tbl_inspectores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_inspectores` (
  `inspectorid` int(11) NOT NULL AUTO_INCREMENT,
  `inspectornombre` varchar(255) DEFAULT NULL,
  `inspectormail` varchar(255) DEFAULT NULL,
  `inspectorcel` varchar(255) DEFAULT NULL,
  `inspectorsector` varchar(255) DEFAULT NULL,
  `inspectorestado` varchar(4) NOT NULL,
  PRIMARY KEY (`inspectorid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inspectores`
--

LOCK TABLES `tbl_inspectores` WRITE;
/*!40000 ALTER TABLE `tbl_inspectores` DISABLE KEYS */;
INSERT INTO `tbl_inspectores` VALUES (1,'Juan Perez','jperez@gmail.com','2644235040','sector 1','AC'),(2,'Jose Sanchez','pepesanchez@yahoo.com','2644262689','sector 1','AC');
/*!40000 ALTER TABLE `tbl_inspectores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_libro`
--

DROP TABLE IF EXISTS `tbl_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_libro` (
  `libroid` int(11) NOT NULL AUTO_INCREMENT,
  `librofechaentrega` datetime DEFAULT NULL,
  `librotomo` int(11) DEFAULT NULL,
  `empleaid` int(11) DEFAULT NULL,
  `libroestado` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`libroid`),
  KEY `empleaid` (`empleaid`),
  CONSTRAINT `tbl_libro_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_libro`
--

LOCK TABLES `tbl_libro` WRITE;
/*!40000 ALTER TABLE `tbl_libro` DISABLE KEYS */;
INSERT INTO `tbl_libro` VALUES (1,'0000-00-00 00:00:00',0,6,'AC'),(2,'2018-05-07 00:00:00',20180507,13,'AC'),(3,'2018-05-08 00:00:00',20170507,13,'AC'),(5,'2018-04-26 00:00:00',1,5,'AC'),(6,'2018-05-22 00:00:00',0,6,'AC'),(7,'2018-04-26 14:15:39',0,23,'AC'),(8,'2018-05-01 00:16:39',2,23,'AC'),(9,'2018-05-03 10:39:54',3,23,'AC'),(10,'2018-05-08 15:36:10',4,23,'AC'),(11,'2018-05-17 23:36:47',5,23,'AC'),(13,'2018-05-17 01:09:01',7,23,'AC');
/*!40000 ALTER TABLE `tbl_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_notas`
--

DROP TABLE IF EXISTS `tbl_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_notas` (
  `notid` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `res` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `empleaid` int(11) DEFAULT NULL,
  `notaestado` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`notid`),
  KEY `empleaid` (`empleaid`),
  CONSTRAINT `tbl_notas_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notas`
--

LOCK TABLES `tbl_notas` WRITE;
/*!40000 ALTER TABLE `tbl_notas` DISABLE KEYS */;
INSERT INTO `tbl_notas` VALUES (9,'2018-05-01','resolucion-20180508-02','23_9_2018-05-22-20-50-00.jpg',23,'AC'),(10,'2018-05-01','programa descansos','23_10_2018-05-21-21-24-47.jpg',23,'AC'),(11,'2018-05-21','res20180515-01','23_11_2018-05-21-21-25-04.jpg',23,'AC'),(12,'2018-05-14','res20180515-02','23_12_2018-05-21-23-57-51.jpg',23,'AC');
/*!40000 ALTER TABLE `tbl_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sisliqui`
--

DROP TABLE IF EXISTS `tbl_sisliqui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sisliqui` (
  `sisliquiid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`sisliquiid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sisliqui`
--

LOCK TABLES `tbl_sisliqui` WRITE;
/*!40000 ALTER TABLE `tbl_sisliqui` DISABLE KEYS */;
INSERT INTO `tbl_sisliqui` VALUES (1,'manual'),(2,'electronico'),(3,'otra'),(4,'ccxvxc');
/*!40000 ALTER TABLE `tbl_sisliqui` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-07 16:49:57
