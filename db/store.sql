-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2020 at 10:49 PM
-- Server version: 8.0.21-0ubuntu0.20.04.4
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `price` int NOT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_img.jpg',
  `parent` int NOT NULL DEFAULT '0',
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
  `id` bigint NOT NULL,
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
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed_value','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int NOT NULL,
  `consumed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `consumed`, `created_at`, `updated_at`) VALUES
(1, 'ABC12345', 'percent', 10, 0, NULL, '2020-10-20 18:50:42'),
(2, 'DEF6789', 'fixed_value', 500, 1, NULL, '2020-10-21 12:30:56');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'database', 'default', '{\"uuid\":\"bec1a7e5-8ec9-463b-804f-bba2aacc3026\",\"displayName\":\"App\\\\Notifications\\\\ItemBuyed\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:11;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:27:\\\"App\\\\Notifications\\\\ItemBuyed\\\":12:{s:10:\\\"\\u0000*\\u0000product\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:11:\\\"App\\\\Product\\\";s:2:\\\"id\\\";i:59;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"\\u0000*\\u0000buyer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"\\u0000*\\u0000url\\\";s:45:\\\"http:\\/\\/localhost\\/store\\/product\\/lenovo-ideapad\\\";s:2:\\\"id\\\";s:36:\\\"8260bd59-052c-4ebf-bb3e-abe0f64837e1\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.mailtrap.io :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: Temporary failure in name resolution in /var/www/html/store/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}()\n#1 /var/www/html/store/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(272): stream_socket_client()\n#2 /var/www/html/store/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 /var/www/html/store/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize()\n#4 /var/www/html/store/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Swift_Mailer->send()\n#6 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage()\n#7 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(65): Illuminate\\Mail\\Mailer->send()\n#8 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(94): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#16 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#20 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call()\n#21 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then()\n#24 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then()\n#28 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process()\n#32 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob()\n#33 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon()\n#34 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#37 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call()\n#42 /var/www/html/store/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#43 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/html/store/vendor/symfony/console/Application.php(920): Illuminate\\Console\\Command->run()\n#45 /var/www/html/store/vendor/symfony/console/Application.php(266): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/html/store/vendor/symfony/console/Application.php(142): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/html/store/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/html/store/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}', '2020-10-22 09:39:27');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
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
(15, '2020_10_14_054959_create_order_products_table', 3),
(16, '2020_10_16_062202_create_coupons_table', 4),
(17, '2020_10_19_085108_create_product_photos_table', 5),
(18, '2020_10_21_154514_create_notifications_table', 6),
(19, '2020_10_22_092530_create_jobs_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\User', 1),
(1, 'App\\User', 11),
(2, 'App\\User', 11),
(3, 'App\\User', 11),
(3, 'App\\User', 12);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('512fd064-51aa-4f8b-bd92-b39c7352ab04', 'App\\Notifications\\ItemBuyed', 'App\\User', 11, '{\"url\":\"http:\\/\\/localhost\\/store\\/product\\/redmi\",\"message\":\"Customer 3o3o wanna buy your product\"}', NULL, '2020-10-22 19:21:29', '2020-10-22 21:06:18');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed','decline') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total` bigint NOT NULL,
  `coupon_applied` tinyint NOT NULL DEFAULT '0',
  `item_count` int NOT NULL,
  `paid` tinyint NOT NULL DEFAULT '0',
  `payment_method` enum('cash_on_delivery','visa','paypal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` text COLLATE utf8mb4_unicode_ci,
  `shipping_full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` int NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `status`, `total`, `coupon_applied`, `item_count`, `paid`, `payment_method`, `payment_id`, `shipping_full_name`, `city`, `region`, `address`, `zip_code`, `phone`, `email`, `notes`, `created_at`, `updated_at`) VALUES
