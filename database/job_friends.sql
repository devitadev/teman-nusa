-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 06, 2022 at 12:15 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job_friends`
--

-- --------------------------------------------------------

--
-- Table structure for table `MsAvatar`
--

CREATE TABLE `MsAvatar` (
  `avatarID` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `MsAvatar`
--

INSERT INTO `MsAvatar` (`avatarID`, `avatar`, `price`) VALUES
(1, 'default avatar.png', 0),
(2, 'bear1.jpg', 0),
(3, 'bear2.jpg', 0),
(4, 'bear3.jpg', 0),
(5, 'avatar1.jpg', 10000),
(6, 'avatar2.jpg', 5000),
(7, 'avatar3.jpg', 100000),
(8, 'avatar4.jpg', 50),
(9, 'avatar5.jpg', 400),
(10, 'avatar6.jpg', 2500),
(11, 'avatar7.jpg', 50000),
(12, 'avatar8.jpg', 12000),
(13, 'avatar9.jpg', 20000),
(14, 'avatar10.jpg', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `MsBidangPekerjaan`
--

CREATE TABLE `MsBidangPekerjaan` (
  `bidangPekerjaanID` int(11) NOT NULL,
  `bidangPekerjaan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `MsBidangPekerjaan`
--

INSERT INTO `MsBidangPekerjaan` (`bidangPekerjaanID`, `bidangPekerjaan`) VALUES
(1, 'Perbankan'),
(2, 'Informasi dan Teknologi (IT)'),
(3, 'Kesehatan'),
(4, 'Pendidikan'),
(5, 'Media Massa'),
(6, 'Pemerintahan'),
(7, 'Telekomunikasi'),
(8, 'Seni Kreatif dan Desain'),
(9, 'Hukum'),
(10, 'Pariwisata'),
(11, 'Pertambangan'),
(12, 'Agraris');

-- --------------------------------------------------------

--
-- Table structure for table `MsMinat`
--

CREATE TABLE `MsMinat` (
  `userID` int(11) NOT NULL,
  `bidangPekerjaanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `MsMinat`
--

INSERT INTO `MsMinat` (`userID`, `bidangPekerjaanID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 8),
(2, 10),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 2),
(4, 3),
(4, 4),
(5, 2),
(5, 3),
(5, 4),
(5, 6),
(5, 7),
(5, 9),
(6, 2),
(6, 3),
(6, 6),
(7, 1),
(7, 3),
(7, 4),
(8, 1),
(8, 2),
(8, 4),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(10, 4),
(10, 5),
(10, 7),
(10, 8),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 10),
(11, 12),
(12, 2),
(12, 3),
(12, 5),
(12, 7),
(12, 8),
(13, 1),
(13, 4),
(13, 10),
(13, 11),
(14, 2),
(14, 4),
(14, 8),
(14, 10),
(15, 1),
(15, 2),
(15, 4),
(15, 5),
(15, 7),
(16, 2),
(16, 3),
(16, 4),
(16, 9),
(17, 2),
(17, 3),
(17, 4),
(17, 10),
(17, 11),
(18, 2),
(18, 3),
(18, 4),
(18, 10),
(19, 2),
(19, 6),
(19, 10),
(19, 11),
(19, 12),
(20, 6),
(20, 7),
(20, 9),
(20, 11);

-- --------------------------------------------------------

--
-- Table structure for table `MsUser`
--

