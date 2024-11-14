-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2024 at 05:13 PM
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
-- Database: `city_travel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add agency', 7, 'add_agency'),
(26, 'Can change agency', 7, 'change_agency'),
(27, 'Can delete agency', 7, 'delete_agency'),
(28, 'Can view agency', 7, 'view_agency'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add trip plan', 9, 'add_tripplan'),
(34, 'Can change trip plan', 9, 'change_tripplan'),
(35, 'Can delete trip plan', 9, 'delete_tripplan'),
(36, 'Can view trip plan', 9, 'view_tripplan'),
(37, 'Can add attraction', 10, 'add_attraction'),
(38, 'Can change attraction', 10, 'change_attraction'),
(39, 'Can delete attraction', 10, 'delete_attraction'),
(40, 'Can view attraction', 10, 'view_attraction'),
(41, 'Can add ticket', 11, 'add_ticket'),
(42, 'Can change ticket', 11, 'change_ticket'),
(43, 'Can delete ticket', 11, 'delete_ticket'),
(44, 'Can view ticket', 11, 'view_ticket'),
(45, 'Can add passenger', 12, 'add_passenger'),
(46, 'Can change passenger', 12, 'change_passenger'),
(47, 'Can delete passenger', 12, 'delete_passenger'),
(48, 'Can view passenger', 12, 'view_passenger');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(12, 'ticket', 'passenger'),
(11, 'ticket', 'ticket'),
(10, 'trip', 'attraction'),
(9, 'trip', 'tripplan'),
(7, 'users', 'agency'),
(8, 'users', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-07 20:57:39.310711'),
(2, 'auth', '0001_initial', '2024-05-07 20:57:39.776080'),
(3, 'admin', '0001_initial', '2024-05-07 20:57:39.865864'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-05-07 20:57:39.889500'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-07 20:57:39.894098'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-05-07 20:57:39.952192'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-05-07 20:57:40.020875'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-05-07 20:57:40.038677'),
(9, 'auth', '0004_alter_user_username_opts', '2024-05-07 20:57:40.047615'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-05-07 20:57:40.100996'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-05-07 20:57:40.100996'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-05-07 20:57:40.116902'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-05-07 20:57:40.140865'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-05-07 20:57:40.157666'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-05-07 20:57:40.175680'),
(16, 'auth', '0011_update_proxy_permissions', '2024-05-07 20:57:40.189252'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-05-07 20:57:40.197054'),
(18, 'sessions', '0001_initial', '2024-05-07 20:57:40.240100'),
(19, 'users', '0001_initial', '2024-05-07 20:57:40.289942'),
(20, 'trip', '0001_initial', '2024-05-07 20:57:40.456469'),
(21, 'ticket', '0001_initial', '2024-05-07 20:57:40.657982'),
(22, 'ticket', '0002_ticket_total_price', '2024-05-08 08:19:24.449285');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7bo4tyj8fpa4v2keqsbmw9ky1o04hwur', '.eJx1jrEKg0AQRH9Ftg5im3TC1anSHxNdvCPcRm5PgoT8u6soJEXKmXk7s2_CwNLNXpCYLuQyI82VYy1RUOJT6HQgk3LesTE158Y5yzymErbIx_5fwRd0R_dgWclVar1rrdttpDXw9yBAg9FmlhzH488rXhAMyNXNXPoszytGtw:1s74XS:hM3IH1FX4vzwZJ9uiZPowIPSukXx2q55WKg4hqQUF9c', '2024-05-29 02:38:42.564596'),
('8pc4695ddupvbccdso9li2vov90uz9i4', '.eJxVjjEOwjAMRa-CPKMMDAxMZWWGOTJNVFvFKYqTqeLuOFGHdvP7_9nyClVjTigRbhAIs_AM5x76KMgfi3GY2uTGRazyWAv5LnA4LO2aN45zTK1uqG5jdS_Du2lHnVDJXAsLm1j65evFMPPXb989asIJA52eS82sAr8_r6VCUg:1sASlW:MrG2YRitprcqQgHBjywHNfMj3zpYfq7ytxJAR2Z8cfo', '2024-06-07 11:07:14.257304'),
('i3b69lik1168n21o5d3m1w73fxi9wl9o', '.eJxVjsEKgzAMQH9l5DwKvSh42n5h4LlEDWux7cRUL-K_mxYZenwvLyEbLExzxEDQwGAneBZhKKDzosJIK3qt69c3G9X_giQGl2RNCd3wX7zYDvuRYh5lZHUyq1bwLdk9t8hWWpHJSZjK1aoWnN1kzu8-GOOjTYwr7AfXpz9U:1scS00:vdLyeV9CNSC98NixycT6PrMM7209k2TRD8Xy2nUumtI', '2024-08-23 15:57:52.680614'),
('i581y9qvtq2u5vu7rc8rschi8h0lzczd', '.eJxljkEOQDAQRa8isxZhyc4d7JvBRBvaNC0SEXc3bRBi-f97PzM74ECm24RBTVBB43ClSaNRCOnNFk_u4r20EeYlY4HLLCMVqv-NX7TFbiQTlBB9dmWf1fFAzeJ3INFLtrmcnbLPc6TtREnDVVIWcJwX20Kl:1s6SpW:-oVo_BPj3PGmh7uu7ZTuUCoBbxjQbvULlnIKRJEzBIk', '2024-05-27 10:22:50.132997'),
('jsdrus7fvi5blfrbywryt6w8xf7ynf0u', '.eJyrVkpMT81LrozPS8xNVbJSCilKLEvNyU3My0xU0oHJlRanFkHlUzIKwJIGlkDp-MTSkgywbHxmCoZmJNmkxOTs1DyQEhC3WA_KL9ZzBFvgCFSIqiEjsTgDqFqpFgAMejlI:1s6SDy:b-WzZ-sn7yRVjaPgIRbM8hiB8wLOv6QoEvOfbwhCCJk', '2024-05-27 09:44:02.855211'),
('l4ebv1q14tfsux66rxf97i5flssxujii', '.eJyrVkpMT81LrozPS8xNVbJSSlHSgYmUFqcWIYnGJ5aWZIAF4zNTMMWSEpOzU_NAEiBusR6UX6wXCuQ6ApWhKs9ILM4AqgUKZhbHp6ZkliQm5QBtMtBRKinKLIC5JhEhD5SrBQBlmTtB:1s4S7t:4RI3Ht0VGauw_b-qXrD3Dfb3ClVhXV2R7ps1cQCPmX4', '2024-05-21 21:13:29.022411'),
('ux48o26la93726ofwd0l2eroowhm5g65', 'eyJpc19lZGl0YWJsZSI6MH0:1s6Q12:q4AFdeKVnL0Q7ZfO4ylx-ZBqQxJq46BQXGIZ5cjCEEA', '2024-05-27 07:22:32.097836');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_passenger`
--

