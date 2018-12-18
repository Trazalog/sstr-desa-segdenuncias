-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2018 a las 21:19:53
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
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `id` int(11) NOT NULL,
  `id_privincia` int(11) NOT NULL,
  `localidad` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`id`, `id_privincia`, `localidad`) VALUES
(1, 1, '25 de Mayo'),
(2, 1, '3 de febrero'),
(3, 1, 'A. Alsina'),
(4, 1, 'A. Gonzáles Cháves'),
(5, 1, 'Aguas Verdes'),
(6, 1, 'Alberti'),
(7, 1, 'Arrecifes'),
(8, 1, 'Ayacucho'),
(9, 1, 'Azul'),
(10, 1, 'Bahía Blanca'),
(11, 1, 'Balcarce'),
(12, 1, 'Baradero'),
(13, 1, 'Benito Juárez'),
(14, 1, 'Berisso'),
(15, 1, 'Bolívar'),
(16, 1, 'Bragado'),
(17, 1, 'Brandsen'),
(18, 1, 'Campana'),
(19, 1, 'Cañuelas'),
(20, 1, 'Capilla del Señor'),
(21, 1, 'Capitán Sarmiento'),
(22, 1, 'Carapachay'),
(23, 1, 'Carhue'),
(24, 1, 'Cariló'),
(25, 1, 'Carlos Casares'),
(26, 1, 'Carlos Tejedor'),
(27, 1, 'Carmen de Areco'),
(28, 1, 'Carmen de Patagones'),
(29, 1, 'Castelli'),
(30, 1, 'Chacabuco'),
(31, 1, 'Chascomús'),
(32, 1, 'Chivilcoy'),
(33, 1, 'Colón'),
(34, 1, 'Coronel Dorrego'),
(35, 1, 'Coronel Pringles'),
(36, 1, 'Coronel Rosales'),
(37, 1, 'Coronel Suarez'),
(38, 1, 'Costa Azul'),
(39, 1, 'Costa Chica'),
(40, 1, 'Costa del Este'),
(41, 1, 'Costa Esmeralda'),
(42, 1, 'Daireaux'),
(43, 1, 'Darregueira'),
(44, 1, 'Del Viso'),
(45, 1, 'Dolores'),
(46, 1, 'Don Torcuato'),
(47, 1, 'Ensenada'),
(48, 1, 'Escobar'),
(49, 1, 'Exaltación de la Cruz'),
(50, 1, 'Florentino Ameghino'),
(51, 1, 'Garín'),
(52, 1, 'Gral. Alvarado'),
(53, 1, 'Gral. Alvear'),
(54, 1, 'Gral. Arenales'),
(55, 1, 'Gral. Belgrano'),
(56, 1, 'Gral. Guido'),
(57, 1, 'Gral. Lamadrid'),
(58, 1, 'Gral. Las Heras'),
(59, 1, 'Gral. Lavalle'),
(60, 1, 'Gral. Madariaga'),
(61, 1, 'Gral. Pacheco'),
(62, 1, 'Gral. Paz'),
(63, 1, 'Gral. Pinto'),
(64, 1, 'Gral. Pueyrredón'),
(65, 1, 'Gral. Rodríguez'),
(66, 1, 'Gral. Viamonte'),
(67, 1, 'Gral. Villegas'),
(68, 1, 'Guaminí'),
(69, 1, 'Guernica'),
(70, 1, 'Hipólito Yrigoyen'),
(71, 1, 'Ing. Maschwitz'),
(72, 1, 'Junín'),
(73, 1, 'La Plata'),
(74, 1, 'Laprida'),
(75, 1, 'Las Flores'),
(76, 1, 'Las Toninas'),
(77, 1, 'Leandro N. Alem'),
(78, 1, 'Lincoln'),
(79, 1, 'Loberia'),
(80, 1, 'Lobos'),
(81, 1, 'Los Cardales'),
(82, 1, 'Los Toldos'),
(83, 1, 'Lucila del Mar'),
(84, 1, 'Luján'),
(85, 1, 'Magdalena'),
(86, 1, 'Maipú'),
(87, 1, 'Mar Chiquita'),
(88, 1, 'Mar de Ajó'),
(89, 1, 'Mar de las Pampas'),
(90, 1, 'Mar del Plata'),
(91, 1, 'Mar del Tuyú'),
(92, 1, 'Marcos Paz'),
(93, 1, 'Mercedes'),
(94, 1, 'Miramar'),
(95, 1, 'Monte'),
(96, 1, 'Monte Hermoso'),
(97, 1, 'Munro'),
(98, 1, 'Navarro'),
(99, 1, 'Necochea'),
(100, 1, 'Olavarría'),
(101, 1, 'Partido de la Costa'),
(102, 1, 'Pehuajó'),
(103, 1, 'Pellegrini'),
(104, 1, 'Pergamino'),
(105, 1, 'Pigüé'),
(106, 1, 'Pila'),
(107, 1, 'Pilar'),
(108, 1, 'Pinamar'),
(109, 1, 'Pinar del Sol'),
(110, 1, 'Polvorines'),
(111, 1, 'Pte. Perón'),
(112, 1, 'Puán'),
(113, 1, 'Punta Indio'),
(114, 1, 'Ramallo'),
(115, 1, 'Rauch'),
(116, 1, 'Rivadavia'),
(117, 1, 'Rojas'),
(118, 1, 'Roque Pérez'),
(119, 1, 'Saavedra'),
(120, 1, 'Saladillo'),
(121, 1, 'Salliqueló'),
(122, 1, 'Salto'),
(123, 1, 'San Andrés de Giles'),
(124, 1, 'San Antonio de Areco'),
(125, 1, 'San Antonio de Padua'),
(126, 1, 'San Bernardo'),
(127, 1, 'San Cayetano'),
(128, 1, 'San Clemente del Tuyú'),
(129, 1, 'San Nicolás'),
(130, 1, 'San Pedro'),
(131, 1, 'San Vicente'),
(132, 1, 'Santa Teresita'),
(133, 1, 'Suipacha'),
(134, 1, 'Tandil'),
(135, 1, 'Tapalqué'),
(136, 1, 'Tordillo'),
(137, 1, 'Tornquist'),
(138, 1, 'Trenque Lauquen'),
(139, 1, 'Tres Lomas'),
(140, 1, 'Villa Gesell'),
(141, 1, 'Villarino'),
(142, 1, 'Zárate'),
(143, 2, '11 de Septiembre'),
(144, 2, '20 de Junio'),
(145, 2, '25 de Mayo'),
(146, 2, 'Acassuso'),
(147, 2, 'Adrogué'),
(148, 2, 'Aldo Bonzi'),
(149, 2, 'Área Reserva Cinturón Ecológico'),
(150, 2, 'Avellaneda'),
(151, 2, 'Banfield'),
(152, 2, 'Barrio Parque'),
(153, 2, 'Barrio Santa Teresita'),
(154, 2, 'Beccar'),
(155, 2, 'Bella Vista'),
(156, 2, 'Berazategui'),
(157, 2, 'Bernal Este'),
(158, 2, 'Bernal Oeste'),
(159, 2, 'Billinghurst'),
(160, 2, 'Boulogne'),
(161, 2, 'Burzaco'),
(162, 2, 'Carapachay'),
(163, 2, 'Caseros'),
(164, 2, 'Castelar'),
(165, 2, 'Churruca'),
(166, 2, 'Ciudad Evita'),
(167, 2, 'Ciudad Madero'),
(168, 2, 'Ciudadela'),
(169, 2, 'Claypole'),
(170, 2, 'Crucecita'),
(171, 2, 'Dock Sud'),
(172, 2, 'Don Bosco'),
(173, 2, 'Don Orione'),
(174, 2, 'El Jagüel'),
(175, 2, 'El Libertador'),
(176, 2, 'El Palomar'),
(177, 2, 'El Tala'),
(178, 2, 'El Trébol'),
(179, 2, 'Ezeiza'),
(180, 2, 'Ezpeleta'),
(181, 2, 'Florencio Varela'),
(182, 2, 'Florida'),
(183, 2, 'Francisco Álvarez'),
(184, 2, 'Gerli'),
(185, 2, 'Glew'),
(186, 2, 'González Catán'),
(187, 2, 'Gral. Lamadrid'),
(188, 2, 'Grand Bourg'),
(189, 2, 'Gregorio de Laferrere'),
(190, 2, 'Guillermo Enrique Hudson'),
(191, 2, 'Haedo'),
(192, 2, 'Hurlingham'),
(193, 2, 'Ing. Sourdeaux'),
(194, 2, 'Isidro Casanova'),
(195, 2, 'Ituzaingó'),
(196, 2, 'José C. Paz'),
(197, 2, 'José Ingenieros'),
(198, 2, 'José Marmol'),
(199, 2, 'La Lucila'),
(200, 2, 'La Reja'),
(201, 2, 'La Tablada'),
(202, 2, 'Lanús'),
(203, 2, 'Llavallol'),
(204, 2, 'Loma Hermosa'),
(205, 2, 'Lomas de Zamora'),
(206, 2, 'Lomas del Millón'),
(207, 2, 'Lomas del Mirador'),
(208, 2, 'Longchamps'),
(209, 2, 'Los Polvorines'),
(210, 2, 'Luis Guillón'),
(211, 2, 'Malvinas Argentinas'),
(212, 2, 'Martín Coronado'),
(213, 2, 'Martínez'),
(214, 2, 'Merlo'),
(215, 2, 'Ministro Rivadavia'),
(216, 2, 'Monte Chingolo'),
(217, 2, 'Monte Grande'),
(218, 2, 'Moreno'),
(219, 2, 'Morón'),
(220, 2, 'Muñiz'),
(221, 2, 'Olivos'),
(222, 2, 'Pablo Nogués'),
(223, 2, 'Pablo Podestá'),
(224, 2, 'Paso del Rey'),
(225, 2, 'Pereyra'),
(226, 2, 'Piñeiro'),
(227, 2, 'Plátanos'),
(228, 2, 'Pontevedra'),
(229, 2, 'Quilmes'),
(230, 2, 'Rafael Calzada'),
(231, 2, 'Rafael Castillo'),
(232, 2, 'Ramos Mejía'),
(233, 2, 'Ranelagh'),
(234, 2, 'Remedios de Escalada'),
(235, 2, 'Sáenz Peña'),
(236, 2, 'San Antonio de Padua'),
(237, 2, 'San Fernando'),
(238, 2, 'San Francisco Solano'),
(239, 2, 'San Isidro'),
(240, 2, 'San José'),
(241, 2, 'San Justo'),
(242, 2, 'San Martín'),
(243, 2, 'San Miguel'),
(244, 2, 'Santos Lugares'),
(245, 2, 'Sarandí'),
(246, 2, 'Sourigues'),
(247, 2, 'Tapiales'),
(248, 2, 'Temperley'),
(249, 2, 'Tigre'),
(250, 2, 'Tortuguitas'),
(251, 2, 'Tristán Suárez'),
(252, 2, 'Trujui'),
(253, 2, 'Turdera'),
(254, 2, 'Valentín Alsina'),
(255, 2, 'Vicente López'),
(256, 2, 'Villa Adelina'),
(257, 2, 'Villa Ballester'),
(258, 2, 'Villa Bosch'),
(259, 2, 'Villa Caraza'),
(260, 2, 'Villa Celina'),
(261, 2, 'Villa Centenario'),
(262, 2, 'Villa de Mayo'),
(263, 2, 'Villa Diamante'),
(264, 2, 'Villa Domínico'),
(265, 2, 'Villa España'),
(266, 2, 'Villa Fiorito'),
(267, 2, 'Villa Guillermina'),
(268, 2, 'Villa Insuperable'),
(269, 2, 'Villa José León Suárez'),
(270, 2, 'Villa La Florida'),
(271, 2, 'Villa Luzuriaga'),
(272, 2, 'Villa Martelli'),
(273, 2, 'Villa Obrera'),
(274, 2, 'Villa Progreso'),
(275, 2, 'Villa Raffo'),
(276, 2, 'Villa Sarmiento'),
(277, 2, 'Villa Tesei'),
(278, 2, 'Villa Udaondo'),
(279, 2, 'Virrey del Pino'),
(280, 2, 'Wilde'),
(281, 2, 'William Morris'),
(282, 3, 'Agronomía'),
(283, 3, 'Almagro'),
(284, 3, 'Balvanera'),
(285, 3, 'Barracas'),
(286, 3, 'Belgrano'),
(287, 3, 'Boca'),
(288, 3, 'Boedo'),
(289, 3, 'Caballito'),
(290, 3, 'Chacarita'),
(291, 3, 'Coghlan'),
(292, 3, 'Colegiales'),
(293, 3, 'Constitución'),
(294, 3, 'Flores'),
(295, 3, 'Floresta'),
(296, 3, 'La Paternal'),
(297, 3, 'Liniers'),
(298, 3, 'Mataderos'),
(299, 3, 'Monserrat'),
(300, 3, 'Monte Castro'),
(301, 3, 'Nueva Pompeya'),
(302, 3, 'Núñez'),
(303, 3, 'Palermo'),
(304, 3, 'Parque Avellaneda'),
(305, 3, 'Parque Chacabuco'),
(306, 3, 'Parque Chas'),
(307, 3, 'Parque Patricios'),
(308, 3, 'Puerto Madero'),
(309, 3, 'Recoleta'),
(310, 3, 'Retiro'),
(311, 3, 'Saavedra'),
(312, 3, 'San Cristóbal'),
(313, 3, 'San Nicolás'),
(314, 3, 'San Telmo'),
(315, 3, 'Vélez Sársfield'),
(316, 3, 'Versalles'),
(317, 3, 'Villa Crespo'),
(318, 3, 'Villa del Parque'),
(319, 3, 'Villa Devoto'),
(320, 3, 'Villa Gral. Mitre'),
(321, 3, 'Villa Lugano'),
(322, 3, 'Villa Luro'),
(323, 3, 'Villa Ortúzar'),
(324, 3, 'Villa Pueyrredón'),
(325, 3, 'Villa Real'),
(326, 3, 'Villa Riachuelo'),
(327, 3, 'Villa Santa Rita'),
(328, 3, 'Villa Soldati'),
(329, 3, 'Villa Urquiza'),
(330, 4, 'Aconquija'),
(331, 4, 'Ancasti'),
(332, 4, 'Andalgalá'),
(333, 4, 'Antofagasta'),
(334, 4, 'Belén'),
(335, 4, 'Capayán'),
(336, 4, 'Capital'),
(337, 4, '4'),
(338, 4, 'Corral Quemado'),
(339, 4, 'El Alto'),
(340, 4, 'El Rodeo'),
(341, 4, 'F.Mamerto Esquiú'),
(342, 4, 'Fiambalá'),
(343, 4, 'Hualfín'),
(344, 4, 'Huillapima'),
(345, 4, 'Icaño'),
(346, 4, 'La Puerta'),
(347, 4, 'Las Juntas'),
(348, 4, 'Londres'),
(349, 4, 'Los Altos'),
(350, 4, 'Los Varela'),
(351, 4, 'Mutquín'),
(352, 4, 'Paclín'),
(353, 4, 'Poman'),
(354, 4, 'Pozo de La Piedra'),
(355, 4, 'Puerta de Corral'),
(356, 4, 'Puerta San José'),
(357, 4, 'Recreo'),
(358, 4, 'S.F.V de 4'),
(359, 4, 'San Fernando'),
(360, 4, 'San Fernando del Valle'),
(361, 4, 'San José'),
(362, 4, 'Santa María'),
(363, 4, 'Santa Rosa'),
(364, 4, 'Saujil'),
(365, 4, 'Tapso'),
(366, 4, 'Tinogasta'),
(367, 4, 'Valle Viejo'),
(368, 4, 'Villa Vil'),
(369, 5, 'Aviá Teraí'),
(370, 5, 'Barranqueras'),
(371, 5, 'Basail'),
(372, 5, 'Campo Largo'),
(373, 5, 'Capital'),
(374, 5, 'Capitán Solari'),
(375, 5, 'Charadai'),
(376, 5, 'Charata'),
(377, 5, 'Chorotis'),
(378, 5, 'Ciervo Petiso'),
(379, 5, 'Cnel. Du Graty'),
(380, 5, 'Col. Benítez'),
(381, 5, 'Col. Elisa'),
(382, 5, 'Col. Popular'),
(383, 5, 'Colonias Unidas'),
(384, 5, 'Concepción'),
(385, 5, 'Corzuela'),
(386, 5, 'Cote Lai'),
(387, 5, 'El Sauzalito'),
(388, 5, 'Enrique Urien'),
(389, 5, 'Fontana'),
(390, 5, 'Fte. Esperanza'),
(391, 5, 'Gancedo'),
(392, 5, 'Gral. Capdevila'),
(393, 5, 'Gral. Pinero'),
(394, 5, 'Gral. San Martín'),
(395, 5, 'Gral. Vedia'),
(396, 5, 'Hermoso Campo'),
(397, 5, 'I. del Cerrito'),
(398, 5, 'J.J. Castelli'),
(399, 5, 'La Clotilde'),
(400, 5, 'La Eduvigis'),
(401, 5, 'La Escondida'),
(402, 5, 'La Leonesa'),
(403, 5, 'La Tigra'),
(404, 5, 'La Verde'),
(405, 5, 'Laguna Blanca'),
(406, 5, 'Laguna Limpia'),
(407, 5, 'Lapachito'),
(408, 5, 'Las Breñas'),
(409, 5, 'Las Garcitas'),
(410, 5, 'Las Palmas'),
(411, 5, 'Los Frentones'),
(412, 5, 'Machagai'),
(413, 5, 'Makallé'),
(414, 5, 'Margarita Belén'),
(415, 5, 'Miraflores'),
(416, 5, 'Misión N. Pompeya'),
(417, 5, 'Napenay'),
(418, 5, 'Pampa Almirón'),
(419, 5, 'Pampa del Indio'),
(420, 5, 'Pampa del Infierno'),
(421, 5, 'Pdcia. de La Plaza'),
(422, 5, 'Pdcia. Roca'),
(423, 5, 'Pdcia. Roque Sáenz Peña'),
(424, 5, 'Pto. Bermejo'),
(425, 5, 'Pto. Eva Perón'),
(426, 5, 'Puero Tirol'),
(427, 5, 'Puerto Vilelas'),
(428, 5, 'Quitilipi'),
(429, 5, 'Resistencia'),
(430, 5, 'Sáenz Peña'),
(431, 5, 'Samuhú'),
(432, 5, 'San Bernardo'),
(433, 5, 'Santa Sylvina'),
(434, 5, 'Taco Pozo'),
(435, 5, 'Tres Isletas'),
(436, 5, 'Villa Ángela'),
(437, 5, 'Villa Berthet'),
(438, 5, 'Villa R. Bermejito'),
(439, 6, 'Aldea Apeleg'),
(440, 6, 'Aldea Beleiro'),
(441, 6, 'Aldea Epulef'),
(442, 6, 'Alto Río Sengerr'),
(443, 6, 'Buen Pasto'),
(444, 6, 'Camarones'),
(445, 6, 'Carrenleufú'),
(446, 6, 'Cholila'),
(447, 6, 'Co. Centinela'),
(448, 6, 'Colan Conhué'),
(449, 6, 'Comodoro Rivadavia'),
(450, 6, 'Corcovado'),
(451, 6, 'Cushamen'),
(452, 6, 'Dique F. Ameghino'),
(453, 6, 'Dolavón'),
(454, 6, 'Dr. R. Rojas'),
(455, 6, 'El Hoyo'),
(456, 6, 'El Maitén'),
(457, 6, 'Epuyén'),
(458, 6, 'Esquel'),
(459, 6, 'Facundo'),
(460, 6, 'Gaimán'),
(461, 6, 'Gan Gan'),
(462, 6, 'Gastre'),
(463, 6, 'Gdor. Costa'),
(464, 6, 'Gualjaina'),
(465, 6, 'J. de San Martín'),
(466, 6, 'Lago Blanco'),
(467, 6, 'Lago Puelo'),
(468, 6, 'Lagunita Salada'),
(469, 6, 'Las Plumas'),
(470, 6, 'Los Altares'),
(471, 6, 'Paso de los Indios'),
(472, 6, 'Paso del Sapo'),
(473, 6, 'Pto. Madryn'),
(474, 6, 'Pto. Pirámides'),
(475, 6, 'Rada Tilly'),
(476, 6, 'Rawson'),
(477, 6, 'Río Mayo'),
(478, 6, 'Río Pico'),
(479, 6, 'Sarmiento'),
(480, 6, 'Tecka'),
(481, 6, 'Telsen'),
(482, 6, 'Trelew'),
(483, 6, 'Trevelin'),
(484, 6, 'Veintiocho de Julio'),
(485, 7, 'Achiras'),
(486, 7, 'Adelia Maria'),
(487, 7, 'Agua de Oro'),
(488, 7, 'Alcira Gigena'),
(489, 7, 'Aldea Santa Maria'),
(490, 7, 'Alejandro Roca'),
(491, 7, 'Alejo Ledesma'),
(492, 7, 'Alicia'),
(493, 7, 'Almafuerte'),
(494, 7, 'Alpa Corral'),
(495, 7, 'Alta Gracia'),
(496, 7, 'Alto Alegre'),
(497, 7, 'Alto de Los Quebrachos'),
(498, 7, 'Altos de Chipion'),
(499, 7, 'Amboy'),
(500, 7, 'Ambul'),
(501, 7, 'Ana Zumaran'),
(502, 7, 'Anisacate'),
(503, 7, 'Arguello'),
(504, 7, 'Arias'),
(505, 7, 'Arroyito'),
(506, 7, 'Arroyo Algodon'),
(507, 7, 'Arroyo Cabral'),
(508, 7, 'Arroyo Los Patos'),
(509, 7, 'Assunta'),
(510, 7, 'Atahona'),
(511, 7, 'Ausonia'),
(512, 7, 'Avellaneda'),
(513, 7, 'Ballesteros'),
(514, 7, 'Ballesteros Sud'),
(515, 7, 'Balnearia'),
(516, 7, 'Bañado de Soto'),
(517, 7, 'Bell Ville'),
(518, 7, 'Bengolea'),
(519, 7, 'Benjamin Gould'),
(520, 7, 'Berrotaran'),
(521, 7, 'Bialet Masse'),
(522, 7, 'Bouwer'),
(523, 7, 'Brinkmann'),
(524, 7, 'Buchardo'),
(525, 7, 'Bulnes'),
(526, 7, 'Cabalango'),
(527, 7, 'Calamuchita'),
(528, 7, 'Calchin'),
(529, 7, 'Calchin Oeste'),
(530, 7, 'Calmayo'),
(531, 7, 'Camilo Aldao'),
(532, 7, 'Caminiaga'),
(533, 7, 'Cañada de Luque'),
(534, 7, 'Cañada de Machado'),
(535, 7, 'Cañada de Rio Pinto'),
(536, 7, 'Cañada del Sauce'),
(537, 7, 'Canals'),
(538, 7, 'Candelaria Sud'),
(539, 7, 'Capilla de Remedios'),
(540, 7, 'Capilla de Siton'),
(541, 7, 'Capilla del Carmen'),
(542, 7, 'Capilla del Monte'),
(543, 7, 'Capital'),
(544, 7, 'Capitan Gral B. O´Higgins'),
(545, 7, 'Carnerillo'),
(546, 7, 'Carrilobo'),
(547, 7, 'Casa Grande'),
(548, 7, 'Cavanagh'),
(549, 7, 'Cerro Colorado'),
(550, 7, 'Chaján'),
(551, 7, 'Chalacea'),
(552, 7, 'Chañar Viejo'),
(553, 7, 'Chancaní'),
(554, 7, 'Charbonier'),
(555, 7, 'Charras'),
(556, 7, 'Chazón'),
(557, 7, 'Chilibroste'),
(558, 7, 'Chucul'),
(559, 7, 'Chuña'),
(560, 7, 'Chuña Huasi'),
(561, 7, 'Churqui Cañada'),
(562, 7, 'Cienaga Del Coro'),
(563, 7, 'Cintra'),
(564, 7, 'Col. Almada'),
(565, 7, 'Col. Anita'),
(566, 7, 'Col. Barge'),
(567, 7, 'Col. Bismark'),
(568, 7, 'Col. Bremen'),
(569, 7, 'Col. Caroya'),
(570, 7, 'Col. Italiana'),
(571, 7, 'Col. Iturraspe'),
(572, 7, 'Col. Las Cuatro Esquinas'),
(573, 7, 'Col. Las Pichanas'),
(574, 7, 'Col. Marina'),
(575, 7, 'Col. Prosperidad'),
(576, 7, 'Col. San Bartolome'),
(577, 7, 'Col. San Pedro'),
(578, 7, 'Col. Tirolesa'),
(579, 7, 'Col. Vicente Aguero'),
(580, 7, 'Col. Videla'),
(581, 7, 'Col. Vignaud'),
(582, 7, 'Col. Waltelina'),
(583, 7, 'Colazo'),
(584, 7, 'Comechingones'),
(585, 7, 'Conlara'),
(586, 7, 'Copacabana'),
(587, 7, '7'),
(588, 7, 'Coronel Baigorria'),
(589, 7, 'Coronel Moldes'),
(590, 7, 'Corral de Bustos'),
(591, 7, 'Corralito'),
(592, 7, 'Cosquín'),
(593, 7, 'Costa Sacate'),
(594, 7, 'Cruz Alta'),
(595, 7, 'Cruz de Caña'),
(596, 7, 'Cruz del Eje'),
(597, 7, 'Cuesta Blanca'),
(598, 7, 'Dean Funes'),
(599, 7, 'Del Campillo'),
(600, 7, 'Despeñaderos'),
(601, 7, 'Devoto'),
(602, 7, 'Diego de Rojas'),
(603, 7, 'Dique Chico'),
(604, 7, 'El Arañado'),
(605, 7, 'El Brete'),
(606, 7, 'El Chacho'),
(607, 7, 'El Crispín'),
(608, 7, 'El Fortín'),
(609, 7, 'El Manzano'),
(610, 7, 'El Rastreador'),
(611, 7, 'El Rodeo'),
(612, 7, 'El Tío'),
(613, 7, 'Elena'),
(614, 7, 'Embalse'),
(615, 7, 'Esquina'),
(616, 7, 'Estación Gral. Paz'),
(617, 7, 'Estación Juárez Celman'),
(618, 7, 'Estancia de Guadalupe'),
(619, 7, 'Estancia Vieja'),
(620, 7, 'Etruria'),
(621, 7, 'Eufrasio Loza'),
(622, 7, 'Falda del Carmen'),
(623, 7, 'Freyre'),
(624, 7, 'Gral. Baldissera'),
(625, 7, 'Gral. Cabrera'),
(626, 7, 'Gral. Deheza'),
(627, 7, 'Gral. Fotheringham'),
(628, 7, 'Gral. Levalle'),
(629, 7, 'Gral. Roca'),
(630, 7, 'Guanaco Muerto'),
(631, 7, 'Guasapampa'),
(632, 7, 'Guatimozin'),
(633, 7, 'Gutenberg'),
(634, 7, 'Hernando'),
(635, 7, 'Huanchillas'),
(636, 7, 'Huerta Grande'),
(637, 7, 'Huinca Renanco'),
(638, 7, 'Idiazabal'),
(639, 7, 'Impira'),
(640, 7, 'Inriville'),
(641, 7, 'Isla Verde'),
(642, 7, 'Italó'),
(643, 7, 'James Craik'),
(644, 7, 'Jesús María'),
(645, 7, 'Jovita'),
(646, 7, 'Justiniano Posse'),
(647, 7, 'Km 658'),
(648, 7, 'L. V. Mansilla'),
(649, 7, 'La Batea'),
(650, 7, 'La Calera'),
(651, 7, 'La Carlota'),
(652, 7, 'La Carolina'),
(653, 7, 'La Cautiva'),
(654, 7, 'La Cesira'),
(655, 7, 'La Cruz'),
(656, 7, 'La Cumbre'),
(657, 7, 'La Cumbrecita'),
(658, 7, 'La Falda'),
(659, 7, 'La Francia'),
(660, 7, 'La Granja'),
(661, 7, 'La Higuera'),
(662, 7, 'La Laguna'),
(663, 7, 'La Paisanita'),
(664, 7, 'La Palestina'),
(665, 7, '12'),
(666, 7, 'La Paquita'),
(667, 7, 'La Para'),
(668, 7, 'La Paz'),
(669, 7, 'La Playa'),
(670, 7, 'La Playosa'),
(671, 7, 'La Población'),
(672, 7, 'La Posta'),
(673, 7, 'La Puerta'),
(674, 7, 'La Quinta'),
(675, 7, 'La Rancherita'),
(676, 7, 'La Rinconada'),
(677, 7, 'La Serranita'),
(678, 7, 'La Tordilla'),
(679, 7, 'Laborde'),
(680, 7, 'Laboulaye'),
(681, 7, 'Laguna Larga'),
(682, 7, 'Las Acequias'),
(683, 7, 'Las Albahacas'),
(684, 7, 'Las Arrias'),
(685, 7, 'Las Bajadas'),
(686, 7, 'Las Caleras'),
(687, 7, 'Las Calles'),
(688, 7, 'Las Cañadas'),
(689, 7, 'Las Gramillas'),
(690, 7, 'Las Higueras'),
(691, 7, 'Las Isletillas'),
(692, 7, 'Las Junturas'),
(693, 7, 'Las Palmas'),
(694, 7, 'Las Peñas'),
(695, 7, 'Las Peñas Sud'),
(696, 7, 'Las Perdices'),
(697, 7, 'Las Playas'),
(698, 7, 'Las Rabonas'),
(699, 7, 'Las Saladas'),
(700, 7, 'Las Tapias'),
(701, 7, 'Las Varas'),
(702, 7, 'Las Varillas'),
(703, 7, 'Las Vertientes'),
(704, 7, 'Leguizamón'),
(705, 7, 'Leones'),
(706, 7, 'Los Cedros'),
(707, 7, 'Los Cerrillos'),
(708, 7, 'Los Chañaritos (C.E)'),
(709, 7, 'Los Chanaritos (R.S)'),
(710, 7, 'Los Cisnes'),
(711, 7, 'Los Cocos'),
(712, 7, 'Los Cóndores'),
(713, 7, 'Los Hornillos'),
(714, 7, 'Los Hoyos'),
(715, 7, 'Los Mistoles'),
(716, 7, 'Los Molinos'),
(717, 7, 'Los Pozos'),
(718, 7, 'Los Reartes'),
(719, 7, 'Los Surgentes'),
(720, 7, 'Los Talares'),
(721, 7, 'Los Zorros'),
(722, 7, 'Lozada'),
(723, 7, 'Luca'),
(724, 7, 'Luque'),
(725, 7, 'Luyaba'),
(726, 7, 'Malagueño'),
(727, 7, 'Malena'),
(728, 7, 'Malvinas Argentinas'),
(729, 7, 'Manfredi'),
(730, 7, 'Maquinista Gallini'),
(731, 7, 'Marcos Juárez'),
(732, 7, 'Marull'),
(733, 7, 'Matorrales'),
(734, 7, 'Mattaldi'),
(735, 7, 'Mayu Sumaj'),
(736, 7, 'Media Naranja'),
(737, 7, 'Melo'),
(738, 7, 'Mendiolaza'),
(739, 7, 'Mi Granja'),
(740, 7, 'Mina Clavero'),
(741, 7, 'Miramar'),
(742, 7, 'Morrison'),
(743, 7, 'Morteros'),
(744, 7, 'Mte. Buey'),
(745, 7, 'Mte. Cristo'),
(746, 7, 'Mte. De Los Gauchos'),
(747, 7, 'Mte. Leña'),
(748, 7, 'Mte. Maíz'),
(749, 7, 'Mte. Ralo'),
(750, 7, 'Nicolás Bruzone'),
(751, 7, 'Noetinger'),
(752, 7, 'Nono'),
(753, 7, 'Nueva 7'),
(754, 7, 'Obispo Trejo'),
(755, 7, 'Olaeta'),
(756, 7, 'Oliva'),
(757, 7, 'Olivares San Nicolás'),
(758, 7, 'Onagolty'),
(759, 7, 'Oncativo'),
(760, 7, 'Ordoñez'),
(761, 7, 'Pacheco De Melo'),
(762, 7, 'Pampayasta N.'),
(763, 7, 'Pampayasta S.'),
(764, 7, 'Panaholma'),
(765, 7, 'Pascanas'),
(766, 7, 'Pasco'),
(767, 7, 'Paso del Durazno'),
(768, 7, 'Paso Viejo'),
(769, 7, 'Pilar'),
(770, 7, 'Pincén'),
(771, 7, 'Piquillín'),
(772, 7, 'Plaza de Mercedes'),
(773, 7, 'Plaza Luxardo'),
(774, 7, 'Porteña'),
(775, 7, 'Potrero de Garay'),
(776, 7, 'Pozo del Molle'),
(777, 7, 'Pozo Nuevo'),
(778, 7, 'Pueblo Italiano'),
(779, 7, 'Puesto de Castro'),
(780, 7, 'Punta del Agua'),
(781, 7, 'Quebracho Herrado'),
(782, 7, 'Quilino'),
(783, 7, 'Rafael García'),
(784, 7, 'Ranqueles'),
(785, 7, 'Rayo Cortado'),
(786, 7, 'Reducción'),
(787, 7, 'Rincón'),
(788, 7, 'Río Bamba'),
(789, 7, 'Río Ceballos'),
(790, 7, 'Río Cuarto'),
(791, 7, 'Río de Los Sauces'),
(792, 7, 'Río Primero'),
(793, 7, 'Río Segundo'),
(794, 7, 'Río Tercero'),
(795, 7, 'Rosales'),
(796, 7, 'Rosario del Saladillo'),
(797, 7, 'Sacanta'),
(798, 7, 'Sagrada Familia'),
(799, 7, 'Saira'),
(800, 7, 'Saladillo'),
(801, 7, 'Saldán'),
(802, 7, 'Salsacate'),
(803, 7, 'Salsipuedes'),
(804, 7, 'Sampacho'),
(805, 7, 'San Agustín'),
(806, 7, 'San Antonio de Arredondo'),
(807, 7, 'San Antonio de Litín'),
(808, 7, 'San Basilio'),
(809, 7, 'San Carlos Minas'),
(810, 7, 'San Clemente'),
(811, 7, 'San Esteban'),
(812, 7, 'San Francisco'),
(813, 7, 'San Ignacio'),
(814, 7, 'San Javier'),
(815, 7, 'San Jerónimo'),
(816, 7, 'San Joaquín'),
(817, 7, 'San José de La Dormida'),
(818, 7, 'San José de Las Salinas'),
(819, 7, 'San Lorenzo'),
(820, 7, 'San Marcos Sierras'),
(821, 7, 'San Marcos Sud'),
(822, 7, 'San Pedro'),
(823, 7, 'San Pedro N.'),
(824, 7, 'San Roque'),
(825, 7, 'San Vicente'),
(826, 7, 'Santa Catalina'),
(827, 7, 'Santa Elena'),
(828, 7, 'Santa Eufemia'),
(829, 7, 'Santa Maria'),
(830, 7, 'Sarmiento'),
(831, 7, 'Saturnino M.Laspiur'),
(832, 7, 'Sauce Arriba'),
(833, 7, 'Sebastián Elcano'),
(834, 7, 'Seeber'),
(835, 7, 'Segunda Usina'),
(836, 7, 'Serrano'),
(837, 7, 'Serrezuela'),
(838, 7, 'Sgo. Temple'),
(839, 7, 'Silvio Pellico'),
(840, 7, 'Simbolar'),
(841, 7, 'Sinsacate'),
(842, 7, 'Sta. Rosa de Calamuchita'),
(843, 7, 'Sta. Rosa de Río Primero'),
(844, 7, 'Suco'),
(845, 7, 'Tala Cañada'),
(846, 7, 'Tala Huasi'),
(847, 7, 'Talaini'),
(848, 7, 'Tancacha'),
(849, 7, 'Tanti'),
(850, 7, 'Ticino'),
(851, 7, 'Tinoco'),
(852, 7, 'Tío Pujio'),
(853, 7, 'Toledo'),
(854, 7, 'Toro Pujio'),
(855, 7, 'Tosno'),
(856, 7, 'Tosquita'),
(857, 7, 'Tránsito'),
(858, 7, 'Tuclame'),
(859, 7, 'Tutti'),
(860, 7, 'Ucacha'),
(861, 7, 'Unquillo'),
(862, 7, 'Valle de Anisacate'),
(863, 7, 'Valle Hermoso'),
(864, 7, 'Vélez Sarfield'),
(865, 7, 'Viamonte'),
(866, 7, 'Vicuña Mackenna'),
(867, 7, 'Villa Allende'),
(868, 7, 'Villa Amancay'),
(869, 7, 'Villa Ascasubi'),
(870, 7, 'Villa Candelaria N.'),
(871, 7, 'Villa Carlos Paz'),
(872, 7, 'Villa Cerro Azul'),
(873, 7, 'Villa Ciudad de América'),
(874, 7, 'Villa Ciudad Pque Los Reartes'),
(875, 7, 'Villa Concepción del Tío'),
(876, 7, 'Villa Cura Brochero'),
(877, 7, 'Villa de Las Rosas'),
(878, 7, 'Villa de María'),
(879, 7, 'Villa de Pocho'),
(880, 7, 'Villa de Soto'),
(881, 7, 'Villa del Dique'),
(882, 7, 'Villa del Prado'),
(883, 7, 'Villa del Rosario'),
(884, 7, 'Villa del Totoral'),
(885, 7, 'Villa Dolores'),
(886, 7, 'Villa El Chancay'),
(887, 7, 'Villa Elisa'),
(888, 7, 'Villa Flor Serrana'),
(889, 7, 'Villa Fontana'),
(890, 7, 'Villa Giardino'),
(891, 7, 'Villa Gral. Belgrano'),
(892, 7, 'Villa Gutierrez'),
(893, 7, 'Villa Huidobro'),
(894, 7, 'Villa La Bolsa'),
(895, 7, 'Villa Los Aromos'),
(896, 7, 'Villa Los Patos'),
(897, 7, 'Villa María'),
(898, 7, 'Villa Nueva'),
(899, 7, 'Villa Pque. Santa Ana'),
(900, 7, 'Villa Pque. Siquiman'),
(901, 7, 'Villa Quillinzo'),
(902, 7, 'Villa Rossi'),
(903, 7, 'Villa Rumipal'),
(904, 7, 'Villa San Esteban'),
(905, 7, 'Villa San Isidro'),
(906, 7, 'Villa 21'),
(907, 7, 'Villa Sarmiento (G.R)'),
(908, 7, 'Villa Sarmiento (S.A)'),
(909, 7, 'Villa Tulumba'),
(910, 7, 'Villa Valeria'),
(911, 7, 'Villa Yacanto'),
(912, 7, 'Washington'),
(913, 7, 'Wenceslao Escalante'),
(914, 7, 'Ycho Cruz Sierras'),
(915, 8, 'Alvear'),
(916, 8, 'Bella Vista'),
(917, 8, 'Berón de Astrada'),
(918, 8, 'Bonpland'),
(919, 8, 'Caá Cati'),
(920, 8, 'Capital'),
(921, 8, 'Chavarría'),
(922, 8, 'Col. C. Pellegrini'),
(923, 8, 'Col. Libertad'),
(924, 8, 'Col. Liebig'),
(925, 8, 'Col. Sta Rosa'),
(926, 8, 'Concepción'),
(927, 8, 'Cruz de Los Milagros'),
(928, 8, 'Curuzú-Cuatiá'),
(929, 8, 'Empedrado'),
(930, 8, 'Esquina'),
(931, 8, 'Estación Torrent'),
(932, 8, 'Felipe Yofré'),
(933, 8, 'Garruchos'),
(934, 8, 'Gdor. Agrónomo'),
(935, 8, 'Gdor. Martínez'),
(936, 8, 'Goya'),
(937, 8, 'Guaviravi'),
(938, 8, 'Herlitzka'),
(939, 8, 'Ita-Ibate'),
(940, 8, 'Itatí'),
(941, 8, 'Ituzaingó'),
(942, 8, 'José Rafael Gómez'),
(943, 8, 'Juan Pujol'),
(944, 8, 'La Cruz'),
(945, 8, 'Lavalle'),
(946, 8, 'Lomas de Vallejos'),
(947, 8, 'Loreto'),
(948, 8, 'Mariano I. Loza'),
(949, 8, 'Mburucuyá'),
(950, 8, 'Mercedes'),
(951, 8, 'Mocoretá'),
(952, 8, 'Mte. Caseros'),
(953, 8, 'Nueve de Julio'),
(954, 8, 'Palmar Grande'),
(955, 8, 'Parada Pucheta'),
(956, 8, 'Paso de La Patria'),
(957, 8, 'Paso de Los Libres'),
(958, 8, 'Pedro R. Fernandez'),
(959, 8, 'Perugorría'),
(960, 8, 'Pueblo Libertador'),
(961, 8, 'Ramada Paso'),
(962, 8, 'Riachuelo'),
(963, 8, 'Saladas'),
(964, 8, 'San Antonio'),
(965, 8, 'San Carlos'),
(966, 8, 'San Cosme'),
(967, 8, 'San Lorenzo'),
(968, 8, '20 del Palmar'),
(969, 8, 'San Miguel'),
(970, 8, 'San Roque'),
(971, 8, 'Santa Ana'),
(972, 8, 'Santa Lucía'),
(973, 8, 'Santo Tomé'),
(974, 8, 'Sauce'),
(975, 8, 'Tabay'),
(976, 8, 'Tapebicuá'),
(977, 8, 'Tatacua'),
(978, 8, 'Virasoro'),
(979, 8, 'Yapeyú'),
(980, 8, 'Yataití Calle'),
(981, 9, 'Alarcón'),
(982, 9, 'Alcaraz'),
(983, 9, 'Alcaraz N.'),
(984, 9, 'Alcaraz S.'),
(985, 9, 'Aldea Asunción'),
(986, 9, 'Aldea Brasilera'),
(987, 9, 'Aldea Elgenfeld'),
(988, 9, 'Aldea Grapschental'),
(989, 9, 'Aldea Ma. Luisa'),
(990, 9, 'Aldea Protestante'),
(991, 9, 'Aldea Salto'),
(992, 9, 'Aldea San Antonio (G)'),
(993, 9, 'Aldea San Antonio (P)'),
(994, 9, 'Aldea 19'),
(995, 9, 'Aldea San Miguel'),
(996, 9, 'Aldea San Rafael'),
(997, 9, 'Aldea Spatzenkutter'),
(998, 9, 'Aldea Sta. María'),
(999, 9, 'Aldea Sta. Rosa'),
(1000, 9, 'Aldea Valle María'),
(1001, 9, 'Altamirano Sur'),
(1002, 9, 'Antelo'),
(1003, 9, 'Antonio Tomás'),
(1004, 9, 'Aranguren'),
(1005, 9, 'Arroyo Barú'),
(1006, 9, 'Arroyo Burgos'),
(1007, 9, 'Arroyo Clé'),
(1008, 9, 'Arroyo Corralito'),
(1009, 9, 'Arroyo del Medio'),
(1010, 9, 'Arroyo Maturrango'),
(1011, 9, 'Arroyo Palo Seco'),
(1012, 9, 'Banderas'),
(1013, 9, 'Basavilbaso'),
(1014, 9, 'Betbeder'),
(1015, 9, 'Bovril'),
(1016, 9, 'Caseros'),
(1017, 9, 'Ceibas'),
(1018, 9, 'Cerrito'),
(1019, 9, 'Chajarí'),
(1020, 9, 'Chilcas'),
(1021, 9, 'Clodomiro Ledesma'),
(1022, 9, 'Col. Alemana'),
(1023, 9, 'Col. Avellaneda'),
(1024, 9, 'Col. Avigdor'),
(1025, 9, 'Col. Ayuí'),
(1026, 9, 'Col. Baylina'),
(1027, 9, 'Col. Carrasco'),
(1028, 9, 'Col. Celina'),
(1029, 9, 'Col. Cerrito'),
(1030, 9, 'Col. Crespo'),
(1031, 9, 'Col. Elia'),
(1032, 9, 'Col. Ensayo'),
(1033, 9, 'Col. Gral. Roca'),
(1034, 9, 'Col. La Argentina'),
(1035, 9, 'Col. Merou'),
(1036, 9, 'Col. Oficial Nª3'),
(1037, 9, 'Col. Oficial Nº13'),
(1038, 9, 'Col. Oficial Nº14'),
(1039, 9, 'Col. Oficial Nº5'),
(1040, 9, 'Col. Reffino'),
(1041, 9, 'Col. Tunas'),
(1042, 9, 'Col. Viraró'),
(1043, 9, 'Colón'),
(1044, 9, 'Concepción del Uruguay'),
(1045, 9, 'Concordia'),
(1046, 9, 'Conscripto Bernardi'),
(1047, 9, 'Costa Grande'),
(1048, 9, 'Costa San Antonio'),
(1049, 9, 'Costa Uruguay N.'),
(1050, 9, 'Costa Uruguay S.'),
(1051, 9, 'Crespo'),
(1052, 9, 'Crucecitas 3ª'),
(1053, 9, 'Crucecitas 7ª'),
(1054, 9, 'Crucecitas 8ª'),
(1055, 9, 'Cuchilla Redonda'),
(1056, 9, 'Curtiembre'),
(1057, 9, 'Diamante'),
(1058, 9, 'Distrito 6º'),
(1059, 9, 'Distrito Chañar'),
(1060, 9, 'Distrito Chiqueros'),
(1061, 9, 'Distrito Cuarto'),
(1062, 9, 'Distrito Diego López'),
(1063, 9, 'Distrito Pajonal'),
(1064, 9, 'Distrito Sauce'),
(1065, 9, 'Distrito Tala'),
(1066, 9, 'Distrito Talitas'),
(1067, 9, 'Don Cristóbal 1ª Sección'),
(1068, 9, 'Don Cristóbal 2ª Sección'),
(1069, 9, 'Durazno'),
(1070, 9, 'El Cimarrón'),
(1071, 9, 'El Gramillal'),
(1072, 9, 'El Palenque'),
(1073, 9, 'El Pingo'),
(1074, 9, 'El Quebracho'),
(1075, 9, 'El Redomón'),
(1076, 9, 'El Solar'),
(1077, 9, 'Enrique Carbo'),
(1078, 9, '9'),
(1079, 9, 'Espinillo N.'),
(1080, 9, 'Estación Campos'),
(1081, 9, 'Estación Escriña'),
(1082, 9, 'Estación Lazo'),
(1083, 9, 'Estación Raíces'),
(1084, 9, 'Estación Yerúa'),
(1085, 9, 'Estancia Grande'),
(1086, 9, 'Estancia Líbaros'),
(1087, 9, 'Estancia Racedo'),
(1088, 9, 'Estancia Solá'),
(1089, 9, 'Estancia Yuquerí'),
(1090, 9, 'Estaquitas'),
(1091, 9, 'Faustino M. Parera'),
(1092, 9, 'Febre'),
(1093, 9, 'Federación'),
(1094, 9, 'Federal'),
(1095, 9, 'Gdor. Echagüe'),
(1096, 9, 'Gdor. Mansilla'),
(1097, 9, 'Gilbert'),
(1098, 9, 'González Calderón'),
(1099, 9, 'Gral. Almada'),
(1100, 9, 'Gral. Alvear'),
(1101, 9, 'Gral. Campos'),
(1102, 9, 'Gral. Galarza'),
(1103, 9, 'Gral. Ramírez'),
(1104, 9, 'Gualeguay'),
(1105, 9, 'Gualeguaychú'),
(1106, 9, 'Gualeguaycito'),
(1107, 9, 'Guardamonte'),
(1108, 9, 'Hambis'),
(1109, 9, 'Hasenkamp'),
(1110, 9, 'Hernandarias'),
(1111, 9, 'Hernández'),
(1112, 9, 'Herrera'),
(1113, 9, 'Hinojal'),
(1114, 9, 'Hocker'),
(1115, 9, 'Ing. Sajaroff'),
(1116, 9, 'Irazusta'),
(1117, 9, 'Isletas'),
(1118, 9, 'J.J De Urquiza'),
(1119, 9, 'Jubileo'),
(1120, 9, 'La Clarita'),
(1121, 9, 'La Criolla'),
(1122, 9, 'La Esmeralda'),
(1123, 9, 'La Florida'),
(1124, 9, 'La Fraternidad'),
(1125, 9, 'La Hierra'),
(1126, 9, 'La Ollita'),
(1127, 9, 'La Paz'),
(1128, 9, 'La Picada'),
(1129, 9, 'La Providencia'),
(1130, 9, 'La Verbena'),
(1131, 9, 'Laguna Benítez'),
(1132, 9, 'Larroque'),
(1133, 9, 'Las Cuevas'),
(1134, 9, 'Las Garzas'),
(1135, 9, 'Las Guachas'),
(1136, 9, 'Las Mercedes'),
(1137, 9, 'Las Moscas'),
(1138, 9, 'Las Mulitas'),
(1139, 9, 'Las Toscas'),
(1140, 9, 'Laurencena'),
(1141, 9, 'Libertador San Martín'),
(1142, 9, 'Loma Limpia'),
(1143, 9, 'Los Ceibos'),
(1144, 9, 'Los Charruas'),
(1145, 9, 'Los Conquistadores'),
(1146, 9, 'Lucas González'),
(1147, 9, 'Lucas N.'),
(1148, 9, 'Lucas S. 1ª'),
(1149, 9, 'Lucas S. 2ª'),
(1150, 9, 'Maciá'),
(1151, 9, 'María Grande'),
(1152, 9, 'María Grande 2ª'),
(1153, 9, 'Médanos'),
(1154, 9, 'Mojones N.'),
(1155, 9, 'Mojones S.'),
(1156, 9, 'Molino Doll'),
(1157, 9, 'Monte Redondo'),
(1158, 9, 'Montoya'),
(1159, 9, 'Mulas Grandes'),
(1160, 9, 'Ñancay'),
(1161, 9, 'Nogoyá'),
(1162, 9, 'Nueva Escocia'),
(1163, 9, 'Nueva Vizcaya'),
(1164, 9, 'Ombú'),
(1165, 9, 'Oro Verde'),
(1166, 9, 'Paraná'),
(1167, 9, 'Pasaje Guayaquil'),
(1168, 9, 'Pasaje Las Tunas'),
(1169, 9, 'Paso de La Arena'),
(1170, 9, 'Paso de La Laguna'),
(1171, 9, 'Paso de Las Piedras'),
(1172, 9, 'Paso Duarte'),
(1173, 9, 'Pastor Britos'),
(1174, 9, 'Pedernal'),
(1175, 9, 'Perdices'),
(1176, 9, 'Picada Berón'),
(1177, 9, 'Piedras Blancas'),
(1178, 9, 'Primer Distrito Cuchilla'),
(1179, 9, 'Primero de Mayo'),
(1180, 9, 'Pronunciamiento'),
(1181, 9, 'Pto. Algarrobo'),
(1182, 9, 'Pto. Ibicuy'),
(1183, 9, 'Pueblo Brugo'),
(1184, 9, 'Pueblo Cazes'),
(1185, 9, 'Pueblo Gral. Belgrano'),
(1186, 9, 'Pueblo Liebig'),
(1187, 9, 'Puerto Yeruá'),
(1188, 9, 'Punta del Monte'),
(1189, 9, 'Quebracho'),
(1190, 9, 'Quinto Distrito'),
(1191, 9, 'Raices Oeste'),
(1192, 9, 'Rincón de Nogoyá'),
(1193, 9, 'Rincón del Cinto'),
(1194, 9, 'Rincón del Doll'),
(1195, 9, 'Rincón del Gato'),
(1196, 9, 'Rocamora'),
(1197, 9, 'Rosario del Tala'),
(1198, 9, 'San Benito'),
(1199, 9, 'San Cipriano'),
(1200, 9, 'San Ernesto'),
(1201, 9, 'San Gustavo'),
(1202, 9, 'San Jaime'),
(1203, 9, 'San José'),
(1204, 9, 'San José de Feliciano'),
(1205, 9, 'San Justo'),
(1206, 9, 'San Marcial'),
(1207, 9, 'San Pedro'),
(1208, 9, 'San Ramírez'),
(1209, 9, 'San Ramón'),
(1210, 9, 'San Roque'),
(1211, 9, 'San Salvador'),
(1212, 9, 'San Víctor'),
(1213, 9, 'Santa Ana'),
(1214, 9, 'Santa Anita'),
(1215, 9, 'Santa Elena'),
(1216, 9, 'Santa Lucía'),
(1217, 9, 'Santa Luisa'),
(1218, 9, 'Sauce de Luna'),
(1219, 9, 'Sauce Montrull'),
(1220, 9, 'Sauce Pinto'),
(1221, 9, 'Sauce Sur'),
(1222, 9, 'Seguí'),
(1223, 9, 'Sir Leonard'),
(1224, 9, 'Sosa'),
(1225, 9, 'Tabossi'),
(1226, 9, 'Tezanos Pinto'),
(1227, 9, 'Ubajay'),
(1228, 9, 'Urdinarrain'),
(1229, 9, 'Veinte de Septiembre'),
(1230, 9, 'Viale'),
(1231, 9, 'Victoria'),
(1232, 9, 'Villa Clara'),
(1233, 9, 'Villa del Rosario'),
(1234, 9, 'Villa Domínguez'),
(1235, 9, 'Villa Elisa'),
(1236, 9, 'Villa Fontana'),
(1237, 9, 'Villa Gdor. Etchevehere'),
(1238, 9, 'Villa Mantero'),
(1239, 9, 'Villa Paranacito'),
(1240, 9, 'Villa Urquiza'),
(1241, 9, 'Villaguay'),
(1242, 9, 'Walter Moss'),
(1243, 9, 'Yacaré'),
(1244, 9, 'Yeso Oeste'),
(1245, 10, 'Buena Vista'),
(1246, 10, 'Clorinda'),
(1247, 10, 'Col. Pastoril'),
(1248, 10, 'Cte. Fontana'),
(1249, 10, 'El Colorado'),
(1250, 10, 'El Espinillo'),
(1251, 10, 'Estanislao Del Campo'),
(1252, 10, '10'),
(1253, 10, 'Fortín Lugones'),
(1254, 10, 'Gral. Lucio V. Mansilla'),
(1255, 10, 'Gral. Manuel Belgrano'),
(1256, 10, 'Gral. Mosconi'),
(1257, 10, 'Gran Guardia'),
(1258, 10, 'Herradura'),
(1259, 10, 'Ibarreta'),
(1260, 10, 'Ing. Juárez'),
(1261, 10, 'Laguna Blanca'),
(1262, 10, 'Laguna Naick Neck'),
(1263, 10, 'Laguna Yema'),
(1264, 10, 'Las Lomitas'),
(1265, 10, 'Los Chiriguanos'),
(1266, 10, 'Mayor V. Villafañe'),
(1267, 10, 'Misión San Fco.'),
(1268, 10, 'Palo Santo'),
(1269, 10, 'Pirané'),
(1270, 10, 'Pozo del Maza'),
(1271, 10, 'Riacho He-He'),
(1272, 10, 'San Hilario'),
(1273, 10, 'San Martín II'),
(1274, 10, 'Siete Palmas'),
(1275, 10, 'Subteniente Perín'),
(1276, 10, 'Tres Lagunas'),
(1277, 10, 'Villa Dos Trece'),
(1278, 10, 'Villa Escolar'),
(1279, 10, 'Villa Gral. Güemes'),
(1280, 11, 'Abdon Castro Tolay'),
(1281, 11, 'Abra Pampa'),
(1282, 11, 'Abralaite'),
(1283, 11, 'Aguas Calientes'),
(1284, 11, 'Arrayanal'),
(1285, 11, 'Barrios'),
(1286, 11, 'Caimancito'),
(1287, 11, 'Calilegua'),
(1288, 11, 'Cangrejillos'),
(1289, 11, 'Caspala'),
(1290, 11, 'Catuá'),
(1291, 11, 'Cieneguillas'),
(1292, 11, 'Coranzulli'),
(1293, 11, 'Cusi-Cusi'),
(1294, 11, 'El Aguilar'),
(1295, 11, 'El Carmen'),
(1296, 11, 'El Cóndor'),
(1297, 11, 'El Fuerte'),
(1298, 11, 'El Piquete'),
(1299, 11, 'El Talar'),
(1300, 11, 'Fraile Pintado'),
(1301, 11, 'Hipólito Yrigoyen'),
(1302, 11, 'Huacalera'),
(1303, 11, 'Humahuaca'),
(1304, 11, 'La Esperanza'),
(1305, 11, 'La Mendieta'),
(1306, 11, 'La Quiaca'),
(1307, 11, 'Ledesma'),
(1308, 11, 'Libertador Gral. San Martin'),
(1309, 11, 'Maimara'),
(1310, 11, 'Mina Pirquitas'),
(1311, 11, 'Monterrico'),
(1312, 11, 'Palma Sola'),
(1313, 11, 'Palpalá'),
(1314, 11, 'Pampa Blanca'),
(1315, 11, 'Pampichuela'),
(1316, 11, 'Perico'),
(1317, 11, 'Puesto del Marqués'),
(1318, 11, 'Puesto Viejo'),
(1319, 11, 'Pumahuasi'),
(1320, 11, 'Purmamarca'),
(1321, 11, 'Rinconada'),
(1322, 11, 'Rodeitos'),
(1323, 11, 'Rosario de Río Grande'),
(1324, 11, 'San Antonio'),
(1325, 11, 'San Francisco'),
(1326, 11, 'San Pedro'),
(1327, 11, 'San Rafael'),
(1328, 11, 'San Salvador'),
(1329, 11, 'Santa Ana'),
(1330, 11, 'Santa Catalina'),
(1331, 11, 'Santa Clara'),
(1332, 11, 'Susques'),
(1333, 11, 'Tilcara'),
(1334, 11, 'Tres Cruces'),
(1335, 11, 'Tumbaya'),
(1336, 11, 'Valle Grande'),
(1337, 11, 'Vinalito'),
(1338, 11, 'Volcán'),
(1339, 11, 'Yala'),
(1340, 11, 'Yaví'),
(1341, 11, 'Yuto'),
(1342, 12, 'Abramo'),
(1343, 12, 'Adolfo Van Praet'),
(1344, 12, 'Agustoni'),
(1345, 12, 'Algarrobo del Aguila'),
(1346, 12, 'Alpachiri'),
(1347, 12, 'Alta Italia'),
(1348, 12, 'Anguil'),
(1349, 12, 'Arata'),
(1350, 12, 'Ataliva Roca'),
(1351, 12, 'Bernardo Larroude'),
(1352, 12, 'Bernasconi'),
(1353, 12, 'Caleufú'),
(1354, 12, 'Carro Quemado'),
(1355, 12, 'Catriló'),
(1356, 12, 'Ceballos'),
(1357, 12, 'Chacharramendi'),
(1358, 12, 'Col. Barón'),
(1359, 12, 'Col. Santa María'),
(1360, 12, 'Conhelo'),
(1361, 12, 'Coronel Hilario Lagos'),
(1362, 12, 'Cuchillo-Có'),
(1363, 12, 'Doblas'),
(1364, 12, 'Dorila'),
(1365, 12, 'Eduardo Castex'),
(1366, 12, 'Embajador Martini'),
(1367, 12, 'Falucho'),
(1368, 12, 'Gral. Acha'),
(1369, 12, 'Gral. Manuel Campos'),
(1370, 12, 'Gral. Pico'),
(1371, 12, 'Guatraché'),
(1372, 12, 'Ing. Luiggi'),
(1373, 12, 'Intendente Alvear'),
(1374, 12, 'Jacinto Arauz'),
(1375, 12, 'La Adela'),
(1376, 12, 'La Humada'),
(1377, 12, 'La Maruja'),
(1378, 12, '12'),
(1379, 12, 'La Reforma'),
(1380, 12, 'Limay Mahuida'),
(1381, 12, 'Lonquimay'),
(1382, 12, 'Loventuel'),
(1383, 12, 'Luan Toro'),
(1384, 12, 'Macachín'),
(1385, 12, 'Maisonnave'),
(1386, 12, 'Mauricio Mayer'),
(1387, 12, 'Metileo'),
(1388, 12, 'Miguel Cané'),
(1389, 12, 'Miguel Riglos'),
(1390, 12, 'Monte Nievas'),
(1391, 12, 'Parera'),
(1392, 12, 'Perú'),
(1393, 12, 'Pichi-Huinca'),
(1394, 12, 'Puelches'),
(1395, 12, 'Puelén'),
(1396, 12, 'Quehue'),
(1397, 12, 'Quemú Quemú'),
(1398, 12, 'Quetrequén'),
(1399, 12, 'Rancul'),
(1400, 12, 'Realicó'),
(1401, 12, 'Relmo'),
(1402, 12, 'Rolón'),
(1403, 12, 'Rucanelo'),
(1404, 12, 'Sarah'),
(1405, 12, 'Speluzzi'),
(1406, 12, 'Sta. Isabel'),
(1407, 12, 'Sta. Rosa'),
(1408, 12, 'Sta. Teresa'),
(1409, 12, 'Telén'),
(1410, 12, 'Toay'),
(1411, 12, 'Tomas M. de Anchorena'),
(1412, 12, 'Trenel'),
(1413, 12, 'Unanue'),
(1414, 12, 'Uriburu'),
(1415, 12, 'Veinticinco de Mayo'),
(1416, 12, 'Vertiz'),
(1417, 12, 'Victorica'),
(1418, 12, 'Villa Mirasol'),
(1419, 12, 'Winifreda'),
(1420, 13, 'Arauco'),
(1421, 13, 'Capital'),
(1422, 13, 'Castro Barros'),
(1423, 13, 'Chamical'),
(1424, 13, 'Chilecito'),
(1425, 13, 'Coronel F. Varela'),
(1426, 13, 'Famatina'),
(1427, 13, 'Gral. A.V.Peñaloza'),
(1428, 13, 'Gral. Belgrano'),
(1429, 13, 'Gral. J.F. Quiroga'),
(1430, 13, 'Gral. Lamadrid'),
(1431, 13, 'Gral. Ocampo'),
(1432, 13, 'Gral. San Martín'),
(1433, 13, 'Independencia'),
(1434, 13, 'Rosario Penaloza'),
(1435, 13, 'San Blas de Los Sauces'),
(1436, 13, 'Sanagasta'),
(1437, 13, 'Vinchina'),
(1438, 14, 'Capital'),
(1439, 14, 'Chacras de Coria'),
(1440, 14, 'Dorrego'),
(1441, 14, 'Gllen'),
(1442, 14, 'Godoy Cruz'),
(1443, 14, 'Gral. Alvear'),
(1444, 14, 'Guaymallén'),
(1445, 14, 'Junín'),
(1446, 14, 'La Paz'),
(1447, 14, 'Las Heras'),
(1448, 14, 'Lavalle'),
(1449, 14, 'Luján'),
(1450, 14, 'Luján De Cuyo'),
(1451, 14, 'Maipú'),
(1452, 14, 'Malargüe'),
(1453, 14, 'Rivadavia'),
(1454, 14, 'San Carlos'),
(1455, 14, 'San Martín'),
(1456, 14, 'San Rafael'),
(1457, 14, 'Sta. Rosa'),
(1458, 14, 'Tunuyán'),
(1459, 14, 'Tupungato'),
(1460, 14, 'Villa Nueva'),
(1461, 15, 'Alba Posse'),
(1462, 15, 'Almafuerte'),
(1463, 15, 'Apóstoles'),
(1464, 15, 'Aristóbulo Del Valle'),
(1465, 15, 'Arroyo Del Medio'),
(1466, 15, 'Azara'),
(1467, 15, 'Bdo. De Irigoyen'),
(1468, 15, 'Bonpland'),
(1469, 15, 'Caá Yari'),
(1470, 15, 'Campo Grande'),
(1471, 15, 'Campo Ramón'),
(1472, 15, 'Campo Viera'),
(1473, 15, 'Candelaria'),
(1474, 15, 'Capioví'),
(1475, 15, 'Caraguatay'),
(1476, 15, 'Cdte. Guacurarí'),
(1477, 15, 'Cerro Azul'),
(1478, 15, 'Cerro Corá'),
(1479, 15, 'Col. Alberdi'),
(1480, 15, 'Col. Aurora'),
(1481, 15, 'Col. Delicia'),
(1482, 15, 'Col. Polana'),
(1483, 15, 'Col. Victoria'),
(1484, 15, 'Col. Wanda'),
(1485, 15, 'Concepción De La Sierra'),
(1486, 15, 'Corpus'),
(1487, 15, 'Dos Arroyos'),
(1488, 15, 'Dos de Mayo'),
(1489, 15, 'El Alcázar'),
(1490, 15, 'El Dorado'),
(1491, 15, 'El Soberbio'),
(1492, 15, 'Esperanza'),
(1493, 15, 'F. Ameghino'),
(1494, 15, 'Fachinal'),
(1495, 15, 'Garuhapé'),
(1496, 15, 'Garupá'),
(1497, 15, 'Gdor. López'),
(1498, 15, 'Gdor. Roca'),
(1499, 15, 'Gral. Alvear'),
(1500, 15, 'Gral. Urquiza'),
(1501, 15, 'Guaraní'),
(1502, 15, 'H. Yrigoyen'),
(1503, 15, 'Iguazú'),
(1504, 15, 'Itacaruaré'),
(1505, 15, 'Jardín América'),
(1506, 15, 'Leandro N. Alem'),
(1507, 15, 'Libertad'),
(1508, 15, 'Loreto'),
(1509, 15, 'Los Helechos'),
(1510, 15, 'Mártires'),
(1511, 15, '15'),
(1512, 15, 'Mojón Grande'),
(1513, 15, 'Montecarlo'),
(1514, 15, 'Nueve de Julio'),
(1515, 15, 'Oberá'),
(1516, 15, 'Olegario V. Andrade'),
(1517, 15, 'Panambí'),
(1518, 15, 'Posadas'),
(1519, 15, 'Profundidad'),
(1520, 15, 'Pto. Iguazú'),
(1521, 15, 'Pto. Leoni'),
(1522, 15, 'Pto. Piray'),
(1523, 15, 'Pto. Rico'),
(1524, 15, 'Ruiz de Montoya'),
(1525, 15, 'San Antonio'),
(1526, 15, 'San Ignacio'),
(1527, 15, 'San Javier'),
(1528, 15, 'San José'),
(1529, 15, 'San Martín'),
(1530, 15, 'San Pedro'),
(1531, 15, 'San Vicente'),
(1532, 15, 'Santiago De Liniers'),
(1533, 15, 'Santo Pipo'),
(1534, 15, 'Sta. Ana'),
(1535, 15, 'Sta. María'),
(1536, 15, 'Tres Capones'),
(1537, 15, 'Veinticinco de Mayo'),
(1538, 15, 'Wanda'),
(1539, 16, 'Aguada San Roque'),
(1540, 16, 'Aluminé'),
(1541, 16, 'Andacollo'),
(1542, 16, 'Añelo'),
(1543, 16, 'Bajada del Agrio'),
(1544, 16, 'Barrancas'),
(1545, 16, 'Buta Ranquil'),
(1546, 16, 'Capital'),
(1547, 16, 'Caviahué'),
(1548, 16, 'Centenario'),
(1549, 16, 'Chorriaca'),
(1550, 16, 'Chos Malal'),
(1551, 16, 'Cipolletti'),
(1552, 16, 'Covunco Abajo'),
(1553, 16, 'Coyuco Cochico'),
(1554, 16, 'Cutral Có'),
(1555, 16, 'El Cholar'),
(1556, 16, 'El Huecú'),
(1557, 16, 'El Sauce'),
(1558, 16, 'Guañacos'),
(1559, 16, 'Huinganco'),
(1560, 16, 'Las Coloradas'),
(1561, 16, 'Las Lajas'),
(1562, 16, 'Las Ovejas'),
(1563, 16, 'Loncopué'),
(1564, 16, 'Los Catutos'),
(1565, 16, 'Los Chihuidos'),
(1566, 16, 'Los Miches'),
(1567, 16, 'Manzano Amargo'),
(1568, 16, '16'),
(1569, 16, 'Octavio Pico'),
(1570, 16, 'Paso Aguerre'),
(1571, 16, 'Picún Leufú'),
(1572, 16, 'Piedra del Aguila'),
(1573, 16, 'Pilo Lil'),
(1574, 16, 'Plaza Huincul'),
(1575, 16, 'Plottier'),
(1576, 16, 'Quili Malal'),
(1577, 16, 'Ramón Castro'),
(1578, 16, 'Rincón de Los Sauces'),
(1579, 16, 'San Martín de Los Andes'),
(1580, 16, 'San Patricio del Chañar'),
(1581, 16, 'Santo Tomás'),
(1582, 16, 'Sauzal Bonito'),
(1583, 16, 'Senillosa'),
(1584, 16, 'Taquimilán'),
(1585, 16, 'Tricao Malal'),
(1586, 16, 'Varvarco'),
(1587, 16, 'Villa Curí Leuvu'),
(1588, 16, 'Villa del Nahueve'),
(1589, 16, 'Villa del Puente Picún Leuvú'),
(1590, 16, 'Villa El Chocón'),
(1591, 16, 'Villa La Angostura'),
(1592, 16, 'Villa Pehuenia'),
(1593, 16, 'Villa Traful'),
(1594, 16, 'Vista Alegre'),
(1595, 16, 'Zapala'),
(1596, 17, 'Aguada Cecilio'),
(1597, 17, 'Aguada de Guerra'),
(1598, 17, 'Allén'),
(1599, 17, 'Arroyo de La Ventana'),
(1600, 17, 'Arroyo Los Berros'),
(1601, 17, 'Bariloche'),
(1602, 17, 'Calte. Cordero'),
(1603, 17, 'Campo Grande'),
(1604, 17, 'Catriel'),
(1605, 17, 'Cerro Policía'),
(1606, 17, 'Cervantes'),
(1607, 17, 'Chelforo'),
(1608, 17, 'Chimpay'),
(1609, 17, 'Chinchinales'),
(1610, 17, 'Chipauquil'),
(1611, 17, 'Choele Choel'),
(1612, 17, 'Cinco Saltos'),
(1613, 17, 'Cipolletti'),
(1614, 17, 'Clemente Onelli'),
(1615, 17, 'Colán Conhue'),
(1616, 17, 'Comallo'),
(1617, 17, 'Comicó'),
(1618, 17, 'Cona Niyeu'),
(1619, 17, 'Coronel Belisle'),
(1620, 17, 'Cubanea'),
(1621, 17, 'Darwin'),
(1622, 17, 'Dina Huapi'),
(1623, 17, 'El Bolsón'),
(1624, 17, 'El Caín'),
(1625, 17, 'El Manso'),
(1626, 17, 'Gral. Conesa'),
(1627, 17, 'Gral. Enrique Godoy'),
(1628, 17, 'Gral. Fernandez Oro'),
(1629, 17, 'Gral. Roca'),
(1630, 17, 'Guardia Mitre'),
(1631, 17, 'Ing. Huergo'),
(1632, 17, 'Ing. Jacobacci'),
(1633, 17, 'Laguna Blanca'),
(1634, 17, 'Lamarque'),
(1635, 17, 'Las Grutas'),
(1636, 17, 'Los Menucos'),
(1637, 17, 'Luis Beltrán'),
(1638, 17, 'Mainqué'),
(1639, 17, 'Mamuel Choique'),
(1640, 17, 'Maquinchao'),
(1641, 17, 'Mencué'),
(1642, 17, 'Mtro. Ramos Mexia'),
(1643, 17, 'Nahuel Niyeu'),
(1644, 17, 'Naupa Huen'),
(1645, 17, 'Ñorquinco'),
(1646, 17, 'Ojos de Agua'),
(1647, 17, 'Paso de Agua'),
(1648, 17, 'Paso Flores'),
(1649, 17, 'Peñas Blancas'),
(1650, 17, 'Pichi Mahuida'),
(1651, 17, 'Pilcaniyeu'),
(1652, 17, 'Pomona'),
(1653, 17, 'Prahuaniyeu'),
(1654, 17, 'Rincón Treneta'),
(1655, 17, 'Río Chico'),
(1656, 17, 'Río Colorado'),
(1657, 17, 'Roca'),
(1658, 17, 'San Antonio Oeste'),
(1659, 17, 'San Javier'),
(1660, 17, 'Sierra Colorada'),
(1661, 17, 'Sierra Grande'),
(1662, 17, 'Sierra Pailemán'),
(1663, 17, 'Valcheta'),
(1664, 17, 'Valle Azul'),
(1665, 17, 'Viedma'),
(1666, 17, 'Villa Llanquín'),
(1667, 17, 'Villa Mascardi'),
(1668, 17, 'Villa Regina'),
(1669, 17, 'Yaminué'),
(1670, 18, 'A. Saravia'),
(1671, 18, 'Aguaray'),
(1672, 18, 'Angastaco'),
(1673, 18, 'Animaná'),
(1674, 18, 'Cachi'),
(1675, 18, 'Cafayate'),
(1676, 18, 'Campo Quijano'),
(1677, 18, 'Campo Santo'),
(1678, 18, 'Capital'),
(1679, 18, 'Cerrillos'),
(1680, 18, 'Chicoana'),
(1681, 18, 'Col. Sta. Rosa'),
(1682, 18, 'Coronel Moldes'),
(1683, 18, 'El Bordo'),
(1684, 18, 'El Carril'),
(1685, 18, 'El Galpón'),
(1686, 18, 'El Jardín'),
(1687, 18, 'El Potrero'),
(1688, 18, 'El Quebrachal'),
(1689, 18, 'El Tala'),
(1690, 18, 'Embarcación'),
(1691, 18, 'Gral. Ballivian'),
(1692, 18, 'Gral. Güemes'),
(1693, 18, 'Gral. Mosconi'),
(1694, 18, 'Gral. Pizarro'),
(1695, 18, 'Guachipas'),
(1696, 18, 'Hipólito Yrigoyen'),
(1697, 18, 'Iruyá'),
(1698, 18, 'Isla De Cañas'),
(1699, 18, 'J. V. Gonzalez'),
(1700, 18, 'La Caldera'),
(1701, 18, 'La Candelaria'),
(1702, 18, 'La Merced'),
(1703, 18, 'La Poma'),
(1704, 18, 'La Viña'),
(1705, 18, 'Las Lajitas'),
(1706, 18, 'Los Toldos'),
(1707, 18, 'Metán'),
(1708, 18, 'Molinos'),
(1709, 18, 'Nazareno'),
(1710, 18, 'Orán'),
(1711, 18, 'Payogasta'),
(1712, 18, 'Pichanal'),
(1713, 18, 'Prof. S. Mazza'),
(1714, 18, 'Río Piedras'),
(1715, 18, 'Rivadavia Banda Norte'),
(1716, 18, 'Rivadavia Banda Sur'),
(1717, 18, 'Rosario de La Frontera'),
(1718, 18, 'Rosario de Lerma'),
(1719, 18, 'Saclantás'),
(1720, 18, '18'),
(1721, 18, 'San Antonio'),
(1722, 18, 'San Carlos'),
(1723, 18, 'San José De Metán'),
(1724, 18, 'San Ramón'),
(1725, 18, 'Santa Victoria E.'),
(1726, 18, 'Santa Victoria O.'),
(1727, 18, 'Tartagal'),
(1728, 18, 'Tolar Grande'),
(1729, 18, 'Urundel'),
(1730, 18, 'Vaqueros'),
(1731, 18, 'Villa San Lorenzo'),
(1732, 19, 'Albardón'),
(1733, 19, 'Angaco'),
(1734, 19, 'Calingasta'),
(1735, 19, 'Capital'),
(1736, 19, 'Caucete'),
(1737, 19, 'Chimbas'),
(1738, 19, 'Iglesia'),
(1739, 19, 'Jachal'),
(1740, 19, 'Nueve de Julio'),
(1741, 19, 'Pocito'),
(1742, 19, 'Rawson'),
(1743, 19, 'Rivadavia'),
(1745, 19, 'San Martín'),
(1746, 19, 'Santa Lucía'),
(1747, 19, 'Sarmiento'),
(1748, 19, 'Ullum'),
(1749, 19, 'Valle Fértil'),
(1750, 19, 'Veinticinco de Mayo'),
(1751, 19, 'Zonda'),
(1752, 20, 'Alto Pelado'),
(1753, 20, 'Alto Pencoso'),
(1754, 20, 'Anchorena'),
(1755, 20, 'Arizona'),
(1756, 20, 'Bagual'),
(1757, 20, 'Balde'),
(1758, 20, 'Batavia'),
(1759, 20, 'Beazley'),
(1760, 20, 'Buena Esperanza'),
(1761, 20, 'Candelaria'),
(1762, 20, 'Capital'),
(1763, 20, 'Carolina'),
(1764, 20, 'Carpintería'),
(1765, 20, 'Concarán'),
(1766, 20, 'Cortaderas'),
(1767, 20, 'El Morro'),
(1768, 20, 'El Trapiche'),
(1769, 20, 'El Volcán'),
(1770, 20, 'Fortín El Patria'),
(1771, 20, 'Fortuna'),
(1772, 20, 'Fraga'),
(1773, 20, 'Juan Jorba'),
(1774, 20, 'Juan Llerena'),
(1775, 20, 'Juana Koslay'),
(1776, 20, 'Justo Daract'),
(1777, 20, 'La Calera'),
(1778, 20, 'La Florida'),
(1779, 20, 'La Punilla'),
(1780, 20, 'La Toma'),
(1781, 20, 'Lafinur'),
(1782, 20, 'Las Aguadas'),
(1783, 20, 'Las Chacras'),
(1784, 20, 'Las Lagunas'),
(1785, 20, 'Las Vertientes'),
(1786, 20, 'Lavaisse'),
(1787, 20, 'Leandro N. Alem'),
(1788, 20, 'Los Molles'),
(1789, 20, 'Luján'),
(1790, 20, 'Mercedes'),
(1791, 20, 'Merlo'),
(1792, 20, 'Naschel'),
(1793, 20, 'Navia'),
(1794, 20, 'Nogolí'),
(1795, 20, 'Nueva Galia'),
(1796, 20, 'Papagayos'),
(1797, 20, 'Paso Grande'),
(1798, 20, 'Potrero de Los Funes'),
(1799, 20, 'Quines'),
(1800, 20, 'Renca'),
(1801, 20, 'Saladillo'),
(1802, 20, 'San Francisco'),
(1803, 20, 'San Gerónimo'),
(1804, 20, 'San Martín'),
(1805, 20, 'San Pablo'),
(1806, 20, 'Santa Rosa de Conlara'),
(1807, 20, 'Talita'),
(1808, 20, 'Tilisarao'),
(1809, 20, 'Unión'),
(1810, 20, 'Villa de La Quebrada'),
(1811, 20, 'Villa de Praga'),
(1812, 20, 'Villa del Carmen'),
(1813, 20, 'Villa Gral. Roca'),
(1814, 20, 'Villa Larca'),
(1815, 20, 'Villa Mercedes'),
(1816, 20, 'Zanjitas'),
(1817, 21, 'Calafate'),
(1818, 21, 'Caleta Olivia'),
(1819, 21, 'Cañadón Seco'),
(1820, 21, 'Comandante Piedrabuena'),
(1821, 21, 'El Calafate'),
(1822, 21, 'El Chaltén'),
(1823, 21, 'Gdor. Gregores'),
(1824, 21, 'Hipólito Yrigoyen'),
(1825, 21, 'Jaramillo'),
(1826, 21, 'Koluel Kaike'),
(1827, 21, 'Las Heras'),
(1828, 21, 'Los Antiguos'),
(1829, 21, 'Perito Moreno'),
(1830, 21, 'Pico Truncado'),
(1831, 21, 'Pto. Deseado'),
(1832, 21, 'Pto. San Julián'),
(1833, 21, 'Pto. 21'),
(1834, 21, 'Río Cuarto'),
(1835, 21, 'Río Gallegos'),
(1836, 21, 'Río Turbio'),
(1837, 21, 'Tres Lagos'),
(1838, 21, 'Veintiocho De Noviembre'),
(1839, 22, 'Aarón Castellanos'),
(1840, 22, 'Acebal'),
(1841, 22, 'Aguará Grande'),
(1842, 22, 'Albarellos'),
(1843, 22, 'Alcorta'),
(1844, 22, 'Aldao'),
(1845, 22, 'Alejandra'),
(1846, 22, 'Álvarez'),
(1847, 22, 'Ambrosetti'),
(1848, 22, 'Amenábar'),
(1849, 22, 'Angélica'),
(1850, 22, 'Angeloni'),
(1851, 22, 'Arequito'),
(1852, 22, 'Arminda'),
(1853, 22, 'Armstrong'),
(1854, 22, 'Arocena'),
(1855, 22, 'Arroyo Aguiar'),
(1856, 22, 'Arroyo Ceibal'),
(1857, 22, 'Arroyo Leyes'),
(1858, 22, 'Arroyo Seco'),
(1859, 22, 'Arrufó'),
(1860, 22, 'Arteaga'),
(1861, 22, 'Ataliva'),
(1862, 22, 'Aurelia'),
(1863, 22, 'Avellaneda'),
(1864, 22, 'Barrancas'),
(1865, 22, 'Bauer Y Sigel'),
(1866, 22, 'Bella Italia'),
(1867, 22, 'Berabevú'),
(1868, 22, 'Berna'),
(1869, 22, 'Bernardo de Irigoyen'),
(1870, 22, 'Bigand'),
(1871, 22, 'Bombal'),
(1872, 22, 'Bouquet'),
(1873, 22, 'Bustinza'),
(1874, 22, 'Cabal'),
(1875, 22, 'Cacique Ariacaiquin'),
(1876, 22, 'Cafferata'),
(1877, 22, 'Calchaquí'),
(1878, 22, 'Campo Andino'),
(1879, 22, 'Campo Piaggio'),
(1880, 22, 'Cañada de Gómez'),
(1881, 22, 'Cañada del Ucle'),
(1882, 22, 'Cañada Rica'),
(1883, 22, 'Cañada Rosquín'),
(1884, 22, 'Candioti'),
(1885, 22, 'Capital'),
(1886, 22, 'Capitán Bermúdez'),
(1887, 22, 'Capivara'),
(1888, 22, 'Carcarañá'),
(1889, 22, 'Carlos Pellegrini'),
(1890, 22, 'Carmen'),
(1891, 22, 'Carmen Del Sauce'),
(1892, 22, 'Carreras'),
(1893, 22, 'Carrizales'),
(1894, 22, 'Casalegno'),
(1895, 22, 'Casas'),
(1896, 22, 'Casilda'),
(1897, 22, 'Castelar'),
(1898, 22, 'Castellanos'),
(1899, 22, 'Cayastá'),
(1900, 22, 'Cayastacito'),
(1901, 22, 'Centeno'),
(1902, 22, 'Cepeda'),
(1903, 22, 'Ceres'),
(1904, 22, 'Chabás'),
(1905, 22, 'Chañar Ladeado'),
(1906, 22, 'Chapuy'),
(1907, 22, 'Chovet'),
(1908, 22, 'Christophersen'),
(1909, 22, 'Classon'),
(1910, 22, 'Cnel. Arnold'),
(1911, 22, 'Cnel. Bogado'),
(1912, 22, 'Cnel. Dominguez'),
(1913, 22, 'Cnel. Fraga'),
(1914, 22, 'Col. Aldao'),
(1915, 22, 'Col. Ana'),
(1916, 22, 'Col. Belgrano'),
(1917, 22, 'Col. Bicha'),
(1918, 22, 'Col. Bigand'),
(1919, 22, 'Col. Bossi'),
(1920, 22, 'Col. Cavour'),
(1921, 22, 'Col. Cello'),
(1922, 22, 'Col. Dolores'),
(1923, 22, 'Col. Dos Rosas'),
(1924, 22, 'Col. Durán'),
(1925, 22, 'Col. Iturraspe'),
(1926, 22, 'Col. Margarita'),
(1927, 22, 'Col. Mascias'),
(1928, 22, 'Col. Raquel'),
(1929, 22, 'Col. Rosa'),
(1930, 22, 'Col. San José'),
(1931, 22, 'Constanza'),
(1932, 22, 'Coronda'),
(1933, 22, 'Correa'),
(1934, 22, 'Crispi'),
(1935, 22, 'Cululú'),
(1936, 22, 'Curupayti'),
(1937, 22, 'Desvio Arijón'),
(1938, 22, 'Diaz'),
(1939, 22, 'Diego de Alvear'),
(1940, 22, 'Egusquiza'),
(1941, 22, 'El Arazá'),
(1942, 22, 'El Rabón'),
(1943, 22, 'El Sombrerito'),
(1944, 22, 'El Trébol'),
(1945, 22, 'Elisa'),
(1946, 22, 'Elortondo'),
(1947, 22, 'Emilia'),
(1948, 22, 'Empalme San Carlos'),
(1949, 22, 'Empalme Villa Constitucion'),
(1950, 22, 'Esmeralda'),
(1951, 22, 'Esperanza'),
(1952, 22, 'Estación Alvear'),
(1953, 22, 'Estacion Clucellas'),
(1954, 22, 'Esteban Rams'),
(1955, 22, 'Esther'),
(1956, 22, 'Esustolia'),
(1957, 22, 'Eusebia'),
(1958, 22, 'Felicia'),
(1959, 22, 'Fidela'),
(1960, 22, 'Fighiera'),
(1961, 22, 'Firmat'),
(1962, 22, 'Florencia'),
(1963, 22, 'Fortín Olmos'),
(1964, 22, 'Franck'),
(1965, 22, 'Fray Luis Beltrán'),
(1966, 22, 'Frontera'),
(1967, 22, 'Fuentes'),
(1968, 22, 'Funes'),
(1969, 22, 'Gaboto'),
(1970, 22, 'Galisteo'),
(1971, 22, 'Gálvez'),
(1972, 22, 'Garabalto'),
(1973, 22, 'Garibaldi'),
(1974, 22, 'Gato Colorado'),
(1975, 22, 'Gdor. Crespo'),
(1976, 22, 'Gessler'),
(1977, 22, 'Godoy'),
(1978, 22, 'Golondrina'),
(1979, 22, 'Gral. Gelly'),
(1980, 22, 'Gral. Lagos'),
(1981, 22, 'Granadero Baigorria'),
(1982, 22, 'Gregoria Perez De Denis'),
(1983, 22, 'Grutly'),
(1984, 22, 'Guadalupe N.'),
(1985, 22, 'Gödeken'),
(1986, 22, 'Helvecia'),
(1987, 22, 'Hersilia'),
(1988, 22, 'Hipatía'),
(1989, 22, 'Huanqueros'),
(1990, 22, 'Hugentobler'),
(1991, 22, 'Hughes'),
(1992, 22, 'Humberto 1º'),
(1993, 22, 'Humboldt'),
(1994, 22, 'Ibarlucea'),
(1995, 22, 'Ing. Chanourdie'),
(1996, 22, 'Intiyaco'),
(1997, 22, 'Ituzaingó'),
(1998, 22, 'Jacinto L. Aráuz'),
(1999, 22, 'Josefina'),
(2000, 22, 'Juan B. Molina'),
(2001, 22, 'Juan de Garay'),
(2002, 22, 'Juncal'),
(2003, 22, 'La Brava'),
(2004, 22, 'La Cabral'),
(2005, 22, 'La Camila'),
(2006, 22, 'La Chispa'),
(2007, 22, 'La Clara'),
(2008, 22, 'La Criolla'),
(2009, 22, 'La Gallareta'),
(2010, 22, 'La Lucila'),
(2011, 22, 'La Pelada'),
(2012, 22, 'La Penca'),
(2013, 22, 'La Rubia'),
(2014, 22, 'La Sarita'),
(2015, 22, 'La Vanguardia'),
(2016, 22, 'Labordeboy'),
(2017, 22, 'Laguna Paiva'),
(2018, 22, 'Landeta'),
(2019, 22, 'Lanteri'),
(2020, 22, 'Larrechea'),
(2021, 22, 'Las Avispas'),
(2022, 22, 'Las Bandurrias'),
(2023, 22, 'Las Garzas'),
(2024, 22, 'Las Palmeras'),
(2025, 22, 'Las Parejas'),
(2026, 22, 'Las Petacas'),
(2027, 22, 'Las Rosas'),
(2028, 22, 'Las Toscas'),
(2029, 22, 'Las Tunas'),
(2030, 22, 'Lazzarino'),
(2031, 22, 'Lehmann'),
(2032, 22, 'Llambi Campbell'),
(2033, 22, 'Logroño'),
(2034, 22, 'Loma Alta'),
(2035, 22, 'López'),
(2036, 22, 'Los Amores'),
(2037, 22, 'Los Cardos'),
(2038, 22, 'Los Laureles'),
(2039, 22, 'Los Molinos'),
(2040, 22, 'Los Quirquinchos'),
(2041, 22, 'Lucio V. Lopez'),
(2042, 22, 'Luis Palacios'),
(2043, 22, 'Ma. Juana'),
(2044, 22, 'Ma. Luisa'),
(2045, 22, 'Ma. Susana'),
(2046, 22, 'Ma. Teresa'),
(2047, 22, 'Maciel'),
(2048, 22, 'Maggiolo'),
(2049, 22, 'Malabrigo'),
(2050, 22, 'Marcelino Escalada'),
(2051, 22, 'Margarita'),
(2052, 22, 'Matilde'),
(2053, 22, 'Mauá'),
(2054, 22, 'Máximo Paz'),
(2055, 22, 'Melincué'),
(2056, 22, 'Miguel Torres'),
(2057, 22, 'Moisés Ville'),
(2058, 22, 'Monigotes'),
(2059, 22, 'Monje'),
(2060, 22, 'Monte Obscuridad'),
(2061, 22, 'Monte Vera'),
(2062, 22, 'Montefiore'),
(2063, 22, 'Montes de Oca'),
(2064, 22, 'Murphy'),
(2065, 22, 'Ñanducita'),
(2066, 22, 'Naré'),
(2067, 22, 'Nelson'),
(2068, 22, 'Nicanor E. Molinas'),
(2069, 22, 'Nuevo Torino'),
(2070, 22, 'Oliveros'),
(2071, 22, 'Palacios'),
(2072, 22, 'Pavón'),
(2073, 22, 'Pavón Arriba'),
(2074, 22, 'Pedro Gómez Cello'),
(2075, 22, 'Pérez'),
(2076, 22, 'Peyrano'),
(2077, 22, 'Piamonte'),
(2078, 22, 'Pilar'),
(2079, 22, 'Piñero'),
(2080, 22, 'Plaza Clucellas'),
(2081, 22, 'Portugalete'),
(2082, 22, 'Pozo Borrado'),
(2083, 22, 'Progreso'),
(2084, 22, 'Providencia'),
(2085, 22, 'Pte. Roca'),
(2086, 22, 'Pueblo Andino'),
(2087, 22, 'Pueblo Esther'),
(2088, 22, 'Pueblo Gral. San Martín'),
(2089, 22, 'Pueblo Irigoyen'),
(2090, 22, 'Pueblo Marini'),
(2091, 22, 'Pueblo Muñoz'),
(2092, 22, 'Pueblo Uranga'),
(2093, 22, 'Pujato'),
(2094, 22, 'Pujato N.');
INSERT INTO `localidades` (`id`, `id_privincia`, `localidad`) VALUES
(2095, 22, 'Rafaela'),
(2096, 22, 'Ramayón'),
(2097, 22, 'Ramona'),
(2098, 22, 'Reconquista'),
(2099, 22, 'Recreo'),
(2100, 22, 'Ricardone'),
(2101, 22, 'Rivadavia'),
(2102, 22, 'Roldán'),
(2103, 22, 'Romang'),
(2104, 22, 'Rosario'),
(2105, 22, 'Rueda'),
(2106, 22, 'Rufino'),
(2107, 22, 'Sa Pereira'),
(2108, 22, 'Saguier'),
(2109, 22, 'Saladero M. Cabal'),
(2110, 22, 'Salto Grande'),
(2111, 22, 'San Agustín'),
(2112, 22, 'San Antonio de Obligado'),
(2113, 22, 'San Bernardo (N.J.)'),
(2114, 22, 'San Bernardo (S.J.)'),
(2115, 22, 'San Carlos Centro'),
(2116, 22, 'San Carlos N.'),
(2117, 22, 'San Carlos S.'),
(2118, 22, 'San Cristóbal'),
(2119, 22, 'San Eduardo'),
(2120, 22, 'San Eugenio'),
(2121, 22, 'San Fabián'),
(2122, 22, 'San Fco. de Santa Fé'),
(2123, 22, 'San Genaro'),
(2124, 22, 'San Genaro N.'),
(2125, 22, 'San Gregorio'),
(2126, 22, 'San Guillermo'),
(2127, 22, 'San Javier'),
(2128, 22, 'San Jerónimo del Sauce'),
(2129, 22, 'San Jerónimo N.'),
(2130, 22, 'San Jerónimo S.'),
(2131, 22, 'San Jorge'),
(2132, 22, 'San José de La Esquina'),
(2133, 22, 'San José del Rincón'),
(2134, 22, 'San Justo'),
(2135, 22, 'San Lorenzo'),
(2136, 22, 'San Mariano'),
(2137, 22, 'San Martín de Las Escobas'),
(2138, 22, 'San Martín N.'),
(2139, 22, 'San Vicente'),
(2140, 22, 'Sancti Spititu'),
(2141, 22, 'Sanford'),
(2142, 22, 'Santo Domingo'),
(2143, 22, 'Santo Tomé'),
(2144, 22, 'Santurce'),
(2145, 22, 'Sargento Cabral'),
(2146, 22, 'Sarmiento'),
(2147, 22, 'Sastre'),
(2148, 22, 'Sauce Viejo'),
(2149, 22, 'Serodino'),
(2150, 22, 'Silva'),
(2151, 22, 'Soldini'),
(2152, 22, 'Soledad'),
(2153, 22, 'Soutomayor'),
(2154, 22, 'Sta. Clara de Buena Vista'),
(2155, 22, 'Sta. Clara de Saguier'),
(2156, 22, 'Sta. Isabel'),
(2157, 22, 'Sta. Margarita'),
(2158, 22, 'Sta. Maria Centro'),
(2159, 22, 'Sta. María N.'),
(2160, 22, 'Sta. Rosa'),
(2161, 22, 'Sta. Teresa'),
(2162, 22, 'Suardi'),
(2163, 22, 'Sunchales'),
(2164, 22, 'Susana'),
(2165, 22, 'Tacuarendí'),
(2166, 22, 'Tacural'),
(2167, 22, 'Tartagal'),
(2168, 22, 'Teodelina'),
(2169, 22, 'Theobald'),
(2170, 22, 'Timbúes'),
(2171, 22, 'Toba'),
(2172, 22, 'Tortugas'),
(2173, 22, 'Tostado'),
(2174, 22, 'Totoras'),
(2175, 22, 'Traill'),
(2176, 22, 'Venado Tuerto'),
(2177, 22, 'Vera'),
(2178, 22, 'Vera y Pintado'),
(2179, 22, 'Videla'),
(2180, 22, 'Vila'),
(2181, 22, 'Villa Amelia'),
(2182, 22, 'Villa Ana'),
(2183, 22, 'Villa Cañas'),
(2184, 22, 'Villa Constitución'),
(2185, 22, 'Villa Eloísa'),
(2186, 22, 'Villa Gdor. Gálvez'),
(2187, 22, 'Villa Guillermina'),
(2188, 22, 'Villa Minetti'),
(2189, 22, 'Villa Mugueta'),
(2190, 22, 'Villa Ocampo'),
(2191, 22, 'Villa San José'),
(2192, 22, 'Villa Saralegui'),
(2193, 22, 'Villa Trinidad'),
(2194, 22, 'Villada'),
(2195, 22, 'Virginia'),
(2196, 22, 'Wheelwright'),
(2197, 22, 'Zavalla'),
(2198, 22, 'Zenón Pereira'),
(2199, 23, 'Añatuya'),
(2200, 23, 'Árraga'),
(2201, 23, 'Bandera'),
(2202, 23, 'Bandera Bajada'),
(2203, 23, 'Beltrán'),
(2204, 23, 'Brea Pozo'),
(2205, 23, 'Campo Gallo'),
(2206, 23, 'Capital'),
(2207, 23, 'Chilca Juliana'),
(2208, 23, 'Choya'),
(2209, 23, 'Clodomira'),
(2210, 23, 'Col. Alpina'),
(2211, 23, 'Col. Dora'),
(2212, 23, 'Col. El Simbolar Robles'),
(2213, 23, 'El Bobadal'),
(2214, 23, 'El Charco'),
(2215, 23, 'El Mojón'),
(2216, 23, 'Estación Atamisqui'),
(2217, 23, 'Estación Simbolar'),
(2218, 23, 'Fernández'),
(2219, 23, 'Fortín Inca'),
(2220, 23, 'Frías'),
(2221, 23, 'Garza'),
(2222, 23, 'Gramilla'),
(2223, 23, 'Guardia Escolta'),
(2224, 23, 'Herrera'),
(2225, 23, 'Icaño'),
(2226, 23, 'Ing. Forres'),
(2227, 23, 'La Banda'),
(2228, 23, 'La Cañada'),
(2229, 23, 'Laprida'),
(2230, 23, 'Lavalle'),
(2231, 23, 'Loreto'),
(2232, 23, 'Los Juríes'),
(2233, 23, 'Los Núñez'),
(2234, 23, 'Los Pirpintos'),
(2235, 23, 'Los Quiroga'),
(2236, 23, 'Los Telares'),
(2237, 23, 'Lugones'),
(2238, 23, 'Malbrán'),
(2239, 23, 'Matara'),
(2240, 23, 'Medellín'),
(2241, 23, 'Monte Quemado'),
(2242, 23, 'Nueva Esperanza'),
(2243, 23, 'Nueva Francia'),
(2244, 23, 'Palo Negro'),
(2245, 23, 'Pampa de Los Guanacos'),
(2246, 23, 'Pinto'),
(2247, 23, 'Pozo Hondo'),
(2248, 23, 'Quimilí'),
(2249, 23, 'Real Sayana'),
(2250, 23, 'Sachayoj'),
(2251, 23, 'San Pedro de Guasayán'),
(2252, 23, 'Selva'),
(2253, 23, 'Sol de Julio'),
(2254, 23, 'Sumampa'),
(2255, 23, 'Suncho Corral'),
(2256, 23, 'Taboada'),
(2257, 23, 'Tapso'),
(2258, 23, 'Termas de Rio Hondo'),
(2259, 23, 'Tintina'),
(2260, 23, 'Tomas Young'),
(2261, 23, 'Vilelas'),
(2262, 23, 'Villa Atamisqui'),
(2263, 23, 'Villa La Punta'),
(2264, 23, 'Villa Ojo de Agua'),
(2265, 23, 'Villa Río Hondo'),
(2266, 23, 'Villa Salavina'),
(2267, 23, 'Villa Unión'),
(2268, 23, 'Vilmer'),
(2269, 23, 'Weisburd'),
(2270, 24, 'Río Grande'),
(2271, 24, 'Tolhuin'),
(2272, 24, 'Ushuaia'),
(2273, 25, 'Acheral'),
(2274, 25, 'Agua Dulce'),
(2275, 25, 'Aguilares'),
(2276, 25, 'Alderetes'),
(2277, 25, 'Alpachiri'),
(2278, 25, 'Alto Verde'),
(2279, 25, 'Amaicha del Valle'),
(2280, 25, 'Amberes'),
(2281, 25, 'Ancajuli'),
(2282, 25, 'Arcadia'),
(2283, 25, 'Atahona'),
(2284, 25, 'Banda del Río Sali'),
(2285, 25, 'Bella Vista'),
(2286, 25, 'Buena Vista'),
(2287, 25, 'Burruyacú'),
(2288, 25, 'Capitán Cáceres'),
(2289, 25, 'Cevil Redondo'),
(2290, 25, 'Choromoro'),
(2291, 25, 'Ciudacita'),
(2292, 25, 'Colalao del Valle'),
(2293, 25, 'Colombres'),
(2294, 25, 'Concepción'),
(2295, 25, 'Delfín Gallo'),
(2296, 25, 'El Bracho'),
(2297, 25, 'El Cadillal'),
(2298, 25, 'El Cercado'),
(2299, 25, 'El Chañar'),
(2300, 25, 'El Manantial'),
(2301, 25, 'El Mojón'),
(2302, 25, 'El Mollar'),
(2303, 25, 'El Naranjito'),
(2304, 25, 'El Naranjo'),
(2305, 25, 'El Polear'),
(2306, 25, 'El Puestito'),
(2307, 25, 'El Sacrificio'),
(2308, 25, 'El Timbó'),
(2309, 25, 'Escaba'),
(2310, 25, 'Esquina'),
(2311, 25, 'Estación Aráoz'),
(2312, 25, 'Famaillá'),
(2313, 25, 'Gastone'),
(2314, 25, 'Gdor. Garmendia'),
(2315, 25, 'Gdor. Piedrabuena'),
(2316, 25, 'Graneros'),
(2317, 25, 'Huasa Pampa'),
(2318, 25, 'J. B. Alberdi'),
(2319, 25, 'La Cocha'),
(2320, 25, 'La Esperanza'),
(2321, 25, 'La Florida'),
(2322, 25, 'La Ramada'),
(2323, 25, 'La Trinidad'),
(2324, 25, 'Lamadrid'),
(2325, 25, 'Las Cejas'),
(2326, 25, 'Las Talas'),
(2327, 25, 'Las Talitas'),
(2328, 25, 'Los Bulacio'),
(2329, 25, 'Los Gómez'),
(2330, 25, 'Los Nogales'),
(2331, 25, 'Los Pereyra'),
(2332, 25, 'Los Pérez'),
(2333, 25, 'Los Puestos'),
(2334, 25, 'Los Ralos'),
(2335, 25, 'Los Sarmientos'),
(2336, 25, 'Los Sosa'),
(2337, 25, 'Lules'),
(2338, 25, 'M. García Fernández'),
(2339, 25, 'Manuela Pedraza'),
(2340, 25, 'Medinas'),
(2341, 25, 'Monte Bello'),
(2342, 25, 'Monteagudo'),
(2343, 25, 'Monteros'),
(2344, 25, 'Padre Monti'),
(2345, 25, 'Pampa Mayo'),
(2346, 25, 'Quilmes'),
(2347, 25, 'Raco'),
(2348, 25, 'Ranchillos'),
(2349, 25, 'Río Chico'),
(2350, 25, 'Río Colorado'),
(2351, 25, 'Río Seco'),
(2352, 25, 'Rumi Punco'),
(2353, 25, 'San Andrés'),
(2354, 25, 'San Felipe'),
(2355, 25, 'San Ignacio'),
(2356, 25, 'San Javier'),
(2357, 25, 'San José'),
(2358, 25, 'San Miguel de 25'),
(2359, 25, 'San Pedro'),
(2360, 25, 'San Pedro de Colalao'),
(2361, 25, 'Santa Rosa de Leales'),
(2362, 25, 'Sgto. Moya'),
(2363, 25, 'Siete de Abril'),
(2364, 25, 'Simoca'),
(2365, 25, 'Soldado Maldonado'),
(2366, 25, 'Sta. Ana'),
(2367, 25, 'Sta. Cruz'),
(2368, 25, 'Sta. Lucía'),
(2369, 25, 'Taco Ralo'),
(2370, 25, 'Tafí del Valle'),
(2371, 25, 'Tafí Viejo'),
(2372, 25, 'Tapia'),
(2373, 25, 'Teniente Berdina'),
(2374, 25, 'Trancas'),
(2375, 25, 'Villa Belgrano'),
(2376, 25, 'Villa Benjamín Araoz'),
(2377, 25, 'Villa Chiligasta'),
(2378, 25, 'Villa de Leales'),
(2379, 25, 'Villa Quinteros'),
(2380, 25, 'Yánima'),
(2381, 25, 'Yerba Buena'),
(2382, 25, 'Yerba Buena (S)');

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
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` int(10) NOT NULL,
  `provincia` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `provincia`) VALUES
(1, 'Buenos Aires'),
(2, 'Buenos Aires-GBA'),
(3, 'Capital Federal'),
(4, 'Catamarca'),
(5, 'Chaco'),
(6, 'Chubut'),
(7, 'Córdoba'),
(8, 'Corrientes'),
(9, 'Entre Ríos'),
(10, 'Formosa'),
(11, 'Jujuy'),
(12, 'La Pampa'),
(13, 'La Rioja'),
(14, 'Mendoza'),
(15, 'Misiones'),
(16, 'Neuquén'),
(17, 'Río Negro'),
(18, 'Salta'),
(19, 'San Juan'),
(20, 'San Luis'),
(21, 'Santa Cruz'),
(22, 'Santa Fe'),
(23, 'Santiago del Estero'),
(24, 'Tierra del Fuego'),
(25, 'Tucumán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisactions`
--

CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL,
  `actDescription` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisactions`
--

INSERT INTO `sisactions` (`actId`, `actDescription`, `actDescriptionSpanish`) VALUES
(1, 'Add', 'Agregar'),
(2, 'Edit', 'Editar'),
(3, 'Del', 'Eliminar'),
(4, 'View', 'Consultar'),
(5, 'Imprimir', 'Imprimir'),
(6, 'Saldo', 'Consultar Saldo'),
(7, 'Asignar', 'Asignar'),
(8, 'Finalizar', 'Finalizar'),
(9, 'OP', 'OP'),
(10, 'Pedidos', 'Pedidos'),
(11, 'Supervisor', 'Supervisor'),
(12, 'Entregar', 'Entrega de Ordenes'),
(13, 'Lectura', 'Lect horas equipos ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisgroups`
--

CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL,
  `grpName` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpDash` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisgroups`
--

INSERT INTO `sisgroups` (`grpId`, `grpName`, `grpDash`) VALUES
(1, 'Administrador', 'panelEmpleador'),
(2, 'empleadores', 'Equipo'),
(3, 'Higiene y seguridad', 'panelEmpleador');

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
(223, 1, 70);

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
(2, NULL, 'Seguridad', 'fa fa-lock', '', 2),
(3, 2, 'Usuarios', 'fa fa-fw fa-user', 'user', 2),
(4, 2, 'Grupos', 'fa fa-fw fa-users', 'group', 1),
(5, 2, 'Menu', 'fa fa-fw fa-bars', 'menu', 3),
(6, 2, 'Database', 'fa fa-fw fa-database', 'backup', 4),
(7, 13, 'Empleadores', 'fa fa-user', 'Empleador', 4),
(8, 13, 'ABM Actividades', 'fa fa-list', 'Actividad', 5),
(9, 13, 'ABM Liquidaciones', 'fa fa-calculator', 'Liquidacion', 6),
(10, 11, 'ABM Inspectores', 'fa fa-male', 'inspector', 7),
(11, NULL, 'Inspecciones', 'fa fa-clipboard', '', 8),
(12, NULL, 'Denuncias', 'fa fa-upload', '', 9),
(13, NULL, 'Registro Empleladores', 'fa fa-upload', '', 3),
(14, 11, 'Altas inspecciones', 'fa fa-clipboard', 'inspeccion', 0),
(15, 12, 'Carga Masiva', 'fa fa-upload', 'import', 0),
(16, NULL, 'Mis Tareas', '', 'Tarea', 10),
(17, 12, 'Alta Denuncias', 'fa fa-clipboard', 'Denuncia', 0);

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
(70, 17, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisusers`
--

CREATE TABLE `sisusers` (
  `usrId` int(11) NOT NULL,
  `usrNick` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrComision` int(11) NOT NULL,
  `usrPassword` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpId` int(11) NOT NULL,
  `usrimag` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisusers`
--

INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`) VALUES
(0, 'superadmin', 'Super', 'Admin', 0, '21232f297a57a5a743894a0e4a801fc3', 0, '');
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`) VALUES
(1, 'admin', 'Control', 'Operario', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0x89504e470d0a1a0a0000000d49484452000000c8000000c80806000000ad58ae9e0000200049444154785eec5d07745cc5d5feb6ef4aab5e6cc945eebd614cc7b450424de81042f843092d107a2fa177424980d0124802841a4820011208180818631bf7de655bbdacb6b7ffdcfbdebc37efedaeb4925c56b2e71c1f79775f9b79f3cd6ddfbd63696c6d4b62176f7f7cf1453cfee8a3d8b869a336120ebb03c505c5282a2886d3e1ec932364b3d9e070d8118f27108d46d3f6c1e2b4e0963b6ec711471ed927fbb8bd1fdab2ab02a4adad158f3cf8105e78fe3984c3611e67abd5caa0a07f6e97677b8ffd0ebdbedd6e43229144229148b96f7e513ecebfe41738f9945377e833f5859bed72002160dc71ebed78f5d557108d46f81de5b9f314601496f48577b65d9e71f0f0c1b8ffd187307468cd76b97e5fbde82e031021319e7bf6590d18a43e559454745b858ac7e24842d14cad36abf2d7a2fcedcb6dd2b449084542088542dc0d97db0587d389fd0f38007bee350393274fe9cbddebd1b3ef1200f9f8a38f70e98517a2b9a59907a9bbc020b524168b211e8fc362b140d1ed1d3d1af0be7612f5d91ff2c3620342e11086d60cc385175f84934e39a5af75a547cfdbaf014252e3e6eb6fc46bafbda2a95203cb07666d5f442211366e091404885c02452299d82952abb5bd058dad8db0582d38f1c49371cf03f7a1a8a8b84793af2f9cd46f01b270e1029c75fa19d8bcb9968defeaca4128cc2fecf29d90b420a33d1e8bc1ee70c0e974f2f9b9d2046049b5db996a1d01a5a1a5818172d5d5d7e09aebafcf9521daa6cfd12f01f2ccef9ec22d37dfa8490d024757ae5a5a9123912822e13083c2ed766fd381eeedc5489a259349389c8e9d0a0cb91fa47e6d6ddc82b68e360c193c042fbffa4abfb353fa1d40cef9e94ff1fe3ffeceef910cf08ad2ca2ee726490cfa47c070ba9c3d9a802465ac560bdf8bdca9a496d104ea6d238740241a6180dbecb6b497239b685bdcabcb6755ba07d53fa11ddedcda84fae67ad81d76bcf4e7bff4ab984abf0108d91bfff7d39f61d6accf58251a563dac4b5b83a4463010e417edf178ba54a5289660b15ad948a7ffc7a231f66225e28a119f4c629b4ed410c56792c94ea5193f0701d114ee15aa22f56b5b361a5beabf39f0d8dcda82fae6ada0317de89147f1f3f3cedb96b7dd69d7ea170021701c76d04158bf7e7d7a70a459f9e805078341064626e39bbd554e87b672c7a3e4c94a3008d205dcb27d8b2415324903450225f8d9dc2e77e6e32ce0678b865323e4747dbfdfcfbff71420f40c196d2f0be07239110e473460d2f14d2dcd686a6b6090fcfef9e7fb45e0b1cf0384c071c0defb606bdd56b81c2e0c1b349c5738d1e8ff160b108be9ea0ee9f391681479799e14758a2605a959b0004972ef46e3db442ad0a4a1894baa97dd6ecf88257a369a6c9da97a24350860e19012e834d8052a38284e43e020b5b1278d246267cf49d774e7b919a042bd2335b5bda31d4d6d8dfc0e3efaf4933e6f93f4698010380e3ee0406cdab491c131b4ba06c4a112cde172000918d4814020c093d4bcb212301c4e3b12c924a291688acad2934946e7081b82264c67939500140e85599a659c9816c0ed7265e456d10415413ebab737df6b90409d4a05a98342f5cccfcfefb2dbf905f9f077f8b5f1eaf0f9d01ef0a1b5a3052525a598337f5e9f7603f75980c86a158163c8c0a18609e8f6b8114fc40d2a088183269f61a25a94283819d8b294e972667472004d30b24f488da309dfd52a2e82909d79a8486a90540905c329ea9d98d0741dbd59505464746b13805c2e57975da371a285c29b054048d2e67b7590d033907ad7e66f4547b003471ef543bcf2d7bf7679cf5c3da0cf02e4c4e34f60839cc03168c060d6d745cbcbf7b0e11c0a2924446ab4b2b2fad44395239b174880a07f34b99c5900430089bc3f99621af4ccee3c174ba2742a154d489ad0e402961b01332f2f4ffb4a1032cd001176983890543cface66b7eb00211bae13ce3783d7ed44a0437178d0f3d038d4b7d6231a8be0d5d7dfe8b39ead3e09900bce3d17efbcfd164ff841158351e02d3080835f925f7959d44470ad2b9d3a1b10988fa1094ad7a7c0a2d56683cbe9ead400a7f309183ce154e995f6bea44eb9dd2cd932490d52c96842a76bb27a45e0eaf077805426790ccc92421c47d723ef9c3cae5db992dd6e5df52355cee7f321168fa1ae652b8a8b8af1dd82effba4aad5e700f287175ec0b5575fc5e018583a10c5453a03975e12a929bef60e6dce0862e1b6028730b60914a44691b1cc76432752a05bc05381c14678309456ed131e38b3d410f7a1be0afb81258c3fc0e4caa2a222ed51c42a2f248df07c0912261d281fcfee64c9d191ae4f05855ef87c1d0c7e717d5fa01ded81769c7ffe2f70ffc30f756b2872e1e03e0510a28f1c79e86188c6a2282b2a47597199b62292414e86777b5bbb411dc8c61bd3d98b2040709c231e671670229ee424249a583489b715dd8355298f8be32c9980417d2155c9686b989fde8282022f2f20b2d12e83464c5e3a93240d35b21b081cb4ea2b3699d5e80523b7b2dd9131f18aae21ec2492de428ad0df86b67aeed7b2552bfb9c14e9330021a37ccf2953d1dad68ac2fc22941595699e2812ff5ed59b22af72d97a6de429260c66725d92916fa1c9a2ba66699275c9cbca106dce044292784ea7836d08b231d245c4a91f644365ca0a94af4d9283d4230a80ca40122e5f191ce4cdf31678d1e1ebe0fb4762110687dda6b8a16550d16792d0b25d97ae4fe4d50aaa00a1672690121b98bc5a67ffec1cfce6892772413064fd0c7d0620c71e7514bef9e66b381d2e541657f28be5d5db0290688f46630805943c06d132315e391e61b568de209a4834596892083abb421dc99ea44820a5e349ba7566d0b27ecfce02074fe46844b161d2b56c24064d6abb5501ae705d8782212d5f85ae2b8060060dd93844632109198dd373c7e1b01b3968050505fa388800619af88b787e2109598a2413f0b5fbf8a7ad2d5bf93a7d4d8af40980bcf5e61bb8f0fcf379802b8b06a0b0b05053adc863459353b63bb25e1e7a79a0889dd06508749de9e882a261b559584dcb040ad945dcb92a0574047d2ce1f2ddf9ecbe25e993ee1c1908820160b52af9eaec798b4771e0b461387affc9b8f3d90fd90b279a598ab8dcce2e83a7f44e846341482c21452eb9f497b8f39e7b7a39f23beef49c0708a9567b4c9e8cf6f676147b8b51e82dd6dc8fa4f37ac9306cebd826d1ee6c869d79580efae7e07b46424ae4bbb326245167c7b11b371266c35f3694d34a96788ce30c6ea787c1419358ce7294cf21776d42cd8024694352925ce34262862241ec3561085ebae3023eeda6a7dec1bfbe5c66b8ad39224f000810872d83eb9725a4dbc9125df68c91478becb6dabafa6c863a278ec979800897aedbe9465961b9c1555950e4e51720bb74b7f9a89271cac952763634d9368992c19e5e2deacefd45949dae95c923255f8f267820144020ec477951059c76238d847e377f27ce276943eaa9f8dd020b829180011c746c5b470067dffe22366d55542356d160e171d7f863141ccccf83bf2390b1bb444321558f40d4e1f7b31b9c9ea1cddfd6a7c88c390d902fbf98851f1d771cbf84012503e172b935e991c96bd59d099aee58b6256c0a6395274432c96a0bd90a5d498aaeee2d5cc42276920d2882e120e289280abd2e0cab2ac777cbd6a1c053a419d2744f7a2e020d491461608b678944c3f0053b50e22d31d854ed81565c73f651b8e8a4c3521efbcbef57e0570fbd814452b7c1841d23bc764ce4743952ec3e713156291d36663288e0233de796e6cd1833662cbe9a3dbbabe1ca89df731a20fb4c9f8ed56b56a330af10057985baf4b0908fbe90b94b5d79553a1d650b606795c9019b5a7c8156f538b976630a6bb7374d7611d30ada954d41f7222940939a4051595a88738e3b00c7ec3f15f3576cc04d4fbd0dbb858287cac415c0a0ff7b3d7ab0943e93bb36140de0849953f0e5f71b108e286a207d1f8cf8f0ce439763d2c8c119bb77f563afe13fdfac36808a160ef692a9052a44ddad4cef80ec1511fd6f23f73b9268f13523100e60ee82057da2824ace02840a2d9c79daa96c840e2c190807511f0a9449c0014197836d8fee3431b134b6af951c374a8ca32bcf5357f7116060154c75119377a8ab4613361c0d33258348c8c3ab2b70e54f8ec4d1074c63e945ed92fb5fc6677357c1e550723b0818fe5007e28904bc1e6f8a34e908f9505d51883fdf79217ef3cac7f8ecbbb57c1ed91be5256efcfdd12b50e4d56928999ef1900b1f407b87b10f04122a9324ab5b66eabbb81ea9a6c2ab278c759288cdbea63e1338cc598008e941928324886c2892ed41ab56ba5c88ae26646f7f175280404574789aac04886cd42531b90910cabf10f23d2e1cbed7245c72ea61983c6a88e66aa6eb6dac6bc619373d8d365f94ed070253221985cd46f9282e386c3a739925462488b2620f1efed5e93860ea18b6278eb8f47144220984637e9c7bc281b8f6ec63b21e820d5b9b70c2d54fc00aa3eb976c92bcfc3c036d8516ac742c680609537114ba0bb5adcd5b505e5181c5cb9767fd2c3bebc09c0488b03d48ef1d585205724952ac8344fbb6b23dd2797d68b20b17a798fcf462ba0300f38be4cc3e15109198c2c4ada9aac039c71dc8aad3d0aa328d9725f8596dbe006efcdd1bf8e8ebc5f0ba0bf97c9b3d89e1d565b8e1ff8ec5e50fbe86645209e6914a168a04d84679f29a9f323044238fd43fbf5c88d143cb1934430796757b9e2d5abd093fbdedb91490d0855c6e37d3ef4563be56c2288d658a0a792209f87d49cdca4980ccdc6f3f2c5dba84ed0e921e32339522e6e40a4da7f70ae3975775a9b85bb767452f4e30008254a7781445de7cec3769342e3cf910ec3f65b4ea62a5001e69514a7092b429fafce0cb1fe0e5f7bf42301c4571413ebc790e9c79e43eb8f0a443d1ee0fe227b73c8b0d5bda4160b35812d87bc270dc75c9c9183aa05473ddd2e3d3c47ee1bdcf70e5993fec1130e421f8f4bba5b8f2d1d7d282845ccc86746513f397d45ae1dc2096301becaa9a75c59557e196db6fefc5686fff53730e201b36acc7f42953f8652bd2c3aa25fed00a45ea556b4b9bc16620114e039f8d11bcad8754d810645893be4d80703b9d183b6c104e3a743a8ed97f1a860e5427af7473318fc4dff68e00fef9d5f7f876f17acc98588303a68cc190816544141082054fbff509def9742e460caac02f4f3b0c13470c51afa8a2cb4479df967d25c09d78ed13c87715a5300c48e572ba5d066992eedeb29ab5b9a916c3878fc0ecb973b7e5636ef36be51c402ebdf022fcf5afaf22cf9587928252f6c28bc41ff2ad132f4a8e7b506183b05a2a739b8f8ee982b412120084514d7f490230206aaa71c43e9370fa117ba3a6aadc604bc8124261b95b3818a8fd153417f1bdf9b37c3c4b1c59f2080994fa775b8f07d9343fb8e441507883828de646fda41c94ce98d3c29bd5d4dec8654e57af5f9fd304c69c03c8c8a143d1d6dec681307a09b27ac5c67920ac05e964e2ddb69e0c743d0104960caa74a0efcb8b8b3071c4601cb6d738c58e90757b9ebd4aae0735b3a42050180e4899659993930ca092aea205b459827491ddd4cb812290fcf4b667b16c6d1dabc0e95a8ada251d24de99081ae67a71879c02c807efff033f3beb2cd8ac360c2cade26115de2b56b50abd686f257f3ab4e093f905093a057d4fd73107ced2bd500282900ee46e2530b0b1a98261c4a04a4c1f5b8323f79d683082055d435dd20d8447c5a6d009903cb9a5cf0a88c4ef62b667fe2c6c14b659d24a14b34da3dfaf9798487bfa336f7f8247fefc2fd8ad6e78326c15418b1ba53ecb2901a40e1348e83d35b4d6e3d0c37e8037de7e7b7b3ce236b9664e01e4c4134ec0accf3f43517e9116f82a282ce001a6a013d920a45ec9baac1805b205889f44625b6e04129bcdce2e51ce9188ea69b86437884601c3b2a242ec317618f69b3202074e1dd369202d8d7e61f84ab0de694517e0d0248b0a0e63f0453fc3e8d632898a1401a130b70c5feb68da269324d345489adcf5fcbb78e7b3b9a0f58422f966b0108952ae5229337cc90ea9a8a8c492152bb6eb73f6e6e239059051c386a1b5b50515c595cc19b291d4508383946740c4405a8128b94736c869356a6c6b80c7e5c4dd179f8a61e43a05d8ebf3da47df62e1ea0d8a34723a306a8822998ede7f12860c28e580596711e574836b900c9a174a5db1651b439620aa442177159fafd92062e5cff4579518f2a497248f51a228b1c54c364a6f264a57e792117fe7f3efe1db25ab61b5d851e029d48c7903651e00553ea120675fb043720620c4da1d5953c393a7ba6c10bf0fd9fe282a2e445b6b3b038300224b8efad63a941515e0ab176ecd2a42dcd5cbceee7775cd4eb1394c36862618d2db1eca6436a96306d0690175e9b154abc3243a14d0497249fb7dc7eeb247ead73d2fbc879282325671cd9479e1eea5545c4ac97df92f7fc131c72a9cbb5c6b390310617f08d62e0d9410cf9c0c94e766f6a8597ad4b7d4c166b360c1abf76c7770746a73982487b031b4255d4d5cd2e31e26af9350933409a3aa4d6609a5b97295d9af5ccfe4d52290ec24492226f8c5f7bf8c8fbf59ca712c6a72c108618790ba4b923f97330d730620679c722afefdef8f0cf6871854514930180c69196a34e82209e78e0b4f4ecb4addaeab11cd4aa929de29c317ea07e57b5dd0907aa539b9f4138428d1be49ef8d628bc32c10180dbae8489524db3f4e621e6b6204fff4d6e75457bd511b10768860f78e1c390adf7cf7dd767d5d3dbd78ce0064dcc851686c6ad0dcbbd42161a0133991526a4934d33fd188d3e372dab1f6dd477bdaff2ccf93d52973bc41558f542f952c39145bc3eccd523e4b4bbc29b2aedb10c23ba679bb647b5d931cbaa4e172a9b2c4c92049b4eb66d9fb9e1c463caefdcfbb1395c50395050216144a85ec04ed84de21395f363734f4e436dbfd9c9c01c8d0aa2a0482015495566bc69d283bc3196cfea041bd12d2e3a2930ec71d179eb8dd074a5fd853e31cca6f52e043facc60304816e3f9e6488970e1a68d679822e5ba7a256e20d9260c26b34db2fde32472576b8ebf1245f9a59aab9d8288a250b850951bda1a98de9fab01c39c010805dfa80d2a577214640f96a8a641257d443aaaf080ac78eba1ed667b683687fad68ddeabee490e05330a38342f561a2f973ce935db428b7b281242960086e3596228ea96264978af12a36431c76db6d7ea72e42f1fc2fa2d6d9c164c4d76ba888a27c2507ff71fffc00107cedc5e8fd2e3ebe6044084078b28dd1545150a40a4d297c4e00d07c35cad8f9ad05d07949660c1ab77f7b8f3dd3bd1e8b5d2054337248741b288bb771159a7254132b8f92c93772a4592186c12294ea287dcbbd7f51e1e4ddcb28beefb13ca0a7516b1d00a84a12e22eab94a5ccc0980087abb0c10d935484142aa5a22ec0fc1063df7f84370df2f4fede1ebcbfeb4b4718f345eab549b8332ffa4f888c6da35060f33c555d24b0a392ea24a0655720849a18a105d9264f076ed085ba4fae8cbd80e11c96aa224aa282c273c59279e74329e7bf1c5ec5fca0e3a326701224760c98bd5d1e1e72264d45a3b5a39a3ee3f4fddd8ed205fcfc735d51b250904cd06496b736860520d7456b7747a89e163468e95101d725c44d81cca5f63d296eeedd26c919d101731ab5972e25b5b5b9b56bf77c8e0a198b76861cf5fcf763a33a70092eff672691f6a068a8205bc0785889e0bc3aeeec3df6da761512e9b3eee61b621f4496fe05a89f3b5ebc8e01060d3b95a426d4a1b27d1248452ec4ebb0f7f9fd0395d069088384942e26ea567016fcf41a408fb31bf7a94bd93d4643b4478b26a1b37a1acb40ccbd7acd99e8fd2a36be714404482940120ea4a2b4ac7d06f34a064d42ffeebbd3dea744f4e12ea9338578b7b68268805498be2ce54d1a51eaa8341fe3e45d218e228466f93422751c31fecc9121243952a926d618c932852446601aba2c660e8f7643cba738eac66c955e3c53b254e16f5b1b1b5ad3b97dd21c7e63e40d46120714c4db0400f9e3e11afdf77c9f61d24355e6164e54af91cc22b651519817adc43f75699244c1a899299db25d426babe2a0984c4604962b441182e5a1c848a2d88788b38ce187997e32ca240c4f618d0fdcebd0bed1d712d874418ea82fa9ecbaede3e071061d4edb8f887e4bd3244c08d9242c18a901f2c4a14cb43b8bbd4bfbae43049164d34a9935a8e63b08410360579b584c830d91eeaf7e6df45e47d67d92266da8930d485ab570024175dbd7d0e20c22df8f683bf32e4666c8f952fabb88796e7216c1359625895155dad63a56516d27eeae4ba95248fc1e651f1a008004972b0378a3eeb06b9a67ec9f10f214978b31e290e92c99bb53d064fbaa6e2ee7d992b63521314220110e174d90d900c2f82f6fd3874e64cad4883c106a162671283570496be7de9ce5e1723e8cebcd05cb88a212191a9bab231a4df598ac89fd56ba96a97781e73dc4301812e393409a1da238ae090248c88a01bbe17a8331219bb33063d3d96785967defc8c66a8537e083961c47b15eff4fa1b6ec4b537dcd0d3db6c97f372428250cfc8e896e320b2174b06882819b35d3d58e96c0f9965ab310fcdde2811f7b06a1c2c4d323008948a88026c945faf70b5e878255e62f066c99242b23978aa53c16c3adff4bdb025b4e061428aac9b22f2662fdd7699616abddf71a75ecf342279f13303241759bd7d0e20a4af5295d075ef6d6f82a23a5dd2e67bc8c648671224d516516c10fa5e3e4ffaacfba894a55ef542d1ff5325477a1b44f77299e22469b959db0b16c6eb0e38ea528d462482c066809c71c64ff0db679ede310f94e55d72062054ac81e8ec826a62de674f244911400af3dd3bc4c5db950d62889c0b3549e35a293686f066b1c12e6c0ed926a10d7558829893a694929f2c29f83f020ceaf7aaeb97a8e3c226a1bf6c73c8917555826892291d374b38915328f759cea22c0e23800822aa4c2322efa460461c7df4b1f8d3abaf6471b51d7748ce0084e8ee2d2dcd5ab106791065158b00525290b7833958da826f62edea4cddf4deaa5449211f274b13fdff2a18348961b23d58aa28b11011f3d0e324ca6f7ac05c92200a6a34ace9b4941d33d90820a2528d1920c2333964c850cc5b985bd1f49c01c85187fd00dfcd9da3b37925b2a20c10ca1f38629f2978e9d7e76fc7379b2eff23037bd714314feb9db292378bb65e53e3259204d1258b45fd5d569b9248d28aaf6e1dadcc71a304116a575aef961a2751320f776e447de2e9370149a7b6790fed12468d248800c8a0eac1f87ec9e2edf85ebb7fe99c01c8d967fe04fffce7fb1a40a82b22a0240384a2e83fdc6f8fed0c106920358abab09fbb60ef66b22db4efd53d37545b842587458a97c87411cd4b252483eaa992bf57d52f155622dcae4a0a295ea245d4e59cf51d971f2203447eb7bb019225685f7de52fb8ec924b0c19853b1b20d9d920e47d92bc56eced4aefc5926d0da34d227bc3a40cc1b412c364839822ea996c904ef343b27c47bd396c37407a337a0004e55de8a97439512ec62c414e3f623f3c71cd4f7b79c76c4f57d4ad9ec541f468bb2182ce4243ecdea478ba5272da3549226c0e111c546c1273b050b5e4d3d820aad4d9c936c86e80643bdf321c2792a664c2a288b89a01f2f8d567e38c23f7ede51d3b393d8b388828d5a380478d984b6a9412d730c63d0448f4b887f4bba9ca7b2610e8f10d8a8390974b8d941be21d268e96c6d912f5b8d267186ebf01050820e14852ab7222b483dd2a5637467d405929f25cf9da209a23ae7429b2417604cd447f6c33172b3b1bc41031a78b996c13e5a31e27493b4cc2eb2445c915934365f4aa9172637c44f16fe9954fd2e485889b9972dcbbf1aaba7de86e80747bc8524f20572fe50888588888a69b25c88e02487a96ad29afc3146117f10c05133acb57f92c45ccc567f57c1e0d438ebaa44619d423739294e06aa9117353be482e70b1a86bbb01b20d0072f28f7e8cff7df5554a5eface0288dc25d9069141a01c435e2855228893342f95fa85f8ac2512eabc2c0d4c5aa2a10087b6d4f37fcc9242c43c347191059b57bdd00ecd07c90410516379771c244bf05c76f12578f5d5bf68ae5e9a94e42fdf190091ab87503eb5127f90f23d38029e9a07a28147f36609af966a9398395d2ac034478054d74a895fc86c5c138b578b73a4cf4de712426c2c2591e0788af09689788ab8beca21d3682e59beb06e1c964e8288f72a0072f0c187e2ad77ffd68dab6eff4373260e425d159e2c51fa87be938d39fabce36d10490288ea226a8eb998dbc26057848888aeeb1e2cfd6b3df2aed92429f5b4f4a4744326a12242d48791385ad2f722df43e131a6f15e6902a9ebf8876a796db319d81940049b7737d5a48be116dbaf89eaee74b8f064898c42aac57bdb0527e017271ed6eb97a744a8651a89f192e973d2cd554a84b74af99e262745cc15f028c94fb2d74ac42334b5ca6cc348e9b59a2b57e24899258a887b88da400635ac0bef95d6bf8c232980d4eba1661b241ad5f773a7858ff72b0c06210072f2c9a7e2f72f3cdffb9b6dc32be49404a17e11ed5d8e85882a180220c4c53afdf0bdf0f01567f67218baf9f233b17ac55368928397748d80a8575cd4d51b153d6634caa2c36423a8cf2a7bb594db689c2c4d9de2ab0a435eb9456f2b2c324d4665e2f774d0d3c541ccc5e372b1ca7bce018458bd968455abc6e7743a799729192087cd98b0e3a826064920ed1865aa90a8d5e49558b92449140965962492ed62da2f44d382c4fe21e68c402d194a014d12ba174b518bd4ef533209a56a28aab72c6d79d39e22a08bf3d201446c8320727c7667146631f893c68e85df17d0622182f9294ac49004d9e100919f5bc433b4f53e7d5c449c22088a996bf7ca197e46754f2f90286c0ff5aa696af40a59611420696af3f692d22eb21db378958643d2014454351139e973172cc0d0a135ddbdf4763d3ee7240891163ffff433ad3e96a80a2e0f664f0142fa7934164343531bbe9ebf1c6d3e3f7c1d41acdeb80581106d0eaaec4b285a241a85d3e1d03e13146c362b8a0bf3513368008a0bbd183dac1a33268f86c3615722e7d20c4aa98662daa350711d77b2dbade6854a63b89babb89b2447381cc19c452bb172ed66b4f93ab0aeb61e6ded01c4e29df7913aeb70d890e776f16e5c055e0f8a0af3b1cfb4711834402f21dadd59990e2062d123bb92760fde5df6278b517df0defbf0d86f7ea3c542e814e2640582b437618cb7ed3a64cff19daa58aded1d98b7640d96ac5c8fb59bead0d8ea83afdd8f04920804c3bcfd17814549d84b72921151364ceb34fb97e4fc0dd2c3e933b977e5bf674724dd0000200049444154b4bf21b982f3f33da81e508603f79a8a938ed85beb2d5d97ce3134d9a6319b43299f8d5e27b9b89c901c6f7e341b5f7ebb005beb9bd0e10ff24240c7715f136af688c831313d8ae9c1b47e13de6d16ea1b391eacec26a67e3bed361416e4a3a2ac08c3070dc084d143b1c7c41128f42a45aad3b5747477a136739db3b20a2c5bbd2a8b19b2630fc9390942aede934ef891963845c34165f3c3910803843c1e074c1d69004863731bfefafee758b472034b875038c2133f168b239648201e4ff044c9d41c4e373cde02b85c6e94560ed04af49b8f8f84231c93696ed8ca93cfd7da8c443cc68751357a020a4918bbd5c6719358d2828103abf0f4afcf87d7e332ed7a2b571f35ee179229a2ae7b9d2cf00542f8c5edcfa2a1a11e96441c89649c631df44feeabd56647417129dfbbb46220ec0e3bc8ae4bd7a8a074737d1def3b1ff4fb10356d884aeaa2dd6665d0d05f516f575ccbe376a2b2ac1853c70dc799271c82827c8f761b1920a436bb5d2edece421422cfc518083d7cce01449016e55808514ea8516d5e0190472e3f158ffff13d2c5ab99e37d7a146938376bb8dc61329aa84785376bb03352346a27af0108c1b3f1e93278cd1577a55e90f4762a86fe9d0be0f47e368903ecb932b120ea1b5a91e5b36ac4363dd1634d56d412211638941a0b1d96d70d9ed185553856b7e712a865657e87b121aea6ca54e595d6ee891f5351bb7e0a5b7fe8def16ad444720c8e01792cf6ab5a37c6035ca0654a16a480d8acb2ae174b9d382a1b2c40ba7c3a6a1943ebb584d348a97854b5660e9d225d8bc692336ac5983582caa5d8ffa488b82c36603d54f363797d381195346e3f29f9d80bd7f7ea79630450071d8ed602f96ba0ddb5df7dc8b8b2fbd74c78a872cee967300a16726d262694119ef74cbabb3ddce2f42006470b11b5e9b322d68b58cc66388c5324b098fdb8d8366ee8373ce3c1963468f483b2c3c19355e9fa46c69f5a61403bacd477efb307b521b5afd0845a20847e2a86fedd026db975f7c89158b17a2a9ae56bb174f24bb1de3460cc27dd79d0b6f9ec7b4afba79e72af93350bbb509cfbffe2ffcfbab79bc10c8adbc6a3026efb137f6dc6bba164cac28f6c2edb4f1a4af2cf5f2f7455e0f0af369b131c669c0ac6371bfcc7121bae78a956bf0d2ab6fe1f359df2018d2b7dc26b090ea45b57753d449005b021184624a4621bd4f3a86249688817c3a6b16264f9e92c594ddb187e42440f6993e1d4df5cd9aab97745fa7cba901a4a6c80e6b3289482cc622bab376fa29c7e3a2f3ce4281d79bfeb0942dffd4fc0b29949cc281d226933a5199946bd56bf3aabcab2d5bebf0ccf32fe3838f3ed3575dab05f96e376ebdec2cec3f7d7cc6479723d95f7db70877fef6359618723be6a84370e17967a37a60a556178b2d2911fd54d373b52a2a5cb65450ec3365482a60112589323da0afa303cf3cff17fcf5adbf1b0ea1e7763b1d06e7061de08f44d112cd63b58c543c92f4897802e4e20dc7c2a86b6adeb1333fcbbbe524402e3aef7c7cf8cf0f35572ff585069522af24920bac413868b9efa4e57b3c78f4815bb1e71e9daf4a29ae542918a745b2b91082be2f0747cc93099e4422ce412092eb5cd1a3898a8a5beb1a70d575b763e5da8d8627bee9e23370ccc13378c95eb9b616ab366ce1c939ba6610460da3fddc2df8e0d3d9b8f799bf1ace1b3d62281ebeff760518e279b585421917723c28cfa73e97eaf5129ff920028b4ab26496992849a4de8db95b9d1af4c0777317e0aa1bee825fda3b924e271bc5ed54f6baa7168ac6d01cd3779a22e9418d3c5865e56558b47c79965376c71e967300695bfe0d3e7afd0fb8e289b7b54a7c342424ba6950b305c8ed375e81138e3d3c634de6443c8e6828009bdd89584c519914e340f9ab04a99388043ae0f4e4239120f7a80536a70376a7aaa6689bcb2a9173b1706b9c2cf676d104b1c0e7f7e3d7773f8ccfbf9a6378c3de3cc546e808e8ea0a7dcef4fd4107ec8d3b6ebe0a5e6fbe42a064ef1bbba9b46a267c41ea833abfd95b47aa683884442c02abddc19f9389386c6cb0b37f4a792e35bbd162b783c68836d874b8f33a9d957fffe0dfb8e3bec7528e21807a3d6e562523f1381a23ca75648a0b79b08e9a311ef75e7e262af739019e01c3772c02bab85b4e0164e5cb37a163c36238dcf938e46e6301075a89c8dec806207b4c9980e77ef7a071c2980642971c7a15744d3d914aea90f74c89852812241609231e09a986b10556871d0e974733bc997ba572b194b80860a14a7774b6cd860b2eb916f3162ce9d124983e75227effe4fdcae46789612c09440240ec1fc20b40a00349b5fa221bc6ee3c55aa2970884463703a1daa61aed6edd288988a4b5748cece24095debfc4baf4bdb2fa7dd0e8fcb89683c8e060110b5c2a3a8d4ffe479076362850bf15804838f3c1f157b1fdfa3f1d91e27e50c40d6bffb1b342ffc2faac74e43f9d0d13097cc179d278094da029d8ec57bafbf80eaaa01998f4982ddc6cd2d6d68696e45474700cdcdada0c060734b7ba7d72e292e80373f0fa52585a8ac2c45797101620498648227a0cde6505415ad24961a3f209058acd852578f134e3dafdbef323fcf8357fff85b540da890c0411e2cb23944224912415f2bac56d5a3e47061f3e606b4b4f8d0d2da86a696760645a6460b01f5cbe174a0acb418a5a5c51cdb292d2dd149ca194edebca50e279c96da2f024f419e87815ba702445c42ec544c6564e3d1286a97cf43eb96f51871ea4d281abb4fb7c7687b9c90130089b6d663e16f2f4061d90058ac76548f998a17fff50d1efed3c7063b8406808cbb228bb29967ba76d0fe7be1d1076ecff8bbcfe7c7b7731660c346d2f795565e5181bcc222780a0a01bbe252f6780bd1d6dc005f6b2b42fe36d0948b47222059d0eef3f1824a0627a97e23875763d4f0c170bbac888523acb69054611b84abb82b1284368f21903cf2f8b378cd64dc76f572cf38e5045c7df9f948c6090d094552a84954242dc27e1f6c0e076c0e270361f98a0dd8b4a59e03a0d44855a27de7a3c904ab88fe501485452528afaae66d9aa391309088c3120ba371eb16043a3a40fb775023293361dc484c9b3621ed630a7734d9599fffefbb94633c2e176c560beac27a5c840ea2aaee767b122bde7a101dcdf568d9bc0ebee63a58ec1e4cbaf28f5d0dc90ef93d2700b2feddc7d0ba6416864ede17ebe67f019bdd819251d371c8af9e82d7a36c0f2db7fc444bc6c121dbe3f8630e4ffbfbaa55eb317bce024422510c193e1ce5a326a26af86865c157394a8a2992c4aa250b31e7cb4f108984d98e70389ca81a3c14dec222586d360c19548360d3566c5dbb12cd4dcd7cfe9851433171dc309e0c89580c162be9ef646390fa2224890d9f7d311bd7dc9cba3befd4f12378d2cf5f9aba15d9ef9fb817a43a927ac5f690ca048886fcacde39dd1eb4b4b663fec295a86f6801956e1d30a81aa53563e02dafc4ec2fff8bdaf56bb86ff4fc5e6f21c74a28d039a86604868f1eaf8c814a87a1e3c2c120ead62cc7eab9df30584a4b8a70d49133e17219038d0220afbcfe373cfa642a5d9d5ccd4ebb035bc3c6980c19e8c71f341dbf3e754fd4ad51d4ce6153f7c7daefbfc2c81c9122390190050f9e8982b20a784b2ab169c9b7c82fa940c5d0d138fe9697d0d21ed736a217b3be33807cfacfd7d8a56b666b10383ef9cf17fcd2f73aee44940f1bc31e16a64e901d41b116f2e15bad5838e76bbcf7da8ba0a022a94e04589a7095d543505c5a8ed28a01686aa8c701871d0d97dbcd7649ede2b9a85db90c2ea70dfbec391145455e2489f794046c1caca3896967b0f843211c7af4191a882fffd9f1f8e14133505440ce0085754bcc8017dffc18fea062bc7ff2fe2b28c8cf473c1183852824d1a81290b4d9d9365ab3be165f7fbb08c5c585a81a371583c64fe1ef037e3fde7ce96934d66de6083fd943d4efa2e232540d19cad175f210e6790b3071fa3ecc14d0fe5110329160bef0928fde44637d635a9088b1cea466d9ad56e4795cd812d4012222e87fbee92c1c387d02567efd31f773e2213fc28aafff8d82d17ba3e64757ec1029d1d94d763a4082756bb1ecb92b3064e25e8804fdbc920c9eb0174a070dc3bffef3392effdd87f07a8c310c77bc05b60ceec739b3fea1f537110d21198f62fd9af578fb9d7ff2aa4bbcae99bfb801a4d3e7b9dd1c5f71914a44ea89cd86f696663c71d775080503703a5d70793c70b93c686f6b416171095c9e3c54560d4149792542e110f639e8088ecf44231176a9aef8e2236c5cb210c71e3d136595957ae91f263411af49e16dcd384831447f7ef2e138f79423a5fc0f350262b1e0c5373ec41fdefa371ff7ede7efb15729998cab6a5612f17000894808dfcc5e80b5ebb762ea0f7f8cb29a317c7db7c7c37dfae4fdb7f0ede7ff86c3ee842bcf0d92632441889d6025d00facc6808183d1e1f7e1a81f9f0197dbc33c2e92b2e4560f85c208044358bf641e3efdd3b318357a242c7607ce3ee75458c8ded27994fcff19338f4b996f4451c977b9b05552b1a860759bbf052bfe722bbca595d8b868365ac8fed8f360346f5ec7c09e78f90bbb01d2fcfd2758fff7c731fec063b075f5621e245a454897a636f58c9b61b399827c493f8e9a3e0a5f7c67f4068d1e3e04afbcf8381818d1b046c1686d6943714911bef97a1e162f5b83e3afbd0ff91e3773bcdc0410374d1ca57df6e17b78f7951719180ea70b2d6d1d58b06633468c18857cb71dc32b8b7832570c1c84352b96e0eabb1fe749140c04100e8740ac6302d7bc379ec1313fd8976d19675e016077f2c44cc2ca46f09e072a13e9895b2fc4f449a315c39b409448f004a7159654adcbee7c868f9bfdd9bbfc1b49ab44a81db1a09f7cb758b96623966e68c19e279d078fc70597db853c4f3edc6e1783e0ce2bcf452c1ae53edaac76cc5fb91191a40de3278c833dd486d2622f4acb28d0088c9bba270e3e52012e4911e2b4113882a130d6cdfe18efbcf03caebff617daa4f5e4e5c16277c2e270b3eb98da71279d83ad0d4d8689bdffb471f8f7bc3548da743223d91fe38696e28327afe763dbeb6bb1eefbaf58c58a8402d8bc7c3e26fdf239388a9567db596da74b902d9fbd8aadb35ec394234ec5ea39ffe5711839e310fe1b8f46f0d073afe095cf371ad42cb73b8aaf5eb80d5b1a9a71d3c37fc4aa0d5bf9f86913c7e0e9076f14c5fc53c69480f2ce7bffc64fee7a8a3d51c4212275835638418ff8dd7db7f0c4b7596dc82f28c47f662f66c2a3cbe9c2c851a3e0480450ee75b3ea15e8f0e1e21bee62fd3d180ab29eeef707e0ef08a063cb6ac4d67ecbc63bac76368cadae3c38f28be00f8470e8318a8a35ebb587d4609f2e3994e08df279e699d7f171df7cf226a21dad4846431c8126f52a180862f9dacd283bf01414e417c0ebcd439e278f81eff1b8b172e9223c7dffadb0da6dbc39d196163f96af579c13b44fe0b0e1c330b4d88950b083a5e0b0916371e98d77f3c2a2101f15a267281ac5f2cffe8eb9fff900679c9ede054bf696d5eec48557fd1af3162ee37b8c1a3a10f75ef37fa8aa28c5a4d36f85d3aec753b634d5e28d5bcec481071ea0bdebc5ff7d1703464c6089427361f4d9f7c05b3369676183ef9b7300717b8b3168dc347eb8e6da75ac6aed7bce9d88c4f4bc0cb72b8aaf5ebc8d8f2190fcfcfac758579f3671349e7ef0a68c00a1e3d7aedb8c9aa3cf05f9e72987c346f47562a6aa14f6dfdd7b3336ac59c1f68827af001f7c31577b41641b0cab2ec790322fe2f1187b882ebcee0e8c1c3b41610cc7e3f0f93a38aadcd2d606eb82bfa3b2bc0470d861850d76928a361b16aeacc54557ff1a03ca8bf1e69337e99c2caa9e22d7b5b25af17fd73ecc0bc06fefbd16d3278ee2602905f892b1281a1b5be02aad447cf84c1478f35050e065962c79a52816b376c5123cfde0af5955b43b1d5853db8835b50d860977c43e13100a04108d443172dc440d204c82e4fc9938933f57cd7a1fa5686549dc59bbf8ba7b317ff14a96d07f78e00a0607b589a7df0a970a1072ef7a5c49cc7efe2644427e0604b515fffb084595837603441e60f260f956cec6f899c7f000950f1dc3a09001f2c21b1fe0376fcce655905a3ce9c7f7afe85ea017dffc88757522007efcc6535dae38b11133e1ca2f8283a8e9361b4f2636d801bcf2dc13f8eecb4f591d2a2a29c7b78b56a08188886adb7bc230f6eb13159c3c40d7ddff3b149794b3ba132316712c86402884f6c63ae4ad9fc5de2bba16316d9555d681175e7d8fff1d75d09eb8e592331457b09cf32d7dbefba9d7f0e1e7dfe157179c89d38e3d843d58745f8e8413491336c4c7ff10c5458570d88986aed838d49f96e646dc7ffda5fc0c645b8463497c315fa7749417e5638fb1356c6b44a3614cdff760fce482cb1157f3631422689c4112df381fb6f6cde9c756f2881c71ea25cc19d36c2b001bb636e1c46b9f4632a1c467680b8b57ef381f07ef3d8555abc2ca41fcfdbaf95fc25350bc1b20f228938ad5f0bfb731f1d01f61c1c76fb091462b0a498fa2ca6ab64548d53aeecac750d7a264c379f380cf9eb91616f60a2952e4b4cbefe7ffffeffd3f74099084b702d69abd784209358ba403b96717cefd067f7ce27e96200e971b6e971bab366ee5959b56c3a2823c04fc3ec422518c1a3b11e75f7d2b07ebe2b104f3b328d8188925905cf53912ed0d5ced80747f4200c52928ce73dd5d4f60d637f371d345a7e3e8836748ac5e9190a8d7c3fae0bf73988b3573ef6978f0d6cb39da4c863ab99149cd638933f650380acae162478395fbc5b418ab158fdd751dea6a37c2a1a60c4493366cdadac87d1d39780022d1084b10720090ba3872dc64961c04c4788208a1712685da96fc2b232f4b2656ee77eccf79fc5f7fe2064d7a7c396f29ae78ec1dc4631666ef4eaa29c1df1e5354470208792de93dd7ad5e8c8e96060c1c3971b78a2566b16c8398012224090ddcb215ab70c59fe6c362713240fef3e41570b8f5c0d3cfaf7f945591979fbc0344e6eb2af5baa36a4f149555c161b7f2a4222e15491252b59ebaef16ceed70ba5d0874f861b559d8d025a33d44c6315907b118cebffa360c1f335eb509941c14ca4d8934ac4672d30225338f5cab568a835032959de926879fa2acb22fde7f25c60cabd6778452691e721592ad0dcd38f5b2fb34e948ae6352ef28a8c74c66224dda5d488efb019c2e0f8383bc7104008adfac5bb914cf3d7227c73c5a1a9b389f43034b34c2c95164f30c1f33011793fda1da1ee49123e94169044df33e44a923961e20528af1ca351bf0b3cb6e67dbe30f0f5ca52d549f7fbb08173ff4a6c2c98ab4e38fe7cec08c1f9c00679e62b40b557a3740d2aced324096cd7a1f8327eec562b6ad7eb3a66ad1f7e4d9f8766b024fbcbf1c0e47125f3e73155cf905da15ef7e9a5491b9b8e58af370ec1107762945e62f580157cd544c3ef0073ca914439de222403818c0f38fdd0da7c38d75ab972a844055ed51e214c0c93fbb0855558310ecf031d3830ce7aaa183115b3b07c9402bdf5fe160917797240701d181fffeef3b5c7fd7136c7fbcf5bb5bd4ad0c54ce93b936affaf9945fde83bac656962007ee3b8d9260108f45959a261c345498b9f6cae1e8700d84bfad85cbf4904b79c0d06158be783ee67cf1297cbe36346eddcc6a5e224659888a0422f05c7cfddd70e72971180228a9551dededf8cf9f9ec6a13346800a89a76bf242f4da3b1fe2f1e75fc351074dc72d17eb719eff7ef33d2e7ee82d7404dbf0eeb547c11ef5a3a4aa0643262969c932405843d86da4eb432dbb79372cfe96bd1889585413bbc2fd4767140f1882c7dffe1a1f2e69c49c17ae81cb5ba465c0bdfec12c3cf9a7bfe3e8c3f6c76d575fd02540e88079f397b017a8b46a18068f9d84d201557cbd5193a7b1ab76d6c77fc7ac0fff8e4830c093927eab2a2f43517e3e100ba3a2ac1043284310c0e0c103d9ddeb712b76122c363e9e4062b5d8d9854b93e98e879fc53f3ff90a3f3fe5089c77ca51888583b0bb3c52fead14585019fdaf7ff0399e78f93deedbedd75ca872b1e2a0dab60a7131cee753861ee7ae2481c6a636b4b777a0bed9c712a6dd1f44933f84fafaadccf2256701651bce3cea78cc3ce23804dadb39dd9640b369f54aac9dfb155cd604f699310903ab2ab21acf3b1fa1befd0f979d7d3c4e3b66a6724e32814fbf998f0b1e78150f9e3201138656f262474db8f3859ad5b861257f4fea16b979a75cf30a6ceecc79ee593d542f0fdae95eac8ef58bb0f24f37b36bb7b9762d4aaa87f18414ea15196eed0d8a71e8f61621d4d186cf364470dab187a1a2bc8c5d8bd456aedb8c736f7c2cd550efaa4e8dea525db76e2307f25a5bdad1dad66ea0bcd3a4230038ad5440220f45c5b4bf1eb17b959abdcafe204a1c83d25434ee956a0b907a45abf296ba269cf4f3abf979df78f22654559621d4de047761596aed1ff1dcc924b63436e3d45fdecbe77df4c65328cccf57f7494f72d090ee4d36844223273b8d2497a825ac3c274dd4fac61684421134b7fad0d6d6c1e9c07aa5470b860d1bccc7516c68e0c08ace530bf5c291da141406fa8bf75dc1d55ea811bd7ef5fa5a449a3621dea6b8e345130161b2318964e96f6960ed81fe4f01e33d6e79b797d3bbf7a7ef7480c4437e2c78f827cce255e818ca84170059fce9df589d1000a1c9469f874dd9175687034e698539e597f7a2aea9150fdc72190eda6f3a9fd3952d621c4265c9161b676a1b646af91649352d575ddab58442d26794d0be52c880f51b25c742caf17ef4993fe3f5f73ec6813326e2fe6bcfe5fe86da5be02e545ca1a68c0e8328b9e1a13fe08b398b71de4f4ec0053f3d59399af35114ea3be58428b57c95f88576397115d54d46124d27b14b55e999da2e38695d24cb6b37d7e90c9fff6f2eaebffb490c282bc69bbfbd491b5672e326a251ac5bf0357bf3e8a16991a35658518d61d3943808a959fe967a94d78c41edf2f94838f230fe174ff47e86f7f20a3b1d20f4fcf3eefe11ca868c66fe55c38695ec411a307222333cd77ca7a4ab92a783a4cca6257358d28cd8e340d8dd1e50dc44345dcdda0fb75dad477cbb3546eacaadeddc24ef0eabe656c8fb7e28197acabe1f144fa1001b5783d70c6e457ba284a913cfb99a8df3276fbb187b4c1cc5d8f1d5d7c253540a9b53ce5197058a72a5798b5772549d5cd9efbcf408f3b21448a9998e1c89b7b0baa5e4d613982d5cea48c81325c390322155de00b38d094c4a9a6d6fea8b5e77c7639835fb7b837b979e2fd4d18a58288835f3be40e9a0e1a81a3d05cbbef8801739e2b84d3cf4c7dc8fc60d2bd8eea4774c5c2c57d5688c38ede66ebdbaed71704e0064c5cb3721e9abc7a819873027878245e41ba75585c88bd484fbb765d31a6c5cfa1dbb02690572e515b067889aecee7debc587503da0bc776366a8e4209c996a891e96186a00404b5ba5dba5278909e9316dfc08fcf6d7976a92adbd7e23f28aca399744f35e89b2a6520545baeaa5bffe1dd34f4e3be1705c75d1d919fa26f63054e4043781019176c88f29951aeaee289998a09beb1a71f2b9d7f25564f72e79dcc2011f5ab76e40fdbae5183a691f14570d45edb2f968daa8d81be30e3886bd5904102260d2c248decc8133cf40d5c1bdadbfdcdd8ea51e9f1300d9f8e17368fcf61f4c372150383d79ecc920b79fa041d36fd4e877fa9e0675d0d8699c7761e31458a5096f56778cf5ae86d1502151ae6868d81f4454484c85c8dc854b71c9f54a9ce60f0f5c8d31c30769ba7fcba65528a8a8d6258896fb945ae5a4aeb105275faa04489fbaff064c9fa2177dd0c92952a546a186892aef262f5957fdcef4bb1cf7a06384716ef65ec5c2214e2623952912f0334382163e5933100b1fbdd392aa618886031c03c995a4a99c0008e5a1af79e35e16afa44ad16a4211750110a15ed1cb208f87afb98157a031fb1ec1c142579e4e6614c63a1d9b2a45cc24f81e4c91942aefe21a99ab1bfcf4d29bb16aed269c72f44c5cf9f313b59b92b7ae6deb7ae4975571debbd2ccd34f7f467afac7fff00edef8e72ce678fdf977f774da81b455ddbb6794753940b2f4908d733a314c29bff118567cfd31abd064800bdb92a404351920243d8474c905039ddf46636b5be7e541ba1ca26d73c08207cf40415925864eda5bf38b0b154b0084562136fa6251667e0e1a3315f9a59506772f3dcd2fef7c06df2f5d93e2f2cd3cf5d2f7a1cbfd41247337dd15e8fc479efe131be614f778e9a16b9824a9648427d9c5eb6ba86523dd5358a66a3d865d7a742f936a1b5146e439d73d029226a7ffe8485c79e159865ba74812adcabbd0aa522553f66f30758111d28392bd7e7bdb45daa538e1aaa30dfee67ad4aef89e59bad404ad440044a8582216b2f48b0f903764624ed81f390510113024da3b49085a69c8dd478934e4a91a37f31816cdd448fda2012e1e381495c3c6f2ea2be8d6f4bb6c8bfceebeeb317dcab8ece740a623bb2939e8f07f7cfc05ee7af439bee21f1fbc1aa38711e748af1e12f6b520d0daa800a488ec257dade2fd3ec4676dd62bbfaf58578b9f5ff708ffffd6ab2ec0b187771618151b224857975cc8d90f4c2a38e62e58864b6f7c802f21db1ef4991631caef21db836c10529149232029410bddb22f3f80d39d8771338fe5cfb4f05195998d8bbfcd0916af18979c91209497bee8b717b0281662984432e9a3e41fa701267fb988b0537c24d0dec2de2c9bc365a09d50e7048191620d2ffdf60ecdeb93dd843052cf8d36885ab646aeca6e32cce9f8e5abd7e392ebee65afd5e5e7fc18a71f7b90c64814d542822d0dece5212f16c54274ef98711f737daf41dda8f8eb3ffe8b275e7a97bd5a4f3f7833468f1892563933d6f3325d57ec13d203b58bbc72e75c7a3bb63434a578ae688ca3a120e2d1307baff20a4bd89d2ba484b04128284c80118445921eb682f29c70efe61c40e88188d9dbb6f42b8c3bf068b4d5d73250687559f9cdc79c7148e259d8271475a568abe2eecd87db4bc13b63137191637eb03fafb4c696ad3d228145b210b43a52a6abd25c5bbe7a83068e1f1e3c03b75e7a96243844bc0168afdbc86a16014491202cd47549a23e62a67d42eefaed5ff0afcfe61840927e0150e33b7af113adfe57760b46ea5124193ff8cf571cf7f8c303571a0a55d3d1a18e76c4427e0608c5b80acbab356a3bd91914f318b3df917c61028e2b2f9f17c39ae37f85d2a9bddf5eafa7fd329f97331284571d558ad0ca427607a956e4ad12152f88bb23a44841690568c521158b542d0688f0efabbd24839d6207942b72d0be7be096abce33491213484c2b695ac9916147289eda160b3efb6a0eee7ce439961c0a387ea2050bcdd76bddb48aa3e09d773eac00002000494441549ea23206885c504d604589c79877bbd577afbdebb7af6820a1d88f08908a179dd926d1af2b409972ff348156921c773ffa023eff7a1ee77c3c79db455ad45c9b5cc9040344b877496d6e6ba865c70b3592feb4e011a544d04c289048fcaf5c48b39541925300a107a3984868cb2a8cd8f32004db5b35758bec11f159d8221b177dabb97bc9352c68277207659090ba75fe5927e298c395e8add232491229ce21264a271284526d9ffbcbdff0d7bf7dc4576570fc5237a0cd55d389aedeba59a95ee22d1f04a744bcd49891a69da48415214b1452a1ee564142d73afdc747e2fcb37e9c41a5542589f003f0c7ec7d341ffcfb4b3cffe77758adca080e955e427421e1de25358a5217a8b56c59c7ee5c91c6402a33ad4b647be45ad1385ef472c58b25a62b514f163f791e68cf8e211367b0c4101967b20d426239d0d684e6da35eceea5ea1e4ec9dd2b83848cf67b9e7e9d3d5bd40828349166ee3b3d6d30317ddcc36c7be811f2d7dffd18afbefd2fadb8f4b9a71e89f34efda15a995094dad437e3a1eb07db9a106855b2fb4a068d0295fa4cb9af5a82485ed9759b42df9b90b4b2e7fffa4ffce14d059c64979c79d20f71da8f8e488db84b7b1c9aef278f99f83fb971fff99f2ff1fec7b3b0a55ec935278fd5cd179fa6e57b98cfa372ad94d445eedda2814351366838bf43a11e8be3856ab56efe5770578fc6989f297cb35c6a3907101a1c41602483dd9597a7ad38fc5b733daf3e64c06f5e360f8d1b5729eedeb24a03ed24dd20fff3b33978e18d8f98af251ac513f69c321e6347d460606529f690826f7c8c694f42221c6ead6fe4bceb39f39760de223d436fdaf89138efb4a3307de268dde6d0b858c27ba5fc6ddbbc968d582236960e199b39d7c2e0cd92577b9582afd14dc07b86bcf0fa8798bf74b5d6bf3d268dc521fbef89d123a97f65a8a6ca8c19bc6374d2cad51bb8c8f68a35ebf1dd82a51cbf118dec8df34e3d9293bc3a6be478f03729eeddf221a3503d6e0fb633bca436ab3920a41190214f853aa86630a9563b9bb99bae4f3909107a50e1f61d3a716f2e2e2df457fa8df456720b8603010e180a77af4c3be9ec05cefa76113ef86c0e6fd326ea4e998fafaa28c340754f3e9f3f609828e663897c78fa310761fae431123b36bde4a0f80019e6ed751bf8320e8f178503862aece094dd67c9d69076a755258a28b0cd5445c115930a6fcf5dbc92eb6a11b93153db6392be715067fd23556a8f0923b80afdccbdba2ea020e825c2bd4b8b1c71ebc8c1428b9a680418ca1e6cddb22ea7dcbae6f1ca5980d0832e7df672449bb760e8e4bd39234fa85aa21324b25beb3783280dc4ee35d34eb211d5f396ac06fd235b85b2f74485944ce7d284212af7a861833066d8209e34b4d59866636812476c1d60941cf4a9a3710bc27e85d1ea2daf86cb5b2c158a3632df95e710ec61bdeabcfe7c7a016bb524bd6655b57704306bf622ac58bf09abd66de63e665a10c4f5281b70604529f7718f0923f95f775a3c1246341c64f6aedde9c4c09193d2be374a11a85d362f67385799fa98d30021afd6d2e72e873bcfcb6a962ca2a9436493501d2de1ee75e415186827dd79b1f2b1b415c1ca75b586b8c4c89a6a1452aeafc20997567c619be8547125ce61b4397881a792a4d1285a6af5cd2a4b068f6695515c568fe1c9fb9128f10b860a53dad5cfc4b1622f97febb2819244b1ef54456e3e8fc0ebfe89f1e1719399476b4a5fee97eaf9e8c1fd14ba2019fe6dea5cc4151e38caec70e168b15ebe77f99b37687dcef9c06083da8c838540a8af90daa16fd2ea2ed82ddeb96c4784f5eb0768ec89f50ab8dc8fb6728c72892c1e89dd2a5862248a4cfea391d4d9b9982418da2ffa543545547ca1bd19e41dacc47480701126dd22b5f281f254963384efd557758e97111c3757a3560cac9215f2b27b8916d317adf230c6a15c5b4c83e69adafe52aeeb95018aeab2ee73c40a803a46ac57d8d5c7d315d5bfaf9fb701714a16ad4249620a2da49579d37ff9e9e7b2579af24f6ae00879e91679424426228257d148942fa79cb2685e64d8d7259bc1583948c44c906d1bc4bea4e51426228fb7fe81243932406c942dbaca9711321690440649ba59bdeac6cc69288892441847b77fc41c7a69c160dfa397e952b74f6aefad5270022a40805972825d7dc362c9acd86fba8bd0e85dde9863dc3ceae5d0d86e177d38adea5043179ab526c128b051d8dbaf4a07be5955420af6420df56395e516fe4bc1065eb28494230d2e4cffc852408f4e3334911cd552c4b9c1ed04dcce329e825abbefd948d72229ea67b57bee67a4cbc2c37bd56298b66aec541324de2c54f9c87643498568ad0be121468aa99b22fafca72b5936e83a2b37c0f4dedd26d0c96209c99472bbb9004fa5f4dd2c4e368deb8c2f03885036be0cc2b5476a49293a45802883887b20f08652e1a2586be3f8800023f1eef0367b455741bc51c9137662ea67ad1ba357abc4709a950eb177ccdec5dc1dc1557e96bd283df5d5f018890222267447e759489b6f8bf7f43d9a011281b323285fedebdd72c1315f58a874609a2e77e74e5bd527eb720d0d680606ba3e1518aaa862b85ad85bd62606289ed77652f95b299a8264144a49dff2a711145e2287f7512b0889f086f98f977f158d947d5cd632ae8ed4d1b57a3a9760d261ef2632e94273791ebd1176c0ff1dc7d0620f4c08b1f3f0f0ebb452b6e2d0f3e952d25efc8d0893352e8efd902a4cb08ba4679d70d74c506115b2b8bfa56f267457d6a58bd50dd1f447f9ac281c3e0ca2f9422eeaae4916c0a51878babbf0b09a1880cf5b352a041790eb337cbfc7d3a4e971467d1e230ca33a6e366651a4b416fdfb0780ee7b90b22a2389e1631ca452f1a7f404eecfb91f59ce82b12843a24e78c38b40c3ca5ab627522da493afa7bb603a2ad1caa61ad7d96f238b4c9a31666506793f247f25cd18c252891ead1b87e29dcf946c6b1bba0040503862867d1ec16768c2611a800045586f720126c4fd9b853de8d5780449720424ac81bc1ebf11461eba8e8ea6ef99794e124fb8354a855733ee5940551805c1c28d8d7e32e782ce776b2ed6c6ef42909224a041557d5a418809433427469a29d78cbab7a6687a8866ac6fc8f74368830b0351bc414ff2057f5c69508f95a5200422f86a408b9a669eaf23eebda1c4e70a952475e21db23a1b6464e42a21c76a7b718f9a50314892149162141cc368b6c836892876d1aa34431147248214a76bec4d022400150a297a45383c973e5ac1896937cab7e0310ea8828f090ee25c8598672d5c5ee498f2ef23f247b414812830491bd59ea9ee31b16fe8f795785658ac74a6e54a7ca5b368829ef72a36a8b56878b0baf85db9b11a47f6d8d0c085f7323864d9fa9050f1554091b44911cf206f122c8a847e4953b19bd65ea79dd1b2c550029e9b572f6a07c19515b20570a3174a78b7d4a8250c7488aacf8e3f588b6d661d8b4fd396f84bf8f46b1eadb4f78d210edc49c869bcda0f43c0ea2d49592bd58023c34755b6a57a37ecd12aefb95a991ca48063bed114f45e0e2e130e2b130a2c10073b7e4b669d97c4c39ea4c5d82c83688eac5920d79a3174bf58e898c4899eb65b241b219333a46d81f4c2f7138306aef1f68a70ad5aa74f2a17dcaf6101de87300112059f6fbcb10f135812696cdee641546b451330ee5efe5eaefd9be6ced38138bb7b77190851fbd8eb2c1c3d2aa59dd7936a2916f5c3a0fd38ffb992a41646f571ae921d7c252ffbfade320b2fd21fa420b57c8d7c6db35944e3a18353fd6abbd77a7bf3bfbd83e09100112a2c5b72efb1fe2613f3c0346c05d3104ebde7ea8e77648963688cec5a29abcc28ba5b27185f787ffaaf111ab15cd9bd6a076d977a81ed53523b6b349d1deb41591701863f63bca14173171b4a4b8891e1f4917079158c45ab0b07bf55fc8fe68abdbc8f492c1479cc7a9b6bef50bd9182f9f76789f32cacd63df67019269122d78f0742e12c0b413a9fa7bb757a26e73b14cac5d618b084964b1a079d32a346d5c0377be170d1b56f1f604de9272ceb653b688d61b498af6a63af85b9a108b8651523584a50fb197c7ec7b14c7180cb6855a6e94af20131bd5028af2f75ae45dce51570ee8f63089f8c796558b10686fc594eb5eebf63572f9847e0790357fbd1bfe0d8bb8984377ed90f436884932a8116fcde65023effc9205a8a846ae769c91a345ae50cab86b58bf0c2e4f017ba8a8eca85cfc8e2e15ec68432cac6c13402b3419f176870be5c3c72bde27954ba5c54934af945cd5dd1417d122ec329da5b33a595d4b12617f507186fc9ac93953cf6a5b81aedf01a461f6dfb1e9a3e719201467e8312f2b13174b8cbcfcbbeaadd2406260f99a58bf66c9c2933de3ee666ae45cdc54f14e69ebbce4bd52a6b26e8f2882245d045df25e6997ed39c59dec8f70472bd3db7331a7bcb740e9770009d6adc5b2e7aee0e2d6940f6d5e99b319b0b411753508a8e57968d54df488732a27cbb8a580214f44097c183858a9f715933c43666197de2be53c25f35066019b3ea7c964cc56dd22f66edbd60d6c7ff4b520605673a12f45d2b3e9101db3e081d3b98c299504ea797e48efe221cab34afb6fa80f6f4ea6d2fb64aca2a27c9fca9d32d81219f240c4b97aac4fbe8e29fea13020b31dda94e328ffa3bfda1ffc06fb234056bc7423a24d1b391ed29dfc10339bd5b0a26b1244d1d9f53c0fa1c3a7c92c645b44f67209af97890dac71bcd26d34a57aa734835a50dbd370af0cfb97a8bf6b7111e5027a46a25eab5744d0bbc3bd62f8aaf91f14fff00c1edfefec8f7e0b10c1d9a2780851dfe5ed11b25f2a5359bd422aa8c241c804d5f4d019beb22da2671e2a12456b29368efe538a45a017c2520588191c9a31a1fd6eb89a4eebd5e4925170f44c8250fe393910887fd51fed8f7e0b10513668c884195c0e48dea62d2b80648c878894742119644922d922a6edcc14b5ca28693410a5e49fa4894bc8de27832d2172d38d1984d972afb2a98bd5d978510ab4afae96f957a3cfbe07de9adec578b27a373bf8a07ea962d118f2b66e941f327474dababd598fb3a4fe186580887b882ba5cb51d7eb6a09e9a30b8e743647a6a7d23306356f15eb389d490ee900cd04d1d53555d4183250b21e13f5402a2fdab46125e77fe4ca7e1edded4357c7f75b802c7de63220ece3fc9074757bbb1a180643da7dcb33e5a8a7b745b49c752d37dd745c271244bfbf54955de65a9972cf95e315af95285faa652666c5bdea3aeea18d9b5a7f97f33f3c4518ff8bc7b319d23e774cbf0508558a6f5df20546ed75488fea65a5bcc9eec44552aa9de841443dad4431d435f923e6b4c84c9723e0e608b7a9348feec2354a14dd0996467268b4929ecd5951ff6ad5b7ff45e9f4a330e4a8ecf6a6efd9dd76de59fd1620625b37b243f28acbb7717e8828af90ceb6c82021a4bc112de2ae2df4fac6cc329130ddbe20e9ea5ea5971c59c43d7ac8bda2e94aea15d517deb8644eceec27b83d60d46f01a22557a9bb5075c7dd9b7ea0bb888bc8a2209d643049206d1f10d9c63187d44dde27f373e991f2f49243e65c2936470af9aa47734ab877b5fc8f6b5ec9c9baba3dea9ce9a47e0b10eae79ad7ef816ff55c2e07445b4553eddeeeb44ee322b24d21b851160bafacb48fbba7a004ee82422e9ca65c27bd974b894be8e04bff599edbba978b088d54a9b0a3b9011dcd75a81c3686d9037a5d2d3962defbb887183bdada996a7c51799f8291d3fb65fc435beffa63a050744eb87bf53dd57b5e544edff94999cc5a445c5b98152f164dd4adab16239188ab29e61656ef1cae3cb8bc054c50b4da959d796d76a5ea4726c1a1c905d5900ff97d5c87381c6847b0bd0581b666e55998155c898a6163f99aa9f91e1238bab342a43956480fad7a623f75efee1200a14e2e7df65788b5d5317991aa9ea4dbaaadcb392374f5aef2454c9284784a14488b043b78429b692642b2103d5f0dcd9b2a572b1280e81cec9d92bc5476879369fdf92595f096556a55e585043270afccfba3f7c240270949554b889ce81a30a2cfe59877f9ae7725158b57f4f58bb0f24f376b35b3b659e545ad36afa4fe68554e24992005cf89f91a8b9004f0817698a27d31e8b372b462a813159e1a4918d964c82b2c6635cd53580257be2a7d4c21f7d47dd1659ba31b2edc0cb388a4173dafa87dd55f838372f7fbb50d223aaad822f3306cca3ea06208d9ee23629e279de68b48db9a1923e73a77cb5035448b4ba8274abbe66a7b06aa2c5cf93c2119047a3489215dcf28f0f4073373adbac3bd12fb7e507efcba05dfa060e41efddaf6d865542cea286febf6c4b970ba3d20b72fa95a641728550f7bdae448b86e9368032b5d564808c39de45ba74d089156fc8ce91a6a84dd1c0fefe11e84994682b306fd3e56adc8ad1b09e5ee8e503d7d9b99cedb252408755e942e15e54969eb01ca38ec494b1f613767e64911772d03508e9bc8f112ddf4d025836e5867bc9f39cf236de4df80969e741791a09f2b9708d52ad7b66aee51a7b23c699701088dc7ba771f43cbc24f598a902ebf2d2a30eae36c64ffca85186501a0b974b5fdd03b1325c633651bc328bfd4a7d077dfc9f2f5777d98a8d84e4e06921e7db57c4fd73d4d7fc42e051051532bd2b2154326eec9b648a6eda3b319d0cee32419248a60e3aa8679ebd68d5cdd9d6c232aca402ee05828884838c86a8dbfb50903478c87dded315542cc2c6132e77774cf50a7a275b49d333915362efe0eced22a8c39e7fe7e1b144cf7ce772980d000f0b66ecf5ec6c93eb4cd746f41921148a608b9f8c8c70bad87bc6c4d5bd15ab70989789cab13c6e331de02dbe1a1420e85c82f2e85b76ca0266f0ce7cb6cde5eb86ed3f5c1088e39b0d81c39bb136d368b594f8fd9e50042034579eb2b5fba814132628f99bc6af74692186923a955423ab759f4bad166ef5376b64ebafc1103d3b1db734380835cd16be6cde21dbb469f737f9fae6fd5ed41504fd8250122838422cf4327ccd80620c9e80791495019d020b9a1ccc685e173ef0deeae268a0c8e0d4be6201e8beeb2e0a0b1da6501a281e48f377011b66d0312a38e9fc94649b111d246e8532543a6388c36e97ba966ed0647eaf2b14b03448084ca0451e1680112aaa54511f7eddbcc06b3e9732f277b779f9d22e41c290f07b169f9f7bbbce410e3b7cb038406827247d6ffed512413bae16eb53bb9f875ef8289195c87a20e9589e39549b2689174edadf5cec6909f8a8280d15080e31c8ab78a0c723b6a7e74158ac6eed35d9cf5bbe37703447da564b8af7be761841a3771d1b9c28a6a66c93add794c95ef8f8de823915000c9445cdbdbdc5d3e04c34ebc7a9734c8d3bde3dd00914685e224ebdf79186dabe7a2a0a21a552327b2838a404212a5f7ad73352a851b6556b3b6a1dac5f64628c02ee72dab17c3d7b01945a3f644cd8fafdea5e21c5dbdd3dd00493342a2ae16d92583c74ee5209ecd412a575e57e3d9277ea7e01f0144d81b91800f03679e81aa83cfec13cfbf231f723740328c36db25ef3eca997355232720bfb492552da7c7bb5dec921df1d2c9dea0dc14ea93bfb91e5b562fe13eedb637328ffe6e807432339b36afc38a57ee803bd48c6235b7bdafda25b2bd2172c903ae628c3beb0e94550fdb11f8ec93f7d80d9034af6d537d03ee79e92f58b7792b5c5e2f4e71acc5446b23131c078d9906abc3ced51a8911dc171aefe111f223118da176c57cce6e9c132ac46bc11ab4343560bf491370e3cf7e82c195ca7e8fbb9b3e02bb0122cd8636bf1fbf7ffb3dfce5a3ff60f8e04188395cfcab0b09dce2fc16b4bd016dab3668ec3406cb8e8997f46eba8af80681a276f97c4edda59d72af68188782a222be7863433d5a9a9a70fe8f8ec3b5679ddebb1bf6b3b37703447da11f7e3307b73cf31c60b1a174c000381cba74686d69c1ad252b317a50153a5a1a7963cab22123398d97aba5505e09ed47984b2d994038e8677b834a83522e0749bc82920a7cb9ae014f770c476909e5c22b8dc892b51b37c26601eebbe417386a9f19b9d49b9df62cbb3c40486adcf6fb17f1eee75f6278cd50788b4a949d9ad4160885e06bf7e1a7059b71e2842ac42211047cad8886fc06958b73ddb77bf43dbb79c25283fe8582ecc225e941db4be71514c3ee74e24f4b1af1ae7f008a8b0ae1941602abd58a96c6066cdc548b530e3f04b7fefc6c14e5f72ca92cbb27cdfda37669802c59bb0e3fbffb0134b5b563cce831b04a93855e5d381c813f48b919211c5618c4c5631cb0aa4143aa58126c6f65f261d9e09128a91aca52c4e972c3ead8163193ee4f9e4434c2cf4aa9b12d5b36a069d36a4e55f414166b3b6dc5a211dcbbc286ef3becfcac45055ed8a44028875aa2512c5dbe02832a2bf0cc755760c2f05dd788df6501f2e6279fe19a279e467e7e3ec68e1b8348346e9891d1580cbe0e3f6893ccc6baadd87750016e1b13855b4ad3253ab8afb591e309142ba1c022d926145ca4bddb1d2ef77657bd4885a25d7049ed23c147eedbbaf52bd46772a3a0b88299caa2858201dcb6dc816f6bdb5031b00a36bb1d45de7c90f4909bd361c3b2a5cb110804f0f0e517e394c30eee3e62fbc119bb2440ae79e229bcf9c9e71838a01283860c41381235bcca782281765f07d79a6a6d6966e2de3ed505b87554189e3c6fca6b8f8683f03537f0710490d2aa1ae497a81e218b952721d1ea59faf4d6564926d85ea07bc563319616d4fc2d0d68deb29ed5299bcd8182b20a2eda6d6ec1801f0faef5e0b3f52db03b1c282e2d83cd6645a13735bee3b43bb069d306d4d737e084830ec013575dd60fa67cf7bab04b0184ec8d0bee7908b3972cc3b09a21282daf40241a338c18a575b7f97c2c39485d696e6c449ed78b11f9163c3239014f7e61c611a6a26a81f6165ecd69df730a2e169656721952791517dc2e5159515c501023cd3577090cd4485a8846d22be86b417b733d4b0d2a434ac0c82b2aedb4385ed0efc3edcbecf8be258a6047074a2b2a58d572d8ed28f0a6da1b769b8d5dc1eb376cc2b431a3f0d2ed37ee5276c92e031002c74937dc86d51b6b316e0c6daae3452c6654ab78250e04118e4418200d5b3773faabcd6ec3382f70ff6420bfa0b8cb2588ec132a13cad54012ca3d88b642a586a8f4903b4f293f4ac0c9a611100810a1800f11da7699ae1df0f1a95622547af2e1ce2fc86a475fbfaf0df7aeb062761349a13817afaba8aa66152bdfe381cb956a3fd9ac5604fd1d58b172156aaa06e2bd87efd96540b24b00848cf1536efa3502c110c68e190d4fbe17316935169334128da2c31fe08fcd8d0d8845a370e7e521168de1e4612efcdf9018f28bb29bd4e29a44250f07026c27448903a502261b60a43b860041347cf298b9f2f2bacd0ff3b7b5e0b55a275e5d1f665084027e389c2e949495f3ed8a0a0b40803037926e21bf1f2b57ad82c7edc25bf7ddb14b18effd1e20048e936fbc9d55a96953272196b4229e061c2431dada3bd8c51b0c06d1dad880bc02a5b85c3216c593538191e5b44af79eb04864416ae1803f2b9cb8f214d587f2e67bdb08ac0bb6b6e3ae35790844636c67057c3e949457c0edf18054aac282543b8bef4b64e4781c4b972e83c36ec3dbf7dfd9ef41d2af0142e038f1fadb181053a74e423c694d2b39e8ddb777f8118bc558b5aadf5ccbaa90dd61473412c1e0420f1e1e528b41e3a7f304e9ad14e8ed24efe9f9247d60b3a176e95c3cd83c120b1ada39e7852424a96e95d58358aa783c6e785c0a8b205da3ec98458b17c36eb7e19d7e0e927e0b1002c78fafbb9527fcd429931187252338c88be50f28ab3a05cae289381bae040e3b1278665c2b060faec1d0497b2bc945751b5965ea4bcdee70a170c01006c48645b3b169d37a5cb7b612cd612a33e444381462e941928455ad8202f66e656a760bb070d1623ee79d07faaf24e9970059b87a0d1be4c94492254726b58a5e7e2299445bbb4f51353a3ae06b6f83273f1f142f705a2df8fdf83606c7a0b17b707107d1c8ad1aee68ed131871798b75b7336949d1286a97cf63905cb9a218add104dc9e3c36c40b0a8bd96b47c1c3426f7e466a3fa99e0e0bf0fdc245fd1a24fd0e2024397e74dd2d0a38ba901c34bb3b020144225156af9aeaebe0f278100e06509eefc2c3239a50337c349313d3350a100a176b2e2245b89a298899ae117971fdda95b8656d2936fba31cd824495256390076bb1d791e37dc9da85aa48ed92d492c58b08801d51f2549bf02c8c2d5ab71d20db7670d0e0205d91ed41aeab6726d8468388249e56edc59d38ca193f745f1c0219dce7d52b968831baa8a984bcd455bc0790b59a5eaac51e9d30d0bbfc6e39b4b30ab2ea248c96412e503aaf8b4e2c2829428bb7c3d0286c392c4fcef17f64b90f41b80c89263dad4c988262d69bd55f2cb6df375f0317e5f3bab56897802670db3e1f4aa2846ec3933eb3805ab6ab118ab5c94b1b7331b653c924a250726bb7a1e02f8eaef3ec77b5b6d787e6d92e33e058545c8f316c0e974c29b975e0289eb92478bc82cf3be5fd0ef40d22f00c2e0b8f616b623f6983a053158405caace5a281c4180898861e65ae5bb5db86d840fd3aa4b5133753f8e0df4a45139532a3c1da55da4e29d3f434fae9fee1c52a51c5488dbe5e1923d3d6944625c37ff2b2cdedc885bd716c31f0c31578b0c7872fb9231de59235a4a321e659050b0b1bf78b7fa3c40e6af5c8d536ebc9d6d887163c7c05b50885024d2b95a441cabf676c4e30934d56f45b9c781074734a1ba7a08464e3f18f1d8b6f15051261ff1b4629130d79de27d06b741a3a42d9bd3c5fc2ee25b6dabcc469bc38dd5dffd179b376fc4652b4be10fc750366020d3502880d85573bb9ce8686fc7b2e52b40ffef0f71923e0d90b9cb57e2f49bef606941e0282c2a4220d4f5e4260a3b51d97d2dcd88053bf0ece400c64cdc13d563a6221254281c3d6d94ad479987e91a832491d00048c0c9a6d9556966b3bbf8dadb0a10e9eeedcc2fc2e665f3b162f11c9cbb209f839345a565196928e66b783d6eb4b6b632485c4e679f37dcfb1c40489dfa78f61cfc67ce3c2c58b99adf4f77c0114f905bb71d41bf1f2d4d8df8cdff9d8de3aada995222f84dd94cdace8e2135aba7aa4e6fefbd2dce77798bd05cdf883737e5e3ceb7de46697939d373c860cfa6d26491370f4d4dcd0c126a44723c74cf693862ef197d2ef29ef3002192e1378b97e2fd2fff878fbe99c3c13eb7cb0d5f87620c13388a8b8bd1110c6535377c7e3f828100eab76cc1b5a79f8683c64c85c36ec588e412d8c22d595da3ab83887fd5976b6885936eacb64d42380abc37ff2bbcfcd14718505d8dfc7c2fbb7ebb6a04a2126f3eea1b1b3590e4e7e7211289c061b3e198fdf7c191fbee8d7d268ecfe8fc030000119049444154cf79d2634e028440f1f1eceff08f595fe1bf73e7f3fb282f2b45e9ff97772dd06d56f7fd2759ef872559922dc776e247123b0f584a6848d9c696525861746d1983d2c15897ae8733d6ee7474650fe8061d14cecab6c2ce7a7a58b7957563c096f48cf6c05a206dc3024d594a323b7112277ec9b624cbb6de6fd93bbf2b7d8a6c4bd6a747e2b4dc7374e444f77ef77ef7dedffdbfffd76e07940a9c1f39273c71090e7b8b1dac2fa7105c81600841bf0f375cf51e3cbaff134225ec9e5a402a99c666e32cf4d151398f5ab34e2a1a82660db7f8ba3bb8880f9857b46372b153a8763b3b6cd0ead4d8ffe4dfe227232370b4ba60b359a19471f9291d1ead6623bcbe590112aa83fbfbfb45c8b27f7e0ef3f3b9c3e8faf75e859baedd8b1bf6ecbe2cc172d90084a976c83abdf4c6111c1b3e2b268fd17eedae36b4b4b42099c9201a896274f4bc70d326389c0e2702915c60939cc208c159cf0cda6d567ceb913f5fd6647a7a01e170024eb302aed429a832b5ab6b13e105688d96b2b2889cb15eea3a311830a9ec472cdd04a3418bf60dd682ab492816c3871f7a18896c16ce36178c15d4bed2d8a9fe654cbbc7e72b80a46fcb16988d06a8944d989b9fc3f48c47442db2ecddb90dbfb2778f60c52e971444eb0a100914cf7def759c199f1493a4d56ae170d8d1d5d1213618856e46f8d15e313e368a583426c0d1ea742218898adfe414520ff7e424344bc04b8f3d8ce6125eb9c1601c3e5f5018cadacd19386383502c55afaa4de76d216a7d19af583903aeb2ce5aca81b51e955e5263ba6933e6d3742b015a5b2db05a977b0da7d3599c3ae3c63d5f7942d8463a3776c9a222ec57a3560990cc78bd39ed965e8f9ede5e4151e8eba5d768c47c4f4e4dc1ef9f433299535c6cd9d8898fdf78fdba83e5920344629f5e3ef2165efbf1313119d4b113140e87034ebb5da8692560f077018ed15161b31818e887ddd6824094463e79e0e0333c5e0f8273f3f8d25dfb71456f0f5ced562895abef49cf6416e1f504108926854b7787210c4b74184ac8ef2b9b4a88ab040cd64b9788ad5ac540066a789b36c197ca058099cc3ab43a9ba1562fb777c4e329b8ddf32239455297c15d8f3c2aa210db5a5b654358a7d1c06cd09704091f42968d6a6182656e61017ebf1fb3feb982a1f79777bf07b7fcc2fbd6850dbb6400f9eed1b7f1ca9b3fc28143870b136bb558e072b5c161b70b5dbb004632b96ce31783834640b25d81285dd3574703965bb1703882f1d1f3f8fae73f070b72a7ba56ab4267678b70d92e55c86ef9bc4164b28b147b60372ec29e19873e3d276b6384bce3686edb24ab6ebd95483d44c8ad8c6c2ad12533e6d49b3097cc09db26930e7687193aed6a0363201083d71b44934a89abafee87d566c6811fbc817bfee2316ceae981d95cd93622bd9b51ab8341af452412c1b1e327840152a224c5ef4f30d1d59e3623ffdc1c3c1e2f02c10b6e3cb7bdff3a21e0dfb8e7d2e4edbaa800a14af6c5d77f80175e3d242cb3120bd5d5d92140a1d7e5168956ed6832295cd38b0bc131363a8a7432292ce4269309a16814c91571e46b6db0502804f7e4041efcedbb71df473f8440208aa1a171e156d2d4a4409bcb0ab3a9bc6626148cc13f1f413a9503a45eab84531d84313e011de265bba64bbcde62bf24da2cb274e5d8b92c5408c38cb0d281c0a2053c57544d4ad85a4cb05af4509670695f5c5cc2cc4c00914842b048575f3300b3d920141a6481fef2d9e7f0f48bff89ceae8d686e2e1fa3bf7272484508804a20613be6eb32ea345035a9104f24045898af4b62c18c7a1d6effc03efcc6fb7fe9a2aa8e1b0e10b250070efd10df7ce5559c734f8939220bd5e66ac386b636b1c9a5428a114dac06067f2f058e702c5ed14abe72517c5e0f4281007c2f1f14934b60c462490c0d8e2191c82543301834686bb340a329efa6110927045092f936b94554c2a64da239eb872135b38c0de3f5ce4cfda3b7b4d44b202ab6a75240978f6f5f8412d12513424b6644942d88652fb8cce8b4cc626284a5b9bc6f55281487d71b128795cd66c4aeabb642a3510b4f8554f2828742c7473e86167b0b5adb5c15c7575c81f20841270724b93956c120924ae4283ddb49f28a14362dc92bb7eebbaee19ab08601e4adc193f8e62bdfc3b7df78b3301f54cdba5c2e215748851a27e107954f8c506a7673e0382f3c6b25ca413b473c2fc055b322d16804a3e7cee37f9e791a576eee433a9d1611749cdcb1510fa6a7e60b8fb3d90c70389a4bca2652a5542a836834294ed7586cb94b8b5eab80ae290323625086a7a0084f884d74b14a1a6ad066118c659035b8905098102d028442a980d9ac171492874029994b1a1b65aeb9d93012c934d86e4b5f07bafb721ebde97c388054f7f0894111e3dfd3d72b6c23d5142a02ac4693606de582440045a512d447abb91093332b58300ffc7317d690e98928dcefddb9bd9a6195ad5b1740482d9e7ff510be76f025cc05727c2265048985a25c21156efa782a253e45993d4b0ecc3d31213632c1c1678463312456e4aeaae6ed074f9cc0a3f7eec7a76fbf351763ce7bf9f28b1e0ac7707ad88d443cb7d9a9ff773acdb0582adf4f4856241e4b211a4b20164f2fa32ed2f8b821c8de6b5559689182164968b26128b3e5d9b30b8709401050a0ce2c3521a3d422abd08a7fc7b36a6497562b194805090693490fa3b17286c750388e397f04043e8bd9acc3ae5d5b6030e905d5e03cad54a3dffbe5a770f0fb3fc4ce2bafac66190a7539c7569351248720fbf47f4343d068b5e8e85c3bb440ac4f5ea0d7a9d5858c9074359258b068de2666b75af0fbb77d04f552959a00426af1cc7f7d07af1dfd5ff1d2c5aa5949ae289cb8e90ce2a9e4aafc53e566767aca8d64222773101ca17c1a9e9a5622df68727c1cdbbb3af0adc71f1149a9d5f95388a0e506203b3136eac5e4e46ca11b2e9ec56a404b0ba3eb566fc472e32160e28934a8fde1a693365e3de32fd596a73c150d647fb41a95f8e8f4dc34f29268930afa6643482573c0d0ebd4e8ee6947d7a6367180d1ea5d2ab905ebeedeff7b08c613d8d45d7b4a528284d6767e7383ffe4f871d92091e6831ec41c37bfa542c0ad5419dffcf37bf15b37dd581355a90a20fffeea213cf5c2014cfb660baad976970bd446ad2c942fe2c954d938f0528b4e702c66b2d8b9637b0e1cd11892e9e5590f6bd968737e3f66a6a7e1fdf67f88e6a4224cc820657017f9a1d2699116c83de987d7b3005207a990676fb13336a2b6cb3ca909a3909fce304d68065425f354e6877a097125c112bf2fa4cde649c9cdce8f4a95fb966c071c875c2014cf57229941381843289240269f6a952c584f6f3b5ced3936586241d79ae7b65b6e43fb860db03b72a9826a2dc5948420212561f6493994a4b84fcab87aad46b060c585daaf19b260fe39b10fdb9d0edcfff1db71dbbeeb640fb92240c8461114fff2f27745682ae50ada2b24d5ecca9e68bfa0acc058ef6aca947b52f099db0706c4460945e348e5330a56f39c527513f13846ce9ec5c12f3d8c6bafd851a8220185e1a5fc9b2c0537703a9dc1f4cc3ca6ddfe65148027363794d1c450d4dae22eea7d976adb9392854309213311a0523137ebb1754b27ec4eaba0a0a4167cf74ae5e0e13771ef134f62f3962dc2e8576f214828b853b3c632343c2c284ab520615b527d828436956277188905a37d85f20aa9ee5d1fbc017f70c7af5714eacb028456eecffdddd7f0d689c182cb47b16ab6786268cd9628865cb78fe2f6ee3c38760c0c08cb382947a9c46ef52cc6e9532771cf4d37e2d14ffd4ec9c7308a8e2734c1220145a400f206e0f1cc2318ccb94348856c17c16232eaa0d36baa62c3ea798f4a6d39ff4289102628725e0852a167022de5bdbd1b6032eb85cb0e81b152bdbe561f773ef238befff6316cdfb9b3d25064ffcecddc6c3416345527878791aa1124ec54011a1ed5d069b405e049839154c6331e2f28af5c73c50e3cf9e97bcbbab61400424a313c368143c7de01b514a7cf8f9554cd16bf35331152e85e99df56f6cce4d5b9e7ce9ec5cfeddc01b5560baa726b0159a53e67a6dc70599af1fa535f5ebb2a33b3d30d82b1dcbc0a6071292fac52100cc1e75d5805163e906a489d4e0dbd8127985a38f9ada535aa345eb9bf27f3724e3c96443c9e2ea8ae8b41417b477bbb1d1d5dad056a4170d452b6dffd49b0256d208d2c5466509d6bd0e58c8927864ea277f3e6655733d4d21fd745ab265834ab5cf5d9cfb4d70bafc78bfede6ef4b4b7637b6f377ef3867d05caa278e7ccc8d217fee19f71f8d8714129743a2d127921b9d48048a613e994c888dea88d4c55ecd4a41b1b7b7aa056ab729bb3c16561615ef471e6f96f5424abc55d930590eecfa084403b0a3d7f67fd412ccc47100c46844c51aa507650a99b0478f8a18649a5691282294f4dc65591b513ffcebbbdd043802e349481b2597ec8fe30c82a9bf749a3d57c515cd750aa5f5236a3510fabd588168705f69666610c9458a87ad68c87e8d63bee414757276cb6c6aaaf29a7c5984dc666c189e327d0dddb0b9dae7e16ae7050282032b45056692a91619fa1c2d2de2770fa367509caa2e8fab53b962c560b3a3b3b85604c7eedada347f18bd75e5b58734e2a85e558b2bc66a3defdcc0d4c61dad1e682b50aebacdc7ea99539333c8c7f7af0f3b879ef1eb9cd56d5a3f648040d494235f369c592088562080622e25b3240d6dc49150de9796b30e960b59ac4c768d4e500cd2152092000561bb558398c67bef3df78f0abcf60ebc08048e6d0c8120885c501323d390987c3096bd1f5708dec87f3a253d39ea25aa6fd3a7ce408f6eed953c0807bca8d198f0f8a7d7ff8a74bc5d66d0ee6c88f8e62fb403f9acde69ced22996a18b558eb65099259df2cda3b3b61be08577f8d8d8ce0e6f7bd174f7ff6e2de73c1133f99ccd94598299edf34c0f1ff0475109f252c2ee5a94309a74b5214ca45a442a43efc9b07985ad3245283d2f847398285801017e0289063a16a649f2a6dc45bfef821bc737a04fddbb655aa5ad5eff1445264b664564b87d3d170ea546e30a4e2069d0e914818a363e3d8b3fbaa65554949141ffac263cbd44d3c7586cf8e88896e7555e74650d5ac94a9cc180182a4bba767cda465b5f4e59d9e86ae4981b7bffed55a9a5f766d48c924c3673dac93dc17ebbdfd6e3091f6860d1be436a9588fac15d5b14cdad7dad67ac9c0513c309a0078c80c6cee5b25f31400c2098e2772deb4c15010539313d8b6a3719a8a8a33555481baeb602080becd7d5037f02e723a2e4e8c8de1c7fff8f7d85885bb763563ff59ad3be6f1e29a4fde878ddddd553928569a8ff960107e8f17b6161b9cce4b171e503cae534383e8c83b5e5249406f62494d2c00124d24043824331579d65343430d9f8c4a9325fd4e63d5fc4200a1c0027afb56a35aee7356d693deeb2b9fbd0f1fbb7e5fad8f7957b6fbeb170ee08967ff0ddb76eca85bb3244d20b3cb4c4d4cc262b3a1d5e9909510a2d1932f1d9ac5ef45aa6c607c8a560bc575f7ffd9522935edd9336704afdb68759edc1764ec38bd6fc3c140c9b801b9cf59596f7a621c1fd8bdeba2cb21b58eef726d77cb030fe1c4b9516cd9bab52143a48960ecfca80087c168b82832a79c81321482ee463d7d7dabaa938a28f67ee68192266fba89fbbcbe9a1dd2e40c6ead3a22782a161757100417e6d1d7009d38fbf3fb7c502f657f66e4907ae7596efbae8fde0993c5d210f983949c9e0dbc40546ee646b9e3aca69ec45150f629e7b65f1620927b46a3794eb92f206e9895ae258846108b46b0756bbfdce665eb49eeefaf3df557d8d9db53f7f3de0d0f183c3f8aeb3ff34735b9b7976273cf8d8c882b160cc6dc350bbcab7d3d8a641b5bcb6da62c4038e093838368b634af1b9b557cb10d592d92bcae8df55b70e9fefec5dffd043ef5e15f5d8f75f9a9ebf3f17f7d1e7ff3dc8b0de126262726849f9ed9928f85cf0750adc7a48c8f8d211a89ace936b32640c89f8543a175d36671d27825b3949c81aa408678b6d5a97ef64f4f63575f0fbef1d003ebb12e3f757d7ef0fe3fc119f774493ebd9a97f17a3ca050ccfb4758d6937ab07f6aafcccd6b138035012249f89792cd226b47073b229b85469ce2b80d1ac468a892dc3faa5920a92ee590583884b3cf3f5b4bf3775d9b8db7de29ee94afc7bd9d6b78fad429615fe31a3226876b6832e5123f1879ab15bd711be0212c6781e4eeedff0703d59435539e0ce60000000049454e44ae426082);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`) VALUES
(2, 'lia.busatto', 'Lia', 'Busatto', 0, '2dc4e4a6fbeab8a7f828efa9aec7d7ad', 1, ''),
(3, 'juan.perez', 'Juan', 'Perez', 0, '2dc4e4a6fbeab8a7f828efa9aec7d7ad', 1, '');
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`) VALUES
(4, 'soporte', 'soporte', 'soporte', 0, '855fa866d6d3f72f6a50bc213244e36d', 1, 0xffd8ffe000104a46494600010200006400640000ffec00114475636b79000100040000004b0000ffe20c584943435f50524f46494c4500010100000c484c696e6f021000006d6e74725247422058595a2007ce00020009000600310000616373704d5346540000000049454320735247420000000000000000000000000000f6d6000100000000d32d4850202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001163707274000001500000003364657363000001840000006c77747074000001f000000014626b707400000204000000147258595a00000218000000146758595a0000022c000000146258595a0000024000000014646d6e640000025400000070646d6464000002c400000088767565640000034c0000008676696577000003d4000000246c756d69000003f8000000146d6561730000040c0000002474656368000004300000000c725452430000043c0000080c675452430000043c0000080c625452430000043c0000080c7465787400000000436f70797269676874202863292031393938204865776c6574742d5061636b61726420436f6d70616e790000646573630000000000000012735247422049454336313936362d322e31000000000000000000000012735247422049454336313936362d322e31000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058595a20000000000000f35100010000000116cc58595a200000000000000000000000000000000058595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf64657363000000000000001649454320687474703a2f2f7777772e6965632e636800000000000000000000001649454320687474703a2f2f7777772e6965632e63680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000064657363000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d207352474200000000000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d20735247420000000000000000000000000000000000000000000064657363000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e3100000000000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e31000000000000000000000000000000000000000000000000000076696577000000000013a4fe00145f2e0010cf140003edcc0004130b00035c9e0000000158595a2000000000004c09560050000000571fe76d6561730000000000000001000000000000000000000000000000000000028f0000000273696720000000004352542063757276000000000000040000000005000a000f00140019001e00230028002d00320037003b00400045004a004f00540059005e00630068006d00720077007c00810086008b00900095009a009f00a400a900ae00b200b700bc00c100c600cb00d000d500db00e000e500eb00f000f600fb01010107010d01130119011f0125012b01320138013e0145014c0152015901600167016e0175017c0183018b0192019a01a101a901b101b901c101c901d101d901e101e901f201fa0203020c0214021d0226022f02380241024b0254025d02670271027a0284028e029802a202ac02b602c102cb02d502e002eb02f50300030b03160321032d03380343034f035a03660372037e038a039603a203ae03ba03c703d303e003ec03f9040604130420042d043b0448045504630471047e048c049a04a804b604c404d304e104f004fe050d051c052b053a05490558056705770586059605a605b505c505d505e505f6060606160627063706480659066a067b068c069d06af06c006d106e306f507070719072b073d074f076107740786079907ac07bf07d207e507f8080b081f08320846085a086e0882089608aa08be08d208e708fb09100925093a094f09640979098f09a409ba09cf09e509fb0a110a270a3d0a540a6a0a810a980aae0ac50adc0af30b0b0b220b390b510b690b800b980bb00bc80be10bf90c120c2a0c430c5c0c750c8e0ca70cc00cd90cf30d0d0d260d400d5a0d740d8e0da90dc30dde0df80e130e2e0e490e640e7f0e9b0eb60ed20eee0f090f250f410f5e0f7a0f960fb30fcf0fec1009102610431061107e109b10b910d710f511131131114f116d118c11aa11c911e81207122612451264128412a312c312e31303132313431363138313a413c513e5140614271449146a148b14ad14ce14f01512153415561578159b15bd15e0160316261649166c168f16b216d616fa171d17411765178917ae17d217f7181b18401865188a18af18d518fa19201945196b199119b719dd1a041a2a1a511a771a9e1ac51aec1b141b3b1b631b8a1bb21bda1c021c2a1c521c7b1ca31ccc1cf51d1e1d471d701d991dc31dec1e161e401e6a1e941ebe1ee91f131f3e1f691f941fbf1fea20152041206c209820c420f0211c2148217521a121ce21fb22272255228222af22dd230a23382366239423c223f0241f244d247c24ab24da250925382568259725c725f726272657268726b726e827182749277a27ab27dc280d283f287128a228d429062938296b299d29d02a022a352a682a9b2acf2b022b362b692b9d2bd12c052c392c6e2ca22cd72d0c2d412d762dab2de12e162e4c2e822eb72eee2f242f5a2f912fc72ffe3035306c30a430db3112314a318231ba31f2322a3263329b32d4330d3346337f33b833f1342b3465349e34d83513354d358735c235fd3637367236ae36e937243760379c37d738143850388c38c839053942397f39bc39f93a363a743ab23aef3b2d3b6b3baa3be83c273c653ca43ce33d223d613da13de03e203e603ea03ee03f213f613fa23fe24023406440a640e74129416a41ac41ee4230427242b542f7433a437d43c044034447448a44ce45124555459a45de4622466746ab46f04735477b47c04805484b489148d7491d496349a949f04a374a7d4ac44b0c4b534b9a4be24c2a4c724cba4d024d4a4d934ddc4e254e6e4eb74f004f494f934fdd5027507150bb51065150519b51e65231527c52c75313535f53aa53f65442548f54db5528557555c2560f565c56a956f75744579257e0582f587d58cb591a596959b85a075a565aa65af55b455b955be55c355c865cd65d275d785dc95e1a5e6c5ebd5f0f5f615fb36005605760aa60fc614f61a261f56249629c62f06343639763eb6440649464e9653d659265e7663d669266e8673d679367e9683f689668ec6943699a69f16a486a9f6af76b4f6ba76bff6c576caf6d086d606db96e126e6b6ec46f1e6f786fd1702b708670e0713a719571f0724b72a67301735d73b87414747074cc7528758575e1763e769b76f8775677b37811786e78cc792a798979e77a467aa57b047b637bc27c217c817ce17d417da17e017e627ec27f237f847fe5804780a8810a816b81cd8230829282f4835783ba841d848084e3854785ab860e867286d7873b879f8804886988ce8933899989fe8a648aca8b308b968bfc8c638cca8d318d988dff8e668ece8f368f9e9006906e90d6913f91a89211927a92e3934d93b69420948a94f4955f95c99634969f970a977597e0984c98b89924999099fc9a689ad59b429baf9c1c9c899cf79d649dd29e409eae9f1d9f8b9ffaa069a0d8a147a1b6a226a296a306a376a3e6a456a4c7a538a5a9a61aa68ba6fda76ea7e0a852a8c4a937a9a9aa1caa8fab02ab75abe9ac5cacd0ad44adb8ae2daea1af16af8bb000b075b0eab160b1d6b24bb2c2b338b3aeb425b49cb513b58ab601b679b6f0b768b7e0b859b8d1b94ab9c2ba3bbab5bb2ebba7bc21bc9bbd15bd8fbe0abe84beffbf7abff5c070c0ecc167c1e3c25fc2dbc358c3d4c451c4cec54bc5c8c646c6c3c741c7bfc83dc8bcc93ac9b9ca38cab7cb36cbb6cc35ccb5cd35cdb5ce36ceb6cf37cfb8d039d0bad13cd1bed23fd2c1d344d3c6d449d4cbd54ed5d1d655d6d8d75cd7e0d864d8e8d96cd9f1da76dafbdb80dc05dc8add10dd96de1cdea2df29dfafe036e0bde144e1cce253e2dbe363e3ebe473e4fce584e60de696e71fe7a9e832e8bce946e9d0ea5beae5eb70ebfbec86ed11ed9cee28eeb4ef40efccf058f0e5f172f1fff28cf319f3a7f434f4c2f550f5def66df6fbf78af819f8a8f938f9c7fa57fae7fb77fc07fc98fd29fdbafe4bfedcff6dffffffee002641646f62650064c0000000010300150403060a0d00003b0900005eb2000088540000b61affdb00840003020202020203020203050303030505040303040506050505050506080607070707060808090a0a0a09080c0c0c0c0c0c0e0e0e0e0e10101010101010101010010304040606060c08080c120e0c0e1214101010101411101010101011111010101010101110101010101010101010101010101010101010101010101010101010ffc200110801ef032003011100021101031101ffc401180001000202030101000000000000000000000708050601030409020101000203010100000000000000000000000102040506070310000005030105070304030101010100000102030405001006072011311336305060123233141535164021223423241725b0414211000102020207100f0604060301010000010203000411052021314151911210617181a1b1c1d1223272b2c213237330604252628292a24353839314243550d233b33406e163441540f0e2546425c3d374849412000101050703030305010100000000000100201121317110305060410212f05122619132407080b081a1b103d1f1130100010203070305010101010100000001110031202151104161718191a130f0b15060c1d1f1e140708090ffda000c03010002110311000001b520000000000000000000000007060fe3b0d571b6fade3ed35ff8ecb09f1cec57cf331ff3c9f1d7eff88903ba69edbfc325f4c5cbfd70b39f5c0d87efadd9b2355b564e9f23f4c6000000000000000000000000000000000000000000000000000000000c17c761a061747a2e1741a662ef319f3cb20642f8f97fae164fe98befbe37a2df3ef9f98eb8b79abf5f157ef8ef9e562fe79789f9667e123933ff006d76ed99a1def339edf7379ef75f1c000000000000000000000000000000000000000000000000000617e39d186bfac8d35fd4eaf8fb6fda368c9d4ee195a4db3274fb3646ab62fbeb3db7f8000000003ae2d85f8e76b9f0da6b38fb5d571b6fa862eeb07f2cfec5778ccd0497b0e5a49cfe5bd97f8800000000000000000000000000000000000000000000003823fc1e9222d6767a1e1743eebfc243cee6642cee6f79ccd07baf8e0000000000000000623e599a461eff0043c3e8741c2e8bc94fbc97b0e565eda717b564ea000000000000000000000000000000000000000000001f9898cb5fd5c2da9eeb5ff86c643cee6a53d9723bf66f3bd935000000000000000000000e21a762ef237c0ea233d7f53b1e46b26bdb709bc666800000000000000000000000000000000000000000023ec1e9208d37a0e23e59b2d6cf8d97b69c665feb8400000000000000000000000007e62743c3e8629d6f61e3a7da72dc701b76569800000000000000000000000000000000000000303f1d857fd27a3e9789bd98b69c4cc5b5e23dd7f800000000000000000000000000000311f2cd89759d8f92bf69a36dc3653e988000000000000000000000000000000000001c421fd5f6b06ea3bf9233f989db71e7d95fae1800000000000000000000000000000003cb5fb469afea727f4c490b3b9b0000000000000000000000000000000000315f2cbae5a2f4ec1fc76161b79e6bbc6668000000000000000000000000000000000001e5afd75ff86cb62fbeb3d16f98000000000000000000000000000000034cc4de56bd07a94819bce4fbbbf39f55be4000000000000000000000000000000000000070720000000000000000000000000000000116ebbad80b49e8b3f6efcea51d8f240000000000000000000000000000000000000000000000000000000000000000000000085b53dd443abed2cd741e55b6e56980000000000000000000000000000000000000000000000000000000000000000000000106e9fbf8d75fd4da1e8bc9b37f6c000000000000000000000000000000000000000000000000000000000000000000000000423a8ef635d7f5368fa2f24cafd7100000000000000000000000000000000000000000000000000000000000000000000000111eafb387f57dada7e8fc8b2bf5c40000000000000000000000000000000000000000000000000000000000000000000000047f83d1d7ad1fa55a9e93c8739f6c0000000000000000000000000000000000000000000000000000000000000000000000006bff000d8d57e73d76cd741e55b76569800000000000000000000000000000000000000000000000000000000000000000000001d35bd52e6fd8261daf13296c7920000000000000000000000000000000000000000000000000000000000000000000000008174be87e1a64588def9a00000000000000000000000000000000000000000000000000000000000000000000000069989bcaeda2f4cb65d378e7aadf20000000000000000000000000000000000000000000000000000000000000000000000075c5aa6f33ec760779e6fbae5e880000000000000000000000000000000000000000000000000000000000000000000000021ed576dad7c36961b79e6a000000000000000000000000000000000000000000000000000000000000000000000001e1a7dea7735ec56bba4f1fc8fd3180c1c3a0000006625e287901c9fa3dd2f69da000634c740003212c983a8c0c00000ce4bbceb3010000fd1b0c80c47cb33f3160327f4c4eeb5001c1a862eeb56c6dbf9ebf5cbfd70b78ccd064be98a000356c6dbea18bb9f257ed95fa626ed99a1cc7d70800000001c1c80083b4fdf7b6ff0009936bc40028452fa3000000b9d6ac23130fc480383b8dccb496aca930054cada02890009c262e05aa35387cfaadf900005f9b5377968b0a135b800727d25bd3d40a6fcafb762fe79805a4e8bc9378ccd00181f86c2b6e87d4753c6dc003ba6934edb859b76fc1818ef9e4d70d0fa7e8787d0803f6895b65c7cfbbaf3aeeb50000000638c88078e9f7aa9cdfaf5b0e97c7bbedf300509a5f4500000173ad5846261f8900003d25fcb536b90a495b455120012217b2f41a9c3e7dd6e00005f9b5377943b134c6b600017eed4dd6429c72bedd8af9e581693a2f25de333403aa2f52799f64d7be1b200002c1eefcde59d9f1dc155b9bf5ed37177600004a9b1e46c46f7cd00000006a90dae40439aaedfb6692f6d38b000a114be8a0e400700b9d6ac25130fc481bd1e335100b3b3164ed51f3f297d48000cb9f466f41a9c3e7cd6fc8390017e6d4dde55d2b356a2c0002e6dab31cc0a71cafb762be79605a4e8bc9778ccd008e303a7ad5a0f520368c8d4cb5b3e3abee93d1c0cffdb5d6f7a8f17d5b1b6f5339af620327f4c5b0dbcf35ad9a0f51e98b8fda2e6757e1dedbfc00000023c8990e60711354f9bf5fb4bd1f91fa2df3000c71d7088d3502b603702f5da83dd2a6d5b43f12059a9892a628dd6c04e131702d5fc1f36a97f383de78003e8d5e9963f0636020889ab71603b4fa2d7a654a9b5b4031207bcf002d04c590b54538e57dbb15f3cb02d2745e4bbc66680429a8eee0ed477c04adb2e4278dcf9e530e4fdcf99802ebf5be131e60f4b5af41ea206e795a3b53d279153ee5bdaf09f2ce02d5f47e43b8e5e90000002248996e6068b87d068f87bf9cb71c00000021c89a655b01ba17f2f40297d6d0fc48166a62579ad0eadc099a62e55abae43e7956e04a288b9205ecb56449800526ada2889025245debd4525ada298919636534404e7316f6d514e395f6ec57cf2c0b49d1792ef199a0104e9bd0619d577004b5b2e3a78dd79e52ce4bdd799804dcbeabc3a3ac1e9abce8fd280ddb2f4369ba3f24a85cbfb4603e3b102cef41e53bfe773800000c1c3464cab302bbe8bd2e6fdc70599fae08000021c89a655b01ba17f2f40297d6d0fc48166a624098a4b5b013ecc5b3b563389a375b0164a62b6c4816fed59c6600f01f39a97f3805b59acf7681f3f297d481bf1974454912317aaf414e395f6ec57cf2c0b49d1792ef199a0100e93d1621d676804b5b2e3a78dd79e52ce4bdd799804dc7ea7c423bc1e9abe693d200ddb2f4369ba3f24ad7a0f52c3fcb3409df73e7bbae5e88000010744cb931953aa2f5d345e996437de600000010e44d32ad80dd0bf97a014beb687e240d84f198a00b9f6acc33105c4d43ad80ba96ad2bad80b233167ed5021c89a655b01fb3e88da99c97e0f9b54bf9c1324c7ac84224664fa2f7a0a71cafb762be79605a4e8bc9778ccd0080349e8d116b3b3025ad971d3c6ebcf296725eebccc026e3753e231de0f4b5f749e9006ed97a1b4dd1f920000000000acb5b59ab5468785d0e3e993266c395000000872269956c06e85fcbd00a5f5b43f120003622d55ab324c0ac75b56b8903e80da9446b7c6026498b996a814fab6842240928bcd7a0d721f3cab702c4cc7e8ae91207d1cbd328538e57dbb15f3cb02d2745e4bbc66680405a5f4588357da012d6cb8e9e375e794b392f75e660226e2f55e231e60f4b5f749e9006ed97a195765c8e8585d080262daf13b664e9c0000f115b2b6b416a88374fdfcd3b6e17d36f9000000439134cab603742fe5e8052fada1f89036b3c460419a2f65a9b54a9dd6d09c481f492f4a174be9e0dd8bf57a0eb3e7552f8800b5935b096811a44d1aad80b5735fc955a2c05eeb564298a71cafb762be79605a4e8bc9778ccd0080b4be8b106afb4025ad971d3c6ebcf296725eebccc044dc5eabc463cc1e96bee93d200ddb2f43b4e46a620d676800b33d0795c879dcd000010a44e5c95260425a8ef26ddbf0600000021c89a655b01ba17f2f40297d6d0fc48166a637f98a4d5b0161662d5dab44a978f01933e8ede947e968bd23d87d22bd3f44691346ab60393e86da9b1484171350eb602e55abc14dab602e0dab37cc538e57dbb15f3cb02d2745e4bbc66680401a4f4688b59d9812d6cb8e9e375e794b392f75e6601371ba9f118ef07a5afba4f480376cbd0c8b9dccc25a8ef7c35fb81667a0f2b90f3b9a000029ad6d70ed5ef3c74fbc7383d34a5b1e48000000439134cab603742fe5e8052fada1f8902cd4c4ab35a215b8135cc5c5b57e7552f8407a0900d40c3007d0cb53649557adabbc4812097bef402b1d6d5ae240dd0e4d2802c9cc59db569c72bedd8af9e581693a2f25de33340202d27a2c41aced0096b65c74f1baf3ca59c97baf33009b8fd4f8847783d357cd27a401bb65e86d3747e495779df59d170fa002ccf41e5721e7734000359856a8b5bbb5468f87bfd8befaccb7d70c000000439134cab603742fe5e8052fada1f8902cd4c4af35a1d5b81324c5bfb57e6e52e00000177ed594663e7d52faa005a49ad8cb4014eeb684e2400001334c5cab569c72bedd8af9e581693a2f25de3334020ad37a0c31aaee0096765c74f1baf3da5bc97ba733009b9bd5f86c6f81d457ad1fa481bb65e8ad3747e475779df59d170fa002ccf41e5721e77340002add6d2bcc49b30340c2e8b7fcde740000000872269956c06e85fcbd00a5f5b43f12059a9895e6b43ab7026398b3135a095b803f29e51c805b19ac9d31402b7005c6b576940dd6547e978ec03807201bc17e2f4a71cafb762be7960581ddf9c6d993a7f4dbe51e60f4b0669fbf0253d8f253b6e7cf69b72bee040fd175badf088e303a7adda1f500371cad25abe93c86abf39ebba5e26f00b33d0795c879dcd000780a3f4bdeebd3906a38bb9dbb2b4c0000000439134cab603742fe5e8052fada1f8902cd4c4af35a1d5b8131cc4df314b6b603602fede95beb6ae512058498d8915662c00005f9b529156f8300b996aee68a015b81ed3e90de94eb95f6ec57cf2c0036cc9d3ce5b8e02b0f3deae06c1f6d74899fccc37aaedc0da723536cfa6f1cd77e1b3a8bcc7b301ebb7ca70dbf0106ea3bff357ea0599e83cae43cee68002ba567d2582b40183f8e7e73ed800000000439134cab603742fe5e8052fada1f8902cd4c4af35a1d5b8131cc48e8aab16037c2fa5e95f2b354a2c04af31be15b2240000bd96ad13ad8017ced4dce5f36297e403e87da956796f6ec57cf2c0036cc9d3dafe93c7eabf39eb9a662ef000072595dff9648d9fcc8acbcffaac7b83d200076cd7aa2c2ccf41e5721e773400f0943697be77a7b403cd5fafa6df2000000021d89a6b5b01b997e6f4029956d10448165e62579ad11adc098a633c57f89025598baf6ac2313506b6036926898add1200005c1b569f56c00fa156a6c32f9bf4bf9002ef5ab0472fed98bf9658006d793a7b5dd2f8ff00829915f347e911be0751f948195fa624f1b9f3c93f63ca01e3a7debc68fd2a37c0ea3804859bcdee197a48434fdf0b2dd07964879dcd002b456dda592b540000000000038001c800e003907001c83800e4038001c9c00000727000390700039070000720031bf3cad631f6de7afd329f4c4dab2751fb9a8000c17c761ade3ed32bf5c3db3274e380720035f8518adefcde9ee00000000000000000000000000000000000000000000000000000000000000000000000029b56d28cc4f1300000000000000000000000000000000000000000000000000000000000000000000000011244d69adaf7de9fa0000000000000000000000000000000000000000000000000000000000000000000000018828552f752d4de2400000000000000000000000000000000000000000000000000000000000000000000000e0a5d5b6fc594b54000000000000000000000000000000000000000000000000000000000000000000000002ba5662489bc57af60000000000000000000000000000000000000000000000000000000000000000000000008a626a356d7c6d4cf4800000000000000000000000000000000000000000000000000000000000000000000001a2c291d6f752d590a6000000000000000000000000000000000000000000000000000000000000000000000001a8428e56f6bed598e6000000000000000000000000000000000000000000000000000000000000000000000001a7429056f66ad59da6000000000000000000000000000000000000000000000000000000000000000000000001a0c4d28adace5ab3ccc0000000000000000000000000000000000000000000000000000000000000000000000022089a855b5b0b566c9800000000000000000000000000000000000000000000000000000000000000000000003f0567ada0189b956ac9f300000000000000000000000000000000749dc00000000000000000000000000000000000001ae429f56f892e7da9b5c800000000000000000000000000000001d66990ef370900000000000000000000000000000000001c103d66ad45a6898b576afac0000000000000000000000000000000000349845313294c6f520000000000000000000000000000000047f1354eb6d6cb6d6acb5300000000000000000000000000000000000003f040b598d5336cc4b131fa00000000000000000000000000000d36159e2d0fc4cfb31672d5c880000000000000000000000000000000000000018c2b856d1244cd33137cd76590000000000000000000000000e08d626bcc4c45132dcc5a19aee52000000000000000000000000000000000000000000c2c2bcc5a0489dd098e6b304c6c92000000000000000000000d7210b44c1916d4097662c94c6ff0030000000000000000000000000000000000000000000001e1210acc0f16d10dd494a624d98916632e000000000000000749a0c4c5b131344c7e6589be627e9aed920000000000000000000000000000000000000000000000001a4c2158b43f13a79c9b59bd4c6ec6df31b49b2cc654fd000000eb3050d613a89a544e8913a11e23224b13133cc4b131e800000000000000000000000000000000000000000000000000000d56116c4c6898ee275a00e0f41963227b8ef383ce784c618a3ac03de6fc891e5284c48d31dc0000000000000000000000000000000000000000000000000000000000d4e11ca75289d60d76270e62cf39d47e8ef3de65ccecc6ca6d48dda525cc7680000000000000000000000003fffda0008010100010502ee1e14e6721d9d38cfa011a5f524b4b6a1cd1e95ccf235694c86755a348c81e8ca287ade35bc6b78d11c384e892b289d27934fa54967191a748ea3499690d476634df36c757a6d22c1e7839f4e44c6d3dd45609d3ccf275cd3a93917bb0947bf5e93c667d5a2615921e89804f9a8ba793435ff003995aff9ccad0e9dcc050e9fcf051b06c8cb4a62991274ac34ba14721d31b70a69904d32a69a87289532cfa11c5357ccdf17c0d21331916121a8c9853fc9a6e46c5298e6698b4fbca6da73227a6da77129d37c4b1e6f48b266dbb53a69a80bc0c2b9a5f05c796a73a6e88d39c02711a750730cac9a8a247619aceb1a8fd418c714d5e357a9f800440025336868fa93cd66e428444c2d183e7e663a7b2abd32c0a0db53662c9917f4eee2231f53bd3f865e9ee9f4b214f22e463c5bb970d548cd40926d51793c3cb77e98c52165f3c8d6552990cb4c0a699d53c6e0b32f6a3b07846549a69a45fd6880083fc460a42a434e9d274fa2a4a30d1398cc46544661112ddf5359a464554b6412932668c9dbf562b4f143d47c446c593b8cc529c24b0a847f525824c33a8bcaa6a0cf0d9445cd77b4b4dc743253998c94bd366ae1e2d0fa7c234d1934608f744844c74a124f4f0e4a6395cdc02b1f26c6511ef1110009fcf12429770bbb5a0f057afaa3a2d84523dd8e5ab67893ac2cecd66193a892dddf2526ca25b641963d9b18984909a5a0b138e850ef070d9bbb4918e771348ac558bdd990e4ece09392937b2ce71dc21c3fa6cd5bb243bcf706feebca3314e368a57722eb1bc2d08ef10e579972ea3635e4bba80c7194123e20cbb2ff003542c23c9c75110ece15af88331cb2a0a09d4ebb8d8c6912d7c4199653f0cb090aea6de4646b58969e20cb3242c2b68f60f265f43c4358567e209c986f08c1555f4cc8637008c132f102cb24dd2c8a7159d7f85e35f4e47c439de41cf5708c77e7b8f10e55381091d0d14e27249ab6459b7f1028a1124e7e5d59c93c52082123bc439fcd7250c120fe63bf10be788c7b4ff7722988e6284632bad3b08dd5fc931eafc931eafc931eafc931eafc931eafc931eafc931eafc931ea6aeda3e49ccc443257f24c7abf24c7abf23c7ebf2081a4e4e355a22a9a81b2ee4a3a3ebf24c7abf24c7abf24c7abf24c7abf24c7a9a49c6c80d95552413fc931eafc931eafc931eafc931eafc931eafc931eafc931ea45645ca54a289a49fe498f57e498f57e498f57e498f57e498f517228039ae6978921beb50f5f5a87afad43d22b22e13d8e14f72d80622a6a34585175219ef6f9fc12c2ce498489369fe4f071c2aea2c51683521a6f435061141632f19261da0fedb3a852fbc74fe1b968ec673d5fd8694f496aaf56ec6e0a228a263199ae4f127c3b3c659385f585c79e6767489cf2b23b659d31b7847495672e3e2e25b2530a666ab0396d695fba5f0ae9abcc4cb3846b33934a4d1b612555414c6f39318f790906918d6772e919836c14c621a033a72d4c8ac9384bb2905792d2ef1d24c5ab645d64b388229b6476339eafec34a7a4b557ab36dbb85da2f8bcd972184b6a739f91986ce9f39f8b985b2ce98dbc23a4ab559cf2713dac2dcfcbc52d2bf74be15d3565554d04a766169b90dbc1278cf1bd70aca27549b90dbc1a78ecde76536aff00b77d4394e5b7d3e89e4b5d9ce443f2fde15bc3677856f0ad28e92d55eacbe338848e5459ec566b1b35f46df1852b65ae7e5e4fb310e7e1cb5b2de98de15bc2b786ce11d255ac8e7732dad2973cfc52d2bf74be15d356cf1e8b583be371059a959ec2e2138abc0bd18f98aca1d0b480bc6b2348c8298263e66eb246416b14e64ccc9c83c67d8aaafcbceec2205076a2d94646dd049aa1b2a46c72a7fa4c5d6a8b062df16be1e9915ca7e93175f498ba45041b93557ab2fa33c351db11c61f7d2257c99251cc04238585cb8b3768a3846f10ebe6c551c8450bf498bafa4c5d6ac9d8308bba4928bab14c09171b5ac2e7cf3377ecd48f7b6d1b75bdbda57ee97c2ba6ada92a7f1be9d17ff5df17cec8385b7eea487cc967ea79202f8717cd9254d97c9337c415e6e39d8e1cafd4a7ed99c8fd3e0f4ee2f79bb0d57e93be17d597d55eacbe8cf0cf7a42fa4e02394d646e3e263f7c5d97c8c66fa7cebe5621b1a9b27f51caafa6d15f53caada9ce39f985a25bfcb95ce92e4e5d6d2273cac86d2bf74be15d356d4937fb17d39fb9bafea870bc69bcf1da8a3ff917c2fa96a7fef97c1477e39d84e48044c3e99b316b895b3e7c6792f0f1e58b8cec355fa4ef85f565f557ab2fa33c3535e26d711be8f3713ccd6a3b8f8f875f0463ccc06fa44e455c72efdda51ec9c2ea3b717d218af8f0f6cb5c7cac9ed81b7f9397ea723cacc2da78e7e3661695fba5f0ae9ab6a38ffbf7d39fb9bafea870bc57daf51bed57c2fa96a63179e712df88e475f88e475f88e4758831751d0bd86ad490b7818a6411d194aa84452c5903cee4fd8eabf49df0beacbeaaf565e2b20988309094929556fa6300b43c1d6af38e5e3d7d3c69bb06e17d1a73b96beaa49fc1c66e521d4341c69622228e60211c2c2e1c5b4a10e6e57aba979725b4339f872f695fba5f0ae9ab6a387fe85f4e7ee6ebfaa1c2f11f6ad46fb5df0bea5eda7d4fc8b53ad9b3ef870180c7fc587ec755fa4ef85f565f557ab36a1da433b5314c230e40b6d6571fcef88a1f1f179347e3c95b4a1cf232abead4a7cbc82fa7915f55caad91b9f87017d1b437bed644773dbc53907b1952bf74be15d356d48fefdf4e7ee6ebfaa1c2f11f69d46fb5df0bea5cbb25908375ff00429caffa14e57fd0a72bfe853958c4a38988adb7aed260cf4a90564e76d9eaaa3d936cdd36adfb1d57e93be17d597d55eacbc2631339104ac14bc1a9689989183798ccfb6c9626b56dc73726b6e11a669037679823f1f29b614ebe1e5765142a49cb481e5652fa4115c98eb6a3b8f8f875f4710f2c66b223be3efa7eebe562152bf74be15d356d48fefdf4e7ee6ebfaa1c2f11f69d46fb5df0bea5d48fefec607d3db7aad2ff00071fd348bfa762b68b27d633aecb55fa4ef85f565f557ab2fa33c353da11ce217d1d7872c956a0b8f91985a311f91275a96872731b33702d1d947cc5ad4494fa5e297dc2358ec584341db579c72f1ebe93a3cbc575610e6e2b7d2373cdc6ea57ee97c2ba6ada8e3ffa37d39fb9bafea870bc47dab51bed77c2fa973784949576f19398f717c0fa7b6f3774a6539ba08a6d90a78e0ad1a69fb41245f65aafd277c2fab2faabd597d19e19f86fc3efa486dd93d4e38f953566ebaad57ffa2e6352b2f2136eaf8dbaf9b8fd6b0ca731edf038afab6537d6571fcef1998e470ed24b32c925d9df469cff0096a57ee97c2ba6ada8e1fefdf4e7ee6ebfaa1c2f15f6bd46fb5df0bea5acdba8ef81f4f6d64b3058283d288b33f9eb668e45be3b12cc23e33b2d57e93be17d597d55eacbe8cf0cf7a42fa51d54f5706acb7efec74d1cfc9c3eb2a93fac6437d1e8af235beadb8e6e4dd8693b9e4e5352bf74be15d356d492ff009efa73f7477fd50e178f272d86a37da6f86752d66dd497c0fa7b6b57a7398e34ee1be8f8c5b2527cc90ecf55fa4ef85f565f557ab2fa33c33de90be94f55e6ae3e2e29b1bc367479cf9e1f3094fa3e37b18be5387c2407e7f87d7e7f87d3376d9fb5d4171f2730bef0ade1b18439f899654afdd2f8ae450ac60bf2dc729b64906f17d494ff00c77d3b36e99933f2e36e05f38a61e526a027e781be207f26475989c0f925f03e9ed97ef508d6510d9c66b98000005bc9f2329ecf55fa4ef85f565f557ab2fa33c33de90be94f55ea9b8e4e257c790f933df4b8dad5f64ddb8df471cf924f58df289b2dbc23a4a71c7cb9abe9ac6b33e253f10c1483bb2702d1e80f98257ee9b38a75166cc05f40de0a58f09253b9d377f1b7c6581a466eb21623230b76ae5466e4751d97c772e1576e2f81f4f6ceae4ff29b691c1fc78fbb04ff00dbecf55fa4ef85f565f557ab2fa33c33de90be94f55eb1b8f2c6df044816cbeb58d2df157d3175f1f2fd67f776f16581b60bbc4763044410c45d27ce6bb18ebaf9b032bf74d9c53a88400c194402906fb6f0cc7cd10ced99411a2a4364e9a89df03e9ed87cf5bc733319fe6993b266847b3bb727913ecf55804713e5a95cb52b96a56184386577d5329872ce5a95cb52b96a568d94c019e74872d4ae5a95cb52b4a8a60caf585632b29cb52b96a572d4ad326e73e615ab68f331be5a95cb52b96a562cb28cb24d65288abcb52b96a572d4ae5a95cb52b96a572d4a2ae2db4a3967ae5a95cb52bc87ac71116f8f886f076819377cb52b96a572d4ad36702be1f2a537d53c86af21abc86af21abc86ac54a60c8a9f316b24da6b07918f318a621aec22e4250f8e6168459aef19b67ede770a7f1a6be3589b9985350628856be435790d5827ed8f6c6ad647fb691e3fe54fbe777e89d46c7bea530ac71410c131d0a6f8a63ed68842265da7d071122238263a22d31580646ec27a65bc044b26d2397640c59b78e67e21d4cc9feb32ba578d7d3e3fc43a8b957d022b09c64d934c94a5217c412d28d21a3e5a4a432799c3f1b4b1887f1070ad43cbff00217fa59897943c43a9b99fc7260d899f27932108913c419e6669e34ce1e26432495848667011be20cbb2b698b47aaac9e432b86626862d1de20c9b26618c47cacac8e4327806105c79bf88327c9d862ec66666472191d3ec0be905f106599847e2cd65656467e4301d3f08a0f10667a80d31e2acb48cd4860ba7e94117c3e739132e65a9de6a8e8e909b7d8760cc7184bbaceb2690f79ce641178f35cb33b93c98d8ce252b9438c7b1a8bc69a7761c84548e5b4d43d4365511347eef11028653aa2c63ea4245f4b3ac474c5d48d3468d98b7eefc8b1189c908acde6b819a0734c7f210eecc8f3783c6c325ce66f2518681949f738a69dc5e3dde6721542e4ba56c9e536cc335c31c41ea5e3b2d45314e1dcf3b974163a5c8753e6a5a88459c2b8c6953a774c2398c5b6ef5908c612cdb22d25593a693194624e61b57c835159241cd97b8b854dea16370b53ba9d904b50898e6c774d67266a031284c6d3ef994868b9a427b48d6253e8d92877313a8594c4d456afc72d51b91c14c07eb653238385098d5f6c4a99cbb219ea2944c681d32c825aa0307c7f1eefe78c59c82335a4916eaa6709c9212d1b9964d1351fac4fd3a8fd51c55e532978a910fd2aab2481243503138ea92d632d4a679954ad0889863a224e5d585d217ab542e2d05005f014be198dcdd4ae8f2c5a93c472387b00880b2cb3258fa67aaf9437a6bac89d35d57c557a6f9d622e69098897540629bb132899297c8605ad39d44c3db53ad5e804a9e6b1491c1eea2e5cf69d3c78f4f4ca3a424948ad29c89ed446976351d483741aa5e0792c5b1e97a90d20875a9fe93e4ad69ee35904757ff00b74d6592a24ece2605cbb2820173bcbc95ff0041ccabfe819951f38cb4f47cb32750149998580ea28a8ddab07cf8cc74e32e7d51fa387a8dd39c4e3a924516e4f074a862a20ea034a9dd39c1f4f54a5f02830a5b0bf252b8c3b4a9486769d1a35c96be12d40c1c0d045ba11263cf4f4961eb1c50c1181a9be0786169b627a5c85306da6edcc9f2bcbdc5ffda0008010200010502ee213805738b5cfae78d734d5e7356f1daf30d730d5ce3573c6b9f5cd2d00878384e0142b850ac6a1308ec6e1ae59ab946ae49ab9035c81ae40d7206b926ae49ab966af28ec81c428171a058b40203e07130050af42a186e099868101a0402b965adc1db7902b925a1428513509042e0a9828160a01dfe0232a014654c360011a04068112d00007ea04a03428850a0342510adf455868aa00f7f19600a31c46c54446811287700a451a14284a214554428aa80f7d19500a31c468037d150a028077299228d19110a2a825a2a803dec630051d511a00a2a1401bbba44a03464281431680c03de675ac4444680a01dda21be852a053bc0c600a3a826a29446889807788856eddddc7500b46308d112df401bbc40a2bbab8d112dde21515a0288d10805f10a8ad14be6a29403c42aa944279a8a5dde21554dd452f9a8a5dde2150fba800444a5dc1e2039bca1fb88909e50f109cfe61489bbc44b1e9226ff0011287f2814be6100dde2239bcc2993ca1e2158d4893c4423babf730806e0ef6f3057982bcc15e60db150a15cf0ae7d02c5a0300ed8a850ae78573eb9e5a0300fe89735225ef8371ba5e9b98c05a32823b445b6047751d511da22dfa011dd41fc8ddf06e374bd3739bcc3b689eea1fcc3b689f776eb9a902f7c9b8dd2f4d961fe37217789d20dd720ee1a507f8dca1bc7925d901fdbb51fe460ef9371ba5e9b2fb08711e1b2b7a6e97aa8fc6e97a7b454771502f7d1b8dd2f4d97d84388ec9782fc2e97aa8feaba3e9ed161fdca1b83be4dc6e97a6cbf1ba1c4764bc17e174bd5464cdbf966ae59ab966a483707689ff2377d1b8dd2f4d97e374388ec9782fc2e97abf42a8ee2a21fb77d1b8dd2f4d97e374388ec9782fc2e97a95504b5cf3573cd5cf3573cd499b78766b7ee21df66e374bd365f8dd0e23b25e0bf0ba5ea5f8ec23e9eccbfba9df66e374bd365f8dd0e23b25e0bf0ba5ea54823421bb611f4f64234887eddf66e374bd365f8dd0e23b25e0bf0ba5eaa57d5747d3d92a3fc4a1b83becdc6e97a6cbec21c4764382fc2e97aa95f55d1f4f64a71efc371ba67002f30b4072d2fb0871370d95bd374bd54afaae8fa7b2fff00befc371d94fd4a86f2dc86f289d6de174c379a8e1bc2e035cf0a1d847d3d9077e9b8eca7eaa509e51db489b82ca9370f608fa7b20efd371d94fd5421be8c8886c814468896ed810df4748436134f7d2c5ba3e9f0889406b945ae4968132f602401ae496813287ff0a8ffda0008010300010502ee22b750d458e5468b17411a9d03144281b2415cb256ed8f2850a44a16a90d0b0468d184a3461a8cc160a32662f83936ea1e89187a247a41454885d8150a142e920a17c8d7d452afa9255f534ebea69d7d4d3afa9255f3d1a0788d02e98d6fd83b748d478d20d1e3950a32662f81d340e7a4e32936a912e7769168d264a349a94678b0d09cc3daefa2b85028b20b05165068b2290d1174cd610df4a3148d4a469c28c4317c0493050f493148963a852529249851e4151a328637ea08b1cb4492502892498d11521e8c50352b1c41a55aa89f7f231e73524d934e847752b20996947ea9a8477febd37aa9293932d26b10f4b324cf4b32513efa4189d4a45b113a39ca505a4a9458e7ee549f2a4a4a413352ad1356976874fbd9140ea0a0c889d18c0505a4a8e73187ba1358e4a4a4a946692a0a24620f79378f11a2940a0bc814b4a2a6507bb0a712895f798146bbc3bbd248ca0b66654a965c8983878753bc4a61288a85528437776b6686569248a98397e05a3184c3e1f68cbcf5fc48574f84fe2166c69554a995c3a32a3e2066ca975ca915658ca1bc40c99d3870548aaaa650de2062d3cd4bae548aaaa650de2066d79a2a2854cab2c650de20411154c0054c8e9c0aa6f1000088b6401223e75e71f10c7b6dc0fdcf903c42d1bf34ebaa0910c6130f880037d37441223c71cd3f886390de320e3ca5f109082737f1453514139bbdb92a57214ae4295c85284043688cd5350461ebe966a3472a14748c4db4da2a7a08c3d7d2cd468d5429444e4fd146a3524bfefdee8fa2efbdfba28195320d489ec8800d3a8fd84d331c5bb2227b4e23c0d420203db108263184a82461111ef747d177defd80378b7441226dc837f28d9a37e5136dfb7f317b68d4bf7925b79bbe11f45df7bf68f26f56ee96e526ddf29ccbb8279d3a685f32b754fe420482dbc07785ce5f29bb520020898c261ef847d177defda2c3624fdb4fd5b03c6383fcb77becd21eddde86e5bb462979d59357be91f45df7bf68be1793f4138ec2beb8cf72efbd8a6fed5e43deed2393f2a6b29e73f7ca3e8bbef7ed19e8bc9fa09c7616f5c67aeefbd8a45da409fcc46be6235f311a7aa14ea76601bc5d9b94877d23e8bbef7ed19e8bc9fa09c7616f7233d777dec7e85827e656454f329df48fa2efbdfb45fa6f27e8271d85bdc8cf5ddf7b0c9a9150fa6a55f4d4abe9a957d352a749026a7671c1e5218de61efa47d177defda2fd3793f4138ec2dee467aeefbd88bf4ec487bdd9abfe36bdf68fa2efbdfb467a2f27e8271d85bdc8cf5ddf7b0c17226521c0e1790f7bb2217cc6923ff3efb47d177defda33d3793f4138ec2deb8cf5ddf7b14c3d9bc87bdd9312ef5963f9cfdf68fa2efbdfb45f0bc9fa09ead853d519ee5df7b14c3d9bc87bdd9351f293bf11f45ddb650cafc35a8cd5528458fef793f6d20fe7b0351c3fe5bbdf669907f86f21ef765bf721df88fa365e7b2c14f2ab7708f348de3c4a7bba53c8953653c8a5ce5f307d30dbca50285e43deec941fe3df88fa365e7b34d1c734bb6f9cf30d662e3984d9df790f7bb230f7ea5e8d977ecd26a188283f21f6545484a72f84fb0438945bbf29f61d3c04c2355fe5690f7bc22454e5a07eb57d416a33c586b7ed91c284afa82d4776a9bff8547fffda0008010202063f02fbc90fb091cc90c811cc51c2e0a38a42c8e1fe2a39961884730c2c8e6170cc6e198dc331b87e15bf31393ff0a5c9ff00719c9f91e3771cb4ebb75fb93fee3bf31bb323fee3bbf23c0fd28cffda0008010302063f02c0a02c8ee5aa92f88526a417c54940a815251193a01791518a8062257c94d6ab5522a4548ad54d7c94c3310a05ca1151191fc42f23eca02d9a80500a6a26fa06c88518281b7b2f18a8e428c177b225422a10513f5102a31518281515e305118f7941405908a843009af20bc4aec57718d3cc0282795e0bc8e0bdd4609ffc851962de29f329e53b67ba79c27c4af30b97f994edd89bf7fb2704edb129fbb0d785c7fd43c2e5fe45e3f9c41db53e65792ec311785e53efff0070ef44eda9db269e73072dd2fed7609db6598796ff0064f2bd330f3dfec9e53ce61e7bbf64f29e730f3dd24f29e730bcc93ca79cc2e5e817a661704ed755c44b31733fb2e02798bd13d3ce6277baf4cc5ccae035cc4e0bd02e4717915f12be257c4a8b52530a767906e014c29d9e43e8b9fb2e03f7c605183d68c38284fbb315cb67b30e0bb969fb269c6fdc1513ce3028c1eb4b5c9d71cc6b6faeb71cc4c5ff0035c3b63228c1eb4b5fd987a03748b0458183bac7b045f513ce3228c1eb4b77302a85d1b36d1837b48a1b31a1460f5a5bb981568a3460f5ad9b68c1bde5dd1dd8d0a307ad2d2c0ab46a8d183d6b6004a9a9a9a78bde2298d8a307ad2d2c0ab46a8d183d6bf4548a776c6c5183d69696055a35468c1eb545eb55aad56a9c2f376f29f8d8a307ad2d2c0ab46a8d183d6a8fd08dbdff00f71c1460f5a5a581568d51a307ad51e453c5f80b8f6c705183d69696055a35468c1eb5b05f844e3828c1eb4b77302ad1468c1eb5b05fefdde8ef7c745182405f14f216e0c0aa1746c17f53fd63a28d6e55831c572dc5826c05871538270bfda31d146b759eb70e1216bb5194451add63c2f28167c8a76d8061e13b740b0e13441ae558153b27710364ff0042a3ffda0008010101063f02fb0693144cce36823b9ca04e211d1971fe0228e3511f2d224e7ad746a011d134cb6340a8ebc1f9ac806f21091b11bb9f7b49653ad446ea69d34dde915b714ad44e898bb1762ec746ea93a0a22296e71e4e838adb8a133ce78c72b5e374fa5ce1369d8a23e6259a7383948db8f9a935a380a0ad7c98b6f968e071047f08f95986dde02c1ed3be72690850ee29a55885b82991975be7be56e13b260864a2593e026938d54c7cdccb8ee729468c572c3a196757c16d476237122e5bef864ebc7e982784e236e2df348d15ed031ba7591e32beec7ea59f3b6a3f52cf9db5169e64e9ab6a2d164f8e7eec5a612ad071314aa457e294ab58c74b24f268ba79b551192e24a4e0228cda447cbce38077a4e50c4aa6289c65b9818452856c8d480999cb96578432938d319726fa1e1e0281ed1e99e984b66f22ea8f8a2dc145572d95fcd7ad0f24410fcd2820fa36f709d4ccc940ca26e016e296a4d691df39b8e347cdccb6d6720159e4c5332f3af675210352dc6e64d2acf7295f1a2897610df01006b765a1c4850c045314bd24d289bf9001d48dc34a68e142cf2a98a6527549ce71215ad4412c96df1e0ab24f9d1f3326e228eeb26918c5233038d28a142e292683a90029df89477af5b3e55d8089f6d52aaefb7e8d4b7a91ceca3a9791df20d3da0d26d082db2af8b74772d6f74d5720a1b5fc2b67b96b7de55d82a51a49ba4c644930b78f802918e02a75c44b0ef77ebd4b5ab14be1732af0d540c49a23265184323c0481fe23e6e55b733ca4538e29965392c738e527cedb82a9371132306f15ab6b563e76596cf84a4ee71dc8e7a55c534bef90683a901158a04d23bfde39b50132ef643a7d0b9b95ff001d2fb74a966802e9305aabc7c63bdf0b4d8d3bfa507e31ee8fd423728c5b701b69256b3bd4a4524c05ccd126d9efedafc91b3014f20cdb985ddef922d406da484245c4a4503fc7506d882a54bf32b3ddb3b8d4b905756cc0747ab7772ac62d4513d2eb6bc22373e50b5010a5fc5323d13b6f12aec06b2fe1df3e89db54e81b87eda532c7cd4c0ee107729d1547cdbbd1de61169034afe9c73126d29e5f7a914e380ed6ef640f50d5dd3546448b096b0abba3a24dbfb132562906e83054db7f0ae77ecda1e4dc82b95a271bf02d2fc93b11f0cf52eb68b4a967e9ca4e8136c40432be6dfbf2ee5a56961fb5b9d9d7282778d0b6b568082cb5f2d2c7d1a0ee95c254097946cbae2ae2122980f574e51ff19b3c656d6380c49b496503b948fb27227984bb81477c340dd82f54efd345b0cbb774942048fee0656e37794afc41a06e2a3e2245d0ea6fe11a22f7da549b405d30a95a96875cb8a993bc4f070eb429f985975d5dd52ad93097eb2a6558bb91e955b51cc48b21b17cdf3a27ecd2c4d36975b3752a1488f8efdb532651e1e8946941cea76e984d5ffb8d8f81993690e9fc173415f6819a9e73211785f51c004165be8252f320db570f6a39a926e9037eeaad213a2603a47c44cfaf58b9c117bed12c4d36975b55d42852228ab165e95ff64eaada7ab59d63a9148a41ee90ab4a1a3f66e47e2cd286e181aeac020cd4f3996aee47729180084cdd6b4b12f752d5c5af686ac265a55b0d368dea13f6a53f662a42ad21c9ab8b72ea5adb314272a6261f3a2a5184ce56603d357528ba86f6cf6c2bab2a75eeb7afcc8bd9c9cfcf8129268cb5aada946e2461518e8fa49850e9660dd39c300ed85755552bb5bd98984dff00053b263e1e545094fe2bc77a81fe6f4095934f58e1df2ce13db0aea8aad7e0ccbe9e227663986372da7f19ebc81b7099493464a05d37d4709ed85554d5cbf9857e3ba3d1837867eb409596b4916de76f213fe6e4224e4d3421374df51c27b61f879634ce3c3a31de27be3b1099597ddbae9ca5ad57b0a94613292a33dc72fad584f6c2a9c7adaae32df7ebc105c552f4cccaad017ce0119169532e5b98773f00ce1db0adf7d590db60a96a37808330772ca3732ede04e1d1302b39d4fcd3c3a349f4683b27b62fec928ae8dbb734a17d5dee96bc7f759b4fcbb07a249eedc1b035fb622a6cfccbdb89719f7d5a50894413baddbeef7a9be61b95964e436d0c94273bb6153ae1c9420152946e00217336f9bde4b378117b4cc0e747ccbf42e60e0c09d2ed8935330addbdba98a2f22f0d38feed309e8658f440f74eff00a7b62767660d0db292a54617e717a49fe0910d48cbef1a1468e13a760a62627d86dc45a5b6b750140e78263ea72defdbdb8fa9cb7bf6f6e3ea72defdbdb8fa9cb7bf6f6e3ea72defdbdb8fa9cb7bf6f6e3ea72defdbdb8fa9cb7bf6f6e39f93790fb7732db50526919e23989c9d65872ef36e3a94aa839c4c7d4e5bdfb7b71f5396f7ededc7d4e5bdfb7b71f5296f7ededc74536d2f82e24ecc52da82861069b24fc7cd352f974e473ab4a29a2ed14c7d4e5bdfb7b71f5396f7ededc7d4e5bdfb7b71f5396f7ededc7d4e5bdfb7b70a4c84d353051465869c4ae8a70d19aa79e504210295ad468000c263ea72defdbdb8fa9cb7bf6f6e3ea72defdbdb8fa9cb7bf6f6e3ea72defdbdb8fa9cb7bf6f6e3ea72defdbdb84bf2eb0e36b14a1c41a524671198a75d5042100a96b55a000be63ea72defdbdb8fa9cb7bf6f6e3ea72defdbdb8fa9cb7bf6f6e3ea72defdbdb8084d652c4aad2407916c9d3b0285ce32149b441713688d38fd733ef53b71fae67dea76e3f5ccfbd4edc0798587106e2d26907158db82872682d63b96b77ad6a3a2967959e7246cc6ee4dc1a0a076a28779c633d48a479b4c65c93e8785fc936c688b328989a4958badb7bb579b1d14bbcbd1c94ecc6ea4974672c450ea5d673d49a78a4c7c8cca1d3de83bac46df65a6c5ba9593728766392367142eb97c6e9ddc4be722f9d33635a75bc91d853d73baf0bea5ad9b2ca6d65045c29344032f3eb7123d13e79d41f2b623e11e4fc34fa45259a772b02fa0ec5848cafaa60afde2e8e4d93f2f79f975634281cdad3ff009dde2f60aaba8466568e6164b63da6e366c8389ba9b634a1a984db0ea12b078429cd9ceb9de39b094f69f98ab0f899b376d36d8df2ce7410f2f9b62f4ba2d274f0d88798596d69b8b49a0884c95766eda44ddcf2f6ec153738bc86d38c9c0214d344cb4ade6926da87846c42d072542e285a22132d5c12fb3739ff00488d1c3af097d8505b6b14a562e11d8d46fab25b4f09c5040d5360ece3e6843292b569404abf126d794e2bbd4dfc42e4225d9192db602509c0058d69d6f247614f5ceebc2fa96b67b037352ab2dbad10b6dc1741112d5a0b4b58c97903b97136959b329bcc21a6fcdcae55955cabce294d1f1d046be6d69ffceef17b0555d423314d7fb879a462397c9b3aadefe4a50745bdc6c66ce75cef1cd84a7b4fcc566ade74e4a1b054b51bc042e6dcb48b8c37dea3fcddec06a99a552ecb8a5951ee9bc1a5994985149f956494cba795a7d8055330af97983d153dc39fc75fb1d55223fa899a543c165b53bae9160cd50d9b6f74af701370699d6872b7746edfdc33d5a6ee33ad655af5bc91176caec5d84f5cf6bc2fa96b66c264d5ee368f86c9ca0e950a72e9b94038213fdcd9a10e5a6df41ca6c9c14edd8565561b892dbe81c2dcab8a336b47ff009ee246820e40d6b2929bf52f34b3e2ac1cdad3ff0099de2c5d8bb65557508ccab64fbf716e7909a39566967fdbbceb78f77cacd9ceb9de39b094f69f98acd2ca0d066961bf177c75ac1126e1296e82b748bb923043f3157b65979841701ca52b2b26d90728d84a4d03400b095f055b93af993ae8341c8c80787b9d9b0979149a39e584d3805f38a0b486d48728b4fe5a8aa9c345c85b0e6f9b5142b45268cd0e20d0a49a5273c431369b8f212bf2853d898971bdabe49c755c3985a5235139b49b405d83cd7f52e6435e0b62fe2b70dcb32325b69212819c2c8b8ecab4b5ab7ca536924ea47e8d9f749da82e312edb6ae79add210906fe0b0ab1b75216953c9ca4a8520c7e8d9f749da8fd1b3ee93b51cdcbb696d3772500246a42fa96b66c2b5f61cb89eca1496b21c46714ac6c583edfac9656a2d2730acde14c3b30ab65d52964f08d39b32f22e4aa038bd02b4a395612739779f65b729e1241cc287005255694936c18fd1b3ee91b51fa367dd276a256af95976db7669ccb5292848390d0cecf22c10c32329c7084213854a340895ab9bdecb3686c1c39228cc9194f54c15fbc5ffa6c1e917b7ec28a15a2336b392ef16dba3c7053c9cd9ceb9de39b094f69f98acd906b097158b246cd83eac0c918d4989841bedac79b614e0842b08060a7d63881b3b161260e159c483993c9179f778c6c24cf7a928f2544762fdc75cdd4a9f44a347c1974d16b1e6ba10687267a1478dbed487eb7706f7a1635d47b0abaf6b66c2aaebd360bea5ad9b0ad7d872e2b3eac7185813818729c69ccac6645d6e5de234720d87ee77fd5b0d5074165ce4d855cabe84a9a3ecd453b162f34934b72494cba7477cad53469584bad4296e4c1995e8a6d27ce39b328f50869bf372f959b252beb9e691e52c08ad11fcdcaf2d215b39b312c6e3f2e71a1436ce6ce75cef1cd84a7b4fcc566c8a7025c38c8b099eab9421ee02b5ac6557df34d9f3444bf5e388ab093f69f96accac3af738d60c0c0a738e7b0ce5647fa7696b4f0a8b431c4bbabdfcd29c7d670d2aa06a0cd6aad6775f0e00c917dc73f85112f229f469dd9c2a36d471f61575ed6cd8555d7a6c17d4b5b3615afb0e5c4cb6a342a654db4d8c272c28ea0b09e9abcd3011a6e2e9e4e64f5175ce6dbf2962c2be5516dfe7d29f119b5ab60f4b1f4130a0341490ad7b07e79ede4ba14e2f4122987669eb6e3ca538b3e128d26c266b658dd4e399283fcb6ad7189cdad1eff0090e247887276336ac41b8970b9e424ab62268fac434bf328d8cdabcd34070ada3e3a0ece6ce75cef1cd84a7b4fcc566ca0fe59e3584cf55ca10f7015ad6327d4b7c5112dd772156127ed3f2d5993930cca294db8ead485529b609d18fd12bca46dc7e895e5236e3f44af291b708969d6f9a702d6724d17ce776166ab6bf127dd03270a1bdd71a8894904dc97690d7929a3316f38684a01528e7085d62f8a52da9532be113b81fe70762575ed6cd8555d7a6c17d4b5b360e8aaa64cbf3d4739921269c9b97467c73f594cae6562e17154d1a02f582a6a6d1cdbf3ea0e141ba1b028403afa7992f2feba6136b392951b065145b98e7d5e529404519b59c993752d3891a1940eb8b032893bb9e5a5af146ed5ad469d806db194a51a129c24c4a5588fe9db4a09c2abe74ce6296ab41229261d9855d754a59f18d39bcefa861c5e99a13b30cb9eb2591a8b5e6c8cddce65f6967402c66ce75cef1cd84a7b4fcc566ca1c2d1d45584cf55ca10f7015ad6327d4b5c5112dd7720d849fb4fcb5767abeaa4db66af29cb17a9474cbd819af252775334329f1b7da9066d437736acaf113693b7d895d7b5b3615575e9b05f52d6cd9e4d6d582a405e5060ba0e236b1422b2917056ab4db43eb505a5273929b40e8dbcdaae529bcf38479206cd8556cd147cbb648cf52693af1372f739b79d451a0b233799a7f50c388d3142f62c1aab9069448b76fac77747528b0940a14b72b4ccb9ecf7be7519b58cc8badcbba53a39268b0aca67bc6db40f1d449e2c5593146f9b7504f04a4ecd84a4e0f4ed36e7949073273ae778e6c253da7e62b364fab571ac267aae5087b80ad6b192ea5ae28896ebb906c24fda7e5aa25d9930821d4152b2c1370e888de33e4abef46f19f255f7a378cf92afbd1bc67c957de84cecd04870a9437028168f607e79f34372e8538bd048a62b4fdc733beb629f0df565ab1519b215331be36fc674e48d686a59ab48692109d0028ec4aebdad9b0aabaf4d82fa96b66c1e354b41de63279ca5694efa9a37da1096ab59554b95ef09b695681148cd4cf558f169c174772b18142f886ab297dc93b97daef1c1746d676636cde665d028cf5294736817e1861371b42103485115a37ff216af2ce56ce6d58f1b9ce86cfb4051b39aa75c342500a9473844dd64bbb32e29c19c09b4348584dd70b16e657cd347c06eeea9d4cd9fa2eb990df96b00ea5856333dfbc947908a7951574c778ead1e5a69e4d855cbbe84168fb3514ec664e75cef1cd84a7b4fcc566c9f56ae3584cf55ca10f7015ad6325d4b5c5112dd7720d849fb4fcb5449f56ae358b7c3735fb026ae41e92b05e4fb346e95b034e25dc50a1c9c26657a0ab49f340cd9b9d36db93cac9d14f46364f63575ed6cd8555d7a6c17d4b5b3615afb0e5c4cb8a14aa5d4d3a83837612750d84fd5f4ee1c692f519e8564f2b32b15778a4b63c44019b272feb5e691e52c0cc9c3eb434e79806c66b1362eb2e21c1e22a980a17f326f24d0e4d512cdfb4df79b4d85091493704495582eb0da4399eb36d471e6cbb03d34c269d04a546c39cf5cfbaac5423931cefa87da5e3a51cab0765cff004f30b0341494ab673273ae778e6c253da7e62b36506068f1ac267aae5087b80ad6b193ea5ae28896ebb906c24fda7e5aa259c90639d4a10a0a34a45ba73cc2a56711cdba9a329368ddb77ac1be1b9afd81154ca9a50d2d124dd1df53d22b1eb4372ec8a10d2421030048a0663d34ab8ca14b3e28a61dac1cdfcdb84d39c8b5af4f63575ed6cd8555d7a6c17d4b5b3615afb0e5c567c00712c58383be977079c93993f33eb1f7958d6735b9960e4b8d282db55da149b62ec7d40fbb6feec7c6d66ef3cf648465d013687040b0aba6afb92ed13a39229cc92a9d06d3292fba3c25ee53a80e3b092694296d83f10ee8356c79d4585572b9cf3847920582646ae9be658452528c841bb6cdd10b90ac2739d61ca3291908170d22e0b0ad24c9ba1a7523432927633273ae778e6c253da7e62b3650ff002cf1ac267aae5087b80ad6b193ea5be28896ebb90ab093f69f96acc99d06f882c1be1b9af673759ab7cd23a2185c55a48c70fd7131ba1269a728df79ea4538a9cd99c9df3d92d27c636f5225a4bd52120e8dfd5ec6aebdad9b0aabaf4d82fa96b66c2b5f61cb8acfabe50b0f60e6c43f324d01a6d6ba782298a4dfec3260dd64b8d1d259a353327eb006942dc296b808dc2750584ed72b16dd509768f828dd2b54ea5836c83f832e81a6a5295d87993fd430e234c10bd8cc9ceb9de39b094f69f98acd905614b83114d84cf55ca10f7015ad632cdf7ada0624c4bf5e388ab093f69f96acc99d06f882c1be1b9af672d5032ab4cfcc4cf08da40c56f4e25f2c50f4dfccbde3ef4793466d4f56de71f2f2f82c8a767b22baf6b66c2aaebd360bea5ad9b0ad7d872e2b3eaf942c0752eec4568edce81481a2e6e366c6ed8ceca536da7f2e8ce5a07dd89f9e49a161bc868f86e6e13aa6c64aad3593616db60bb695f88add2af6131f536f12b6a3ea6de256d4373928be719786536b17c18ac554d210a4b63c4401af6376c2ac74dc2ef37ef0146ce64e75cef1cd84b4acdcd25b7519794834df593823f5c8c4ada844b4b4da56eb9690814dbd48917b017138e83b160f270b07514989a73bd69c3e69b009c36a129c0008cbf56ea0e3a458491cf50c682332708bc5031205837c3735ec9f9f9a392d4ba14e2ce724424cd0a7e2dd2fcd782d26d918b7222817066e5de9395b5c27967611d915d7b5b3615575e9b05f52d6cd856bec397159f57ca1603a977621d6fd7bad363cacbe4d855cc11941730c8293708cb11fa46bdda76a2ab765d94340f3c956424269de1bd615849fad690e0f66aa39715755a9debeb5bab3d50000f3fb0555d42227e66ef38fbca1a19668b09675f976d6a714eab2948049dd917f422b04372ad051977b2486d3483906c25e6c7a0710e790aa60285f89ceb9de39b291e19e298714814ae588786826d2b50d8227929e700052e22e52930e48c8b0b4a9f190b5b945a49bb4514d84ab346e50ae75ce0a2dff000cc9a9440a56a452d8f093ba1ad60d4db3bf654169d1114a651ce7e8de529c8a746eea43934f1a5c75456b39e6dd837c3735ec99fdbac2b74fd0f4d701277234cdbd287ebe793bb9b3cd4bf54836f1ab5ac27e64fa471284f05b401c6a7b22baf6b66c2aaebd360bea5ad9b0ad7d872e2b3eaf942c0752eec455f29eb1e539e4268e5585588379ccaf21255b19957bfdebea4f948a793612e8bd30875af372f93154684cff00e3ec123306e352997e4a698a4dd376c2ac48bed65f964ab661e6bbf42938c58d5f377dc61a2ad1c914c4e75cef1cd948f0cf14c649b60dd107207cabd6e5d783c1d2ec066a69344d4cd148ef11793b79aa9a653f2b3472926f2566ea76ac9396929cb1948a6f8c39adf0dcd7b17a7e69592d3092e3873847f3eb176817f9b47fa522199196192d3084b6d8ce48a2c38454af28d3d91547af6a37a7146f4e28de9c5155520fe3a6c1740a7a16b6637a7146f4e28de9c515ad228fc0e5c567d5f2846f4e28de9c51bd38a05228e85dd8890954dbe6995afde2a8e4c6f4e28de9c51bd38a259453f848757e664ece632e0b65b9846aa54237a7146f4e28de9c51564cd0464cc360e82ce49d78aa2814da99ff00c71bd38a37a7146f4e28de9c51bd38a37a7146f4e280bbe6472078e3276637a7146f4e28de9c51bd38a2ad60da2897641d1c811443ed849a10e2d22d60546f4e28de9c51bd38a2482aeb5ce35e4acd1a91396bd33bc731722e45c8b917224691dd9e29cc54a4e239c6d7746c882ec80336c677e227445fd282858c950ba9368d873720c29dc2a1bd1a26e42672b021f9916d091bc6f4309b05ca4da038d2f7c930a7e4019a96cefc44e88bfa5609989a496a485b2a368b99c9db8939d9745018e80a522e20ef7145c8b90df0dcd7b16ff6d4aaaed0f4ed1e62367143dfb926136dca5893a7bd1bf563b5a47b4cf9c9743dc348314fc364f056b1b316da59f68ad88a5126851c2e52be353010da42522e016859e54e4aa16aefe8a158c5b8a434b19dce2a32d9944950b8a7295f1a9ec3315a4cdc686e11dfacef53a6612d29595333ee153ae77a2ea8e8010cc8caa725961210da73876c5fdae5154ca4812091716f5c51d2b834e155f4d2687e7450c53dcb1feabba1476c5f0728ba27a7414b545d6d1dd2f6b3e112eb1f28c50e4e2bc1bc9f1a02102848b400ed85eaca75592d32293849bc067985ce3892b7e69610cb29b740b884261b93b4a985f4936e0ee9c3b02e0ed86931f0324aff00af943b823d2b970af43040fdcf3e8b6691208382e1736076c4bfdb5562fa558f9e753dca4fa319e6fe7474e922425a854d2fbec0d8d1d684b6da42509142522d00076c3f0b2842ab1981d0a6ef369efcec422465695bcf92a75d55bc91dd2d461aab2445086f7ca3be5a8dd51cf3db0f3ee74932ed22565fbe56139c2fc65af2a6a76717685f2a378670d411cd9a1738fd066de187bd19c3b6133734729c55a97971be715b584c2a7a7097661e21286d22e0ee50811fdc6b148358bc2e5de6527b919f84f6c3f1536729d5d225e5c6f9c56d6130a9f9f565babdcb6da6e245e4a4426baae11f3ca1d0b27d003cad6ed86973a59b707cbca836ce79c02153d3eb2f3eeda4a45c02f25030422b9ae914ce9b6c306e319e7c2d6ed855212144c56246f6ea19cf5e7e74175d2b9b9c9957094a51bc0426b4ad8072b03bc45d4b1a18559f8bb602e3842529b6a51b400872acfdb2bf05dac3ff005fdec586132722daa6261d349d9528ecc7c43b44c560b1d24c5e4f828ced7fb30070e4e55a04dca7ed4f8bacdec81e8db16d6b381220cba7e5a43b99649df67acdfd0b9191269e6e5d07a69b5ef139d9e73a3e16af46e95f8cfabf11c39e763ecd2db890a4aad2926d8220bf52fcf4b77756bcadd8ea5d3c555ac044196656589b45a7645f1cdbc93c13b1f68526d0174c2a4ea0a27262e198f428d0efb5a153958bca98797ddab580bda1089ffdc0152d2b7512d71d7347bd1aba1089493692cb2d8a10da05007da015329e6a691f833ad6e5d469df80dd748feef56dc44e5c5819eabde3638089398e6df37655ddc39a5874becd2dcc39cf4d5e946adaf4ef0d382d3abf8694bd28d1b47867bad6ce8f85aad82e9eed771081854a84cdcdd1393c3d2a86e1b3e02766efda650b194955a524db061539fb79424dfbbf0e7f049cebe9d68157d6e853c84dc666add23c0745dd584b532bf807cf70fef29ce5dcc7440524d20dc23ec83fdc26073d7a59bdd3a74af69c2a5eacff00af973de1a5e50cf55ed2c701b6d2a75d70da48a54a513099bfdc4a32cd5d1288fc45708f73afa10993abd94b0ca2e21028fb58ca562c2661a3dcac53a63042a67f6e3bce26efc1bc775e2af6f1c19669d764d68df4aba371e42ad69880d57d299386625ed8d341db8a6ac9c43caf574d0e0f14dbfb0e9305be7fe2df1e825f778d5bd10a664cff006f973dcb56dc233d7b5446528e52946d936c92612fce8fedf2a7bb70748a19c8db8a2af67a53bf997374eab4ef697db5f0f5a4b266117b285b4e81ba214ffedd7f2d377e15f342bc55ede38e667d85cabc9dee50a34d276a021335f12d8f4733d279dbed5808ae25172c6fbad7488c568ebc7fd74eb6f1ef32a85f926dff008ea6b29c6d93eae9a57e48b70a6ea3942e9bcfbfb94f922d9d48227e6d5cd1fe9dbdc37885dd380840a546d2522e984bb3a3fb74b9ee9d1d21d046dd101c96679e981fd53dba5e95e1a5f6f1979e61130d1ba8712143560bb52bc64d7ea97d235f784154d4a171a1fd431d22352d8d3114c01293ee140f44ef4a9f3e9d4809ad2410f615b2a2d9c4aca8a1f75726ac0f20d18d194229909b6a63ab5a55adfe18b8f2c3691754a340d582972792f28770c52ef16d414d5157d381c9857251b7052ecea996cfa297e88631bad58ca55b26e98e66ac965ccaafe40b4344dc101daf6644ba7d433ba5e9a8da1ab1ff005b2a942efbeadd387c63da1954ec9a43a7d3b5d1af1a6ee9c15d493a162f3332283e5a76a099d9070207a540e7118d14e6650b445c3144ad64f2477aa5e58c4ba60098e66685fcb4649f308d68a276ac23c269da75140474dcf4bf0dba788550322b36934faca5be38100cb4eb2ed37321d49d631b934f61dda8268bb498f98ac65dbd1791b716e7c38703485af584112b2cfbf9f4250354d3a91448d5edb3e13ab539ad9307e779849ee584846addd58e7275f5beac2e2caf5f339aabe59c985606d255ad0153ea44823c23ce2fc94dad580e4da553ee8bef6f3c816b1d3018966d2d369dea100240d21da4133f20d38a375d09c95f949a0c1555b34eca9bc95d0ea360eac154a2999c4dec95642b12ed6ac1f8dabde6c0eeb20a938d3488a2c3a27148e0a88d68c9456330902e00fb946bc509ad663de18b559b9a79275c47d4d5eedafb91f535f90d7dd8dd568ee9509d61142eb498f7a46b464bd3f30b1814f2cecc52ea8ace151a75ec3264a5dc983fca4297ad00fc1fc3a4f74fa82352d9d480aad6b0a30b72e8e52f6a02be13e2563bb983ce79bbdd480d3080da05c4a450353b4fa2baf83fff004f35cb827e224da38599c4a3532e88a657f70a19ce3332eb1b11f2dfbaa44e72d6d8d670c1e6abcaadd17be7120eac6e67241de04f4bf2942374e4b9e0cdcb2b59c8b659d29960eb2e2eb7ef9afbd175af7ecfdf8a3298ff00faa5fefc7e3c9a73d53d2bff00b2285d6d56379ea9e6f62981f13fb96ae6f0e43c95eca63e6ff7432bc3cdbac235d4a8e96b26660ff3279038853013226ae2bbdd232e2b54931d15193e0dcfb0ff00ffda0008010103013f21fa0a81480bad3edc57ca46a4070d41ddd4326907f25f348ba4b2ceac7c537d102e4c9f34ccd08a59d68cde74524faa2f9ae3bbd71ddeb8eef5ec0e34691906a36850b868fc2d7b519c346724e24f2d6344f7a5d11a2aff00540f95053cf4fc3f674b1ec4bdf0a8321673dc702a48c58ca7dac829159dce4ba65f0a80b6c9acc37eee1e948f87b907ca51b2f0a0f8543cf2cf5be48cf8a1bd1af42afe3b9a9d3c109fcc288582e63ba50b207b01aa4222e107508ae21092ecd5edb0cd612c97a830d5be1eaa3ca6fe5450850af783e42b56c2c0f38b7d8f93ce993a29176a9925b93b0b2f54ae8649da4457aad71a24db26a7a150293a27c87c544a2ff46854025de11ec7caa0e7cde7ca4a380e6458fa2ad6f514345c41ef4cb771e78068265dc1fa235ed91ccdfc6860b5855e803cd4cc55c17bf37d6f8ab88f90b939aa29c77595c91dcb53c16e3e710a077cdc4f58b7d8289e0cd5b153b792ca83c5f84d421ebb11c5fc229ea67952af15acf79432873b0ead4d8bbd9748510665bfdccd66b862cf853fe80e19ff003a33a9edcc9e3a4d2383da5e39d1040b512e47377a041766f7a904bee200e84fb1cea2df98ed01cba8fd74021e5d001bd5ac930ca595eed1c6889656c87a2fdd591bc547700cea35ef0b6e1f98543b0dfccb845dd3590c4c803807fdca8c4b8e65471f15275866ea5680783e69762af8ee5313c245de93b4a9541da75938530d649893de6fe1f5a6176ec46eb1d097953a989ccef78bca80acf04e2ac1c5a1b7d0e772a64741e7598999013d44bbfd114932c29139352e8ba12715f10a8d04e8b8fe4359eeec81c0ec2cce141645587e09e5d63ead03667753ec972a90ee52d0e044f220e75be9b14e7c0e36acbb99375cbf0d1a69c94babbd78bf49c9fc2091c96077a6b79010533fc693ad13b590e08deb93d7ad13dcecc9f46cd73fa922733099015bed0cc93837f8f95377dcf2adc7e8a936a810c8e4fcf3e15a217b37d5f37afd36cb356f256e2fb507a8c70029a16b01ea03d538eea1124b7d3c401657bbc4d4d74db81dca2fe071bd7bae7897e067508c6f71eb1cd7e3f51b7e529ba3502017943d61d738d21c8ac24e83d8eefa6cb1130eb713fd1dd4a0164b3d923db50199162f8fb9c2f452aa0101fef1faa6e0cf5fa6709823d86d637e941cb8d5dd7de5513922ecf0f9376ed7ee1e3129f2afe5b9bb3ccf2da413743e776759699503a0f83bfdc2ae30ca5c8a9ecc8a0997c9337bdd5776f7296a0a1bfa82fc1bbee1718cba9d143cba6b410f2eb1fed5b8fc55eac5b3df5f7afdc2f110437315ed66fdce360db2a9275ceabb9bf94b576a55bdbbef5fb863656de6ea2f86f79343c2e24a099eb99eaf16a7a9bd1c67e0371f70f154ac2865c9bd7715940b6e93203701d8a34f2506ff00e235bfdc26d32110095a98f96ad7bbb8f6dd5a0a959fb93a196bf714e66110b799cb73fa5434acaecb7ce3e5e47ee216d9ba18661a1f306face4028cd973d6eb396ab43d4506e1ef3fb8431b0480255a26999ac077353378b14043c605aba17bcfdc56c607dc5f2ccf81c6a7a540b4b93c867ce34fb8b886013160e2b91c69909bb4b83f83d8a1160e56eae9c566e077bf905531207a2244891224489139a1375e412a494e81416e58613b448916d499ed4181ccadf82a4dbeb0878c4e1472b64ee4989271091224489332a900ca195898da86f8433e2a641e80912244891224cef883567209b1120000e951c8031091224489414c35a8800df5c0a2513b51089802850a951fc546618725f0a825405dabcc10973a4e5756914d060df369191355bcd0c1cdfd46b10e3737c81d71cbc089049b9251d62944d3504f9be29d90ea4bd90ae5e7d3e478a9c40a5880e310edeaa02ac66e1b6ce43aeffe543beb1bb87c647238e1253e0d2a0d2a0d2a0d2a0d2a0d2a0d2a0d2bddf4503d85a90695069506950694bdc28fe7a954724a70959b01a44d3a86a1caf857475f8acce26780f550e694c1a541a541a541a541a5492c641a86f0bb7ddf5d41a541a541a541a541a541a541a57b769b055f9a30560d2a0d2a0d2a0d2a0d2b20171cd5494b782159007ced257105415061f9ecd7c1c8f977533f6bf61f37cfa061cf514d72c99d0adce6584ee05ba3aeb42249b417efb745837ae959e1c10dc277e465cef85dba65aa3512b27611190e4b7da6d41a54eca378fa709b0f27f80b83a761209838bba91b649b3dfa381c741436cb4b0e03d6bfddf457b469e832fabcab48943c0d591711c2493826d80ec1ed7e618a506388b16786df77d7e87b769b037df41478c73128ff0051e7d2b87883db503957a524e8cb375639b7e2f435b44a59ea7e134d8a05202ed2a7d01a597c7c4cbd095c4292eda385b1c1c7d395424dbaede982df0a20d4cee4cd37f9b36e4cdd1f0c46912bf0dde84b338786ef5c377a430e7fa95ed1a602c5f8784f96d179bac2a9dc431b80e0407af22ed84989963da23173ae055c10f1422496766497daeb86ef5c377a13219c3edda6c031cd737e41c6d54e90c3e91c3d3d44e2f09eee479e00de7a7279942a1c26a80c025c374678387c0efeb76266cbd32cc14c02ddf27c126b2dbc451a89ed8ac890d7885e4db15ae2dc491ef56a839c9fcbd24ccce8582a7afb583c094d80a226e437264381975ae1b305183122c095038acb63201ec88a965981c0130a1019dc72dac996628dcd43762057b46981e5d08f9c3731f738125320c71fdd6cb0232e84d2c7c5d977f3b7db956dd46d6cd414dc4dff00bcd80f590403b91dae1929ce8379ccc493db3823ca75a01d56b32be050a7ab9ecce8ca2b450c1dc497eac6d671c83734f87a4e1e6375ec4c024f7d17c51590c754558db2cbbe63a566cce79cca515bbf105c106ea770f6159c0304ed32a5d03c1e9740d4a42ea83b567c1c7c8cbb5eb56b3cc3ab1f08efe8fb4eb81ec3a383da34c0f2e8613e031259fd87e763b4843d041e68208db39967cc80edc136fc30fe061b2318728e6f3cf605e0da996475607a6dcf8c83edda48048b8da10f9a1319913dac9cd0886af9e3d21c3d27bec7e3078fabdc7555ae5b5b52b1743aa5445a8bddc4b7bceac1c14fe4fcfa31d9201de3ca81578ca174cdd476c9c0dfa436288729203fd413e8fb4eb81ec3a383da34c0f2e82bea5df28b93b83f196a0787b192a2173d3be27036773045e1f928b6d55262ba7ce8e053e1bb8b7f14f1f1325799c1911f5d9f2ec76efe0779650f68014a0df6ff0022b21602b8e46f7da4eb232043c3d270f72abf75fac1e3eaf71d556b96d6cd396a6793c388589dafa3551cf028d1a29114993121727a2d04b21782be1adf74ad62978d9c140e032d671461987802c9e93da75c0f61d1c1ed1a60157efc33b7ab4a85ca81825b9687236db369b908988f06acb0ddb11139cadefcb2303e5a361b7ca80a087065b7e462d2b0192b1d873be7280b018c8c6baa00e6d41e64d6e0f98763e5208b004d644011c53f2da248b13c4f8dd270f1d26d931824dd28cf08f49c3d169cc7b35c1e3eaf71d556b96d6cff00cbead5a7c6b32179a1796dc891b92cde16b27674f7e697cf57a5ed3ae07b0e8e0f68d3195cf2456714dee524f003cf3b2270236ca4c87732c016241d683cd4038811a023688a8019aa97878322130e9078783f8936df2edbbe846f799d0401a6d37ccd77b364a20b36b0421e7b59862fba95c9251bff00b9e8b87bd9f460f1f57b8eaab5cb6b671cab569d1f264c19461162c58b12f0f12088c95f426e43f8e7f141acb345360e427276b25619bbe0e2ef44dc15e49e97b4eb81ec3a383da34c0b4e5a89ba489baa6254c58179691a4ed7c0a4599397f610d0959e9b2c7e9e72b7a1d903bd1443e236d8d2e40d56b7f131a1fe1509ed644b214c5a36ce4d18360256a64a0c6ff0d060ca2c8cea8e6c6d2b1c09f2f963016f0e97403bff00a3604f6720bd3d1387bd9f460f1f57b8eaab5cb6b67fe4956ac72b97b91839e5af5687b3328ba8ebb607cb12cc87e78397a7ed3ae07b0e8e0f68d303cba002ef33591754c1368809e41931aa786cccac865e25fcced8a2e27b0dfb342cc8e3f3f6d1d852e21f8d0d8004ebb26108d52e58722b0082c005d5b141803416f2b35dacba324d7e5b181e7ee5e5491d8098ef2607a7ce57a2e1e477041d57eb078fabdc7555ae5b5b38dd5ab3de2da22986556745256084334967d45656a87302f1123c2b184c9d10ec6cf99f98fc2b3f5d7166f97d3fb4eb81ec3a383da34c0f2e8133bbbe383f8ea7e36ccca98d774208e11b724ab41212448bec6fd4840dc100dfb5cc8a9099e82e1df658e7e5a5cce2600f8a59e939c1d704c76dcc59ef3816ba0986bb8ede94131bce4b38db9ae087c90823cfa270f45ab3edfeb078fabdc7555ae5b5b3b3378fff00845b02b065287ff6664f0a9fa6c67b7037b7f99b493709ac70f2a155e37be32facbd3f69d703d874707b46981e5d1e3f06a0f1f96b30e2740b2f152d7667afa2a827aa90771b337011baf87393ae0b97a237121c1030331c1e3441e13d1976c803515e1fa2e1e8bd921f382c6b286f6ceac72dae457f0070a04fbfc18bd97a68aa1969643bb53ca5d0ae30f972276064d676ef4c2b9bcf3f51ed3ae07b0e8e0f68d303cba3c7e1e4151ccb741e70f86ef42366701af210de04ed2a9671edfa693a4941046980ed38ff0055db59b315e6cf05b39c3501721e963cb021762a7dcc06fa06bdedf15c64354c990d6d0ec80a512026a277e82a5ff32b04ce3bdf6b8d6eebc2351636b0b760eb952b9fa82a101e0cfd9c04a6fd9ebf3a923f495d48a8598cb8bbab224184a2b3ba40e61408e3200b06dce3cc8707bc38fa9ed3ae07b0e8e0f68d303cba3c7e1e43dfbd29278c001d0c332044de25f62e9d90c90644c0b671cf00a6d95cd74c9235b9e64974f43dbb4ace7838757c0c10dd7dba2ca39282f38232022173750c83b72d0434be47e34764013afa0e1dc738d9c4f24f4c19e351755875186b25565a6e8292996ec045915770b39e6c756c9b406b1e1eae037b137da598783beb9e40f23c94d014512ca3d25746e9eece7c9fe95931311b99a9caf1c08efa4f23f77a9f69d703d874707b46981e5d1e3f0f21ef34b960fb2aaf58de76348bacbe026ab93c1e69ecdafa1dfa6139649f855cf3989bab837474b9ab48c72ceb9e516236a48952f330d7bc9f41c3b7030212c8d01bacde02eb75f233d71e6b066b62a03413dcb3e66fecddb73ea111bd1be7832dd884440b049d404dccbd05780ebe4e58e3a1530b042cfd3d7457085b0c46028f559e2fe7ea00096c9cdafe82bfa0afe8298845c474703f3e80e14fe82bfa0afe82a66b35c450a804b1affa0afe82bfa0a5c7d5143390c416469fe82bfa0afe829d602d2717c8ec8d12302abfa0afe82bfa0a88913c7f0d59b6d113bebfd057f415fd057f415fd057f415fd0501771b7cdaf1a7f595fd057f41498ae47150a30ef826f340cece4d5fec01642bfa0afe82bfa0a9319da7710ddc52d07caa38becd717d9ae2fb35c5f66b8becd30a1c2d98cfba2e3b92e26e6b325340e5683e5d852004c150788e09e866011cc6077ad529e16b2ee36dc6fc00cc63c246e26e4acf0112323a1797614e4a392649b56f092833a90efecce81beed804dbb909d6b8becd717d9a281230d87324a2dc669d73fed5a3d01bccbe623f93fe2834a834a834a834c10541a541a541a5406c834a834a834a82a0a834a834a834a836c1a541a541a541a540d41a541a541a541a541a541a541a5416a834a834a834a869b60d2a0d2a0d2a0d36415054150541505418088d1950e4a4d67ef84ced46a782bf9c53c1c5bf231590014601c031aa5fbfe2ff002a8a974c7e55a279d6428f09d0008320d90541873a3bf21c8076385e94a449c8f63a3c8e015c11d78704f1d7ee2be5547cb27f31a684d8467348f5f63ee20b4840b43c17775b73496f7eb116eea88e52eea200506800c803ee191f3f490b7a6455d64cb27a54f565df5d12890cc1d1f92ebf70a81480bb4b9fd33322ec16e1977e5636c7d9795d99779f716e834cb6b86e7a726fc8ea800652ba35ded38928eb28f804001603ee198b3d80d927f16ef01acc09ab12cdfb7e7aac5da8ecbb2de54ba7e8c8fb8723d9a7cc8e86f9d2ed2088406880580b6e0d0acbeb5948b4faf96ae7c0fb8339777220d8d07439c14dad4d23300cb04e45d73655a059c7e41bf5af75c8cb37ee05b9e8f821e07439c14e81a00e7f7b65e578d01432a320aef197d195e7ee192639926ef86ebbec524b00873596cc09c82ee79aad0ee365c83dcf767f70e5eb8cd98b41d97eb05c118cb39300760320e1432fe720eeedcd4dcb6f2fdbe0649440335577546c9330764f77851610ae37731b19e6a89e4020c96e2db537e4c8fa5e7092cc9641369776bf544e269320dccbf06f693c49de91b0eeec7173ab6a011e4b87b9d60addb630d06f2dc6e191f4d39cc8621711bd38a833871df99f268195599263eb8dd8d65f5070e6613200a16359566fc45fcbab75645525672dc0c86808a654116b7cfc8eea8350b82e01f5068e5df0199c01dcf4873a8aaec19b10672b8067754446e441e072ebbf4d80dc5a70a767f81a9462e6016eb2ae714173189b36de323e5dc35be331d40b7f1f245bea617c08201b88d3f202ff007ace4af29e02b26f11943be6238c934a971cb2c0b83fc8e1405b3ca913827d20e9509e5ae5f281c6b3e1389f603cb3f1546c845d0e0955a96e3091170f21c09e656e9fa627577abbd737ead7a5de50ea5d7133ade9540038364f023472992e2b3be6c1ea6e6a52164772264e8b95164c25ef48cf6fa1a81480bb53fd8f250e9373099e144153492535413a68ed12c87503756966f31f0e69ce3d6b3a32885d8727001f5abfe4df2779c271129db8d931c0087800a4c344ca726e393cd501a4ebf21428e1c91d6723d28627a4c40738cf6ffb908d9329fca77da87cd789eb93f59a29d3c1e9f9c69f7b40651b005e94bb8cc17344eba729f5cfd27447d7bc9d850c5273fe64c9c097c8f2ae2f9e47ab0839145c172ce95972842649b8320e8a820b461d22f5283117dd23ac5725594ea29ff9b32158c47172533b8494937487b9a04a703fcd5e4b6a26975d552147348cabc5add4325bcffc89523af363e5f8514184663bcd2bd08387d8778d96e3ab1792bf94a0251eda6b810235ca1d62a6681add0649d6800572187d8d43825cabd434746af17b96b50037df97e735382b02839e43ad1217ac7ca89e8617867d13d44cc8083ad1d3a0445e45392bbc823eed3c9659b7dfa1568a41d8d62cf0cbf28357151daf3766ed06c339a20eb4b2d6e653c17c8d5c652589f086140485814b8407d91ef68c39ef4dba6c81dfe754150b1dfa052fef31ef11ad3949925c6fb60d2bdbc8eaa1365481d32d6521d17f9aca3a77ced054a5afdaaa3c0675fc554e8cd0f942b87c23f66bc616074836f0b79f096a6019ef8f6925046b0d5e6273975451964f4f3e440fb3fc9986ff00cab3a2f48747c14a3266cd1c265e6965077420e723b566c22c16e823cecc4cfd9926b57b3c5c5a468f65eb1fcd04465b4c1df2d30485dc51ce1340a43bc03cd40a96b61b94cd5197fc93270ae789aba13d29031979de6bb2bcb64f87d0ff00ffda0008010203013f21fa15c9a4a9d2534abbe96df5c6a9c12d71680df46ad1bc283bca1f7d2acfd9d7a6b70291c2ae0e01b7509ba8d3d9726b8a5716b93b65d3a4f761b1341bd3af95593ec7bfb5a4abc3b77056f0d6f3416ea0ac7ab14aeea52877342ab91b062b8e53af95059f61716ae09b2c8536f950af9d590ffa2ec52ed9516d9d5c0a116a16aab1fd7ad19d5de82ae595718a08ff00bf74536f55e0ae275c2dfad5b736aef48a0d82da7d1782558b3ac9ab9dfd585ceb80948b06ca220fa4de4ad453915264fa9819555596b30c944e5f4d010d42ca8a898caf8fa8032d72ca572ae6bf51048687c2d3f5433f4de7148cb4f9aca0107dc1617566b8d1e6bbee1fdc5330509c7ee2875051b07dc3f94a45050183ee1e28a75050183ee18f05ea3451c47dc23252f14d1713ee15826b38a8d2bfdc52e5eb53a56fb8b9c53414020fb8562b34ae71f714642a465bbee2212d752d1c07d5f8f5c72b8e571ca11b62df94e8d474a55581c77869d1a8e94516c7fe3597eb0a7d4711ff003dde782de0325ae578462d5baefc0625ae0262432a08dbd7012d079d41047ac53ea3ff001be95de782ded58a593d09096de41e848959f5f22901eb8a7d13fe6719b6ef3c16f6c3cd832facdcc10aec8160802982921c1307d64f3e8411e83e8380c27aee3719b6ef3c16f6bb60bbcaaf6129e059d9779e0527d5eb9573d13e8380c27aee036b8cdb779e0b7b6f305fab30d8ab3cf05bd9739e0b3e91b67e15471e8be8380a701e91e898dc5779e0b7b6d60bf5661b356f9e0b7b18d8ae1d70eb874b0be8bb562866b9fa4fa0fa26c7d0303e994e2bbcf05bdb6b05fab30dbab782dffc5d72a39ebe93e83e9be8181f4ca715de782dedb582fd5986dd5bc16e9022b915c8ae457229277d136b828208f49f41f4dff80c6538aef3c16f6dac17eacc36eade0b756bd51a36e69d3f9e9be8380a7018df59c05380d9779e0b7b6d60bf5661b756f05ba6c829143eb901357bafa6fa0e0309eabe83e89b2ef3c16f6dac17eacc366adf3c16f65ff5036c4aa00f4df41c0613d331181f44d9779e0b7b6f305fab30daab3cf05bd97fd31c02788f8f51f41c0613d33fe5bbcf01c16b8f4a6068db07c3573094702cec59fd722790f9f51f41c06129c4e029f54c7779e2b75d3306694101821364e982066b2ad9d2967d21a301cd7d47d070184a71380a7fe4bbcf15bd9c83d0ce9bbb732dce28ff00a83e8380c25380d8e17fe32aef3c56f61886ad19986d251e76f80043564ccc0b9db56509cbd01a3eccb814e9ec45bbd0bd1b1dc9f76b47ff00151f713ffe5acffe8b3b23ff00178d93f4a9d91f588d93f469d91f5c8db3f409db1f604609a9ff00a67047d8b1866a6a7d79a9c3151f654547fcb1ff0082ff00ffda0008010303013f21fa15e9ed572839bfa9a4fd051eeaf7cabf755ab0763f7416ef62805aa2a2a295b852efda2b7329fa392d2ee1d9fd56e5bcf2fdd6a2e4d5fa399f675c37e3bd32c1cb37f55bddcdfe55a63a60b70752aec3e7e287fe1a4ffc7fb4e9787eebd81fbaf7051fc4fdd1fc5fed0fbdd9a46e79ab4778a036c1657e3e2aed7956e9727fb4dc31cfec7bd8fc77a6bf4bf6ad51d5cf62866d5c8f4cfe28979e797ee9960f35bd7d32f8abe8f37d5116abbbdeae08f33f515fa9bfdadf8f6e15677df3d8021ccadcf2e1fab5676be0febcd3b051e3f6167591c6fdbf959a24b8febfb41143491ceac37c0fdf8addae4ff6af73cffe8bbe56e2787c55a2f91efa55927de94341938d66ea5dcfdd69c6a667be7f5d05c8acf727cf6ddd6b59b5737df2a012e456479bc2ddff00557d4387ee914bff0074d6a43473ff00699945c4cfc7f681c87e7b5eb378e21faace23887e4fad77e06fd0a0f2e7ab7f7caa54c1c684c84f17f54ecc9f1dbe88296aba30e3fbbd64d9fc6ddff7474325f668d66627516ff3ead0a1d77159e398eee454f1838d6e9eafc1fbed52a65fa4b3307c76a372eb1f93df2a8121f1db77bcaa2c47d4f76e7775d3e79541080aff002d0fdfbcea784fd3668c3c28f980dfef9450f205b9d3ea10da5f77acc9cdd397eef52a5c8ded643d03f3afc7d4678c3c2ad98d1dfc9f933e0d3fd348cdb7dfd6b50da3f3ceb7ddab71fb7c54f997ee05dd74efff0014bb80762b727e6fe8fb86482cb77e4feaa41e5f3c0aced96e1ef7fdc314072fc9fd576426f7deb5db59b8fb86d0f27e5fc56f01b8d6a41e7f1f70ca8780d7fcf9aed08d5f77a417fe3ee1d24df8f0fdd5a707b02bb6a343ee13a7aba151eb512adcb1f9e6fdc26ae35ae0bb8fe8ad235f8bfa3ee2d637c35ebf1ceb5557e07edf8fb8af1666febad2c7c838ee3deea7379fb851417a33bd75c7fcab05991fbebf71691191cf5e9eed5ac1772ff7e3ee22179ae95f7d5699dc7eae312769afe235fc46bf88d3b021e38b3f2271cab7bf253b835668793fb8a6a10c79864eae5f34db877a743daac08fbe35770f8eff00f15f7cbf27f1dea41bacf9b71d3d668f50c4ff00cfe1be307c5f860ef05dc50f92752ffe6136049401ddfd3f58237cb40cbcdfd614121a2ac68dcfebe39546884f5c95e72acb1619717fd6955c7d668f50c4faa7a5e1be307c5f86d70176841bef757ddbd02dcb773ff768711ec74f40f981c4ff003e3d79dadd91cf7f8f9a8016ccf3ff000f9f5da3d17fe631bb7c37c60f8bf0db9f3727f18150dec5290948dd94f2c1cb7f2666c85f19ed9e0e081429a89a41fda301bf3da82435c3163d50acc7b92f3fee5486e39fa07a06068c0fae6331bb7c37c60f8bf0db98b97e702f63469437130985534f41c0e3a7f26c73ca7c60f2bee7ab0136f82de6b2439bf8f7cbd13d030385f49c2607698ddbe1be307c5f86d1de3f383de70ab3ce9c02078bf35ec38983e0fc36788f8c03b47c7a4ed057fc1eda7d73e377a27a06068c0ec3d07d1719b5dbe1be307c5f86df37f183de70ab3ce9c1e5be6bde71307c1f86cced206b5efcfeabdf9fd57bf3faa42b241e89b58037d116fbfaf7c7d23d03d176181c0e03d368c5e1be307c5f86df37f183de70ab3ce9c1e6be6bde71307c1f87fc503a7c16f35c17f36fe91e81e99e8380c0e368c5e1be307c5f86df2ff183de70ab3ce9c1e6be6bde71307c1f85294f2775713bbfcae2777f95c4eeff002b89ddfe56ef795fd1768fbd066d32abb9fa47a07a67fc0ed303462f0df183e2fc36f97f8c1ef38559e74e0f35f35ef38983e0fc2bcbfc61bdc8f40a76bd7bf3cdf83d33d030346076184c47a06068c0ecf0df183e2fc36f9bf8c1ef38559e74e0f35f35ef38983e0fc2862096a7bc982f723d3e30b1521163f3fe47a67a06070b8a319e81e8bb3c37c60f8bf0dbe7fe307bce15679d383cb7cd7bce260f83f0d9f2be705ee47a0ede5ccfb57155f4cf40c0e17d371380f45d9e1be307c5f86d5e0fce0f79c2ac73c2e5b8bf35ee38983e0fc367caf9c17b918ca76f00fb9ea0f40c0e17d37d23d3f0df1827ee31f0571de298c10aec0fce01ee68d4c3c4f9c0b19d296a28ea3804fbf79b22ebfcb82f723d3b3fe63f6fa87a06070b46230347aae3f0df18bc2fc950736fe1e70024a3478d0606599183b44737648f69cf9396015b49146eff00976ff688da32c17b9188a7072013dd7f11ea1e8181c2d188c0d1ff002786f8c5e17e4a1a1cdb6ffbebe807fa73afeb6849fdc6e7f7fee2036ddb6f723d391f7bbd43d030385a303b0c27fc6d33a6f8a92a4a92a4a9299d0fc9b00bc34247e077ddd68449300b307cf6a37f70fe8c01de12bfc207df1c1733f1e7faa556bf96ff007c2a4a92af723094fd99718e541ff053a8762af2fa65f14a5971de33e3b51a87628787b72f8fbb4a7ee23ff4729fb88ffe2b7ee37ee39fb8e7ee18ff00d16364fdc73f549d91f4a8d93f589d91f458a8d93f5c9d9151f408db3f604e08a8ff00a22a304fd8b3862a2a3d68a8a8a8c1353f654d4fa5151e8cd4d4ff00e09fffda000c0301000211031100001092492492492492492492492496172d61b789292d24924924924924924924924924924924924924924924924924924924924c0522020e6e61ad3a71249249249249249249249249249249249249249249249249249233eb10422492492487e5bdef79249249249249249249249249249249249249249249249242ab5c892492492492492492576ac649249249249249249249249249249249249249249249125dd32492492492492492492491a5e192492492492492492492492492492492492492492407fe249249249249249249249249248e06e4924924924924924924924924924924924924925b1592492492492492492492492492492486c9249249249249249249249249249249249248fd0a4924924924924924924924924924924901e64924924924924924924924924924924924f4e924924924924924924924924924924924924b7c924924924924924924924924924924921c8c92492492492492492492492492492492492490c92492492492492492492492492492492f1249249249249249249249249249249249249249249249249249249249249249249249249329249249249249249249249249249249249249249249249249249249249249249249249249849249249249249249249249249249249249249249249249249249249249249249249249244e4924924924924924924924924924924924924924924924924924924924924924924924913f249249249249249249249249249249249249249249249249249249249249249249249249d1924924924924924924924924924924924924924924924924924924924924924924924924f5c924924924924924924924924924924924924924924924924924924924924924924924923664924924924924924924924924924924924924924924924924924924924924924924924923f24924924924924924924924924924924924924924924924924924924924924924924924932b249249249249249249249249249249249249249249249249249249249249249249249248519249249249249249249249249249249249249249249249249249249249249249249249248a4924924924924924924924924924924924924924924924924924924924924924924924924b5c91ff00ff00ff008dff00e249249fff00e483ff00ff00f24fff00fe49524e492d69c924817eec924924924924f6493124924824924a92484926c8e92492e72493649400249edb692246edb5f7249249249227a4915b6db68b6db6d3e4b6db548cdb6dbe0b6db7c82db2416db6dae556db6d724924923924124911b6da4cb6dcadaa456db488e9b6dae7b6db6482db24b6df2dbe2b6936d46492492291232490336dcdcb6d52da64369b4981bf6db20b6db7482db2476d375b44b6b8adae492492492092492496dd24b6d4edb6736bb6a92436df21b4eb6c82db2436d45da1db6f8edaa492491c93492492496dd24b6d52db24b6e369924b6d726b53b7482db24f6d45da3eb6f80012492490c82c92492496dd24b6da6d221b6836e920b69f05b4db4882db24d6d45da1db6f9249249249149a492492496dd24b6db6b126b6f369925b6a939b72b4882db2496d45daadb6f04932492483490492492496dd24b6d46d2e5b6856e921b6b905b7bb6a82db2496d45daadb6f76da6492484496492492496dd24b6d52db26b48f69925b4b92db44b6982db2476d45da1db6feada6492494446492492496dd24b6d5eda45b6e369f35b54935b56b6a82db2476d45da3bb6f96da649247642e492492496dd24b6d5edb45b6db6d035b5c90db6db6982db2456df35a0cb6c96da64924524b2492492496dd24b6d5edb5db6cb6decda4ff0015b69b6e82db6436dd45a27b6d82da64924424f2492492496dd24b6d5edb65b6156d9edb6dacdb6336d82db6996dd2dae0b68f6da64927724b2492492496dd24b6d5edb7db7476d2adb6db2db78b6962db694edb6d3e496db45a6490612412492492496dd2436ddeda65b4cb6dcadb6da6da58b6d136db787fb6ef2450daeed2493692412492492412492412402480490412482492482492492406db699260b2924926a45a248f492492492492492492492492492492492492492492492492492492492492492492492492484c9249249249249249249249249249249249249249249249249249249249249249249249241849249249249249249249249249249249249249249249249249249249249249249249249255e492492492492492492492492492492492492492492492492492492492492492492492492152492492492492492492492492492492492492492492492492492492492492492492492491f92492492492492492492492492492492492492492492492492492492492492492492492480f92492492492492492492492492492492492492492492492492492492492492492492492467492492492492492492492492492492492492492492492492492492492492492492492492332492492492492492492492492492492492492492492492492492492492492492492492493932492492492492492492492492492492492492492492492492492492492492492492492488d92492492492492492492492492492492492492492492492492492492492492492492492416c9249249249249249249249249249249249249249249249249249249249249249249249263249249249249249249249249249249248249249249249249249249249249249249249249f2f2492492492492492492492492492492491f924924924924924924924924924924924920f409249249249249249249249249249249249276e49249249249249249249249249249249362249249249249249249249249249249249249248e8124924924924924924924924924924768124924924924924924924924924924924924924906cbc924924924924924924924924905b7c92492492492492492492492492492492492492492468aee49249249249249249249237add24924924924924924924924924924924924924924924927456124924924924924924d953bc9249249249249249249249249249249249249249249249241f237153112492483ab11b6c9249249249249249249249249249249249249249249249249249206eeb6d256d9634d25e024924924924924924924924924924924924924924924924924924924924651dad34ec47924924924924924924924924924ffda0008010103013f10fa09f032a20037ab5bb131cf5e5e95a49538ce32038e94c0c42458ce4b2795c8f3a21651bb8e095640df04f982d334e5b2f8e4c534cbbc5f91d6a4b5dfbfc96bfb0afec2bfb0a81caedf8fa9ca2e6b63c5254ace04331355af7aca06cb29b06e9aa709313940b9939758a3d0964cf29a3dc52bb9f8658ceb481ff2c894b048c96fb38a3e2505729caa8de43cd3e208bc9a96571812cd93799de80549c8f9e485f750b0472d80581974a0a02904ae296cb8d65f012c38e294eb4a20132832e5a80c9377d39c2f3478c8dc56509f90744ee7b6843c14fcc74a6f38232f23ca8941693f90f2287a15a49dd733a953dccce630d1de9602dccfa234209526a6c68b39a5407826759195e4f844011db715964812945d7c10a460305cf1774f0e3422abc39badc1aae0fd8ed73c463bfda0855e179995aa41fe3a665b25335bd09a9bd57735debc6967542a5c015a0987dc73586edb9524b589e2059e46a1e884d44679084daa2a8795129c336de0470a1a5a8c0adc4195000040583d4c8e1a401a811acd3c468f3f30a8e4d63333bce8188a93579c04be59c647155b4b0c19fb7f9d21bb14b88cf8a52c9649926f29521cb77aa81d1a6a1b47262f0b3f1e42ad36c264d6375a06b5b98e8f3a4acb839fd826042ac005d56c5292092d1fa04e4e79a50339c775127d3e14cc8550f5d90af3a3704a445b6507c40a0a3fd05e1171efa90c615539a424e0a830400657137495cf7ffd0dd088221c907a34339263498de77f4159a99329a38d4991a310a9c03d0a6eff00cfed1424e0e54ec62199066ce526e59df4c8604ca91bd14fae87cbc24725800037b4de7efa8f4563c0ad34002b334f320b2c754f8d254de1601d4f228989a5cf113281392f8517122a4ec03caf8d0988022ac040397fdc58c60e21a2395665119f9ece433715a1880ae5a6848398d4222434a49aae54c9ca1684b9af19192a3c88e082c113e636247f592812d11462701c90c046e725ca68fec2d9932546a2d22a21f39b8563c84054c3a8448af0cb6e4e12b94f61747d5751f44179d453971904a2e7d5117c1944de43ad173068e546af3782f850d50c008650d92192068dd5e485a12ca5244cb50b3eac95a1203f70d189c9806f4a626d9a6591780f8877ab255f2d0cc2a320dea06f6b3cc21e0cc032d1e8d2d462018225bade8aebf498869332aff39a3976f3f4200c24d171ab8d9b6844b45e32f1ac9e404a9e79570809b997d48ff8288012aae4014c47f00cf219ed6e7a3868395d751904ee2c19160a1c79834bcccb42ea5f2d0e5384e9da8bf365bbe9a53c6174ee40309b93337567f94cae07382517570a6c861d048ce65b47842d0120a244cc47e9f20c1dd9d4266f162d7609696a2a32acf9521d61444a404c1bc379097a44b479052666108a87997be197d44d304713085ccdcdca753425379e7842cebbb3e92659d1d6cdad924866933fa6a775c2c4b634f032d05d231e819cb24e43eedd2e74c5dc9efe45cdb8e62d65230449efcaef539ab35cdfaa2c188904738d27e9992b17344dc4cc1f99a8a502c4e6baa73b66ae40dc147e48c85d08391de642b7297dc079a27945191d7dc1e0a05b489447b6560d73564151592e18d9322c8614c832dd2fdc3bfa6855c9adc17e6359e707535b88c93132b40104d3058c784213c0c8641f70cb545c41e696e3b5b9e449923750ee322024f9dd80b46f2d4960204c9722c4007dc2e332bb4a2159d98cec661a66b3cb2ac36b2492cad00439664a8844864b37758800fb84958604c94c92f236a6605310950b92a581927340242a47a20b0f01476b1007dc300af2492096823442de0438340ce62c60603380cf21685010dda24749ce8b2528160fb813ee1f2f21e0159a65ef508994e1a39490514602b31cc4361877e0cb7fdc2924e5607928c958e48c97419465996cc84cde6ee80dc7dc4b7135c2de24ca26d0b4a3710e7482ce2542565394b563413218cd7356e9cd7373fb84d7c464e79c800569560080a8401ce5457d0051ce1e42c26213980e70b564fb8b27a72a19874df2b9272ae5b0e6080045ba0e6c2efb8a481008c8ddde106f414c26ee4d846b53c2744c19f83ca4bc4706463ee7480521184dfe8b468d1a3468d1a0978337246780b93951974e1a49200c30c67b5a34c9d1508d2e6022f34eac81794d41ef58a7252622d8a934f60e4b49ae268d1a3468f938f6a08f0944de1da69ddb152480095583d068d1a3468d1a66cbe33b2851b91d8eace0a273002aac050e49868d1a346854cb0d039250005dc0ed736b048111111b601c3875fb56fca64a808c37c2f0809460037ad488b43f8ba0527280a36a8a004dcd976a784a72853901e69686ac8b3ca55788a682611225b79f006258cda42abbc41085eecf48d711d70a45488ceb70dc8fcd0b38b10391777d68aa188437ab77c3d52b302a6819b875bb1eea72ceecc9e2aca0a19ce08e77c4f17761b150b3757c376ae1bb570ddab86ed5c376ae1bb570ddab86ed440022b50a8359c376ae1bb570dda83cc1daae0b9834bea241c59488f2a2fd466712a41bbde2d53db37b29240617c97a4e012190fcc8585b98cdd2b86ed5c376ae1bb570ddab86ed5118944c4360decde53b4c9b5a4664ed5c376ae1bb570ddab86ed5c376ae1bb50803dab62a10b2187c5cd386ed5c376ae1bb570ddab86ed5b910708461d64abff4592a3826d58052f00ae015c028041ae02ca94c5252662105d3217dd2a0198f1bb22350e59a000419605e6d2d8e2c1562fe312c82802e5101bb7a00491cc4cc4768ae3856847cf761f14a64ab16698ac8d236a000808c0123c643989089a8d30228db8026cf7bc4cd464f059d901927a685c8e94234c239e6304ac949755c426437ad14349a03be6803a6f2ac450f426e4187c17fc58d78ce3a1cde6b5ee39264e557f9f480195459ce7b602314f1914eb222e58a696345c66971cf05d2c63f61d5b000917273940f079e24921df46c6de32a6f9cc717ccda55b8250c5ed00b4ad317e4eb529bf37ad02315f2698f8cd491265ba827cc3b0e80151800cd5a12602a876137c524ee754e35d6fdb2d4db3e6e208997a4a9c3e267829049d50df832b121598909a23fd28238748cf297dc137e22a120914aff0098a560d682381409580bad7f315fcc523305e19c2bc849f53507387294e4b94f18a5434c114259802820b82746b47313834dab14036b3f14b14a92bc6089574423c281348489bc76216a0255a48cf815fcc52f0d682387d8756c211a2e0ab94bc66c22f0bb995e2708c717ccda5b2295442de2c0f0a1bf03b373c1c24c8833c4c896f40ca02ec9339a87221ba4a1924db25e70b09f3f5867986c4dc51488ea26f2da0020ddb51394e09d24374a0df152165208992359e6c269143a00458233a9b537645c1c6e201a25a344c44f4f482d28a8419a72679be1d1da37d06a00955770543b5192ef7169e5ad04701b634b8e45f16415943812f2608cdd8a83973060022897cf045a6b83141d465bcdaa95190b05c9e0a477b185e7b0695282374144216d91637298102b848927a1b12ab96f7865f15c69a3883abb50bf9ca39910e3336cf2af0c4d02ac9f2148ac6f9d832e1142844444b8ed40aa5d1ace210bb81b8169c08eae6c00fc9149ceac8987892b8bb1424a97bc94e61edb5609a45056440c846d63d61702979b9dc8c717ccda6295e7ab11805befa62aa3a49f706be694a6a1f1b669bb39d98af3825859f3502487702dea1c016482731fc9b064810e1260917f0d025d00f49a7167f31292721a4e2379db1a1661c830233222bb9145930446510126e234d4ff00ca1acbcf60d2ac4a0489d520ef8276722b4733d46c79c5ab0c823ae48a88d006d86a25e335563ae6733033b91b994cf1c5675c3bd7428cd89b827218209b3b065dcda03f3ed59a234e719c0e12dda42971224ee119b85441846e66265a30e9b6355266c183599d31c5f33694dc111c9e2b805e1be368943bcacc1d2b8b9f34c62918dc87cc0c1e4e223f31a7a1cfa3cee85b407f39dee1ce8a46efecc5bb2b9ebb488164ca2e42ee49c56a64d6739dd4272ff9435979ec1a55e7dd59d0071372c10d65429a09b01a8058941e6bbe349c12b1144dfb1e0e708a521d436ce2dba80b3b9eb835556e460714815c5a6bc63b983210076f854d201d61b5256424e6730e899786d99009881384e53ad213d7dddf89b55c84241716e178e2f99b4a3bb0872588e01786f8dbe334c96f7a90d4b762fce0f27612c41942dc14919ccc0a14283b16714f673038fa3bc366aa87cfbaa833470224de6d596c300c7d9d779052b70319049f53703fe686b2f241836a1bfa4d045f3a253c9d0ca0cc4b11b540a405d69de9d19e959812d980208ec53f3548f53811bcf064c863953ae22d424678d7cb2dbbd72c6f1b1d07a60cbaf6401f9a581027c6cc8238ba805069022806b97bd538bb059dd3824bc00a2437ae42d3a3b4ac906890163a4f6148ab64c46bbc73da63aa3b03a2e19e142249bf145f3369cd09e40959ebf1c4e01786f8dbe334a5e8bc5607c9f5c9ae1908982e9938e6d2f3e374fdc3f5a3816c4406538285c3fe986b2f06f3065c672e0750e35036899d8408012436476b59e47bd4e79436a80aeea52db83865ca48a9c1911085137206d424145804e0401001ef227765cbe780a54806c1fe55a4ed028f05a041e6ca236c00e9b53f65bb2400f1a6241b848e8b7936f2a9cdaeea50c0e92ae3c77b145f33d1201c02f0df1b7c67642f1581f268a61a3145328c4384a142852cf857874acc5f3f435c46290cf18c94a0cc116a4de08ddb5738c0b9a2ba719e54e0355d17520ff9835979387a747c87bd439513440646fb9c89122490db30ba228b3912b4732ea0412ab589c92efc86064026362a2ab1222f8e6bb76a0dcb3e003ab4e22b40861d272a1e7c11bae77ced95c4ca8cc4796638ed2828921739770134c4c9ee52bdb5e0606560e8666afbc3ce3b6f81ac6863cd0c11d62deb98b3cd9d2b33ef0c856f73809a6779f0972ea83d7145f33d1201c02f0df1b7c67642f1581f268fb568c3ee7afd02c92ee0a991ba5cde2aced2e3762cdd18cd56d9a668644c7c24715ff3835979ec1a55669c09960b8bdcf03c91d32753408a6e1a1b14d4cee80083c4a8dcbb57c8863e96c8a5c900dc802bd545e7b5e9051701a712babb6439092db227b3a3121ac905caad91b5ba383e56800bab951240260085fdf6d97a8a4dc6134cee6181d064ce2e3f22a8c6ec6a814ee1e9824de596d081a2de738a2f99b4b0c24cdea67e189c02f0df1b7c668c1e945e2b03e4d11676792e025934a43874509e68241c9c1ee7afd0452d399462dd306851fdb7f8427203639b1c88a41392b3bb0acea8ebff00386b2f3d834ada486e63fc60cce8cb35a25b36b23e4c995363911c36d8d70ba6089006112a7a90851caba64c82159c4ed1259244d44824c663349ba147648329312608d55cb01a747d21f34dcae698082f058e649038c47ae005b1445d26f29736833318da11782721820909e6ec05cb33998a2f99b4aee53face23805e1be36eeda3440464cb4a8e6e81df01e4e22cfdcf5e34d96622287178e0493bab37c6592825602de96da89230978a08d4d48124b1009ea05d7fe70d65e7b069869215a5ec9f8a390d19237a3850ee8b9cf339fa2c5dd4d80e3807a5025c82ed65e7deca3382079d60285a2d0825757b8e08981cdbbe3d6f5f441e43cb02d1d63b9c517ccda7fa6f0c161bc263a50095867a51e3be36b91d05a46325a3d95a993b2467148f78c1e6ec2088cc03cf05ee7af19864c395934392ec3ab53bcf2411a5420898ee6d0993223c968f06475ff00a035979ec1a61a4f6ed6aab5146807c901a32cb6db36bf98ab3d0bc338094238c86f9281c66a04d956181c8f214046c20e9b550509e1444e44b9ee7f08386ddfbc4767e1d22101e2567a81523c2e180bc1ad14284408b604c076186da0838e44718c515715c9d9f758ccdc9d98567eccc298205c7369cf967b43e7302540104ef618744d03edd7ee2d594b81b4035122f2c11de84e0540c89032a79b1518b047b9c1b8ff00398df3b1991138d5de4c1ee7af146401f39460df040dea14d802021d31085b6b41b82034008002c06d90b354d9bb98dff4035979ec1a61a4f6ed6b2392226350378a180354389cdd9008379b1c0ac6b77473c8199ab03da1ddc33078e48eb44021630498379dd0f43d8755424d764b9794bc44c11b6cd6338ae591c0291839ecc7ca2428b35126f07bed47db280c99c7769a897211c8499997a117834cbc692ec3052e8f2986014600196e8b34e29d65d0a6980b9266f96057d11923b943e66c2ec292e513923ad0c83aed0a9995ac640458204e6340993b18c34a52e78a0345a109f03380580dc60f73d788612791cdcebbade077506044192c157250f04df80c5994487ae81039ff00d01acbcf60d30d27b76b533264339c98268bdc602933bba783e362fe2122f0b04cb091dca67d484ebe897863873a12694b52f673b40af1570651d0ad0c3baa6452046ecc73e7440840001b7749224f3a62adc58223d0a7a117805b589102111c912b35ad790ccd69e09dcdd931000140012ab900176a309efdf4b46bce8d5da85cbce8a3b2259b59917e20dea0d861891409965b7dcf5e1206fce6a6437a880cd6028e31b69b101ba679d0dbb4594a5cd0a477a84aef73c1082aa410ae7dc88fa8a9ed22bd3af767e2bdd9f8af767e284289c23aa602515f44e815eecfc57bb3f15eecfc5662e4134b2d54ff00921025a3dd9f8af767e2bdd9f8a2515e40beb280da9b3920c70115eecfc57bb3f15eecfc5386277008293b13388a05615c8e657bb3f15eecfc57bb3f159ba616654e5209628b98251a1cbaf767e2bdd9f8af767e2bdd9f8af767e2bdd9f8af767e289c83206c7c99e8f1af7a7e2bdd9f8af767e28dac0abb83a572b78d8f7c9a236450e090d3ef221042f76857bb3f15eecfc57bb3f14b9a39ca848ae412904461451d9af6f7e2bdbdf8af6f7e2bdbdf8af6f7e284cd7141b023351931d8736cc332a7b8469ce391653739d4fde04457002268e013eec05f779547bc8050da0896e20d46066d95ee70c810866811cca972b166fd8e406eb9d0104a55648992236762812e45075c894253632116437ac604c46201058495f6f7e2bdbdf8a7a4ada437e13b3ad8c3659bd01b9c1baab2b1d281f31a64b9a1840041ea20e4935c376ae1bb570dda83cc1db0299a0f4ae1bb570ddab86ed45811ca904873ae1bb570ddab86ed406601d2946507a570ddab86ed5c376a01900e9b107249ae1bb570ddab86ed5c376a6e01e75c376ae1bb570ddab86ed5c376ae1bb570ddab23265a570ddab86ed5c376ae0bb6de1bb570ddab86ed5c376a00c82395700ed5c23b5708ed5c23b5708ed5c23b5019818329ec813b8a0b6e696cabb8ee20678a761566303866bcd675335248c8c4a718a1e800d15800072c628163a1339bad016fa547d7ce53898007b318219de1408c0401900520e4e75c23b5708ed401919604c07dde97f0e684a324ac86a63a1629679c94cfb07751b727b34399bd44a73597ee212ccf4009c830194d64285649331080b24889c48defdc5c545bc4d1980cdaa12559514141651168ee6213ce83e56c0f806400401f70e5e7b71233724987ab4b58ce4960319404c12ae6a8aa2666c002c0c42c6464fb841d002a30019aab4460fe50a531920bc76e651e02cd6065a39c99ee51cfb872d2bbe94886489d46f3a4c31e23697cf6673b24934cac478f800002c7dc398e84084b793244065d9a13d6c7389ca50324b2612159f9c45720c2e0ee088003ee04426e49ce11e6b47880c8a6d82ae55962080126e8a04218528cad024c240ccc27ee108b009479173302841d526462d91c4e1a07286444e9bcc83c5148f026fa0fdc2e470a0c9c84ce7c90829748ea4065f13e405c8cd52caa81fb3e1147993a3510b9f70bb5e0323790575d9362b6529deca866a484a515282db80c6323cc51e569bc7dc0ccb04424665e79a4595da149686811908e4064e0a00152156780e252523a7a2fb818315aa2c98000956d4b0338ea2998ef69733466d72250927a1b26dddea4aa8d5eb77be774a6b443e990562198a093c88c059dc9faa59a1a2959b2e79b95c033a3b1967c9d89ad0dd641542223765ac30ca91b45b4d1b9041a56800b8c43744aafd30cd3db3603a04b895264b31cfd4c446ed382288ee95c3f3d4eb20fa805f259004aab90051cb34a6d2a811d1835c3458164a02726055c886e2a2de5ab7535bcb2b5c887a3002f38de1735bae6e7f5011de9223b2d533e339501067bb35c83139c2ac92844d9664945316a1d63e9b99dc1f21334d753285284c79a322af60998240e74dd0ef51c848e050ce2cc655907235bc49302d9bc0afd4c15fa887001113246a7734df3a64090b402c5eace06620e167701b950a8f6d117ae6624db314327a087acc813e9010065d982e6f23193d62492ccd49324331b805123a6bd2b0d73ba56b8b70329121194e40de803170026f3f165299abf569f74c3ca10c99672706e6b2d6242b66e45bb24354d409640064c0552c10a0fcfc81577c1ad795a462a16337c7e798fd0ce80151800baad379dc484e460104cc8e9999e560223ab03c5a7bd858766a4a0f36a1e2ad4f1132b741de1434135cc9211404f8dfd69d1a66c4442ff00164a1399402e18a697122a0d1fe265d031b30e34b9b2e3cc6821f0b4d2a2cc90758cd20e77054f2368f67fd13feebdb90184ff002ea8e67915bb9c0705d316ab9b12de6206ade349d34ab280ca96c050af82d4ee79293c85e1ac83de702822ea38cf45d7ebd9fba174da00826e4cca6e77e4e1ce481e319ba8bcdbae4892c7462f551239b23746f12cd65f460f7394a2cb37c28833a194d5e0e89d64ec2549676ca32dea0119028d8b19a8cf2ccff988bd226d754039b5240a1b1230cb26e6807a84388c64ac9cf3b7f5280998e51198835293cd5572d75255e7502f52451e08b8928a8a895c24c04c6fea6a1e144badc9a2e6ae87d84be4d2aaa212ec8f0b03c295ce12809a0b1cf9953c2d5346de42f5b8502c662f4cad926a8de0846877dc28a0208dc8820cb7504b364ecb68ce56ee9ab290dc2dc6526af6d4fc34258e59d80729e1464ea72143dc854dc80795f889ab88d10a0e8c3e888f8813a8a88284cf851146eccaf028e4302a8a9ba417915326cb45e48819de47e2943cd85111917339e6bca9d58090e0c6e5daf9aa1c3b21af2635f756414027224fdd6078a0acdd946f345dc38534d488a038b381d085d0f937003a1f63df26b3a6380699cf8a533d1ed91720c8def56ee1143e249e12a8d1f531c0958e32699acf51920e88e7b73e612dd8a3d0e6e14cea053ea81508b21b1caa3999742f16be684130b4f779d563eba7caaf8d1f00d2e01749745653e7b21c85cd15b98486a16050457f431f8968054016e86c50bb14216633812c6708272969d010c941cc953783cd151af82849948206b9d128812fa044bbc73caa576a0dba083a1f67ce90339bf066cd0f171a440ba136acc8f9f3653916434840a5e2ba4861649dc4cb3a2b3fd2853eb08d72a9d60a741580ad3252a29f250f4d3e28c0673da853fcaca3c2d9863928d0fa9c44b90676a022016666e6f3909c6984ca150ea8dc99538e1f205c4467bd1a81cca06651ba5b85678e6cc0259c66659d7b0bdbadfa1fffda0008010203013f10fa15893ad5aa5e47ee28ff006b4db015a23a15707de97baeed29bb53535341594a0acfbb562740dc7a147b0f73f74dba72cff55a63995651e4fd9d618f9ed46bcf8ab64727fb5721eb82c89e8d589d2bfd143e875ff28d5f2fd57b86b84f34ebf97ea9e1f7ff00290dc77281bfe2ae8fb34897c17e7e7e6ad11f15bc1edc280963cbec7b647cf6a3b751fd55c48d0cb602b055b9f5cbe69760f3faa15cbe2adc7ae75680e9eaa1b957f3daadc2726b787a956487df1ab926c45230d5e1871fdd65c55dca1a509c3ec2cbccdc3f75908c387ee9669c866b306793efad6f9737f940401cbfe8b40d5f8f97cd5c2783efad5ea299948f0ac9c43b3faaca943a393f5d5025ac9b3bc77fd55e79685a916025accb238dfb567092e3faa010107fdc9357083c32a3e7270697ce3deb5974c347f75904f01fad655ec6ad339b2d3754715699cdc703f745411f444121acc025c3f56acdb2385fb5352cc373ee4acb46343ef3fab4f9f4ded64c723f6d40896b78ba1f97f5dea28c1f493a09a433e93fba816a79efbfde753064fa92c56fc1d7774d7e39d4e895adc03cff00951831f4d82125267469bbdf39a683e36f75fa84858294832d1af3a8f1ebb8acdefabf5a7d46044957e4ea6ee6fc3dca31f4d122fa3f752065f8e550991a37bfaf9a00101f701cf3be1fed06feaa89cef03fdfb86195cf7fe07eea22cbeef59633de7deefb86695e6fe0fdd6ee9bdd2bd8c7ee1bedcdf83f35b8a6f74a82b97dc3126e274ff7e2bbf474a0b6fee13df9f1c7f557d0bee5aee61d7ee140fa1ab523ba54637aefbddf709a2c82934058f7ad64ce6f07edfb8a66e0f2d3a7cd6902dc5ff3e7ee2cc4badfbe94647578500080fb8404b6299772c72ff6ae375ff5d3ee28cbcdf97fb5a5d673ff003ee25368aeacf7d8a2568c135353535353535353b26a6a6a6a7d19a9a9a9a9c33535353535353826a6a6a6a6a7020c27b95fde2bfbc57f78a325498b2664f0ceb724f6a37afbd5d24e9faa2649c792e6686742b27b51bd7de99713a7eaac73ff001583cdfc1f9ed51a777239616fe8d9576396867d51b7a05b636f4bcd7ce0f99f2e0ec90d699cd8d07bcf0a2950d329ee71fde07eb05270723f78451929fba6bbcfdfcd182a47d763682a18dd67c0ff000a321630b7f46cabbd11db7622fb5b7a05b6598cb6df35f383e47cbb402b6290ab6e343d07df45b97f9b5f26cb7efafa0bc98e0ffbf3e9b821077e6f2dde7e2a55ddc8e5febf189bfa3655d802692319bfa2dbd02de8acdbe6be707c8f976b446f47e70113b5da2a18426eeec1cecf0e5b26fc23be5817596970047597f94c837368a325eb8900fa5bf6ac5652de8397f33a121631c55980bd4546cbb09b7fc28a8ff8879af9c1f23e5db9479fe301cef6cca121c1c134a41a823aa6033d5f876083e2f9c1ec3afa46d968be4fdf8ace5e47e7d1b3017c176136c176c7016c05b0dd82edb7606f89e6be707c8f976bc9e0fe30781f9abbca8c0a5b81f15ef38383e5fc3b3cd7ce05dc7e7d16acda863fa7d943a29e77fa36602f82ec2b311b602dff0000df697abb697dbe6be707c8f976f81f9c1e07e6aef2a3078a7c57b0e0e0f97f0ec1164574ae37c7eeb8df1fbae37c7ee838c32fa800ad8a75dc7f1ef87a56602f82ec13846216f41661315d576d36f9af9c1f23e5da3b5f9c1e07e6aef2a307827c5791f8707cbf87d76fb6675c9fbf159baebc6ef4acc05f05d8ca0318b60bbd017dafa679af9c1f23e5dbe0b83c0fcd5de5460f04f8af23f0e0f97f0d0547337d703b3fdae0767fb5c0ecff006b81d9fed06bd2fa841fdce45090b047a56602f82ec0151806765d85bed2fe99b7a216d9e6be707c8f976f82e0f03f357795183c13e2bc8fc383e5fc35e0bf386df37d159b4e93f87f4fa76602f82ec2b311be1bb136c263595660b3679af9c1f23e5dbe17e70781f9abbca8c1e09f15e47e1c1f2fe1a629a0a8f10982df37d0737693adc4d469dd7c7fb3e9d980be0bb09b60bb63825a9c06217f41352e279af9c1f23e5da3b1f9c1e07e6aef2a3078a7c57b0e0e0f97f0ecf89f182df371ae0731655c3d3d3b3017c176136c177a766c7d05de8ddb3cd7ce0f91f2ed39bc1fc60f03f357f95180c0703e2bdc70707c9f8767c4f8c16f9b8d5065b78952f516602f82ec26d82ea6de99c22549526c6fe897d9e6be70040127e5ae1685015aca7cf03ce7b665286e0fc6009ca841534b44c0a3abf0ec9ba3f060b7cdc666e0b8fe8bfcf52cc05f05d84db05d56603d705a9c16538bcd7ce2f27f14c897cdfbf18106334a4d275c084dc32f4d9065e3e33c0862e334ef0f877ff29595d6705be6e254307333f01f99f52cc05f05d84db05d845f12ef445b096c4579af9c5e4fe29269f22eb7ebd05ff0034fded685fa1d3f58945f7edb7cdc5770883d4b3017c176136c17615d887a2dd84c56517aaf9a86a1a86a1a8683d5fc3b138c8d353f99ef952230e07a19f7ad317fc0c0f0246959fcc302e647cf97ee8c2ade1baa1a86adf370aa1f665827a52b47568d27bb5633d73f9a0020c76197cd3a4f769a904f1cfe7d15abfdc6a87dc4b413f71de823ee25a1f712a09fb8962af41f70ac6c08fb8563607dc2b14b41f70ac6c0fb857607dc2ec047dc0b4b3413411f4f1fa8bb07d449352943f4d58a59a0a0faa3494a3e925a760fac1a665149fa22d3b0503eb514ec4bb13ff74ec2ec281f5f688ec97621ff00449b12ed281f61c1b11b65a96c42a4a9f4e6a4da4b840fb263625518a6a5a96a5a96a5a96a7143b107da195415054545454618a8a8a82a0acbe89fffda0008010303013f10fa082b05672f35907772ab7eb0dcaee7953e2af79cc0f1f95425cf11f98f1477901fcaac83ecd286801c8a86950d2a1a55f57306b2757bb4a6a5e891f115615ec2eb5e41bf450fe10fc296a0780f8c9f15e5dc3e7eceb1c6b11dc83cd44a2e9fe2f26a3509c507687cb4776713def83c9b07cb5f1c5fc0d6f5bcbf4156a9721f9144b374a1aa3d97ed48b874a10e60e8a6ec39d0bc1d487c855cf7b2d3344ca13833b5cc86ae9dd425de0d67cd7183f87cd679178a1ed0f0b5304f027d8e9c09ad8735979a7c43ea3dd9761a8941e61e6dd0361b241ab593b9d3fd479af8f70a643ded7963c55e8ba3e02bcfc0fcbeabf291e0c5646334927672ab32f03f6506cbcc3c3f956461b892792f8aba7e130f683e362c1137249d9a9c4e332f94f6054e08e9f81f66eae11a827d820ac17a8c09f7fc57f7eaa8ce2bb7a59de8000202a209e2f82ef4a941dd7f33464e87825ef2f114c4a3c4bf3ff427d0858ed6acac97125de078acbd9f7666742ba68e7f978a88dd20279a9d5697edc9dde553acc7fdcde741f5d70095a867e0b9bf67170a30f726fbbb0a58e05d580ead4e4bd0773f06a600d2bfbb3ed14b15577acbff0070864bd44032f6972746a152f92eeccef4927051f25f854a8e89ef63e1e352d947163c87938fd680333dc66f65d8349af9b79f5ddca15027acbe3578152d3dd3e97774e55261c1b9c86476fa2392a12a10e059de9f924e15132751d8fc0acbfdb410f30ee64f1a4dea0bab7f5745fab66681759731fc19e8545f2732f62ecba453a296f5ef3e17a327a27d9ce874b6debf1a1c0fa4cbc706f73b1a0b29396efabe61a22d003e773e91e552f2bc3c46cf4fa902b05ea225dc6f3f070a058ad8320f7bdef53306b7e6fc32a4f0adda1c8b1d3e9a1925bd4545db6e1038c644f1939d3c89e6fc9b9ec3c233a4fa781d41a06ab71ecce8420d45b93bbc9c2d594e2d8cf907e5838d2e978b5f9be1d9f511492dea1acf4b4dcb93bf4f552ec309b9331e4fb4de0fd3771539bf1a9e0dfc40c06fd56ab7bec82a560b6ddef3937cda9cb16ebefc7d52588fa64703b8b3f4715dddad48983e41efbbc6a6e6b4b6f696bbbf4fb8799636fd383a6f6fcb257421637ad0def837c15ba25c9b1c5d78bb47dc27705dbc07c753a54da95b373f06bb9c5815cbc8b1a07b5dff00709c7165f05f0eba55c42e7afc06f7f34fa72ec340dc7b73fb860b20bdbe6f783cb85d5e6ae5bed0e5ab71c605cb95d86e0d03de7f70a42c3f534fe5b8e294bf21401bf41ee0cec5335e1b8d03f2ef73fb872cb2fde1fc06f6810835dd37aeabe5abb46570b57934b6efb84c0948037ad0a39e66a683b07577d4bbe7e6375ec3573d3ee2c8ac8c9a6f73d875533872f36bfb3866de3f7120877ef0ddcdf097750b065cd7c037e829f19695f7e34fb84e9ca600deb62b293dc37b3d2c3813be9167e775f65a0fb8a5c3caef743cb4cc9cae8d3f1e4753ee23ba540fdf22ef0a382ea1ff005776af4acf2d038064608a8a8a8a8a8a8a8a8d9151515150fa3151515151861a8a8a8a8a8a8c10d454545454602090e6378ed5ee2fc57b8bf15ee2fc53d605c10f67084d162137fefcfb14d32dddf82a0e6b989fba327b71f0a4983c4bf26cf4c65881701d324f49afcb63f07cd40ca6e6fdb424f2b53e01e690c9754f832f3ff14016feebc292632f6068cf9bc3096f46eab31c1491e92cda5fd06fb0bfa5edba2a6a6a70c114ad72c6afe0bb419d43e07e99eab850912e249d9a402e59ddfdfda34c00651d8355dc1450cd4190f0eee6e7cad85d048dc731a5867bb1abdb7a9c21108dc7d7b8b20ebef3a52ee21d03e47ab4ad4a2aeab9b84b7a37559e8a46db3159b4bfa0df65d8dbedf6dd18e00c6500355c8acd8aeef1d0b70719f40504341d2f9f6b8ebb025828609962bdade4cba7a0cc72bd9d6e9e2d0f4cc11db2efd774c949e7f23323d99ac45bd1baacc0b14338c5b13b4bfa0dfd15db7db746380cc326ebb3e67a6000c66496977bc81a2c445833204416759cb00a066a4f617361bf9999eee18018266635771d582884d1ba11a4c7caad2001c924dae824487937a672edd8c7a5bb6a2c1768e7e68f77550e114c14a29e2e39abb036a9a9d96615d82cf49db353ff0010f6dd18e02e043de5f8c1116a3c7eca50b737929bed89c9df500d16a1752f83f3811669e45b154eff00858223aa760fa4ed998de3d9c1d26a04affac7cbe8aec0db059845f059b0c0df05d846582cdb66d68b6db36fb6e8c70671af80fdb07b6e2af0df3576d2b8385e547bcc5d1efba30409afc3f44abb6e52b299d27fcfc2991bd970190e847a37606d82cc2bb12ec0df05de8ada5b6b6ab36d9b7db746380e670e07b6e2af0df3576d2f423dee6a18b141280248c8867bab85ed470bda8e17b512164273dc71f50294a80e6e54846603c833f5327d25d81b60b30254605b2ec177a019e17159566d76fb6e8c703c8d0f9ff183db715786f9abb695ecbabfe46283236c9d3215ecd454417223c9f81d3d2bb036c1663695c66f82cc1660b369e99edba31c1e1f03db715786f9abb695ecbab1314236100905c9de35fcc53f98a7f314fe628d1940b79cce47a8b1019747c9276abf3aae6b3e95d81b60b302c50ed4a48d96612db5b6031aef446fb3db746383c3e07b6e2af0df3576d2bd97562628f0f85ef1a7a033abb6c299413cbd838fa77606d82cc2bb12cc3662bb0bb6ec1755d82ed9edba31c073b87dbbe0f6dc55e1be6aeda5ebd975626289ed41325ca380d0494cc39eecb7e0f78d3d03236a8972ee6286de3971cde997606d82cc22f82cd860854606fb0605cbd04150627b6e8c703cae1c0f6dc55e1be6aeda5ebdb7563628f2fe5c1ef1a630a5b425da6fa32f314da9c9cb7788f4eec0db059845f059e9ddb0b7a0b3d1b367b6e8c70655a3e67e983db715782f9a6fb4ae2f37754bbec5d1e5fcb83de34c62967b75a047360f8f52ec0db059845f05945fd317c28cd4350ecb3d16db3db74606d192246e277ea57b8fda97366972cbcd73c0bb23f38246d051c4c2f0a6fb603a33a91756b9617c3f8c119e03d9b634fde2ef82f78d31b918398781fb787a97606d82cc22f82cabb036a9f5837a305d438bdb7462f014185403d4e7e00eb81c9228dc81f8b9d695c0704b34b4c8445f7cdb01ce669e27c12f4d84e2043b878705cf12e491df4ac91cd5e1c9e134112041c82307bc698852c19677ab9bbd46ec0db059845f05984db12cf44df0b7c4debdb7462f01420c97283cb260fe3c3c1cb4f409a4d87b9c9bba9dfb442e4c3a865f838b37127e43286373a3c73dbef1a62b187a581d81f8f52ec0db059845f0598566cbb036f45bf0b7c5755f7fc55c62b8c5718ae315c62999db9b08193ee1d4779451ce35fcbe0ee688248ef2d82363877b90cded4d8d5bbf2fc05f7bbb03e0b27ddcd4b3458871fc4eee5d0b81e30fbae71f169dd95e51ce52b7fc888d38c5718a43ee32c2297d853535353535353811efa4f144c67e69f8a5d8bd9bc681811c9f014c91577b9e32e08d267b9278a190b7b34a9e207743e2296764d4e109ab1f718a5f7109a58fb882ad4b3f7108a5f710a58fb8826962967ee109ab52cfdc2134114a7ee109a08a5f7084d5a9fb8413b1fb846c2cfdc0134114b14b3f4f4fa89b0fd4431503489f4d09a08a58a65f5429034afa484d1b0fd6052069a27d10540d8d167eb4346c229a47fdc14500d88a55faf9413641b12ffa25b106c9a68b3f618b4524db054362550d47a7152da4304295f64cbb10a931454150542a150541518a1b12fb433a96a5a9e1535353826a6a6a6a5a96b3fa27ffd9);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`) VALUES
(5, 'anonimo', 'anonimo', 'anonimo', 0, 'ac037c61854d527f164f8e9d23df1918', 2, '');

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
-- Estructura de tabla para la tabla `tbl_actividad`
--

CREATE TABLE `tbl_actividad` (
  `actividadid` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripciongeneral` text COLLATE utf8_spanish_ci,
  `actividadestado` varchar(4) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_actividad`
--

INSERT INTO `tbl_actividad` (`actividadid`, `descripcion`, `descripciongeneral`, `actividadestado`) VALUES
(2, 'Industrial', 'Industrial', ''),
(8, 'Comercio', 'Comercio', ''),
(9, 'Varias', 'varias', ''),
(10, 'Rural', 'Rural', ''),
(11, 'Viñedo', 'Viñedo', ''),
(12, 'Actividad test ', 'descripcion de actividad test ', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_denuncias`
--

CREATE TABLE `tbl_denuncias` (
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
  `denunciatipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_denuncias`
--

INSERT INTO `tbl_denuncias` (`denunciaid`, `denunciasfecha`, `denunciariesgo`, `denunciaprograma`, `denunciafechaverif`, `denunciainclucion`, `denuncianroobra`, `denuncianroacta`, `denunciamotivos`, `estableid`, `denunciaestado`, `denunciatipo`) VALUES
(3, '2018-10-02 00:00:00', 'riesgo cc', NULL, '2018-10-03', NULL, 'nro', '456', 'motivo denuncia 2', 12, 'AC', 'denuncia tipo 2'),
(18, '2018-10-11 21:04:30', NULL, NULL, NULL, NULL, NULL, NULL, 'lañjfldsjfaf', 12, 'AC', 'Denuncia por Expediente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detaactiv`
--

CREATE TABLE `tbl_detaactiv` (
  `detaactivid` int(11) NOT NULL,
  `empleaid` int(11) DEFAULT NULL,
  `actividadid` int(11) DEFAULT NULL,
  `detaactivrubro` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `detaactivconvenio` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `detaactivestado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_detaactiv`
--

INSERT INTO `tbl_detaactiv` (`detaactivid`, `empleaid`, `actividadid`, `detaactivrubro`, `detaactivconvenio`, `detaactivestado`) VALUES
(30, 32, 2, 'dgfhfgh', 'dfghfhdfgh', 'AC'),
(31, 32, 2, 'dgfhfgh', 'dfghfhdfgh', 'AC'),
(32, 32, 2, 'dgfhfgh', 'dfghfhdfgh', 'AC'),
(34, 33, 2, 'metalurgica', '459887', NULL),
(35, 34, 2, 'fdfdssdfs', '545454', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleadores`
--

CREATE TABLE `tbl_empleadores` (
  `empleaid` int(11) NOT NULL,
  `empleatipo` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `empleacui` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empleafecha` datetime DEFAULT NULL,
  `empleainscrip` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `emplearazsoc` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empleaexp` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empleadomicilior` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empleadomiciliolegal` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empleadepid` int(11) NOT NULL DEFAULT '1',
  `emplealocid` int(11) NOT NULL,
  `empleaprovid` int(11) NOT NULL DEFAULT '1',
  `empleasliquiid` int(11) DEFAULT NULL,
  `empleapmasc` decimal(10,0) DEFAULT NULL,
  `empleapfem` decimal(10,0) DEFAULT NULL,
  `ampleafechaalta` date DEFAULT NULL,
  `empleaestado` varchar(4) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_empleadores`
--

INSERT INTO `tbl_empleadores` (`empleaid`, `empleatipo`, `empleacui`, `empleafecha`, `empleainscrip`, `emplearazsoc`, `empleaexp`, `empleadomicilior`, `empleadomiciliolegal`, `empleadepid`, `emplealocid`, `empleaprovid`, `empleasliquiid`, `empleapmasc`, `empleapfem`, `ampleafechaalta`, `empleaestado`) VALUES
(32, 'L', '30520763127', '2018-05-28 04:54:34', 'Ruben Juarez', 'El Arcon', '123456', '', 'Mendoza 234', 0, 0, 0, 1, '1', '2', '2018-05-28', 'AC'),
(33, 'L', '20222222222', '2018-05-31 22:57:58', '22121', 'Las Marias S.A', '122313', '', 'san martin 248 sur', 0, 0, 0, 2, '58', '10', '2018-05-31', 'AC'),
(34, 'L', '20222222222', '2018-06-15 23:26:07', '1111', 'Juan Perez', '1111', '', 'dsaadsadsadsad', 0, 0, 0, 1, '10', '10', '2018-06-15', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_establecimiento`
--

CREATE TABLE `tbl_establecimiento` (
  `estableid` int(11) NOT NULL,
  `establecalle` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `establealtura` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `establepiso` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `establedpto` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `establelatitud` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `establelongitud` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provid` int(11) DEFAULT NULL,
  `dptoid` int(11) DEFAULT NULL,
  `empleaid` int(11) DEFAULT NULL,
  `estableestado` varchar(4) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_establecimiento`
--

INSERT INTO `tbl_establecimiento` (`estableid`, `establecalle`, `establealtura`, `establepiso`, `establedpto`, `establelatitud`, `establelongitud`, `provid`, `dptoid`, `empleaid`, `estableestado`) VALUES
(12, 'CALLEJON BLANCO', '25', '', '', '', '', 19, 1732, 32, 'AC'),
(13, 'larain', '587', '4', '', '0', '0', 19, 1741, 33, 'AC'),
(14, 'cabot', '458', 'sur', '1', '0', '0', 19, 1732, 33, 'AC'),
(15, 'ddddd', '245', '1', '', '', '', 19, 1735, 34, 'AC'),
(16, 'CALLE 5 ', '120', NULL, NULL, NULL, NULL, 19, 1741, 32, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estado`
--

CREATE TABLE `tbl_estado` (
  `estadoid` int(11) NOT NULL,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_estado`
--

INSERT INTO `tbl_estado` (`estadoid`, `descripcion`, `estado`) VALUES
(1, 'ACTIVO', 'AC'),
(2, 'TRANSITO', 'TR'),
(3, 'REPARACION', 'RE'),
(4, 'COMODATO', 'CO'),
(5, 'CURSO', 'C'),
(6, 'INACTIVO', 'IN'),
(7, 'SOLICITADO', 'S'),
(8, 'TAREA REALIZADA', 'RE'),
(9, 'TERMINADO PARCIAL', 'TE'),
(10, 'TERMINADO', 'T'),
(11, 'ENTREGADO', 'E'),
(12, 'PEDIDO', 'P'),
(13, 'ASIGNADO', 'As'),
(14, 'ANULADO', 'AN');

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
  `bpm_id` int(11) DEFAULT NULL,
  `adjunto` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `tipoacta` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `accion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaProrroga` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_inspecciones`
--

INSERT INTO `tbl_inspecciones` (`inspeccionid`, `inspeccionfechaasigna`, `inspeccionfecharecp`, `inspectorid`, `inspecciondescrip`, `estableid`, `inspeestado`, `bpm_id`, `adjunto`, `tipoacta`, `accion`, `fechaProrroga`) VALUES
(1, '2018-10-11 21:06:58', '2018-10-11 21:06:58', 3, 'aafgafgafgagfagafgga', 12, 'C', 23, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inspectores`
--

CREATE TABLE `tbl_inspectores` (
  `inspectorid` int(11) NOT NULL,
  `inspectornombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inspectormail` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inspectorcel` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inspectorsector` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inspectorestado` varchar(4) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_inspectores`
--

INSERT INTO `tbl_inspectores` (`inspectorid`, `inspectornombre`, `inspectormail`, `inspectorcel`, `inspectorsector`, `inspectorestado`) VALUES
(3, 'Juan Perez', 'inspector2@gmail.com', '2644510234', 'sector 2', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_libro`
--

CREATE TABLE `tbl_libro` (
  `libroid` int(11) NOT NULL,
  `librofechaentrega` datetime DEFAULT NULL,
  `librotomo` int(11) DEFAULT NULL,
  `empleaid` int(11) DEFAULT NULL,
  `libroestado` varchar(4) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_libro`
--

INSERT INTO `tbl_libro` (`libroid`, `librofechaentrega`, `librotomo`, `empleaid`, `libroestado`) VALUES
(20, '0000-00-00 00:00:00', 2018, 32, 'AC');

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
-- Estructura de tabla para la tabla `tbl_notas`
--

CREATE TABLE `tbl_notas` (
  `notid` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empleaid` int(11) DEFAULT NULL,
  `notaestado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observacion` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_notas`
--

INSERT INTO `tbl_notas` (`notid`, `fecha`, `imagen`, `empleaid`, `notaestado`, `observacion`) VALUES
(17, '2018-06-01', 'Desert1.jpg', 33, 'AC', 'Esto es una nota!'),
(20, '2018-06-18', 'Puesta_de_sol.jpg', 32, 'AC', 'dsadsadsad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sisliqui`
--

CREATE TABLE `tbl_sisliqui` (
  `sisliquiid` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sisliquiestado` varchar(4) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_sisliqui`
--

INSERT INTO `tbl_sisliqui` (`sisliquiid`, `descripcion`, `sisliquiestado`) VALUES
(1, 'manual', ''),
(2, 'electronico', ''),
(6, 'liquidacion test 1', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trg_inspecciondenuncia`
--

CREATE TABLE `trg_inspecciondenuncia` (
  `insden_id` int(11) NOT NULL,
  `denunciaid` int(11) DEFAULT NULL,
  `inspeccionid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trg_inspecciondenuncia`
--

INSERT INTO `trg_inspecciondenuncia` (`insden_id`, `denunciaid`, `inspeccionid`) VALUES
(1, 3, 1),
(2, 18, 1);

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
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sisactions`
--
ALTER TABLE `sisactions`
  ADD PRIMARY KEY (`actId`);

--
-- Indices de la tabla `sisgroups`
--
ALTER TABLE `sisgroups`
  ADD PRIMARY KEY (`grpId`);

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
-- Indices de la tabla `sisusers`
--
ALTER TABLE `sisusers`
  ADD PRIMARY KEY (`usrId`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`);

--
-- Indices de la tabla `tbl_actividad`
--
ALTER TABLE `tbl_actividad`
  ADD PRIMARY KEY (`actividadid`);

--
-- Indices de la tabla `tbl_denuncias`
--
ALTER TABLE `tbl_denuncias`
  ADD PRIMARY KEY (`denunciaid`),
  ADD KEY `estableid` (`estableid`);

--
-- Indices de la tabla `tbl_detaactiv`
--
ALTER TABLE `tbl_detaactiv`
  ADD PRIMARY KEY (`detaactivid`),
  ADD KEY `empleaid` (`empleaid`),
  ADD KEY `actividadid` (`actividadid`);

--
-- Indices de la tabla `tbl_empleadores`
--
ALTER TABLE `tbl_empleadores`
  ADD PRIMARY KEY (`empleaid`),
  ADD KEY `empleasliquiid` (`empleasliquiid`);

--
-- Indices de la tabla `tbl_establecimiento`
--
ALTER TABLE `tbl_establecimiento`
  ADD PRIMARY KEY (`estableid`),
  ADD KEY `tbl_establecimiento_ibfk_1` (`empleaid`);

--
-- Indices de la tabla `tbl_estado`
--
ALTER TABLE `tbl_estado`
  ADD PRIMARY KEY (`estadoid`);

--
-- Indices de la tabla `tbl_inspecciones`
--
ALTER TABLE `tbl_inspecciones`
  ADD PRIMARY KEY (`inspeccionid`),
  ADD KEY `inspectorid` (`inspectorid`),
  ADD KEY `estableid` (`estableid`);

--
-- Indices de la tabla `tbl_inspectores`
--
ALTER TABLE `tbl_inspectores`
  ADD PRIMARY KEY (`inspectorid`);

--
-- Indices de la tabla `tbl_libro`
--
ALTER TABLE `tbl_libro`
  ADD PRIMARY KEY (`libroid`),
  ADD KEY `empleaid` (`empleaid`);

--
-- Indices de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  ADD PRIMARY KEY (`id_listarea`);

--
-- Indices de la tabla `tbl_notas`
--
ALTER TABLE `tbl_notas`
  ADD PRIMARY KEY (`notid`),
  ADD KEY `empleaid` (`empleaid`);

--
-- Indices de la tabla `tbl_sisliqui`
--
ALTER TABLE `tbl_sisliqui`
  ADD PRIMARY KEY (`sisliquiid`);

--
-- Indices de la tabla `trg_inspecciondenuncia`
--
ALTER TABLE `trg_inspecciondenuncia`
  ADD PRIMARY KEY (`insden_id`);

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
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2383;
--
-- AUTO_INCREMENT de la tabla `orden_trabajo`
--
ALTER TABLE `orden_trabajo`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `sisactions`
--
ALTER TABLE `sisactions`
  MODIFY `actId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `sisgroups`
--
ALTER TABLE `sisgroups`
  MODIFY `grpId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sisgroupsactions`
--
ALTER TABLE `sisgroupsactions`
  MODIFY `grpactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;
--
-- AUTO_INCREMENT de la tabla `sismenu`
--
ALTER TABLE `sismenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `sismenuactions`
--
ALTER TABLE `sismenuactions`
  MODIFY `menuAccId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT de la tabla `sisusers`
--
ALTER TABLE `sisusers`
  MODIFY `usrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `tbl_actividad`
--
ALTER TABLE `tbl_actividad`
  MODIFY `actividadid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `tbl_denuncias`
--
ALTER TABLE `tbl_denuncias`
  MODIFY `denunciaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `tbl_detaactiv`
--
ALTER TABLE `tbl_detaactiv`
  MODIFY `detaactivid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `tbl_empleadores`
--
ALTER TABLE `tbl_empleadores`
  MODIFY `empleaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `tbl_establecimiento`
--
ALTER TABLE `tbl_establecimiento`
  MODIFY `estableid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `tbl_estado`
--
ALTER TABLE `tbl_estado`
  MODIFY `estadoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tbl_inspecciones`
--
ALTER TABLE `tbl_inspecciones`
  MODIFY `inspeccionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_inspectores`
--
ALTER TABLE `tbl_inspectores`
  MODIFY `inspectorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tbl_libro`
--
ALTER TABLE `tbl_libro`
  MODIFY `libroid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  MODIFY `id_listarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `tbl_notas`
--
ALTER TABLE `tbl_notas`
  MODIFY `notid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `tbl_sisliqui`
--
ALTER TABLE `tbl_sisliqui`
  MODIFY `sisliquiid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `trg_inspecciondenuncia`
--
ALTER TABLE `trg_inspecciondenuncia`
  MODIFY `insden_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `trj_pedido_trabajo`
--
ALTER TABLE `trj_pedido_trabajo`
  MODIFY `petr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_denuncias`
--
ALTER TABLE `tbl_denuncias`
  ADD CONSTRAINT `tbl_denuncias_ibfk_1` FOREIGN KEY (`estableid`) REFERENCES `tbl_establecimiento` (`estableid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_detaactiv`
--
ALTER TABLE `tbl_detaactiv`
  ADD CONSTRAINT `tbl_detaactiv_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_detaactiv_ibfk_2` FOREIGN KEY (`actividadid`) REFERENCES `tbl_actividad` (`actividadid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_empleadores`
--
ALTER TABLE `tbl_empleadores`
  ADD CONSTRAINT `tbl_empleadores_ibfk_1` FOREIGN KEY (`empleasliquiid`) REFERENCES `tbl_sisliqui` (`sisliquiid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_establecimiento`
--
ALTER TABLE `tbl_establecimiento`
  ADD CONSTRAINT `tbl_establecimiento_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_inspecciones`
--
ALTER TABLE `tbl_inspecciones`
  ADD CONSTRAINT `tbl_inspecciones_ibfk_1` FOREIGN KEY (`inspectorid`) REFERENCES `tbl_inspectores` (`inspectorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_inspecciones_ibfk_2` FOREIGN KEY (`estableid`) REFERENCES `tbl_establecimiento` (`estableid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_libro`
--
ALTER TABLE `tbl_libro`
  ADD CONSTRAINT `tbl_libro_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_notas`
--
ALTER TABLE `tbl_notas`
  ADD CONSTRAINT `tbl_notas_ibfk_1` FOREIGN KEY (`empleaid`) REFERENCES `tbl_empleadores` (`empleaid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
