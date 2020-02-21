-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 09:57
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sortir`
--

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
(6, 'Brouillon'),
(7, 'Publiée'),
(8, 'Annulée'),
(9, 'Clôturée'),
(10, 'En cours'),
(11, 'Terminée'),
(12, 'Archivée');

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville_id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2F577D59A73F0036` (`ville_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville_id`, `nom`, `adresse`) VALUES
(1, 226, 'Levrette Cafe', '30 quai Fernand Crouan, Parc des chantiers - Pont 1 du Nantilus, 44000 Nantes'),
(2, 226, 'L\'engrenage', '4 Allée de l\'Île Gloriette, 44000 Nantes'),
(3, 226, 'La Bodega', '8 Rue Beauregard, 44000 Nantes'),
(4, 227, 'Tour Eiffel', 'Champ de Mars, 5 Avenue Anatole France, 75007 Paris'),
(5, 1, 'Rdv en terre inconnue', '10 place de la Mairie 01190 Ozan.'),
(6, 226, 'Chez moi', '4 Rue de Coulmiers'),
(15, 226, 'VF Burger', '12 Allée des Tanneurs, 44000'),
(16, 227, 'Arc de Triomphe', 'Place Charles de Gaulle, 75008'),
(19, 227, 'Le Louvre', 'Rue de Rivoli, 75001'),
(20, 228, 'Wuhan hospital', 'Wuhan Central Hospital, Shengli Street, Jiang\'an District, Wuhan, Hubei, China');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200210122932', '2020-02-10 12:30:12');

-- --------------------------------------------------------

--
-- Structure de la table `rejoindre`
--

DROP TABLE IF EXISTS `rejoindre`;
CREATE TABLE IF NOT EXISTS `rejoindre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `son_utilisateur_id` int(11) NOT NULL,
  `sa_sortie_id` int(11) NOT NULL,
  `date_inscription` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_56E78755187326B7` (`son_utilisateur_id`),
  KEY `IDX_56E78755DB3FCCAB` (`sa_sortie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rejoindre`
--

INSERT INTO `rejoindre` (`id`, `son_utilisateur_id`, `sa_sortie_id`, `date_inscription`) VALUES
(11, 10, 3, '2020-02-12 13:32:28'),
(15, 1, 3, '2020-02-12 14:03:17'),
(16, 1, 4, '2020-02-12 14:03:18'),
(18, 7, 3, '2020-02-12 15:46:04'),
(19, 7, 4, '2020-02-12 15:46:07'),
(23, 10, 2, '2020-02-18 09:39:54'),
(24, 10, 4, '2020-02-18 09:39:56'),
(27, 1, 2, '2020-02-18 13:29:29'),
(56, 1, 5, '2020-02-18 14:58:10'),
(58, 1, 12, '2020-02-19 09:59:15'),
(60, 64, 12, '2020-02-19 10:12:38'),
(69, 1, 19, '2020-02-20 09:52:34'),
(70, 7, 19, '2020-02-20 09:52:49'),
(72, 103, 22, '2020-02-20 14:55:48'),
(73, 1, 22, '2020-02-20 14:55:59'),
(74, 7, 22, '2020-02-20 14:56:11'),
(75, 103, 23, '2020-02-20 16:01:36'),
(76, 1, 23, '2020-02-20 16:01:47'),
(77, 1, 18, '2020-02-20 16:47:06'),
(78, 103, 18, '2020-02-20 16:48:21');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `nom`) VALUES
(1, 'SAINT HERBLAIN'),
(2, 'CHARTRES DE BRETAGNE'),
(3, 'LA ROCHE SUR YON');

-- --------------------------------------------------------

--
-- Structure de la table `sortie`
--

