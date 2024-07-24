-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 19 juil. 2024 à 13:14
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_culture`
--

-- --------------------------------------------------------

--
-- Structure de la table `culture`
--

DROP TABLE IF EXISTS `culture`;
CREATE TABLE IF NOT EXISTS `culture` (
  `id_culture` varchar(10) NOT NULL,
  `id_parcelle` varchar(10) NOT NULL,
  `id_prod` varchar(10) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `qte_recoltee` int NOT NULL,
  PRIMARY KEY (`id_culture`),
  KEY `fk_parcelle_culture` (`id_parcelle`),
  KEY `id_prod` (`id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `culture`
--

INSERT INTO `culture` (`id_culture`, `id_parcelle`, `id_prod`, `date_debut`, `date_fin`, `qte_recoltee`) VALUES
('1', '1', '1', '2024-05-01', '2024-07-18', 1),
('2', '1', '2', '2024-05-01', '2024-07-31', 2);

-- --------------------------------------------------------

--
-- Structure de la table `date`
--

DROP TABLE IF EXISTS `date`;
CREATE TABLE IF NOT EXISTS `date` (
  `id_date` date NOT NULL,
  PRIMARY KEY (`id_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `date`
--

INSERT INTO `date` (`id_date`) VALUES
('2024-05-01');

-- --------------------------------------------------------

--
-- Structure de la table `element_chimique`
--

DROP TABLE IF EXISTS `element_chimique`;
CREATE TABLE IF NOT EXISTS `element_chimique` (
  `id_element` varchar(10) NOT NULL,
  `id_unite` varchar(10) NOT NULL,
  `libelle_element` varchar(15) NOT NULL,
  PRIMARY KEY (`id_element`),
  KEY `fk_unite_element` (`id_unite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `element_chimique`
--

INSERT INTO `element_chimique` (`id_element`, `id_unite`, `libelle_element`) VALUES
('1', '100', 'Acide phosphori'),
('2', '100', 'Azote'),
('3', '100', 'Potassium');

-- --------------------------------------------------------

--
-- Structure de la table `engrais`
--

DROP TABLE IF EXISTS `engrais`;
CREATE TABLE IF NOT EXISTS `engrais` (
  `id_engrais` varchar(10) NOT NULL,
  `id_unite` varchar(10) NOT NULL,
  `nom_engrais` varchar(15) NOT NULL,
  PRIMARY KEY (`id_engrais`),
  KEY `fk_unite_engrais` (`id_unite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `engrais`
--

INSERT INTO `engrais` (`id_engrais`, `id_unite`, `nom_engrais`) VALUES
('1', '100', 'Engrais A'),
('2', '100', 'Engrais B'),
('3', '100', 'Engrais C');

-- --------------------------------------------------------

--
-- Structure de la table `epandage`
--

DROP TABLE IF EXISTS `epandage`;
CREATE TABLE IF NOT EXISTS `epandage` (
  `id_date` date NOT NULL,
  `id_parcelle` varchar(10) NOT NULL,
  `id_engrais` varchar(10) NOT NULL,
  `qte_epandue` int NOT NULL,
  PRIMARY KEY (`id_date`,`id_parcelle`,`id_engrais`),
  KEY `fk_parcelle_epandage` (`id_parcelle`),
  KEY `fk_engrais_epandage` (`id_engrais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `epandage`
--

INSERT INTO `epandage` (`id_date`, `id_parcelle`, `id_engrais`, `qte_epandue`) VALUES
('2024-05-01', '1', '1', 300),
('2024-05-01', '1', '2', 300),
('2024-05-01', '1', '3', 300);

-- --------------------------------------------------------

--
-- Structure de la table `parcelle`
--

DROP TABLE IF EXISTS `parcelle`;
CREATE TABLE IF NOT EXISTS `parcelle` (
  `id_parcelle` varchar(10) NOT NULL,
  `nom_parcelle` varchar(10) NOT NULL,
  `surface` int NOT NULL,
  `coordonnées` varchar(10) NOT NULL,
  PRIMARY KEY (`id_parcelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `parcelle`
--

INSERT INTO `parcelle` (`id_parcelle`, `nom_parcelle`, `surface`, `coordonnées`) VALUES
('1', 'A', 1, '41.24.2028'),
('2', 'B', 1, '41.24.2029'),
('3', 'fatima', 1, '41.24.2028');

-- --------------------------------------------------------

--
-- Structure de la table `possession`
--

DROP TABLE IF EXISTS `possession`;
CREATE TABLE IF NOT EXISTS `possession` (
  `id_engrais` varchar(10) NOT NULL,
  `id_element` varchar(10) NOT NULL,
  `valeur` int NOT NULL,
  PRIMARY KEY (`id_engrais`,`id_element`),
  KEY `fk_element_possession` (`id_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `possession`
--

INSERT INTO `possession` (`id_engrais`, `id_element`, `valeur`) VALUES
('1', '1', 30),
('2', '2', 20);

-- --------------------------------------------------------

--
-- Structure de la table `production`
--

DROP TABLE IF EXISTS `production`;
CREATE TABLE IF NOT EXISTS `production` (
  `id_prod` varchar(10) NOT NULL,
  `id_unite` varchar(10) NOT NULL,
  `nom_prod` varchar(15) NOT NULL,
  PRIMARY KEY (`id_prod`),
  KEY `fk_unite_production` (`id_unite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `production`
--

INSERT INTO `production` (`id_prod`, `id_unite`, `nom_prod`) VALUES
('1', '100', 'Tomates'),
('2', '100', 'Fraises');

-- --------------------------------------------------------

--
-- Structure de la table `unite`
--

DROP TABLE IF EXISTS `unite`;
CREATE TABLE IF NOT EXISTS `unite` (
  `id_unite` varchar(10) NOT NULL,
  PRIMARY KEY (`id_unite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `unite`
--

INSERT INTO `unite` (`id_unite`) VALUES
('100');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `culture`
--
ALTER TABLE `culture`
  ADD CONSTRAINT `culture_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `production` (`id_prod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_parcelle_culture` FOREIGN KEY (`id_parcelle`) REFERENCES `parcelle` (`id_parcelle`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `element_chimique`
--
ALTER TABLE `element_chimique`
  ADD CONSTRAINT `fk_unite_element` FOREIGN KEY (`id_unite`) REFERENCES `unite` (`id_unite`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `engrais`
--
ALTER TABLE `engrais`
  ADD CONSTRAINT `fk_unite_engrais` FOREIGN KEY (`id_unite`) REFERENCES `unite` (`id_unite`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `epandage`
--
ALTER TABLE `epandage`
  ADD CONSTRAINT `fk_date_epandage` FOREIGN KEY (`id_date`) REFERENCES `date` (`id_date`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_engrais_epandage` FOREIGN KEY (`id_engrais`) REFERENCES `engrais` (`id_engrais`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_parcelle_epandage` FOREIGN KEY (`id_parcelle`) REFERENCES `parcelle` (`id_parcelle`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `possession`
--
ALTER TABLE `possession`
  ADD CONSTRAINT `fk_element_possession` FOREIGN KEY (`id_element`) REFERENCES `element_chimique` (`id_element`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_engrais_possession` FOREIGN KEY (`id_engrais`) REFERENCES `engrais` (`id_engrais`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `production`
--
ALTER TABLE `production`
  ADD CONSTRAINT `fk_unite_production` FOREIGN KEY (`id_unite`) REFERENCES `unite` (`id_unite`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
