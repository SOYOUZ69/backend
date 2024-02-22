-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 22 fév. 2024 à 03:33
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
  `state` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `blog_post`
--

INSERT INTO `blog_post` (`id`, `bief_desc`, `full_desc`, `metakey`, `id_poster`, `state`, `date`) VALUES
(1, 'post 1', 'teste_esit', 'test,test,test,test', 1, 1, '2024-02-21');

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
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `object_type`, `id_object`, `id_u`, `message`, `date`) VALUES
(1, 'blog', 1, 1, 'mesage', '2024-02-19 00:00:00'),
(2, 'blog', 1, 1, 'coment 2', '0000-00-00 00:00:00'),
(3, 'blog', 1, 1, 'comment test time', '0000-00-00 00:00:00');

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

--
-- Déchargement des données de la table `favoris`
--

INSERT INTO `favoris` (`id`, `object_type`, `id_object`, `id_u`, `date`) VALUES
(1, 'job', 1, 1, '2024-02-15'),
(2, 'job', 3, 1, '2024-02-15');

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
  `trailer` text DEFAULT NULL,
  `price` text NOT NULL,
  `date` date NOT NULL,
  `company_url` text NOT NULL,
  `metakey` varchar(255) DEFAULT NULL,
  `id_poster` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `nom`, `description`, `cover`, `link`, `trailer`, `price`, `date`, `company_url`, `metakey`, `id_poster`, `state`) VALUES
