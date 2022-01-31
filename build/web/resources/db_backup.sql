-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2022 at 05:25 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ip`
--

-- --------------------------------------------------------

--
-- Table structure for table `ecentre`
--

CREATE TABLE `ecentre` (
  `id` int(11) NOT NULL,
  `centreName` varchar(50) NOT NULL,
  `centreLoc` varchar(50) NOT NULL,
  `capacity` int(4) NOT NULL,
  `maxCapacity` int(11) DEFAULT NULL,
  `Activity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecentre`
--

INSERT INTO `ecentre` (`id`, `centreName`, `centreLoc`, `capacity`, `maxCapacity`, `Activity`) VALUES
(4, 'Evac Center #1', 'Johor', 5250, 5250, 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `reliefs`
--

CREATE TABLE `reliefs` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `userID` int(3) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `location` varchar(10) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `state` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reliefs`
--

INSERT INTO `reliefs` (`id`, `name`, `userID`, `description`, `location`, `startDate`, `endDate`, `state`) VALUES
(1, 'Batu Caves Relief!', 1, 'Batu Caves was hit by a strong wave this year and needed help.', 'Selangor', '2022-01-01', '2022-02-01', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `reportID` int(11) NOT NULL,
  `location` varchar(30) NOT NULL,
  `disaster_type` varchar(30) NOT NULL,
  `asst_type` varchar(30) NOT NULL,
  `asst_source` varchar(30) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`reportID`, `location`, `disaster_type`, `asst_type`, `asst_source`, `date`) VALUES
(1, 'Batu Berendam, Melaka', 'Flood', 'Food', 'Community', '2022-01-31'),
(2, 'Johor Bahru, Johor', 'Earthquake', 'Shelter', 'Government', '2022-01-28'),
(4, 'Kedah', 'Storm', 'Food', 'Community', '2021-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `userType` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `userType`) VALUES
(1, 'admin1', 'admin123', 'admin'),
(2, 'meor', '12345', 'user'),
(3, 'admin2', 'admin321', 'admin'),
(4, 'agency1', 'agent123', 'agency');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ecentre`
--
ALTER TABLE `ecentre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reliefs`
--
ALTER TABLE `reliefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`reportID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ecentre`
--
ALTER TABLE `ecentre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reliefs`
--
ALTER TABLE `reliefs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `reportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reliefs`
--
ALTER TABLE `reliefs`
  ADD CONSTRAINT `reliefs_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