CREATE TABLE `ticket_passenger` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `ticket_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_passenger`
--

INSERT INTO `ticket_passenger` (`id`, `name`, `age`, `ticket_id_id`) VALUES
(36, 'Dharmik', 20, 47),
(42, 'dharmik', 50, 60),
(43, 'John', 20, 60),
(44, 'dharmik', 50, 61),
(45, 'Dharmik', 50, 63),
(46, 'k', 50, 65),
(47, 'q', 2, 66),
(48, 'a', 10, 67);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_ticket`
--

CREATE TABLE `ticket_ticket` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `trip_name_id` varchar(30) NOT NULL,
  `username_id` varchar(30) NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_ticket`
--

INSERT INTO `ticket_ticket` (`id`, `transaction_id`, `trip_name_id`, `username_id`, `total_price`) VALUES
(47, 'NM1S5EVXDF', 'Junagadh Tourism', 'dharmik', 3000),
(59, '0VTLDSLVEK', 'Capital Tour', 'dharmik', 0),
(60, 'KUMHDXUBV9', 'Junagadh Tourism', 'dharmik', 3000),
(61, 'N2EMI2LYYF', 'Junagadh Tourism', 'dharmik', 1500),
(62, '5EZT5IGWN5', 'Junagadh Tourism', 'dharmik', 0),
(63, 'YS8YBPWC6O', 'Junagadh Tourism', 'dhp', 1500),
(64, 'AS71QI08PT', 'Junagadh Tourism', 'dhp', 0),
(65, 'I1LU7HG56F', 'Junagadh Tourism', 'dhp', 1500),
(66, 'BVIRX1ZP4J', 'Junagadh Tourism', 'dhp', 1500),
(67, 'Q90Y26MXHR', 'Rann Utsav', 'dhp', 1700);

-- --------------------------------------------------------

--
-- Table structure for table `trip_attraction`
--