DROP TABLE IF EXISTS `sortie`;
CREATE TABLE IF NOT EXISTS `sortie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_id` int(11) NOT NULL,
  `etat_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `organisateur_id` int(11) NOT NULL,
  `nom` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_heure_debut` datetime NOT NULL,
  `duree` int(11) NOT NULL,
  `date_limite_inscription` datetime NOT NULL,
  `nb_inscription_max` int(11) NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_inscrits` int(11) NOT NULL,
  `motif` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3C3FD3F26AB213CC` (`lieu_id`),
  KEY `IDX_3C3FD3F2D5E86FF` (`etat_id`),
  KEY `IDX_3C3FD3F2F6BD1646` (`site_id`),
  KEY `IDX_3C3FD3F2D936B2FA` (`organisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sortie`
--

INSERT INTO `sortie` (`id`, `lieu_id`, `etat_id`, `site_id`, `organisateur_id`, `nom`, `date_heure_debut`, `duree`, `date_limite_inscription`, `nb_inscription_max`, `commentaire`, `nb_inscrits`, `motif`) VALUES
(1, 1, 11, 2, 7, 'Petite soirée entre potes', '2020-02-11 21:00:00', 180, '2020-02-11 20:00:00', 10, 'Soirée au bar', 0, 'Sans raison'),
(2, 2, 11, 2, 7, 'Soirée entre filles', '2020-02-20 08:12:00', 20, '2020-02-20 21:00:00', 5, 'Soirée à l\'Engrenage', 3, NULL),
(3, 1, 11, 2, 7, 'Ca va etre chaud', '2020-02-12 09:30:00', 45, '2020-02-11 17:30:00', 4, 'Sortie de test', 4, NULL),
(4, 1, 11, 1, 10, 'Soirée mousse', '2020-02-12 21:00:00', 20, '2020-02-12 20:00:00', 100, 'On aime pas les soirées nous ?', 3, NULL),
(5, 3, 12, 1, 1, 'Soirée de l\'admin', '2019-12-10 16:00:00', 100, '2020-02-13 14:00:00', 1, 'Ma soirée en solo', 1, 'tg'),
(6, 4, 8, 1, 1, 'Escalade', '2022-12-10 00:00:00', 20, '2020-02-14 08:00:00', 3, 'Petite montée ?', 0, NULL),
(7, 5, 11, 1, 1, 'Ma sortie en solitaire', '2020-02-13 20:00:00', 6, '2020-02-14 10:00:00', 1, 'Qui connait ?', 0, NULL),
(9, 15, 11, 1, 1, 'Soirée burger', '2020-02-17 20:00:00', 120, '2020-02-17 18:00:00', 5, 'Allons manger un burger  !', 0, NULL),
(12, 1, 11, 1, 1, 'Ébat politique', '2020-02-19 09:00:00', 380, '2020-02-21 08:30:00', 2, 'Tête à tête avec Éric Zemmour', 2, NULL),
(17, 19, 6, 2, 7, 'Musée du louvre', '2020-03-01 09:00:00', 360, '2020-02-29 21:00:00', 10, 'Visite du musée du Louvre', 0, NULL),
(18, 6, 7, 1, 1, 'Anniversaire d\'Edouard 🤡', '2020-05-19 21:00:00', 300, '2020-05-18 20:00:00', 40, 'Grosse soirée chez Edouard, vous êtes tous invité !', 2, NULL),
(19, 3, 9, 1, 1, 'Test inscription clôturée', '2020-05-01 10:00:00', 20, '2020-04-01 10:00:00', 2, 'Test clôture des inscriptions', 2, NULL),
(22, 20, 10, 1, 103, 'Sauve qui peut !', '2020-02-21 09:00:00', 540, '2020-02-21 08:00:00', 3, 'Vous verrez, ça va être fun', 3, NULL),
(23, 20, 9, 1, 103, 'Admin vs Corona', '2020-02-29 10:00:00', 10, '2020-02-29 08:00:00', 2, 'Mieux que l\'octogone sans règle', 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture_filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publication_par_site` tinyint(1) DEFAULT NULL,
  `organisateur_inscription_desistement` tinyint(1) DEFAULT NULL,
  `administrateur_publication` tinyint(1) DEFAULT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `administration_modification` tinyint(1) DEFAULT NULL,
  `notif_veille_sortie` tinyint(1) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D1C63B35126AC48` (`mail`),
  UNIQUE KEY `UNIQ_1D1C63B386CC499D` (`pseudo`),
  KEY `IDX_1D1C63B3F6BD1646` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `site_id`, `nom`, `prenom`, `telephone`, `mail`, `admin`, `actif`, `password`, `picture_filename`, `publication_par_site`, `organisateur_inscription_desistement`, `administrateur_publication`, `pseudo`, `administration_modification`, `notif_veille_sortie`, `token`) VALUES
(1, 1, 'langer', 'sylvain', '0786745425', 'langer.sylvain95@gmail.com', 1, 1, '$argon2id$v=19$m=65536,t=4,p=1$Nk9SWmZMSFNTRmEuS0pBSQ$cI39h6m6gzLq5bDWrvMlnpd7pGJmqRHv4LTNjq34AEU', 'pink-5e4ba5a71f46d.jpeg', 1, 1, 1, 'sylbouille', 1, NULL, NULL),
(7, 2, 'poussin', 'rouge', '0786745425', 'poussin.rouge@gmail.com', 0, 1, '$argon2id$v=19$m=65536,t=4,p=1$cGgvQ2VyVkVlQ0VVczBBbw$vcD4focaNy5FHW5JXZKy+SyDTSQc/63uxxbQOUOhLiE', NULL, 0, 0, 0, 'Red', 0, NULL, NULL),
(10, 1, 'test', 'test', '0786745425', 'test@test.com', 1, 1, '$argon2id$v=19$m=65536,t=4,p=1$WWhlenVGZW9mLmp1SEF2Sg$F4T1FyrAVUG/CuuV3t2H4leSsvFFEjKln6wn+seFVps', NULL, 0, 0, 0, 'jacky', 0, NULL, '6499dbaf8fdfc8191e57a39c50d597fce2294956'),
(64, 3, 'zemmour', 'eric', NULL, 'eric.zemmour@grandremplacement.fr', 0, 1, '$argon2id$v=19$m=65536,t=4,p=1$SWFhZGFNNFJqY0E2UGpiQg$PklQd4Halt4sOA35n8NeXNadncccaEoC8t69ohwtz/k', 'ericzemmour-5e4d09ed03ea8.png', 0, 0, NULL, 'Ben voyons', NULL, NULL, '159d99b6f3383976143bca3f05076de407236ca8'),
(103, 1, 'corona', 'virus', NULL, 'viruschinois@wanadoo.fr', 0, 1, '$argon2id$v=19$m=65536,t=4,p=1$LjRDRTRLbS96eDAyYWRwYw$0vbpz71V3DfNWzgo5zgGZKhWoUqoXN+OA3hDZ7sZiAk', 'coronavirus-5e4e8fdc78150.jpeg', 0, 0, 0, 'Corona Virus', 0, NULL, NULL),
(104, 3, '\r\ngrippe', 'aviaire', NULL, 'pouletpascuit@msn.fr', 0, 1, '$argon2id$v=19$m=65536,t=4,p=1$Si4zTjJhMTFvbUFZN1NHaA$T0yCllQdjBhYYCd99jwkqZULmKlsl0KTspGkEY1c0BI', NULL, 0, 0, 0, 'kfcmortel', 0, NULL, NULL),
(105, 2, '\r\ngilles', 'delatourette', NULL, 'toctoc@yahoo.fr', 0, 1, '$argon2id$v=19$m=65536,t=4,p=1$QTJZaFNmTnlwcmdRZ250dw$Iz7X1/tgEveYGpR5zpwotKaJRfx4Umajq9KzGQe2lwM', NULL, 0, 0, 0, 'toctoc', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `nom`, `code_postal`) VALUES
(1, 'OZAN', '01190'),
(2, 'CORMORANCHE-SUR-SAONE', '01290'),
(3, 'PLAGNE', '01130'),
(4, 'TOSSIAT', '01250'),
(5, 'POUILLAT', '01250'),
(6, 'TORCIEU', '01230'),
(7, 'REPLONGES', '01620'),
(8, 'CORCELLES', '01110'),
(9, 'PERON', '01630'),
(10, 'RELEVANT', '01990'),
(11, 'CHAVEYRIAT', '01660'),
(12, 'VAUX-EN-BUGEY', '01150'),
(13, 'MAILLAT', '01430'),
(14, 'FARAMANS', '01800'),
(15, 'BEON', '01350'),
(16, 'SAINT-BERNARD', '01600'),
(17, 'ROSSILLON', '01510'),
(18, 'PONT-D\'AIN', '01160'),
(19, 'NANTUA', '01460'),
(20, 'CHAVANNES-SUR-REYSSOUZE', '01190'),
(21, 'NEUVILLE-LES-DAMES', '01400'),
(22, 'FLAXIEU', '01350'),
(23, 'HOTONNES', '01260'),
(24, 'SAINT-SORLIN-EN-BUGEY', '01150'),
(25, 'SONGIEU', '01260'),
(26, 'VIRIEU-LE-PETIT', '01260'),
(27, 'SAINT-DENIS-EN-BUGEY', '01500'),
(28, 'CHARNOZ-SUR-AIN', '01800'),
(29, 'CHAZEY-SUR-AIN', '01150'),
(30, 'MARCHAMP', '01680'),
(31, 'CULOZ', '01350'),
(32, 'MANTENAY-MONTLIN', '01560'),
(33, 'MARBOZ', '01851'),
(34, 'FOISSIAT', '01340'),
(35, 'TREFFORT-CUISIAT', '01370'),
(36, 'IZIEU', '01300'),
(37, 'SAINT-ETIENNE-DU-BOIS', '01370'),
(38, 'HAUTEVILLE-LOMPNES', '01110'),
(39, 'SAINT-TRIVIER-SUR-MOIGNANS', '01990'),
(40, 'PEYRIAT', '01430'),
(41, 'EVOSGES', '01230'),
(42, 'PONCIN', '01450'),
(43, 'CRANS', '01320'),
(44, 'MONTREAL-LA-CLUSE', '01460'),
(45, 'CLEYZIEU', '01230'),
(46, 'LOMPNIEU', '01260'),
(47, 'VILLEREVERSURE', '01250'),
(48, 'SAINT-MARTIN-DU-MONT', '01160'),
(49, 'SAINT-GENIS-POUILLY', '01630'),
(50, 'BOLOZON', '01450'),
(51, 'CONFRANCON', '01310'),
(52, 'LOCHIEU', '01260'),
(53, 'CHANOZ-CHATENAY', '01400'),
(54, 'VILLEBOIS', '01150'),
(55, 'CEIGNES', '01430'),
(56, 'SAINT-DIDIER-SUR-CHALARONNE', '01140'),
(57, 'REVONNAS', '01250'),
(58, 'BOURG-SAINT-CHRISTOPHE', '01800'),
(59, 'CONDEISSIAT', '01400'),
(60, 'PIRAJOUX', '01270'),
(61, 'CHALAMONT', '01320'),
(62, 'LE PLANTAY', '01330'),
(63, 'VERSAILLEUX', '01330'),
(64, 'MONTAGNAT', '01250'),
(65, 'VIEU', '01260'),
(66, 'SAINT-ANDRE-DE-CORCY', '01390'),
(67, 'BRESSOLLES', '01360'),
(68, 'PERONNAS', '01960'),
(69, 'COLOMIEU', '01300'),
(70, 'MONTHIEUX', '01390'),
(71, 'SAINT-JEAN-SUR-REYSSOUZE', '01560'),
(72, 'GARNERANS', '01140'),
(73, 'MONTREVEL-EN-BRESSE', '01340'),
(74, 'CONAND', '01230'),
(75, 'CHALLES-LA-MONTAGNE', '01450'),
(76, 'MOGNENEINS', '01140'),
(77, 'THOISSEY', '01140'),
(78, 'CHALEINS', '01480'),
(79, 'NEUVILLE-SUR-AIN', '01160'),
(80, 'THIL', '01120'),
(81, 'JUJURIEUX', '01640'),
(82, 'ONCIEU', '01230'),
(83, 'LURCY', '01090'),
(84, 'BALAN', '01360'),
(85, 'AMBUTRIX', '01500'),
(86, 'SAINTE-CROIX', '01120'),
(87, 'BLYES', '01150'),
(88, 'CONZIEU', '01300'),
(89, 'NIEVROZ', '01120'),
(90, 'NURIEUX-VOLOGNAT', '01460'),
(91, 'AMBLEON', '01300'),
(92, 'SAINT-MAURICE-DE-GOURDANS', '01800'),
(93, 'CHEZERY-FORENS', '01200'),
(94, 'SAULT-BRENAZ', '01150'),
(95, 'MURS-ET-GELIGNIEUX', '01300'),
(96, 'LE PETIT-ABERGEMENT', '01260'),
(97, 'CORMOZ', '01560'),
(98, 'SAINT-MARTIN-DE-BAVEL', '01510'),
(99, 'SAINT-TRIVIER-DE-COURTES', '01560'),
(100, 'BOYEUX-SAINT-JEROME', '01640'),
(101, 'CHATEAU-GAILLARD', '01500'),
(102, 'PREMEYZEL', '01300'),
(103, 'ARANDAS', '01230'),
(104, 'CHATENAY', '01320'),
(105, 'INNIMOND', '01680'),
(106, 'BOZ', '01190'),
(107, 'BRIORD', '01470'),
(108, 'REYRIEUX', '01600'),
(109, 'MATAFELON-GRANGES', '01580'),
(110, 'DROM', '01250'),
(111, 'CHATILLON-EN-MICHAILLE', '01200'),
(112, 'POLLIAT', '01310'),
(113, 'VESANCY', '01170'),
(114, 'MASSIEUX', '01600'),
(115, 'SAINT-CYR-SUR-MENTHON', '01380'),
(116, 'SERRIERES-SUR-AIN', '01450'),
(117, 'NIVOLLET-MONTGRIFFON', '01230'),
(118, 'IZERNORE', '01580'),
(119, 'SAINT-NIZIER-LE-DESERT', '01320'),
(120, 'GUEREINS', '01090'),
(121, 'ILLIAT', '01140'),
(122, 'LA TRANCLIERE', '01160'),
(123, 'SAINT-DIDIER-DE-FORMANS', '01600'),
(124, 'MERIGNAT', '01450'),
(125, 'SAINT-ELOI', '01800'),
(126, 'LA CHAPELLE-DU-CHATELARD', '01240'),
(127, 'SAINT-JEAN-DE-NIOST', '01800'),
(128, 'SAVIGNEUX', '01480'),
(129, 'NATTAGES', '01300'),
(130, 'SAINT-BENOIT', '01300'),
(131, 'DOUVRES', '01500'),
(132, 'FRANCHELEINS', '01090'),
(133, 'DORTAN', '01590'),
(134, 'SAINT-GERMAIN-LES-PAROISSES', '01300'),
(135, 'MIRIBEL', '01700'),
(136, 'LANCRANS', '01200'),
(137, 'ECHENEVEX', '01170'),
(138, 'SAINT-JEAN-SUR-VEYLE', '01290'),
(139, 'BILLIAT', '01200'),
(140, 'L\'ABERGEMENT-DE-VAREY', '01640'),
(141, 'VILLENEUVE', '01480'),
(142, 'VILLARS-LES-DOMBES', '01330'),
(143, 'THEZILLIEU', '01110'),
(144, 'SAINT-ETIENNE-SUR-REYSSOUZE', '01190'),
(145, 'SOUCLIN', '01150'),
(146, 'SAINT-JUST', '01250'),
(147, 'CIVRIEUX', '01390'),
(148, 'ARGIS', '01230'),
(149, 'TALISSIEU', '01510'),
(150, 'BIRIEUX', '01330'),
(151, 'SAINT-JULIEN-SUR-VEYLE', '01540'),
(152, 'THOIRY', '01710'),
(153, 'LAIZ', '01290'),
(154, 'CRESSIN-ROCHEFORT', '01350'),
(155, 'SAINT-CHAMP', '01300'),
(156, 'SAINT-GEORGES-SUR-RENON', '01400'),
(157, 'LANTENAY', '01430'),
(158, 'VERNOUX', '01560'),
(159, 'CORMARANCHE-EN-BUGEY', '01110'),
(160, 'SAINTE-EUPHEMIE', '01600'),
(161, 'BEAUPONT', '01270'),
(162, 'BRENS', '01300'),
(163, 'RAMASSE', '01250'),
(164, 'DIVONNE-LES-BAINS', '01220'),
(165, 'LEAZ', '01200'),
(166, 'VILLES', '01200'),
(167, 'SAINT-JULIEN-SUR-REYSSOUZE', '01560'),
(168, 'GROSLEE', '01680'),
(169, 'VANDEINS', '01660'),
(170, 'VERJON', '01270'),
(171, 'SAINT-ANDRE-SUR-VIEUX-JONC', '01240'),
(172, 'SAINT-ANDRE-D\'HUIRIAT', '01290'),
(173, 'GRILLY', '01220'),
(174, 'CESSY', '01170'),
(175, 'ORDONNAZ', '01510'),
(176, 'VESCOURS', '01560'),
(177, 'MEILLONNAS', '01370'),
(178, 'GEOVREISSET', '01100'),
(179, 'CEYZERIEU', '01350'),
(180, 'BEARD-GEOVREISSIAT', '01460'),
(181, 'LA BURBANCHE', '01510'),
(182, 'PERREX', '01540'),
(183, 'VILLEMOTIER', '01270'),
(184, 'JASSERON', '01250'),
(185, 'CORVEISSIAT', '01250'),
(186, 'JOURNANS', '01250'),
(187, 'SERMOYER', '01190'),
(188, 'CHARIX', '01130'),
(189, 'ARBIGNIEU', '01300'),
(190, 'LEYSSARD', '01450'),
(191, 'SAINT-JEAN-DE-THURIGNEUX', '01390'),
(192, 'FRANS', '01480'),
(193, 'TENAY', '01230'),
(194, 'BAGE-LA-VILLE', '01380'),
(195, 'MONTMERLE-SUR-SAONE', '01090'),
(196, 'COURMANGOUX', '01370'),
(197, 'BANEINS', '01990'),
(198, 'LAGNIEU', '01150'),
(199, 'ATTIGNAT', '01340'),
(200, 'SAINT-ANDRE-DE-BAGE', '01380'),
(201, 'PONT-DE-VAUX', '01190'),
(202, 'AMBERIEU-EN-BUGEY', '01500'),
(203, 'PEYZIEUX-SUR-SAONE', '01140'),
(204, 'CROZET', '01170'),
(205, 'SEYSSEL', '01420'),
(206, 'BEYNOST', '01700'),
(207, 'VERSONNEX', '01210'),
(208, 'SAINT-LAURENT-SUR-SAONE', '01620'),
(209, 'ARTEMARE', '01510'),
(210, 'MONTRACOL', '01310'),
(211, 'PARVES', '01300'),
(212, 'PUGIEU', '01510'),
(213, 'VIRIEU-LE-GRAND', '01510'),
(214, 'SAINT-REMY', '01310'),
(215, 'RANCE', '01390'),
(216, 'GRIEGES', '01290'),
(217, 'GRAND-CORENT', '01250'),
(218, 'OUTRIAZ', '01430'),
(219, 'MONTAGNIEU', '01470'),
(220, 'CHAMPAGNE-EN-VALROMEY', '01260'),
(221, 'AMBERIEUX-EN-DOMBES', '01330'),
(222, 'LA BOISSE', '01120'),
(223, 'PARCIEUX', '01600'),
(224, 'SAINT-DIDIER-D\'AUSSIAT', '01340'),
(225, 'SAINT-NIZIER-LE-BOUCHOUX', '01560'),
(226, 'NANTES', '44000'),
(227, 'PARIS', '75000'),
(228, 'WUHAN', '430000');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD CONSTRAINT `FK_2F577D59A73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`);

--
-- Contraintes pour la table `rejoindre`
--
ALTER TABLE `rejoindre`
  ADD CONSTRAINT `FK_56E78755187326B7` FOREIGN KEY (`son_utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_56E78755DB3FCCAB` FOREIGN KEY (`sa_sortie_id`) REFERENCES `sortie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sortie`
--
ALTER TABLE `sortie`
  ADD CONSTRAINT `FK_3C3FD3F26AB213CC` FOREIGN KEY (`lieu_id`) REFERENCES `lieu` (`id`),
  ADD CONSTRAINT `FK_3C3FD3F2D5E86FF` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `FK_3C3FD3F2D936B2FA` FOREIGN KEY (`organisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3C3FD3F2F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_1D1C63B3F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
