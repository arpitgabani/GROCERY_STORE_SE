-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2021 at 06:14 PM
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
-- Database: `grocery1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `name`, `email`, `password`) VALUES
(1, 'SGP', 'sgpproject@gmail.com', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `name`, `parent_id`) VALUES
(1, 'Frozen food', 0),
(2, 'Personal care', 0),
(3, 'home care', 0),
(4, 'Vegetable', 0),
(5, 'masala and spice', 1),
(6, 'Oil Rice and Sugar', 1),
(7, 'pluses', 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `uid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ord`
--

CREATE TABLE `ord` (
  `oid` int(10) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ord`
--

INSERT INTO `ord` (`oid`, `uid`, `total`, `date`) VALUES
(7, 1, 10, '2021-10-12 09:50:54'),
(8, 1, 746, '2021-10-12 12:31:50'),
(9, 1, 814, '2021-10-12 21:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `oid`, `pid`, `quantity`, `amount`, `subtotal`) VALUES
(8, 8, 1, 1, 500, 500),
(9, 9, 3, 2, 400, 800),
(10, 9, 2, 1, 14, 14);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payid` int(10) NOT NULL,
  `oid` int(10) DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payid`, `oid`, `uid`, `total_amount`, `payment_type`) VALUES
(7, 7, 1, 10, 'COD'),
(8, 8, 1, 746, 'COD'),
(9, 9, 1, 814, 'COD');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pid` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  `weight` varchar(20) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `name`, `price`, `discount`, `weight`, `pic`, `cid`) VALUES
(1, 'Dishwash Gel, Lemon (1.5 Ltr)', 50, 10, '', 'images/17.png', 3),
(2, 'Dish Wash Bar (200 Gm)', 20, 2, '', 'images/18.png', 3),
(3, 'Fortune Sunflower Oil', 1045, 50, '', 'images/1.png', 6),
(4, 'meggimasala', 2, 0, '2gm', 'images/meggi.jpg', 5),
(5, 'Jeggry', 50, 5, '', 'images/j2.jpg', 6),
(6, 'rice', 500, 5, '', 'images/rice2.jpg', 6),
(7, 'mili tea', 85, 10, '', 'images/m4.jpg', 6),
(8, 'Wagbakri tea', 95, 15, '', 'images/w.jpg', 6),
(9, 'Madhur suger', 40, 10, '', 'images/s.jpg', 6),
(10, 'sing dana', 20, 2, '', 'images/so2.jpg', 6),
(11, 'suger', 40, 4, '', 'images/s3.jpg', 6),
(12, 'Mungdal(500 Gm)', 50, 5, '', 'images/mu.jpg', 7),
(13, 'Tuver Dal(1kg)', 90, 10, '', 'images/tuver.jpg', 7),
(14, 'Mag Mogar Dal(500 Gm)', 50, 6, '', 'images/mungf.jpg', 7),
(15, 'Urad dal(1 kg)', 85, 10, '', 'images/urad.jpg', 7),
(16, 'Masur Dal(1 Kg)', 60, 6, '', 'images/masur.jpg', 7),
(17, 'Chana Dal(500 Gm)', 40, 5, '', 'images/chanadal.jpg', 7),
(21, 'Clinic Plus', 10, 1, '', 'images/1602260557-clinic.jpg', 2),
(22, 'chik', 20, 2, '', 'images/1602266961-chick.jpg', 2),
(23, 'Dettol', 40, 0, '4 pc', 'images/1602267040-d3.jpg', 2),
(24, 'Dettol Handwash', 30, 4, '250ml', 'images/1602267137-dh.jpg', 2),
(25, 'lifebuoy', 50, 5, '4 pc', 'images/1602267355-life.jpg', 2),
(26, 'Surf Powder', 80, 10, '', 'images/1602267705-surf2.jpg', 3),
(27, 'Nirma', 40, 5, '1 kg', 'images/1602267875-nirma.jpg', 3),
(28, 'brinjal', 40, 5, '1kg', 'images/1602268367-31.png', 4),
(30, 'Air Freshener (50 Gm)', 10, 1, '', 'images/1635151635-19.png', 3),
(31, 'Toilet Cleaner Expert (1 Ltr)', 10, 1, '', 'images/1635151715-20.png', 3),
(32, 'wheel', 10, 1, '', 'images/1635152241-wa.jpg', 3),
(33, 'Gulab Oil', 1430, 145, '', 'images/1635152502-g.jpg', 3),
(34, 'Xepert Dish Wash Bar', 10, 2, ' ', 'images/1635153229-expert.jpg', 3),
(35, 'Oinion (1 Kg)', 40, 4, ' ', 'images/1635153409-o3jpg.jpg', 4),
(36, 'Fresh Cauliflower (1kg)', 60, 8, ' ', 'images/1635153458-30.png', 4),
(37, 'Fresh Brinjal Bharta (1 Kg)', 20, 3, ' ', 'images/1635153501-31.png', 4),
(38, 'Fresh Sweet Lime (500 Gm)', 10, 1, ' ', 'images/1635153542-32.png', 4),
(39, 'Poteto(1kg)', 30, 4, ' ', 'images/1635153597-poteto.jpg', 4),
(40, 'Simala Mirchi (250 Gm)', 20, 3, ' ', 'images/1635153875-sm.jpg', 4),
(41, 'Bhindi (1 Kg)', 30, 4, ' ', 'images/1635153908-lf.jpg', 4),
(42, 'Tamatar(1 Kg)', 80, 10, ' ', 'images/1635153947-t.jpg', 4),
(43, 'Cabbage(1 Kg)', 50, 6, ' ', 'images/1635153986-cobage.jpg', 4),
(44, 'Peas(1 Kg)', 60, 7, ' ', 'images/1635154030-pv.jpg', 4),
(45, 'Spring Oinion (500gm)', 20, 3, ' ', 'images/1635154062-spring.jpg', 4),
(46, 'Chick Egg', 20, 2, ' ', 'images/1635154196-chiegg.jpg', 2),
(47, 'Head And Soulder', 85, 3, '', 'images/1635155772-hadands.jpg', 2),
(48, 'Lifebuoy Hand Wash', 119, 12, ' ', 'images/1635155808-lh2.jpg', 2),
(49, 'Colgate', 50, 5, ' ', 'images/1635155852-c1.png', 2),
(50, 'Lifebuoy(4 Pc)', 40, 4, ' ', 'images/1635155923-life.jpg', 2),
(51, 'Dettol Soap (4 Pc)', 40, 4, ' ', 'images/1635155970-d3.jpg', 2),
(52, 'Santoor(4 Pc)', 40, 4, ' ', 'images/1635156012-sant.jpg', 2),
(53, 'Nima Bathhing Soap (1 Pc)', 9, 1, ' ', 'images/1635156055-nima.jpg', 2),
(54, 'Dettol Handwash', 209, 21, ' ', 'images/1635156099-dh.jpg', 2),
(55, 'Dove', 40, 4, ' ', 'images/1635156140-dove.jpg', 2),
(56, 'Chili Powder (1kg)', 130, 15, ' ', 'images/1635157160-cli1.jpg', 5),
(57, 'Haldi Powder (1kg)', 200, 22, ' ', 'images/1635157387-haldi.jpg', 5),
(58, 'Dhana Jeeru Powder(500 Gm)', 50, 5, ' ', 'images/1635157526-rdj.jpg', 5),
(59, 'Hing(250 Gm)', 299, 30, ' ', 'images/1635157585-download.jpg', 5),
(60, 'Garam Masala (250 Gm)', 199, 20, ' ', 'images/1635157628-rdj.jpg', 5),
(61, 'Ramdev Garam Masala (250 Gm)', 199, 20, ' ', 'images/1635157744-rmg.jpg', 5),
(62, 'Nirma Salt(1 Kg)', 9, 1, ' ', 'images/1635157819-salt.jpg', 5),
(63, 'Meggi Magic Masala(6 Pc)', 10, 1, ' ', 'images/1635157883-megi2.jpg', 5),
(64, 'Black Pepper (250 Gm)', 230, 25, ' ', 'images/1635157925-bp2.jpg', 5),
(65, 'Dry Coriander(250 Gm)', 199, 20, ' ', 'images/1635157964-dh4.jpg', 5),
(66, 'Cloves(250 Gm)', 230, 25, ' ', 'images/1635157998-cl.jpg', 5),
(67, 'Jerru(250 Gm)', 75, 8, ' ', 'images/1635158041-jeeru.jpg', 5),
(68, 'Pepper Salami (250 Gm)', 20, 3, ' ', 'images/1635159250-64.png', 1),
(69, 'Sumeru Green Pees (500 Gm)', 60, 8, ' ', 'images/1635159278-65.png', 1),
(70, 'Tikka Chicken (300 Gm)', 300, 30, ' ', 'images/1635159319-66.png', 1),
(71, 'Mixed Vegetables (500 Gm)', 350, 38, ' ', 'images/1635159355-67.png', 1),
(72, 'Mango Pulp (800 Gm)', 140, 18, ' ', 'images/1635159389-68.png', 1),
(73, 'Kesar Mango Pulp (800 Gm)', 200, 25, ' ', 'images/1635159433-69.png', 1),
(74, 'Frozen Sweet Corn (250 Gm)', 60, 8, ' ', 'images/1635159486-70.png', 1),
(75, 'Chicken Nuggets (1 Kg)', 40, 6, ' ', 'images/1635159522-71.png', 1),
(76, 'Garlic Fingers (400 Gm)', 50, 8, ' ', 'images/1635159553-72.png', 1),
(77, 'Catch Fish Finger (200 Gm)', 80, 10, ' ', 'images/1635159595-73.png', 1),
(78, 'Sumeru Chicken (500 Ml)', 180, 20, ' ', 'images/1635159628-74.png', 1),
(79, 'Veggie Fingers (400 Gm)', 70, 8, ' ', 'images/1635159657-75.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `address1` varchar(50) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `mobile`, `address1`, `gender`, `username`, `password`) VALUES
(1, 'Abhay', 8528528528, 'xxx', '', 'Abhay', 'abh123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `feedback_ibfk_1` (`uid`);

--
-- Indexes for table `ord`
--
ALTER TABLE `ord`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `user_id` (`uid`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`oid`),
  ADD KEY `product_id` (`pid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `oid` (`oid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ord`
--
ALTER TABLE `ord`
  MODIFY `oid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