(1, 'formation1', 'desc1', 'admin.png', 'https://www.e-smarttec.com/', 'trailer1', '22', '2023-12-15', 'url1', 'formation,e-learning,en ligne', 14, 1),
(2, 'formation2_test', 'desc2', 'https://media.licdn.com/dms/image/D4D12AQGUFz6pDZzKYQ/article-cover_image-shrink_720_1280/0/1658400820592?e=2147483647&v=beta&t=_V1yQDtefqFfzTDr6M1FSfgMz1xNSYg4KUknhcl3-xY', 'https://www.e-smarttec.com/', 'trailer2', '22', '2023-12-15', 'url2', 'formation2,e-learning2,en ligne2', 14, 1),
(3, 'formation3', 'desc3', 'https://www.ovhcloud.com/sites/default/files/styles/large_screens_1x/public/2022-04/whatis_internet-of-things.png', 'https://www.e-smarttec.com/', 'trailer3', '22', '2023-12-15', 'url3', 'formation3,e-learning3', 14, 1),
(4, 'formation', 'dsc', '1706915041_halo-dark-clouds-d9cgeojpb60w37x.png', 'https://www.e-smarttec.com/', '', '200', '2023-12-15', 'tesla', 'x', 1, 1),
(5, 'formation', 'dsc', '1706915163_halo-dark-clouds-d9cgeojpb60w37x.png', 'https://www.e-smarttec.com/', '', '200', '2023-12-15', 'tesla', 'x', 1, 1),
(6, 'formation', 'dsc', '1706915673_halo-dark-clouds-d9cgeojpb60w37x.png', 'https://www.e-smarttec.com/', '', '200', '2023-12-15', 'tesla', 'x', 1, 1),
(7, 'formation', 'dsc', '1706915676_halo-dark-clouds-d9cgeojpb60w37x.png', 'https://www.e-smarttec.com/', '', '200', '2023-12-15', 'tesla', 'x', 1, 1),
(8, 'formation', 'dsc', '1706917475_halo-dark-clouds-d9cgeojpb60w37x.png', 'https://www.e-smarttec.com/', '', '200', '2023-12-15', 'tesla', 'x', 1, 1),
(9, 'nom', 'description', '1706937912_cover.jpg', 'https://www.e-smarttec.com/', '', '200', '2025-03-03', ':com', 'css, html', 7, 1),
(10, 'test load', 'load more limit', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpnGWSZ00Lo3LcBVH1WyEhCvso0GxYpELgMWcj29wnjA&s', 'https://www.e-smarttec.com/', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpnGWSZ00Lo3LcBVH1WyEhCvso0GxYpELgMWcj29wnjA&s', '255', '2024-02-23', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpnGWSZ00Lo3LcBVH1WyEhCvso0GxYpELgMWcj29wnjA&s', 'test metakey,1', 1, 1),
(11, 'rechercher', 'load more limit1', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpnGWSZ00Lo3LcBVH1WyEhCvso0GxYpELgMWcj29wnjA&s', 'https://www.e-smarttec.com/', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpnGWSZ00Lo3LcBVH1WyEhCvso0GxYpELgMWcj29wnjA&s', '255', '2024-02-23', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpnGWSZ00Lo3LcBVH1WyEhCvso0GxYpELgMWcj29wnjA&s', 'test metakey,1', 1, 1),
(12, 'omar', 'desc', '1707951092_cover.jpg', 'https://www.e-smarttec.com/', '', '233', '2024-02-14', 'link', 'css', 1, 1),
(14, 'test_ii', 'deskiiii', '1708238461_cover.jpg', 'https://www.e-smarttec.com/', NULL, '211', '2024-02-18', 'linkiii', 'css', 1, 1),
(15, 'afd', 'ffs', '1708238632_cover.jpg', 'https://www.e-smarttec.com/', NULL, '5555', '2024-02-22', 'ffff', 'html, css,iso9001', 1, 0),
(16, 'afd', 'ffs', '1708238668_cover.jpg', 'https://www.e-smarttec.com/', NULL, '5555', '2024-02-22', 'ffff', 'html, so7lob', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `job_application`
--

CREATE TABLE `job_application` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `id_u` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_application`
--

INSERT INTO `job_application` (`id`, `job_id`, `id_u`, `date`) VALUES
(1, 16, 1, '2024-02-18'),
(2, 16, 7, '2024-02-18'),
(3, 16, 8, '2024-02-18'),
(4, 16, 9, '2024-02-18');

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
  `e_link` text NOT NULL,
  `job_status` text NOT NULL,
  `job_type` text NOT NULL,
  `domaine` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_post`
--

INSERT INTO `job_post` (`id`, `brief_desc`, `full_desc`, `qualifications`, `date`, `salary`, `location`, `condidats_number`, `metakey`, `state`, `id_poster`, `e_link`, `job_status`, `job_type`, `domaine`) VALUES
(1, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse,iso,css', 1, 7, 'https://www.e-smarttec.com/', '', '', ''),
(2, 'job2', 'job2 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, 'https://www.amazon.com', '', '', ''),
(3, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(4, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(5, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(6, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(7, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(8, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(9, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(10, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(11, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(12, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(13, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(14, 'job1', 'job1 full', 'qualifications ', '2024-01-19', '2000', 'tunisia', 20, 'qhse', 0, 7, '', '', '', ''),
(16, 'test_update', 'Nouvelle description complète', 'Nouveau diplôme', '2024-02-18', '300USD', 'PARIS', 0, 'CCC#DDD', 0, 1, '', 'Présence optionnelle', 'Nouvelle collaboration', 'Nouvelle Informatique'),
(17, 'Nouvelle description courte', 'Nouvelle description complète', 'Nouveau diplôme', '0000-00-00', '300USD', 'PARIS', 0, 'CCC#DDD', 0, 1, '', 'Présence optionnelle', 'Nouvelle collaboration', 'Nouvelle Informatique');

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
(11, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(12, 7, 'Nom1', '2022-01-01', '2022-12-31', 'Bac', 'Informatique'),
(13, 7, 'Nom2', '2023-01-01', '2023-12-31', 'Master', 'Ingénierie'),
(25, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(26, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(27, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(28, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(29, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(30, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(31, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(32, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(33, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(34, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(35, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(36, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(37, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(38, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(39, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(40, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(41, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(42, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(43, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(44, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(45, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(46, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(47, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(48, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(49, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(50, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(51, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(52, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(53, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(54, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(55, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(56, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(57, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(58, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(59, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(60, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(61, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(62, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(63, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(64, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(65, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(66, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(67, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(68, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(69, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(70, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(71, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(72, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(73, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(74, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(75, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(76, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(77, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(78, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(79, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(80, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(81, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(82, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(83, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(84, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(85, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(86, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(87, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(88, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(89, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(90, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(91, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(92, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(93, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(94, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(95, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(96, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(97, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(98, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(99, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(100, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(101, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(102, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(103, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(104, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(105, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(106, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(107, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(108, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(109, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(110, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(111, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(112, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(113, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(114, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(115, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(116, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(117, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(118, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(119, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(120, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(121, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(122, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(123, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(124, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(125, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(126, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(127, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(128, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(129, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(130, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(131, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(132, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(133, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(134, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(135, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(136, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(137, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(138, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(139, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(140, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(141, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(142, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(143, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(144, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(145, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(146, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(147, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(148, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(149, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(150, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(151, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(152, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(153, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(154, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(155, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(156, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(157, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(158, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(159, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(160, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(161, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(162, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(163, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(164, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(165, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(166, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(167, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(168, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(169, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(170, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(171, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(172, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(173, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(174, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(175, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(176, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(177, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(178, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(179, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(180, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(181, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(182, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(183, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(184, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(185, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(186, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(187, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(188, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(189, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(190, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(191, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(192, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(193, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(194, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(195, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(196, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(197, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(198, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(199, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(200, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(201, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(202, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(203, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(204, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(205, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(206, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(207, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(208, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(209, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(210, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(211, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(212, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(213, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(214, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(215, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(216, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(217, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(218, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(219, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(220, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(221, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(222, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(223, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(224, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(225, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(226, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(227, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(228, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(229, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(230, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(231, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(232, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(233, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(234, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(235, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(236, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(237, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(238, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(239, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(240, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(241, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(242, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(243, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(244, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(245, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(246, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(247, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(248, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(249, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(250, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(251, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(252, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(253, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(254, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(255, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(256, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(257, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(258, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(259, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(260, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(261, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(262, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(263, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(264, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(265, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(266, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(267, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(268, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(269, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(270, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(271, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(272, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(273, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(274, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(275, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(276, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(277, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(278, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(279, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(280, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(281, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(282, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(283, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(284, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(285, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(286, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(287, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(288, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(289, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(290, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(291, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(292, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(293, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(294, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(295, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(296, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(297, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(298, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(299, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(300, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(301, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(302, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(303, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(304, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(305, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(306, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(307, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(308, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(309, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(310, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(311, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(312, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(313, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(314, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(315, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(316, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(317, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(318, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(319, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(320, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(321, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(322, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(323, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(324, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(325, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(326, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(327, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(328, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(329, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(330, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(331, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(332, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(333, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(334, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(335, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(336, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10'),
(337, 1, 'test_parcour11', '2024-09-01', '2024-09-15', 'test11', 'domaine11'),
(338, 1, 'test_parcour1', '2024-02-12', '2024-02-24', 'test1', 'domaine1'),
(339, 1, 'test_parcour2', '2024-03-01', '2024-03-15', 'test2', 'domaine2'),
(340, 1, 'test_parcour3', '2024-03-20', '2024-04-05', 'test3', 'domaine3'),
(341, 1, 'test_parcour4', '2024-04-10', '2024-04-25', 'test4', 'domaine4'),
(342, 1, 'test_parcour5', '2024-05-01', '2024-05-15', 'test5', 'domaine5'),
(343, 1, 'test_parcour6', '2024-05-20', '2024-06-05', 'test6', 'domaine6'),
(344, 1, 'test_parcour7', '2024-06-10', '2024-06-25', 'test7', 'domaine7'),
(345, 1, 'test_parcour8', '2024-07-01', '2024-07-15', 'test8', 'domaine8'),
(346, 1, 'test_parcour9', '2024-07-20', '2024-08-05', 'test9', 'domaine9'),
(347, 1, 'test_parcour10', '2024-08-10', '2024-08-25', 'test10', 'domaine10');

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

--
-- Déchargement des données de la table `upvotes`
--

INSERT INTO `upvotes` (`id`, `id_u`, `id_o`, `type`) VALUES
(2, 2, 2, 'comment'),
(3, 1, 1, 'comment');

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
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bac` tinyint(1) DEFAULT NULL,
  `interet` varchar(255) DEFAULT NULL,
  `competence` varchar(255) DEFAULT NULL,
  `cv` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `picture`, `country`, `genre`, `type`, `date_birth`, `points`, `listparcour`, `phone`, `bac`, `interet`, `competence`, `cv`) VALUES
(1, 'admine', 'admin', 'admin', 'admin.png', 'tunis', 'm', 'admin', '2023-11-16', 100000, '{\"nom_etablissement\":\"u00c9cole Polytechnique Fu00e9du00e9rale de Lausanne\",\"date_debut\":\"2020-09-01\",\"diplome\":\"Diplu00f4me d\'ingu00e9nieur\",\"domaine\":\"Informatique\",\"0\":{\"nom_etablissement\":\"Universit\\u00e9 de Tunis\",\"date_debut\":\"2023-09-01\",\"diplome\":\"Master en informatique\",\"domaine\":\"Informatique\"},\"1\":{\"nom_etablissement\":\"Entreprise XYZ\",\"date_debut\":\"2024-01-01\",\"diplome\":\"Ing\\u00e9nieur en informatique\",\"domaine\":\"Informatique\"},\"2\":{\"nom_etablissement\":\"Entreprise XYZ\",\"date_debut\":\"2024-01-01\",\"diplome\":\"Ing\\u00e9nieur en informatique\",\"domaine\":\"Informatique\"}}24106509,21416878,25200959', '+126 24106509', NULL, 'Voyages,      Photographie,      Cuisine,      Sport,      Lecture,      Art,      Technologie,      Musique,      Bénévolat,      Science,      Cinéma/TV,      Mode,      Jeux,      Langues', 'Voyages,Photographie,Cuisine,Sport,Lecture,Art,Technologie,Musique,Bénévolat,Science,Cinéma/TV,Mode,Jeux,Langues', '1708214358_Catalogue-de-formation-SMARTTEC-2022.pdf'),
(7, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad4@gmail.com', '1708117833_admin.png', '', '', '', '0000-00-00', 0, '{\"nom_etablissement\":\"Entreprise abc\",\"date_debut\":\"2023-01-01\",\"diplome\":\"Ing\\u00e9nieur en informatique\",\"domaine\":\"Informatique appliqu\\u00e9e\"}', NULL, NULL, NULL, '', '1708117794_admin.png'),
(8, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(9, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.come', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(10, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comei', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(11, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comeil', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(12, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comeil9', '', '', '', '', '0000-00-00', 0, '24106509', NULL, NULL, NULL, '', NULL),
(13, 'Omar', '82c4d0c62c2d5eb27bf42b570d0d05a8', 'Omarmsaad8@gmail.comeil9k', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(14, 'abiz', 'b88e9ea8be0dacc2dd7a58f471be601d', 'ab@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, NULL, NULL, '', NULL),
(15, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.com', '', '', '', '', '0000-00-00', 0, NULL, NULL, 0, NULL, '', NULL),
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
-- Index pour la table `job_application`
--
ALTER TABLE `job_application`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `favoris`
--
ALTER TABLE `favoris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `job_application`
--
ALTER TABLE `job_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `job_post`
--
ALTER TABLE `job_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT pour la table `upvotes`
--
ALTER TABLE `upvotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
