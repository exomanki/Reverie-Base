-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 26 mars 2024 à 23:55
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
-- Base de données : `reveriehost`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('bank_savings', 'Savings account', 0),
('caution', 'caution', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(35, 'bank_savings', 0, 'char1:58e7a605d5865504217e72ffb4b487f3c1f9a613'),
(36, 'caution', 0, 'char1:58e7a605d5865504217e72ffb4b487f3c1f9a613');

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `banking`
--

CREATE TABLE `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `balance` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Property', 0),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(59, 'property', 'char1:58e7a605d5865504217e72ffb4b487f3c1f9a613', '{}'),
(60, 'user_ears', 'char1:58e7a605d5865504217e72ffb4b487f3c1f9a613', '{}'),
(61, 'user_helmet', 'char1:58e7a605d5865504217e72ffb4b487f3c1f9a613', '{}'),
(62, 'user_glasses', 'char1:58e7a605d5865504217e72ffb4b487f3c1f9a613', '{}'),
(63, 'user_mask', 'char1:58e7a605d5865504217e72ffb4b487f3c1f9a613', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('bread', 'Pain', 1, 0, 1),
('medikit', 'Kit de soin', 2, 0, 1),
('water', 'Eau', 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('unemployed', 'Sans-Emploi', 0),
('unemployed2', 'Civil', 0);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'RSA', 200, '{}', '{}'),
(2, 'unemployed2', 0, 'unemployed2', 'Civil', 200, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Permis Bateau'),
('dmv', 'Code de la route'),
('drive', 'Permis Voiture'),
('drive_bike', 'Permis Moto'),
('drive_truck', 'Permis Camion'),
('weapon', 'Weapon License');

-- --------------------------------------------------------

--
-- Structure de la table `multicharacter_slots`
--

CREATE TABLE `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `outfits`
--

CREATE TABLE `outfits` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `ped` longtext DEFAULT NULL,
  `components` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'State of the car',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ox_inventory`
--

CREATE TABLE `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(50) NOT NULL DEFAULT 'unemployed2',
  `job2_grade` int(11) NOT NULL DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `disabled` tinyint(1) DEFAULT 0,
  `position` varchar(255) DEFAULT '{"x":-1042.11,"y":-2745.12,"z":21.34,"heading":180.0}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `job2`, `job2_grade`, `loadout`, `metadata`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `disabled`, `position`) VALUES
('char1:58e7a605d5865504217e72ffb4b487f3c1f9a613', '{\"black_money\":0,\"bank\":50200,\"money\":0}', 'user', '[]', 'unemployed', 0, 'unemployed2', 0, '[]', '{\"health\":200,\"armor\":0}', 'Exo', 'Manki', '21/10/1993', 'm', 217, '{\"headOverlays\":{\"eyebrows\":{\"opacity\":0,\"style\":0,\"color\":0},\"lipstick\":{\"opacity\":0,\"style\":0,\"color\":0},\"makeUp\":{\"opacity\":0,\"style\":0,\"color\":0},\"blemishes\":{\"opacity\":0,\"style\":0,\"color\":0},\"bodyBlemishes\":{\"opacity\":0,\"style\":0,\"color\":0},\"chestHair\":{\"opacity\":0,\"style\":0,\"color\":0},\"beard\":{\"opacity\":0,\"style\":0,\"color\":0},\"complexion\":{\"opacity\":0,\"style\":0,\"color\":0},\"blush\":{\"opacity\":0,\"style\":0,\"color\":0},\"moleAndFreckles\":{\"opacity\":0,\"style\":0,\"color\":0},\"sunDamage\":{\"opacity\":0,\"style\":0,\"color\":0},\"ageing\":{\"opacity\":0,\"style\":0,\"color\":0}},\"props\":[{\"texture\":-1,\"prop_id\":0,\"drawable\":-1},{\"texture\":-1,\"prop_id\":1,\"drawable\":-1},{\"texture\":-1,\"prop_id\":2,\"drawable\":-1},{\"texture\":-1,\"prop_id\":6,\"drawable\":-1},{\"texture\":-1,\"prop_id\":7,\"drawable\":-1}],\"faceFeatures\":{\"noseBoneHigh\":0,\"noseBoneTwist\":0,\"cheeksBoneWidth\":0,\"noseWidth\":0,\"eyeBrownHigh\":0,\"chinHole\":0,\"nosePeakSize\":0,\"lipsThickness\":0,\"chinBoneLowering\":0,\"cheeksWidth\":0,\"nosePeakHigh\":0,\"neckThickness\":0,\"nosePeakLowering\":0,\"eyesOpening\":0,\"jawBoneBackSize\":0,\"eyeBrownForward\":0,\"chinBoneSize\":0,\"chinBoneLenght\":0,\"jawBoneWidth\":0,\"cheeksBoneHigh\":0},\"headBlend\":{\"shapeSecond\":0,\"skinSecond\":0,\"skinFirst\":0,\"skinMix\":0,\"shapeFirst\":0,\"shapeMix\":0},\"hair\":{\"highlight\":0,\"color\":0,\"style\":0},\"components\":[{\"texture\":0,\"component_id\":0,\"drawable\":0},{\"texture\":0,\"component_id\":1,\"drawable\":0},{\"texture\":0,\"component_id\":2,\"drawable\":0},{\"texture\":0,\"component_id\":3,\"drawable\":0},{\"texture\":0,\"component_id\":4,\"drawable\":0},{\"texture\":0,\"component_id\":5,\"drawable\":0},{\"texture\":0,\"component_id\":6,\"drawable\":0},{\"texture\":0,\"component_id\":7,\"drawable\":0},{\"texture\":0,\"component_id\":8,\"drawable\":0},{\"texture\":0,\"component_id\":9,\"drawable\":0},{\"texture\":0,\"component_id\":10,\"drawable\":0},{\"texture\":0,\"component_id\":11,\"drawable\":0}],\"tattoos\":[],\"model\":\"mp_m_freemode_01\",\"eyeColor\":0}', '[{\"percent\":96.8,\"name\":\"hunger\",\"val\":968000},{\"percent\":97.6,\"name\":\"thirst\",\"val\":976000}]', 0, 0, '{\"x\":25.68791389465332,\"y\":-1347.3099365234376,\"z\":29.4820556640625}');

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Index pour la table `banking`
--
ALTER TABLE `banking`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Index pour la table `multicharacter_slots`
--
ALTER TABLE `multicharacter_slots`
  ADD PRIMARY KEY (`identifier`) USING BTREE,
  ADD KEY `slots` (`slots`) USING BTREE;

--
-- Index pour la table `outfits`
--
ALTER TABLE `outfits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `ox_inventory`
--
ALTER TABLE `ox_inventory`
  ADD UNIQUE KEY `owner` (`owner`,`name`);

--
-- Index pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `banking`
--
ALTER TABLE `banking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10016;

--
-- AUTO_INCREMENT pour la table `outfits`
--
ALTER TABLE `outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
