-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 10 fév. 2024 à 21:23
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
  `metakey` text NOT NULL,
  `id_poster` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `blog_post`
--

INSERT INTO `blog_post` (`id`, `bief_desc`, `full_desc`, `metakey`, `id_poster`, `state`) VALUES
(1, 'blog1', 'blog 1 complet', 'test metakey,test metakey1', 1, 1),
(2, 'blog2', 'blog 2 complet', 'test metakey2,test metakey3', 1, 1),
(3, 'blog3', 'blog 3 complet', 'test metakey4,test metakey5', 1, 1),
(4, 'blog4', 'blog 4 complet', 'test metakey6,test metakey7', 1, 1),
(5, 'blog5', 'blog 5 complet', 'test metakey8,test metakey9', 1, 1),
(6, 'blog6', 'blog 6 complet', 'test metakey10,test metakey11', 1, 1),
(7, 'blog7', 'blog 7 complet', 'test metakey12,test metakey13', 1, 1),
(8, 'blog8', 'blog 8 complet', 'test metakey14,test metakey15', 1, 1),
(9, 'blog9', 'blog 9 complet', 'test metakey16,test metakey17', 1, 1),
(10, 'blog10', 'blog 10 complet', 'test metakey18,test metakey19', 1, 1),
(11, 'blog11', 'blog 11 complet', 'test metakey20,test metakey21', 1, 1);

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
  `metakey` varchar(255) DEFAULT NULL,
  `id_poster` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `nom`, `description`, `cover`, `link`, `trailer`, `price`, `date`, `company_url`, `metakey`, `id_poster`) VALUES
(1, 'formation1', 'desc1', 'cover1', 'link1', 'trailer1', '22', '2023-12-15', 'url1', 'formation,e-learning,en ligne', 14),
(2, 'formation2_test', 'desc2', 'https://media.licdn.com/dms/image/D4D12AQGUFz6pDZzKYQ/article-cover_image-shrink_720_1280/0/1658400820592?e=2147483647&v=beta&t=_V1yQDtefqFfzTDr6M1FSfgMz1xNSYg4KUknhcl3-xY', 'link2', 'trailer2', '22', '2023-12-15', 'url2', 'formation2,e-learning2,en ligne2', 14),
(3, 'formation3', 'desc3', 'https://www.ovhcloud.com/sites/default/files/styles/large_screens_1x/public/2022-04/whatis_internet-of-things.png', 'link3', 'trailer3', '22', '2023-12-15', 'url3', 'formation3,e-learning3', 14),
(4, 'formation', 'dsc', '1706915041_halo-dark-clouds-d9cgeojpb60w37x.png', 'tesla.com', '', '200', '2023-12-15', 'tesla', 'x', 1),
(5, 'formation', 'dsc', '1706915163_halo-dark-clouds-d9cgeojpb60w37x.png', 'tesla.com', '', '200', '2023-12-15', 'tesla', 'x', 1),
(6, 'formation', 'dsc', '1706915673_halo-dark-clouds-d9cgeojpb60w37x.png', 'tesla.com', '', '200', '2023-12-15', 'tesla', 'x', 1),
(7, 'formation', 'dsc', '1706915676_halo-dark-clouds-d9cgeojpb60w37x.png', 'tesla.com', '', '200', '2023-12-15', 'tesla', 'x', 1),
(8, 'formation', 'dsc', '1706917475_halo-dark-clouds-d9cgeojpb60w37x.png', 'tesla.com', '', '200', '2023-12-15', 'tesla', 'x', 1),
(9, 'mouadh', 'moadh miboun ', '1706937912_cover.jpg', ':com', '', '200', '2024-02-03', ':com', 'css, html', 7);

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
  `id_poster` int(11) NOT NULL,
  `e_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_post`
--

