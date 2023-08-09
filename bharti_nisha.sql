-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2023 at 11:56 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bharti_nisha`
--

-- --------------------------------------------------------

--
-- Table structure for table `accept_estimates`
--

CREATE TABLE `accept_estimates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `estimate_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `signature` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accept_estimates`
--

INSERT INTO `accept_estimates` (`id`, `company_id`, `estimate_id`, `full_name`, `email`, `signature`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'Nisha Bharti', 'nisha0502bharti@gmail.com', 'nisha', '2023-08-04 17:52:28', '2023-08-04 17:52:28'),
(2, 5, 1, 'Bharti Nisha', 'scnkasjcnla@gmail.com', 'bharti', '2023-08-05 17:59:19', '2023-08-05 17:59:19'),
(3, 2, 1, 'Krishna', 'kanha@gmail.com', 'krishna', '2023-08-04 17:59:19', '2023-08-04 17:59:19'),
(4, 5, 2, 'Radha rani', 'radha12@gmail.com', 'radha', '2023-08-04 18:01:52', '2023-08-04 18:01:52'),
(5, 2, 1, 'Krishna radha', 'radha krishna@gmail.com', 'radhakrish', '2023-08-04 18:01:52', '2023-08-04 18:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `clock_in_time` datetime NOT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `clock_in_ip` varchar(191) NOT NULL,
  `clock_out_ip` varchar(191) NOT NULL,
  `working_from` varchar(191) NOT NULL DEFAULT 'office',
  `late` enum('yes','no') NOT NULL DEFAULT 'no',
  `half_day` enum('yes','no') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `company_id`, `user_id`, `clock_in_time`, `clock_out_time`, `clock_in_ip`, `clock_out_ip`, `working_from`, `late`, `half_day`, `created_at`, `updated_at`) VALUES
