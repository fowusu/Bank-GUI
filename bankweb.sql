-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2019 at 04:20 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accno` char(10) NOT NULL,
  `name` char(20) NOT NULL,
  `address` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accno`, `name`, `address`) VALUES
('CM0', 'farhan', 'uk'),
('CM1', 'accno2', 'london'),
('SM0', 'accno3', 'london');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `accno` char(10) NOT NULL,
  `amount` int(20) NOT NULL,
  `date` date NOT NULL,
  `type` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`accno`, `amount`, `date`, `type`) VALUES
('CM0', 100000, '2019-05-10', 'D'),
('CM0', 1000, '2019-05-10', 'W'),
('CM0', 10000, '2019-05-10', 'W'),
('CM0', 10000, '2019-05-10', 'W'),
('CM0', 79000, '2019-05-10', 'W'),
('CM0', 100, '2019-05-10', 'D'),
('CM0', 100, '2019-05-10', 'D'),
('CM0', 1000, '2019-05-10', 'D'),
('CM0', 50, '2019-05-10', 'D'),
('CM0', 100000, '2019-05-10', 'D'),
('CM0', 100000, '2019-05-10', 'W'),
('CM0', 50, '2019-05-10', 'D'),
('CM0', 100000, '2019-05-10', 'D'),
('CM0', 10000, '2019-05-10', 'D'),
('CM0', 10, '2019-05-10', 'D'),
('CM0', 0, '2019-05-10', 'D'),
('CM0', 100, '2019-05-10', 'D'),
('CM0', 100, '2019-05-10', 'D'),
('CM0', 100000, '2019-05-10', 'W'),
('CM0', 100000, '2019-05-10', 'W'),
('CM0', 100000, '2019-05-10', 'D'),
('CM0', 100000, '2019-05-10', 'W'),
('CM0', 100000, '2019-05-10', 'D'),
('CM0', 100, '2019-05-10', 'D'),
('CM0', 100, '2019-05-10', 'D'),
('CM0', 100, '2019-05-10', 'D'),
('CM0', 11810, '2019-05-10', 'D'),
('CM0', 1000, '2019-05-10', 'W'),
('CM0', 22620, '2019-05-10', 'W'),
('CM0', 100000, '2019-05-10', 'D'),
('CM0', 555, '2019-05-10', 'W'),
('CM0', 99446, '2019-05-10', 'W'),
('CM0', 1, '2019-05-10', 'D'),
('CM0', 1, '2019-05-10', 'D'),
('CM0', 123, '2019-05-10', 'D'),
('CM0', 100, '2019-05-20', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `accno` char(10) NOT NULL,
  `username` char(20) NOT NULL,
  `password` char(30) NOT NULL,
  `role` int(10) NOT NULL,
  `Active` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`accno`, `username`, `password`, `role`, `Active`) VALUES
('admin', 'admin', 'admin', 2, 1),
('CM0', 'accno1', 'a', 1, 1),
('CM1', 'accno2', 'a', 1, 1),
('SM0', 'accno3', 'a', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
