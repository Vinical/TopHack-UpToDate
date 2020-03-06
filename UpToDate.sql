-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2020 at 06:18 PM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `UpToDate`
--

-- --------------------------------------------------------

--
-- Table structure for table `Match`
--
CREATE DATABASE UpToDate;

USE UpToDate;

CREATE TABLE IF NOT EXISTS `Match` (
  `MatchID` int(11) NOT NULL,
  `RestaurantID` int(11) DEFAULT NULL,
  `MatchDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MatchLink`
--

CREATE TABLE IF NOT EXISTS `MatchLink` (
  `MatchLinkID` int(11) NOT NULL,
  `MatchID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Restaurant`
--

CREATE TABLE IF NOT EXISTS `Restaurant` (
  `RestaurantID` int(11) NOT NULL,
  `RestaurantLocation` varchar(255) DEFAULT NULL,
  `RestaurantRating` int(11) DEFAULT NULL,
  `HoursOpen` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `UserPhoneNumber` varchar(15) DEFAULT NULL,
  `UserPassword` varchar(15) DEFAULT NULL,
  `LinkedIn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Match`
--
ALTER TABLE `Match`
  ADD PRIMARY KEY (`MatchID`),
  ADD KEY `RestaurantID` (`RestaurantID`);

--
-- Indexes for table `MatchLink`
--
ALTER TABLE `MatchLink`
  ADD PRIMARY KEY (`MatchLinkID`),
  ADD KEY `MatchID` (`MatchID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `Restaurant`
--
ALTER TABLE `Restaurant`
  ADD PRIMARY KEY (`RestaurantID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Match`
--
ALTER TABLE `Match`
  ADD CONSTRAINT `Match_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `Restaurant` (`RestaurantID`);

--
-- Constraints for table `MatchLink`
--
ALTER TABLE `MatchLink`
  ADD CONSTRAINT `MatchLink_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `Match` (`MatchID`),
  ADD CONSTRAINT `MatchLink_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