CREATE TABLE `MsUser` (
  `userID` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `profesi` varchar(255) DEFAULT NULL,
  `avatarID` int(11) DEFAULT NULL,
  `usernameLinkedin` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nomorHandphone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `visible` varchar(255) DEFAULT NULL,
  `lastAvatarID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `MsUser`
--

INSERT INTO `MsUser` (`userID`, `nama`, `profesi`, `avatarID`, `usernameLinkedin`, `email`, `gender`, `nomorHandphone`, `password`, `harga`, `saldo`, `visible`, `lastAvatarID`) VALUES
(1, 'Devita', 'Mahasiswa', 6, 'devita-devita-467253234', 'devita@gmail.com', 'Perempuan', '087882099766', 'devita1234', 120000, 84730, 'true', 6),
(2, 'Dewi Puspita Tanurezal', 'Mahasiswa', 8, 'dewi-puspita-tanurezal-633661226', 'dewi@gmail.com', 'Perempuan', '087882099766', 'dewi1234', 110000, 1000, 'true', NULL),
(3, 'Syntia Firdaus', 'Mahasiswa', 2, 'syntia-firdaus-123456789', 'syntia@gmail.com', 'Perempuan', '08123456789', 'syntia1234', 110000, 99950, 'false', 1),
(4, 'Laurecia Sylvano', 'Dokter', 1, 'laurencia-sylvano-123456789', 'laurencia@gmail.com', 'Perempuan', '08123456789', 'laurencia1234', 100000, 0, 'true', NULL),
(5, 'Angela Ayussaca', 'Guru', 4, 'angela-ayussaca-123456789', 'angela@gmail.com', 'Perempuan', '08123456789', 'angela1234', 100000, 50, 'false', 1),
(6, 'Gladys Patricia', 'Software Developer', 10, 'gladys-patricia-123456789', 'gladys@gmail.com', 'Perempuan', '08123456789', 'gladys1234', 100000, 2500, 'true', NULL),
(7, 'Caroline', 'Dokter', 8, 'caroline-caroline-123456789', 'caroline@gmail.com', 'Perempuan', '08123456789', 'caroline1234', 100000, 19895, 'true', 8),
(8, 'Kevin Dharmawan', 'Software Developer', 5, 'kevin-dharmawan-123456789', 'kevin@gmail.com', 'Laki-laki', '08123456789', 'kevin1234', 100000, 0, 'true', NULL),
(9, 'Anthony Gilrandy Theo', 'Software Developer', 11, 'anthony-gilrandy-theo-123456789', 'anthony@gmail.com', 'Laki-laki', '08123456789', 'anthony1234', 100000, 45, 'true', 11),
(10, 'Steven', 'Software Developer', 1, 'steven-steven-123456789', 'steven@gmail.com', 'Laki-laki', '08123456789', 'steven1234', 100000, 15000, 'true', NULL),
(11, 'Steven Cokro', 'Dokter', 2, 'steven-cokro-123456789', 'stevenCokro@gmail.com', 'Laki-laki', '08123456789', 'steven1234', 100000, 50, 'false', 12),
(12, 'Ircham Anindiya Kencana', 'Mahasiswa', 1, 'ircham-anindya-kencana-123456789', 'ircham@gmail.com', 'Laki-laki', '08123456789', 'ircham1234', 100000, 12000, 'true', NULL),
(13, 'Theodore Sebastian', 'Dokter', 1, 'theodore-sebastian-123456789', 'theodore@gmail.com', 'Laki-laki', '08123456789', 'theodore1234', 100000, 50000, 'true', NULL),
(14, 'Devita', 'Mobile Developer', 14, 'devita-devita-123456789', 'devita002@gmail.com', 'perempuan', '08123456789', 'devita1234', 123543, 98902, 'true', 14),
(15, 'Candra Kurniawan', 'Software Enginner', 1, 'candra-kurniawan-123456789', 'candra@gmail.com', 'laki-laki', '09123456789', 'candra1234', 118105, 0, 'true', NULL),
(16, 'Nicholas', 'Mahasiswa', 9, 'nicholas-nicholas-123456789', 'nicholas@gmail.com', 'laki-laki', '08123456789', 'nicholas1234', 106269, 1495, 'true', 9),
(17, 'Kevin', 'Mobile Developer', 3, 'kevin-kevin-123456789', 'kevin002@gmail.com', 'laki-laki', '08123456789', 'kevin1234', 117481, 585, 'false', 9),
(18, 'Gladys P', 'Mahasiswa', 1, 'gladys-gladys-123456789', 'gladys002@gmail.com', 'perempuan', '08123456789', 'gladys1234', 111753, 0, 'true', NULL),
(19, 'Cherish', 'Mahasiswa', 4, 'cherish-cherish-123456789', 'cherish@gmail.com', 'perempuan', '08123456789', 'cherish1234', 102990, 675, 'false', 8),
(20, 'Devita', 'Mahasiswa', 3, 'devita-devita-123456789', 'devita003@gmail.com', 'perempuan', '08123456789', 'devita1234', 104827, 1060, 'false', 8);

-- --------------------------------------------------------

--
-- Table structure for table `TrChat`
--

CREATE TABLE `TrChat` (
  `chatID` int(11) NOT NULL,
  `senderID` int(11) DEFAULT NULL,
  `receiverID` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `TrChat`
--

INSERT INTO `TrChat` (`chatID`, `senderID`, `receiverID`, `content`, `date`) VALUES
(1, 1, 2, 'Hii Dewww', '2022-07-06 12:57:58'),
(2, 2, 1, 'Hii Devvv', '2022-07-06 12:58:20'),
(3, 1, 2, 'Hi Dewiiiiii :)', '2022-07-06 14:15:07'),
(4, 1, 2, 'Apa kabar ? gimana kuliah lu?', '2022-07-06 14:16:06'),
(5, 2, 1, 'Baik devv, kuliah gua ya gitu-gitu aja..', '2022-07-06 14:17:13'),
(6, 2, 1, 'Lu sendiri gimana ?', '2022-07-06 14:17:21'),
(7, 2, 9, 'GETTTT!!', '2022-07-06 14:17:39'),
(8, 1, 2, 'Gua juga oke', '2022-07-06 14:36:15'),
(9, 1, 7, 'Hi Caroline', '2022-07-06 14:51:50'),
(10, 1, 2, 'Test chat doang', '2022-07-06 14:52:06'),
(11, 2, 1, 'Hi Hi', '2022-07-06 14:52:29'),
(12, 1, 2, 'Hi Hi', '2022-07-06 15:23:45'),
(13, 1, 2, 'Hi Hi dewww', '2022-07-06 15:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `TrUserAvatar`
--

CREATE TABLE `TrUserAvatar` (
  `userID` int(11) NOT NULL,
  `avatarID` int(11) NOT NULL,
  `boughtBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `TrUserAvatar`
--

INSERT INTO `TrUserAvatar` (`userID`, `avatarID`, `boughtBy`) VALUES
(1, 1, 1),
(1, 6, 1),
(1, 8, 16),
(1, 9, 17),
(1, 14, 1),
(2, 1, 2),
(2, 8, 1),
(2, 10, 2),
(3, 1, 3),
(3, 10, 14),
(3, 14, 1),
(4, 1, 4),
(4, 9, 20),
(5, 1, 5),
(6, 1, 6),
(6, 10, 6),
(7, 1, 7),
(7, 8, 7),
(8, 1, 8),
(8, 5, 1),
(8, 9, 17),
(9, 1, 9),
(9, 11, 1),
(10, 1, 10),
(10, 8, 19),
(11, 1, 11),
(11, 9, 11),
(11, 12, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(14, 14, 14),
(15, 1, 15),
(16, 1, 16),
(16, 9, 16),
(17, 1, 17),
(17, 9, 17),
(18, 1, 18),
(19, 1, 19),
(19, 8, 19),
(19, 9, 19),
(20, 1, 20),
(20, 8, 20);

-- --------------------------------------------------------

--
-- Table structure for table `TrWishlist`
--

CREATE TABLE `TrWishlist` (
  `userID` int(11) NOT NULL,
  `wishUserID` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `TrWishlist`
--

INSERT INTO `TrWishlist` (`userID`, `wishUserID`, `status`) VALUES
(1, 2, 'true'),
(1, 3, 'false'),
(1, 6, 'true'),
(1, 7, 'true'),
(1, 8, 'true'),
(1, 9, 'true'),
(1, 11, 'false'),
(1, 13, 'false'),
(2, 1, 'true'),
(2, 3, 'false'),
(2, 4, 'false'),
(2, 9, 'true'),
(2, 10, 'false'),
(2, 12, 'false'),
(6, 1, 'true'),
(6, 2, 'false'),
(6, 7, 'true'),
(6, 8, 'false'),
(6, 11, 'true'),
(6, 13, 'false'),
(7, 1, 'true'),
(7, 3, 'false'),
(7, 6, 'true'),
(7, 10, 'false'),
(7, 11, 'true'),
(7, 13, 'false'),
(8, 1, 'true'),
(8, 4, 'false'),
(8, 7, 'false'),
(8, 9, 'false'),
(8, 11, 'false'),
(8, 14, 'true'),
(9, 1, 'true'),
(9, 2, 'true'),
(9, 5, 'false'),
(9, 7, 'false'),
(9, 10, 'false'),
(9, 13, 'false'),
(9, 14, 'false'),
(11, 6, 'true'),
(11, 7, 'true'),
(11, 10, 'false'),
(11, 12, 'false'),
(11, 13, 'false'),
(11, 14, 'true'),
(14, 1, 'false'),
(14, 3, 'false'),
(14, 7, 'false'),
(14, 8, 'true'),
(14, 11, 'true'),
(14, 13, 'false'),
(15, 1, 'false'),
(15, 7, 'false'),
(15, 8, 'false'),
(15, 10, 'false'),
(15, 13, 'false'),
(16, 1, 'false'),
(16, 7, 'false'),
(16, 9, 'false'),
(16, 10, 'false'),
(17, 1, 'false'),
(17, 8, 'false'),
(19, 1, 'false'),
(19, 7, 'false'),
(19, 10, 'false'),
(20, 1, 'false'),
(20, 4, 'false');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `MsAvatar`
--
ALTER TABLE `MsAvatar`
  ADD PRIMARY KEY (`avatarID`);

--
-- Indexes for table `MsBidangPekerjaan`
--
ALTER TABLE `MsBidangPekerjaan`
  ADD PRIMARY KEY (`bidangPekerjaanID`);

--
-- Indexes for table `MsMinat`
--
ALTER TABLE `MsMinat`
  ADD PRIMARY KEY (`userID`,`bidangPekerjaanID`);

--
-- Indexes for table `MsUser`
--
ALTER TABLE `MsUser`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `TrChat`
--
ALTER TABLE `TrChat`
  ADD PRIMARY KEY (`chatID`);

--
-- Indexes for table `TrUserAvatar`
--
ALTER TABLE `TrUserAvatar`
  ADD PRIMARY KEY (`userID`,`avatarID`);

--
-- Indexes for table `TrWishlist`
--
ALTER TABLE `TrWishlist`
  ADD PRIMARY KEY (`userID`,`wishUserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `MsAvatar`
--
ALTER TABLE `MsAvatar`
  MODIFY `avatarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `MsBidangPekerjaan`
--
ALTER TABLE `MsBidangPekerjaan`
  MODIFY `bidangPekerjaanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `MsUser`
--
ALTER TABLE `MsUser`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `TrChat`
--
ALTER TABLE `TrChat`
  MODIFY `chatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
