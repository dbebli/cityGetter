-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 13 sep. 2019 à 07:39
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `voyage`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `idAct` int(3) NOT NULL AUTO_INCREMENT,
  `nomAct` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idAct`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`idAct`, `nomAct`) VALUES
(1, 'Sport'),
(2, 'Culture '),
(3, 'Randonnee'),
(4, 'Aquatique'),
(5, 'Divertissements');

-- --------------------------------------------------------

--
-- Structure de la table `actville`
--

DROP TABLE IF EXISTS `actville`;
CREATE TABLE IF NOT EXISTS `actville` (
  `idVille` int(3) NOT NULL,
  `idAct` int(3) NOT NULL,
  PRIMARY KEY (`idVille`,`idAct`),
  KEY `idAct` (`idAct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actville`
--

INSERT INTO `actville` (`idVille`, `idAct`) VALUES
(7, 1),
(10, 1),
(11, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(3, 3),
(7, 3),
(8, 3),
(14, 3),
(1, 4),
(2, 4),
(5, 4),
(8, 4),
(13, 4),
(14, 4),
(2, 5),
(6, 5),
(9, 5),
(10, 5),
(12, 5),
(13, 5),
(15, 5);

-- --------------------------------------------------------

--
-- Structure de la table `continent`
--

DROP TABLE IF EXISTS `continent`;
CREATE TABLE IF NOT EXISTS `continent` (
  `idCont` int(3) NOT NULL AUTO_INCREMENT,
  `nomCont` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idCont`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `continent`
--

INSERT INTO `continent` (`idCont`, `nomCont`) VALUES
(1, 'Afrique'),
(2, 'Asie'),
(3, 'Europe'),
(4, 'Amerique'),
(5, 'Oceanie');

-- --------------------------------------------------------

--
-- Structure de la table `tempbudg`
--

