-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2023 at 10:06 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital online booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_appointments`
--

CREATE TABLE `wp_bookly_appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `staff_any` tinyint(1) NOT NULL DEFAULT 0,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `custom_service_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `custom_service_price` decimal(10,2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `extras_duration` int(11) NOT NULL DEFAULT 0,
  `internal_note` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `google_event_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `google_event_etag` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `outlook_event_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `outlook_event_change_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `outlook_event_series_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `online_meeting_provider` enum('zoom','google_meet','jitsi','bbb') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `online_meeting_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `online_meeting_data` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_from` enum('bookly','google','outlook') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'bookly',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_categories`
--

CREATE TABLE `wp_bookly_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attachment_id` int(10) UNSIGNED DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 9999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_customers`
--

CREATE TABLE `wp_bookly_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `wp_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `facebook_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `street_number` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `additional_address` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `info_fields` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `stripe_account` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_customer_appointments`
--

CREATE TABLE `wp_bookly_customer_appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `series_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `number_of_persons` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `units` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `notes` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `extras` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `extras_multiply_nop` tinyint(1) NOT NULL DEFAULT 1,
  `custom_fields` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'approved',
  `status_changed_at` datetime DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `time_zone_offset` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `rating_comment` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `collaborative_service_id` int(10) UNSIGNED DEFAULT NULL,
  `collaborative_token` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `compound_service_id` int(10) UNSIGNED DEFAULT NULL,
  `compound_token` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_from` enum('frontend','backend') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'frontend',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_holidays`
--

CREATE TABLE `wp_bookly_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `repeat_event` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_log`
--

CREATE TABLE `wp_bookly_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` enum('create','update','delete','error') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `target_id` int(10) UNSIGNED DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_mailing_campaigns`
--

CREATE TABLE `wp_bookly_mailing_campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `mailing_list_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `state` enum('pending','in-progress','completed','canceled') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'pending',
  `send_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_mailing_lists`
--

CREATE TABLE `wp_bookly_mailing_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_mailing_list_recipients`
--

