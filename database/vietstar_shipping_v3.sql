-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 16, 2022 at 08:29 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vietstar_shipping`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `cust_name` varchar(100) NOT NULL,
  `cust_address` text,
  `cust_city` varchar(100) DEFAULT NULL,
  `cust_state` varchar(50) DEFAULT NULL,
  `cust_zipcode` varchar(10) DEFAULT NULL,
  `cust_email` varchar(100) DEFAULT NULL,
  `cust_phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `cust_name`, `cust_address`, `cust_city`, `cust_state`, `cust_zipcode`, `cust_email`, `cust_phone`) VALUES
(1, 'John Smith', '123 ABC', 'Fairfax', 'VA', '22011', 'jsmith@gmail.com', '5715990090'),
(2, 'Alice Tran', '456 Bluesky', 'Chantilly', 'VA', '20151', 'atran@gmail.com', '7034429953'),
(3, 'Alex Han', '99 Horizontal Light', 'Chantilly', 'VA', '22055', 'ahan@gmail.com', '7035556666'),
(4, 'Alex Nguyen', '99 Horizontal Light', 'Chantilly', 'VA', '22055', 'ahan@gmail.com', ''),
(5, 'Trinh Trinh', '99 Rose Street', 'Rainbow', 'VA', '20151', '', '7038889901'),
(6, 'Trinh Trinh', '34 Blue Street', 'Wisconsin', 'VA', '20151', '', '7035556789'),
(7, 'Alice May', '34 Snow flake', 'Wisconsin', 'VA', '20151', '', '2035556789'),
(8, 'Henry Jay', '123 Rose Street', 'Fairfax', 'VA', '', 'hjay@gmail.com', '5715289496'),
(9, 'Joyce Smith', '55 Wall Street', 'Chantilly', 'VA', '', '', '5718889090'),
(10, 'Ngoc Han', '123 RoseSweet Street', 'Fairfax', 'VA', '22011', 'ngochan@gmail.com', '7034567878'),
(11, 'Emma Tran', '78 Langley Street', 'Chantilly', 'VA', '', '', '7035678907'),
(12, 'Michael Jay', '9 Langley', 'Ashburn', 'VA', '21202', 'mjay@gmail.com', '5017778888'),
(13, 'Washington Lee', '99 BLuesky', 'Chantilly', 'VA', '20151', '', '3035678907'),
(14, 'Anne Tran', '78 Langley Street', 'Chantilly', 'VA', '', '', '7035678907');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `pkg_id` int(11) NOT NULL,
  `shipping_order_id` int(11) NOT NULL,
  `package_desc` text NOT NULL,
  `package_weight` double NOT NULL,
  `mst` varchar(100) NOT NULL,
  `pkg_tracking_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`pkg_id`, `shipping_order_id`, `package_desc`, `package_weight`, `mst`, `pkg_tracking_no`) VALUES
(73327, 5, '12 Ginseng', 12, '14', 0),
(73328, 6, '100 Ginseng', 30, '15', 0),
(73329, 6, '50 Vitamin C', 50, '15', 0),
(73330, 7, '10 Candies', 1, '16', 0),
(73331, 8, '1000 Candies', 1, '17', 0),
(73332, 9, '10 Fish Oils', 10, '18', 0),
(73333, 10, '10 Fish Oils', 15, '19', 0),
(73334, 11, '15 Fish Oils', 20, '20', 0),
(73335, 12, '100 Ginger Candies', 13, '21', 0),
(73336, 13, '101 Ginger Candies', 15, '22', 0),
(73337, 14, 'Clothes', 5, '23', 0),
(73338, 15, 'Clothes', 10, '24', 0),
(73339, 16, 'Clothes', 10, '25', 0),
(73341, 18, '1 hello kitty', 25.43, '27', 1),
(73342, 18, '2 stuffed bear', 25, '27', 2),
(73343, 18, 'a bicycle', 30, '27', 3),
(73344, 19, '10 hello kitties', 10, '28', 0),
(73345, 20, '10 Fish Oils', 10, '29', 0),
(73346, 21, '10 Vitamin C', 12, '30', 0),
(73347, 22, '10 Candies, 10 Ensures, 15 Fish Oils', 14.5, '31', 0),
(73348, 23, '18 Ensures', 19, '32', 0),
(73349, 24, '13 Hersey Chololate, Clothes, 2 shoes', 16.5, '33', 0),
(73350, 24, '11 Centrum vitamin', 12, '33', 0),
(73351, 25, '98 Candies,  10 Fish Oils', 33.5, '34', 0),
(73352, 25, '80 Candies,  15 Fish Oils', 20.89, '34', 0),
(73353, 26, '10 Ginger Candies', 6, '35', 0),
(73354, 28, '10 Thung Mi Goi', 10, '37', 0),
(73355, 29, '10 Candies, 10 Ensures, 15 Fish Oils', 13.25, '38', 0),
(73356, 30, '16 Nike Shoses', 18, '39', 0),
(73357, 31, 'Clothes', 5, '40', 0),
(73359, 33, 'Clothes, 2 nikes shoes', 5, '41', 0),
(73360, 34, '80 Candies,  15 Fish Oils', 25.5, '42', 1),
(73361, 35, '5 Shoes', 7.6, '43', 1),
(73362, 36, '10 Vitamin C, 100 Ginger Candies, 28 dried dates', 23, '44', 1),
(73363, 37, '6 Ensure', 7, '45', 1),
(73364, 37, '10 Vitamin C, 28 dried dates', 16, '45', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `product_category` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `qty_onhand` int(10) DEFAULT NULL,
  `product_location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_category`, `product_name`, `unit_price`, `supplier`, `qty_onhand`, `product_location`) VALUES
(58, 'SKU001', 'Vitamin', ' Vitamin C ', 35, 'Multi-Vitamin', 8, 'Middle shelf - 5B'),
(59, 'SKU002', 'Dairy', ' Ensure milk ', 35, 'YumYum', 18, 'Left shelf - 4A'),
(60, 'SKU003', 'Candies/Snack', ' Ginger ', 60, 'YumYum', 79, 'Right shelf - 3A'),
(61, 'SKU005', 'Vitamin', 'Fish Oil', 40, 'YumYum', 36, 'Middle shelf - 5B'),
(62, 'SKU009', 'Medicine', 'Tylenol', 40, 'Vitamin', 50, 'Middle shelf - 5B'),
(63, 'SKU006', 'Vitamin', 'Vitamin A', 30, 'Multi-Vitamin', 52, '4A'),
(64, 'SKU007', 'Candies/Snack', 'Lolippop', 15, 'YumYum', 85, '5B'),
(65, 'SKU008', 'Candies/Snack', 'Mint candy', 50, 'YumYum', 65, '4A');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` double DEFAULT NULL,
  `purchase_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `recipient_address` text NOT NULL,
  `recipient_phone` varchar(10) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `recipient_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `recipient_name`, `recipient_address`, `recipient_phone`, `customer_id`, `recipient_email`) VALUES
