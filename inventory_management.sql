-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2025 at 07:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `help_support`
--

CREATE TABLE `help_support` (
  `help_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `help_support`
--

INSERT INTO `help_support` (`help_id`, `title`, `content`) VALUES
(1, 'How to Add Inventory', 'Follow these steps to add items to the inventory...'),
(2, 'Order Management FAQ', 'Common questions about managing orders...');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`item_id`, `item_name`, `description`, `quantity`, `price`, `category`, `added_on`) VALUES
(1, 'Laptop', 'Dell Inspiron 15', 10, 750.00, 'Electronics', '2024-12-13 13:11:45'),
(2, 'Phone', 'Samsung Galaxy S22', 20, 999.00, 'Mobile', '2024-12-13 13:11:45'),
(3, 'Desk Chair', 'Ergonomic Office Chair', 15, 150.00, 'Furniture', '2024-12-13 13:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','canceled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_name`, `order_date`, `total_amount`, `status`) VALUES
(1, 'John Doe', '2024-12-13 13:12:05', 1200.00, 'completed'),
(2, 'Jane Smith', '2024-12-13 13:12:05', 500.00, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_id`, `quantity`, `price`) VALUES
(1, 1, 1, 2, 1500.00),
(2, 2, 3, 1, 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `stock`, `description`) VALUES
(11, 'ball', 'childern', 900.00, 5, 'beautiful ball'),
(12, 't-shirt', 'men', 1500.00, 15, 'betutiful shirt'),
(14, 'ball', 'kids', 1200.00, 9, 'rrtrtgjjjh');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `report_type` varchar(50) NOT NULL,
  `generated_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `report_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `report_type`, `generated_on`, `report_file`) VALUES
(1, 'Sales', '2024-12-13 13:13:11', '/path/to/sales_report.pdf'),
(2, 'Inventory', '2024-12-13 13:13:11', '/path/to/inventory_report.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL,
  `setting_name` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `setting_name`, `value`) VALUES
(1, 'Site Title', 'Inventory Management System'),
(2, 'Theme Color', 'Blue');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `confirm_password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `phone`, `password`, `confirm_password`, `role`, `created_at`) VALUES
(16, 'tgggrtrtrr', 'rry@gmail.com', '0765432456', 'tr@12345', 'tr@12345', 'user', '2024-12-23 14:06:30'),
(20, 'xyzabc', 'xyz@gmail.com', '0987654234', 'xyz@1234', 'xyz@1234', 'admin', '2024-12-23 14:22:21'),
(28, 'PinkuTata', 'qwe@gmail.com', '0741149395', 'qwe@123456', 'qwe@123456', 'user', '2024-12-23 14:26:44'),
(30, 'AshanKavi', 'kavi@gmail.com', '0782529259', 'kavi@12345', 'kavi@12345', 'user', '2024-12-24 04:07:01'),
(32, 'AshanKavi', 'kavia@gmail.com', '0782529258', 'kavia1234', 'kavia1234', 'admin', '2024-12-24 04:09:45'),
(33, 'janudhi', 'janu1@gmail.com', '0782529259', 'janu@123', 'janu@123', 'user', '2024-12-24 04:40:27'),
(34, 'Tharushi', 'tharu@gmail.com', '0741149395', 'tharu@1234', 'tharu@1234', 'user', '2024-12-24 04:43:51'),
(38, 'Sunethra', 'sune@gmail.com', '0987654234', 'sune@1234', 'sune@1234', 'user', '2024-12-24 05:11:32'),
(39, 'Jayasinghe', 'jaya1@gmail.com', '0763195706', 'jaya1234', 'jaya1234', 'user', '2024-12-24 05:14:07'),
(40, 'Admin', 'admin@gmail.com', '0782529259', 'admin@123', 'admin@123', 'admin', '2024-12-24 05:16:59'),
(41, 'Janudhi_123', 'janu2@gmail.com', '0765432456', 'janu@1234', 'janu@1234', 'user', '2025-01-05 04:31:17'),
(42, 'Kasun_123', 'kasun1@gmail.com', '0782529259', 'Kasun@1234', 'Kasun@1234', 'user', '2025-01-05 04:51:38'),
(43, 'Dilmi_R1', 'dilimi@gmail.com', '0782529259', 'dilmi@123', 'dilmi@123', 'user', '2025-01-05 15:00:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `help_support`
--
ALTER TABLE `help_support`
  ADD PRIMARY KEY (`help_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `help_support`
--
ALTER TABLE `help_support`
  MODIFY `help_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`item_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
