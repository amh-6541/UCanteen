-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 01:08 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ucanteen`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `buyer_id` int(10) DEFAULT NULL,
  `seller_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `order_status` varchar(10) DEFAULT NULL,
  `order_accept_time` timestamp NULL DEFAULT NULL,
  `scheduled_time` timestamp NULL DEFAULT NULL,
  `product_name` text NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `buyer_id`, `seller_id`, `order_id`, `order_status`, `order_accept_time`, `scheduled_time`, `product_name`, `qty`, `price`) VALUES
(39, 5, 3, 1, 'Accepted', '2023-04-25 10:43:36', NULL, 'Pizza', 1, 40),
(40, 5, 3, 2, 'Cancelled', '2023-04-25 10:51:52', NULL, 'Burger', 1, 30),
(41, 5, 4, 3, 'Accepted', '2023-04-25 11:03:35', NULL, 'Polao', 1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `product_name` varchar(30) DEFAULT NULL,
  `image_link` text DEFAULT NULL,
  `description` text NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `shop_id`, `product_name`, `image_link`, `description`, `quantity`, `category`, `price`) VALUES
(1, 3, 'Burger', '/images/burger.jpeg', 'Chicken Patty inside Burger Bun with Mayonnaise and Ketchup', 2, 'Burger', 30),
(2, 3, 'Pizza', '/images/pizza.jpeg', 'Pizza with the toppings of Sausage, Bell Pepper and Barbeque Sauce', 2, 'Pizza', 40),
(5, 3, 'Pasta', '/images/productPic-1664244030054.jpg', 'Penne Pasta with chicken, Carrot and Pasta Sauce', NULL, NULL, 30),
(8, 3, 'Club Sandwich', '/images/productPic-1664405278549.jpg', 'Made with egg chicken and bread', NULL, NULL, 25),
(9, 3, 'Coca Cola', '/images/productPic-1665351861234.jpg', '250 ml ', NULL, NULL, 25),
(10, 6, 'Porota', '/images/productPic-1665354871009.jpg', 'Fried Flat Bread', NULL, NULL, 5),
(11, 6, 'Daal', '/images/productPic-1665355217261.jpg', 'Lentil Curry', NULL, NULL, 18),
(12, 6, 'Sobji', '/images/productPic-1665355413454.jpg', 'Mixed Vegetable Curry', NULL, NULL, 18),
(13, 6, 'Khichuri', '/images/productPic-1665355794213.jpg', 'Rice mixed with lentils', NULL, NULL, 30),
(14, 6, 'Chicken Bhuna', '/images/productPic-1665355899018.jpg', 'Chicken Curry', NULL, NULL, 40),
(15, 6, 'Egg Bhuna', '/images/productPic-1665356016776.jpg', 'Egg Curry', NULL, NULL, 35),
(16, 6, 'Fanta', '/images/productPic-1665356050394.jpg', '250 ml', NULL, NULL, 25),
(17, 4, 'Fried Rice', '/images/productPic-1665356166518.jpg', 'rice cooked with vegetables', NULL, NULL, 35),
(18, 4, 'Chicken Fry', '/images/productPic-1665356289068.jpg', 'Fried Chicken', NULL, NULL, 45),
(19, 4, 'Chinese Vegetable ', '/images/productPic-1665356400080.jpg', 'mixed vegatable', NULL, NULL, 25),
(20, 4, 'Chili Chicken', '/images/productPic-1665356831235.jpg', 'chicken cooked in chinese style', NULL, NULL, 35),
(21, 4, 'Biryani', '/images/productPic-1665356970112.jpg', 'Chicken Biryani', NULL, NULL, 100),
(22, 4, 'Chicken Roast', '/images/productPic-1665357087038.jpg', 'chicken cooked in mughal style', NULL, NULL, 50),
(23, 4, 'Polao', '/images/productPic-1665357200134.jpg', 'rice cooked in mughal style', NULL, NULL, 30),
(24, 4, 'Sprite ', '/images/productPic-1665357255684.jpg', '250 ml', NULL, NULL, 25);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `user_name` varchar(10) DEFAULT NULL,
  `pass` text DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `user_type` varchar(10) DEFAULT NULL,
  `image_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `user_name`, `pass`, `first_name`, `last_name`, `user_type`, `image_link`) VALUES
(1, '011182072', '1234', 'Farhana ', 'Rimi', 'student', ''),
(2, '011182100', '1234', 'K.M Zawad', 'Monsur', 'student', ''),
(3, 'Kk', '1234', 'Khans', 'Kitchen', 'vendor', '/images/khans1.jpg'),
(4, 'Oc', '1234', 'Olympia', 'Cafe', 'vendor', '/images/olympia1.jpg'),
(5, '011182118', '1234', 'Arafat', 'Haque', 'student', '/images/amh.jpg'),
(6, 'Bk', '1234', 'Bikrampur', 'Kitchen', 'vendor', '/images/vikrampur.jpg'),
(7, 'Ic', '1234', 'Indulge', 'Cafe', 'vendor', '/images/indulge.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
