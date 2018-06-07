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
INSERT INTO `confzone` VALUES (10,'Caucete'),(11,'Zonda'),(12,'Rivadavia'),(13,'Sarmiento'),(14,'Los Berros'),(15,'El Encón');
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
INSERT INTO `localidades` VALUES (1,1,'25 de Mayo'),(2,1,'3 de febrero'),(3,1,'A. Alsina'),(4,1,'A. Gonzáles Cháves'),(5,1,'Aguas Verdes'),(6,1,'Alberti'),(7,1,'Arrecifes'),(8,1,'Ayacucho'),(9,1,'Azul'),(10,1,'Bahía Blanca'),(11,1,'Balcarce'),(12,1,'Baradero'),(13,1,'Benito Juárez'),(14,1,'Berisso'),(15,1,'Bolívar'),(16,1,'Bragado'),(17,1,'Brandsen'),(18,1,'Campana'),(19,1,'Cañuelas'),(20,1,'Capilla del Señor'),(21,1,'Capitán Sarmiento'),(22,1,'Carapachay'),(23,1,'Carhue'),(24,1,'Cariló'),(25,1,'Carlos Casares'),(26,1,'Carlos Tejedor'),(27,1,'Carmen de Areco'),(28,1,'Carmen de Patagones'),(29,1,'Castelli'),(30,1,'Chacabuco'),(31,1,'Chascomús'),(32,1,'Chivilcoy'),(33,1,'Colón'),(34,1,'Coronel Dorrego'),(35,1,'Coronel Pringles'),(36,1,'Coronel Rosales'),(37,1,'Coronel Suarez'),(38,1,'Costa Azul'),(39,1,'Costa Chica'),(40,1,'Costa del Este'),(41,1,'Costa Esmeralda'),(42,1,'Daireaux'),(43,1,'Darregueira'),(44,1,'Del Viso'),(45,1,'Dolores'),(46,1,'Don Torcuato'),(47,1,'Ensenada'),(48,1,'Escobar'),(49,1,'Exaltación de la Cruz'),(50,1,'Florentino Ameghino'),(51,1,'Garín'),(52,1,'Gral. Alvarado'),(53,1,'Gral. Alvear'),(54,1,'Gral. Arenales'),(55,1,'Gral. Belgrano'),(56,1,'Gral. Guido'),(57,1,'Gral. Lamadrid'),(58,1,'Gral. Las Heras'),(59,1,'Gral. Lavalle'),(60,1,'Gral. Madariaga'),(61,1,'Gral. Pacheco'),(62,1,'Gral. Paz'),(63,1,'Gral. Pinto'),(64,1,'Gral. Pueyrredón'),(65,1,'Gral. Rodríguez'),(66,1,'Gral. Viamonte'),(67,1,'Gral. Villegas'),(68,1,'Guaminí'),(69,1,'Guernica'),(70,1,'Hipólito Yrigoyen'),(71,1,'Ing. Maschwitz'),(72,1,'Junín'),(73,1,'La Plata'),(74,1,'Laprida'),(75,1,'Las Flores'),(76,1,'Las Toninas'),(77,1,'Leandro N. Alem'),(78,1,'Lincoln'),(79,1,'Loberia'),(80,1,'Lobos'),(81,1,'Los Cardales'),(82,1,'Los Toldos'),(83,1,'Lucila del Mar'),(84,1,'Luján'),(85,1,'Magdalena'),(86,1,'Maipú'),(87,1,'Mar Chiquita'),(88,1,'Mar de Ajó'),(89,1,'Mar de las Pampas'),(90,1,'Mar del Plata'),(91,1,'Mar del Tuyú'),(92,1,'Marcos Paz'),(93,1,'Mercedes'),(94,1,'Miramar'),(95,1,'Monte'),(96,1,'Monte Hermoso'),(97,1,'Munro'),(98,1,'Navarro'),(99,1,'Necochea'),(100,1,'Olavarría'),(101,1,'Partido de la Costa'),(102,1,'Pehuajó'),(103,1,'Pellegrini'),(104,1,'Pergamino'),(105,1,'Pigüé'),(106,1,'Pila'),(107,1,'Pilar'),(108,1,'Pinamar'),(109,1,'Pinar del Sol'),(110,1,'Polvorines'),(111,1,'Pte. Perón'),(112,1,'Puán'),(113,1,'Punta Indio'),(114,1,'Ramallo'),(115,1,'Rauch'),(116,1,'Rivadavia'),(117,1,'Rojas'),(118,1,'Roque Pérez'),(119,1,'Saavedra'),(120,1,'Saladillo'),(121,1,'Salliqueló'),(122,1,'Salto'),(123,1,'San Andrés de Giles'),(124,1,'San Antonio de Areco'),(125,1,'San Antonio de Padua'),(126,1,'San Bernardo'),(127,1,'San Cayetano'),(128,1,'San Clemente del Tuyú'),(129,1,'San Nicolás'),(130,1,'San Pedro'),(131,1,'San Vicente'),(132,1,'Santa Teresita'),(133,1,'Suipacha'),(134,1,'Tandil'),(135,1,'Tapalqué'),(136,1,'Tordillo'),(137,1,'Tornquist'),(138,1,'Trenque Lauquen'),(139,1,'Tres Lomas'),(140,1,'Villa Gesell'),(141,1,'Villarino'),(142,1,'Zárate'),(143,2,'11 de Septiembre'),(144,2,'20 de Junio'),(145,2,'25 de Mayo'),(146,2,'Acassuso'),(147,2,'Adrogué'),(148,2,'Aldo Bonzi'),(149,2,'Área Reserva Cinturón Ecológico'),(150,2,'Avellaneda'),(151,2,'Banfield'),(152,2,'Barrio Parque'),(153,2,'Barrio Santa Teresita'),(154,2,'Beccar'),(155,2,'Bella Vista'),(156,2,'Berazategui'),(157,2,'Bernal Este'),(158,2,'Bernal Oeste'),(159,2,'Billinghurst'),(160,2,'Boulogne'),(161,2,'Burzaco'),(162,2,'Carapachay'),(163,2,'Caseros'),(164,2,'Castelar'),(165,2,'Churruca'),(166,2,'Ciudad Evita'),(167,2,'Ciudad Madero'),(168,2,'Ciudadela'),(169,2,'Claypole'),(170,2,'Crucecita'),(171,2,'Dock Sud'),(172,2,'Don Bosco'),(173,2,'Don Orione'),(174,2,'El Jagüel'),(175,2,'El Libertador'),(176,2,'El Palomar'),(177,2,'El Tala'),(178,2,'El Trébol'),(179,2,'Ezeiza'),(180,2,'Ezpeleta'),(181,2,'Florencio Varela'),(182,2,'Florida'),(183,2,'Francisco Álvarez'),(184,2,'Gerli'),(185,2,'Glew'),(186,2,'González Catán'),(187,2,'Gral. Lamadrid'),(188,2,'Grand Bourg'),(189,2,'Gregorio de Laferrere'),(190,2,'Guillermo Enrique Hudson'),(191,2,'Haedo'),(192,2,'Hurlingham'),(193,2,'Ing. Sourdeaux'),(194,2,'Isidro Casanova'),(195,2,'Ituzaingó'),(196,2,'José C. Paz'),(197,2,'José Ingenieros'),(198,2,'José Marmol'),(199,2,'La Lucila'),(200,2,'La Reja'),(201,2,'La Tablada'),(202,2,'Lanús'),(203,2,'Llavallol'),(204,2,'Loma Hermosa'),(205,2,'Lomas de Zamora'),(206,2,'Lomas del Millón'),(207,2,'Lomas del Mirador'),(208,2,'Longchamps'),(209,2,'Los Polvorines'),(210,2,'Luis Guillón'),(211,2,'Malvinas Argentinas'),(212,2,'Martín Coronado'),(213,2,'Martínez'),(214,2,'Merlo'),(215,2,'Ministro Rivadavia'),(216,2,'Monte Chingolo'),(217,2,'Monte Grande'),(218,2,'Moreno'),(219,2,'Morón'),(220,2,'Muñiz'),(221,2,'Olivos'),(222,2,'Pablo Nogués'),(223,2,'Pablo Podestá'),(224,2,'Paso del Rey'),(225,2,'Pereyra'),(226,2,'Piñeiro'),(227,2,'Plátanos'),(228,2,'Pontevedra'),(229,2,'Quilmes'),(230,2,'Rafael Calzada'),(231,2,'Rafael Castillo'),(232,2,'Ramos Mejía'),(233,2,'Ranelagh'),(234,2,'Remedios de Escalada'),(235,2,'Sáenz Peña'),(236,2,'San Antonio de Padua'),(237,2,'San Fernando'),(238,2,'San Francisco Solano'),(239,2,'San Isidro'),(240,2,'San José'),(241,2,'San Justo'),(242,2,'San Martín'),(243,2,'San Miguel'),(244,2,'Santos Lugares'),(245,2,'Sarandí'),(246,2,'Sourigues'),(247,2,'Tapiales'),(248,2,'Temperley'),(249,2,'Tigre'),(250,2,'Tortuguitas'),(251,2,'Tristán Suárez'),(252,2,'Trujui'),(253,2,'Turdera'),(254,2,'Valentín Alsina'),(255,2,'Vicente López'),(256,2,'Villa Adelina'),(257,2,'Villa Ballester'),(258,2,'Villa Bosch'),(259,2,'Villa Caraza'),(260,2,'Villa Celina'),(261,2,'Villa Centenario'),(262,2,'Villa de Mayo'),(263,2,'Villa Diamante'),(264,2,'Villa Domínico'),(265,2,'Villa España'),(266,2,'Villa Fiorito'),(267,2,'Villa Guillermina'),(268,2,'Villa Insuperable'),(269,2,'Villa José León Suárez'),(270,2,'Villa La Florida'),(271,2,'Villa Luzuriaga'),(272,2,'Villa Martelli'),(273,2,'Villa Obrera'),(274,2,'Villa Progreso'),(275,2,'Villa Raffo'),(276,2,'Villa Sarmiento'),(277,2,'Villa Tesei'),(278,2,'Villa Udaondo'),(279,2,'Virrey del Pino'),(280,2,'Wilde'),(281,2,'William Morris'),(282,3,'Agronomía'),(283,3,'Almagro'),(284,3,'Balvanera'),(285,3,'Barracas'),(286,3,'Belgrano'),(287,3,'Boca'),(288,3,'Boedo'),(289,3,'Caballito'),(290,3,'Chacarita'),(291,3,'Coghlan'),(292,3,'Colegiales'),(293,3,'Constitución'),(294,3,'Flores'),(295,3,'Floresta'),(296,3,'La Paternal'),(297,3,'Liniers'),(298,3,'Mataderos'),(299,3,'Monserrat'),(300,3,'Monte Castro'),(301,3,'Nueva Pompeya'),(302,3,'Núñez'),(303,3,'Palermo'),(304,3,'Parque Avellaneda'),(305,3,'Parque Chacabuco'),(306,3,'Parque Chas'),(307,3,'Parque Patricios'),(308,3,'Puerto Madero'),(309,3,'Recoleta'),(310,3,'Retiro'),(311,3,'Saavedra'),(312,3,'San Cristóbal'),(313,3,'San Nicolás'),(314,3,'San Telmo'),(315,3,'Vélez Sársfield'),(316,3,'Versalles'),(317,3,'Villa Crespo'),(318,3,'Villa del Parque'),(319,3,'Villa Devoto'),(320,3,'Villa Gral. Mitre'),(321,3,'Villa Lugano'),(322,3,'Villa Luro'),(323,3,'Villa Ortúzar'),(324,3,'Villa Pueyrredón'),(325,3,'Villa Real'),(326,3,'Villa Riachuelo'),(327,3,'Villa Santa Rita'),(328,3,'Villa Soldati'),(329,3,'Villa Urquiza'),(330,4,'Aconquija'),(331,4,'Ancasti'),(332,4,'Andalgalá'),(333,4,'Antofagasta'),(334,4,'Belén'),(335,4,'Capayán'),(336,4,'Capital'),(337,4,'4'),(338,4,'Corral Quemado'),(339,4,'El Alto'),(340,4,'El Rodeo'),(341,4,'F.Mamerto Esquiú'),(342,4,'Fiambalá'),(343,4,'Hualfín'),(344,4,'Huillapima'),(345,4,'Icaño'),(346,4,'La Puerta'),(347,4,'Las Juntas'),(348,4,'Londres'),(349,4,'Los Altos'),(350,4,'Los Varela'),(351,4,'Mutquín'),(352,4,'Paclín'),(353,4,'Poman'),(354,4,'Pozo de La Piedra'),(355,4,'Puerta de Corral'),(356,4,'Puerta San José'),(357,4,'Recreo'),(358,4,'S.F.V de 4'),(359,4,'San Fernando'),(360,4,'San Fernando del Valle'),(361,4,'San José'),(362,4,'Santa María'),(363,4,'Santa Rosa'),(364,4,'Saujil'),(365,4,'Tapso'),(366,4,'Tinogasta'),(367,4,'Valle Viejo'),(368,4,'Villa Vil'),(369,5,'Aviá Teraí'),(370,5,'Barranqueras'),(371,5,'Basail'),(372,5,'Campo Largo'),(373,5,'Capital'),(374,5,'Capitán Solari'),(375,5,'Charadai'),(376,5,'Charata'),(377,5,'Chorotis'),(378,5,'Ciervo Petiso'),(379,5,'Cnel. Du Graty'),(380,5,'Col. Benítez'),(381,5,'Col. Elisa'),(382,5,'Col. Popular'),(383,5,'Colonias Unidas'),(384,5,'Concepción'),(385,5,'Corzuela'),(386,5,'Cote Lai'),(387,5,'El Sauzalito'),(388,5,'Enrique Urien'),(389,5,'Fontana'),(390,5,'Fte. Esperanza'),(391,5,'Gancedo'),(392,5,'Gral. Capdevila'),(393,5,'Gral. Pinero'),(394,5,'Gral. San Martín'),(395,5,'Gral. Vedia'),(396,5,'Hermoso Campo'),(397,5,'I. del Cerrito'),(398,5,'J.J. Castelli'),(399,5,'La Clotilde'),(400,5,'La Eduvigis'),(401,5,'La Escondida'),(402,5,'La Leonesa'),(403,5,'La Tigra'),(404,5,'La Verde'),(405,5,'Laguna Blanca'),(406,5,'Laguna Limpia'),(407,5,'Lapachito'),(408,5,'Las Breñas'),(409,5,'Las Garcitas'),(410,5,'Las Palmas'),(411,5,'Los Frentones'),(412,5,'Machagai'),(413,5,'Makallé'),(414,5,'Margarita Belén'),(415,5,'Miraflores'),(416,5,'Misión N. Pompeya'),(417,5,'Napenay'),(418,5,'Pampa Almirón'),(419,5,'Pampa del Indio'),(420,5,'Pampa del Infierno'),(421,5,'Pdcia. de La Plaza'),(422,5,'Pdcia. Roca'),(423,5,'Pdcia. Roque Sáenz Peña'),(424,5,'Pto. Bermejo'),(425,5,'Pto. Eva Perón'),(426,5,'Puero Tirol'),(427,5,'Puerto Vilelas'),(428,5,'Quitilipi'),(429,5,'Resistencia'),(430,5,'Sáenz Peña'),(431,5,'Samuhú'),(432,5,'San Bernardo'),(433,5,'Santa Sylvina'),(434,5,'Taco Pozo'),(435,5,'Tres Isletas'),(436,5,'Villa Ángela'),(437,5,'Villa Berthet'),(438,5,'Villa R. Bermejito'),(439,6,'Aldea Apeleg'),(440,6,'Aldea Beleiro'),(441,6,'Aldea Epulef'),(442,6,'Alto Río Sengerr'),(443,6,'Buen Pasto'),(444,6,'Camarones'),(445,6,'Carrenleufú'),(446,6,'Cholila'),(447,6,'Co. Centinela'),(448,6,'Colan Conhué'),(449,6,'Comodoro Rivadavia'),(450,6,'Corcovado'),(451,6,'Cushamen'),(452,6,'Dique F. Ameghino'),(453,6,'Dolavón'),(454,6,'Dr. R. Rojas'),(455,6,'El Hoyo'),(456,6,'El Maitén'),(457,6,'Epuyén'),(458,6,'Esquel'),(459,6,'Facundo'),(460,6,'Gaimán'),(461,6,'Gan Gan'),(462,6,'Gastre'),(463,6,'Gdor. Costa'),(464,6,'Gualjaina'),(465,6,'J. de San Martín'),(466,6,'Lago Blanco'),(467,6,'Lago Puelo'),(468,6,'Lagunita Salada'),(469,6,'Las Plumas'),(470,6,'Los Altares'),(471,6,'Paso de los Indios'),(472,6,'Paso del Sapo'),(473,6,'Pto. Madryn'),(474,6,'Pto. Pirámides'),(475,6,'Rada Tilly'),(476,6,'Rawson'),(477,6,'Río Mayo'),(478,6,'Río Pico'),(479,6,'Sarmiento'),(480,6,'Tecka'),(481,6,'Telsen'),(482,6,'Trelew'),(483,6,'Trevelin'),(484,6,'Veintiocho de Julio'),(485,7,'Achiras'),(486,7,'Adelia Maria'),(487,7,'Agua de Oro'),(488,7,'Alcira Gigena'),(489,7,'Aldea Santa Maria'),(490,7,'Alejandro Roca'),(491,7,'Alejo Ledesma'),(492,7,'Alicia'),(493,7,'Almafuerte'),(494,7,'Alpa Corral'),(495,7,'Alta Gracia'),(496,7,'Alto Alegre'),(497,7,'Alto de Los Quebrachos'),(498,7,'Altos de Chipion'),(499,7,'Amboy'),(500,7,'Ambul'),(501,7,'Ana Zumaran'),(502,7,'Anisacate'),(503,7,'Arguello'),(504,7,'Arias'),(505,7,'Arroyito'),(506,7,'Arroyo Algodon'),(507,7,'Arroyo Cabral'),(508,7,'Arroyo Los Patos'),(509,7,'Assunta'),(510,7,'Atahona'),(511,7,'Ausonia'),(512,7,'Avellaneda'),(513,7,'Ballesteros'),(514,7,'Ballesteros Sud'),(515,7,'Balnearia'),(516,7,'Bañado de Soto'),(517,7,'Bell Ville'),(518,7,'Bengolea'),(519,7,'Benjamin Gould'),(520,7,'Berrotaran'),(521,7,'Bialet Masse'),(522,7,'Bouwer'),(523,7,'Brinkmann'),(524,7,'Buchardo'),(525,7,'Bulnes'),(526,7,'Cabalango'),(527,7,'Calamuchita'),(528,7,'Calchin'),(529,7,'Calchin Oeste'),(530,7,'Calmayo'),(531,7,'Camilo Aldao'),(532,7,'Caminiaga'),(533,7,'Cañada de Luque'),(534,7,'Cañada de Machado'),(535,7,'Cañada de Rio Pinto'),(536,7,'Cañada del Sauce'),(537,7,'Canals'),(538,7,'Candelaria Sud'),(539,7,'Capilla de Remedios'),(540,7,'Capilla de Siton'),(541,7,'Capilla del Carmen'),(542,7,'Capilla del Monte'),(543,7,'Capital'),(544,7,'Capitan Gral B. O´Higgins'),(545,7,'Carnerillo'),(546,7,'Carrilobo'),(547,7,'Casa Grande'),(548,7,'Cavanagh'),(549,7,'Cerro Colorado'),(550,7,'Chaján'),(551,7,'Chalacea'),(552,7,'Chañar Viejo'),(553,7,'Chancaní'),(554,7,'Charbonier'),(555,7,'Charras'),(556,7,'Chazón'),(557,7,'Chilibroste'),(558,7,'Chucul'),(559,7,'Chuña'),(560,7,'Chuña Huasi'),(561,7,'Churqui Cañada'),(562,7,'Cienaga Del Coro'),(563,7,'Cintra'),(564,7,'Col. Almada'),(565,7,'Col. Anita'),(566,7,'Col. Barge'),(567,7,'Col. Bismark'),(568,7,'Col. Bremen'),(569,7,'Col. Caroya'),(570,7,'Col. Italiana'),(571,7,'Col. Iturraspe'),(572,7,'Col. Las Cuatro Esquinas'),(573,7,'Col. Las Pichanas'),(574,7,'Col. Marina'),(575,7,'Col. Prosperidad'),(576,7,'Col. San Bartolome'),(577,7,'Col. San Pedro'),(578,7,'Col. Tirolesa'),(579,7,'Col. Vicente Aguero'),(580,7,'Col. Videla'),(581,7,'Col. Vignaud'),(582,7,'Col. Waltelina'),(583,7,'Colazo'),(584,7,'Comechingones'),(585,7,'Conlara'),(586,7,'Copacabana'),(587,7,'7'),(588,7,'Coronel Baigorria'),(589,7,'Coronel Moldes'),(590,7,'Corral de Bustos'),(591,7,'Corralito'),(592,7,'Cosquín'),(593,7,'Costa Sacate'),(594,7,'Cruz Alta'),(595,7,'Cruz de Caña'),(596,7,'Cruz del Eje'),(597,7,'Cuesta Blanca'),(598,7,'Dean Funes'),(599,7,'Del Campillo'),(600,7,'Despeñaderos'),(601,7,'Devoto'),(602,7,'Diego de Rojas'),(603,7,'Dique Chico'),(604,7,'El Arañado'),(605,7,'El Brete'),(606,7,'El Chacho'),(607,7,'El Crispín'),(608,7,'El Fortín'),(609,7,'El Manzano'),(610,7,'El Rastreador'),(611,7,'El Rodeo'),(612,7,'El Tío'),(613,7,'Elena'),(614,7,'Embalse'),(615,7,'Esquina'),(616,7,'Estación Gral. Paz'),(617,7,'Estación Juárez Celman'),(618,7,'Estancia de Guadalupe'),(619,7,'Estancia Vieja'),(620,7,'Etruria'),(621,7,'Eufrasio Loza'),(622,7,'Falda del Carmen'),(623,7,'Freyre'),(624,7,'Gral. Baldissera'),(625,7,'Gral. Cabrera'),(626,7,'Gral. Deheza'),(627,7,'Gral. Fotheringham'),(628,7,'Gral. Levalle'),(629,7,'Gral. Roca'),(630,7,'Guanaco Muerto'),(631,7,'Guasapampa'),(632,7,'Guatimozin'),(633,7,'Gutenberg'),(634,7,'Hernando'),(635,7,'Huanchillas'),(636,7,'Huerta Grande'),(637,7,'Huinca Renanco'),(638,7,'Idiazabal'),(639,7,'Impira'),(640,7,'Inriville'),(641,7,'Isla Verde'),(642,7,'Italó'),(643,7,'James Craik'),(644,7,'Jesús María'),(645,7,'Jovita'),(646,7,'Justiniano Posse'),(647,7,'Km 658'),(648,7,'L. V. Mansilla'),(649,7,'La Batea'),(650,7,'La Calera'),(651,7,'La Carlota'),(652,7,'La Carolina'),(653,7,'La Cautiva'),(654,7,'La Cesira'),(655,7,'La Cruz'),(656,7,'La Cumbre'),(657,7,'La Cumbrecita'),(658,7,'La Falda'),(659,7,'La Francia'),(660,7,'La Granja'),(661,7,'La Higuera'),(662,7,'La Laguna'),(663,7,'La Paisanita'),(664,7,'La Palestina'),(665,7,'12'),(666,7,'La Paquita'),(667,7,'La Para'),(668,7,'La Paz'),(669,7,'La Playa'),(670,7,'La Playosa'),(671,7,'La Población'),(672,7,'La Posta'),(673,7,'La Puerta'),(674,7,'La Quinta'),(675,7,'La Rancherita'),(676,7,'La Rinconada'),(677,7,'La Serranita'),(678,7,'La Tordilla'),(679,7,'Laborde'),(680,7,'Laboulaye'),(681,7,'Laguna Larga'),(682,7,'Las Acequias'),(683,7,'Las Albahacas'),(684,7,'Las Arrias'),(685,7,'Las Bajadas'),(686,7,'Las Caleras'),(687,7,'Las Calles'),(688,7,'Las Cañadas'),(689,7,'Las Gramillas'),(690,7,'Las Higueras'),(691,7,'Las Isletillas'),(692,7,'Las Junturas'),(693,7,'Las Palmas'),(694,7,'Las Peñas'),(695,7,'Las Peñas Sud'),(696,7,'Las Perdices'),(697,7,'Las Playas'),(698,7,'Las Rabonas'),(699,7,'Las Saladas'),(700,7,'Las Tapias'),(701,7,'Las Varas'),(702,7,'Las Varillas'),(703,7,'Las Vertientes'),(704,7,'Leguizamón'),(705,7,'Leones'),(706,7,'Los Cedros'),(707,7,'Los Cerrillos'),(708,7,'Los Chañaritos (C.E)'),(709,7,'Los Chanaritos (R.S)'),(710,7,'Los Cisnes'),(711,7,'Los Cocos'),(712,7,'Los Cóndores'),(713,7,'Los Hornillos'),(714,7,'Los Hoyos'),(715,7,'Los Mistoles'),(716,7,'Los Molinos'),(717,7,'Los Pozos'),(718,7,'Los Reartes'),(719,7,'Los Surgentes'),(720,7,'Los Talares'),(721,7,'Los Zorros'),(722,7,'Lozada'),(723,7,'Luca'),(724,7,'Luque'),(725,7,'Luyaba'),(726,7,'Malagueño'),(727,7,'Malena'),(728,7,'Malvinas Argentinas'),(729,7,'Manfredi'),(730,7,'Maquinista Gallini'),(731,7,'Marcos Juárez'),(732,7,'Marull'),(733,7,'Matorrales'),(734,7,'Mattaldi'),(735,7,'Mayu Sumaj'),(736,7,'Media Naranja'),(737,7,'Melo'),(738,7,'Mendiolaza'),(739,7,'Mi Granja'),(740,7,'Mina Clavero'),(741,7,'Miramar'),(742,7,'Morrison'),(743,7,'Morteros'),(744,7,'Mte. Buey'),(745,7,'Mte. Cristo'),(746,7,'Mte. De Los Gauchos'),(747,7,'Mte. Leña'),(748,7,'Mte. Maíz'),(749,7,'Mte. Ralo'),(750,7,'Nicolás Bruzone'),(751,7,'Noetinger'),(752,7,'Nono'),(753,7,'Nueva 7'),(754,7,'Obispo Trejo'),(755,7,'Olaeta'),(756,7,'Oliva'),(757,7,'Olivares San Nicolás'),(758,7,'Onagolty'),(759,7,'Oncativo'),(760,7,'Ordoñez'),(761,7,'Pacheco De Melo'),(762,7,'Pampayasta N.'),(763,7,'Pampayasta S.'),(764,7,'Panaholma'),(765,7,'Pascanas'),(766,7,'Pasco'),(767,7,'Paso del Durazno'),(768,7,'Paso Viejo'),(769,7,'Pilar'),(770,7,'Pincén'),(771,7,'Piquillín'),(772,7,'Plaza de Mercedes'),(773,7,'Plaza Luxardo'),(774,7,'Porteña'),(775,7,'Potrero de Garay'),(776,7,'Pozo del Molle'),(777,7,'Pozo Nuevo'),(778,7,'Pueblo Italiano'),(779,7,'Puesto de Castro'),(780,7,'Punta del Agua'),(781,7,'Quebracho Herrado'),(782,7,'Quilino'),(783,7,'Rafael García'),(784,7,'Ranqueles'),(785,7,'Rayo Cortado'),(786,7,'Reducción'),(787,7,'Rincón'),(788,7,'Río Bamba'),(789,7,'Río Ceballos'),(790,7,'Río Cuarto'),(791,7,'Río de Los Sauces'),(792,7,'Río Primero'),(793,7,'Río Segundo'),(794,7,'Río Tercero'),(795,7,'Rosales'),(796,7,'Rosario del Saladillo'),(797,7,'Sacanta'),(798,7,'Sagrada Familia'),(799,7,'Saira'),(800,7,'Saladillo'),(801,7,'Saldán'),(802,7,'Salsacate'),(803,7,'Salsipuedes'),(804,7,'Sampacho'),(805,7,'San Agustín'),(806,7,'San Antonio de Arredondo'),(807,7,'San Antonio de Litín'),(808,7,'San Basilio'),(809,7,'San Carlos Minas'),(810,7,'San Clemente'),(811,7,'San Esteban'),(812,7,'San Francisco'),(813,7,'San Ignacio'),(814,7,'San Javier'),(815,7,'San Jerónimo'),(816,7,'San Joaquín'),(817,7,'San José de La Dormida'),(818,7,'San José de Las Salinas'),(819,7,'San Lorenzo'),(820,7,'San Marcos Sierras'),(821,7,'San Marcos Sud'),(822,7,'San Pedro'),(823,7,'San Pedro N.'),(824,7,'San Roque'),(825,7,'San Vicente'),(826,7,'Santa Catalina'),(827,7,'Santa Elena'),(828,7,'Santa Eufemia'),(829,7,'Santa Maria'),(830,7,'Sarmiento'),(831,7,'Saturnino M.Laspiur'),(832,7,'Sauce Arriba'),(833,7,'Sebastián Elcano'),(834,7,'Seeber'),(835,7,'Segunda Usina'),(836,7,'Serrano'),(837,7,'Serrezuela'),(838,7,'Sgo. Temple'),(839,7,'Silvio Pellico'),(840,7,'Simbolar'),(841,7,'Sinsacate'),(842,7,'Sta. Rosa de Calamuchita'),(843,7,'Sta. Rosa de Río Primero'),(844,7,'Suco'),(845,7,'Tala Cañada'),(846,7,'Tala Huasi'),(847,7,'Talaini'),(848,7,'Tancacha'),(849,7,'Tanti'),(850,7,'Ticino'),(851,7,'Tinoco'),(852,7,'Tío Pujio'),(853,7,'Toledo'),(854,7,'Toro Pujio'),(855,7,'Tosno'),(856,7,'Tosquita'),(857,7,'Tránsito'),(858,7,'Tuclame'),(859,7,'Tutti'),(860,7,'Ucacha'),(861,7,'Unquillo'),(862,7,'Valle de Anisacate'),(863,7,'Valle Hermoso'),(864,7,'Vélez Sarfield'),(865,7,'Viamonte'),(866,7,'Vicuña Mackenna'),(867,7,'Villa Allende'),(868,7,'Villa Amancay'),(869,7,'Villa Ascasubi'),(870,7,'Villa Candelaria N.'),(871,7,'Villa Carlos Paz'),(872,7,'Villa Cerro Azul'),(873,7,'Villa Ciudad de América'),(874,7,'Villa Ciudad Pque Los Reartes'),(875,7,'Villa Concepción del Tío'),(876,7,'Villa Cura Brochero'),(877,7,'Villa de Las Rosas'),(878,7,'Villa de María'),(879,7,'Villa de Pocho'),(880,7,'Villa de Soto'),(881,7,'Villa del Dique'),(882,7,'Villa del Prado'),(883,7,'Villa del Rosario'),(884,7,'Villa del Totoral'),(885,7,'Villa Dolores'),(886,7,'Villa El Chancay'),(887,7,'Villa Elisa'),(888,7,'Villa Flor Serrana'),(889,7,'Villa Fontana'),(890,7,'Villa Giardino'),(891,7,'Villa Gral. Belgrano'),(892,7,'Villa Gutierrez'),(893,7,'Villa Huidobro'),(894,7,'Villa La Bolsa'),(895,7,'Villa Los Aromos'),(896,7,'Villa Los Patos'),(897,7,'Villa María'),(898,7,'Villa Nueva'),(899,7,'Villa Pque. Santa Ana'),(900,7,'Villa Pque. Siquiman'),(901,7,'Villa Quillinzo'),(902,7,'Villa Rossi'),(903,7,'Villa Rumipal'),(904,7,'Villa San Esteban'),(905,7,'Villa San Isidro'),(906,7,'Villa 21'),(907,7,'Villa Sarmiento (G.R)'),(908,7,'Villa Sarmiento (S.A)'),(909,7,'Villa Tulumba'),(910,7,'Villa Valeria'),(911,7,'Villa Yacanto'),(912,7,'Washington'),(913,7,'Wenceslao Escalante'),(914,7,'Ycho Cruz Sierras'),(915,8,'Alvear'),(916,8,'Bella Vista'),(917,8,'Berón de Astrada'),(918,8,'Bonpland'),(919,8,'Caá Cati'),(920,8,'Capital'),(921,8,'Chavarría'),(922,8,'Col. C. Pellegrini'),(923,8,'Col. Libertad'),(924,8,'Col. Liebig'),(925,8,'Col. Sta Rosa'),(926,8,'Concepción'),(927,8,'Cruz de Los Milagros'),(928,8,'Curuzú-Cuatiá'),(929,8,'Empedrado'),(930,8,'Esquina'),(931,8,'Estación Torrent'),(932,8,'Felipe Yofré'),(933,8,'Garruchos'),(934,8,'Gdor. Agrónomo'),(935,8,'Gdor. Martínez'),(936,8,'Goya'),(937,8,'Guaviravi'),(938,8,'Herlitzka'),(939,8,'Ita-Ibate'),(940,8,'Itatí'),(941,8,'Ituzaingó'),(942,8,'José Rafael Gómez'),(943,8,'Juan Pujol'),(944,8,'La Cruz'),(945,8,'Lavalle'),(946,8,'Lomas de Vallejos'),(947,8,'Loreto'),(948,8,'Mariano I. Loza'),(949,8,'Mburucuyá'),(950,8,'Mercedes'),(951,8,'Mocoretá'),(952,8,'Mte. Caseros'),(953,8,'Nueve de Julio'),(954,8,'Palmar Grande'),(955,8,'Parada Pucheta'),(956,8,'Paso de La Patria'),(957,8,'Paso de Los Libres'),(958,8,'Pedro R. Fernandez'),(959,8,'Perugorría'),(960,8,'Pueblo Libertador'),(961,8,'Ramada Paso'),(962,8,'Riachuelo'),(963,8,'Saladas'),(964,8,'San Antonio'),(965,8,'San Carlos'),(966,8,'San Cosme'),(967,8,'San Lorenzo'),(968,8,'20 del Palmar'),(969,8,'San Miguel'),(970,8,'San Roque'),(971,8,'Santa Ana'),(972,8,'Santa Lucía'),(973,8,'Santo Tomé'),(974,8,'Sauce'),(975,8,'Tabay'),(976,8,'Tapebicuá'),(977,8,'Tatacua'),(978,8,'Virasoro'),(979,8,'Yapeyú'),(980,8,'Yataití Calle'),(981,9,'Alarcón'),(982,9,'Alcaraz'),(983,9,'Alcaraz N.'),(984,9,'Alcaraz S.'),(985,9,'Aldea Asunción'),(986,9,'Aldea Brasilera'),(987,9,'Aldea Elgenfeld'),(988,9,'Aldea Grapschental'),(989,9,'Aldea Ma. Luisa'),(990,9,'Aldea Protestante'),(991,9,'Aldea Salto'),(992,9,'Aldea San Antonio (G)'),(993,9,'Aldea San Antonio (P)'),(994,9,'Aldea 19'),(995,9,'Aldea San Miguel'),(996,9,'Aldea San Rafael'),(997,9,'Aldea Spatzenkutter'),(998,9,'Aldea Sta. María'),(999,9,'Aldea Sta. Rosa'),(1000,9,'Aldea Valle María'),(1001,9,'Altamirano Sur'),(1002,9,'Antelo'),(1003,9,'Antonio Tomás'),(1004,9,'Aranguren'),(1005,9,'Arroyo Barú'),(1006,9,'Arroyo Burgos'),(1007,9,'Arroyo Clé'),(1008,9,'Arroyo Corralito'),(1009,9,'Arroyo del Medio'),(1010,9,'Arroyo Maturrango'),(1011,9,'Arroyo Palo Seco'),(1012,9,'Banderas'),(1013,9,'Basavilbaso'),(1014,9,'Betbeder'),(1015,9,'Bovril'),(1016,9,'Caseros'),(1017,9,'Ceibas'),(1018,9,'Cerrito'),(1019,9,'Chajarí'),(1020,9,'Chilcas'),(1021,9,'Clodomiro Ledesma'),(1022,9,'Col. Alemana'),(1023,9,'Col. Avellaneda'),(1024,9,'Col. Avigdor'),(1025,9,'Col. Ayuí'),(1026,9,'Col. Baylina'),(1027,9,'Col. Carrasco'),(1028,9,'Col. Celina'),(1029,9,'Col. Cerrito'),(1030,9,'Col. Crespo'),(1031,9,'Col. Elia'),(1032,9,'Col. Ensayo'),(1033,9,'Col. Gral. Roca'),(1034,9,'Col. La Argentina'),(1035,9,'Col. Merou'),(1036,9,'Col. Oficial Nª3'),(1037,9,'Col. Oficial Nº13'),(1038,9,'Col. Oficial Nº14'),(1039,9,'Col. Oficial Nº5'),(1040,9,'Col. Reffino'),(1041,9,'Col. Tunas'),(1042,9,'Col. Viraró'),(1043,9,'Colón'),(1044,9,'Concepción del Uruguay'),(1045,9,'Concordia'),(1046,9,'Conscripto Bernardi'),(1047,9,'Costa Grande'),(1048,9,'Costa San Antonio'),(1049,9,'Costa Uruguay N.'),(1050,9,'Costa Uruguay S.'),(1051,9,'Crespo'),(1052,9,'Crucecitas 3ª'),(1053,9,'Crucecitas 7ª'),(1054,9,'Crucecitas 8ª'),(1055,9,'Cuchilla Redonda'),(1056,9,'Curtiembre'),(1057,9,'Diamante'),(1058,9,'Distrito 6º'),(1059,9,'Distrito Chañar'),(1060,9,'Distrito Chiqueros'),(1061,9,'Distrito Cuarto'),(1062,9,'Distrito Diego López'),(1063,9,'Distrito Pajonal'),(1064,9,'Distrito Sauce'),(1065,9,'Distrito Tala'),(1066,9,'Distrito Talitas'),(1067,9,'Don Cristóbal 1ª Sección'),(1068,9,'Don Cristóbal 2ª Sección'),(1069,9,'Durazno'),(1070,9,'El Cimarrón'),(1071,9,'El Gramillal'),(1072,9,'El Palenque'),(1073,9,'El Pingo'),(1074,9,'El Quebracho'),(1075,9,'El Redomón'),(1076,9,'El Solar'),(1077,9,'Enrique Carbo'),(1078,9,'9'),(1079,9,'Espinillo N.'),(1080,9,'Estación Campos'),(1081,9,'Estación Escriña'),(1082,9,'Estación Lazo'),(1083,9,'Estación Raíces'),(1084,9,'Estación Yerúa'),(1085,9,'Estancia Grande'),(1086,9,'Estancia Líbaros'),(1087,9,'Estancia Racedo'),(1088,9,'Estancia Solá'),(1089,9,'Estancia Yuquerí'),(1090,9,'Estaquitas'),(1091,9,'Faustino M. Parera'),(1092,9,'Febre'),(1093,9,'Federación'),(1094,9,'Federal'),(1095,9,'Gdor. Echagüe'),(1096,9,'Gdor. Mansilla'),(1097,9,'Gilbert'),(1098,9,'González Calderón'),(1099,9,'Gral. Almada'),(1100,9,'Gral. Alvear'),(1101,9,'Gral. Campos'),(1102,9,'Gral. Galarza'),(1103,9,'Gral. Ramírez'),(1104,9,'Gualeguay'),(1105,9,'Gualeguaychú'),(1106,9,'Gualeguaycito'),(1107,9,'Guardamonte'),(1108,9,'Hambis'),(1109,9,'Hasenkamp'),(1110,9,'Hernandarias'),(1111,9,'Hernández'),(1112,9,'Herrera'),(1113,9,'Hinojal'),(1114,9,'Hocker'),(1115,9,'Ing. Sajaroff'),(1116,9,'Irazusta'),(1117,9,'Isletas'),(1118,9,'J.J De Urquiza'),(1119,9,'Jubileo'),(1120,9,'La Clarita'),(1121,9,'La Criolla'),(1122,9,'La Esmeralda'),(1123,9,'La Florida'),(1124,9,'La Fraternidad'),(1125,9,'La Hierra'),(1126,9,'La Ollita'),(1127,9,'La Paz'),(1128,9,'La Picada'),(1129,9,'La Providencia'),(1130,9,'La Verbena'),(1131,9,'Laguna Benítez'),(1132,9,'Larroque'),(1133,9,'Las Cuevas'),(1134,9,'Las Garzas'),(1135,9,'Las Guachas'),(1136,9,'Las Mercedes'),(1137,9,'Las Moscas'),(1138,9,'Las Mulitas'),(1139,9,'Las Toscas'),(1140,9,'Laurencena'),(1141,9,'Libertador San Martín'),(1142,9,'Loma Limpia'),(1143,9,'Los Ceibos'),(1144,9,'Los Charruas'),(1145,9,'Los Conquistadores'),(1146,9,'Lucas González'),(1147,9,'Lucas N.'),(1148,9,'Lucas S. 1ª'),(1149,9,'Lucas S. 2ª'),(1150,9,'Maciá'),(1151,9,'María Grande'),(1152,9,'María Grande 2ª'),(1153,9,'Médanos'),(1154,9,'Mojones N.'),(1155,9,'Mojones S.'),(1156,9,'Molino Doll'),(1157,9,'Monte Redondo'),(1158,9,'Montoya'),(1159,9,'Mulas Grandes'),(1160,9,'Ñancay'),(1161,9,'Nogoyá'),(1162,9,'Nueva Escocia'),(1163,9,'Nueva Vizcaya'),(1164,9,'Ombú'),(1165,9,'Oro Verde'),(1166,9,'Paraná'),(1167,9,'Pasaje Guayaquil'),(1168,9,'Pasaje Las Tunas'),(1169,9,'Paso de La Arena'),(1170,9,'Paso de La Laguna'),(1171,9,'Paso de Las Piedras'),(1172,9,'Paso Duarte'),(1173,9,'Pastor Britos'),(1174,9,'Pedernal'),(1175,9,'Perdices'),(1176,9,'Picada Berón'),(1177,9,'Piedras Blancas'),(1178,9,'Primer Distrito Cuchilla'),(1179,9,'Primero de Mayo'),(1180,9,'Pronunciamiento'),(1181,9,'Pto. Algarrobo'),(1182,9,'Pto. Ibicuy'),(1183,9,'Pueblo Brugo'),(1184,9,'Pueblo Cazes'),(1185,9,'Pueblo Gral. Belgrano'),(1186,9,'Pueblo Liebig'),(1187,9,'Puerto Yeruá'),(1188,9,'Punta del Monte'),(1189,9,'Quebracho'),(1190,9,'Quinto Distrito'),(1191,9,'Raices Oeste'),(1192,9,'Rincón de Nogoyá'),(1193,9,'Rincón del Cinto'),(1194,9,'Rincón del Doll'),(1195,9,'Rincón del Gato'),(1196,9,'Rocamora'),(1197,9,'Rosario del Tala'),(1198,9,'San Benito'),(1199,9,'San Cipriano'),(1200,9,'San Ernesto'),(1201,9,'San Gustavo'),(1202,9,'San Jaime'),(1203,9,'San José'),(1204,9,'San José de Feliciano'),(1205,9,'San Justo'),(1206,9,'San Marcial'),(1207,9,'San Pedro'),(1208,9,'San Ramírez'),(1209,9,'San Ramón'),(1210,9,'San Roque'),(1211,9,'San Salvador'),(1212,9,'San Víctor'),(1213,9,'Santa Ana'),(1214,9,'Santa Anita'),(1215,9,'Santa Elena'),(1216,9,'Santa Lucía'),(1217,9,'Santa Luisa'),(1218,9,'Sauce de Luna'),(1219,9,'Sauce Montrull'),(1220,9,'Sauce Pinto'),(1221,9,'Sauce Sur'),(1222,9,'Seguí'),(1223,9,'Sir Leonard'),(1224,9,'Sosa'),(1225,9,'Tabossi'),(1226,9,'Tezanos Pinto'),(1227,9,'Ubajay'),(1228,9,'Urdinarrain'),(1229,9,'Veinte de Septiembre'),(1230,9,'Viale'),(1231,9,'Victoria'),(1232,9,'Villa Clara'),(1233,9,'Villa del Rosario'),(1234,9,'Villa Domínguez'),(1235,9,'Villa Elisa'),(1236,9,'Villa Fontana'),(1237,9,'Villa Gdor. Etchevehere'),(1238,9,'Villa Mantero'),(1239,9,'Villa Paranacito'),(1240,9,'Villa Urquiza'),(1241,9,'Villaguay'),(1242,9,'Walter Moss'),(1243,9,'Yacaré'),(1244,9,'Yeso Oeste'),(1245,10,'Buena Vista'),(1246,10,'Clorinda'),(1247,10,'Col. Pastoril'),(1248,10,'Cte. Fontana'),(1249,10,'El Colorado'),(1250,10,'El Espinillo'),(1251,10,'Estanislao Del Campo'),(1252,10,'10'),(1253,10,'Fortín Lugones'),(1254,10,'Gral. Lucio V. Mansilla'),(1255,10,'Gral. Manuel Belgrano'),(1256,10,'Gral. Mosconi'),(1257,10,'Gran Guardia'),(1258,10,'Herradura'),(1259,10,'Ibarreta'),(1260,10,'Ing. Juárez'),(1261,10,'Laguna Blanca'),(1262,10,'Laguna Naick Neck'),(1263,10,'Laguna Yema'),(1264,10,'Las Lomitas'),(1265,10,'Los Chiriguanos'),(1266,10,'Mayor V. Villafañe'),(1267,10,'Misión San Fco.'),(1268,10,'Palo Santo'),(1269,10,'Pirané'),(1270,10,'Pozo del Maza'),(1271,10,'Riacho He-He'),(1272,10,'San Hilario'),(1273,10,'San Martín II'),(1274,10,'Siete Palmas'),(1275,10,'Subteniente Perín'),(1276,10,'Tres Lagunas'),(1277,10,'Villa Dos Trece'),(1278,10,'Villa Escolar'),(1279,10,'Villa Gral. Güemes'),(1280,11,'Abdon Castro Tolay'),(1281,11,'Abra Pampa'),(1282,11,'Abralaite'),(1283,11,'Aguas Calientes'),(1284,11,'Arrayanal'),(1285,11,'Barrios'),(1286,11,'Caimancito'),(1287,11,'Calilegua'),(1288,11,'Cangrejillos'),(1289,11,'Caspala'),(1290,11,'Catuá'),(1291,11,'Cieneguillas'),(1292,11,'Coranzulli'),(1293,11,'Cusi-Cusi'),(1294,11,'El Aguilar'),(1295,11,'El Carmen'),(1296,11,'El Cóndor'),(1297,11,'El Fuerte'),(1298,11,'El Piquete'),(1299,11,'El Talar'),(1300,11,'Fraile Pintado'),(1301,11,'Hipólito Yrigoyen'),(1302,11,'Huacalera'),(1303,11,'Humahuaca'),(1304,11,'La Esperanza'),(1305,11,'La Mendieta'),(1306,11,'La Quiaca'),(1307,11,'Ledesma'),(1308,11,'Libertador Gral. San Martin'),(1309,11,'Maimara'),(1310,11,'Mina Pirquitas'),(1311,11,'Monterrico'),(1312,11,'Palma Sola'),(1313,11,'Palpalá'),(1314,11,'Pampa Blanca'),(1315,11,'Pampichuela'),(1316,11,'Perico'),(1317,11,'Puesto del Marqués'),(1318,11,'Puesto Viejo'),(1319,11,'Pumahuasi'),(1320,11,'Purmamarca'),(1321,11,'Rinconada'),(1322,11,'Rodeitos'),(1323,11,'Rosario de Río Grande'),(1324,11,'San Antonio'),(1325,11,'San Francisco'),(1326,11,'San Pedro'),(1327,11,'San Rafael'),(1328,11,'San Salvador'),(1329,11,'Santa Ana'),(1330,11,'Santa Catalina'),(1331,11,'Santa Clara'),(1332,11,'Susques'),(1333,11,'Tilcara'),(1334,11,'Tres Cruces'),(1335,11,'Tumbaya'),(1336,11,'Valle Grande'),(1337,11,'Vinalito'),(1338,11,'Volcán'),(1339,11,'Yala'),(1340,11,'Yaví'),(1341,11,'Yuto'),(1342,12,'Abramo'),(1343,12,'Adolfo Van Praet'),(1344,12,'Agustoni'),(1345,12,'Algarrobo del Aguila'),(1346,12,'Alpachiri'),(1347,12,'Alta Italia'),(1348,12,'Anguil'),(1349,12,'Arata'),(1350,12,'Ataliva Roca'),(1351,12,'Bernardo Larroude'),(1352,12,'Bernasconi'),(1353,12,'Caleufú'),(1354,12,'Carro Quemado'),(1355,12,'Catriló'),(1356,12,'Ceballos'),(1357,12,'Chacharramendi'),(1358,12,'Col. Barón'),(1359,12,'Col. Santa María'),(1360,12,'Conhelo'),(1361,12,'Coronel Hilario Lagos'),(1362,12,'Cuchillo-Có'),(1363,12,'Doblas'),(1364,12,'Dorila'),(1365,12,'Eduardo Castex'),(1366,12,'Embajador Martini'),(1367,12,'Falucho'),(1368,12,'Gral. Acha'),(1369,12,'Gral. Manuel Campos'),(1370,12,'Gral. Pico'),(1371,12,'Guatraché'),(1372,12,'Ing. Luiggi'),(1373,12,'Intendente Alvear'),(1374,12,'Jacinto Arauz'),(1375,12,'La Adela'),(1376,12,'La Humada'),(1377,12,'La Maruja'),(1378,12,'12'),(1379,12,'La Reforma'),(1380,12,'Limay Mahuida'),(1381,12,'Lonquimay'),(1382,12,'Loventuel'),(1383,12,'Luan Toro'),(1384,12,'Macachín'),(1385,12,'Maisonnave'),(1386,12,'Mauricio Mayer'),(1387,12,'Metileo'),(1388,12,'Miguel Cané'),(1389,12,'Miguel Riglos'),(1390,12,'Monte Nievas'),(1391,12,'Parera'),(1392,12,'Perú'),(1393,12,'Pichi-Huinca'),(1394,12,'Puelches'),(1395,12,'Puelén'),(1396,12,'Quehue'),(1397,12,'Quemú Quemú'),(1398,12,'Quetrequén'),(1399,12,'Rancul'),(1400,12,'Realicó'),(1401,12,'Relmo'),(1402,12,'Rolón'),(1403,12,'Rucanelo'),(1404,12,'Sarah'),(1405,12,'Speluzzi'),(1406,12,'Sta. Isabel'),(1407,12,'Sta. Rosa'),(1408,12,'Sta. Teresa'),(1409,12,'Telén'),(1410,12,'Toay'),(1411,12,'Tomas M. de Anchorena'),(1412,12,'Trenel'),(1413,12,'Unanue'),(1414,12,'Uriburu'),(1415,12,'Veinticinco de Mayo'),(1416,12,'Vertiz'),(1417,12,'Victorica'),(1418,12,'Villa Mirasol'),(1419,12,'Winifreda'),(1420,13,'Arauco'),(1421,13,'Capital'),(1422,13,'Castro Barros'),(1423,13,'Chamical'),(1424,13,'Chilecito'),(1425,13,'Coronel F. Varela'),(1426,13,'Famatina'),(1427,13,'Gral. A.V.Peñaloza'),(1428,13,'Gral. Belgrano'),(1429,13,'Gral. J.F. Quiroga'),(1430,13,'Gral. Lamadrid'),(1431,13,'Gral. Ocampo'),(1432,13,'Gral. San Martín'),(1433,13,'Independencia'),(1434,13,'Rosario Penaloza'),(1435,13,'San Blas de Los Sauces'),(1436,13,'Sanagasta'),(1437,13,'Vinchina'),(1438,14,'Capital'),(1439,14,'Chacras de Coria'),(1440,14,'Dorrego'),(1441,14,'Gllen'),(1442,14,'Godoy Cruz'),(1443,14,'Gral. Alvear'),(1444,14,'Guaymallén'),(1445,14,'Junín'),(1446,14,'La Paz'),(1447,14,'Las Heras'),(1448,14,'Lavalle'),(1449,14,'Luján'),(1450,14,'Luján De Cuyo'),(1451,14,'Maipú'),(1452,14,'Malargüe'),(1453,14,'Rivadavia'),(1454,14,'San Carlos'),(1455,14,'San Martín'),(1456,14,'San Rafael'),(1457,14,'Sta. Rosa'),(1458,14,'Tunuyán'),(1459,14,'Tupungato'),(1460,14,'Villa Nueva'),(1461,15,'Alba Posse'),(1462,15,'Almafuerte'),(1463,15,'Apóstoles'),(1464,15,'Aristóbulo Del Valle'),(1465,15,'Arroyo Del Medio'),(1466,15,'Azara'),(1467,15,'Bdo. De Irigoyen'),(1468,15,'Bonpland'),(1469,15,'Caá Yari'),(1470,15,'Campo Grande'),(1471,15,'Campo Ramón'),(1472,15,'Campo Viera'),(1473,15,'Candelaria'),(1474,15,'Capioví'),(1475,15,'Caraguatay'),(1476,15,'Cdte. Guacurarí'),(1477,15,'Cerro Azul'),(1478,15,'Cerro Corá'),(1479,15,'Col. Alberdi'),(1480,15,'Col. Aurora'),(1481,15,'Col. Delicia'),(1482,15,'Col. Polana'),(1483,15,'Col. Victoria'),(1484,15,'Col. Wanda'),(1485,15,'Concepción De La Sierra'),(1486,15,'Corpus'),(1487,15,'Dos Arroyos'),(1488,15,'Dos de Mayo'),(1489,15,'El Alcázar'),(1490,15,'El Dorado'),(1491,15,'El Soberbio'),(1492,15,'Esperanza'),(1493,15,'F. Ameghino'),(1494,15,'Fachinal'),(1495,15,'Garuhapé'),(1496,15,'Garupá'),(1497,15,'Gdor. López'),(1498,15,'Gdor. Roca'),(1499,15,'Gral. Alvear'),(1500,15,'Gral. Urquiza'),(1501,15,'Guaraní'),(1502,15,'H. Yrigoyen'),(1503,15,'Iguazú'),(1504,15,'Itacaruaré'),(1505,15,'Jardín América'),(1506,15,'Leandro N. Alem'),(1507,15,'Libertad'),(1508,15,'Loreto'),(1509,15,'Los Helechos'),(1510,15,'Mártires'),(1511,15,'15'),(1512,15,'Mojón Grande'),(1513,15,'Montecarlo'),(1514,15,'Nueve de Julio'),(1515,15,'Oberá'),(1516,15,'Olegario V. Andrade'),(1517,15,'Panambí'),(1518,15,'Posadas'),(1519,15,'Profundidad'),(1520,15,'Pto. Iguazú'),(1521,15,'Pto. Leoni'),(1522,15,'Pto. Piray'),(1523,15,'Pto. Rico'),(1524,15,'Ruiz de Montoya'),(1525,15,'San Antonio'),(1526,15,'San Ignacio'),(1527,15,'San Javier'),(1528,15,'San José'),(1529,15,'San Martín'),(1530,15,'San Pedro'),(1531,15,'San Vicente'),(1532,15,'Santiago De Liniers'),(1533,15,'Santo Pipo'),(1534,15,'Sta. Ana'),(1535,15,'Sta. María'),(1536,15,'Tres Capones'),(1537,15,'Veinticinco de Mayo'),(1538,15,'Wanda'),(1539,16,'Aguada San Roque'),(1540,16,'Aluminé'),(1541,16,'Andacollo'),(1542,16,'Añelo'),(1543,16,'Bajada del Agrio'),(1544,16,'Barrancas'),(1545,16,'Buta Ranquil'),(1546,16,'Capital'),(1547,16,'Caviahué'),(1548,16,'Centenario'),(1549,16,'Chorriaca'),(1550,16,'Chos Malal'),(1551,16,'Cipolletti'),(1552,16,'Covunco Abajo'),(1553,16,'Coyuco Cochico'),(1554,16,'Cutral Có'),(1555,16,'El Cholar'),(1556,16,'El Huecú'),(1557,16,'El Sauce'),(1558,16,'Guañacos'),(1559,16,'Huinganco'),(1560,16,'Las Coloradas'),(1561,16,'Las Lajas'),(1562,16,'Las Ovejas'),(1563,16,'Loncopué'),(1564,16,'Los Catutos'),(1565,16,'Los Chihuidos'),(1566,16,'Los Miches'),(1567,16,'Manzano Amargo'),(1568,16,'16'),(1569,16,'Octavio Pico'),(1570,16,'Paso Aguerre'),(1571,16,'Picún Leufú'),(1572,16,'Piedra del Aguila'),(1573,16,'Pilo Lil'),(1574,16,'Plaza Huincul'),(1575,16,'Plottier'),(1576,16,'Quili Malal'),(1577,16,'Ramón Castro'),(1578,16,'Rincón de Los Sauces'),(1579,16,'San Martín de Los Andes'),(1580,16,'San Patricio del Chañar'),(1581,16,'Santo Tomás'),(1582,16,'Sauzal Bonito'),(1583,16,'Senillosa'),(1584,16,'Taquimilán'),(1585,16,'Tricao Malal'),(1586,16,'Varvarco'),(1587,16,'Villa Curí Leuvu'),(1588,16,'Villa del Nahueve'),(1589,16,'Villa del Puente Picún Leuvú'),(1590,16,'Villa El Chocón'),(1591,16,'Villa La Angostura'),(1592,16,'Villa Pehuenia'),(1593,16,'Villa Traful'),(1594,16,'Vista Alegre'),(1595,16,'Zapala'),(1596,17,'Aguada Cecilio'),(1597,17,'Aguada de Guerra'),(1598,17,'Allén'),(1599,17,'Arroyo de La Ventana'),(1600,17,'Arroyo Los Berros'),(1601,17,'Bariloche'),(1602,17,'Calte. Cordero'),(1603,17,'Campo Grande'),(1604,17,'Catriel'),(1605,17,'Cerro Policía'),(1606,17,'Cervantes'),(1607,17,'Chelforo'),(1608,17,'Chimpay'),(1609,17,'Chinchinales'),(1610,17,'Chipauquil'),(1611,17,'Choele Choel'),(1612,17,'Cinco Saltos'),(1613,17,'Cipolletti'),(1614,17,'Clemente Onelli'),(1615,17,'Colán Conhue'),(1616,17,'Comallo'),(1617,17,'Comicó'),(1618,17,'Cona Niyeu'),(1619,17,'Coronel Belisle'),(1620,17,'Cubanea'),(1621,17,'Darwin'),(1622,17,'Dina Huapi'),(1623,17,'El Bolsón'),(1624,17,'El Caín'),(1625,17,'El Manso'),(1626,17,'Gral. Conesa'),(1627,17,'Gral. Enrique Godoy'),(1628,17,'Gral. Fernandez Oro'),(1629,17,'Gral. Roca'),(1630,17,'Guardia Mitre'),(1631,17,'Ing. Huergo'),(1632,17,'Ing. Jacobacci'),(1633,17,'Laguna Blanca'),(1634,17,'Lamarque'),(1635,17,'Las Grutas'),(1636,17,'Los Menucos'),(1637,17,'Luis Beltrán'),(1638,17,'Mainqué'),(1639,17,'Mamuel Choique'),(1640,17,'Maquinchao'),(1641,17,'Mencué'),(1642,17,'Mtro. Ramos Mexia'),(1643,17,'Nahuel Niyeu'),(1644,17,'Naupa Huen'),(1645,17,'Ñorquinco'),(1646,17,'Ojos de Agua'),(1647,17,'Paso de Agua'),(1648,17,'Paso Flores'),(1649,17,'Peñas Blancas'),(1650,17,'Pichi Mahuida'),(1651,17,'Pilcaniyeu'),(1652,17,'Pomona'),(1653,17,'Prahuaniyeu'),(1654,17,'Rincón Treneta'),(1655,17,'Río Chico'),(1656,17,'Río Colorado'),(1657,17,'Roca'),(1658,17,'San Antonio Oeste'),(1659,17,'San Javier'),(1660,17,'Sierra Colorada'),(1661,17,'Sierra Grande'),(1662,17,'Sierra Pailemán'),(1663,17,'Valcheta'),(1664,17,'Valle Azul'),(1665,17,'Viedma'),(1666,17,'Villa Llanquín'),(1667,17,'Villa Mascardi'),(1668,17,'Villa Regina'),(1669,17,'Yaminué'),(1670,18,'A. Saravia'),(1671,18,'Aguaray'),(1672,18,'Angastaco'),(1673,18,'Animaná'),(1674,18,'Cachi'),(1675,18,'Cafayate'),(1676,18,'Campo Quijano'),(1677,18,'Campo Santo'),(1678,18,'Capital'),(1679,18,'Cerrillos'),(1680,18,'Chicoana'),(1681,18,'Col. Sta. Rosa'),(1682,18,'Coronel Moldes'),(1683,18,'El Bordo'),(1684,18,'El Carril'),(1685,18,'El Galpón'),(1686,18,'El Jardín'),(1687,18,'El Potrero'),(1688,18,'El Quebrachal'),(1689,18,'El Tala'),(1690,18,'Embarcación'),(1691,18,'Gral. Ballivian'),(1692,18,'Gral. Güemes'),(1693,18,'Gral. Mosconi'),(1694,18,'Gral. Pizarro'),(1695,18,'Guachipas'),(1696,18,'Hipólito Yrigoyen'),(1697,18,'Iruyá'),(1698,18,'Isla De Cañas'),(1699,18,'J. V. Gonzalez'),(1700,18,'La Caldera'),(1701,18,'La Candelaria'),(1702,18,'La Merced'),(1703,18,'La Poma'),(1704,18,'La Viña'),(1705,18,'Las Lajitas'),(1706,18,'Los Toldos'),(1707,18,'Metán'),(1708,18,'Molinos'),(1709,18,'Nazareno'),(1710,18,'Orán'),(1711,18,'Payogasta'),(1712,18,'Pichanal'),(1713,18,'Prof. S. Mazza'),(1714,18,'Río Piedras'),(1715,18,'Rivadavia Banda Norte'),(1716,18,'Rivadavia Banda Sur'),(1717,18,'Rosario de La Frontera'),(1718,18,'Rosario de Lerma'),(1719,18,'Saclantás'),(1720,18,'18'),(1721,18,'San Antonio'),(1722,18,'San Carlos'),(1723,18,'San José De Metán'),(1724,18,'San Ramón'),(1725,18,'Santa Victoria E.'),(1726,18,'Santa Victoria O.'),(1727,18,'Tartagal'),(1728,18,'Tolar Grande'),(1729,18,'Urundel'),(1730,18,'Vaqueros'),(1731,18,'Villa San Lorenzo'),(1732,19,'Albardón'),(1733,19,'Angaco'),(1734,19,'Calingasta'),(1735,19,'Capital'),(1736,19,'Caucete'),(1737,19,'Chimbas'),(1738,19,'Iglesia'),(1739,19,'Jachal'),(1740,19,'Nueve de Julio'),(1741,19,'Pocito'),(1742,19,'Rawson'),(1743,19,'Rivadavia'),(1745,19,'San Martín'),(1746,19,'Santa Lucía'),(1747,19,'Sarmiento'),(1748,19,'Ullum'),(1749,19,'Valle Fértil'),(1750,19,'Veinticinco de Mayo'),(1751,19,'Zonda'),(1752,20,'Alto Pelado'),(1753,20,'Alto Pencoso'),(1754,20,'Anchorena'),(1755,20,'Arizona'),(1756,20,'Bagual'),(1757,20,'Balde'),(1758,20,'Batavia'),(1759,20,'Beazley'),(1760,20,'Buena Esperanza'),(1761,20,'Candelaria'),(1762,20,'Capital'),(1763,20,'Carolina'),(1764,20,'Carpintería'),(1765,20,'Concarán'),(1766,20,'Cortaderas'),(1767,20,'El Morro'),(1768,20,'El Trapiche'),(1769,20,'El Volcán'),(1770,20,'Fortín El Patria'),(1771,20,'Fortuna'),(1772,20,'Fraga'),(1773,20,'Juan Jorba'),(1774,20,'Juan Llerena'),(1775,20,'Juana Koslay'),(1776,20,'Justo Daract'),(1777,20,'La Calera'),(1778,20,'La Florida'),(1779,20,'La Punilla'),(1780,20,'La Toma'),(1781,20,'Lafinur'),(1782,20,'Las Aguadas'),(1783,20,'Las Chacras'),(1784,20,'Las Lagunas'),(1785,20,'Las Vertientes'),(1786,20,'Lavaisse'),(1787,20,'Leandro N. Alem'),(1788,20,'Los Molles'),(1789,20,'Luján'),(1790,20,'Mercedes'),(1791,20,'Merlo'),(1792,20,'Naschel'),(1793,20,'Navia'),(1794,20,'Nogolí'),(1795,20,'Nueva Galia'),(1796,20,'Papagayos'),(1797,20,'Paso Grande'),(1798,20,'Potrero de Los Funes'),(1799,20,'Quines'),(1800,20,'Renca'),(1801,20,'Saladillo'),(1802,20,'San Francisco'),(1803,20,'San Gerónimo'),(1804,20,'San Martín'),(1805,20,'San Pablo'),(1806,20,'Santa Rosa de Conlara'),(1807,20,'Talita'),(1808,20,'Tilisarao'),(1809,20,'Unión'),(1810,20,'Villa de La Quebrada'),(1811,20,'Villa de Praga'),(1812,20,'Villa del Carmen'),(1813,20,'Villa Gral. Roca'),(1814,20,'Villa Larca'),(1815,20,'Villa Mercedes'),(1816,20,'Zanjitas'),(1817,21,'Calafate'),(1818,21,'Caleta Olivia'),(1819,21,'Cañadón Seco'),(1820,21,'Comandante Piedrabuena'),(1821,21,'El Calafate'),(1822,21,'El Chaltén'),(1823,21,'Gdor. Gregores'),(1824,21,'Hipólito Yrigoyen'),(1825,21,'Jaramillo'),(1826,21,'Koluel Kaike'),(1827,21,'Las Heras'),(1828,21,'Los Antiguos'),(1829,21,'Perito Moreno'),(1830,21,'Pico Truncado'),(1831,21,'Pto. Deseado'),(1832,21,'Pto. San Julián'),(1833,21,'Pto. 21'),(1834,21,'Río Cuarto'),(1835,21,'Río Gallegos'),(1836,21,'Río Turbio'),(1837,21,'Tres Lagos'),(1838,21,'Veintiocho De Noviembre'),(1839,22,'Aarón Castellanos'),(1840,22,'Acebal'),(1841,22,'Aguará Grande'),(1842,22,'Albarellos'),(1843,22,'Alcorta'),(1844,22,'Aldao'),(1845,22,'Alejandra'),(1846,22,'Álvarez'),(1847,22,'Ambrosetti'),(1848,22,'Amenábar'),(1849,22,'Angélica'),(1850,22,'Angeloni'),(1851,22,'Arequito'),(1852,22,'Arminda'),(1853,22,'Armstrong'),(1854,22,'Arocena'),(1855,22,'Arroyo Aguiar'),(1856,22,'Arroyo Ceibal'),(1857,22,'Arroyo Leyes'),(1858,22,'Arroyo Seco'),(1859,22,'Arrufó'),(1860,22,'Arteaga'),(1861,22,'Ataliva'),(1862,22,'Aurelia'),(1863,22,'Avellaneda'),(1864,22,'Barrancas'),(1865,22,'Bauer Y Sigel'),(1866,22,'Bella Italia'),(1867,22,'Berabevú'),(1868,22,'Berna'),(1869,22,'Bernardo de Irigoyen'),(1870,22,'Bigand'),(1871,22,'Bombal'),(1872,22,'Bouquet'),(1873,22,'Bustinza'),(1874,22,'Cabal'),(1875,22,'Cacique Ariacaiquin'),(1876,22,'Cafferata'),(1877,22,'Calchaquí'),(1878,22,'Campo Andino'),(1879,22,'Campo Piaggio'),(1880,22,'Cañada de Gómez'),(1881,22,'Cañada del Ucle'),(1882,22,'Cañada Rica'),(1883,22,'Cañada Rosquín'),(1884,22,'Candioti'),(1885,22,'Capital'),(1886,22,'Capitán Bermúdez'),(1887,22,'Capivara'),(1888,22,'Carcarañá'),(1889,22,'Carlos Pellegrini'),(1890,22,'Carmen'),(1891,22,'Carmen Del Sauce'),(1892,22,'Carreras'),(1893,22,'Carrizales'),(1894,22,'Casalegno'),(1895,22,'Casas'),(1896,22,'Casilda'),(1897,22,'Castelar'),(1898,22,'Castellanos'),(1899,22,'Cayastá'),(1900,22,'Cayastacito'),(1901,22,'Centeno'),(1902,22,'Cepeda'),(1903,22,'Ceres'),(1904,22,'Chabás'),(1905,22,'Chañar Ladeado'),(1906,22,'Chapuy'),(1907,22,'Chovet'),(1908,22,'Christophersen'),(1909,22,'Classon'),(1910,22,'Cnel. Arnold'),(1911,22,'Cnel. Bogado'),(1912,22,'Cnel. Dominguez'),(1913,22,'Cnel. Fraga'),(1914,22,'Col. Aldao'),(1915,22,'Col. Ana'),(1916,22,'Col. Belgrano'),(1917,22,'Col. Bicha'),(1918,22,'Col. Bigand'),(1919,22,'Col. Bossi'),(1920,22,'Col. Cavour'),(1921,22,'Col. Cello'),(1922,22,'Col. Dolores'),(1923,22,'Col. Dos Rosas'),(1924,22,'Col. Durán'),(1925,22,'Col. Iturraspe'),(1926,22,'Col. Margarita'),(1927,22,'Col. Mascias'),(1928,22,'Col. Raquel'),(1929,22,'Col. Rosa'),(1930,22,'Col. San José'),(1931,22,'Constanza'),(1932,22,'Coronda'),(1933,22,'Correa'),(1934,22,'Crispi'),(1935,22,'Cululú'),(1936,22,'Curupayti'),(1937,22,'Desvio Arijón'),(1938,22,'Diaz'),(1939,22,'Diego de Alvear'),(1940,22,'Egusquiza'),(1941,22,'El Arazá'),(1942,22,'El Rabón'),(1943,22,'El Sombrerito'),(1944,22,'El Trébol'),(1945,22,'Elisa'),(1946,22,'Elortondo'),(1947,22,'Emilia'),(1948,22,'Empalme San Carlos'),(1949,22,'Empalme Villa Constitucion'),(1950,22,'Esmeralda'),(1951,22,'Esperanza'),(1952,22,'Estación Alvear'),(1953,22,'Estacion Clucellas'),(1954,22,'Esteban Rams'),(1955,22,'Esther'),(1956,22,'Esustolia'),(1957,22,'Eusebia'),(1958,22,'Felicia'),(1959,22,'Fidela'),(1960,22,'Fighiera'),(1961,22,'Firmat'),(1962,22,'Florencia'),(1963,22,'Fortín Olmos'),(1964,22,'Franck'),(1965,22,'Fray Luis Beltrán'),(1966,22,'Frontera'),(1967,22,'Fuentes'),(1968,22,'Funes'),(1969,22,'Gaboto'),(1970,22,'Galisteo'),(1971,22,'Gálvez'),(1972,22,'Garabalto'),(1973,22,'Garibaldi'),(1974,22,'Gato Colorado'),(1975,22,'Gdor. Crespo'),(1976,22,'Gessler'),(1977,22,'Godoy'),(1978,22,'Golondrina'),(1979,22,'Gral. Gelly'),(1980,22,'Gral. Lagos'),(1981,22,'Granadero Baigorria'),(1982,22,'Gregoria Perez De Denis'),(1983,22,'Grutly'),(1984,22,'Guadalupe N.'),(1985,22,'Gödeken'),(1986,22,'Helvecia'),(1987,22,'Hersilia'),(1988,22,'Hipatía'),(1989,22,'Huanqueros'),(1990,22,'Hugentobler'),(1991,22,'Hughes'),(1992,22,'Humberto 1º'),(1993,22,'Humboldt'),(1994,22,'Ibarlucea'),(1995,22,'Ing. Chanourdie'),(1996,22,'Intiyaco'),(1997,22,'Ituzaingó'),(1998,22,'Jacinto L. Aráuz'),(1999,22,'Josefina'),(2000,22,'Juan B. Molina'),(2001,22,'Juan de Garay'),(2002,22,'Juncal'),(2003,22,'La Brava'),(2004,22,'La Cabral'),(2005,22,'La Camila'),(2006,22,'La Chispa'),(2007,22,'La Clara'),(2008,22,'La Criolla'),(2009,22,'La Gallareta'),(2010,22,'La Lucila'),(2011,22,'La Pelada'),(2012,22,'La Penca'),(2013,22,'La Rubia'),(2014,22,'La Sarita'),(2015,22,'La Vanguardia'),(2016,22,'Labordeboy'),(2017,22,'Laguna Paiva'),(2018,22,'Landeta'),(2019,22,'Lanteri'),(2020,22,'Larrechea'),(2021,22,'Las Avispas'),(2022,22,'Las Bandurrias'),(2023,22,'Las Garzas'),(2024,22,'Las Palmeras'),(2025,22,'Las Parejas'),(2026,22,'Las Petacas'),(2027,22,'Las Rosas'),(2028,22,'Las Toscas'),(2029,22,'Las Tunas'),(2030,22,'Lazzarino'),(2031,22,'Lehmann'),(2032,22,'Llambi Campbell'),(2033,22,'Logroño'),(2034,22,'Loma Alta'),(2035,22,'López'),(2036,22,'Los Amores'),(2037,22,'Los Cardos'),(2038,22,'Los Laureles'),(2039,22,'Los Molinos'),(2040,22,'Los Quirquinchos'),(2041,22,'Lucio V. Lopez'),(2042,22,'Luis Palacios'),(2043,22,'Ma. Juana'),(2044,22,'Ma. Luisa'),(2045,22,'Ma. Susana'),(2046,22,'Ma. Teresa'),(2047,22,'Maciel'),(2048,22,'Maggiolo'),(2049,22,'Malabrigo'),(2050,22,'Marcelino Escalada'),(2051,22,'Margarita'),(2052,22,'Matilde'),(2053,22,'Mauá'),(2054,22,'Máximo Paz'),(2055,22,'Melincué'),(2056,22,'Miguel Torres'),(2057,22,'Moisés Ville'),(2058,22,'Monigotes'),(2059,22,'Monje'),(2060,22,'Monte Obscuridad'),(2061,22,'Monte Vera'),(2062,22,'Montefiore'),(2063,22,'Montes de Oca'),(2064,22,'Murphy'),(2065,22,'Ñanducita'),(2066,22,'Naré'),(2067,22,'Nelson'),(2068,22,'Nicanor E. Molinas'),(2069,22,'Nuevo Torino'),(2070,22,'Oliveros'),(2071,22,'Palacios'),(2072,22,'Pavón'),(2073,22,'Pavón Arriba'),(2074,22,'Pedro Gómez Cello'),(2075,22,'Pérez'),(2076,22,'Peyrano'),(2077,22,'Piamonte'),(2078,22,'Pilar'),(2079,22,'Piñero'),(2080,22,'Plaza Clucellas'),(2081,22,'Portugalete'),(2082,22,'Pozo Borrado'),(2083,22,'Progreso'),(2084,22,'Providencia'),(2085,22,'Pte. Roca'),(2086,22,'Pueblo Andino'),(2087,22,'Pueblo Esther'),(2088,22,'Pueblo Gral. San Martín'),(2089,22,'Pueblo Irigoyen'),(2090,22,'Pueblo Marini'),(2091,22,'Pueblo Muñoz'),(2092,22,'Pueblo Uranga'),(2093,22,'Pujato'),(2094,22,'Pujato N.'),(2095,22,'Rafaela'),(2096,22,'Ramayón'),(2097,22,'Ramona'),(2098,22,'Reconquista'),(2099,22,'Recreo'),(2100,22,'Ricardone'),(2101,22,'Rivadavia'),(2102,22,'Roldán'),(2103,22,'Romang'),(2104,22,'Rosario'),(2105,22,'Rueda'),(2106,22,'Rufino'),(2107,22,'Sa Pereira'),(2108,22,'Saguier'),(2109,22,'Saladero M. Cabal'),(2110,22,'Salto Grande'),(2111,22,'San Agustín'),(2112,22,'San Antonio de Obligado'),(2113,22,'San Bernardo (N.J.)'),(2114,22,'San Bernardo (S.J.)'),(2115,22,'San Carlos Centro'),(2116,22,'San Carlos N.'),(2117,22,'San Carlos S.'),(2118,22,'San Cristóbal'),(2119,22,'San Eduardo'),(2120,22,'San Eugenio'),(2121,22,'San Fabián'),(2122,22,'San Fco. de Santa Fé'),(2123,22,'San Genaro'),(2124,22,'San Genaro N.'),(2125,22,'San Gregorio'),(2126,22,'San Guillermo'),(2127,22,'San Javier'),(2128,22,'San Jerónimo del Sauce'),(2129,22,'San Jerónimo N.'),(2130,22,'San Jerónimo S.'),(2131,22,'San Jorge'),(2132,22,'San José de La Esquina'),(2133,22,'San José del Rincón'),(2134,22,'San Justo'),(2135,22,'San Lorenzo'),(2136,22,'San Mariano'),(2137,22,'San Martín de Las Escobas'),(2138,22,'San Martín N.'),(2139,22,'San Vicente'),(2140,22,'Sancti Spititu'),(2141,22,'Sanford'),(2142,22,'Santo Domingo'),(2143,22,'Santo Tomé'),(2144,22,'Santurce'),(2145,22,'Sargento Cabral'),(2146,22,'Sarmiento'),(2147,22,'Sastre'),(2148,22,'Sauce Viejo'),(2149,22,'Serodino'),(2150,22,'Silva'),(2151,22,'Soldini'),(2152,22,'Soledad'),(2153,22,'Soutomayor'),(2154,22,'Sta. Clara de Buena Vista'),(2155,22,'Sta. Clara de Saguier'),(2156,22,'Sta. Isabel'),(2157,22,'Sta. Margarita'),(2158,22,'Sta. Maria Centro'),(2159,22,'Sta. María N.'),(2160,22,'Sta. Rosa'),(2161,22,'Sta. Teresa'),(2162,22,'Suardi'),(2163,22,'Sunchales'),(2164,22,'Susana'),(2165,22,'Tacuarendí'),(2166,22,'Tacural'),(2167,22,'Tartagal'),(2168,22,'Teodelina'),(2169,22,'Theobald'),(2170,22,'Timbúes'),(2171,22,'Toba'),(2172,22,'Tortugas'),(2173,22,'Tostado'),(2174,22,'Totoras'),(2175,22,'Traill'),(2176,22,'Venado Tuerto'),(2177,22,'Vera'),(2178,22,'Vera y Pintado'),(2179,22,'Videla'),(2180,22,'Vila'),(2181,22,'Villa Amelia'),(2182,22,'Villa Ana'),(2183,22,'Villa Cañas'),(2184,22,'Villa Constitución'),(2185,22,'Villa Eloísa'),(2186,22,'Villa Gdor. Gálvez'),(2187,22,'Villa Guillermina'),(2188,22,'Villa Minetti'),(2189,22,'Villa Mugueta'),(2190,22,'Villa Ocampo'),(2191,22,'Villa San José'),(2192,22,'Villa Saralegui'),(2193,22,'Villa Trinidad'),(2194,22,'Villada'),(2195,22,'Virginia'),(2196,22,'Wheelwright'),(2197,22,'Zavalla'),(2198,22,'Zenón Pereira'),(2199,23,'Añatuya'),(2200,23,'Árraga'),(2201,23,'Bandera'),(2202,23,'Bandera Bajada'),(2203,23,'Beltrán'),(2204,23,'Brea Pozo'),(2205,23,'Campo Gallo'),(2206,23,'Capital'),(2207,23,'Chilca Juliana'),(2208,23,'Choya'),(2209,23,'Clodomira'),(2210,23,'Col. Alpina'),(2211,23,'Col. Dora'),(2212,23,'Col. El Simbolar Robles'),(2213,23,'El Bobadal'),(2214,23,'El Charco'),(2215,23,'El Mojón'),(2216,23,'Estación Atamisqui'),(2217,23,'Estación Simbolar'),(2218,23,'Fernández'),(2219,23,'Fortín Inca'),(2220,23,'Frías'),(2221,23,'Garza'),(2222,23,'Gramilla'),(2223,23,'Guardia Escolta'),(2224,23,'Herrera'),(2225,23,'Icaño'),(2226,23,'Ing. Forres'),(2227,23,'La Banda'),(2228,23,'La Cañada'),(2229,23,'Laprida'),(2230,23,'Lavalle'),(2231,23,'Loreto'),(2232,23,'Los Juríes'),(2233,23,'Los Núñez'),(2234,23,'Los Pirpintos'),(2235,23,'Los Quiroga'),(2236,23,'Los Telares'),(2237,23,'Lugones'),(2238,23,'Malbrán'),(2239,23,'Matara'),(2240,23,'Medellín'),(2241,23,'Monte Quemado'),(2242,23,'Nueva Esperanza'),(2243,23,'Nueva Francia'),(2244,23,'Palo Negro'),(2245,23,'Pampa de Los Guanacos'),(2246,23,'Pinto'),(2247,23,'Pozo Hondo'),(2248,23,'Quimilí'),(2249,23,'Real Sayana'),(2250,23,'Sachayoj'),(2251,23,'San Pedro de Guasayán'),(2252,23,'Selva'),(2253,23,'Sol de Julio'),(2254,23,'Sumampa'),(2255,23,'Suncho Corral'),(2256,23,'Taboada'),(2257,23,'Tapso'),(2258,23,'Termas de Rio Hondo'),(2259,23,'Tintina'),(2260,23,'Tomas Young'),(2261,23,'Vilelas'),(2262,23,'Villa Atamisqui'),(2263,23,'Villa La Punta'),(2264,23,'Villa Ojo de Agua'),(2265,23,'Villa Río Hondo'),(2266,23,'Villa Salavina'),(2267,23,'Villa Unión'),(2268,23,'Vilmer'),(2269,23,'Weisburd'),(2270,24,'Río Grande'),(2271,24,'Tolhuin'),(2272,24,'Ushuaia'),(2273,25,'Acheral'),(2274,25,'Agua Dulce'),(2275,25,'Aguilares'),(2276,25,'Alderetes'),(2277,25,'Alpachiri'),(2278,25,'Alto Verde'),(2279,25,'Amaicha del Valle'),(2280,25,'Amberes'),(2281,25,'Ancajuli'),(2282,25,'Arcadia'),(2283,25,'Atahona'),(2284,25,'Banda del Río Sali'),(2285,25,'Bella Vista'),(2286,25,'Buena Vista'),(2287,25,'Burruyacú'),(2288,25,'Capitán Cáceres'),(2289,25,'Cevil Redondo'),(2290,25,'Choromoro'),(2291,25,'Ciudacita'),(2292,25,'Colalao del Valle'),(2293,25,'Colombres'),(2294,25,'Concepción'),(2295,25,'Delfín Gallo'),(2296,25,'El Bracho'),(2297,25,'El Cadillal'),(2298,25,'El Cercado'),(2299,25,'El Chañar'),(2300,25,'El Manantial'),(2301,25,'El Mojón'),(2302,25,'El Mollar'),(2303,25,'El Naranjito'),(2304,25,'El Naranjo'),(2305,25,'El Polear'),(2306,25,'El Puestito'),(2307,25,'El Sacrificio'),(2308,25,'El Timbó'),(2309,25,'Escaba'),(2310,25,'Esquina'),(2311,25,'Estación Aráoz'),(2312,25,'Famaillá'),(2313,25,'Gastone'),(2314,25,'Gdor. Garmendia'),(2315,25,'Gdor. Piedrabuena'),(2316,25,'Graneros'),(2317,25,'Huasa Pampa'),(2318,25,'J. B. Alberdi'),(2319,25,'La Cocha'),(2320,25,'La Esperanza'),(2321,25,'La Florida'),(2322,25,'La Ramada'),(2323,25,'La Trinidad'),(2324,25,'Lamadrid'),(2325,25,'Las Cejas'),(2326,25,'Las Talas'),(2327,25,'Las Talitas'),(2328,25,'Los Bulacio'),(2329,25,'Los Gómez'),(2330,25,'Los Nogales'),(2331,25,'Los Pereyra'),(2332,25,'Los Pérez'),(2333,25,'Los Puestos'),(2334,25,'Los Ralos'),(2335,25,'Los Sarmientos'),(2336,25,'Los Sosa'),(2337,25,'Lules'),(2338,25,'M. García Fernández'),(2339,25,'Manuela Pedraza'),(2340,25,'Medinas'),(2341,25,'Monte Bello'),(2342,25,'Monteagudo'),(2343,25,'Monteros'),(2344,25,'Padre Monti'),(2345,25,'Pampa Mayo'),(2346,25,'Quilmes'),(2347,25,'Raco'),(2348,25,'Ranchillos'),(2349,25,'Río Chico'),(2350,25,'Río Colorado'),(2351,25,'Río Seco'),(2352,25,'Rumi Punco'),(2353,25,'San Andrés'),(2354,25,'San Felipe'),(2355,25,'San Ignacio'),(2356,25,'San Javier'),(2357,25,'San José'),(2358,25,'San Miguel de 25'),(2359,25,'San Pedro'),(2360,25,'San Pedro de Colalao'),(2361,25,'Santa Rosa de Leales'),(2362,25,'Sgto. Moya'),(2363,25,'Siete de Abril'),(2364,25,'Simoca'),(2365,25,'Soldado Maldonado'),(2366,25,'Sta. Ana'),(2367,25,'Sta. Cruz'),(2368,25,'Sta. Lucía'),(2369,25,'Taco Ralo'),(2370,25,'Tafí del Valle'),(2371,25,'Tafí Viejo'),(2372,25,'Tapia'),(2373,25,'Teniente Berdina'),(2374,25,'Trancas'),(2375,25,'Villa Belgrano'),(2376,25,'Villa Benjamín Araoz'),(2377,25,'Villa Chiligasta'),(2378,25,'Villa de Leales'),(2379,25,'Villa Quinteros'),(2380,25,'Yánima'),(2381,25,'Yerba Buena'),(2382,25,'Yerba Buena (S)');
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
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Buenos Aires-GBA'),(3,'Capital Federal'),(4,'Catamarca'),(5,'Chaco'),(6,'Chubut'),(7,'Córdoba'),(8,'Corrientes'),(9,'Entre Ríos'),(10,'Formosa'),(11,'Jujuy'),(12,'La Pampa'),(13,'La Rioja'),(14,'Mendoza'),(15,'Misiones'),(16,'Neuquén'),(17,'Río Negro'),(18,'Salta'),(19,'San Juan'),(20,'San Luis'),(21,'Santa Cruz'),(22,'Santa Fe'),(23,'Santiago del Estero'),(24,'Tierra del Fuego'),(25,'Tucumán');
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
INSERT INTO `sisusers` VALUES (0,'superadmin','Super','Admin',0,'21232f297a57a5a743894a0e4a801fc3',0,''),(1,'admin','Control','Operario',0,'21232f297a57a5a743894a0e4a801fc3',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\�\0\0\0\�\0\0\0�X��\0\0 \0IDATx^\�]t\\\�\���\�J�^l\�E\�aLǴPBM\�B�C	-z/�wBI�\�H�\ZH c�\�e[�����\��޼7\���\\V�\�yw_�y�\�m߽cilmKbo|�E<�\�ظi�6�\�\�(*(�\�\�\�#d�\�\�p\��\'�F\���\�\��;n\�G\�\'���ڲ�����<�^x�9�\�ag�\�ʠ�n�g{����\�nC\"�D\"�H�o~Q>ο\�8��Sw\�3���\�r\0!`\�q\�\�x�\�W�F�\��`��w�]�q�����ч0th\�v�~_�\�.!1�{�Y\r�>U�Tt[��\�\�HB\�L�6��ע�\�\�mҴIEB�B\�\r�\��Ӊ�8\0{\�5�\'O\�\�\�\�ѳ\�\0����p\�������� �$�!�\�b�@\�\�=\Z�v�\��\�bB\��\�Å_��N9��u�G\�ۯBR\�\�\�o\�k����R\�fm_D\"6n	�\\E\"�\�)R�������X-8�ēq\������G��/�\�o�p\��u�ؼ���\�\�\�A(\�/\�򝐴 �=��\�p�\�t���\�`I�ۙj�����r\�\�\�\��\�ϕ!ڦ\�\�/�\�\�\�-7ߨI\rGW�ZZ�#�(\"\�0�\�\�voӁ\�\�\�H�%�I8���\n��~mm܂��6</��J��S�@\��\�O��?�\�\���\�\�.\�&I�G�p��=��$e�Vߋܩ��\�\�m#�@$\Za�\�춴�#�h[ܫ\�gU�\�?�\�\�ڄ�\�z\�v��\����J�\���ӟa֬\�X%\ZV=�K[��F0\�\��x�T�(�`�Z\�H��Ǣ1�b%\��Lb�N\�\�g�\�N�?\�\��\"�k[6\Z[\�9�\�\�ڂ�歠1}\�G���\�ۖ�\�i\�\�\0!pv\�AX�~}zp�Y�\��AF&㛽UN��rǣ\�\�J0\�ܲ}�$2IE%�\�\�.w\�\�,\�g��S#\�t}�\�Ͽ� �m/\�r9G4`\��M-\�hjk`����\��E\�\���q�\��`k\�V�.4�W8\�\���\�\�\��hyy�u�&�Y�\0Ir\�F\�\�D*Ф��K��\�nψ%z6�l��z$5`\�\�4\�*8(NC\� ��\'�$bg\�I\�t\��B�#5���Mm��>���>o��i�8>\�@lڴ��1��ġ\�\�r\0	ԁ@ ��Լ�0N;\�$��h�\�ғIF\��&Lg��\0�Y�e���\�re\�V\�A>��7\�k�@�J��B�\�\�\�\�\����w���\���\�𡵣%%��3^�v�Y�\�j�c\����	\���O\�\r*��&�a�Z�(8ز�\�rftr\0M0�OH��	\�\�*.���y�Hj�T	\�)Ꝙ\�t�YPTdtk�\\.W�]�q��@H\�\�{u�\�3�z\�\�oEG�G�C��׿vy\�\\=�\�\�\�\�O`���1h�`\�\�E\�\���\�\n)$Dj����\�C�#�H��4��Y\0C\0��?�b\Z�\�\�<K�t*MH�\�\��3//O�J2\�\0v�8�T<�\�f�\�\0!�\�7�\�\�D�Cqx\��\�8Է\�#\Z�\�\�\�\�賞�>	�\�=\��O�A�Q\�-0��_�_yY\�Dp�+�:���	Jק��\�f�\�\�\�\�\0��	<\�T\����N�\�,\�2I\rR\�hB�k�zE\�\��w�T&y̒BG\�#\�<�]��\�n]�#U\�\��!���e+����݂\����\�\�\0�^��W_\�\�X:\�E:�^�)��m\�b\��0�	�F��\�vC\'R�[�S��Fx0�V\�8�\����\n��%�?�\�ʢ�\"\�Q\�*/$��|	&(\�\�d\�ё�O�^�|~q}_�\�v��/p�\�uk(r\�\�>��y\�a�Ƣ(+*GYq��\"�AN�w{[�A\�\�\�ً @p�#gp\"�\�$$�X4��݃U)��\�,��A}!U\�hk��ނ�// �\�.�FL^:�$\r5��\�+6�\�\�#��ݑ1�!\�$�\�B�\�߆�z\�ײU+��\�3\0!�|\�)S\�\�֊\��\"��i�(�^՛\"�r\�zm\�)&fr]��o�ɢ�fi�u\�\�\�m\�B�xN��m�1\�EĩdCe\�\n��M��\�#\n�\�@._\�\��x\�\�\�\��Gb�ݦ��eP\�g�в]��O\�\�\n�\0�g&���Zg�\��\�\'rA0d�} \�u��\�k8.TW�\�\�\��h�Fc�<\�21^9a�h\� �H4Yh�:�Bɞ�H �\�I�ufв~\�\�O\�hD�aҵl$Mj�U�p]��!-_��+�`\r\�8Dc!	�\�s\�\�9h�8�\0a���x~!	Y�$�����-[�:}M��	���\�����y�+����PS�\�cE�S�;�^zy���\�et�\�肢a�YXM\�\n\�Eܹ*t},\��\��\�%\�\��`�*�\�\�y�Gq\�a8z�ɸ�\�\�\'�Y��\�\�.���N�cAH,!E.�����{z9�;\����V{L����v{�Q\�-\�܏��z\�0l\�\�&\�\�l��yX�\�\�{FBJ仳&$QgǱ7f\�_6�\�J�x�\�n���A�X\�r�\�!wmB̀$iCR�\\\�Bb�\"A\�5a^�\�>�\����\\f��9\"O\0�-�\�%�\�\�]���G�\�ں�l�:\'�\�y���\�\�FYa��UYP\�\� �t����q\�\�Rv64\�6����^-\�\��E����\�#%_�&x @ \�GyQ�v#��~7\'\�\'iC\��\����tl[G\0g\��\"6mUT#V\�`\�q\��c\�σ�#���DC!U�@\�\������\�\�֧Ȍ9\r�/���w��%\�r�5\�\�k՝	�\�X�%l\nc�\'D2\�j\�\n]I��\�-\\\�\"v�\r(�\� \�(\n�.�*\�w\�֡�S�\�tOz.\rIa`�g�D\��;P\�-1\�T\�V\\s�Q�\�\�R�\�\�W\�W��DR���#�vL\�t9R\�>q1V)6f2�\�#=\�\�\�3f,��=��\�ʉ\�s\Z �L��\�kV�0�y���������K]yU:e`g�\��Z|�V�8�vc\nk�7Mv\�\nڕMA�\")@��@QYZ�s�;\0\�\�?�Wl�MO�\r����\�\����{=z��>��6\r\���S�\���(j }���\�C�c\�\���w�c�\�?߬6�����*DݭL\�\��o#�;�h�5#`\�}��J\��\n-�yکl�,Q\n�I�A��m�\�41�4���7J��+\�SW�``Lu�w��F6\r3%�H\�ë+p\�O�\�\�Lc\�E\��_\�gsW�\�Pr;�P\��o�4\��P]Q�?\�y!~�\�\��컵|\�\�%n��\�+P\�\�i(���@{��*�$�[f껸��«\'�u��;�>8\�Y�\�A��$�l(�\�A�V�\\��&doR�@Etx���l\�%1�	ʿ�=.�\�$\\r\�a�<j�\�j�\�m�k\�7=�6_�\�S\"�\�F�(.8l:s�%F$��b�\�\�8`\��\'���qD\"	�c~�{��\�c��\r[�p\�\�O�\n�\�l���<m��t,h	Sq���\�[P^Q�\�˗g�,;\�����=H\�XRrIR��D���=\�y}h�����b�\0�\�\�>��\�ĭ���9\�Ȫ\�Ъ2��%�Ym�\0n�\��\�\�\���|�=�\�\�e�\���\�\���dR	\�J�\�Fy�20D#�\�?�\\�\�C\�4C�u{�-Z�	?�\��Ѕ\\n7\�\�Ec�V\�(�e�\ny\"	�}I\�\�I�\�\�o?,]��\��23�\"\�\�\nM��\n\�Wu��[�gE/N0\0�T�xE\�|\�7i4.<�\�?e�\�b�\0iQJp��)��\�\�\�\���B0EqA>�y�y\�>��C\�\�\�\'�<�\r[\�A`�X\�{\�p\�u\�\�:�Ts\�\�\�\�\�~\�\�p\�?\�0\�!������\�\�҂�\\̆te�\�Z\�\� �0쪚uŕW\�\�o\�\�ho�Ss 6�\��)S�e+\�ê%�\�\nE\�UkK��f N�����T\�dX��M�p;�;lN:t:�\�\Z�T\'�ts1�\�\���\0��\���v�z̘X������eD�O��	\��t.F��/O;GQ���\�Dyߖ}%��x\�\�w�0H\�r�]i�\�޲����Ç��\�s�\�cn�k\�@.��\"����\"ϕ���R�\��/J�{Pa��Z*s���邴\0�QMI0 j�q\�>�p�{���\�`K\�Ba�[8��4���|<KY�	��w[�\�4?�\�APx���\�F���Θ\�\�\�\�\�eNW�_�\�Ɯ\�ȡC\�\�\�Ɓ0z	�z\�\�y �\�d\�ݶ�t=��t�\�ˋ�0q\�`�\�8Ŏ�u{��J�5�� PH�e��������Y�t�\�\�ˁ\"����g�lm��\�Z�\�%$ޙ\Z\�zq��\�\��?;\�,ج6,�\�a\�+V�\n�ho%:�\���	:}O\�1\�ҽP��\�n%0����aĠJL[�#��h0�]C]\�\r�GŦ\�	�<��\�\n�\�\�b�g�,l�Y\�J�M�߯��H{�3o�G��/حnx2lA��>\�)�H\�=5�\�\�\�\�~�7\�~{{<\�6�fN\�\�N��\�?CQ~��*(,\���\� �^ɺ����Db[n�\�\�.QΑ�\�i�d7�Fò�B\�1v��2N\�i -�~a�J�\�iE\�\�$�\nc�E?\�\�\�2���0�_\�h\�&�$\�EH�\����x糹���\"�f��R�R)3|\����Ē+�\�s�\�\�9�QÆ���ŕ\���\�P���g@\�@Z�(�G6\�i5jlk�\�\�\�\���a\�:\�\��\�G\�b\�\�\r�4r:0j�\"��\��(\�Yg\�t�k��J]�eC� �D!w��\� b\�\��W��$�Q�(�\�L6Jo&JW\�\��\�\�\�%�a�\�Q\�)Ԍye\0U>� g_�Cr \�\�YSÓ��l�\��(*.D[k;�\0\"K��\�:�\�n\�*B\�\�\�\�\�wu\�N�9L6�&\�\�\�d6�c\�iu\�T�\�$:\�IrI�}\�\�G\�\�=/����2Vq͔y\�\�T\\J\�}�/�1\�*��\\k9a\�.\r�Ϝ�\�f��YzԷ\��f�`���lwptjs�$��1�%]M\\\�\�&��P�4	��Mf	��r�ٯ\\\�\�\�\"�\�$I\"&�\������Y\�q,jr�a���K�?�3\rs g�r*��\���TQI0ij4\�\"	\�ON\�Jݮ�\�J�)\�)\�\�\�{]Аz�9���(ѾI\�b�\�,\r�\�H�$\�?Nbkb��\�\�TW�Qv�`��9\n\�|�\�v}]=�x\�\0d\�\�Qhlj\�ܻ\�!a�9�RjI4\�?ш\�\�rڱ�\�G{\��,ϓ\�)s�AU�T/�,9[\�\�\�R>KK�)��\�\�;�y�d{]���\�r��\�\� I�\�f\���F<��ϻ�\��J�\�\�\�!9_674�\�6\����\�Ъ*�T�VkƝ(;\�l��A�\�㢓\���\�J_\�S\�\�oR\�C�\�`0H\��\�H�pᦍg�\"\�z%n \�&&�M��\�$rWk��E��������P�P�\�\Z�ޟ�Üߨ\r*Wrd���A%}D:����x\�\�f{h6��֍ޫ\�I3\n84/V\Z/�<\�5\�B�{(B�\0�\�Yb(\�&Ix��d1\�m�\�\�r\�/\��-m�LMv���\'\�P���\�\�^�\�\�\�\�@��(\�E\n@�җ\�\�\r\�\\���\�]��`��w���\�;\�\�\�C7$�A���wY�%A2��,�w*E�l)N��ܻ\��Mܲ�\��\�\nu�\�\n��.\"\�J\\\�	�z�\�5HAB�Z\"\��=��Cp\�/O\�\�\�\����q�4^�T��2����\�\�53\�U\�K\n9.�JUrI��]�d�v\�[��\�\�\�\�j�$�(,\'<Y\'�t2�{�\�\�_\�:2g\"G`ɋ\�\�\�\�\"d\�Z;Z9�\�?O\�\�\� _\�\�5\�%	\�Iksh`R\rtV�tz�\�cF��r\\D\�\�_cҖ\�\�\�l��1�Yr\�[[[�V�w\�ࡘ�ha\�_\�v:3�\0�\��rij������î\�\�\�m�aQ.�>\�a�!�Io\�Z��\�\�\�`ӹZBmJ\'\�$�R\�N��\�9]��8IB\�n�go\�A��1�z���\�d;Dx�j7���\�׬ٞ�ңk\�@D�� \�J+J\�\�o4�d\�/�\�=\�tON\�8W�{h&�I�\�\�Tѥ��A�>E\�\�(Fo�B\'Q\�\�\�C�*�ma��(RDf��\�`\��d<�s��f\�U\�\�;%N�����;�\�!\�\�>@\�a qLM�@�>�\�w\��$5^ad\�J�\�+e�z\�C�V�$L\Z���\�%\�&��*	�\�`Ib�A.Z��-�x�8\�y�\�,�@\��\��ν\�q-�D\���ˮ\�>a\�\���\�2D���B���,J\�C��Կ�\�0IM4��Z�c��6y��\�0\�\��\�\�E\�}g\�\"fډ0ԅ�W\0$]�} \�-����2\�fl��/����\�!lYbX�]�c�e\�~\�井$��\�Q�\0Ir�7�>\���~\��!Ix�)�ɛ�=O��\�\�}�+cR\"\�t\�\r�/���8t\�L�H���bg�W��}\�\�^#\�μ\�\\��!!����1�\�Y�ȟ\�k�j�xs\�C�.94	�\�#�\��$�����3�3==�xYg\���f�S~9a\�{\���nĵ7\�\�\�\�l��rB�P\�\�\�\� �K�(�]=X\�l�e�1\�\�(��j,M20���l�_�p�\�x%^b�fɒB�9x�S�l:\����%�\�aB���\"�f/\�v�aj�\�q�^\�4\"y�3$Y�} ��R�\�u\�mo��:]\�\�{\�\�Hg$\�Ql�^>O������^�B\��S%GzD�r�\�$i�Y\�\�\�8\�R�F$��f��q\�O�\�g�\�1�\�]r T��\�\�jb\�gO$I@\n�\�;\�\�ە\rb��5I\�Z)6��f��.l\�&�\ruX�������,)�?\���뗨\�\�&��lsȑuU�h�)7K8�S(�Y΢,#�\"�L#\"\�`F}���ӫ�dq�wH\�\0�\�\�--\�Z�ye�\0RR���9Xڂob\�\�L\��ުTI!\'K��*4�a�=X�(��\�\�$\�oz�\\� \nj4�鴔3\� �R� \�39d\�P\�[�[\���\�Q��\0\�͝��y%��\�8b�)x\�\�\�o\�7�.�#{\�1O띲�7��^S\�%�\�%�E�]V��HҊ�n�\�q�jWZ\�\Z\'Q2wnD}\�\�7I��y\�F�$�\0Ƞ\���~\�\�\��^�\�\�\�g���\��\Z@�+\"�$��\�?\�o�\�i 5�����`\�f�-�\�\�=7T[�%�E��\�t\�K%$�꩒�W\�/V\"ܮJ\n)^�E\�\���\"D~���%h_}\�/�\�K�; \�\� \�}��V\�\�J\�Œm\r�M\"{ä��\�d��\"\�l�N�C�|G�9l7@z3z\0\�]\�t9Q.\�,AN?b?<q\�O{y\�lOWԭ�\�A�h�!�\�BC\�ޤx�Rr\�5I\"lTls�P�\�\�\� �\�\�\�6\�n�d;\�2\'��d¢�����\�g\�#�\�\�;9=�8�(գ�G��Kj�\�0\�=H������\�{&\��\r����K��\�&��\�\���\�gn� \�HR�r\"��\�*V7F}@Y)�\\�\� �#�t)�Av\�Dl3+;\�1���l\�\'I;L\�\�$E\��Ce���rc|D�o\�O\�䅈��rܻ�}\�n�t{\�RO W/\��X����%ȎHz��)�\�a�:\�W�,E\�\�g�|\rC���F\�#s��\�j�sS�H.p��k��\r\0r�~��}�UJ^�\��\�%\��A�C^(U\"��4/�����%\�,\rLZ��\0��\��̒B\�<4q��W�\�\�\�Qcyw$K�\\v�%x�տh�^��\�/\�\0���P>���=8����G�f	��j��9]*�4G�T\�J�_\�l\\�W�s�\�M\�Bl,%�\�x��x���\�!\�h.Y��n�N���*\0r���\�w�֍�n�Cs&B]�,Q�����9��\�mI�\�\"j���\�\�`W����\�,�k=�\�$)����tC&�\"Bԇ�8Z\��\"\�C\�1��^i�\���jym�\�@�w7դ�\�ۯ�\�\�t��d��B�\�{\�\'\�\'\�뗧D�e\Z��\�s\�\�UJ��J��&\'E\��(\�O�\�J\�#4�\�l\�H鵚+W\�H�%��{�\�@5�\�ֿ�#)�\�\�f$\Z\��s����+!\0r�ɧ\��/<\���m\�+\��~\�]���* \�\�:����g�r���3�z\�Sh���t���W\\\�\�=f4ʢ\�d#�\�*{��\�h�,M�\�\nC^�Eo+,2MFe\��t\�\�\�A\�\�\�r�\�{\��X���U�\�\�t:y�) �͘�\�&I \�e���\�\�X�$I	e�$�\�b\�/Dӂ\��!\�@-JM�KQ�\�\�S2	�j(��,myӞ\"���\�Dl� r|vgf1��Ǝ�\�\�b!��)JĐ\�\�\0��[\�3��>}\\D�\"��k�\�~FuO/�(l��ij�\nYa ij���\�.��x��C\�DT59\�s,�С5ݽ�v=>\�$�?��3�>��\n.fOB�y4CCS���m>?|A�޸�m�\�K(Z$\Z�\�\�\�>l6+��Q3h\0��=�\Z3&��\�aW\"\�\�J��bڣPqw�ۭ\�Jc�����$G8��E+�r\�f��:���m\�\�\���:\�pؐ\�v�n\\^�\n�ϴq4@/!\�\�Y� b\�#��v\�]�\'�Q}�\���\�o~�\�B\�\�d��7a��\�:d\��X�\���d\r��\\���\�\�\�ꃯݏ�ü��EI\�Kr�Q6L\�4��\��\r\�\�\�3�w\�gG$\�\0\0 \0IDAT��!����=�P������\�[\�-]�\�14٦1�C)��^\'����o~4_~�\0[\�\�\��B@\�q_j��\�11=�\���~\�m\�9�\�&�~;\�6䣢�\�\r��\�C�\�\�(�*E�ӵttw�6s���\n,[�*��c\�9	B�ޓN���8E\�Ae�Ñ�<Li\0Hcs���\�X�rK�P8\�?�#�H O�D\�\�N7<\��\\n�V\�J�����#�in\�ʓ\�\�ڌD<ƇQ5z\nI�\�\�q�X҂�����χ\�\�2\�z+W5\��)��{�,�B�\�\�Ϣ���D�d�c�O\�\�fGAq)߻�b \�;ȮKר�ts}\�;��5m�J\�\�fe\�\�_QoW\\\�\�v���S\�\rǙ\'��|�v �6�].\�\�B\"\�\�=|\�D�\�XQN�Qm^�G.?���=,Z��7סF��v��\�)��xSv�5#F�z��?�\'�\�WzU\�Gb�o\�оG\�h�>˓+���[6�Cc\�4\�mA\"c�A��\�mp\�\�US�k~q*�VW\�{\Z\�l�NY]n\��5�ॷ��\��DG \�\��\�j��|`5\�T�jH\r�\�*\�t�ӂ��\��æ��>�XM4���KV`\�\�%ؼi#6�Y�X,�]��H��\�f\�O67�ӁSF\�򟝀�~��0E\0q\�\�`/��\r\�]�܋�/�tǊ�,\�s\0�g&\�biA\�t˫�\�\�/B\0dp�^�2-h��\�c�\�2K	�ۍ�f\�s\�<cF�H;,<5^��li���\�G~�0{RZ�E�G\�o\�\�&ۗ_|�����V�O$�\�F\�}םo�Ǵ��y\�*�3P��	Ͽ�/���y�ȭ�j0&\�7�\�k�L�(�\�\��,���E^\n�i�1\�i��cq�\�q!�犕k�ҫo\��Y\� ҷ\�&��\�E�wS\�I\0[�bJF!�O:�$���|:k&O��Ŕݱ�\�$@��>M�͚��t_�˩��\�k2�H,\�\"��v�)\�\��\�B�כ���-�\��)��\�&�:Q��k\�k󪼫-[\��\��/ハ>\�W]��n7n�\�,\�?}|\�G�#\�_}�w��5�r;\�Cp\�yg�z`�V�-)�T\�s�**\\�TP\�3eH*`%�2=���\�<������\�v;\�\��D\�\�c��T<��x\�\�\r\�¨kjޱ3?˻\�$@.:\�||�\�5W/���\"�$��A8h�\�\�{<x�[�\���J)�T)�E����/G̓	�D\"\�A �\�\\ѣ���[\�\Zp\�u�c\�ڍ�\'�\�\�3p\��3x\�^���6l\�\�9�fF\r��\�-�\�\�ٸ���\Z\�=b(��v\�y��Br<(ϧ>�\���� �J�d��(I�ލ�[�\Z��ws\�\�_\�;�N\'\�\�T����\�\�\�w�\"\�A�<Xe\�eX�|y�Sv\��s\0i[�\r>z��≷�J|4$$�iP�\�\�7^��=<cM\�D<�h(\0�݉XLQ�\�@�����:\��\�#� ��6�v���h�\�*�s�pk�,�v\���\��\�\�w?�Ͽ�cx\�\�<\�F\�\�\�\n}\���A\�;n�\n^o�B�d\����j&|A\�:�\�[G�h8�D,�\�����8ll��Jy.5�\�b��ƈ6\�t��:���\�߸\�\�R�!�z=nV%#�8\Z#\�ud�y���1�^~&*�9�\�w,��[Nd\�\�7�c\�b8\��8\�ncZ�\�\�\� {L��\�~��qB�ztM=�J\��L��($	#	���V��G3��{�r���`�Jwt�͆.��,\�\�$�>u\"~�\��\�\�g�a,	D@\�\�@�I��\"\�\�<U�)p�Dcp:�a�\�\�҈��KWH\�\�$	]\��K�K\�/�\��ˉh<��£�\��\�ycb��X��<{ߣ�\�\'\�@ֿ�4/�/�\�NC�\�\�0�\��\'��\���\�{���\���I�\�\�\�-mhinEGG\0\�ͭ��`sK{�\�.).�7?�%���,Eyqb�d�\'�\�\�PT�$�\Z? �X�\�RW�N=�\�\�2?σW��[T\r���A,�9D\"IA_+�Vգ\�pa�\����\�\�چ��vE�F�\�\�t�����\�\�)--\�I\�N޼�\'��\�/OA���[�D\\B\�TLed\�\�(j�\�C\��q\�M(\Z�O�\�h{��\0��\�c\�o/@a\�\0X�vT�����\r�\�\�;����\"���g�v\��{\�\�n\���\�\�Ƿs`\�F\���V^Q��\�\"x\n\n�\�R�x\�\�\�\0_k+B�6Д�G\" Y\�\���J\'�~#�Wc\���p����#���Ta���+�6�!�<���x\�d\�v�r\�8\�\\}��H\�	\r	ER�IT$-\�~ll\'a��\rش���\�HU�}\�\����P�E%(��\�m���0��\��q\�::@�wP#)3a\�HL�6!\�c\nw4\�Y��ﻔc<.lV\�\�z\\���\�v{+\�z\��hټ�\�:X\�L��]\r\��=\'\0��\�\�кd�N\�\�\��݁�Q\�qȯ��ףl-��DK\��!\�\��cO���U\�1{\�D\"Q>\�&�j�he�W9J�)�Ī%1\�\�O��َp8��\Z<\�\�\"Xm6T�`\�Vl]�\�M\�|��QC1q\�0��X+\�\�dc��\"$�\r�}1\�ܜ�;\�\��#x\�\�_��\��:�z\���\�����\�9\����c��oh�n0�\Z�5c\�-�\�\�/��\��k�o��^o!\�J(\�9�f�����J��\�\�� \�\�,\�\�\�0XJK�pԑ3\�r� ���7<�d*]�\\\�N�[\�Ƙ\�\�4�>uOԭQ\�\�aS�\�\�\�\�\��\"9�����\nxK*�iɷ\�/�@\�\�\�8���\�\�\�6���3�|�\�\�إkfk8>�\��\��:\�D�\��N�A��\�[�X8\�k��ڋ��\"�NX�p�\�CP\\Z�Ҋhj�\��\r�\�\�vI\�⹨]�.�\r�\�9EE^$���l���ig��C!z�\Z�/�\���\�A3PT@\�\0�uK̀\����b���+(\�\�G<��($Ѩ��\�\�6Z��_�\�Ņ�\Z7�\�O\�\�~?\�|\�i4\�m\�?\�C\�\�\�2T\r\�\�u�\�y0q�>\�\��Q2�`��\�Dc}cZ���Τf٭V\�y\\\�\�\"\"\��\�,8}V~�1�s\�!?����\�{�\�GW\�)\�\�Mv:@�uk�\�+0d\�^������J\rÿ��9.�݇�z�1w��\�\�9����7\r!�b���x���K������\�\�\�_q�JD\�͆��f<q\�up:]py<p�<hokAaq	\\�<TV\rAIy%B\��9\��\�D#v���\�#l\\�\�=e��z\�&4�I\�m\�8H1D~�\�8��#��5b�\�\�7>\�\��7�\�\�\�W)���jV�p\0�H\�\�^��\�b\����1|}�\�\�}�\����\�\���\�\�+\�\r�c$A��`%\��ƀ��\�\��\���\�\�<.��\�V�\�CX�d>�ӳ5z$,v\�>\�TX\�\�\�y���3�K�oDQ\�w��UR��`u��+�r+���ظh6Z\��\��`4o^\���x��\���\'X��\�1��c�u�b$ZEH��6���a���|I?��>\n_|g��>���8ѰF�hmiCqI��z/[�㯽�7s�\�7M�}�\�{x���-mX�f3F��|�\�+�x2W�5+�\�\�\�I�@�c׼7��1?ؗmg^`w�\�L\�\�F�*\�[/\��I�Û@�H���T�\�\�|����ٻ�I�D����|�X�f#�nh��\'��\��ۅ<O>\�n�\�\�+\�E,\Z\�>ڬv\�_���\r\�\'��=Ԇ\�b/J\�(\����\'>R.I\�8��0\�\��\��<���ڤ�\�\��bw\�\�p�\�\�q\'���\rM�����q���5H\�t2#\�㆖\�\'�\�c\�\�k�\���XŊ�ؼ|>&��98��g\�Ym�K�-�����^Ô#N\�\�9�\�q9\���F�\�s�\��\�7\Z\�,�;��^�\r[\Z�q\�\�Ī\r[��i\�\�\�o\��SƔ��\�{�\�O\�z�=Q\�!\"u�V8A��\�}��ķYm\�/(\�f/f£\�\�\�\�Q�\�HP\�u�\�\��\�\�\�b�=\n��\��\�\��c\�j\�\�~\�\�;�v6���<8�\��p\�1��5뵇\�`�.9�\���y\�\��q\�|�&��HFC�&�*b�\�\�(;�\��\�\�C�\'��\��r\�\"<}���\�m�9і?��W��O\�\�\�0�؉P���఑cq\�w�¢�g(\Z\��\������\0g��\�K��\�\�ąW�\Z�.\�{�\Z:�^���(Ť\�o�Ӯ\�S�4\�\�[\�ā��\�\��}FL`�Bsa�\���[3iga�\�s\0q{�1h\�4~�\�\�u�j\�{Ν�\����+��^���!����\�XW�6q4�~�\0�\�׮ی��\��\�)�\�F�ub���\�\�{36�Y���\'�\0|1W{Ad�.ǐ2/\��{�.�\��;Aa\�\���:8�\�\�\�낿���p\�a�\rv��6��\�EW�\Zʋ�\�7\�,��\"׵�Z�\�>\��o\�\�\'�\�`)���(\Z[\�*�D|�Lx�PP\�e�,y�(�v\�<�\�YU�;XSۈ5�\r�	w\�>\n�D1r\�D\r L�\���8�?W\�z�heI\�Y���{1�J�\�x\�\n���\�\n�\nr\�z\\I\�~�&DB~���E��vD`�`�V\�\���\��\0�à��\�\�7o\�\�U�Z<\�\���\�^�\���uu\"\0~�\�S]�8�3\�\�/���\�6O&6\���\��\�\�OY**)Ƿ�V����j\�{\�0�\��<@\�\��;����#q,�@(��\�:䭟\�\�+�1m�Uց^}��uО�\�3W���-}���\��\�\�\�\�W��ӎ=�=Xt_��I6\�\��\�E�p؉��\�8ԟ�\�F\����d[�cI|1_�t�\�c��5lkD�aL\��`�\�\�W�c\"h�A\�8��\�\�\�V�q\�%\�\�l+\0�6\�\�k�F2�\�gh�W\�8\�=�U�\�\�A����_\�SP� �(��\��1�\�a�\�o��F+\nI��\�j�EH\�:\�\�\�Pעd\�y�Ϟ��\n)R\�\�\�\���\��?t	���֚�xB	5���g\��|\�~� �n��6n啛Vâ�<�>\�\"Q�\Z;\�_}+\�\��(\��%�\\�9\�\r\\\�tB\0\�)(\�s\�]O`\�7�q\�E�\�\�gH�^���\�\��\�s��5s\�ix�\�\�9\�L�:��I\�c�3�P8\n\�\�bG���Ŵ��\�u\�j7¡�D�6l\�\�\�}9x\0\"\�Kr\0��8r\�d�\�x��q&�ږ�+#/K&V\�w\�\�y�_\�Mz|9o)�x\�\�cf\�N�)�\�STGy-\�=׭^���9q��%f�l��\"$	\rܲ�pş\�\�bq2@��\�p���\�ϯ�U����D\�\�*���jO�U�a��\".IR���\�\�\�p�]t�a�Y\�\�%�=D\�1Y�ο�63^�	�\�M�4�Fr\�%3�\\�V��P2��\�&�����/\�%\��\�w�Rir��\r\�8���4\�H�cR\�(�\�Lf\"M\�]H���.���q\0�߬[�\�=r\'\�<Z\Z�8�CK4\�\�Qd�3���\�\�#\�AiM�>D�#� R��\�5�\�ng\�\�\\�-T��?��\�Ɋ�\�\�\����\0g�b�Uz7@Ҭ\�2@�\�z�\'\�\�b��~��j\��\�\��vkO��G_>s\\�\�\�~�T���\��p\�v)E\�/XW\�TL>�<�C�\�\"@8��\�\r�Íu��*�@U\�Q\��\�?�UU�\��1Ӄ窡�[;\�@+\�_\�`�w�$с��\�;\\\�l���[ԭTΓ�6����_ރ�\�V� \�;��`�E��&4T���\�\�\�p\r����\���Ky�\�aX�x>\�|�)|�64n\�\�j^\"FY��\"�\\|�\�p\�)q(�U\�\��ϟ�ơ3F�\n��k�B�\�;\��\�_\�QM\�-\�q��~�=.~\�-t\��\�G�����C&)i\�2@XC\�m�\�C-�y7,����XT�\��Gg�\�\��\Z.iĜ��\�[�e����,<���\�\�\��\�mW_\�%@\�y���j���\�U|�Q����v\�\�Ǭ��H0���~�*/CQ~>���C(C�\��\�\�\�q+v,6>�@b�\�مK�鎇�\�??�\n??\��w\�Q�����<R��XP���9�x�=\�\�\�\�\\�r�\�ڶ\nq1\�\�S�\�$�Ʀ6��w��\�\��\�D�?����\��%ge\�<\�x\�<\�8\�\�9ݖ@�i�J���\\\���1	�*�\Z\�;�����}<N;f�rN2�O���x�2�V�bGM��ոa%O\��y�\\�\nl\�\�y\�Y=T/\�\�^������O7�k��v-J���\�n\�\r�q\��!\�ц\�6Dpڱ�����]�\�V�یso|,\�P\�N�\�R]�n#�Z[\�\�\�\�n��Ӥ#\08�T@\"EŴ��{���\�� J�\�T4\�j�zE��&����y\�x�&TU�!\�\�waYj\��\�\�$�46\�\�_\�\�\�}�\�S(\�\�W�IOrА\�M6�B#\';�$��%�<\'M\��\��B4��\�\�\��\��z�G�\r\�\�Qlh\���\�S�\����]�\�^��~��ZD�6!ަ�\�Ea�1�d\�oi`\��O\�=ny��ӻ��\�t�\�C~,x�\'\�\�U\�ʄ\0Y�\�\�X�\0�\�F��M\�V�Ni�9\�����\�r\�o:�ӕ-bBe\�gjdj�I5-W]ڵ�B\�g�оRȀ�%\�B\��~��?\���>Ɓ3&\��k\�\���\�[\�.T\\����(�\�?\��9�q\�ON�?=Y9��Q\�;\�(�|���v9q\�MFM\'�KU\�\�.8i]$\�k7\�\���o.���I(+ƛ��IVr\�&�Q�[�5{�\�i��VXQ�aӔ8�Y��z�׌A\���H8�0�O�~���\n; ���\��ʆ�f�UÆ�\�A\Z0r\"3<\�|�������̦%sXҌ\�\�@\�\�P\�D4]\�\��]�G|�5F\�ʭ\�\�$\��\�V\��~(zʾO�\0W�\�nE{���Ϲ���\'o�{L\�\��\�\�\�ST\n�S\�Q��r�y�WrT�\\\�\���H��������\�\��-\\\�H\�%Ð2!U\�\0��	LJ�mo\�^w\�c�5�{�{��/\�ъX(�5�@\�\�\Z=˾��9\�M<�\�܏\�\r+\�\�wL\\,W\�h�8\�\�n��\�qpN\0d\�\�7!\�Ǩ�0\'��E\��U�ȋԄ��e\�\Zl\\��ir\��g��\�\�}\�ŇP=��wcf�\� ��j��j\0@K[�ۥ\'�	\�1m���חj���~#�\�9�D�^���RE�꥿�\�ON;\�p\\u\�\��&�0T\�7��vȏ)�\Z\�\�(����\�\Zq�\��Ud�.y\�\�Z�n@��\�:iW\rE\��hڨ\�\�8��Y\"`\�\�H\�́3\�@\�����\�ݎ��\0\��\�sh��L7!P8=y\�\� ���A\�o\�\�w��u\�\�i�wa\�X�	oVw����\�P!Q�hh\�DTHL�\�܅Kq\��J�\�\\�1\�i�˦U(��\�%����Z央�\'_�H���L��}\�\�)R�F���*\�&/YW�\�����c�qn�^\�\�!N&#�)�3C�>Y3�Ӓ�a��ɕ���\0塯y\�^��J\�jBu�^\�\� �����W�1���BW�Nf\�:�*E\�$�L��*\�\�\Z����қ�j\�&�r�L\\�������m\�z\�Uq޻\�\�\�OFz�\���\��\�,\�x��w�tځ�Uݻg�u9@����s:1L)��V|�1�\�d�ے�5 $=�t\��\�Fck[\�\�A��ms��\�@AY%�N\�[�K\0�V!6�bQf~\Z3���w/=\�/\�|\�/]�\��\�<�\���\��A$s7\�\��G��\��x\�k�$�d�\'\�\�\�k�e#\�SX�j=�]zt/�jQF\�9\�=�&��\�H\\y\�Y�[�H�ʻЪR%S�o0u�҃��~{\�Eڥ8᪣\r�\�zԮ��Y�\��D\0D�X\"���7dbN\�90$\�;IZi\�\�G�4\�\Z7�\�\�H��.8�\�\��\�+\�\���l��\�\�1}ʸ\�\�@�#�)9\��|�\�z�9�\��\Z��\�H��� \�ڨ\0��\�%}�\��>\�gm\�+��XW��_���֫.���w\"HW�\\\�\�L*8\�.X�Ko|�/!\���1\�\�!ۃlR�I# )Aݲ/?�ӝ�q3�\�ϴ�Q�����\�	���� ���\��(b�D2\�\��&���S|$\�\�\�\�,�\�e��P\���b\r/��\�\�݄0Rύ6�Z�F�\�n2\�\��\�\�\�\�\�e�\�\�\���{�\�H\�B�-\r\�\�!/\�Bt\�qs}�Aݨ�\�?��\'^z��ZO?x3F��V93\��2]W\�\����r\�\\z;�44�x�h��� \�\�0{��\nK؝+���A((L��E����p\�\�@聈\�۶�+�;�h�\�\�2PhuY�\�ǜqH\�Y\�\'u�h�\�\�͇\�K�;cq�c~�?��Ɩ�=\"�E��:R��\�\\[�z��<�^z�$8D�h�\�\�jD� ,\�uI�>b�}B\��\�_�\�\�@�~P\�;z���WvF\�Q$?�\�W��\�W\Z\nU\�ѡ�v\�B~Ÿ\n˫5j;\���ߑ|a�+/�Ú\��ҩ�\�^���2��3�WU�\�\�Bv�V\�/��#�HAih\�!�T-��﫽$��b�+rо{\���\�3IHL+iZɑaG(�\�>�j\�|\�9�\n8~�\�\�kݴ��\��w>�\0\0 \0IDAT��2�\\PM`E�ǘw�\�w��뷯h �؏���\�&ѯ+@�r�4�V�w?�>�z\�|<y\�EZ\�\\�\\\�D�wImnk�e\�5���\��D\�L(�H��\\H��A�S\0���Hh\�*�\�� \�[5u�\��Y\�\"}��{\�5,h\'re���u�Y\'\�Õ\�\�2I)\�!&J\'�Rm��\�\��׿}\�Wep�R7�\�UӉ�޺Y�^\�-�D�Ԙ�����!KR�\�VAB\�:�\�G\���~�A�T%���\�\�}4��K<�\�wX�\��^Bt!\�\�%5�R��lY\�\�\\�\�@*3�Kd{\�Z\�8^�rŋ%�+QO?yhώ!g�\�g�\rBb9\�ք\�\�5\�\�\�N\�\�+����{�~�=[\�(4�f\�;=m01}\�\�l{\��\�\�����/�������N��Z�P�\�\�7\�\�ۚhU��J���L��Z�H^\�u�Bߛ���\���O�\�M�d��y\�qڏ�H��K{�\�\'���?�q���/��ǳ��^\�5\'�\�\���\�{�ϣr��\�E\�ݢ�CQ6h8�C��\�j�n�WpW�Ƙ�)|�\\j9\ZA`$�ݕ���8�[s=�>d�o^6�W)\�޲J\�$\� ��9xፏ��%\Z\���2cG\�``e)���o|�iOB\"n�o\�\�9�`\�\"=Co\���8ﴣ0}\�h\�\�иX\�{��mۼ��X\"6��9\�\�\�͒W{���\�M�{�������t�ֿ=&�\�!�\�\�#�e��ʌ�ct\�\�\��\���5\��݂���\��N=���:k\�x�7)\�\��!�P=n�3��6�9 ��!O�:�f0�V;����O9	zP\��:qo..-�W���Vr�\nw�L;\�\�\��v>�lo\�&\�N����(\�@uO>�?`�(\�c�|x�1a�\�1;6�\��\0\�\�u�2���*\�\��\�g\�֐v�U%�(�\�TE��\no\�]��\�j�1S\�c��qPg�#Uj�	#�\n�̽�.� \�%½K�q\�\��B��h\�lݲ.�ܺ\��\�Y�Ѓ.}�rD��`\�\�9#O�Z�$�[\�7�(\r\�\�5\�N�\���#[���D��L\�҄!*��a�0f\� �4�՘fchGl`����q\�~�\�\�-��\�[,�62ߕ\�\�a�\��|zk�$�fU�w0k�\"�X�	�\�m\�>fZ\��(p`E)�q�	#�_wZ<F4d��\�\�\����Ҿ7J�]6/g8W���\�\0!�\�\�\�.�;\�\�j�,��Cd�P-\�\�u\�h\'\�y���\�u���\�ȚjR��\�	�V|a�\�Tq%\�a�9x����\�(Zj�\�*K�f�Q\\V�\�\���(��\nS\�\�\�ıb/���($K�DV\�\���\�9�v���\�~���\�K��\�ޥ\�AQ㌮\��\�\���v�\�\�=�\�8T\n��\r��.�\�\�\�\�xO^�v�ȟP��\��g(\�(��\�ҥ�\"H�\�\�9M���A����CTUG\�ўA\�\�GHm\�+_(%Ic8N�UwX\�q\�uz5`\�\�!_+\'��m1z\�#jŴ\�>i��\�*\�P��.\�<@��j\�}�\\}1][���p�j\�$� �\�IW�7���{%y�$��\0���g�$Bb(%}�B�y\�&�\�M�rY����D\�ѼK\�NQBb(�\�C�$\�B۬�q!i@d���ެlƒ��$A�{w�AǦ�\r�9~�+t���\�\'\0\"��(%\�\�6,�͆����\�\�=\�ή]\r�\�wӊޥ1y�Rl�����{\�T �d \�V9^Qo\�e\�(IB0\�\�\���$�\�3I\�U,K�\�M\�\�)\�%�����r\"��{W�\�zL�,7�V)�f�\�A2M\�\�O��d4�V�оh���/�\�r��n���|M\�\�m� ��G+���_M\�\�\�h޸\��8�k\�\�+Tv����X�8��e.\Z%��?�\0?\�g�Ut\��7f.�zѺ5z�G	�P\�|\�\�]�\�W\�k҃\�]_��\"\"gD~u�����C٠(22��޽\�,���F	�\�~t\�R~� \�ր`k�\�Q���+����b`b�\�we/����&AD���*qE\�(u���o��w�X\�G\�\�c*\�\�MW��v\r&�c.�\'7�\�\�l�\�} ���?�E+n->�-%\�\�Љ3R\�\�\��\��Fy\�\rt\�[+��V�gE}jX�P\�D�\�\�\�/�\"\�\�l\nQ����	����R�Ay�7\��}:N�g\�\�0\�3�\�fe\ZKAo߰x\�\"�8�1\�E/\Z@N\�����\�+�:$\�8�<��bu\"\�I:�{����a�}��8�ɣfPg��G�\\ь%(�\�Ѹ~)\��FƱ���(g\�\�v�&�\0U�� lOٸSލW�D� BJ\��\��a\�\�\�n���\�$��T�Us>\�Q�\\(\�\�\�.x,\�v�\�ln�)	\"JWդ��3Bti��x˫zf���j\���t6�0�5\�� W�ƕ�ZR\0B/����i\��>\�\�Np�RG^!\�#��FNB�v�����!I!A\�6�l�h��m\Z�D1rH!Jv�\�\�\"@P���S�\�s\���|�~\�(�\�%\�Y�r\�\�\�I�.�?${AH���Y\�\���yW�e�\�JnT�\�[6�)\�r�j�V����ۛ�m�_s#�M��T	D���\"ȨG\�;�e\�y\�,U\0)\�r��|Q[ W\n1t��}J�P\�H���\����\�aش�9o���F�\�\�Ox\�\�Ĝ��͠�<�ԕ��X<4u[jW�~\������\�H;\�OE\�\�\�0\�0��\0s�\�i\�|L9\�L]�\�6�\�Œ\ry�K����H�\�e�A�3:F\�L/q80j\�h�\nժt�}\��\�s\0 Y��\��5�&�\�\�dF�Q3\�\�\�\�\�پl\�8���q������\�ҪY\�y6��o\\:ӏ��*AdoW\Z\�!\�\�R���\� ��!�BW\�\�\�\�5�N:5?֫�w��;�\�>	�ŷ.�\�a?<F�]1\�\�~�\�vH�6�\�Ţ����q�������͛֠v\�w�\�5#��I\�޴�pc�;\�1q����I�X\�Z��{�_\��h�\�\����G�ǩ���\�/�vx�2\�\�c\�g�i-x�t.����{�W�ns�L�]a�Id��y\�*4m\\w�\rV��ޒrζS��\�I���:�[���QR5����\�\�{\���Zn�� \����Z\�]\�QW\��0��ǖU�hoŔ\�^\��5r��~�5��\r���Cw\��6�I2�o\�\�P#\�����F�v���E�PʸkX�.O{��\�\\��.\�hC,�l@+4�v�\�\�\�+\�\'�K�\�I4��\\\�\�\�\"\�2���:Y]KaPq���\�9S\�j[��\��a�߱\�\� g\�1/+K����\�\�@b`��X�f\�=\�\�fj\�\\\�T�Ni\�\�R��n�(�$]]�^i�\�9ŝ\�pG+\�\�s1���@\�w\0	֭Ų\�\�\�֔m^����u5�\�yh\�M�s*\'˸��!OD	|8X���<Cfa�\�+\�<%�Pf�>�\�d\�V\�\"�n\�\�\rl�� `Vs�/Eҳ\��\��ӹ�)�\�y~H\�\�!ʳJ�o�oN�\��d���|�ʝ2\��@Ĺz�O��)��0 �ڔ\�(���\���#@V�t#�M9ҝ�3�հ�kD\�\��<�ç\�,d[D�r	���\r�q�\�m4�z�4�ZP\�\�p�����kq\�zF�^�WDлýb�����\�\�\�~�٢xQ\�\�\��_*SY�B*�\�A\�\��\���-�g*Ek)6��S�E�\�R��1��n��N\�\�\�Qp�L�P�99�\�\�~Q6hȄ\\Hަ-+�d����t!dI\"\�\"�\�\��\�(i4�䟤�K\�\�\'�-!rӍ�\�r����\�\�xQ\n�����W�Ͼޚ\�\�x�z7;��~�b\��n�2ttں�Y����e��{�+�\�Q\�\�j	\��t6G��\�35o\�8�I\�\0\�\�\�5U\�2P��@*/ڴa%\�\�\�~\�\�CW\��[�,}\�2 \�\���tu{�\ZC\�}\�3娧�E��u-7\�t\\\'D��T�]\�Z�rϕ\���(_�e&fŽ\�:�Z��?<E��ǳ\�>wL�U�o]�F\�uH�\�e��\�\�\�ER��\�AD=�D1\�5�#\�\�L�#\�\���4�\�\�5J\�	�Frh���\�YQ�jշ�E\���0\�\���\�\�\�v\�Y� b[7�C�˷q~�(��ζ\� !��-\�-��\�\�2�0ݾ \�\�^��Y\�=zȽ�\�J\�\�޸dN\�\�\'�=`\�o�%W��Pu\�ݛ~����Ȣ �d0I m\�\�1�\�M\�\'�s\����C\�\\)6G\n��GsJ�w���k^\�ɺ�=\�\�~\�\�\�\�o�\\.D[ES\�\�\�N\�\"�M!�Q�������\�B.��\\\'��K�K\�\�K�Y�ۺ���T����\�u�6�\�z]-9b\����;\�ڙj|Qy���\��e�C[\��c�PtN�{�=\�{^TN\��I�\�ZD\\[�/Mԭ�#���)\�V\��<��LP�ڕ�ymv�\�G&��\�Ր�}\\�8hG����f\�Y�\\��ac����8��B�9VH�zb?u\�\�\0�N.}�W��\�1y����۪�\�9#t���EL��xJH�;xB�i&B�=_\r͛*W+�\�읒�Tv��i��%��UjU\�2p�\����\�@\'	IUK��\�\Z0�\�\�w��w%�W�����O7k5��Y\�E�6���hUN$� ω�\Z����v��}1\�r�b��\ZI\�d\�+,f5\�SXW�*}L!�\�}\�e��.\����=��}\�_��r���\r\":�\�\"�0l\�>�b\�\�#b�\'�\�Hۚ#\�:w\�P5D�K�\'J�\�j{�,\\�<!z4�!]\�(��3s��ý�~P~��ߠ`\��\��\�eT,\�(o\��Ĺp�= �/�Zd(U{\�\�H�n�h+]VHÝ\�[�M�V��\�\Zj�\�\�\���F���>V�ȭ	\�\�P=}��\�\�%$u^�.\�Ii\�\�8\�IKa7g\�Iw-P��\��\��\�%�nXg��9\�#m\�߀��t���+�\�*׶j\�Q��<i��ǺwC\�\�OY��.�-*0\�\�ld�ʅe��t��\�;%\�3e\�(�ԧ\�w\�\���w}��\�NN�}�|O\�=M\�.QS+ҲC&\�ɶH��\�\�\�$$�`㪆y\�֍\\ݝl#*\�@.\�X(�H8\�j���	G��\�\�1UB\�,a2\�wt\�P��u��396.�\�\�*�9\��~L�\�w)�\�\0�n\�^\�\�>�\�toA�H���\�\����lM[\�Z�	�x��\�\�1\�\�\�B�\�/.��l�&o\�\�l\�^�n\����9�\�9�m6�YO�\�\�\0BEy\�+_��A2b���j�F�i#�UB:�Y��\�f\�Sv�N��ӱ\�sC��\\\�k\�\�\��F�s��o\�\�APO\�%\"��\"\�C\'\�\� \�\��IP\� ��\�ƅ\�s\�\r\�&��\rK\� �\�࠱\�e��\�7p�m���\�FI�\�F\�S%C�8�6\�{�f\�G\��KD��\�Q\�h��E�\�\�\��\�s/\'{w��\"\�)�i����\�\�\���rG\��\�Q$�\�n�;��u\\����\�I�h�t\��\�Ɛ����\�P�\����r;j~t�\�\�\�]���\�wD}�d��{\�a�\Z7qѹjf\�:\�yL�\�#�P\0\�D\\\�\�\�]>\�N�z�4\�ӽ\�\�\0�F�\�$\�\�ym�碠�\ZU#\'���@B���s5*�eV���\�\��F(�.\�-�\�װE��D͏�ޥ\�]�\�\�\0I3B��\�%�\�N\� �\�A*W^W\�\�\'~�\�D\���g����\�\�Ͽ#r7@2�6\�%\�>ʙsU#\' ���U-�ǻ]\��\�\�ޠ\�꓿�[V/\�>\�72��n�t23�6�ÊW\�;Ԍb5���\�%��!r\��b�;\��U\��\��\�\r�4�mS}\�y\�/X�y+\\^/Nq�\�Dk#���\�\�\�\Z�\�\Z\�\��#��v\�|\�n�*\�k�\Z�45`�Ip\�\�~���\�~���>�\"͆6���=�\��`�\�A�9\\��	\�\����m�6h\�4ˎ���n�����v�|Nݥ�r�h���\"�xcC=Z��p���õg�޻���wD}�~3�<�`��t�\08�thmi��%+1zP:Z\Zycʲ!#9����P^	\�G�K-�@8\�g{�J�R.I���\n|��OwGi	\�\�+�Ȓ�7\�f\�\�8j��ԛ��,�<@Hj\����\�\�_bx\�Px�J���\��\�k�\��q\�*\�\"|������sݷ{�=�y\�R����\�\�%\�A\�K\�\�\�t\�OK\Z�\0��\n\��Պ�\�l\�T�S?���l\��,�,�\'\���vi�,Y�?��4��c\�\�1�J��^]8�?H�!V\�\�c��AC�Xloe�a\�\��(�\Z\�R\�\�r\�\�\�1�\�O�D4\�\�J��-[6�i\�jNU�k;mŢܻ\�;\���E^ؤ@(�Z�Q,]��*+�\�uW`\��]׈\�e�\�\'�\�\'�F~~>Ǝ�H4n��\�X�?h�\�ƺ�\�wPn�[J\�%:����\�	+��\"\�&\\��\�.�vW�H��]pI\�#�G\�ۺ�+\�gr�����ʢ��ܶ܁ok\�P1�\n6�E\�|����\�aò�\���\�\�\�\�>b���$@�y\�)��\�\�8���A85�\�x\"�v_ךjmif\�\�>\��uT�<o\�k����57�q�Ҫ\Z䗨!��\'!\�\�Y��\�VI&\�^�{\�c1�\��-\rh޲�\�)�́��\n.\�mn����\��-�;(.-�\�fE�75�\�;�i\�\�\�7\����W]\��|���K�\�\�y��,ð�!(-�@$\Z3��u��|,9H]inlD�׋�<29O~a\���j��^\�i\�s\n.�VrRy\�.QYQ\\P#\�5w	\�HZ�F\�+\�kA{s=K\r*CJ�\�+*\�8^\�\�\�\�\�\���%�`GJ+*X\�r\�\�(�\�v��]�\�7l´1��\�\�7\�Rv\�.\�I7܆\�k1nm�\�E,fT�x%�D \r[7s��\�n\�8/p�d ���\�%�\�*\�\�@\�=��B�����;O)?J�ɦ��\�v����V\"Tz�\�\�/\�jG_��\r���bvI�8����f+\�\�˕j?٬V�X�rj�⽇\�\�e@�K\0���Sn�5�Ǝ\rO�1i5�4��\�\��͍\r�E�p\�\�!�\�\�a.�ߐ򋲛\�\�D%l\'D��&`�;�\0A4|���\��\�Z\'^]fP�~8�.����\�\n@�07�n!�+W��\�\�\�[�ݱK\�� ��o��U�iS\'!��\"�$1\�\�;\�\�\�\�؀���\\2œS��\�J���HdAj\�?+���Շ�\�{\����\�5yDclg|>��W�\��T�T;�\�Kd\�xK�.�\�n\�\��\�\�\�AүB\�8��\�S�NB<iM+9\�ݷw��\�X��\�\\˪�\�aG4�\�BR�A\��\�\�\�$\�\��$}`��v\�\\<\�<\Z\�9\�$$�n�ՃX�x<nx\\\n� ]�\�E�\�n�\�~�~Ǐ���\'�\�)��%#8ȋ\�(�:\�\�8�;xf\\+��\�I{+\�EuYe\�K\�\�p�p�ĆE��i\�z\\��\�a*3\�D8b\�A��U���nejv�p\�b>\���$\�\0Y�z\r\�\�D�%G&��^~\"�D[�OQ5::\�ko�\'?/pZ-���6Ǡ�{pq\�ȭ\Z\�h\�qy�u�3iI\�(j�\�c�\\���\�ܞ<6\�\n�\�kG�\�Bo~Fj?����\�E�\Z$� $9~t\�-\n8��4�;D\"QV��\�\�\��xP�\�\�\�#�P3|4�\�5\n\nk.\"E��)���yq�ڕ�em)6��\�$IRV9\0v�y7ܝ�Z��\�-I,X��\�%I�\�\�իq\�\r�g\r\�\�\Z\�rm�h8�I\�n\�Yӌ���E��!�\�}R�h����K\�E[�yY�\�Q\�\�\r�\�\�K0�.�H\�d\����\��(�|=�Ò\��\��K���Ȓc\�\�Ɉ&-i�U�\�m�u�1~_;�V�xg\r�\���(F\�93\�8�j��\\���3e<�J%&�z�\�\�>\�{[mx~m�\�>�E\���\�t�^�\�G�\�,�_\�\�@\�/\0\�\���#��:1X@\\�\�Z(A���a\�Z\�]�m�ӪKQ3u?�\r��Q9S*<�]�\�?CO��\�R�T�\�\�\�==iDb\\7�+,\�܈[\�\�1W�xr��1\�Y#ZJ2e�P���x��<@\�\\�Sn��m�qc\��[P�P$ҹZD��v\�\�	4\�oE�ǁG4��zFN?�ض�PQ&�b�0ם\�}�A��-�\�\��.\�[m�\�F�Í\�\���7o\�e+K\�\�P6` \�P(�\�Us��\�hoǲ\�+@�\�q�>\r��\�W\���\�`iA\�(,*B \��\�&\n;Q\�}-͈;�\�\�\0\�L\�\�c�\"T(=m��G��\�\Z�$�\�\0H�ɦ\�Uif���\�\�\n\�\�\�\�/\�\�e�b��� ���E�ei(\�kx=n���2H\\Ng�7\��@H��x��g\�<,X��\�Ow�O�[�A�-M��\����\�ڙR\"�M\�L\�Ύ!5���No\�-\�wy�\�\\߈77\�\�η\�Fiy9\�s\�`Ϧ\�d�7MM\�jDr<t\�i8b\�}.��\0!�\�7��\��/�����\��>�\�\r_�b8���\�e57|~?��\0\�l������\�L�\�nň\�\�\�-Y]����՗kh��n��MB8\n�7�+��\�GP]��|/�~�j�o>\�5�\�\�\�!��a�\������\�}&�\�\��\0\0�IDAT\�y\�cN�@��\�\���Y_\�s\���(/+E\���w-\�mV��\'Y\�%Y�-\�v\�G;XJhH\�ƖRXatm�\��X���3\�\�tte\�\�ʶ\�\�zzX��uc�����Z m\�MYJ2;q\'~ɶ$˶\�o\�;�+}�lK֧G\�\�st\�D�~�~�\�\����\�n�\n�9\'<q	{��/�\\�`A�7\\�<��B%\�Z@*�\�f\�,�\�Q9�Z�N*\Z�f\r���;���W�cr�S�v;;l\�\�\�\��\�\�\�\'##p��`�Y��q�)�f#��Y�����EȲ~��\�\���^���݋�\�,�r\�\0��v\�:��\�>+&�\�~\�6��� �\� \Z�bt��p\�&8�\'�\\`��\��Y\�\�mV|\�?_\�dzz\�pN��\�)�2��k\�h�������^\�:10�\�G,\��A��\rւ�I(Çz�l\�6�Ծ\�ة�eL�\�\�+��o\�����M���\��GD-�\�ݹ\r��w�`\�.�D\�\n	\�}\�u����\�j\�p\�\�\�\�!6�nF�\�^1>6�X4&�\�\�t\"��\�\�R�\�$4K�K�=�\�^��`>_P\�\�\�8c�P,U��M\�m!j}�X9��\�Zʁ��^Rc�i3\�\�t+Z[-�Z�{\r�\�Y�:\�\�=_yB\�F:7vɢ\"\�W�V	�\�x�9\�^��\�^AQ\�\�\�h\�|ONM�\�C2�S\\l\�؉�\�x���\�Db�^>�^��11Ա�N�]�i%`�w�\�Qa�\�\�ւ@�F>y\�\�3<^�s��\�]�qEo\\\�V(��\�I\�d\���&�Kw�!KtJ\�\�+�J��\�K���Z\�@jx�6��\���\�:�:��V/�w\�\�)�\��\"9ER��]�<*�\�Z[eCX�\��lЗ	B��ja�ena~��������w���\��օ\r�d\0�\�ѷ�ʛ?C�k�X\�r��a�]�\0F2�l\���F@�]�(]\�WG�[�p8��\����\�?r��V�Bgg�p\�.U\�n��Ad��{`7.�>=\'kc��\�hn\�$�n��H=Dȭ�l*\�%3\�ԛ0�\�	\�&�v�:\�jc �\�D�J���\�\�fƁ��{�\�1l\�\�\�\\\�6\"��Q��A�E$��\�\'�R�$\�\�O0\�՞6#�\�</�n<���:!\�߸\�\�\��\0�J�\�\��^=$,�\�\�\�!@�\�\��V\�h2)\\Ӌ�16:�t2),\�&�	�h\�q\�km�P(�\��\�q\�G?�@ ���q\�V\�Ԥ@�\�\n���f&��?A:��^��S�1>\�e��K�\�b�$\�,�t\�ع,TÌ�ҁ��<WTMJ\�ZL�Z�P�pi_\\\\\�\�L\0�HB�HW_3\0�\� \Zd���\�\�����ή�hn.��rrHE�J a;\�\�2\�4P5�O$X��Kb��zn��>�\��颪��P�\�|\�U�sO�9\"\�\�jÆ�6�ɥB�M�/�p,^\�J�rQ|^B�\0|/�K`\�bI\r�!�\�%C04hk�@�)\�	\'P��6�ET¦M�9\�!5��\r\��\�L����\�K *��R@��o_�\�%BKfD�-�e/�\�\�\�bb����oU(�\���\�fĮ��B�QO�T�B\�G>�{Z\�\\\�W\\��A\'$�9V� �J\�(=\�I�6-\�+�ᚰ�\����\�+\�÷\�x�0Tͺ\\.!WH�\Z\'\��O�Pjvs\�8/<k%\�A;G</�U�\"\�h�\�\�\��y\ZWn\�C:�t�ܱQ��\���\�p8�K\�&R�T*�h4)N\�Xl�K�^���)#bP���O�Mt�J\Zj\�f�e�5��P�-�B��٬��@)�K\Ze��\�0\�4\�nK_��r�\�|8�T���A\�\�\�\�+l#\�*�F�`m\�D\0E�\�G���3+X0�s֐\�(\�\�ݹ��a��[@H-���v�%\�r|\"e���\\!n�x*%>E�=K\�=1!62��g�c1$V䮪\�\�O����\�ǧo�5c\�{��\n\�pz؍D<�٩�w:ͰX*\�OHV$K!\ZK O/�.\���!\�\�kUYh��Ih�a(�\�ٳ�	@P�\�,5!�\�\"�Њǳjd�V+H	�I��r�\�P8�9>�٬î][`0\�\�\�<�T�\��\�p��?\�\�+��f\nu9\�V�Q$� ��CC\�h�\�\�\\;�@�O^�שՅ��t5�X�h\�&f�Z���}�R��\0Bj�\�}��_�\�ŪYI�(��\�\�\��S\�fvzʍd\"\'s�|\Z��V\"\�hr|ۻ:�\�I�\��S��\� ;16\�\�\�\�l�.�\�j@K�\�Vo\�r\�!`\�4��ᦓ6^=\�/Ֆ�<\rd�\Z��\��\�4�h�\n�fCH%s�\�\�\�\�\�iGצ6q�\�\�]*�\�\�\��{\�\�\�]{JR��\�v~s��\��q\� �\�\�7��B��T\���{�[7\�XU�\n ��\�!<�\�L�f�\�v�\�F�,�/\�\�T\�8�R�Np,f�عc{\��\�\�Yk\�hs~?f��\����\�\"L\� ep��\�i�\�=\�׳\0R��go�36��\�<�	���\�0MhT%�T\�z	q%��/�\�\�I\�\�ΏJ���l�\\ \�W\"�A8C(�@&�j�,XOo;\\\�96XbAך\�[nC��\r�;r��j-Ŕ� !%a�I9���Oʸz�F�`Ņگ�`�9�۝\���\�q۾\�d�\"@\�F���wEh*\�\n\�+$\�\�ʞh����X\�jʔ{R�\�\�F	E\�H\�3\nV�Ru�8FΞ\��/=�k�\�Q�\"�\���,7p:���\�<�\��e�\'67�\�\�P\�\�\�.\�}�jۓ��C	!3�R17\�uK\'\�N����|�J\�\�\�7q\�Ob�-\�\�Wo!H(�S�\�24<,(J� a[R}��6�bw��}��\n�\�]�pǯW\�\��V\�\��\�\��։��\�G�j�xbh͖(�\\��\��\�<8v\�8)G�\�n�,\�\�S\'q\�M7\�\�O�N\�\�0��\'4�\"E�\0�\��\�#̹CH�l�b2\�\�k�b\�\�y�Jm9�B�&(r^R�g-彽`2\�\���R��Vw>�8���1l߹�\�Pd�\�\�\�l44U\'����$\�T\Z\�\�i�\�I��T\�3/(�\\s\�<�\�{˺�\0BJ1<6�C\�\���Ϗ�T\��53R\�^�\�V�\�\�չ\�Ξ\�\�\�\��V�rkY�>g�\�pY���S_^�*3�\�\r��ܼ\n`q)/�R�\�]X>�jH�N\r��\'�Z8���5�4^��\'�rN<�D<�.���AA{G{�]�jAp\�R�\��I�%m �,TfP�k\�匉\'�N�w�\�eW3\�\�\�E�&X4�\\�\�ϴ\��ǋ�\�n���c{o7~�}ʢx\�\�\�\��\�q�\�qA)t:-y!�ԀH�\�Ȉި�LU\�Ԥ{z�V�r���eaa^�q\��oT$�\�]��\�Ϡ�@;\n=g�A,\�GF�LQ�PvP��x���I�i�)OM\�U���λ�\�C�.4���Y~\��0\�*��I�\�|Q\\\�P�_R6�Q�Ո���fa�X�z֌�\�\�;\�AGW\'l�ƪ�)�ŘM\�f��\�\'\�\�\���~�pP( 2�PVi*�a��\�\�\�\'p�6u	ʢ\���;�,V:;;�`L~�G�\�^[XsN*�\�X��f�\��\�\rLa\�\�悵\n\�\�~��93<�z��y\��\�Vգ�H\rIB5�iŒ�b\"\�[2@\�\�I\r\�yk0\�`��\�\�h\�\�\0\�!R	 \0V�X9�g��\�x�\�`\���H\�\�\��\�2=9	�\�	k\��p�\��SӞ�Z��:|\��\�\�S��{ʍ��}��K\�\�m\�ȏ�b�@?�\�\�\�\"�j�X\�e	�Y\�,\�;;a�W���\�\���O�\�\�s�?�\�\�E�)�\�4���u�%,.\�C	�KR\�E�B�>���Z\�$R�\��G9���\�(�c�jd�*m\�[��!�sz�۶U�Z\�\��DRd�dVK�\�\�p\�Tn0�\���H�c\�س��eUII�\�c\�\�M<u�ώ��nuU\�FPլ��\�����gͤe��坞��I����\�Z�_vmH\�$\�g=��\�\��n0���\r\�6�X��ձL\�\�\�\�z\��Q<0�\0x\�l\�[%�\0\�	�\'r޴�PS�ض�q���3UT��\�` ��\�}P7�.r:.N��\�\����\�X��v5c�Y�;\��\�Oއ�\�\�U9(V���`~���\�KP<�SC�\�\�;^RI@obIM,\0M$8$3y\�SCC\r��J�%�Nc\��B\0��z�V�Z\�sV֓\�\�+���~_��yW��\�\��g�\r\�v\�[�$M �\�LML\�b��\�鐕�ѓ/�\�\�E�l`|�V\�u��\�R)5\�\�3g�\�hu�\�d\�8�o\��@ɸ�\�YYozbؽ\�\�!��\�rmw\�\�ĹQlٺ�!C��`\���\0��h�(2���2�\�F=}}����(�~恒&o������\�\�n�:\"x*W\�\�\�\0�8���|P/ef\�z\�Yn���\�	�\�\������\r�@Tn\�F�㬦�\�QP�)\�_ �{F�yN�/ n���%�F�F�uk�\�\�e\�I\�\�=�W\�\�\�S��\�\r<?�\�?�G5���bsύ��+\�\�5��}=�d[\�m�,@8\����h�4��U|�\rY-�����[p\���\�\��>�\�_]�u��\���}�܋\r\�&&\'&���ْ��\�P�Ǥ���!\Z��\�6�&@ȟ�C�u\�fq\�x%�����@�x�թ~�OOcW_��\�\�.?u}~��?��tI>����z<�P\��GX֓z�j�\�\�k�5\"I���\�\"kG;\"��F�\�\r\Z\�h��\�?�Y �.\�X8��\�?[K�w]���\�)ǽ�kx�\�)a_\�\Z2&�kh2\�?y��q\�!,g�\�\�\��Ք5S�\�\0\0\0\0IEND�B`�'),(2,'Operario','Operario','Operario',0,'a33d0b9ee2738fb02ff3fbfa1ab8d3df',2,'');
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
