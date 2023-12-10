-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 10 déc. 2023 à 15:26
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `smartapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL,
  `bief_desc` text NOT NULL,
  `full_desc` text NOT NULL,
  `views` int(11) NOT NULL,
  `metakey` text NOT NULL,
  `upvotes` int(11) NOT NULL,
  `downvotes` int(11) NOT NULL,
  `id_poster` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `object_type` text NOT NULL,
  `id_object` int(11) NOT NULL,
  `id_u` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE `favoris` (
  `id` int(11) NOT NULL,
  `object_type` text NOT NULL,
  `id_object` int(11) NOT NULL,
  `id_u` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `description` text NOT NULL,
  `cover` text NOT NULL,
  `link` text NOT NULL,
  `trailer` text NOT NULL,
  `price` text NOT NULL,
  `date` date NOT NULL,
  `company_url` text NOT NULL,
  `metakey` text NOT NULL,
  `id_poster` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_post`
--

CREATE TABLE `job_post` (
  `id` int(11) NOT NULL,
  `brief_desc` text NOT NULL,
  `full_desc` text NOT NULL,
  `qualifications` text NOT NULL,
  `date` date NOT NULL,
  `salary` text NOT NULL,
  `location` text NOT NULL,
  `condidats_number` int(11) NOT NULL,
  `metakey` text NOT NULL,
  `state` int(11) NOT NULL,
  `id_poster` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `id_sender` int(11) NOT NULL,
  `id_reciver` int(11) NOT NULL,
  `date` date NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `id_u` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `picture` text NOT NULL,
  `country` text NOT NULL,
  `genre` text NOT NULL,
  `type` text NOT NULL,
  `date_birth` date NOT NULL,
  `points` int(11) NOT NULL,
  `listparcour` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`phone`)),
  `bac` tinyint(1) DEFAULT NULL,
  `interet` varchar(255) DEFAULT NULL,
  `competence` varchar(255) DEFAULT NULL,
  `cv` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `picture`, `country`, `genre`, `type`, `date_birth`, `points`, `listparcour`, `phone`, `bac`, `interet`, `competence`, `cv`) VALUES
(1, 'admin', 'admin', 'admin', 'path', 'tunis', 'm', 'admin', '2023-11-16', 100000, '{\"nom_etablissement\":\"u00c9cole Polytechnique Fu00e9du00e9rale de Lausanne\",\"date_debut\":\"2020-09-01\",\"diplome\":\"Diplu00f4me d\'ingu00e9nieur\",\"domaine\":\"Informatique\",\"0\":{\"nom_etablissement\":\"Universit\\u00e9 de Tunis\",\"date_debut\":\"2023-09-01\",\"diplome\":\"Master en informatique\",\"domaine\":\"Informatique\"},\"1\":{\"nom_etablissement\":\"Entreprise XYZ\",\"date_debut\":\"2024-01-01\",\"diplome\":\"Ing\\u00e9nieur en informatique\",\"domaine\":\"Informatique\"},\"2\":{\"nom_etablissement\":\"Entreprise XYZ\",\"date_debut\":\"2024-01-01\",\"diplome\":\"Ing\\u00e9nieur en informatique\",\"domaine\":\"Informatique\"}}', NULL, NULL, 'Voyages,Photographie,Cuisine,Sport,Lecture,Art,Technologie,Musique,Bénévolat,Science,Cinéma/TV,Mode,Jeux,Langues', '', NULL),
(7, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad4@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(8, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(9, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.come', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(10, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comei', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(11, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comeil', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(12, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comeil9', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(13, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comeil9k', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(14, 'abiz', 'b88e9ea8be0dacc2dd7a58f471be601d', 'ab@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(15, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(16, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.come', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(17, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.come2', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(18, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.come23', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(19, '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(20, 'abiz1', 'be49df05c2a2f03c425af273c2eb664f', 'abdelazizmsaad2@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(21, '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(22, '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(23, '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(24, '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(25, '', '', '', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(26, 'admin22', 'admin22', 'admin22', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(27, 'testid', 'testid', 'testid', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk` (`id_poster`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkc` (`id_u`),
  ADD KEY `id_object` (`id_object`);

--
-- Index pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_u` (`id_u`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_poster` (`id_poster`);

--
-- Index pour la table `job_post`
--
ALTER TABLE `job_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkj` (`id_poster`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkms` (`id_sender`),
  ADD KEY `fkmr` (`id_reciver`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_u` (`id_u`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `favoris`
--
ALTER TABLE `favoris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job_post`
--
ALTER TABLE `job_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `blog_post`
--
ALTER TABLE `blog_post`
  ADD CONSTRAINT `fk` FOREIGN KEY (`id_poster`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_object`) REFERENCES `job_post` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_object`) REFERENCES `blog_post` (`id`),
  ADD CONSTRAINT `fkc` FOREIGN KEY (`id_u`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD CONSTRAINT `favoris_ibfk_1` FOREIGN KEY (`id_u`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `formation_ibfk_1` FOREIGN KEY (`id_poster`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `job_post`
--
ALTER TABLE `job_post`
  ADD CONSTRAINT `fkj` FOREIGN KEY (`id_poster`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fkmr` FOREIGN KEY (`id_reciver`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fkms` FOREIGN KEY (`id_sender`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_u`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
