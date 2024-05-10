-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2024. Máj 10. 15:03
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kerekpar`
--
CREATE DATABASE IF NOT EXISTS `kerekpar` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `kerekpar`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `javitasok`
--

CREATE TABLE `javitasok` (
  `javitas_id` int(3) DEFAULT NULL,
  `szerelo_id` int(1) DEFAULT NULL,
  `tulaj_id` int(2) DEFAULT NULL,
  `datum` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `javido` int(2) DEFAULT NULL,
  `iranyar` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `javitasok`
--

INSERT INTO `javitasok` (`javitas_id`, `szerelo_id`, `tulaj_id`, `datum`, `javido`, `iranyar`) VALUES
(1, 6, 18, '2019.01.02', 3, 3800),
(2, 9, 30, '2019.01.02', 5, 5800),
(3, 8, 43, '2019.01.08', 4, 5700),
(4, 5, 30, '2019.01.09', 6, 18000),
(5, 5, 1, '2019.01.13', 6, 6000),
(7, 7, 31, '2019.01.13', 3, 2900),
(8, 2, 11, '2019.01.15', 3, 3700),
(9, 4, 27, '2019.01.15', 6, 5500),
(10, 2, 43, '2019.01.16', 3, 4800),
(11, 9, 8, '2019.01.18', 3, 2300),
(12, 5, 38, '2019.01.20', 2, 2100),
(13, 9, 6, '2019.01.25', 5, 6000),
(14, 6, 27, '2019.01.26', 4, 55000),
(15, 8, 38, '2019.02.05', 3, 5800),
(16, 8, 44, '2019.02.11', 5, 3000),
(17, 8, 40, '2019.02.12', 2, 6000),
(18, 4, 44, '2019.02.15', 6, 16000),
(19, 1, 18, '2019.02.19', 2, 63000),
(20, 6, 10, '2019.02.23', 4, 16000),
(22, 7, 39, '2019.02.27', 4, 2500),
(23, 3, 6, '2019.03.02', 5, 50000),
(25, 2, 6, '2019.03.14', 2, 29000),
(26, 2, 14, '2019.03.15', 4, 44000),
(27, 8, 2, '2019.03.17', 4, 50000),
(28, 7, 35, '2019.03.18', 4, 57000),
(29, 8, 33, '2019.03.21', 2, 3000),
(32, 2, 7, '2019.04.07', 3, 38000),
(33, 4, 44, '2019.04.11', 3, 59000),
(34, 8, 14, '2019.04.16', 6, 44000),
(35, 2, 9, '2019.04.18', 6, 3000),
(36, 1, 5, '2019.04.26', 4, 63000),
(37, 5, 24, '2019.04.27', 4, 52000),
(38, 2, 1, '2019.04.27', 2, 20000),
(39, 4, 29, '2019.04.28', 6, 35000),
(40, 1, 11, '2019.05.05', 5, 3000),
(41, 5, 15, '2019.05.09', 4, 64000),
(42, 5, 35, '2019.05.09', 3, 56000),
(43, 7, 21, '2019.05.10', 2, 24000),
(44, 7, 45, '2019.05.18', 4, 5400),
(45, 1, 32, '2019.05.19', 4, 45000),
(46, 1, 22, '2019.05.20', 4, 39000),
(47, 5, 15, '2019.05.25', 3, 25000),
(48, 5, 24, '2019.06.01', 4, 61000),
(49, 4, 31, '2019.06.01', 5, 54000),
(50, 2, 9, '2019.06.05', 2, 50000),
(51, 2, 20, '2019.06.14', 10, 4700),
(52, 3, 1, '2019.06.18', 5, 51000),
(53, 6, 4, '2019.06.18', 5, 3400),
(54, 6, 3, '2019.06.22', 3, 28000),
(55, 2, 12, '2019.06.24', 2, 26000),
(56, 9, 15, '2019.06.25', 5, 22000),
(57, 6, 37, '2019.06.26', 4, 41000),
(58, 3, 15, '2019.06.28', 2, 36000),
(59, 1, 28, '2019.07.05', 2, 38000),
(60, 1, 20, '2019.07.08', 4, 50000),
(61, 4, 14, '2019.07.09', 2, 60000),
(62, 6, 37, '2019.07.11', 2, 55000),
(63, 5, 26, '2019.07.11', 2, 29000),
(64, 3, 36, '2019.07.12', 4, 44000),
(65, 4, 39, '2019.07.18', 5, 64000),
(66, 6, 12, '2019.07.24', 5, 54000),
(67, 2, 18, '2019.08.04', 2, 27000),
(68, 8, 40, '2019.08.13', 4, 21000),
(70, 8, 14, '2019.08.18', 6, 30000),
(71, 1, 7, '2019.08.22', 5, 60000),
(72, 6, 44, '2019.08.22', 12, 35000),
(73, 1, 13, '2019.08.24', 2, 5400),
(74, 7, 41, '2019.09.01', 4, 33000),
(75, 3, 43, '2019.09.03', 3, 48000),
(76, 8, 27, '2019.09.03', 4, 41000),
(77, 1, 41, '2019.09.04', 4, 49000),
(78, 1, 37, '2019.09.05', 5, 32000),
(79, 4, 23, '2019.09.11', 2, 49000),
(80, 2, 41, '2019.09.20', 2, 31000),
(81, 4, 4, '2019.09.20', 6, 53000),
(82, 4, 44, '2019.09.27', 6, 54000),
(83, 9, 5, '2019.10.02', 3, 45000),
(84, 6, 36, '2019.10.08', 2, 62000),
(85, 2, 13, '2019.10.09', 3, 2700),
(86, 7, 13, '2019.10.16', 2, 35000),
(87, 2, 8, '2019.10.19', 2, 32000),
(88, 9, 2, '2019.10.20', 3, 19000),
(89, 7, 8, '2019.10.25', 5, 40000),
(90, 5, 10, '2019.11.05', 5, 16000),
(91, 7, 37, '2019.11.15', 11, 15000),
(92, 6, 43, '2019.11.24', 2, 3700),
(93, 2, 26, '2019.11.28', 5, 36000),
(94, 6, 10, '2019.12.01', 3, 43000),
(95, 7, 22, '2019.12.07', 5, 43000),
(96, 2, 22, '2019.12.09', 6, 60000),
(97, 2, 33, '2019.12.15', 9, 3600),
(98, 3, 44, '2019.12.16', 3, 35000),
(99, 1, 2, '2019.12.23', 5, 55000),
(100, 8, 15, '2019.12.27', 3, 1800);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szerelok`
--

