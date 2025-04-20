
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2025 at 05:25 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donate_life`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `AdminName` varchar(255) DEFAULT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `AdminRegdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `AdminName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Ashok', '9863442248', 'ashok@gmail.com', 'ashok@gmail.com', '2024-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `approved_request`
--

CREATE TABLE `approved_request` (
  `req_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `landmarks` varchar(200) DEFAULT NULL,
  `req_form_path` varchar(255) DEFAULT NULL,
  `approved_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(25) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `approved_request`
--

INSERT INTO `approved_request` (`req_id`, `pid`, `name`, `mobile_number`, `blood_group`, `birth_date`, `gender`, `weight`, `location`, `landmarks`, `req_form_path`, `approved_time`, `status`) VALUES
(55, 31, 'Ashish Khanal', '9491898322', 'B+', '2024-05-17', 'Male', 25.00, 'jkashdsha', '7AgCQ3ceYF', '../admin/images/blur-hospital.jpg', '2024-10-04 15:45:17', 'pending'),
(59, 31, 'Ashok Aryal', '9863442248', 'B+', '2024-06-13', 'Male', 86.00, 'Bheri Hospital Nepalgunj', 'dsfgtrt', '../admin/images/3708f4e428f644ba1d0fdb99daa33703.jpg', '2024-06-07 16:37:10', 'pending'),
(60, 35, 'tzGE6yQivy', '3514485145', 'B+', '2024-06-22', 'Male', 0.00, 'XgheOLl903', 'dsHH9nLFUP', '../admin/images/University Admission Open Instagram Post.png', '2024-09-01 12:05:36', 'pending'),
(61, 38, 'keshab', '8465132', 'B+', '2025-04-15', 'Male', 65.00, 'dotdotodt hospital', 'manmaiju pool', '../admin/images/Black and White Standard Professional Resume.png', '2025-04-18 19:42:29', 'pending'),
(62, 39, '8bmC3ctNRu', '1562984778', 'B+', '2024-06-22', 'Male', 52.00, 'VRhj7HNucl', '5O1Scrafx0', '../admin/images/maxresdefault.jpg', '2025-04-19 10:04:15', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `blood_req`
--

CREATE TABLE `blood_req` (
  `req_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `blood_group` varchar(5) DEFAULT NULL,
  `blood_quantity` int(11) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `landmarks` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `req_form_path` varchar(255) DEFAULT NULL,
  `request_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_req`
--