(24, 'Order_54095f89c05b680d3', 11, 'processing', 5409, 1, 1, 1, 'visa', '8ac7a4a17531843901753217abb75db8', 'Maryam Dawson', 'Veniam sapiente tem', 'Nobis cillum veritat', 'Eu sit sit quo ex te', 83012, 7777, 'tiky@mailinator.com', 'Impedit anim in dol', '2020-10-16 13:46:35', '2020-10-16 13:46:54'),
(30, 'Order_57645f8aff322516e', 11, 'pending', 5764, 0, 1, 0, 'cash_on_delivery', NULL, 'Denton Foreman', 'Voluptatem Sit eni', 'Est aperiam nulla e', 'Occaecat sapiente mo', 12206, 587587, 'patisery@mailinator.com', 'Ut sit duis mollitia', '2020-10-17 12:26:58', '2020-10-17 12:26:58'),
(32, 'Order_4005f8f4e75e123e', 11, 'processing', 400, 1, 1, 1, 'visa', '8ac7a4a17546e904017547cb2371137b', 'Clio Benton', 'Eiusmod eaque sunt v', 'Quia iure exercitati', 'Omnis tempora veniam', 26445, 777, 'kurita@mailinator.com', 'Distinctio Porro se', '2020-10-20 18:54:13', '2020-10-20 18:54:59'),
(33, 'Order_1065f90465a87338', 11, 'processing', 106, 1, 1, 1, 'visa', '8ac7a4a27546f39e01754b93e26301fb', 'Jaquelyn Bryant', 'Eaque ducimus quia', 'Amet qui quia volup', 'Dolore recusandae U', 69786, 8787, 'zazibymib@mailinator.com', 'Sapiente aut asperio', '2020-10-21 12:31:54', '2020-10-21 12:33:07'),
(34, 'Order_3035f90556749f37', 11, 'pending', 303, 0, 1, 0, 'cash_on_delivery', NULL, 'Trevor Mclaughlin', 'Adipisci lorem est', 'Est eiusmod asperior', 'Ad dolore sed dolore', 70927, 5555, 'sifubil@mailinator.com', 'Reiciendis sunt aliq', '2020-10-21 13:36:07', '2020-10-21 13:36:07'),
(35, 'Order_30055f9055dc9fd5d', 11, 'pending', 3005, 0, 1, 0, 'cash_on_delivery', NULL, 'Forrest Diaz', 'Odio laudantium atq', 'Temporibus minim ape', 'Minima consectetur m', 18278, 777, 'lenyry@mailinator.com', 'Nostrud magni id na', '2020-10-21 13:38:04', '2020-10-21 13:38:04'),
(36, 'Order_23725f90d06688d01', 12, 'pending', 2372, 0, 2, 0, 'cash_on_delivery', NULL, 'Martina Chapman', 'Consequatur Est ip', 'Et eum ex ullam comm', 'Voluptas corrupti v', 32600, 5587, 'lurerycuby@mailinator.com', 'Molestiae consequatu', '2020-10-21 22:20:54', '2020-10-21 22:20:54'),
(37, 'Order_13555f90d0dca052a', 12, 'pending', 1355, 0, 1, 0, 'cash_on_delivery', NULL, 'Illana Barry', 'Proident sequi maxi', 'Voluptatibus anim au', 'Aliqua Mollitia dol', 18474, 78, 'setubeco@mailinator.com', 'Tempora et voluptatu', '2020-10-21 22:22:52', '2020-10-21 22:22:52'),
(38, 'Order_9005f914e6d2c672', 12, 'pending', 900, 0, 1, 0, 'cash_on_delivery', NULL, 'Maggie Mayo', 'Occaecat voluptatem', 'Consequatur Tempore', 'In itaque esse ipsa', 23945, 88, 'xido@mailinator.com', 'Irure dignissimos ma', '2020-10-22 07:18:37', '2020-10-22 07:18:37'),
(39, 'Order_9005f9150f56bf39', 12, 'pending', 900, 0, 1, 0, 'cash_on_delivery', NULL, 'Martina Dorsey', 'Soluta ipsum perfer', 'Id ex dolore laboris', 'Sunt vero perferend', 45628, 777, 'sigageguhe@mailinator.com', 'Irure qui quia nisi', '2020-10-22 07:29:25', '2020-10-22 07:29:25'),
(40, 'Order_9005f915dd583a57', 12, 'pending', 900, 0, 1, 0, 'cash_on_delivery', NULL, 'Desiree Stephenson', 'Non quibusdam qui es', 'Magni et quo quas ac', 'Consequatur magni es', 43342, 7777, 'cydonubede@mailinator.com', 'Enim blanditiis irur', '2020-10-22 08:24:21', '2020-10-22 08:24:21'),
(41, 'Order_9005f915f40f2c60', 12, 'pending', 900, 0, 1, 0, 'cash_on_delivery', NULL, 'Lee Cline', 'Beatae optio ration', 'Fugiat voluptatem I', 'Nisi et tenetur nisi', 90411, 777, 'viwagoj@mailinator.com', 'Vero eum molestiae f', '2020-10-22 08:30:24', '2020-10-22 08:30:24'),
(42, 'Order_9005f915fe018106', 12, 'pending', 900, 0, 1, 0, 'cash_on_delivery', NULL, 'Britanni Gibson', 'Non velit natus cill', 'Ex in culpa nostrud', 'Consectetur harum am', 46951, 787, 'girylaj@mailinator.com', 'Cupidatat dolorem au', '2020-10-22 08:33:04', '2020-10-22 08:33:04'),
(43, 'Order_9005f9167a277eea', 12, 'pending', 900, 0, 1, 0, 'cash_on_delivery', NULL, 'Aretha Montoya', 'Ut itaque expedita n', 'Quo itaque commodo s', 'Non rem occaecat iru', 54442, 77777, 'kysy@mailinator.com', 'Consequatur earum e', '2020-10-22 09:06:10', '2020-10-22 09:06:10'),
(44, 'Order_1005f916987bd416', 12, 'pending', 100, 0, 1, 0, 'cash_on_delivery', NULL, 'Gray Hardy', 'Reiciendis sit aperi', 'Quia totam et exerci', 'Magni id id officia', 11205, 888, 'hodaci@mailinator.com', 'Repudiandae obcaecat', '2020-10-22 09:14:15', '2020-10-22 09:14:15'),
(45, 'Order_1005f916a3a59a57', 12, 'pending', 100, 0, 1, 0, 'cash_on_delivery', NULL, 'Brynn Moreno', 'Sint natus exercitat', 'Illo quos quidem tem', 'Perspiciatis except', 11962, 777, 'sepev@mailinator.com', 'Non quod consequatur', '2020-10-22 09:17:14', '2020-10-22 09:17:14'),
(46, 'Order_1005f916a8558deb', 12, 'pending', 100, 0, 1, 0, 'cash_on_delivery', NULL, 'Vaughan Blankenship', 'Qui in commodi nostr', 'Unde deleniti aliqua', 'Sint explicabo Labo', 56132, 999, 'huwy@mailinator.com', 'Assumenda id ipsam d', '2020-10-22 09:18:29', '2020-10-22 09:18:29'),
(47, 'Order_1005f916bcf60065', 12, 'pending', 100, 0, 1, 0, 'cash_on_delivery', NULL, 'Brooke Vaughn', 'Debitis possimus do', 'Nostrum minim deseru', 'Sit atque quidem ir', 68997, 88777, 'kavaquma@mailinator.com', 'Sed ex consectetur', '2020-10-22 09:23:59', '2020-10-22 09:23:59'),
(48, 'Order_1005f916d22e4362', 12, 'pending', 100, 0, 1, 0, 'cash_on_delivery', NULL, 'Rashad Franks', 'Consectetur quam in', 'Excepteur inventore', 'Tenetur dolorem quis', 27401, 9999, 'hewyfavepu@mailinator.com', 'Eum autem labore ali', '2020-10-22 09:29:38', '2020-10-22 09:29:38'),
(49, 'Order_9005f916e0f83db6', 12, 'pending', 900, 0, 1, 0, 'cash_on_delivery', NULL, 'Judith Yates', 'Dolor et voluptas au', 'Sequi dolorem consec', 'Et corporis suscipit', 24530, 8888, 'tene@mailinator.com', 'Dolores in est ut ve', '2020-10-22 09:33:35', '2020-10-22 09:33:35'),
(50, 'Order_9005f916e514eeb4', 12, 'pending', 900, 0, 1, 0, 'cash_on_delivery', NULL, 'Xanthus Christensen', 'Provident ullamco c', 'Maiores sit sunt do', 'Tempora ad dolor dis', 33610, 555, 'feko@mailinator.com', 'Fuga Sunt odit ull', '2020-10-22 09:34:41', '2020-10-22 09:34:41'),
(51, 'Order_9005f916e6094d33', 12, 'pending', 900, 0, 1, 0, 'cash_on_delivery', NULL, 'Xanthus Christensen', 'Provident ullamco c', 'Maiores sit sunt do', 'Tempora ad dolor dis', 33610, 555, 'feko@mailinator.com', 'Fuga Sunt odit ull', '2020-10-22 09:34:56', '2020-10-22 09:34:56'),
(52, 'Order_18005f916f6daed6a', 12, 'pending', 1800, 0, 1, 0, 'cash_on_delivery', NULL, 'Scott Byrd', 'Obcaecati maiores si', 'Quibusdam exercitati', 'Doloribus omnis ipsa', 65110, 5555, 'fyquxujupa@mailinator.com', 'Nobis aliquip invent', '2020-10-22 09:39:25', '2020-10-22 09:39:25'),
(53, 'Order_1005f91f7b311030', 12, 'pending', 100, 0, 1, 0, 'cash_on_delivery', NULL, 'Ariel Fulton', 'Sunt vero sit simili', 'Impedit sint ad lib', 'Dignissimos molestia', 41010, 777, 'xuwula@mailinator.com', 'Nam tempora exercita', '2020-10-22 19:20:51', '2020-10-22 19:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL,
  `price` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(39, 24, 1, 2, 3005, '2020-10-16 13:46:35', '2020-10-16 13:46:35'),
(45, 30, 2, 4, 1441, '2020-10-17 12:26:58', '2020-10-17 12:26:58'),
(48, 32, 59, 1, 900, '2020-10-20 18:54:14', '2020-10-20 18:54:14'),
(49, 33, 55, 2, 303, '2020-10-21 12:31:54', '2020-10-21 12:31:54'),
(50, 34, 55, 1, 303, '2020-10-21 13:36:07', '2020-10-21 13:36:07'),
(51, 35, 1, 1, 3005, '2020-10-21 13:38:04', '2020-10-21 13:38:04'),
(52, 36, 32, 1, 1017, '2020-10-21 22:20:54', '2020-10-21 22:20:54'),
(53, 37, 17, 1, 1355, '2020-10-21 22:22:52', '2020-10-21 22:22:52'),
(54, 38, 59, 1, 900, '2020-10-22 07:18:37', '2020-10-22 07:18:37'),
(55, 39, 59, 1, 900, '2020-10-22 07:29:25', '2020-10-22 07:29:25'),
(56, 40, 59, 1, 900, '2020-10-22 08:24:21', '2020-10-22 08:24:21'),
(57, 41, 59, 1, 900, '2020-10-22 08:30:25', '2020-10-22 08:30:25'),
(58, 42, 59, 1, 900, '2020-10-22 08:33:04', '2020-10-22 08:33:04'),
(59, 43, 59, 1, 900, '2020-10-22 09:06:10', '2020-10-22 09:06:10'),
(60, 44, 60, 1, 100, '2020-10-22 09:14:15', '2020-10-22 09:14:15'),
(61, 45, 60, 1, 100, '2020-10-22 09:17:14', '2020-10-22 09:17:14'),
(62, 46, 60, 1, 100, '2020-10-22 09:18:29', '2020-10-22 09:18:29'),
(63, 47, 60, 1, 100, '2020-10-22 09:23:59', '2020-10-22 09:23:59'),
(64, 48, 60, 1, 100, '2020-10-22 09:29:39', '2020-10-22 09:29:39'),
(65, 49, 59, 1, 900, '2020-10-22 09:33:35', '2020-10-22 09:33:35'),
(66, 50, 59, 1, 900, '2020-10-22 09:34:41', '2020-10-22 09:34:41'),
(67, 51, 59, 1, 900, '2020-10-22 09:34:56', '2020-10-22 09:34:56'),
(68, 52, 59, 2, 900, '2020-10-22 09:39:25', '2020-10-22 09:39:25'),
(69, 53, 60, 1, 100, '2020-10-22 19:20:51', '2020-10-22 19:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_img.jpg',
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `discount` int DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category`, `name`, `slug`, `photo`, `details`, `price`, `discount`, `rating`, `description`, `created_at`, `updated_at`) VALUES
(1, 11, 'computer-accessories', 'Corporis architecto dolore', 'Corporis-architecto-dolore', 'default_img.jpg', NULL, 3454, 13, 2, 'Fugiat voluptate dignissimos similique et porro impedit molestiae. Natus vel aut in. Eum et beatae placeat quia.', '2020-10-12 21:43:59', '2020-10-12 21:48:25'),
(2, 11, 'mobile-accessories', 'Corporis assumend', 'Corporis-assumend', 'default_img.jpg', NULL, 1848, 22, 1, 'Voluptatem omnis qui corrupti maxime sapiente. Corrupti architecto enim impedit veniam non.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(5, 11, 'laptop', 'Voluptate incidun', 'Voluptate-incidun', 'default_img.jpg', NULL, 3711, 32, 0, 'Rerum architecto rerum maiores et in. Laboriosam quis nemo rerum quod aut voluptatem quam nostrum. Dolor consequatur voluptas facere qui consequatur ea et error.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(6, 7, 'computer-accessories', 'Quos offici', 'Quos-offici', 'default_img.jpg', NULL, 1636, 12, 4, 'Id quaerat exercitationem vel alias quia eos. Qui harum temporibus quo numquam minus placeat. Occaecati nulla aperiam aliquam deserunt voluptatibus quas aut. Sit architecto tenetur eaque sunt consequuntur.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(8, 3, 'computer-accessories', 'Dolores nobis eu', 'Dolores-nobis-eu', 'default_img.jpg', NULL, 1939, 22, 5, 'Laborum corrupti quam voluptatum qui nostrum. Minus perferendis occaecati quisquam sequi.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(10, 7, 'mobile-accessories', 'Ex illu', 'Ex-illu', 'default_img.jpg', NULL, 4746, 13, 4, 'Debitis non reiciendis placeat odit consequatur animi. Laborum numquam molestiae rem qui dignissimos doloremque necessitatibus. Dignissimos sed tempore sit beatae eius.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(11, 7, 'laptop', 'Et occaecat', 'Et-occaecat', 'default_img.jpg', NULL, 3933, 24, 5, 'Culpa ex nihil corrupti dicta vel minima aut. Corporis nam modi deserunt deleniti delectus aut officiis. Odit velit et eum blanditiis. Est ex eligendi reiciendis aut excepturi.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(13, 2, 'tablet', 'Officiis et itaqu', 'Officiis-et-itaqu', 'default_img.jpg', NULL, 2316, 15, 0, 'Natus qui et quaerat occaecati iure et. Et iusto nostrum aliquam incidunt. Explicabo mollitia veritatis animi deserunt ipsam. Alias quia qui accusamus reprehenderit voluptate reprehenderit magni.', '2020-10-12 21:44:00', '2020-10-12 21:48:25'),
(14, 1, 'tablet', 'Magni ipsu', 'Magni-ipsu', 'default_img.jpg', NULL, 1593, 10, 3, 'Non quisquam ab neque fugiat sed reprehenderit. Non alias qui hic. Facilis pariatur veritatis delectus voluptas. Voluptatem libero incidunt impedit sit adipisci.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(15, 4, 'mobile', 'Tempora liber', 'Tempora-liber', 'default_img.jpg', NULL, 587, 6, 4, 'Voluptatibus reiciendis consectetur aut vel asperiores nulla optio. Sed debitis rem amet quos. Reprehenderit sunt nam rerum voluptatem laborum maiores dicta. Voluptate expedita occaecati consectetur rerum error quia non.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(17, 11, 'laptop', 'Atque sit null', 'Atque-sit-null', 'default_img.jpg', NULL, 1993, 32, 2, 'Porro sint quis voluptatem tempora qui occaecati impedit dignissimos. Aut neque doloribus totam rem quasi ut. Minima omnis esse quasi excepturi iure.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(19, 7, 'tablet', 'Est dolore', 'Est-dolore', 'default_img.jpg', NULL, 4258, 7, 1, 'Nihil molestiae vel dolor necessitatibus eum repellat. Totam voluptates optio voluptate inventore quibusdam cumque. Omnis accusamus laudantium eligendi velit. Atque nostrum excepturi tenetur consectetur voluptas aspernatur.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(20, 3, 'pc', 'Quasi minima nequ', 'Quasi-minima-nequ', 'default_img.jpg', NULL, 1284, 24, 4, 'Magni tempore voluptatibus rerum sed enim odit autem. Vel iure quod sed porro facere. Nihil neque dolorem at. Dolorem sunt quisquam ullam consequatur porro quia suscipit pariatur.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(21, 7, 'computer-accessories', 'Autem eum', 'Autem-eum', 'default_img.jpg', NULL, 3133, 22, 4, 'Recusandae excepturi voluptas tempora error amet totam. Maxime saepe harum et non. Nihil quibusdam qui veritatis reprehenderit alias. Quia sunt vitae qui.', '2020-10-12 21:44:00', '2020-10-12 21:48:26'),
(25, 7, 'mobile', 'Veritatis eos tenetur', 'Veritatis-eos-tenetur', 'default_img.jpg', NULL, 873, 23, 4, 'Sit sequi eius laudantium ipsam natus. Explicabo inventore nobis est nulla et et.', '2020-10-12 21:44:01', '2020-10-12 21:48:26'),
(27, 2, 'mobile', 'Cum molestiae', 'Cum-molestiae', 'default_img.jpg', NULL, 2741, 6, 4, 'Nobis natus perferendis error dolores occaecati. Velit placeat consequuntur minus enim. Reiciendis sit perferendis quidem aspernatur.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(28, 3, 'computer-accessories', 'Voluptatem ut iure', 'Voluptatem-ut-iure', 'default_img.jpg', NULL, 2594, 14, 0, 'A soluta ipsa qui pariatur aperiam laboriosam dolores. Corporis et et et praesentium odit repudiandae perspiciatis.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(29, 4, 'tablet', 'Dolorum ipsa veniam', 'Dolorum-ipsa-veniam', 'default_img.jpg', NULL, 3836, 6, 3, 'Voluptatem culpa eos voluptatem quod. Molestiae quae officia assumenda dolor. Natus voluptatem ullam voluptas fugiat atque. Sit veniam eum dicta voluptatibus voluptatem veniam. Iure omnis dolorem qui.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(30, 9, 'mobile-accessories', 'Quaerat et cupiditate', 'Quaerat-et-cupiditate', 'default_img.jpg', NULL, 2508, 29, 5, 'Ratione incidunt est sed cupiditate fugiat qui. Quis voluptate corporis fuga qui consequatur. Laborum ut debitis aut magni. Porro excepturi omnis sint in.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(31, 4, 'mobile', 'Et rerum in', 'Et-rerum-in', 'default_img.jpg', NULL, 2637, 9, 5, 'Voluptatum dicta temporibus consectetur totam cum. Omnis quia quia quas consequatur unde eaque. Id et nisi repellat cum dignissimos tempore. Aut porro eius similique et recusandae.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(32, 11, 'laptop', 'Culpa temporibus inventore', 'Culpa-temporibus-inventore', 'default_img.jpg', NULL, 1356, 25, 4, 'Ab architecto saepe enim dolor architecto et. Voluptatem eos sed temporibus itaque reprehenderit. Vel nesciunt est culpa nam voluptas at atque. Et rerum pariatur soluta ab.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(33, 9, 'tablet', 'Praesentium modi', 'Praesentium-modi', 'default_img.jpg', NULL, 4182, 5, 1, 'Quis velit necessitatibus soluta quo omnis voluptates maiores quos. Voluptates sed quia nisi perferendis eos similique. Ipsam recusandae et ratione cum aspernatur. Quaerat at aspernatur est accusamus voluptatem voluptatem atque.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(34, 3, 'computer-accessories', 'Rerum voluptate iste', 'Rerum-voluptate-iste', 'default_img.jpg', NULL, 4597, 5, 2, 'Laboriosam aut consectetur expedita eveniet. Qui ea minus voluptatibus et laboriosam repellat et. Reiciendis in sed qui ea eum sunt. Sunt eius quis iure et optio sit.', '2020-10-12 21:44:01', '2020-10-12 21:48:27'),
(36, 7, 'pc', 'Culpa dolore', 'Culpa-dolore', 'default_img.jpg', NULL, 1776, 18, 3, 'Natus eligendi non corrupti quia. Inventore commodi sint omnis ut. Dicta aut animi voluptas dolores.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(38, 3, 'computer-accessories', 'Sit eos', 'Sit-eos', 'default_img.jpg', NULL, 3621, 22, 4, 'Est et quia ratione aut ullam. Veritatis velit aut cupiditate molestiae repellat voluptatibus. Dolores iste dolores ut minus porro autem consequatur. Minus repellendus veritatis et et vel.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(39, 10, 'tablet', 'Temporibus non in', 'Temporibus-non-in', 'default_img.jpg', NULL, 4405, 15, 4, 'Amet beatae voluptatem sit eos. Qui porro voluptatum unde impedit. Officia sed et ipsum.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(40, 3, 'tablet', 'Sit voluptas molestiae', 'Sit-voluptas-molestiae', 'default_img.jpg', NULL, 352, 8, 2, 'Vel ut quaerat earum quo. At eos corrupti aut repudiandae iure. Et suscipit alias optio qui atque assumenda beatae. Sint reiciendis blanditiis ex consequatur pariatur. Aut quasi mollitia fuga veritatis in ut autem.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(41, 3, 'computer-accessories', 'Sunt voluptas qui', 'Sunt-voluptas-qui', 'default_img.jpg', NULL, 2813, 20, 5, 'Dolor optio veniam repudiandae velit. Occaecati eaque ab aut facilis harum. Est esse aliquid et voluptatum fugiat nobis.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(42, 9, 'mobile-accessories', 'Veritatis a occaecati', 'Veritatis-a-occaecati', 'default_img.jpg', NULL, 3148, 6, 0, 'Qui quaerat quaerat ullam quisquam laboriosam. Reiciendis enim delectus eum. Animi est odio dignissimos modi ipsum amet asperiores. Itaque voluptas facilis omnis.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(43, 2, 'mobile', 'Sed et sequi', 'Sed-et-sequi', 'default_img.jpg', NULL, 223, 9, 4, 'Nobis a consequatur dolores et. Id qui odit beatae qui eveniet quod magni.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(44, 10, 'mobile-accessories', 'Inventore eligendi sequi', 'Inventore-eligendi-sequi', 'default_img.jpg', NULL, 3829, 25, 0, 'Nemo ipsa culpa qui sit culpa consequatur molestiae. Ad eum et et delectus fugit error ratione. Sunt sint sint beatae blanditiis accusamus.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(45, 1, 'pc', 'Tempore tenetur', 'Tempore-tenetur', 'default_img.jpg', NULL, 1429, 27, 5, 'Culpa iure sint quisquam pariatur molestiae quam. Maiores deleniti enim qui consequatur quo repellendus laborum. Placeat optio ea ex omnis neque. A ab ipsa debitis recusandae quo. Aut ratione molestias recusandae et.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(48, 9, 'tablet', 'Quidem rem dolor', 'Quidem-rem-dolor', 'default_img.jpg', NULL, 3642, 17, 1, 'Soluta occaecati magni debitis minima autem et neque. Corrupti suscipit est placeat molestias quia reiciendis. Dolorem minus officiis et nam nemo. Ea laboriosam consequatur voluptas odit velit repellat vel. Soluta repellat maxime sunt quia voluptatem quod.', '2020-10-12 21:44:01', '2020-10-12 21:48:28'),
(49, 10, 'computer-accessories', 'Repellat animi enim', 'Repellat-animi-enim', 'default_img.jpg', NULL, 4871, 34, 2, 'Perferendis id numquam architecto officia. Sint quis iste tenetur. Qui aut similique sapiente quo esse esse sit. Eos nesciunt aspernatur temporibus et nemo sit.', '2020-10-12 21:44:02', '2020-10-12 21:48:28'),
(52, 11, 'pc', 'Hope Daniel', 'Hope-Daniel', 'product_cover_1603103750_.jpg', 'Est quibusdam rem qu', 968, 50, 0, 'Tempora duis in non', '2020-10-19 07:31:27', NULL),
(54, 11, 'laptop', 'mac', 'mac', 'product_cover_1603104777_.jpg', 'Est dolore id liber', 436, 97, 0, 'Cillum deserunt cons', NULL, NULL),
(55, 11, 'laptop', 'Bertha Maynard', 'Bertha-Maynard', 'product_cover_1603104834_.jpg', 'Sint veniam dolores', 917, 67, 0, 'Rerum provident et', NULL, NULL),
(58, 11, 'laptop', 'sfsfdd', 'sfsfdd', 'product_related_1603109983.jpg', 'Quis iure dolores ma', 328, NULL, 0, 'Sit est possimus u', '2020-10-19 10:19:43', '2020-10-19 14:56:40'),
(59, 11, 'pc', 'lenovo ideapad', 'lenovo-ideapad', 'product_cover_1603226405.jpg', 'trutri6r', 9000, 90, 0, 'ykyrfkykryrkyr', '2020-10-20 18:40:05', NULL),
(60, 11, 'mobile', 'redmi', 'redmi', 'product_cover_1603307427.jpg', 'frgherger', 10000, 99, 0, 'redmi redmiredmiredmiredmiredmiredmiredmiredmiredmiredmi', '2020-10-21 17:10:27', NULL),
(61, 11, 'laptop', 'Tanek Moran', 'Tanek-Moran', 'product_cover_1603372266.jpg', 'Amet aut est natus', 234, 3, 0, 'Beatae voluptate com', '2020-10-22 11:11:06', NULL),
(62, 11, 'mobile', 'Norman Montgomery', 'Norman-Montgomery', 'product_cover_1603372355.jpg', 'Quibusdam beatae mol', 607, 57, 0, 'Omnis rerum voluptat', '2020-10-22 11:12:35', NULL),
(63, 11, 'computer-accessories', 'Isabella Snyder', 'Isabella-Snyder', 'product_cover_1603372381.jpg', 'Omnis non id rem in', 620, 58, 0, 'Qui tempora sunt mai', '2020-10-22 11:13:01', NULL),
(64, 11, 'pc', 'Carl Underwood', 'Carl-Underwood', 'product_cover_1603372455.jpg', 'Est modi blanditiis', 664, 75, 0, 'Corrupti irure ut s', '2020-10-22 11:14:15', NULL),
(65, 11, 'laptop', 'Zeph Mcintosh', 'Zeph-Mcintosh', 'product_cover_1603388364.png', 'Voluptatem Blanditi', 550, 65, 0, 'Quod sit aut quo ut', '2020-10-22 15:39:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_photos`
--

CREATE TABLE `product_photos` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_photos`
--

INSERT INTO `product_photos` (`id`, `product_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 52, 'product_related_1603103750_.jpg', '2020-10-19 08:35:50', '2020-10-19 08:35:50'),
(2, 52, 'product_related_1603103750_.jpg', '2020-10-19 08:35:51', '2020-10-19 08:35:51'),
(6, 54, 'product_related_1603104777_.jpg', '2020-10-19 08:52:58', '2020-10-19 08:52:58'),
(7, 54, 'product_related_1603104778_.jpg', '2020-10-19 08:52:58', '2020-10-19 08:52:58'),
(8, 54, 'product_related_1603104778_.jpg', '2020-10-19 08:52:58', '2020-10-19 08:52:58'),
(9, 55, 'product_related_1603104834_.jpg', '2020-10-19 08:53:55', '2020-10-19 08:53:55'),
(10, 55, 'product_related_1603104835_.jpg', '2020-10-19 08:53:55', '2020-10-19 08:53:55'),
(11, 55, 'product_related_1603104835_.jpg', '2020-10-19 08:53:55', '2020-10-19 08:53:55'),
(18, 58, 'product_related_01603109984.jpg', '2020-10-19 10:19:44', '2020-10-19 10:19:44'),
(21, 58, 'product_related_01603126538.png', '2020-10-19 14:55:39', '2020-10-19 14:55:39'),
(22, 58, 'product_related_11603126539.jpg', '2020-10-19 14:55:39', '2020-10-19 14:55:39'),
(23, 58, 'product_related_01603126600.jpg', '2020-10-19 14:56:40', '2020-10-19 14:56:40'),
(24, 59, 'product_related_01603226406.jpg', '2020-10-20 18:40:06', '2020-10-20 18:40:06'),
(25, 59, 'product_related_11603226406.png', '2020-10-20 18:40:07', '2020-10-20 18:40:07'),
(26, 59, 'product_related_21603226407.jpg', '2020-10-20 18:40:07', '2020-10-20 18:40:07'),
(27, 60, 'product_related_01603307427.jpg', '2020-10-21 17:10:27', '2020-10-21 17:10:27'),
(28, 60, 'product_related_11603307427.jpg', '2020-10-21 17:10:27', '2020-10-21 17:10:27'),
(29, 60, 'product_related_21603307427.jpg', '2020-10-21 17:10:27', '2020-10-21 17:10:27'),
(30, 60, 'product_related_31603307427.jpg', '2020-10-21 17:10:28', '2020-10-21 17:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stars` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `review`, `stars`, `created_at`, `updated_at`) VALUES
(1, 15, 7, 'Sint voluptate libero minima est. Occaecati mollitia est est sed molestias qui voluptas.', 1, '2020-10-12 21:44:04', '2020-10-12 21:44:04'),
(2, 19, 3, 'Et vitae necessitatibus explicabo ipsum. Neque a eligendi ipsa modi ad dolor magnam voluptatem. Deleniti voluptatum illo maxime aut. In et est commodi molestias ut adipisci.', 4, '2020-10-12 21:44:04', '2020-10-12 21:44:04'),
(4, 10, 9, 'Laudantium qui maiores optio iusto voluptas architecto temporibus. Qui vel molestiae dicta iusto officia. Adipisci vero maxime exercitationem ad facere qui omnis.', 0, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(7, 11, 4, 'Sunt voluptas soluta enim consequatur esse ea hic. Adipisci nesciunt dolorem qui blanditiis praesentium repudiandae odio. Sit consequatur quibusdam non sed id itaque et quo.', 4, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(8, 43, 2, 'Odio voluptas et molestias quaerat nulla doloremque. Maxime et et nemo sed minus tenetur. Quo et ipsum rerum praesentium aut commodi. Corporis quas deleniti debitis non ratione in.', 0, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(9, 40, 2, 'Et dolores dolor aut dolores modi non velit. Eveniet et qui et quo. Quia sequi aspernatur eum. Ea aut ut culpa.', 0, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(14, 15, 2, 'Eos aperiam quasi consequuntur sit saepe iure. Nulla deserunt esse molestiae error consectetur ab repudiandae et. Harum nostrum officiis nihil qui dolorum. Sed placeat et non nulla non aspernatur corporis.', 4, '2020-10-12 21:44:05', '2020-10-12 21:44:05'),
(18, 34, 2, 'Beatae debitis mollitia sapiente vero in quo aut. Dolore et quia molestiae quia voluptas ipsam natus. Sit fugiat vero aut facere.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(21, 41, 3, 'Vel reiciendis rem dolore nihil vero. Iusto recusandae cum ut debitis sit. Exercitationem est reiciendis rerum. Recusandae nostrum quis soluta neque.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(22, 15, 1, 'Debitis quo hic laborum est aut. Perferendis deserunt maxime voluptate sit sit saepe. Et veritatis nesciunt cumque provident optio iste.', 3, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(23, 33, 4, 'Velit rerum rerum assumenda rem in. Quo laboriosam ipsum est quidem. Distinctio quis nesciunt dolores expedita quaerat adipisci non.', 4, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(24, 29, 10, 'Quam ab voluptatem natus voluptatem. Voluptatem provident sint debitis at quam illum omnis. Sunt aut eum tempora rerum reprehenderit ipsa nam. Qui veritatis enim ut voluptates temporibus quas.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(25, 27, 2, 'Delectus adipisci voluptatem cumque optio incidunt numquam. Vero voluptas et ipsam accusamus quis omnis ex. Nostrum dolore cum ipsa iusto.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(26, 43, 10, 'Laboriosam magni quis quisquam dolor repudiandae similique. Asperiores voluptates eum molestiae dolor. Sit quos sit qui aut eum libero consectetur. Et sed dolor sed accusantium et.', 4, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(27, 1, 9, 'Placeat maiores cum incidunt. Iste qui sit tenetur quae enim voluptates itaque. Aut adipisci quis magnam sint.', 0, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(28, 30, 2, 'Aut fuga odio suscipit architecto fugiat itaque fugit assumenda. Qui exercitationem animi est placeat. Velit ipsa fugit eius. Sequi sunt qui placeat quas qui et molestias. Et veritatis pariatur qui omnis a autem.', 3, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(29, 25, 3, 'Ipsam omnis sit saepe fugit est unde ab. Dolore pariatur ipsam et numquam quia aliquid. Perspiciatis maxime voluptas maiores adipisci sapiente. Repudiandae eligendi aut cupiditate vel. Velit possimus provident voluptatum dicta error inventore.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(31, 36, 9, 'Quas ut et dolor omnis. Ad maxime rerum mollitia distinctio dicta sed pariatur omnis. A quidem voluptates vel sit omnis.', 3, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(32, 14, 2, 'Rerum rerum fugiat qui sit quia eaque. Qui et quae est quis. Cumque adipisci et enim reiciendis quis voluptas. Sunt nulla natus eos perferendis laborum totam consectetur saepe. Libero distinctio harum magnam et.', 1, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(33, 28, 3, 'Aperiam ducimus et architecto reiciendis natus aut iusto. Dolorum harum temporibus eum magni ex. Sequi alias voluptatem eum nihil nisi. Corporis consequatur rerum cum voluptatem ut et odit omnis. Consequatur sit cumque vero accusamus facere.', 4, '2020-10-12 21:44:06', '2020-10-12 21:44:06'),
(35, 21, 10, 'Nihil quos id dolor non dolorem. In dolorem aut ut ab.', 3, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(36, 11, 10, 'Dolor doloremque ratione ducimus sunt qui blanditiis corrupti. Quisquam maxime dolores ratione in illo. Qui sunt id iure.', 2, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(40, 27, 10, 'Et ducimus aperiam et dolor ullam quis aut. Nesciunt dolorem pariatur modi ut sed odit sed. Quas est quis veniam facilis quam enim non magni.', 4, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(42, 40, 1, 'Nemo nemo optio ex rerum dolore placeat. Accusamus quos ut quibusdam occaecati. Omnis ut dolor animi illo.', 5, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(44, 2, 10, 'Illo odio enim asperiores. Eos suscipit ullam dolor consectetur ipsa totam. Dolores exercitationem omnis exercitationem officia ut aspernatur tempora. Dolores iste aut est repellendus quibusdam ullam aliquam.', 2, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(45, 32, 10, 'Quia cum minima blanditiis odit dicta. Ut consequuntur occaecati odit eos autem. Dolor ducimus earum voluptatibus aspernatur dignissimos et non eos.', 1, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(50, 19, 1, 'Ut debitis iure minima perspiciatis esse nobis minus qui. Autem maxime accusamus tempora quam veritatis fuga accusamus. Excepturi aut aliquid sunt dolor iure.', 4, '2020-10-12 21:44:07', '2020-10-12 21:44:07'),
(55, 1, 3, 'Et nesciunt similique esse accusantium doloremque a eum. Ut saepe deserunt ut quia occaecati ut optio. Labore voluptas cupiditate at magnam aliquid ducimus commodi minima. Rerum nobis reiciendis ut a dignissimos occaecati.', 3, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(57, 25, 10, 'Vero laborum voluptate repellat omnis veritatis ut. Illo nihil omnis voluptas omnis assumenda nam laborum eum. Aut quis rerum veritatis sit quidem et.', 2, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(59, 17, 10, 'Impedit rerum consequatur aspernatur dolorem sunt ipsa. Natus omnis enim voluptatem in. Eveniet est minus asperiores praesentium nobis.', 3, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(61, 38, 1, 'Ab ea earum sapiente alias. Distinctio vel atque ipsum consectetur. Optio maxime nulla et quod. Autem repudiandae esse rerum id aut nostrum velit.', 3, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(62, 11, 2, 'Et eos quis aut id aut et reiciendis. Nam excepturi quaerat deleniti vitae aliquam cum. Voluptatem dolor quia nihil fuga qui aut.', 3, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(69, 27, 9, 'Vel ea numquam vel vitae a optio fugiat adipisci. Non placeat impedit itaque facilis facere. Ut accusamus eaque tenetur repudiandae magni excepturi.', 1, '2020-10-12 21:44:08', '2020-10-12 21:44:08'),
(71, 11, 10, 'Dolorem voluptates sint dolores ut et. Dolorem et quidem et aperiam accusamus id saepe. Explicabo ut porro praesentium voluptatem corporis amet. Dolorum vel quia deserunt corrupti at.', 5, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(72, 30, 2, 'Facilis autem nam culpa dolores perferendis inventore. Et aut voluptatum sunt vel et quia non.', 3, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(73, 21, 2, 'Atque nam nulla deserunt id quidem aut. Laborum voluptatem eum deserunt. Quo voluptate sint ea voluptatem. Quisquam autem ut explicabo vitae debitis nobis consequatur.', 4, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(74, 13, 7, 'Autem dolores minus ut quibusdam vel quis. Ad commodi est blanditiis fugiat. Nam repudiandae quo accusamus laudantium ut hic. Dolores dolorem quam eos et quibusdam consequatur delectus quisquam. Optio et ipsum dolorem maiores quia itaque omnis.', 4, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(77, 38, 4, 'Beatae perferendis perferendis veritatis cupiditate consequatur. Iusto blanditiis praesentium odit aut. Nemo rerum porro vitae officia nihil laborum consequatur. Voluptas maxime sit cumque inventore sed aut.', 2, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(78, 31, 3, 'Qui occaecati sed aut. Maiores voluptate accusantium corrupti voluptatem voluptas. Et corrupti aut est corrupti asperiores non sequi qui.', 2, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(79, 48, 4, 'Aut expedita autem dolor. Veniam perspiciatis dolor numquam eligendi et. Autem debitis molestiae quis aperiam qui iure rerum. Facere quae aspernatur nihil qui ut harum nisi.', 1, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(80, 19, 7, 'Illum neque voluptas et est nihil animi explicabo iste. Ipsum delectus est et iure. Sed aut nemo pariatur quasi. Tenetur autem facilis et exercitationem ea.', 5, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(81, 48, 7, 'Voluptate esse enim veritatis maiores officiis voluptate. Optio quam quo quos sint a rerum eum. Cupiditate est at nemo corporis.', 1, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(82, 29, 10, 'Veritatis mollitia quaerat qui et explicabo aut quia. Et et repudiandae possimus dolores accusantium velit illo. Modi omnis sunt architecto est. Dolores dolorum unde perspiciatis molestiae rerum et.', 4, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(83, 48, 2, 'Vel autem labore omnis praesentium consequatur rerum. Sit exercitationem enim voluptatibus qui quidem porro sit. Voluptate natus natus numquam mollitia non sed.', 1, '2020-10-12 21:44:09', '2020-10-12 21:44:09'),
(84, 30, 2, 'Quo ad et laboriosam sunt sunt aut vel. Libero doloribus quia quia. Odio magnam fugiat assumenda.', 2, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(86, 6, 9, 'Commodi sit in magni reprehenderit. Aut voluptas quas voluptas unde voluptas rerum. Voluptatum recusandae labore libero libero praesentium amet. Esse consectetur tenetur aliquam distinctio.', 5, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(88, 29, 10, 'Enim veniam quia veniam odio et. Dolorem iure odit non consequatur quia nemo. Error sed explicabo distinctio a veritatis.', 4, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(89, 21, 1, 'Sunt sed nobis quia rerum temporibus voluptate officiis sapiente. Aut quis officiis a distinctio ex velit. Et corporis sit aliquid nihil consequatur vitae dicta. Quidem et et voluptatibus vel sunt possimus.', 4, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(90, 21, 3, 'Deleniti maiores qui tempore sunt voluptas hic dolorem. Iure dolor reiciendis ducimus ea eum eos. Assumenda enim fugiat laborum minima.', 3, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(93, 38, 10, 'Suscipit ipsam sequi et suscipit et ex vero. Cupiditate qui magni cumque maiores. Sapiente repellat nulla ad id. Et temporibus eligendi inventore architecto deleniti saepe sunt.', 5, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(94, 43, 3, 'Ad et consequatur laudantium itaque velit. Eveniet eaque quam omnis quis eum eveniet expedita. Nisi aut vel cupiditate ut aperiam fugit consequatur.', 2, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(96, 10, 3, 'Expedita et illo et enim suscipit. Atque ipsa commodi explicabo libero voluptatem ut. Ut et ea quo id aut ab. Ut est consequatur enim asperiores nam et quam.', 3, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(97, 19, 1, 'Mollitia vel assumenda modi harum sint omnis quidem est. Perspiciatis consequatur quae sit esse tenetur modi minus. Reiciendis voluptatum ratione est blanditiis quis. Voluptatibus doloremque recusandae officia.', 3, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(98, 6, 10, 'Laboriosam quis earum tempore quos vitae cum. Est excepturi reiciendis suscipit cumque. Vero non rerum totam occaecati magnam molestias beatae voluptatibus. Quam sapiente laudantium non est et aperiam.', 0, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(100, 20, 9, 'Fugiat excepturi sapiente assumenda qui. Praesentium quasi molestias nemo totam eligendi tempore recusandae. Et voluptas explicabo nihil consequuntur.', 0, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(101, 6, 7, 'Eligendi qui ut quia distinctio. Sequi magnam eligendi tenetur. Voluptatibus sunt nostrum nostrum debitis.', 2, '2020-10-12 21:44:10', '2020-10-12 21:44:10'),
(102, 21, 4, 'Aut aperiam est consequatur eligendi dignissimos nam vel. Et rerum ex est numquam et molestiae ut quod. Sit iste ut voluptatem qui dolores architecto qui qui. Labore labore labore et dolorem necessitatibus quidem.', 4, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(103, 41, 1, 'Fugiat impedit amet iste amet. Delectus voluptatum non ipsum laborum incidunt eos consectetur. Repellendus et illo et ut dolor odio.', 5, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(106, 34, 1, 'Velit enim natus natus cupiditate animi. Corporis tempora est labore hic. Porro et aut qui consequuntur rerum tenetur. Dolores rerum dolorum soluta cum et odit maxime.', 1, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(111, 10, 9, 'Saepe aut voluptatem vel itaque aliquid. Omnis dolores nostrum accusamus ullam illum aliquam. Iure ipsum sapiente corporis qui voluptatem et quam minima. Dolorem et quibusdam debitis qui.', 0, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(112, 40, 10, 'Repellat sed non cum animi ratione voluptatum tempora. Ipsam explicabo ea reiciendis repellendus cumque placeat. Sit et ratione et dicta est voluptatem. Veniam quia dicta autem et magni.', 1, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(114, 8, 2, 'Qui eius ullam laborum culpa. Et autem adipisci mollitia error hic. Recusandae consequatur officia non.', 5, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(117, 25, 4, 'Quaerat possimus iure voluptatem nulla iusto aut. Magni enim vel pariatur enim aut.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(118, 28, 4, 'Numquam omnis perferendis omnis nihil ullam quo. Tempora velit aut iste eligendi doloremque. Occaecati assumenda eveniet sit perspiciatis blanditiis. Explicabo ut possimus ut sed explicabo voluptates.', 0, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(121, 32, 1, 'Qui ab sit fugit et. Aut optio rerum sit mollitia rerum id. Nostrum minima consequatur dolor vero cupiditate.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(122, 10, 4, 'Ducimus ipsam incidunt sit quam aut earum quisquam. Eum commodi est corrupti recusandae consectetur veritatis et. Eos quasi ut dolorem quos natus eius quibusdam.', 4, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(123, 40, 2, 'Quis non est quia consequatur ad laborum. Nulla sint doloribus voluptatem at. Iste aut perferendis itaque impedit quibusdam voluptatibus totam. Ex accusamus et impedit fugit velit eos.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(126, 5, 7, 'Ut voluptas sint cum nobis. Asperiores possimus sed soluta a esse totam eum sapiente. Explicabo suscipit ut non aut libero rerum. Explicabo voluptas totam veniam eum modi.', 3, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(127, 20, 9, 'Ab molestiae magnam amet aut. Ipsam ratione suscipit eum quis dolorem consequatur. Eum assumenda nam optio modi porro.', 0, '2020-10-12 21:44:11', '2020-10-12 21:44:11'),
(129, 48, 9, 'Cupiditate alias autem perferendis laborum. Quia pariatur nesciunt alias inventore. Aperiam enim quo harum provident reprehenderit quisquam accusamus.', 3, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(131, 32, 4, 'Atque quod dolorem quasi aut dolor aut. Rerum voluptatem dicta amet debitis ut voluptatem quas. Tempore minima ab non esse magni. Laudantium aperiam adipisci dolor et consequuntur odio. Quibusdam numquam molestias sed molestiae aut debitis.', 5, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(137, 13, 10, 'Neque esse provident quae qui. Eveniet nam veniam mollitia consequatur at eum recusandae sapiente. Consequatur aut veniam sunt architecto. Repudiandae unde voluptatem totam qui est delectus ut.', 5, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(140, 21, 9, 'Molestias aperiam quae dignissimos qui praesentium. Quo ipsa voluptas et. Ut et possimus quod commodi iure.', 1, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(141, 33, 7, 'Libero eos accusantium voluptatem eos dolorem occaecati enim. Doloremque rem omnis voluptatibus numquam asperiores quasi tempore. Modi numquam quibusdam unde.', 4, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(142, 17, 9, 'Tempora aut nisi in magni facilis. Vel illum facilis in tempore. Eaque possimus dolor neque consequatur neque fugit.', 5, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(143, 5, 1, 'Laborum non in minima consectetur cumque. Assumenda quidem quia sit temporibus qui doloremque voluptas officiis. Officiis dolores voluptas praesentium magnam minima repellat nihil. Et quidem officia hic mollitia. Repellat quas et aut sit.', 1, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(144, 13, 3, 'Excepturi dicta ad vitae sapiente molestiae non sapiente. Fugit eum est debitis repellat vel. A laudantium architecto nesciunt rem adipisci. Laboriosam magnam distinctio omnis rerum a est rem. Et nulla tempora qui rerum reiciendis dolorem.', 3, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(146, 27, 4, 'Autem praesentium unde voluptatum consectetur et. Velit voluptatem assumenda ratione aut. Expedita voluptates ut tempora tenetur debitis et repellendus. Non vel natus ducimus aut.', 2, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(147, 15, 2, 'Reiciendis culpa quis omnis assumenda consequatur voluptatum non. Sed suscipit impedit quia a similique. Ipsa accusantium sed consequuntur ex maiores rerum.', 4, '2020-10-12 21:44:12', '2020-10-12 21:44:12'),
(149, 39, 9, 'Occaecati doloremque qui cumque aliquam quas id. Minima voluptas aperiam omnis voluptate. Perspiciatis quis illo facilis dolore aut in sed.', 3, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(152, 2, 4, 'Debitis et rerum voluptatem fugiat nostrum minus eius tenetur. Necessitatibus molestiae velit dolore consequuntur accusantium. Sequi tenetur corrupti quidem reiciendis.', 4, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(154, 19, 7, 'Beatae est rerum corporis sapiente ducimus sunt voluptates. Corrupti excepturi assumenda ut non. Qui natus facere enim. Facere cum eos quia nihil rem iusto et ut. Tenetur provident alias id et.', 1, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(155, 32, 3, 'Debitis officia reiciendis nulla eius deleniti quae. Provident quia qui ad ipsum et ea magni omnis. Explicabo eligendi asperiores non eos voluptate sint. Est dicta aperiam ut adipisci velit.', 0, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(158, 48, 2, 'Voluptates dolor voluptatem accusamus fugit sunt tenetur quia vel. Doloribus maiores adipisci et optio sed itaque. Rerum cum ab odio ea est quis et.', 2, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(160, 6, 3, 'Itaque qui sit in. Quae nihil et cumque odit dolores rerum.', 3, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(162, 15, 2, 'Enim quibusdam ea quis rerum. Laudantium porro culpa molestias nisi ut est omnis. Ipsam dignissimos ut commodi veniam. Iusto nihil alias cumque autem ab sed eius sapiente.', 0, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(163, 10, 10, 'Vel nihil eum minus vel nihil culpa in. Et mollitia possimus iste neque quis quia.', 1, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(168, 10, 3, 'Reiciendis omnis omnis sapiente omnis ut. Repudiandae reiciendis necessitatibus dolor quasi aperiam. Ut est eum quos voluptatem eum autem sunt. Non ducimus nostrum ut itaque aut. Et mollitia non ipsum sed molestias consequatur sunt pariatur.', 5, '2020-10-12 21:44:13', '2020-10-12 21:44:13'),
(170, 20, 2, 'Nemo eaque dicta debitis hic. Accusamus incidunt enim et dolores voluptates id. Repellat labore voluptatum dolor sunt quibusdam minima. Cumque voluptatem qui blanditiis iusto ab.', 1, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(172, 1, 1, 'Voluptatem ipsum animi aliquid fugit exercitationem. Similique voluptatem et blanditiis ut nihil facere est. Voluptas incidunt excepturi asperiores consequatur. Saepe dolorem reprehenderit sit officiis eligendi amet rerum.', 4, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(176, 31, 4, 'Non maiores quo quasi vel quia. Animi sequi nam rerum cumque sunt et quod dolorem. Est nihil excepturi adipisci in enim. Vel et pariatur pariatur accusantium.', 5, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(179, 42, 4, 'Eveniet rerum nam cum quia porro. Non asperiores vel accusamus at. Sint qui autem inventore nobis eaque maxime pariatur. Placeat quo magni libero ea.', 1, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(180, 2, 10, 'Possimus vel accusamus modi corrupti. Sit sunt et velit porro. Doloremque vel occaecati dolorem sequi aut.', 4, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(182, 49, 4, 'Ut deserunt aut voluptas similique molestias ipsum. Quo reprehenderit ullam pariatur repellat. Debitis aut odit ratione delectus qui accusamus assumenda. Sint temporibus est odit delectus quidem.', 2, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(183, 45, 3, 'Ut vel sint enim incidunt alias. Tenetur fugit omnis quia eum hic sunt. Quia dolor et sunt assumenda. Doloribus tenetur ad quia nobis est laudantium ducimus.', 0, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(185, 5, 3, 'Ea enim earum quas sint. Asperiores unde error voluptatum ea voluptatem. Dolorum sunt dolores sed. Voluptates est ipsum voluptates cum blanditiis necessitatibus eum.', 2, '2020-10-12 21:44:14', '2020-10-12 21:44:14'),
(188, 33, 10, 'Voluptatum consequatur eius aut et nihil dolor. Laborum quidem cupiditate maxime. Dolorem sit cum qui error omnis qui.', 5, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(189, 30, 2, 'Sit quia dignissimos et exercitationem qui necessitatibus. Temporibus earum nulla inventore eveniet molestias. Laboriosam enim delectus distinctio quo et doloremque. Qui quasi unde doloribus eum.', 2, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(191, 33, 4, 'Recusandae sunt quam voluptatem. Modi fuga ex ea et rerum aliquid. Ab tempora animi veritatis dolor est vitae ab. Reprehenderit non enim non ut dolores voluptas harum.', 5, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(192, 38, 10, 'Est et in at eligendi. Voluptatem nostrum tempore voluptatem id. Ut nemo nihil cupiditate et perspiciatis.', 4, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(193, 28, 3, 'Id omnis et qui porro fugit. Voluptate voluptatum voluptate consequatur ut amet quibusdam qui. Ipsa eos autem voluptas voluptas quis officiis enim non. Ut alias nihil et tempora et nesciunt voluptas.', 1, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(195, 33, 10, 'Molestias sapiente modi non et aperiam quisquam. Vel deserunt sunt incidunt rerum nesciunt. Itaque placeat possimus quo dolore nulla saepe consectetur.', 1, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(196, 44, 1, 'Aut blanditiis culpa quia consequatur ut ut. Soluta perspiciatis omnis ut rem. Sit enim nostrum sint.', 5, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(197, 44, 10, 'Officia quisquam autem optio. Ipsum aut dolorem praesentium. Quaerat aliquam quo occaecati nulla dolores sint voluptatem. Est a ullam eos accusamus sunt.', 4, '2020-10-12 21:44:15', '2020-10-12 21:44:15'),
(202, 11, 9, 'Et suscipit nostrum deserunt voluptate tempora ut. Repudiandae rerum doloribus quia ullam quia saepe.', 1, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(203, 36, 9, 'Molestiae quo vel quisquam eligendi. Porro architecto eos dolorum consequatur officia et voluptatem quisquam. Voluptatem quidem est consequuntur illo omnis.', 1, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(207, 30, 9, 'Reiciendis esse optio minus. Nihil molestias facere labore sunt soluta laborum. Cupiditate omnis eligendi et omnis esse. Quis delectus in nesciunt laudantium magni.', 1, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(208, 34, 1, 'Ut sequi dolor numquam dignissimos nulla. Adipisci corporis quas laborum porro et molestiae. Dolor neque necessitatibus minima optio.', 3, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(210, 42, 1, 'Odio cumque nulla iste sit asperiores. Accusantium id maiores molestias impedit fugit qui.', 2, '2020-10-12 21:44:16', '2020-10-12 21:44:16'),
(214, 32, 1, 'Reprehenderit dolorem consectetur at facilis possimus ab expedita. Natus dolores rem est non dicta. Iste quis sed distinctio. Neque ullam dolor vel ipsum ut et veritatis esse.', 5, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(216, 49, 9, 'Eum quaerat quam voluptatem quis. Unde minus illo omnis rerum consequatur nobis qui omnis. Quibusdam voluptas sunt a nisi.', 2, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(218, 32, 2, 'Nihil aut quia a. Odio neque dicta iure sit tenetur sint. Nisi cumque officia aspernatur pariatur reprehenderit unde vel.', 1, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(220, 31, 10, 'Incidunt voluptatem temporibus enim qui. Asperiores ab esse tempore. Temporibus voluptatem et dolores assumenda maiores minus. Voluptatibus perspiciatis sunt ratione quo voluptatem nam. Ipsum error eos velit error magnam nobis sed.', 4, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(221, 11, 2, 'Voluptatem impedit omnis saepe veritatis qui cumque animi. Ratione aut vel qui alias rerum. Eum quis rem voluptates quod aut. Est excepturi quia ipsum totam non esse vero exercitationem.', 1, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(222, 11, 7, 'Omnis et et qui. Aliquam sequi est ut. Necessitatibus quaerat minus ut.', 4, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(223, 38, 9, 'Quo voluptas debitis a itaque odio. Facere numquam voluptates doloribus nihil qui qui rerum. Numquam et quisquam at culpa illum eius. Doloribus consequatur porro voluptas non non distinctio tempora ea.', 2, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(228, 15, 7, 'Ad quo voluptatem id repellendus ratione dignissimos. Eius numquam et quas nesciunt commodi. Et ratione et sit est qui corrupti sit.', 5, '2020-10-12 21:44:17', '2020-10-12 21:44:17'),
(237, 42, 9, 'Delectus eligendi eum sed. Velit sint iure maiores dolores. Dolorum rerum dolorum ea rerum.', 0, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(238, 25, 7, 'Possimus aliquid omnis unde suscipit culpa quisquam. Distinctio eum perspiciatis magni omnis voluptas. Et earum et occaecati quia.', 1, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(243, 34, 4, 'Expedita amet ipsum optio. Dolorum nisi praesentium voluptate et. Consequatur ullam nam impedit qui fugit. Magni voluptatem ipsa atque inventore facilis.', 5, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(244, 17, 10, 'Eum voluptas unde voluptatum impedit fugit ut. Non rerum delectus quis praesentium libero aut. Ea omnis voluptas quo nemo inventore sit.', 0, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(245, 19, 2, 'Unde tenetur a voluptas sapiente eligendi. Eaque enim sit est nesciunt. Facere sunt aut nemo non sed ut.', 0, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(250, 39, 7, 'Rerum tempora quibusdam maiores eius doloremque dolor. Aspernatur autem harum itaque voluptatem velit. Hic natus voluptatem et voluptate autem earum. Nesciunt ullam suscipit quam rem voluptatum quidem rerum voluptatem.', 5, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(252, 36, 7, 'Doloremque mollitia aut tempora unde. Sequi eius eos eos autem optio. Suscipit aut dolorem perferendis nesciunt.', 0, '2020-10-12 21:44:18', '2020-10-12 21:44:18'),
(253, 14, 10, 'Aut modi et ut ad ut quaerat aperiam. Numquam delectus deleniti perferendis omnis. Doloribus et inventore pariatur et dolore error.', 2, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(258, 36, 3, 'Saepe ut architecto perspiciatis aut voluptatem. Rerum excepturi rerum fugiat iure unde saepe. Animi voluptas deleniti qui enim. Assumenda similique dicta nisi. Dolor ut inventore porro et.', 0, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(259, 30, 3, 'Qui quia repellendus omnis voluptates. Rem possimus eveniet voluptatum et et inventore distinctio. Alias non nihil amet optio odit. Ab laboriosam animi ea suscipit.', 4, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(260, 48, 9, 'Ut eaque est doloremque suscipit consequatur asperiores quidem. Quos itaque dolor eius ducimus ducimus et. Autem laudantium voluptas excepturi ut et eligendi.', 5, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(261, 14, 9, 'Ex iusto voluptas dolorum molestiae sunt. Est tempora ullam et blanditiis repellendus accusantium dicta et. Rem exercitationem ut consequatur et. Sint illo ipsam vitae saepe non et nemo. Itaque nesciunt molestiae ratione.', 0, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(262, 48, 7, 'Voluptate voluptatem et est voluptatem aut sapiente quia. Tenetur illum commodi rerum laudantium temporibus quia. Non ab nisi nulla aut. Eius dolor nihil molestiae.', 1, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(264, 39, 1, 'Fuga et distinctio et repellat. Dolor doloremque et corporis eaque. Minus velit molestiae aliquid aspernatur atque cupiditate omnis. Consequuntur provident praesentium aliquam hic quaerat porro sequi. Quis necessitatibus ratione minus quia ut qui cumque consequatur.', 1, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(269, 32, 4, 'Veniam quia voluptatum pariatur tempora velit provident. Eaque doloremque natus sit perspiciatis. Accusamus et quas distinctio aut aut facilis.', 1, '2020-10-12 21:44:19', '2020-10-12 21:44:19'),
(273, 33, 9, 'Odio delectus et nulla. Est ipsa aut voluptas numquam. Est eligendi temporibus et temporibus enim.', 4, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(274, 11, 10, 'Eos aspernatur quo voluptas iure. Animi tenetur dignissimos error beatae. Dolor magnam explicabo rerum eos est ut. Minus doloremque magnam sapiente dolorem suscipit.', 3, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(276, 44, 1, 'Velit qui quam possimus voluptas rerum sunt temporibus et. Et quia eos sed cumque illum rerum. Voluptatibus officia ab ut rerum. Expedita suscipit sit est dolorum debitis.', 0, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(278, 40, 10, 'At soluta ullam ullam. Omnis est vero eligendi. Eaque dignissimos natus modi ipsam.', 1, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(280, 39, 3, 'Tenetur ut excepturi hic error quibusdam quos. Delectus quos repellendus atque doloribus. Tempore rem neque doloribus voluptates. Voluptatem ex quidem iusto vel esse.', 3, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(282, 40, 9, 'Iure laboriosam magni sed similique corporis minus quia corporis. Omnis ea dolor et et. Sit quia rerum doloribus quia sit sint est.', 0, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(283, 27, 7, 'Est rem voluptatum quae earum distinctio sequi sint vitae. Sint autem veritatis alias repudiandae numquam. Eligendi in eos velit eveniet voluptatibus modi.', 3, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(285, 32, 7, 'In voluptatem sapiente sed tenetur beatae. Blanditiis nihil repellendus et assumenda voluptatem et deserunt veniam. Sit odio suscipit odit sint reiciendis unde. Veniam veritatis iure et quam. Illum quibusdam corrupti minima.', 1, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(288, 45, 9, 'Hic voluptas aut qui pariatur. Odit numquam vel provident rem consequatur.', 2, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(290, 27, 10, 'Nisi possimus aut quasi quo occaecati suscipit id est. Eum suscipit dignissimos consequuntur voluptatem velit.', 0, '2020-10-12 21:44:20', '2020-10-12 21:44:20'),
(293, 2, 10, 'Et aut rerum non hic sapiente. Doloribus qui officia voluptatibus rerum rem atque magni. Quo voluptas debitis occaecati architecto nulla.', 3, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(294, 21, 2, 'Esse natus sed omnis voluptatem. Ut consequuntur et et laudantium. Facere facere eaque alias eaque quae cum. Est ut labore dicta voluptates.', 5, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(297, 5, 9, 'Aut qui blanditiis cumque aliquid labore sed. Voluptatibus iste repellendus ut qui rem vel iure. Cum laboriosam exercitationem amet quis voluptatem.', 0, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(298, 44, 2, 'Eligendi eum aut cum eos dolores cum. Facilis itaque facilis odio dolorem saepe officia. Tempore assumenda sit quidem sit perspiciatis consequatur. Animi eos quia voluptatem doloremque velit.', 1, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(307, 34, 2, 'Tempora distinctio facere vel at rerum. Sit tempora qui magnam perferendis consequatur dolorem quod blanditiis. Ullam in molestiae commodi ipsa.', 1, '2020-10-12 21:44:21', '2020-10-12 21:44:21'),
(314, 8, 7, 'Dolores vel labore sint tempora. Dolores hic tempore dolor quaerat tempore reiciendis voluptas debitis. Consequuntur aut non eum et sint est. Necessitatibus earum qui non tempore.', 4, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(317, 19, 1, 'Repellendus esse suscipit eligendi occaecati aut vel id. Nihil itaque excepturi excepturi enim accusamus blanditiis magni laborum. Sed non qui qui. Omnis illo quia numquam quisquam aperiam dolorem.', 0, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(318, 38, 4, 'Incidunt ut atque autem tenetur voluptas sequi atque. Numquam in eaque ut eveniet eligendi sit dolorum occaecati. Id id omnis dolorum dolores error in. Qui neque sit voluptates perferendis saepe.', 0, '2020-10-12 21:44:22', '2020-10-12 21:44:22'),
(328, 10, 9, 'Non quia ut fuga aut. Doloremque excepturi voluptates porro beatae sint sapiente iusto quibusdam. At aliquid aut animi sed dolores. Sed harum expedita quaerat cupiditate.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(329, 25, 4, 'Non assumenda ad odio adipisci omnis velit non. Quas maxime debitis harum ducimus sunt quos vero.', 1, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(330, 30, 2, 'Autem id dolorum temporibus vel. Ea maxime saepe officiis adipisci atque alias. Neque minima ipsum qui nemo voluptatem molestias doloribus.', 0, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(331, 27, 2, 'Error numquam mollitia ut illum commodi accusantium neque. Ut corrupti et veniam. A facere quibusdam soluta sunt.', 4, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(333, 25, 9, 'Quos temporibus aliquam aut error molestiae architecto in. Et qui vero animi non dicta. Ut assumenda quidem quas consequatur. Illo ab modi adipisci recusandae quia.', 2, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(334, 11, 4, 'Veniam recusandae sed debitis earum ab ut. Laboriosam reiciendis veniam qui. Sit voluptate odio labore dolor voluptate soluta consequatur.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(335, 30, 2, 'Hic nobis voluptatem dignissimos odio. At aut beatae facere aliquam omnis.', 1, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(336, 29, 10, 'Deleniti molestias reiciendis vero dolor rem enim. Sed accusamus animi molestias natus labore est voluptatem. Excepturi alias quibusdam quidem itaque molestiae non. Rerum itaque deserunt id error.', 5, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(337, 30, 4, 'Fugit numquam ullam ut tenetur atque enim quasi. Sint ipsum quia corrupti et expedita. Impedit recusandae nostrum quam et delectus molestiae.', 2, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(338, 34, 7, 'Perferendis aut id voluptatibus molestiae cupiditate. Id incidunt sunt sit nesciunt officia. Amet et ut minima aliquid quo debitis quis.', 3, '2020-10-12 21:44:23', '2020-10-12 21:44:23'),
(347, 33, 7, 'Id dolor aspernatur est quod deserunt voluptatem dolor a. Vitae quia voluptas nihil sit maxime unde. Eligendi et aut doloribus suscipit et corporis.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(350, 2, 9, 'Et occaecati similique pariatur nulla. Sit voluptate qui aut nisi sint harum. Rerum qui aut unde quia.', 3, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(351, 27, 3, 'Ipsum ut nulla architecto. Eos sint et molestias blanditiis. Et numquam sed distinctio minima autem incidunt voluptas. Harum rerum voluptas id impedit et.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(352, 43, 1, 'Vel doloremque et aut. Dolores velit incidunt sapiente nulla. Qui rem beatae consectetur et ipsum et fugit.', 2, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(358, 34, 9, 'In non voluptatem ducimus ut possimus. Iusto voluptatem qui suscipit. Explicabo tempore adipisci consequatur minus eveniet dolorem blanditiis et. Repellendus id sit fuga ea reiciendis molestiae soluta.', 2, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(359, 2, 3, 'Molestiae nam consequatur veritatis voluptates. Ut assumenda in consectetur ea distinctio cumque ipsa. Perferendis quasi qui illo nisi veritatis porro. Possimus consectetur distinctio omnis consectetur.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(360, 40, 9, 'Et minus doloremque ducimus eveniet non labore alias. Placeat aliquid non rerum officiis blanditiis dolor voluptatem. Et est architecto nisi animi nemo. Ad qui doloribus illum.', 4, '2020-10-12 21:44:24', '2020-10-12 21:44:24'),
(361, 30, 7, 'Sequi nostrum deleniti ut magni veritatis. Dolor dolor velit autem possimus. Vel omnis ex neque atque.', 3, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(365, 25, 10, 'Omnis velit enim eveniet. Recusandae corrupti in sed nam quasi. Qui quisquam rem repudiandae aut et.', 0, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(367, 43, 2, 'Tenetur rem rerum molestiae magnam cum consequatur. Et corporis qui minus suscipit necessitatibus deserunt. Consequatur rerum animi est et nihil quod. Aperiam aut consequatur repellendus laboriosam sit modi quam.', 2, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(373, 38, 4, 'Maxime quae veniam est aut quae perspiciatis excepturi. Enim voluptatem reprehenderit sit beatae laudantium placeat consequatur. Molestiae suscipit ut rerum libero quo architecto. Quibusdam dicta inventore illum molestiae nisi exercitationem. Deleniti inventore qui sed veritatis temporibus.', 3, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(374, 41, 4, 'Velit non quo veritatis rem et natus. Aperiam id necessitatibus animi in amet. Non ipsam rerum nihil corrupti libero temporibus. Repudiandae officiis ab blanditiis expedita.', 1, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(375, 36, 4, 'Quia impedit tenetur quasi ut. Aut dolorem commodi ea aut sequi ab velit. Est vitae tempore dolorum vitae ut. At quaerat velit quo et nisi sint.', 5, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(377, 17, 7, 'Totam enim non ut consectetur quo. Voluptatem illum laboriosam sit ducimus aliquam quo rem. Nulla consequatur qui fugiat non similique sed nihil quo.', 5, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(379, 40, 9, 'Et debitis adipisci soluta possimus et. Ipsam blanditiis distinctio sint in blanditiis. Sit consequatur iste quae saepe doloremque quae dicta.', 3, '2020-10-12 21:44:25', '2020-10-12 21:44:25'),
(380, 31, 3, 'Et alias voluptatem est veniam sed voluptate. Tenetur repellat facilis voluptate velit in repudiandae repellat. Accusantium repellendus cupiditate corporis. Et sed sed ipsam et ut laboriosam voluptatum. Odio quas aliquid corrupti veniam ea consequatur et sint.', 0, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(381, 6, 1, 'Porro quam amet veritatis accusantium vitae. Aut in error voluptas quidem. Mollitia incidunt explicabo vitae. Doloremque asperiores aut in ut quo quo.', 0, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(382, 41, 9, 'Suscipit rerum reiciendis quos et quia. Magnam perspiciatis quas tenetur voluptatem. In voluptas voluptas aspernatur laborum placeat libero modi. Omnis eveniet quo nulla omnis sit sapiente.', 2, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(384, 32, 2, 'Nihil et blanditiis voluptatem tenetur et maiores nisi. Assumenda eum rem aliquam consequatur et possimus dolores. Sit aut molestiae facilis hic soluta.', 0, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(385, 10, 10, 'Ipsam nostrum et officia blanditiis praesentium optio temporibus ad. Qui sit est est aliquid quia aut eum ad. Consequatur commodi delectus accusamus sunt.', 3, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(386, 38, 2, 'Harum et eos dignissimos iusto nemo consequatur quam. Tempore sit iusto at et illum possimus nemo. Error pariatur id sed consequuntur recusandae.', 1, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(387, 2, 7, 'Ea consequatur dolor dicta ullam voluptas. Cupiditate voluptatibus sunt amet pariatur officia reprehenderit. Natus soluta inventore velit omnis est sunt laborum. Tempora dignissimos esse ab molestiae accusamus sit assumenda.', 5, '2020-10-12 21:44:26', '2020-10-12 21:44:26'),
(395, 11, 10, 'Ut eos et necessitatibus. Eum eaque saepe similique minus ea architecto omnis. Ut dolorem reiciendis autem a.', 3, '2020-10-12 21:44:27', '2020-10-12 21:44:27'),
(397, 17, 7, 'Quo porro alias necessitatibus perspiciatis doloribus explicabo. Dolor reiciendis mollitia eos esse aspernatur sint molestias ea.', 0, '2020-10-12 21:44:27', '2020-10-12 21:44:27'),
(399, 21, 9, 'Error debitis similique sed ullam. Cumque officia possimus distinctio. Vitae quae deserunt a illum ipsa exercitationem aut. Eum hic facere quis sunt esse.', 3, '2020-10-12 21:44:27', '2020-10-12 21:44:27'),
(400, 29, 9, 'Possimus illum rerum quae amet aliquam necessitatibus. Consequatur est ea corrupti mollitia quis inventore assumenda. Enim ut laborum unde quaerat. Ab minus aut nesciunt ea. Voluptatem sint natus sequi quia facere incidunt.', 3, '2020-10-12 21:44:27', '2020-10-12 21:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint NOT NULL,
  `city_id` int NOT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2020-10-16 06:30:52', '2020-10-16 06:30:52'),
(2, 'vendor', 'web', '2020-10-16 06:31:13', '2020-10-16 06:31:13'),
(3, 'customer', 'web', '2020-10-16 06:31:31', '2020-10-16 06:31:31');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_img.jpg',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `gender`, `email`, `photo`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Agustin Boyle', 'male', 'agustin44@example.net', 'default_img.jpg', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4BXfXMgsqr', '2020-10-12 21:42:23', '2020-10-12 21:42:23'),
(2, 'Birdie Boyer', 'male', 'constantin.mclaughlin@example.org', 'default_img.jpg', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tR2yISFULo', '2020-10-12 21:42:23', '2020-10-12 21:42:23'),
(3, 'Willa Moen', 'male', 'kiel.schinner@example.com', 'default_img.jpg', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JWWFg2WTZx', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(4, 'Laurine Maggio', 'male', 'hosea85@example.com', 'default_img.jpg', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8ZGQssbZmU', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(7, 'Esta Johns', 'male', 'yryan@example.org', 'default_img.jpg', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zWXlqav5Q9', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(9, 'Miss Brooke Weimann', 'male', 'adrienne.abshire@example.net', 'default_img.jpg', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '26D5USQ8kW', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(10, 'Ms. Ivory Leannon', 'male', 'lorena00@example.com', 'default_img.jpg', '2020-10-12 21:42:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ItfcfGs7ON', '2020-10-12 21:42:24', '2020-10-12 21:42:24'),
(11, 'Mohamed Ashraf', 'male', 'messr93@gmail.com', 'default_img.jpg', NULL, '$2y$10$K9CJ14yJlXWg.qgWg3m3Re41QkHTg9GMr2Ij14Y.eLB3KYP18.sre', 'eu2iFoZHemU8vfF1hzWhmnPvsOHBKI6oXpohEzCdXriUiVGo2qYKEDltNYCi', '2020-10-13 02:50:57', '2020-10-17 09:50:59'),
(12, '3o3o', 'male', '3o3@3o3o.com', 'default_img.jpg', NULL, '$2y$10$8ZFJlyQsnKTQQq5hbqqIwepto65SzEk6DZZybJm75ofPRBULgziea', 'OnE4uj4YzHYlRFZ7A5H2WqhrBSGB0m3T722phV4tVZVGI2A16A4Ec8rS6Oof', '2020-10-17 13:32:42', '2020-10-17 13:36:29');

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
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

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
-- Indexes for table `product_photos`
--
ALTER TABLE `product_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_photos_product_id_foreign` (`product_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `product_photos`
--
ALTER TABLE `product_photos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Constraints for table `product_photos`
--
ALTER TABLE `product_photos`
  ADD CONSTRAINT `product_photos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
