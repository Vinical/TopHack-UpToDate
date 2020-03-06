-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2020 at 06:17 PM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TopHack`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categorie`
--

CREATE TABLE IF NOT EXISTS `Categorie` (
  `catID` int(11) NOT NULL,
  `catDes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HackArt`
--

CREATE DATABASE TopHack;

USE TopHack;

CREATE TABLE IF NOT EXISTS `HackArt` (
  `hackID` int(11) NOT NULL,
  `hackCat` varchar(255) DEFAULT NULL,
  `hackLang` varchar(255) DEFAULT NULL,
  `pubDate` date DEFAULT NULL,
  `lasUpdated` date DEFAULT NULL,
  `hackLikes` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `catID` int(11) DEFAULT NULL,
  `Liked` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HackVid`
--

CREATE TABLE IF NOT EXISTS `HackVid` (
  `vidID` int(11) NOT NULL,
  `vidLang` varchar(255) DEFAULT NULL,
  `vidPubDate` date DEFAULT NULL,
  `lasUpdated` date DEFAULT NULL,
  `vidLikes` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `catID` int(11) DEFAULT NULL,
  `Liked` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `userID` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `userAge` int(11) DEFAULT NULL,
  `userCity` varchar(255) DEFAULT NULL,
  `userState` varchar(255) DEFAULT NULL,
  `userCountry` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `View`
--

CREATE TABLE IF NOT EXISTS `View` (
  `viewID` int(11) NOT NULL,
  `viewTime` varchar(255) DEFAULT NULL,
  `hackID` int(11) DEFAULT NULL,
  `vidID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `HackArt`
--
ALTER TABLE `HackArt`
  ADD PRIMARY KEY (`hackID`),
  ADD KEY `catID` (`catID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `HackVid`
--
ALTER TABLE `HackVid`
  ADD PRIMARY KEY (`vidID`),
  ADD KEY `catID` (`catID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `View`
--
ALTER TABLE `View`
  ADD PRIMARY KEY (`viewID`),
  ADD KEY `hackID` (`hackID`),
  ADD KEY `vidID` (`vidID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `HackArt`
--
ALTER TABLE `HackArt`
  ADD CONSTRAINT `HackArt_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `Categorie` (`catID`),
  ADD CONSTRAINT `HackArt_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);

--
-- Constraints for table `HackVid`
--
ALTER TABLE `HackVid`
  ADD CONSTRAINT `HackVid_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `Categorie` (`catID`),
  ADD CONSTRAINT `HackVid_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);

--
-- Constraints for table `View`
--
ALTER TABLE `View`
  ADD CONSTRAINT `View_ibfk_1` FOREIGN KEY (`hackID`) REFERENCES `HackArt` (`hackID`),
  ADD CONSTRAINT `View_ibfk_2` FOREIGN KEY (`vidID`) REFERENCES `HackVid` (`vidID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
