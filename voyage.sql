-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mar. 10 sep. 2019 à 13:21
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
-- Structure de la table `activité`
--

DROP TABLE IF EXISTS `activité`;
CREATE TABLE IF NOT EXISTS `activité` (
  `idVille` int(3) NOT NULL,
  `Activité` varchar(25) NOT NULL,
  PRIMARY KEY (`idVille`,`Activité`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activité`
--

INSERT INTO `activité` (`idVille`, `Activité`) VALUES
(1, 'Aquatique'),
(1, 'Culturel'),
(2, 'Aquatique'),
(2, 'Culturel'),
(2, 'Jeux&Divertissements'),
(3, 'Culturel'),
(3, 'Randonnée'),
(4, 'Culturel'),
(5, 'Aquatique'),
(5, 'Culturel'),
(6, 'Culturel'),
(6, 'Jeux&Divertissements'),
(7, 'Culturel'),
(7, 'Randonnée'),
(7, 'Sport'),
(8, 'Aquatique'),
(8, 'Randonnée'),
(9, 'Culturel'),
(9, 'Jeux&Divertissements'),
(10, 'Culturel'),
(10, 'Jeux&Divertissements'),
(10, 'Sport');

-- --------------------------------------------------------

--
-- Structure de la table `continent`
--

DROP TABLE IF EXISTS `continent`;
CREATE TABLE IF NOT EXISTS `continent` (
  `idCont` int(3) NOT NULL AUTO_INCREMENT,
  `nomCont` varchar(25) NOT NULL,
  PRIMARY KEY (`idCont`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `continent`
--

INSERT INTO `continent` (`idCont`, `nomCont`) VALUES
(1, 'Afrique'),
(2, 'Asie'),
(3, 'Europe'),
(4, 'Amérique'),
(5, 'Océanie'),
(6, 'Antarctique');

-- --------------------------------------------------------

--
-- Structure de la table `infos`
--

DROP TABLE IF EXISTS `infos`;
CREATE TABLE IF NOT EXISTS `infos` (
  `idVille` int(3) NOT NULL,
  `mois` varchar(25) NOT NULL,
  `temp_min` int(11) NOT NULL,
  `temp_max` int(3) NOT NULL,
  `budg_min` int(5) NOT NULL,
  `budg_max` int(5) NOT NULL,
  PRIMARY KEY (`idVille`,`mois`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `infos`
--

INSERT INTO `infos` (`idVille`, `mois`, `temp_min`, `temp_max`, `budg_min`, `budg_max`) VALUES
(1, 'Janvier', 8, 12, 150, 300),
(1, 'Février', 7, 12, 140, 320),
(1, 'Mars', 9, 14, 150, 310),
(1, 'Avril', 11, 16, 200, 430),
(1, 'Mai', 14, 20, 250, 500),
(1, 'Juin', 18, 24, 350, 600),
(1, 'Juillet', 21, 27, 400, 650),
(1, 'Aout', 21, 27, 420, 670),
(1, 'Septembre', 19, 24, 350, 510),
(1, 'Octobre', 15, 20, 320, 490),
(1, 'Novembre', 11, 16, 300, 500),
(1, 'Décembre', 8, 13, 400, 650),
(2, 'Janvier', 3, 10, 900, 1200),
(2, 'Février', 3, 12, 950, 1150),
(2, 'Mars', 5, 15, 900, 1000),
(2, 'Avril', 7, 17, 850, 1100),
(2, 'Mai', 11, 21, 875, 1300),
(2, 'Juin', 14, 24, 900, 1350),
(2, 'Juillet', 16, 27, 1000, 1400),
(2, 'Aout', 16, 27, 1100, 1500),
(2, 'Septembre', 13, 24, 850, 1200),
(2, 'Octobre', 10, 19, 750, 1000),
(2, 'Novembre', 6, 14, 700, 1000),
(2, 'Décembre', 4, 11, 850, 1300),
(3, 'Janvier', 10, 15, 200, 250),
(3, 'Février', 11, 13, 180, 220),
(3, 'Mars', 13, 18, 150, 230),
(3, 'Avril', 15, 20, 300, 390),
(3, 'Mai', 15, 23, 290, 350),
(3, 'Juin', 21, 30, 400, 550),
(3, 'Juillet', 24, 34, 500, 650),
(3, 'Aout', 27, 38, 550, 650),
(3, 'Septembre', 24, 32, 350, 400),
(3, 'Octobre', 18, 24, 300, 430),
(3, 'Novembre', 14, 20, 250, 440),
(3, 'Décembre', 8, 15, 450, 600),
(4, 'Janvier', 9, 19, 900, 1100),
(4, 'Février', 10, 20, 850, 1200),
(4, 'Mars', 12, 23, 800, 1150),
(4, 'Avril', 15, 28, 850, 1200),
(4, 'Mai', 18, 32, 750, 1000),
(4, 'Juin', 21, 34, 770, 1150),
(4, 'Juillet', 23, 35, 1000, 1400),
(4, 'Aout', 23, 35, 1150, 1500),
(4, 'Septembre', 22, 33, 1000, 1250),
(4, 'Octobre', 19, 30, 750, 1250),
(4, 'Novembre', 15, 25, 800, 1300),
(4, 'Décembre', 11, 21, 950, 1300),
(5, 'Janvier', 4, 9, 550, 700),
(5, 'Février', 3, 10, 500, 650),
(5, 'Mars', 4, 12, 550, 590),
(5, 'Avril', 8, 17, 590, 690),
(5, 'Mai', 13, 22, 590, 700),
(5, 'Juin', 17, 26, 550, 650),
(5, 'Juillet', 19, 29, 650, 900),
(5, 'Aout', 20, 29, 750, 1200),
(5, 'Septembre', 17, 25, 650, 1100),
(5, 'Octobre', 14, 21, 590, 1000),
(5, 'Novembre', 10, 16, 590, 950),
(5, 'Décembre', 6, 12, 700, 1400),
(6, 'Janvier', -8, -3, 600, 1300),
(6, 'Février', -8, -3, 550, 1250),
(6, 'Mars', -4, 2, 600, 1300),
(6, 'Avril', 2, 9, 600, 1300),
(6, 'Mai', 7, 16, 590, 1250),
(6, 'Juin', 15, 23, 650, 1300),
(6, 'Juillet', 15, 23, 700, 1500),
(6, 'Aout', 13, 21, 800, 1600),
(6, 'Septembre', 9, 15, 650, 1300),
(6, 'Octobre', 4, 9, 550, 950),
(6, 'Novembre', -2, 2, 590, 1100),
(6, 'Décembre', -6, 2, 750, 1500),
(7, 'Janvier', -3, 3, 785, 900),
(7, 'Février', -2, 6, 750, 900),
(7, 'Mars', 2, 11, 700, 850),
(7, 'Avril', 6, 17, 750, 950),
(7, 'Mai', 10, 22, 750, 1000),
(7, 'Juin', 14, 25, 850, 1150),
(7, 'Juillet', 16, 27, 900, 1300),
(7, 'Aout', 15, 27, 950, 1500),
(7, 'Septembre', 11, 21, 850, 1300),
(7, 'Octobre', 6, 16, 790, 1200),
(7, 'Novembre', 2, 8, 800, 1250),
(7, 'Décembre', -2, 3, 950, 1500),
(8, 'Janvier', 16, 23, 1600, 2000),
(8, 'Février', 16, 23, 1500, 2100),
(8, 'Mars', 19, 25, 1450, 1900),
(8, 'Avril', 19, 26, 1400, 2050),
(8, 'Mai', 20, 27, 1600, 2100),
(8, 'Juin', 20, 27, 1700, 2250),
(8, 'Juillet', 19, 25, 1800, 2300),
(8, 'Aout', 20, 26, 1950, 2400),
(8, 'Septembre', 20, 26, 1700, 2100),
(8, 'Octobre', 21, 23, 1550, 1950),
(8, 'Novembre', 19, 23, 1600, 1900),
(8, 'Décembre', 19, 22, 1850, 2250),
(9, 'Janvier', 1, 6, 1200, 1500),
(9, 'Février', 0, 6, 1000, 1600),
(9, 'Mars', 3, 10, 950, 1100),
(9, 'Avril', 5, 14, 950, 1150),
(9, 'Mai', 8, 17, 900, 1200),
(9, 'Juin', 11, 20, 950, 1300),
(9, 'Juillet', 12, 22, 1200, 1500),
(9, 'Aout', 11, 22, 1300, 1650),
(9, 'Septembre', 11, 19, 1050, 1300),
(9, 'Octobre', 8, 14, 850, 1050),
(9, 'Novembre', 4, 10, 900, 1100),
(9, 'Décembre', 2, 6, 1150, 1550),
(10, 'Janvier', -3, 4, 1600, 2000),
(10, 'Février', -2, 5, 1400, 1850),
(10, 'Mars', 2, 10, 1250, 1900),
(10, 'Avril', 5, 16, 1400, 2000),
(10, 'Mai', 7, 16, 1500, 1950),
(10, 'Juin', 18, 26, 1550, 2000),
(10, 'Juillet', 20, 29, 1700, 2100),
(10, 'Aout', 20, 28, 1850, 2300),
(10, 'Septembre', 16, 24, 1450, 1850),
(10, 'Octobre', 10, 18, 1400, 1750),
(10, 'Novembre', 5, 12, 1450, 1950),
(10, 'Décembre', 0, 6, 1700, 2300);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `idVille` int(3) NOT NULL AUTO_INCREMENT,
  `image` varchar(25) NOT NULL,
  `idCont` int(3) NOT NULL,
  `nomVille` varchar(20) NOT NULL,
  `distance` int(5) NOT NULL,
  PRIMARY KEY (`idVille`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`idVille`, `image`, `idCont`, `nomVille`, `distance`) VALUES
(1, '', 3, 'Nice', 932),
(2, '', 3, 'Bordeaux', 493),
(3, '', 1, 'Marrakech', 2544),
(4, '', 1, 'Caire ', 5378),
(5, '', 2, 'Istanbul', 2810),
(6, '', 3, 'St-Petersbourg', 2765),
(7, '', 3, 'Bratislava', 1328),
(8, '', 4, 'Caracas', 7615),
(9, '', 3, 'Amsterdam', 436),
(10, '', 4, 'New-York', 5834);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
