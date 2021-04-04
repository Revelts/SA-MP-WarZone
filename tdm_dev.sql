-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 172.17.0.1:3306
-- Generation Time: Apr 04, 2021 at 11:08 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tdm_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `banned_list`
--

CREATE TABLE `banned_list` (
  `ID` int(11) NOT NULL,
  `IP` varchar(20) NOT NULL DEFAULT '0.0.0.0',
  `Username` varchar(25) NOT NULL DEFAULT 'Stranger',
  `Issuer` varchar(25) NOT NULL DEFAULT 'Admin',
  `Reason` varchar(128) NOT NULL DEFAULT 'None',
  `Date` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_accounts`
--

CREATE TABLE `player_accounts` (
  `ID` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Salt` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `IP` varchar(20) DEFAULT '127.0.0.1',
  `RegisterDate` int(11) DEFAULT '0',
  `Score` int(11) DEFAULT '1',
  `Experience` float DEFAULT '0',
  `Money` int(11) DEFAULT '0',
  `Health` int(11) DEFAULT '100',
  `Armour` int(11) DEFAULT '100',
  `Admin` int(11) DEFAULT '0',
  `Team` int(11) DEFAULT '255',
  `Skin` int(11) NOT NULL DEFAULT '1',
  `Kill` int(11) NOT NULL DEFAULT '0',
  `Death` int(11) NOT NULL DEFAULT '0',
  `Clan` int(11) NOT NULL DEFAULT '-1',
  `ClanRank` int(11) NOT NULL DEFAULT '0',
  `Headshot` float NOT NULL DEFAULT '0',
  `MMR` int(11) NOT NULL DEFAULT '0',
  `MaxHealth` float NOT NULL DEFAULT '100',
  `MaxArmour` float NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_clan`
--

CREATE TABLE `player_clan` (
  `clanID` int(11) NOT NULL,
  `clanName` varchar(128) NOT NULL DEFAULT 'None',
  `clanTag` varchar(10) NOT NULL DEFAULT 'None',
  `clanColor` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_class`
--

CREATE TABLE `player_class` (
  `ID` int(11) NOT NULL,
  `pID` int(11) NOT NULL DEFAULT '-1',
  `pClass` int(11) NOT NULL DEFAULT '0',
  `pClassLevel` int(11) NOT NULL DEFAULT '1',
  `pClassExp` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banned_list`
--
ALTER TABLE `banned_list`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `player_accounts`
--
ALTER TABLE `player_accounts`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `player_clan`
--
ALTER TABLE `player_clan`
  ADD PRIMARY KEY (`clanID`);

--
-- Indexes for table `player_class`
--
ALTER TABLE `player_class`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banned_list`
--
ALTER TABLE `banned_list`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `player_accounts`
--
ALTER TABLE `player_accounts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1084;

--
-- AUTO_INCREMENT for table `player_clan`
--
ALTER TABLE `player_clan`
  MODIFY `clanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- AUTO_INCREMENT for table `player_class`
--
ALTER TABLE `player_class`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
