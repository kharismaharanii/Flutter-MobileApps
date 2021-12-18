-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Des 2021 pada 15.42
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mybengkel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `aksesoris`
--

CREATE TABLE `aksesoris` (
  `id` int(50) NOT NULL,
  `namabarang` text NOT NULL,
  `spesifikasi` text NOT NULL,
  `harga` int(50) NOT NULL,
  `tipe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `aksesoris`
--

INSERT INTO `aksesoris` (`id`, `namabarang`, `spesifikasi`, `harga`, `tipe`) VALUES
(1, 'WHEEL LIST STICKER', 'Plastik ABS', 56000, '-'),
(2, 'STICKER FR MFENDER ADV150', 'Vinyl sticker dengan warna silver', 45000, '-'),
(3, 'PANEL STEP FLOOR ADV150', 'Rubber EPDM dan Stainless Steel', 560000, '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `apparel`
--

CREATE TABLE `apparel` (
  `id` int(50) NOT NULL,
  `namabarang` text NOT NULL,
  `spesifikasi` text NOT NULL,
  `harga` int(50) NOT NULL,
  `tipe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `apparel`
--

INSERT INTO `apparel` (`id`, `namabarang`, `spesifikasi`, `harga`, `tipe`) VALUES
(1, 'ON ROAD LEATHER JACKET', 'Terbuat dari kulit asli dilengkapi protector di lengan dan pundak', 1600000, '-'),
(2, 'HONDA RACING RED FULL FACE', 'Material dari reinforced plastic & air ventilation, double visor comfort', 575000, '-'),
(3, 'FAB BOMBER JACKET', 'Material menggunakan polyester taslan dengan desain bomber jacket', 350000, '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `datakatalog`
--

CREATE TABLE `datakatalog` (
  `id` int(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `namabarang` varchar(255) NOT NULL,
  `harga` int(50) NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `datakatalog`
--

INSERT INTO `datakatalog` (`id`, `nama`, `alamat`, `namabarang`, `harga`, `jumlah`) VALUES
(7, 'Kharismaharani', 'Mango Street', 'CHAIN CAM', 35000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dataservice`
--

CREATE TABLE `dataservice` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `haritanggal` varchar(255) NOT NULL,
  `tipesepeda` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dataservice`
--

INSERT INTO `dataservice` (`id`, `nama`, `haritanggal`, `tipesepeda`) VALUES
(12, 'Khrismaharani', '31/03/2022', 'Scoopy');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `level`) VALUES
(1, 'user', 'user', 'user'),
(2, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oli`
--

CREATE TABLE `oli` (
  `id` int(50) NOT NULL,
  `namabarang` text NOT NULL,
  `tipe` text NOT NULL,
  `harga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `oli`
--

INSERT INTO `oli` (`id`, `namabarang`, `tipe`, `harga`) VALUES
(1, 'MPX2 0.8L', 'Motor type matic', 48000),
(2, 'SPX2 0.8L', 'Motor type matic', 60000),
(3, 'SPX1 1L', 'Motor type cub dan sport', 67000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sparepart`
--

CREATE TABLE `sparepart` (
  `id` int(50) NOT NULL,
  `namabarang` text NOT NULL,
  `tipe` text NOT NULL,
  `harga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sparepart`
--

INSERT INTO `sparepart` (`id`, `namabarang`, `tipe`, `harga`) VALUES
(1, 'BRG BALL RADIAL 6301U L', 'LF5301RS', 27000),
(2, 'SCREW TAPPING 4X12', '9390324310', 1000),
(3, 'CHAIN CAM', 'HC25H-86L', 35000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `aksesoris`
--
ALTER TABLE `aksesoris`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apparel`
--
ALTER TABLE `apparel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `datakatalog`
--
ALTER TABLE `datakatalog`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dataservice`
--
ALTER TABLE `dataservice`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oli`
--
ALTER TABLE `oli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sparepart`
--
ALTER TABLE `sparepart`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `aksesoris`
--
ALTER TABLE `aksesoris`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `apparel`
--
ALTER TABLE `apparel`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `datakatalog`
--
ALTER TABLE `datakatalog`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `dataservice`
--
ALTER TABLE `dataservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `oli`
--
ALTER TABLE `oli`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `sparepart`
--
ALTER TABLE `sparepart`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
