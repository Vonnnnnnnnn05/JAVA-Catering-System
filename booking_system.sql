-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 06:39 AM
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
-- Database: `booking_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `venue` text NOT NULL,
  `guest_count` int(11) NOT NULL,
  `status` enum('Pending','Confirmed','Cancelled','Completed') DEFAULT 'Pending',
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `special_requests` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `customer_id`, `event_type`, `event_date`, `event_time`, `venue`, `guest_count`, `status`, `total_amount`, `special_requests`, `created_at`) VALUES
(1, 1, 'Birthday Party', '2025-11-25', '14:00:00', '123 Main St, Manila', 50, 'Pending', 15000.00, 'Please bring balloons in blue color', '2025-11-16 05:50:37'),
(2, 2, 'Wedding', '2025-12-15', '16:00:00', 'Garden Events Hall, Quezon City', 200, 'Pending', 150000.00, 'Vegetarian options needed', '2025-11-16 05:50:37'),
(3, 3, 'Corporate Event', '2025-11-30', '10:00:00', 'Makati Business Center', 100, 'Pending', 50000.00, 'Need projector and sound system', '2025-11-16 05:50:37'),
(4, 1, 'Birthday', '2025-07-07', '16:00:00', 'gawas', 100, 'Pending', 0.00, 'song', '2025-11-25 09:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `fullname`, `email`, `password`, `phone`, `address`, `created_at`) VALUES
(1, 'John Doe', 'john@gmail.com', 'password123', '09171234567', '123 Main St, Manila', '2025-11-16 05:50:37'),
(2, 'Jane Smith', 'jane@gmail.com', 'password123', '09187654321', '456 Oak Ave, Quezon City', '2025-11-16 05:50:37'),
(3, 'Maria Garcia', 'maria@gmail.com', 'password123', '09198765432', '789 Pine Rd, Makati', '2025-11-16 05:50:37'),
(4, 'dsada', 'dsadsa@sdsad', '1234511', '09090909', 'sdsadas', '2025-11-21 12:04:05'),
(6, 'Package A', 'Food', 'Namir', '99', 'Unavailable', '2025-11-21 12:51:40'),
(7, 'dsadad', 'sadsad', 'dsadsa', '1', 'Available', '2025-11-21 12:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comments` text DEFAULT NULL,
  `feedback_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `reorder_level` int(11) DEFAULT 10,
  `supplier` varchar(100) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `item_name`, `category`, `quantity`, `unit`, `reorder_level`, `supplier`, `last_updated`) VALUES
(1, 'Chicken (Whole)', 'Meat', 50, 'kg', 20, 'Fresh Meat Supplier', '2025-11-16 05:50:37'),
(2, 'Pork (Whole)', 'Meat', 80, 'kg', 30, 'Fresh Meat Supplier', '2025-11-16 05:50:37'),
(3, 'Rice', 'Grains', 200, 'kg', 50, 'Rice Distributor', '2025-11-16 05:50:37'),
(4, 'Cooking Oil', 'Condiments', 40, 'liters', 15, 'General Supplier', '2025-11-16 05:50:37'),
(5, 'Soy Sauce', 'Condiments', 30, 'liters', 10, 'General Supplier', '2025-11-16 05:50:37'),
(6, 'Onions', 'Vegetables', 25, 'kg', 10, 'Vegetable Market', '2025-11-16 05:50:37'),
(7, 'Garlic', 'Vegetables', 15, 'kg', 5, 'Vegetable Market', '2025-11-16 05:50:37'),
(8, 'Tomatoes', 'Vegetables', 20, 'kg', 8, 'Vegetable Market', '2025-11-16 05:50:37'),
(9, 'Disposable Plates', 'Supplies', 500, 'pcs', 100, 'Party Supplies Co.', '2025-11-16 05:50:37'),
(10, 'Disposable Cups', 'Supplies', 500, 'pcs', 100, 'Party Supplies Co.', '2025-11-16 05:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `menu_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `availability` enum('Available','Unavailable') DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`menu_id`, `item_name`, `category`, `description`, `price`, `availability`, `created_at`) VALUES
(2, 'Wedding Package Premium', 'Package', 'Premium wedding package for 200 pax with full catering service', 150000.00, 'Available', '2025-11-16 05:50:37'),
(3, 'Corporate Event Packages', 'Package', 'Business event package for 100 pax with professional setup', 50000.00, 'Available', '2025-11-16 05:50:37'),
(5, 'Pancit Canton', 'Main Course', 'Stir-fried noodles with vegetables', 1500.00, 'Available', '2025-11-16 05:50:37'),
(6, 'Chicken BBQ', 'Main Course', 'Grilled chicken skewers (50 pcs)', 2500.00, 'Available', '2025-11-16 05:50:37'),
(7, 'Fresh Lumpia', 'Appetizer', 'Fresh spring rolls (100 pcs)', 1200.00, 'Available', '2025-11-16 05:50:37'),
(8, 'Fruit Salad', 'Dessert', 'Mixed fruit dessert for 50 pax', 1000.00, 'Available', '2025-11-16 05:50:37'),
(9, 'Chocolate Cake', 'Dessert', '3-layer chocolate cake', 2000.00, 'Available', '2025-11-16 05:50:37'),
(10, 'Iced Tea (Pitcher)', 'Beverage', '2-liter pitcher', 200.00, 'Available', '2025-11-16 05:50:37'),
(11, 'Package A', 'dsd', 'sdasd', 99.00, 'Available', '2025-11-21 12:54:04');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Processing','Completed','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `booking_id`, `customer_id`, `order_date`, `total_amount`, `status`) VALUES
(13, 3, 3, '2025-11-25 12:54:41', 99.00, 'Pending'),
(14, 3, 3, '2025-11-25 13:03:43', 99.00, 'Pending'),
(15, 3, 3, '2025-11-25 13:07:12', 1200.00, 'Pending'),
(16, 3, 3, '2025-11-25 13:17:55', 200.00, 'Pending'),
(17, 3, 3, '2025-11-25 13:22:04', 1000.00, 'Pending'),
(18, 3, 3, '2025-11-25 13:27:17', 200.00, 'Pending'),
(19, 3, 3, '2025-11-26 07:28:19', 150099.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `menu_id`, `quantity`, `price`, `subtotal`) VALUES
(14, 13, 11, 1, 99.00, 99.00),
(15, 14, 11, 1, 99.00, 99.00),
(16, 15, 7, 1, 1200.00, 1200.00),
(17, 16, 10, 1, 200.00, 200.00),
(18, 17, 8, 1, 1000.00, 1000.00),
(19, 18, 10, 1, 200.00, 200.00),
(20, 19, 2, 1, 150000.00, 150000.00),
(21, 19, 11, 1, 99.00, 99.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash','Credit Card','Debit Card','GCash','PayMaya','Bank Transfer') NOT NULL,
  `payment_status` enum('Pending','Paid','Refunded') DEFAULT 'Pending',
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_reference` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `booking_id`, `customer_id`, `amount`, `payment_method`, `payment_status`, `payment_date`, `transaction_reference`) VALUES
(7, 3, 3, 50000.00, 'Debit Card', 'Paid', '2025-11-25 12:54:46', 'TXN-1764075286666'),
(8, 3, 3, 50000.00, 'Credit Card', 'Paid', '2025-11-25 13:03:53', 'TXN-1764075833416'),
(9, 3, 3, 50000.00, 'GCash', 'Paid', '2025-11-25 13:07:20', 'TXN-1764076040775'),
(10, 3, 3, 1598.00, 'Cash', 'Paid', '2025-11-25 13:17:59', 'TXN-899212494'),
(11, 3, 3, 2598.00, 'Credit Card', 'Paid', '2025-11-25 13:22:09', 'TXN-503477468'),
(12, 3, 3, 2798.00, 'Cash', 'Paid', '2025-11-25 13:27:24', 'TXN-950748577'),
(13, 3, 3, 152897.00, 'Bank Transfer', 'Paid', '2025-11-26 07:28:28', 'TXN-934077429');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `idx_booking_customer` (`customer_id`),
  ADD KEY `idx_booking_date` (`event_date`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_customer_email` (`email`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_order_booking` (`booking_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_payment_booking` (`booking_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu_items` (`menu_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
