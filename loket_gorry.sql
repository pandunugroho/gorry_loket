-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 21, 2020 at 01:23 AM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loket_gorry`
--

-- --------------------------------------------------------

--
-- Table structure for table `availableTickets`
--

CREATE TABLE `availableTickets` (
  `id` int(11) NOT NULL,
  `eventId` int(11) DEFAULT NULL,
  `ticketType` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `availableTickets`
--

INSERT INTO `availableTickets` (`id`, `eventId`, `ticketType`, `quantity`, `stock`, `price`, `totalPrice`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'VVIP', 100, 75, 750000, 75000000, '2020-01-20 11:21:07', '2020-01-20 11:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `description` text,
  `locationId` int(11) DEFAULT NULL,
  `address` text,
  `img` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `startTime`, `endTime`, `description`, `locationId`, `address`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 'Bon Iver - 2020 Tour Jakarta — Ismaya Live', '2020-01-19 11:00:00', '2020-01-19 14:00:00', 'Announcing the Jakarta leg of Bon Iver’s 2020 Asia tour to kick off the new decade on 19 January 2020 at Tennis Indoor Senayan, Jakarta! After 2 Grammy Awards, sold out tours and the acclaimed release of their 4th studio album \'i,i\', the Wisconsin-based band is now set to deliver a performance full of glorious sounds to wash over you — for the first time in Indonesia. This is strictly an 18+ event.', 1, 'Tennis Indoor Senayan, Jakarta, Indonesia', 'https://livemusicblog-wpengine.netdna-ssl.com/wp-content/uploads/2019/09/bon-iver-asia-europe-scandanavia-2020-tour-dates.png', '2020-01-20 10:55:48', '2020-01-20 10:55:48');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `imgLocation` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location`, `imgLocation`, `createdAt`, `updatedAt`) VALUES
(1, 'Jakarta', 'https://img.jakpost.net/c/2017/12/24/2017_12_24_37849_1514123622._large.jpg', '2020-01-20 10:54:43', '2020-01-20 10:54:43'),
(2, 'Tangerang', 'http://mobile.rilis.id/timthumb.php?src=http://cdn.rilis.id/2018/11/05/20181105043123kota_tangerang.jpg&w=800&h=600&zc=3', '2020-01-20 10:54:56', '2020-01-20 10:54:56'),
(3, 'Bandung', 'https://wisatabaru.com/wp-content/uploads/2018/01/gedung-sate-bandung.jpg', '2020-01-20 10:55:18', '2020-01-20 10:55:18'),
(4, 'Depok', 'https://awsimages.detik.net.id/customthumb/2018/05/21/1025/img_20180521164949_5b02963d56c3a.jpg?w=600&q=90', '2020-01-20 10:55:29', '2020-01-20 10:55:29'),
(5, 'Bogor', 'https://www.bogorraincake.com/wp-content/uploads/2018/01/Tugu-Kujang-1024x746.jpg', '2020-01-20 10:55:42', '2020-01-20 10:55:42');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `eventId` int(11) DEFAULT NULL,
  `buyerName` varchar(255) DEFAULT NULL,
  `hasBeenPaid` tinyint(4) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `eventId`, `buyerName`, `hasBeenPaid`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Pandu Nugroho', 0, '2020-01-20 10:56:11', '2020-01-20 10:56:11'),
(2, 1, 'Nurdin', 0, '2020-01-20 11:46:41', '2020-01-20 11:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('1-create-locations.js'),
('2-create-events.js'),
('3-create-availableTickets.js'),
('4-create-purchases.js'),
('5-create-tickets.js');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `purchaseId` int(11) DEFAULT NULL,
  `availableTicketId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `purchaseId`, `availableTicketId`, `quantity`, `price`, `totalPrice`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 10, 750000, 7500000, '2020-01-20 11:21:19', '2020-01-20 11:21:19'),
(2, 1, 1, 10, 750000, 7500000, '2020-01-20 11:21:32', '2020-01-20 11:21:32'),
(3, 2, 1, 5, 750000, 3750000, '2020-01-20 11:47:10', '2020-01-20 11:47:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `availableTickets`
--
ALTER TABLE `availableTickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventId` (`eventId`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locationId` (`locationId`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventId` (`eventId`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseId` (`purchaseId`),
  ADD KEY `availableTicketId` (`availableTicketId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `availableTickets`
--
ALTER TABLE `availableTickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `availableTickets`
--
ALTER TABLE `availableTickets`
  ADD CONSTRAINT `availableTickets_ibfk_1` FOREIGN KEY (`eventId`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`locationId`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`eventId`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`purchaseId`) REFERENCES `purchases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`availableTicketId`) REFERENCES `availableTickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