INSERT INTO `job_post` (`id`, `brief_desc`, `full_desc`, `qualifications`, `date`, `salary`, `location`, `condidats_number`, `metakey`, `state`, `id_poster`, `e_link`) VALUES
(1, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, 'https://www.e-smarttec.com/'),
(2, 'job2', 'job2 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, 'https://www.amazon.com'),
(3, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(4, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(5, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(6, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(7, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(8, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(9, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(10, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(11, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(12, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(13, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, ''),
(14, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '');

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
-- Structure de la table `parcour`
--

CREATE TABLE `parcour` (
  `id` int(11) NOT NULL,
  `id_u` int(11) NOT NULL,
  `nom_etablissement` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `diplome` varchar(255) NOT NULL,
  `domaine` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parcour`
--

INSERT INTO `parcour` (`id`, `id_u`, `nom_etablissement`, `date_debut`, `date_fin`, `diplome`, `domaine`) VALUES
(1, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(2, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(3, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(4, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(5, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(6, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(7, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(8, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(9, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(10, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(11, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11');

-- --------------------------------------------------------

--
-- Structure de la table `upvotes`
--

CREATE TABLE `upvotes` (
  `id` int(11) NOT NULL,
  `id_u` int(11) NOT NULL,
  `id_o` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
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
(1, 'admin', 'admin', 'admin', 'path', 'tunis', 'm', 'admin', '2023-11-16', 100000, '{\"nom_etablissement\":\"u00c9cole Polytechnique Fu00e9du00e9rale de Lausanne\",\"date_debut\":\"2020-09-01\",\"diplome\":\"Diplu00f4me d\'ingu00e9nieur\",\"domaine\":\"Informatique\",\"0\":{\"nom_etablissement\":\"Universit\\u00e9 de Tunis\",\"date_debut\":\"2023-09-01\",\"diplome\":\"Master en informatique\",\"domaine\":\"Informatique\"},\"1\":{\"nom_etablissement\":\"Entreprise XYZ\",\"date_debut\":\"2024-01-01\",\"diplome\":\"Ing\\u00e9nieur en informatique\",\"domaine\":\"Informatique\"},\"2\":{\"nom_etablissement\":\"Entreprise XYZ\",\"date_debut\":\"2024-01-01\",\"diplome\":\"Ing\\u00e9nieur en informatique\",\"domaine\":\"Informatique\"}}24106509,21416878,25200959', '21416878', NULL, 'Voyages,Photographie,Cuisine,Sport,Lecture,Art,Technologie,Musique,Bénévolat,Science,Cinéma/TV,Mode,Jeux,Langues', 'Voyages,Photographie,Cuisine,Sport,Lecture,Art,Technologie,Musique,Bénévolat,Science,Cinéma/TV,Mode,Jeux,Langues', NULL),
(7, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad4@gmail.com', '', '', '', '', '0000-00-00', 0, '{\"nom_etablissement\":\"Entreprise abc\",\"date_debut\":\"2023-01-01\",\"diplome\":\"Ing\\u00e9nieur en informatique\",\"domaine\":\"Informatique appliqu\\u00e9e\"}', NULL, NULL, NULL, '', NULL),
(8, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(9, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.come', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(10, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comei', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(11, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comeil', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(12, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comeil9', '', '', '', '', '0000-00-00', 0, '24106509', NULL, NULL, NULL, '', NULL),
(13, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comeil9k', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(14, 'abiz', 'b88e9ea8be0dacc2dd7a58f471be601d', 'ab@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(15, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(16, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.come', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(17, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.come2', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(18, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.come23', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(20, 'abiz1', 'be49df05c2a2f03c425af273c2eb664f', 'abdelazizmsaad2@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(26, 'admin22', 'admin22', 'admin22', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(27, 'testid', 'testid', 'testid', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(28, 'tes_s', 'tes_s', 'tes_s', '', 'tes_s', 'tes_s', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, NULL, NULL);

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
-- Index pour la table `parcour`
--
ALTER TABLE `parcour`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `upvotes`
--
ALTER TABLE `upvotes`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `job_post`
--
ALTER TABLE `job_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
-- AUTO_INCREMENT pour la table `parcour`
--
ALTER TABLE `parcour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `upvotes`
--
ALTER TABLE `upvotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
