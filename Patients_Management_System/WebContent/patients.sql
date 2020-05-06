-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 06:57 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patient_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pID` int(11) NOT NULL,
  `pNic` varchar(11) NOT NULL,
  `pName` varchar(20) NOT NULL,
  `pAddress` varchar(30) NOT NULL,
  `pEmail` varchar(30) NOT NULL,
  `pTele` varchar(30) NOT NULL,
  `pAge` int(5) NOT NULL,
  `pStatus` varchar(40) NOT NULL,
  `pAllergic` varchar(10) NOT NULL,
  `pWard` varchar(10) NOT NULL,
  `pBed` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pID`, `pNic`, `pName`, `pAddress`, `pEmail`, `pTele`, `pAge`, `pStatus`, `pAllergic`, `pWard`, `pBed`) VALUES
(1, '276236632V', 'Shenaya', 'Colombo', 'Shena@gmail.com', '0772332353', 20, 'Chest Pain', 'salbitamol', 'W06', 12),
(3, '356756632V', 'Nimali', 'Gampaha', 'mali@gmail.com', '0768383939', 40, 'Osteoporosis', 'penicillin', 'W06', 20),
(4, '3236456902V', 'Nayomi', 'Kaluthara', 'nayo@gmail.com', '0772345617', 30, 'Tuberculosis', 'Aspirin', 'W02', 1),
(5, '317262321V', 'Tharindu', 'Gampaha', 'shan@gmail.com', '0722384932', 30, 'pneumonia', 'Metformin', 'W01', 4),
(6, '867575647V', 'Avril', 'Colombo', 'avr@gmail.com', '077324632', 20, 'High Fever', 'No', 'W10', 20),
(8, '68785744V', 'Anne', 'Kandy', 'anne@gmail.com', '07846747', 30, 'Dengu Fever', 'Asprine', 'W10', 15),
(11, '468364823V', 'Milla', 'Colombo', 'mili@gmail.com', '0772339323', 37, 'Influenza', 'No', 'W07', 21),
(12, '21312313V', 'Jagath', 'Gampaha', 'jovi@gmail.com', '0776768', 38, 'flu', 'No', 'W09', 22),
(21, '3283828V', 'Erin', 'Colombo', 'eri@gmail.com', '1234323', 23, 'Flu', 'No', 'W07', 12),
(27, '72362383V', 'Terry', 'Colombo', 't@gmail.com', '237382723', 47, 'Diabetics', 'suborbital', 'W03', 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
