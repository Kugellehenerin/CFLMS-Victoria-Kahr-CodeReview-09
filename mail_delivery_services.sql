-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2020 at 03:42 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mail delivery services`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `street`, `city`) VALUES
(1, 'Max', 'Aras', 'Alpenstraße 12', '2020 Graz'),
(2, 'Petra', 'Viehauser', 'Grazerstraße 2', '2020 Graz'),
(3, 'Markus', 'Winter', 'Römerstraße 23', '2020 Graz'),
(4, 'Michael', 'Rieder', 'Langstraße 23', '3030 Wien'),
(5, 'Daniela', 'Ressel', 'Wienerstraße 2', '3030 Wien');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`) VALUES
(1, 'Rasit', 'Oberstreiner'),
(2, 'David', 'Wilfling'),
(3, 'Eren', 'Jäger'),
(4, 'Krista', 'Reiss'),
(5, 'Ymir', 'Ackermann');

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `enroll_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `enroll_type` enum('STORE_PICKUP','START_DELIVER','END_DELIVERY','STORE_HANDOUT') DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`enroll_id`, `package_id`, `enroll_type`, `time`, `employee_id`, `location_id`) VALUES
(10, 3, 'STORE_PICKUP', '2020-11-08 13:00:26', 1, 1),
(11, 3, 'START_DELIVER', '2020-11-08 13:00:34', 1, 1),
(12, 3, 'END_DELIVERY', '2020-11-09 13:00:55', 2, 2),
(13, 3, 'STORE_HANDOUT', '2020-11-09 13:01:17', 2, 2),
(14, 4, 'STORE_PICKUP', '2020-11-08 13:02:15', 3, 1),
(15, 4, 'START_DELIVER', '2020-11-08 13:02:26', 3, 1),
(16, 4, 'END_DELIVERY', '2020-11-09 13:02:35', 4, 2),
(17, 4, 'STORE_HANDOUT', '2020-11-09 13:02:37', 4, 2),
(18, 5, 'STORE_PICKUP', '2020-11-08 13:05:37', 5, 1),
(19, 5, 'START_DELIVER', '2020-11-08 13:06:49', 5, 1),
(20, 5, 'END_DELIVERY', '2020-11-09 13:07:03', 4, 2),
(21, 5, 'STORE_HANDOUT', '2020-11-09 13:08:17', 4, 2),
(22, 6, 'STORE_PICKUP', '2020-11-08 13:10:10', 4, 2),
(23, 6, 'START_DELIVER', '2020-11-08 13:10:32', 4, 2),
(24, 6, 'END_DELIVERY', '2020-11-09 13:10:48', 1, 1),
(25, 6, 'STORE_HANDOUT', '2020-11-09 13:11:42', 3, 1),
(26, 7, 'STORE_PICKUP', '2020-11-08 13:12:29', 2, 2),
(27, 7, 'START_DELIVER', '2020-11-08 13:13:03', 2, 2),
(28, 7, 'END_DELIVERY', '2020-11-09 13:13:15', 5, 1),
(29, 7, 'STORE_HANDOUT', '2020-11-09 13:13:35', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_type` enum('LETTER','PACKAGE') DEFAULT NULL,
  `delivery_type` enum('STANDARD','EXPRESS') DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `tracking_number` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `package_type`, `delivery_type`, `sender_id`, `recipient_id`, `weight`, `tracking_number`, `price`, `start_date`, `end_date`) VALUES
(3, 'LETTER', 'STANDARD', 1, 1, '50g', 2165847, 5, '2020-11-08', '2020-11-09'),
(4, 'LETTER', 'EXPRESS', 2, 2, '50g', 246983, 10, '2020-11-08', '2020-11-09'),
(5, 'PACKAGE', 'EXPRESS', 3, 3, '1.5kg', 546321, 20, '2020-11-08', '2020-11-09'),
(6, 'PACKAGE', 'STANDARD', 4, 4, '20.0', 254639, 15, '2020-11-08', '2020-11-09'),
(7, 'LETTER', 'EXPRESS', 5, 5, '50g', 546321, 5, '2020-11-08', '2020-11-09');

-- --------------------------------------------------------

--
-- Table structure for table `postoffice`
--

CREATE TABLE `postoffice` (
  `postoffice_id` int(11) NOT NULL,
  `postoffice_name` varchar(255) DEFAULT NULL,
  `postoffice_street` varchar(255) DEFAULT NULL,
  `postoffice_city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postoffice`
--

INSERT INTO `postoffice` (`postoffice_id`, `postoffice_name`, `postoffice_street`, `postoffice_city`) VALUES
(1, 'Filiale Graz', 'Theaterstraße 22', '2020 Graz'),
(2, 'Filiale WIEN', 'Hauptstraße 25', '3030 Wien');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `first_name`, `last_name`, `street`, `city`) VALUES
(1, 'Maria', 'Aras', 'Hauptstraße 2', '3030 Wien'),
(2, 'Tobias', 'Viehhauser', 'Baumstraße 2', '3030 Wien'),
(3, 'Frank', 'Winter', 'Laufstraße 2', '3030 Wien'),
(4, 'Mike', 'Winter', 'Engelstraße 33', '2020 Graz'),
(5, 'Manuel', 'Ressel', 'Bahnhofstraße 2', '2020 Graz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`enroll_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `postoffice`
--
ALTER TABLE `postoffice`
  ADD PRIMARY KEY (`postoffice_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `enroll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `postoffice`
--
ALTER TABLE `postoffice`
  MODIFY `postoffice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `location_id` FOREIGN KEY (`location_id`) REFERENCES `postoffice` (`postoffice_id`),
  ADD CONSTRAINT `package_id` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `recipient_id` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`recipient_id`),
  ADD CONSTRAINT `sender_id` FOREIGN KEY (`sender_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
