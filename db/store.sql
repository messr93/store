-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2020 at 01:43 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_img.jpg',
  `parent` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `photo`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'laptop', 'laptop', 'default_img.jpg', 0, NULL, NULL),
(2, 'pc', 'pc', 'default_img.jpg', 0, NULL, NULL),
(3, 'mobile', 'mobile', 'default_img.jpg', 0, NULL, NULL),
(4, 'tablet', 'tablet', 'default_img.jpg', 0, NULL, NULL),
(5, 'computer accessories', 'computer-accessories', 'default_img.jpg', 0, NULL, NULL),
(6, 'mobile accessories', 'mobile-accessories', 'default_img.jpg', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name_ar`, `name_en`) VALUES
(1, 'القاهرة', 'Cairo'),
(2, 'الجيزة', 'Giza'),
(3, 'الأسكندرية', 'Alexandria'),
(4, 'الدقهلية', 'Dakahlia'),
(5, 'البحر الأحمر', 'Red Sea'),
(6, 'البحيرة', 'Beheira'),
(7, 'الفيوم', 'Fayoum'),
(8, 'الغربية', 'Gharbiya'),
(9, 'الإسماعلية', 'Ismailia'),
(10, 'المنوفية', 'Monofia'),
(11, 'المنيا', 'Minya'),
(12, 'القليوبية', 'Qaliubiya'),
(13, 'الوادي الجديد', 'New Valley'),
(14, 'السويس', 'Suez'),
(15, 'اسوان', 'Aswan'),
(16, 'اسيوط', 'Assiut'),
(17, 'بني سويف', 'Beni Suef'),
(18, 'بورسعيد', 'Port Said'),
(19, 'دمياط', 'Damietta'),
(20, 'الشرقية', 'Sharkia'),
(21, 'جنوب سيناء', 'South Sinai'),
(22, 'كفر الشيخ', 'Kafr Al sheikh'),
(23, 'مطروح', 'Matrouh'),
(24, 'الأقصر', 'Luxor'),
(25, 'قنا', 'Qena'),
(26, 'شمال سيناء', 'North Sinai'),
(27, 'سوهاج', 'Sohag');

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_11_054926_create_categories_table', 1),
(5, '2020_10_11_061800_create_products_table', 1),
(6, '2020_10_11_071975_create_product_reviews_table', 1),
(7, '2020_10_11_112235_create_permission_tables', 1),
(11, '2020_10_11_115533_create_carts_table', 2),
(14, '2020_10_14_054847_create_orders_table', 3),
(15, '2020_10_14_054959_create_order_products_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed','decline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total` bigint(20) NOT NULL,
  `item_count` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `payment_method` enum('cash_on_delivery','stripe','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` int(11) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `status`, `total`, `item_count`, `paid`, `payment_method`, `shipping_full_name`, `city`, `region`, `address`, `zip_code`, `phone`, `email`, `notes`, `created_at`, `updated_at`) VALUES
(4, 'Order_79845f86e2de53713', 11, 'pending', 7984, 2, 0, 'cash_on_delivery', 'Anastasia Stephens', 'Architecto quo ipsum', 'Nihil non autem sit', 'Consequatur amet as', 41562, 888, 'cojipywir@mailinator.com', 'Minim animi molesti', '2020-10-14 09:37:02', '2020-10-14 09:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(11, 4, 9, 1, 1554, '2020-10-14 09:37:02', '2020-10-14 09:37:02'),
(12, 4, 49, 2, 3215, '2020-10-14 09:37:02', '2020-10-14 09:37:02');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_img.jpg',
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category`, `name`, `slug`, `photo`, `details`, `price`, `discount`, `rating`, `description`, `created_at`, `updated_at`) VALUES
(1, 7, 'computer-accessories', 'Corporis architecto dolore', 'Corporis-architecto-dolore', 'default_img.jpg', NULL, 3454, 13, 2, 'Fugiat voluptate dignissimos similique et porro impedit molestiae. Natus vel aut in. Eum et beatae placeat quia.', '2020-10-12 21:43:59', '2020-10-12 21:48:25'),
(2, 3, 'mobile-accessories', 'Corporis assumend', 'Corporis-assumend', 'default_img.jpg', NULL, 1848, 22, 1, 'Voluptatem omnis qui corrupti maxime sapiente. Corrupti architecto enim impedit veniam non.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(3, 9, 'mobile-accessories', 'Voluptatibus suscipi', 'Voluptatibus-suscipi', 'default_img.jpg', NULL, 4561, 14, 1, 'Quis dolore alias sapiente suscipit voluptate. Nisi qui ut est vitae commodi suscipit. Et provident sunt doloremque. Consectetur voluptas minus nobis id et amet illo.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(4, 6, 'computer-accessories', 'Qui e', 'Qui-e', 'default_img.jpg', NULL, 435, 27, 1, 'Qui magni labore numquam quia est voluptas qui. Distinctio odio ad qui magnam. Consequuntur et aspernatur voluptates minima consequatur soluta enim. Et accusantium fugit dolores aut eum sint.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(5, 7, 'laptop', 'Voluptate incidun', 'Voluptate-incidun', 'default_img.jpg', NULL, 3711, 32, 0, 'Rerum architecto rerum maiores et in. Laboriosam quis nemo rerum quod aut voluptatem quam nostrum. Dolor consequatur voluptas facere qui consequatur ea et error.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(6, 7, 'computer-accessories', 'Quos offici', 'Quos-offici', 'default_img.jpg', NULL, 1636, 12, 4, 'Id quaerat exercitationem vel alias quia eos. Qui harum temporibus quo numquam minus placeat. Occaecati nulla aperiam aliquam deserunt voluptatibus quas aut. Sit architecto tenetur eaque sunt consequuntur.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(7, 5, 'tablet', 'Sunt minu', 'Sunt-minu', 'default_img.jpg', NULL, 543, 4, 0, 'Molestiae qui modi delectus officiis. Velit voluptatum asperiores laboriosam officia aspernatur. Nesciunt ut ea et neque hic. Ipsum hic reprehenderit ipsa ullam doloremque.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(8, 3, 'computer-accessories', 'Dolores nobis eu', 'Dolores-nobis-eu', 'default_img.jpg', NULL, 1939, 22, 5, 'Laborum corrupti quam voluptatum qui nostrum. Minus perferendis occaecati quisquam sequi.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(9, 6, 'computer-accessories', 'Minima si', 'Minima-si', 'default_img.jpg', NULL, 1967, 21, 5, 'Corporis provident earum est qui. Assumenda ratione sint officiis ducimus. Doloribus qui error commodi eos. Id similique tempore culpa et sunt omnis debitis. Tempora accusantium deserunt et repellat nisi et.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(10, 7, 'mobile-accessories', 'Ex illu', 'Ex-illu', 'default_img.jpg', NULL, 4746, 13, 4, 'Debitis non reiciendis placeat odit consequatur animi. Laborum numquam molestiae rem qui dignissimos doloremque necessitatibus. Dignissimos sed tempore sit beatae eius.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(11, 7, 'laptop', 'Et occaecat', 'Et-occaecat', 'default_img.jpg', NULL, 3933, 24, 5, 'Culpa ex nihil corrupti dicta vel minima aut. Corporis nam modi deserunt deleniti delectus aut officiis. Odit velit et eum blanditiis. Est ex eligendi reiciendis aut excepturi.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(12, 6, 'computer-accessories', 'Vero ipsa qua', 'Vero-ipsa-qua', 'default_img.jpg', NULL, 1872, 4, 3, 'Sunt officia sint ea est neque. Qui ad enim quae consequatur blanditiis rerum nisi eum. Maiores numquam eveniet facilis aut.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(13, 2, 'tablet', 'Officiis et itaqu', 'Officiis-et-itaqu', 'default_img.jpg', NULL, 2316, 15, 0, 'Natus qui et quaerat occaecati iure et. Et iusto nostrum aliquam incidunt. Explicabo mollitia veritatis animi deserunt ipsam. Alias quia qui accusamus reprehenderit voluptate reprehenderit magni.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(14, 1, 'tablet', 'Magni ipsu', 'Magni-ipsu', 'default_img.jpg', NULL, 1593, 10, 3, 'Non quisquam ab neque fugiat sed reprehenderit. Non alias qui hic. Facilis pariatur veritatis delectus voluptas. Voluptatem libero incidunt impedit sit adipisci.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(15, 4, 'mobile', 'Tempora liber', 'Tempora-liber', 'default_img.jpg', NULL, 587, 6, 4, 'Voluptatibus reiciendis consectetur aut vel asperiores nulla optio. Sed debitis rem amet quos. Reprehenderit sunt nam rerum voluptatem laborum maiores dicta. Voluptate expedita occaecati consectetur rerum error quia non.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(16, 8, 'mobile', 'Repellendus in delenit', 'Repellendus-in-delenit', 'default_img.jpg', NULL, 696, 29, 2, 'Dolorem ad optio aut voluptas. Qui molestias ipsa ex.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(17, 7, 'laptop', 'Atque sit null', 'Atque-sit-null', 'default_img.jpg', NULL, 1993, 32, 2, 'Porro sint quis voluptatem tempora qui occaecati impedit dignissimos. Aut neque doloribus totam rem quasi ut. Minima omnis esse quasi excepturi iure.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(18, 5, 'tablet', 'Laboriosam autem impedi', 'Laboriosam-autem-impedi', 'default_img.jpg', NULL, 3417, 23, 4, 'Id et repudiandae possimus occaecati saepe. Optio dolorem non sit accusantium labore distinctio repellendus. Delectus architecto non sed nam alias et distinctio aut. Quia molestiae et atque facilis aut dolorum.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(19, 7, 'tablet', 'Est dolore', 'Est-dolore', 'default_img.jpg', NULL, 4258, 7, 1, 'Nihil molestiae vel dolor necessitatibus eum repellat. Totam voluptates optio voluptate inventore quibusdam cumque. Omnis accusamus laudantium eligendi velit. Atque nostrum excepturi tenetur consectetur voluptas aspernatur.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(20, 3, 'pc', 'Quasi minima nequ', 'Quasi-minima-nequ', 'default_img.jpg', NULL, 1284, 24, 4, 'Magni tempore voluptatibus rerum sed enim odit autem. Vel iure quod sed porro facere. Nihil neque dolorem at. Dolorem sunt quisquam ullam consequatur porro quia suscipit pariatur.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(21, 7, 'computer-accessories', 'Autem eum', 'Autem-eum', 'default_img.jpg', NULL, 3133, 22, 4, 'Recusandae excepturi voluptas tempora error amet totam. Maxime saepe harum et non. Nihil quibusdam qui veritatis reprehenderit alias. Quia sunt vitae qui.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(22, 5, 'laptop', 'Qui laborum', 'Qui-laborum', 'default_img.jpg', NULL, 2218, 32, 1, 'Error voluptatem rerum rem cum non a. Ut nihil unde nobis minus qui. Minima dolore nostrum corporis voluptatem autem. Delectus commodi nihil voluptatem.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(23, 8, 'pc', 'Quidem tenetur pariatur', 'Quidem-tenetur-pariatur', 'default_img.jpg', NULL, 2763, 14, 2, 'Sapiente non odio exercitationem ad rerum eligendi consectetur. Nulla ut ad quibusdam quos minima. Eligendi fuga eaque officiis officia id dolore itaque.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(24, 8, 'laptop', 'In ipsam repellat', 'In-ipsam-repellat', 'default_img.jpg', NULL, 2511, 7, 5, 'Optio qui dicta ut harum est excepturi molestiae. Magnam nostrum impedit molestiae mollitia dicta voluptate voluptatem. Ut quasi qui eum odio et dolores aut. Omnis est dolorum qui et possimus ut.', '2020-10-12 21:44:01', '2020-10-12 21:48:26'),
(25, 7, 'mobile', 'Veritatis eos tenetur', 'Veritatis-eos-tenetur', 'default_img.jpg', NULL, 873, 23, 4, 'Sit sequi eius laudantium ipsam natus. Explicabo inventore nobis est nulla et et.', '2020-10-12 21:44:01', '2020-10-12 21:48:26'),
(26, 8, 'computer-accessories', 'Sint rem officiis', 'Sint-rem-officiis', 'default_img.jpg', NULL, 1017, 19, 3, 'Repudiandae porro aut ad. Voluptatem dolorum earum dolores tempora esse praesentium illo. Nesciunt rerum repellat cum inventore distinctio at necessitatibus.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(27, 2, 'mobile', 'Cum molestiae', 'Cum-molestiae', 'default_img.jpg', NULL, 2741, 6, 4, 'Nobis natus perferendis error dolores occaecati. Velit placeat consequuntur minus enim. Reiciendis sit perferendis quidem aspernatur.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(28, 3, 'computer-accessories', 'Voluptatem ut iure', 'Voluptatem-ut-iure', 'default_img.jpg', NULL, 2594, 14, 0, 'A soluta ipsa qui pariatur aperiam laboriosam dolores. Corporis et et et praesentium odit repudiandae perspiciatis.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(29, 4, 'tablet', 'Dolorum ipsa veniam', 'Dolorum-ipsa-veniam', 'default_img.jpg', NULL, 3836, 6, 3, 'Voluptatem culpa eos voluptatem quod. Molestiae quae officia assumenda dolor. Natus voluptatem ullam voluptas fugiat atque. Sit veniam eum dicta voluptatibus voluptatem veniam. Iure omnis dolorem qui.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(30, 9, 'mobile-accessories', 'Quaerat et cupiditate', 'Quaerat-et-cupiditate', 'default_img.jpg', NULL, 2508, 29, 5, 'Ratione incidunt est sed cupiditate fugiat qui. Quis voluptate corporis fuga qui consequatur. Laborum ut debitis aut magni. Porro excepturi omnis sint in.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(31, 4, 'mobile', 'Et rerum in', 'Et-rerum-in', 'default_img.jpg', NULL, 2637, 9, 5, 'Voluptatum dicta temporibus consectetur totam cum. Omnis quia quia quas consequatur unde eaque. Id et nisi repellat cum dignissimos tempore. Aut porro eius similique et recusandae.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(32, 9, 'laptop', 'Culpa temporibus inventore', 'Culpa-temporibus-inventore', 'default_img.jpg', NULL, 1356, 25, 4, 'Ab architecto saepe enim dolor architecto et. Voluptatem eos sed temporibus itaque reprehenderit. Vel nesciunt est culpa nam voluptas at atque. Et rerum pariatur soluta ab.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(33, 9, 'tablet', 'Praesentium modi', 'Praesentium-modi', 'default_img.jpg', NULL, 4182, 5, 1, 'Quis velit necessitatibus soluta quo omnis voluptates maiores quos. Voluptates sed quia nisi perferendis eos similique. Ipsam recusandae et ratione cum aspernatur. Quaerat at aspernatur est accusamus voluptatem voluptatem atque.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(34, 3, 'computer-accessories', 'Rerum voluptate iste', 'Rerum-voluptate-iste', 'default_img.jpg', NULL, 4597, 5, 2, 'Laboriosam aut consectetur expedita eveniet. Qui ea minus voluptatibus et laboriosam repellat et. Reiciendis in sed qui ea eum sunt. Sunt eius quis iure et optio sit.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(35, 8, 'pc', 'Dolores sed facere', 'Dolores-sed-facere', 'default_img.jpg', NULL, 1462, 23, 3, 'Nostrum officia enim ipsa reiciendis labore. Optio nihil dolor nemo ratione sed. Commodi expedita animi aliquid sit ullam.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(36, 7, 'pc', 'Culpa dolore', 'Culpa-dolore', 'default_img.jpg', NULL, 1776, 18, 3, 'Natus eligendi non corrupti quia. Inventore commodi sint omnis ut. Dicta aut animi voluptas dolores.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(37, 8, 'tablet', 'Eius molestiae qui', 'Eius-molestiae-qui', 'default_img.jpg', NULL, 158, 32, 2, 'Natus iusto deserunt quam quibusdam omnis doloribus. Laborum praesentium non beatae excepturi. Enim eos dicta cupiditate cupiditate rerum. Facere natus perspiciatis tempora nihil ab.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(38, 3, 'computer-accessories', 'Sit eos', 'Sit-eos', 'default_img.jpg', NULL, 3621, 22, 4, 'Est et quia ratione aut ullam. Veritatis velit aut cupiditate molestiae repellat voluptatibus. Dolores iste dolores ut minus porro autem consequatur. Minus repellendus veritatis et et vel.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(39, 10, 'tablet', 'Temporibus non in', 'Temporibus-non-in', 'default_img.jpg', NULL, 4405, 15, 4, 'Amet beatae voluptatem sit eos. Qui porro voluptatum unde impedit. Officia sed et ipsum.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(40, 3, 'tablet', 'Sit voluptas molestiae', 'Sit-voluptas-molestiae', 'default_img.jpg', NULL, 352, 8, 2, 'Vel ut quaerat earum quo. At eos corrupti aut repudiandae iure. Et suscipit alias optio qui atque assumenda beatae. Sint reiciendis blanditiis ex consequatur pariatur. Aut quasi mollitia fuga veritatis in ut autem.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(41, 3, 'computer-accessories', 'Sunt voluptas qui', 'Sunt-voluptas-qui', 'default_img.jpg', NULL, 2813, 20, 5, 'Dolor optio veniam repudiandae velit. Occaecati eaque ab aut facilis harum. Est esse aliquid et voluptatum fugiat nobis.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(42, 9, 'mobile-accessories', 'Veritatis a occaecati', 'Veritatis-a-occaecati', 'default_img.jpg', NULL, 3148, 6, 0, 'Qui quaerat quaerat ullam quisquam laboriosam. Reiciendis enim delectus eum. Animi est odio dignissimos modi ipsum amet asperiores. Itaque voluptas facilis omnis.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(43, 2, 'mobile', 'Sed et sequi', 'Sed-et-sequi', 'default_img.jpg', NULL, 223, 9, 4, 'Nobis a consequatur dolores et. Id qui odit beatae qui eveniet quod magni.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(44, 10, 'mobile-accessories', 'Inventore eligendi sequi', 'Inventore-eligendi-sequi', 'default_img.jpg', NULL, 3829, 25, 0, 'Nemo ipsa culpa qui sit culpa consequatur molestiae. Ad eum et et delectus fugit error ratione. Sunt sint sint beatae blanditiis accusamus.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(45, 1, 'pc', 'Tempore tenetur', 'Tempore-tenetur', 'default_img.jpg', NULL, 1429, 27, 5, 'Culpa iure sint quisquam pariatur molestiae quam. Maiores deleniti enim qui consequatur quo repellendus laborum. Placeat optio ea ex omnis neque. A ab ipsa debitis recusandae quo. Aut ratione molestias recusandae et.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(46, 8, 'mobile-accessories', 'Animi fugit maxime', 'Animi-fugit-maxime', 'default_img.jpg', NULL, 1813, 19, 5, 'Dolores error ex recusandae veniam consequatur nihil necessitatibus. Itaque rerum dolor accusantium sed reprehenderit et. Est nesciunt aut quia suscipit esse reprehenderit iure. Blanditiis veniam numquam nemo aspernatur.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(47, 5, 'pc', 'Et quia', 'Et-quia', 'default_img.jpg', NULL, 755, 28, 5, 'Eum et voluptate occaecati est eligendi voluptas. Nobis aut ducimus qui ducimus mollitia. Nemo architecto est minima autem.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(48, 9, 'tablet', 'Quidem rem dolor', 'Quidem-rem-dolor', 'default_img.jpg', NULL, 3642, 17, 1, 'Soluta occaecati magni debitis minima autem et neque. Corrupti suscipit est placeat molestias quia reiciendis. Dolorem minus officiis et nam nemo. Ea laboriosam consequatur voluptas odit velit repellat vel. Soluta repellat maxime sunt quia voluptatem quod.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(49, 10, 'computer-accessories', 'Repellat animi enim', 'Repellat-animi-enim', 'default_img.jpg', NULL, 4871, 34, 2, 'Perferendis id numquam architecto officia. Sint quis iste tenetur. Qui aut similique sapiente quo esse esse sit. Eos nesciunt aspernatur temporibus et nemo sit.', '2020-10-12 21:44:02', '2020-10-12 21:48:28'),
(50, 8, 'computer-accessories', 'Quae exercitationem', 'Quae-exercitationem', 'default_img.jpg', NULL, 2171, 24, 2, 'Ipsam error eos laboriosam ut non aliquam. Omnis dolor deserunt voluptatum ipsa aperiam adipisci. Eum et omnis magnam beatae. Fugiat excepturi sint eligendi voluptatibus saepe unde nesciunt.', '2020-10-12 21:44:02', '2020-10-12 21:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stars` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `review`, `stars`, `created_at`, `updated_at`) VALUES
(1, 15, 7, 'Sint voluptate libero minima est. Occaecati mollitia est est sed molestias qui voluptas.', 1, '2020-10-12 21:44:04', '2020-10-12 21:44:04'),
(2, 19, 3, 'Et vitae necessitatibus explicabo ipsum. Neque a eligendi ipsa modi ad dolor magnam voluptatem. Deleniti voluptatum illo maxime aut. In et est commodi molestias ut adipisci.', 4, '2020-10-12 21:44:04', '2020-10-12 21:44:04'),
(3, 46, 2, 'Est et quia amet voluptate repellat autem. Dicta ab autem blanditiis odio ab consequuntur. Omnis et commodi in enim. Dolorem voluptas iste rem nihil.', 3, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(4, 10, 9, 'Laudantium qui maiores optio iusto voluptas architecto temporibus. Qui vel molestiae dicta iusto officia. Adipisci vero maxime exercitationem ad facere qui omnis.', 0, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(5, 50, 7, 'Qui est eos sequi fugit. Sunt repellat cumque consequatur aut. Consequatur nulla placeat perferendis iure quia possimus quidem.', 3, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(6, 3, 10, 'At unde deserunt corporis repudiandae tempore. Eos dolore autem itaque ut. Eum qui itaque id et natus maxime.', 4, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(7, 11, 4, 'Sunt voluptas soluta enim consequatur esse ea hic. Adipisci nesciunt dolorem qui blanditiis praesentium repudiandae odio. Sit consequatur quibusdam non sed id itaque et quo.', 4, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(8, 43, 2, 'Odio voluptas et molestias quaerat nulla doloremque. Maxime et et nemo sed minus tenetur. Quo et ipsum rerum praesentium aut commodi. Corporis quas deleniti debitis non ratione in.', 0, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(9, 40, 2, 'Et dolores dolor aut dolores modi non velit. Eveniet et qui et quo. Quia sequi aspernatur eum. Ea aut ut culpa.', 0, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(10, 4, 9, 'Voluptas id dolorem dolorem molestiae omnis qui. Perferendis alias beatae et dolores minima tenetur. Voluptate et rerum dolores sit.', 2, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(11, 13, 8, 'Quaerat sunt voluptas omnis quibusdam similique consequuntur. Quibusdam qui fuga debitis qui. Ratione reprehenderit eos blanditiis sint impedit quis et. Praesentium accusantium occaecati sapiente nam.', 3, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(12, 7, 8, 'In quo voluptatum enim et at expedita in ut. Labore consequuntur impedit id dolore voluptatem aut. Hic itaque ducimus reprehenderit vel dolores rem sunt. Officia aut voluptate expedita maxime rerum adipisci dolore.', 2, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(13, 29, 5, 'Molestias consequatur corporis consequatur facere. Aliquam cum voluptatibus nemo nam voluptatem. Deleniti quo explicabo libero dolore officiis vel consequatur.', 0, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(14, 15, 2, 'Eos aperiam quasi consequuntur sit saepe iure. Nulla deserunt esse molestiae error consectetur ab repudiandae et. Harum nostrum officiis nihil qui dolorum. Sed placeat et non nulla non aspernatur corporis.', 4, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(15, 20, 5, 'Nostrum a sunt aut voluptatem dicta hic nobis. Ipsum dicta aliquid maxime eum voluptatum ut et. Illo facere qui suscipit minus sit laborum modi. Dolor deserunt voluptate ex est consequatur. Consequatur dolorum praesentium neque.', 4, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(16, 19, 5, 'Recusandae adipisci aut id aspernatur. Tempore id minus id ut quisquam deleniti excepturi. Laboriosam quod minus dolor porro.', 3, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(17, 9, 6, 'Ad aliquam officiis adipisci impedit. Voluptatem repudiandae nesciunt est modi sapiente debitis. Facilis numquam non itaque consectetur a illo quia. Facilis minus quae et laudantium corrupti reiciendis.', 1, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(18, 34, 2, 'Beatae debitis mollitia sapiente vero in quo aut. Dolore et quia molestiae quia voluptas ipsam natus. Sit fugiat vero aut facere.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(19, 42, 6, 'Et saepe consequatur expedita consequatur eveniet assumenda. Quis totam autem dicta quas expedita accusamus. Cum iste quidem et doloremque corrupti omnis.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(20, 37, 1, 'Ex et a laudantium dolor perferendis. Deserunt velit distinctio veniam consequatur eius harum. Qui mollitia non quisquam totam deleniti et.', 0, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(21, 41, 3, 'Vel reiciendis rem dolore nihil vero. Iusto recusandae cum ut debitis sit. Exercitationem est reiciendis rerum. Recusandae nostrum quis soluta neque.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(22, 15, 1, 'Debitis quo hic laborum est aut. Perferendis deserunt maxime voluptate sit sit saepe. Et veritatis nesciunt cumque provident optio iste.', 3, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(23, 33, 4, 'Velit rerum rerum assumenda rem in. Quo laboriosam ipsum est quidem. Distinctio quis nesciunt dolores expedita quaerat adipisci non.', 4, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(24, 29, 10, 'Quam ab voluptatem natus voluptatem. Voluptatem provident sint debitis at quam illum omnis. Sunt aut eum tempora rerum reprehenderit ipsa nam. Qui veritatis enim ut voluptates temporibus quas.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(25, 27, 2, 'Delectus adipisci voluptatem cumque optio incidunt numquam. Vero voluptas et ipsam accusamus quis omnis ex. Nostrum dolore cum ipsa iusto.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(26, 43, 10, 'Laboriosam magni quis quisquam dolor repudiandae similique. Asperiores voluptates eum molestiae dolor. Sit quos sit qui aut eum libero consectetur. Et sed dolor sed accusantium et.', 4, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(27, 1, 9, 'Placeat maiores cum incidunt. Iste qui sit tenetur quae enim voluptates itaque. Aut adipisci quis magnam sint.', 0, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(28, 30, 2, 'Aut fuga odio suscipit architecto fugiat itaque fugit assumenda. Qui exercitationem animi est placeat. Velit ipsa fugit eius. Sequi sunt qui placeat quas qui et molestias. Et veritatis pariatur qui omnis a autem.', 3, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(29, 25, 3, 'Ipsam omnis sit saepe fugit est unde ab. Dolore pariatur ipsam et numquam quia aliquid. Perspiciatis maxime voluptas maiores adipisci sapiente. Repudiandae eligendi aut cupiditate vel. Velit possimus provident voluptatum dicta error inventore.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(30, 12, 2, 'Qui odit ut sapiente sint. Rerum et esse nihil sunt quasi quod odit. Quia laboriosam dolore ea ut assumenda ullam voluptates et.', 0, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(31, 36, 9, 'Quas ut et dolor omnis. Ad maxime rerum mollitia distinctio dicta sed pariatur omnis. A quidem voluptates vel sit omnis.', 3, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(32, 14, 2, 'Rerum rerum fugiat qui sit quia eaque. Qui et quae est quis. Cumque adipisci et enim reiciendis quis voluptas. Sunt nulla natus eos perferendis laborum totam consectetur saepe. Libero distinctio harum magnam et.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(33, 28, 3, 'Aperiam ducimus et architecto reiciendis natus aut iusto. Dolorum harum temporibus eum magni ex. Sequi alias voluptatem eum nihil nisi. Corporis consequatur rerum cum voluptatem ut et odit omnis. Consequatur sit cumque vero accusamus facere.', 4, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(34, 46, 1, 'Totam ut quae rerum quibusdam odio voluptas ut. Aperiam libero non quae sint ut cupiditate quas. Exercitationem et rerum recusandae doloremque. Aspernatur sit aliquid nostrum fuga.', 3, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(35, 21, 10, 'Nihil quos id dolor non dolorem. In dolorem aut ut ab.', 3, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(36, 11, 10, 'Dolor doloremque ratione ducimus sunt qui blanditiis corrupti. Quisquam maxime dolores ratione in illo. Qui sunt id iure.', 2, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(37, 34, 6, 'Minima et aut rerum quasi eos occaecati. Eius aut quos omnis aut. Ab voluptatem dignissimos voluptates facilis placeat est sit. Et necessitatibus ab consequatur magnam.', 1, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(38, 47, 5, 'Vitae veritatis dolore perferendis ad ea sint numquam. Dolor et maxime officia facilis quia et accusamus officia. Ad optio asperiores voluptatum velit similique magni aperiam qui. Placeat reiciendis iusto perspiciatis.', 5, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(39, 26, 9, 'Velit harum debitis sunt eaque. Illum unde error id quasi dolor.', 1, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(40, 27, 10, 'Et ducimus aperiam et dolor ullam quis aut. Nesciunt dolorem pariatur modi ut sed odit sed. Quas est quis veniam facilis quam enim non magni.', 4, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(41, 16, 10, 'Dolor officiis voluptatem ipsam occaecati voluptatem. Quidem consequatur est dolores quam aut nulla nihil. Qui ex maxime sit voluptas temporibus qui.', 3, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(42, 40, 1, 'Nemo nemo optio ex rerum dolore placeat. Accusamus quos ut quibusdam occaecati. Omnis ut dolor animi illo.', 5, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(43, 28, 8, 'Sunt qui dignissimos molestiae. Perspiciatis ut eos modi delectus blanditiis occaecati eum. Sed officiis itaque est et ut nihil corporis. Nisi consequatur voluptatum at. Qui eius quia aut enim tempora animi sit.', 0, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(44, 2, 10, 'Illo odio enim asperiores. Eos suscipit ullam dolor consectetur ipsa totam. Dolores exercitationem omnis exercitationem officia ut aspernatur tempora. Dolores iste aut est repellendus quibusdam ullam aliquam.', 2, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(45, 32, 10, 'Quia cum minima blanditiis odit dicta. Ut consequuntur occaecati odit eos autem. Dolor ducimus earum voluptatibus aspernatur dignissimos et non eos.', 1, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(46, 16, 5, 'Voluptatum beatae id nihil maiores corrupti. Ab temporibus ratione dolorum eum. Voluptates quo sunt voluptatum modi reiciendis ut odio omnis. Magni qui architecto quod iusto. Iusto sed ea et non.', 2, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(47, 38, 5, 'Ad eum quo molestiae. Modi sit quis mollitia repudiandae. Ratione debitis aliquid ea quis. Illum voluptatem sit saepe aut.', 5, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(48, 19, 8, 'Harum beatae reiciendis voluptatem numquam qui nesciunt veritatis adipisci. Quasi ratione voluptatem et consequatur qui. Qui consequatur nam sequi iusto. Atque esse omnis iste animi eveniet sit natus.', 5, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(49, 37, 9, 'Corrupti nesciunt quasi iste rerum necessitatibus et. Quaerat minima eos optio odio laudantium qui occaecati. Nisi ut dolores blanditiis deleniti. Odio ab ut non rem.', 4, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(50, 19, 1, 'Ut debitis iure minima perspiciatis esse nobis minus qui. Autem maxime accusamus tempora quam veritatis fuga accusamus. Excepturi aut aliquid sunt dolor iure.', 4, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(51, 16, 4, 'Earum ex eum neque quod ut explicabo quis. Molestiae aut perspiciatis dolores minima rem velit qui. Sapiente atque ipsam qui quibusdam quia quia.', 0, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(52, 11, 6, 'Illum et sed sunt qui eveniet ab. Culpa eaque harum quaerat architecto temporibus dolorem suscipit. Officiis reprehenderit voluptatem quisquam id ut eos.', 2, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(53, 4, 2, 'Et quis tenetur corporis omnis molestiae velit sit. Laboriosam accusamus minus id reiciendis et et architecto. Aperiam velit officia veritatis temporibus omnis.', 5, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(54, 18, 10, 'Maxime debitis aliquid iste quae ipsa et architecto ullam. Recusandae rerum quo repudiandae sit vitae aliquam et. Et modi autem aspernatur rerum.', 5, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(55, 1, 3, 'Et nesciunt similique esse accusantium doloremque a eum. Ut saepe deserunt ut quia occaecati ut optio. Labore voluptas cupiditate at magnam aliquid ducimus commodi minima. Rerum nobis reiciendis ut a dignissimos occaecati.', 3, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(56, 12, 2, 'Eveniet et velit occaecati sint et non dolore. Consequatur ducimus eum fuga aut. Et quia qui velit voluptas magnam sit.', 4, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(57, 25, 10, 'Vero laborum voluptate repellat omnis veritatis ut. Illo nihil omnis voluptas omnis assumenda nam laborum eum. Aut quis rerum veritatis sit quidem et.', 2, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(58, 40, 5, 'Omnis eum iure unde molestiae quisquam dolor. Voluptate beatae eos suscipit temporibus et libero nemo. Sunt provident eius occaecati. Porro quidem dolorem magnam fugiat deserunt blanditiis et commodi.', 0, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(59, 17, 10, 'Impedit rerum consequatur aspernatur dolorem sunt ipsa. Natus omnis enim voluptatem in. Eveniet est minus asperiores praesentium nobis.', 3, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(60, 2, 6, 'Rerum totam vitae deserunt quos dolore dolor ipsa. Eaque non molestiae quisquam. Adipisci rem ea dolorem dolorum ipsum excepturi.', 5, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(61, 38, 1, 'Ab ea earum sapiente alias. Distinctio vel atque ipsum consectetur. Optio maxime nulla et quod. Autem repudiandae esse rerum id aut nostrum velit.', 3, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(62, 11, 2, 'Et eos quis aut id aut et reiciendis. Nam excepturi quaerat deleniti vitae aliquam cum. Voluptatem dolor quia nihil fuga qui aut.', 3, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(63, 12, 5, 'Nobis eos qui minima qui eum. Rem nesciunt fugit enim maiores esse. Omnis reiciendis unde quia ex ut enim.', 2, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(64, 33, 8, 'Recusandae error cupiditate consequatur. Ut ratione veniam qui incidunt omnis dolor. Aut rerum cumque sed aliquid quisquam eveniet possimus. Minima et occaecati nihil consequuntur.', 4, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(65, 18, 9, 'Aut maiores numquam alias reiciendis cum. Magnam hic veritatis quis consequuntur. Quia repellendus vitae fuga nobis.', 4, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(66, 29, 8, 'Consequatur et voluptas delectus ut inventore quo inventore. Ipsa repudiandae vel consectetur consequatur qui quia deserunt. Perferendis quas vel facere beatae omnis. Sed soluta excepturi illum est maiores provident. Dolorum omnis totam autem hic voluptatem ipsum et.', 2, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(67, 37, 2, 'Officia incidunt autem itaque est amet quia consequatur. Quis quia sed eius nulla ab aliquid. Ipsum rerum eaque quod qui.', 1, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(68, 14, 8, 'Sit officia laudantium impedit sequi dignissimos dolorum expedita sed. Est dolor id tenetur error consequuntur earum sint nobis. Id recusandae sit nihil et. Esse eius corrupti doloremque dolorum molestiae ratione.', 5, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(69, 27, 9, 'Vel ea numquam vel vitae a optio fugiat adipisci. Non placeat impedit itaque facilis facere. Ut accusamus eaque tenetur repudiandae magni excepturi.', 1, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(70, 28, 5, 'Omnis ut totam mollitia at natus dolore. Est aut velit eum quia atque similique distinctio et.', 3, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(71, 11, 10, 'Dolorem voluptates sint dolores ut et. Dolorem et quidem et aperiam accusamus id saepe. Explicabo ut porro praesentium voluptatem corporis amet. Dolorum vel quia deserunt corrupti at.', 5, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(72, 30, 2, 'Facilis autem nam culpa dolores perferendis inventore. Et aut voluptatum sunt vel et quia non.', 3, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(73, 21, 2, 'Atque nam nulla deserunt id quidem aut. Laborum voluptatem eum deserunt. Quo voluptate sint ea voluptatem. Quisquam autem ut explicabo vitae debitis nobis consequatur.', 4, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(74, 13, 7, 'Autem dolores minus ut quibusdam vel quis. Ad commodi est blanditiis fugiat. Nam repudiandae quo accusamus laudantium ut hic. Dolores dolorem quam eos et quibusdam consequatur delectus quisquam. Optio et ipsum dolorem maiores quia itaque omnis.', 4, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(75, 3, 4, 'Ut quia ut facilis. Hic quia non vel est repellendus ratione incidunt.', 4, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(76, 5, 5, 'Id dolorem molestiae consequuntur aut enim. Repudiandae quo veniam a quia. Eligendi unde et doloribus molestias dolores qui.', 4, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(77, 38, 4, 'Beatae perferendis perferendis veritatis cupiditate consequatur. Iusto blanditiis praesentium odit aut. Nemo rerum porro vitae officia nihil laborum consequatur. Voluptas maxime sit cumque inventore sed aut.', 2, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(78, 31, 3, 'Qui occaecati sed aut. Maiores voluptate accusantium corrupti voluptatem voluptas. Et corrupti aut est corrupti asperiores non sequi qui.', 2, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(79, 48, 4, 'Aut expedita autem dolor. Veniam perspiciatis dolor numquam eligendi et. Autem debitis molestiae quis aperiam qui iure rerum. Facere quae aspernatur nihil qui ut harum nisi.', 1, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(80, 19, 7, 'Illum neque voluptas et est nihil animi explicabo iste. Ipsum delectus est et iure. Sed aut nemo pariatur quasi. Tenetur autem facilis et exercitationem ea.', 5, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(81, 48, 7, 'Voluptate esse enim veritatis maiores officiis voluptate. Optio quam quo quos sint a rerum eum. Cupiditate est at nemo corporis.', 1, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(82, 29, 10, 'Veritatis mollitia quaerat qui et explicabo aut quia. Et et repudiandae possimus dolores accusantium velit illo. Modi omnis sunt architecto est. Dolores dolorum unde perspiciatis molestiae rerum et.', 4, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(83, 48, 2, 'Vel autem labore omnis praesentium consequatur rerum. Sit exercitationem enim voluptatibus qui quidem porro sit. Voluptate natus natus numquam mollitia non sed.', 1, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(84, 30, 2, 'Quo ad et laboriosam sunt sunt aut vel. Libero doloribus quia quia. Odio magnam fugiat assumenda.', 2, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(85, 37, 10, 'Animi molestiae sapiente et illo delectus consequatur aliquam. Eius ex impedit omnis doloribus nihil. Possimus officia omnis aut occaecati ducimus enim illo. Repellat corporis dolores et.', 5, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(86, 6, 9, 'Commodi sit in magni reprehenderit. Aut voluptas quas voluptas unde voluptas rerum. Voluptatum recusandae labore libero libero praesentium amet. Esse consectetur tenetur aliquam distinctio.', 5, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(87, 24, 5, 'Reprehenderit optio minima similique dolores ab. Voluptas et hic quo eum natus dolorem animi provident. Nesciunt facilis et voluptas autem facilis. Aut praesentium qui voluptates dolores officia.', 5, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(88, 29, 10, 'Enim veniam quia veniam odio et. Dolorem iure odit non consequatur quia nemo. Error sed explicabo distinctio a veritatis.', 4, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(89, 21, 1, 'Sunt sed nobis quia rerum temporibus voluptate officiis sapiente. Aut quis officiis a distinctio ex velit. Et corporis sit aliquid nihil consequatur vitae dicta. Quidem et et voluptatibus vel sunt possimus.', 4, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(90, 21, 3, 'Deleniti maiores qui tempore sunt voluptas hic dolorem. Iure dolor reiciendis ducimus ea eum eos. Assumenda enim fugiat laborum minima.', 3, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(91, 46, 4, 'Et architecto eveniet explicabo qui ut quis atque. Enim est ipsam asperiores aspernatur qui fugiat ut. Officiis quos qui ad aliquid. Dolorem enim labore similique rerum cumque ratione impedit laudantium. Laborum cumque repellat molestiae molestiae enim sit.', 4, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(92, 17, 6, 'Similique porro eos amet at eum culpa eligendi. Suscipit dolorem nisi perferendis. Explicabo quis consequatur ad quis. Quae dicta deleniti et perferendis quis.', 1, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(93, 38, 10, 'Suscipit ipsam sequi et suscipit et ex vero. Cupiditate qui magni cumque maiores. Sapiente repellat nulla ad id. Et temporibus eligendi inventore architecto deleniti saepe sunt.', 5, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(94, 43, 3, 'Ad et consequatur laudantium itaque velit. Eveniet eaque quam omnis quis eum eveniet expedita. Nisi aut vel cupiditate ut aperiam fugit consequatur.', 2, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(95, 50, 8, 'Ea adipisci error ad saepe vel eos. Commodi corrupti enim cum. Repudiandae nostrum nulla consequatur tempora ratione.', 5, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(96, 10, 3, 'Expedita et illo et enim suscipit. Atque ipsa commodi explicabo libero voluptatem ut. Ut et ea quo id aut ab. Ut est consequatur enim asperiores nam et quam.', 3, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(97, 19, 1, 'Mollitia vel assumenda modi harum sint omnis quidem est. Perspiciatis consequatur quae sit esse tenetur modi minus. Reiciendis voluptatum ratione est blanditiis quis. Voluptatibus doloremque recusandae officia.', 3, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(98, 6, 10, 'Laboriosam quis earum tempore quos vitae cum. Est excepturi reiciendis suscipit cumque. Vero non rerum totam occaecati magnam molestias beatae voluptatibus. Quam sapiente laudantium non est et aperiam.', 0, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(99, 26, 8, 'Et accusamus omnis maiores voluptatum sequi similique. Et accusamus dignissimos dicta sed aspernatur adipisci veniam molestiae. Eveniet sapiente quis voluptatem quo vero. Repellendus odit eius et fugiat labore tempore.', 0, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(100, 20, 9, 'Fugiat excepturi sapiente assumenda qui. Praesentium quasi molestias nemo totam eligendi tempore recusandae. Et voluptas explicabo nihil consequuntur.', 0, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(101, 6, 7, 'Eligendi qui ut quia distinctio. Sequi magnam eligendi tenetur. Voluptatibus sunt nostrum nostrum debitis.', 2, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(102, 21, 4, 'Aut aperiam est consequatur eligendi dignissimos nam vel. Et rerum ex est numquam et molestiae ut quod. Sit iste ut voluptatem qui dolores architecto qui qui. Labore labore labore et dolorem necessitatibus quidem.', 4, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(103, 41, 1, 'Fugiat impedit amet iste amet. Delectus voluptatum non ipsum laborum incidunt eos consectetur. Repellendus et illo et ut dolor odio.', 5, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(104, 24, 7, 'Ea debitis eius molestiae. Hic non delectus qui ducimus qui voluptatem aut. Cumque esse libero omnis et numquam.', 4, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(105, 3, 4, 'Quo dolorum et amet in laborum consequatur iusto. Labore ut vel perspiciatis at eligendi perferendis molestias. Alias ullam omnis deserunt totam commodi. Nemo nulla quia maxime distinctio animi reprehenderit. Voluptatem necessitatibus voluptates laborum nostrum nisi et.', 4, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(106, 34, 1, 'Velit enim natus natus cupiditate animi. Corporis tempora est labore hic. Porro et aut qui consequuntur rerum tenetur. Dolores rerum dolorum soluta cum et odit maxime.', 1, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(107, 2, 6, 'Est expedita maxime porro quas eum repellat dolore. Nulla voluptatum velit necessitatibus neque natus voluptatum sed.', 0, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(108, 22, 2, 'Ipsam omnis velit odio sit hic eveniet. Itaque et dolorem sit commodi. Commodi veritatis eligendi nemo et voluptates.', 4, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(109, 7, 7, 'Dicta nisi accusantium sed recusandae ut dolorum. Dolorem et laudantium cum explicabo quibusdam. Voluptatem qui illum aperiam pariatur inventore iure iusto necessitatibus.', 2, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(110, 2, 5, 'Id iste porro consequuntur amet harum voluptatum ab. Labore quae magni mollitia ipsa. Harum quaerat autem optio et repellat nostrum explicabo. Est architecto consequatur quo.', 5, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(111, 10, 9, 'Saepe aut voluptatem vel itaque aliquid. Omnis dolores nostrum accusamus ullam illum aliquam. Iure ipsum sapiente corporis qui voluptatem et quam minima. Dolorem et quibusdam debitis qui.', 0, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(112, 40, 10, 'Repellat sed non cum animi ratione voluptatum tempora. Ipsam explicabo ea reiciendis repellendus cumque placeat. Sit et ratione et dicta est voluptatem. Veniam quia dicta autem et magni.', 1, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(113, 43, 6, 'Qui quia ut suscipit est. Nesciunt nam culpa tenetur dolor consequuntur odit. Natus vel rerum ut maiores ipsa amet pariatur.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(114, 8, 2, 'Qui eius ullam laborum culpa. Et autem adipisci mollitia error hic. Recusandae consequatur officia non.', 5, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(115, 44, 5, 'Doloribus id est qui temporibus voluptatum in. Tenetur similique aliquam suscipit dolorem dolor incidunt iusto.', 4, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(116, 41, 8, 'Sed tempora molestiae eveniet. Incidunt mollitia est quia dicta aut ut voluptatibus. Fugiat nulla velit tenetur dolor quo rerum deserunt aut. Dignissimos magnam non asperiores dolores debitis consequatur.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(117, 25, 4, 'Quaerat possimus iure voluptatem nulla iusto aut. Magni enim vel pariatur enim aut.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(118, 28, 4, 'Numquam omnis perferendis omnis nihil ullam quo. Tempora velit aut iste eligendi doloremque. Occaecati assumenda eveniet sit perspiciatis blanditiis. Explicabo ut possimus ut sed explicabo voluptates.', 0, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(119, 37, 1, 'Optio quo rerum quia enim nemo est asperiores. Molestias architecto inventore impedit ipsam tempore. Qui exercitationem perferendis ipsum dolores.', 1, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(120, 8, 6, 'Sed culpa illo enim voluptas. Magni aut laborum delectus et sit et. Repellat sit ducimus error corrupti aliquid odio qui. Suscipit nihil doloremque est rem. Sit omnis aut exercitationem eos ut minima repellat.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(121, 32, 1, 'Qui ab sit fugit et. Aut optio rerum sit mollitia rerum id. Nostrum minima consequatur dolor vero cupiditate.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(122, 10, 4, 'Ducimus ipsam incidunt sit quam aut earum quisquam. Eum commodi est corrupti recusandae consectetur veritatis et. Eos quasi ut dolorem quos natus eius quibusdam.', 4, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(123, 40, 2, 'Quis non est quia consequatur ad laborum. Nulla sint doloribus voluptatem at. Iste aut perferendis itaque impedit quibusdam voluptatibus totam. Ex accusamus et impedit fugit velit eos.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(124, 34, 8, 'Molestias porro cumque cupiditate ut. Commodi optio delectus magni maiores hic.', 5, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(125, 47, 1, 'Ut minima accusamus facilis perferendis nam repellendus aspernatur. Voluptas qui eaque quae sunt repellendus repudiandae. Veritatis eos ut ipsa maiores sapiente. Aliquam exercitationem voluptates voluptatem id.', 0, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(126, 5, 7, 'Ut voluptas sint cum nobis. Asperiores possimus sed soluta a esse totam eum sapiente. Explicabo suscipit ut non aut libero rerum. Explicabo voluptas totam veniam eum modi.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(127, 20, 9, 'Ab molestiae magnam amet aut. Ipsam ratione suscipit eum quis dolorem consequatur. Eum assumenda nam optio modi porro.', 0, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(128, 46, 7, 'Dolorem praesentium itaque dolore quaerat officiis vel reiciendis aut. Perferendis illum ab voluptatem culpa. Voluptas aut consequuntur eius. Quod rerum ut ut voluptatibus.', 4, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(129, 48, 9, 'Cupiditate alias autem perferendis laborum. Quia pariatur nesciunt alias inventore. Aperiam enim quo harum provident reprehenderit quisquam accusamus.', 3, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(130, 19, 5, 'Aut et accusantium modi adipisci dolor sit. Cum vitae dolores sunt voluptas voluptas ipsam. Ut qui non exercitationem voluptatibus ducimus quas quia.', 0, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(131, 32, 4, 'Atque quod dolorem quasi aut dolor aut. Rerum voluptatem dicta amet debitis ut voluptatem quas. Tempore minima ab non esse magni. Laudantium aperiam adipisci dolor et consequuntur odio. Quibusdam numquam molestias sed molestiae aut debitis.', 5, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(132, 41, 6, 'Ducimus cumque quis dolorem harum et ullam quos. Hic sapiente dolorem alias error. A omnis vel omnis occaecati dolorem.', 0, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(133, 5, 8, 'Debitis consequatur laboriosam est id illum maiores. Ut ex nesciunt officiis molestiae at quas. Ab eius amet et dolorum ullam. Ut quod commodi est quisquam dolores sit excepturi nisi.', 2, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(134, 15, 6, 'Et est ratione omnis error mollitia voluptas. Et deleniti voluptate totam.', 5, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(135, 18, 1, 'Non iure nam iusto consequatur et quia. Illum explicabo rerum praesentium dolores distinctio dolor amet. Omnis accusamus incidunt ut iure.', 2, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(136, 3, 8, 'Dolor cum itaque sunt voluptatum aut repudiandae harum asperiores. Et voluptatem excepturi voluptate dolor hic placeat sunt. Minima ut consequatur voluptates eligendi aliquam et. Similique aut aliquid ratione nihil totam deleniti.', 5, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(137, 13, 10, 'Neque esse provident quae qui. Eveniet nam veniam mollitia consequatur at eum recusandae sapiente. Consequatur aut veniam sunt architecto. Repudiandae unde voluptatem totam qui est delectus ut.', 5, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(138, 46, 7, 'Et quidem iusto delectus ratione modi. Impedit tempora consequatur rem vero.', 1, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(139, 26, 4, 'Nostrum illum nulla impedit ad et dolor. Cupiditate consequatur quasi nisi eius sunt deserunt. Et sequi impedit explicabo eius nihil ea.', 4, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(140, 21, 9, 'Molestias aperiam quae dignissimos qui praesentium. Quo ipsa voluptas et. Ut et possimus quod commodi iure.', 1, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(141, 33, 7, 'Libero eos accusantium voluptatem eos dolorem occaecati enim. Doloremque rem omnis voluptatibus numquam asperiores quasi tempore. Modi numquam quibusdam unde.', 4, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(142, 17, 9, 'Tempora aut nisi in magni facilis. Vel illum facilis in tempore. Eaque possimus dolor neque consequatur neque fugit.', 5, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(143, 5, 1, 'Laborum non in minima consectetur cumque. Assumenda quidem quia sit temporibus qui doloremque voluptas officiis. Officiis dolores voluptas praesentium magnam minima repellat nihil. Et quidem officia hic mollitia. Repellat quas et aut sit.', 1, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(144, 13, 3, 'Excepturi dicta ad vitae sapiente molestiae non sapiente. Fugit eum est debitis repellat vel. A laudantium architecto nesciunt rem adipisci. Laboriosam magnam distinctio omnis rerum a est rem. Et nulla tempora qui rerum reiciendis dolorem.', 3, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(145, 5, 5, 'Ad eos et suscipit. Enim eaque quam et tempore sint repudiandae quod. Repellat voluptatum assumenda voluptatem corporis. Libero nostrum modi deserunt aut nihil quia.', 3, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(146, 27, 4, 'Autem praesentium unde voluptatum consectetur et. Velit voluptatem assumenda ratione aut. Expedita voluptates ut tempora tenetur debitis et repellendus. Non vel natus ducimus aut.', 2, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(147, 15, 2, 'Reiciendis culpa quis omnis assumenda consequatur voluptatum non. Sed suscipit impedit quia a similique. Ipsa accusantium sed consequuntur ex maiores rerum.', 4, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(148, 25, 5, 'Soluta ea provident cumque non aut quos et. Quas ut maxime doloribus voluptas asperiores doloribus. Reprehenderit quas ipsam unde illo consequatur exercitationem ea. Magni atque est nisi ut sed assumenda.', 1, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(149, 39, 9, 'Occaecati doloremque qui cumque aliquam quas id. Minima voluptas aperiam omnis voluptate. Perspiciatis quis illo facilis dolore aut in sed.', 3, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(150, 18, 7, 'Et rem quia corporis quas est magnam qui eum. Sed minima eum beatae amet est quam iure. Quibusdam deleniti quia laboriosam saepe aut velit consequuntur voluptas. Nam eaque dignissimos delectus qui impedit neque quasi.', 4, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(151, 24, 5, 'Consequatur optio laborum qui excepturi omnis. Rerum id ipsum blanditiis velit numquam. Dolor sit debitis odit ea. Et dicta in corporis quis quibusdam non.', 0, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(152, 2, 4, 'Debitis et rerum voluptatem fugiat nostrum minus eius tenetur. Necessitatibus molestiae velit dolore consequuntur accusantium. Sequi tenetur corrupti quidem reiciendis.', 4, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(153, 12, 2, 'Provident atque quia sint. Corporis eaque in molestiae voluptas consequatur. Optio quasi porro quam. Voluptas impedit sit ducimus blanditiis.', 1, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(154, 19, 7, 'Beatae est rerum corporis sapiente ducimus sunt voluptates. Corrupti excepturi assumenda ut non. Qui natus facere enim. Facere cum eos quia nihil rem iusto et ut. Tenetur provident alias id et.', 1, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(155, 32, 3, 'Debitis officia reiciendis nulla eius deleniti quae. Provident quia qui ad ipsum et ea magni omnis. Explicabo eligendi asperiores non eos voluptate sint. Est dicta aperiam ut adipisci velit.', 0, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(156, 50, 6, 'Possimus voluptatibus porro laudantium numquam aliquid aut iste molestias. Nemo perspiciatis corrupti eos corrupti qui. Et et quis illo occaecati aut.', 3, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(157, 12, 4, 'Illum facilis ut perspiciatis facilis eos qui perspiciatis. Quia et qui velit ab et veritatis assumenda in. Eveniet fugiat et animi sit dolore nemo fugiat.', 3, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(158, 48, 2, 'Voluptates dolor voluptatem accusamus fugit sunt tenetur quia vel. Doloribus maiores adipisci et optio sed itaque. Rerum cum ab odio ea est quis et.', 2, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(159, 43, 6, 'Maiores cumque officiis magnam repudiandae voluptatem iusto ea. Quasi ut sit iste incidunt nostrum ex. Facere et itaque omnis unde. Repellat expedita aut aut ea.', 3, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(160, 6, 3, 'Itaque qui sit in. Quae nihil et cumque odit dolores rerum.', 3, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(161, 1, 8, 'Est nulla iste numquam ut. Consectetur minus ut aliquam repellat ut illo fuga. Eveniet neque dolorem sunt doloribus. Officiis qui quo repudiandae perferendis est.', 5, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(162, 15, 2, 'Enim quibusdam ea quis rerum. Laudantium porro culpa molestias nisi ut est omnis. Ipsam dignissimos ut commodi veniam. Iusto nihil alias cumque autem ab sed eius sapiente.', 0, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(163, 10, 10, 'Vel nihil eum minus vel nihil culpa in. Et mollitia possimus iste neque quis quia.', 1, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(164, 16, 4, 'Aspernatur sit facilis dolorem quis. Id consequatur a optio iure sed consequatur accusantium. Odit sit hic ut animi. Possimus sapiente aspernatur nam voluptate.', 0, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(165, 37, 2, 'Et autem voluptates quia non. Cum neque nihil excepturi.', 3, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(166, 37, 9, 'Voluptas est quo non inventore reiciendis aut. Id in exercitationem voluptatibus. Suscipit et quae enim. Occaecati eos et itaque natus.', 0, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(167, 24, 3, 'Est omnis assumenda accusamus. Officia qui sed tempora iure maxime. Molestiae aperiam rerum sed est commodi voluptatem consequatur. Id ut maiores quidem. Accusamus voluptatibus quam dolores non aut qui sint nihil.', 4, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(168, 10, 3, 'Reiciendis omnis omnis sapiente omnis ut. Repudiandae reiciendis necessitatibus dolor quasi aperiam. Ut est eum quos voluptatem eum autem sunt. Non ducimus nostrum ut itaque aut. Et mollitia non ipsum sed molestias consequatur sunt pariatur.', 5, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(169, 7, 9, 'Ut libero culpa earum quaerat consequatur et. Voluptatibus inventore dolorum ab consequatur soluta saepe qui reprehenderit. Libero ut adipisci quos quia eligendi quia. Rerum veniam maxime distinctio in nihil.', 2, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(170, 20, 2, 'Nemo eaque dicta debitis hic. Accusamus incidunt enim et dolores voluptates id. Repellat labore voluptatum dolor sunt quibusdam minima. Cumque voluptatem qui blanditiis iusto ab.', 1, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(171, 46, 6, 'Alias temporibus sit fugit vero earum quis iusto eos. Laborum ut placeat voluptatibus dolores.', 5, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(172, 1, 1, 'Voluptatem ipsum animi aliquid fugit exercitationem. Similique voluptatem et blanditiis ut nihil facere est. Voluptas incidunt excepturi asperiores consequatur. Saepe dolorem reprehenderit sit officiis eligendi amet rerum.', 4, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(173, 43, 6, 'Ipsum deleniti deserunt ut iusto doloribus nobis. Voluptatum aut consequuntur facere et modi et. Et commodi beatae voluptate enim odio.', 3, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(174, 18, 5, 'Itaque doloribus blanditiis praesentium minus et vero modi itaque. Necessitatibus blanditiis tempore est mollitia hic. Cumque aut aut perferendis qui illum quaerat.', 2, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(175, 49, 6, 'Distinctio reiciendis assumenda corporis non. Commodi cumque qui corrupti distinctio enim nostrum distinctio.', 2, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(176, 31, 4, 'Non maiores quo quasi vel quia. Animi sequi nam rerum cumque sunt et quod dolorem. Est nihil excepturi adipisci in enim. Vel et pariatur pariatur accusantium.', 5, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(177, 15, 6, 'Enim pariatur accusantium maiores sunt deserunt est. Est est commodi qui dolores. Odio distinctio sint dolorem consequatur ut sequi. Necessitatibus omnis omnis quidem quas alias voluptates distinctio aperiam.', 1, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(178, 38, 5, 'Et libero qui quos ipsum facilis deserunt natus distinctio. Repellat consequatur repudiandae aut blanditiis inventore. Et qui inventore placeat omnis sed. Illum dolores explicabo velit est eligendi beatae.', 4, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(179, 42, 4, 'Eveniet rerum nam cum quia porro. Non asperiores vel accusamus at. Sint qui autem inventore nobis eaque maxime pariatur. Placeat quo magni libero ea.', 1, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(180, 2, 10, 'Possimus vel accusamus modi corrupti. Sit sunt et velit porro. Doloremque vel occaecati dolorem sequi aut.', 4, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(181, 19, 6, 'Voluptas minima cumque ipsum aut. Et at assumenda officiis alias culpa. Dolores error officia voluptatem corporis sit quia explicabo culpa.', 1, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(182, 49, 4, 'Ut deserunt aut voluptas similique molestias ipsum. Quo reprehenderit ullam pariatur repellat. Debitis aut odit ratione delectus qui accusamus assumenda. Sint temporibus est odit delectus quidem.', 2, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(183, 45, 3, 'Ut vel sint enim incidunt alias. Tenetur fugit omnis quia eum hic sunt. Quia dolor et sunt assumenda. Doloribus tenetur ad quia nobis est laudantium ducimus.', 0, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(184, 47, 1, 'Rerum non ipsa officiis et. Rerum autem numquam dolore nesciunt et nihil ut. Quia sed sapiente laudantium repudiandae nesciunt perspiciatis.', 0, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(185, 5, 3, 'Ea enim earum quas sint. Asperiores unde error voluptatum ea voluptatem. Dolorum sunt dolores sed. Voluptates est ipsum voluptates cum blanditiis necessitatibus eum.', 2, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(186, 22, 6, 'Dolorum quia quidem modi. Tenetur architecto doloribus numquam. Accusamus ut repellendus aliquam expedita. A nemo suscipit beatae rem.', 5, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(187, 47, 2, 'Soluta dicta sequi ratione ducimus vel. Fugit quos consequatur ea autem nam. Dolore ipsam ipsam vero quam alias. Dolor aut ut veritatis nesciunt quia aspernatur eum.', 1, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(188, 33, 10, 'Voluptatum consequatur eius aut et nihil dolor. Laborum quidem cupiditate maxime. Dolorem sit cum qui error omnis qui.', 5, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(189, 30, 2, 'Sit quia dignissimos et exercitationem qui necessitatibus. Temporibus earum nulla inventore eveniet molestias. Laboriosam enim delectus distinctio quo et doloremque. Qui quasi unde doloribus eum.', 2, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(190, 23, 10, 'Dolor praesentium consequatur voluptatibus voluptatibus saepe ab. Rerum impedit rerum est aliquid tempora accusamus molestias. Saepe facere minima voluptate explicabo odio rerum pariatur. Iusto recusandae molestiae assumenda a aut maiores aspernatur.', 5, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(191, 33, 4, 'Recusandae sunt quam voluptatem. Modi fuga ex ea et rerum aliquid. Ab tempora animi veritatis dolor est vitae ab. Reprehenderit non enim non ut dolores voluptas harum.', 5, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(192, 38, 10, 'Est et in at eligendi. Voluptatem nostrum tempore voluptatem id. Ut nemo nihil cupiditate et perspiciatis.', 4, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(193, 28, 3, 'Id omnis et qui porro fugit. Voluptate voluptatum voluptate consequatur ut amet quibusdam qui. Ipsa eos autem voluptas voluptas quis officiis enim non. Ut alias nihil et tempora et nesciunt voluptas.', 1, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(194, 2, 5, 'Vel doloribus qui voluptatibus ut. Sint corrupti rerum dolores blanditiis quae quia iusto. Recusandae vitae dolores natus quo sapiente sequi.', 2, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(195, 33, 10, 'Molestias sapiente modi non et aperiam quisquam. Vel deserunt sunt incidunt rerum nesciunt. Itaque placeat possimus quo dolore nulla saepe consectetur.', 1, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(196, 44, 1, 'Aut blanditiis culpa quia consequatur ut ut. Soluta perspiciatis omnis ut rem. Sit enim nostrum sint.', 5, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(197, 44, 10, 'Officia quisquam autem optio. Ipsum aut dolorem praesentium. Quaerat aliquam quo occaecati nulla dolores sint voluptatem. Est a ullam eos accusamus sunt.', 4, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(198, 8, 6, 'Dolores dolores quia fuga eum vel voluptatem. Eligendi sunt optio veritatis reprehenderit aliquam fuga. Qui laboriosam omnis minus recusandae vel autem. Libero deleniti harum neque.', 5, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(199, 49, 6, 'Iste praesentium accusantium quia eos. Neque doloremque possimus doloremque voluptatem vitae enim. Odio ut eum accusantium.', 1, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(200, 35, 9, 'Quibusdam deserunt autem dicta et saepe. Hic voluptatem voluptatem ut ut occaecati. Accusantium occaecati est officia illo reprehenderit. Ipsum iste dolor voluptatum voluptas maiores tempora. Minima voluptate ex culpa nisi voluptatem.', 2, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(201, 28, 6, 'Fugit et tenetur tempora est voluptatem. Velit quos eaque rem voluptatem magni sed assumenda. Nostrum quos est nihil repellat ut dolore dolorem.', 5, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(202, 11, 9, 'Et suscipit nostrum deserunt voluptate tempora ut. Repudiandae rerum doloribus quia ullam quia saepe.', 1, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(203, 36, 9, 'Molestiae quo vel quisquam eligendi. Porro architecto eos dolorum consequatur officia et voluptatem quisquam. Voluptatem quidem est consequuntur illo omnis.', 1, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(204, 3, 4, 'Omnis qui rem eum sint optio quia. Commodi officiis voluptatem corrupti eos voluptatum. Qui ut porro occaecati autem error. Consequatur tempora est consequuntur recusandae dicta et.', 0, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(205, 37, 1, 'Voluptas suscipit esse culpa inventore laborum deserunt. Libero consectetur quas pariatur repudiandae maxime voluptatum consequatur. Et tempore doloribus quo nobis vero. Omnis cum ut sint quia hic laborum culpa.', 3, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(206, 37, 5, 'Doloribus et aperiam minima hic aliquid. Illo laudantium aperiam est minus eum.', 5, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(207, 30, 9, 'Reiciendis esse optio minus. Nihil molestias facere labore sunt soluta laborum. Cupiditate omnis eligendi et omnis esse. Quis delectus in nesciunt laudantium magni.', 1, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(208, 34, 1, 'Ut sequi dolor numquam dignissimos nulla. Adipisci corporis quas laborum porro et molestiae. Dolor neque necessitatibus minima optio.', 3, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(209, 46, 5, 'Nobis repellat eveniet voluptatem beatae expedita. Ipsum est beatae dolore velit velit voluptas et. Tenetur velit et eos omnis consectetur laborum.', 4, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(210, 42, 1, 'Odio cumque nulla iste sit asperiores. Accusantium id maiores molestias impedit fugit qui.', 2, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(211, 32, 8, 'Voluptas ut fugit natus quod alias. Recusandae repellat reiciendis facilis accusamus minima odit eligendi. Blanditiis consequuntur aut in qui itaque incidunt.', 2, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(212, 46, 1, 'Dolor non reprehenderit dolorem ab voluptas sed provident. Doloremque corporis reprehenderit incidunt aut occaecati. Exercitationem sed et voluptatem rerum dolorem sint praesentium.', 0, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(213, 4, 2, 'Et voluptatibus voluptates qui est est vero perspiciatis. Unde totam nulla dignissimos.', 0, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(214, 32, 1, 'Reprehenderit dolorem consectetur at facilis possimus ab expedita. Natus dolores rem est non dicta. Iste quis sed distinctio. Neque ullam dolor vel ipsum ut et veritatis esse.', 5, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(215, 20, 8, 'Aliquid veniam et dolore qui quaerat tenetur mollitia. Cupiditate veniam ducimus consequatur quod labore repellendus. Doloribus earum ut aut atque laborum recusandae doloribus. Aut enim ullam optio quis et esse deleniti sed.', 0, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(216, 49, 9, 'Eum quaerat quam voluptatem quis. Unde minus illo omnis rerum consequatur nobis qui omnis. Quibusdam voluptas sunt a nisi.', 2, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(217, 18, 7, 'Eos et voluptatum maiores illo aut voluptatem aut. Id praesentium autem libero dicta. Rerum nam numquam placeat numquam quas placeat quas. Veritatis deleniti excepturi ratione vel.', 2, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(218, 32, 2, 'Nihil aut quia a. Odio neque dicta iure sit tenetur sint. Nisi cumque officia aspernatur pariatur reprehenderit unde vel.', 1, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(219, 49, 8, 'In nam ipsa ducimus iure. Repellendus quia accusantium delectus beatae. Qui voluptate sapiente rerum asperiores doloremque est numquam.', 4, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(220, 31, 10, 'Incidunt voluptatem temporibus enim qui. Asperiores ab esse tempore. Temporibus voluptatem et dolores assumenda maiores minus. Voluptatibus perspiciatis sunt ratione quo voluptatem nam. Ipsum error eos velit error magnam nobis sed.', 4, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(221, 11, 2, 'Voluptatem impedit omnis saepe veritatis qui cumque animi. Ratione aut vel qui alias rerum. Eum quis rem voluptates quod aut. Est excepturi quia ipsum totam non esse vero exercitationem.', 1, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(222, 11, 7, 'Omnis et et qui. Aliquam sequi est ut. Necessitatibus quaerat minus ut.', 4, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(223, 38, 9, 'Quo voluptas debitis a itaque odio. Facere numquam voluptates doloribus nihil qui qui rerum. Numquam et quisquam at culpa illum eius. Doloribus consequatur porro voluptas non non distinctio tempora ea.', 2, '2020-10-12 21:44:17', '2020-10-12 21:44:17');
INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `review`, `stars`, `created_at`, `updated_at`) VALUES
(224, 18, 7, 'Voluptatem eveniet qui facilis aut nemo ea quasi. Laudantium ipsam qui neque architecto nemo. Tenetur fugiat voluptatem ipsa est reiciendis voluptates.', 3, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(225, 8, 5, 'Dolor adipisci temporibus id modi et. Odio in consequatur facere commodi aut earum voluptatem aut.', 2, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(226, 29, 5, 'Et fuga voluptas voluptates repudiandae ea et consequatur. Perferendis cum cumque officia est.', 3, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(227, 47, 9, 'Excepturi reprehenderit non ullam cupiditate quibusdam. Et corporis ut voluptas autem sed accusamus veniam occaecati. Non quod eos quos eius nihil.', 4, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(228, 15, 7, 'Ad quo voluptatem id repellendus ratione dignissimos. Eius numquam et quas nesciunt commodi. Et ratione et sit est qui corrupti sit.', 5, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(229, 46, 8, 'Ut quas in officiis repellat enim ratione id. Voluptatem minima a voluptates qui. Ea dicta quod odit.', 2, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(230, 3, 8, 'Ea eaque soluta quibusdam qui laudantium ab. Error laboriosam ut eveniet cum amet. Omnis praesentium fugiat corporis. Qui sunt provident eius magnam occaecati esse.', 5, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(231, 18, 7, 'Voluptatem rerum ipsam ipsum. Soluta tempore quia omnis nobis mollitia. Asperiores doloribus voluptatem error vel. Quibusdam inventore voluptas ut possimus.', 4, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(232, 6, 5, 'Nisi voluptatem odit et. Quos nihil consequuntur reprehenderit. Sunt libero omnis harum praesentium unde quae est neque. Laudantium quam ut est qui voluptatem error.', 3, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(233, 4, 7, 'Nisi qui suscipit temporibus. Ea omnis fuga dolorem est et omnis. Dolores qui reiciendis voluptatem ducimus ipsum soluta optio. Dolores mollitia non quisquam eligendi et necessitatibus nobis laboriosam.', 3, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(234, 37, 2, 'Incidunt dolorem laboriosam nesciunt doloribus commodi quia. Nisi praesentium repellat non vel nostrum quas quisquam. Optio amet autem repellat.', 2, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(235, 14, 8, 'Ea eum quidem sit totam perferendis velit nesciunt. Ab id excepturi laboriosam et. Deleniti enim alias suscipit ipsa sit cum.', 2, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(236, 2, 5, 'Harum rerum cupiditate facere fugit omnis accusantium. Minima delectus temporibus dolorem voluptatibus molestiae rem repellat fuga. Ipsa veniam inventore fugiat aut. Possimus eos facilis sed minima a beatae.', 3, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(237, 42, 9, 'Delectus eligendi eum sed. Velit sint iure maiores dolores. Dolorum rerum dolorum ea rerum.', 0, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(238, 25, 7, 'Possimus aliquid omnis unde suscipit culpa quisquam. Distinctio eum perspiciatis magni omnis voluptas. Et earum et occaecati quia.', 1, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(239, 18, 7, 'Quo optio architecto nobis maxime commodi. Et dolor fugiat nostrum nihil ea. Sapiente ut tempore facilis et.', 1, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(240, 20, 5, 'Animi beatae placeat aut iusto. Sed iusto consequatur sed dolorem sit in accusamus doloribus. Et doloribus vero cumque perferendis.', 2, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(241, 22, 10, 'Quia ad quia vitae eaque porro sed. Aut ut at et illo tempore quos. Culpa facere et cum laboriosam ut doloribus deserunt. Magni vero amet atque inventore illum atque rerum. Itaque voluptatem distinctio necessitatibus voluptatem ut libero.', 2, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(242, 37, 5, 'Eaque porro omnis dolores voluptates eos itaque dignissimos. Laborum reiciendis assumenda reprehenderit et repudiandae architecto eum. Consectetur cum ut maiores sapiente sed voluptates.', 5, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(243, 34, 4, 'Expedita amet ipsum optio. Dolorum nisi praesentium voluptate et. Consequatur ullam nam impedit qui fugit. Magni voluptatem ipsa atque inventore facilis.', 5, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(244, 17, 10, 'Eum voluptas unde voluptatum impedit fugit ut. Non rerum delectus quis praesentium libero aut. Ea omnis voluptas quo nemo inventore sit.', 0, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(245, 19, 2, 'Unde tenetur a voluptas sapiente eligendi. Eaque enim sit est nesciunt. Facere sunt aut nemo non sed ut.', 0, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(246, 39, 8, 'Sunt et impedit sit. Odit autem aliquid aut sequi architecto distinctio. Et nihil dolores distinctio aut quis quia similique.', 3, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(247, 31, 6, 'Voluptas cupiditate odit qui sed atque quidem. Fugit consequatur earum assumenda in consequatur animi. Assumenda nesciunt aspernatur impedit maxime dolorum doloribus nobis. Natus ut eos consectetur quidem rem. Ut nulla earum labore est.', 1, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(248, 12, 2, 'Dolorem voluptates voluptatibus et fugiat. Omnis quasi ullam et earum sed necessitatibus. Aspernatur dolore veniam tempora fugiat. Id rerum ut adipisci.', 0, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(249, 23, 7, 'Quam aut autem optio. Quae quia odit laboriosam provident eveniet ea temporibus at. Aut quia consequuntur qui unde ducimus illo sapiente.', 1, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(250, 39, 7, 'Rerum tempora quibusdam maiores eius doloremque dolor. Aspernatur autem harum itaque voluptatem velit. Hic natus voluptatem et voluptate autem earum. Nesciunt ullam suscipit quam rem voluptatum quidem rerum voluptatem.', 5, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(251, 3, 10, 'Consequatur culpa corporis consequatur et. Sed facilis velit occaecati error. Quis reiciendis et omnis.', 4, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(252, 36, 7, 'Doloremque mollitia aut tempora unde. Sequi eius eos eos autem optio. Suscipit aut dolorem perferendis nesciunt.', 0, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(253, 14, 10, 'Aut modi et ut ad ut quaerat aperiam. Numquam delectus deleniti perferendis omnis. Doloribus et inventore pariatur et dolore error.', 2, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(254, 17, 5, 'Cupiditate quia soluta provident nesciunt voluptas. Aut vitae et sed totam reprehenderit ipsam modi et. Ea ut facere nisi dolore cum. Odio veritatis velit veniam incidunt nam. Illum et adipisci qui ad ut dolor.', 2, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(255, 50, 6, 'Nulla laboriosam officia consequatur harum ut ut libero harum. Voluptas mollitia quis est culpa cupiditate earum eos. Rerum maxime maxime ut quis odio sequi. Enim aut ipsa quod consectetur molestiae doloribus.', 0, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(256, 12, 2, 'Earum aliquam neque adipisci et a at. Consequatur occaecati quis commodi amet dolorum. Doloribus voluptatibus voluptatibus aut ipsam. Sit non tempora atque quaerat voluptate voluptatem autem ipsum.', 0, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(257, 12, 8, 'Assumenda dolores modi omnis amet repellendus repudiandae suscipit. Eius et quia ut eligendi qui aspernatur. Ut dolor numquam dicta aut.', 4, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(258, 36, 3, 'Saepe ut architecto perspiciatis aut voluptatem. Rerum excepturi rerum fugiat iure unde saepe. Animi voluptas deleniti qui enim. Assumenda similique dicta nisi. Dolor ut inventore porro et.', 0, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(259, 30, 3, 'Qui quia repellendus omnis voluptates. Rem possimus eveniet voluptatum et et inventore distinctio. Alias non nihil amet optio odit. Ab laboriosam animi ea suscipit.', 4, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(260, 48, 9, 'Ut eaque est doloremque suscipit consequatur asperiores quidem. Quos itaque dolor eius ducimus ducimus et. Autem laudantium voluptas excepturi ut et eligendi.', 5, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(261, 14, 9, 'Ex iusto voluptas dolorum molestiae sunt. Est tempora ullam et blanditiis repellendus accusantium dicta et. Rem exercitationem ut consequatur et. Sint illo ipsam vitae saepe non et nemo. Itaque nesciunt molestiae ratione.', 0, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(262, 48, 7, 'Voluptate voluptatem et est voluptatem aut sapiente quia. Tenetur illum commodi rerum laudantium temporibus quia. Non ab nisi nulla aut. Eius dolor nihil molestiae.', 1, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(263, 16, 3, 'Sint voluptas quia inventore deserunt repudiandae dolores dolores aut. Et doloremque voluptas quod nesciunt minima. Nihil velit tempore doloremque. Voluptates laboriosam et molestiae harum id.', 1, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(264, 39, 1, 'Fuga et distinctio et repellat. Dolor doloremque et corporis eaque. Minus velit molestiae aliquid aspernatur atque cupiditate omnis. Consequuntur provident praesentium aliquam hic quaerat porro sequi. Quis necessitatibus ratione minus quia ut qui cumque consequatur.', 1, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(265, 46, 10, 'Dignissimos quia distinctio maiores voluptate. Pariatur nesciunt harum omnis a ea. A voluptatem consequatur voluptatem voluptate maxime aut saepe.', 5, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(266, 24, 2, 'Atque fuga magnam quo perspiciatis molestiae. Aut sunt aut asperiores quis et dolores quas. Quae cumque nesciunt commodi ut quo veniam eum. Laudantium voluptatem illum nihil dolores soluta. At magni voluptates consequatur quia.', 4, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(267, 28, 6, 'Voluptate soluta qui consequatur soluta quo quod quas. Minus rem et fugiat expedita assumenda. Sed nisi facere fuga exercitationem. Est harum fugit tenetur sed doloribus.', 3, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(268, 29, 6, 'Labore eum et fugiat. Aut cupiditate et architecto animi. Voluptas non ab in illum. Debitis quis aut laudantium impedit et et.', 4, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(269, 32, 4, 'Veniam quia voluptatum pariatur tempora velit provident. Eaque doloremque natus sit perspiciatis. Accusamus et quas distinctio aut aut facilis.', 1, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(270, 22, 5, 'Ea dicta harum nostrum alias. Sint voluptatem debitis optio laborum autem. Ducimus dolorem eos ut quia asperiores.', 0, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(271, 23, 8, 'Est repellat aut possimus itaque. Incidunt incidunt culpa soluta non nihil autem sed numquam. Quo veritatis odit voluptas voluptas est tenetur ut.', 0, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(272, 50, 10, 'Vel sapiente repellat molestiae ex quam natus quos. Nulla facilis qui enim ipsum quis. Ut id dolorem hic aut est.', 1, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(273, 33, 9, 'Odio delectus et nulla. Est ipsa aut voluptas numquam. Est eligendi temporibus et temporibus enim.', 4, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(274, 11, 10, 'Eos aspernatur quo voluptas iure. Animi tenetur dignissimos error beatae. Dolor magnam explicabo rerum eos est ut. Minus doloremque magnam sapiente dolorem suscipit.', 3, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(275, 7, 10, 'Ut perspiciatis autem qui. Atque omnis quam id cupiditate nisi aperiam maiores.', 0, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(276, 44, 1, 'Velit qui quam possimus voluptas rerum sunt temporibus et. Et quia eos sed cumque illum rerum. Voluptatibus officia ab ut rerum. Expedita suscipit sit est dolorum debitis.', 0, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(277, 47, 4, 'Labore aut cupiditate magni veniam minus et. Sed non consequuntur natus suscipit.', 5, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(278, 40, 10, 'At soluta ullam ullam. Omnis est vero eligendi. Eaque dignissimos natus modi ipsam.', 1, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(279, 7, 1, 'Tempore autem magni ratione dolores libero non. Qui atque voluptas aut aut quaerat qui. Rem est autem aut qui accusamus dolor. Eligendi quia vel porro ex quo et placeat. Dolorem sit eaque reprehenderit ratione fugiat et consequuntur.', 2, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(280, 39, 3, 'Tenetur ut excepturi hic error quibusdam quos. Delectus quos repellendus atque doloribus. Tempore rem neque doloribus voluptates. Voluptatem ex quidem iusto vel esse.', 3, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(281, 41, 6, 'Officia culpa doloremque eos ut excepturi libero minima. Consectetur alias sit quasi cumque vero culpa sint.', 2, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(282, 40, 9, 'Iure laboriosam magni sed similique corporis minus quia corporis. Omnis ea dolor et et. Sit quia rerum doloribus quia sit sint est.', 0, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(283, 27, 7, 'Est rem voluptatum quae earum distinctio sequi sint vitae. Sint autem veritatis alias repudiandae numquam. Eligendi in eos velit eveniet voluptatibus modi.', 3, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(284, 42, 8, 'Consequatur porro nesciunt molestias est. Voluptas molestiae sint deleniti.', 0, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(285, 32, 7, 'In voluptatem sapiente sed tenetur beatae. Blanditiis nihil repellendus et assumenda voluptatem et deserunt veniam. Sit odio suscipit odit sint reiciendis unde. Veniam veritatis iure et quam. Illum quibusdam corrupti minima.', 1, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(286, 39, 8, 'Eaque aut qui eligendi totam aut laboriosam. Amet veritatis voluptatem placeat excepturi inventore aperiam voluptas. Eligendi adipisci ipsum ut non omnis sint consequuntur. Expedita quidem nesciunt ea laudantium sed sit quis culpa.', 5, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(287, 19, 6, 'Commodi tenetur dolor similique ut quo. Sit laborum ut rerum.', 4, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(288, 45, 9, 'Hic voluptas aut qui pariatur. Odit numquam vel provident rem consequatur.', 2, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(289, 7, 9, 'Dolor non unde voluptatum dicta dolorum. At est dolor delectus doloribus non iusto. Hic in laudantium aut consequatur.', 4, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(290, 27, 10, 'Nisi possimus aut quasi quo occaecati suscipit id est. Eum suscipit dignissimos consequuntur voluptatem velit.', 0, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(291, 48, 8, 'Impedit ipsam aliquid ipsum nostrum voluptatem aut dicta. Blanditiis architecto ea pariatur voluptatem qui. Nobis et ut qui.', 1, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(292, 9, 8, 'Autem qui quod ullam sint neque. Repellat dolore expedita maiores et. Quasi nisi recusandae ab aperiam assumenda fugit ad. Ipsam qui ullam ad autem nam voluptates.', 4, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(293, 2, 10, 'Et aut rerum non hic sapiente. Doloribus qui officia voluptatibus rerum rem atque magni. Quo voluptas debitis occaecati architecto nulla.', 3, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(294, 21, 2, 'Esse natus sed omnis voluptatem. Ut consequuntur et et laudantium. Facere facere eaque alias eaque quae cum. Est ut labore dicta voluptates.', 5, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(295, 7, 1, 'Fugiat maiores distinctio quam velit odio ipsa. Earum numquam ullam et aut harum ut vel. In omnis magni saepe. Nihil beatae vel dignissimos velit temporibus dolore.', 3, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(296, 40, 6, 'Consequatur quo illo eum nemo sunt voluptatem. Dignissimos maiores qui sequi dolorem reiciendis ex. Facere pariatur non aut voluptatem.', 3, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(297, 5, 9, 'Aut qui blanditiis cumque aliquid labore sed. Voluptatibus iste repellendus ut qui rem vel iure. Cum laboriosam exercitationem amet quis voluptatem.', 0, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(298, 44, 2, 'Eligendi eum aut cum eos dolores cum. Facilis itaque facilis odio dolorem saepe officia. Tempore assumenda sit quidem sit perspiciatis consequatur. Animi eos quia voluptatem doloremque velit.', 1, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(299, 41, 5, 'Ut necessitatibus et autem sunt. Porro aut aut aliquam id voluptatem sed corrupti sit. Commodi in omnis accusantium voluptatem eaque ut distinctio accusantium. At modi explicabo ut nam.', 5, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(300, 22, 1, 'Voluptatum quam possimus dolores ad ea aut. Adipisci sint mollitia rerum iure labore error consequatur aspernatur. Sit eligendi deleniti corrupti architecto. Aliquam mollitia ex aut ut atque sunt fuga.', 2, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(301, 40, 6, 'Sequi reiciendis fugit quas voluptatum ipsa. Est tempora consectetur reprehenderit et dolorem repellendus voluptatem. Sit dolor dolor perspiciatis optio nihil. Officia suscipit facilis sit id quaerat dolor neque dolor.', 0, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(302, 35, 10, 'Tempore perferendis beatae doloribus dolorem veniam necessitatibus dolorem. Aut soluta iusto et aliquam.', 2, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(303, 22, 5, 'Nemo tempora recusandae corrupti nobis. Nostrum maxime laborum odit delectus adipisci rerum quo sunt. Inventore cupiditate enim quasi nihil animi. Perspiciatis consequatur consequatur ex quis maxime qui.', 0, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(304, 24, 10, 'Quod quam veritatis iste quod dolorem. Beatae qui et quia et eum non. Debitis et et blanditiis sunt a. Est incidunt rerum numquam ea accusamus.', 1, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(305, 16, 1, 'Debitis maxime magnam aut dolorem. Nobis expedita quae hic. Sint ut quisquam et sequi.', 5, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(306, 46, 8, 'Molestiae dicta facere quo numquam. Minus et sit quas magnam quaerat. Sequi recusandae delectus provident asperiores. Voluptas ut rerum atque molestiae id.', 1, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(307, 34, 2, 'Tempora distinctio facere vel at rerum. Sit tempora qui magnam perferendis consequatur dolorem quod blanditiis. Ullam in molestiae commodi ipsa.', 1, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(308, 18, 5, 'Et voluptatem repudiandae dignissimos voluptate. Eos id inventore et quia rem qui sint illo. Et vel id harum corporis fuga asperiores minus. Laboriosam cumque voluptas nobis tempora quae eligendi voluptatem.', 3, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(309, 12, 4, 'Dicta atque est corporis dolor maiores. Minus rerum labore dolorem sit qui est. Delectus non qui tenetur aspernatur amet possimus et.', 3, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(310, 9, 9, 'Corporis odit non officia magni. Voluptatum quae aut pariatur cum qui aut. Voluptas eum est eum tenetur repellat voluptatibus.', 0, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(311, 17, 6, 'Libero eius vel sit adipisci praesentium et. Aliquam veniam sit qui tempore ut perspiciatis. Assumenda nulla et tenetur et sit corrupti nobis molestiae.', 0, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(312, 38, 5, 'Quos rerum vel nisi et et eligendi. Eveniet ea dicta et ab. Vel veritatis sint provident enim sequi expedita debitis. Temporibus eaque voluptas placeat unde ducimus optio qui autem.', 5, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(313, 7, 5, 'Iure accusantium molestiae tempora animi reprehenderit ad. Consequuntur doloribus omnis sunt commodi cumque id. Voluptas quam nihil nam numquam iusto. Officia autem eveniet quo.', 1, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(314, 8, 7, 'Dolores vel labore sint tempora. Dolores hic tempore dolor quaerat tempore reiciendis voluptas debitis. Consequuntur aut non eum et sint est. Necessitatibus earum qui non tempore.', 4, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(315, 41, 5, 'Voluptas quae laudantium sint omnis qui impedit cumque facere. Dolor inventore consequatur saepe accusantium. Sit quia omnis modi autem pariatur nisi nihil.', 3, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(316, 44, 8, 'Nihil et nulla quo. Libero necessitatibus accusamus ut possimus voluptas. Qui officiis voluptas et consectetur fuga voluptas. Ratione omnis deleniti quasi voluptas nihil voluptas.', 3, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(317, 19, 1, 'Repellendus esse suscipit eligendi occaecati aut vel id. Nihil itaque excepturi excepturi enim accusamus blanditiis magni laborum. Sed non qui qui. Omnis illo quia numquam quisquam aperiam dolorem.', 0, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(318, 38, 4, 'Incidunt ut atque autem tenetur voluptas sequi atque. Numquam in eaque ut eveniet eligendi sit dolorum occaecati. Id id omnis dolorum dolores error in. Qui neque sit voluptates perferendis saepe.', 0, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(319, 22, 9, 'Et quia autem labore error ut et in. Vero nihil suscipit sed aut numquam voluptas. Voluptas magni qui repudiandae sint velit. Numquam dignissimos laborum et illum.', 1, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(320, 18, 2, 'Eaque consequatur doloribus ad. Et tempora asperiores tempora ab aspernatur quia voluptatum. Eum velit expedita eum sunt ipsam.', 4, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(321, 37, 8, 'Dolor quibusdam excepturi architecto soluta dolorem voluptates cumque. Et ipsum rem fuga nihil earum minima voluptas. Rerum dicta est quae a ut pariatur. Dolores nihil expedita nostrum dolor perspiciatis.', 5, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(322, 3, 10, 'Non illum dolores similique error aut explicabo quis nostrum. Rerum amet quibusdam delectus harum ut voluptas tempora aliquid. Sed quis veritatis voluptas rerum quae omnis. Sit iste consequuntur vel.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(323, 25, 5, 'Unde ut et ex sed. Numquam explicabo non error dolorem veritatis aperiam. Eum ea sed esse distinctio. Aliquam occaecati voluptatem consequatur non eos temporibus rerum.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(324, 1, 6, 'Eius consequuntur vitae architecto ea fuga sed libero. Modi perferendis unde explicabo et qui. Vel adipisci illo sit aut eos. Excepturi quis nam ut.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(325, 27, 8, 'Cupiditate neque necessitatibus id tempora aspernatur autem aut. Non modi sunt ut occaecati animi rerum quia. Quas maxime recusandae ut quo odit blanditiis. Aperiam aut velit labore consequatur doloremque enim.', 0, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(326, 50, 2, 'Cum corporis sed adipisci nihil sint maxime commodi. Eius commodi rerum in accusamus. Dolores quia et dolorum cum eligendi. Perferendis fugiat quos quia.', 4, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(327, 10, 6, 'Nihil repellat deleniti odio neque odio. Eum quibusdam voluptate quo minus quibusdam incidunt.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(328, 10, 9, 'Non quia ut fuga aut. Doloremque excepturi voluptates porro beatae sint sapiente iusto quibusdam. At aliquid aut animi sed dolores. Sed harum expedita quaerat cupiditate.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(329, 25, 4, 'Non assumenda ad odio adipisci omnis velit non. Quas maxime debitis harum ducimus sunt quos vero.', 1, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(330, 30, 2, 'Autem id dolorum temporibus vel. Ea maxime saepe officiis adipisci atque alias. Neque minima ipsum qui nemo voluptatem molestias doloribus.', 0, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(331, 27, 2, 'Error numquam mollitia ut illum commodi accusantium neque. Ut corrupti et veniam. A facere quibusdam soluta sunt.', 4, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(332, 9, 4, 'Harum placeat consequatur vero ea qui et. Est et enim soluta pariatur blanditiis. Aperiam nesciunt ipsum optio deleniti qui nam aliquam. Natus sit dolore aliquam labore in qui. Assumenda aperiam fugit recusandae eos porro magni earum.', 1, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(333, 25, 9, 'Quos temporibus aliquam aut error molestiae architecto in. Et qui vero animi non dicta. Ut assumenda quidem quas consequatur. Illo ab modi adipisci recusandae quia.', 2, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(334, 11, 4, 'Veniam recusandae sed debitis earum ab ut. Laboriosam reiciendis veniam qui. Sit voluptate odio labore dolor voluptate soluta consequatur.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(335, 30, 2, 'Hic nobis voluptatem dignissimos odio. At aut beatae facere aliquam omnis.', 1, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(336, 29, 10, 'Deleniti molestias reiciendis vero dolor rem enim. Sed accusamus animi molestias natus labore est voluptatem. Excepturi alias quibusdam quidem itaque molestiae non. Rerum itaque deserunt id error.', 5, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(337, 30, 4, 'Fugit numquam ullam ut tenetur atque enim quasi. Sint ipsum quia corrupti et expedita. Impedit recusandae nostrum quam et delectus molestiae.', 2, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(338, 34, 7, 'Perferendis aut id voluptatibus molestiae cupiditate. Id incidunt sunt sit nesciunt officia. Amet et ut minima aliquid quo debitis quis.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(339, 36, 8, 'Non voluptatem dolorem nisi labore adipisci sit eum. Sint enim non eos libero explicabo odio. Ratione dolorem quam ducimus doloribus. Nulla quis eveniet et necessitatibus perferendis nostrum tenetur. Quis et magnam ullam corporis.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(340, 47, 1, 'Et earum quia cumque quas vel. Aut animi minus aut sed.', 2, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(341, 16, 2, 'Debitis libero molestias consequatur corrupti. Vel necessitatibus in praesentium amet qui.', 4, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(342, 26, 10, 'Expedita accusantium aut excepturi autem expedita. Sed doloribus et ea aliquam. Est eveniet nostrum similique sint. Expedita sint quisquam voluptatem deleniti qui ducimus. Nesciunt sit laborum et fugit unde qui.', 0, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(343, 24, 1, 'Aut laboriosam quisquam accusamus voluptatem animi sequi voluptate. Alias quisquam aut consequatur rerum. Doloremque excepturi accusantium qui voluptas optio nihil corporis.', 3, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(344, 14, 8, 'Consequatur earum iure molestiae. Quis est sunt quo perferendis alias. Quo optio dolores esse a.', 3, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(345, 33, 6, 'Et commodi non quo rem necessitatibus repellendus. Qui vel nulla qui perspiciatis quia non. Et repellat quibusdam eos sed enim. Debitis necessitatibus quia libero sapiente praesentium reiciendis nemo qui.', 0, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(346, 12, 1, 'Nostrum omnis ut rem. Aut similique a vitae modi rerum consequatur id quasi. Explicabo iste et nihil sit.', 2, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(347, 33, 7, 'Id dolor aspernatur est quod deserunt voluptatem dolor a. Vitae quia voluptas nihil sit maxime unde. Eligendi et aut doloribus suscipit et corporis.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(348, 17, 8, 'Qui molestias debitis sequi necessitatibus id non. Consectetur quae ipsam autem. Nostrum quam veritatis et dolores.', 0, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(349, 37, 3, 'Voluptatem numquam minima cupiditate eos qui qui. Nulla est qui neque consequatur ducimus ut expedita. Optio eos voluptatem ut ex repellendus rerum in.', 0, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(350, 2, 9, 'Et occaecati similique pariatur nulla. Sit voluptate qui aut nisi sint harum. Rerum qui aut unde quia.', 3, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(351, 27, 3, 'Ipsum ut nulla architecto. Eos sint et molestias blanditiis. Et numquam sed distinctio minima autem incidunt voluptas. Harum rerum voluptas id impedit et.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(352, 43, 1, 'Vel doloremque et aut. Dolores velit incidunt sapiente nulla. Qui rem beatae consectetur et ipsum et fugit.', 2, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(353, 24, 5, 'Consequuntur hic maiores voluptas nihil. Ut rerum perspiciatis architecto.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(354, 23, 1, 'Ad ea omnis saepe dolore. Illo sed aut similique perspiciatis earum. Cupiditate quod sed qui atque reiciendis sapiente suscipit voluptatibus. Sed et sunt nulla dolorem.', 1, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(355, 9, 5, 'Suscipit quis quidem accusamus consequuntur. Aspernatur alias illum repellendus. Quos assumenda facilis est voluptatibus qui reprehenderit unde.', 0, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(356, 47, 4, 'Est qui ea placeat fugiat temporibus fugit doloremque. Unde qui nihil et dolores et ut. Aut non voluptatibus aspernatur veniam. Ratione dignissimos laboriosam est dolores odit cupiditate accusantium.', 3, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(357, 46, 1, 'Quidem soluta qui sint. Voluptate dicta blanditiis natus eos. Laudantium iure et quis non eos nihil eveniet. Earum ab molestiae dolorem quo doloribus. In aut culpa error enim fuga.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(358, 34, 9, 'In non voluptatem ducimus ut possimus. Iusto voluptatem qui suscipit. Explicabo tempore adipisci consequatur minus eveniet dolorem blanditiis et. Repellendus id sit fuga ea reiciendis molestiae soluta.', 2, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(359, 2, 3, 'Molestiae nam consequatur veritatis voluptates. Ut assumenda in consectetur ea distinctio cumque ipsa. Perferendis quasi qui illo nisi veritatis porro. Possimus consectetur distinctio omnis consectetur.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(360, 40, 9, 'Et minus doloremque ducimus eveniet non labore alias. Placeat aliquid non rerum officiis blanditiis dolor voluptatem. Et est architecto nisi animi nemo. Ad qui doloribus illum.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(361, 30, 7, 'Sequi nostrum deleniti ut magni veritatis. Dolor dolor velit autem possimus. Vel omnis ex neque atque.', 3, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(362, 3, 6, 'Fuga enim dolorem nesciunt temporibus. Fugiat tenetur rem provident maiores veritatis voluptas est. Laborum neque qui pariatur consectetur enim consequatur facilis tenetur. Explicabo temporibus nihil ut.', 1, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(363, 42, 6, 'Laudantium repudiandae blanditiis similique eos. Sunt dolore voluptas dolorum quasi ut dolor. Molestiae laboriosam iste quam id.', 5, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(364, 20, 8, 'Veniam odit quod facilis. Magnam beatae et at voluptatem velit molestias molestiae. Et eaque fugit qui debitis libero qui. Dolores quaerat nisi perferendis aspernatur.', 4, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(365, 25, 10, 'Omnis velit enim eveniet. Recusandae corrupti in sed nam quasi. Qui quisquam rem repudiandae aut et.', 0, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(366, 3, 4, 'Suscipit labore iusto vero placeat. Consequatur illum laborum facere dicta hic non. Quia quod praesentium culpa dolor blanditiis totam at. Magnam modi tenetur aut tempora ut porro quae dicta.', 4, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(367, 43, 2, 'Tenetur rem rerum molestiae magnam cum consequatur. Et corporis qui minus suscipit necessitatibus deserunt. Consequatur rerum animi est et nihil quod. Aperiam aut consequatur repellendus laboriosam sit modi quam.', 2, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(368, 31, 8, 'Nam impedit nulla et dignissimos sequi dolores laborum. Non recusandae enim nobis ullam. Enim sapiente exercitationem nulla sed. Sit eveniet praesentium repellat ut modi.', 2, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(369, 3, 8, 'Quo reiciendis perferendis praesentium sapiente sit quia tempore debitis. Ea provident hic hic. Exercitationem aut deserunt non et quos voluptatibus. Quia voluptates et aspernatur commodi dignissimos.', 2, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(370, 50, 1, 'Perspiciatis ab asperiores cupiditate voluptates ea. Cupiditate deleniti id non quis sunt. Culpa fuga ut voluptatem iure esse. Ad neque nisi debitis cumque quos nihil.', 3, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(371, 43, 5, 'Dolores illo error et sit nobis. Consectetur tempore quos blanditiis non vitae. Doloremque odio odit quidem sapiente numquam labore incidunt. Et adipisci et illum est. Et aperiam corporis voluptate adipisci ipsam laborum et.', 1, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(372, 15, 5, 'Atque dolor vel et autem. Repellendus minima maiores illum ratione autem.', 1, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(373, 38, 4, 'Maxime quae veniam est aut quae perspiciatis excepturi. Enim voluptatem reprehenderit sit beatae laudantium placeat consequatur. Molestiae suscipit ut rerum libero quo architecto. Quibusdam dicta inventore illum molestiae nisi exercitationem. Deleniti inventore qui sed veritatis temporibus.', 3, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(374, 41, 4, 'Velit non quo veritatis rem et natus. Aperiam id necessitatibus animi in amet. Non ipsam rerum nihil corrupti libero temporibus. Repudiandae officiis ab blanditiis expedita.', 1, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(375, 36, 4, 'Quia impedit tenetur quasi ut. Aut dolorem commodi ea aut sequi ab velit. Est vitae tempore dolorum vitae ut. At quaerat velit quo et nisi sint.', 5, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(376, 4, 8, 'Sed quia id voluptatibus accusamus minima. Autem veniam aut quo a ipsa consectetur recusandae.', 1, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(377, 17, 7, 'Totam enim non ut consectetur quo. Voluptatem illum laboriosam sit ducimus aliquam quo rem. Nulla consequatur qui fugiat non similique sed nihil quo.', 5, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(378, 4, 4, 'Molestiae aut quam ut vitae deserunt ipsam. Consequatur cupiditate magni vero explicabo explicabo sunt possimus.', 1, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(379, 40, 9, 'Et debitis adipisci soluta possimus et. Ipsam blanditiis distinctio sint in blanditiis. Sit consequatur iste quae saepe doloremque quae dicta.', 3, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(380, 31, 3, 'Et alias voluptatem est veniam sed voluptate. Tenetur repellat facilis voluptate velit in repudiandae repellat. Accusantium repellendus cupiditate corporis. Et sed sed ipsam et ut laboriosam voluptatum. Odio quas aliquid corrupti veniam ea consequatur et sint.', 0, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(381, 6, 1, 'Porro quam amet veritatis accusantium vitae. Aut in error voluptas quidem. Mollitia incidunt explicabo vitae. Doloremque asperiores aut in ut quo quo.', 0, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(382, 41, 9, 'Suscipit rerum reiciendis quos et quia. Magnam perspiciatis quas tenetur voluptatem. In voluptas voluptas aspernatur laborum placeat libero modi. Omnis eveniet quo nulla omnis sit sapiente.', 2, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(383, 23, 3, 'Eum dolorum dolor aliquid tenetur et. Mollitia non consectetur voluptas beatae et odit. Commodi accusantium ducimus tempore consequuntur iusto. Eaque ea quos dolores aut aliquam.', 1, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(384, 32, 2, 'Nihil et blanditiis voluptatem tenetur et maiores nisi. Assumenda eum rem aliquam consequatur et possimus dolores. Sit aut molestiae facilis hic soluta.', 0, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(385, 10, 10, 'Ipsam nostrum et officia blanditiis praesentium optio temporibus ad. Qui sit est est aliquid quia aut eum ad. Consequatur commodi delectus accusamus sunt.', 3, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(386, 38, 2, 'Harum et eos dignissimos iusto nemo consequatur quam. Tempore sit iusto at et illum possimus nemo. Error pariatur id sed consequuntur recusandae.', 1, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(387, 2, 7, 'Ea consequatur dolor dicta ullam voluptas. Cupiditate voluptatibus sunt amet pariatur officia reprehenderit. Natus soluta inventore velit omnis est sunt laborum. Tempora dignissimos esse ab molestiae accusamus sit assumenda.', 5, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(388, 32, 6, 'Quo quasi omnis repudiandae ab laboriosam et. Ullam facilis quidem ipsum molestiae reiciendis et incidunt.', 4, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(389, 16, 3, 'Et modi ab corrupti molestias. Odio error qui aut harum rem facere. Accusamus quisquam officia aliquid sed aut repudiandae. Quo tempore blanditiis harum accusamus.', 4, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(390, 24, 9, 'Aut amet nemo aliquam natus reiciendis. Consectetur dolorem et quae architecto corrupti. Dicta et ea pariatur et voluptatem et maiores dolorum. Ratione ut et eius voluptas laborum nihil vel.', 2, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(391, 25, 6, 'Voluptatem soluta accusantium soluta nisi sed eos. Eos ex est deleniti totam. Consequatur consequatur et et eaque sit labore.', 0, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(392, 11, 6, 'Voluptas alias placeat molestias ea aut. Veritatis et perspiciatis reiciendis totam repudiandae non.', 3, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(393, 7, 3, 'Aperiam et quas animi maxime autem. Ea eos maiores quae rerum ullam quisquam aliquid.', 4, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(394, 22, 10, 'Minima labore aut delectus dicta sed architecto. Odit non accusantium necessitatibus facere modi beatae. Dolorem distinctio in asperiores et recusandae.', 3, '2020-10-12 21:44:27', '2020-10-12 21:44:27'),
(395, 11, 10, 'Ut eos et necessitatibus. Eum eaque saepe similique minus ea architecto omnis. Ut dolorem reiciendis autem a.', 3, '2020-10-12 21:44:27', '2020-10-12 21:44:27'),
(396, 47, 9, 'Qui aut reprehenderit porro rem. Sapiente vel aut beatae natus nam consectetur. Ducimus dolorem ea ut consequatur consequatur nihil facere quas.', 5, '2020-10-12 21:44:27', '2020-10-12 21:44:27'),
(397, 17, 7, 'Quo porro alias necessitatibus perspiciatis doloribus explicabo. Dolor reiciendis mollitia eos esse aspernatur sint molestias ea.', 0, '2020-10-12 21:44:27', '2020-10-12 21:44:27'),
(398, 22, 6, 'Quidem quo est magnam sunt dolorem. Omnis neque et velit praesentium sint quos alias autem. Quis omnis consectetur non commodi quia impedit porro.', 3, '2020-10-12 21:44:27', '2020-10-12 21:44:27'),
(399, 21, 9, 'Error debitis similique sed ullam. Cumque officia possimus distinctio. Vitae quae deserunt a illum ipsa exercitationem aut. Eum hic facere quis sunt esse.', 3, '2020-10-12 21:44:27', '2020-10-12 21:44:27'),
(400, 29, 9, 'Possimus illum rerum quae amet aliquam necessitatibus. Consequatur est ea corrupti mollitia quis inventore assumenda. Enim ut laborum unde quaerat. Ab minus aut nesciunt ea. Voluptatem sint natus sequi quia facere incidunt.', 3, '2020-10-12 21:44:27', '2020-10-12 21:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name_ar` varchar(200) NOT NULL,
  `name_en` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `city_id`, `name_ar`, `name_en`) VALUES
(1, 1, 'القاهره', 'Cairo'),
(2, 2, 'الجيزة', 'Giza'),
(3, 2, 'السادس من أكتوبر', 'Sixth of October'),
(4, 2, 'الشيخ زايد', 'Cheikh Zayed'),
(5, 2, 'الحوامدية', 'Hawamdiyah'),
(6, 2, 'البدرشين', 'Al Badrasheen'),
(7, 2, 'الصف', 'Saf'),
(8, 2, 'أطفيح', 'Atfih'),
(9, 2, 'العياط', 'Al Ayat'),
(10, 2, 'الباويطي', 'Al-Bawaiti'),
(11, 2, 'منشأة القناطر', 'ManshiyetAl Qanater'),
(12, 2, 'أوسيم', 'Oaseem'),
(13, 2, 'كرداسة', 'Kerdasa'),
(14, 2, 'أبو النمرس', 'Abu Nomros'),
(15, 2, 'كفر غطاطي', 'Kafr Ghati'),
(16, 2, 'منشأة البكاري', 'Manshiyet Al Bakari'),
(17, 3, 'الأسكندرية', 'Alexandria'),
(18, 3, 'برج العرب', 'Burj Al Arab'),
(19, 3, 'برج العرب الجديدة', 'New Burj Al Arab'),
(20, 12, 'بنها', 'Banha'),
(21, 12, 'قليوب', 'Qalyub'),
(22, 12, 'شبرا الخيمة', 'Shubra Al Khaimah'),
(23, 12, 'القناطر الخيرية', 'Al Qanater Charity'),
(24, 12, 'الخانكة', 'Khanka'),
(25, 12, 'كفر شكر', 'Kafr Shukr'),
(26, 12, 'طوخ', 'Tukh'),
(27, 12, 'قها', 'Qaha'),
(28, 12, 'العبور', 'Obour'),
(29, 12, 'الخصوص', 'Khosous'),
(30, 12, 'شبين القناطر', 'Shibin Al Qanater'),
(31, 6, 'دمنهور', 'Damanhour'),
(32, 6, 'كفر الدوار', 'Kafr El Dawar'),
(33, 6, 'رشيد', 'Rashid'),
(34, 6, 'إدكو', 'Edco'),
(35, 6, 'أبو المطامير', 'Abu al-Matamir'),
(36, 6, 'أبو حمص', 'Abu Homs'),
(37, 6, 'الدلنجات', 'Delengat'),
(38, 6, 'المحمودية', 'Mahmoudiyah'),
(39, 6, 'الرحمانية', 'Rahmaniyah'),
(40, 6, 'إيتاي البارود', 'Itai Baroud'),
(41, 6, 'حوش عيسى', 'Housh Eissa'),
(42, 6, 'شبراخيت', 'Shubrakhit'),
(43, 6, 'كوم حمادة', 'Kom Hamada'),
(44, 6, 'بدر', 'Badr'),
(45, 6, 'وادي النطرون', 'Wadi Natrun'),
(46, 6, 'النوبارية الجديدة', 'New Nubaria'),
(47, 23, 'مرسى مطروح', 'Marsa Matrouh'),
(48, 23, 'الحمام', 'El Hamam'),
(49, 23, 'العلمين', 'Alamein'),
(50, 23, 'الضبعة', 'Dabaa'),
(51, 23, 'النجيلة', 'Al-Nagila'),
(52, 23, 'سيدي براني', 'Sidi Brani'),
(53, 23, 'السلوم', 'Salloum'),
(54, 23, 'سيوة', 'Siwa'),
(55, 19, 'دمياط', 'Damietta'),
(56, 19, 'دمياط الجديدة', 'New Damietta'),
(57, 19, 'رأس البر', 'Ras El Bar'),
(58, 19, 'فارسكور', 'Faraskour'),
(59, 19, 'الزرقا', 'Zarqa'),
(60, 19, 'السرو', 'alsaru'),
(61, 19, 'الروضة', 'alruwda'),
(62, 19, 'كفر البطيخ', 'Kafr El-Batikh'),
(63, 19, 'عزبة البرج', 'Azbet Al Burg'),
(64, 19, 'ميت أبو غالب', 'Meet Abou Ghalib'),
(65, 19, 'كفر سعد', 'Kafr Saad'),
(66, 4, 'المنصورة', 'Mansoura'),
(67, 4, 'طلخا', 'Talkha'),
(68, 4, 'ميت غمر', 'Mitt Ghamr'),
(69, 4, 'دكرنس', 'Dekernes'),
(70, 4, 'أجا', 'Aga'),
(71, 4, 'منية النصر', 'Menia El Nasr'),
(72, 4, 'السنبلاوين', 'Sinbillawin'),
(73, 4, 'الكردي', 'El Kurdi'),
(74, 4, 'بني عبيد', 'Bani Ubaid'),
(75, 4, 'المنزلة', 'Al Manzala'),
(76, 4, 'تمي الأمديد', 'tami al\'amdid'),
(77, 4, 'الجمالية', 'aljamalia'),
(78, 4, 'شربين', 'Sherbin'),
(79, 4, 'المطرية', 'Mataria'),
(80, 4, 'بلقاس', 'Belqas'),
(81, 4, 'ميت سلسيل', 'Meet Salsil'),
(82, 4, 'جمصة', 'Gamasa'),
(83, 4, 'محلة دمنة', 'Mahalat Damana'),
(84, 4, 'نبروه', 'Nabroh'),
(85, 22, 'كفر الشيخ', 'Kafr El Sheikh'),
(86, 22, 'دسوق', 'Desouq'),
(87, 22, 'فوه', 'Fooh'),
(88, 22, 'مطوبس', 'Metobas'),
(89, 22, 'برج البرلس', 'Burg Al Burullus'),
(90, 22, 'بلطيم', 'Baltim'),
(91, 22, 'مصيف بلطيم', 'Masief Baltim'),
(92, 22, 'الحامول', 'Hamol'),
(93, 22, 'بيلا', 'Bella'),
(94, 22, 'الرياض', 'Riyadh'),
(95, 22, 'سيدي سالم', 'Sidi Salm'),
(96, 22, 'قلين', 'Qellen'),
(97, 22, 'سيدي غازي', 'Sidi Ghazi'),
(98, 8, 'طنطا', 'Tanta'),
(99, 8, 'المحلة الكبرى', 'Al Mahalla Al Kobra'),
(100, 8, 'كفر الزيات', 'Kafr El Zayat'),
(101, 8, 'زفتى', 'Zefta'),
(102, 8, 'السنطة', 'El Santa'),
(103, 8, 'قطور', 'Qutour'),
(104, 8, 'بسيون', 'Basion'),
(105, 8, 'سمنود', 'Samannoud'),
(106, 10, 'شبين الكوم', 'Shbeen El Koom'),
(107, 10, 'مدينة السادات', 'Sadat City'),
(108, 10, 'منوف', 'Menouf'),
(109, 10, 'سرس الليان', 'Sars El-Layan'),
(110, 10, 'أشمون', 'Ashmon'),
(111, 10, 'الباجور', 'Al Bagor'),
(112, 10, 'قويسنا', 'Quesna'),
(113, 10, 'بركة السبع', 'Berkat El Saba'),
(114, 10, 'تلا', 'Tala'),
(115, 10, 'الشهداء', 'Al Shohada'),
(116, 20, 'الزقازيق', 'Zagazig'),
(117, 20, 'العاشر من رمضان', 'Al Ashr Men Ramadan'),
(118, 20, 'منيا القمح', 'Minya Al Qamh'),
(119, 20, 'بلبيس', 'Belbeis'),
(120, 20, 'مشتول السوق', 'Mashtoul El Souq'),
(121, 20, 'القنايات', 'Qenaiat'),
(122, 20, 'أبو حماد', 'Abu Hammad'),
(123, 20, 'القرين', 'El Qurain'),
(124, 20, 'ههيا', 'Hehia'),
(125, 20, 'أبو كبير', 'Abu Kabir'),
(126, 20, 'فاقوس', 'Faccus'),
(127, 20, 'الصالحية الجديدة', 'El Salihia El Gedida'),
(128, 20, 'الإبراهيمية', 'Al Ibrahimiyah'),
(129, 20, 'ديرب نجم', 'Deirb Negm'),
(130, 20, 'كفر صقر', 'Kafr Saqr'),
(131, 20, 'أولاد صقر', 'Awlad Saqr'),
(132, 20, 'الحسينية', 'Husseiniya'),
(133, 20, 'صان الحجر القبلية', 'san alhajar alqablia'),
(134, 20, 'منشأة أبو عمر', 'Manshayat Abu Omar'),
(135, 18, 'بورسعيد', 'PorSaid'),
(136, 18, 'بورفؤاد', 'PorFouad'),
(137, 9, 'الإسماعيلية', 'Ismailia'),
(138, 9, 'فايد', 'Fayed'),
(139, 9, 'القنطرة شرق', 'Qantara Sharq'),
(140, 9, 'القنطرة غرب', 'Qantara Gharb'),
(141, 9, 'التل الكبير', 'El Tal El Kabier'),
(142, 9, 'أبو صوير', 'Abu Sawir'),
(143, 9, 'القصاصين الجديدة', 'Kasasien El Gedida'),
(144, 14, 'السويس', 'Suez'),
(145, 26, 'العريش', 'Arish'),
(146, 26, 'الشيخ زويد', 'Sheikh Zowaid'),
(147, 26, 'نخل', 'Nakhl'),
(148, 26, 'رفح', 'Rafah'),
(149, 26, 'بئر العبد', 'Bir al-Abed'),
(150, 26, 'الحسنة', 'Al Hasana'),
(151, 21, 'الطور', 'Al Toor'),
(152, 21, 'شرم الشيخ', 'Sharm El-Shaikh'),
(153, 21, 'دهب', 'Dahab'),
(154, 21, 'نويبع', 'Nuweiba'),
(155, 21, 'طابا', 'Taba'),
(156, 21, 'سانت كاترين', 'Saint Catherine'),
(157, 21, 'أبو رديس', 'Abu Redis'),
(158, 21, 'أبو زنيمة', 'Abu Zenaima'),
(159, 21, 'رأس سدر', 'Ras Sidr'),
(160, 17, 'بني سويف', 'Bani Sweif'),
(161, 17, 'بني سويف الجديدة', 'Beni Suef El Gedida'),
(162, 17, 'الواسطى', 'Al Wasta'),
(163, 17, 'ناصر', 'Naser'),
(164, 17, 'إهناسيا', 'Ehnasia'),
(165, 17, 'ببا', 'beba'),
(166, 17, 'الفشن', 'Fashn'),
(167, 17, 'سمسطا', 'Somasta'),
(168, 7, 'الفيوم', 'Fayoum'),
(169, 7, 'الفيوم الجديدة', 'Fayoum El Gedida'),
(170, 7, 'طامية', 'Tamiya'),
(171, 7, 'سنورس', 'Snores'),
(172, 7, 'إطسا', 'Etsa'),
(173, 7, 'إبشواي', 'Epschway'),
(174, 7, 'يوسف الصديق', 'Yusuf El Sediaq'),
(175, 11, 'المنيا', 'Minya'),
(176, 11, 'المنيا الجديدة', 'Minya El Gedida'),
(177, 11, 'العدوة', 'El Adwa'),
(178, 11, 'مغاغة', 'Magagha'),
(179, 11, 'بني مزار', 'Bani Mazar'),
(180, 11, 'مطاي', 'Mattay'),
(181, 11, 'سمالوط', 'Samalut'),
(182, 11, 'المدينة الفكرية', 'Madinat El Fekria'),
(183, 11, 'ملوي', 'Meloy'),
(184, 11, 'دير مواس', 'Deir Mawas'),
(185, 16, 'أسيوط', 'Assiut'),
(186, 16, 'أسيوط الجديدة', 'Assiut El Gedida'),
(187, 16, 'ديروط', 'Dayrout'),
(188, 16, 'منفلوط', 'Manfalut'),
(189, 16, 'القوصية', 'Qusiya'),
(190, 16, 'أبنوب', 'Abnoub'),
(191, 16, 'أبو تيج', 'Abu Tig'),
(192, 16, 'الغنايم', 'El Ghanaim'),
(193, 16, 'ساحل سليم', 'Sahel Selim'),
(194, 16, 'البداري', 'El Badari'),
(195, 16, 'صدفا', 'Sidfa'),
(196, 13, 'الخارجة', 'El Kharga'),
(197, 13, 'باريس', 'Paris'),
(198, 13, 'موط', 'Mout'),
(199, 13, 'الفرافرة', 'Farafra'),
(200, 13, 'بلاط', 'Balat'),
(201, 5, 'الغردقة', 'Hurghada'),
(202, 5, 'رأس غارب', 'Ras Ghareb'),
(203, 5, 'سفاجا', 'Safaga'),
(204, 5, 'القصير', 'El Qusiar'),
(205, 5, 'مرسى علم', 'Marsa Alam'),
(206, 5, 'الشلاتين', 'Shalatin'),
(207, 5, 'حلايب', 'Halaib'),
(208, 27, 'سوهاج', 'Sohag'),
(209, 27, 'سوهاج الجديدة', 'Sohag El Gedida'),
(210, 27, 'أخميم', 'Akhmeem'),
(211, 27, 'أخميم الجديدة', 'Akhmim El Gedida'),
(212, 27, 'البلينا', 'Albalina'),
(213, 27, 'المراغة', 'El Maragha'),
(214, 27, 'المنشأة', 'almunsha\'a'),
(215, 27, 'دار السلام', 'Dar AISalaam'),
(216, 27, 'جرجا', 'Gerga'),
(217, 27, 'جهينة الغربية', 'Jahina Al Gharbia'),
(218, 27, 'ساقلته', 'Saqilatuh'),
(219, 27, 'طما', 'Tama'),
(220, 27, 'طهطا', 'Tahta'),
(221, 25, 'قنا', 'Qena'),
(222, 25, 'قنا الجديدة', 'New Qena'),
(223, 25, 'أبو تشت', 'Abu Tesht'),
(224, 25, 'نجع حمادي', 'Nag Hammadi'),
(225, 25, 'دشنا', 'Deshna'),
(226, 25, 'الوقف', 'Alwaqf'),
(227, 25, 'قفط', 'Qaft'),
(228, 25, 'نقادة', 'Naqada'),
(229, 25, 'فرشوط', 'Farshout'),
(230, 25, 'قوص', 'Quos'),
(231, 24, 'الأقصر', 'Luxor'),
(232, 24, 'الأقصر الجديدة', 'New Luxor'),
(233, 24, 'إسنا', 'Esna'),
(234, 24, 'طيبة الجديدة', 'New Tiba'),
(235, 24, 'الزينية', 'Al ziynia'),
(236, 24, 'البياضية', 'Al Bayadieh'),
(237, 24, 'القرنة', 'Al Qarna'),
(238, 24, 'أرمنت', 'Armant'),
(239, 24, 'الطود', 'Al Tud'),
(240, 15, 'أسوان', 'Aswan'),
(241, 15, 'أسوان الجديدة', 'Aswan El Gedida'),
(242, 15, 'دراو', 'Drau'),
(243, 15, 'كوم أمبو', 'Kom Ombo'),
(244, 15, 'نصر النوبة', 'Nasr Al Nuba'),
(245, 15, 'كلابشة', 'Kalabsha'),
(246, 15, 'إدفو', 'Edfu'),
(247, 15, 'الرديسية', 'Al-Radisiyah'),
(248, 15, 'البصيلية', 'Al Basilia'),
(249, 15, 'السباعية', 'Al Sibaeia'),
(250, 15, 'ابوسمبل السياحية', 'Abo Simbl Al Siyahia');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Agustin Boyle', 'agustin44@example.net', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4BXfXMgsqr', '2020-10-12 21:42:23', '2020-10-12 21:42:23'),
(2, 'Birdie Boyer', 'constantin.mclaughlin@example.org', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tR2yISFULo', '2020-10-12 21:42:23', '2020-10-12 21:42:23'),
(3, 'Willa Moen', 'kiel.schinner@example.com', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JWWFg2WTZx', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(4, 'Laurine Maggio', 'hosea85@example.com', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8ZGQssbZmU', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(5, 'Prof. Trent Dach', 'mayer.lesley@example.net', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DirNOYhaKU', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(6, 'Mr. Toni Ullrich II', 'okeebler@example.com', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QakCwV4V2B', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(7, 'Esta Johns', 'yryan@example.org', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zWXlqav5Q9', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(8, 'Ms. Raina Schaden', 'shudson@example.net', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jQK6ZYocyH', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(9, 'Miss Brooke Weimann', 'adrienne.abshire@example.net', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '26D5USQ8kW', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(10, 'Ms. Ivory Leannon', 'lorena00@example.com', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ItfcfGs7ON', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(11, 'Mohamed Ashref', 'messr93@gmail.com', NULL, '$2y$10$K9CJ14yJlXWg.qgWg3m3Re41QkHTg9GMr2Ij14Y.eLB3KYP18.sre', 'IgsuESYNLugIw9KjsIasWNEWSlVQHw1e0Y9KzWYV1g8w0dfRnmANnxtOsvZa', '2020-10-13 02:50:57', '2020-10-13 02:50:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_foreign` (`category`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_foreign` FOREIGN KEY (`category`) REFERENCES `categories` (`slug`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
