-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th9 24, 2023 lúc 05:19 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `juva-media`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 6, '2023-09-24 07:52:49', '2023-09-24 07:52:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_products`
--

CREATE TABLE `cart_products` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_product_photography`
--

CREATE TABLE `cart_product_photography` (
  `id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `cart_product_id` bigint UNSIGNED NOT NULL,
  `product_photography_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photography`
--

CREATE TABLE `photography` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `photography`
--

INSERT INTO `photography` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Hình mặt trước', '', '2023-09-24 13:55:43', '2023-09-24 13:55:43'),
(2, 'Hình mặt sau', '', '2023-09-24 13:55:43', '2023-09-24 13:55:43'),
(3, 'Hình nghiêng trái 90 độ', '', '2023-09-24 13:55:43', '2023-09-24 13:55:43'),
(4, 'Hình nghiêng phải 90 độ', '', '2023-09-24 13:55:43', '2023-09-24 13:55:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `slug` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `service_category_id` bigint UNSIGNED NOT NULL,
  `product_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `slug`, `service_category_id`, `product_category_id`, `created_at`, `updated_at`) VALUES
(5, 'Áo vest dáng dài nam chất liệu vải trơn - Kiểu Ghost 3D - GO8604', 'Để hoàn toàn hiểu rõ ưu - nhược điểm của KIỂU GHOST 3D trước khi lựa chọn, tìm hiểu thêm ở ĐÂY nhé!!! GHOST 3D: sản phẩm sẽ được mặc vào Mannequin ...', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-mat-truoc.jpg https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-mat-truoc.jpg https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-mat-sau.jpg https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-chi-tiet-nguc-ao-truoc.jpg https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-chi-tiet-giua-ao-truoc.jpg https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-chi-tiet-giua-ao-sau.jpg https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-chi-tiet-goc-do-khac.jpg ', '150000', 'ao-vest-dang-dai-nam-chat-lieu-vai-tron-kieu-ghost-3d-go8604', 1, 2, '2023-09-24 12:28:36', '2023-09-24 12:28:36'),
(6, 'Áo dài nữ tay dài chất liệu vải trơn cổ thuyền rũ - Kiểu Ghost 3D - GO9805', 'Để hoàn toàn hiểu rõ ưu - nhược điểm của KIỂU GHOST 3D trước khi lựa chọn, tìm hiểu thêm ở ĐÂY nhé!!! GHOST 3D: sản phẩm sẽ được mặc vào Mannequin ...', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go9805--hinh-mat-sau.jpg https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go9805--hinh-mat-sau.jpg https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go9805--hinh-nghieng-trai-sau.jpg', '150000', 'ao-dai-nu-tay-dai-chat-lieu-vai-tron-co-thuyen-ru-kieu-ghost-3d-go9805', 1, 1, '2023-09-24 12:28:36', '2023-09-24 12:28:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Áo dài', '2023-09-24 12:24:25', '2023-09-24 12:24:25'),
(2, 'Áo vest, blazer', '2023-09-24 12:24:25', '2023-09-24 12:24:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_photography`
--

CREATE TABLE `product_photography` (
  `id` bigint UNSIGNED NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `photography_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_photography`
--

INSERT INTO `product_photography` (`id`, `price`, `image`, `product_id`, `photography_id`, `created_at`, `updated_at`) VALUES
(1, '150000', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go9805--hinh-mat-truoc.jpg', 6, 1, '2023-09-24 14:00:03', '2023-09-24 14:00:03'),
(2, '150000', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go9805--hinh-mat-sau.jpg', 6, 2, '2023-09-24 14:00:03', '2023-09-24 14:00:03'),
(3, '150000', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go9805--hinh-nghieng-trai-sau.jpg', 6, 3, '2023-09-24 14:00:03', '2023-09-24 14:00:03'),
(4, '150000', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go9805--hinh-nghieng-phai-sau.jpg', 6, 4, '2023-09-24 14:00:03', '2023-09-24 14:00:03'),
(5, '150000', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-mat-truoc.jpg', 5, 1, '2023-09-24 14:00:03', '2023-09-24 14:00:03'),
(6, '150000', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-mat-sau.jpg', 5, 2, '2023-09-24 14:00:03', '2023-09-24 14:00:03'),
(7, '150000', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-nghieng-trai-sau.jpg', 5, 3, '2023-09-24 14:00:03', '2023-09-24 14:00:03'),
(8, '150000', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-nghieng-phai-sau.jpg', 5, 4, '2023-09-24 14:00:03', '2023-09-24 14:00:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `name`, `create_at`, `update_at`) VALUES
(1, 'Chụp Ảnh Nền Trắng', '2023-09-24 09:13:41', '2023-09-24 09:13:41'),
(2, 'Chụp Ảnh Concept', '2023-09-24 09:13:41', '2023-09-24 09:13:41'),
(3, 'Chụp Ảnh 3D', '2023-09-24 09:13:41', '2023-09-24 09:13:41'),
(4, 'Quay Video Sản Phẩm', '2023-09-24 09:13:41', '2023-09-24 09:13:41'),
(5, 'Xử Lý Hậu Kì', '2023-09-24 09:13:41', '2023-09-24 09:13:41'),
(6, 'Blog', '2023-09-24 09:13:41', '2023-09-24 09:13:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `description`, `image`, `slug`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 'Thời trang', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/go8604--hinh-mat-truoc.jpg', 'chup-anh-nen-trang-thoi-trang', 1, '2023-09-24 10:25:09', '2023-09-24 10:25:09'),
(3, 'Balo - Túi xách - Bóp Ví', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/coc502--hinh-concept.jpg', 'chup-anh-nen-trang-balo-tui-xach-bop', 1, '2023-09-24 10:28:37', '2023-09-24 10:28:37'),
(4, 'Giày dép', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/coc407--hinh-concept.jpg', 'chup-anh-nen-trang-giay-dep', 1, '2023-09-24 10:28:37', '2023-09-24 10:28:37'),
(5, 'Mỹ phẩm', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/coc603--hinh-concept.jpg', 'chup-anh-nen-trang-my-pham', 1, '2023-09-24 10:28:37', '2023-09-24 10:28:37'),
(6, 'Phụ kiện Điện Tử', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/coc225--hinh-concept.jpg', 'chup-anh-nen-trang-phu-kien-dien-tu', 1, '2023-09-24 10:28:37', '2023-09-24 10:28:37'),
(7, 'Thực hiện theo yêu cầu', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/nta203.jpg', 'chup-anh-nen-trang-thuc-hien-theo-yeu-cau', 1, '2023-09-24 10:28:37', '2023-09-24 10:28:37'),
(8, 'Thực phẩm', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/coc813--hinh-concept-food.jpg', 'chup-anh-nen-trang-thuc-pham', 1, '2023-09-24 10:28:37', '2023-09-24 10:28:37'),
(9, 'Trang sức', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/BCC301--hinh-concept.jpg', 'chup-anh-nen-trang-trang-suc', 1, '2023-09-24 10:28:37', '2023-09-24 10:28:37'),
(10, 'Gia dụng - Đời sống', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/coc711--hinh-concept.jpg', 'chup-anh-nen-trang-gia-dung-doi-song', 1, '2023-09-24 10:28:37', '2023-09-24 10:28:37'),
(11, 'Thực hiện theo yêu cầu', 'Mang lại những cảm xúc khó đỡ', 'https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/nta106--hinh-mat-truoc.jpg', 'chup-anh-nen-trang-thuc-hien-theo-yeu-cau12333', 1, '2023-09-24 10:28:37', '2023-09-24 10:28:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Admin', '0123654789', 'admin@gmail.com', NULL, '$2y$10$81kc.jeOyvingKMQUPxRSe9g5Ujv0Bb56v26PE7nhB5nMqJL5WHTS', NULL, '2023-09-24 07:52:49', '2023-09-24 07:52:49');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Chỉ mục cho bảng `cart_product_photography`
--
ALTER TABLE `cart_product_photography`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_photography_id` (`product_photography_id`),
  ADD KEY `cart_product_photography_ibfk_1` (`cart_product_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `photography`
--
ALTER TABLE `photography`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_category_id` (`service_category_id`),
  ADD KEY `products_ibfk_1` (`product_category_id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_photography`
--
ALTER TABLE `product_photography`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photography_id` (`photography_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `cart_product_photography`
--
ALTER TABLE `cart_product_photography`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `photography`
--
ALTER TABLE `photography`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `product_photography`
--
ALTER TABLE `product_photography`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_products_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `cart_product_photography`
--
ALTER TABLE `cart_product_photography`
  ADD CONSTRAINT `cart_product_photography_ibfk_1` FOREIGN KEY (`cart_product_id`) REFERENCES `cart_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_product_photography_ibfk_2` FOREIGN KEY (`product_photography_id`) REFERENCES `product_photography` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `product_photography`
--
ALTER TABLE `product_photography`
  ADD CONSTRAINT `product_photography_ibfk_1` FOREIGN KEY (`photography_id`) REFERENCES `photography` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_photography_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `service_categories`
--
ALTER TABLE `service_categories`
  ADD CONSTRAINT `service_categories_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