INSERT INTO `blood_req` (`req_id`, `pid`, `name`, `mobile_number`, `blood_group`, `blood_quantity`, `birth_date`, `gender`, `weight`, `location`, `landmarks`, `message`, `req_form_path`, `request_time`, `status`) VALUES
(55, 31, 'Ashish Khanal', '9491898322', 'B+', 55, '2024-05-17', 'Male', 25.00, 'jkashdsha', '7AgCQ3ceYF', 'klsdfs', '../admin/images/blur-hospital.jpg', '2024-06-07 09:08:42', 'Accepted'),
(56, 33, 'anu chaudhary', '645132', 'B+', 50, '2024-06-12', 'Others', 50.00, 'sadfgbg', 'Near College of Engineering and Management', 'urgent', '../admin/images/Firefly_20240602135441-removebg (1).png', '2024-06-03 03:30:20', 'Accepted'),
(57, 34, 'hari', '5623', 'B+', 500, '2024-06-11', 'Male', 999.99, 'ghbjn', 'Near College of Engineering and Management', 'urgent', '../admin/images/blur-hospital.jpg', '2024-06-03 03:37:45', 'Accepted'),
(58, 31, 'IzMoaKeA9S', '3122523451', 'B+', 669811, '2024-06-22', 'Male', 0.00, 'UwS5N5bVL1', 'reMUuxCvl7', 'urgent nedd', '../admin/images/3708f4e428f644ba1d0fdb99daa33703.jpg', '2024-06-07 13:21:19', 'Accepted'),
(59, 31, 'Ashok Aryal', '9863442248', 'B+', 50, '2024-06-13', 'Male', 86.00, 'Bheri Hospital Nepalgunj', 'dsfgtrt', 'Very Urgent', '../admin/images/3708f4e428f644ba1d0fdb99daa33703.jpg', '2024-06-07 16:37:10', 'Accepted'),
(60, 35, 'tzGE6yQivy', '3514485145', 'B+', 935081, '2024-06-22', 'Male', 0.00, 'XgheOLl903', 'dsHH9nLFUP', 'urgent nedd', '../admin/images/University Admission Open Instagram Post.png', '2024-09-01 12:05:36', 'Accepted'),
(61, 38, 'keshab', '8465132', 'B+', 50, '2025-04-15', 'Male', 65.00, 'dotdotodt hospital', 'manmaiju pool', 'please urgent', '../admin/images/Black and White Standard Professional Resume.png', '2025-04-18 19:42:29', 'Accepted'),
(62, 39, '8bmC3ctNRu', '1562984778', 'B+', 52, '2024-06-22', 'Male', 52.00, 'VRhj7HNucl', '5O1Scrafx0', 'urgent nedd', '../admin/images/maxresdefault.jpg', '2025-04-19 10:04:15', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `donor_reg`
--

CREATE TABLE `donor_reg` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `area` varchar(255) NOT NULL,
  `landmarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor_reg`
--

INSERT INTO `donor_reg` (`id`, `full_name`, `mobile_number`, `email`, `password`, `blood_group`, `birth_date`, `gender`, `weight`, `city`, `district`, `zip_code`, `area`, `landmarks`) VALUES
(22, 'Z6ghkgzalM', '9836272524', 'awqum@apvr.com', '$2y$10$F6eO3Y9cp/ogBKi.Gxec8ePI9Nn/oM2QfI./fi7Ts75Dlks97JSYG', 'B+', '2024-05-09', 'Male', 25.00, 'nepalgunj', 'jg0wj6uhGo', 'oo9KcFfCU8', 'nepalgunj', 'lL3DFdS2L0'),
(23, 'Sicos6fMBQ', '2344740595', 'fbwet@xsdo.com', '$2y$10$oPNqzPYTyXyYv5g3T96gee0Q3ecKYsX79lGjftn1WdJVsEYzV3EVi', 'B+', '2024-05-09', 'Male', 25.00, 'nepalgunj', '7xY3FXxKgy', 'NYLkCSYlFG', 'nepalgunj', 'h3byKcLFyz'),
(24, 'Bunny Khanal', '3437957764', 'khanalbunny@gmail.com', '$2y$10$VEXzG0/0L3Vip3gkl6uIvOdSCsVADgDzz4f6KkhJlqEDZ3W71mAs6', 'B+', '2024-05-09', 'Male', 25.00, 'TRpso4YAg4', 'lSpKJ0fNex', 'NUMeAIwSAc', 'nepalgunj', 'M1gAv9HopC'),
(25, 'H3vLK0vrrZ', '3842687192', 'aryalashok345@gmail.com', '$2y$10$DYiV9eXo2lxvPsgAOisGpO2Z8ZWXHEgfuQ3PZxXyCuE1VpI1i9tf6', 'B+', '2024-05-09', 'Male', 25.00, 'TRpso4YAg4', 'vcCz2qMNqy', 'cVLx6MhJ9P', 'nepalgunj', 'q0HkEhpSwm'),
(29, 'Pushpa Banjade', '8974651', 'pushpabanjade12@gmail.com', '$2y$10$UNddVfNeZTrmQ5/CmqJM.eT0WOluciDVYex4jjBor58bin4GpLm.O', 'B+', '2024-06-18', 'Female', 65.00, 'Kathmandu', 'Kathmandu', '6451', 'ktm', 'near Rampam chatpatey'),
(30, 'amrit don', '849865132', 'adhikariamrit2057@gmail.com', '$2y$10$0cQ.O4N177tp1wvpiisAYulMMqBgiTWwCJYrH089UYTFhuNLAcX4u', 'B+', '2000-06-07', 'Male', 65.00, 'ktm', 'kathmandu', '44600', 'Manmaiju', 'near malpot karyalay');

-- --------------------------------------------------------

--
-- Table structure for table `patient_reg`
--

CREATE TABLE `patient_reg` (
  `pid` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `Created_Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_reg`
--

INSERT INTO `patient_reg` (`pid`, `full_name`, `mobile_number`, `email`, `password`, `gender`, `Created_Time`) VALUES
(31, 'asda', '87', 'i@gmail.com', '$2y$10$zR9YnR0GEhB7hZrPSoTpd.w4ZzEtIVX4sEEbGDIpdPnwSlvjbrRN6', 'Male', '2024-05-29 12:37:33'),
(32, '7Pf3DdzeON', '8984490714', 'oefzg@wqnu.com', '$2y$10$l.fyBUHj9FLg9Jz41/79P.HYoYcMuHw34SThhgYiqvCrFaptZu/P.', 'Male', '2024-06-02 08:17:37'),
(33, 'Anu chaudhary', '0516657259', 'anu@gmail.com', '$2y$10$69izAXggzuzsi5T7XoaC..fbRoiw2F/AxP5acj5F.rtNwuzhBQgNu', 'Other', '2024-06-03 03:27:11'),
(34, 'Ashok Aryal', '486512', 'as@gmail.com', '$2y$10$dPrGQSQxBsSmS8/7b8iCJOTHkgU7FiXa.rReYR3YVV1C7eNrPDYZe', 'Male', '2024-06-03 03:35:29'),
(35, 'Bijan Babu Shrestha', '6635', 'bijanbabus@gmail.com', '$2y$10$p5BUGlxOCMP2GQT0dDZUQOzjLShnOjn4GOO10Q2XDqgJgCHkh5YTO', 'Male', '2024-09-01 12:02:48'),
(36, 'Preston Galloway', '461', 'ashok@gmail.com', '$2y$10$CLciyddxuUychDGuqxbPn.RhCMKTq31aCunrE8A6PKzUA4UB7x1nC', 'Other', '2024-10-04 15:47:51'),
(37, 'Ashok Aryal', '9863442248', 'iamashokaryal@gmail.com', '$2y$10$DB6y9IgSOS8KjTGr5Bs1RelF8nKmzLcZBqogCOCEELckfUAgueSkm', 'Male', '2024-11-29 06:21:18'),
(38, 'amrit adhikari', '9860866828', 'amrit@gmail.com', '$2y$10$k9xtJGkVG36u6WqZ.c7YtOcnvzemhfpZ1PLdg99xxD2G.tFK0zUZW', 'Female', '2025-04-18 19:37:11'),
(39, 'Amrit', '0348097504', 'amrit1@gmail.com', '$2y$10$ByyVOTGtvm32izKhsAdsCONxNxWPtdwvi.VPxH3tf480ylTLwz0Oq', 'Male', '2025-04-19 10:02:04');

-- --------------------------------------------------------

--
-- Table structure for table `request_donor`
--

CREATE TABLE `request_donor` (
  `request_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `donor_id` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `request_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_donor`
--

INSERT INTO `request_donor` (`request_id`, `pid`, `donor_id`, `req_id`, `request_time`) VALUES
(6, 31, 25, 55, '2024-06-03 18:13:32'),
(7, 31, 25, 55, '2024-06-03 18:17:10'),
(8, 31, 25, 55, '2024-06-03 18:17:16'),
(9, 31, 25, 55, '2024-06-03 18:18:30'),
(10, 31, 25, 55, '2024-06-03 18:19:38'),
(11, 31, 25, 55, '2024-06-03 18:23:25'),
(12, 31, 25, 55, '2024-06-03 18:26:23'),
(13, 31, 25, 55, '2024-06-03 18:28:40'),
(14, 31, 25, 55, '2024-06-03 18:34:52'),
(15, 31, 25, 55, '2024-06-07 14:33:14'),
(16, 31, 25, 55, '2024-06-07 14:38:42'),
(17, 31, 25, 55, '2024-06-07 14:48:31'),
(18, 31, 25, 55, '2024-06-07 14:53:51'),
(19, 31, 25, 55, '2024-06-07 14:55:58'),
(20, 31, 25, 55, '2024-06-07 14:58:07'),
(21, 31, 25, 55, '2024-06-07 14:58:53'),
(22, 31, 25, 55, '2024-06-07 15:00:14'),
(23, 31, 25, 55, '2024-06-07 15:01:22'),
(24, 31, 25, 55, '2024-06-07 15:18:32'),
(25, 31, 24, 58, '2024-06-07 19:06:58'),
(26, 31, 29, 59, '2024-06-07 22:22:37'),
(27, 35, 25, 60, '2024-09-01 17:51:11'),
(28, 38, 30, 61, '2025-04-19 01:29:05'),
(29, 38, 30, 61, '2025-04-19 01:30:25'),
(30, 38, 30, 61, '2025-04-19 01:34:13'),
(31, 39, 30, 62, '2025-04-19 15:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `state` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `area` varchar(255) NOT NULL,
  `landmarks` text DEFAULT NULL,
  `usertype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `full_name`, `mobile_number`, `email`, `password`, `blood_group`, `birth_date`, `gender`, `weight`, `state`, `district`, `zip_code`, `area`, `landmarks`, `usertype`) VALUES
(10, 'Ashok Aryal', '9874651', 'i@gmail.com', 'i@gmail.com', 'A+', '2024-05-01', 'Male', 55.00, 'ghbj', 'gyuhkj', '8645', 'yughbj', 'hkj', 'gyhbj');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `approved_request`
--
ALTER TABLE `approved_request`
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `fkk_pid` (`pid`);

--
-- Indexes for table `blood_req`
--
ALTER TABLE `blood_req`
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `fk_pid` (`pid`);

--
-- Indexes for table `donor_reg`
--
ALTER TABLE `donor_reg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_reg`
--
ALTER TABLE `patient_reg`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `request_donor`
--
ALTER TABLE `request_donor`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `donor_id` (`donor_id`),
  ADD KEY `req_id` (`req_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blood_req`
--
ALTER TABLE `blood_req`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `donor_reg`
--
ALTER TABLE `donor_reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `patient_reg`
--
ALTER TABLE `patient_reg`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `request_donor`
--
ALTER TABLE `request_donor`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `approved_request`
--
ALTER TABLE `approved_request`
  ADD CONSTRAINT `fkk_pid` FOREIGN KEY (`pid`) REFERENCES `patient_reg` (`pid`);

--
-- Constraints for table `blood_req`
--
ALTER TABLE `blood_req`
  ADD CONSTRAINT `fk_pid` FOREIGN KEY (`pid`) REFERENCES `patient_reg` (`pid`);

--
-- Constraints for table `request_donor`
--
ALTER TABLE `request_donor`
  ADD CONSTRAINT `request_donor_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient_reg` (`pid`),
  ADD CONSTRAINT `request_donor_ibfk_2` FOREIGN KEY (`donor_id`) REFERENCES `donor_reg` (`id`),
  ADD CONSTRAINT `request_donor_ibfk_3` FOREIGN KEY (`req_id`) REFERENCES `blood_req` (`req_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
