-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2022 at 10:18 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laporan_masyarakat`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `storagemasyarakat` ()  BEGIN
 SELECT username, password FROM masyarakat;
 END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `sf_tampil_masyarakat` (`p_nik` INT) RETURNS INT(11) BEGIN
DECLARE jml INT;
SELECT COUNT(*) AS jml_nik INTO jml FROM masyarakat WHERE nik = p_nik;
RETURN jml;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_masyarakat`
--

CREATE TABLE `log_masyarakat` (
  `log_id` int(10) NOT NULL,
  `nik` char(16) NOT NULL,
  `password_lama` varchar(32) NOT NULL,
  `password_baru` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `tanggal_ubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_masyarakat`
--

INSERT INTO `log_masyarakat` (`log_id`, `nik`, `password_lama`, `password_baru`, `telp`, `tanggal_ubah`) VALUES
(10, '96125', '123456', '12345677', '0808012810887', '2020-11-08 23:14:51'),
(11, '96125', '12345677', '12345677', '080801', '2020-11-08 23:16:20'),
(12, '96125', '12345677', '12345677', '080801', '2020-11-09 10:25:39'),
(13, '96125', '12345677', '12345677', '0813572271', '2020-11-10 08:49:06');

-- --------------------------------------------------------

--
-- Table structure for table `log_pengaduan`
--

CREATE TABLE `log_pengaduan` (
  `log_id` int(10) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `old_status` enum('0','proses','selesai') NOT NULL,
  `new_status` enum('0','proses','selesai') NOT NULL,
  `tanggal_ubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_petugas`
--

CREATE TABLE `log_petugas` (
  `log_id` int(10) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `old_username` varchar(25) NOT NULL,
  `new_username` varchar(25) NOT NULL,
  `old_password` varchar(32) NOT NULL,
  `new_password` varchar(32) NOT NULL,
  `tanggal_ubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_petugas`
--

INSERT INTO `log_petugas` (`log_id`, `id_petugas`, `old_username`, `new_username`, `old_password`, `new_password`, `tanggal_ubah`) VALUES
(2, 0, 'FarhanP', 'FarhanP', '123', '123', '2020-11-12 22:25:14'),
(4, 2, 'petugas', 'petugas', '123', '123456789', '2020-11-16 10:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `log_tanggapan`
--

CREATE TABLE `log_tanggapan` (
  `id_log` int(10) NOT NULL,
  `id_tanggapan` int(11) NOT NULL,
  `old_tanggapan` text NOT NULL,
  `new_tanggapan` text NOT NULL,
  `tanggal_ubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `username`, `password`, `telp`) VALUES
('96125', 'Farhan', 'FarhanP', '123', '08080128108'),
('531421004', 'Dhani Ardiyanto Syahdila', 'dhanisyahdila', '1sampai9', '0895803409735'),
('531421005', 'Kim Ga-Eul', 'gaeul', 'gaeulcantik', '085255655731');

--
-- Triggers `masyarakat`
--
DELIMITER $$
CREATE TRIGGER `masyarakat_update` AFTER UPDATE ON `masyarakat` FOR EACH ROW BEGIN 
	INSERT INTO log_masyarakat
    SET nik = OLD.nik,
    password_lama = old.password,
    password_baru = new.password,
    telp = new.telp,
    tanggal_ubah = NOW();
   END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` date NOT NULL,
  `nik` varchar(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('0','proses','selesai','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(2, '2022-10-03', '531421004', 'KDRT di rumah bapak rizki bilar', 'ayam_geprek.jpg', 'selesai'),
(3, '2022-10-03', '531421004', 'Pengaduan Teriakan dari anak muda tidak dikenal', 'ayam_lalapan.jpg', 'selesai'),
(4, '2022-10-03', '531421004', 'Pengaduan 3', 'es_cendol.jpg', 'proses'),
(5, '2022-10-03', '531421005', 'gaeul cantik', 'es_teh.jpg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` enum('admin','petugas','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp`, `level`) VALUES
(2, 'petugas', 'petugas', '123456789', '098765', 'petugas'),
(3, 'Farhan Palilati', 'Farhan', '123', '085342513758', 'admin'),
(4, 'Budss', 'Farhanpp', '123', '08989898', 'admin'),
(5, 'Budsss', 'rif', '123', '0898989899909', 'admin');

--
-- Triggers `petugas`
--
DELIMITER $$
CREATE TRIGGER `petugas_update` AFTER UPDATE ON `petugas` FOR EACH ROW BEGIN
	INSERT INTO log_petugas
    SET id_petugas = OLD.id_petugas,
    old_username = old.username,
    new_username = new.username,
    old_password = old.password,
    new_password = new.password,
    tanggal_ubah = NOW();
   END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(1, 0, '2020-11-17', '          \r\nOke kami akan tindak lanjuti\r\n        ', 3),
(2, 3, '2022-10-03', '          Pukul aja buk\r\n\r\n        ', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewmasyarakat`
-- (See below for the actual view)
--
CREATE TABLE `viewmasyarakat` (
`username` varchar(25)
,`password` varchar(32)
);

-- --------------------------------------------------------

--
-- Structure for view `viewmasyarakat`
--
DROP TABLE IF EXISTS `viewmasyarakat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewmasyarakat`  AS SELECT `masyarakat`.`username` AS `username`, `masyarakat`.`password` AS `password` FROM `masyarakat` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
