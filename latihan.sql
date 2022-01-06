-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2022 at 06:46 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_cat` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_cat`, `category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Keramik', '2022-01-04 17:31:32', '2022-01-04 17:31:32', '2022-01-04 17:31:32'),
(2, 'Elektronik', '2022-01-04 17:31:32', '2022-01-04 17:31:32', '2022-01-04 17:31:32'),
(3, 'Accesories', '2022-01-05 10:52:56', '2022-01-05 10:52:56', NULL);

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2022_01_06_032754_create_roles_table', 1);

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
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `qty` double NOT NULL,
  `deskripsi` text NOT NULL,
  `user_created` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `category_id`, `product_name`, `price`, `img`, `qty`, `deskripsi`, `user_created`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'TV', '5000000', 'tv.jpg', 4, 'LED 23 inch', NULL, '2022-01-05 18:39:30', '2022-01-05 18:39:30', NULL),
(2, 2, 'Kipas Miyako', '300000', 'kipas.jpg', 10, 'Dm 16inch', NULL, '2022-01-05 17:19:42', '2022-01-05 17:19:42', NULL),
(3, 2, 'Mesin Cuci Samsung', '2000000', 'mesin_cuci_samsung.jpg', 2, 'tabung 1 kekuatan cepat', NULL, '2022-01-05 17:24:07', '2022-01-05 17:24:07', NULL),
(4, 1, 'Keramik putih', '350000', 'keramik.jpg', 4, 'berkualitas tidak mudah pecah', NULL, '2022-01-05 17:24:07', '2022-01-05 17:24:07', NULL),
(5, 3, 'Gembok Tekiro', '100000', 'gembok.jpg', 11, 'tekiro', NULL, '2022-01-05 17:27:27', '2022-01-05 17:27:27', NULL),
(6, 3, 'Shower', '150000', 'shower.jpg', 6, 'shower terbaru', NULL, '2022-01-05 17:27:27', '2022-01-05 17:27:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `redirect_to`, `created_at`, `updated_at`) VALUES
(1, 'admin', '/dash', '2022-01-05 21:10:50', '2022-01-05 21:10:50'),
(2, 'member', '/', '2022-01-05 21:10:50', '2022-01-05 21:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_users` bigint(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `pekerjaan` varchar(20) DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_users`, `nama`, `role`, `username`, `password`, `pekerjaan`, `tgl_lahir`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin_qhomemart', 'admin', 'qhomemart', 'admin', 'it', '2001-12-04', '1', '2022-01-03 06:32:41', '2022-01-03 06:32:41', '2022-01-03 06:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'septiana', 'jogjagolek@gmail.com', NULL, '$2y$10$ycISTVLAXcG8bcK4oe3ME.983EJbbII1GRboNre3r3AvsZBoTln8W', NULL, '2022-01-05 21:34:50', '2022-01-05 21:34:50'),
(2, 1, 'admin', 'qhomemart@gmail.com', NULL, '$2y$10$tXqrifn0xIKKJZvxLspLlOtc9Ka6RTr7misXqTKQ30R.Gqcz.Zc6C', NULL, '2022-01-05 21:47:18', '2022-01-05 21:47:18'),
(3, 2, 'Qhomemart01', 'rara@gmail.com', NULL, '$2y$10$2ytuq66NBq83JBrd4A/iCObKMYAgabblAp0PAuiL10w0Voyvso8wa', NULL, '2022-01-05 21:57:21', '2022-01-05 21:57:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_users` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
