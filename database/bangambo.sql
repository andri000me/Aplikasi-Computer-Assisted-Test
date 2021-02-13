/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.17-MariaDB : Database - bangambo_university
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bangambo_university` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `bangambo_university`;

/*Table structure for table `tbl_admin` */

DROP TABLE IF EXISTS `tbl_admin`;

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level_admin` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_informasi` */

DROP TABLE IF EXISTS `tbl_informasi`;

CREATE TABLE `tbl_informasi` (
  `id_informasi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kegiatan` varchar(255) DEFAULT NULL,
  `tgl_pendaftaran` date DEFAULT NULL,
  `tgl_tutup` date DEFAULT NULL,
  `tgl_lulus_adm` date DEFAULT NULL,
  `tgl_ujian_cat` date DEFAULT NULL,
  `waktu_pengerjaan` time DEFAULT NULL,
  `alur_pendaftaran` text DEFAULT NULL,
  PRIMARY KEY (`id_informasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_jawaban` */

DROP TABLE IF EXISTS `tbl_jawaban`;

CREATE TABLE `tbl_jawaban` (
  `id_jawaban` int(11) NOT NULL AUTO_INCREMENT,
  `id_peserta` int(11) DEFAULT NULL,
  `list_soal` longtext DEFAULT NULL,
  `list_jawaban` longtext DEFAULT NULL,
  `waktu_mulai` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `status_jawaban` enum('benar','salah') DEFAULT NULL,
  PRIMARY KEY (`id_jawaban`),
  KEY `id_peserta` (`id_peserta`),
  CONSTRAINT `tbl_jawaban_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `tbl_peserta` (`id_peserta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_lab` */

DROP TABLE IF EXISTS `tbl_lab`;

CREATE TABLE `tbl_lab` (
  `id_lab` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lab` varchar(255) DEFAULT NULL,
  `jumlah_formasi` int(11) DEFAULT NULL,
  `jumlah_peserta` int(11) DEFAULT NULL,
  `jumlah_lulus_adm` int(11) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  PRIMARY KEY (`id_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_nilai` */

DROP TABLE IF EXISTS `tbl_nilai`;

CREATE TABLE `tbl_nilai` (
  `id_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `id_peserta` int(11) DEFAULT NULL,
  `id_soal` int(11) DEFAULT NULL,
  `nilai_peserta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `id_peserta` (`id_peserta`),
  KEY `id_soal` (`id_soal`),
  CONSTRAINT `tbl_nilai_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `tbl_peserta` (`id_peserta`),
  CONSTRAINT `tbl_nilai_ibfk_2` FOREIGN KEY (`id_soal`) REFERENCES `tbl_soal` (`id_soal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_pertanyaan` */

DROP TABLE IF EXISTS `tbl_pertanyaan`;

CREATE TABLE `tbl_pertanyaan` (
  `id_pertanyaan` int(11) NOT NULL AUTO_INCREMENT,
  `id_soal` int(11) DEFAULT NULL,
  `pertanyaan` text DEFAULT NULL,
  `option_1` varchar(255) DEFAULT NULL,
  `option_2` varchar(255) DEFAULT NULL,
  `option_3` varchar(255) DEFAULT NULL,
  `option_4` varchar(255) DEFAULT NULL,
  `jawaban` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pertanyaan`),
  KEY `id_soal` (`id_soal`),
  CONSTRAINT `tbl_pertanyaan_ibfk_1` FOREIGN KEY (`id_soal`) REFERENCES `tbl_soal` (`id_soal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_peserta` */

DROP TABLE IF EXISTS `tbl_peserta`;

CREATE TABLE `tbl_peserta` (
  `id_peserta` int(11) NOT NULL AUTO_INCREMENT,
  `id_lab` int(11) DEFAULT NULL,
  `nim` int(11) DEFAULT NULL,
  `password_peserta` varchar(255) DEFAULT NULL,
  `nama_peserta` varchar(255) DEFAULT NULL,
  `ipk` varchar(255) DEFAULT NULL,
  `tmp_lahir` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('p','l') DEFAULT NULL,
  `agama` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `berkas_peserta` text DEFAULT NULL,
  `tgl_selesai_pendaftaran` date DEFAULT NULL,
  `status_pendaftaran` varchar(255) DEFAULT NULL,
  `status_verifikasi` enum('aktif','tidak') DEFAULT NULL,
  PRIMARY KEY (`id_peserta`),
  KEY `id_lab` (`id_lab`),
  CONSTRAINT `tbl_peserta_ibfk_1` FOREIGN KEY (`id_lab`) REFERENCES `tbl_lab` (`id_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_soal` */

DROP TABLE IF EXISTS `tbl_soal`;

CREATE TABLE `tbl_soal` (
  `id_soal` int(11) NOT NULL AUTO_INCREMENT,
  `nama_soal` varchar(255) DEFAULT NULL,
  `jumlah_soal` int(11) DEFAULT NULL,
  `minimal_benar` int(11) DEFAULT NULL,
  `total_nilai` int(11) DEFAULT NULL,
  `passing_grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_soal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