CREATE TABLE `trip_attraction` (
  `id` int(11) NOT NULL,
  `att_name` varchar(30) NOT NULL,
  `att_imgs` varchar(100) NOT NULL,
  `trip_name_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_attraction`
--

INSERT INTO `trip_attraction` (`id`, `att_name`, `att_imgs`, `trip_name_id`) VALUES
(6, 'Dwarkadhish Temple', 'attraction/Dwarkadhish_7U0UYvr.jpg', 'Temple Trip'),
(7, 'Shivrajpur Beach', 'attraction/ShivrajpurBeach.jpg', 'Temple Trip'),
(8, 'Somnath Temple', 'attraction/Somnath.jpg', 'Junagadh Tourism'),
(9, 'Sasan Gir', 'attraction/SasanGir2.png', 'Junagadh Tourism'),
(10, 'Uparkort Fort', 'attraction/Uparkort_Fort.jpeg', 'Junagadh Tourism'),
(11, 'Mata no madh', 'attraction/Mata_no_madh.jpeg', 'Rann Utsav'),
(12, 'Rann Utsav', 'attraction/Rann_Utsav.jpeg', 'Rann Utsav'),
(13, 'Marine National Park', 'attraction/Marine_NP.jpeg', 'Nawanagar Trip'),
(14, 'Bala Hanuman', 'attraction/Bala_Hanuman.jpeg', 'Nawanagar Trip'),
(15, 'Khijadiya', 'attraction/Khijadiya.jpeg', 'Nawanagar Trip'),
(16, 'Ranmal Lake', 'attraction/Ranmal_Lake.jpg', 'Nawanagar Trip'),
(17, 'Akshardham', 'attraction/Akshardham.jpg', 'Capital Tour'),
(18, 'Indroda Park', 'attraction/Indroda_Park.jpg', 'Capital Tour'),
(19, 'Adalaj Ni Vav', 'attraction/Adalaj_Ni_Vav.jpg', 'Capital Tour');

-- --------------------------------------------------------

--
-- Table structure for table `trip_tripplan`
--

CREATE TABLE `trip_tripplan` (
  `trip_name` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `price` double NOT NULL,
  `capacity` int(11) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time(6) NOT NULL,
  `departure_place` varchar(30) NOT NULL,
  `return_date` date NOT NULL,
  `return_time` time(6) NOT NULL,
  `return_place` varchar(30) NOT NULL,
  `duration` int(11) NOT NULL,
  `extra_info` longtext NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `agency_name_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_tripplan`
--

INSERT INTO `trip_tripplan` (`trip_name`, `city`, `price`, `capacity`, `departure_date`, `departure_time`, `departure_place`, `return_date`, `return_time`, `return_place`, `duration`, `extra_info`, `thumbnail`, `agency_name_id`) VALUES
('Capital Tour', 'Gandhinagar', 2400, 28, '2024-06-12', '05:00:00.000000', 'Gandhinagar, BAPS', '2024-06-17', '23:00:00.000000', 'Gandhinagar, Bus Station', 6, 'Enjoy your vacation at \'Tree Capital of India\'.', 'trip_thumbnail/Gandhinagar-thumbnail.jpg', 'Vacation Getaway'),
('Junagadh Tourism', 'Junagadh', 1500, 30, '2024-06-01', '06:00:00.000000', 'Junagadh Bus Station', '2024-06-06', '10:00:00.000000', 'Girnar, Junagadh', 6, 'Let\'s trvel to the \'Historical City of Gujarat\'.', 'trip_thumbnail/SasanGir.png', 'Eagle Tourism'),
('Nawanagar Trip', 'Jamnagar', 1350, 40, '2024-06-10', '05:00:00.000000', 'Jamnagar, Railway Station', '2024-06-15', '04:00:00.000000', 'Jamnagar, Bus Station', 6, 'Travel with us at \'Chhoti Kashi\'', 'trip_thumbnail/Ranmal_Lake.jpg', 'Dreamy Destination'),
('Rann Utsav', 'Kachchh', 1700, 40, '2024-06-05', '05:00:00.000000', 'Kachchh, Airport', '2024-06-10', '07:00:00.000000', 'Kachchh, Bhuj Bus Stand', 6, 'Travel with us with sound of \'Kachchh nahi dekha to kuch nahi dekha\'.', 'trip_thumbnail/Kachchh.jpeg', 'Travelmania'),
('Temple Trip', 'Dwarka', 1200, 25, '2024-06-01', '12:00:00.000000', 'Dwarka Railway Station', '2024-06-05', '06:00:00.000000', 'Dwarkadhish Temple', 5, 'Let\'s Travel to the \'Krishna Nagari\'.', 'trip_thumbnail/Dwarkadhish_nSdwzR5.jpg', 'Travelmania');

-- --------------------------------------------------------

--
-- Table structure for table `users_agency`
--

CREATE TABLE `users_agency` (
  `agency_name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `gst_no` varchar(30) NOT NULL,
  `upi_id` varchar(30) NOT NULL,
  `agency_logo` varchar(100) NOT NULL,
  `about_us` longtext NOT NULL,
  `last_login` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_agency`
--

INSERT INTO `users_agency` (`agency_name`, `username`, `password`, `email`, `gst_no`, `upi_id`, `agency_logo`, `about_us`, `last_login`) VALUES
('Dreamy Destination', 'pm090DD', 'dd#abc1', 'dream090@gmail.com', '30AAAAP0267H1Z1', 'pmdd@oksbi', 'agency_logo/agency3.png', '0', '2024-05-15 02:16:12.333453'),
('Eagle Tourism', 'tour@gir', '562#knp', 'eagletour@gmail.com', '22AEAVC0000A1Q5', 'eagle@oksbi', 'agency_logo/SasanGir.png', 'Being the capital of Junagadh Princely State once, the town shines with historical significance with many historical monuments to see.', '2024-05-13 13:01:52.657775'),
('Travelmania', 'dhpmania09', 'travelmania#123', 'travelmania@gmail.com', '22AAAAA0000A1Z5', 'mania@ok-axis', 'agency_logo/agency2_flhDYcd.png', 'We provide best facilities to every traveler.', '2024-05-14 15:28:58.293352'),
('Vacation Getaway', 'agency123', 'dhp.123', 'vacation.getaway@gmail.com', '45AAAAP0307H1Y1', 'dhp@ok-axis', 'agency_logo/agency1.jpeg', '1', '2024-05-17 06:46:47.013172');

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `last_login` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`username`, `password`, `email`, `last_login`) VALUES
('dharmik', 'parmar', 'dp@gmail.com', '2024-05-19 20:57:15.719011'),
('johndoe', 'j123', 'john.doe@gmail.com', '2024-05-17 07:49:12.955359');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `ticket_passenger`
--
ALTER TABLE `ticket_passenger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_passenger_ticket_id_id_a17a1015_fk_ticket_ticket_id` (`ticket_id_id`);

--
-- Indexes for table `ticket_ticket`
--
ALTER TABLE `ticket_ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `ticket_ticket_trip_name_id_74ff5233_fk_trip_tripplan_trip_name` (`trip_name_id`),
  ADD KEY `ticket_ticket_username_id_ef6f709d_fk_users_user_username` (`username_id`);

--
-- Indexes for table `trip_attraction`
--
ALTER TABLE `trip_attraction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `att_name` (`att_name`),
  ADD KEY `trip_attraction_trip_name_id_780f9287_fk_trip_tripplan_trip_name` (`trip_name_id`);

--
-- Indexes for table `trip_tripplan`
--
ALTER TABLE `trip_tripplan`
  ADD PRIMARY KEY (`trip_name`),
  ADD KEY `trip_tripplan_agency_name_id_e53fc9c5_fk_users_age` (`agency_name_id`);

--
-- Indexes for table `users_agency`
--
ALTER TABLE `users_agency`
  ADD PRIMARY KEY (`agency_name`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `ticket_passenger`
--
ALTER TABLE `ticket_passenger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `ticket_ticket`
--
ALTER TABLE `ticket_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `trip_attraction`
--
ALTER TABLE `trip_attraction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ticket_passenger`
--
ALTER TABLE `ticket_passenger`
  ADD CONSTRAINT `ticket_passenger_ticket_id_id_a17a1015_fk_ticket_ticket_id` FOREIGN KEY (`ticket_id_id`) REFERENCES `ticket_ticket` (`id`);

--
-- Constraints for table `ticket_ticket`
--
ALTER TABLE `ticket_ticket`
  ADD CONSTRAINT `ticket_ticket_trip_name_id_74ff5233_fk_trip_tripplan_trip_name` FOREIGN KEY (`trip_name_id`) REFERENCES `trip_tripplan` (`trip_name`),
  ADD CONSTRAINT `ticket_ticket_username_id_ef6f709d_fk_users_user_username` FOREIGN KEY (`username_id`) REFERENCES `users_user` (`username`);

--
-- Constraints for table `trip_attraction`
--
ALTER TABLE `trip_attraction`
  ADD CONSTRAINT `trip_attraction_trip_name_id_780f9287_fk_trip_tripplan_trip_name` FOREIGN KEY (`trip_name_id`) REFERENCES `trip_tripplan` (`trip_name`);

--
-- Constraints for table `trip_tripplan`
--
ALTER TABLE `trip_tripplan`
  ADD CONSTRAINT `trip_tripplan_agency_name_id_e53fc9c5_fk_users_age` FOREIGN KEY (`agency_name_id`) REFERENCES `users_agency` (`agency_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
