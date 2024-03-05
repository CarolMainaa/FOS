-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2024 at 05:44 PM
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
-- Database: `fos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(1, 'admin', 'CAC29D7A34687EB14B37068EE4708E7B', 'admin@mail.com', '', '2022-12-02 13:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(3, 2, 'Samosa', 'Samosa is a popular triangular pastry filled with potatoes, minced meat or green grams. They come served with kachumbari.', 50.00, '65c9e251f41c5.jpeg'),
(5, 3, 'Mshakiki', 'A quick snack consisting of grilled pieces of beef, chicken or goat stacked in a small wooden stick. They can be spicy or non spicy.', 100.00, '65c9d7981fc71.jpeg'),
(6, 1, 'Rice Stew', 'A Perfect dish of white rice accompanied with beans, green grams, chicken or beef stew. Also served with veggies.', 200.00, '65c9d5461c998.jpg'),
(7, 1, 'Chapo stew', 'A flavourful dish of chapati accompanied with either beef/chicken stew, beans, peas or green grams and any veggies of your choice. ', 150.00, '65c9e31b2c31c.jpg'),
(8, 1, 'Mokimo', 'This is a classic dish of mashed potatoes with boiled maize and green veggies. comes with chicken/ beef stew and kachumbari.', 250.00, '65c9d2b2c11be.jpeg'),
(9, 3, 'Tamarind Chicken', 'A savoury and tangy dish of marinated chicken pieces in tamarind paste. It comes served with rice, ugali or plain chips.', 350.00, '65c9d955e8acd.jpg'),
(10, 2, 'Bhajia', 'A snack made by coating potatoes in flour batter then deep frying until crispy. Served with sauces like tamarid, chill or tomato. ', 150.00, '65c9d12c027d0.jpg'),
(11, 2, 'Viazi Karai', 'Viazi karai is a popular Kenyan street food made from deep-fried spicy potatoes. Served with tomato, tamarind or chilli sauces.', 150.00, '65c9d0433c416.jpg'),
(12, 4, 'Shawarma', 'A quick swahili snack consisting of thinly sliced pieces of chicken, beef or lamb and veggies all wrapped in a flatbread.', 200.00, '65c9da4d5de29.jpg'),
(13, 3, 'Chips masala', 'This dish consists of crispy potato chips tossed in a medley of aromatic spices like corriander and chaat masala.', 300.00, '65c9ce22ae350.jpg'),
(14, 3, 'Nyama choma', 'Grilled or roasted meat, typically beef or goat, seasoned with spices. It comes served with Ugali, kachumbari and vegetables.', 450.00, '65c9e38f89916.jpg'),
(15, 4, 'Biryani', 'A flavourful rice cooked with a medley of spices, tender meats, vegetables and enriched with ghee or yogurt, resulting in a satisfying one-pot meal.', 400.00, '65c9e44934eb3.jpg'),
(16, 4, 'Pilau', 'Pilau is a fragrant rice dish, cooked with a blend of aromatic spices such as cumin, cardamom, and cloves, resulting in a richly seasoned main course. ', 300.00, '65c9e4c22ba4d.jpeg'),
(17, 2, 'Hotdog', 'Savor the perfect blend of juicy beef, pork and vegetable salad encased in a harmonious  golden, pillowy bun.', 150.00, '65ca1927ee8bb.jpeg'),
(18, 1, 'Githeri', 'A traditional kenyan meal consisting of boiled maize and beans, seasoned with ovacado and fresh corriander.', 150.00, '65c9cc2281f99.jpg'),
(19, 2, 'Pizza', 'mushroom pizza', 2.00, '65e1e409bb5da.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `remark`
--

INSERT INTO `remark` (`id`, `frm_id`, `status`, `remark`, `remarkDate`) VALUES
(1, 2, 'in process', 'none', '2022-05-01 05:17:49'),
(2, 3, 'in process', 'none', '2022-05-27 11:01:30'),
(3, 2, 'closed', 'thank you for your order!', '2022-05-27 11:11:41'),
(4, 3, 'closed', 'none', '2022-05-27 11:42:35'),
(5, 4, 'in process', 'none', '2022-05-27 11:42:55'),
(6, 1, 'rejected', 'none', '2022-05-27 11:43:26'),
(7, 7, 'in process', 'none', '2022-05-27 13:03:24'),
(8, 8, 'in process', 'none', '2022-05-27 13:03:38'),
(9, 9, 'rejected', 'thank you', '2022-05-27 13:03:53'),
(10, 7, 'closed', 'thank you for your ordering with us', '2022-05-27 13:04:33'),
(11, 8, 'closed', 'thanks ', '2022-05-27 13:05:24'),
(12, 5, 'closed', 'none', '2022-05-27 13:18:03'),
(13, 5, 'closed', 'thanks', '2023-11-27 23:17:17'),
(14, 11, 'in process', 'Coming right up!', '2024-01-29 09:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(1, 3, 'Safari Restaurant ', 'safariafrica@gmail.com', '0733115787', 'www.safarirestaurant.com', '6am', '7pm', 'mon-fri', 'Mnyamwezi St', '65c1e0d8a8707.jpg', '2024-02-06 07:33:44'),
(2, 2, 'Urban Spice', 'spiceurban@gmail.com', '0722100345', 'www.urbanSpice.com', '8am', '7pm', 'mon-sat', '  32555 Moi avenue  ', '65c4897c7d4ac.jpg', '2024-02-08 07:57:48'),
(3, 4, 'Crusty Hub', 'info_crustyhub@outlook.com', '0795229890', 'www.crustyhubkenya.com', '6am', '8pm', 'mon-sat', '415 Dedan Kimathi Av', '65c1e2925cccb.jpg', '2024-02-06 07:41:06'),
(4, 1, 'Swahili Dishes', 'swhldishes@gmail.com', '0700230088', 'www.swahilidishes.com', '6am', '8pm', 'mon-sat', ' 44550 Jomo Kenyatta Avenue ', '65c1d9502026e.jpg', '2024-02-06 07:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(1, 'Swahili', '2024-02-06 07:02:18'),
(2, 'Street Culture', '2024-02-06 07:06:54'),
(3, 'AfroFusion', '2024-02-06 07:07:23'),
(4, 'Grill', '2024-02-06 07:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(2, 'harry', 'Harry', 'Holt', 'harryh@mail.com', '3578545458', 'bc28715006af20d0e961afd053a984d9', '33 Stadium Drive', 1, '2023-12-02 08:41:07'),
(4, 'christine', 'Christine', 'Moore', 'christine@mail.com', '7412580010', '5f4dcc3b5aa765d61d8327deb882cf99', '114 Test Address', 1, '2023-12-02 05:14:42'),
(5, 'scott', 'Scott', 'Miller', 'scott@mail.com', '7896547850', '5f4dcc3b5aa765d61d8327deb882cf99', '63 Charack Road', 1, '2023-12-29 10:53:51'),
(7, 'Jsmith', 'james', 'smith', 'jsmith@myisp.co.uk', '0897654328', '39ce7e2a8573b41ce73b5ba41617f8f7', '30245', 1, '2024-01-10 23:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `u_id` (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD CONSTRAINT `users_orders_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