DROP TABLE IF EXISTS `tempbudg`;
CREATE TABLE IF NOT EXISTS `tempbudg` (
  `idVille` int(3) NOT NULL,
  `mois` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempMin` int(3) NOT NULL,
  `tempMax` int(3) NOT NULL,
  `budgMin` int(6) NOT NULL,
  `budgMax` int(6) NOT NULL,
  PRIMARY KEY (`idVille`,`mois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tempbudg`
--

INSERT INTO `tempbudg` (`idVille`, `mois`, `tempMin`, `tempMax`, `budgMin`, `budgMax`) VALUES
(1, 'Aout', 21, 27, 420, 670),
(1, 'Avril', 11, 16, 200, 430),
(1, 'Decembre', 8, 13, 400, 650),
(1, 'Fevrier', 7, 12, 140, 320),
(1, 'Janvier', 8, 12, 150, 300),
(1, 'Juillet', 21, 27, 400, 650),
(1, 'Juin', 18, 24, 350, 600),
(1, 'Mai', 14, 20, 250, 500),
(1, 'Mars', 9, 14, 150, 310),
(1, 'Novembre', 11, 16, 300, 500),
(1, 'Octobre', 15, 20, 320, 490),
(1, 'Septembre', 19, 24, 350, 510),
(2, 'Aout', 16, 27, 1100, 1500),
(2, 'Avril', 7, 17, 850, 1100),
(2, 'Decembre', 4, 11, 850, 1300),
(2, 'Fevrier', 3, 12, 950, 1150),
(2, 'Janvier', 3, 10, 900, 1200),
(2, 'Juillet', 16, 27, 1000, 1400),
(2, 'Juin', 14, 24, 900, 1350),
(2, 'Mai', 11, 21, 875, 1300),
(2, 'Mars', 5, 15, 900, 1000),
(2, 'Novembre', 6, 14, 700, 1000),
(2, 'Octobre', 10, 19, 750, 1000),
(2, 'Septembre', 13, 24, 850, 1200),
(3, 'Aout', 27, 38, 550, 650),
(3, 'Avril', 15, 20, 300, 390),
(3, 'Decembre', 8, 15, 450, 600),
(3, 'Fevrier', 11, 13, 180, 220),
(3, 'Janvier', 10, 15, 200, 250),
(3, 'Juillet', 24, 34, 500, 650),
(3, 'Juin', 21, 30, 400, 550),
(3, 'Mai', 15, 23, 290, 350),
(3, 'Mars', 13, 18, 150, 230),
(3, 'Novembre', 14, 20, 250, 440),
(3, 'Octobre', 18, 24, 300, 430),
(3, 'Septembre', 24, 32, 350, 400),
(4, 'Aout', 23, 35, 1150, 1500),
(4, 'Avril', 15, 28, 850, 1200),
(4, 'Decembre', 11, 21, 950, 1300),
(4, 'Fevrier', 10, 20, 850, 1200),
(4, 'Janvier', 9, 19, 900, 1100),
(4, 'Juillet', 23, 35, 1000, 1400),
(4, 'Juin', 21, 34, 770, 1150),
(4, 'Mai', 18, 32, 750, 1000),
(4, 'Mars', 12, 23, 800, 1150),
(4, 'Novembre', 15, 25, 800, 1300),
(4, 'Octobre', 19, 30, 750, 1250),
(4, 'Septembre', 22, 33, 1000, 1250),
(5, 'Aout', 20, 29, 750, 1200),
(5, 'Avril', 8, 17, 590, 690),
(5, 'Decembre', 6, 12, 700, 1400),
(5, 'Fevrier', 3, 10, 500, 650),
(5, 'Janvier', 4, 9, 550, 700),
(5, 'Juillet', 19, 29, 650, 900),
(5, 'Juin', 17, 26, 550, 650),
(5, 'Mai', 13, 22, 590, 700),
(5, 'Mars', 4, 12, 550, 590),
(5, 'Novembre', 10, 16, 590, 950),
(5, 'Octobre', 14, 21, 590, 1000),
(5, 'Septembre', 17, 25, 650, 1100),
(6, 'Aout', 13, 21, 800, 1600),
(6, 'Avril', 2, 9, 600, 1300),
(6, 'Decembre', -6, 2, 750, 1500),
(6, 'Fevrier', -8, -3, 550, 1250),
(6, 'Janvier', -8, -3, 600, 1300),
(6, 'Juillet', 15, 23, 700, 1500),
(6, 'Juin', 15, 23, 650, 1300),
(6, 'Mai', 7, 16, 590, 1250),
(6, 'Mars', -4, 2, 600, 1300),
(6, 'Novembre', -2, 2, 590, 1100),
(6, 'Octobre', 4, 9, 550, 950),
(6, 'Septembre', 9, 15, 650, 1300),
(7, 'Aout', 15, 27, 950, 1500),
(7, 'Avril', 6, 17, 750, 950),
(7, 'Decembre', -2, 3, 950, 1500),
(7, 'Fevrier', -2, 6, 750, 900),
(7, 'Janvier', -3, 3, 785, 900),
(7, 'Juillet', 16, 27, 900, 1300),
(7, 'Juin', 14, 25, 850, 1150),
(7, 'Mai', 10, 22, 750, 1000),
(7, 'Mars', 2, 11, 700, 850),
(7, 'Novembre', 2, 8, 800, 1250),
(7, 'Octobre', 6, 16, 790, 1200),
(7, 'Septembre', 11, 21, 850, 1300),
(8, 'Aout', 20, 26, 1950, 2400),
(8, 'Avril', 19, 26, 1400, 2050),
(8, 'Decembre', 19, 22, 1850, 2250),
(8, 'Fevrier', 16, 23, 1500, 2100),
(8, 'Janvier', 16, 23, 1600, 2000),
(8, 'Juillet', 19, 25, 1800, 2300),
(8, 'Juin', 20, 27, 1700, 2250),
(8, 'Mai', 20, 27, 1600, 2100),
(8, 'Mars', 19, 25, 1450, 1900),
(8, 'Novembre', 19, 23, 1600, 1900),
(8, 'Octobre', 21, 23, 1550, 1950),
(8, 'Septembre', 20, 26, 1700, 2100),
(9, 'Aout', 11, 22, 1300, 1650),
(9, 'Avril', 5, 14, 950, 1150),
(9, 'Decembre', 2, 6, 1150, 1550),
(9, 'Fevrier', 0, 6, 1000, 1600),
(9, 'Janvier', 1, 6, 1200, 1500),
(9, 'Juillet', 12, 22, 1200, 1500),
(9, 'Juin', 11, 20, 950, 1300),
(9, 'Mai', 8, 17, 900, 1200),
(9, 'Mars', 3, 10, 950, 1100),
(9, 'Novembre', 4, 10, 900, 1100),
(9, 'Octobre', 8, 14, 850, 1050),
(9, 'Septembre', 11, 19, 1050, 1300),
(10, 'Aout', 20, 28, 1850, 2300),
(10, 'Avril', 5, 16, 1400, 2000),
(10, 'Decembre', 0, 6, 1700, 2300),
(10, 'Fevrier', -2, 5, 1400, 1850),
(10, 'Janvier', -3, 4, 1600, 2000),
(10, 'Juillet', 20, 29, 1700, 2100),
(10, 'Juin', 18, 26, 1550, 2000),
(10, 'Mai', 7, 16, 1500, 1950),
(10, 'Mars', 2, 10, 1250, 1900),
(10, 'Novembre', 5, 12, 1450, 1950),
(10, 'Octobre', 10, 18, 1400, 1750),
(10, 'Septembre', 16, 24, 1450, 1850),
(11, 'Aout', 8, 16, 3400, 4000),
(11, 'Avril', 12, 21, 3200, 3500),
(11, 'Decembre', 14, 24, 2000, 3200),
(11, 'Fevrier', 16, 27, 1900, 3000),
(11, 'Janvier', 16, 26, 2000, 3150),
(11, 'Juillet', 7, 14, 2690, 3860),
(11, 'Juin', 8, 15, 2240, 3610),
(11, 'Mai', 10, 17, 2010, 3640),
(11, 'Mars', 15, 24, 1970, 3180),
(11, 'Novembre', 12, 22, 2470, 3470),
(11, 'Octobre', 11, 20, 2670, 3420),
(11, 'Septembre', 9, 18, 2530, 3020),
(12, 'Aout', 24, 31, 1650, 2410),
(12, 'Avril', 10, 19, 1520, 2250),
(12, 'Decembre', 4, 12, 1260, 1960),
(12, 'Fevrier', 2, 10, 1120, 1730),
(12, 'Janvier', 2, 10, 1350, 1980),
(12, 'Juillet', 23, 30, 1630, 2470),
(12, 'Juin', 19, 26, 1480, 2060),
(12, 'Mai', 15, 23, 1320, 1790),
(12, 'Mars', 5, 14, 1510, 1950),
(12, 'Novembre', 9, 17, 1640, 2130),
(12, 'Octobre', 15, 22, 1690, 2250),
(12, 'Septembre', 20, 27, 1475, 1865),
(13, 'Aout', 23, 30, 1195, 1465),
(13, 'Avril', 24, 32, 920, 1140),
(13, 'Decembre', 23, 30, 1000, 1335),
(13, 'Fevrier', 23, 32, 985, 1205),
(13, 'Janvier', 23, 31, 1350, 1980),
(13, 'Juillet', 23, 30, 1105, 1340),
(13, 'Juin', 23, 31, 875, 1045),
(13, 'Mai', 24, 31, 865, 1075),
(13, 'Mars', 24, 32, 905, 1235),
(13, 'Novembre', 23, 30, 880, 1150),
(13, 'Octobre', 23, 30, 895, 1150),
(13, 'Septembre', 23, 30, 915, 1210),
(14, 'Aout', 26, 33, 1125, 1465),
(14, 'Avril', 22, 28, 900, 1140),
(14, 'Decembre', 15, 22, 1005, 1335),
(14, 'Fevrier', 16, 21, 900, 1205),
(14, 'Janvier', 14, 20, 970, 1980),
(14, 'Juillet', 26, 33, 1030, 1340),
(14, 'Juin', 26, 34, 875, 1045),
(14, 'Mai', 24, 32, 810, 1075),
(14, 'Mars', 18, 23, 825, 1235),
(14, 'Novembre', 19, 26, 850, 1150),
(14, 'Octobre', 22, 29, 885, 1150),
(14, 'Septembre', 25, 32, 905, 1210),
(15, 'Aout', 26, 34, 995, 1465),
(15, 'Avril', 21, 37, 835, 1140),
(15, 'Decembre', 8, 23, 1025, 1335),
(15, 'Fevrier', 10, 24, 845, 1205),
(15, 'Janvier', 8, 21, 865, 1980),
(15, 'Juillet', 27, 35, 995, 1340),
(15, 'Juin', 28, 39, 835, 1045),
(15, 'Mai', 26, 40, 800, 1075),
(15, 'Mars', 16, 30, 845, 1235),
(15, 'Novembre', 13, 28, 1020, 1150),
(15, 'Octobre', 19, 33, 835, 1150),
(15, 'Septembre', 25, 34, 810, 1210);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `idVille` int(3) NOT NULL AUTO_INCREMENT,
  `nomVille` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCont` int(2) NOT NULL,
  `image` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` int(6) NOT NULL,
  PRIMARY KEY (`idVille`),
  KEY `idCont` (`idCont`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`idVille`, `nomVille`, `idCont`, `image`, `distance`) VALUES
(1, 'Nice', 3, '1.jpg', 932),
(2, 'Bordeaux', 3, '2.jpg', 493),
(3, 'Marrakech', 1, '3.jpg', 2544),
(4, 'Caire', 1, '4.jpg', 5378),
(5, 'Istanbul', 2, '5.jpg', 2810),
(6, 'St-Petersbourg', 3, '6.jpg', 2765),
(7, 'Bratislava', 3, '7.jpg', 1328),
(8, 'Caracas', 4, '8.jpg', 7615),
(9, 'Amsterdam', 3, '9.jpg', 436),
(10, 'NewYork', 4, '10.jpg', 5834),
(11, 'Melbourne', 5, '11.jpg', 16782),
(12, 'Tokyo', 2, '12.jpg', 9722),
(13, 'Phuket', 2, '13.jpg', 9782),
(14, 'Hanoi', 2, '14.jpg', 9178),
(15, 'New Delhi', 2, '15.jpg', 6584);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actville`
--
ALTER TABLE `actville`
  ADD CONSTRAINT `actville_ibfk_1` FOREIGN KEY (`idVille`) REFERENCES `ville` (`idVille`),
  ADD CONSTRAINT `actville_ibfk_2` FOREIGN KEY (`idAct`) REFERENCES `activite` (`idAct`);

--
-- Contraintes pour la table `tempbudg`
--
ALTER TABLE `tempbudg`
  ADD CONSTRAINT `tempbudg_ibfk_1` FOREIGN KEY (`idVille`) REFERENCES `ville` (`idVille`);

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `ville_ibfk_1` FOREIGN KEY (`idCont`) REFERENCES `continent` (`idCont`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