(1, 'Ana Smith', '234 Rose Street', '7035558900', 1, NULL),
(2, 'Alex Nguyen', '98 Sunlight', '8909907888', 2, NULL),
(3, 'Hung Le', '78 Lake Village', '5718889999', 1, NULL),
(4, 'Hieu Nguyen', '88 Winter Snow', '5718889090', 1, NULL),
(6, 'Trinh Trinh', '84 Rose Street', '5715990808', 1, NULL),
(8, 'Hong Chau', '55 Sunny Lake', '3012345678', 2, NULL),
(10, 'Yen Le', '58 Snowflake', '7038882727', 2, NULL),
(12, 'Phuong Dang', '1302 Betty Lane, MD', '5718889900', 2, NULL),
(13, 'Khanh Vi', '123 Pham Ngu Lao', '7038889090', 2, NULL),
(15, 'Van Van', '123 Pham Ngu Lao', '0913260181', 5, NULL),
(16, 'Rose Maine', '89 Anne Village, Fairfax, VA', '5718887979', 6, NULL),
(17, 'Henry Mai', '89 Anne Village, Fairfax, VA', '7018887979', 7, NULL),
(18, '', '', '', 2, NULL),
(19, 'Nguyen Nguyen', '88 To Hien Thanh, Q.10. TP. HCM', '0913555678', 8, NULL),
(20, 'Alex Chau', '88 NTMK, Q.3', '0918855378', 9, NULL),
(21, 'Loan Nguyen', '89 Ben Nghe, TP HCM', '0918789989', 10, NULL),
(22, '', '', '', 10, NULL),
(23, 'Hong Ai', '1000 Ben Thanh, Q.1, TP.HCM', '0917675678', 11, NULL),
(24, 'Chau Chau', '90 To Hien Thanh, TP HCM', '7039882829', 1, NULL),
(25, '', '', '', 5, NULL),
(26, 'Emma Watson', '158 Phan Thanh Gian, Bao Loc City, Viet Nam', '0913456789', 12, NULL),
(28, 'Anita', '10 Nguyen Dinh Chieu, Q.1, TP.HCM', '0913888678', 13, NULL),
(29, 'Linh Chi', '11 Nguyen Trai, Q.3, TP. HCM', '0913456789', 12, NULL),
(30, 'Ngoc Tran', '90 Ben Thanh, Q.1, TP.HCM', '0813555698', 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `invoice_number_old` varchar(100) DEFAULT NULL,
  `cashier` varchar(100) DEFAULT NULL,
  `sales_payment_method` varchar(100) DEFAULT NULL,
  `sales_custname` varchar(100) DEFAULT NULL,
  `sales_cust_payment` double DEFAULT NULL,
  `sales_discount` double DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_amount` double DEFAULT NULL,
  `sales_profit` double DEFAULT NULL,
  `mst` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invoice_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `invoice_number_old`, `cashier`, `sales_payment_method`, `sales_custname`, `sales_cust_payment`, `sales_discount`, `sales_date`, `sales_amount`, `sales_profit`, `mst`, `user_id`, `invoice_number`) VALUES
(142, 'RS-8343433', 'Admin', 'cash', 'Ana Tran', NULL, 0, NULL, NULL, 0, NULL, NULL, 0),
(143, 'RS-32032603', 'Admin', 'cash', 'Ana Tran', NULL, 0, NULL, NULL, 0, NULL, NULL, 0),
(144, 'RS-0333309', 'Admin', 'Cash', 'John Smith', NULL, 0, NULL, NULL, 0, NULL, NULL, 0),
(145, '', 'Admin', 'Credit', 'Alex', 220, 0, NULL, NULL, 0, NULL, NULL, 0),
(146, '', 'Admin', 'Cash', 'Again', 220, 0, NULL, NULL, 0, NULL, NULL, 0),
(147, 'RS-25040333', 'Admin', 'cash', 'Trinh', 175, 25, NULL, NULL, 0, NULL, NULL, 0),
(148, 'RS-233346', 'Admin', 'Cash', 'Phuong', 150, 25, NULL, NULL, 0, NULL, NULL, 0),
(149, 'RS0099', 'admin', 'cash', 'Ana', 100, 0, NULL, 100, 0, NULL, NULL, 0),
(150, 'RS-733223', 'Admin', 'cash', 'Ana', 175, 0, '2022-11-21', 175, 0, NULL, NULL, 0),
(151, 'RS-733223', 'Admin', 'cash', 'Ana', 175, 0, '2022-11-21', 175, 0, NULL, NULL, 0),
(152, 'RS-733223', 'Admin', 'credit', 'Smith', 235, 0, '2022-11-21', 235, 0, NULL, NULL, 0),
(153, 'RS-733223', 'Admin', 'cash', 'Smith', 235, 0, '2022-01-22', 235, 0, NULL, NULL, 0),
(154, 'RS-2223308', 'Admin', 'cash', 'No name', 175, 0, '2022-01-22', 175, 0, NULL, NULL, 0),
(155, 'RS-2223308', 'Admin', 'credit', 'No name', 100, 0, '2022-01-22', 175, 0, NULL, NULL, 0),
(156, 'RS-2223308', 'Admin', 'credit', 'No name', 175, 0, '2022-01-22', 175, 0, NULL, NULL, 0),
(157, 'RS-230323', 'Admin', 'credit', 'Nam', 175, 0, '2022-01-24', 175, 0, NULL, NULL, 0),
(158, 'RS-323043', 'Admin', 'cash', 'Lina', 295, 0, '2022-01-24', 295, 0, NULL, NULL, 0),
(159, 'RS-323043', 'Admin', 'cash', '-', 295, 0, '2022-01-24', 295, 0, NULL, NULL, 0),
(160, 'RS-228040', 'Admin', 'cash', '-', 200, 0, '2022-01-24', 175, 0, NULL, NULL, 0),
(161, 'RS-3230033', 'Admin', 'credit', '-', 175, 0, '2022-01-24', 175, 0, NULL, NULL, 0),
(162, 'RS-32205763', 'Admin', 'cash', '-', NULL, 0, '2022-01-24', 70, 0, NULL, NULL, 0),
(163, 'RS-32205763', 'Admin', 'credit', '-', NULL, 0, '2022-01-24', 70, 0, NULL, NULL, 0),
(164, 'RS-32205763', 'Admin', 'cash', 'unknown', NULL, 0, '2022-01-24', 70, 0, NULL, NULL, 0),
(165, 'RS-32205763', 'Admin', 'cash', '-', NULL, 10, '2022-01-24', 70, 0, NULL, NULL, 0),
(166, 'RS-52453', 'Admin', 'cash', 'Baby', NULL, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(167, 'RS-52453', 'Admin', 'cash', 'Baby', NULL, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(168, 'RS-37803260', 'Admin', 'cash', '-', 35, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(169, 'RS-37803260', 'Admin', 'cash', '-', 35, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(170, '', 'Admin', 'cash', '-', 130, 0, '2022-01-24', 130, 0, NULL, NULL, 0),
(171, '', 'Admin', 'cash', '-', 130, 0, '2022-01-24', 130, 0, NULL, NULL, 0),
(172, '', 'Admin', 'cash', '-', 130, 0, '2022-01-24', 130, 0, NULL, NULL, 0),
(173, '', 'Admin', 'cash', '-', 60, 0, '2022-01-24', 60, 0, NULL, NULL, 0),
(174, '', 'Admin', 'cash', '-', 60, 0, '2022-01-24', 60, 0, NULL, NULL, 0),
(175, 'RS-254020', 'Admin', 'cash', '-', 35, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(176, 'RS-30003977', 'Admin', 'cash', 'StWrong', 15, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(177, 'RS-2203', 'Admin', 'cash', '-', 35, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(178, 'RS-2203', 'Admin', 'cash', '-', NULL, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(179, 'RS-9232940', 'Admin', 'cahs', '-', 35, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(180, 'RS-9232940', 'Admin', 'cahs', '-', 35, 0, '2022-01-24', 35, 0, NULL, NULL, 0),
(181, 'RS-320027', 'Admin', 'cash', '-', 60, 0, '2022-01-25', 60, 30, NULL, NULL, 0),
(182, 'RS-320027', 'Admin', 'cash', '-', 60, 0, '2022-01-25', 60, 30, NULL, NULL, 0),
(183, '', 'Admin', 'cash', '-', 60, 0, '2022-01-25', 60, 30, NULL, NULL, 0),
(184, '', 'Admin', 'cash', '-', 60, 0, '2022-01-25', 60, 30, NULL, NULL, 0),
(185, '', 'Admin', 'cash', '-', 60, 0, '2022-01-25', 60, 30, NULL, NULL, 0),
(186, 'RS-0440328', 'Admin', 'cash', '-', 130, 0, '2022-01-25', 130, 60, NULL, NULL, 0),
(187, 'RS-033333', 'Admin', 'credit', '-', 60, 0, '2022-01-25', 60, 30, NULL, NULL, 0),
(188, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(189, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(190, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(191, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(192, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(193, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(194, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(195, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(196, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(197, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(198, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(199, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(200, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(201, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(202, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(203, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(204, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(205, 'RS-3200928', 'Admin', 'cash', '-', 35, 0, '2022-01-25', 35, 15, NULL, NULL, 0),
(206, 'RS-24323223', 'Admin', 'credit', '-', 70, 0, '2022-01-25', 70, 30, NULL, NULL, 0),
(207, 'RS-24323223', 'Admin', 'credit', '-', 70, 0, '2022-01-25', 70, 30, NULL, NULL, 0),
(208, 'RS-23632823', 'Admin', 'Cash', '-', 190, 0, '2022-01-28', 190, 90, NULL, NULL, 0),
(209, 'RS-08022', 'Admin', 'credit', '-', 60, 0, '2022-01-28', 60, 30, NULL, NULL, 0),
(210, 'RS-0332', 'Admin', 'Credit', 'Ana', 35, 0, '2022-02-11', 35, 0, NULL, NULL, 0),
(211, NULL, 'Admin', 'Cash', 'Kitty', 70, 0, '2022-02-13', 70, 0, NULL, NULL, 1),
(212, NULL, 'Admin', 'Cash', '-', 120, 0, '2022-02-13', 120, 0, NULL, NULL, 2),
(213, NULL, NULL, 'cash', 'Ana', NULL, NULL, '2022-02-15', 80, NULL, 44, 1, 3),
(214, NULL, NULL, 'cash', 'Ana', NULL, NULL, '2022-02-15', 80, NULL, 44, 1, 4),
(215, NULL, NULL, 'credit', 'Washington Lee', NULL, NULL, '2022-02-15', NULL, NULL, 43, 1, 5),
(216, NULL, NULL, 'credit', 'Washington Lee', NULL, NULL, '2022-02-15', NULL, NULL, 43, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `sales_order_id` int(11) NOT NULL,
  `invoice` varchar(100) DEFAULT NULL,
  `qty_picked` int(11) DEFAULT NULL,
  `sales_order_amount` double DEFAULT NULL,
  `sales_order_profit` double DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `sales_unit_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_order`
--

INSERT INTO `sales_order` (`sales_order_id`, `invoice`, `qty_picked`, `sales_order_amount`, `sales_order_profit`, `product_id`, `sales_id`, `sales_unit_price`) VALUES
(315, 'RS-8343433', 2, 70, 30, 58, NULL, NULL),
(316, 'RS-32032603', 2, 120, 60, 60, NULL, NULL),
(317, 'RS-32032603', 3, 105, 45, 59, NULL, NULL),
(322, 'RS-2283383', 4, 140, 60, 59, NULL, NULL),
(327, 'RS-0333309', 3, 105, 45, 58, NULL, NULL),
(328, 'RS-0333309', 1, 35, 15, 59, NULL, NULL),
(332, 'RS-6323830', 2, 70, 30, 58, NULL, NULL),
(333, 'RS-6323830', 2, 70, 30, 59, NULL, NULL),
(334, 'RS-25040333', 5, 175, 75, 59, NULL, NULL),
(335, 'RS-233346', 5, 175, 75, 59, NULL, NULL),
(336, 'RS-733223', 5, 175, 75, 59, NULL, NULL),
(338, 'RS-2223308', 5, 175, 75, 59, NULL, NULL),
(339, 'RS-230323', 5, 175, 75, 59, NULL, NULL),
(340, 'RS-02233502', 5, 175, 75, 59, NULL, NULL),
(341, 'RS-70272', 5, 175, 75, 59, NULL, NULL),
(342, 'RS-323043', 2, 120, 60, 60, NULL, NULL),
(343, 'RS-323043', 5, 175, 75, 59, NULL, NULL),
(344, 'RS-228040', 5, 175, 75, 59, NULL, NULL),
(345, 'RS-3230033', 5, 175, 75, 59, NULL, NULL),
(346, 'RS-09500330', 1, 35, 15, 58, NULL, NULL),
(347, 'RS-09500330', 3, 180, 90, 60, NULL, NULL),
(348, 'RS-26023', 5, 175, 75, 59, NULL, NULL),
(349, 'RS-230238', 5, 175, 75, 59, NULL, NULL),
(350, 'RS-02283326', 2, 120, 60, 60, NULL, NULL),
(351, 'RS-02283326', 1, 35, 15, 59, NULL, NULL),
(352, 'RS-32205763', 1, 35, 15, 59, NULL, NULL),
(353, 'RS-32205763', 1, 35, 15, 59, NULL, NULL),
(354, 'RS-52453', 1, 35, 15, 59, NULL, NULL),
(355, 'RS-37803260', 1, 35, 15, 59, NULL, NULL),
(356, '', 1, 60, 30, 60, NULL, NULL),
(357, 'RS-254020', 1, 35, 15, 58, NULL, NULL),
(358, 'RS-30003977', 1, 35, 15, 58, NULL, NULL),
(359, 'RS-2203', 1, 35, 15, 59, NULL, NULL),
(360, 'RS-9232940', 1, 35, 15, 59, NULL, NULL),
(361, 'RS-320027', 1, 60, 30, 60, NULL, NULL),
(362, 'RS-0440328', 1, 35, 15, 59, NULL, NULL),
(363, 'RS-0440328', 1, 60, 30, 60, NULL, NULL),
(364, 'RS-0440328', 1, 35, 15, 59, NULL, NULL),
(365, 'RS-033333', 1, 60, 30, 60, NULL, NULL),
(366, 'RS-3200928', 1, 35, 15, 58, 188, NULL),
(367, 'RS-24323223', 1, 35, 15, 58, 206, NULL),
(368, 'RS-24323223', 1, 35, 15, 59, 206, NULL),
(369, '', 1, 35, 15, 59, NULL, NULL),
(370, 'RS-23632823', 2, 70, 30, 59, 208, NULL),
(371, 'RS-23632823', 2, 120, 60, 60, 208, NULL),
(372, 'RS-08022', 1, 60, 30, 60, 209, NULL),
(373, 'RS-362363', 1, 35, 15, 59, NULL, NULL),
(374, 'RS-362363', 1, 35, 15, 59, NULL, NULL),
(375, 'RS-0223333', 1, 35, 0, 59, NULL, NULL),
(376, 'RS-0332', 1, 35, 0, 59, 210, NULL),
(377, '1', 2, 70, 0, 59, 211, NULL),
(378, 'RS-29237832', 2, 120, 0, 60, 142, NULL),
(379, '2', 2, 120, 0, 60, 212, NULL),
(380, '3', 1, 60, 0, 60, NULL, NULL),
(381, NULL, 2, NULL, NULL, 64, 214, 15),
(382, NULL, 5, NULL, NULL, 64, 215, 15),
(383, NULL, 5, NULL, NULL, 65, 215, 50),
(384, NULL, 5, NULL, NULL, 64, 215, 15),
(385, NULL, 5, NULL, NULL, 65, 215, 50);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_order`
--

CREATE TABLE `shipping_order` (
  `shipping_order_id` int(11) NOT NULL,
  `mst` varchar(100) NOT NULL,
  `send_date` date NOT NULL,
  `airport_delivery_date` date NOT NULL,
  `total_weight` double NOT NULL,
  `num_of_packages` int(11) NOT NULL,
  `package_value` double NOT NULL,
  `custom_fee` double DEFAULT NULL,
  `insurance` double DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `price_per_lb` double DEFAULT NULL,
  `amount` double NOT NULL,
  `custom_fee_taxed_item` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipping_order`
--

INSERT INTO `shipping_order` (`shipping_order_id`, `mst`, `send_date`, `airport_delivery_date`, `total_weight`, `num_of_packages`, `package_value`, `custom_fee`, `insurance`, `payment_method`, `user_id`, `location`, `customer_id`, `recipient_id`, `price_per_lb`, `amount`, `custom_fee_taxed_item`) VALUES
(5, '14', '2022-01-14', '2022-01-21', 12, 1, 120, 100, 120, 'credit', 1, 'Sài Gòn', 2, 10, 3.5, 0, NULL),
(6, '15', '2022-01-14', '2022-01-21', 80, 2, 1200, 100, 1200, 'zelle', 1, 'Sài Gòn', 2, 8, 3.5, 0, NULL),
(7, '16', '2022-01-14', '2022-01-14', 1, 1, 0, 0, 0, 'zelle', 1, 'Tỉnh (Province)', 2, 2, 3.75, 0, NULL),
(8, '17', '2022-01-14', '2022-01-14', 1, 1, 0, 0, 0, 'credit', 1, 'Tỉnh (Province)', 2, 2, 3.75, 0, NULL),
(9, '18', '2022-01-16', '2022-01-17', 15, 1, 0, 0, 0, 'venmo', 1, 'Tỉnh (Province)', 2, 2, 3.75, 0, NULL),
(10, '19', '2022-01-16', '2022-01-16', 15, 1, 0, 0, 0, 'cash', 1, 'Sài Gòn', 2, 2, 3.5, 0, NULL),
(11, '20', '2022-01-16', '2022-01-16', 15, 1, 0, 0, 0, 'cash', 1, 'Sài Gòn', 2, 2, 3.5, 0, NULL),
(12, '21', '2022-01-15', '2022-01-15', 13, 1, 0, 0, 0, 'cash', 1, 'Sài Gòn', 2, 2, 3.5, 0, NULL),
(13, '22', '2022-01-15', '2022-01-15', 15, 1, 0, 0, 0, 'cash', 1, 'Sài Gòn', 2, 2, 3.5, 0, NULL),
(14, '23', '2022-01-15', '2022-01-15', 5, 1, 0, 0, 0, 'check', 1, 'Sài Gòn', 2, 13, 3.5, 0, NULL),
(15, '24', '2022-01-15', '2022-01-15', 10, 1, 0, 0, 0, 'check', 1, 'Sài Gòn', 2, 12, 3.5, 0, NULL),
(16, '25', '2022-01-15', '2022-01-15', 10, 1, 0, 0, 0, 'check', 1, 'Sài Gòn', 2, 12, 3.5, 0, NULL),
(18, '27', '2022-01-19', '2022-01-19', 80.43, 3, 0, 0, 0, 'cash', 1, 'Sài Gòn', 2, 13, 3.5, 0, NULL),
(19, '28', '2022-01-19', '2022-01-19', 10, 1, 0, 0, 0, 'cash', 1, 'Tỉnh (Province)', 5, 15, 3.75, 0, NULL),
(20, '29', '2022-02-05', '2022-02-05', 10, 1, 0, 0, 0, 'cash', 1, 'Sài Gòn', 2, 2, 3.5, 35, NULL),
(21, '30', '2022-02-05', '2022-02-05', 12, 1, 250, 0, 0, 'cash', 1, 'Sài Gòn', 8, 19, 3.5, 42, NULL),
(22, '31', '2022-02-05', '2022-02-05', 14.5, 1, 50, 0, 0, 'credit', 1, 'Sai Gon', 9, 20, 3.5, 0, NULL),
(23, '32', '2022-02-07', '2022-02-07', 19, 1, 100, 0, 0, 'cash', 1, 'Sài Gòn', 10, 21, 3.5, 66.5, NULL),
(24, '33', '2022-02-07', '2022-02-07', 28.5, 1, 0, 0, 0, 'cash', 1, 'Tỉnh (Province)', 10, 21, 3.75, 105, NULL),
(25, '34', '2022-02-07', '2022-02-07', 54.39, 2, 80, 0, 0, 'zelle', 1, 'Tinh', 11, 23, 3.75, 203.96, NULL),
(26, '35', '2022-02-07', '2022-02-07', 6, 1, 0, 0, 0, 'zelle', 1, 'Sài Gòn', 1, 3, 2.5, 15, NULL),
(27, '36', '2022-02-07', '2022-02-07', 10, 1, 0, 10, 3, 'credit', 1, 'Sài Gòn', 5, 15, 3.5, 55, NULL),
(28, '37', '2022-02-07', '2022-02-07', 10, 1, 0, 10, 3, 'credit', 1, 'Sài Gòn', 5, 15, 3.5, 55, NULL),
(29, '38', '2022-02-07', '2022-02-07', 13.25, 1, 50, 0, 0, 'venmo', 1, 'Sai Gon', 9, 20, 3.25, 43.06, NULL),
(30, '39', '2022-02-13', '2022-02-13', 18, 1, 0, 28, 0, 'check', 1, 'Sài Gòn', 2, 12, 3.5, 91, NULL),
(31, '40', '2022-02-13', '2022-02-13', 5, 1, 150, 0, 0, 'cash', 1, 'Tỉnh (Province)', 12, 26, 3.75, 18.75, NULL),
(33, '41', '2022-02-13', '2022-02-13', 5, 1, 150, 0, 0, 'cash', 1, 'Tỉnh (Province)', 12, 26, 3.75, 18.75, NULL),
(34, '42', '2022-02-14', '2022-02-14', 25.5, 1, 80, 0, 0, 'cash', 1, 'Tinh', 13, 28, 3.75, 95.63, NULL),
(35, '43', '2022-02-14', '2022-02-14', 7.6, 1, 0, 6, 0, 'credit', 1, 'Sài Gòn', 12, 29, 2.95, 26.65, '3 Shoes'),
(36, '44', '2022-02-15', '2022-02-15', 39, 1, 80, 0, 0, 'venmo', 1, 'Tinh', 14, 30, 3.25, 126.75, 'NONE'),
(37, '45', '2022-02-15', '2022-02-15', 23, 2, 80, 0, 0, 'venmo', 1, 'Tinh', 14, 30, 3.25, 74.75, 'NONE');

-- --------------------------------------------------------

--
-- Table structure for table `supliers`
--

CREATE TABLE `supliers` (
  `suplier_id` int(11) NOT NULL,
  `suplier_name` varchar(100) NOT NULL,
  `suplier_address` varchar(100) NOT NULL,
  `suplier_contact` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `note` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supliers`
--

INSERT INTO `supliers` (`suplier_id`, `suplier_name`, `suplier_address`, `suplier_contact`, `contact_person`, `note`) VALUES
(5, 'YumYum', '45 Candy Street', 'Min', '5716789900', ''),
(6, 'Multi-Vitamin', '88 Skylight', 'Max', '5718890945', '');

-- --------------------------------------------------------

--
-- Table structure for table `temp_package`
--

CREATE TABLE `temp_package` (
  `pkg_id` int(11) NOT NULL,
  `shipping_order_id` int(11) NOT NULL,
  `package_desc` text NOT NULL,
  `package_weight` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `temp_package`
--

INSERT INTO `temp_package` (`pkg_id`, `shipping_order_id`, `package_desc`, `package_weight`) VALUES
(1, 1, '10 Fish Oils', 30),
(2, 2, '15 Ensure', 15),
(3, 2, '10 Vitamin C, 100 Ginger Candies, 28 dried dates', 25),
(4, 3, '10 Candies, 10 Ensures, 15 Fish Oils', 15),
(5, 4, '100 Candies,  15 Fish Oils', 15),
(6, 4, '80 Candies,  15 Fish Oils', 15),
(7, 5, '80 Candies,  15 Fish Oils', 18),
(8, 6, '35 Fish Oils', 25),
(9, 7, '38 Vitamin C', 20);

-- --------------------------------------------------------

--
-- Table structure for table `temp_shipping_order`
--

CREATE TABLE `temp_shipping_order` (
  `shipping_order_id` int(11) NOT NULL,
  `total_weight` double NOT NULL,
  `num_of_package` int(11) NOT NULL,
  `package_value` double DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `cust_name` varchar(100) NOT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  `cust_city` varchar(100) DEFAULT NULL,
  `cust_state` varchar(100) DEFAULT NULL,
  `cust_zip` int(11) DEFAULT NULL,
  `cust_phone` varchar(10) NOT NULL,
  `cust_email` varchar(100) DEFAULT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `recipient_address` varchar(100) NOT NULL,
  `recipient_phone` varchar(10) NOT NULL,
  `submitted_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `temp_shipping_order`
--

INSERT INTO `temp_shipping_order` (`shipping_order_id`, `total_weight`, `num_of_package`, `package_value`, `location`, `cust_name`, `cust_address`, `cust_city`, `cust_state`, `cust_zip`, `cust_phone`, `cust_email`, `recipient_name`, `recipient_address`, `recipient_phone`, `submitted_date`) VALUES
(1, 30, 1, 250, 'Sai Gon', 'Henry Jay', '123 Rose Street', 'Fairfax', 'VA', 21035, '5715289496', 'hjay@gmail.com', 'Nguyen Nguyen', '88 To Hien Thanh, Q.10. TP. HCM', '0913555678', '2022-01-28'),
(2, 40, 2, 80, 'Tinh', 'Anne Tran', '78 Langley Street', 'Chantilly', 'VA', 22055, '7035678907', NULL, 'Ngoc Tran', '90 Ben Thanh, Q.1, TP.HCM', '0813555698', '2022-01-27'),
(3, 15, 1, 50, 'Sai Gon', 'Joyce Smith', '55 Wall Street', 'Chantilly', 'VA', 20489, '5718889090', NULL, 'Alex Chau', '88 NTMK, Q.3', '0918855378', '2022-01-28'),
(4, 40, 2, 80, 'Tinh', 'Emma Tran', '78 Langley Street', 'Chantilly', 'VA', 22055, '7035678907', NULL, 'Hong Ai', '1000 Ben Thanh, Q.1, TP.HCM', '0917675678', '2022-01-25'),
(5, 18, 1, 80, 'Tinh', 'Washington Lee', '99 BLuesky', 'Chantilly', 'VA', 22055, '3035678907', NULL, 'Anita', '10 Nguyen Dinh Chieu, Q.1, TP.HCM', '0913888678', '2022-01-26'),
(6, 40, 1, 80, 'Saigon', 'Johanna', '78 Langley Street', 'Chantilly', 'VA', 22055, '2035678907', NULL, 'Hong Ai', '1000 Ben Thanh, Q.1, TP.HCM', '0916123678', '2022-01-15'),
(7, 23, 1, 80, 'Saigon', 'Yen Nguyen', '22 Langley Street', 'Chantilly', 'VA', 22055, '2035678907', NULL, 'Hong Ai', '72 Ben Thanh, Q.1, TP.HCM', '0919909678', '2022-01-13');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `password`, `position`) VALUES
(1, 'admin', 'Admin', 'admin', 'admin'),
(2, 'cashier', 'Cashier Pharmacy', 'cashier', 'Cashier'),
(3, 'admin', 'Administrator', 'admin123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`pkg_id`),
  ADD KEY `shipping_order_id` (`shipping_order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `supplier_id_purchase_tbl` (`supplier_id`),
  ADD KEY `user_id_purchase_tbl` (`user_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `user_id_tbl_sales` (`user_id`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`sales_order_id`),
  ADD KEY `product_id_tbl_sales_order` (`product_id`),
  ADD KEY `sales_id_tbl_sales_order` (`sales_id`);

--
-- Indexes for table `shipping_order`
--
ALTER TABLE `shipping_order`
  ADD PRIMARY KEY (`shipping_order_id`),
  ADD KEY `recipient_id_tbl_shipping_order` (`recipient_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `location_id` (`location`);

--
-- Indexes for table `supliers`
--
ALTER TABLE `supliers`
  ADD PRIMARY KEY (`suplier_id`);

--
-- Indexes for table `temp_package`
--
ALTER TABLE `temp_package`
  ADD PRIMARY KEY (`pkg_id`),
  ADD KEY `shipping_order_id_temp_shipping_order_tbl` (`shipping_order_id`);

--
-- Indexes for table `temp_shipping_order`
--
ALTER TABLE `temp_shipping_order`
  ADD PRIMARY KEY (`shipping_order_id`),
  ADD KEY `location_id` (`location`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `pkg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73365;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `sales_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

--
-- AUTO_INCREMENT for table `shipping_order`
--
ALTER TABLE `shipping_order`
  MODIFY `shipping_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `supliers`
--
ALTER TABLE `supliers`
  MODIFY `suplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `temp_package`
--
ALTER TABLE `temp_package`
  MODIFY `pkg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `temp_shipping_order`
--
ALTER TABLE `temp_shipping_order`
  MODIFY `shipping_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `shipping_order_id` FOREIGN KEY (`shipping_order_id`) REFERENCES `shipping_order` (`shipping_order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `supplier_id_purchase_tbl` FOREIGN KEY (`supplier_id`) REFERENCES `supliers` (`suplier_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id_purchase_tbl` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `user_id_tbl_sales` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `product_id_tbl_sales_order` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_id_tbl_sales_order` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`sales_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipping_order`
--
ALTER TABLE `shipping_order`
  ADD CONSTRAINT `recipient_id_tbl_shipping_order` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`recipient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipping_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipping_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_package`
--
ALTER TABLE `temp_package`
  ADD CONSTRAINT `shipping_order_id_temp_shipping_order_tbl` FOREIGN KEY (`shipping_order_id`) REFERENCES `temp_shipping_order` (`shipping_order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
