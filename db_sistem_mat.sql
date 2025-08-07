-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 07, 2025 at 02:19 PM
-- Server version: 8.0.42-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sistem_mat`
--

-- --------------------------------------------------------

--
-- Table structure for table `aset_akun`
--

CREATE TABLE `aset_akun` (
  `id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_akun`
--

INSERT INTO `aset_akun` (`id`, `kode`, `nama`) VALUES
(1, '1', 'ASET');

-- --------------------------------------------------------

--
-- Table structure for table `aset_aset`
--

CREATE TABLE `aset_aset` (
  `id` bigint NOT NULL,
  `nomor_register` int DEFAULT NULL,
  `nomor_rangka` varchar(100) DEFAULT NULL,
  `nomor_mesin` varchar(100) DEFAULT NULL,
  `keterangan` longtext,
  `tanggal_pembelian` date NOT NULL,
  `harga_pembelian` decimal(15,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `kode_aset` varchar(100) NOT NULL,
  `terakhir_diperbarui` datetime(6) NOT NULL,
  `dibuat_pada` datetime(6) NOT NULL,
  `didaftarkan_oleh_id` int DEFAULT NULL,
  `bidang_id` bigint DEFAULT NULL,
  `klasifikasi_id` bigint NOT NULL,
  `unit_bidang_id` bigint NOT NULL,
  `jenis_belanja` varchar(2) NOT NULL,
  `sub_kegiatan_id` bigint DEFAULT NULL,
  `ruangan_id` bigint DEFAULT NULL,
  `merek_tipe` varchar(260) DEFAULT NULL,
  `akumulasi_penyusutan` decimal(15,2) NOT NULL,
  `cara_perolehan` varchar(50) DEFAULT NULL,
  `nilai_rehab` decimal(15,2) NOT NULL,
  `nomor_bpkb` varchar(100) DEFAULT NULL,
  `nomor_induk_barang` varchar(100) DEFAULT NULL,
  `nomor_polisi` varchar(20) DEFAULT NULL,
  `penyusutan_semester` decimal(15,2) NOT NULL,
  `spesifikasi_lokasi` varchar(255) DEFAULT NULL,
  `status_penggunaan` varchar(255) DEFAULT NULL,
  `status_kepemilikan_id` bigint DEFAULT NULL,
  `status_kompabilitas_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_aset`
--

INSERT INTO `aset_aset` (`id`, `nomor_register`, `nomor_rangka`, `nomor_mesin`, `keterangan`, `tanggal_pembelian`, `harga_pembelian`, `status`, `kode_aset`, `terakhir_diperbarui`, `dibuat_pada`, `didaftarkan_oleh_id`, `bidang_id`, `klasifikasi_id`, `unit_bidang_id`, `jenis_belanja`, `sub_kegiatan_id`, `ruangan_id`, `merek_tipe`, `akumulasi_penyusutan`, `cara_perolehan`, `nilai_rehab`, `nomor_bpkb`, `nomor_induk_barang`, `nomor_polisi`, `penyusutan_semester`, `spesifikasi_lokasi`, `status_penggunaan`, `status_kepemilikan_id`, `status_kompabilitas_id`) VALUES
(2, 2, '', '', '', '2025-07-30', '24000.00', 'Baik', '15.09.1.3.2.05.02.06.060.2025.000002', '2025-07-31 03:24:20.098512', '2025-07-30 14:28:30.498666', NULL, 1, 311, 1, 'LS', NULL, NULL, 'Cap Gajah', '0.00', NULL, '0.00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL),
(3, 1, '', '', '', '2025-07-30', '50000.00', 'Baik', '15.09.1.3.2.05.01.05.066.2025.000001', '2025-07-31 03:24:03.155301', '2025-07-30 14:29:30.905723', NULL, 1, 132, 1, 'LS', NULL, NULL, 'Juara', '0.00', NULL, '0.00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL),
(4, 1, '', '', '', '2025-08-03', '20000.00', 'Baik', '15.09.1.3.2.10.02.02.016.2025.000001', '2025-08-03 08:52:19.309885', '2025-08-03 08:52:19.309932', NULL, 1, 376, 1, 'LS', NULL, NULL, 'Lenovo - Bass-Booster', '0.00', NULL, '0.00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL),
(6, 1, NULL, NULL, '', '2025-08-03', '25000000.00', 'Perbaikan', '15.09.1.3.2.10.01.02.002.2025.000001', '2025-08-06 14:56:56.148218', '2025-08-03 08:53:14.257707', NULL, 1, 336, 1, 'LS', NULL, NULL, 'ASUS - ROG', '0.00', NULL, '0.00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aset_bidang`
--