(2, 1, 91, '2023-08-04 20:07:36', '2023-08-04 23:37:36', '23.67.90.23', '23.45.56.78', 'office', 'no', 'no', '2023-08-04 18:07:36', '2023-08-04 18:07:36'),
(4, 3, 140, '2023-08-04 20:14:11', '2023-08-04 23:44:27', '79.90.98.67', '34.67.78.89', 'office', 'no', 'yes', '2023-08-04 18:14:27', '2023-08-04 18:14:27'),
(5, 1, 89, '2023-08-04 20:14:11', '2023-08-04 23:44:27', '90.56.34.23', '78.90.43.23', 'office', 'no', 'yes', '2023-08-04 18:14:27', '2023-08-04 18:14:27'),
(6, 2, 113, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-4.341818590619679', '\0\0\0x?33׳4?36?31\0\rC1', '2023-08-08', 'no', '', '0000-00-00 00:00:00', NULL),
(7, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1058354957', '\0\0\0x?32ֳ??33׳4\0\0\rF7', '111', 'no', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_settings`
--

CREATE TABLE `attendance_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `office_start_time` time NOT NULL,
  `office_end_time` time NOT NULL,
  `halfday_mark_time` time DEFAULT NULL,
  `late_mark_duration` tinyint(4) NOT NULL,
  `clockin_in_day` int(11) NOT NULL DEFAULT 1,
  `employee_clock_in_out` enum('yes','no') NOT NULL DEFAULT 'yes',
  `office_open_days` varchar(191) NOT NULL DEFAULT '[1,2,3,4,5]',
  `ip_address` text DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `radius_check` enum('yes','no') NOT NULL DEFAULT 'no',
  `ip_check` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance_settings`
--

INSERT INTO `attendance_settings` (`id`, `company_id`, `office_start_time`, `office_end_time`, `halfday_mark_time`, `late_mark_duration`, `clockin_in_day`, `employee_clock_in_out`, `office_open_days`, `ip_address`, `radius`, `radius_check`, `ip_check`, `created_at`, `updated_at`) VALUES
(1, NULL, '09:00:00', '18:00:00', NULL, 20, 2, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2023-08-01 07:19:35', '2023-08-01 07:19:35'),
(2, 1, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2023-08-01 07:19:57', '2023-08-01 07:19:57'),
(3, 2, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2023-08-01 07:19:58', '2023-08-01 07:19:58'),
(4, 3, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2023-08-01 07:19:58', '2023-08-01 07:19:58'),
(5, 4, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2023-08-01 07:19:58', '2023-08-01 07:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `authorize_invoices`
--

CREATE TABLE `authorize_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount` varchar(191) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authorize_invoices`
--

INSERT INTO `authorize_invoices` (`id`, `company_id`, `package_id`, `transaction_id`, `amount`, `pay_date`, `next_pay_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '67uhjkl567', '1000', '2023-08-04', '2023-08-05', '2023-08-06 18:24:34', '2023-08-06 18:24:34'),
(2, 2, 1, '23456789hn', '7000', '2023-08-08', '2023-08-09', '2023-08-08 17:23:36', '2023-08-08 17:23:36'),
(3, 2, 2, 'iii9', '89', '2023-08-08', '2023-08-10', '2023-08-08 17:24:37', '2023-08-08 17:24:37'),
(4, 2, 1, '78j', '890', '2023-08-11', '2023-08-25', '2023-08-08 17:24:37', '2023-08-08 17:24:37'),
(5, 3, 2, '89i', '90', '2023-08-09', '2023-08-08', '2023-08-17 17:24:37', '2023-08-18 17:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `authorize_subscriptions`
--

CREATE TABLE `authorize_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `subscription_id` varchar(191) NOT NULL,
  `plan_id` int(10) UNSIGNED DEFAULT NULL,
  `plan_type` varchar(191) DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authorize_subscriptions`
--

INSERT INTO `authorize_subscriptions` (`id`, `company_id`, `subscription_id`, `plan_id`, `plan_type`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, 4, '7u', 3, 'jkh', '2023-08-08 17:26:10', '2023-08-08 17:26:10', '2023-08-08 17:26:10'),
(2, 2, 'hj8', 3, 'ui', NULL, NULL, NULL),
(4, 3, 'ij8', 5, 'hjl', '2023-08-09 17:27:09', '2023-08-17 17:27:09', '2023-08-14 17:27:09'),
(5, 3, '8ij', 3, 'kij9', '2023-08-08 17:27:09', '2023-08-18 17:27:09', '2023-08-24 17:27:09'),
(6, NULL, '78', 6, 'good', '2023-08-09 09:02:32', '2023-08-15 09:02:32', '2023-08-09 09:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `client_name`, `email`, `phone`, `address`, `city`, `country`) VALUES
(1, 'chhoti', 'chhoti@gmail.com', '1234567890', NULL, NULL, NULL),
(2, 'krishna', 'radha@', NULL, NULL, NULL, NULL),
(3, 'bharti', 'bharti@gmail.com', '7895673456', 'shcbacj', 'punjab', 'india'),
(4, 'puja', 'puja34@gmail.com', '1234567890', 'delhi', 'delhi', 'india'),
(5, 'aakash', 'ak@gmail.com', '1234567890', 'punjab', 'punjab', 'indiA');

-- --------------------------------------------------------

--
-- Table structure for table `client_categories`
--

CREATE TABLE `client_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_categories`
--

INSERT INTO `client_categories` (`id`, `company_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fruits', '2023-08-08 17:12:03', '2023-08-08 17:12:03'),
(2, 2, 'Vegetables', '2023-08-08 17:12:03', '2023-08-08 17:12:03'),
(3, 2, 'Animals', '2023-08-08 17:12:03', '2023-08-08 17:12:03'),
(4, 3, 'Birds', '2023-08-08 17:12:03', '2023-08-08 17:12:03'),
(5, 5, 'Colors', '2023-08-08 17:12:03', '2023-08-08 17:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

CREATE TABLE `client_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_contacts`
--

INSERT INTO `client_contacts` (`id`, `company_id`, `user_id`, `contact_name`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 1, 80, 'chhoti', '1234567890', 'chhoti@gmail.com', '2023-08-09 09:10:29', '2023-08-09 09:10:29'),
(2, 2, 2, 'krishna', NULL, 'radha@', '2023-08-09 09:11:03', '2023-08-09 09:11:03'),
(3, 3, 4, 'bharti', '7895673456', 'bharti@gmail.com', '2023-08-08 17:43:17', '2023-08-08 17:43:17'),
(4, 4, 22, 'puja', '7895673456', 'puja34@gmail.com', '2023-08-09 09:11:39', '2023-08-09 09:11:39'),
(5, 5, 4, 'aakash', '1234567890', 'ak@gmail.com', '2023-08-09 09:12:29', '2023-08-09 09:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `client_details`
--

CREATE TABLE `client_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `office_phone` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `skype` varchar(191) DEFAULT NULL,
  `gst_number` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_details`
--

INSERT INTO `client_details` (`id`, `company_id`, `user_id`, `name`, `email`, `image`, `mobile`, `company_name`, `address`, `shipping_address`, `office_phone`, `city`, `state`, `postal_code`, `website`, `note`, `linkedin`, `facebook`, `twitter`, `skype`, `gst_number`, `created_at`, `updated_at`, `email_notifications`, `country_id`, `category_id`, `sub_category_id`) VALUES
(1, NULL, 80, 'krishna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(2, 2, 2, 'chhoti', 'chhoti@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(3, 5, 4, 'bharti', 'bharti@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(4, 1, 80, 'puja', 'puja34@gmail.com', NULL, '1234567890', 'flipkart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(5, 2, 22, 'aakash', 'ak@gmail.com', NULL, '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_docs`
--

CREATE TABLE `client_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `hashname` varchar(200) NOT NULL,
  `size` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_docs`
--

INSERT INTO `client_docs` (`id`, `company_id`, `user_id`, `name`, `filename`, `hashname`, `size`, `created_at`, `updated_at`) VALUES
(1, 4, 89, 'nisha', 'bharti', 'bh$', '78', '2023-08-08 17:28:50', '2023-08-08 17:28:50'),
(2, 5, 91, 'jk', 'njki', 'nmj8', '90', '2023-08-08 17:28:50', '2023-08-08 17:28:50'),
(3, 3, 80, 'bharti', 'bhartixyz', '#bharti', '79kb', '2023-08-16 09:13:26', '2023-08-16 09:13:26'),
(4, 4, 89, 'puja', 'pujaxyz', '#xyzpuja', '789kb', '2023-08-10 09:14:30', '2023-08-10 09:14:30'),
(5, 5, 50, 'aakash', 'aakashxyz', '#xyzaakash', '500kb', '2023-08-09 09:14:30', '2023-08-09 09:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `client_sub_categories`
--

CREATE TABLE `client_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_sub_categories`
--

INSERT INTO `client_sub_categories` (`id`, `company_id`, `category_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 'dog', '2023-08-08 17:39:23', '2023-08-08 17:39:23'),
(2, 3, 3, 'cat', '2023-08-08 17:39:59', '2023-08-08 17:39:59'),
(3, 2, 5, 'pink', '2023-08-08 17:40:30', '2023-08-08 17:40:30'),
(4, 4, 4, 'peacock', '2023-08-09 09:16:22', '2023-08-09 09:16:22'),
(5, 5, 5, 'blue', '2023-08-09 09:17:35', '2023-08-09 09:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `client_user_notes`
--

CREATE TABLE `client_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `note_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(191) NOT NULL,
  `company_email` varchar(191) NOT NULL,
  `company_phone` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `login_background` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `website` varchar(191) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `package_type` enum('monthly','annual') NOT NULL DEFAULT 'monthly',
  `timezone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `date_format` varchar(20) NOT NULL DEFAULT 'd-m-Y',
  `date_picker_format` varchar(191) DEFAULT NULL,
  `moment_format` varchar(191) DEFAULT NULL,
  `time_format` varchar(20) NOT NULL DEFAULT 'h:i A',
  `week_start` int(11) NOT NULL DEFAULT 1,
  `locale` varchar(191) NOT NULL DEFAULT 'en',
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `leaves_start_from` enum('joining_date','year_start') NOT NULL DEFAULT 'joining_date',
  `active_theme` enum('default','custom') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive','license_expired') NOT NULL DEFAULT 'active',
  `task_self` enum('yes','no') NOT NULL DEFAULT 'yes',
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_last_four` varchar(191) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `licence_expire_on` date DEFAULT NULL,
  `rounded_theme` tinyint(1) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `default_task_status` int(10) UNSIGNED DEFAULT NULL,
  `show_update_popup` tinyint(1) NOT NULL DEFAULT 1,
  `dashboard_clock` tinyint(1) NOT NULL DEFAULT 1,
  `ticket_form_google_captcha` tinyint(1) NOT NULL DEFAULT 0,
  `lead_form_google_captcha` tinyint(1) NOT NULL DEFAULT 0,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `company_email`, `company_phone`, `logo`, `login_background`, `address`, `website`, `currency_id`, `package_id`, `package_type`, `timezone`, `date_format`, `date_picker_format`, `moment_format`, `time_format`, `week_start`, `locale`, `latitude`, `longitude`, `leaves_start_from`, `active_theme`, `status`, `task_self`, `last_updated_by`, `created_at`, `updated_at`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `licence_expire_on`, `rounded_theme`, `last_login`, `default_task_status`, `show_update_popup`, `dashboard_clock`, `ticket_form_google_captcha`, `lead_form_google_captcha`, `rtl`) VALUES
(1, 'Worksuite Demo Company', 'admin@example.com', '517-966-5663', NULL, NULL, '4868  Ben Street Lansing Michigan 48906', 'worksuite.biz', 1, 1, 'monthly', 'Asia/Kolkata', 'd-m-Y', 'dd-mm-yyyy', 'DD-MM-YYYY', 'h:i A', 1, 'en', NULL, NULL, 'joining_date', 'default', 'active', 'yes', NULL, '2023-08-01 07:19:57', '2023-08-01 09:48:13', NULL, NULL, NULL, NULL, NULL, 1, '2023-08-01 09:48:13', NULL, 1, 1, 0, 0, 0),
(2, 'Little, Krajcik and Bauch', 'flittle@wehner.com', '1-680-379-2039 x2531', NULL, NULL, '739 Walker Shores Apt. 775\nSouth Terrill, CA 72706-7146', 'wolf.com', 5, 1, 'monthly', 'Asia/Kolkata', 'd-m-Y', 'dd-mm-yyyy', 'DD-MM-YYYY', 'h:i A', 1, 'en', NULL, NULL, 'joining_date', 'default', 'active', 'yes', NULL, '2023-08-01 07:19:58', '2023-08-01 07:19:58', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0),
(3, 'Thiel PLC', 'terry.camille@homenick.info', '(346) 882-0552', NULL, NULL, '55129 Jorge Vista\nKoryfurt, CA 75963', 'moen.biz', 9, 1, 'monthly', 'Asia/Kolkata', 'd-m-Y', 'dd-mm-yyyy', 'DD-MM-YYYY', 'h:i A', 1, 'en', NULL, NULL, 'joining_date', 'default', 'active', 'yes', NULL, '2023-08-01 07:19:58', '2023-08-01 07:19:58', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0),
(4, 'Grimes-Nicolas', 'witting.david@sporer.info', '914.434.0845 x409', NULL, NULL, '3124 Zula Harbor\nRebekahfurt, IN 51025-0020', 'watsica.net', 13, 1, 'monthly', 'Asia/Kolkata', 'd-m-Y', 'dd-mm-yyyy', 'DD-MM-YYYY', 'h:i A', 1, 'en', NULL, NULL, 'joining_date', 'default', 'active', 'yes', NULL, '2023-08-01 07:19:58', '2023-08-01 07:19:59', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0),
(5, 'Kilback, Walker and Yundt', 'isaias51@conroy.com', '959.712.6245', NULL, NULL, '90771 Kole Harbor Apt. 501\nEast Verna, ND 13870-3892', 'cummerata.com', 17, 1, 'monthly', 'Asia/Kolkata', 'd-m-Y', 'dd-mm-yyyy', 'DD-MM-YYYY', 'h:i A', 1, 'en', NULL, NULL, 'joining_date', 'default', 'active', 'yes', NULL, '2023-08-01 07:19:59', '2023-08-01 07:19:59', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `amount` varchar(191) NOT NULL,
  `original_amount` decimal(15,2) NOT NULL,
  `contract_type_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `original_start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `original_end_date` date DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `contract_name` varchar(191) DEFAULT NULL,
  `company_logo` varchar(191) DEFAULT NULL,
  `alternate_address` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `office_phone` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `contract_detail` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `send_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `company_id`, `client_id`, `subject`, `amount`, `original_amount`, `contract_type_id`, `start_date`, `original_start_date`, `end_date`, `original_end_date`, `description`, `contract_name`, `company_logo`, `alternate_address`, `mobile`, `office_phone`, `city`, `state`, `country`, `postal_code`, `contract_detail`, `created_at`, `updated_at`, `send_status`) VALUES
(1, 4, 80, 'complaints', '8000', '6000.00', 1, '2023-08-08', '2023-08-07', '2023-08-18', '2023-08-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 5, 113, 'dance', '9000', '5000.00', 3, '2023-08-08', '2023-08-24', '2023-08-22', '2023-08-23', 'Dance is the natural exercise', 'dance', NULL, 'dhanbad', '1234567890', '0987654321', 'ranchi', 'jharkhand', 'india', '1234556', NULL, NULL, NULL, 1),
(3, 1, 80, 'cook', '8000', '5000.00', 2, '2023-08-09', '2023-08-08', '2023-08-23', '2023-08-26', 'Cooking is very good hobby as it\'s also valuable for surviving.', 'nb', NULL, 'gujarat', '12345678', NULL, 'gujarat', 'gujarat', 'india', '890890', NULL, '2023-08-09 09:22:59', '2023-08-15 09:22:59', 1),
(4, NULL, 140, 'blog', '89999', '4000.00', 5, '2023-08-09', '2023-08-02', '2023-08-31', '2023-08-31', 'Blogging is a very good arts to improve our skills for writing as well as upskilling.', 'bn', NULL, 'goa', '123456', NULL, 'goa', 'goa', 'india', '8888', NULL, '2023-08-09 09:25:50', '2023-08-18 09:25:50', 1),
(5, 5, 89, 'drawing', '7000', '5000.00', 2, '2023-08-09', '2023-08-09', '2023-08-10', '2023-08-11', 'Drawing is an art.', 'bnn', NULL, 'patna', '7890789090', NULL, 'patna', 'bihar', 'india', '67890', NULL, '2023-08-16 09:25:50', '2023-08-16 09:25:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contract_discussions`
--

CREATE TABLE `contract_discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contract_discussions`
--

INSERT INTO `contract_discussions` (`id`, `company_id`, `contract_id`, `from`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 80, 'Salary is too late for this month', '2023-08-09 09:30:48', '2023-08-10 09:30:48'),
(2, 2, 2, 50, 'Bharatnatyam is one of the dance.', '2023-08-16 09:31:52', '2023-08-16 09:31:52'),
(3, 3, 3, 140, 'Cooking is not my hobby.', '2023-08-16 09:31:52', '2023-08-23 09:31:52'),
(4, 4, 4, 140, 'Blogging is my hobby', '2023-08-24 09:33:13', '2023-08-24 09:33:13'),
(5, 5, 5, 50, 'Blog is good skills.', '2023-08-23 09:33:13', '2023-08-16 09:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `contract_files`
--

CREATE TABLE `contract_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contract_files`
--

INSERT INTO `contract_files` (`id`, `company_id`, `user_id`, `contract_id`, `filename`, `description`, `google_url`, `hashname`, `size`, `dropbox_link`, `external_link`, `external_link_name`, `created_at`, `updated_at`) VALUES
(1, 4, 89, 4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 5, 91, 5, 'njki', 'afasvd vs', 'www.googleweb', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 50, 3, 'bhartixyz', 'good evening', 'google.com', NULL, '789kb', NULL, NULL, NULL, NULL, NULL),
(4, 4, 89, 4, 'pujaxyz', 'hhbj hbhj', 'gghjk bn', 'fghjbn', '78kb', 'ffghj.jjj', 'ghkki.', NULL, '2023-08-24 09:40:37', '2023-08-24 09:40:37'),
(5, 5, 50, 5, 'aakashxyz', 'aakashxyz is a file name', 'ggghj.', 'vhgvh', '78b', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contract_renews`
--

CREATE TABLE `contract_renews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `renewed_by` int(10) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contract_renews`
--

INSERT INTO `contract_renews` (`id`, `company_id`, `renewed_by`, `contract_id`, `start_date`, `end_date`, `amount`, `created_at`, `updated_at`) VALUES
(1, NULL, 50, 4, '2023-08-09', '2023-08-10', '7000.00', '2023-08-09 09:42:48', '2023-08-10 09:42:48'),
(2, NULL, 50, 5, '2023-08-08', '2023-08-10', '7000.00', '2023-08-08 09:43:49', '2023-08-09 09:43:49'),
(3, 3, 50, 3, '2023-08-08', '2023-08-25', '7000.00', '2023-08-01 09:44:23', '2023-08-09 09:44:23'),
(4, 4, 140, 4, '2023-08-08', '2023-08-04', '9000.00', '2023-08-23 09:44:23', '2023-08-25 09:44:23'),
(5, 5, 50, 5, '2023-08-02', '2023-08-05', '7000.00', '2023-08-03 09:45:47', '2023-08-17 09:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `contract_signs`
--

CREATE TABLE `contract_signs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `signature` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contract_signs`
--

INSERT INTO `contract_signs` (`id`, `company_id`, `contract_id`, `full_name`, `email`, `signature`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 'bharti', 'bharti@gmail.com', 'bharti', '2023-08-09 09:46:25', '2023-08-09 09:46:25'),
(2, 5, 5, 'njki', 'nj@', 'nj', '2023-08-17 09:47:06', '2023-08-10 09:47:06'),
(3, 3, 3, 'bharti', 'bharti@gmail.com', 'bharti', '2023-08-10 09:47:46', '2023-08-10 09:47:46'),
(4, 4, 4, 'puja', 'puja34@gmail.com', 'pujakumari', '2023-08-02 09:48:34', '2023-08-09 09:48:34'),
(5, 5, 5, 'aakash', 'ak@gmail.com', 'aakash', '2023-08-10 09:48:34', '2023-08-30 09:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contract_types`
--

INSERT INTO `contract_types` (`id`, `company_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 4, 'bharti', '2023-08-09 09:49:56', '2023-08-09 09:49:56'),
(2, 5, 'krishna', '2023-08-02 09:50:16', '2023-08-09 09:50:16'),
(3, 3, 'bharti', '2023-08-04 09:50:44', '2023-08-09 09:50:44'),
(4, 4, 'puja', '2023-08-08 09:51:03', '2023-08-09 09:51:03'),
(5, 5, 'aakash', '2023-08-03 09:51:20', '2023-08-09 09:51:20');

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_one` int(10) UNSIGNED NOT NULL,
  `user_two` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `conversation`
--

INSERT INTO `conversation` (`id`, `user_one`, `user_two`, `created_at`, `updated_at`) VALUES
(1, 55, 56, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 113, 2, '2023-08-08 17:16:53', '2023-08-08 17:16:53'),
(3, 50, 22, '2023-08-08 17:16:53', '2023-08-08 17:16:53'),
(1001117, 2, 86, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1001120, 6, 86, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `conversation_reply`
--

CREATE TABLE `conversation_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `reply` text NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `conversation_reply`
--

INSERT INTO `conversation_reply` (`id`, `conversation_id`, `reply`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 2, '2023-08-08 17:14:26', '2023-08-08 17:14:26'),
(2, 1001120, '1', 80, '2023-08-08 17:14:26', '2023-08-08 17:14:26'),
(3, 1001120, '15', 89, '2023-08-08 17:14:26', '2023-08-08 17:14:26'),
(4, 1001120, '7788', 58, '2023-08-08 17:14:26', '2023-08-08 17:14:26'),
(5, 1001120, '777', 77, '2023-08-08 17:14:26', '2023-08-08 17:14:26');