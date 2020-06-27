-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 25, 2020 at 01:00 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `villabooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `card_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` int(11) DEFAULT NULL,
  `expire_year` int(11) DEFAULT NULL,
  `expire_month` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `first_name`, `last_name`, `email`, `phone`, `country`, `state`, `city`, `street`, `zip`, `card_name`, `card_number`, `expire_year`, `expire_month`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ali', 'alavi', 'mbm@gmail.com', 87654664, 'Iran', NULL, NULL, 'modbury', NULL, NULL, NULL, NULL, NULL, '2020-05-14 19:47:12', '2020-05-14 19:47:12'),
(2, NULL, 'ali', 'alavi', 'mbm@gmail.com', 87654664, 'Iran', NULL, NULL, 'modbury', NULL, NULL, NULL, NULL, NULL, '2020-05-14 19:48:02', '2020-05-14 19:48:02'),
(3, NULL, 'ali', 'alavi', 'mbm@gmail.com', 87654664, 'Iran', NULL, NULL, 'modbury', NULL, NULL, NULL, NULL, NULL, '2020-05-14 19:55:36', '2020-05-14 19:55:36'),
(4, NULL, 'ali', 'alavi', 'mbm@gmail.com', 87654664, 'Iran', NULL, NULL, 'modbury', NULL, NULL, NULL, NULL, NULL, '2020-05-14 19:55:36', '2020-05-14 19:55:36'),
(5, NULL, 'ali', 'alavi', 'mbm@gmail.com', 87654664, 'Iran', NULL, NULL, 'modbury', NULL, NULL, NULL, NULL, NULL, '2020-05-14 20:15:15', '2020-05-14 20:15:15'),
(6, NULL, 'yy', 'yjj', 'mehdii@gmail.com', 66544, 'jk', NULL, NULL, 'gff', NULL, NULL, NULL, NULL, NULL, '2020-05-14 22:26:40', '2020-05-14 22:26:40'),
(7, NULL, 'yy', 'jjj', 'admin@gmail.com', 958575, 'ghh', NULL, NULL, 'fd', NULL, NULL, NULL, NULL, NULL, '2020-05-14 22:48:36', '2020-05-14 22:48:36'),
(8, NULL, 'htt', 'hjj', 'info@dd.com', 947900, 'thhj', NULL, NULL, 'ewerg', NULL, NULL, NULL, NULL, NULL, '2020-05-14 23:41:48', '2020-05-14 23:41:48'),
(9, NULL, 'gh', 'ree', 'jjhj@ghjk', 5555, 're', NULL, NULL, 'hjj', NULL, NULL, NULL, NULL, NULL, '2020-05-14 23:54:16', '2020-05-14 23:54:16'),
(10, NULL, 'hh', 'gg', 'mehdii@gmail.com', 766, 'mt', NULL, NULL, 'm,', NULL, NULL, NULL, NULL, NULL, '2020-05-15 00:05:28', '2020-05-15 00:05:28'),
(11, NULL, 'yy', 'yy', 'admin@gmail.com', 554, 'hjj', NULL, NULL, 'rdf', NULL, NULL, NULL, NULL, NULL, '2020-05-15 00:21:22', '2020-05-15 00:21:22'),
(12, NULL, 'mrgg', 'hnm,', 'info@clicksite.ir', 556, 'jk', NULL, NULL, 'jkk', NULL, NULL, NULL, NULL, NULL, '2020-05-15 00:23:38', '2020-05-15 00:23:38'),
(13, NULL, 'ali', 'alavi', 'mbm@gmail.com', 87654664, 'Iran', NULL, NULL, 'modbury', NULL, NULL, NULL, NULL, NULL, '2020-05-15 20:11:34', '2020-05-15 20:11:34'),
(14, NULL, 'mm', 'jhhg', 'jjhj@ghjk', 655, 'hj', NULL, NULL, 'jkkl', NULL, NULL, NULL, NULL, NULL, '2020-05-15 20:16:42', '2020-05-15 20:16:42'),
(15, NULL, 'hhh', 'jjjj', 'akbar@gmail.com', 555, 'kkk', NULL, NULL, 'jkk', NULL, NULL, NULL, NULL, NULL, '2020-05-17 02:25:15', '2020-05-17 02:25:15'),
(16, NULL, 'hh', 'ggg', 'info@clicksite.ir', 6554, 'hgg', NULL, NULL, 'jkk', NULL, NULL, NULL, NULL, NULL, '2020-05-17 02:28:12', '2020-05-17 02:28:12'),
(17, NULL, 'hhh', 'jk', 'jjhj@ghjk', 655, 'fff', NULL, NULL, 'jjk', NULL, NULL, NULL, NULL, NULL, '2020-05-17 02:29:51', '2020-05-17 02:29:51'),
(18, NULL, 'ddd', 'fff', 'info@clicksite.ir', 222, 'cd', NULL, NULL, 'bbb', NULL, NULL, NULL, NULL, NULL, '2020-05-17 02:38:20', '2020-05-17 02:38:20'),
(19, NULL, 'vvd', 'fddd', 'jjhj@ghjk', 111, 'ddf', NULL, NULL, 'vbb', NULL, NULL, NULL, NULL, NULL, '2020-05-17 02:39:28', '2020-05-17 02:39:28'),
(20, NULL, 'gghh', 'hhg', 'info@dd.com', 4322, 'fdd', NULL, NULL, 'jmm', NULL, NULL, NULL, NULL, NULL, '2020-05-17 14:45:48', '2020-05-17 14:45:48'),
(21, NULL, 'hggg', 'fghh', 'jjhj@ghjk', 43322, 'hhhj', NULL, NULL, 'gfff', NULL, NULL, NULL, NULL, NULL, '2020-05-19 23:15:23', '2020-05-19 23:15:23'),
(22, NULL, 'Mehdi', 'rezaei', 'mbb@gmail.com', 37364547, 'Australia', NULL, NULL, 'Modbury', NULL, NULL, NULL, NULL, NULL, '2020-05-21 13:49:44', '2020-05-21 13:49:44'),
(23, NULL, 'Saeid', 'Rezaei', 'saeid@gmail.com', 94757666, 'Iran', NULL, NULL, 'Azadi', NULL, NULL, NULL, NULL, NULL, '2020-05-21 18:25:04', '2020-05-21 18:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `bookables`
--

CREATE TABLE `bookables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `Location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rooms` bigint(20) DEFAULT NULL,
  `area` bigint(20) DEFAULT NULL,
  `capacity` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pool` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wifi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `booking_count` bigint(20) NOT NULL DEFAULT 0,
  `review_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookables`
--

INSERT INTO `bookables` (`id`, `user_id`, `title`, `description`, `image`, `price`, `Location`, `Address`, `rooms`, `area`, `capacity`, `pool`, `wifi`, `created_at`, `updated_at`, `booking_count`, `review_count`) VALUES
(1, 1, 'Villa With pool', 'It is located in a perfect place. Easy access to all supermarket and facilities around you.The free Wifi also provided to all residents.Also all other facilities provided to you.Enjoy it!', './Images/1.jpg', 200, 'Sydney', '40-66 Smart Road, Modbury NSW, 5090', 2, 500, '4~6', 'Yes', 'No', '2020-05-02 14:30:00', '2020-05-21 02:29:15', 6, 1),
(2, 1, 'Big House', 'It is located in a perfect place. Easy access to all supermarket and facilities around you.The free Wifi also provided to all residents.Also all other facilities provided to you.Enjoy it!', './Images/2.jpg', 400, 'Adelaide', '40-66 Smart Road, Modbury SA, 5090', 4, 700, '6~8', 'No', 'No', '2020-04-30 14:30:00', '2020-04-30 14:30:00', 2, 1),
(3, 1, 'Luxurious Villa', 'It is located in a perfect place. Easy access to all supermarket and facilities around you.The free Wifi also provided to all residents.Also all other facilities provided to you.Enjoy it!', './Images/3.jpg', 2000, 'Sydney', '40-66 Smart Road, Modbury NSW, 5090', 3, 1000, '6~9', 'Yes', 'Yes', '2020-05-01 14:30:00', '2020-05-21 13:49:44', 7, 3),
(4, 2, 'Small house', 'It is located in a perfect place. Easy access to all supermarket and facilities around you.The free Wifi also provided to all residents.Also all other facilities provided to you.Enjoy it!', './Images/4.jpg', 100, 'Melbourne', '40-66 Smart Road, Modbury VIC, 5090', 1, 300, '2~4', 'No', 'Yes', '2020-05-02 14:30:00', '2020-05-02 14:30:00', 3, 3),
(5, 2, 'Beautiful Villa with pool', 'It is located in a perfect place. Easy access to all supermarket and facilities around you.The free Wifi also provided to all residents.Also all other facilities provided to you.Enjoy it!', './Images/5.jpg', 1000, 'Sydney', '40-66 Smart Road, Modbury NSW, 5090', 2, 500, '3~6', 'Yes', 'Yes', '2020-05-03 14:30:00', '2020-05-03 14:30:00', 1, 2),
(6, 2, 'Spacious Villa ', 'It is located in a perfect place. Easy access to all supermarket and facilities around you.The free Wifi also provided to all residents.Also all other facilities provided to you.Enjoy it!', './Images/6.jpg', 500, 'Melbourne', '40-66 Smart Road, Modbury VIC, 5090', 3, 400, '4~6', 'Yes', 'Yes', '2020-05-04 14:30:00', '2020-05-19 23:35:41', 1, 1),
(7, 2, 'House With Pool', 'It is located in a perfect place. Easy access to all supermarket and facilities around you.The free Wifi also provided to all residents.Also all other facilities provided to you.Enjoy it!', './Images/7.jpg', 800, 'Adelaide', '40-66 Smart Road, Modbury SA, 5090', 2, 500, '3~5', 'No', 'Yes', '2020-05-05 14:30:00', '2020-05-05 14:30:00', 0, 0),
(8, 2, 'Beautiful Villa', 'It is located in a perfect place. Easy access to all supermarket and facilities around you.The free Wifi also provided to all residents.Also all other facilities provided to you.Enjoy it!', './Images/8.jpg', 990, 'Melbourne', '40-66 Smart Road, Modbury VIC, 5090', 1, 300, '2~4', 'No', 'Yes', '2020-05-08 14:30:00', '2020-05-08 14:30:00', 0, 0),
(28, 2, 'Beautiful Villa', 'It is Very beautiful place.', 'F:\\XAMPP\\tmp\\phpC8A4.tmp', 550, 'Perth', '32-40 Rolly Street WA', 3, 400, '3~5', 'No', 'No', '2020-05-21 02:53:33', '2020-05-21 02:53:33', 0, 0),
(29, 1, 'Forest Villa', 'Very spacious and green villa!', 'F:\\XAMPP\\tmp\\phpAB48.tmp', 850, 'Sydney', 'Forest Sydney area', 4, 500, '+8', 'No', 'No', '2020-05-21 13:11:38', '2020-05-21 18:26:15', 1, 1),
(30, 2, 'Perfect Villa', 'It is very convenient Villa', 'F:\\XAMPP\\tmp\\php7C4.tmp', 700, 'Gold Coast', '32-66 Rend Road Ql', 4, 600, '4~6', 'No', 'No', '2020-05-21 14:33:56', '2020-05-21 14:33:56', 0, 0),
(36, 2, 'Cheap Villa', 'It is very well affordable item.', 'F:\\XAMPP\\tmp\\phpB35C.tmp', 150, 'Perth', '30-44 Reservoir Rd, WA', 2, 250, '2~4', 'Yes', 'Yes', '2020-05-21 18:42:37', '2020-05-21 18:42:37', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `bookable_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `review` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `from`, `to`, `bookable_id`, `price`, `user_id`, `address_id`, `review`, `created_at`, `updated_at`) VALUES
(9, '2020-06-12', '2020-06-16', 1, 200, NULL, 2, 91, '2020-05-14 19:48:03', '2020-05-14 19:48:03'),
(10, '2020-06-19', '2020-06-25', 1, 200, NULL, 3, 92, '2020-05-14 19:55:36', '2020-05-14 19:55:36'),
(11, '2020-06-28', '2020-06-30', 1, 200, NULL, 4, 93, '2020-05-14 19:55:36', '2020-05-14 19:55:36'),
(12, '2020-07-19', '2020-07-21', 1, 600, NULL, 5, 94, '2020-05-14 20:15:15', '2020-05-14 20:15:15'),
(13, '2020-07-03', '2020-07-10', 3, 32000, NULL, 6, 95, '2020-05-14 22:26:40', '2020-05-14 22:26:40'),
(14, '2020-07-03', '2020-07-10', 4, 800, NULL, 7, 96, '2020-05-14 22:48:36', '2020-05-14 22:48:36'),
(15, '2020-07-21', '2020-07-25', 3, 20000, NULL, 8, 97, '2020-05-14 23:41:48', '2020-05-14 23:41:48'),
(16, '2020-08-07', '2020-08-13', 3, 28000, NULL, 9, 98, '2020-05-14 23:54:16', '2020-05-14 23:54:16'),
(17, '2020-08-02', '2020-08-04', 3, 12000, NULL, 10, 99, '2020-05-15 00:05:28', '2020-05-15 00:05:28'),
(18, '2020-09-01', '2020-09-03', 3, 12000, NULL, 11, 88, '2020-05-15 00:21:23', '2020-05-15 00:21:23'),
(19, '2020-09-01', '2020-09-03', 4, 300, NULL, 12, 77, '2020-05-15 00:23:38', '2020-05-15 00:23:38'),
(20, '2020-10-19', '2020-10-21', 1, 600, 2, 13, 66, '2020-05-15 20:11:34', '2020-05-15 20:11:34'),
(21, '2020-09-10', '2020-09-17', 3, 32000, 2, 14, 55, '2020-05-15 20:16:43', '2020-05-15 20:16:43'),
(22, '2020-05-21', '2020-05-27', 1, 1400, 2, 15, 44, '2020-05-17 02:25:15', '2020-05-17 02:25:15'),
(23, '2020-05-21', '2020-05-27', 2, 2800, 2, 17, 888, '2020-05-17 02:29:51', '2020-05-17 02:29:51'),
(24, '2020-05-21', '2020-05-27', 5, 7000, 2, 18, 988, '2020-05-17 02:38:20', '2020-05-17 02:38:20'),
(25, '2020-05-30', '2020-06-02', 2, 1600, 2, 19, 6701, '2020-05-17 02:39:28', '2020-05-17 02:39:28'),
(26, '2020-05-30', '2020-06-02', 5, 4000, 1, 20, 6826, '2020-05-17 14:45:48', '2020-05-17 14:45:48'),
(27, '2020-05-21', '2020-06-26', 6, 18500, 2, 21, 3500, '2020-05-19 23:15:23', '2020-05-19 23:15:23'),
(28, '2020-05-29', '2020-06-30', 3, 66000, 1, 22, 115933, '2020-05-21 13:49:44', '2020-05-21 13:49:44'),
(29, '2020-05-29', '2020-06-30', 29, 28050, 2, 23, 921109, '2020-05-21 18:25:04', '2020-05-21 18:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_05_10_061038_create_bookables_table', 1),
(4, '2020_05_10_233830_create_bookings_table', 2),
(5, '2020_05_11_044027_create_reviews_table', 3),
(6, '2020_05_12_052213_add_review_id_to_bookings', 4),
(7, '2020_05_15_020215_create_addresses_table', 5),
(17, '2020_05_18_010940_add_to_bookables', 6),
(18, '2014_10_12_100000_create_password_resets_table', 7),
(19, '2016_06_01_000001_create_oauth_auth_codes_table', 7),
(20, '2016_06_01_000002_create_oauth_access_tokens_table', 7),
(21, '2016_06_01_000003_create_oauth_refresh_tokens_table', 7),
(22, '2016_06_01_000004_create_oauth_clients_table', 7),
(23, '2016_06_01_000005_create_oauth_personal_access_clients_table', 7),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 7),
(25, '2020_05_19_083233_add_user_id_to_bookables', 8),
(26, '2020_05_20_083734_add_counts_to_bookables', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'DedRELhoO7wYUPuUxwls30FF89OITsWAKGjSPLIY', NULL, 'http://localhost', 1, 0, 0, '2020-05-18 15:24:10', '2020-05-18 15:24:10'),
(2, NULL, 'Laravel Password Grant Client', '8m9X1m5CWvtnFjPt3LgkhfP6oorQoqht8ZUv8xVd', 'users', 'http://localhost', 0, 1, 0, '2020-05-18 15:24:10', '2020-05-18 15:24:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-05-18 15:24:10', '2020-05-18 15:24:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Host', 1, 'create', '2f6b204b864a6f9608a4a0c64d050b997e33d2145d1e1467658ec3d19dddf135', '[\"*\"]', NULL, '2020-05-18 15:58:09', '2020-05-18 15:58:09'),
(2, 'App\\Host', 2, 'create', '444905eb5e09a959dbf6f2971c0a52756841c8c5f0092c15794048fcb56d737b', '[\"*\"]', NULL, '2020-05-18 16:11:22', '2020-05-18 16:11:22');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(3) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookable_id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `user_name`, `rating`, `content`, `bookable_id`, `booking_id`, `created_at`, `updated_at`) VALUES
(7, NULL, NULL, 3, 'This is a very good place to accommodate. The host is very kind and respectful person and it has all the facilities ', 3, 3, '2020-05-07 14:30:00', '2020-05-10 14:30:00'),
(8, NULL, NULL, 5, 'This is a very good place to accommodate. The host is very kind and respectful person and it has all the facilities ', 3, 6, '2020-05-09 14:30:00', '2020-05-11 14:30:00'),
(9, NULL, NULL, 4, 'This is a very good place to accommodate. The host is very kind and respectful person and it has all the facilities ', 4, 4, '2020-05-08 14:30:00', '2020-05-18 14:30:00'),
(10, NULL, NULL, 2, 'This is a very good place to accommodate. The host is very kind and respectful person and it has all the facilities ', 4, 2, '2020-05-05 14:30:00', '2020-05-11 14:30:00'),
(11, NULL, NULL, 4, 'hello', 7, 1, '2020-05-12 00:43:46', '2020-05-12 00:43:46'),
(44, NULL, 'Ali', 4, 'It was very perfect.', 1, 22, '2020-05-21 02:29:16', '2020-05-21 02:29:16'),
(988, NULL, 'Ali', 3, 'hjjh', 5, 24, '2020-05-17 14:36:06', '2020-05-17 14:36:06'),
(2000, NULL, NULL, 4, 'hello', 3, 5, '2020-05-12 00:46:39', '2020-05-12 00:46:39'),
(3000, NULL, NULL, 4, 'Very Good', 4, 7, '2020-05-12 01:55:32', '2020-05-12 01:55:32'),
(3500, NULL, 'Ali', 3, 'good', 6, 27, '2020-05-19 23:35:41', '2020-05-19 23:35:41'),
(4000, NULL, NULL, 5, 'Very good', 8, 8, '2020-05-12 17:16:20', '2020-05-12 17:16:20'),
(6701, NULL, NULL, 4, 'Very Good!', 2, 25, '2020-05-17 03:15:11', '2020-05-17 03:15:11'),
(6826, NULL, 'Mehdi', 1, 'very bad', 5, 26, '2020-05-17 14:46:03', '2020-05-17 14:46:03'),
(921109, NULL, 'Ali', 3, 'Good!', 29, 29, '2020-05-21 18:26:15', '2020-05-21 18:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookable_id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `photo`, `bookable_id`, `phone`, `role`) VALUES
(1, 'Mehdi', 'mehdibph@gmail.com', NULL, '$2y$10$k8Wz3.0JCcDQHREZZuad7OSPGsUTCyca21a5XY4N9UwmnY4PfhIIS', NULL, '2020-05-15 14:32:32', '2020-05-15 14:32:32', NULL, 0, '0714252545', 0),
(2, 'Babi', 'babi@gmail.com', NULL, '$2y$10$xRKJDNd5IrSnBHz0o48mFumblkBJI4hnFfwzPblp9gPkk9MGSCknK', NULL, '2020-05-15 14:42:33', '2020-05-15 14:42:33', NULL, 0, '052555856', 0),
(3, 'Mani', 'mani@gmail.com', NULL, '$2y$10$X1IFtevbJUPaHIT6MaTBDepFdqm1O/E9zzEevpKrQMp8tpAQJOqBC', NULL, '2020-05-18 19:48:08', '2020-05-18 19:48:08', NULL, 0, '058552215', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_index` (`user_id`);

--
-- Indexes for table `bookables`
--
ALTER TABLE `bookables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookables_user_id_index` (`user_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_bookable_id_index` (`bookable_id`),
  ADD KEY `bookings_address_id_index` (`address_id`),
  ADD KEY `bookings_user_id_index` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_bookable_id_index` (`bookable_id`),
  ADD KEY `reviews_booking_id_index` (`booking_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bookables`
--
ALTER TABLE `bookables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=921110;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `bookables`
--
ALTER TABLE `bookables`
  ADD CONSTRAINT `bookables_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `bookings_bookable_id_foreign` FOREIGN KEY (`bookable_id`) REFERENCES `bookables` (`id`),
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_bookable_id_foreign` FOREIGN KEY (`bookable_id`) REFERENCES `bookables` (`id`),
  ADD CONSTRAINT `reviews_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