CREATE TABLE `aset_bidang` (
  `id` bigint NOT NULL,
  `nama_bidang` varchar(100) NOT NULL,
  `unit_bidang_id` bigint NOT NULL,
  `nama_kepala_bidang` varchar(255) DEFAULT NULL,
  `nip_kepala_bidang` varchar(50) DEFAULT NULL,
  `kode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_bidang`
--

INSERT INTO `aset_bidang` (`id`, `nama_bidang`, `unit_bidang_id`, `nama_kepala_bidang`, `nip_kepala_bidang`, `kode`) VALUES
(1, 'Teknologi Informasi dan Komunikasi', 1, 'YULLY HARMAYANTI,SH', '197807122003122004', '00');

-- --------------------------------------------------------

--
-- Table structure for table `aset_jenis`
--

CREATE TABLE `aset_jenis` (
  `id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelompok_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_jenis`
--

INSERT INTO `aset_jenis` (`id`, `kode`, `nama`, `kelompok_id`) VALUES
(1, '7', 'PERSEDIAAN', 1),
(2, '2', 'PERALATAN DAN MESIN', 2),
(3, '7', 'AKUMULASI PENYUSUTAN', 2);

-- --------------------------------------------------------

--
-- Table structure for table `aset_kegiatan`
--

CREATE TABLE `aset_kegiatan` (
  `id` bigint NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `pekerjaan_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_kegiatan`
--

INSERT INTO `aset_kegiatan` (`id`, `nama_kegiatan`, `pekerjaan_id`) VALUES
(1, 'Menyangkul Tanah', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aset_kelompok`
--

CREATE TABLE `aset_kelompok` (
  `id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `akun_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_kelompok`
--

INSERT INTO `aset_kelompok` (`id`, `kode`, `nama`, `akun_id`) VALUES
(1, '1', 'ASET LANCAR', 1),
(2, '3', 'ASET TETAP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aset_kota`
--

CREATE TABLE `aset_kota` (
  `id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `provinsi_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_kota`
--

INSERT INTO `aset_kota` (`id`, `kode`, `nama`, `provinsi_id`) VALUES
(1, '09', 'Tebo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aset_objek`
--

CREATE TABLE `aset_objek` (
  `id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_objek`
--

INSERT INTO `aset_objek` (`id`, `kode`, `nama`, `jenis_id`) VALUES
(1, '01', 'BARANG PAKAI HABIS', 1),
(2, '05', 'ALAT KANTOR DAN RUMAH TANGGA', 2),
(3, '06', 'ALAT STUDIO, KOMUNIKASI DAN PEMANCAR', 2),
(4, '10', 'KOMPUTER', 2),
(5, '01', 'AKUMULASI PENYUSUTAN ALAT BESAR', 3);

-- --------------------------------------------------------

--
-- Table structure for table `aset_pekerjaan`
--

CREATE TABLE `aset_pekerjaan` (
  `id` bigint NOT NULL,
  `nama_pekerjaan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_pekerjaan`
--

INSERT INTO `aset_pekerjaan` (`id`, `nama_pekerjaan`) VALUES
(1, 'Menanam Padi');

-- --------------------------------------------------------

--
-- Table structure for table `aset_provinsi`
--

CREATE TABLE `aset_provinsi` (
  `id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_provinsi`
--

INSERT INTO `aset_provinsi` (`id`, `kode`, `nama`) VALUES
(1, '15', 'Jambi');

-- --------------------------------------------------------

--
-- Table structure for table `aset_rincianbarang`
--

CREATE TABLE `aset_rincianbarang` (
  `id` bigint NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kode_lengkap` varchar(100) NOT NULL,
  `sub_sub_rincian_objek_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_rincianbarang`
--

INSERT INTO `aset_rincianbarang` (`id`, `nama_barang`, `kode_lengkap`, `sub_sub_rincian_objek_id`) VALUES
(1, 'Mesin Ketik Manual Portable (11-13 Inci)', '1.3.2.05.01.01.001', 1),
(2, 'Mesin Ketik Manual Standard (14-16 Inci)', '1.3.2.05.01.01.002', 2),
(3, 'Mesin Ketik Manual Langewagon (18-27 Inci)', '1.3.2.05.01.01.003', 3),
(4, 'Mesin Ketik Listrik', '1.3.2.05.01.01.004', 4),
(5, 'Mesin Ketik Listrik Portable (11-13 Inci)', '1.3.2.05.01.01.005', 5),
(6, 'Mesin Ketik Listrik Standard (14-16 Inci)', '1.3.2.05.01.01.006', 6),
(7, 'Mesin Ketik Listrik Langewagon (18-27 Inci)', '1.3.2.05.01.01.007', 7),
(8, 'Mesin Ketik Elektronik/Elektrik', '1.3.2.05.01.01.008', 8),
(9, 'Mesin Ketik Braille', '1.3.2.05.01.01.009', 9),
(10, 'Mesin Phromosons', '1.3.2.05.01.01.010', 10),
(11, 'Mesin Cetak Stereo Piper (Braille)', '1.3.2.05.01.01.011', 11),
(12, 'Mesin Hitung Manual', '1.3.2.05.01.02.001', 12),
(13, 'Mesin Hitung Listrik', '1.3.2.05.01.02.002', 13),
(14, 'Mesin Hitung Elektronik/Calculator', '1.3.2.05.01.02.003', 14),
(15, 'Mesin Kas Register', '1.3.2.05.01.02.004', 15),
(16, 'Abakus (Alat Hitung)', '1.3.2.05.01.02.005', 16),
(17, 'Blokycs (Mesin Hitung Braille)', '1.3.2.05.01.02.006', 17),
(18, 'Mesin Penghitung Uang', '1.3.2.05.01.02.007', 18),
(19, 'Mesin Pembukuan', '1.3.2.05.01.02.008', 19),
(20, 'Mesin Penghitung Kertas/Pita Cukai', '1.3.2.05.01.02.009', 20),
(21, 'Mesin Absen (Time Recorder)', '1.3.2.05.01.02.010', 21),
(22, 'Mesin Kontrol Jaga', '1.3.2.05.01.02.011', 22),
(23, 'Mesin Stensil Manual Folio', '1.3.2.05.01.03.001', 23),
(24, 'Mesin Stensil Manual Double Folio', '1.3.2.05.01.03.002', 24),
(25, 'Mesin Stensil Listrik Folio', '1.3.2.05.01.03.003', 25),
(26, 'Mesin Stensil Listrik Double Folio', '1.3.2.05.01.03.004', 26),
(27, 'Mesin Stensil Spiritus Manual', '1.3.2.05.01.03.005', 27),
(28, 'Mesin Stensil Spiritus Listrik', '1.3.2.05.01.03.006', 28),
(29, 'Mesin Fotocopy Folio', '1.3.2.05.01.03.007', 29),
(30, 'Mesin Fotocopy Double Folio', '1.3.2.05.01.03.008', 30),
(31, 'Mesin Fotocopy Electronic', '1.3.2.05.01.03.009', 31),
(32, 'Mesin Thermoforn', '1.3.2.05.01.03.010', 32),
(33, 'Mesin Fotocopy Lainnya', '1.3.2.05.01.03.011', 33),
(34, 'Risograf', '1.3.2.05.01.03.012', 34),
(35, 'Mesin Perekam Stensil Folio', '1.3.2.05.01.03.013', 35),
(36, 'Mesin Perekam Stensil Double Folio', '1.3.2.05.01.03.014', 36),
(37, 'Mesin Plate Folio', '1.3.2.05.01.03.015', 37),
(38, 'Mesin Plate Double Folio', '1.3.2.05.01.03.016', 38),
(39, 'Lemari Besi/Metal', '1.3.2.05.01.04.001', 39),
(40, 'Lemari Kayu', '1.3.2.05.01.04.002', 40),
(41, 'Rak Besi', '1.3.2.05.01.04.003', 41),
(42, 'Rak Kayu', '1.3.2.05.01.04.004', 42),
(43, 'Filling Cabinet Besi', '1.3.2.05.01.04.005', 43),
(44, 'Filling Cabinet Kayu', '1.3.2.05.01.04.006', 44),
(45, 'Brankas', '1.3.2.05.01.04.007', 45),
(46, 'Peti Uang/Cash Box/Coin Box', '1.3.2.05.01.04.008', 46),
(47, 'Kardex Besi', '1.3.2.05.01.04.009', 47),
(48, 'Kardex Kayu', '1.3.2.05.01.04.010', 48),
(49, 'Rotary Filling', '1.3.2.05.01.04.011', 49),
(50, 'Compact Rolling', '1.3.2.05.01.04.012', 50),
(51, 'Buffet', '1.3.2.05.01.04.013', 51),
(52, 'Mobile File', '1.3.2.05.01.04.014', 52),
(53, 'Locker', '1.3.2.05.01.04.015', 53),
(54, 'Roll Opek', '1.3.2.05.01.04.016', 54),
(55, 'Tempat Menyimpan Gambar', '1.3.2.05.01.04.017', 55),
(56, 'Kontainer', '1.3.2.05.01.04.018', 56),
(57, 'Coin Box', '1.3.2.05.01.04.019', 57),
(58, 'Lemari Display', '1.3.2.05.01.04.020', 58),
(59, 'Water Proof Box', '1.3.2.05.01.04.021', 59),
(60, 'Folding Container Box', '1.3.2.05.01.04.022', 60),
(61, 'Box Truck', '1.3.2.05.01.04.023', 61),
(62, 'Laci Box', '1.3.2.05.01.04.024', 62),
(63, 'Lemari Katalog', '1.3.2.05.01.04.025', 63),
(64, 'Lemari Sorok', '1.3.2.05.01.04.026', 64),
(65, 'Lemari Kaca', '1.3.2.05.01.04.027', 65),
(66, 'Lemari Makan', '1.3.2.05.01.04.028', 66),
(67, 'Narkotik Test', '1.3.2.05.01.05.001', 67),
(68, 'CCTV - Camera Control Television System', '1.3.2.05.01.05.002', 68),
(69, 'Papan Visual/Papan Nama', '1.3.2.05.01.05.003', 69),
(70, 'Movitex Board', '1.3.2.05.01.05.004', 70),
(71, 'White Board', '1.3.2.05.01.05.005', 71),
(72, 'Alat Detektor Uang Palsu', '1.3.2.05.01.05.006', 72),
(73, 'Alat Detektor Barang Terlarang/X Ray', '1.3.2.05.01.05.007', 73),
(74, 'Copy Board/Electric White Board', '1.3.2.05.01.05.008', 74),
(75, 'Peta', '1.3.2.05.01.05.009', 75),
(76, 'Alat Penghancur Kertas', '1.3.2.05.01.05.010', 76),
(77, 'Globe', '1.3.2.05.01.05.011', 77),
(78, 'Mesin Absensi', '1.3.2.05.01.05.012', 78),
(79, 'Dry Seal', '1.3.2.05.01.05.013', 79),
(80, 'Fergulator', '1.3.2.05.01.05.014', 80),
(81, 'Cream Polisher', '1.3.2.05.01.05.015', 81),
(82, 'Mesin Perangko', '1.3.2.05.01.05.016', 82),
(83, 'Check Writer', '1.3.2.05.01.05.017', 83),
(84, 'Numerator', '1.3.2.05.01.05.018', 84),
(85, 'Alat Pemotong Kertas', '1.3.2.05.01.05.019', 85),
(86, 'Headmachine Besar', '1.3.2.05.01.05.020', 86),
(87, 'Perforator Besar', '1.3.2.05.01.05.021', 87),
(88, 'Alat Pencetak Label', '1.3.2.05.01.05.022', 88),
(89, 'Overhead Projector', '1.3.2.05.01.05.023', 89),
(90, 'Hand Metal Detector', '1.3.2.05.01.05.024', 90),
(91, 'Walkman Detector', '1.3.2.05.01.05.025', 91),
(92, 'Panel Pameran', '1.3.2.05.01.05.026', 92),
(93, 'Alat Pengaman/Sinyal', '1.3.2.05.01.05.027', 93),
(94, 'Board Modulux', '1.3.2.05.01.05.028', 94),
(95, 'Porto Safe Travel Case', '1.3.2.05.01.05.029', 95),
(96, 'Disk Prime', '1.3.2.05.01.05.030', 96),
(97, 'Megashow', '1.3.2.05.01.05.031', 97),
(98, 'White Board Electronic', '1.3.2.05.01.05.032', 98),
(99, 'Laser Pointer', '1.3.2.05.01.05.033', 99),
(100, 'Display', '1.3.2.05.01.05.034', 100),
(101, 'Exhauster Form', '1.3.2.05.01.05.035', 101),
(102, 'Rubu Mujayyab', '1.3.2.05.01.05.036', 102),
(103, 'Elecric Dumper', '1.3.2.05.01.05.037', 103),
(104, 'Mesin Teraan', '1.3.2.05.01.05.038', 104),
(105, 'Mesin Laminating', '1.3.2.05.01.05.039', 105),
(106, 'Penangkal Petir', '1.3.2.05.01.05.040', 106),
(107, 'Stempel Timbul/Bulat', '1.3.2.05.01.05.041', 107),
(108, 'Lamu-lampu Kristal', '1.3.2.05.01.05.042', 108),
(109, 'LCD Projector/Infocus', '1.3.2.05.01.05.043', 109),
(110, 'Flip Chart', '1.3.2.05.01.05.044', 110),
(111, 'Binding Machine', '1.3.2.05.01.05.045', 111),
(112, 'Softboard', '1.3.2.05.01.05.046', 112),
(113, 'Alat Perekam Suara (Voice Pen)', '1.3.2.05.01.05.047', 113),
(114, 'Acces Control System', '1.3.2.05.01.05.048', 114),
(115, 'Intruction Detector', '1.3.2.05.01.05.049', 115),
(116, 'Monitor Panel With Mimic Board', '1.3.2.05.01.05.050', 116),
(117, 'Panic Button System, Alarm Indicator', '1.3.2.05.01.05.051', 117),
(118, 'Pintu Elektrik (yang Memakai Akses)', '1.3.2.05.01.05.052', 118),
(119, 'Focusing Screen/Layar LCD Projector', '1.3.2.05.01.05.053', 119),
(120, 'Alat Detektor Barang Terlarang', '1.3.2.05.01.05.054', 120),
(121, 'Projector Spider Bracket', '1.3.2.05.01.05.055', 121),
(122, 'Papan Gambar', '1.3.2.05.01.05.056', 122),
(123, 'Bel', '1.3.2.05.01.05.057', 123),
(124, 'Electric Pressing Machine', '1.3.2.05.01.05.058', 124),
(125, 'Encapsulator (Jarasonic welder)', '1.3.2.05.01.05.059', 125),
(126, 'Deacidificator Unit (Non Aquas)', '1.3.2.05.01.05.060', 126),
(127, 'Full Automatic Leaf Caster', '1.3.2.05.01.05.061', 127),
(128, 'Conservation Tools', '1.3.2.05.01.05.062', 128),
(129, 'Board Stand', '1.3.2.05.01.05.063', 129),
(130, 'Vacuum Freeze Dry Chamber', '1.3.2.05.01.05.064', 130),
(131, 'Kotak Surat', '1.3.2.05.01.05.065', 131),
(132, 'Gembok', '1.3.2.05.01.05.066', 132),
(133, 'Compact Hand Projector', '1.3.2.05.01.05.067', 133),
(134, 'Alat Sidik Jari', '1.3.2.05.01.05.068', 134),
(135, 'Alat Penghancur Jarum', '1.3.2.05.01.05.069', 135),
(136, 'Walkthrough/Portal Metal Detektor', '1.3.2.05.01.05.070', 136),
(137, 'Handheld Trace Detector', '1.3.2.05.01.05.071', 137),
(138, 'Alat Deteksi Pita Cukai Palsi/Video Spectral Comparator', '1.3.2.05.01.05.072', 138),
(139, 'Mesin Packing/Strapping Machine', '1.3.2.05.01.05.073', 139),
(140, 'Television Control Operational Lift', '1.3.2.05.01.05.074', 140),
(141, 'Mesin Antrian', '1.3.2.05.01.05.075', 141),
(142, 'Papan Nama Instansi', '1.3.2.05.01.05.076', 142),
(143, 'Papan Pengumuman', '1.3.2.05.01.05.077', 143),
(144, 'Papan Tulis', '1.3.2.05.01.05.078', 144),
(145, 'Papan Absen', '1.3.2.05.01.05.079', 145),
(146, 'Mesin Fogging', '1.3.2.05.01.05.080', 146),
(147, 'Teralis', '1.3.2.05.01.05.081', 147),
(148, 'Alat Penerjemah', '1.3.2.05.01.05.082', 148),
(149, 'Alat Penghancur Plastik', '1.3.2.05.01.05.083', 149),
(150, 'Proteksi Petir Terpadu', '1.3.2.05.01.05.084', 150),
(151, 'Pakaian Toga', '1.3.2.05.01.05.085', 151),
(152, 'Sirine', '1.3.2.05.01.05.086', 152),
(153, 'Tongkal Pedel', '1.3.2.05.01.05.087', 153),
(154, 'Meja Kerja Besi/Metal', '1.3.2.05.02.01.001', 154),
(155, 'Meja Kerja Kayu', '1.3.2.05.02.01.002', 155),
(156, 'Kursi Besi/Metal', '1.3.2.05.02.01.003', 156),
(157, 'Kursi Kayu', '1.3.2.05.02.01.004', 157),
(158, 'Sice', '1.3.2.05.02.01.005', 158),
(159, 'Bangku Panjang Besi/Metal', '1.3.2.05.02.01.006', 159),
(160, 'Bangku Panjang Kayu', '1.3.2.05.02.01.007', 160),
(161, 'Meja Rapat', '1.3.2.05.02.01.008', 161),
(162, 'Tempat Tidur Besi', '1.3.2.05.02.01.009', 162),
(163, 'Tempat Tidur Kayu', '1.3.2.05.02.01.010', 163),
(164, 'Meja Ketik', '1.3.2.05.02.01.011', 164),
(165, 'Meja Telepon', '1.3.2.05.02.01.012', 165),
(166, 'Meja Podium', '1.3.2.05.02.01.013', 166),
(167, 'Meja Resepsionis', '1.3.2.05.02.01.014', 167),
(168, 'Meja Marmer', '1.3.2.05.02.01.015', 168),
(169, 'Meja Tambahan', '1.3.2.05.02.01.016', 169),
(170, 'Meja Panjang', '1.3.2.05.02.01.017', 170),
(171, 'Meja Bundar', '1.3.2.05.02.01.018', 171),
(172, 'Meja Periksa Pasien', '1.3.2.05.02.01.019', 172),
(173, 'Meja Obat', '1.3.2.05.02.01.020', 173),
(174, 'Meja Kartu', '1.3.2.05.02.01.021', 174),
(175, 'Meja Bayi', '1.3.2.05.02.01.022', 175),
(176, 'Meja Sekolah', '1.3.2.05.02.01.023', 176),
(177, 'Meja 1/2 Biro', '1.3.2.05.02.01.024', 177),
(178, 'Kasur/Spring Bed', '1.3.2.05.02.01.025', 178),
(179, 'Sketsel', '1.3.2.05.02.01.026', 179),
(180, 'Meja Makan Besi', '1.3.2.05.02.01.027', 180),
(181, 'Meja Makan Kayu', '1.3.2.05.02.01.028', 181),
(182, 'Kursi Fiber Glass/Plastik', '1.3.2.05.02.01.029', 182),
(183, 'Kursi Rapat', '1.3.2.05.02.01.030', 183),
(184, 'Kursi Tamu', '1.3.2.05.02.01.031', 184),
(185, 'Kursi Putar', '1.3.2.05.02.01.032', 185),
(186, 'Kursi Biasa', '1.3.2.05.02.01.033', 186),
(187, 'Bangku Sekolah', '1.3.2.05.02.01.034', 187),
(188, 'Bangku Tunggu', '1.3.2.05.02.01.035', 188),
(189, 'Kursi Lipat', '1.3.2.05.02.01.036', 189),
(190, 'Bangku Injak', '1.3.2.05.02.01.037', 190),
(191, 'Meja Cetakan', '1.3.2.05.02.01.038', 191),
(192, 'Meja Komputer', '1.3.2.05.02.01.039', 192),
(193, 'Pot Bunga', '1.3.2.05.02.01.040', 193),
(194, 'Partisi', '1.3.2.05.02.01.041', 194),
(195, 'Publik Astari (Pembatas Antrian)', '1.3.2.05.02.01.042', 195),
(196, 'Rak Sepatu (Alumunium)', '1.3.2.05.02.01.043', 196),
(197, 'Gantungan Jas', '1.3.2.05.02.01.044', 197),
(198, 'Nakas', '1.3.2.05.02.01.045', 198),
(199, 'Cubikal', '1.3.2.05.02.01.046', 199),
(200, 'Workstation', '1.3.2.05.02.01.047', 200),
(201, 'Sofa', '1.3.2.05.02.01.048', 201),
(202, 'Meja Rias', '1.3.2.05.02.01.049', 202),
(203, 'Jam Mekanis', '1.3.2.05.02.02.001', 203),
(204, 'Jam Listrik', '1.3.2.05.02.02.002', 204),
(205, 'Jam Elektronik', '1.3.2.05.02.02.003', 205),
(206, 'Control Clock', '1.3.2.05.02.02.004', 206),
(207, 'Mesin Penghisap Debu/Vacuum Cleaner', '1.3.2.05.02.03.001', 207),
(208, 'Mesin Pel/Poles', '1.3.2.05.02.03.002', 208),
(209, 'Mesin Pemotong Rumput', '1.3.2.05.02.03.003', 209),
(210, 'Mesin Cuci', '1.3.2.05.02.03.004', 210),
(211, 'Air Cleaner', '1.3.2.05.02.03.005', 211),
(212, 'Alat Pembersih Salju', '1.3.2.05.02.03.006', 212),
(213, 'Lemari Es', '1.3.2.05.02.04.001', 213),
(214, 'AC Sentral', '1.3.2.05.02.04.002', 214),
(215, 'AC Window', '1.3.2.05.02.04.003', 215),
(216, 'AC Split', '1.3.2.05.02.04.004', 216),
(217, 'Portable Air Conditioner (Alat Pendingin)', '1.3.2.05.02.04.005', 217),
(218, 'Kipas Angin', '1.3.2.05.02.04.006', 218),
(219, 'Exhaust Fan', '1.3.2.05.02.04.007', 219),
(220, 'Cold Storage (Alat Pendingin)', '1.3.2.05.02.04.008', 220),
(221, 'Reach In Freezer', '1.3.2.05.02.04.009', 221),
(222, 'Reach In Chiller', '1.3.2.05.02.04.010', 222),
(223, 'Up Right Chiller/Freezer', '1.3.2.05.02.04.011', 223),
(224, 'Cold Room Freezer', '1.3.2.05.02.04.012', 224),
(225, 'Air Curtain', '1.3.2.05.02.04.013', 225),
(226, 'Air Handling Unit', '1.3.2.05.02.04.014', 226),
(227, 'Kompor Listrik (Alat Dapur)', '1.3.2.05.02.05.001', 227),
(228, 'Kompor Gas (Alat Dapur)', '1.3.2.05.02.05.002', 228),
(229, 'Kompor Minyak', '1.3.2.05.02.05.003', 229),
(230, 'Teko Listrik', '1.3.2.05.02.05.004', 230),
(231, 'Rice Cooker (Alat Dapur)', '1.3.2.05.02.05.005', 231),
(232, 'Oven Listrik', '1.3.2.05.02.05.006', 232),
(233, 'Rice Warmer', '1.3.2.05.02.05.007', 233),
(234, 'Kitchen Set', '1.3.2.05.02.05.008', 234),
(235, 'Tabung Gas', '1.3.2.05.02.05.009', 235),
(236, 'Mesin Giling Bumbu', '1.3.2.05.02.05.010', 236),
(237, 'Treng Air/Tandon Air/Toren', '1.3.2.05.02.05.011', 237),
(238, 'Mesin Parutan Kelapa', '1.3.2.05.02.05.012', 238),
(239, 'Kompor Kompresor', '1.3.2.05.02.05.013', 239),
(240, 'Alat Pemanggang Roti/Sate', '1.3.2.05.02.05.014', 240),
(241, 'Rak Piring Alumunium', '1.3.2.05.02.05.015', 241),
(242, 'Alat Penyimpan Beras', '1.3.2.05.02.05.016', 242),
(243, 'Panci', '1.3.2.05.02.05.017', 243),
(244, 'Blender', '1.3.2.05.02.05.018', 244),
(245, 'Mixer', '1.3.2.05.02.05.019', 245),
(246, 'Oven Gas', '1.3.2.05.02.05.020', 246),
(247, 'Presto Cooker', '1.3.2.05.02.05.021', 247),
(248, 'Wonder Pan', '1.3.2.05.02.05.022', 248),
(249, 'Mesin Giling Daging', '1.3.2.05.02.05.023', 249),
(250, 'Heating Set', '1.3.2.05.02.05.024', 250),
(251, 'Thermos Air', '1.3.2.05.02.05.025', 251),
(252, 'Radio', '1.3.2.05.02.06.001', 252),
(253, 'Televisi', '1.3.2.05.02.06.002', 253),
(254, 'Video Cassette', '1.3.2.05.02.06.003', 254),
(255, 'Tape Recorder (Alat Rumah Tangga Lainnya (Home Use))', '1.3.2.05.02.06.004', 255),
(256, 'Amplifier', '1.3.2.05.02.06.005', 256),
(257, 'Equalizer', '1.3.2.05.02.06.006', 257),
(258, 'Loudspeaker', '1.3.2.05.02.06.007', 258),
(259, 'Sound System', '1.3.2.05.02.06.008', 259),
(260, 'Compact Disc', '1.3.2.05.02.06.009', 260),
(261, 'Laser Disc', '1.3.2.05.02.06.010', 261),
(262, 'Karaoke', '1.3.2.05.02.06.011', 262),
(263, 'Wireless', '1.3.2.05.02.06.012', 263),
(264, 'Megaphone', '1.3.2.05.02.06.013', 264),
(265, 'Microphone', '1.3.2.05.02.06.014', 265),
(266, 'Microphone Floor Stand', '1.3.2.05.02.06.015', 266),
(267, 'Microphone Table Stand', '1.3.2.05.02.06.016', 267),
(268, 'Mic Conference', '1.3.2.05.02.06.017', 268),
(269, 'Unit Power Suply', '1.3.2.05.02.06.018', 269),
(270, 'Step Up/Down (Alat Rumah Tangga Lainnya (Home Use)', '1.3.2.05.02.06.019', 270),
(271, 'Stabilisator', '1.3.2.05.02.06.020', 271),
(272, 'Camera Video', '1.3.2.05.02.06.021', 272),
(273, 'Camera Film', '1.3.2.05.02.06.022', 273),
(274, 'Tustel', '1.3.2.05.02.06.023', 274),
(275, 'Mesin Jahit', '1.3.2.05.02.06.024', 275),
(276, 'Timbangan Orang', '1.3.2.05.02.06.025', 276),
(277, 'Timbangan Barang', '1.3.2.05.02.06.026', 277),
(278, 'Alat Hiasan', '1.3.2.05.02.06.027', 278),
(279, 'Lambang Garuda Pancasila', '1.3.2.05.02.06.028', 279),
(280, 'Gambar Presiden/Wakil Presiden', '1.3.2.05.02.06.029', 280),
(281, 'Lambang Korpri/Dharma Wanita', '1.3.2.05.02.06.030', 281),
(282, 'Aquarium (Alat Rumah Tangga Lainnya (Home Use))', '1.3.2.05.02.06.031', 282),
(283, 'Tiang Bendera', '1.3.2.05.02.06.032', 283),
(284, 'Pataka', '1.3.2.05.02.06.033', 284),
(285, 'Seterika', '1.3.2.05.02.06.034', 285),
(286, 'Water Filter', '1.3.2.05.02.06.035', 286),
(287, 'Tangga Alumunium', '1.3.2.05.02.06.036', 287),
(288, 'Kaca Hias', '1.3.2.05.02.06.037', 288),
(289, 'Dispenser', '1.3.2.05.02.06.038', 289),
(290, 'Mimbar/Podium', '1.3.2.05.02.06.039', 290),
(291, 'Gucci', '1.3.2.05.02.06.040', 291),
(292, 'Tangga Hidrolik', '1.3.2.05.02.06.041', 292),
(293, 'Palu Sidang', '1.3.2.05.02.06.042', 293),
(294, 'Mesin Pengering Pakaian', '1.3.2.05.02.06.043', 294),
(295, 'Lambang Instansi', '1.3.2.05.02.06.044', 295),
(296, 'Lonceng/Genta', '1.3.2.05.02.06.045', 296),
(297, 'Mesin Pemotong Keramik', '1.3.2.05.02.06.046', 297),
(298, 'Coffe Maker', '1.3.2.05.02.06.047', 298),
(299, 'Handy Cam', '1.3.2.05.02.06.048', 299),
(300, 'Mesin Obras', '1.3.2.05.02.06.049', 300),
(301, 'Mesin Potong Kain', '1.3.2.05.02.06.050', 301),
(302, 'Mesin Pelubang Kancing', '1.3.2.05.02.06.051', 302),
(303, 'Meja Potong', '1.3.2.05.02.06.052', 303),
(304, 'Rader', '1.3.2.05.02.06.053', 304),
(305, 'Manequin (Boneka)', '1.3.2.05.02.06.054', 305),
(306, 'Mini Compo', '1.3.2.05.02.06.055', 306),
(307, 'Heater (Alat Rumah Tangga Lainnya (Home Use))', '1.3.2.05.02.06.056', 307),
(308, 'Karpet', '1.3.2.05.02.06.057', 308),
(309, 'Vertikal Blind', '1.3.2.05.02.06.058', 309),
(310, 'Gordyin/Kray', '1.3.2.05.02.06.059', 310),
(311, 'Asbak Tinggi', '1.3.2.05.02.06.060', 311),
(312, 'Sun Screen', '1.3.2.05.02.06.061', 312),
(313, 'Alat Pemanas Ruangan', '1.3.2.05.02.06.062', 313),
(314, 'Lemari Plastik', '1.3.2.05.02.06.063', 314),
(315, 'Mesin Pengering Tangan', '1.3.2.05.02.06.064', 315),
(316, 'Panggung', '1.3.2.05.02.06.065', 316),
(317, 'Mesin Pedding', '1.3.2.05.02.06.066', 317),
(318, 'DVD Player', '1.3.2.05.02.06.067', 318),
(319, 'Tangga', '1.3.2.05.02.06.068', 319),
(320, 'Lampu', '1.3.2.05.02.06.069', 320),
(321, 'Jemuran', '1.3.2.05.02.06.070', 321),
(322, 'Patung Peraga Pakaian', '1.3.2.05.02.06.071', 322),
(323, 'Gendola', '1.3.2.05.02.06.072', 323),
(324, 'Alat Pangkas Rambut Listrik', '1.3.2.05.02.06.073', 324),
(325, 'Bracket Standing Peralatan', '1.3.2.05.02.06.074', 325),
(326, 'Tangki Air', '1.3.2.05.02.06.075', 326),
(327, 'Home Theater', '1.3.2.05.02.06.076', 327),
(328, 'Mainframe (Komputer Jaringan)', '1.3.2.10.01.01.001', 328),
(329, 'Mini Komputer', '1.3.2.10.01.01.002', 329),
(330, 'Local Area Network (LAN)', '1.3.2.10.01.01.003', 330),
(331, 'Internet', '1.3.2.10.01.01.004', 331),
(332, 'Komputer Wedis', '1.3.2.10.01.01.005', 332),
(333, 'Komputer Synergie', '1.3.2.10.01.01.006', 333),
(334, 'PC Workstation', '1.3.2.10.01.01.007', 334),
(335, 'PC Unit', '1.3.2.10.01.02.001', 335),
(336, 'Laptop', '1.3.2.10.01.02.002', 336),
(337, 'Note Book', '1.3.2.10.01.02.003', 337),
(338, 'Palm Top', '1.3.2.10.01.02.004', 338),
(339, 'Code Breaker Super Komputer', '1.3.2.10.01.02.005', 339),
(340, 'Thinclient', '1.3.2.10.01.02.006', 340),
(341, 'Net Book', '1.3.2.10.01.02.007', 341),
(342, 'Ultra Mobile PC', '1.3.2.10.01.02.008', 342),
(343, 'Tablet PC', '1.3.2.10.01.02.009', 343),
(344, 'Card Reader (Peralatan Mainframe)', '1.3.2.10.02.01.001', 344),
(345, 'Magnetic Tape Unit (Peralatan Mainframe)', '1.3.2.10.02.01.002', 345),
(346, 'Floppy Disk Unit (Peralatan Mainframe)', '1.3.2.10.02.01.003', 346),
(347, 'Storage Modul Disk (Peralatan Mainframe)', '1.3.2.10.02.01.004', 347),
(348, 'Console Unit (Peralatan Mainframe)', '1.3.2.10.02.01.005', 348),
(349, 'CPU (Peralatan Mainframe)', '1.3.2.10.02.01.006', 349),
(350, 'Disk Pack (Peralatan Mainframe)', '1.3.2.10.02.01.007', 350),
(351, 'Hard Copy Console', '1.3.2.10.02.01.008', 351),
(352, 'Serial Printer', '1.3.2.10.02.01.009', 352),
(353, 'Line', '1.3.2.10.02.01.010', 353),
(354, 'Plotter (Peralatan Mainframe)', '1.3.2.10.02.01.011', 354),
(355, 'Hard Disk', '1.3.2.10.02.01.012', 355),
(356, 'Keyboard (Peralatan Mainframe)', '1.3.2.10.02.01.013', 356),
(357, 'Steamer', '1.3.2.10.02.01.014', 357),
(358, 'Data Patch Panel', '1.3.2.10.02.01.015', 358),
(359, 'Paper Tape Reader', '1.3.2.10.02.01.016', 359),
(360, 'Panaboard', '1.3.2.10.02.01.017', 360),
(361, 'Card Reader (Peralatan Mini Komputer)', '1.3.2.10.02.02.001', 361),
(362, 'Magnetic Tape Unit (Peralatan Mini Komputer)', '1.3.2.10.02.02.002', 362),
(363, 'Floppy Disk Unit (Peralatan Mini Komputer)', '1.3.2.10.02.02.003', 363),
(364, 'Storage Modul Disk (Peralatan Mini Komputer)', '1.3.2.10.02.02.004', 364),
(365, 'Console Unit (Peralatan Mini Komputer)', '1.3.2.10.02.02.005', 365),
(366, 'CPU (Peralatan Mini Komputer)', '1.3.2.10.02.02.006', 366),
(367, 'Disk Pack (Peralatan Mini Komputer)', '1.3.2.10.02.02.007', 367),
(368, 'Plotter (Peralatan Mini Komputer)', '1.3.2.10.02.02.008', 368),
(369, 'Scanner (Peralatan Mini Komputer)', '1.3.2.10.02.02.009', 369),
(370, 'Computer Compatible', '1.3.2.10.02.02.010', 370),
(371, 'Viewer (Peralatan Mini Komputer)', '1.3.2.10.02.02.011', 371),
(372, 'Digitizer (Peralatan Mini Komputer)', '1.3.2.10.02.02.012', 372),
(373, 'Keyboard (Peralatan Mini Komputer)', '1.3.2.10.02.02.013', 373),
(374, 'Auto Switch/Data Switch', '1.3.2.10.02.02.014', 374),
(375, 'Cut Sheet Feeder', '1.3.2.10.02.02.015', 375),
(376, 'Speaker Komputer', '1.3.2.10.02.02.016', 376),
(377, 'CPU (Peralatan Personal Komputer)', '1.3.2.10.02.03.001', 377),
(378, 'Monitor', '1.3.2.10.02.03.002', 378),
(379, 'Printer (Peralatan Personal Komputer)', '1.3.2.10.02.03.003', 379),
(380, 'Scanner (Peralatan Personal Komputer)', '1.3.2.10.02.03.004', 380),
(381, 'Plotter (Peralatan Personal Komputer)', '1.3.2.10.02.03.005', 381),
(382, 'Viewer (Peralatan Personal Komputer)', '1.3.2.10.02.03.006', 382),
(383, 'External', '1.3.2.10.02.03.007', 383),
(384, 'Digitizer (Peralatan Personal Komputer)', '1.3.2.10.02.03.008', 384),
(385, 'Keyboard (Peralatan Personal Komputer)', '1.3.2.10.02.03.009', 385),
(386, 'CD Writer', '1.3.2.10.02.03.010', 386),
(387, 'DVD Writer', '1.3.2.10.02.03.011', 387),
(388, 'Firewire Card', '1.3.2.10.02.03.012', 388),
(389, 'Capture Card', '1.3.2.10.02.03.013', 389),
(390, 'LAN Card', '1.3.2.10.02.03.014', 390),
(391, 'External CD/DVD Drive (ROM)', '1.3.2.10.02.03.015', 391),
(392, 'External Floppy Disk Drive', '1.3.2.10.02.03.016', 392),
(393, 'External/Portable Hardisk', '1.3.2.10.02.03.017', 393),
(394, 'Server', '1.3.2.10.02.04.001', 394),
(395, 'Router', '1.3.2.10.02.04.002', 395),
(396, 'Hub', '1.3.2.10.02.04.003', 396),
(397, 'Modem', '1.3.2.10.02.04.004', 397),
(398, 'Netware Interface External', '1.3.2.10.02.04.005', 398),
(399, 'Repeater and Transciever', '1.3.2.10.02.04.006', 399),
(400, 'Head Copy Terminal', '1.3.2.10.02.04.007', 400),
(401, 'Rack Modem', '1.3.2.10.02.04.008', 401),
(402, 'Card Punch', '1.3.2.10.02.04.009', 402),
(403, 'Head Copy Printer', '1.3.2.10.02.04.010', 403),
(404, 'Character Terminal', '1.3.2.10.02.04.011', 404),
(405, 'Graphic Terminal', '1.3.2.10.02.04.012', 405),
(406, 'Terminal', '1.3.2.10.02.04.013', 406),
(407, 'Rak Server', '1.3.2.10.02.04.014', 407),
(408, 'Firewall', '1.3.2.10.02.04.015', 408),
(409, 'Switch Rak', '1.3.2.10.02.04.016', 409),
(410, 'Wanscaller', '1.3.2.10.02.04.017', 410),
(411, 'E-Mail Security', '1.3.2.10.02.04.018', 411),
(412, 'Client Clearing House', '1.3.2.10.02.04.019', 412),
(413, 'CAT 6 Cable', '1.3.2.10.02.04.020', 413),
(414, 'Kabel UTP', '1.3.2.10.02.04.021', 414),
(415, 'Wireless PCI Card', '1.3.2.10.02.04.022', 415),
(416, 'Wireless Access Point', '1.3.2.10.02.04.023', 416),
(417, 'Switch', '1.3.2.10.02.04.024', 417),
(418, 'Hubbel UTP', '1.3.2.10.02.04.025', 418),
(419, 'Access Point', '1.3.2.10.02.04.026', 419),
(420, 'Rackmount', '1.3.2.10.02.04.027', 420),
(421, 'KVM Keyboard Video Monitor', '1.3.2.10.02.04.028', 421),
(422, 'Mobile Modem GSM/CDMA', '1.3.2.10.02.04.029', 422),
(423, 'Network Cable Tester', '1.3.2.10.02.04.030', 423),
(424, 'Jaringan Satpas', '1.3.2.10.02.04.031', 424),
(425, 'NComputing', '1.3.2.10.02.04.032', 425);

-- --------------------------------------------------------

--
-- Table structure for table `aset_rincianobjek`
--

CREATE TABLE `aset_rincianobjek` (
  `id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `objek_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_rincianobjek`
--

INSERT INTO `aset_rincianobjek` (`id`, `kode`, `nama`, `objek_id`) VALUES
(1, '01', 'BAHAN', 1),
(2, '02', 'SUKU CADANG', 1),
(3, '03', 'ALAT/BAHAN UNTUK KEGIATAN KANTOR', 1),
(4, '04', 'OBAT-OBATAN', 1),
(5, '05', 'PERSEDIAAN UNTUK DIJUAL/DISERAHKAN', 1),
(6, '01', 'ALAT KANTOR LAINNYA', 2),
(7, '02', 'ALAT RUMAH TANGGA', 2),
(8, '03', 'MEJA DAN KURSI KERJA/RAPAT PEJABAT', 2),
(9, '01', 'ALAT STUDIO', 3),
(10, '02', 'ALAT KOMUNIKASI', 3),
(11, '03', 'PERALATAN PEMANCAR', 3),
(12, '04', 'PERALATAN KOMUNIKASI NAVIGASI', 3),
(13, '01', 'KOMPUTER UNIT', 4),
(14, '02', 'PERALATAN KOMPUTER', 4),
(15, '10', 'AKUMULASI PENYUSUTAN KOMPUTER', 5);

-- --------------------------------------------------------

--
-- Table structure for table `aset_ruangan`
--

CREATE TABLE `aset_ruangan` (
  `id` bigint NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL,
  `kode_lokasi` varchar(50) DEFAULT NULL,
  `bidang_id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_ruangan`
--

INSERT INTO `aset_ruangan` (`id`, `nama_ruangan`, `kode_lokasi`, `bidang_id`, `kode`) VALUES
(1, 'TIK', '02', 1, '00');

-- --------------------------------------------------------

--
-- Table structure for table `aset_statuskepemilikan`
--

CREATE TABLE `aset_statuskepemilikan` (
  `id` bigint NOT NULL,
  `kode` varchar(2) NOT NULL,
  `uraian` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aset_statuskompabilitas`
--

CREATE TABLE `aset_statuskompabilitas` (
  `id` bigint NOT NULL,
  `kode` varchar(1) NOT NULL,
  `uraian` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aset_subkegiatan`
--

CREATE TABLE `aset_subkegiatan` (
  `id` bigint NOT NULL,
  `nama_sub_kegiatan` varchar(255) NOT NULL,
  `kegiatan_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_subkegiatan`
--

INSERT INTO `aset_subkegiatan` (`id`, `nama_sub_kegiatan`, `kegiatan_id`) VALUES
(3, 'Ngudud', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aset_subrincianobjek`
--

CREATE TABLE `aset_subrincianobjek` (
  `id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `rincian_objek_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_subrincianobjek`
--

INSERT INTO `aset_subrincianobjek` (`id`, `kode`, `nama`, `rincian_objek_id`) VALUES
(1, '01', 'BAHAN BANGUNAN DAN KONSTRUKSI', 1),
(2, '02', 'BAHAN KIMIA', 1),
(3, '03', 'BAHAN PELEDAK', 1),
(4, '04', 'BAHAN BAKAR DAN PELUMAS', 1),
(5, '05', 'BAHAN BAKU', 1),
(6, '06', 'BAHAN KIMIA NUKLIR', 1),
(7, '07', 'BARANG DALAM PROSES', 1),
(8, '08', 'BAHAN/BIBIT TANAMAN', 1),
(9, '09', 'ISI TABUNG PEMADAM KEBAKARAN', 1),
(10, '10', 'ISI TABUNG GAS', 1),
(11, '11', 'BAHAN/BIBT TERNAK/BIBIT IKAN', 1),
(12, '12', 'BAHAN LAINNYA', 1),
(13, '01', 'SUKU CADANG ALAT ANGKUTAN', 2),
(14, '02', 'SUKU CADANG ALAT BESAR', 2),
(15, '03', 'SUKU CADANG ALAT KEDOKTERAN', 2),
(16, '04', 'SUKU CADANG ALAT LABORATORIUM', 2),
(17, '05', 'SUKU CADANG ALAT PEMANCAR', 2),
(18, '06', 'SUKU CADANG ALAT STUDIO DAN KOMUNIKASI', 2),
(19, '07', 'SUKU CADANG ALAT PERTANIAN', 2),
(20, '08', 'SUKU CADANG ALAT BENGKEL', 2),
(21, '09', 'SUKU CADANG ALAT PERSENJATAAN', 2),
(22, '10', 'PERSEDIAAN DARI BELANJA BANTUAN SOSIAL', 2),
(23, '11', 'SUKU CADANG LAINNYA', 2),
(24, '01', 'ALAT TULIS KANTOR', 3),
(25, '02', 'KERTAS DAN COVER', 3),
(26, '03', 'BAHAN CETAK', 3),
(27, '04', 'BENDA POS', 3),
(28, '05', 'PERSEDIAAN DOKUMEN/ADMINISTRASI TENDER', 3),
(29, '06', 'BAHAN KOMPUTER', 3),
(30, '07', 'PERABOT KANTOR', 3),
(31, '08', 'ALAT LISTRIK', 3),
(32, '09', 'PERLENGKAPAN DINAS', 3),
(33, '10', 'KAPORLAP DAN PERLENGKAPAN SATWA', 3),
(34, '11', 'PERLENGKAPAN PENDUKUNG OLAH RAGA', 3),
(35, '12', 'SUVENIR/CENDERA MATA', 3),
(36, '13', 'ALAT/BAHAN UNTUK KEGIATAN KANTOR LAINNYA', 3),
(37, '01', 'OBAT', 4),
(38, '02', 'OBAT-OBATAN LAINNYA', 4),
(39, '01', 'PERSEDIAAN UNTUK DIJUAL/DISERAHKAN KEPADA MASYARAKAT', 5),
(40, '02', 'PERSEDIAAN UNTUK DIJUAL/DISERAHKAN LAINNYA', 5),
(41, '01', 'MESIN KETIK', 6),
(42, '02', 'MESIN HITUNG/MESIN JUMLAH', 6),
(43, '03', 'ALAT REPRODUKSI (PENGGANDAAN)', 6),
(44, '04', 'ALAT PENYIMPAN PERLENGKAPAN KANTOR', 6),
(45, '05', 'ALAT KANTOR LAINNYA', 6),
(46, '01', 'MEUBELAIR', 7),
(47, '02', 'ALAT PENGUKUR WAKTU', 7),
(48, '03', 'ALAT PEMBERSIH', 7),
(49, '04', 'ALAT PENDINGIN', 7),
(50, '05', 'ALAT DAPUR', 7),
(51, '06', 'ALAT RUMAH TANGGA LAINNYA (HOME USE)', 7),
(52, '07', 'ALAT PEMADAM KEBAKARAN', 7),
(53, '01', 'MEJA KERJA PEJABAT', 8),
(54, '02', 'MEJA RAPAT PEJABAT', 8),
(55, '03', 'KURSI KERJA PEJABAT', 8),
(56, '04', 'KURSI RAPAT PEJABAT', 8),
(57, '05', 'KURSI HADAP DEPAN MEJA KERJA PEJABAT', 8),
(58, '06', 'KURSI TAMU DI RUANGAN PEJABAT', 8),
(59, '07', 'LEMARI DAN ARSIP PEJABAT', 8),
(60, '01', 'PERALATAN STUDIO AUDIO', 9),
(61, '02', 'PERALATAN STUDIO VIDEO DAN FILM', 9),
(62, '03', 'PERALATAN STUDIO GAMBAR', 9),
(63, '04', 'PERALATAN CETAK', 9),
(64, '05', 'PERALATAN STUDIO PEMETAAN/PERALATAN UKUR TANAH', 9),
(65, '06', 'ALAT STUDIO LAINNYA', 9),
(66, '01', 'ALAT KOMUNIKASI TELEPHONE', 10),
(67, '02', 'ALAT KOMUNIKASI RADIO SSB', 10),
(68, '03', 'ALAT KOMUNIKASI RADIO HF/FM', 10),
(69, '04', 'ALAT KOMUNIKASI RADIO VHF', 10),
(70, '05', 'ALAT KOMUNIKASI RADIO UHF', 10),
(71, '06', 'ALAT KOMUNIKASI SOSIAL', 10),
(72, '07', 'ALAT-ALAT SANDI', 10),
(73, '08', 'ALAT KOMUNIKASI KHUSUS', 10),
(74, '09', 'ALAT KOMUNIKASI DIGITAL DAN KONVENSIONAL', 10),
(75, '10', 'ALAT KOMUNIKASI SATELIT', 10),
(76, '11', 'ALAT KOMUNIKASI LAINNYA', 10),
(77, '01', 'PERALATAN PEMANCAR MF/MW', 11),
(78, '02', 'PERALATAN PEMANCAR HF/SW', 11),
(79, '03', 'PERALATAN PEMANCAR VHF/FM', 11),
(80, '04', 'PERALATAN PEMANCAR UHF', 11),
(81, '05', 'PERALATAN PEMANCAR SHF', 11),
(82, '06', 'PERALATAN ANTENA MF/MW', 11),
(83, '07', 'PERALATAN ANTENA HF/SW', 11),
(84, '08', 'PERALATAN ANTENA VHF/FM', 11),
(85, '09', 'PERALATAN ANTENA UHF', 11),
(86, '10', 'PERALATAN ANTENA SHF/PARABOLA', 11),
(87, '11', 'PERALATAN TRANSLATOR VHF/VHF', 11),
(88, '12', 'PERALATAN TRANSLATOR UHF/UHF', 11),
(89, '13', 'PERALATAN TRANSLATOR VHF/UHF', 11),
(90, '14', 'PERALATAN TRANSLATOR UHF/VHF', 11),
(91, '15', 'PERALATAN MICROWAVE FPU', 11),
(92, '16', 'PERALATAN MICROWAVE TERESTRIAL', 11),
(93, '17', 'PERALATAN MICROWAVE TVRO', 11),
(94, '18', 'PERALATAN DUMMY LOAD', 11),
(95, '19', 'SWITCHER ANTENA', 11),
(96, '20', 'SWITCHER/MENARA ANTENA', 11),
(97, '21', 'FEEDER', 11),
(98, '22', 'HUMIDITY CONTROL', 11),
(99, '23', 'PROGRAM INPUT EQUIPMENT', 11),
(100, '24', 'PERALATAN ANTENA PENERIMA VHF', 11),
(101, '25', 'PERALATAN PEMANCAR LF', 11),
(102, '26', 'UNIT PEMANCAR MF+HF', 11),
(103, '27', 'PERALATAN ANTENA PEMANCAR MF+HF', 11),
(104, '28', 'PERALATAN PENERIMA', 11),
(105, '29', 'PERALATAN PEMANCAR DAN PENERIMA LF', 11),
(106, '30', 'PERALATAN PEMANCAR DAN PENERIMA MF', 11),
(107, '31', 'PERALATAN PEMANCAR DAN PENERIMA HF', 11),
(108, '32', 'PERALATAN PEMANCAR DAN PENERIMA MF+HF', 11),
(109, '33', 'PERALATAN PEMANCAR DAN PENERIMA VHF', 11),
(110, '34', 'PERALATAN PEMANCAR DAN PENERIMA UHF', 11),
(111, '35', 'PERALATAN PEMANCAR DAN PENERIMA SHF', 11),
(112, '36', 'PERALATAN ANTENA PEMANCAR DAN PENERIMA LF', 11),
(113, '37', 'PERALATAN ANTENA PEMANCAR DAN PENERIMA MF', 11),
(114, '38', 'PERALATAN ANTENA PEMANCAR DAN PENERIMA HF', 11),
(115, '39', 'PERALATAN ANTENA PEMANCAR DAN PENERIMA MF+HF', 11),
(116, '40', 'PERALATAN ANTENA PEMANCAR DAN PENERIMA VHF', 11),
(117, '41', 'PERALATAN ANTENA PEMANCAR DAN PENERIMA UHF', 11),
(118, '42', 'PERALATAN ANTENA PEMANCAR DAN PENERIMA SHF', 11),
(119, '43', 'PERALATAN PENERIMA CUACA CITRA SATELITE RESOLUSI RENDAH', 11),
(120, '44', 'PERALATAN PENERIMA CUACA CITRA SATELITE RESOLUSI TINGGI', 11),
(121, '45', 'PERALATAN PENERIMA DAN PENGIRIM GAMBAR KE PERMUKAAN', 11),
(122, '46', 'PERALATAN PERLENGKAPAN RADIO', 11),
(123, '47', 'SUMBER TENAGA', 11),
(124, '48', 'PERALATAN PEMANCAR LAINNYA', 11),
(125, '01', 'PERALATAN KOMUNIKASI NAVIGASI INSTRUMEN LANDING SYSTEM', 12),
(126, '02', 'VERY HIGH FREQUENCE OMNI RANGE (VOR)', 12),
(127, '03', 'DISTANCE MEASURING EQUIPMENT (DME)', 12),
(128, '04', 'RADAR', 12),
(129, '05', 'ALAT PENGATUR TELEKOMUNIKASI', 12),
(130, '06', 'PERALATAN KOMUNIKASI UNTUK DOKUMENTASI', 12),
(131, '07', 'PERALATAN KOMUNIKASI NAVIGASI LAINNYA', 12),
(132, '01', 'KOMPUTER JARINGAN', 13),
(133, '02', 'PERSONAL KOMPUTER', 13),
(134, '03', 'KOMPUTER UNIT LAINNYA', 13),
(135, '01', 'PERALATAN MAINFRAME', 14),
(136, '02', 'PERALATAN MINI KOMPUTER', 14),
(137, '03', 'PERALATAN PERSONAL KOMPUTER', 14),
(138, '04', 'PERALATAN JARINGAN', 14),
(139, '05', 'PERALATAN KOMPUTER LAINNYA', 14),
(140, '01', 'AKUMULASI PENYUSUTAN KOMPUTER UNIT', 15),
(141, '02', 'AKUMULASI PENYUSUTAN PERALATAN KOMPUTER', 15);

-- --------------------------------------------------------

--
-- Table structure for table `aset_subsubrincianobjek`
--

CREATE TABLE `aset_subsubrincianobjek` (
  `id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `sub_rincian_objek_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_subsubrincianobjek`
--

INSERT INTO `aset_subsubrincianobjek` (`id`, `kode`, `nama`, `sub_rincian_objek_id`) VALUES
(1, '001', 'Mesin Ketik Manual Portable (11-13 Inci)', 41),
(2, '002', 'Mesin Ketik Manual Standard (14-16 Inci)', 41),
(3, '003', 'Mesin Ketik Manual Langewagon (18-27 Inci)', 41),
(4, '004', 'Mesin Ketik Listrik', 41),
(5, '005', 'Mesin Ketik Listrik Portable (11-13 Inci)', 41),
(6, '006', 'Mesin Ketik Listrik Standard (14-16 Inci)', 41),
(7, '007', 'Mesin Ketik Listrik Langewagon (18-27 Inci)', 41),
(8, '008', 'Mesin Ketik Elektronik/Elektrik', 41),
(9, '009', 'Mesin Ketik Braille', 41),
(10, '010', 'Mesin Phromosons', 41),
(11, '011', 'Mesin Cetak Stereo Piper (Braille)', 41),
(12, '001', 'Mesin Hitung Manual', 42),
(13, '002', 'Mesin Hitung Listrik', 42),
(14, '003', 'Mesin Hitung Elektronik/Calculator', 42),
(15, '004', 'Mesin Kas Register', 42),
(16, '005', 'Abakus (Alat Hitung)', 42),
(17, '006', 'Blokycs (Mesin Hitung Braille)', 42),
(18, '007', 'Mesin Penghitung Uang', 42),
(19, '008', 'Mesin Pembukuan', 42),
(20, '009', 'Mesin Penghitung Kertas/Pita Cukai', 42),
(21, '010', 'Mesin Absen (Time Recorder)', 42),
(22, '011', 'Mesin Kontrol Jaga', 42),
(23, '001', 'Mesin Stensil Manual Folio', 43),
(24, '002', 'Mesin Stensil Manual Double Folio', 43),
(25, '003', 'Mesin Stensil Listrik Folio', 43),
(26, '004', 'Mesin Stensil Listrik Double Folio', 43),
(27, '005', 'Mesin Stensil Spiritus Manual', 43),
(28, '006', 'Mesin Stensil Spiritus Listrik', 43),
(29, '007', 'Mesin Fotocopy Folio', 43),
(30, '008', 'Mesin Fotocopy Double Folio', 43),
(31, '009', 'Mesin Fotocopy Electronic', 43),
(32, '010', 'Mesin Thermoforn', 43),
(33, '011', 'Mesin Fotocopy Lainnya', 43),
(34, '012', 'Risograf', 43),
(35, '013', 'Mesin Perekam Stensil Folio', 43),
(36, '014', 'Mesin Perekam Stensil Double Folio', 43),
(37, '015', 'Mesin Plate Folio', 43),
(38, '016', 'Mesin Plate Double Folio', 43),
(39, '001', 'Lemari Besi/Metal', 44),
(40, '002', 'Lemari Kayu', 44),
(41, '003', 'Rak Besi', 44),
(42, '004', 'Rak Kayu', 44),
(43, '005', 'Filling Cabinet Besi', 44),
(44, '006', 'Filling Cabinet Kayu', 44),
(45, '007', 'Brankas', 44),
(46, '008', 'Peti Uang/Cash Box/Coin Box', 44),
(47, '009', 'Kardex Besi', 44),
(48, '010', 'Kardex Kayu', 44),
(49, '011', 'Rotary Filling', 44),
(50, '012', 'Compact Rolling', 44),
(51, '013', 'Buffet', 44),
(52, '014', 'Mobile File', 44),
(53, '015', 'Locker', 44),
(54, '016', 'Roll Opek', 44),
(55, '017', 'Tempat Menyimpan Gambar', 44),
(56, '018', 'Kontainer', 44),
(57, '019', 'Coin Box', 44),
(58, '020', 'Lemari Display', 44),
(59, '021', 'Water Proof Box', 44),
(60, '022', 'Folding Container Box', 44),
(61, '023', 'Box Truck', 44),
(62, '024', 'Laci Box', 44),
(63, '025', 'Lemari Katalog', 44),
(64, '026', 'Lemari Sorok', 44),
(65, '027', 'Lemari Kaca', 44),
(66, '028', 'Lemari Makan', 44),
(67, '001', 'Narkotik Test', 45),
(68, '002', 'CCTV - Camera Control Television System', 45),
(69, '003', 'Papan Visual/Papan Nama', 45),
(70, '004', 'Movitex Board', 45),
(71, '005', 'White Board', 45),
(72, '006', 'Alat Detektor Uang Palsu', 45),
(73, '007', 'Alat Detektor Barang Terlarang/X Ray', 45),
(74, '008', 'Copy Board/Electric White Board', 45),
(75, '009', 'Peta', 45),
(76, '010', 'Alat Penghancur Kertas', 45),
(77, '011', 'Globe', 45),
(78, '012', 'Mesin Absensi', 45),
(79, '013', 'Dry Seal', 45),
(80, '014', 'Fergulator', 45),
(81, '015', 'Cream Polisher', 45),
(82, '016', 'Mesin Perangko', 45),
(83, '017', 'Check Writer', 45),
(84, '018', 'Numerator', 45),
(85, '019', 'Alat Pemotong Kertas', 45),
(86, '020', 'Headmachine Besar', 45),
(87, '021', 'Perforator Besar', 45),
(88, '022', 'Alat Pencetak Label', 45),
(89, '023', 'Overhead Projector', 45),
(90, '024', 'Hand Metal Detector', 45),
(91, '025', 'Walkman Detector', 45),
(92, '026', 'Panel Pameran', 45),
(93, '027', 'Alat Pengaman/Sinyal', 45),
(94, '028', 'Board Modulux', 45),
(95, '029', 'Porto Safe Travel Case', 45),
(96, '030', 'Disk Prime', 45),
(97, '031', 'Megashow', 45),
(98, '032', 'White Board Electronic', 45),
(99, '033', 'Laser Pointer', 45),
(100, '034', 'Display', 45),
(101, '035', 'Exhauster Form', 45),
(102, '036', 'Rubu Mujayyab', 45),
(103, '037', 'Elecric Dumper', 45),
(104, '038', 'Mesin Teraan', 45),
(105, '039', 'Mesin Laminating', 45),
(106, '040', 'Penangkal Petir', 45),
(107, '041', 'Stempel Timbul/Bulat', 45),
(108, '042', 'Lamu-lampu Kristal', 45),
(109, '043', 'LCD Projector/Infocus', 45),
(110, '044', 'Flip Chart', 45),
(111, '045', 'Binding Machine', 45),
(112, '046', 'Softboard', 45),
(113, '047', 'Alat Perekam Suara (Voice Pen)', 45),
(114, '048', 'Acces Control System', 45),
(115, '049', 'Intruction Detector', 45),
(116, '050', 'Monitor Panel With Mimic Board', 45),
(117, '051', 'Panic Button System, Alarm Indicator', 45),
(118, '052', 'Pintu Elektrik (yang Memakai Akses)', 45),
(119, '053', 'Focusing Screen/Layar LCD Projector', 45),
(120, '054', 'Alat Detektor Barang Terlarang', 45),
(121, '055', 'Projector Spider Bracket', 45),
(122, '056', 'Papan Gambar', 45),
(123, '057', 'Bel', 45),
(124, '058', 'Electric Pressing Machine', 45),
(125, '059', 'Encapsulator (Jarasonic welder)', 45),
(126, '060', 'Deacidificator Unit (Non Aquas)', 45),
(127, '061', 'Full Automatic Leaf Caster', 45),
(128, '062', 'Conservation Tools', 45),
(129, '063', 'Board Stand', 45),
(130, '064', 'Vacuum Freeze Dry Chamber', 45),
(131, '065', 'Kotak Surat', 45),
(132, '066', 'Gembok', 45),
(133, '067', 'Compact Hand Projector', 45),
(134, '068', 'Alat Sidik Jari', 45),
(135, '069', 'Alat Penghancur Jarum', 45),
(136, '070', 'Walkthrough/Portal Metal Detektor', 45),
(137, '071', 'Handheld Trace Detector', 45),
(138, '072', 'Alat Deteksi Pita Cukai Palsi/Video Spectral Comparator', 45),
(139, '073', 'Mesin Packing/Strapping Machine', 45),
(140, '074', 'Television Control Operational Lift', 45),
(141, '075', 'Mesin Antrian', 45),
(142, '076', 'Papan Nama Instansi', 45),
(143, '077', 'Papan Pengumuman', 45),
(144, '078', 'Papan Tulis', 45),
(145, '079', 'Papan Absen', 45),
(146, '080', 'Mesin Fogging', 45),
(147, '081', 'Teralis', 45),
(148, '082', 'Alat Penerjemah', 45),
(149, '083', 'Alat Penghancur Plastik', 45),
(150, '084', 'Proteksi Petir Terpadu', 45),
(151, '085', 'Pakaian Toga', 45),
(152, '086', 'Sirine', 45),
(153, '087', 'Tongkal Pedel', 45),
(154, '001', 'Meja Kerja Besi/Metal', 46),
(155, '002', 'Meja Kerja Kayu', 46),
(156, '003', 'Kursi Besi/Metal', 46),
(157, '004', 'Kursi Kayu', 46),
(158, '005', 'Sice', 46),
(159, '006', 'Bangku Panjang Besi/Metal', 46),
(160, '007', 'Bangku Panjang Kayu', 46),
(161, '008', 'Meja Rapat', 46),
(162, '009', 'Tempat Tidur Besi', 46),
(163, '010', 'Tempat Tidur Kayu', 46),
(164, '011', 'Meja Ketik', 46),
(165, '012', 'Meja Telepon', 46),
(166, '013', 'Meja Podium', 46),
(167, '014', 'Meja Resepsionis', 46),
(168, '015', 'Meja Marmer', 46),
(169, '016', 'Meja Tambahan', 46),
(170, '017', 'Meja Panjang', 46),
(171, '018', 'Meja Bundar', 46),
(172, '019', 'Meja Periksa Pasien', 46),
(173, '020', 'Meja Obat', 46),
(174, '021', 'Meja Kartu', 46),
(175, '022', 'Meja Bayi', 46),
(176, '023', 'Meja Sekolah', 46),
(177, '024', 'Meja 1/2 Biro', 46),
(178, '025', 'Kasur/Spring Bed', 46),
(179, '026', 'Sketsel', 46),
(180, '027', 'Meja Makan Besi', 46),
(181, '028', 'Meja Makan Kayu', 46),
(182, '029', 'Kursi Fiber Glass/Plastik', 46),
(183, '030', 'Kursi Rapat', 46),
(184, '031', 'Kursi Tamu', 46),
(185, '032', 'Kursi Putar', 46),
(186, '033', 'Kursi Biasa', 46),
(187, '034', 'Bangku Sekolah', 46),
(188, '035', 'Bangku Tunggu', 46),
(189, '036', 'Kursi Lipat', 46),
(190, '037', 'Bangku Injak', 46),
(191, '038', 'Meja Cetakan', 46),
(192, '039', 'Meja Komputer', 46),
(193, '040', 'Pot Bunga', 46),
(194, '041', 'Partisi', 46),
(195, '042', 'Publik Astari (Pembatas Antrian)', 46),
(196, '043', 'Rak Sepatu (Alumunium)', 46),
(197, '044', 'Gantungan Jas', 46),
(198, '045', 'Nakas', 46),
(199, '046', 'Cubikal', 46),
(200, '047', 'Workstation', 46),
(201, '048', 'Sofa', 46),
(202, '049', 'Meja Rias', 46),
(203, '001', 'Jam Mekanis', 47),
(204, '002', 'Jam Listrik', 47),
(205, '003', 'Jam Elektronik', 47),
(206, '004', 'Control Clock', 47),
(207, '001', 'Mesin Penghisap Debu/Vacuum Cleaner', 48),
(208, '002', 'Mesin Pel/Poles', 48),
(209, '003', 'Mesin Pemotong Rumput', 48),
(210, '004', 'Mesin Cuci', 48),
(211, '005', 'Air Cleaner', 48),
(212, '006', 'Alat Pembersih Salju', 48),
(213, '001', 'Lemari Es', 49),
(214, '002', 'AC Sentral', 49),
(215, '003', 'AC Window', 49),
(216, '004', 'AC Split', 49),
(217, '005', 'Portable Air Conditioner (Alat Pendingin)', 49),
(218, '006', 'Kipas Angin', 49),
(219, '007', 'Exhaust Fan', 49),
(220, '008', 'Cold Storage (Alat Pendingin)', 49),
(221, '009', 'Reach In Freezer', 49),
(222, '010', 'Reach In Chiller', 49),
(223, '011', 'Up Right Chiller/Freezer', 49),
(224, '012', 'Cold Room Freezer', 49),
(225, '013', 'Air Curtain', 49),
(226, '014', 'Air Handling Unit', 49),
(227, '001', 'Kompor Listrik (Alat Dapur)', 50),
(228, '002', 'Kompor Gas (Alat Dapur)', 50),
(229, '003', 'Kompor Minyak', 50),
(230, '004', 'Teko Listrik', 50),
(231, '005', 'Rice Cooker (Alat Dapur)', 50),
(232, '006', 'Oven Listrik', 50),
(233, '007', 'Rice Warmer', 50),
(234, '008', 'Kitchen Set', 50),
(235, '009', 'Tabung Gas', 50),
(236, '010', 'Mesin Giling Bumbu', 50),
(237, '011', 'Treng Air/Tandon Air/Toren', 50),
(238, '012', 'Mesin Parutan Kelapa', 50),
(239, '013', 'Kompor Kompresor', 50),
(240, '014', 'Alat Pemanggang Roti/Sate', 50),
(241, '015', 'Rak Piring Alumunium', 50),
(242, '016', 'Alat Penyimpan Beras', 50),
(243, '017', 'Panci', 50),
(244, '018', 'Blender', 50),
(245, '019', 'Mixer', 50),
(246, '020', 'Oven Gas', 50),
(247, '021', 'Presto Cooker', 50),
(248, '022', 'Wonder Pan', 50),
(249, '023', 'Mesin Giling Daging', 50),
(250, '024', 'Heating Set', 50),
(251, '025', 'Thermos Air', 50),
(252, '001', 'Radio', 51),
(253, '002', 'Televisi', 51),
(254, '003', 'Video Cassette', 51),
(255, '004', 'Tape Recorder (Alat Rumah Tangga Lainnya (Home Use))', 51),
(256, '005', 'Amplifier', 51),
(257, '006', 'Equalizer', 51),
(258, '007', 'Loudspeaker', 51),
(259, '008', 'Sound System', 51),
(260, '009', 'Compact Disc', 51),
(261, '010', 'Laser Disc', 51),
(262, '011', 'Karaoke', 51),
(263, '012', 'Wireless', 51),
(264, '013', 'Megaphone', 51),
(265, '014', 'Microphone', 51),
(266, '015', 'Microphone Floor Stand', 51),
(267, '016', 'Microphone Table Stand', 51),
(268, '017', 'Mic Conference', 51),
(269, '018', 'Unit Power Suply', 51),
(270, '019', 'Step Up/Down (Alat Rumah Tangga Lainnya (Home Use))', 51),
(271, '020', 'Stabilisator', 51),
(272, '021', 'Camera Video', 51),
(273, '022', 'Camera Film', 51),
(274, '023', 'Tustel', 51),
(275, '024', 'Mesin Jahit', 51),
(276, '025', 'Timbangan Orang', 51),
(277, '026', 'Timbangan Barang', 51),
(278, '027', 'Alat Hiasan', 51),
(279, '028', 'Lambang Garuda Pancasila', 51),
(280, '029', 'Gambar Presiden/Wakil Presiden', 51),
(281, '030', 'Lambang Korpri/Dharma Wanita', 51),
(282, '031', 'Aquarium (Alat Rumah Tangga Lainnya (Home Use))', 51),
(283, '032', 'Tiang Bendera', 51),
(284, '033', 'Pataka', 51),
(285, '034', 'Seterika', 51),
(286, '035', 'Water Filter', 51),
(287, '036', 'Tangga Alumunium', 51),
(288, '037', 'Kaca Hias', 51),
(289, '038', 'Dispenser', 51),
(290, '039', 'Mimbar/Podium', 51),
(291, '040', 'Gucci', 51),
(292, '041', 'Tangga Hidrolik', 51),
(293, '042', 'Palu Sidang', 51),
(294, '043', 'Mesin Pengering Pakaian', 51),
(295, '044', 'Lambang Instansi', 51),
(296, '045', 'Lonceng/Genta', 51),
(297, '046', 'Mesin Pemotong Keramik', 51),
(298, '047', 'Coffe Maker', 51),
(299, '048', 'Handy Cam', 51),
(300, '049', 'Mesin Obras', 51),
(301, '050', 'Mesin Potong Kain', 51),
(302, '051', 'Mesin Pelubang Kancing', 51),
(303, '052', 'Meja Potong', 51),
(304, '053', 'Rader', 51),
(305, '054', 'Manequin (Boneka)', 51),
(306, '055', 'Mini Compo', 51),
(307, '056', 'Heater (Alat Rumah Tangga Lainnya (Home Use))', 51),
(308, '057', 'Karpet', 51),
(309, '058', 'Vertikal Blind', 51),
(310, '059', 'Gordyin/Kray', 51),
(311, '060', 'Asbak Tinggi', 51),
(312, '061', 'Sun Screen', 51),
(313, '062', 'Alat Pemanas Ruangan', 51),
(314, '063', 'Lemari Plastik', 51),
(315, '064', 'Mesin Pengering Tangan', 51),
(316, '065', 'Panggung', 51),
(317, '066', 'Mesin Pedding', 51),
(318, '067', 'DVD Player', 51),
(319, '068', 'Tangga', 51),
(320, '069', 'Lampu', 51),
(321, '070', 'Jemuran', 51),
(322, '071', 'Patung Peraga Pakaian', 51),
(323, '072', 'Gendola', 51),
(324, '073', 'Alat Pangkas Rambut Listrik', 51),
(325, '074', 'Bracket Standing Peralatan', 51),
(326, '075', 'Tangki Air', 51),
(327, '076', 'Home Theater', 51),
(328, '001', 'Mainframe (Komputer Jaringan)', 132),
(329, '002', 'Mini Komputer', 132),
(330, '003', 'Local Area Network (LAN)', 132),
(331, '004', 'Internet', 132),
(332, '005', 'Komputer Wedis', 132),
(333, '006', 'Komputer Synergie', 132),
(334, '007', 'PC Workstation', 132),
(335, '001', 'PC Unit', 133),
(336, '002', 'Laptop', 133),
(337, '003', 'Note Book', 133),
(338, '004', 'Palm Top', 133),
(339, '005', 'Code Breaker Super Komputer', 133),
(340, '006', 'Thinclient', 133),
(341, '007', 'Net Book', 133),
(342, '008', 'Ultra Mobile PC', 133),
(343, '009', 'Tablet PC', 133),
(344, '001', 'Card Reader (Peralatan Mainframe)', 135),
(345, '002', 'Magnetic Tape Unit (Peralatan Mainframe)', 135),
(346, '003', 'Floppy Disk Unit (Peralatan Mainframe)', 135),
(347, '004', 'Storage Modul Disk (Peralatan Mainframe)', 135),
(348, '005', 'Console Unit (Peralatan Mainframe)', 135),
(349, '006', 'CPU (Peralatan Mainframe)', 135),
(350, '007', 'Disk Pack (Peralatan Mainframe)', 135),
(351, '008', 'Hard Copy Console', 135),
(352, '009', 'Serial Printer', 135),
(353, '010', 'Line', 135),
(354, '011', 'Plotter (Peralatan Mainframe)', 135),
(355, '012', 'Hard Disk', 135),
(356, '013', 'Keyboard (Peralatan Mainframe)', 135),
(357, '014', 'Steamer', 135),
(358, '015', 'Data Patch Panel', 135),
(359, '016', 'Paper Tape Reader', 135),
(360, '017', 'Panaboard', 135),
(361, '001', 'Card Reader (Peralatan Mini Komputer)', 136),
(362, '002', 'Magnetic Tape Unit (Peralatan Mini Komputer)', 136),
(363, '003', 'Floppy Disk Unit (Peralatan Mini Komputer)', 136),
(364, '004', 'Storage Modul Disk (Peralatan Mini Komputer)', 136),
(365, '005', 'Console Unit (Peralatan Mini Komputer)', 136),
(366, '006', 'CPU (Peralatan Mini Komputer)', 136),
(367, '007', 'Disk Pack (Peralatan Mini Komputer)', 136),
(368, '008', 'Plotter (Peralatan Mini Komputer)', 136),
(369, '009', 'Scanner (Peralatan Mini Komputer)', 136),
(370, '010', 'Computer Compatible', 136),
(371, '011', 'Viewer (Peralatan Mini Komputer)', 136),
(372, '012', 'Digitizer (Peralatan Mini Komputer)', 136),
(373, '013', 'Keyboard (Peralatan Mini Komputer)', 136),
(374, '014', 'Auto Switch/Data Switch', 136),
(375, '015', 'Cut Sheet Feeder', 136),
(376, '016', 'Speaker Komputer', 136),
(377, '001', 'CPU (Peralatan Personal Komputer)', 137),
(378, '002', 'Monitor', 137),
(379, '003', 'Printer (Peralatan Personal Komputer)', 137),
(380, '004', 'Scanner (Peralatan Personal Komputer)', 137),
(381, '005', 'Plotter (Peralatan Personal Komputer)', 137),
(382, '006', 'Viewer (Peralatan Personal Komputer)', 137),
(383, '007', 'External', 137),
(384, '008', 'Digitizer (Peralatan Personal Komputer)', 137),
(385, '009', 'Keyboard (Peralatan Personal Komputer)', 137),
(386, '010', 'CD Writer', 137),
(387, '011', 'DVD Writer', 137),
(388, '012', 'Firewire Card', 137),
(389, '013', 'Capture Card', 137),
(390, '014', 'LAN Card', 137),
(391, '015', 'External CD/DVD Drive (ROM)', 137),
(392, '016', 'External Floppy Disk Drive', 137),
(393, '017', 'External/Portable Hardisk', 137),
(394, '001', 'Server', 138),
(395, '002', 'Router', 138),
(396, '003', 'Hub', 138),
(397, '004', 'Modem', 138),
(398, '005', 'Netware Interface External', 138),
(399, '006', 'Repeater and Transciever', 138),
(400, '007', 'Head Copy Terminal', 138),
(401, '008', 'Rack Modem', 138),
(402, '009', 'Card Punch', 138),
(403, '010', 'Head Copy Printer', 138),
(404, '011', 'Character Terminal', 138),
(405, '012', 'Graphic Terminal', 138),
(406, '013', 'Terminal', 138),
(407, '014', 'Rak Server', 138),
(408, '015', 'Firewall', 138),
(409, '016', 'Switch Rak', 138),
(410, '017', 'Wanscaller', 138),
(411, '018', 'E-Mail Security', 138),
(412, '019', 'Client Clearing House', 138),
(413, '020', 'CAT 6 Cable', 138),
(414, '021', 'Kabel UTP', 138),
(415, '022', 'Wireless PCI Card', 138),
(416, '023', 'Wireless Access Point', 138),
(417, '024', 'Switch', 138),
(418, '025', 'Hubbel UTP', 138),
(419, '026', 'Access Point', 138),
(420, '027', 'Rackmount', 138),
(421, '028', 'KVM Keyboard Video Monitor', 138),
(422, '029', 'Mobile Modem GSM/CDMA', 138),
(423, '030', 'Network Cable Tester', 138),
(424, '031', 'Jaringan Satpas', 138),
(425, '032', 'NComputing', 138);

-- --------------------------------------------------------

--
-- Table structure for table `aset_unitbidang`
--

CREATE TABLE `aset_unitbidang` (
  `id` bigint NOT NULL,
  `nama_unit` varchar(255) NOT NULL,
  `nama_kepala_dinas` varchar(255) NOT NULL,
  `nip_kepala_dinas` varchar(50) NOT NULL,
  `kota_id` bigint NOT NULL,
  `kode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aset_unitbidang`
--

INSERT INTO `aset_unitbidang` (`id`, `nama_unit`, `nama_kepala_dinas`, `nip_kepala_dinas`, `kota_id`, `kode`) VALUES
(1, 'Dinas Komunikasi dan Informatika', 'Drs. ERWANTO, ME', '196712062000121002', 1, '00');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(25, 'Can add akun', 7, 'add_akun'),
(26, 'Can change akun', 7, 'change_akun'),
(27, 'Can delete akun', 7, 'delete_akun'),
(28, 'Can view akun', 7, 'view_akun'),
(29, 'Can add provinsi', 8, 'add_provinsi'),
(30, 'Can change provinsi', 8, 'change_provinsi'),
(31, 'Can delete provinsi', 8, 'delete_provinsi'),
(32, 'Can view provinsi', 8, 'view_provinsi'),
(33, 'Can add kelompok', 9, 'add_kelompok'),
(34, 'Can change kelompok', 9, 'change_kelompok'),
(35, 'Can delete kelompok', 9, 'delete_kelompok'),
(36, 'Can view kelompok', 9, 'view_kelompok'),
(37, 'Can add jenis', 10, 'add_jenis'),
(38, 'Can change jenis', 10, 'change_jenis'),
(39, 'Can delete jenis', 10, 'delete_jenis'),
(40, 'Can view jenis', 10, 'view_jenis'),
(41, 'Can add objek', 11, 'add_objek'),
(42, 'Can change objek', 11, 'change_objek'),
(43, 'Can delete objek', 11, 'delete_objek'),
(44, 'Can view objek', 11, 'view_objek'),
(45, 'Can add kota', 12, 'add_kota'),
(46, 'Can change kota', 12, 'change_kota'),
(47, 'Can delete kota', 12, 'delete_kota'),
(48, 'Can view kota', 12, 'view_kota'),
(49, 'Can add rincian objek', 13, 'add_rincianobjek'),
(50, 'Can change rincian objek', 13, 'change_rincianobjek'),
(51, 'Can delete rincian objek', 13, 'delete_rincianobjek'),
(52, 'Can view rincian objek', 13, 'view_rincianobjek'),
(53, 'Can add sub rincian objek', 14, 'add_subrincianobjek'),
(54, 'Can change sub rincian objek', 14, 'change_subrincianobjek'),
(55, 'Can delete sub rincian objek', 14, 'delete_subrincianobjek'),
(56, 'Can view sub rincian objek', 14, 'view_subrincianobjek'),
(57, 'Can add sub sub rincian objek', 15, 'add_subsubrincianobjek'),
(58, 'Can change sub sub rincian objek', 15, 'change_subsubrincianobjek'),
(59, 'Can delete sub sub rincian objek', 15, 'delete_subsubrincianobjek'),
(60, 'Can view sub sub rincian objek', 15, 'view_subsubrincianobjek'),
(61, 'Can add rincian barang', 16, 'add_rincianbarang'),
(62, 'Can change rincian barang', 16, 'change_rincianbarang'),
(63, 'Can delete rincian barang', 16, 'delete_rincianbarang'),
(64, 'Can view rincian barang', 16, 'view_rincianbarang'),
(65, 'Can add unit bidang', 17, 'add_unitbidang'),
(66, 'Can change unit bidang', 17, 'change_unitbidang'),
(67, 'Can delete unit bidang', 17, 'delete_unitbidang'),
(68, 'Can view unit bidang', 17, 'view_unitbidang'),
(69, 'Can add bidang', 18, 'add_bidang'),
(70, 'Can change bidang', 18, 'change_bidang'),
(71, 'Can delete bidang', 18, 'delete_bidang'),
(72, 'Can view bidang', 18, 'view_bidang'),
(73, 'Can add aset', 19, 'add_aset'),
(74, 'Can change aset', 19, 'change_aset'),
(75, 'Can delete aset', 19, 'delete_aset'),
(76, 'Can view aset', 19, 'view_aset'),
(77, 'Can add pekerjaan', 20, 'add_pekerjaan'),
(78, 'Can change pekerjaan', 20, 'change_pekerjaan'),
(79, 'Can delete pekerjaan', 20, 'delete_pekerjaan'),
(80, 'Can view pekerjaan', 20, 'view_pekerjaan'),
(81, 'Can add kegiatan', 21, 'add_kegiatan'),
(82, 'Can change kegiatan', 21, 'change_kegiatan'),
(83, 'Can delete kegiatan', 21, 'delete_kegiatan'),
(84, 'Can view kegiatan', 21, 'view_kegiatan'),
(85, 'Can add sub kegiatan', 22, 'add_subkegiatan'),
(86, 'Can change sub kegiatan', 22, 'change_subkegiatan'),
(87, 'Can delete sub kegiatan', 22, 'delete_subkegiatan'),
(88, 'Can view sub kegiatan', 22, 'view_subkegiatan'),
(89, 'Can add ruangan', 23, 'add_ruangan'),
(90, 'Can change ruangan', 23, 'change_ruangan'),
(91, 'Can delete ruangan', 23, 'delete_ruangan'),
(92, 'Can view ruangan', 23, 'view_ruangan'),
(93, 'Can add status kepemilikan', 24, 'add_statuskepemilikan'),
(94, 'Can change status kepemilikan', 24, 'change_statuskepemilikan'),
(95, 'Can delete status kepemilikan', 24, 'delete_statuskepemilikan'),
(96, 'Can view status kepemilikan', 24, 'view_statuskepemilikan'),
(97, 'Can add status kompabilitas', 25, 'add_statuskompabilitas'),
(98, 'Can change status kompabilitas', 25, 'change_statuskompabilitas'),
(99, 'Can delete status kompabilitas', 25, 'delete_statuskompabilitas'),
(100, 'Can view status kompabilitas', 25, 'view_statuskompabilitas');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$zNkA3udlA4pvSmwoNAybay$cB+9uHYB0ChBtlsk7jouj8tFyEPCgWEuOGxH10kIpyw=', '2025-08-06 03:12:52.340551', 1, 'HavidzRidho', '', '', 'havidzridho84487@gmail.com', 1, 1, '2025-07-27 16:58:38.598033');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-07-29 08:27:39.023542', '1', 'Jambi', 1, '[{\"added\": {}}]', 8, 1),
(2, '2025-07-29 08:27:59.994840', '1', 'Tebo', 1, '[{\"added\": {}}]', 12, 1),
(3, '2025-07-29 08:35:12.650290', '1', 'Dinas Komunikasi dan Informatika', 1, '[{\"added\": {}}]', 17, 1),
(4, '2025-07-29 13:42:24.102785', '1', 'Teknologi Informasi dan Komunikasi - Dinas Komunikasi dan Informatika', 1, '[{\"added\": {}}]', 18, 1),
(5, '2025-07-29 13:43:15.580107', '1', 'Dinas Komunikasi dan Informatika', 2, '[{\"changed\": {\"fields\": [\"NIP Kepala Dinas\"]}}]', 17, 1),
(6, '2025-07-29 13:43:58.115021', '1', 'TIK - Teknologi Informasi dan Komunikasi', 1, '[{\"added\": {}}]', 23, 1),
(7, '2025-07-30 14:28:07.456640', '1', 'Dunhill Fine Filter Cut (15.09.1.3.2.05.02.06.060.2025.000001)', 1, '[{\"added\": {}}]', 19, 1),
(8, '2025-08-06 14:56:56.780947', '6', 'ASUS - ROG (15.09.1.3.2.10.01.02.002.2025.000001)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'aset', 'akun'),
(19, 'aset', 'aset'),
(18, 'aset', 'bidang'),
(10, 'aset', 'jenis'),
(21, 'aset', 'kegiatan'),
(9, 'aset', 'kelompok'),
(12, 'aset', 'kota'),
(11, 'aset', 'objek'),
(20, 'aset', 'pekerjaan'),
(8, 'aset', 'provinsi'),
(16, 'aset', 'rincianbarang'),
(13, 'aset', 'rincianobjek'),
(23, 'aset', 'ruangan'),
(24, 'aset', 'statuskepemilikan'),
(25, 'aset', 'statuskompabilitas'),
(22, 'aset', 'subkegiatan'),
(14, 'aset', 'subrincianobjek'),
(15, 'aset', 'subsubrincianobjek'),
(17, 'aset', 'unitbidang'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-07-27 16:51:03.897095'),
(2, 'auth', '0001_initial', '2025-07-27 16:51:59.149664'),
(3, 'admin', '0001_initial', '2025-07-27 16:52:20.684416'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-07-27 16:52:21.313472'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-07-27 16:52:22.437066'),
(6, 'aset', '0001_initial', '2025-07-27 16:54:25.654042'),
(7, 'contenttypes', '0002_remove_content_type_name', '2025-07-27 16:54:37.615269'),
(8, 'auth', '0002_alter_permission_name_max_length', '2025-07-27 16:54:45.933558'),
(9, 'auth', '0003_alter_user_email_max_length', '2025-07-27 16:54:47.756165'),
(10, 'auth', '0004_alter_user_username_opts', '2025-07-27 16:54:47.919670'),
(11, 'auth', '0005_alter_user_last_login_null', '2025-07-27 16:54:54.212629'),
(12, 'auth', '0006_require_contenttypes_0002', '2025-07-27 16:54:54.468358'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2025-07-27 16:54:54.640708'),
(14, 'auth', '0008_alter_user_username_max_length', '2025-07-27 16:55:00.593048'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2025-07-27 16:55:07.037338'),
(16, 'auth', '0010_alter_group_name_max_length', '2025-07-27 16:55:07.634624'),
(17, 'auth', '0011_update_proxy_permissions', '2025-07-27 16:55:08.653937'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2025-07-27 16:55:15.350418'),
(19, 'sessions', '0001_initial', '2025-07-27 16:55:21.696733'),
(20, 'aset', '0002_pekerjaan_aset_jenis_belanja_and_more', '2025-07-28 06:48:25.861369'),
(21, 'aset', '0003_ruangan_aset_ruangan', '2025-07-29 04:31:23.107236'),
(22, 'aset', '0004_remove_ruangan_nama_kepala_ruangan_and_more', '2025-07-29 13:24:34.992110'),
(23, 'aset', '0005_remove_aset_nama_barang_aset_merek_tipe_and_more', '2025-07-30 16:48:42.568399'),
(24, 'aset', '0006_statuskepemilikan_statuskompabilitas_bidang_kode_and_more', '2025-08-05 12:15:48.694724'),
(25, 'aset', '0007_remove_aset_bahan_remove_aset_nomor_pabrik_and_more', '2025-08-05 14:59:02.410110'),
(26, 'aset', '0008_aset_status_kepemilikan_aset_status_kompabilitas', '2025-08-05 15:53:54.286664');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9mtbuq3lszvde1ylur2xgw4pxumjph43', '.eJxVjMsOwiAQRf-FtSGU5-DSvd9AhgGlaiAp7cr479KkC93ec859s4DbWsLW8xLmxM5sYqffLSI9c91BemC9N06trssc-a7wg3Z-bSm_Lof7d1Cwl1FroTwkowGtUyjy5EBL6VGbBAQaPLlhUBbOob1ZlQclayNYaUjJxD5frKI2mQ:1ugw7A:QTvzoLCRf5luZFdKQdhXr5iDl__lAoOU_UVKucO7CM8', '2025-08-13 02:00:20.016850'),
('ck85hu2w2nxuh64yjb8w650uhs31zwkc', '.eJxVjMsOwiAQRf-FtSGU5-DSvd9AhgGlaiAp7cr479KkC93ec859s4DbWsLW8xLmxM5sYqffLSI9c91BemC9N06trssc-a7wg3Z-bSm_Lof7d1Cwl1FroTwkowGtUyjy5EBL6VGbBAQaPLlhUBbOob1ZlQclayNYaUjJxD5frKI2mQ:1ujUaD:7vzBMB1YBig8Pqwi0FrTF7jyeZG5Jb6T9OBoPlYXnZM', '2025-08-20 03:12:53.215221'),
('cpl8jppdtx8for0afvu333kjgalvmv3s', '.eJxVjMsOwiAQRf-FtSGU5-DSvd9AhgGlaiAp7cr479KkC93ec859s4DbWsLW8xLmxM5sYqffLSI9c91BemC9N06trssc-a7wg3Z-bSm_Lof7d1Cwl1FroTwkowGtUyjy5EBL6VGbBAQaPLlhUBbOob1ZlQclayNYaUjJxD5frKI2mQ:1uhQ6X:E73YGa--AjaLIcUXxTd_rNZZS9q8bF8RNpTXWnUbZ34', '2025-08-14 10:01:41.221308'),
('u00vssrmcy188n6js9j9dxki2mnrttqr', '.eJxVjMsOwiAQRf-FtSGU5-DSvd9AhgGlaiAp7cr479KkC93ec859s4DbWsLW8xLmxM5sYqffLSI9c91BemC9N06trssc-a7wg3Z-bSm_Lof7d1Cwl1FroTwkowGtUyjy5EBL6VGbBAQaPLlhUBbOob1ZlQclayNYaUjJxD5frKI2mQ:1ugHZV:awLwnBUTmdEKvrxnFP9XziGVcB7AxvP9JAORUBoZ7U0', '2025-08-11 06:42:53.513578'),
('w3vixtm48hiax391n05e3obmnoywd40j', '.eJxVjMsOwiAQRf-FtSGU5-DSvd9AhgGlaiAp7cr479KkC93ec859s4DbWsLW8xLmxM5sYqffLSI9c91BemC9N06trssc-a7wg3Z-bSm_Lof7d1Cwl1FroTwkowGtUyjy5EBL6VGbBAQaPLlhUBbOob1ZlQclayNYaUjJxD5frKI2mQ:1ugk7w:bKYmRs-BGW3aEwofRdDh6frh-DBzn3UnuWq50URJ2Vo', '2025-08-12 13:12:20.902679');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aset_akun`
--
ALTER TABLE `aset_akun`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `aset_aset`
--
ALTER TABLE `aset_aset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_aset` (`kode_aset`),
  ADD KEY `aset_aset_didaftarkan_oleh_id_e32e6f85_fk_auth_user_id` (`didaftarkan_oleh_id`),
  ADD KEY `aset_aset_bidang_id_31dd445c_fk_aset_bidang_id` (`bidang_id`),
  ADD KEY `aset_aset_klasifikasi_id_6012094a_fk_aset_subsubrincianobjek_id` (`klasifikasi_id`),
  ADD KEY `aset_aset_unit_bidang_id_e9d794cc_fk_aset_unitbidang_id` (`unit_bidang_id`),
  ADD KEY `aset_aset_sub_kegiatan_id_78d98a33_fk_aset_subkegiatan_id` (`sub_kegiatan_id`),
  ADD KEY `aset_aset_ruangan_id_50585985_fk_aset_ruangan_id` (`ruangan_id`),
  ADD KEY `aset_aset_status_kepemilikan_i_f9a0cbce_fk_aset_stat` (`status_kepemilikan_id`),
  ADD KEY `aset_aset_status_kompabilitas__10087e34_fk_aset_stat` (`status_kompabilitas_id`);

--
-- Indexes for table `aset_bidang`
--
ALTER TABLE `aset_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_bidang_unit_bidang_id_6a54b05e_fk_aset_unitbidang_id` (`unit_bidang_id`);

--
-- Indexes for table `aset_jenis`
--
ALTER TABLE `aset_jenis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_jenis_kelompok_id_31452792_fk_aset_kelompok_id` (`kelompok_id`);

--
-- Indexes for table `aset_kegiatan`
--
ALTER TABLE `aset_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_kegiatan_pekerjaan_id_e5237620_fk_aset_pekerjaan_id` (`pekerjaan_id`);

--
-- Indexes for table `aset_kelompok`
--
ALTER TABLE `aset_kelompok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_kelompok_akun_id_e5d36a23_fk_aset_akun_id` (`akun_id`);

--
-- Indexes for table `aset_kota`
--
ALTER TABLE `aset_kota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_kota_provinsi_id_759041cb_fk_aset_provinsi_id` (`provinsi_id`);

--
-- Indexes for table `aset_objek`
--
ALTER TABLE `aset_objek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_objek_jenis_id_a2fef2d2_fk_aset_jenis_id` (`jenis_id`);

--
-- Indexes for table `aset_pekerjaan`
--
ALTER TABLE `aset_pekerjaan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_pekerjaan` (`nama_pekerjaan`);

--
-- Indexes for table `aset_provinsi`
--
ALTER TABLE `aset_provinsi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `aset_rincianbarang`
--
ALTER TABLE `aset_rincianbarang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_barang` (`nama_barang`),
  ADD UNIQUE KEY `kode_lengkap` (`kode_lengkap`),
  ADD KEY `aset_rincianbarang_sub_sub_rincian_obje_f10982f3_fk_aset_subs` (`sub_sub_rincian_objek_id`);

--
-- Indexes for table `aset_rincianobjek`
--
ALTER TABLE `aset_rincianobjek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_rincianobjek_objek_id_fe159cdf_fk_aset_objek_id` (`objek_id`);

--
-- Indexes for table `aset_ruangan`
--
ALTER TABLE `aset_ruangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_ruangan_bidang_id_f5a0e3b4_fk_aset_bidang_id` (`bidang_id`);

--
-- Indexes for table `aset_statuskepemilikan`
--
ALTER TABLE `aset_statuskepemilikan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `aset_statuskompabilitas`
--
ALTER TABLE `aset_statuskompabilitas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `aset_subkegiatan`
--
ALTER TABLE `aset_subkegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_subkegiatan_kegiatan_id_fcba0877_fk_aset_kegiatan_id` (`kegiatan_id`);

--
-- Indexes for table `aset_subrincianobjek`
--
ALTER TABLE `aset_subrincianobjek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_subrincianobjek_rincian_objek_id_be0d224e_fk_aset_rinc` (`rincian_objek_id`);

--
-- Indexes for table `aset_subsubrincianobjek`
--
ALTER TABLE `aset_subsubrincianobjek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aset_subsubrincianob_sub_rincian_objek_id_d959fb70_fk_aset_subr` (`sub_rincian_objek_id`);

--
-- Indexes for table `aset_unitbidang`
--
ALTER TABLE `aset_unitbidang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_unit` (`nama_unit`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD KEY `aset_unitbidang_kota_id_7dbd687a_fk_aset_kota_id` (`kota_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aset_akun`
--
ALTER TABLE `aset_akun`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aset_aset`
--
ALTER TABLE `aset_aset`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `aset_bidang`
--
ALTER TABLE `aset_bidang`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aset_jenis`
--
ALTER TABLE `aset_jenis`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `aset_kegiatan`
--
ALTER TABLE `aset_kegiatan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aset_kelompok`
--
ALTER TABLE `aset_kelompok`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `aset_kota`
--
ALTER TABLE `aset_kota`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aset_objek`
--
ALTER TABLE `aset_objek`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `aset_pekerjaan`
--
ALTER TABLE `aset_pekerjaan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aset_provinsi`
--
ALTER TABLE `aset_provinsi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aset_rincianbarang`
--
ALTER TABLE `aset_rincianbarang`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT for table `aset_rincianobjek`
--
ALTER TABLE `aset_rincianobjek`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `aset_ruangan`
--
ALTER TABLE `aset_ruangan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aset_statuskepemilikan`
--
ALTER TABLE `aset_statuskepemilikan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aset_statuskompabilitas`
--
ALTER TABLE `aset_statuskompabilitas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aset_subkegiatan`
--
ALTER TABLE `aset_subkegiatan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `aset_subrincianobjek`
--
ALTER TABLE `aset_subrincianobjek`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `aset_subsubrincianobjek`
--
ALTER TABLE `aset_subsubrincianobjek`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT for table `aset_unitbidang`
--
ALTER TABLE `aset_unitbidang`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aset_aset`
--
ALTER TABLE `aset_aset`
  ADD CONSTRAINT `aset_aset_bidang_id_31dd445c_fk_aset_bidang_id` FOREIGN KEY (`bidang_id`) REFERENCES `aset_bidang` (`id`),
  ADD CONSTRAINT `aset_aset_didaftarkan_oleh_id_e32e6f85_fk_auth_user_id` FOREIGN KEY (`didaftarkan_oleh_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `aset_aset_klasifikasi_id_6012094a_fk_aset_subsubrincianobjek_id` FOREIGN KEY (`klasifikasi_id`) REFERENCES `aset_subsubrincianobjek` (`id`),
  ADD CONSTRAINT `aset_aset_ruangan_id_50585985_fk_aset_ruangan_id` FOREIGN KEY (`ruangan_id`) REFERENCES `aset_ruangan` (`id`),
  ADD CONSTRAINT `aset_aset_status_kepemilikan_i_f9a0cbce_fk_aset_stat` FOREIGN KEY (`status_kepemilikan_id`) REFERENCES `aset_statuskepemilikan` (`id`),
  ADD CONSTRAINT `aset_aset_status_kompabilitas__10087e34_fk_aset_stat` FOREIGN KEY (`status_kompabilitas_id`) REFERENCES `aset_statuskompabilitas` (`id`),
  ADD CONSTRAINT `aset_aset_sub_kegiatan_id_78d98a33_fk_aset_subkegiatan_id` FOREIGN KEY (`sub_kegiatan_id`) REFERENCES `aset_subkegiatan` (`id`),
  ADD CONSTRAINT `aset_aset_unit_bidang_id_e9d794cc_fk_aset_unitbidang_id` FOREIGN KEY (`unit_bidang_id`) REFERENCES `aset_unitbidang` (`id`);

--
-- Constraints for table `aset_bidang`
--
ALTER TABLE `aset_bidang`
  ADD CONSTRAINT `aset_bidang_unit_bidang_id_6a54b05e_fk_aset_unitbidang_id` FOREIGN KEY (`unit_bidang_id`) REFERENCES `aset_unitbidang` (`id`);

--
-- Constraints for table `aset_jenis`
--
ALTER TABLE `aset_jenis`
  ADD CONSTRAINT `aset_jenis_kelompok_id_31452792_fk_aset_kelompok_id` FOREIGN KEY (`kelompok_id`) REFERENCES `aset_kelompok` (`id`);

--
-- Constraints for table `aset_kegiatan`
--
ALTER TABLE `aset_kegiatan`
  ADD CONSTRAINT `aset_kegiatan_pekerjaan_id_e5237620_fk_aset_pekerjaan_id` FOREIGN KEY (`pekerjaan_id`) REFERENCES `aset_pekerjaan` (`id`);

--
-- Constraints for table `aset_kelompok`
--
ALTER TABLE `aset_kelompok`
  ADD CONSTRAINT `aset_kelompok_akun_id_e5d36a23_fk_aset_akun_id` FOREIGN KEY (`akun_id`) REFERENCES `aset_akun` (`id`);

--
-- Constraints for table `aset_kota`
--
ALTER TABLE `aset_kota`
  ADD CONSTRAINT `aset_kota_provinsi_id_759041cb_fk_aset_provinsi_id` FOREIGN KEY (`provinsi_id`) REFERENCES `aset_provinsi` (`id`);

--
-- Constraints for table `aset_objek`
--
ALTER TABLE `aset_objek`
  ADD CONSTRAINT `aset_objek_jenis_id_a2fef2d2_fk_aset_jenis_id` FOREIGN KEY (`jenis_id`) REFERENCES `aset_jenis` (`id`);

--
-- Constraints for table `aset_rincianbarang`
--
ALTER TABLE `aset_rincianbarang`
  ADD CONSTRAINT `aset_rincianbarang_sub_sub_rincian_obje_f10982f3_fk_aset_subs` FOREIGN KEY (`sub_sub_rincian_objek_id`) REFERENCES `aset_subsubrincianobjek` (`id`);

--
-- Constraints for table `aset_rincianobjek`
--
ALTER TABLE `aset_rincianobjek`
  ADD CONSTRAINT `aset_rincianobjek_objek_id_fe159cdf_fk_aset_objek_id` FOREIGN KEY (`objek_id`) REFERENCES `aset_objek` (`id`);

--
-- Constraints for table `aset_ruangan`
--
ALTER TABLE `aset_ruangan`
  ADD CONSTRAINT `aset_ruangan_bidang_id_f5a0e3b4_fk_aset_bidang_id` FOREIGN KEY (`bidang_id`) REFERENCES `aset_bidang` (`id`);

--
-- Constraints for table `aset_subkegiatan`
--
ALTER TABLE `aset_subkegiatan`
  ADD CONSTRAINT `aset_subkegiatan_kegiatan_id_fcba0877_fk_aset_kegiatan_id` FOREIGN KEY (`kegiatan_id`) REFERENCES `aset_kegiatan` (`id`);

--
-- Constraints for table `aset_subrincianobjek`
--
ALTER TABLE `aset_subrincianobjek`
  ADD CONSTRAINT `aset_subrincianobjek_rincian_objek_id_be0d224e_fk_aset_rinc` FOREIGN KEY (`rincian_objek_id`) REFERENCES `aset_rincianobjek` (`id`);

--
-- Constraints for table `aset_subsubrincianobjek`
--
ALTER TABLE `aset_subsubrincianobjek`
  ADD CONSTRAINT `aset_subsubrincianob_sub_rincian_objek_id_d959fb70_fk_aset_subr` FOREIGN KEY (`sub_rincian_objek_id`) REFERENCES `aset_subrincianobjek` (`id`);

--
-- Constraints for table `aset_unitbidang`
--
ALTER TABLE `aset_unitbidang`
  ADD CONSTRAINT `aset_unitbidang_kota_id_7dbd687a_fk_aset_kota_id` FOREIGN KEY (`kota_id`) REFERENCES `aset_kota` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
