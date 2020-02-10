-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 10 fév. 2020 à 12:56
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `publication_par_site` tinyint(1) NOT NULL,
  `organisateur_inscription_desistement` tinyint(1) NOT NULL,
  `administrateur_publication` tinyint(1) NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administration_modification` tinyint(1) NOT NULL,
  `notif_veille_sortie` tinyint(1) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D1C63B35126AC48` (`mail`),
  UNIQUE KEY `UNIQ_1D1C63B386CC499D` (`pseudo`),
  KEY `IDX_1D1C63B3F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(225, 'SAINT-NIZIER-LE-BOUCHOUX', '01560');

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
