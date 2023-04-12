-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2023 at 09:37 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mylast`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `img`) VALUES
(1, 'Fish', 'Fish is always lighter and better for the people which they do not want to eat fish', 'img/meat.jpeg'),
(2, 'Vegetarian', 'U are not eating meat that is why we mad this for u', 'img/vegetarian.jpg'),
(3, 'Meet', 'with meat and chicken this will be ready for u ', 'img/fish.jpg ');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230317141156', '2023-03-17 15:12:14', 1188),
('DoctrineMigrations\\Version20230317145233', '2023-03-17 15:52:40', 145),
('DoctrineMigrations\\Version20230321084758', '2023-03-21 09:48:05', 1058),
('DoctrineMigrations\\Version20230324095927', '2023-03-24 10:59:33', 339);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pizza_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `size`, `first_name`, `last_name`, `adres`, `postcode`, `email`, `pizza_id`, `status`) VALUES
(20, 'medium', 'as', 'asas', 'asas', '9922', 'nnn@gmail.com', 1, 'todo');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `description`, `img`, `price`) VALUES
(1, 1, 'Pepperoni Pizza', ' This classic pizza features a tomato sauce base, melted mozzarella cheese, and delicious slices of spicy pepperoni. The pepperoni is usually slightly crispy and the flavors are savory, slightly spicy, and salty. It\'s a pizza that everyone loves, and it\'s', 'pizzaMeat/meat1.jpg', '5.00'),
(2, 1, 'BBQ Chicken Pizza', 'This pizza starts with a BBQ sauce base, which is then topped with melted mozzarella cheese,', 'pizzaMeat/meat2.jpg', NULL),
(3, 3, 'Margherita Pizza', ' This classic pizza features a perfectly crispy crust topped with a simple yet delicious combination of tomato sauce', 'pizzaVe/ve1.jpg', NULL),
(4, 3, 'Mediterranean Pizza', 'This vegetarian pizza takes inspiration from the vibrant flavors of the Mediterranean region', 'pizzaVe/ve2.jpg', '5.00'),
(5, 2, 'Salmon Pizza', 'This pizza features a deliciously crispy crust topped with a flavorful combination of tomato sauce, mozzarella cheese', 'pizzaFish/fish1.jpg', '5.00'),
(6, 2, 'Tuna Pizza', 'This unique pizza is loaded with all the bold and zesty flavors of the sea', 'pizzaFish/fish2.jpg', '5.00'),
(7, 1, 'PaninatoPizza', ' The pepperoni is usually slightly crispy and the flavors are savory, slightly spicy, and salty. It\'s a pizza that everyone loves, and it\'s This classic pizza features a tomato sauce base, melted mozzarella cheese, and delicious slices of spicy pepperoni.', 'pizzaMeat/meat3.jpg', '5.00'),
(8, 3, 'Manamonate Pizza', ' delicious combination of tomato sauce This classic pizza features a perfectly crispy crust topped with a simple yet ', 'pizzaVe/ve3.jpg', NULL),
(9, 2, 'Salamander Pizza', 'with a flavorful combination of tomato sauce, mozzarella cheese \r\nThis pizza features a deliciously crispy crust topped ', 'pizzaFish/fish3.jpg', '5.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398D41D1D42` (`pizza_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398D41D1D42` FOREIGN KEY (`pizza_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
