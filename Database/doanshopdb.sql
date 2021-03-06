-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2021 at 08:05 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doandb`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdondathang`
--

DROP TABLE IF EXISTS `chitietdondathang`;
CREATE TABLE IF NOT EXISTS `chitietdondathang` (
  `MaChiTietDonDatHang` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SoLuong` int DEFAULT NULL,
  `GiaBan` int DEFAULT NULL,
  `MaDonDatHang` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaSanPham` int NOT NULL,
  PRIMARY KEY (`MaChiTietDonDatHang`),
  KEY `fk_ChiTietDonDatHang_DonDatHang1_idx` (`MaDonDatHang`),
  KEY `fk_ChiTietDonDatHang_SanPham1_idx` (`MaSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
CREATE TABLE IF NOT EXISTS `dondathang` (
  `MaDonDatHang` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NgayLap` datetime DEFAULT NULL,
  `TongThanhTien` int DEFAULT NULL,
  `MaTaiKhoan` int NOT NULL,
  `MaTinhTrang` int NOT NULL,
  PRIMARY KEY (`MaDonDatHang`),
  KEY `fk_DonDatHang_TaiKhoan1_idx` (`MaTaiKhoan`),
  KEY `fk_DonDatHang_TinhTrang1_idx` (`MaTinhTrang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dondathang`
--

INSERT INTO `dondathang` (`MaDonDatHang`, `NgayLap`, `TongThanhTien`, `MaTaiKhoan`, `MaTinhTrang`) VALUES
('00100100', '2019-12-23 00:00:00', 50000000, 1, 4),
('00100101', '2019-12-24 00:00:00', 11040000, 1, 4),
('00100102', '2019-12-24 00:00:00', 900000, 1, 4),
('00100103', '2019-12-24 00:00:00', 9870000, 1, 4),
('010121001', '2021-01-01 17:35:14', 5000000, 7, 2),
('010121002', '2021-01-01 17:35:42', 38970000, 7, 2),
('010121003', '2021-01-01 17:54:14', 5000000, 8, 4),
('010121004', '2021-01-01 21:11:19', 78000000, 9, 3),
('060121001', '2021-01-06 00:36:31', 400000, 1, 1),
('080121001', '2021-01-08 22:51:02', 112000, 1, 1),
('100121001', '2021-01-10 01:43:54', 91470000, 1, 1),
('100121002', '2021-01-10 03:05:24', 740000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `MaLoaiSanPham` int NOT NULL AUTO_INCREMENT,
  `TenLoaiSanPham` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `BiXoa` int DEFAULT NULL,
  PRIMARY KEY (`MaLoaiSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSanPham`, `TenLoaiSanPham`, `BiXoa`) VALUES
(1, 'Laptop', 0),
(2, 'M??n h??nh m??y t??nh', 0),
(3, 'PC', 0),
(4, 'Linh ki???n ??i???n t???', 0),
(5, 'Ph??? ki???n ??i???n t???', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loaitaikhoan`
--

DROP TABLE IF EXISTS `loaitaikhoan`;
CREATE TABLE IF NOT EXISTS `loaitaikhoan` (
  `MaLoaiTaiKhoan` int NOT NULL AUTO_INCREMENT,
  `TenLoaiTaiKhoan` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaLoaiTaiKhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loaitaikhoan`
--

INSERT INTO `loaitaikhoan` (`MaLoaiTaiKhoan`, `TenLoaiTaiKhoan`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `MaTK` int NOT NULL,
  `MaSP` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`MaTK`, `MaSP`, `content`) VALUES
(1, 2, 'haha'),
(1, 7, 'Kh??ng t???t'),
(7, 2, 'R???t ttos'),
(1, 76, 'Kh??ng ???????c ?????p cho l???m'),
(1, 76, 'Kh??ng ???????c ?????p cho l???m'),
(1, 21, '?????p qu?? :v'),
(1, 21, '?????p qu?? :v');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSanPham` int NOT NULL AUTO_INCREMENT,
  `TenSanPham` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `HinhURL` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `GiaSanPham` int DEFAULT NULL,
  `NgayNhap` datetime DEFAULT NULL,
  `SoLuongTon` int DEFAULT NULL,
  `SoLuongBan` int DEFAULT NULL,
  `MoTa` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `MaLoaiSanPham` int NOT NULL,
  `SoLuotXem` int DEFAULT NULL,
  `BiXoa` int DEFAULT NULL,
  PRIMARY KEY (`MaSanPham`),
  KEY `fk_SanPham_LoaiSanPham1_idx` (`MaLoaiSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=1493 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `HinhURL`, `GiaSanPham`, `NgayNhap`, `SoLuongTon`, `SoLuongBan`, `MoTa`, `MaLoaiSanPham`, `SoLuotXem`, `BiXoa`) VALUES
(1, 'Laptop GAMING MSI GS75 STEALTH 9SE Core i7-97', '1.1.jpg', 39500000, '2020-12-12 00:00:00', 30, 15, 'CPU: Intel?? Core??? i7-9750H (12M Cache), 2.6 Ghz up to 4.5 Ghz\r\nRAM: 32 GB DDR4 2667 MHz\r\n??? c???ng: 512 GB SSD + 512 GB SSD\r\nCard ????? h???a: NVIDIA GeForce RTX 2060 6 GB\r\nM??n h??nh: 17.3-inch FHD - IPS (1920 x 1080) 240HZ\r\nT??nh tr???ng: Like new 99%\r\nB???o h??nh: 12 th??ng', 1, 55, 0),
(2, 'Laptop HP ZBook 17 G4 Core i7-7700HQ/ 16 GB R', '1.2.jpg', 31500000, '2020-12-12 00:00:00', 50, 20, 'CPU: Intel?? Core??? i7 - 7700HQ (6M Cache), 2.8 Ghz up to 3.8 Ghz\r\nRAM: 16 GB DDR4 21333 MHz\r\n??? c???ng: 512 GB SSD\r\nCard ????? h???a: NVIDIA Quadro P3000 6GB\r\nM??n h??nh: 17.3 inch 16:9, FHD - AG - IPS (1920 X 1080)\r\nT??nh tr???ng: Like new 99%\r\nB???o h??nh: 12 th??ng', 1, 26, 0),
(3, 'Laptop Dell Precision 5530 2-in-1 Core i7 - 8', '1.3.jpg', 30500000, '2020-12-12 00:00:00', 10, 8, 'CPU: Intel?? Core??? i7 - 8706G (8M Cache), 3.10 Ghz up to 4.10 Ghz\r\nRAM: 8 GB DDR4 2400 MHz\r\n??? c???ng: 256 GB M.2 PCIe NVMe Solid State Drive\r\nCard ????? h???a: Radeon??? Pro WX Vega M GL 4GB\r\nM??n h??nh: 15.6-inch FHD (1920 x 1080) InfinityEdge touch display; 100% sRGB 400-nits\r\nT??nh tr???ng: Like new fullbox\r\nB???o h??nh: 12 th??ng', 1, 78, 0),
(4, 'Laptop Dell Precision 7520 Core i7-7700HQ/ 32', '1.4.jpg', 27500000, '2020-12-12 00:00:00', 17, 12, 'CPU: Intel?? Core??? i7 - 7700HQ (6M Cache), 2.8 Ghz up to 3.8 Ghz\r\nRAM: 32 GB DDR4 2133 MHz\r\n??? c???ng: 256 GB SSD\r\nCard ????? h???a: NVIDIA Quadro M1200 4G\r\nM??n h??nh: 15.6 inch 16:9, FHD - IPS - AG (1920 X 1080)\r\nT??nh tr???ng: Brandnew 100%\r\nB???o h??nh: 12 th??ng', 1, 61, 0),
(5, 'Laptop HP ZBook 15U G5 Core i7-8550U/ 32 GB R', '1.5.jpg', 26500000, '2020-12-12 00:00:00', 10, 5, 'CPU: Intel?? Core??? i7 - 8550U (8M Cache), 1.8 Ghz up to 4.0 Ghz\r\nRAM: 32 GB DDR4 2400 MHz\r\n??? c???ng: 512 GB SSD\r\nCard ????? h???a: AMD Radeon Pro WX 3100 2GB\r\nM??n h??nh: 15.6 inch, FHD - IPS (1920 X 1080)\r\nT??nh tr???ng: Like new 99%\r\nB???o h??nh: 12 th??ng', 1, 72, 0),
(6, 'Laptop Lenovo Thinkpad X1 Carbon Gen 7 Core i', '1.6.jpg', 24900000, '2020-12-12 00:00:00', 20, 14, 'CPU: Intel?? Core??? i5 - 8365U (6M Cache), 1.6 Ghz up to 4.1 Ghz\r\nRAM: 8 GB LPDDR3 2133 MHz\r\n??? c???ng: 256 GB SSD\r\nCard ????? h???a: Intel?? UHD Graphics 620\r\nM??n h??nh: 14 inch 16:9, FHD - IPS (1920 x 1080)\r\nT??nh tr???ng: NEW 100% NO BOX\r\nB???o h??nh: 12 th??ng', 1, 56, 0),
(7, 'Laptop Dell Latitude 7410 Core i5-10310U/ 16 ', '1.7.png', 24500000, '2020-12-12 00:00:00', 30, 4, 'CPU: Intel?? Core??? i5 - 10310U (6M Cache), 1.7 Ghz up to 4.4 Ghz\r\nRAM: 16 GB DDR4 2400 MHz\r\n??? c???ng: M.2 256GB PCIe NVMe SSD\r\nCard ????? h???a: Intel?? UHD Graphics\r\nM??n h??nh: 14.0\" FHD - IPS (1920 x 1080) AG\r\nT??nh tr???ng: Brand New\r\nB???o h??nh: 12 th??ng', 1, 32, 0),
(9, 'Laptop Dell Precision 3530 Core i7-8850H/ 16 ', '1.9.png', 23000000, '2020-12-12 00:00:00', 12, 10, 'CPU: CPU: Intel?? Core??? i7 - 8850H (9M Cache), 2.6 Ghz up to 4.6 Ghz\r\nRAM: 16 GB DDR4 2666 MHz\r\n??? c???ng: 512 GB SSD\r\nCard ????? h???a: Nvidia Quadro P600 4GB\r\nM??n h??nh: 15.6 inch 16:9, IPS - FHD (1920 X 1080)\r\nT??nh tr???ng: Like new 97%\r\nB???o h??nh: 12 th??ng', 1, 12, 0),
(10, 'Laptop Dell Precision 7510 Core i7-6820HQ/ 8 ', '1.10.jpg', 19000000, '2020-12-12 00:00:00', 18, 6, 'CPU: Intel?? Core??? i7 - 6820HQ (8M Cache), 2.7 Ghz up to 3.6 Ghz\r\nRAM: 8 GB DDR4 2133 MHz\r\n??? c???ng: 256 GB SSD\r\nCard ????? h???a: NVIDIA Quadro M2000M 4GB\r\nM??n h??nh: 15.6 inch 16:9, FHD - IPS - AG (1920 X 1080)\r\nT??nh tr???ng: Like new 97%\r\nB???o h??nh: 12 th??ng', 1, 34, 0),
(11, 'Laptop Dell Latitude 5410 Core i5-10310U/ 16 ', '1.11.jpg', 18900000, '2020-12-12 00:00:00', 30, 15, 'CPU: Intel?? Core??? i5 - 10310U (6M Cache), 1.7 Ghz up to 4.4 Ghz\r\nRAM: 16 GB DDR4 2400 MHz\r\n??? c???ng: M.2 256GB PCIe NVMe SSD\r\nCard ????? h???a: Intel?? UHD Graphics\r\nM??n h??nh: 14.0\" FHD - IPS (1920 x 1080) AG\r\nT??nh tr???ng: Like new 97%\r\nB???o h??nh: 12 th??ng', 1, 22, 0),
(12, 'Laptop Dell Latitude 5590 Core i7-8650U/ 8 GB', '1.12.jpg', 17900000, '2020-12-12 00:00:00', 33, 12, 'CPU: Intel?? Core??? i7 - 8650U (8M Cache), 1.9 Ghz up to 4.2 Ghz\r\nRAM: 8 GB DDR4 2400 MHz\r\n??? c???ng: 512 GB SSD\r\nCard ????? h???a: Intel?? UHD Graphics 620\r\nM??n h??nh: 15.6 inch 16:9, FHD - IPS (1920 x 1080)\r\nT??nh tr???ng: Like new 99%\r\nB???o h??nh: 12 th??ng', 1, 34, 0),
(13, 'Laptop Lenovo Thinkpad T480 Core i5-8350U/ 16', '1.13.jpg', 17500000, '2020-12-12 00:00:00', 7, 2, 'CPU: Intel?? Core??? i5 - 8350U (6M Cache), 1.7 Ghz up to 3.6 Ghz\r\nRAM: 16 GB DDR4 2400MHz\r\n??? c???ng: 512 GB SSD M2 PCLe\r\nCard ????? h???a: Intel?? UHD Graphics 620\r\nM??n h??nh: 14 inch 16:9, IPS - AG - FHD (1920 X 1080)\r\nT??nh tr???ng: Likenew 97%\r\nB???o h??nh: 12 th??ng', 1, 12, 0),
(14, 'Laptop Dell Latitude 5480 Core i7-7820HQ/ 8 G', '1.14.jpg', 17500000, '2020-12-12 00:00:00', 76, 45, 'CPU: Intel?? Core??? i7 - 7820HQ (8M Cache), 2.9 Ghz up to 3.9 Ghz\r\nRAM: 8 GB DDR4 2133 MHz\r\n??? c???ng: 256 GB SSD\r\nCard ????? h???a: NVIDIA GeForce 930MX 2GB\r\nM??n h??nh: 14 inch 16:9, FHD - AG (1920 X 1080)\r\nT??nh tr???ng: Like new 97%\r\nB???o h??nh: 12 th??ng', 1, 21, 0),
(15, 'Laptop Dell Latitude 7400 Core i5 - 8365U/ 16', '1.15.jpg', 17200000, '2020-12-12 00:00:00', 44, 34, 'CPU: Intel?? Core??? i5 - 8365U (8M Cache), 1.6 Ghz up to 4.1 Ghz\r\nRAM: 16 GB DDR4 2400 MHz\r\n??? c???ng: M.2 256 GB PCIe NVMe\r\nCard ????? h???a: Intel?? UHD Graphics 620\r\nM??n h??nh: 14.0\" FHD (1920 x 1080) AG\r\nT??nh tr???ng: Like new 99%\r\nB???o h??nh: 12 th??ng', 1, 76, 0),
(16, 'Laptop Dell Latitude 5300 2in1 Core i5 - 8365', '1.16.jpg', 17000000, '2020-12-12 00:00:00', 56, 12, 'CPU: Intel?? Core??? i5 - 8365U (8M Cache), 1.6 Ghz up to 4.1 Ghz\r\nRAM: 16 GB DDR4 2400 MHz\r\n??? c???ng: 256 GB SSD\r\nCard ????? h???a: Intel?? UHD Graphics 620\r\nM??n h??nh: 13.3\" FHD - IPS (1920 x 1080) Touchscreen\r\nT??nh tr???ng: Like new 99%\r\nB???o h??nh: 12 th??ng', 1, 44, 0),
(17, 'M??n h??nh Dell UltraSharp 32\'\' Ultra HD 4K UP3', '2.1.png', 30490000, '2020-12-12 00:00:00', 9, 8, 'K??ch th?????c: 32 inch\r\n????? ph??n gi???i: 3840 x 2160 (4K)\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i nhanh: 6 ms\r\nB???o h??nh: 36 th??ng', 2, 32, 0),
(18, 'M??n h??nh Dell 30\" UP3017', '2.2.png', 24990000, '2020-12-12 00:00:00', 89, 37, 'K??ch th?????c: 30 inch\r\n????? ph??n gi???i: 2560 x 1600 ( 16:10 )\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 6 ms\r\nB???o h??nh: 36 th??ng', 2, 37, 0),
(19, 'M??n h??nh Dell Ultrasharp 34\" U3415W', '2.3.jpg', 18500000, '2020-12-12 00:00:00', 54, 39, 'K??ch th?????c: 34 inch\r\n????? ph??n gi???i: 3440 x 1440\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 5 ms\r\nB???o h??nh: 36 th??ng', 2, 38, 0),
(20, 'M??n h??nh Dell 27\" U2718Q', '2.4.jpg', 12900000, '2020-12-12 00:00:00', 71, 11, 'K??ch th?????c: 27 inch\r\n????? ph??n gi???i: 3840 x 2160\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 5 ms\r\nB???o h??nh: 36 th??ng', 2, 20, 0),
(21, 'Dell UltraSharp 27 USB-C Hub Monitor - U2721D', '2.5.jpg', 10990000, '2020-12-12 00:00:00', 23, 13, 'K??ch th?????c: 27 inch ????? ph??n gi???i: QHD LED 2560x1440 G??c nh??n: 178 H / 178 V Th???i gian ph???n h???i nhanh: 5 ms C???ng m???ng: RJ45 B???o h??nh: 36 th??ng', 2, 40, 0),
(22, 'M??n h??nh Cong 31.5\" MSI Optix AG32CV - NEW', '2.6.png', 7400000, '2020-12-12 00:00:00', 44, 20, 'Th????ng hi???u: MSI\r\nK??ch th?????c: 31.5 inch\r\n????? ph??n gi???i: 1920 x 1080 ( 16:9 )\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 1 ms\r\nB???o h??nh: 36 th??ng', 2, 32, 0),
(23, 'M??n h??nh Dell 25\" U2520D - NEW Ch??nh H??ng', '2.7.jpg', 8690000, '2020-12-12 00:00:00', 32, 21, 'K??ch th?????c: 25 inch\r\n????? ph??n gi???i: 2560 x 1440 ( 16:9 )\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 5 ms\r\nB???o h??nh: 36 th??ng', 2, 12, 0),
(24, 'M??n h??nh HKC 27\" MB27T1Q - NEW Ch??nh H??ng', '2.8.jpg', 6000000, '2020-12-12 00:00:00', 11, 8, 'Th????ng hi???u: HKC\r\nK??ch th?????c: 27 inch\r\n????? ph??n gi???i: 2560 x 1440\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 8 ms\r\nB???o h??nh: 24 th??ng', 2, 22, 0),
(25, 'M??n h??nh Cong 27\" MSI Optix G27C5 - NEW Ch??nh', '2.9.jpg', 5900000, '2020-12-12 00:00:00', 43, 27, 'Th????ng hi???u: MSI\r\nK??ch th?????c: 27 inch\r\n????? ph??n gi???i: 1920 x 1080 ( 16:9 )\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 1 ms\r\nB???o h??nh: 36 th??ng', 2, 15, 0),
(26, 'M??n h??nh Dell Gaming 24\" S2419HGF', '2.10.png', 5890000, '2020-12-12 00:00:00', 27, 21, 'K??ch th?????c: 24 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 160 H / 170 V\r\nTh???i gian ph???n h???i ??i???n h??nh: 1 ms\r\nB???o h??nh: 36 th??ng', 2, 19, 0),
(27, 'M??n h??nh Dell 24\" U2419H', '2.11.jpg', 5690000, '2020-12-12 00:00:00', 56, 11, 'K??ch th?????c: 24 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 8 ms\r\nB???o h??nh: 36 th??ng', 2, 40, 0),
(28, 'M??n h??nh Dell 27\" P2719H - NEW Ch??nh H??ng', '2.12.jpg', 5500000, '2020-12-12 00:00:00', 11, 9, 'K??ch th?????c: 27 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 5 ms\r\nB???o h??nh: 36 th??ng', 2, 28, 0),
(29, 'M??n h??nh Cong HKC 31.5\" M32A5F - NEW Ch??nh H??', '2.13.jpg', 5500000, '2020-12-12 00:00:00', 100, 50, 'Th????ng hi???u: HKC\r\nK??ch th?????c: 31.5 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 8 ms\r\nB???o h??nh: 24 th??ng', 2, 38, 0),
(30, 'M??n h??nh Dell 23.8\" U2419H - NEW Ch??nh H??ng', '2.14.jpg', 5300000, '2020-12-12 00:00:00', 45, 23, 'K??ch th?????c: 23.8 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 8 ms\r\nB???o h??nh: 36 th??ng', 2, 40, 0),
(31, 'M??n h??nh Viewsonic 27\" VX2776 - IPs ????? H???a vi', '2.15.jpg', 4840000, '2020-12-12 00:00:00', 56, 32, 'K??ch th?????c: 27 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 4 ms\r\nB???o h??nh: 36 th??ng', 2, 32, 0),
(32, 'M??n h??nh LG 27\" 27MP59G-P - NEW Full Box', '2.16.jpg', 4400000, '2020-12-12 00:00:00', 67, 55, 'K??ch th?????c: 27 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 5 ms\r\nB???o h??nh: 24 th??ng', 2, 21, 0),
(33, 'M??n h??nh Dell 24\" P2419H', '2.17.jpg', 4290000, '2020-12-12 00:00:00', 67, 23, 'K??ch th?????c: 24 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 5 ms\r\nB???o h??nh: 36 th??ng', 2, 11, 0),
(34, 'M??n h??nh Dell 27\" E2720H', '2.18.jpg', 4290000, '2020-12-12 00:00:00', 34, 21, 'K??ch th?????c: 27 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 8 ms\r\nB???o h??nh: 36 th??ng', 2, 14, 0),
(35, 'M??n h??nh Viewsonic 24\" VX2476', '2.19.jpg', 3600000, '2020-12-12 00:00:00', 66, 32, 'K??ch th?????c: 24 inch\r\n????? ph??n gi???i: 1920 x 1080\r\nG??c nh??n: 178 H / 178 V\r\nTh???i gian ph???n h???i: 4 ms\r\nB???o h??nh: 36 th??ng', 2, 17, 0),
(36, 'M??n h??nh Dell 23.8\" E2420H', '2.20.jpg', 3300000, '2020-12-12 00:00:00', 12, 8, 'K??ch th?????c: 23.8 inch ????? ph??n gi???i: 1920 x 1080 G??c nh??n: 178 H / 178 V Th???i gian ph???n h???i: 8 ms B???o h??nh: 36 th??ng', 2, 31, 0),
(37, 'Dell Alienware Aurora Ryzen??? Edition R10 Gami', '3.1.jpg', 35900000, '2020-12-12 00:00:00', 58, 43, 'Motherboard: DELL Alienware Aurora R10 Series Intel Z370 Express Chipset\r\nProcessor: AMD Ryzen??? 5 3500 (6-Core, 16MB L3 Cache, Max Boost Clock of 4.1GHz)\r\nGraphics Card: AMD?? Radeon??? RX 5300 3GB\r\nMemory: 8 GB HyperX DDR4 XMP at 3200 MHz\r\nHard Drive: 256 GB SSD Nvme + 1 TB HDD NEW\r\nOperating System: Windows 10 Pro 64bit English\r\nT??nh tr???ng: Like New Full Box\r\nB???o h??nh: 12 th??ng 1 ?????i 1 - T???n N??i TPHCM', 3, 19, 0),
(38, 'Dell Alienware Gaming PC Desktop Aurora R8', '3.2.jpg', 33500000, '2020-12-12 00:00:00', 120, 110, 'Motherboard: DELL Alienware Aurora R8 Series Intel Z370 Express Chipset\r\nProcessor: Intel Core i7-9700K 3.6GHz (8-core, 12MB cache, up to 4.9GHz)\r\nGraphics Card: Inno3D NVIDIA GeForce GTX 1060 6GB GDDR5 192-Bit | BN\r\nMemory: 16GB DDR4 3000MHz\r\nHard Drive: 256 GB SSD Nvme + 1 TB HDD NEW\r\nOperating System: Windows 10 Pro 64bit English\r\nT??nh tr???ng: Like New Full Box\r\nB???o h??nh: 12 th??ng 1 ?????i 1 - T???n N??i TPHCM', 3, 21, 0),
(39, 'Dell Alienware Gaming PC Desktop Aurora R9 In', '3.3.jpg', 26900000, '2020-12-12 00:00:00', 152, 11, 'Motherboard: DELL Alienware Aurora R9 Series Intel Z370\r\nProcessor: 9th Gen Intel?? Core??? i3 - 9100F (12M Cache, 8-core ) 3.6 GHz to 4.9 GHz\r\nGraphics Card: NVIDIA?? GeForce?? GTX 1660 Ti 6 GB GDDR6\r\nMemory: 16GB DDR4 2666MHz\r\nHard Drive: 256 GB M.2 PCIe SSD + 1 TB HDD NEW\r\nOperating System: Windows 10 Pro 64bit English\r\nT??nh tr???ng: Like New Full Box 99%\r\nB???o h??nh: 12 th??ng 1 ?????i 1 - BH T???n N??i TPHCM', 3, 23, 0),
(40, 'Dell G5 5090 Core i5-9400/ 16 GB RAM/ 256 GB ', '3.4.jpg', 22000000, '2020-12-12 00:00:00', 65, 27, 'Motherboard: Dell motherboard intel?? H370 Express Chipset\r\nProcessor: 9th Gen Intel?? Core??? i5 - 9400 (9M Cache) 2.9 GHz to 4.1 GHz\r\nOperating System: Windows 10 Home 64bit English\r\nGraphics Card: NVIDIA?? GeForce?? GTX 1660 Ti 6 GB GDDR6\r\nMemory: 16 GB DDR4 2666MHz\r\nHard Drive: 256 GB M.2 PCIe NVMe SSD + 1 TB HDD\r\nT??nh tr???ng: Like new\r\nB???o h??nh: 24 th??ng', 3, 25, 0),
(41, 'Dell Inspiron 3881 MT Core i5-10400/ Ram 8Gb/', '3.5.jpg', 35000000, '2020-12-12 00:00:00', 68, 5, 'Mainboard: Dell Chipset Intel CML PCH-H H470\r\nCPU: Intel Core i5 10400 2.9Ghz Turbo Up to 4.3Ghz / 12MB / 6 Cores 12 Threads\r\nT???n Nhi???t Kh??: Dell 3881 Ti??u Chu???n\r\nRAM: 8 GB DDR4 2666Mhz\r\n??? c???ng: 512GB M.2 PCIe NVMe SSD\r\nCard ????? h???a: Intel UHD Graphics 630\r\nPSU: 260W CS Th???c\r\nH??? ??i???u H??nh: Windows 10 license\r\nB???o h??nh: B???o H??nh Ch??nh H??ng - G??i BH 1 n??m t???n n??i mi???n ph?? TPHCM', 3, 27, 0),
(42, 'Dell OptiPlex 3080 SFF Core i5-10500/ Ram 4Gb', '3.6.png', 13200000, '2020-12-12 00:00:00', 18, 15, 'Mainboard: Dell Chipset Intel B460\r\nCPU: Intel Core i5 10500 3.1Ghz Turbo Up to 4.5Ghz / 12MB / 6 Cores 12 Threads\r\nT???n Nhi???t Kh??: Dell Optiplex 3080 Ti??u chu???n\r\nRAM: 4 GB DDR4 2666Mhz\r\n??? c???ng: HDD 1TB SATA 7200rpm\r\nCard ????? h???a: Intel UHD Graphics 630\r\nPSU: 200W CS Th???c\r\nH??? ??i???u H??nh: Windows 10 Pro\r\nB???o h??nh: B???o H??nh Ch??nh H??ng - G??i BH 1 n??m t???n n??i mi???n ph?? TPHCM', 3, 10, 0),
(43, 'Dell OptiPlex 7440 All-in-One Core i5-6500T/ ', '3.7.jpg', 11000000, '2020-12-12 00:00:00', 22, 21, 'Mainboard: Dell AIO 7440 - Socket 1151\r\nCPU: Intel?? Core??? i5-6500T up to 3.10 GHz, 6 MB Cache\r\nRAM: 8GB DDR4 2133Mhz\r\n??? c???ng: 256 GB SSD\r\nCard ????? h???a: Intel HD Graphics 530\r\nM??n h??nh: 23 inch LED IPS Full HD 1920 1080 Anti Glare Ch???ng ch??i\r\nK??m Theo: Ph??m + Chu???t kh??ng d??y + Wifi + Loa + Webcame\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 Th??ng 1 ?????i 1', 3, 15, 0),
(44, 'Dell OptiPlex 9020 All-in-One Core i5-4570s/ ', '3.8.jpg', 8900000, '2020-12-12 00:00:00', 28, 18, 'Mainboard: Dell AIO 9020 - Socket 1150\r\nCPU: Intel?? Core??? i5-4570s up to 3.60 GHz, 6 MB Cache\r\nRAM: 8 GB DDR3 1600Mhz\r\n??? c???ng: 120 GB SSD 6G/s NEW\r\nCard ????? h???a: Intel HD Graphics 4600\r\nM??n h??nh: 23 inch Full HD 1920 1080 Anti Glare Ch???ng ch??i\r\nK??m Theo: Ph??m + Chu???t kh??ng d??y + Wifi + Loa + Webcame\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 Th??ng 1 ?????i 1', 3, 17, 0),
(45, 'Dell OptiPlex 9010 MT Xeon E3-1240v2/ 8GB DDR', '3.9.jpg', 8700000, '2020-12-12 00:00:00', 15, 7, 'Mainboard: Dell Optiplex Chipset Q77 - 4 Khe Ram\r\nCPU: Intel?? Xeon?? Processor E3-1240v2 4 Core 8 Threads 3.4 GHz Turbo 3.8Ghz 8 MB SmartCache\r\nT???n Nhi???t Kh??: Dell 9010 Ti??u Chu???n\r\nRAM: 8GB DDR3 1600Mhz\r\n??? c???ng: 120 GB SSD + 500Gb HDD NEW\r\nCard ????? h???a: Nvidia Geforce GTX 1050 2G DDR5 128bit\r\nPSU: 275W CS Th???c\r\nB???o h??nh: 12 th??ng 1 ?????i 1 - T???n N??i TPHCM', 3, 17, 0),
(46, 'HP ProOne 600 G1 All-in-One Core i3-4160/ 8GB', '3.10.jpg', 7100000, '2020-12-12 00:00:00', 29, 25, 'Mainboard: HP AIO 600 G1 Socket 1150\r\nCPU: Intel?? Core??? i3-4160 up to 3.60 GHz, 3 MB Cache\r\nRAM: 8GB DDR3 1600Mhz\r\n??? c???ng: 1TB HDD 7200rp\r\nCard ????? h???a: Intel HD Graphics 4400\r\nM??n h??nh: 21.5 inch Full HD 1920 1080 Anti Glare Ch???ng ch??i\r\nK??m Theo: Ph??m + Chu???t kh??ng d??y + Wifi + Loa + Webcame\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 Th??ng - T???n N??i TPHCM', 3, 66, 0),
(47, 'HP EliteDesk 800 G1 Tower Xeon E3-1220v3/ 8GB', '3.11.jpg', 6900000, '2020-12-12 00:00:00', 12, 8, 'Mainboard: HP Chipset Q87 - 4 Khe Ram\r\nCPU: Intel?? Xeon?? Processor E3-1220v3 4 Core 3.10 GHz Tubo 3.50Ghz 8 MB SmartCache\r\nT???n Nhi???t Kh??: HP 800 G1 Ti??u Chu???n\r\nRAM: 8GB DDR3 1600Mhz\r\n??? c???ng: SSD 120Gb + HDD 500Gb NEW\r\nCard ????? h???a: NVIDIA Geforce GT 710 2G\r\nPSU: 320W\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 Th??ng 1 ?????i 1 - T???n N??i TPHCM', 3, 55, 0),
(48, 'Dell OptiPlex 3050 SFF Core i3-7100/ 8GB DDR4', '3.12.jpg', 6600000, '2020-12-12 00:00:00', 8, 3, 'Mainboard: Dell Optiplex Chipset Intel B250 - 2 Khe Ram DDR4\r\nCPU: Intel?? Core??? i3-7100 Up to 3.90 GHz, 3 MB Cache\r\nT???n Nhi???t Kh??: Dell Optiplex 3050 Ti??u chu???n\r\nRAM: 8GB DDR4 2400mhz\r\n??? c???ng: SSD 120G 6G/s NEW\r\nCard ????? h???a: Intel HD Graphics 630\r\nPSU: 180W CS Th???c\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: Like NEW FULL BOX - 12 th??ng 1 ?????i 1 - T???n N??i TPHCM', 3, 24, 0),
(49, 'Dell OptiPlex 790 MT Core i5-2320/ 8GB DDR3/ ', '3.13.jpg', 6300000, '2020-12-12 00:00:00', 32, 21, 'Mainboard: Dell Optiplex Chipset Q67 - 4 Khe Ram\r\nCPU: Intel?? Core??? i5-2320 up to 3.30 GHz, 6 MB Cache\r\nT???n Nhi???t Kh??: Dell 790 Ti??u Chu???n\r\nRAM: 8 GB DDR3 1333Mhz\r\n??? c???ng: 120 GB SSD + 500Gb HDD NEW\r\nCard ????? h???a: NVIDIA Quadro 2000 1G DDR5 128Bit\r\nPSU: 275W CS Th???c\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 th??ng 1 ?????i 1 TPHCM', 3, 23, 0),
(50, ' HP Compaq Pro 6300 All-In-One Core i5-3470s/', '3.14.jpeg', 6200000, '2020-12-12 00:00:00', 54, 36, 'CPU: Intel?? Core??? i5-3470S up to 3.60 GHz, 6 MB Cache\r\nRAM: 8 GB DDR3\r\n??? c???ng: 500 GB HDD\r\nCard ????? h???a: Intel HD Graphics 2500\r\nM??n h??nh: 21.5 inch FULL HD 1920 x 1080 Anti Glare Ch???ng ch??i\r\nK??m Theo: Ph??m + Chu???t kh??ng d??y + Wifi + Loa + Webcame\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 th??ng', 3, 43, 0),
(51, 'HP Compaq 8200 Elite All-in-One Core i5-2320/', '3.15.jpg', 5700000, '2020-12-12 00:00:00', 36, 25, 'Mainboard: HP AIO 8200 Socket 1155 CPU: Intel?? Core??? i5-2320 up to 3.30 GHz, 6 MB Cache RAM: 4 GB DDR3 ??? c???ng: 500 GB HDD Card ????? h???a: Intel HD Graphics 2000 M??n h??nh: 23 inch Full HD 1920 1080 Anti Glare Ch???ng ch??i Ngu???n AC: Adapter 19,5v C??ng su???t Max 150W H??? ??i???u H??nh: Windows 7/10 license B???o h??nh: 12 th??ng', 3, 0, 0),
(52, 'All-in-One Lenovo ThinkCentre M73z Pentium G3', '3.16.jpg', 4700000, '2020-12-12 00:00:00', 67, 27, 'CPU: Intel?? Pentium?? G3220 3.0Ghz 3M Cache\r\nRAM: 4 GB DDR3L\r\n??? c???ng: 500 GB HDD\r\nCard ????? h???a: Intel HD Graphics 2500\r\nM??n h??nh: 20 inch HD+ 1600 x 900 Anti Glare Ch???ng ch??i\r\nK??m Theo: Ph??m + Chu???t + Wifi\r\nB???o h??nh: 12 th??ng', 3, 0, 0),
(53, 'HP EliteDesk 800 G1 SFF Core i3-4160/ 8GB DDR', '3.17.jpg', 4200000, '2020-12-12 00:00:00', 35, 23, 'Mainboard: HP Chipset Q87 - 4 Khe Ram\r\nCPU: Intel?? Core??? i3-4160 up to 3.60 GHz, 3 MB Cache\r\nT???n Nhi???t Kh??: HP 800 G1 Ti??u Chu???n\r\nRAM: 8GB DDR3 1600Mhz\r\n??? c???ng: SSD 120Gb\r\nCard ????? h???a: Intel HD Graphics 4400\r\nPSU: 320W\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 Th??ng 1 ?????i 1 - T???n N??i TPHCM', 3, 19, 0),
(54, 'Dell OptiPlex 9020 SFF Core i3-4160/ 8GB DDR3', '3.18.jpg', 4100000, '2021-00-00 00:00:00', 24, 12, 'Mainboard: Dell Optiplex Chipset Q87 - 4 Khe Ram\r\nCPU: Intel?? Core??? i3-4160 up to 3.60 GHz, 3 MB Cache\r\nT???n Nhi???t Kh??: Dell 9020 Ti??u Chu???n\r\nRAM: 8GB DDR3 1600Mhz\r\n??? c???ng: 120 GB SSD NEW 6G/s\r\nCard ????? h???a: Intel HD Graphics 4400\r\nPSU: 255W\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 th??ng 1 ?????i 1 TPHCM', 3, 8, 0),
(55, 'HP Compaq Elite 8300 SFF Core i5-3470s/ 8GB D', '3.19.jpeg', 4100000, '2020-12-12 00:00:00', 34, 21, 'Mainboard: HP Chipset Q77 - 4 Khe Ram\r\nCPU: Intel?? Core??? i5-3470s up to 3.60 GHz, 6 MB Cache\r\nT???n Nhi???t Kh??: HP 8300 SFF Ti??u Chu???n\r\nRAM: 8GB DDR3 1600Mhz\r\n??? c???ng: 120 GB SSD NEW\r\nCard ????? h???a: Intel HD Graphics 4000\r\nPSU: 240W CS th???c\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 th??ng 1 ?????i 1 - T???n N??i TPHCM', 3, 5, 0),
(56, 'All-in-One Lenovo ThinkCentre M72z Core i3-21', '3.20.jpg', 3900000, '2020-12-12 00:00:00', 25, 20, 'CPU: Intel?? Core??? i3-2100 2 Core 4 Threads 3.10 GHz, 3 MB Cache\r\nRAM: 4 GB DDR3\r\n??? c???ng: 250 GB HDD\r\nCard ????? h???a: Intel HD Graphics 2500\r\nM??n h??nh: 20 inch HD+ 1600 x 900 Anti Glare Ch???ng ch??i\r\nK??m Theo: Ph??m + Chu???t + Wifi\r\nH??? ??i???u H??nh: Windows 7/10 license\r\nB???o h??nh: 12 th??ng 1 ?????i 1', 3, 6, 0),
(57, 'NVIDIA Quadro RTX 8000', '4.1.png', 168000000, '2020-12-12 00:00:00', 47, 43, 'GPU: Quadro RTX 8000\r\nKi???n Tr??c: Turing\r\nB??? nh???: 48GB GDDR6\r\nMemory Bus: 384 bit\r\nBandwidth: 672.0 GB/s\r\nRender Config:\r\nShading Units: 4608 CUDA Core (Tensor Cores 576)\r\nTMUs: 288\r\nROPs: 96\r\nClock Speeds:\r\nBase Clock 1: 395 MHz\r\nBoost Clock: 1770 MHz\r\nMemory Clock: 1750 MHz 14 Gbps effective\r\nBoard Design:\r\nSlot Width: Dual-slot\r\nTDP: 260 W\r\nSuggested PSU: 600 W\r\nOutputs: 4x DisplayPort 1x USB Type-C\r\nPower Connectors: 1x 6-pin + 1x 8-pin\r\nB???o h??nh: 36 th??ng - NEW', 4, 77, 0),
(58, 'NVIDIA Quadro RTX 6000 24G', '4.2.png', 128000000, '2020-12-12 00:00:00', 25, 20, 'GPU: Quadro RTX 6000\r\nB??? nh???: 24GB GDDR6\r\nMemory Bus: 384 bit\r\nB???o h??nh: 36 th??ng', 4, 4, 0),
(59, 'NVIDIA TITAN RTX 24Gb DDR6 384Bit', '4.3.jpg', 79000000, '2020-12-12 00:00:00', 48, 29, 'GPU: Titan RTX\r\nKi???n Tr??c: Turing\r\nB??? nh???: 24GB GDDR6\r\nMemory Bus: 384 bit\r\nBandwidth: 672.0 GB/s\r\nRender Config:\r\nShading Units: 4608 CUDA Core (Tensor Cores 576)\r\nTMUs: 288\r\nROPs: 96\r\nClock Speeds:\r\nBase Clock 1: 1350 MHz\r\nBoost Clock: 1770 MHz\r\nMemory Clock: 1750 MHz 14 Gbps effective\r\nBoard Design:\r\nSlot Width: Dual-slot\r\nTDP: 280 W\r\nSuggested PSU: 600 W\r\nOutputs: 1x HDMI 3x DisplayPort 1x USB Type-C\r\nPower Connectors: 2x 8-pin\r\nB???o h??nh: NEW - BH 3 N??m', 4, 12, 0),
(60, 'NVIDIA GeForce RTX 3090 24G GDDR6X 384Bit', '4.4.png', 44500000, '2020-12-12 00:00:00', 12, 8, 'GPU: GeForce RTX??? 3090\r\nKi???n Tr??c: Ampere\r\nB??? nh???: 24GB GDDR6X\r\nMemory Bus: 384 bit\r\nBandwidth: 936,2 GB / gi??y\r\nShading Units: 10496 Cuda Core (Tensor Cores 328)\r\nTMUs: 328\r\nROPs: 112\r\nClock Speeds::\r\nBase Clock 1: 1395 MHz\r\nBoost Clock: 1725 MHz (+2%)\r\nMemory Clock: 1219 MHz 19.5 Gbps effective\r\nBoard Design:\r\nSlot Width:: Triple-slot\r\nTDP: 350 W\r\nSuggested PSU: 750 W\r\nOutputs: 1x HDMI 3x DisplayPort\r\nPower Connectors:: 2x 8-pin\r\nB???o h??nh: 36 th??ng', 4, 48, 0),
(61, 'NVIDIA GeForce RTX 2080 Ti GAMING OC 11 GB', '4.5.png', 32000000, '2020-12-12 00:00:00', 99, 77, 'GPU: GeForce RTX??? 2080 Ti B??? nh???: 11 GB DDR6 Memory Bus: 352 bit B???o h??nh: 36 th??ng', 4, 51, 0),
(62, 'NVIDIA Quadro M6000 24G DDR5 384Bit', '4.6.jpg', 28000000, '2020-12-12 00:00:00', 76, 23, 'GPU: Quadro M6000 B??? nh???: 24 GB GDDR5 Memory Bus: 384 bit CUDA: 3072 Bandwidth: 317.4 GB/s FP32 (float) performance: 6.844 TFLOPS FP64 (double) performance: 213.9 GFLOPS (1:32) Outputs: 1x DVI 4x DisplayPort Power Connectors: 1x 8-pin B???o h??nh: LIKE NEW - BH 12 th??ng 1 ?????i 1', 4, 48, 0),
(63, 'NVIDIA GeForce RTX 2080 Super 8GB', '4.7.png', 19800000, '2020-12-12 00:00:00', 48, 32, 'GPU: GeForce RTX??? 2080 Super\r\nB??? nh???: 8 GB DDR6\r\nMemory Bus: 256 bit\r\nShading Units: 3072 CUDA Core\r\nB???o h??nh: NEW - BH 3 N??m', 4, 25, 1),
(64, 'CPU Intel Xeon E5-2699v4', '4.8.jpg', 17000000, NULL, 33, 32, 'T???c ????? x??? l??: 2.20 GHz\r\nT???n s??? turbo t???i ??a: 3.60 GHz\r\nCache: 55 MB SmartCache\r\nS??? l??i: 22\r\nS??? lu???ng: 44\r\nB???o h??nh: 24 th??ng', 4, 3, 0),
(65, 'CPU Intel Xeon Gold 6130', '4.9.jpg', 17000000, '2021-02-10 02:13:35', 56, 12, 'Th????ng hi???u: Intel\r\nS??? hi???u CPU: Xeon Gold 6130 Phi??n b???n ES\r\nC??ng ngh???: 14 nm\r\nTh??? h???: Skylake\r\nSocket: FCLGA3647\r\nTDP: 125 W\r\nB??? nh??? h??? tr???: DDR4 2666mhz\r\nDung l?????ng b??? nh??? t???i ??a: 768 GB\r\nT???c ????? x??? l??: 2.10 GHz\r\nT???n s??? turbo t???i ??a: 3.70 GHz\r\nCache: 22 MB SmartCache\r\nS??? l??i: 16\r\nS??? lu???ng: 32\r\nB???o h??nh: 24 th??ng', 4, 200, 0),
(66, 'Asus Strix GTX 1080 Ti 11 GB DDR5X 352Bit', '4.10.jpg', 14500000, '2021-01-09 00:15:45', 56, 12, 'GPU: GeForce GTX 1080 Ti\r\nB??? nh???: 11 GB GDDR5X\r\nMemory Bus: 352 bit\r\nCUDA: 3584\r\nBandwidth: 484.4 GB/s\r\nFP32 (float) performance: 12.06 TFLOPS\r\nFP64 (double) performance: 377.0 GFLOPS (1:32)\r\nOutputs: 1x DVI 1x HDMI 3x DisplayPort\r\nPower Connectors: 2x 8-pin\r\nB???o h??nh: Like New - BH 12 Th??ng 1 ?????i 1', 4, 5, 0),
(67, 'NVIDIA Quadro P4000 8G', '4.11.jpg', 14000000, '2021-01-01 00:17:57', 88, 88, 'GPU: Quadro P4000\r\nB??? nh???: 8G GDDR5\r\nMemory Bus: 256 bit\r\nCUDA: 1792\r\nBandwidth: 243.3 GB/s\r\nFP16 (half) performance: 82.88 GFLOPS (1:64)\r\nFP32 (float) performance: 5.304 TFLOPS\r\nFP64 (double) performance: 165.8 GFLOPS (1:32)\r\nOutputs: 4x DisplayPort (4096x2160@60Hz)\r\nC??ng Su???t Ngu???n y??u c???u: 350 W\r\nPower Connectors: 1x 6-pin\r\nB???o h??nh: 12 th??ng 1 ?????i 1 - Like New', 4, 9, 0),
(69, 'NVIDIA GeForce RTX 2060 SUPER GAMING OC 8 GB', '4.14.jpg', 11900000, '2021-01-09 00:20:31', 54, 22, 'GPU: GeForce RTX??? 2060 SUPER\r\nB??? nh???: 8 GB GDDR6\r\nMemory Bus: 256 bit\r\nB???o h??nh: 36 th??ng', 4, 20, 0),
(70, 'NVIDIA Quadro K6000 12GB DDR5 384Bit', '4.15.jpg', 11000000, '2021-01-09 00:21:47', 44, 21, 'GPU: Quadro K6000\r\nB??? nh???: 12 GB GDDR5\r\nMemory Bus: 384 bit\r\nCUDA: 2880\r\nBandwidth: 288.4 GB/s\r\nFP32 (float) performance: 5.196 TFLOPS\r\nFP64 (double) performance: 1.732 TFLOPS (1:3)\r\nOutputs: 2x DVI 2x DisplayPort (4096x2160@60Hz)\r\nPower Connectors: 2x 6-pin\r\nB???o h??nh: LIKE NEW - BH 12 th??ng 1 ?????i 1', 4, 71, 0),
(71, 'Dell precision dual usb-c thunderbolt dock - ', '5.1.jpg', 5900000, '2021-01-09 00:25:42', 44, 9, 'General:\r\nLo???i thi???t b???: Tr???m k???t n???i\r\nDocking Interface: USB-C / Thunderbolt 3\r\nVideo Interfaces: VGA, HDMI, DP, Mini DP, Thunderbolt\r\nPower:\r\nPower Device: Power adapter\r\nData Link Protocol: Ethernet, Fast Ethernet, Gigabit Ethernet\r\nDimensions (WxDxH): 5.7 in x 5.7 in x 2 in\r\nM??u: ??en\r\nC??n n???ng: 25.39 oz\r\nPower: Power adapter 210 Watt AC 120/230 V (50/60 Hz)\r\nT????ng th??ch: Precision Mobile Workstation 7530, 7730\r\nT??nh tr???ng: New fullbox', 5, 70, 0),
(72, 'Dell Thunderbolt Dock (TB16) with 240W Adapte', '5.2.png', 4900000, '2021-01-07 00:26:18', 12, 5, 'General:\r\nLo???i thi???t b???: Tr???m k???t n???i\r\nGiao di???n k???t n???i: Thunderbolt\r\nGiao di???n video: VGA, HDMI, DP, Mini DP, Thunderbolt\r\nNetworking: Gigabit Ethernet\r\nM??u: ??en\r\nC??n n???ng: 25.39 oz\r\nPower: Power adapter 240 Watt AC 120/230 V (50/60 Hz)\r\nT????ng th??ch: Latitude 5290 2-in-1, 5480, 5491, 5580, 5591, 7280, 7285 2-in-1, 7290, 7380, 7390, 7390 2-in-1, 7480, 7490; Precision Mobile Workstation 3520, 3530, 5520, 5530, 5530 2-in-1, 7520, 7530, 7720, 7730; XPS 13 9360, 13 9365 2-in-1, 13 9370, 15 9560, 15 9570, 15 9575 2-in-1\r\nT??nh tr???ng: New fullbox', 5, 76, 0),
(73, 'Dell Dock WD15 (USB Type-C) with 180W Adapter', '5.3.jpg', 4100000, '2021-01-08 00:27:46', 33, 22, 'General:\r\nLo???i thi???t b???: Tr???m k???t n???i\r\nC???ng USB: USB 2.0 - (2), USB 3.0 - (3)\r\nGiao di???n video: VGA, mDP, HDMI\r\nNetworking: Gigabit Ethernet\r\nAudio/Headphone: 3.5 mm Combo - (1), 3.5 mm Speaker Out (1)\r\nM??u: ??en\r\nC??n n???ng: 420 g\r\nAC Adapter: 130W/180W\r\nDimensions: 6.1 x 4.3 x 0.83 inches\r\nT??nh tr???ng: New fullbox', 5, 34, 0),
(74, 'Dell HYBRID ADAPTER + POWER BANK USB-C PH45W1', '5.4.jpg', 3200000, '2021-01-07 00:28:49', 9, 7, 'Lo???i thi???t b???: External battery pack + power adapter\r\nM??u s???c: Black, silver\r\nBattery:\r\nC??ng ngh??? Pin: 4-cell Lithium Ion\r\nC??ng su???t: 12800 mAh\r\nLinh tinh:\r\nCables Included: Power adapter - external, Power cable 91.4 cm, USB-C cable 1.25 m\r\nDimensions & Weight: Width 7.8 cm Depth 17.3 cm Height 2.25 cm\r\nC??n n???ng: 697.15 g', 5, 45, 0),
(75, 'Dell Adapter-USB-C to HDMI/VGA/Ethernet/USB 3', '5.5.jpg', 1590000, '2021-01-09 00:30:12', 76, 45, 'General:\r\nLo???i thi???t b???: B??? chuy???n ?????i video b??n ngo??i\r\nC??c c???ng k???t n???i: VGA, USB 3.0, LAN, HDMI\r\nBus type: USB-C\r\nM??u: ??en\r\nT????ng th??ch: Dell Latitude 7490, Workstation Dell 5510, 5520, 5530, Dell XPS 12,13\r\nT??nh tr???ng: New fullbox', 5, 75, 0),
(76, 'T??i Ch???ng S???c ESR HAND-BAG MACBOOK AIR', '5.6.jpg', 900000, '2021-01-09 00:33:06', 12, 8, 'Xu???t x??? th????ng hi???u: ESR HAND-BAG\r\nCh???t li???u: v???i t???ng h???p\r\nKh??? n??ng ch???ng n?????c: T???t\r\nK??ch th?????c: 13\"\r\nM??u s???c: x??m, n??u', 5, 17, 0),
(77, 'T??i ch???ng s???c 15\" JCPAL Nylon Business Style ', '5.7.jpg', 740000, '2021-01-09 00:34:10', 13, 89, 'Xu???t x??? th????ng hi???u: JCPAL\r\nCh???t li???u: V???i Nylon Hydrophobic\r\nNg??n ?????ng laptop: 15\"\r\nKh??? n??ng ch???ng n?????c: T???t\r\nNg??n: 1 ch??nh, 1 ph???', 5, 11, 0),
(78, 'T??i Ch???ng S???c 13\" Jinya Nylon City', '5.8.jpg', 650000, '2021-01-01 00:35:48', 4, 98, 'Xu???t x??? th????ng hi???u: Jinya\r\nCh???t li???u: V???i Nylon c?? kh??? n??ng ch???ng th???m, tr?????t n?????c kh??ng b???i cao c???p.\r\nNg??n ?????ng laptop: c??p, s???c, c??c v???t d???ng kh??c nh?? b??t, Smartphone, ch??a kh??a hay th??? xe???\r\nKh??? n??ng ch???ng n?????c: T???t\r\nK??ch th?????c: 13\"\r\nM??u s???c: ??en, cam, xanh', 5, 22, 0),
(79, 'T??i Ch???ng S???c JCPAL NEOPRENE', '5.9.jpg', 600000, '2021-01-08 00:36:50', 12, 88, 'Xu???t x??? th????ng hi???u: JCPAL NEOPRENE\r\nCh???t li???u: 100% Nylon\r\nKh??? n??ng ch???ng n?????c: T???t\r\nK??ch th?????c: 13\" , 15\"\r\nM??u s???c: x??m, xanh l??, xanh d????ng', 5, 33, 0),
(80, 'Dell Adapter: 7.4mm Barrel to USB-C', '5.10.jpg', 550000, '2021-01-08 00:37:38', 8, 0, 'General:\r\nLo???i thi???t b???: Power adapter\r\nT??nh n??ng v?? ?????c ??i???m: For 45W - 65W barrel power adapters\r\nC??c c???ng k???t n???i: 24 pin USB-C - male, Power DC jack 7.4 mm - female\r\n??i???n ??p ?????nh m???c: 5/20 V\r\nM??u: ??en\r\nT????ng th??ch: Dell Latitude 14-15in 5480, 5580, 7275, 7280, 7480, Dell Precision Mobile Workstation 3520, 5520, Dell XPS 12 9250, 13 9350, 13 9365 2-in-1, 15 9550', 5, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sanphamyeuthich`
--

DROP TABLE IF EXISTS `sanphamyeuthich`;
CREATE TABLE IF NOT EXISTS `sanphamyeuthich` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MaSanPham` int NOT NULL,
  `TenSanPham` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `HinhURL` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `GiaSanPham` int DEFAULT NULL,
  `MoTa` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `MaLoaiSanPham` int NOT NULL,
  `BiXoa` int DEFAULT NULL,
  `MaTaiKhoan` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `MaTaiKhoan` int NOT NULL,
  `TenDangNhap` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MatKhau` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenHienThi` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DienThoai` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaLoaiTaiKhoan` int NOT NULL,
  `BiXoa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `TenDangNhap`, `MatKhau`, `TenHienThi`, `DiaChi`, `DienThoai`, `Email`, `MaLoaiTaiKhoan`, `BiXoa`) VALUES
(1, 'user', 'user', 'user 01', '227, nguy???n v??n c???, qu???n 5', '0909109456', 'user@gmail.com', 1, 0),
(2, 'admin', 'admin', 'Admin website', 'Do An Shop Ban Hang', '0909123456', 'admin@doanshop.vn', 2, 0),
(0, 'mai', '123', 'NTTMai', '227 Nguy???n V??n C???', '0912311212', '', 1, NULL),
(1, 'mai', '123', 'NTTMAI', '123 Tr???n H??ng ?????o', '091231213', 'mai@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tinhtrang`
--

DROP TABLE IF EXISTS `tinhtrang`;
CREATE TABLE IF NOT EXISTS `tinhtrang` (
  `MaTinhTrang` int NOT NULL AUTO_INCREMENT,
  `TenTinhTrang` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrang`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tinhtrang`
--

INSERT INTO `tinhtrang` (`MaTinhTrang`, `TenTinhTrang`) VALUES
(1, '?????t h??ng'),
(2, '??ang giao h??ng'),
(3, 'Thanh to??n'),
(4, 'H???y');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