CREATE TABLE `wp_bookly_mailing_list_recipients` (
  `id` int(10) UNSIGNED NOT NULL,
  `mailing_list_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_mailing_queue`
--

CREATE TABLE `wp_bookly_mailing_queue` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sent` tinyint(1) DEFAULT 0,
  `campaign_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_news`
--

CREATE TABLE `wp_bookly_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `news_id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `media_type` enum('image','youtube') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'image',
  `media_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `button_url` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_bookly_news`
--

INSERT INTO `wp_bookly_news` (`id`, `news_id`, `title`, `media_type`, `media_url`, `text`, `button_url`, `button_text`, `seen`, `updated_at`, `created_at`) VALUES
(1, 71, 'How to set up new Bookly Services booking form', 'youtube', 'https://www.youtube.com/embed/Qvp35ANbkUQ', '<p><span>One of the main benefits of the Bookly Services form is that you can organise services using categories and display them to your clients in a catalog view. Learn how to create your custom design and modify existing elements.&nbsp;For more details, visit our <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212178149-Booking-Form-Look-Feel\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212178149-Booking-Form-Look-Feel\">help center</a> and check other <a href=\"https://www.youtube.com/c/Bookly/videos\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a> to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=Qvp35ANbkUQ&list=PLuLhoBV-rlAagLXlILG_1KgjVSaMUju8i', 'Watch on Youtube', 0, '2022-10-20 06:28:15', '2022-10-20 06:28:15'),
(2, 70, 'New version release. See what’s new in Bookly PRO 5.4.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/10/Bookly-PRO-5.4-banner-756.jpg', '<p>We track requests for new capabilities and keep working on the new functionality so that you can get more with Bookly every day! With this update, we release new features that meet the most popular requirements and help you manage your booking system easier and more effectively.</p>', 'https://www.booking-wp-plugin.com/bookly-pro-v5-4/', 'Read more', 0, '2022-10-10 11:31:59', '2022-10-10 11:31:59'),
(3, 69, 'New video: How to upload files in Bookly', 'youtube', 'https://www.youtube.com/embed/-ONIAAzIbmM', '<p><span>This video tutorial is about the file uploading feature in Bookly.&nbsp;</span><span>With the Bookly Files (Add-on), you can let your clients attach files related to the appointment right in the booking form.&nbsp;Uploaded documents will be stored at the appointment details.&nbsp;For more details, visit our&nbsp;<a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360000373133\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360000373133\"><span class=\"s1\">help center</span></a>&nbsp;and check other&nbsp;<a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\"><span class=\"s1\">video tutorials</span></a>&nbsp;to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=-ONIAAzIbmM&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-09-06 14:20:10', '2022-09-06 14:20:10'),
(4, 68, 'New version release. See what’s new in Bookly PRO 5.3.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/08/Bookly-PRO-5.3-banner-756.jpg', '<p><span>With this update, we release major&nbsp;</span>changes in the Appearance section<span>, the ability to&nbsp;</span>create several designs of your booking forms<span>,&nbsp;</span>payments in the new Bookly Search form<span>, and more. Also, as usual, new version includes&nbsp;general enhancements and bug fixes.</span></p>', 'https://www.booking-wp-plugin.com/bookly-pro-v5-3/', 'Read more', 0, '2022-08-25 13:00:11', '2022-08-25 13:00:11'),
(5, 67, 'New video: How to book identical appointments in a row', 'youtube', 'https://www.youtube.com/embed/xPsOXHMrly8', '<p>With the Bookly Multiply Appointments (Add-on), your clients can book back-to-back sessions of the same service.&nbsp;This way, customers can change the default appointment duration by selecting the quantity of similar services they’d like to get in a row.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/210138469-Multiply-Appointments-Add-on\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/210138469-Multiply-Appointments-Add-on\" target=\"_blank\" rel=\"noopener\">help center</a> and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a> to learn the basics and get the most out of Bookly.</p>', 'https://www.youtube.com/watch?v=xPsOXHMrly8&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-08-05 08:52:41', '2022-08-05 08:52:41'),
(6, 66, 'New version release. See what’s new in Bookly PRO 5.0.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/07/Bookly-PRO-5.0-banner-756.jpg', '<p>We continue to develop new features and make improvements in Bookly for a better experience and more flexibility. Today’s update brings a new appearance of the booking form, the ability to book packages in the Bookly search form, new Diagnostics section in the Bookly menu, and more.</p>', 'https://www.booking-wp-plugin.com/bookly-pro-v5-0/', 'Read more', 0, '2022-07-27 12:05:35', '2022-07-27 12:05:35'),
(7, 65, ' What’s the difference between Compound Services (Add-on) & Collaborative Services (Add-on)', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/07/difference-between-compound-addon-and-collaborative-addon-banner-756.jpg', '<p><span>Add-ons for Bookly have been created to add more advanced functionality to the default configuration of your Bookly PRO. If you have doubts about which extension is best for you, here’s a detailed comparison of the Compound Services (Add-on) and Collaborative Services (Add-on) for Bookly.</span></p>', 'https://www.booking-wp-plugin.com/whats-difference-compound-services-add-collaborative-services-add/', 'Read more', 0, '2022-07-12 10:24:47', '2022-07-12 10:24:47'),
(8, 64, 'New video: How to let clients rate your services', 'youtube', 'https://www.youtube.com/embed/k-iNqs4nBLY', '<p><span>With the Bookly Ratings (Add-on), you can gather customer feedback after each appointment and display staff members’ rating in a booking form. Learn how to quickly set up and use this feature.&nbsp;For more details, visit our <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360001695713\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360001695713\">help center</a> and check other <a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a> to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=k-iNqs4nBLY&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-06-28 12:56:54', '2022-06-28 12:56:54'),
(9, 63, 'New video: How to create tasks in Bookly', 'youtube', 'https://www.youtube.com/embed/fT-J4Limf2Q', '<p>This video is about creating unscheduled appointments in Bookly. With the Bookly Tasks (Add-on), you can create and manage an unlimited number of tasks or bookings that have no date and time yet. For more details, visit our&nbsp;<a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360013214654-Skip-time-selection-Tasks-Add-on-\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360013214654-Skip-time-selection-Tasks-Add-on-\"><span class=\"s1\">help center</span></a>&nbsp;and check other&nbsp;<a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\"><span class=\"s1\">video tutorials</span></a>&nbsp;to learn the basics and get the most out of Bookly.</p>', 'https://www.youtube.com/watch?v=fT-J4Limf2Q&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-06-17 14:55:12', '2022-06-17 14:55:12'),
(10, 62, 'New version release. See what’s new in Bookly PRO 4.9.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/06/Bookly-PRO-4.9-banner-756.jpg', '<p>This update brings a new product in Bookly Cloud – <strong>Cloud Cron</strong>, integration with BigBlueButton – virtual classroom software, customization of ICS files, read-only access for calendar in Staff Cabinet, new trigger in Zapier, improvements in the Files (Add-on), and more.</p>', 'https://www.booking-wp-plugin.com/bookly-pro-v4-9/', 'Read more', 0, '2022-06-13 11:14:55', '2022-06-13 11:14:55'),
(11, 61, 'New video: How to add online meeting URL to Bookly appointment', 'youtube', 'https://www.youtube.com/embed/KXpgB25Vs60', '<p>With Bookly, you get built-in integrations with the most popular software for online meetings: Zoom, Google Meet, and Jitsi. Whichever app you choose, it will generate unique video meeting links for each appointment created via Bookly.&nbsp;For more details, visit our <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360013355499\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360013355499\">help center</a> and check other <a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a> to learn the basics and get the most out of Bookly.</p>', 'https://www.youtube.com/watch?v=KXpgB25Vs60&list=PLuLhoBV-rlAagLXlILG_1KgjVSaMUju8i', 'Watch on Youtube', 0, '2022-06-06 17:10:12', '2022-06-06 17:10:12'),
(12, 60, 'New video: How to set up and use Bookly Compound Services (Add-on)', 'youtube', 'https://www.youtube.com/embed/iIJcQ8fT5BI', '<p>Learn how to combine existing services and spare time to make one complex appointment. Your clients can book such services as regular appointments, while Bookly adds reservations to each staff member’s schedule separately. For more details, visit our <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360001642033-Compound-Services-Add-on\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360001642033-Compound-Services-Add-on\">help center</a> and check other <a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a> to learn the basics and get the most out of Bookly.</p>', 'https://www.youtube.com/watch?v=iIJcQ8fT5BI&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-05-24 09:39:45', '2022-05-24 09:39:45'),
(13, 59, 'New video: How to make chain bookings', 'youtube', 'https://www.youtube.com/embed/yGyzwKR9ktg', '<p>With the Chain Appointments (Add-on) for Bookly, your clients will be able to&nbsp;book several services in one booking session. Such appointments will be scheduled sequentially.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/210316865-Chain-Appointments-Add-on\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/210316865-Chain-Appointments-Add-on\" target=\"_blank\" rel=\"noopener\">help center</a> and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a> to learn the basics and get the most out of Bookly.</p>', 'https://www.youtube.com/watch?v=yGyzwKR9ktg&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-05-16 12:12:22', '2022-05-16 12:12:22'),
(14, 58, 'New version release. See what’s new in Bookly PRO 4.8.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/05/Bookly-PRO-4.8-banner-756.jpg', '<p>Bookly is making ongoing updates to improve your user experience and implement the most popular feature requests. Today’s update introduces the beta version of a new booking form, creation of WooCommerce orders for backend bookings, customization of the QR codes description, and more.</p>', 'https://www.booking-wp-plugin.com/bookly-pro-v4-8/', 'Read more', 0, '2022-05-12 15:35:28', '2022-05-12 15:35:28'),
(15, 57, 'Upcoming System Maintenance', 'image', 'https://images.booking-wp-plugin.com/main/blog/Upcoming-system-maintenance.jpg', '<p class=\"p1\">We would like to inform you that on Sunday-Monday night of <b>2022 May 09 from 00:00 (midnight) to 04:00 CET</b>, the SMS service will be temporarily unavailable to users in some regions or countries (Australia, Europe, Africa, Asia, South America). This time will be used to implement important upgrades and performance optimization.</p><p class=\"p1\">If you have any scheduled text messages during this time, please take this into consideration. We appreciate your patience and understanding!</p>', 'https://support.booking-wp-plugin.com/hc/en-us/articles/212411289-Set-Up-Text-Messages-SMS-', 'Help Center', 0, '2022-05-05 07:47:35', '2022-05-05 07:47:35'),
(16, 56, 'New video: How to create customer groups', 'youtube', 'https://www.youtube.com/embed/pNOayasDJXI', '<p>Bookly Customer Groups (Add-on) enables you to create and manage groups of clients for different purposes. You can set certain limitations, assign special prices, offer promotions to particular customers, and more.&nbsp;For more details, visit our <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360000201873-Customer-Groups-Add-on\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360000201873-Customer-Groups-Add-on\">help center</a> and check other <a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a> to learn the basics and get the most out of Bookly.</p>', 'https://www.youtube.com/watch?v=pNOayasDJXI&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-05-05 07:40:52', '2022-05-05 07:40:52'),
(17, 55, 'All you need to know about automatic discounts in Bookly', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/04/756x384.jpg', '<p>Coupon codes, automatic or conditional discounts, and special rates can be used during certain seasons, promotions, or at any time you wish in order to increase customers’ loyalty. Let’s see how a wide range of Bookly features can help you meet various requirements and encourage your clients to book more through your appointment booking form.</p>', 'https://www.booking-wp-plugin.com/automatic-discounts-bookly/', 'Read more', 0, '2022-04-28 10:33:53', '2022-04-28 10:33:53'),
(18, 54, 'New video: How to sync Bookly PRO with Google Calendar', 'youtube', 'https://www.youtube.com/embed/3swwpWJ7_-s', '<p>With Google Calendar and Bookly Pro, you can manage your staff workload and bookings with maximum efficiency. Learn how to set up the connection and enable synchronization of all appointments created in Bookly with the employee\'s personal calendar.&nbsp;For more details, visit our <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/203572552-Google-Calendar-Sync\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/203572552-Google-Calendar-Sync\">help center</a> and check other <a href=\"https://www.youtube.com/c/Bookly/videos\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a> to learn the basics and get the most out of Bookly.</p>', 'https://www.youtube.com/watch?v=3swwpWJ7_-s&list=PLuLhoBV-rlAagLXlILG_1KgjVSaMUju8i', 'Watch on Youtube', 0, '2022-04-25 16:05:42', '2022-04-25 16:05:42'),
(19, 53, 'New video: How to set flexible prices', 'youtube', 'https://www.youtube.com/embed/WfSbsoi06V8', '<p>Learn how to tweak the price for your services&nbsp;<span>on selected days of the week during&nbsp;cold or hot hours of the day. Dynamic pricing is available with the <strong>Special Hours (Add-on)</strong> for Bookly.&nbsp;For more details, visit our <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/213524185-Dynamic-Pricing-Special-Hours-Add-On-\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/213524185-Dynamic-Pricing-Special-Hours-Add-On-\">help center</a> and check other <a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a> to learn the basics and get the most out of Bookly.</span></p>', 'https://youtu.be/WfSbsoi06V8&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-04-19 08:42:45', '2022-04-19 08:42:45'),
(20, 52, 'New version release. See what’s new in Bookly PRO 4.7.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/04/Bookly-PRO-4.7-banner-756.jpg', '<p><span>Bookly rolls out a new option available for extending your active support period, the ability to create custom fields for backend entries, automatic update of the appointment status once it’s over, visible service price for appointments created via the Bookly admin panel, and more.</span></p>', 'https://www.booking-wp-plugin.com/bookly-pro-v4-7/', 'Read more', 0, '2022-04-07 11:27:12', '2022-04-07 11:27:12'),
(21, 51, 'New video: How to add service locations in Bookly', 'youtube', 'https://www.youtube.com/embed/KRlVIPE9xOA', '<p>With the Bookly Locations (Add-on),&nbsp;you can associate staff members with different locations, so your clients will be able to choose the place for their appointment before they schedule date and time.&nbsp;For more details, visit our <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/210229885\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/210229885\">help center</a> and check other <a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a> to learn the basics and get the most out of Bookly.</p>', 'https://www.youtube.com/watch?v=KRlVIPE9xOA&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-03-31 13:26:43', '2022-03-31 13:26:43'),
(22, 50, 'New video: How to create and manage promo codes in Bookly', 'youtube', 'https://www.youtube.com/embed/luOElg-mnNU', '<p>Bookly Coupons (Add-on) allows you to offer discounts for your services and attract more clients. This video describes how to quickly set up coupons in Bookly.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/115003939373\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/115003939373\" target=\"_blank\" rel=\"noopener\">help center</a> and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a> to learn the basics and get the most out of Bookly.</p>', 'https://www.youtube.com/watch?v=luOElg-mnNU&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-03-24 12:27:27', '2022-03-24 12:27:27'),
(23, 49, 'New video: How to create time-flexible services', 'youtube', 'https://www.youtube.com/embed/jYKG0eGvWJ0', '<p><span>Custom Duration (Add-on) for Bookly allows you to create services with flexible duration. On the booking page, your clients can choose the length of the appointment from the predefined options, and the price will be adjusted respectively.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360005082294-Services-with-flexible-duration-Custom-Duration-Add-on-\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360005082294-Services-with-flexible-duration-Custom-Duration-Add-on-\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a>&nbsp;to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=jYKG0eGvWJ0&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK?utm_source=bookly_admin&utm_medium=news', 'Watch on Youtube', 0, '2022-02-17 09:41:40', '2022-02-17 09:41:40'),
(24, 48, 'New version release. See what’s new in Bookly PRO 4.6.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/02/Bookly-PRO-4.6-banner-756.jpg', '<p><span>Bookly’s new update introduces QR codes, refunds for payments made via Stripe, separate payments for recurring appointments, alert counter for new appointments, default values in custom fields, ability to attach payment to the package, and more.</span></p>', 'https://www.booking-wp-plugin.com/bookly-pro-v4-6/?utm_source=bookly_admin&utm_medium=news', 'Read more', 0, '2022-02-15 16:13:28', '2022-02-15 16:13:28'),
(25, 47, 'New video: How to accept deposit payments', 'youtube', 'https://www.youtube.com/embed/ewK3byklkK0', '<p><span>Bookly Deposit Payments (Add-on)&nbsp;allows you to set up a minimum amount that customers should pay at the time of booking. A deposit&nbsp;is set individually for each staff member and each service.&nbsp;For more details, visit our </span><a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212234945-Deposit-Payments-Add-on\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212234945-Deposit-Payments-Add-on\">help center</a>&nbsp;<span>and check other </span><a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a>&nbsp;<span>to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=ewK3byklkK0&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-02-10 10:00:07', '2022-02-10 10:00:07'),
(26, 46, 'How to limit daily bookings', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/02/how-to-limit-daily-bookings-in-bookly-banner-756.jpg', '<p><span>Regardless of the staff members’ working schedule configured in Bookly, you may want to limit the number of appointments that your customers can schedule via your online booking page. Here we’ll describe which Bookly features you can use to allow only a certain amount of bookings during the staff working day.</span></p>', 'https://www.booking-wp-plugin.com/limit-daily-bookings/', 'Read more', 0, '2022-02-08 09:27:33', '2022-02-08 09:27:33'),
(27, 45, 'New video: How to add special days to staff schedule', 'youtube', 'https://www.youtube.com/embed/gi5eULm5-64', '<p><span>This video tutorial is about working schedule of your employees and changing regular timetable&nbsp;on particular days during the year.&nbsp;For more details, visit our </span><a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212817929-Extra-Long-Short-Days-Special-Days-Add-on-\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212817929-Extra-Long-Short-Days-Special-Days-Add-on-\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;<span>and check other </span><a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a>&nbsp;<span>to learn the basics and get the most out of Bookly.</span></p>', 'https://youtu.be/gi5eULm5-64&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-02-03 08:46:00', '2022-02-03 08:46:00'),
(28, 44, 'How to get started with Bookly SMS mailing campaigns', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/01/how-to-get-started-with-bookly-sms-campaigns-banner-756.jpg', '<p><span>Undoubtedly, the easiest and quickest way to reach your clients is by SMS. Bookly’s</span><span>&nbsp;</span><span>SMS service</span><span>&nbsp;</span><span>is already used by thousands of businesses for sending booking details confirmations, appointment reminders, and follow-ups. Now you can also take advantage of the</span><span>&nbsp;</span><span>automated SMS marketing campaigns</span><span>&nbsp;</span><span>that are configured and scheduled right in the Bookly admin area.</span></p>', 'https://www.booking-wp-plugin.com/get-started-bookly-sms-mailing-campaigns/', 'Read more', 0, '2022-02-01 08:58:09', '2022-02-01 08:58:09'),
(29, 43, 'New video: How to create recurring appointments', 'youtube', 'https://www.youtube.com/embed/tfUmuNrYrn8', '<p><span>Learn how to set up and create recurring appointments in Bookly. This feature allows your clients to make multiple bookings that repeat at regular intervals, so they can schedule the whole series at once.&nbsp;For more details, visit our </span><a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/115001442665-Recurring-Appointments-Add-on\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/115001442665-Recurring-Appointments-Add-on\">help center</a>&nbsp;<span>and check other </span><a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a>&nbsp;<span>to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=tfUmuNrYrn8&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-01-27 14:08:11', '2022-01-27 14:08:11'),
(30, 42, 'How to accept payments with WooCommerce', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/01/how-to-accept-payments-with-woocommerce-banner-756.jpg', '<p><span>If some payment gateway is not available in Bookly yet, you can have access to other payment options through WooCommerce – the world’s most popular e-commerce plugin for WordPress.&nbsp;Bookly PRO seamlessly integrates with WooCommerce allowing you to sell services as products.&nbsp;This article describes how to quickly set up the connection between two plugins.</span></p>', 'https://www.booking-wp-plugin.com/accept-payments-woocommerce/', 'Read more', 0, '2022-01-25 10:36:59', '2022-01-25 10:36:59'),
(31, 41, 'New video: How to book several appointments at once', 'youtube', 'https://www.youtube.com/embed/miYLCPCEYIg', '<p><span>Encourage your customers to book more on your website! This video explains how to set up the Bookly Cart (Add-on) and let your clients order a number of bookings in one session.&nbsp;For more details, visit our </span><a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212969945-Cart-Add-on\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212969945-Cart-Add-on\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;<span>and check other </span><a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a>&nbsp;<span>to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=miYLCPCEYIg&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-01-20 09:42:21', '2022-01-20 09:42:21'),
(32, 40, 'How to add online meeting URL to any Bookly appointment', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/01/add-online-meeting-url-to-your-Bookly-appointment-756.jpg', '<p><span>Nowadays, more and more companies embrace a remote approach in their operations. With Bookly, you get built-in integrations with the most popular software for online meetings: Zoom, Google Meet, and Jitsi. Whichever app you choose, it will automatically generate unique video meeting links for every appointment created via Bookly.</span></p>', 'https://www.booking-wp-plugin.com/add-online-meeting-url-bookly-appointment/', 'Read more', 0, '2022-01-18 08:35:40', '2022-01-18 08:35:40'),
(33, 39, 'New video: How to add extras to your services', 'youtube', 'https://www.youtube.com/embed/z_B7hyjBxqI', '<p><span>Extras are additional items that your customers can book along with the services. These may be </span><span>special tools, products, or resources for performing a service, or extra time if you set their duration.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/207647799-Extra-Products-Treatments-Service-Extras-Add-on-\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/207647799-Extra-Products-Treatments-Service-Extras-Add-on-\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a>&nbsp;to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=z_B7hyjBxqI&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-01-13 10:13:57', '2022-01-13 10:13:57'),
(34, 38, 'How to set specific booking days and times for a service', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/01/set-specific-booking-days-and-times-for-service-banner-756.jpg', '<p><span>Some services may be available on a seasonal basis, during specific hours within a day, or on certain days only.&nbsp;</span><span>Bookly allows you to adjust the service availability without affecting the regular timetable of your staff.&nbsp;</span><span>From this article, you will learn how to set up a custom schedule for a service to make it bookable only on special days and times.</span></p>', 'https://www.booking-wp-plugin.com/set-specific-booking-days-times-service/', 'Read more', 0, '2022-01-11 08:22:14', '2022-01-11 08:22:07'),
(35, 37, 'New video: How to set up Staff Cabinet (Add-on) for Bookly', 'youtube', 'https://www.youtube.com/embed/awHddbbNOaw', '<p><span>Personal Staff Cabinet for your employees enables them to view and manage the list of bookings, personal details, and schedules on the front end of your website. This video describes how to install and use it.&nbsp;For more details, visit our </span><a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/115003349989\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/115003349989\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;<span>and check other </span><a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a>&nbsp;<span>to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=awHddbbNOaw&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2022-01-06 12:10:24', '2022-01-06 12:08:42'),
(36, 36, 'How to create a separate booking page for each staff member', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2022/01/how-to-create-separate-booking-page-for-staff-member-banner-756.jpg', '<p><span>If you want to invite your customers to an appointment with a certain staff member, you may want to create a custom booking page that includes staff details, featured services, information about special offers, etc. This article explains how to set up a personalized online booking form for your employee and provide your customers with a unique booking link.</span></p>', 'https://www.booking-wp-plugin.com/create-separate-booking-page/', 'Read more', 0, '2022-01-04 09:32:50', '2022-01-04 09:32:50'),
(37, 35, 'New video: How to limit the service availability', 'youtube', 'https://www.youtube.com/embed/8EEf0HbZwi0', '<p><span>Learn how to limit the hours during the day when the service can be booked, and which options you have when both Service Schedule (Add-on) and Special Days (Add-on) are installed and activated.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/213850385-Services-Available-at-Limited-Hours-Service-Schedule-Add-on-\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/213850385-Services-Available-at-Limited-Hours-Service-Schedule-Add-on-\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a>&nbsp;to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=8EEf0HbZwi0&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2021-12-30 15:25:12', '2021-12-30 10:32:17'),
(38, 34, 'New version release. See what’s new in Bookly PRO 4.5.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/12/Bookly-PRO-4.5-banner-756.jpg', '<p><span>The end of the year brings new features that we’re very excited to share with you! We want you to have a great experience using Bookly items, so the new release, as usual, includes some of the most requested improvements, general enhancements, and bug fixes.</span></p>', 'https://www.booking-wp-plugin.com/bookly-pro-v4-5/', 'Read more', 0, '2021-12-27 08:50:24', '2021-12-27 08:50:24'),
(39, 33, 'New video: How to accept group bookings', 'youtube', 'https://www.youtube.com/embed/Cmb1sxPFIMY', '<p><span>With the Bookly Group Booking (Add-on) you can use a capacity option, so your customers will be able to specify the number of persons they’d like to book for. Learn how to determine&nbsp;individual settings for each&nbsp;service and employee separately.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360000259594-Group-Booking-Add-on\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/360000259594-Group-Booking-Add-on\">help center</a>&nbsp;and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a>&nbsp;to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=Cmb1sxPFIMY&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2021-12-23 10:28:27', '2021-12-23 10:28:27'),
(40, 32, 'How to book appointments longer than 1 day', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/12/how-to-book-appointments-longer-than-one-day-banner-756.jpg', '<p><span>Some companies provide services that last throughout the day or even take several days, such as all-day conferences, weekend educational courses, or multi-day guided tours. Depending on the specific type of business, there are several options for setting up and managing such appointments via Bookly.</span></p>', 'https://www.booking-wp-plugin.com/book-appointments-longer-1-day/', 'Read more', 0, '2021-12-21 08:41:51', '2021-12-21 08:41:51'),
(41, 31, 'New video: How to extend client\'s profile in Bookly', 'youtube', 'https://www.youtube.com/embed/LvV2JDZV0uc', '<p><span>This video explains how to add custom data to the client’s profile with the Bookly Customer Information (Add-on). All customer-related information will always be available for you with a couple of clicks in the Customers section.&nbsp;For more details, visit our&nbsp;<a href=\"https://support.booking-wp-plugin.com/hc/en-us/sections/202869125-Manage-Clients\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/sections/202869125-Manage-Clients\">help center</a>&nbsp;and&nbsp;check other&nbsp;<a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a>&nbsp;to learn the basics and get the most out of Bookly.</span></p>', 'https://youtu.be/LvV2JDZV0uc&list=PLuLhoBV-rlAagLXlILG_1KgjVSaMUju8i', 'Watch on Youtube', 0, '2021-12-16 11:23:12', '2021-12-16 11:23:12'),
(42, 30, 'Top 5 automations to use in Bookly', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/12/Top-five-automations-to-use-in-Bookly-banner-756.jpg', '<p><span>Bookly is known to be the most feature-rich online booking and scheduling plugin in the market.&nbsp;In this post, we’ll provide an overview of the top 5 Bookly automations that will help you to manage your administrative workload with ease and improve your efficiency.</span></p>', 'https://www.booking-wp-plugin.com/top-5-automations-use-bookly/', 'Read more', 0, '2021-12-14 08:03:44', '2021-12-14 08:03:44'),
(43, 29, 'Discontinued support for Internet Explorer 11', 'image', 'https://images.booking-wp-plugin.com/main/blog/Internet_Explorer_discontinued_support.jpg', '<p><span>The Internet Explorer (IE) 11 desktop application </span><strong>will go out of support&nbsp;</strong><span>starting June 15, 2022. Bootstrap framework used for Bookly interface elements in the admin panel, </span><a href=\"https://blog.getbootstrap.com/2021/05/05/bootstrap-5/#browser-support\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://blog.getbootstrap.com/2021/05/05/bootstrap-5/#browser-support\">stopped supporting IE since version 5.0</a>&nbsp;<span>and </span><a href=\"https://wordpress.org/news/2021/05/dropping-support-for-internet-explorer-11/\" data-mce-href=\"https://wordpress.org/news/2021/05/dropping-support-for-internet-explorer-11/\">WordPress no longer supports IE 11 starting from version 5.8</a><span>. If you are currently using IE 11, it is strongly recommended that you switch to a more modern browser.</span></p>', 'https://blogs.windows.com/windowsexperience/2021/05/19/the-future-of-internet-explorer-on-windows-10-is-in-microsoft-edge/', 'Read more', 0, '2021-12-13 07:36:02', '2021-12-13 07:36:02'),
(44, 28, 'New video: How to manage customer base in Bookly', 'youtube', 'https://www.youtube.com/embed/K53xCEIo8NQ', '<p><span>With Bookly you get an unlimited, sortable and searchable customer list. But that’s not all. Learn how&nbsp;</span><span>Bookly allows you to effortlessly manage your customer base. For more details, visit our </span><a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/sections/202869125-Manage-Clients\" href=\"https://support.booking-wp-plugin.com/hc/en-us/sections/202869125-Manage-Clients\" target=\"_blank\" rel=\"noopener\">help center</a><span>&nbsp;and&nbsp;check other </span><a href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\" data-mce-href=\"https://www.youtube.com/c/Bookly/videos\">video tutorials</a>&nbsp;<span>to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=K53xCEIo8NQ&list=PLuLhoBV-rlAbu0MMy7yG8KeysVAEdBOcc', 'Watch on Youtube', 0, '2021-12-09 09:28:31', '2021-12-09 09:28:31'),
(45, 27, 'What’s the difference between Multiply Appointments (Add-on) & Custom Duration (Add-on)', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/12/difference-between-multiply-appointments-addon-and-custom-duration-addon-banner-756.jpg', '<p><span>Add-ons for Bookly have been created to add more advanced functionality to the default configuration of your Bookly PRO. If you have doubts about which extension is best for you, here’s a detailed comparison of the Multiply Appointments (Add-on) and Custom Duration (Add-on) for Bookly.</span></p>', 'https://www.booking-wp-plugin.com/whats-difference-multiply-appointments-add-custom-duration-add/', 'Read more', 0, '2021-12-07 09:19:54', '2021-12-07 09:19:54'),
(46, 26, 'New video: How to receive and manage online payments', 'youtube', 'https://www.youtube.com/embed/5WaXF4AeG-A', '<p><span>There are&nbsp;more than </span><strong>10 payment gateways&nbsp;</strong><span>which can be integrated with Bookly PRO to help drive more customers from the booking plugin right to your door. Learn how to quickly enable a desired online payment option in Bookly settings. For more details, visit our&nbsp;</span><a href=\"https://support.booking-wp-plugin.com/hc/en-us/sections/202811029-Pricing-Payment\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/sections/202811029-Pricing-Payment\" target=\"_blank\" rel=\"noopener\">help center</a><span>.</span></p>', 'https://www.youtube.com/watch?v=5WaXF4AeG-A&list=PLuLhoBV-rlAagLXlILG_1KgjVSaMUju8i', 'Watch on Youtube', 0, '2021-12-02 09:08:52', '2021-12-02 09:08:52'),
(47, 25, ' How to never miss an appointment', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/11/how-to-never-miss-an-appointment-with-Bookly-756.jpg', '<p><span>The last thing any business owner or service provider would want is to miss an appointment with a client. No matter how long is your booking list, Bookly will help you to efficiently control your company workload. With these recommendations, you will have no chance to forget or miss a scheduled meeting.</span></p>', 'https://www.booking-wp-plugin.com/never-miss-appointment-bookly/', 'Read more', 0, '2021-11-30 08:06:35', '2021-11-30 08:06:35'),
(48, 24, 'New video: How to set up and use custom fields in Bookly', 'youtube', 'https://www.youtube.com/embed/yRqrXj83eoY', '<p><span>This video explains how</span><span>&nbsp;to add your own custom questions to the booking form with the <strong>Bookly Custom Fields (Add-on)</strong>.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/115003963514-Custom-Fields-add-on\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/115003963514-Custom-Fields-add-on\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a>&nbsp;to learn the basics and get the most out of Bookly.</span></p>', 'https://youtu.be/yRqrXj83eoY', 'Watch on Youtube', 0, '2021-11-26 08:21:57', '2021-11-26 08:21:57'),
(49, 23, 'Introducing Bookly Mailchimp (Add-on)', 'image', 'https://images.booking-wp-plugin.com/main/products/Bookly-Mailchimp-integration.jpg', '<p><span>We are happy to announce our new integration with&nbsp;</span><strong>Mailchimp&nbsp;</strong><span>– one of the most popular and flexible email marketing platforms that you can use for scheduling and </span><strong>automating your email campaigns</strong><span>. Once connected, you\'ll be able to&nbsp;automatically export client\'s contact information to your mailing list after an appointment is created via Bookly.</span></p>', 'https://codecanyon.net/item/bookly-mailchimp-addon/34925755?ref=ladela', 'Learn more', 0, '2021-11-24 10:29:57', '2021-11-24 10:29:57'),
(50, 22, 'New version release. See what’s new in Bookly PRO 4.4.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/11/Bookly-PRO-release-4.4-756.jpg', '<p><span>Bookly is continually getting better to provide you with the most helpful features for your business. This update brings most-requested features, general improvements, and fixes to ensure that Bookly is working at its best.&nbsp;Check out the list of capabilities included in&nbsp;</span><strong>Bookly PRO version 4.4</strong><span>.</span></p>', 'https://www.booking-wp-plugin.com/bookly-pro-v4-4/', 'Read more', 0, '2021-11-22 12:25:15', '2021-11-22 12:25:15'),
(51, 21, 'New video: How to manage appointments in Bookly', 'youtube', 'https://www.youtube.com/embed/D7jPxQXngGM', '<p><span>Dealing with an unlimited number of customer reservations from Bookly admin panel is very simple. This video describes how to view and manage your company workload effectively. For more details, visit our&nbsp;<a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212973145-Keep-Track-and-Edit-Appointments\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212973145-Keep-Track-and-Edit-Appointments\" target=\"_blank\" rel=\"noopener\">help center</a>.</span></p>', 'https://www.youtube.com/watch?v=D7jPxQXngGM', 'Watch on Youtube', 0, '2021-11-19 09:49:41', '2021-11-19 09:49:41'),
(52, 20, 'Appointment cancellation by staff – 3 options', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/11/Appointment-cancellation-by-staff-3-options-banner-756.jpg', '<p><span>Whatever the reason, there are situations when your staff member cannot make an appointment and has no choice but to cancel a scheduled visit. This article describes a few different ways for your employees to cancel an appointment via Bookly.</span></p>', 'https://www.booking-wp-plugin.com/appointment-cancellation-staff-3-options/', 'Read more', 0, '2021-11-17 09:42:50', '2021-11-17 09:42:50'),
(53, 19, 'New video: How to give online access to bookings for clients', 'youtube', 'https://www.youtube.com/embed/bQf_oayrPaM', '<p><span>This video will show you how to let your customers view and edit bookings online&nbsp;</span><span>directly on your website.&nbsp;For more details, visit our&nbsp;<a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212455529-Online-Access-to-Bookings-for-Clients\" href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212455529-Online-Access-to-Bookings-for-Clients\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a>&nbsp;to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=bQf_oayrPaM&list=PLuLhoBV-rlAZpUnQgHJkMBx1rCvQGQ6cK', 'Watch on Youtube', 0, '2021-11-12 09:28:51', '2021-11-12 09:28:51'),
(54, 18, 'How to use resources in bookings', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/11/how-to-use-resources-in-bookings-banner-756.jpg', '<p><span>Do you provide services that require some rooms, equipment, or things during the appointment?&nbsp;With Bookly features, you can create bookable resources.&nbsp;This article explains how to add resources to your bookings and have full control over their availability.</span></p>', 'https://www.booking-wp-plugin.com/use-resources-bookings/', 'Read more', 0, '2021-11-11 10:25:09', '2021-11-11 10:25:09'),
(55, 17, 'New video: How to set up and send automated Email Notifications in Bookly', 'youtube', 'https://www.youtube.com/embed/AqXiN73sGbc', '<p><span>A quick video tutorial about creating personalized email notifications for your customers and staff members right from Bookly admin panel.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/sections/202868045-Email-Text-Message-Notifications\" href=\"https://support.booking-wp-plugin.com/hc/en-us/sections/202868045-Email-Text-Message-Notifications\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;and check other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">videos</a>&nbsp;to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=AqXiN73sGbc&list=PLuLhoBV-rlAagLXlILG_1KgjVSaMUju8i', 'Watch on Youtube', 0, '2021-11-04 10:24:37', '2021-11-04 10:24:37'),
(56, 16, 'How to block a customer from making an appointment', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/11/block-customer-from-making-appointment-banner-756.jpg', '<p>In some cases, you may want to restrict clients from making multiple appointments or even block someone from all future bookings. Bookly features will help you prevent unwanted reservations from problematic customers and have more control over who can book your services online.</p>', 'https://www.booking-wp-plugin.com/block-customer-making-appointment/', 'Read more', 0, '2021-11-02 10:27:09', '2021-11-02 10:27:09'),
(57, 15, 'New video: Bookly PRO initial setup', 'youtube', 'https://www.youtube.com/embed/OgsQ8CM3Gq0', '<p><span>The initial steps you should take to quickly start using Bookly: create your first service, a staff member, and add the Bookly booking form on your website. For further setup, we recommend you to check&nbsp;other <a data-mce-href=\"https://www.youtube.com/c/Bookly/videos\" href=\"https://www.youtube.com/c/Bookly/videos\" target=\"_blank\" rel=\"noopener\">video tutorials</a>&nbsp;about Bookly WordPress appointment plugin and visit our <a href=\"https://support.booking-wp-plugin.com/hc/en-us\" data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us\" target=\"_blank\" rel=\"noopener\">help center</a>.</span></p>', 'https://www.youtube.com/watch?v=OgsQ8CM3Gq0&list=PLuLhoBV-rlAagLXlILG_1KgjVSaMUju8i', 'Watch on Youtube', 0, '2021-10-28 08:32:07', '2021-10-28 08:32:07'),
(58, 14, ' What’s the difference between Custom Fields (Add-on) & Customer Information (Add-on)', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/10/difference-between-custom-fields-addon-and-customer-information-addon-banner.jpg', '<p><span>Add-ons for Bookly have been created to add more advanced functionality to the default configuration of your Bookly PRO. If you have doubts about which extension is best for you, here’s a quick overview of the Custom Fields (Add-on) and Customer Information (Add-on) for Bookly.</span></p>', 'https://www.booking-wp-plugin.com/whats-difference-custom-fields-add-customer-information-add/', 'Read more', 0, '2021-10-26 07:21:39', '2021-10-26 07:21:39'),
(59, 13, 'New video: General Settings in Bookly PRO', 'youtube', 'https://www.youtube.com/embed/qbxOU5OOjcc', '<p><span>This video will walk you through the main Bookly PRO settings and options which you have to set up before publishing the booking form on your website.&nbsp;For more details, visit our <a data-mce-href=\"https://support.booking-wp-plugin.com/hc/en-us/categories/200390551-Documentation\" href=\"https://support.booking-wp-plugin.com/hc/en-us/categories/200390551-Documentation\" target=\"_blank\" rel=\"noopener\">help center</a>&nbsp;and check other video tutorials to learn the basics and get the most out of Bookly.</span></p>', 'https://www.youtube.com/watch?v=qbxOU5OOjcc', 'Watch on Youtube', 0, '2021-10-21 08:56:39', '2021-10-21 08:56:39');
INSERT INTO `wp_bookly_news` (`id`, `news_id`, `title`, `media_type`, `media_url`, `text`, `button_url`, `button_text`, `seen`, `updated_at`, `created_at`) VALUES
(60, 12, 'New version release. See what’s new in Bookly PRO 4.3.', 'image', 'https://www.booking-wp-plugin.com/wp-content/uploads/2021/10/Bookly-PRO-4.3-release.jpg', '<p><span>With every new version, we release new features that will definitely improve your Bookly experience. Thank you for sharing your suggestions with us – we love helping you and your business grow and succeed!&nbsp;Here’s the list of the most important updates included in <strong>Bookly PRO version 4.3</strong>.</span></p>', 'https://www.booking-wp-plugin.com/bookly-pro-v4-3/', 'Read more', 0, '2021-10-18 08:22:17', '2021-10-18 08:22:17');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_notifications`
--

CREATE TABLE `wp_bookly_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `gateway` enum('email','sms') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'email',
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `to_staff` tinyint(1) NOT NULL DEFAULT 0,
  `to_customer` tinyint(1) NOT NULL DEFAULT 0,
  `to_admin` tinyint(1) NOT NULL DEFAULT 0,
  `to_custom` tinyint(1) NOT NULL DEFAULT 0,
  `custom_recipients` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attach_ics` tinyint(1) NOT NULL DEFAULT 0,
  `attach_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `settings` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_bookly_notifications`
--

INSERT INTO `wp_bookly_notifications` (`id`, `gateway`, `type`, `active`, `name`, `subject`, `message`, `to_staff`, `to_customer`, `to_admin`, `to_custom`, `custom_recipients`, `attach_ics`, `attach_invoice`, `settings`) VALUES
(1, 'email', 'new_booking', 1, 'Notification to customer about approved appointment', 'Your appointment information', 'Dear {client_name}.\n\nThis is a confirmation that you have booked {service_name}.\n\nWe are waiting you at {company_address} on {appointment_date} at {appointment_time}.\n\nThank you for choosing our company.\n\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"approved\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(2, 'email', 'new_booking', 1, 'Notification to staff member about approved appointment', 'New booking information', 'Hello.\n\nYou have a new booking.\n\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"approved\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(3, 'email', 'ca_status_changed', 1, 'Notification to customer about cancelled appointment', 'Booking cancellation', 'Dear {client_name}.\n\nYou have cancelled your booking of {service_name} on {appointment_date} at {appointment_time}.\n\nThank you for choosing our company.\n\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"cancelled\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(4, 'email', 'ca_status_changed', 1, 'Notification to staff member about cancelled appointment', 'Booking cancellation', 'Hello.\n\nThe following booking has been cancelled.\n\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"cancelled\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(5, 'email', 'ca_status_changed', 1, 'Notification to customer about rejected appointment', 'Booking rejection', 'Dear {client_name}.\n\nYour booking of {service_name} on {appointment_date} at {appointment_time} has been rejected.\n\nReason: {cancellation_reason}\n\nThank you for choosing our company.\n\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"rejected\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(6, 'email', 'ca_status_changed', 1, 'Notification to staff member about rejected appointment', 'Booking rejection', 'Hello.\n\nThe following booking has been rejected.\n\nReason: {cancellation_reason}\n\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"rejected\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(7, 'sms', 'new_booking', 1, 'Notification to customer about approved appointment', '', 'Dear {client_name}.\nThis is a confirmation that you have booked {service_name}.\nWe are waiting you at {company_address} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"approved\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(8, 'sms', 'new_booking', 1, 'Notification to staff member about approved appointment', '', 'Hello.\nYou have a new booking.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"approved\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(9, 'sms', 'ca_status_changed', 1, 'Notification to customer about cancelled appointment', '', 'Dear {client_name}.\nYou have cancelled your booking of {service_name} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"cancelled\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(10, 'sms', 'ca_status_changed', 1, 'Notification to staff member about cancelled appointment', '', 'Hello.\nThe following booking has been cancelled.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"cancelled\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(11, 'sms', 'ca_status_changed', 1, 'Notification to customer about rejected appointment', '', 'Dear {client_name}.\nYour booking of {service_name} on {appointment_date} at {appointment_time} has been rejected.\nReason: {cancellation_reason}\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"rejected\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(12, 'sms', 'ca_status_changed', 1, 'Notification to staff member about rejected appointment', '', 'Hello.\nThe following booking has been rejected.\nReason: {cancellation_reason}\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"rejected\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(13, 'sms', 'appointment_reminder', 0, 'Evening reminder to customer about next day appointment (requires cron setup)', '', 'Dear {client_name}.\nWe would like to remind you that you have booked {service_name} tomorrow at {appointment_time}. We are waiting for you at {company_address}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"any\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":1,\"perform\":\"before\",\"at_hour\":18,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":-24}'),
(14, 'sms', 'appointment_reminder', 0, 'Follow-up message in the same day after appointment (requires cron setup)', '', 'Dear {client_name}.\nThank you for choosing {company_name}. We hope you were satisfied with your {service_name}.\nThank you and we look forward to seeing you again soon.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"any\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":21,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(15, 'sms', 'staff_day_agenda', 0, 'Evening notification with the next day agenda to staff member (requires cron setup)', '', 'Hello.\nYour agenda for tomorrow is:\n{next_day_agenda}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"any\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":18,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":-24}'),
(16, 'email', 'verify_email', 1, 'Notification to customer with verification code', 'Bookly verification code', '{verification_code}', 0, 1, 0, 0, NULL, 0, 0, '[]'),
(17, 'sms', 'verify_phone', 1, 'Notification to customer with verification code', '', '{verification_code}', 0, 1, 0, 0, NULL, 0, 0, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_orders`
--

CREATE TABLE `wp_bookly_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_payments`
--

CREATE TABLE `wp_bookly_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` enum('appointments','packages') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'appointments',
  `coupon_id` int(10) UNSIGNED DEFAULT NULL,
  `gift_card_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('local','free','paypal','authorize_net','stripe','2checkout','payu_biz','payu_latam','payson','mollie','woocommerce','cloud_stripe','square','gift_card') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'local',
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_type` enum('in_full','deposit') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'in_full',
  `gateway_price_correction` decimal(10,2) DEFAULT 0.00,
  `status` enum('pending','completed','rejected','refunded') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'completed',
  `token` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ref_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_schedule_item_breaks`
--

CREATE TABLE `wp_bookly_schedule_item_breaks` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_schedule_item_id` int(10) UNSIGNED NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_sent_notifications`
--

CREATE TABLE `wp_bookly_sent_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_id` int(10) UNSIGNED NOT NULL,
  `notification_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_series`
--

CREATE TABLE `wp_bookly_series` (
  `id` int(10) UNSIGNED NOT NULL,
  `repeat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_services`
--

CREATE TABLE `wp_bookly_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('simple','collaborative','compound','package') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'simple',
  `title` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `attachment_id` int(10) UNSIGNED DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 900,
  `slot_length` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'default',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `color` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '#FFFFFF',
  `deposit` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '100%',
  `capacity_min` int(11) NOT NULL DEFAULT 1,
  `capacity_max` int(11) NOT NULL DEFAULT 1,
  `one_booking_per_slot` tinyint(1) NOT NULL DEFAULT 0,
  `padding_left` int(11) NOT NULL DEFAULT 0,
  `padding_right` int(11) NOT NULL DEFAULT 0,
  `info` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `start_time_info` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `end_time_info` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `same_staff_for_subservices` tinyint(1) NOT NULL DEFAULT 0,
  `units_min` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `units_max` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `package_life_time` int(11) DEFAULT NULL,
  `package_size` int(11) DEFAULT NULL,
  `package_unassigned` tinyint(1) NOT NULL DEFAULT 0,
  `appointments_limit` int(11) DEFAULT NULL,
  `limit_period` enum('off','day','week','month','year','upcoming','calendar_day','calendar_week','calendar_month','calendar_year') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'off',
  `staff_preference` enum('order','least_occupied','most_occupied','least_occupied_for_period','most_occupied_for_period','least_expensive','most_expensive') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'most_expensive',
  `staff_preference_settings` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `recurrence_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `recurrence_frequencies` set('daily','weekly','biweekly','monthly') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'daily,weekly,biweekly,monthly',
  `time_requirements` enum('required','optional','off') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'required',
  `collaborative_equal_duration` tinyint(1) NOT NULL DEFAULT 0,
  `online_meetings` enum('off','zoom','google_meet','jitsi','bbb') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'off',
  `final_step_url` varchar(512) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `wc_product_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wc_cart_info_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `wc_cart_info` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `min_time_prior_booking` int(11) DEFAULT NULL,
  `min_time_prior_cancel` int(11) DEFAULT NULL,
  `visibility` enum('public','private','group') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'public',
  `position` int(11) NOT NULL DEFAULT 9999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_shop`
--

CREATE TABLE `wp_bookly_shop` (
  `id` int(10) UNSIGNED NOT NULL,
  `plugin_id` int(10) UNSIGNED NOT NULL,
  `type` enum('plugin','bundle') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'plugin',
  `highlighted` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(10) UNSIGNED DEFAULT 0,
  `demo_url` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sales` int(10) UNSIGNED NOT NULL,
  `rating` decimal(10,2) NOT NULL,
  `reviews` int(10) UNSIGNED NOT NULL,
  `published` datetime NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_bookly_shop`
--

INSERT INTO `wp_bookly_shop` (`id`, `plugin_id`, `type`, `highlighted`, `priority`, `demo_url`, `title`, `slug`, `description`, `url`, `icon`, `image`, `price`, `sales`, `rating`, `reviews`, `published`, `seen`, `created_at`) VALUES
(1, 7226091, 'plugin', 1, 100, NULL, 'Bookly Pro', 'bookly-addon-pro', 'Bring appointment scheduling process to the next level with Bookly Pro add-on.  Pro add-on turns Bookly plugin into the professional appointment management system. Unlock Advanced Customer management, Service provider management, Services management, Email and SMS notifications, Booking management capabilities. Connect payment gateways and modify Pro version with other add-ons available only with Bookly Pro and more.', 'https://codecanyon.net/item/bookly-booking-plugin-responsive-appointment-booking-and-scheduling/7226091', 'https://s3.envato.com/files/276918414/bookly-icon-(1)%20(3).png', 'https://s3.envato.com/files/405130193/CodeCanyon-main-banner-45K.jpg', '89.00', 45903, '4.54', 1095, '2014-04-12 17:14:52', 1, '2022-11-04 20:00:11'),
(2, 13903524, 'plugin', 0, 0, NULL, 'Bookly Multisite (Add-on)', 'bookly-addon-multisite', 'Do you need to administrate Booky on multiple websites? This add-on enables Bookly to become a Multisite ready plugin. You need to buy an additional Regular License for Bookly Pro and every installed add-on for each domain name that you use.', 'https://codecanyon.net/item/bookly-multisite-addon/13903524', 'https://s3.envato.com/files/257314580/14multisite.png', 'https://s3.envato.com/files/257314582/14_Multisite.jpg', '49.00', 672, '5.00', 8, '2015-12-04 16:38:03', 1, '2022-11-04 20:00:11'),
(3, 15552320, 'plugin', 0, 0, NULL, 'Bookly Service Extras (Add-on)', 'bookly-addon-service-extras', 'Increase the average check for every client visit with Service Extras add-on. Let your customers order extra items when they schedule an appointment with you or book your service. It adds one more step into the booking form and allows your customers to pick extras they would like to order as an addition to the service booking, see the price of extras, name, image, and total cost of the selected items.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-service-extras-addon/15552320', 'https://s3.envato.com/files/275715191/bookly_extras_80x80.jpg', 'https://s3.envato.com/files/275715192/extras-addon_590x300.jpg', '49.00', 3284, '4.42', 33, '2016-04-01 15:29:11', 1, '2022-11-04 20:00:11'),
(4, 17328208, 'plugin', 0, 0, NULL, 'Bookly Locations (Add-on)', 'bookly-addon-locations', 'Do you offer your services in more than one location? Try Bookly Locations add-on to manage the service booking process between various locations. Let your customers pick the location, where they would like to get the service and associate the staff members with those locations.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-locations-addon/17328208', 'https://s3.envato.com/files/257314201/3locations.png', 'https://s3.envato.com/files/257314328/3_locations.jpg', '39.00', 2889, '4.44', 34, '2016-08-03 17:49:31', 1, '2022-11-04 20:00:11'),
(5, 17367838, 'plugin', 0, 0, NULL, 'Bookly Chain Appointments (Add-on)', 'bookly-addon-chain-appointments', 'Do you offer services which can be combined and provided during a single client visit by the same or different staff members? Let your clients book several services for a single visit with the Chain Appointments add-on. The clients will be able to choose multiple services from different providers at the first step of the booking process.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-chain-appointments-addon/17367838', 'https://s3.envato.com/files/257314361/11chain.png', 'https://s3.envato.com/files/257314362/11_chain.jpg', '29.00', 1281, '4.80', 5, '2016-08-09 17:40:29', 1, '2022-11-04 20:00:11'),
(6, 17457141, 'plugin', 0, 0, NULL, 'Bookly Multiply Appointments (Add-on)', 'bookly-addon-multiply-appointments', 'Do you provide fixed-time services, which your clients can book for example for an hour or 15 minutes? Boost your sales with Bookly Multiply Appointments add-on by providing an option to book the same service several times in a row.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-multiply-appointments-addon/17457141', 'https://s3.envato.com/files/277980955/icon_80x80.png', 'https://s3.envato.com/files/277980956/multiply-appointments-addon_590x300.jpg', '29.00', 872, '0.00', 2, '2016-08-16 16:02:12', 1, '2022-11-04 20:00:11'),
(7, 17956131, 'plugin', 0, 0, NULL, 'Bookly Deposit Payments (Add-on)', 'bookly-addon-deposit-payments', 'Would you like to reduce the number of no-shows? Or maybe you need to buy something before the clients\' visit? With Bookly Deposit Payments add-on, you can request full or partial pre-payment during the service booking process.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-deposit-payments-addon/17956131', 'https://s3.envato.com/files/257314254/7deposit.png', 'https://s3.envato.com/files/257314255/7_deposit_payments.jpg', '39.00', 1704, '4.57', 7, '2016-09-22 18:11:00', 1, '2022-11-04 20:00:11'),
(8, 18611122, 'plugin', 0, 0, NULL, 'Bookly Special Days (Add-on)', 'bookly-addon-special-days', 'Customize the schedule of your employees during the holiday season or any other occasion, without changing your regular schedule. With this add-on, you can add days with long or short hours or even the day when you provide service for 24 hours. Bookly Special Days add-on enables you to modify the schedule of each staff member in your organization.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-special-days-addon/18611122', 'https://s3.envato.com/files/257314246/6specialdays.png', 'https://s3.envato.com/files/257314247/6_special_days.png', '39.00', 2567, '4.36', 14, '2016-11-07 01:25:43', 1, '2022-11-04 20:00:11'),
(9, 18704535, 'plugin', 0, 0, NULL, 'Bookly Special Hours (Add-on)', 'bookly-addon-special-hours', 'Would you like to provide a discount during happy hours or raise service price during busy hours? You can do it with Bookly Special Hours add-on. With full control of the daily schedule, you can adjust the price to maximize revenues or reduce workload.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-special-hours-addon/18704535', 'https://s3.envato.com/files/276664014/icon_80x80.jpg', 'https://s3.envato.com/files/368291032/banner-bookly-special-hours-addon.jpg', '29.00', 606, '4.20', 5, '2016-11-09 01:22:54', 1, '2022-11-04 20:00:11'),
(10, 18874038, 'plugin', 0, 0, NULL, 'Bookly Service Schedule (Add-on)', 'bookly-addon-service-schedule', 'Do you have services with a specific schedule which must be aligned with the default schedule of your employees? With Bookly Service Schedule add-on, you can set hours during each day of the week when your clients can book this service taking into consideration the staff members availability.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-service-schedule-addon/18874038', 'https://s3.envato.com/files/257314213/5serviceschedule.png', 'https://s3.envato.com/files/257314214/5_service_schedule.jpg', '29.00', 2708, '4.17', 12, '2016-11-22 05:03:19', 1, '2022-11-04 20:00:11'),
(11, 19497634, 'plugin', 0, 0, NULL, 'Bookly Recurring Appointments (Add-on)', 'bookly-addon-recurring-appointments', 'Do you provide a service which may require a series of visits, like therapy, massage, tutoring and more? With Bookly Recurring Appointments, your client can book the service set upfront. Must-have for businesses, which provide service sets.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-recurring-appointments-addon/19497634', 'https://s3.envato.com/files/257314299/10recurring.png', 'https://s3.envato.com/files/257314300/10_recurring.jpg', '39.00', 1751, '3.67', 12, '2017-02-23 17:42:00', 1, '2022-11-04 20:00:11'),
(12, 19617518, 'plugin', 0, 0, NULL, 'Bookly PayPal Payments Standard (Add-on)', 'bookly-addon-paypal-payments-standard', 'Do you have PayPal Business or PayPal Premier account and would like to provide one of the most popular online payment options for your clients? With Bookly PayPal Payments Standard add-on clients can pay directly via credit card or by logging in to their PayPal account – all processed by PayPal.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-paypal-payments-standard-addon/19617518', 'https://s3.envato.com/files/257314391/13paypalstandard.png', 'https://s3.envato.com/files/350077544/preview-banner-bookly-paypal-payments-standard-addon.png', '29.00', 1589, '5.00', 7, '2017-03-22 04:29:25', 1, '2022-11-04 20:00:11'),
(13, 20005540, 'plugin', 0, 0, NULL, 'Bookly Staff Cabinet (Add-on)', 'bookly-addon-staff-cabinet', 'You can manage Bookly in the WordPress admin area of your website. Many of your employees may also need access to Bookly. To avoid any complications and limit the access to the website admin area, you can use Bookly Staff Cabinet, where your employees can: view the calendar, add and manage appointments, view and update personal details and more.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-staff-cabinet-addon/20005540', 'https://s3.envato.com/files/257314313/12staffcabinet.png', 'https://s3.envato.com/files/257314314/12_staff_cabinet.jpg', '39.00', 2089, '4.06', 18, '2017-05-26 16:11:36', 1, '2022-11-04 20:00:11'),
(14, 20685954, 'plugin', 0, 0, NULL, 'Bookly PayU Latam (Add-on)', 'bookly-addon-payu-latam', 'Accept payments online to reduce the funnel friction and boost your sales. PayU Latam is an international payment gateway provider, which also supports the most popular payment options in Latin America and is a perfect fit for businesses, which provide services in the LatAm market.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-payu-latam-addon/20685954', 'https://s3.envato.com/files/257315044/34payulatam.jpg', 'https://s3.envato.com/files/257315045/34_PayULatam.jpg', '29.00', 101, '0.00', 2, '2017-10-04 22:22:08', 1, '2022-11-04 20:00:11'),
(15, 20917406, 'plugin', 0, 0, NULL, 'Bookly Waiting List (Add-on)', 'bookly-addon-waiting-list', 'Do you lose customers because you are overbooked? Try Bookly Waiting List add-on to collect warm leads and maximize your profits. When you are fully booked, the customer will be able to join the waiting list. Service provider will get an automatic notification when the free slot appears.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-waiting-list-addon/20917406', 'https://s3.envato.com/files/257314909/28waitinglist.jpg', 'https://s3.envato.com/files/257314910/28_Waiting_list.jpg', '29.00', 442, '0.00', 2, '2017-11-09 17:58:26', 1, '2022-11-04 20:00:11'),
(16, 20952783, 'plugin', 0, 0, NULL, 'Bookly Packages (Add-on)', 'bookly-addon-packages', 'Do you have customers who purchase your services regularly? You can increase their loyalty to your company and boost your sales by providing package deals at a discounted price with Bookly Packages add-on.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-packages-addon/20952783', 'https://s3.envato.com/files/277560972/icon_80x80.jpg', 'https://s3.envato.com/files/277560975/preview-banner.jpg', '29.00', 668, '2.80', 5, '2017-11-14 18:45:26', 1, '2022-11-04 20:00:11'),
(17, 21113698, 'plugin', 0, 0, NULL, 'Bookly 2Checkout (Add-on)', 'bookly-addon-2checkout', 'Accept payments online to reduce the funnel friction and boost your sales. 2Checkout enables merchants to accept mobile and online payments from buyers worldwide. Seamless, safe, reliable payment processing regardless of where you are on the map.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-2checkout-addon/21113698', 'https://s3.envato.com/files/257315086/35_2checkout(1).jpg', 'https://s3.envato.com/files/257315087/35_2checkout.jpg', '29.00', 37, '0.00', 0, '2017-12-12 10:30:34', 1, '2022-11-04 20:00:11'),
(18, 21113750, 'plugin', 0, 0, NULL, 'Bookly Authorize.Net (Add-on)', 'bookly-addon-authorize-net', 'Accept payments online to reduce the funnel friction and boost your sales. Authorize.Net is a US-based payment gateway, which allows merchants to accept various payment types like: Visa, MasterCard, Discover, American Express, JCB, PayPal, Visa Checkout, Apple Pay, Google Pay, E-check.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-authorizenet-addon/21113750', 'https://s3.envato.com/files/257315021/33authorize.jpg', 'https://s3.envato.com/files/257315022/33_authorize.jpg', '29.00', 202, '0.00', 0, '2017-12-12 10:30:24', 1, '2022-11-04 20:00:11'),
(19, 21113860, 'plugin', 0, 0, NULL, 'Bookly Coupons (Add-on)', 'bookly-addon-coupons', 'Provide your clients with discount coupons to boost your sales, improve the conversion rate for less popular services, and increase customer loyalty. With the Bookly Coupons add-on enabled, your clients will be able to apply a coupon code at the checkout and get the service at a discounted price. You can easily create, manage and keep track of all promotional codes directly in Bookly.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-coupons-addon/21113860', 'https://s3.envato.com/files/257314530/17coupons.jpg', 'https://s3.envato.com/files/257314531/17_coupons.jpg', '39.00', 1980, '4.20', 5, '2017-12-12 10:39:37', 1, '2022-11-04 20:00:11'),
(20, 21113970, 'plugin', 0, 0, NULL, 'Bookly Custom Fields (Add-on)', 'bookly-addon-custom-fields', 'Do you need to know specific info about your customer before they visit you? Do you want to provide a personalized experience for your customers?\r\nWith Custom Fields add-on, you can ask for more details during the booking process to save time and provide better client experience during the visit.\r\n\r\nImportant: This add-on requires the Bookly PRO to be installed and activated.\r\n', 'https://codecanyon.net/item/bookly-custom-fields-addon/21113970', 'https://s3.envato.com/files/278250393/icon_80x80.jpg', 'https://s3.envato.com/files/278250394/custom-fields-addon_590x300.jpg', '49.00', 5112, '5.00', 18, '2017-12-12 10:40:39', 1, '2022-11-04 20:00:11'),
(21, 21114042, 'plugin', 0, 0, NULL, 'Bookly Mollie (Add-on)', 'bookly-addon-mollie', 'Accept payments online to reduce the funnel friction and boost your sales. Mollie is a Payment Service Provider (PSP) which allows you to process such payment methods as iDEAL, credit card, Bancontact/Mister Cash, PayPal, SCT, SDD, and others.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-mollie-addon/21114042', 'https://s3.envato.com/files/257314852/25mollie.jpg', 'https://s3.envato.com/files/257314853/25_Mollie.jpg', '34.00', 789, '0.00', 2, '2017-12-12 10:43:25', 1, '2022-11-04 20:00:11'),
(22, 21114096, 'plugin', 0, 0, NULL, 'Bookly Payson (Add-on)', 'bookly-addon-payson', 'Accept payments online to reduce the funnel friction and boost your sales. Payson is one of Sweden’s leading companies for payments online. It provides both e-traders and private individuals with access to secure online payments.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-payson-addon/21114096', 'https://s3.envato.com/files/257315118/37payson.jpg', 'https://s3.envato.com/files/257315129/37_Payson.jpg', '29.00', 15, '0.00', 1, '2017-12-12 10:44:08', 1, '2022-11-04 20:00:11'),
(23, 21114146, 'plugin', 0, 0, NULL, 'Bookly Stripe (Add-on)', 'bookly-addon-stripe', 'Accept payments online to reduce the funnel friction and boost your sales. Stripe operates in more than 25 countries and provides various options to accept payments online. One of the most powerful solutions to cover your payments needs.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-stripe-addon/21114146', 'https://s3.envato.com/files/257314285/9stripe.jpg', 'https://s3.envato.com/files/257314286/9_stripe.jpg', '39.00', 3290, '4.67', 12, '2017-12-12 10:46:42', 1, '2022-11-04 20:00:11'),
(24, 21344225, 'plugin', 0, 0, NULL, 'Bookly Group Booking (Add-on)', 'bookly-addon-group-booking', 'Do you provide services for groups, like yoga or fitness class, group tutoring, or maybe a guided tour? With Bookly Group Booking add-on, you can easily set the capacity for each service you provide, let your customers specify the number of people during the booking and more.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-group-booking-addon/21344225', 'https://s3.envato.com/files/257314273/8groupbooking.jpg', 'https://s3.envato.com/files/257314274/8_group_booking.jpg', '39.00', 3844, '4.56', 9, '2018-02-01 01:33:45', 1, '2022-11-04 20:00:11'),
(25, 21344290, 'plugin', 0, 0, NULL, 'Bookly Customer Groups (Add-on)', 'bookly-addon-customer-groups', 'Do you have different types of customers? Bookly Customer Groups add-on enables you to create and manage Customer Groups. With this add-on, you can arrange your customers in different categories and set the rules for booking process, pricing and more.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-customer-groups-addon/21344290', 'https://s3.envato.com/files/257314959/31customergroups.jpg', 'https://s3.envato.com/files/257314960/31_Customer_groups.jpg', '29.00', 431, '0.00', 0, '2018-02-01 02:03:48', 1, '2022-11-04 20:00:11'),
(26, 21344354, 'plugin', 0, 0, NULL, 'Bookly Files (Add-on)', 'bookly-addon-files', 'Do you require documents or any other information before the customer can book your service? Let your clients attach files during the booking process with Bookly Files add-on. All materials added by your customers will be available for review in booking details.\r\n\r\nImportant: This add-on requires the Bookly PRO and Bookly Custom Fields (Add-on) installed and activated.', 'https://codecanyon.net/item/bookly-files-addon/21344354', 'https://s3.envato.com/files/257314861/27files.jpg', 'https://s3.envato.com/files/257314862/27_Files.jpg', '29.00', 706, '3.83', 6, '2018-02-01 02:07:58', 1, '2022-11-04 20:00:11'),
(27, 21574371, 'plugin', 0, 0, NULL, 'Bookly Compound Services (Add-on)', 'bookly-addon-compound-services', 'Do you have services which can be combined into one service at a higher price? For example, if you provide web design, coding, content creation services you could combine them into the website or app development service which includes services mentioned in the example and involves several employees in it. \r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-compound-services-addon/21574371', 'https://s3.envato.com/files/257314987/30compound.jpg', 'https://s3.envato.com/files/257314988/30_compound.jpg', '29.00', 261, '0.00', 1, '2018-03-13 06:08:47', 1, '2022-11-04 20:00:11'),
(28, 21574466, 'plugin', 0, 0, NULL, 'Bookly Customer Information (Add-on)', 'bookly-addon-customer-information', 'Know your customer better with Bookly Customer Information add-on. Add custom fields to the booking form to gather additional info about your customer. The extended user profile will allow you to personalize your marketing activities in the future.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-customer-information-addon/21574466', 'https://s3.envato.com/files/279832345/icon_80x80.jpg', 'https://s3.envato.com/files/279832384/customer-information-addon_590x300.jpg', '29.00', 1330, '5.00', 6, '2018-03-13 06:10:12', 1, '2022-11-04 20:00:11'),
(29, 21574566, 'plugin', 0, 0, NULL, 'Bookly Ratings (Add-on)', 'bookly-addon-ratings', 'Do you want to improve your services and become more client-oriented? With Bookly Ratings add-on, you can evaluate your staff members and services you provide. Encourage your customers to rate the services they receive to keep up with professional standards and always meet the client’s expectations.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-ratings-addon/21574566', 'https://s3.envato.com/files/257315009/32ratings.jpg', 'https://s3.envato.com/files/257315010/32_ratings.jpg', '29.00', 345, '0.00', 2, '2018-03-13 06:19:21', 1, '2022-11-04 20:00:11'),
(30, 21841764, 'plugin', 0, 0, NULL, 'Bookly Cart (Add-on)', 'bookly-addon-cart', 'Do you want to boost your online sales even more? With Bookly Cart add-on, your customers can add multiple service bookings to the cart. It simplifies the buying process and motivates to purchase more. You can customize columns and display the cart summary data the way you want.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-cart-addon/21841764', 'https://s3.envato.com/files/257314676/21cart.jpg', 'https://s3.envato.com/files/257314677/21_Cart.jpg', '29.00', 1572, '5.00', 8, '2018-04-29 02:25:40', 1, '2022-11-04 20:00:11'),
(31, 21841828, 'plugin', 0, 0, NULL, 'Bookly Taxes (Add-on)', 'bookly-addon-taxes', 'Bookly Taxes add-on will let you set up and include taxes in the service price. You’ll be able to define different tax rates and apply them to all or only to selected services. Based on your settings, Bookly will calculate and display a total price with taxes that were applied.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-taxes-addon/21841828', 'https://s3.envato.com/files/257314926/29taxes.jpg', 'https://s3.envato.com/files/257314934/29_taxes.jpg', '39.00', 584, '3.00', 3, '2018-04-29 02:29:54', 1, '2022-11-04 20:00:11'),
(32, 21841856, 'plugin', 0, 0, NULL, 'Bookly Invoices (Add-on)', 'bookly-addon-invoices', 'Do you need need to invoice your clients without routine? With Bookly Invoices add-on, you can automatically issue invoices to your clients after your service is booked. Send a payment request when appointments are booked, approved, or received, and get paid within a specified period. Take advantage of the automatic online invoicing and let your clients pay for your services quickly and easily.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-invoices-addon/21841856', 'https://s3.envato.com/files/276228740/icon_80x80.jpg', 'https://s3.envato.com/files/276262000/invoices-addon_590x300.jpg', '39.00', 1008, '0.00', 2, '2018-04-29 02:30:22', 1, '2022-11-04 20:00:11'),
(33, 21841871, 'plugin', 0, 0, NULL, 'Bookly Google Maps Address (Add-on)', 'bookly-addon-google-maps-address', 'Would you like to reduce Bookly form fill-in time and increase the conversion rate? Bookly Google Maps Address add-on simplifies the process of address data entry allowing you to use an autocomplete service. It helps to minimize the funnel friction, which leads to a better conversion rate and more sales.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-google-maps-address-addon/21841871', 'https://s3.envato.com/files/257314833/26googlemaps.jpg', 'https://s3.envato.com/files/257314834/26_Google_maps.jpg', '29.00', 458, '4.67', 3, '2018-04-29 02:45:11', 1, '2022-11-04 20:00:11'),
(34, 22060579, 'plugin', 0, 0, NULL, 'Bookly Advanced Google Calendar (Add-on)', 'bookly-addon-advanced-google-calendar', 'Are you used to Google Сalendar and want to leverage its capabilities together with Bookly? With  Bookly Advanced Google Calendar add-on, you get two-way synchronization between Bookly Calendar and Google Calendar so that you’ll always be able to see and manage all appointments in both calendars.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-advanced-google-calendar-addon/22060579', 'https://s3.envato.com/files/257314406/15googlecalendar.jpg', 'https://s3.envato.com/files/257314407/15_AdvancedGC.jpg', '49.00', 2807, '4.55', 11, '2018-06-06 04:37:53', 1, '2022-11-04 20:00:11'),
(35, 22060627, 'plugin', 0, 0, NULL, 'Bookly Customer Cabinet (Add-on)', 'bookly-addon-customer-cabinet', 'Do you need even more flexibility and let your customers manage their existing appointments and profile info? With Bookly Customer Cabinet add-on, Bookly becomes fully GDPR compliant and allows your users to control their data and appointments on your website in their personal user account. \r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-customer-cabinet-addon/22060627', 'https://s3.envato.com/files/257314653/19customercabinet.jpg', 'https://s3.envato.com/files/257314654/19_Customer_cabinet.jpg', '29.00', 1788, '4.09', 11, '2018-06-06 04:39:24', 1, '2022-11-04 20:00:11'),
(36, 22060703, 'plugin', 0, 0, NULL, 'Bookly Custom Duration (Add-on)', 'bookly-addon-custom-duration', 'Do you sell services which may have a flexible duration like tutoring, training, consulting, etc.? With Bookly Custom Duration add-on, your customers can define the length of the appointment. The price will be calculated accordingly.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-custom-duration-addon/22060703', 'https://s3.envato.com/files/277098076/icon_80x80.jpg', 'https://s3.envato.com/files/277098077/custom-duration-addon_590x300.jpg', '29.00', 1289, '4.33', 6, '2018-06-06 04:42:30', 1, '2022-11-04 20:00:11'),
(37, 22060797, 'plugin', 0, 0, NULL, 'Bookly PayUbiz (Add-on)', 'bookly-addon-payu-biz', 'Accept payments online to reduce the funnel friction and boost your sales. PayUbiz is a payment gateway provider, which also supports most popular payment options in India and is a perfect fit for businesses, which provide services in the Indian market.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-payubiz-addon/22060797', 'https://s3.envato.com/files/257315098/36payubiz.jpg', 'https://s3.envato.com/files/257315099/36_PayUbiz.jpg', '29.00', 21, '0.00', 1, '2018-06-06 04:52:32', 1, '2022-11-04 20:00:11'),
(38, 22999600, 'plugin', 0, 0, NULL, 'Bookly Tasks (Add-on) ', 'bookly-addon-tasks', 'Bookly Tasks add-on allows you and your customers to create bookings without choosing date and time.', 'https://codecanyon.net/item/bookly-tasks-addon/22999600', 'https://s3.envato.com/files/257552116/icon_80x80.jpg', 'https://s3.envato.com/files/257552117/tasks-banner.jpg', '29.00', 426, '0.00', 1, '2018-12-12 00:17:51', 1, '2022-11-04 20:00:11'),
(39, 22999632, 'plugin', 0, 0, NULL, 'Bookly Collaborative Services (Add-on)', 'bookly-addon-collaborative-services', 'Bookly Collaborative Services add-on allows you to create services that require simultaneous participation of several staff members or staff member and shared resources necessary for the service performance.', 'https://codecanyon.net/item/bookly-collaborative-services-addon/22999632', 'https://s3.envato.com/files/257552412/icon_80x80.jpg', 'https://s3.envato.com/files/257552413/banner-collaborative-services.jpg', '39.00', 651, '0.00', 1, '2018-12-12 00:22:29', 1, '2022-11-04 20:00:11'),
(40, 23324001, 'plugin', 0, 0, NULL, 'Bookly Custom Statuses (Add-on)', 'bookly-addon-custom-statuses', 'Bookly Custom Statuses add-on allows you to create and use additional statuses for the appointment.', 'https://codecanyon.net/item/bookly-custom-statuses-addon/23324001', 'https://s3.envato.com/files/260657848/icon_80x80.jpg', 'https://s3.envato.com/files/260657850/preview-banner-custom-statuses.jpg', '29.00', 483, '5.00', 3, '2019-02-18 20:10:01', 1, '2022-11-04 20:00:11'),
(41, 23350952, 'plugin', 0, 0, NULL, 'Bookly Outlook Calendar (Add-on)', 'bookly-addon-outlook-calendar', 'Bookly Outlook Calendar add-on allows you to get a full two-way synchronization between Bookly Calendar and Outlook Calendar.', 'https://codecanyon.net/item/bookly-outlook-calendar-addon/23350952', 'https://s3.envato.com/files/260900000/icon_80x80(1).jpg', 'https://s3.envato.com/files/260915494/Outlook-Calendar.png', '49.00', 856, '3.00', 4, '2019-02-21 23:33:34', 1, '2022-11-04 20:00:11'),
(42, 24219988, 'plugin', 0, 0, NULL, 'Bookly PayPal Checkout (Add-on)', 'bookly-addon-paypal-checkout', 'Bookly PayPal Checkout add-on allows your client to use PayPal Checkout payment method.', 'https://codecanyon.net/item/bookly-paypal-checkout-addon/24219988', 'https://s3.envato.com/files/268224387/icon_80x80.jpg', 'https://s3.envato.com/files/350078018/preview-banner-bookly-paypal-checkout-addon%20(2).jpg', '29.00', 573, '0.00', 0, '2019-07-30 18:31:46', 1, '2022-11-04 20:00:11'),
(43, 29936495, 'plugin', 0, 0, NULL, 'Bookly Discounts (Add-on)', 'bookly-addon-discounts', 'Bookly Discounts add-on allows you to set up conditional discounts that will be applied during checkout if the booking details match requirements set by you.', 'https://codecanyon.net/item/bookly-discounts-addon/29936495', 'https://s3.envato.com/files/317556319/icon_80x80.jpg', 'https://s3.envato.com/files/317556323/preview-banner-discounts.jpg', '29.00', 244, '0.00', 0, '2021-01-05 01:18:25', 1, '2022-11-04 20:00:11'),
(44, 34925755, 'plugin', 0, 0, NULL, 'Bookly Mailchimp (Add-on)', 'bookly-addon-mailchimp', 'Bookly Mailchimp add-on allows you to automatically export your customers contact information to your mailing list.', 'https://codecanyon.net/item/bookly-mailchimp-addon/34925755', 'https://s3.envato.com/files/366451641/icon_80x80.jpg', 'https://s3.envato.com/files/366451642/preview-banner.jpg', '29.00', 69, '0.00', 0, '2021-11-24 03:10:56', 1, '2022-11-04 20:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_staff`
--

CREATE TABLE `wp_bookly_staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `wp_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `attachment_id` int(10) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `working_time_limit` int(10) UNSIGNED DEFAULT NULL,
  `visibility` enum('public','private','archive') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'public',
  `position` int(11) NOT NULL DEFAULT 9999,
  `google_data` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `outlook_data` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `zoom_authentication` enum('default','jwt','oauth') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'default',
  `zoom_jwt_api_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `zoom_jwt_api_secret` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `zoom_oauth_token` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `icalendar` tinyint(1) NOT NULL DEFAULT 0,
  `icalendar_token` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `icalendar_days_before` int(11) NOT NULL DEFAULT 365,
  `icalendar_days_after` int(11) NOT NULL DEFAULT 365,
  `color` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '#dddddd',
  `gateways` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_staff_schedule_items`
--

CREATE TABLE `wp_bookly_staff_schedule_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `day_index` int(10) UNSIGNED NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_staff_services`
--

CREATE TABLE `wp_bookly_staff_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `deposit` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '100%',
  `capacity_min` int(11) NOT NULL DEFAULT 1,
  `capacity_max` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_stats`
--

CREATE TABLE `wp_bookly_stats` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_sub_services`
--

CREATE TABLE `wp_bookly_sub_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('service','spare_time') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'service',
  `service_id` int(10) UNSIGNED NOT NULL,
  `sub_service_id` int(10) UNSIGNED DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 9999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://en-gb.wordpress.org/', '', '2022-11-03 18:29:03', '2022-11-03 18:29:03', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_cpappbk_forms`
--

CREATE TABLE `wp_cpappbk_forms` (
  `id` mediumint(9) NOT NULL,
  `form_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `form_structure` mediumtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `calendar_language` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `date_format` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `product_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `pay_later_label` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `defaultstatus` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `defaultpaidstatus` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `fp_from_email` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `fp_from_name` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fp_destination_emails` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fp_subject` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fp_inc_additional_info` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `fp_return_page` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `fp_message` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fp_emailformat` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `fp_emailtomethod` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `fp_destination_emails_field` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cu_enable_copy_to_user` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cu_user_email_field` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cu_subject` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cu_message` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cu_emailformat` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `fp_emailfrommethod` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `vs_text_maxapp` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_is_required` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_is_email` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_datemmddyyyy` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_dateddmmyyyy` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_number` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_digits` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_max` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_min` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_pageof` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_submitbtn` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_previousbtn` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_nextbtn` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_quantity` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_cancel` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_cost` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vs_text_nmore` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cp_user_access` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cp_user_access_settings` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `display_emails_endtime` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `rep_enable` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `rep_days` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `rep_hour` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `rep_emails` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `rep_subject` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `rep_emailformat` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `rep_message` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cv_enable_captcha` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_width` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_height` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_chars` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_font` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_min_font_size` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_max_font_size` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_noise` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_noise_length` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_background` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_border` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cv_text_enter_valid_captcha` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_cpappbk_forms`
--

INSERT INTO `wp_cpappbk_forms` (`id`, `form_name`, `form_structure`, `calendar_language`, `date_format`, `product_name`, `pay_later_label`, `defaultstatus`, `defaultpaidstatus`, `fp_from_email`, `fp_from_name`, `fp_destination_emails`, `fp_subject`, `fp_inc_additional_info`, `fp_return_page`, `fp_message`, `fp_emailformat`, `fp_emailtomethod`, `fp_destination_emails_field`, `cu_enable_copy_to_user`, `cu_user_email_field`, `cu_subject`, `cu_message`, `cu_emailformat`, `fp_emailfrommethod`, `vs_text_maxapp`, `vs_text_is_required`, `vs_text_is_email`, `vs_text_datemmddyyyy`, `vs_text_dateddmmyyyy`, `vs_text_number`, `vs_text_digits`, `vs_text_max`, `vs_text_min`, `vs_text_pageof`, `vs_text_submitbtn`, `vs_text_previousbtn`, `vs_text_nextbtn`, `vs_text_quantity`, `vs_text_cancel`, `vs_text_cost`, `vs_text_nmore`, `cp_user_access`, `cp_user_access_settings`, `display_emails_endtime`, `rep_enable`, `rep_days`, `rep_hour`, `rep_emails`, `rep_subject`, `rep_emailformat`, `rep_message`, `cv_enable_captcha`, `cv_width`, `cv_height`, `cv_chars`, `cv_font`, `cv_min_font_size`, `cv_max_font_size`, `cv_noise`, `cv_noise_length`, `cv_background`, `cv_border`, `cv_text_enter_valid_captcha`) VALUES
(1, '', '[[{\"form_identifier\":\"\",\"name\":\"fieldname1\",\"shortlabel\":\"\",\"index\":0,\"ftype\":\"fapp\",\"userhelp\":\"\",\"userhelpTooltip\":\"\",\"csslayout\":\"\",\"title\":\"Appointment\",\"services\":[{\"name\":\"Service 1\",\"price\":1,\"capacity\":1,\"duration\":60,\"pb\":0,\"pa\":0,\"ohindex\":0,\"idx\":1}],\"openhours\":[],\"allOH\":[{\"name\":\"Default\",\"openhours\":[{\"type\":\"all\",\"d\":\"\",\"h1\":8,\"m1\":0,\"h2\":17,\"m2\":0}]}],\"dateFormat\":\"mm\\/dd\\/yy\",\"showDropdown\":false,\"showTotalCost\":false,\"showTotalCostFormat\":\"$ {0}\",\"showEndTime\":false,\"showQuantity\":false,\"usedSlotsCheckbox\":false,\"avoidOverlaping\":true,\"emptySelectCheckbox\":false,\"emptySelect\":\"\",\"dropdownRange\":\"-10:+10\",\"working_dates\":[true,true,true,true,true,true,true],\"numberOfMonths\":1,\"maxNumberOfApp\":0,\"firstDay\":0,\"minDate\":\"0\",\"maxDate\":\"\",\"defaultDate\":\"\",\"invalidDates\":\"\",\"tmpinvalidDates\":\"\",\"required\":true,\"bSlotsCheckbox\":true,\"bSlots\":30,\"militaryTime\":1,\"autonum\":1,\"autonumStaff\":0,\"fBuild\":{},\"special_days\":[],\"minDateTmp\":\"0\",\"getMinDate\":{},\"tmpinvalidDatestime\":[]},{\"form_identifier\":\"\",\"name\":\"email\",\"shortlabel\":\"\",\"index\":1,\"ftype\":\"femail\",\"userhelp\":\"\",\"userhelpTooltip\":\"\",\"csslayout\":\"\",\"title\":\"Email\",\"predefined\":\"\",\"predefinedClick\":false,\"required\":true,\"size\":\"medium\",\"equalTo\":\"\",\"fBuild\":{}},{\"fBuild\":{},\"name\":\"fieldname2\",\"index\":2,\"autonum\":1,\"tmpinvalidDates\":\"\",\"special_days\":[],\"dateFormat\":\"mm\\/dd\\/yy\",\"minDateTmp\":\"0\",\"getMinDate\":{},\"tmpinvalidDatestime\":[],\"form_identifier\":\"\",\"shortlabel\":\"\",\"ftype\":\"fapp\",\"userhelp\":\"\",\"userhelpTooltip\":\"\",\"csslayout\":\"\",\"title\":\"Appointment\",\"services\":[{\"name\":\"Sample Service\",\"price\":24.99,\"capacity\":1,\"duration\":60,\"pb\":0,\"pa\":0,\"ohindex\":0,\"idx\":1}],\"openhours\":[],\"allOH\":[{\"name\":\"Default\",\"openhours\":[{\"type\":\"all\",\"d\":\"\",\"h1\":8,\"m1\":0,\"h2\":17,\"m2\":0}]}],\"showDropdown\":false,\"showTotalCost\":false,\"showTotalCostFormat\":\"$ {0}\",\"showEndTime\":false,\"showQuantity\":false,\"usedSlotsCheckbox\":false,\"avoidOverlaping\":true,\"emptySelectCheckbox\":false,\"emptySelect\":\"-- Please select service --\",\"dropdownRange\":\"-10:+10\",\"working_dates\":[true,true,true,true,true,true,true],\"numberOfMonths\":1,\"maxNumberOfApp\":0,\"firstDay\":0,\"minDate\":\"0\",\"maxDate\":\"\",\"defaultDate\":\"\",\"invalidDates\":\"\",\"required\":true,\"bSlotsCheckbox\":true,\"bSlots\":30,\"militaryTime\":1,\"autonumStaff\":0},{\"fBuild\":{},\"name\":\"fieldname3\",\"index\":3,\"form_identifier\":\"\",\"shortlabel\":\"\",\"ftype\":\"femail\",\"userhelp\":\"\",\"userhelpTooltip\":\"\",\"csslayout\":\"\",\"title\":\"Email\",\"predefined\":\"\",\"predefinedClick\":false,\"required\":false,\"size\":\"medium\",\"equalTo\":\"\"}],[{\"title\":\"\",\"description\":\"\",\"formlayout\":\"top_aligned\",\"formtemplate\":\"\",\"evalequations\":1,\"autocomplete\":1,\"autofocus\":false}]]', '', 'mm/dd/yy', 'Booking', 'Pay later', '', '', 'krutika.ipar.k@gmail.com', '', 'krutika.ipar.k@gmail.com', 'Notification to administrator: Booking request received...', 'true', 'http://localhost/hospitalonlineapointment/wordpress', 'The following booking request has been received:\r\n\r\n<%INFO%>', 'text', 'fixed', 'fieldname1', 'true', 'email', 'Confirmation: Your booking has been received...', 'Your appointment is received. We look forward to seeing you then.\r\n\r\nThis is a copy of the data sent:\r\n\r\n<%INFO%>\r\n\r\nBest Regards.', 'text', 'fixed', 'Please select a max of {0} appointments per customer.', 'This field is required.', 'Please enter a valid email address.', 'Please enter a valid date with this format(mm/dd/yyyy)', 'Please enter a valid date with this format(dd/mm/yyyy)', 'Please enter a valid number.', 'Please enter only digits.', 'Please enter a value less than or equal to {0}.', 'Please enter a value greater than or equal to {0}.', 'Page {0} of {0}', 'Submit', 'Previous', 'Next', 'Quantity', 'Cancel', 'Cost', 'Selected time is no longer available. Please select a different time.', 'a:0:{}', '', '', 'no', '1', '0', '', 'Submissions report...', 'text', 'Attached you will find the data from the form submissions.', 'true', '180', '60', '5', 'font1', '25', '35', '200', '4', 'ffffff', '000000', 'Please enter a valid captcha code.');

-- --------------------------------------------------------

--
-- Table structure for table `wp_cpappbk_messages`
--

CREATE TABLE `wp_cpappbk_messages` (
  `id` int(10) NOT NULL,
  `formid` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipaddr` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `notifyto` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `posted_data` mediumtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `whoadded` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_cpappbk_messages`
--

INSERT INTO `wp_cpappbk_messages` (`id`, `formid`, `time`, `ipaddr`, `notifyto`, `data`, `posted_data`, `whoadded`) VALUES
(1, 1, '2022-11-04 20:20:30', '::1', 'krutika.ipar.k@gmail.com', 'Appointments:\n - 08/02/2022 10:00-11:00 (Service 1)\n - 08/07/2022 09:00-10:00 (Sample Service)\n\nEmail: krutika.ipar.k@gmail.com\n\nEmail: krutika.ipar.k@gmail.com\n\n', 'a:31:{s:11:\"final_price\";s:5:\"25.99\";s:17:\"final_price_short\";s:2:\"26\";s:17:\"request_timestamp\";s:19:\"11/04/2022 20:20:30\";s:4:\"apps\";a:2:{i:0;a:12:{s:2:\"id\";i:1;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:9:\"Service 1\";s:8:\"duration\";i:60;s:5:\"price\";d:1;s:4:\"date\";s:10:\"2022-08-02\";s:4:\"slot\";s:11:\"10:00/11:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname1\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}i:1;a:12:{s:2:\"id\";i:2;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:14:\"Sample Service\";s:8:\"duration\";i:60;s:5:\"price\";d:24.99;s:4:\"date\";s:10:\"2022-08-07\";s:4:\"slot\";s:11:\"09:00/10:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname2\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}}s:13:\"app_service_1\";s:9:\"Service 1\";s:12:\"app_status_1\";s:0:\"\";s:14:\"app_duration_1\";i:60;s:11:\"app_price_1\";d:1;s:10:\"app_date_1\";s:10:\"08/02/2022\";s:10:\"app_slot_1\";s:11:\"10:00/11:00\";s:15:\"app_starttime_1\";s:5:\"10:00\";s:13:\"app_endtime_1\";s:5:\"11:00\";s:14:\"app_quantity_1\";i:1;s:13:\"app_service_2\";s:14:\"Sample Service\";s:12:\"app_status_2\";s:0:\"\";s:14:\"app_duration_2\";i:60;s:11:\"app_price_2\";d:24.99;s:10:\"app_date_2\";s:10:\"08/07/2022\";s:10:\"app_slot_2\";s:11:\"09:00/10:00\";s:15:\"app_starttime_2\";s:5:\"09:00\";s:13:\"app_endtime_2\";s:5:\"10:00\";s:14:\"app_quantity_2\";i:1;s:6:\"formid\";i:1;s:8:\"formname\";s:0:\"\";s:8:\"referrer\";s:147:\"http://localhost/hospital%20online%20apointment/wordpress/wp-admin/admin.php?page=cp_apphourbooking&amp;addbk=1&amp;cal=1&amp;r=0.08523085962891419\";s:10:\"fieldname1\";s:81:\" - 08/02/2022 10:00-11:00 (Service 1)\n - 08/07/2022 09:00-10:00 (Sample Service)\n\";s:5:\"email\";s:24:\"krutika.ipar.k@gmail.com\";s:10:\"fieldname2\";s:81:\" - 08/02/2022 10:00-11:00 (Service 1)\n - 08/07/2022 09:00-10:00 (Sample Service)\n\";s:10:\"fieldname3\";s:24:\"krutika.ipar.k@gmail.com\";s:8:\"username\";s:5:\"admin\";s:10:\"itemnumber\";i:1;}', '1'),
(2, 1, '2022-11-04 20:22:00', '::1', 'ayush@32.com', 'Appointments:\n - 08/09/2022 11:00-12:00 (Service 1)\n - 11/08/2022 11:00-12:00 (Sample Service)\n\nEmail: ayush@32.com\n\nEmail: \n\n', 'a:31:{s:11:\"final_price\";s:5:\"25.99\";s:17:\"final_price_short\";s:2:\"26\";s:17:\"request_timestamp\";s:19:\"11/04/2022 20:22:00\";s:4:\"apps\";a:2:{i:0;a:12:{s:2:\"id\";i:1;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:9:\"Service 1\";s:8:\"duration\";i:60;s:5:\"price\";d:1;s:4:\"date\";s:10:\"2022-08-09\";s:4:\"slot\";s:11:\"11:00/12:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname1\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}i:1;a:12:{s:2:\"id\";i:2;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:14:\"Sample Service\";s:8:\"duration\";i:60;s:5:\"price\";d:24.99;s:4:\"date\";s:10:\"2022-11-08\";s:4:\"slot\";s:11:\"11:00/12:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname2\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}}s:13:\"app_service_1\";s:9:\"Service 1\";s:12:\"app_status_1\";s:0:\"\";s:14:\"app_duration_1\";i:60;s:11:\"app_price_1\";d:1;s:10:\"app_date_1\";s:10:\"08/09/2022\";s:10:\"app_slot_1\";s:11:\"11:00/12:00\";s:15:\"app_starttime_1\";s:5:\"11:00\";s:13:\"app_endtime_1\";s:5:\"12:00\";s:14:\"app_quantity_1\";i:1;s:13:\"app_service_2\";s:14:\"Sample Service\";s:12:\"app_status_2\";s:0:\"\";s:14:\"app_duration_2\";i:60;s:11:\"app_price_2\";d:24.99;s:10:\"app_date_2\";s:10:\"11/08/2022\";s:10:\"app_slot_2\";s:11:\"11:00/12:00\";s:15:\"app_starttime_2\";s:5:\"11:00\";s:13:\"app_endtime_2\";s:5:\"12:00\";s:14:\"app_quantity_2\";i:1;s:6:\"formid\";i:1;s:8:\"formname\";s:0:\"\";s:8:\"referrer\";s:147:\"http://localhost/hospital%20online%20apointment/wordpress/wp-admin/admin.php?page=cp_apphourbooking&amp;addbk=1&amp;cal=1&amp;r=0.08523085962891419\";s:10:\"fieldname1\";s:81:\" - 08/09/2022 11:00-12:00 (Service 1)\n - 11/08/2022 11:00-12:00 (Sample Service)\n\";s:5:\"email\";s:12:\"ayush@32.com\";s:10:\"fieldname2\";s:81:\" - 08/09/2022 11:00-12:00 (Service 1)\n - 11/08/2022 11:00-12:00 (Sample Service)\n\";s:10:\"fieldname3\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:10:\"itemnumber\";i:2;}', '1'),
(3, 1, '2022-11-04 20:22:26', '::1', 'uhjds@hdu.cuj', 'Appointments:\n - 11/10/2022 13:00-14:00 (Service 1)\n - 11/11/2022 12:00-13:00 (Sample Service)\n\nEmail: uhjds@hdu.cuj\n\nEmail: \n\n', 'a:31:{s:11:\"final_price\";s:5:\"25.99\";s:17:\"final_price_short\";s:2:\"26\";s:17:\"request_timestamp\";s:19:\"11/04/2022 20:22:26\";s:4:\"apps\";a:2:{i:0;a:12:{s:2:\"id\";i:1;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:9:\"Service 1\";s:8:\"duration\";i:60;s:5:\"price\";d:1;s:4:\"date\";s:10:\"2022-11-10\";s:4:\"slot\";s:11:\"13:00/14:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname1\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}i:1;a:12:{s:2:\"id\";i:2;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:14:\"Sample Service\";s:8:\"duration\";i:60;s:5:\"price\";d:24.99;s:4:\"date\";s:10:\"2022-11-11\";s:4:\"slot\";s:11:\"12:00/13:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname2\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}}s:13:\"app_service_1\";s:9:\"Service 1\";s:12:\"app_status_1\";s:0:\"\";s:14:\"app_duration_1\";i:60;s:11:\"app_price_1\";d:1;s:10:\"app_date_1\";s:10:\"11/10/2022\";s:10:\"app_slot_1\";s:11:\"13:00/14:00\";s:15:\"app_starttime_1\";s:5:\"13:00\";s:13:\"app_endtime_1\";s:5:\"14:00\";s:14:\"app_quantity_1\";i:1;s:13:\"app_service_2\";s:14:\"Sample Service\";s:12:\"app_status_2\";s:0:\"\";s:14:\"app_duration_2\";i:60;s:11:\"app_price_2\";d:24.99;s:10:\"app_date_2\";s:10:\"11/11/2022\";s:10:\"app_slot_2\";s:11:\"12:00/13:00\";s:15:\"app_starttime_2\";s:5:\"12:00\";s:13:\"app_endtime_2\";s:5:\"13:00\";s:14:\"app_quantity_2\";i:1;s:6:\"formid\";i:1;s:8:\"formname\";s:0:\"\";s:8:\"referrer\";s:147:\"http://localhost/hospital%20online%20apointment/wordpress/wp-admin/admin.php?page=cp_apphourbooking&amp;addbk=1&amp;cal=1&amp;r=0.08523085962891419\";s:10:\"fieldname1\";s:81:\" - 11/10/2022 13:00-14:00 (Service 1)\n - 11/11/2022 12:00-13:00 (Sample Service)\n\";s:5:\"email\";s:13:\"uhjds@hdu.cuj\";s:10:\"fieldname2\";s:81:\" - 11/10/2022 13:00-14:00 (Service 1)\n - 11/11/2022 12:00-13:00 (Sample Service)\n\";s:10:\"fieldname3\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:10:\"itemnumber\";i:3;}', '1'),
(4, 1, '2022-11-04 20:22:52', '::1', 'iuhedc@kjs.uh', 'Appointments:\n - 11/16/2022 14:00-15:00 (Service 1)\n - 11/16/2022 10:00-11:00 (Sample Service)\n\nEmail: iuhedc@kjs.uh\n\nEmail: \n\n', 'a:31:{s:11:\"final_price\";s:5:\"25.99\";s:17:\"final_price_short\";s:2:\"26\";s:17:\"request_timestamp\";s:19:\"11/04/2022 20:22:52\";s:4:\"apps\";a:2:{i:0;a:12:{s:2:\"id\";i:1;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:9:\"Service 1\";s:8:\"duration\";i:60;s:5:\"price\";d:1;s:4:\"date\";s:10:\"2022-11-16\";s:4:\"slot\";s:11:\"14:00/15:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname1\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}i:1;a:12:{s:2:\"id\";i:2;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:14:\"Sample Service\";s:8:\"duration\";i:60;s:5:\"price\";d:24.99;s:4:\"date\";s:10:\"2022-11-16\";s:4:\"slot\";s:11:\"10:00/11:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname2\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}}s:13:\"app_service_1\";s:9:\"Service 1\";s:12:\"app_status_1\";s:0:\"\";s:14:\"app_duration_1\";i:60;s:11:\"app_price_1\";d:1;s:10:\"app_date_1\";s:10:\"11/16/2022\";s:10:\"app_slot_1\";s:11:\"14:00/15:00\";s:15:\"app_starttime_1\";s:5:\"14:00\";s:13:\"app_endtime_1\";s:5:\"15:00\";s:14:\"app_quantity_1\";i:1;s:13:\"app_service_2\";s:14:\"Sample Service\";s:12:\"app_status_2\";s:0:\"\";s:14:\"app_duration_2\";i:60;s:11:\"app_price_2\";d:24.99;s:10:\"app_date_2\";s:10:\"11/16/2022\";s:10:\"app_slot_2\";s:11:\"10:00/11:00\";s:15:\"app_starttime_2\";s:5:\"10:00\";s:13:\"app_endtime_2\";s:5:\"11:00\";s:14:\"app_quantity_2\";i:1;s:6:\"formid\";i:1;s:8:\"formname\";s:0:\"\";s:8:\"referrer\";s:147:\"http://localhost/hospital%20online%20apointment/wordpress/wp-admin/admin.php?page=cp_apphourbooking&amp;addbk=1&amp;cal=1&amp;r=0.08523085962891419\";s:10:\"fieldname1\";s:81:\" - 11/16/2022 14:00-15:00 (Service 1)\n - 11/16/2022 10:00-11:00 (Sample Service)\n\";s:5:\"email\";s:13:\"iuhedc@kjs.uh\";s:10:\"fieldname2\";s:81:\" - 11/16/2022 14:00-15:00 (Service 1)\n - 11/16/2022 10:00-11:00 (Sample Service)\n\";s:10:\"fieldname3\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:10:\"itemnumber\";i:4;}', '1'),
(5, 1, '2022-11-04 20:23:18', '::1', 'ionjd@ugh.cim', 'Appointments:\n - 11/18/2022 15:00-16:00 (Service 1)\n - 11/11/2022 11:00-12:00 (Sample Service)\n\nEmail: ionjd@ugh.cim\n\nEmail: \n\n', 'a:31:{s:11:\"final_price\";s:5:\"25.99\";s:17:\"final_price_short\";s:2:\"26\";s:17:\"request_timestamp\";s:19:\"11/04/2022 20:23:18\";s:4:\"apps\";a:2:{i:0;a:12:{s:2:\"id\";i:1;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:9:\"Service 1\";s:8:\"duration\";i:60;s:5:\"price\";d:1;s:4:\"date\";s:10:\"2022-11-18\";s:4:\"slot\";s:11:\"15:00/16:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname1\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}i:1;a:12:{s:2:\"id\";i:2;s:9:\"cancelled\";s:0:\"\";s:12:\"serviceindex\";i:0;s:7:\"service\";s:14:\"Sample Service\";s:8:\"duration\";i:60;s:5:\"price\";d:24.99;s:4:\"date\";s:10:\"2022-11-11\";s:4:\"slot\";s:11:\"11:00/12:00\";s:8:\"military\";i:1;s:5:\"field\";s:10:\"fieldname2\";s:5:\"quant\";i:1;s:3:\"sid\";i:1;}}s:13:\"app_service_1\";s:9:\"Service 1\";s:12:\"app_status_1\";s:0:\"\";s:14:\"app_duration_1\";i:60;s:11:\"app_price_1\";d:1;s:10:\"app_date_1\";s:10:\"11/18/2022\";s:10:\"app_slot_1\";s:11:\"15:00/16:00\";s:15:\"app_starttime_1\";s:5:\"15:00\";s:13:\"app_endtime_1\";s:5:\"16:00\";s:14:\"app_quantity_1\";i:1;s:13:\"app_service_2\";s:14:\"Sample Service\";s:12:\"app_status_2\";s:0:\"\";s:14:\"app_duration_2\";i:60;s:11:\"app_price_2\";d:24.99;s:10:\"app_date_2\";s:10:\"11/11/2022\";s:10:\"app_slot_2\";s:11:\"11:00/12:00\";s:15:\"app_starttime_2\";s:5:\"11:00\";s:13:\"app_endtime_2\";s:5:\"12:00\";s:14:\"app_quantity_2\";i:1;s:6:\"formid\";i:1;s:8:\"formname\";s:0:\"\";s:8:\"referrer\";s:147:\"http://localhost/hospital%20online%20apointment/wordpress/wp-admin/admin.php?page=cp_apphourbooking&amp;addbk=1&amp;cal=1&amp;r=0.08523085962891419\";s:10:\"fieldname1\";s:81:\" - 11/18/2022 15:00-16:00 (Service 1)\n - 11/11/2022 11:00-12:00 (Sample Service)\n\";s:5:\"email\";s:13:\"ionjd@ugh.cim\";s:10:\"fieldname2\";s:81:\" - 11/18/2022 15:00-16:00 (Service 1)\n - 11/11/2022 11:00-12:00 (Sample Service)\n\";s:10:\"fieldname3\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:10:\"itemnumber\";i:5;}', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/hospital%20online%20apointment/wordpress', 'yes'),
(2, 'home', 'http://localhost/hospital%20online%20apointment/wordpress', 'yes'),
(3, 'blogname', 'City Hospital', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'krutika.ipar.k@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/index.php/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:79:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:42:\"index.php/feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:37:\"index.php/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:18:\"index.php/embed/?$\";s:21:\"index.php?&embed=true\";s:30:\"index.php/page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:51:\"index.php/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:46:\"index.php/comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:27:\"index.php/comments/embed/?$\";s:21:\"index.php?&embed=true\";s:54:\"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:49:\"index.php/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:30:\"index.php/search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:42:\"index.php/search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:24:\"index.php/search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:57:\"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:45:\"index.php/author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:79:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:55:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:49:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:66:\"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:42:\"index.php/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:54:\"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:36:\"index.php/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:53:\"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:48:\"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:29:\"index.php/([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:41:\"index.php/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:23:\"index.php/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:68:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:78:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:98:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:74:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:63:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:87:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:75:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:71:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:57:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:67:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:87:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:63:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:48:\"index.php/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:37:\"index.php/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"index.php/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"index.php/.?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"index.php/(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:30:\"index.php/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:50:\"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:45:\"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:38:\"index.php/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:45:\"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:34:\"index.php/(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:0;s:47:\"appointment-hour-booking/app-booking-plugin.php\";i:1;s:59:\"medical-addon-for-elementor/medical-addon-for-elementor.php\";i:2;s:25:\"profile-builder/index.php\";i:3;s:35:\"ultimate-member/ultimate-member.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentytwentytwo', 'yes'),
(41, 'stylesheet', 'twentytwentytwo', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '53496', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:0:{}', 'yes'),
(77, 'widget_text', 'a:0:{}', 'yes'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:1:{s:51:\"bookly-responsive-appointment-booking-tool/main.php\";a:2:{i:0;s:17:\"Bookly\\Lib\\Plugin\";i:1;s:9:\"uninstall\";}}', 'no'),
(80, 'timezone_string', 'Europe/London', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '11', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1683052143', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '53496', 'yes'),
(100, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'WPLANG', 'en_GB', 'yes'),
(103, 'user_count', '4', 'no'),
(104, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(106, 'cron', 'a:13:{i:1700640009;a:1:{s:21:\"bookly_hourly_routine\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1700641743;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1700641947;a:1:{s:26:\"um_hourly_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1700677743;a:5:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1700677800;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1700677801;a:2:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1700677805;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1700681545;a:1:{s:17:\"wppb_review_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1700681547;a:2:{s:30:\"um_twicedaily_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:25:\"um_daily_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1700683209;a:1:{s:20:\"bookly_daily_routine\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1700850543;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1700854347;a:1:{s:26:\"um_weekly_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(120, 'recovery_keys', 'a:0:{}', 'yes'),
(123, 'theme_mods_twentytwentytwo', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(126, 'https_detection_errors', 'a:1:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:24:\"SSL verification failed.\";}}', 'yes'),
(142, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(143, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(147, 'can_compress_scripts', '1', 'no'),
(153, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:24:\"krutika.ipar.k@gmail.com\";s:7:\"version\";s:3:\"6.2\";s:9:\"timestamp\";i:1683037066;}', 'no'),
(156, 'finished_updating_comment_type', '1', 'yes'),
(177, 'site_logo', '11', 'yes'),
(267, 'wp_calendar_block_has_published_posts', '1', 'yes'),
(337, 'recently_activated', 'a:1:{s:51:\"bookly-responsive-appointment-booking-tool/main.php\";i:1667592189;}', 'yes'),
(346, '_transient_health-check-site-status-result', '{\"good\":13,\"recommended\":6,\"critical\":2}', 'yes'),
(364, 'um_last_version_upgrade', '2.5.1', 'yes'),
(365, 'um_first_activation_date', '1667590295', 'yes'),
(366, 'um_version', '2.5.1', 'yes'),
(367, '__ultimatemember_sitekey', 'localhost/hospitalonlineapointment/wordpress-k7uXHLX63zPCX9scdMgP', 'yes'),
(368, 'um_is_installed', '1', 'yes'),
(369, 'um_core_forms', 'a:3:{s:8:\"register\";i:60;s:5:\"login\";i:61;s:7:\"profile\";i:62;}', 'yes'),
(370, 'um_core_directories', 'a:1:{s:7:\"members\";i:63;}', 'yes'),
(371, 'um_options', 'a:173:{s:30:\"restricted_access_post_metabox\";a:2:{s:4:\"post\";i:1;s:4:\"page\";i:1;}s:31:\"disable_restriction_pre_queries\";i:0;s:19:\"uninstall_on_delete\";i:0;s:14:\"permalink_base\";s:10:\"user_login\";s:12:\"display_name\";s:9:\"full_name\";s:18:\"display_name_field\";s:0:\"\";s:15:\"author_redirect\";i:1;s:12:\"members_page\";i:1;s:13:\"use_gravatars\";i:0;s:37:\"use_um_gravatar_default_builtin_image\";s:7:\"default\";s:29:\"use_um_gravatar_default_image\";i:0;s:18:\"require_strongpass\";i:0;s:18:\"password_min_chars\";i:8;s:18:\"password_max_chars\";i:30;s:20:\"account_tab_password\";i:1;s:19:\"account_tab_privacy\";i:1;s:25:\"account_tab_notifications\";i:1;s:18:\"account_tab_delete\";i:1;s:19:\"delete_account_text\";s:151:\"Are you sure you want to delete your account? This will erase all of your account data from the site. To delete your account enter your password below.\";s:36:\"delete_account_no_pass_required_text\";s:152:\"Are you sure you want to delete your account? This will erase all of your account data from the site. To delete your account, click on the button below.\";s:12:\"account_name\";i:1;s:20:\"account_name_disable\";i:0;s:20:\"account_name_require\";i:1;s:13:\"account_email\";i:1;s:24:\"account_general_password\";i:0;s:25:\"account_hide_in_directory\";i:1;s:33:\"account_hide_in_directory_default\";s:2:\"No\";s:17:\"photo_thumb_sizes\";a:3:{i:0;i:40;i:1;i:80;i:2;i:190;}s:17:\"cover_thumb_sizes\";a:2:{i:0;i:300;i:1;i:600;}s:10:\"accessible\";i:0;s:15:\"access_redirect\";s:0:\"\";s:19:\"access_exclude_uris\";a:0:{}s:20:\"home_page_accessible\";i:1;s:24:\"category_page_accessible\";i:1;s:29:\"restricted_post_title_replace\";i:1;s:28:\"restricted_access_post_title\";s:18:\"Restricted content\";s:25:\"restricted_access_message\";s:0:\"\";s:17:\"restricted_blocks\";i:0;s:13:\"enable_blocks\";i:0;s:24:\"restricted_block_message\";s:0:\"\";s:27:\"enable_reset_password_limit\";i:1;s:27:\"reset_password_limit_number\";i:3;s:14:\"blocked_emails\";s:0:\"\";s:13:\"blocked_words\";s:47:\"admin\r\nadministrator\r\nwebmaster\r\nsupport\r\nstaff\";s:24:\"allowed_choice_callbacks\";s:0:\"\";s:26:\"allow_url_redirect_confirm\";i:1;s:14:\"default_avatar\";s:0:\"\";s:13:\"default_cover\";s:0:\"\";s:28:\"disable_profile_photo_upload\";i:0;s:21:\"profile_show_metaicon\";i:0;s:12:\"profile_menu\";i:1;s:24:\"profile_menu_default_tab\";s:4:\"main\";s:18:\"profile_menu_icons\";i:1;s:13:\"form_asterisk\";i:0;s:13:\"profile_title\";s:28:\"{display_name} | {site_name}\";s:12:\"profile_desc\";s:83:\"{display_name} is on {site_name}. Join {site_name} to view {display_name}\'s profile\";s:11:\"admin_email\";s:24:\"krutika.ipar.k@gmail.com\";s:9:\"mail_from\";s:13:\"City Hospital\";s:14:\"mail_from_addr\";s:24:\"krutika.ipar.k@gmail.com\";s:10:\"email_html\";i:1;s:25:\"image_orientation_by_exif\";i:0;s:17:\"image_compression\";i:60;s:15:\"image_max_width\";i:1000;s:15:\"cover_min_width\";i:1000;s:22:\"profile_photo_max_size\";i:999999999;s:20:\"cover_photo_max_size\";i:999999999;s:22:\"custom_roles_increment\";i:1;s:28:\"um_profile_object_cache_stop\";i:0;s:16:\"rest_api_version\";s:3:\"2.0\";s:26:\"member_directory_own_table\";i:0;s:21:\"profile_show_html_bio\";i:0;s:15:\"profile_noindex\";i:0;s:27:\"activation_link_expiry_time\";s:0:\"\";s:16:\"profile_tab_main\";i:1;s:24:\"profile_tab_main_privacy\";i:0;s:22:\"profile_tab_main_roles\";s:0:\"\";s:17:\"profile_tab_posts\";i:1;s:25:\"profile_tab_posts_privacy\";i:0;s:23:\"profile_tab_posts_roles\";s:0:\"\";s:20:\"profile_tab_comments\";i:1;s:28:\"profile_tab_comments_privacy\";i:0;s:26:\"profile_tab_comments_roles\";s:0:\"\";s:16:\"welcome_email_on\";b:1;s:17:\"welcome_email_sub\";s:23:\"Welcome to {site_name}!\";s:13:\"welcome_email\";s:365:\"Hi {display_name},<br /><br />Thank you for signing up with {site_name}! Your account is now active.<br /><br />To login please visit the following url:<br /><br />{login_url} <br /><br />Your account e-mail: {email} <br />Your account username: {username} <br /><br />If you have any problems, please contact us at {admin_email}<br /><br />Thanks,<br />{site_name}\";s:18:\"checkmail_email_on\";b:0;s:19:\"checkmail_email_sub\";s:28:\"Please activate your account\";s:15:\"checkmail_email\";s:304:\"Hi {display_name},<br /><br />Thank you for signing up with {site_name}! To activate your account, please click the link below to confirm your email address:<br /><br />{account_activation_link} <br /><br />If you have any problems, please contact us at {admin_email}<br /><br />Thanks, <br />{site_name}\";s:16:\"pending_email_on\";b:0;s:17:\"pending_email_sub\";s:30:\"[{site_name}] New user account\";s:13:\"pending_email\";s:309:\"Hi {display_name}, <br /><br />Thank you for signing up with {site_name}! Your account is currently being reviewed by a member of our team.<br /><br />Please allow us some time to process your request.<br /><br />If you have any problems, please contact us at {admin_email}<br /><br />Thanks,<br />{site_name}\";s:17:\"approved_email_on\";b:0;s:18:\"approved_email_sub\";s:41:\"Your account at {site_name} is now active\";s:14:\"approved_email\";s:438:\"Hi {display_name},<br /><br />Thank you for signing up with {site_name}! Your account has been approved and is now active.<br /><br />To login please visit the following url:<br /><br />{login_url}<br /><br />Your account e-mail: {email}<br />Your account username: {username}<br />Set your account password: {password_reset_link}<br /><br />If you have any problems, please contact us at {admin_email}<br /><br />Thanks,<br />{site_name}\";s:17:\"rejected_email_on\";b:0;s:18:\"rejected_email_sub\";s:30:\"Your account has been rejected\";s:14:\"rejected_email\";s:288:\"Hi {display_name},<br /><br />Thank you for applying for membership to {site_name}! We have reviewed your information and unfortunately we are unable to accept you as a member at this moment.<br /><br />Please feel free to apply again at a future date.<br /><br />Thanks,<br />{site_name}\";s:17:\"inactive_email_on\";b:1;s:18:\"inactive_email_sub\";s:33:\"Your account has been deactivated\";s:14:\"inactive_email\";s:250:\"Hi {display_name},<br /><br />This is an automated email to let you know your {site_name} account has been deactivated.<br /><br />If you would like your account to be reactivated please contact us at {admin_email}<br /><br />Thanks,<br />{site_name}\";s:17:\"deletion_email_on\";b:1;s:18:\"deletion_email_sub\";s:29:\"Your account has been deleted\";s:14:\"deletion_email\";s:355:\"Hi {display_name},<br /><br />This is an automated email to let you know your {site_name} account has been deleted. All of your personal information has been permanently deleted and you will no longer be able to login to {site_name}.<br /><br />If your account has been deleted by accident please contact us at {admin_email} <br />Thanks,<br />{site_name}\";s:16:\"resetpw_email_on\";b:1;s:17:\"resetpw_email_sub\";s:19:\"Reset your password\";s:13:\"resetpw_email\";s:303:\"Hi {display_name},<br /><br />We received a request to reset the password for your account. If you made this request, click the link below to change your password:<br /><br />{password_reset_link}<br /><br />If you didn\'t make this request, you can ignore this email <br /><br />Thanks,<br />{site_name}\";s:18:\"changedpw_email_on\";b:1;s:19:\"changedpw_email_sub\";s:42:\"Your {site_name} password has been changed\";s:15:\"changedpw_email\";s:307:\"Hi {display_name},<br /><br />You recently changed the password associated with your {site_name} account.<br /><br />If you did not make this change and believe your {site_name} account has been compromised, please contact us at the following email address: {admin_email}<br /><br />Thanks,<br />{site_name}\";s:23:\"changedaccount_email_on\";b:1;s:24:\"changedaccount_email_sub\";s:39:\"Your account at {site_name} was updated\";s:20:\"changedaccount_email\";s:278:\"Hi {display_name},<br /><br />You recently updated your {site_name} account.<br /><br />If you did not make this change and believe your {site_name} account has been compromised, please contact us at the following email address: {admin_email}<br /><br />Thanks,<br />{site_name}\";s:24:\"notification_new_user_on\";b:1;s:25:\"notification_new_user_sub\";s:30:\"[{site_name}] New user account\";s:21:\"notification_new_user\";s:211:\"{display_name} has just created an account on {site_name}. To view their profile click here:<br /><br />{user_profile_link}<br /><br />Here is the submitted registration form:<br /><br />{submitted_registration}\";s:22:\"notification_review_on\";b:0;s:23:\"notification_review_sub\";s:38:\"[{site_name}] New user awaiting review\";s:19:\"notification_review\";s:277:\"{display_name} has just applied for membership to {site_name} and is waiting to be reviewed.<br /><br />To review this member please click the following link:<br /><br />{user_profile_link}<br /><br />Here is the submitted registration form:<br /><br />{submitted_registration}\";s:24:\"notification_deletion_on\";b:0;s:25:\"notification_deletion_sub\";s:29:\"[{site_name}] Account deleted\";s:21:\"notification_deletion\";s:58:\"{display_name} has just deleted their {site_name} account.\";s:9:\"core_user\";s:0:\"\";s:10:\"core_login\";s:0:\"\";s:13:\"core_register\";s:0:\"\";s:12:\"core_members\";s:0:\"\";s:11:\"core_logout\";s:0:\"\";s:12:\"core_account\";s:0:\"\";s:19:\"core_password-reset\";s:0:\"\";s:17:\"profile_show_name\";i:1;s:25:\"profile_show_social_links\";i:0;s:16:\"profile_show_bio\";i:1;s:20:\"profile_bio_maxchars\";i:180;s:19:\"profile_header_menu\";s:2:\"bc\";s:18:\"profile_empty_text\";i:1;s:22:\"profile_empty_text_emo\";i:1;s:12:\"profile_role\";a:0:{}s:16:\"profile_template\";s:7:\"profile\";s:17:\"profile_max_width\";s:6:\"1000px\";s:22:\"profile_area_max_width\";s:5:\"600px\";s:13:\"profile_align\";s:6:\"center\";s:13:\"profile_icons\";s:5:\"label\";s:28:\"profile_disable_photo_upload\";i:0;s:17:\"profile_photosize\";s:3:\"190\";s:21:\"profile_cover_enabled\";i:1;s:17:\"profile_coversize\";s:8:\"original\";s:19:\"profile_cover_ratio\";s:5:\"2.7:1\";s:19:\"profile_photocorner\";s:1:\"1\";s:17:\"profile_header_bg\";s:0:\"\";s:24:\"profile_primary_btn_word\";s:14:\"Update Profile\";s:21:\"profile_secondary_btn\";s:1:\"1\";s:26:\"profile_secondary_btn_word\";s:6:\"Cancel\";s:13:\"register_role\";s:1:\"0\";s:17:\"register_template\";s:8:\"register\";s:18:\"register_max_width\";s:5:\"450px\";s:14:\"register_align\";s:6:\"center\";s:14:\"register_icons\";s:5:\"label\";s:25:\"register_primary_btn_word\";s:8:\"Register\";s:22:\"register_secondary_btn\";i:1;s:27:\"register_secondary_btn_word\";s:5:\"Login\";s:26:\"register_secondary_btn_url\";s:0:\"\";s:14:\"login_template\";s:5:\"login\";s:15:\"login_max_width\";s:5:\"450px\";s:11:\"login_align\";s:6:\"center\";s:11:\"login_icons\";s:5:\"label\";s:22:\"login_primary_btn_word\";s:5:\"Login\";s:22:\"login_forgot_pass_link\";i:1;s:21:\"login_show_rememberme\";i:1;s:19:\"login_secondary_btn\";i:1;s:24:\"login_secondary_btn_word\";s:8:\"Register\";s:23:\"login_secondary_btn_url\";s:0:\"\";s:18:\"directory_template\";s:7:\"members\";s:16:\"directory_header\";s:21:\"{total_users} Members\";s:23:\"directory_header_single\";s:20:\"{total_users} Member\";}', 'yes'),
(372, 'um_role_subscriber_meta', 'a:14:{s:22:\"_um_can_access_wpadmin\";i:0;s:24:\"_um_can_not_see_adminbar\";i:1;s:21:\"_um_can_edit_everyone\";i:0;s:23:\"_um_can_delete_everyone\";i:0;s:20:\"_um_can_edit_profile\";i:1;s:22:\"_um_can_delete_profile\";i:1;s:15:\"_um_after_login\";s:16:\"redirect_profile\";s:16:\"_um_after_logout\";s:13:\"redirect_home\";s:20:\"_um_default_homepage\";i:1;s:16:\"_um_can_view_all\";i:1;s:28:\"_um_can_make_private_profile\";i:0;s:30:\"_um_can_access_private_profile\";i:0;s:10:\"_um_status\";s:8:\"approved\";s:20:\"_um_auto_approve_act\";s:16:\"redirect_profile\";}', 'yes'),
(373, 'um_role_author_meta', 'a:14:{s:22:\"_um_can_access_wpadmin\";i:0;s:24:\"_um_can_not_see_adminbar\";i:1;s:21:\"_um_can_edit_everyone\";i:0;s:23:\"_um_can_delete_everyone\";i:0;s:20:\"_um_can_edit_profile\";i:1;s:22:\"_um_can_delete_profile\";i:1;s:15:\"_um_after_login\";s:16:\"redirect_profile\";s:16:\"_um_after_logout\";s:13:\"redirect_home\";s:20:\"_um_default_homepage\";i:1;s:16:\"_um_can_view_all\";i:1;s:28:\"_um_can_make_private_profile\";i:0;s:30:\"_um_can_access_private_profile\";i:0;s:10:\"_um_status\";s:8:\"approved\";s:20:\"_um_auto_approve_act\";s:16:\"redirect_profile\";}', 'yes'),
(374, 'um_role_contributor_meta', 'a:14:{s:22:\"_um_can_access_wpadmin\";i:0;s:24:\"_um_can_not_see_adminbar\";i:1;s:21:\"_um_can_edit_everyone\";i:0;s:23:\"_um_can_delete_everyone\";i:0;s:20:\"_um_can_edit_profile\";i:1;s:22:\"_um_can_delete_profile\";i:1;s:15:\"_um_after_login\";s:16:\"redirect_profile\";s:16:\"_um_after_logout\";s:13:\"redirect_home\";s:20:\"_um_default_homepage\";i:1;s:16:\"_um_can_view_all\";i:1;s:28:\"_um_can_make_private_profile\";i:0;s:30:\"_um_can_access_private_profile\";i:0;s:10:\"_um_status\";s:8:\"approved\";s:20:\"_um_auto_approve_act\";s:16:\"redirect_profile\";}', 'yes'),
(375, 'um_role_editor_meta', 'a:14:{s:22:\"_um_can_access_wpadmin\";i:0;s:24:\"_um_can_not_see_adminbar\";i:1;s:21:\"_um_can_edit_everyone\";i:0;s:23:\"_um_can_delete_everyone\";i:0;s:20:\"_um_can_edit_profile\";i:1;s:22:\"_um_can_delete_profile\";i:1;s:15:\"_um_after_login\";s:16:\"redirect_profile\";s:16:\"_um_after_logout\";s:13:\"redirect_home\";s:20:\"_um_default_homepage\";i:1;s:16:\"_um_can_view_all\";i:1;s:28:\"_um_can_make_private_profile\";i:0;s:30:\"_um_can_access_private_profile\";i:0;s:10:\"_um_status\";s:8:\"approved\";s:20:\"_um_auto_approve_act\";s:16:\"redirect_profile\";}', 'yes'),
(376, 'um_role_administrator_meta', 'a:14:{s:22:\"_um_can_access_wpadmin\";i:1;s:24:\"_um_can_not_see_adminbar\";i:0;s:21:\"_um_can_edit_everyone\";i:1;s:23:\"_um_can_delete_everyone\";i:1;s:20:\"_um_can_edit_profile\";i:1;s:22:\"_um_can_delete_profile\";i:1;s:20:\"_um_default_homepage\";i:1;s:15:\"_um_after_login\";s:14:\"redirect_admin\";s:16:\"_um_after_logout\";s:13:\"redirect_home\";s:16:\"_um_can_view_all\";i:1;s:28:\"_um_can_make_private_profile\";i:1;s:30:\"_um_can_access_private_profile\";i:1;s:10:\"_um_status\";s:8:\"approved\";s:20:\"_um_auto_approve_act\";s:16:\"redirect_profile\";}', 'yes'),
(379, '_transient_um_count_users_approved', '1', 'yes'),
(380, 'widget_um_search_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(381, 'um_cache_userdata_1', 'a:97:{s:2:\"ID\";i:1;s:10:\"user_login\";s:5:\"admin\";s:9:\"user_pass\";s:34:\"$P$BtlGWToXicrYjPdIJR.Dkli5E5.x.U0\";s:13:\"user_nicename\";s:5:\"admin\";s:10:\"user_email\";s:24:\"krutika.ipar.k@gmail.com\";s:8:\"user_url\";s:57:\"http://localhost/hospital%20online%20apointment/wordpress\";s:15:\"user_registered\";s:19:\"2022-11-03 18:29:03\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:5:\"admin\";s:13:\"administrator\";b:1;s:8:\"wp_roles\";s:13:\"administrator\";s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:6:\"filter\";N;s:16:\"\0WP_User\0site_id\";i:1;s:8:\"nickname\";s:5:\"admin\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"rich_editing\";s:4:\"true\";s:19:\"syntax_highlighting\";s:4:\"true\";s:17:\"comment_shortcuts\";s:5:\"false\";s:11:\"admin_color\";s:5:\"fresh\";s:7:\"use_ssl\";s:1:\"0\";s:20:\"show_admin_bar_front\";s:4:\"true\";s:6:\"locale\";s:0:\"\";s:18:\"show_welcome_panel\";s:1:\"1\";s:37:\"wp_dashboard_quick_press_last_post_id\";s:1:\"4\";s:24:\"wp_persisted_preferences\";s:362:\"a:3:{s:14:\"core/edit-post\";a:3:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;s:10:\"openPanels\";a:4:{i:0;s:11:\"post-status\";i:1;s:14:\"featured-image\";i:2;s:15:\"page-attributes\";i:3;s:16:\"discussion-panel\";}}s:9:\"_modified\";s:24:\"2022-11-04T19:24:53.011Z\";s:14:\"core/edit-site\";a:2:{s:12:\"welcomeGuide\";b:0;s:26:\"isComplementaryAreaVisible\";b:1;}}\";s:14:\"account_status\";s:8:\"approved\";s:24:\"um_member_directory_data\";s:137:\"a:5:{s:14:\"account_status\";s:8:\"approved\";s:15:\"hide_in_members\";b:0;s:13:\"profile_photo\";b:0;s:11:\"cover_photo\";b:0;s:8:\"verified\";b:0;}\";s:19:\"account_status_name\";s:8:\"Approved\";s:4:\"role\";s:13:\"administrator\";s:5:\"roles\";a:1:{i:0;s:13:\"administrator\";}s:18:\"can_access_wpadmin\";i:1;s:20:\"can_not_see_adminbar\";i:0;s:17:\"can_edit_everyone\";i:1;s:19:\"can_delete_everyone\";i:1;s:16:\"can_edit_profile\";i:1;s:18:\"can_delete_profile\";i:1;s:16:\"default_homepage\";i:1;s:11:\"after_login\";s:14:\"redirect_admin\";s:12:\"after_logout\";s:13:\"redirect_home\";s:12:\"can_view_all\";i:1;s:24:\"can_make_private_profile\";i:1;s:26:\"can_access_private_profile\";i:1;s:6:\"status\";s:8:\"approved\";s:16:\"auto_approve_act\";s:16:\"redirect_profile\";s:11:\"super_admin\";i:1;}', 'no'),
(382, '_transient_um_count_users_pending_dot', '0', 'yes'),
(385, 'wppb_review_request_status', '0', 'yes'),
(386, 'wppb_old_add_ons_status', 'a:20:{s:42:\"pd-add-on-multiple-admin-e-mails/index.php\";b:0;s:41:\"pb-add-on-customization-toolbox/index.php\";b:0;s:44:\"pb-add-on-email-confirmation-field/index.php\";b:0;s:37:\"pb-add-on-placeholder-labels/pbpl.php\";b:0;s:78:\"pb-add-on-gdpr-communication-preferences/pb-gdpr-communication-preferences.php\";b:0;s:30:\"pb-add-on-labels-edit/pble.php\";b:0;s:44:\"pb-add-on-maximum-character-length/index.php\";b:0;s:48:\"pb-add-on-custom-css-classes-on-fields/index.php\";b:0;s:32:\"pb-add-on-import-export/pbie.php\";b:0;s:30:\"pb-add-on-buddypress/index.php\";b:0;s:34:\"pb-add-on-social-connect/index.php\";b:0;s:31:\"pb-add-on-woocommerce/index.php\";b:0;s:36:\"pb-add-on-multi-step-forms/index.php\";b:0;s:41:\"pb-add-on-mailchimp-integration/index.php\";b:0;s:27:\"pb-add-on-bbpress/index.php\";b:0;s:36:\"pb-add-on-campaign-monitor/index.php\";b:0;s:36:\"pb-add-on-field-visibility/index.php\";b:0;s:50:\"pb-add-on-edit-profile-approved-by-admin/index.php\";b:0;s:40:\"pb-add-on-custom-profile-menus/index.php\";b:0;s:40:\"pb-add-on-mailpoet-integration/index.php\";b:0;}', 'yes'),
(387, 'wppb_free_add_ons_settings', 'a:5:{s:30:\"gdpr-communication-preferences\";b:0;s:11:\"labels-edit\";b:0;s:24:\"maximum-character-length\";b:0;s:28:\"custom-css-classes-on-fields\";b:0;s:13:\"import-export\";b:0;}', 'yes'),
(388, 'wppb_advanced_add_ons_settings', 'a:11:{s:10:\"buddypress\";b:0;s:14:\"social-connect\";b:0;s:11:\"woocommerce\";b:0;s:16:\"multi-step-forms\";b:0;s:21:\"mailchimp-integration\";b:0;s:7:\"bbpress\";b:0;s:16:\"campaign-monitor\";b:0;s:16:\"field-visibility\";b:0;s:30:\"edit-profile-approved-by-admin\";b:0;s:20:\"custom-profile-menus\";b:0;s:20:\"mailpoet-integration\";b:0;}', 'yes'),
(389, 'wppb_toolbox_forms_settings', 'a:4:{s:9:\"ec-bypass\";a:0:{}s:29:\"restricted-email-domains-data\";a:0:{}s:32:\"restricted-email-domains-message\";s:81:\"The email address you are trying to register with is not allowed on this website.\";s:18:\"placeholder-labels\";s:0:\"\";}', 'yes'),
(390, 'wppb_toolbox_fields_settings', 'a:3:{s:23:\"restricted-words-fields\";a:0:{}s:21:\"restricted-words-data\";a:0:{}s:24:\"restricted-words-message\";s:38:\"Your submission contains banned words.\";}', 'yes'),
(391, 'wppb_toolbox_userlisting_settings', 'a:0:{}', 'yes'),
(392, 'wppb_toolbox_shortcodes_settings', 'a:0:{}', 'yes'),
(393, 'wppb_toolbox_admin_settings', 'a:2:{s:21:\"multiple-admin-emails\";s:0:\"\";s:12:\"admin-emails\";s:24:\"krutika.ipar.k@gmail.com\";}', 'yes'),
(394, 'widget_wppb-login-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(395, 'wppb_version', '3.8.4', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(396, 'wppb_manage_fields', 'a:13:{i:0;a:21:{s:2:\"id\";i:1;s:5:\"field\";s:24:\"Default - Name (Heading)\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:4:\"Name\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:1;a:21:{s:2:\"id\";i:2;s:5:\"field\";s:18:\"Default - Username\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:8:\"Username\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:3:\"Yes\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:2;a:21:{s:2:\"id\";i:3;s:5:\"field\";s:20:\"Default - First Name\";s:9:\"meta-name\";s:10:\"first_name\";s:11:\"field-title\";s:10:\"First Name\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:3;a:21:{s:2:\"id\";i:4;s:5:\"field\";s:19:\"Default - Last Name\";s:9:\"meta-name\";s:9:\"last_name\";s:11:\"field-title\";s:9:\"Last Name\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:4;a:21:{s:2:\"id\";i:5;s:5:\"field\";s:18:\"Default - Nickname\";s:9:\"meta-name\";s:8:\"nickname\";s:11:\"field-title\";s:8:\"Nickname\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:5;a:21:{s:2:\"id\";i:6;s:5:\"field\";s:34:\"Default - Display name publicly as\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:24:\"Display name publicly as\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:6;a:21:{s:2:\"id\";i:7;s:5:\"field\";s:32:\"Default - Contact Info (Heading)\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:12:\"Contact Info\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:7;a:21:{s:2:\"id\";i:8;s:5:\"field\";s:16:\"Default - E-mail\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:6:\"E-mail\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:3:\"Yes\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:8;a:21:{s:2:\"id\";i:9;s:5:\"field\";s:17:\"Default - Website\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:7:\"Website\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:9;a:21:{s:2:\"id\";i:10;s:5:\"field\";s:34:\"Default - About Yourself (Heading)\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:14:\"About Yourself\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:10;a:21:{s:2:\"id\";i:11;s:5:\"field\";s:27:\"Default - Biographical Info\";s:9:\"meta-name\";s:11:\"description\";s:11:\"field-title\";s:17:\"Biographical Info\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:2:\"No\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:11;a:21:{s:2:\"id\";i:12;s:5:\"field\";s:18:\"Default - Password\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:8:\"Password\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:3:\"Yes\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}i:12;a:21:{s:2:\"id\";i:13;s:5:\"field\";s:25:\"Default - Repeat Password\";s:9:\"meta-name\";s:0:\"\";s:11:\"field-title\";s:15:\"Repeat Password\";s:11:\"description\";s:0:\"\";s:8:\"required\";s:3:\"Yes\";s:18:\"overwrite-existing\";s:2:\"No\";s:9:\"row-count\";s:1:\"5\";s:24:\"allowed-image-extensions\";s:2:\".*\";s:25:\"allowed-upload-extensions\";s:2:\".*\";s:11:\"avatar-size\";s:3:\"100\";s:11:\"date-format\";s:8:\"mm/dd/yy\";s:18:\"terms-of-agreement\";s:0:\"\";s:7:\"options\";s:0:\"\";s:6:\"labels\";s:0:\"\";s:10:\"public-key\";s:0:\"\";s:11:\"private-key\";s:0:\"\";s:13:\"default-value\";s:0:\"\";s:14:\"default-option\";s:0:\"\";s:15:\"default-options\";s:0:\"\";s:15:\"default-content\";s:0:\"\";}}', 'yes'),
(397, 'wppb_general_settings', 'a:8:{s:17:\"extraFieldsLayout\";s:7:\"default\";s:18:\"automaticallyLogIn\";s:2:\"No\";s:17:\"emailConfirmation\";s:2:\"no\";s:21:\"activationLandingPage\";s:0:\"\";s:13:\"adminApproval\";s:2:\"no\";s:9:\"loginWith\";s:13:\"usernameemail\";s:11:\"rolesEditor\";s:2:\"no\";s:23:\"conditional_fields_ajax\";s:2:\"no\";}', 'yes'),
(398, 'wppb_admin_emailc_common_settings_header', 'These settings are also replicated in the \"User Email Customizer\" settings-page upon save. Valid tags {{reply_to}} and {{site_name}}', 'yes'),
(399, 'wppb_emailc_common_settings_from_name', '{{site_name}}', 'yes'),
(400, 'wppb_emailc_common_settings_from_reply_to_email', '{{reply_to}}', 'yes'),
(401, 'wppb_admin_emailc_default_registration_email_subject', '[{{site_name}}] A new subscriber has (been) registered!', 'yes'),
(402, 'wppb_admin_emailc_default_registration_email_enabled', 'on', 'yes'),
(403, 'wppb_admin_emailc_default_registration_email_content', '<p>New subscriber on {{site_name}}.</p>\n<p>Username:{{username}}</p>\n<p>Email:{{user_email}}</p>\n', 'yes'),
(404, 'wppb_admin_emailc_user_password_reset_email_subject', '[{{site_name}}] Password Successfully Reset for {{username}}', 'yes'),
(405, 'wppb_admin_emailc_user_password_reset_email_enabled', 'on', 'yes'),
(406, 'wppb_admin_emailc_user_password_reset_email_content', '<p>{{username}} has requested a password change via the password reset feature.</p>\n', 'yes'),
(407, 'wppb_user_emailc_default_registration_email_subject', 'A new account has been created for you on {{site_name}}', 'yes'),
(408, 'wppb_user_emailc_default_registration_email_enabled', 'on', 'yes'),
(409, 'wppb_user_emailc_default_registration_email_content', '<h3>Welcome to {{site_name}}!</h3>\n<p>Your username is: {{username}}</p>\n', 'yes'),
(410, 'wppb_user_emailc_registr_w_email_confirm_email_subject', '[{{site_name}}] Activate {{username}}', 'yes'),
(411, 'wppb_user_emailc_registr_w_email_confirm_email_enabled', 'on', 'yes'),
(412, 'wppb_user_emailc_registr_w_email_confirm_email_content', '<p>To activate your user, please click the following link:<br/>\n{{{activation_link}}}</p>\n<p>After you activate, you will receive another email with your credentials.</p>\n', 'yes'),
(413, 'wppb_user_emailc_reset_email_subject', '[{{site_name}}] Password Reset', 'yes'),
(414, 'wppb_user_emailc_reset_email_enabled', 'on', 'yes'),
(415, 'wppb_user_emailc_reset_email_content', '<p>Someone requested that the password be reset for the following account: {{site_name}}<br/>\nUsername: {{username}}</p>\n<p>If this was a mistake, just ignore this email and nothing will happen.</p>\n<p>To reset your password, visit the following address:<br/>\n{{{reset_link}}}</p>\n', 'yes'),
(416, 'wppb_user_emailc_reset_success_email_subject', '[{{site_name}}] Password Reset Successfully', 'yes'),
(417, 'wppb_user_emailc_reset_success_email_enabled', 'on', 'yes'),
(418, 'wppb_user_emailc_reset_success_email_content', '<p>You have successfully reset your password.</p>\n', 'yes'),
(419, 'wppb_user_emailc_change_email_address_request_subject', '[{{site_name}}] Notice of Email Change Request', 'yes'),
(420, 'wppb_user_emailc_change_email_address_request_enabled', 'on', 'yes'),
(421, 'wppb_user_emailc_change_email_address_request_content', '<h3>Hi {{username}},</h3>\n<p>There is an email address change request on {{site_name}}.</p>\n<p>To change your email address click on: {{{user_email_change_link}}}</p>\n<p>Regards,<br>\nAll at {{site_name}}<br>\n<a href=\"{{site_url}}\">{{site_url}}</a></p>', 'yes'),
(422, 'wppb_user_emailc_change_email_address_subject', '[{{site_name}}] Notice of Email Change', 'yes'),
(423, 'wppb_user_emailc_change_email_address_enabled', 'on', 'yes'),
(424, 'wppb_user_emailc_change_email_address_content', '<h3>Hi {{username}},</h3>\n<p>This notice confirms that your email was changed on {{site_name}}.</p>\n<p>If you did not change your email, please contact the Site Administrator at krutika.ipar.k@gmail.com</p>\n<p>This email has been sent to {{user_email}}</p>\n<p>Regards,<br>\nAll at {{site_name}}<br>\n<a href=\"{{site_url}}\">{{site_url}}</a></p>', 'yes'),
(425, 'wppb_module_settings', 'a:6:{s:16:\"wppb_userListing\";s:4:\"hide\";s:19:\"wppb_customRedirect\";s:4:\"hide\";s:20:\"wppb_emailCustomizer\";s:4:\"hide\";s:29:\"wppb_multipleEditProfileForms\";s:4:\"hide\";s:30:\"wppb_multipleRegistrationForms\";s:4:\"hide\";s:19:\"wppb_repeaterFields\";s:4:\"hide\";}', 'yes'),
(427, 'wppb_pages_created', 'true', 'yes'),
(445, 'um_hidden_admin_notices', 'a:1:{i:0;s:11:\"wrong_pages\";}', 'yes'),
(484, 'um_cache_userdata_2', 'a:44:{s:2:\"ID\";i:2;s:10:\"user_login\";s:12:\"krutika.ipar\";s:9:\"user_pass\";s:34:\"$P$BTOBjW05GWwprU2A2UN8DDajsskKRT0\";s:13:\"user_nicename\";s:12:\"krutika-ipar\";s:10:\"user_email\";s:22:\"krutika.ipar@gmail.com\";s:8:\"user_url\";s:70:\"http://localhost/hospital%20online%20apointment/wordpress/index.php/si\";s:15:\"user_registered\";s:19:\"2022-11-04 19:54:41\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:12:\"krutika Ipar\";s:10:\"subscriber\";b:1;s:8:\"wp_roles\";s:10:\"subscriber\";s:4:\"read\";b:1;s:6:\"filter\";N;s:16:\"\0WP_User\0site_id\";i:1;s:8:\"nickname\";s:6:\"KSIpar\";s:10:\"first_name\";s:7:\"krutika\";s:9:\"last_name\";s:4:\"Ipar\";s:11:\"description\";s:12:\"Always happy\";s:12:\"rich_editing\";s:4:\"true\";s:19:\"syntax_highlighting\";s:4:\"true\";s:17:\"comment_shortcuts\";s:5:\"false\";s:11:\"admin_color\";s:5:\"fresh\";s:7:\"use_ssl\";s:1:\"0\";s:20:\"show_admin_bar_front\";s:4:\"true\";s:6:\"locale\";s:0:\"\";s:14:\"account_status\";s:8:\"approved\";s:19:\"account_status_name\";s:8:\"Approved\";s:4:\"role\";s:10:\"subscriber\";s:5:\"roles\";a:1:{i:0;s:10:\"subscriber\";}s:18:\"can_access_wpadmin\";i:0;s:20:\"can_not_see_adminbar\";i:1;s:17:\"can_edit_everyone\";i:0;s:19:\"can_delete_everyone\";i:0;s:16:\"can_edit_profile\";i:1;s:18:\"can_delete_profile\";i:1;s:11:\"after_login\";s:16:\"redirect_profile\";s:12:\"after_logout\";s:13:\"redirect_home\";s:16:\"default_homepage\";i:1;s:12:\"can_view_all\";i:1;s:24:\"can_make_private_profile\";i:0;s:26:\"can_access_private_profile\";i:0;s:6:\"status\";s:8:\"approved\";s:16:\"auto_approve_act\";s:16:\"redirect_profile\";s:11:\"super_admin\";i:0;}', 'no'),
(489, 'bookly_data_loaded', '1', 'yes'),
(490, 'bookly_db_version', '21.2', 'yes'),
(491, 'bookly_installation_time', '1667592009', 'yes'),
(492, 'bookly_setup_step', '1', 'yes'),
(493, 'bookly_admin_preferred_language', '', 'yes'),
(494, 'bookly_app_color', '#f4662f', 'yes'),
(495, 'bookly_app_custom_styles', '', 'yes'),
(496, 'bookly_app_required_employee', '0', 'yes'),
(497, 'bookly_app_service_name_with_duration', '0', 'yes'),
(498, 'bookly_app_show_blocked_timeslots', '0', 'yes'),
(499, 'bookly_app_show_calendar', '0', 'yes'),
(500, 'bookly_app_show_day_one_column', '0', 'yes'),
(501, 'bookly_app_show_login_button', '0', 'yes'),
(502, 'bookly_app_show_notes', '1', 'yes'),
(503, 'bookly_app_show_progress_tracker', '1', 'yes'),
(504, 'bookly_app_align_buttons_left', '0', 'yes'),
(505, 'bookly_app_staff_name_with_price', '1', 'yes'),
(506, 'bookly_app_show_single_slot', '0', 'yes'),
(507, 'bookly_app_show_email_confirm', '0', 'yes'),
(508, 'bookly_app_show_start_over', '1', 'yes'),
(509, 'bookly_app_show_category_info', '0', 'yes'),
(510, 'bookly_app_show_service_info', '1', 'yes'),
(511, 'bookly_app_show_staff_info', '0', 'yes'),
(512, 'bookly_app_show_terms', '0', 'yes'),
(513, 'bookly_app_show_download_ics', '0', 'yes'),
(514, 'bookly_l10n_button_apply', 'Apply', 'yes'),
(515, 'bookly_l10n_button_back', 'Back', 'yes'),
(516, 'bookly_l10n_button_download_ics', 'Download ICS', 'yes'),
(517, 'bookly_l10n_info_complete_step', 'Thank you! Your booking is complete. An email with details of your booking has been sent to you.', 'yes'),
(518, 'bookly_l10n_info_complete_step_limit_error', 'You are trying to use the service too often. Please contact us to make a booking.', 'yes'),
(519, 'bookly_l10n_info_complete_step_processing', 'Your payment has been accepted for processing.', 'yes'),
(520, 'bookly_l10n_info_details_step', 'You selected a booking for {service_name} by {staff_name} at {appointment_time} on {appointment_date}. The price for the service is {service_price}.\nPlease provide your details in the form below to proceed with booking.', 'yes'),
(521, 'bookly_l10n_info_details_step_guest', '', 'yes'),
(522, 'bookly_l10n_info_payment_step_single_app', 'Please tell us how you would like to pay: ', 'yes'),
(523, 'bookly_l10n_info_service_step', 'Please select service: ', 'yes'),
(524, 'bookly_l10n_info_time_step', 'Below you can find a list of available time slots for {service_name} by {staff_name}.\nClick on a time slot to proceed with booking.', 'yes'),
(525, 'bookly_l10n_label_category', 'Category', 'yes'),
(526, 'bookly_l10n_label_email', 'Email', 'yes'),
(527, 'bookly_l10n_label_email_confirm', 'Confirm email', 'yes'),
(528, 'bookly_l10n_label_employee', 'Employee', 'yes'),
(529, 'bookly_l10n_label_finish_by', 'Finish by', 'yes'),
(530, 'bookly_l10n_label_name', 'Full name', 'yes'),
(531, 'bookly_l10n_label_first_name', 'First name', 'yes'),
(532, 'bookly_l10n_label_last_name', 'Last name', 'yes'),
(533, 'bookly_l10n_label_notes', 'Notes', 'yes'),
(534, 'bookly_l10n_label_pay_locally', 'I will pay locally', 'yes'),
(535, 'bookly_l10n_label_pay_cloud_stripe', 'I will pay now with Credit Card', 'yes'),
(536, 'bookly_l10n_label_phone', 'Phone', 'yes'),
(537, 'bookly_l10n_label_select_date', 'I\'m available on or after', 'yes'),
(538, 'bookly_l10n_label_service', 'Service', 'yes'),
(539, 'bookly_l10n_label_start_from', 'Start from', 'yes'),
(540, 'bookly_l10n_label_terms', 'I agree to the terms of service', 'yes'),
(541, 'bookly_l10n_error_terms', 'You must accept our terms', 'yes'),
(542, 'bookly_l10n_option_category', 'Select category', 'yes'),
(543, 'bookly_l10n_option_employee', 'Any', 'yes'),
(544, 'bookly_l10n_option_service', 'Select service', 'yes'),
(545, 'bookly_l10n_option_day', 'Select day', 'yes'),
(546, 'bookly_l10n_option_month', 'Select month', 'yes'),
(547, 'bookly_l10n_option_year', 'Select year', 'yes'),
(548, 'bookly_l10n_required_email', 'Please tell us your email', 'yes'),
(549, 'bookly_l10n_email_in_use', 'This email is already in use', 'yes'),
(550, 'bookly_l10n_email_confirm_not_match', 'Email confirmation doesn\'t match', 'yes'),
(551, 'bookly_l10n_required_employee', 'Please select an employee', 'yes'),
(552, 'bookly_l10n_required_name', 'Please tell us your name', 'yes'),
(553, 'bookly_l10n_required_first_name', 'Please tell us your first name', 'yes'),
(554, 'bookly_l10n_required_last_name', 'Please tell us your last name', 'yes'),
(555, 'bookly_l10n_required_phone', 'Please tell us your phone', 'yes'),
(556, 'bookly_l10n_required_service', 'Please select a service', 'yes'),
(557, 'bookly_l10n_step_service', 'Service', 'yes'),
(558, 'bookly_l10n_step_time', 'Time', 'yes'),
(559, 'bookly_l10n_step_time_slot_not_available', 'The selected time is not available anymore. Please, choose another time slot.', 'yes'),
(560, 'bookly_l10n_step_details', 'Details', 'yes'),
(561, 'bookly_l10n_step_details_button_login', 'Login', 'yes'),
(562, 'bookly_l10n_step_payment', 'Payment', 'yes'),
(563, 'bookly_l10n_step_done', 'Done', 'yes'),
(564, 'bookly_l10n_step_done_button_start_over', 'Start over', 'yes'),
(565, 'bookly_l10n_step_service_category_info', '{category_info}', 'yes'),
(566, 'bookly_l10n_step_service_service_info', '{service_info}', 'yes'),
(567, 'bookly_l10n_step_service_staff_info', '{staff_info}', 'yes'),
(568, 'bookly_l10n_step_service_button_next', 'Next', 'yes'),
(569, 'bookly_l10n_step_service_mobile_button_next', 'Next', 'yes'),
(570, 'bookly_l10n_step_details_button_next', 'Next', 'yes'),
(571, 'bookly_l10n_step_payment_button_next', 'Next', 'yes'),
(572, 'bookly_cal_show_only_business_days', '1', 'yes'),
(573, 'bookly_cal_show_only_business_hours', '1', 'yes'),
(574, 'bookly_cal_show_only_staff_with_appointments', '1', 'yes'),
(575, 'bookly_cal_one_participant', '{service_name}\n{client_name}\n{client_phone}\n{client_email}\n{total_price} {payment_type} {payment_status}\nStatus: {status}\nSigned up: {signed_up}\nCapacity: {service_capacity}', 'yes'),
(576, 'bookly_cal_many_participants', '{service_name}\nSigned up: {signed_up}\nCapacity: {service_capacity}', 'yes'),
(577, 'bookly_cal_coloring_mode', 'service', 'yes'),
(578, 'bookly_cal_month_view_style', 'classic', 'yes'),
(579, 'bookly_cal_show_new_appointments_badge', '0', 'yes'),
(580, 'bookly_cal_last_seen_appointment', '0', 'yes'),
(581, 'bookly_co_logo_attachment_id', '', 'yes'),
(582, 'bookly_co_name', '', 'yes'),
(583, 'bookly_co_address', '', 'yes'),
(584, 'bookly_co_phone', '', 'yes'),
(585, 'bookly_co_website', '', 'yes'),
(586, 'bookly_co_email', '', 'yes'),
(587, 'bookly_co_industry', '', 'yes'),
(588, 'bookly_co_size', '', 'yes'),
(589, 'bookly_cst_allow_duplicates', '0', 'yes'),
(590, 'bookly_cst_create_account', '0', 'yes'),
(591, 'bookly_cst_default_country_code', '', 'yes'),
(592, 'bookly_cst_first_last_name', '0', 'yes'),
(593, 'bookly_cst_phone_default_country', 'auto', 'yes'),
(594, 'bookly_cst_remember_in_cookie', '0', 'yes'),
(595, 'bookly_cst_required_address', '0', 'yes'),
(596, 'bookly_cst_required_birthday', '0', 'yes'),
(597, 'bookly_cst_required_details', 'a:2:{i:0;s:5:\"phone\";i:1;s:5:\"email\";}', 'yes'),
(598, 'bookly_cst_show_update_details_dialog', '1', 'yes'),
(599, 'bookly_cst_verify_customer_details', 'on_update', 'yes'),
(600, 'bookly_email_sender', 'krutika.ipar.k@gmail.com', 'yes'),
(601, 'bookly_email_sender_name', 'City Hospital', 'yes'),
(602, 'bookly_email_send_as', 'html', 'yes'),
(603, 'bookly_email_reply_to_customers', '1', 'yes'),
(604, 'bookly_gen_delete_data_on_uninstall', '0', 'yes'),
(605, 'bookly_gen_time_slot_length', '15', 'yes'),
(606, 'bookly_gen_service_duration_as_slot_length', '0', 'yes'),
(607, 'bookly_gen_min_time_prior_booking', '0', 'yes'),
(608, 'bookly_gen_min_time_prior_cancel', '0', 'yes'),
(609, 'bookly_gen_max_days_for_booking', '365', 'yes'),
(610, 'bookly_gen_use_client_time_zone', '0', 'yes'),
(611, 'bookly_gen_allow_staff_edit_profile', '1', 'yes'),
(612, 'bookly_gen_link_assets_method', 'enqueue', 'yes'),
(613, 'bookly_gen_collect_stats', '0', 'yes'),
(614, 'bookly_gen_show_powered_by', '0', 'yes'),
(615, 'bookly_gen_prevent_caching', '1', 'yes'),
(616, 'bookly_gen_prevent_session_locking', '0', 'yes'),
(617, 'bookly_gen_badge_consider_news', '1', 'yes'),
(618, 'bookly_url_approve_page_url', 'http://localhost/hospital%20online%20apointment/wordpress', 'yes'),
(619, 'bookly_url_approve_denied_page_url', 'http://localhost/hospital%20online%20apointment/wordpress', 'yes'),
(620, 'bookly_url_cancel_page_url', 'http://localhost/hospital%20online%20apointment/wordpress', 'yes'),
(621, 'bookly_url_cancel_denied_page_url', 'http://localhost/hospital%20online%20apointment/wordpress', 'yes'),
(622, 'bookly_url_reject_page_url', 'http://localhost/hospital%20online%20apointment/wordpress', 'yes'),
(623, 'bookly_url_reject_denied_page_url', 'http://localhost/hospital%20online%20apointment/wordpress', 'yes'),
(624, 'bookly_sms_administrator_phone', '', 'yes'),
(625, 'bookly_sms_undelivered_count', '0', 'yes'),
(626, 'bookly_l10n_ics_customer_template', '{service_name}\n{staff_name}', 'yes'),
(627, 'bookly_ics_staff_template', '{client_name}\n{client_phone}\n{status}', 'yes'),
(628, 'bookly_cloud_account_products', '', 'yes'),
(629, 'bookly_cloud_auto_recharge_end_at', '', 'yes'),
(630, 'bookly_cloud_auto_recharge_end_at_ts', '0', 'yes'),
(631, 'bookly_cloud_auto_recharge_gateway', '', 'yes'),
(632, 'bookly_cloud_badge_consider_sms', '1', 'yes'),
(633, 'bookly_cloud_notify_low_balance', '1', 'yes'),
(634, 'bookly_cloud_promotions', 'a:1:{s:12:\"registration\";a:3:{s:2:\"id\";i:1;s:6:\"amount\";i:5;s:5:\"texts\";a:3:{s:4:\"info\";s:159:\"Register your <strong>Bookly Cloud account</strong> and get <strong>$5 Welcome Bonus</strong> to easily start using <strong>SMS Notifications</strong> feature!\";s:4:\"form\";s:66:\"You will get <strong>$5 welcome bonus</strong> after registration.\";s:6:\"button\";s:0:\"\";}}}', 'yes'),
(635, 'bookly_cloud_renew_auto_recharge_notice_hide_until', '-1', 'yes'),
(636, 'bookly_cloud_stripe_addition', '0', 'yes'),
(637, 'bookly_cloud_stripe_enabled', '0', 'yes'),
(638, 'bookly_cloud_stripe_increase', '0', 'yes'),
(639, 'bookly_cloud_stripe_timeout', '0', 'yes'),
(640, 'bookly_cloud_stripe_custom_metadata', '0', 'yes'),
(641, 'bookly_cloud_stripe_metadata', 'a:0:{}', 'yes'),
(642, 'bookly_cloud_token', '', 'yes'),
(643, 'bookly_cloud_zapier_api_key', '', 'yes'),
(644, 'bookly_cloud_cron_api_key', '', 'yes'),
(645, 'bookly_bh_monday_start', '08:00:00', 'yes'),
(646, 'bookly_bh_monday_end', '18:00:00', 'yes'),
(647, 'bookly_bh_tuesday_start', '08:00:00', 'yes'),
(648, 'bookly_bh_tuesday_end', '18:00:00', 'yes'),
(649, 'bookly_bh_wednesday_start', '08:00:00', 'yes'),
(650, 'bookly_bh_wednesday_end', '18:00:00', 'yes'),
(651, 'bookly_bh_thursday_end', '18:00:00', 'yes'),
(652, 'bookly_bh_thursday_start', '08:00:00', 'yes'),
(653, 'bookly_bh_friday_start', '08:00:00', 'yes'),
(654, 'bookly_bh_friday_end', '18:00:00', 'yes'),
(655, 'bookly_bh_saturday_start', '', 'yes'),
(656, 'bookly_bh_saturday_end', '', 'yes'),
(657, 'bookly_bh_sunday_start', '', 'yes'),
(658, 'bookly_bh_sunday_end', '', 'yes'),
(659, 'bookly_pmt_currency', 'USD', 'yes'),
(660, 'bookly_pmt_price_format', '{symbol}{sign}{price|2}', 'yes'),
(661, 'bookly_pmt_order', '', 'yes'),
(662, 'bookly_pmt_local', '1', 'yes'),
(663, 'bookly_ntf_processing_interval', '2', 'yes'),
(664, 'bookly_сa_count', '0', 'yes'),
(665, 'bookly_logs_enabled', '0', 'yes'),
(666, 'bookly_appointment_status_pending_color', '#1e73be', 'yes'),
(667, 'bookly_appointment_status_approved_color', '#81d742', 'yes'),
(668, 'bookly_appointment_status_cancelled_color', '#eeee22', 'yes'),
(669, 'bookly_appointment_status_rejected_color', '#dd3333', 'yes'),
(670, 'bookly_appointment_status_mixed_color', '#8224e3', 'yes'),
(671, 'bookly_appointment_default_status', 'approved', 'yes'),
(672, 'bookly_appointment_cancel_action', 'cancel', 'yes'),
(673, 'bookly_show_wpml_resave_required_notice', '0', 'yes'),
(677, 'bookly_cloud_products', 'a:4:{i:0;a:6:{s:2:\"id\";s:3:\"sms\";s:8:\"icon_url\";s:41:\"https://i.bookly.info/cloud/sms_96x96.png\";s:7:\"version\";s:4:\"18.6\";s:6:\"rating\";s:3:\"5.0\";s:6:\"button\";b:1;s:5:\"texts\";a:8:{s:5:\"title\";s:17:\"SMS Notifications\";s:5:\"price\";s:13:\"Pay as you go\";s:11:\"description\";s:464:\"<p>With <strong>SMS Notifications</strong> service you will keep your customers and staff members informed about their bookings, reduce “no shows” and empty booking slots. The service offers a wide range of codes which you can use to <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212411309\" target=\"_blank\">personalize</a> your text messages.</p><p>Top up your balance with one of the standard amounts and never lose your bookings again.</p>\";s:9:\"action-on\";s:11:\"Get started\";s:10:\"action-off\";s:7:\"Disable\";s:20:\"action-revert-cancel\";s:22:\"I want to keep my plan\";s:11:\"info-button\";s:10:\"SMS Prices\";s:10:\"info-title\";s:10:\"SMS Prices\";}}i:1;a:6:{s:2:\"id\";s:6:\"stripe\";s:8:\"icon_url\";s:44:\"https://i.bookly.info/cloud/stripe_96x96.png\";s:7:\"version\";s:4:\"18.6\";s:6:\"rating\";s:3:\"5.0\";s:6:\"button\";b:1;s:5:\"texts\";a:8:{s:5:\"title\";s:15:\"Stripe Payments\";s:5:\"price\";s:39:\"0.9% <small>per-transaction fee</small>\";s:11:\"description\";s:356:\"<p>With <strong>Stripe Payments</strong> activated, you can integrate <a href=\"https://stripe.com/\" target=\"_blank\">Stripe</a> payment gateway into your Bookly booking form to process credit card payments online.</p><p>Click <strong>Get started</strong> button to connect Bookly to your Stripe account and let customers instantly pay for your services.</p>\";s:9:\"action-on\";s:11:\"Get started\";s:10:\"action-off\";s:7:\"Disable\";s:20:\"action-revert-cancel\";s:22:\"I want to keep my plan\";s:11:\"info-button\";s:9:\"More info\";s:10:\"info-title\";s:5:\"Setup\";}}i:2;a:7:{s:2:\"id\";s:6:\"zapier\";s:8:\"icon_url\";s:44:\"https://i.bookly.info/cloud/zapier-96x96.png\";s:7:\"version\";s:4:\"18.7\";s:6:\"rating\";s:3:\"5.0\";s:6:\"button\";b:1;s:5:\"texts\";a:8:{s:5:\"title\";s:6:\"Zapier\";s:5:\"price\";s:22:\"Your subscription plan\";s:11:\"description\";s:704:\"<p><strong><a href=\"https://zapier.com/\" target=\"_blank\">Zapier</a></strong> allows you to automatically trigger actions in your favorite cloud apps for certain events inside of Bookly: when new bookings are made and updated, and new customers are created.</p>\n<p>You can try <strong>Zapier integration</strong> for free during 7 days to learn more and discover how it can work for you. After the trial period expires, you will be charged for the price of the selected plan.</p>\n<p>Choose your subscription plan, click <strong>Start 7-day Trial</strong> or <strong>Get started</strong> button to set up the connection between Bookly and Zapier, and create individual workflows to perform automations.</p>\";s:9:\"action-on\";s:17:\"Start 7-day Trial\";s:10:\"action-off\";s:19:\"Cancel subscription\";s:20:\"action-revert-cancel\";s:22:\"I want to keep my plan\";s:11:\"info-button\";s:9:\"More info\";s:10:\"info-title\";s:18:\"Zapier Integration\";}s:6:\"prices\";a:6:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:7:\"caption\";s:79:\"$24<sup>.99</sup> per month<br/><small class=\"text-muted\">200 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:7:\"caption\";s:79:\"$59<sup>.99</sup> per month<br/><small class=\"text-muted\">500 Tasks /mo</small>\";s:4:\"tags\";a:1:{i:0;s:10:\"best_offer\";}}i:2;a:3:{s:2:\"id\";s:1:\"3\";s:7:\"caption\";s:82:\"$124<sup>.99</sup> per month<br/><small class=\"text-muted\">1,100 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}i:3;a:3:{s:2:\"id\";s:1:\"4\";s:7:\"caption\";s:82:\"$249<sup>.99</sup> per month<br/><small class=\"text-muted\">2,300 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}i:4;a:3:{s:2:\"id\";s:1:\"5\";s:7:\"caption\";s:83:\"$999<sup>.99</sup> per month<br/><small class=\"text-muted\">12,000 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}i:5;a:3:{s:2:\"id\";s:1:\"6\";s:7:\"caption\";s:85:\"$1,499<sup>.99</sup> per month<br/><small class=\"text-muted\">20,000 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}}}i:3;a:7:{s:2:\"id\";s:4:\"cron\";s:8:\"icon_url\";s:42:\"https://i.bookly.info/cloud/cron_96x96.png\";s:7:\"version\";s:4:\"20.9\";s:6:\"rating\";s:3:\"5.0\";s:6:\"button\";b:0;s:5:\"texts\";a:8:{s:5:\"title\";s:10:\"Cloud Cron\";s:5:\"price\";s:15:\"$11.99 per year\";s:11:\"description\";s:343:\"<p>With the <b>Cloud Cron</b> activated, you can be sure that Bookly will do all your scheduled actions (email and SMS notifications, SMS campaigns, automatic appointment status change) without any additional settings.</p>\n\n<p>Click <b>Get started</b> button to activate Cloud Cron and expand your possibilities in planning and scheduling.</p>\";s:9:\"action-on\";s:11:\"Get started\";s:10:\"action-off\";s:7:\"Disable\";s:20:\"action-revert-cancel\";s:22:\"I want to keep my plan\";s:11:\"info-button\";s:0:\"\";s:10:\"info-title\";s:0:\"\";}s:6:\"prices\";a:1:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:7:\"caption\";s:31:\"$11<sup>.99</sup> per year<br/>\";s:4:\"tags\";a:0:{}}}}}', 'yes'),
(682, 'installed_appointment-hour-booking', '1667592377', 'yes'),
(683, 'cp_cpappb_last_verified', '2023-11-22 07:55:24', 'yes'),
(684, '_transient_codepeople_promote_banner_appointment-hour-booking', '1667592378', 'yes'),
(687, 'recovery_mode_email_last_sent', '1667592423', 'yes'),
(732, 'um_cache_userdata_3', 'a:44:{s:2:\"ID\";i:3;s:10:\"user_login\";s:14:\"missperfect701\";s:9:\"user_pass\";s:34:\"$P$BNJC6uOJzqoDzerSP5Xwg2v0QXA.9N.\";s:13:\"user_nicename\";s:14:\"missperfect701\";s:10:\"user_email\";s:15:\"ayhsbd@gjsh.com\";s:8:\"user_url\";s:70:\"http://localhost/hospital%20online%20apointment/wordpress/index.php/si\";s:15:\"user_registered\";s:19:\"2022-11-04 20:17:22\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:12:\"Krutika Ipar\";s:10:\"subscriber\";b:1;s:8:\"wp_roles\";s:10:\"subscriber\";s:4:\"read\";b:1;s:6:\"filter\";N;s:16:\"\0WP_User\0site_id\";i:1;s:8:\"nickname\";s:6:\"KSIpar\";s:10:\"first_name\";s:7:\"Krutika\";s:9:\"last_name\";s:4:\"Ipar\";s:11:\"description\";s:5:\"chill\";s:12:\"rich_editing\";s:4:\"true\";s:19:\"syntax_highlighting\";s:4:\"true\";s:17:\"comment_shortcuts\";s:5:\"false\";s:11:\"admin_color\";s:5:\"fresh\";s:7:\"use_ssl\";s:1:\"0\";s:20:\"show_admin_bar_front\";s:4:\"true\";s:6:\"locale\";s:0:\"\";s:14:\"account_status\";s:8:\"approved\";s:19:\"account_status_name\";s:8:\"Approved\";s:4:\"role\";s:10:\"subscriber\";s:5:\"roles\";a:1:{i:0;s:10:\"subscriber\";}s:18:\"can_access_wpadmin\";i:0;s:20:\"can_not_see_adminbar\";i:1;s:17:\"can_edit_everyone\";i:0;s:19:\"can_delete_everyone\";i:0;s:16:\"can_edit_profile\";i:1;s:18:\"can_delete_profile\";i:1;s:11:\"after_login\";s:16:\"redirect_profile\";s:12:\"after_logout\";s:13:\"redirect_home\";s:16:\"default_homepage\";i:1;s:12:\"can_view_all\";i:1;s:24:\"can_make_private_profile\";i:0;s:26:\"can_access_private_profile\";i:0;s:6:\"status\";s:8:\"approved\";s:16:\"auto_approve_act\";s:16:\"redirect_profile\";s:11:\"super_admin\";i:0;}', 'no'),
(753, 'um_cache_userdata_4', 'a:44:{s:2:\"ID\";i:4;s:10:\"user_login\";s:11:\"krutikaipar\";s:9:\"user_pass\";s:34:\"$P$BB21R0IFDjOS13lcYuY/aIqnS0OtKL0\";s:13:\"user_nicename\";s:11:\"krutikaipar\";s:10:\"user_email\";s:14:\"usydgh@hjs.com\";s:8:\"user_url\";s:70:\"http://localhost/hospital%20online%20apointment/wordpress/index.php/si\";s:15:\"user_registered\";s:19:\"2022-11-05 04:18:02\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:12:\"Krutika Ipar\";s:10:\"subscriber\";b:1;s:8:\"wp_roles\";s:10:\"subscriber\";s:4:\"read\";b:1;s:6:\"filter\";N;s:16:\"\0WP_User\0site_id\";i:1;s:8:\"nickname\";s:3:\"kit\";s:10:\"first_name\";s:7:\"Krutika\";s:9:\"last_name\";s:4:\"Ipar\";s:11:\"description\";s:8:\"be happy\";s:12:\"rich_editing\";s:4:\"true\";s:19:\"syntax_highlighting\";s:4:\"true\";s:17:\"comment_shortcuts\";s:5:\"false\";s:11:\"admin_color\";s:5:\"fresh\";s:7:\"use_ssl\";s:1:\"0\";s:20:\"show_admin_bar_front\";s:4:\"true\";s:6:\"locale\";s:0:\"\";s:14:\"account_status\";s:8:\"approved\";s:19:\"account_status_name\";s:8:\"Approved\";s:4:\"role\";s:10:\"subscriber\";s:5:\"roles\";a:1:{i:0;s:10:\"subscriber\";}s:18:\"can_access_wpadmin\";i:0;s:20:\"can_not_see_adminbar\";i:1;s:17:\"can_edit_everyone\";i:0;s:19:\"can_delete_everyone\";i:0;s:16:\"can_edit_profile\";i:1;s:18:\"can_delete_profile\";i:1;s:11:\"after_login\";s:16:\"redirect_profile\";s:12:\"after_logout\";s:13:\"redirect_home\";s:16:\"default_homepage\";i:1;s:12:\"can_view_all\";i:1;s:24:\"can_make_private_profile\";i:0;s:26:\"can_access_private_profile\";i:0;s:6:\"status\";s:8:\"approved\";s:16:\"auto_approve_act\";s:16:\"redirect_profile\";s:11:\"super_admin\";i:0;}', 'no'),
(859, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:5:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/en_GB/wordpress-6.4.1.zip\";s:6:\"locale\";s:5:\"en_GB\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/en_GB/wordpress-6.4.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.4.1\";s:7:\"version\";s:5:\"6.4.1\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.4.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.4.1-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.4.1\";s:7:\"version\";s:5:\"6.4.1\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.4.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.4.1-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.4.1\";s:7:\"version\";s:5:\"6.4.1\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.3.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.3.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.3.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.3.2-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.3.2\";s:7:\"version\";s:5:\"6.3.2\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:4;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.2.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.2.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.2.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.2.3-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.2.3-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.2.3-rollback-0.zip\";}s:7:\"current\";s:5:\"6.2.3\";s:7:\"version\";s:5:\"6.2.3\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:3:\"6.2\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1700639153;s:15:\"version_checked\";s:3:\"6.2\";s:12:\"translations\";a:0:{}}', 'no'),
(865, 'auto_updater.lock', '1700639153', 'no'),
(866, '_site_transient_timeout_theme_roots', '1700640954', 'no'),
(867, '_site_transient_theme_roots', 'a:4:{s:12:\"twentytwenty\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}', 'no'),
(868, 'core_updater.lock', '1700639155', 'no'),
(869, '_transient_timeout_ahb-captcha-655db1c105e67', '1700640969', 'no'),
(870, '_transient_ahb-captcha-655db1c105e67', 'jblqs', 'no'),
(871, '_transient_timeout_ahb-captcha-655db1c267cd4', '1700640970', 'no'),
(872, '_transient_ahb-captcha-655db1c267cd4', 'goije', 'no'),
(873, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1700639380;s:8:\"response\";a:5:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.5.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:5:\"6.4.1\";s:12:\"requires_php\";s:6:\"5.6.20\";}s:47:\"appointment-hour-booking/app-booking-plugin.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:38:\"w.org/plugins/appointment-hour-booking\";s:4:\"slug\";s:24:\"appointment-hour-booking\";s:6:\"plugin\";s:47:\"appointment-hour-booking/app-booking-plugin.php\";s:11:\"new_version\";s:6:\"1.4.41\";s:3:\"url\";s:55:\"https://wordpress.org/plugins/appointment-hour-booking/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/appointment-hour-booking.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:77:\"https://ps.w.org/appointment-hour-booking/assets/icon-256x256.png?rev=1784135\";s:2:\"1x\";s:77:\"https://ps.w.org/appointment-hour-booking/assets/icon-128x128.png?rev=1784135\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:80:\"https://ps.w.org/appointment-hour-booking/assets/banner-1544x500.png?rev=1788823\";s:2:\"1x\";s:79:\"https://ps.w.org/appointment-hour-booking/assets/banner-772x250.png?rev=1788823\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:5:\"3.0.5\";s:6:\"tested\";s:5:\"6.4.1\";s:12:\"requires_php\";b:0;s:14:\"upgrade_notice\";s:30:\"<ul>\n<li>CSS update</li>\n</ul>\";}s:51:\"bookly-responsive-appointment-booking-tool/main.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:56:\"w.org/plugins/bookly-responsive-appointment-booking-tool\";s:4:\"slug\";s:42:\"bookly-responsive-appointment-booking-tool\";s:6:\"plugin\";s:51:\"bookly-responsive-appointment-booking-tool/main.php\";s:11:\"new_version\";s:4:\"22.6\";s:3:\"url\";s:73:\"https://wordpress.org/plugins/bookly-responsive-appointment-booking-tool/\";s:7:\"package\";s:90:\"https://downloads.wordpress.org/plugin/bookly-responsive-appointment-booking-tool.22.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:95:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/icon-256x256.png?rev=2847809\";s:2:\"1x\";s:95:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/icon-128x128.png?rev=2847809\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:98:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/banner-1544x500.png?rev=1726755\";s:2:\"1x\";s:97:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/banner-772x250.png?rev=1726755\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.7\";s:6:\"tested\";s:5:\"6.4.1\";s:12:\"requires_php\";s:5:\"5.3.7\";}s:25:\"profile-builder/index.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:29:\"w.org/plugins/profile-builder\";s:4:\"slug\";s:15:\"profile-builder\";s:6:\"plugin\";s:25:\"profile-builder/index.php\";s:11:\"new_version\";s:6:\"3.10.5\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/profile-builder/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/profile-builder.3.10.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/profile-builder/assets/icon-256x256.png?rev=2961144\";s:2:\"1x\";s:68:\"https://ps.w.org/profile-builder/assets/icon-128x128.png?rev=2961144\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/profile-builder/assets/banner-1544x500.png?rev=2961144\";s:2:\"1x\";s:70:\"https://ps.w.org/profile-builder/assets/banner-772x250.png?rev=2961144\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.1\";s:6:\"tested\";s:5:\"6.4.1\";s:12:\"requires_php\";b:0;}s:35:\"ultimate-member/ultimate-member.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:29:\"w.org/plugins/ultimate-member\";s:4:\"slug\";s:15:\"ultimate-member\";s:6:\"plugin\";s:35:\"ultimate-member/ultimate-member.php\";s:11:\"new_version\";s:5:\"2.7.0\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/ultimate-member/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/ultimate-member.2.7.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/ultimate-member/assets/icon-256x256.png?rev=2718101\";s:2:\"1x\";s:68:\"https://ps.w.org/ultimate-member/assets/icon-128x128.png?rev=2718101\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/ultimate-member/assets/banner-1544x500.png?rev=2143172\";s:2:\"1x\";s:70:\"https://ps.w.org/ultimate-member/assets/banner-772x250.png?rev=2143172\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.5\";s:6:\"tested\";s:5:\"6.3.2\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}s:59:\"medical-addon-for-elementor/medical-addon-for-elementor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:41:\"w.org/plugins/medical-addon-for-elementor\";s:4:\"slug\";s:27:\"medical-addon-for-elementor\";s:6:\"plugin\";s:59:\"medical-addon-for-elementor/medical-addon-for-elementor.php\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:58:\"https://wordpress.org/plugins/medical-addon-for-elementor/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/medical-addon-for-elementor.1.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:80:\"https://ps.w.org/medical-addon-for-elementor/assets/icon-256x256.png?rev=2223446\";s:2:\"1x\";s:80:\"https://ps.w.org/medical-addon-for-elementor/assets/icon-128x128.png?rev=2223446\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:83:\"https://ps.w.org/medical-addon-for-elementor/assets/banner-1544x500.png?rev=2223446\";s:2:\"1x\";s:82:\"https://ps.w.org/medical-addon-for-elementor/assets/banner-772x250.png?rev=2223446\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}}}', 'no'),
(874, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1700639382;s:7:\"checked\";a:4:{s:12:\"twentytwenty\";s:3:\"2.0\";s:15:\"twentytwentyone\";s:3:\"1.6\";s:17:\"twentytwentythree\";s:3:\"1.0\";s:15:\"twentytwentytwo\";s:3:\"1.2\";}s:8:\"response\";a:4:{s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"2.0\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.2.0.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.3.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.1.6.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:15:\"twentytwentyone\";s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:3:\"1.0\";s:7:\"updated\";s:19:\"2023-06-04 23:55:20\";s:7:\"package\";s:79:\"https://downloads.wordpress.org/translation/theme/twentytwentyone/1.0/en_GB.zip\";s:10:\"autoupdate\";b:1;}}}', 'no'),
(875, '_site_transient_timeout_php_check_7ec5f04fef1dc985019fbdb14afad4b2', '1701244183', 'no'),
(876, '_site_transient_php_check_7ec5f04fef1dc985019fbdb14afad4b2', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:3:\"7.0\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(4, 7, '_wp_attached_file', '2022/11/a.jpg.png'),
(5, 7, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1182;s:6:\"height\";i:666;s:4:\"file\";s:17:\"2022/11/a.jpg.png\";s:8:\"filesize\";i:926257;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(10, 11, '_wp_attached_file', '2022/11/Hospital-logo.png'),
(11, 11, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:553;s:6:\"height\";i:552;s:4:\"file\";s:25:\"2022/11/Hospital-logo.png\";s:8:\"filesize\";i:158947;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(12, 14, 'origin', 'theme'),
(13, 18, '_wp_attached_file', '2022/11/a.jpg-1.png'),
(14, 18, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1182;s:6:\"height\";i:666;s:4:\"file\";s:19:\"2022/11/a.jpg-1.png\";s:8:\"filesize\";i:926257;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(15, 19, '_wp_attached_file', '2022/11/a.jpg-2.png'),
(16, 19, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1182;s:6:\"height\";i:666;s:4:\"file\";s:19:\"2022/11/a.jpg-2.png\";s:8:\"filesize\";i:926257;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(17, 20, 'origin', 'theme'),
(18, 26, 'origin', 'theme'),
(29, 35, '_edit_lock', '1667592994:1'),
(30, 51, 'origin', 'theme'),
(31, 53, '_edit_lock', '1667560689:1'),
(32, 60, '_um_custom_fields', 'a:6:{s:10:\"user_login\";a:15:{s:5:\"title\";s:8:\"Username\";s:7:\"metakey\";s:10:\"user_login\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:8:\"Username\";s:8:\"required\";i:1;s:6:\"public\";i:1;s:8:\"editable\";i:0;s:8:\"validate\";s:15:\"unique_username\";s:9:\"min_chars\";i:3;s:9:\"max_chars\";i:24;s:8:\"position\";s:1:\"1\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:10:\"user_email\";a:13:{s:5:\"title\";s:14:\"E-mail Address\";s:7:\"metakey\";s:10:\"user_email\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:14:\"E-mail Address\";s:8:\"required\";i:0;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:8:\"validate\";s:12:\"unique_email\";s:8:\"position\";s:1:\"4\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:13:\"user_password\";a:16:{s:5:\"title\";s:8:\"Password\";s:7:\"metakey\";s:13:\"user_password\";s:4:\"type\";s:8:\"password\";s:5:\"label\";s:8:\"Password\";s:8:\"required\";i:1;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:9:\"min_chars\";i:8;s:9:\"max_chars\";i:30;s:15:\"force_good_pass\";i:1;s:18:\"force_confirm_pass\";i:1;s:8:\"position\";s:1:\"5\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:10:\"first_name\";a:12:{s:5:\"title\";s:10:\"First Name\";s:7:\"metakey\";s:10:\"first_name\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:10:\"First Name\";s:8:\"required\";i:0;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:8:\"position\";s:1:\"2\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:9:\"last_name\";a:12:{s:5:\"title\";s:9:\"Last Name\";s:7:\"metakey\";s:9:\"last_name\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:9:\"Last Name\";s:8:\"required\";i:0;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:8:\"position\";s:1:\"3\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:9:\"_um_row_1\";a:4:{s:4:\"type\";s:3:\"row\";s:2:\"id\";s:9:\"_um_row_1\";s:8:\"sub_rows\";s:1:\"1\";s:4:\"cols\";s:1:\"1\";}}'),
(33, 60, '_um_mode', 'register'),
(34, 60, '_um_core', 'register'),
(35, 60, '_um_register_use_custom_settings', '0'),
(36, 61, '_um_custom_fields', 'a:3:{s:8:\"username\";a:13:{s:5:\"title\";s:18:\"Username or E-mail\";s:7:\"metakey\";s:8:\"username\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:18:\"Username or E-mail\";s:8:\"required\";i:1;s:6:\"public\";i:1;s:8:\"editable\";i:0;s:8:\"validate\";s:24:\"unique_username_or_email\";s:8:\"position\";s:1:\"1\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:13:\"user_password\";a:16:{s:5:\"title\";s:8:\"Password\";s:7:\"metakey\";s:13:\"user_password\";s:4:\"type\";s:8:\"password\";s:5:\"label\";s:8:\"Password\";s:8:\"required\";i:1;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:9:\"min_chars\";i:8;s:9:\"max_chars\";i:30;s:15:\"force_good_pass\";i:1;s:18:\"force_confirm_pass\";i:1;s:8:\"position\";s:1:\"2\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:9:\"_um_row_1\";a:4:{s:4:\"type\";s:3:\"row\";s:2:\"id\";s:9:\"_um_row_1\";s:8:\"sub_rows\";s:1:\"1\";s:4:\"cols\";s:1:\"1\";}}'),
(37, 61, '_um_mode', 'login'),
(38, 61, '_um_core', 'login'),
(39, 61, '_um_login_use_custom_settings', '0'),
(40, 62, '_um_custom_fields', 'a:1:{s:9:\"_um_row_1\";a:4:{s:4:\"type\";s:3:\"row\";s:2:\"id\";s:9:\"_um_row_1\";s:8:\"sub_rows\";s:1:\"1\";s:4:\"cols\";s:1:\"1\";}}'),
(41, 62, '_um_mode', 'profile'),
(42, 62, '_um_core', 'profile'),
(43, 62, '_um_profile_use_custom_settings', '0'),
(44, 63, '_um_core', 'members'),
(45, 63, '_um_template', 'members'),
(46, 63, '_um_mode', 'directory'),
(47, 63, '_um_view_types', 'a:1:{i:0;s:4:\"grid\";}'),
(48, 63, '_um_default_view', 'grid'),
(49, 63, '_um_roles', 'a:0:{}'),
(50, 63, '_um_has_profile_photo', '0'),
(51, 63, '_um_has_cover_photo', '0'),
(52, 63, '_um_show_these_users', ''),
(53, 63, '_um_exclude_these_users', ''),
(54, 63, '_um_sortby', 'user_registered_desc'),
(55, 63, '_um_sortby_custom', ''),
(56, 63, '_um_sortby_custom_label', ''),
(57, 63, '_um_enable_sorting', '0'),
(58, 63, '_um_sorting_fields', 'a:0:{}'),
(59, 63, '_um_profile_photo', '1'),
(60, 63, '_um_cover_photos', '1'),
(61, 63, '_um_show_name', '1'),
(62, 63, '_um_show_tagline', '0'),
(63, 63, '_um_tagline_fields', 'a:0:{}'),
(64, 63, '_um_show_userinfo', '0'),
(65, 63, '_um_reveal_fields', 'a:0:{}'),
(66, 63, '_um_show_social', '0'),
(67, 63, '_um_userinfo_animate', '1'),
(68, 63, '_um_search', '0'),
(69, 63, '_um_roles_can_search', 'a:0:{}'),
(70, 63, '_um_filters', '0'),
(71, 63, '_um_roles_can_filter', 'a:0:{}'),
(72, 63, '_um_search_fields', 'a:0:{}'),
(73, 63, '_um_filters_expanded', '0'),
(74, 63, '_um_filters_is_collapsible', '1'),
(75, 63, '_um_search_filters', 'a:0:{}'),
(76, 63, '_um_must_search', '0'),
(77, 63, '_um_max_users', ''),
(78, 63, '_um_profiles_per_page', '12'),
(79, 63, '_um_profiles_per_page_mobile', '6'),
(80, 63, '_um_directory_header', '{total_users} Members'),
(81, 63, '_um_directory_header_single', '{total_users} Member'),
(82, 63, '_um_directory_no_users', 'We are sorry. We cannot find any users who match your search criteria.'),
(95, 64, '_edit_lock', '1667592611:1'),
(96, 64, '_edit_last', '1'),
(97, 64, 'um_content_restriction', 'a:8:{s:26:\"_um_custom_access_settings\";b:0;s:14:\"_um_accessible\";i:0;s:28:\"_um_access_hide_from_queries\";b:0;s:19:\"_um_noaccess_action\";i:0;s:30:\"_um_restrict_by_custom_message\";i:0;s:27:\"_um_restrict_custom_message\";s:0:\"\";s:19:\"_um_access_redirect\";i:0;s:23:\"_um_access_redirect_url\";s:0:\"\";}'),
(98, 66, '_edit_lock', '1667590908:1'),
(99, 66, '_edit_last', '1'),
(100, 66, 'um_content_restriction', 'a:8:{s:26:\"_um_custom_access_settings\";b:0;s:14:\"_um_accessible\";i:0;s:28:\"_um_access_hide_from_queries\";b:0;s:19:\"_um_noaccess_action\";i:0;s:30:\"_um_restrict_by_custom_message\";i:0;s:27:\"_um_restrict_custom_message\";s:0:\"\";s:19:\"_um_access_redirect\";i:0;s:23:\"_um_access_redirect_url\";s:0:\"\";}'),
(101, 35, '_edit_last', '1'),
(102, 35, 'um_content_restriction', 'a:8:{s:26:\"_um_custom_access_settings\";b:0;s:14:\"_um_accessible\";i:0;s:28:\"_um_access_hide_from_queries\";b:0;s:19:\"_um_noaccess_action\";i:0;s:30:\"_um_restrict_by_custom_message\";i:0;s:27:\"_um_restrict_custom_message\";s:0:\"\";s:19:\"_um_access_redirect\";i:0;s:23:\"_um_access_redirect_url\";s:0:\"\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2022-11-03 18:29:03', '2022-11-03 18:29:03', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2022-11-03 18:29:03', '2022-11-03 18:29:03', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/?p=1', 0, 'post', '', 1),
(6, 1, '2022-11-03 18:30:42', '2022-11-03 18:30:42', '{\"version\": 2, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-twentytwentytwo', '', '', '2022-11-03 18:30:42', '2022-11-03 18:30:42', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/2022/11/03/wp-global-styles-twentytwentytwo/', 0, 'wp_global_styles', '', 0),
(7, 1, '2022-11-03 18:31:11', '2022-11-03 18:31:11', '', 'a.jpg', '', 'inherit', 'open', 'closed', '', 'a-jpg', '', '', '2022-11-03 18:31:11', '2022-11-03 18:31:11', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/wp-content/uploads/2022/11/a.jpg.png', 0, 'attachment', 'image/png', 0),
(11, 1, '2022-11-03 19:01:53', '2022-11-03 19:01:53', '', 'Hospital logo', '', 'inherit', 'open', 'closed', '', 'hospital-logo', '', '', '2022-11-03 19:01:53', '2022-11-03 19:01:53', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/wp-content/uploads/2022/11/Hospital-logo.png', 0, 'attachment', 'image/png', 0),
(12, 1, '2022-11-03 19:02:10', '2022-11-03 19:02:10', '<!-- wp:home-link {\"label\":\"Home\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Sign in\",\"type\":\"page\",\"id\":35,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/sign-in/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"Log In\",\"type\":\"page\",\"id\":66,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/log-in/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"Book appointment\",\"type\":\"page\",\"id\":64,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/register/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->', 'Header navigation', '', 'publish', 'closed', 'closed', '', 'header-navigation', '', '', '2022-11-04 20:11:49', '2022-11-04 20:11:49', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/2022/11/03/header-navigation/', 0, 'wp_navigation', '', 0),
(13, 1, '2022-11-03 19:04:28', '2022-11-03 19:04:28', '<!-- wp:page-list /-->\n\n<!-- wp:navigation-link {\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"file:///C:/Users/Sunil/Desktop/HCI%20Website/Front%20page/Appointment%20booking.html\",\"opensInNewTab\":true,\"url\":\"file:///C:/Users/Sunil/Desktop/HCI%20Website/Front%20page/Appointment%20booking.html\",\"title\":\"Book Appointment\",\"kind\":\"custom\",\"isTopLevelLink\":true} /-->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-03 19:04:28', '2022-11-03 19:04:28', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=13', 0, 'revision', '', 0),
(14, 1, '2022-11-03 19:04:28', '2022-11-03 19:04:28', '<!-- wp:group {\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignwide\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"bottom\":\"var:preset|spacing|30\",\"top\":\"var:preset|spacing|30\",\"right\":\"var:preset|spacing|30\",\"left\":\"var:preset|spacing|30\"},\"blockGap\":\"var:preset|spacing|30\"},\"color\":{\"gradient\":\"linear-gradient(135deg,rgb(6,147,227) 0%,rgb(255,255,255) 46%,rgb(155,81,224) 100%)\"}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide has-background\" style=\"background:linear-gradient(135deg,rgb(6,147,227) 0%,rgb(255,255,255) 46%,rgb(155,81,224) 100%);padding-top:var(--wp--preset--spacing--30);padding-right:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30);padding-left:var(--wp--preset--spacing--30)\"><!-- wp:group {\"layout\":{\"type\":\"flex\"}} -->\n<div class=\"wp-block-group\"><!-- wp:site-logo {\"width\":60,\"shouldSyncIcon\":true} /-->\n\n<!-- wp:site-title /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|20\",\"right\":\"var:preset|spacing|20\",\"bottom\":\"var:preset|spacing|20\",\"left\":\"var:preset|spacing|20\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--20);padding-right:var(--wp--preset--spacing--20);padding-bottom:var(--wp--preset--spacing--20);padding-left:var(--wp--preset--spacing--20)\"><!-- wp:navigation {\"ref\":12,\"layout\":{\"type\":\"flex\",\"setCascadingProperties\":true,\"justifyContent\":\"right\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:buttons {\"layout\":{\"type\":\"flex\",\"justifyContent\":\"right\",\"verticalAlignment\":\"top\"}} -->\n<div class=\"wp-block-buttons\"></div>\n<!-- /wp:buttons -->', 'Header', '', 'publish', 'closed', 'closed', '', 'header', '', '', '2022-11-04 20:18:38', '2022-11-04 20:18:38', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/2022/11/03/header/', 0, 'wp_template_part', '', 0),
(15, 1, '2022-11-03 19:06:07', '2022-11-03 19:06:07', '', 'Header navigation 2', '', 'publish', 'closed', 'closed', '', 'header-navigation-2', '', '', '2022-11-03 19:06:07', '2022-11-03 19:06:07', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/2022/11/03/header-navigation-2/', 0, 'wp_navigation', '', 0),
(16, 1, '2022-11-04 06:32:18', '2022-11-04 06:32:18', '<!-- wp:navigation-link {\"label\":\"Sample Page\",\"type\":\"page\",\"rel\":\"\\u0022C:\\\\Users\\\\Sunil\\\\Desktop\\\\HCI Website\\\\Front page\\\\Appointment booking.html\\u0022\",\"id\":2,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/sample-page/\",\"title\":\"Book appointment\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"isTopLevelLink\":true} /-->\n\n<!-- wp:spacer {\"height\":\"0px\",\"width\":\"72px\"} -->\n<div style=\"height:0px;width:72px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-04 06:32:18', '2022-11-04 06:32:18', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=16', 0, 'revision', '', 0),
(17, 1, '2022-11-04 06:33:10', '2022-11-04 06:33:10', '<!-- wp:navigation-link {\"label\":\"Book appointment\",\"type\":\"page\",\"rel\":\"\\u0022C:\\\\Users\\\\Sunil\\\\Desktop\\\\HCI Website\\\\Front page\\\\Appointment booking.html\\u0022\",\"id\":2,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/sample-page/\",\"title\":\"Book appointment\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"isTopLevelLink\":true} /-->\n\n<!-- wp:spacer {\"height\":\"0px\",\"width\":\"72px\"} -->\n<div style=\"height:0px;width:72px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-04 06:33:10', '2022-11-04 06:33:10', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=17', 0, 'revision', '', 0),
(18, 1, '2022-11-04 06:35:39', '2022-11-04 06:35:39', '', 'a.jpg-1', '', 'inherit', 'open', 'closed', '', 'a-jpg-1', '', '', '2022-11-04 06:35:39', '2022-11-04 06:35:39', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/wp-content/uploads/2022/11/a.jpg-1.png', 0, 'attachment', 'image/png', 0),
(19, 1, '2022-11-04 06:37:21', '2022-11-04 06:37:21', '', 'a.jpg-2', '', 'inherit', 'open', 'closed', '', 'a-jpg-2', '', '', '2022-11-04 06:37:21', '2022-11-04 06:37:21', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/wp-content/uploads/2022/11/a.jpg-2.png', 0, 'attachment', 'image/png', 0),
(20, 1, '2022-11-04 06:40:20', '2022-11-04 06:40:20', '<!-- wp:group {\"align\":\"full\",\"style\":{\"elements\":{\"link\":{\"color\":{\"text\":\"var:preset|color|background\"}}},\"spacing\":{\"padding\":{\"top\":\"0px\",\"bottom\":\"0px\"}}},\"backgroundColor\":\"pale-cyan-blue\",\"textColor\":\"background\",\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignfull has-background-color has-pale-cyan-blue-background-color has-text-color has-background has-link-color\" style=\"padding-top:0px;padding-bottom:0px\"><!-- wp:template-part {\"slug\":\"header\",\"theme\":\"twentytwentytwo\",\"tagName\":\"header\",\"align\":\"wide\"} /-->\n\n<!-- wp:cover {\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/wp-content/uploads/2022/11/a.jpg-2.png\",\"id\":19,\"dimRatio\":50,\"isDark\":false,\"align\":\"wide\",\"style\":{\"color\":{}}} -->\n<div class=\"wp-block-cover alignwide is-light\"><span aria-hidden=\"true\" class=\"wp-block-cover__background has-background-dim\"></span><img class=\"wp-block-cover__image-background wp-image-19\" alt=\"City Hospital\n24X7\" src=\"http://localhost/hospital%20online%20apointment/wordpress/wp-content/uploads/2022/11/a.jpg-2.png\" data-object-fit=\"cover\"/><div class=\"wp-block-cover__inner-container\"><!-- wp:paragraph {\"align\":\"left\",\"textColor\":\"background\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-align-left has-background-color has-text-color has-large-font-size\">Health care service </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"background\"} -->\n<p class=\"has-background-color has-text-color\">We care about your health</p>\n<!-- /wp:paragraph --></div></div>\n<!-- /wp:cover --></div>\n<!-- /wp:group -->\n\n<!-- wp:spacer {\"height\":\"66px\"} -->\n<div style=\"height:66px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:paragraph -->\n<p>About us </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Healthcare is the most important aspect of life, and the pandemic has made this true more than ever. At Bharati Vidyapeeth Health Sciences, our exceptional team of doctors, nurses and caregivers come together to bring you excellent care with the latest technologies, best medicine, and warmest service.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The Bharati Vidyapeeth’s Bharati Hospital is situated on the main Pune – Satara Road in the southern part of Pune city. The teaching hospital occupies 25 acres of land on a sprawling lush green campus.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The hospital not only functions for clinical training of undergraduate and postgraduate students but also caters to the medical needs of a large segment of population of South Pune as well as the surrounding rural areas including poor and needy patients.</p>\n<!-- /wp:paragraph -->', 'Header (dark, small)', '', 'publish', 'closed', 'closed', '', 'header-small-dark', '', '', '2022-11-04 19:22:55', '2022-11-04 19:22:55', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/2022/11/04/header-small-dark/', 0, 'wp_template_part', '', 0),
(21, 1, '2022-11-04 06:40:20', '2022-11-04 06:40:20', '<!-- wp:home-link {\"label\":\"Home\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Book Appointment\",\"type\":\"category\",\"rel\":\"file:///C:/Users/Sunil/Desktop/HCI%20Website/Front%20page/Appointment%20booking.html\",\"id\":1,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/category/uncategorised/\",\"kind\":\"taxonomy\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:spacer {\"height\":\"0px\",\"width\":\"72px\"} -->\n<div style=\"height:0px;width:72px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-04 06:40:20', '2022-11-04 06:40:20', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=21', 0, 'revision', '', 0),
(22, 1, '2022-11-04 06:44:45', '2022-11-04 06:44:45', '<!-- wp:home-link {\"label\":\"Home\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Booking Appointment\",\"type\":\"category\",\"rel\":\"file:///C:/Users/Sunil/Desktop/HCI%20Website/Front%20page/Appointment%20booking.html\",\"id\":1,\"opensInNewTab\":true,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/category/uncategorised/\",\"kind\":\"taxonomy\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:spacer {\"height\":\"0px\",\"width\":\"72px\"} -->\n<div style=\"height:0px;width:72px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-04 06:44:45', '2022-11-04 06:44:45', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=22', 0, 'revision', '', 0),
(23, 1, '2022-11-04 06:44:45', '2022-11-04 06:44:45', '<!-- wp:group {\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"bottom\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dlarge, 8rem)\",\"top\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dsmall, 1.25rem)\"}}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--custom--spacing--small, 1.25rem);padding-bottom:var(--wp--custom--spacing--large, 8rem)\"><!-- wp:group {\"layout\":{\"type\":\"flex\"}} -->\n<div class=\"wp-block-group\"><!-- wp:site-logo {\"width\":64,\"shouldSyncIcon\":true} /-->\n\n<!-- wp:site-title /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|20\",\"right\":\"var:preset|spacing|20\",\"bottom\":\"var:preset|spacing|20\",\"left\":\"var:preset|spacing|20\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--20);padding-right:var(--wp--preset--spacing--20);padding-bottom:var(--wp--preset--spacing--20);padding-left:var(--wp--preset--spacing--20)\"><!-- wp:navigation {\"ref\":12,\"layout\":{\"type\":\"flex\",\"setCascadingProperties\":true,\"justifyContent\":\"right\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Header', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2022-11-04 06:44:45', '2022-11-04 06:44:45', '', 14, 'http://localhost/hospital%20online%20apointment/wordpress/?p=23', 0, 'revision', '', 0),
(24, 1, '2022-11-04 06:45:43', '2022-11-04 06:45:43', '', 'Header navigation 3', '', 'publish', 'closed', 'closed', '', 'header-navigation-3', '', '', '2022-11-04 06:45:43', '2022-11-04 06:45:43', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/2022/11/04/header-navigation-3/', 0, 'wp_navigation', '', 0),
(25, 1, '2022-11-04 09:42:22', '2022-11-04 09:42:22', '<!-- wp:group {\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"bottom\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dlarge, 8rem)\",\"top\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dsmall, 1.25rem)\"}}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--custom--spacing--small, 1.25rem);padding-bottom:var(--wp--custom--spacing--large, 8rem)\"><!-- wp:group {\"layout\":{\"type\":\"flex\"}} -->\n<div class=\"wp-block-group\"><!-- wp:site-logo {\"width\":60,\"shouldSyncIcon\":true} /-->\n\n<!-- wp:site-title /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|20\",\"right\":\"var:preset|spacing|20\",\"bottom\":\"var:preset|spacing|20\",\"left\":\"var:preset|spacing|20\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--20);padding-right:var(--wp--preset--spacing--20);padding-bottom:var(--wp--preset--spacing--20);padding-left:var(--wp--preset--spacing--20)\"><!-- wp:navigation {\"ref\":12,\"layout\":{\"type\":\"flex\",\"setCascadingProperties\":true,\"justifyContent\":\"right\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Header', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2022-11-04 09:42:22', '2022-11-04 09:42:22', '', 14, 'http://localhost/hospital%20online%20apointment/wordpress/?p=25', 0, 'revision', '', 0),
(26, 1, '2022-11-04 09:42:22', '2022-11-04 09:42:22', '<!-- wp:template-part {\"slug\":\"header-small-dark\",\"theme\":\"twentytwentytwo\",\"tagName\":\"header\"} /-->\n\n<!-- wp:query {\"queryId\":0,\"query\":{\"perPage\":10,\"pages\":0,\"offset\":0,\"postType\":\"post\",\"order\":\"desc\",\"orderBy\":\"date\",\"author\":\"\",\"search\":\"\",\"exclude\":[],\"sticky\":\"\",\"inherit\":true},\"tagName\":\"main\",\"displayLayout\":{\"type\":\"list\"},\"layout\":{\"inherit\":true}} -->\n<main class=\"wp-block-query\"><!-- wp:query-pagination {\"paginationArrow\":\"arrow\",\"align\":\"wide\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<!-- wp:query-pagination-previous /-->\n\n<!-- wp:query-pagination-next /-->\n<!-- /wp:query-pagination --></main>\n<!-- /wp:query -->\n\n<!-- wp:template-part {\"slug\":\"footer\",\"theme\":\"twentytwentytwo\",\"tagName\":\"footer\"} /-->', 'Home', 'Displays posts on the homepage, or on the Posts page if a static homepage is set.', 'publish', 'closed', 'closed', '', 'home', '', '', '2022-11-04 11:19:40', '2022-11-04 11:19:40', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/2022/11/04/home/', 0, 'wp_template', '', 0),
(27, 1, '2022-11-04 09:42:22', '2022-11-04 09:42:22', '<!-- wp:home-link {\"label\":\"Home\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Book Appointment\",\"type\":\"page\",\"rel\":\"file:///C:/Users/Sunil/Desktop/HCI%20Website/Front%20page/Appointment%20booking.html\",\"id\":2,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/sample-page/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"Login\",\"type\":\"category\",\"rel\":\"\\u0022C:\\\\Users\\\\Sunil\\\\Desktop\\\\HCI Website\\\\Login Page\\\\Online Hospital Appointment Login page.html\\u0022\",\"id\":1,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/category/uncategorised/\",\"kind\":\"taxonomy\",\"isTopLevelLink\":true} /-->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-04 09:42:22', '2022-11-04 09:42:22', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=27', 0, 'revision', '', 0),
(35, 1, '2022-11-04 10:29:29', '2022-11-04 10:29:29', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:group {\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\"}} -->\n<div class=\"wp-block-group\"><!-- wp:wppb/register {\"redirect_url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/log-in/\"} /--></div>\n<!-- /wp:group -->', 'Sign in', '', 'publish', 'closed', 'closed', '', 'sign-in', '', '', '2022-11-04 20:16:34', '2022-11-04 20:16:34', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/?page_id=35', 0, 'page', '', 0),
(36, 1, '2022-11-04 10:29:29', '2022-11-04 10:29:29', '', 'Sign in', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2022-11-04 10:29:29', '2022-11-04 10:29:29', '', 35, 'http://localhost/hospital%20online%20apointment/wordpress/?p=36', 0, 'revision', '', 0),
(44, 1, '2022-11-04 11:09:25', '2022-11-04 11:09:25', '<!-- wp:home-link {\"label\":\"Home\"} /-->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-04 11:09:25', '2022-11-04 11:09:25', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=44', 0, 'revision', '', 0),
(45, 1, '2022-11-04 11:09:25', '2022-11-04 11:09:25', '<!-- wp:group {\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"bottom\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dlarge, 8rem)\",\"top\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dsmall, 1.25rem)\"}}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--custom--spacing--small, 1.25rem);padding-bottom:var(--wp--custom--spacing--large, 8rem)\"><!-- wp:group {\"layout\":{\"type\":\"flex\"}} -->\n<div class=\"wp-block-group\"><!-- wp:site-logo {\"width\":60,\"shouldSyncIcon\":true} /-->\n\n<!-- wp:site-title /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|20\",\"right\":\"var:preset|spacing|20\",\"bottom\":\"var:preset|spacing|20\",\"left\":\"var:preset|spacing|20\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--20);padding-right:var(--wp--preset--spacing--20);padding-bottom:var(--wp--preset--spacing--20);padding-left:var(--wp--preset--spacing--20)\"><!-- wp:navigation {\"ref\":12,\"layout\":{\"type\":\"flex\",\"setCascadingProperties\":true,\"justifyContent\":\"right\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:buttons -->\n<div class=\"wp-block-buttons\"><!-- wp:button {\"className\":\"is-style-outline\"} -->\n<div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link wp-element-button\" href=\"\\Users\\Sunil\\Desktop\\HCI Website\\Login Page\\Online Hospital Appointment Login page.html&quot;\" target=\"_blank\" rel=\"noreferrer noopener\">Login</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons -->', 'Header', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2022-11-04 11:09:25', '2022-11-04 11:09:25', '', 14, 'http://localhost/hospital%20online%20apointment/wordpress/?p=45', 0, 'revision', '', 0),
(46, 1, '2022-11-04 11:10:20', '2022-11-04 11:10:20', '<!-- wp:group {\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"bottom\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dlarge, 8rem)\",\"top\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dsmall, 1.25rem)\"}}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--custom--spacing--small, 1.25rem);padding-bottom:var(--wp--custom--spacing--large, 8rem)\"><!-- wp:group {\"layout\":{\"type\":\"flex\"}} -->\n<div class=\"wp-block-group\"><!-- wp:site-logo {\"width\":60,\"shouldSyncIcon\":true} /-->\n\n<!-- wp:site-title /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|20\",\"right\":\"var:preset|spacing|20\",\"bottom\":\"var:preset|spacing|20\",\"left\":\"var:preset|spacing|20\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--20);padding-right:var(--wp--preset--spacing--20);padding-bottom:var(--wp--preset--spacing--20);padding-left:var(--wp--preset--spacing--20)\"><!-- wp:navigation {\"ref\":12,\"layout\":{\"type\":\"flex\",\"setCascadingProperties\":true,\"justifyContent\":\"right\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:buttons -->\n<div class=\"wp-block-buttons\"><!-- wp:button {\"className\":\"is-style-outline\"} -->\n<div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link wp-element-button\" href=\"http://localhost/hospital%20online%20apointment/wordpress/index.php/login/\">Login</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons -->', 'Header', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2022-11-04 11:10:20', '2022-11-04 11:10:20', '', 14, 'http://localhost/hospital%20online%20apointment/wordpress/?p=46', 0, 'revision', '', 0),
(47, 1, '2022-11-04 11:12:38', '2022-11-04 11:12:38', '<!-- wp:group {\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"bottom\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dlarge, 8rem)\",\"top\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dsmall, 1.25rem)\"}}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--custom--spacing--small, 1.25rem);padding-bottom:var(--wp--custom--spacing--large, 8rem)\"><!-- wp:group {\"layout\":{\"type\":\"flex\"}} -->\n<div class=\"wp-block-group\"><!-- wp:site-logo {\"width\":60,\"shouldSyncIcon\":true} /-->\n\n<!-- wp:site-title /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|20\",\"right\":\"var:preset|spacing|20\",\"bottom\":\"var:preset|spacing|20\",\"left\":\"var:preset|spacing|20\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--20);padding-right:var(--wp--preset--spacing--20);padding-bottom:var(--wp--preset--spacing--20);padding-left:var(--wp--preset--spacing--20)\"><!-- wp:navigation {\"ref\":12,\"layout\":{\"type\":\"flex\",\"setCascadingProperties\":true,\"justifyContent\":\"right\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:buttons {\"layout\":{\"type\":\"flex\",\"justifyContent\":\"right\",\"verticalAlignment\":\"top\"}} -->\n<div class=\"wp-block-buttons\"></div>\n<!-- /wp:buttons -->', 'Header', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2022-11-04 11:12:38', '2022-11-04 11:12:38', '', 14, 'http://localhost/hospital%20online%20apointment/wordpress/?p=47', 0, 'revision', '', 0),
(48, 1, '2022-11-04 11:12:38', '2022-11-04 11:12:38', '<!-- wp:home-link {\"label\":\"Home\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Book appointment\",\"type\":\"page\",\"id\":30,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/book-appointment/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"Login\",\"type\":\"page\",\"id\":33,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/login/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"Sign in\",\"type\":\"page\",\"id\":35,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/sign-in/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-04 11:12:38', '2022-11-04 11:12:38', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=48', 0, 'revision', '', 0),
(49, 1, '2022-11-04 11:14:12', '2022-11-04 11:14:12', '<!-- wp:group {\"align\":\"full\",\"style\":{\"elements\":{\"link\":{\"color\":{\"text\":\"var:preset|color|background\"}}},\"spacing\":{\"padding\":{\"top\":\"0px\",\"bottom\":\"0px\"}}},\"backgroundColor\":\"pale-cyan-blue\",\"textColor\":\"background\",\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignfull has-background-color has-pale-cyan-blue-background-color has-text-color has-background has-link-color\" style=\"padding-top:0px;padding-bottom:0px\"><!-- wp:template-part {\"slug\":\"header\",\"theme\":\"twentytwentytwo\",\"tagName\":\"header\",\"align\":\"wide\"} /-->\n\n<!-- wp:image {\"align\":\"wide\",\"id\":19,\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"style\":{\"border\":{\"width\":\"20px\",\"radius\":\"18px\"}},\"className\":\"is-style-default\"} -->\n<figure class=\"wp-block-image alignwide size-full has-custom-border is-style-default\"><img src=\"http://localhost/hospital%20online%20apointment/wordpress/wp-content/uploads/2022/11/a.jpg-2.png\" alt=\"City Hospital\n24X7\" class=\"wp-image-19\" style=\"border-width:20px;border-radius:18px\"/></figure>\n<!-- /wp:image --></div>\n<!-- /wp:group -->\n\n<!-- wp:spacer {\"height\":\"66px\"} -->\n<div style=\"height:66px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->', 'Header (dark, small)', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2022-11-04 11:14:12', '2022-11-04 11:14:12', '', 20, 'http://localhost/hospital%20online%20apointment/wordpress/?p=49', 0, 'revision', '', 0),
(50, 1, '2022-11-04 11:19:40', '2022-11-04 11:19:40', '<!-- wp:template-part {\"slug\":\"header-small-dark\",\"theme\":\"twentytwentytwo\",\"tagName\":\"header\"} /-->\n\n<!-- wp:query {\"queryId\":0,\"query\":{\"perPage\":10,\"pages\":0,\"offset\":0,\"postType\":\"post\",\"order\":\"desc\",\"orderBy\":\"date\",\"author\":\"\",\"search\":\"\",\"exclude\":[],\"sticky\":\"\",\"inherit\":true},\"tagName\":\"main\",\"displayLayout\":{\"type\":\"list\"},\"layout\":{\"inherit\":true}} -->\n<main class=\"wp-block-query\"><!-- wp:query-pagination {\"paginationArrow\":\"arrow\",\"align\":\"wide\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<!-- wp:query-pagination-previous /-->\n\n<!-- wp:query-pagination-next /-->\n<!-- /wp:query-pagination --></main>\n<!-- /wp:query -->\n\n<!-- wp:template-part {\"slug\":\"footer\",\"theme\":\"twentytwentytwo\",\"tagName\":\"footer\"} /-->', 'Home', 'Displays posts on the homepage, or on the Posts page if a static homepage is set.', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2022-11-04 11:19:40', '2022-11-04 11:19:40', '', 26, 'http://localhost/hospital%20online%20apointment/wordpress/?p=50', 0, 'revision', '', 0),
(51, 1, '2022-11-04 11:19:40', '2022-11-04 11:19:40', '<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var(--wp--custom--spacing--large, 8rem)\"}}},\"layout\":{\"inherit\":true}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--custom--spacing--large, 8rem)\">\n<!-- wp:pattern {\"slug\":\"twentytwentytwo/footer-default\"} /-->\n</div>\n<!-- /wp:group -->\n', 'Footer', '', 'publish', 'closed', 'closed', '', 'footer', '', '', '2022-11-04 11:19:40', '2022-11-04 11:19:40', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/2022/11/04/footer/', 0, 'wp_template_part', '', 0),
(52, 1, '2022-11-04 11:19:40', '2022-11-04 11:19:40', '<!-- wp:group {\"align\":\"full\",\"style\":{\"elements\":{\"link\":{\"color\":{\"text\":\"var:preset|color|background\"}}},\"spacing\":{\"padding\":{\"top\":\"0px\",\"bottom\":\"0px\"}}},\"backgroundColor\":\"pale-cyan-blue\",\"textColor\":\"background\",\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignfull has-background-color has-pale-cyan-blue-background-color has-text-color has-background has-link-color\" style=\"padding-top:0px;padding-bottom:0px\"><!-- wp:template-part {\"slug\":\"header\",\"theme\":\"twentytwentytwo\",\"tagName\":\"header\",\"align\":\"wide\"} /-->\n\n<!-- wp:cover {\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/wp-content/uploads/2022/11/a.jpg-2.png\",\"id\":19,\"dimRatio\":50,\"isDark\":false,\"align\":\"wide\",\"style\":{\"color\":{}}} -->\n<div class=\"wp-block-cover alignwide is-light\"><span aria-hidden=\"true\" class=\"wp-block-cover__background has-background-dim\"></span><img class=\"wp-block-cover__image-background wp-image-19\" alt=\"City Hospital\n24X7\" src=\"http://localhost/hospital%20online%20apointment/wordpress/wp-content/uploads/2022/11/a.jpg-2.png\" data-object-fit=\"cover\"/><div class=\"wp-block-cover__inner-container\"><!-- wp:paragraph {\"align\":\"left\",\"textColor\":\"background\",\"fontSize\":\"large\"} -->\n<p class=\"has-text-align-left has-background-color has-text-color has-large-font-size\">Health care service </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"background\"} -->\n<p class=\"has-background-color has-text-color\">We care about your health</p>\n<!-- /wp:paragraph --></div></div>\n<!-- /wp:cover --></div>\n<!-- /wp:group -->\n\n<!-- wp:spacer {\"height\":\"66px\"} -->\n<div style=\"height:66px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:paragraph -->\n<p>About us </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Healthcare is the most important aspect of life, and the pandemic has made this true more than ever. At Bharati Vidyapeeth Health Sciences, our exceptional team of doctors, nurses and caregivers come together to bring you excellent care with the latest technologies, best medicine, and warmest service.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The Bharati Vidyapeeth’s Bharati Hospital is situated on the main Pune – Satara Road in the southern part of Pune city. The teaching hospital occupies 25 acres of land on a sprawling lush green campus.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The hospital not only functions for clinical training of undergraduate and postgraduate students but also caters to the medical needs of a large segment of population of South Pune as well as the surrounding rural areas including poor and needy patients.</p>\n<!-- /wp:paragraph -->', 'Header (dark, small)', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2022-11-04 11:19:40', '2022-11-04 11:19:40', '', 20, 'http://localhost/hospital%20online%20apointment/wordpress/?p=52', 0, 'revision', '', 0),
(53, 1, '2022-11-04 11:20:23', '2022-11-04 11:20:23', '', 'Contact us', '', 'publish', 'closed', 'closed', '', 'contact-us', '', '', '2022-11-04 11:20:23', '2022-11-04 11:20:23', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/?page_id=53', 0, 'page', '', 0),
(54, 1, '2022-11-04 11:20:23', '2022-11-04 11:20:23', '', 'Contact us', '', 'inherit', 'closed', 'closed', '', '53-revision-v1', '', '', '2022-11-04 11:20:23', '2022-11-04 11:20:23', '', 53, 'http://localhost/hospital%20online%20apointment/wordpress/?p=54', 0, 'revision', '', 0),
(58, 1, '2022-11-04 19:17:44', '2022-11-04 19:17:44', '<!-- wp:group {\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"bottom\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dlarge, 8rem)\",\"top\":\"var(\\u002d\\u002dwp\\u002d\\u002dcustom\\u002d\\u002dspacing\\u002d\\u002dsmall, 1.25rem)\"}}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--custom--spacing--small, 1.25rem);padding-bottom:var(--wp--custom--spacing--large, 8rem)\"><!-- wp:group {\"layout\":{\"type\":\"flex\"}} -->\n<div class=\"wp-block-group\"><!-- wp:site-logo {\"width\":60,\"shouldSyncIcon\":true} /-->\n\n<!-- wp:site-title /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|20\",\"right\":\"var:preset|spacing|20\",\"bottom\":\"var:preset|spacing|20\",\"left\":\"var:preset|spacing|20\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--20);padding-right:var(--wp--preset--spacing--20);padding-bottom:var(--wp--preset--spacing--20);padding-left:var(--wp--preset--spacing--20)\"><!-- wp:navigation {\"ref\":12,\"layout\":{\"type\":\"flex\",\"setCascadingProperties\":true,\"justifyContent\":\"right\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:buttons {\"layout\":{\"type\":\"flex\",\"justifyContent\":\"right\",\"verticalAlignment\":\"top\"}} -->\n<div class=\"wp-block-buttons\"><!-- wp:button /--></div>\n<!-- /wp:buttons -->', 'Header', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2022-11-04 19:17:44', '2022-11-04 19:17:44', '', 14, 'http://localhost/hospital%20online%20apointment/wordpress/?p=58', 0, 'revision', '', 0),
(59, 1, '2022-11-04 19:22:55', '2022-11-04 19:22:55', '<!-- wp:group {\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignwide\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"bottom\":\"var:preset|spacing|30\",\"top\":\"var:preset|spacing|30\",\"right\":\"var:preset|spacing|30\",\"left\":\"var:preset|spacing|30\"},\"blockGap\":\"var:preset|spacing|30\"},\"color\":{\"gradient\":\"linear-gradient(135deg,rgb(6,147,227) 0%,rgb(255,255,255) 46%,rgb(155,81,224) 100%)\"}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide has-background\" style=\"background:linear-gradient(135deg,rgb(6,147,227) 0%,rgb(255,255,255) 46%,rgb(155,81,224) 100%);padding-top:var(--wp--preset--spacing--30);padding-right:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30);padding-left:var(--wp--preset--spacing--30)\"><!-- wp:group {\"layout\":{\"type\":\"flex\"}} -->\n<div class=\"wp-block-group\"><!-- wp:site-logo {\"width\":60,\"shouldSyncIcon\":true} /-->\n\n<!-- wp:site-title /--></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|20\",\"right\":\"var:preset|spacing|20\",\"bottom\":\"var:preset|spacing|20\",\"left\":\"var:preset|spacing|20\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--20);padding-right:var(--wp--preset--spacing--20);padding-bottom:var(--wp--preset--spacing--20);padding-left:var(--wp--preset--spacing--20)\"><!-- wp:navigation {\"ref\":12,\"layout\":{\"type\":\"flex\",\"setCascadingProperties\":true,\"justifyContent\":\"right\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:buttons {\"layout\":{\"type\":\"flex\",\"justifyContent\":\"right\",\"verticalAlignment\":\"top\"}} -->\n<div class=\"wp-block-buttons\"></div>\n<!-- /wp:buttons -->', 'Header', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2022-11-04 19:22:55', '2022-11-04 19:22:55', '', 14, 'http://localhost/hospital%20online%20apointment/wordpress/?p=59', 0, 'revision', '', 0),
(60, 1, '2022-11-04 19:31:35', '2022-11-04 19:31:35', '', 'Default Registration', '', 'publish', 'closed', 'closed', '', 'default-registration', '', '', '2022-11-04 19:31:35', '2022-11-04 19:31:35', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/um_form/default-registration/', 0, 'um_form', '', 0),
(61, 1, '2022-11-04 19:31:35', '2022-11-04 19:31:35', '', 'Default Login', '', 'publish', 'closed', 'closed', '', 'default-login', '', '', '2022-11-04 19:31:35', '2022-11-04 19:31:35', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/um_form/default-login/', 0, 'um_form', '', 0),
(62, 1, '2022-11-04 19:31:35', '2022-11-04 19:31:35', '', 'Default Profile', '', 'publish', 'closed', 'closed', '', 'default-profile', '', '', '2022-11-04 19:31:35', '2022-11-04 19:31:35', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/um_form/default-profile/', 0, 'um_form', '', 0),
(63, 1, '2022-11-04 19:31:35', '2022-11-04 19:31:35', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2022-11-04 19:31:35', '2022-11-04 19:31:35', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/um_directory/members/', 0, 'um_directory', '', 0),
(64, 1, '2022-11-04 19:32:26', '2022-11-04 19:32:26', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cpapphourbk/form-rendering {\"formId\":\"2\",\"instanceId\":\"25059\"} /-->', 'Book appointment', '', 'publish', 'closed', 'closed', '', 'register', '', '', '2022-11-04 20:10:10', '2022-11-04 20:10:10', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/register/', 0, 'page', '', 0),
(66, 1, '2022-11-04 19:32:26', '2022-11-04 19:32:26', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:wppb/login /-->', 'Log In', '', 'publish', 'closed', 'closed', '', 'log-in', '', '', '2022-11-04 19:43:02', '2022-11-04 19:43:02', '', 0, 'http://localhost/hospital%20online%20apointment/wordpress/index.php/log-in/', 0, 'page', '', 0),
(68, 1, '2022-11-04 19:36:06', '2022-11-04 19:36:06', '<!-- wp:shortcode -->\nEnter Your Full name\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Register', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2022-11-04 19:36:06', '2022-11-04 19:36:06', '', 64, 'http://localhost/hospital%20online%20apointment/wordpress/?p=68', 0, 'revision', '', 0),
(70, 1, '2022-11-04 19:41:12', '2022-11-04 19:41:12', '<!-- wp:wppb/login /-->', 'Log In', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2022-11-04 19:41:12', '2022-11-04 19:41:12', '', 66, 'http://localhost/hospital%20online%20apointment/wordpress/?p=70', 0, 'revision', '', 0),
(71, 1, '2022-11-04 19:43:01', '2022-11-04 19:43:01', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:wppb/login /-->', 'Log In', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2022-11-04 19:43:01', '2022-11-04 19:43:01', '', 66, 'http://localhost/hospital%20online%20apointment/wordpress/?p=71', 0, 'revision', '', 0),
(72, 1, '2022-11-04 19:45:23', '2022-11-04 19:45:23', '<!-- wp:home-link {\"label\":\"Home\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Sign in\",\"type\":\"page\",\"id\":35,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/sign-in/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"Log In\",\"type\":\"page\",\"id\":66,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/log-in/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-04 19:45:23', '2022-11-04 19:45:23', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=72', 0, 'revision', '', 0),
(73, 1, '2022-11-04 19:48:52', '2022-11-04 19:48:52', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cover {\"dimRatio\":50,\"isDark\":false} -->\n<div class=\"wp-block-cover is-light\"><span aria-hidden=\"true\" class=\"wp-block-cover__background has-background-dim\"></span><div class=\"wp-block-cover__inner-container\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:wppb/edit-profile /--></div>\n<!-- /wp:group --></div></div>\n<!-- /wp:cover -->', 'Book appointment', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2022-11-04 19:48:52', '2022-11-04 19:48:52', '', 64, 'http://localhost/hospital%20online%20apointment/wordpress/?p=73', 0, 'revision', '', 0),
(75, 1, '2022-11-04 19:53:00', '2022-11-04 19:53:00', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:group {\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\"}} -->\n<div class=\"wp-block-group\"><!-- wp:wppb/register {\"redirect_url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/log-in/\"} /--></div>\n<!-- /wp:group -->', 'Sign in', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2022-11-04 19:53:00', '2022-11-04 19:53:00', '', 35, 'http://localhost/hospital%20online%20apointment/wordpress/?p=75', 0, 'revision', '', 0),
(77, 1, '2022-11-04 20:10:02', '2022-11-04 20:10:02', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:cpapphourbk/form-rendering {\"formId\":\"2\",\"instanceId\":\"25059\"} /-->', 'Book appointment', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2022-11-04 20:10:02', '2022-11-04 20:10:02', '', 64, 'http://localhost/hospital%20online%20apointment/wordpress/?p=77', 0, 'revision', '', 0),
(78, 1, '2022-11-04 20:11:49', '2022-11-04 20:11:49', '<!-- wp:home-link {\"label\":\"Home\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Sign in\",\"type\":\"page\",\"id\":35,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/sign-in/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"Log In\",\"type\":\"page\",\"id\":66,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/log-in/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"Book appointment\",\"type\":\"page\",\"id\":64,\"url\":\"http://localhost/hospital%20online%20apointment/wordpress/index.php/register/\",\"kind\":\"post-type\",\"isTopLevelLink\":true} /-->', 'Header navigation', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2022-11-04 20:11:49', '2022-11-04 20:11:49', '', 12, 'http://localhost/hospital%20online%20apointment/wordpress/?p=78', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorised', 'uncategorised', 0),
(2, 'twentytwentytwo', 'twentytwentytwo', 0),
(3, 'header', 'header', 0),
(4, 'footer', 'footer', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(6, 2, 0),
(14, 2, 0),
(14, 3, 0),
(20, 2, 0),
(20, 3, 0),
(26, 2, 0),
(51, 2, 0),
(51, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'wp_theme', '', 0, 5),
(3, 3, 'wp_template_part_area', '', 0, 2),
(4, 4, 'wp_template_part_area', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_um_metadata`
--

CREATE TABLE `wp_um_metadata` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `um_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `um_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'wp_persisted_preferences', 'a:3:{s:14:\"core/edit-post\";a:3:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;s:10:\"openPanels\";a:4:{i:0;s:11:\"post-status\";i:1;s:14:\"featured-image\";i:2;s:15:\"page-attributes\";i:3;s:16:\"discussion-panel\";}}s:9:\"_modified\";s:24:\"2022-11-04T19:24:53.011Z\";s:14:\"core/edit-site\";a:2:{s:12:\"welcomeGuide\";b:0;s:26:\"isComplementaryAreaVisible\";b:1;}}'),
(19, 1, 'wp_user-settings', 'libraryContent=browse'),
(20, 1, 'wp_user-settings-time', '1667500455'),
(21, 1, 'account_status', 'approved'),
(22, 1, 'um_member_directory_data', 'a:5:{s:14:\"account_status\";s:8:\"approved\";s:15:\"hide_in_members\";b:0;s:13:\"profile_photo\";b:0;s:11:\"cover_photo\";b:0;s:8:\"verified\";b:0;}'),
(23, 1, 'closedpostboxes_page', 'a:1:{i:0;s:25:\"um-admin-restrict-content\";}'),
(24, 1, 'metaboxhidden_page', 'a:0:{}'),
(26, 1, '_um_last_login', '1667593097'),
(29, 2, 'nickname', 'KSIpar'),
(30, 2, 'first_name', 'krutika'),
(31, 2, 'last_name', 'Ipar'),
(32, 2, 'description', 'Always happy'),
(33, 2, 'rich_editing', 'true'),
(34, 2, 'syntax_highlighting', 'true'),
(35, 2, 'comment_shortcuts', 'false'),
(36, 2, 'admin_color', 'fresh'),
(37, 2, 'use_ssl', '0'),
(38, 2, 'show_admin_bar_front', 'true'),
(39, 2, 'locale', ''),
(40, 2, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(41, 2, 'wp_user_level', '0'),
(42, 2, 'synced_gravatar_hashed_id', '9f422d6bd64c185533a87a3173f7f81c'),
(43, 2, 'um_member_directory_data', 'a:5:{s:14:\"account_status\";s:8:\"approved\";s:15:\"hide_in_members\";b:0;s:13:\"profile_photo\";b:0;s:11:\"cover_photo\";b:0;s:8:\"verified\";b:0;}'),
(45, 2, '_um_last_login', '1667591705'),
(47, 3, 'nickname', 'KSIpar'),
(48, 3, 'first_name', 'Krutika'),
(49, 3, 'last_name', 'Ipar'),
(50, 3, 'description', 'chill'),
(51, 3, 'rich_editing', 'true'),
(52, 3, 'syntax_highlighting', 'true'),
(53, 3, 'comment_shortcuts', 'false'),
(54, 3, 'admin_color', 'fresh'),
(55, 3, 'use_ssl', '0'),
(56, 3, 'show_admin_bar_front', 'true'),
(57, 3, 'locale', ''),
(58, 3, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(59, 3, 'wp_user_level', '0'),
(60, 3, 'synced_gravatar_hashed_id', 'd3d9f768d2248753ca549da3eb0548ce'),
(61, 3, 'um_member_directory_data', 'a:5:{s:14:\"account_status\";s:8:\"approved\";s:15:\"hide_in_members\";b:0;s:13:\"profile_photo\";b:0;s:11:\"cover_photo\";b:0;s:8:\"verified\";b:0;}'),
(63, 1, 'wppb_pms_cross_promo_dismiss_notification', 'true'),
(64, 4, 'nickname', 'kit'),
(65, 4, 'first_name', 'Krutika'),
(66, 4, 'last_name', 'Ipar'),
(67, 4, 'description', 'be happy'),
(68, 4, 'rich_editing', 'true'),
(69, 4, 'syntax_highlighting', 'true'),
(70, 4, 'comment_shortcuts', 'false'),
(71, 4, 'admin_color', 'fresh'),
(72, 4, 'use_ssl', '0'),
(73, 4, 'show_admin_bar_front', 'true'),
(74, 4, 'locale', ''),
(75, 4, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(76, 4, 'wp_user_level', '0'),
(77, 4, 'synced_gravatar_hashed_id', '71d20344bf815b96d13cc1ae85f72f2d'),
(78, 4, 'um_member_directory_data', 'a:5:{s:14:\"account_status\";s:8:\"approved\";s:15:\"hide_in_members\";b:0;s:13:\"profile_photo\";b:0;s:11:\"cover_photo\";b:0;s:8:\"verified\";b:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BtlGWToXicrYjPdIJR.Dkli5E5.x.U0', 'admin', 'krutika.ipar.k@gmail.com', 'http://localhost/hospital%20online%20apointment/wordpress', '2022-11-03 18:29:03', '', 0, 'admin'),
(2, 'krutika.ipar', '$P$BTOBjW05GWwprU2A2UN8DDajsskKRT0', 'krutika-ipar', 'krutika.ipar@gmail.com', 'http://localhost/hospital%20online%20apointment/wordpress/index.php/si', '2022-11-04 19:54:41', '', 0, 'krutika Ipar'),
(3, 'missperfect701', '$P$BNJC6uOJzqoDzerSP5Xwg2v0QXA.9N.', 'missperfect701', 'ayhsbd@gjsh.com', 'http://localhost/hospital%20online%20apointment/wordpress/index.php/si', '2022-11-04 20:17:22', '', 0, 'Krutika Ipar'),
(4, 'krutikaipar', '$P$BB21R0IFDjOS13lcYuY/aIqnS0OtKL0', 'krutikaipar', 'usydgh@hjs.com', 'http://localhost/hospital%20online%20apointment/wordpress/index.php/si', '2022-11-05 04:18:02', '', 0, 'Krutika Ipar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_bookly_appointments`
--
ALTER TABLE `wp_bookly_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `wp_bookly_categories`
--
ALTER TABLE `wp_bookly_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_customers`
--
ALTER TABLE `wp_bookly_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_customer_appointments`
--
ALTER TABLE `wp_bookly_customer_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `series_id` (`series_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `wp_bookly_holidays`
--
ALTER TABLE `wp_bookly_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `wp_bookly_log`
--
ALTER TABLE `wp_bookly_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_mailing_campaigns`
--
ALTER TABLE `wp_bookly_mailing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mailing_list_id` (`mailing_list_id`);

--
-- Indexes for table `wp_bookly_mailing_lists`
--
ALTER TABLE `wp_bookly_mailing_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_mailing_list_recipients`
--
ALTER TABLE `wp_bookly_mailing_list_recipients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mailing_list_id` (`mailing_list_id`);

--
-- Indexes for table `wp_bookly_mailing_queue`
--
ALTER TABLE `wp_bookly_mailing_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_news`
--
ALTER TABLE `wp_bookly_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_notifications`
--
ALTER TABLE `wp_bookly_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_orders`
--
ALTER TABLE `wp_bookly_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_payments`
--
ALTER TABLE `wp_bookly_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_schedule_item_breaks`
--
ALTER TABLE `wp_bookly_schedule_item_breaks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_schedule_item_id` (`staff_schedule_item_id`);

--
-- Indexes for table `wp_bookly_sent_notifications`
--
ALTER TABLE `wp_bookly_sent_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id_idx` (`ref_id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `wp_bookly_series`
--
ALTER TABLE `wp_bookly_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_services`
--
ALTER TABLE `wp_bookly_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `wp_bookly_shop`
--
ALTER TABLE `wp_bookly_shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_staff`
--
ALTER TABLE `wp_bookly_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_staff_schedule_items`
--
ALTER TABLE `wp_bookly_staff_schedule_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids_idx` (`staff_id`,`day_index`,`location_id`);

--
-- Indexes for table `wp_bookly_staff_services`
--
ALTER TABLE `wp_bookly_staff_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids_idx` (`staff_id`,`service_id`,`location_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `wp_bookly_stats`
--
ALTER TABLE `wp_bookly_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_sub_services`
--
ALTER TABLE `wp_bookly_sub_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `sub_service_id` (`sub_service_id`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_cpappbk_forms`
--
ALTER TABLE `wp_cpappbk_forms`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wp_cpappbk_messages`
--
ALTER TABLE `wp_cpappbk_messages`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_um_metadata`
--
ALTER TABLE `wp_um_metadata`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id_indx` (`user_id`),
  ADD KEY `meta_key_indx` (`um_key`),
  ADD KEY `meta_value_indx` (`um_value`(191));

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_bookly_appointments`
--
ALTER TABLE `wp_bookly_appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_categories`
--
ALTER TABLE `wp_bookly_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_customers`
--
ALTER TABLE `wp_bookly_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_customer_appointments`
--
ALTER TABLE `wp_bookly_customer_appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_holidays`
--
ALTER TABLE `wp_bookly_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_log`
--
ALTER TABLE `wp_bookly_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_mailing_campaigns`
--
ALTER TABLE `wp_bookly_mailing_campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_mailing_lists`
--
ALTER TABLE `wp_bookly_mailing_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_mailing_list_recipients`
--
ALTER TABLE `wp_bookly_mailing_list_recipients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_mailing_queue`
--
ALTER TABLE `wp_bookly_mailing_queue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_news`
--
ALTER TABLE `wp_bookly_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `wp_bookly_notifications`
--
ALTER TABLE `wp_bookly_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wp_bookly_orders`
--
ALTER TABLE `wp_bookly_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_payments`
--
ALTER TABLE `wp_bookly_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_schedule_item_breaks`
--
ALTER TABLE `wp_bookly_schedule_item_breaks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_sent_notifications`
--
ALTER TABLE `wp_bookly_sent_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_series`
--
ALTER TABLE `wp_bookly_series`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_services`
--
ALTER TABLE `wp_bookly_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_shop`
--
ALTER TABLE `wp_bookly_shop`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `wp_bookly_staff`
--
ALTER TABLE `wp_bookly_staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_staff_schedule_items`
--
ALTER TABLE `wp_bookly_staff_schedule_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_staff_services`
--
ALTER TABLE `wp_bookly_staff_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_stats`
--
ALTER TABLE `wp_bookly_stats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_sub_services`
--
ALTER TABLE `wp_bookly_sub_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_cpappbk_forms`
--
ALTER TABLE `wp_cpappbk_forms`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_cpappbk_messages`
--
ALTER TABLE `wp_cpappbk_messages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=877;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wp_um_metadata`
--
ALTER TABLE `wp_um_metadata`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wp_bookly_appointments`
--
ALTER TABLE `wp_bookly_appointments`
  ADD CONSTRAINT `wp_bookly_appointments_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_bookly_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_appointments_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `wp_bookly_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_customer_appointments`
--
ALTER TABLE `wp_bookly_customer_appointments`
  ADD CONSTRAINT `wp_bookly_customer_appointments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `wp_bookly_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_customer_appointments_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `wp_bookly_appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_customer_appointments_ibfk_3` FOREIGN KEY (`series_id`) REFERENCES `wp_bookly_series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_customer_appointments_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `wp_bookly_payments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_customer_appointments_ibfk_5` FOREIGN KEY (`order_id`) REFERENCES `wp_bookly_orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_holidays`
--
ALTER TABLE `wp_bookly_holidays`
  ADD CONSTRAINT `wp_bookly_holidays_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_bookly_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_mailing_campaigns`
--
ALTER TABLE `wp_bookly_mailing_campaigns`
  ADD CONSTRAINT `wp_bookly_mailing_campaigns_ibfk_1` FOREIGN KEY (`mailing_list_id`) REFERENCES `wp_bookly_mailing_lists` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_mailing_list_recipients`
--
ALTER TABLE `wp_bookly_mailing_list_recipients`
  ADD CONSTRAINT `wp_bookly_mailing_list_recipients_ibfk_1` FOREIGN KEY (`mailing_list_id`) REFERENCES `wp_bookly_mailing_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_schedule_item_breaks`
--
ALTER TABLE `wp_bookly_schedule_item_breaks`
  ADD CONSTRAINT `wp_bookly_schedule_item_breaks_ibfk_1` FOREIGN KEY (`staff_schedule_item_id`) REFERENCES `wp_bookly_staff_schedule_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_sent_notifications`
--
ALTER TABLE `wp_bookly_sent_notifications`
  ADD CONSTRAINT `wp_bookly_sent_notifications_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `wp_bookly_notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_services`
--
ALTER TABLE `wp_bookly_services`
  ADD CONSTRAINT `wp_bookly_services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `wp_bookly_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_staff_schedule_items`
--
ALTER TABLE `wp_bookly_staff_schedule_items`
  ADD CONSTRAINT `wp_bookly_staff_schedule_items_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_bookly_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_staff_services`
--
ALTER TABLE `wp_bookly_staff_services`
  ADD CONSTRAINT `wp_bookly_staff_services_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_bookly_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_staff_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `wp_bookly_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_sub_services`
--
ALTER TABLE `wp_bookly_sub_services`
  ADD CONSTRAINT `wp_bookly_sub_services_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `wp_bookly_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_sub_services_ibfk_2` FOREIGN KEY (`sub_service_id`) REFERENCES `wp_bookly_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