CREATE TABLE `szerelok` (
  `szerelo_id` int(2) DEFAULT NULL,
  `nev` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cim` varchar(34) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefon` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szerelok`
--

INSERT INTO `szerelok` (`szerelo_id`, `nev`, `cim`, `telefon`) VALUES
(1, 'Nagy János', 'Csávoly, Ceglédi utca 88.', '(30) 834-47-72'),
(2, 'Megyeri György', 'Baja, Virág utca 80.', '(20) 716-19-54'),
(3, 'Pénzes Lehel', 'Kalocsa, Mikszáth utca 37.', '(70) 599-12-77'),
(4, 'Csintalan Péter', 'Felsőszentiván, Mikszáth utca 39.', '(20) 825-55-55'),
(5, 'Nagy Bence', 'Kiskunhalas, Arany János utca 86.', '(70) 611-94-92'),
(6, 'Palat Sándor', 'Vaskút, Kossuth utca 47.', '(30) 394-33-50'),
(7, 'Szabó Pál', 'Kecskemét, Arany János utca 95.', '(20) 302-85-17'),
(8, 'Varó Bálint', 'Szekszárd, Petőfi utca 30.', '(20) 256-60-58'),
(9, 'Szabó Mátyás', 'Bácsbokod, Csillag utca 86.', '(70) 115-20-98');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tipusok`
--

CREATE TABLE `tipusok` (
  `tipus_id` int(2) DEFAULT NULL,
  `tipusnev` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meret` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tipusok`
--

INSERT INTO `tipusok` (`tipus_id`, `tipusnev`, `meret`) VALUES
(1, 'Nõi Mountain Bike', 26),
(2, 'Nõi Mountain Bike', 27),
(3, 'Férfi Mountain Bike', 27),
(4, 'Férfi Mountain Bike', 29),
(5, 'Nõi Trekking', 26),
(6, 'Férfi Trekking', 29),
(7, 'Nõi Cross', 27),
(8, 'Férfi Cross', 29),
(9, 'Nõi Városi', 26),
(10, 'Nõi Városi', 28),
(11, 'Férfi Városi', 27),
(12, 'Férfi Városi', 29),
(13, 'Nõi BMX', 20),
(14, 'Férfi BMX', 20),
(15, 'Gyermek kerékpár', 20);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tulajdonos`
--

CREATE TABLE `tulajdonos` (
  `tulaj_id` int(2) DEFAULT NULL,
  `nev` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tipuskod` int(2) DEFAULT NULL,
  `telefon` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tulajdonos`
--

INSERT INTO `tulajdonos` (`tulaj_id`, `nev`, `tipuskod`, `telefon`) VALUES
(1, 'Angel Dávid Ádám', 7, '(70) 301-94-97'),
(2, 'Bakai Gábor', 13, '(70) 536-80-44'),
(3, 'Balog Boldizsár Zsolt', 4, '(70) 857-69-49'),
(4, 'Bánfi Tamás', 15, '(70) 393-54-66'),
(5, 'Bendiák István', 6, '(70) 111-62-88'),
(6, 'Bera Bálint ', 3, '(20) 513-89-86'),
(7, 'Berczeli Miklós ', 2, '(20) 169-73-57'),
(8, 'Béres András ', 14, '(70) 802-81-31'),
(9, 'Béres Gábor Attila ', 4, '(20) 581-38-50'),
(10, 'Berezvai Szabolcs', 4, '(30) 678-93-23'),
(11, 'Braun Zsanett', 8, '(20) 516-32-29'),
(12, 'Cseppentő Bence ', 7, '(70) 703-50-66'),
(13, 'Cservenák Ákos ', 7, '(70) 390-41-71'),
(14, 'Cseszneki Julianna', 11, '(30) 698-60-27'),
(15, 'Csiti Bence ', 15, '(20) 754-34-57'),
(16, 'Csoma Sarolta ', 1, '(20) 284-76-98'),
(17, 'Csorba László Vilmos ', 14, '(30) 392-66-44'),
(18, 'Csortos Gabriella ', 12, '(70) 665-80-16'),
(19, 'Danielisz Dóra ', 9, '(70) 937-18-51'),
(20, 'Elek Gábor', 9, '(30) 317-21-12'),
(21, 'Erdei Réka', 11, '(30) 854-25-70'),
(22, 'Fekete Anikó', 7, '(70) 972-37-16'),
(23, 'Filip Gergő', 8, '(20) 592-76-94'),
(24, 'Goda Márton Áron ', 5, '(30) 626-41-18'),
(25, 'Guttmann Ákos', 14, '(20) 581-89-65'),
(26, 'Gyarmati Gábor ', 10, '(20) 267-61-80'),
(27, 'Halmos Margit', 2, '(30) 253-37-26'),
(28, 'Harangi Attila ', 1, '(70) 276-39-74'),
(29, 'Hareancz Ferenc ', 9, '(20) 217-51-25'),
(30, 'Hati Bence ', 1, '(20) 343-96-60'),
(31, 'Hatvani Tibor ', 15, '(30) 902-65-33'),
(32, 'Hertelendi Attila', 4, '(70) 495-97-82'),
(33, 'Hertelendi Mariann', 8, '(70) 650-46-86'),
(34, 'Kerész Margit', 12, '(20) 489-99-89'),
(35, 'Kontra Lilla ', 10, '(20) 387-93-31'),
(36, 'Kopcsányi Gergő ', 7, '(20) 734-76-20'),
(37, 'Korán Ádám ', 5, '(30) 371-75-23'),
(38, 'Nepusz Adrienn ', 7, '(30) 479-72-19'),
(39, 'Nyárádi Anita ', 14, '(70) 137-73-68'),
(40, 'Odrobina Miklós ', 13, '(20) 664-42-41'),
(41, 'Pauer Gábor ', 10, '(20) 423-42-35'),
(42, 'Pávkovics Erik ', 6, '(20) 461-55-31'),
(43, 'Peitl Péter ', 6, '(20) 504-85-19'),
(44, 'Sámson Kinga ', 9, '(20) 902-68-32'),
(45, 'Varga Zsolt', 5, '(30) 751-77-20');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
