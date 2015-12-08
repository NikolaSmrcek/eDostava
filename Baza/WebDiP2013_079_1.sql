-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 24, 2014 at 03:23 AM
-- Server version: 5.0.51
-- PHP Version: 5.3.3-7+squeeze19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `WebDiP2013_079`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cjenik`
--

CREATE TABLE IF NOT EXISTS `Cjenik` (
  `id_tipd` int(11) NOT NULL,
  `id_rutaa` int(11) NOT NULL,
  `id_kurs` int(11) NOT NULL,
  `cijena` varchar(45) character set latin1 NOT NULL,
  PRIMARY KEY  (`id_tipd`,`id_rutaa`,`id_kurs`),
  KEY `fk_Cjenik_Tip_dostave1_idx` (`id_tipd`),
  KEY `fk_Cjenik_Ruta1_idx` (`id_rutaa`,`id_kurs`),
  KEY `id_kurs` (`id_kurs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Cjenik`
--

INSERT INTO `Cjenik` (`id_tipd`, `id_rutaa`, `id_kurs`, `cijena`) VALUES
(1, 1, 1, '300'),
(1, 3, 1, '200'),
(1, 5, 3, '222'),
(1, 13, 1, '250'),
(1, 14, 1, '100'),
(1, 15, 1, '11'),
(1, 16, 3, '99'),
(2, 1, 1, '400'),
(2, 3, 1, '300'),
(2, 5, 3, '333'),
(2, 13, 1, '350'),
(2, 14, 1, '111'),
(2, 15, 1, '22'),
(2, 16, 3, '199'),
(3, 1, 1, '500'),
(3, 3, 1, '400'),
(3, 5, 3, '444'),
(3, 10, 10, '545'),
(3, 13, 1, '400'),
(3, 14, 1, '123'),
(3, 15, 1, '33'),
(3, 16, 3, '1999');

-- --------------------------------------------------------

--
-- Table structure for table `Dio_rute`
--

CREATE TABLE IF NOT EXISTS `Dio_rute` (
  `id_diorute` int(11) NOT NULL auto_increment,
  `id_rute` int(11) NOT NULL,
  `id_kurs` int(11) NOT NULL,
  `id_dostavnog` int(11) NOT NULL,
  `oznaka` int(11) NOT NULL,
  PRIMARY KEY  (`id_diorute`,`id_rute`,`id_kurs`,`id_dostavnog`),
  UNIQUE KEY `id_dru_UNIQUE` (`id_diorute`),
  KEY `fk_Dio_rute_Ruta1_idx` (`id_rute`,`id_kurs`),
  KEY `fk_Dio_rute_Dostavne_lok1_idx` (`id_dostavnog`),
  KEY `id_kurs` (`id_kurs`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `Dio_rute`
--

INSERT INTO `Dio_rute` (`id_diorute`, `id_rute`, `id_kurs`, `id_dostavnog`, `oznaka`) VALUES
(1, 1, 1, 14, 2),
(2, 1, 1, 1, 2),
(3, 2, 1, 2, 2),
(4, 6, 3, 2, 1),
(5, 3, 1, 2, 1),
(6, 3, 1, 14, 2),
(7, 7, 5, 1, 2),
(8, 6, 3, 2, 2),
(9, 4, 2, 2, 2),
(10, 5, 3, 1, 2),
(11, 1, 1, 2, 1),
(12, 13, 1, 14, 1),
(13, 13, 1, 2, 2),
(14, 13, 1, 1, 3),
(15, 14, 1, 1, 1),
(16, 14, 1, 2, 3),
(17, 1, 1, 10, 3),
(18, 15, 1, 2, 1),
(19, 15, 1, 14, 2),
(20, 15, 1, 1, 3),
(21, 16, 3, 15, 1),
(22, 16, 3, 10, 2),
(23, 16, 3, 3, 2),
(24, 16, 3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Djelatinici`
--

CREATE TABLE IF NOT EXISTS `Djelatinici` (
  `id_kurs` int(11) NOT NULL,
  `id_kor` varchar(25) character set latin1 NOT NULL,
  `status` varchar(45) character set latin1 NOT NULL default '1',
  PRIMARY KEY  (`id_kurs`,`id_kor`),
  KEY `fk_Djelatinici_Korisnik1_idx` (`id_kor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Djelatinici`
--

INSERT INTO `Djelatinici` (`id_kurs`, `id_kor`, `status`) VALUES
(1, 'mod11@foi.hr', '1'),
(2, 'mod1@foi.hr', '1'),
(2, 'mod2@foi.hr', '1'),
(3, 'mod3@foi.hr', '1'),
(4, 'mod4@foi.hr', '1'),
(5, 'mod5@foi.hr', '1'),
(7, 'mod7@foi.hr', '1'),
(8, 'mod8@foi.hr', '1'),
(9, 'mod9@foi.hr', '1'),
(10, 'mod10@foi.hr', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Dostavne_lok`
--

CREATE TABLE IF NOT EXISTS `Dostavne_lok` (
  `id_kurs` int(11) NOT NULL,
  `id_mprima` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id_kurs`,`id_mprima`),
  KEY `fk_Dostavne_lok_Mjesto_primanja1_idx` (`id_mprima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Dostavne_lok`
--

INSERT INTO `Dostavne_lok` (`id_kurs`, `id_mprima`, `status`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 10, 1),
(1, 12, 0),
(1, 13, 0),
(1, 14, 1),
(2, 2, 0),
(3, 1, 1),
(3, 2, 1),
(3, 3, 1),
(3, 7, 1),
(3, 10, 1),
(3, 15, 1),
(5, 1, 1),
(6, 1, 1),
(7, 12, 0),
(8, 7, 1),
(10, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Gal_slik`
--

CREATE TABLE IF NOT EXISTS `Gal_slik` (
  `id_gal` int(11) NOT NULL auto_increment,
  `slika1` varchar(45) character set latin1 NOT NULL,
  `slika2` varchar(45) character set latin1 NOT NULL,
  `slika3` varchar(45) character set latin1 NOT NULL,
  PRIMARY KEY  (`id_gal`),
  UNIQUE KEY `id_gal_UNIQUE` (`id_gal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `Gal_slik`
--

INSERT INTO `Gal_slik` (`id_gal`, `slika1`, `slika2`, `slika3`) VALUES
(1, '1_img1.jpg', '1_img2.jpg', '1_img3.jpg'),
(2, '2_img1.jpg', '2_img2.jpg', '2_img3.jpg'),
(3, '3_img1.jpg', '3_img3.jpg', '3_img3.jpg'),
(4, '4_img1.jpg', '4_img2.jpg', '4_img3.jpg'),
(5, '5_img1.jpg', '5_img2.jpg', '5_img3.jpg'),
(6, '6_img1.jpg', '6_img2.jpg', '6_img3.jpg'),
(7, '7_img1.jpg', '7_img2.jpg', '7_img3.jpg'),
(8, '8_img1.jpg', '8_img2.jpg', '8_img3.jpg'),
(9, '9_img1.jpg', '9_img2.jpg', '9_img3.jpg'),
(10, '10_img1.jpg', '10_img2.jpg', '10_img3.jpg'),
(11, '11_img1.jpg', '11_img2.jpg', '11_img3.jpg'),
(12, '12_img1.jpg', '12_img2.jpg', '12_img3.jpg'),
(13, '13_img1.jpg', '13_img2.jpg', '13_img3.jpg'),
(14, '14_img1.jpg', '14_img2.jpg', '14_img3.jpg'),
(15, '15_img1.jpg', '15_img2.jpg', '15_img3.jpg'),
(16, '16_img1.jpg', '16_img2.jpg', '16_img3.jpg'),
(17, '17_img1.jpg', '17_img2.jpg', '17_img3.jpg'),
(18, '18_img1.jpg', '18_img2.jpg', '18_img3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Korisnik`
--

CREATE TABLE IF NOT EXISTS `Korisnik` (
  `email` varchar(60) character set latin1 NOT NULL,
  `ime` varchar(25) character set latin1 NOT NULL,
  `prezime` varchar(35) character set latin1 NOT NULL,
  `adresa` varchar(45) character set latin1 NOT NULL,
  `grad` varchar(20) character set latin1 NOT NULL,
  `kor_ime` varchar(20) character set latin1 NOT NULL,
  `lozinka` varchar(32) character set latin1 NOT NULL,
  `broj` varchar(12) character set latin1 default NULL,
  `datum_rod` date NOT NULL,
  `spol` varchar(10) character set latin1 NOT NULL,
  `obavijesti` int(11) default NULL,
  `status` int(11) NOT NULL default '1',
  `aktivacija` varchar(45) character set latin1 default NULL,
  `datum_reg` datetime default NULL,
  `broj_neusp` int(11) default NULL,
  PRIMARY KEY  (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `kor_ime_UNIQUE` (`kor_ime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Korisnik`
--

INSERT INTO `Korisnik` (`email`, `ime`, `prezime`, `adresa`, `grad`, `kor_ime`, `lozinka`, `broj`, `datum_rod`, `spol`, `obavijesti`, `status`, `aktivacija`, `datum_reg`, `broj_neusp`) VALUES
('admin@foi.hr', 'Administator', 'PrezimeAdmin', 'ADminska755', 'GRADZZZ', 'admin', 'admin2323', 'null', '1992-12-06', 'Muski', 2, 4, 'null', '0000-00-00 00:00:00', 0),
('andre.brudic@hotmail.com', 'Andre', 'BrundiÄ‡', 'Zutnicka', 'Zagreb', 'Andre', '2f72c9a8b883d9650bb5', '0993793482', '0000-00-00', 'Muski', 2, 0, '7dfb7e9a0d0e1262fa1a67e97f381550', '2014-05-28 00:00:00', 0),
('bojozicaci@mailpick.biz', 'Tzzz', 'Wadsd', 'adwawd', 'wdwadawd', 'nekaneka', 'c6d253a0', 'dwadaw', '1991-09-01', 'Muski', 1, 2, '33b9e2f6be846a13b1aff8c2393e74e5', '2014-06-23 00:11:38', 0),
('danijel.sladovic@gmail.com', 'Danijel', 'SladoviÄ‡', 'dwada', 'dawdw', 'nestooo', 'kola', 'awddaw', '2014-06-05', 'Muski', 1, 0, '76c77125d88bde5714b80ee391d302ca', '2014-06-23 23:13:16', 0),
('kanta2323@gmail.com', 'Adawklndal', 'Tadawda', 'awdadaw', 'dwadawd', 'kantaaaa', 'kako', 'dwadadaws', '1991-09-08', 'Muski', 1, 2, '0ae2b2b102c9d46ebc8584e87c022a53', '2014-06-10 14:18:38', 0),
('korisnik1@foi.hr', 'korisnik1', 'korisnik1', 'korisnicka', 'Split', 'kor1', 'kor1', '099 876', '1999-04-15', 'Muski', 1, 2, 'null', '0000-00-00 00:00:00', 0),
('korisnik23@foi.hr', 'Ivan', 'Japanac', 'Samrujski put 44', 'Runovici', 'palijapan', 'ivan1', '099 8844332', '1987-04-23', 'Muski', 1, 2, NULL, NULL, 0),
('korisnik2@foi.hr', 'korisnik2', 'korisnik2', 'korisnicka', 'Split', 'kor2', 'bbd6a54deb2ded160cd43902b3583d4e', '099', '1993-04-15', 'Muski', 1, 2, 'null', '0000-00-00 00:00:00', 0),
('korisnik3@foi.hr', 'korisnik3', 'korisnik3pre', 'korisnicka 33', 'Zagreb', 'kor3', 'kor3', '099 5531234', '1977-12-12', 'Zenski', 2, 2, NULL, NULL, 0),
('korisnik4@foi.hr', 'korisnik4', 'korisnik4pre', 'korisnicka 44', 'Split', 'kor4', 'a6e7b405eff4fa58b353e190562a17d6', '099 5545634', '1988-04-23', 'Muski', 2, 1, NULL, NULL, 2),
('korisnik5@foi.hr', 'korisnik5', 'korisnik5pre', 'korisnicka 55', 'Sibenik', 'kor5', 'kor5', '099 5129234', '1994-07-25', 'Muski', 2, 2, NULL, NULL, 0),
('korisnik6@foi.hr', 'korisnik6', 'korisnik6pre', 'korisnicka 65', 'Zadar', 'kor6', 'kor6', '099 5510984', '1995-05-15', 'Muski', 1, 2, NULL, NULL, 0),
('mod10@foi.hr', 'Marina', 'Sestak', 'karlovacka 22', 'Karlovac', 'mod10', 'mod10', '777 1122332', '1993-04-29', 'Zenksi', 2, 3, NULL, NULL, 0),
('mod11@foi.hr', 'mod11', 'mod11', 'mod111', 'Zagreb', 'mod11', 'mod11', NULL, '2014-04-01', 'Zenski', 2, 3, NULL, NULL, 0),
('mod1@foi.hr', 'Zvonko', 'Zvonic', 'Zvonska 33', 'Sibenik', 'pos1', 'pos1', NULL, '2007-04-19', 'Muski', 2, 3, NULL, NULL, 0),
('mod2@foi.hr', 'Jasmina', 'Getuuu', 'Zadarska 44', 'Zadar', 'mod2', 'mod2', '123 213123', '2013-12-09', 'Zenski', 2, 3, NULL, NULL, 0),
('mod3@foi.hr', 'Danijel', 'Prezimeee', 'Trpimirska 33', 'Zadar', 'mod3', 'mod3', NULL, '1975-12-24', 'Muski', 2, 3, NULL, NULL, 0),
('mod4@foi.hr', 'Mod4', 'mod4', 'mod4a', 'Zagreb', 'mod4', 'mod4', NULL, '1996-04-18', 'Muski', 2, 3, NULL, NULL, 0),
('mod5@foi.hr', 'Helena', 'mod5', 'mod5', 'Vukovar', 'mod5', 'mod5', NULL, '1964-04-24', 'Zenski', 1, 3, NULL, NULL, 0),
('mod6@foi.hr', 'Zeljko', 'aousdj', 'aopdhnoanw 33', 'Varazdin', 'mod6', 'mod6', NULL, '1964-04-16', 'Muski', 2, 3, NULL, NULL, 0),
('mod7@foi.hr', 'Vesna', 'aousdj', 'aopdhnoanw 33', 'Varazdin', 'mod7', 'mod7', NULL, '1988-04-17', 'Zenski', 2, 3, NULL, NULL, 0),
('mod8@foi.hr', 'Marko', 'Bartolic', 'zagrebacka avenija 1', 'Split', 'mod8', 'mod8', '099 9158874', '1982-04-21', 'Muski', 2, 3, NULL, NULL, 0),
('mod9@foi.hr', 'Mod9', 'Mod9', 'Zveceva 33', 'Makarska', 'mod9', 'mod9', NULL, '2009-04-15', 'Muski', 2, 3, NULL, NULL, 0),
('nesto@coldemail.info', 'Korisnik', 'Å ariÄ‡', 'Neka', 'Zagreb', 'random', 'kratka', 'adwwadw', '2014-06-04', 'Zenski', 2, 2, '3819a30b23b8e72a4ba42175c0240a1c', '2014-06-24 00:00:00', 0),
('patafix@coldemail.info', 'JoÅ¡iÄ‡', 'RadoÅ¡Å¡Å¡iÄ', 'Zadaad', 'Gradina', 'patafixx', 'pastce', '12380912', '1992-08-14', 'Muski', 1, 0, '9cc7b86410caa7d8c0d9faf9f03452ee', '2014-06-24 07:01:53', 0),
('zipidus@gmail.com', 'Ralalal', 'Tadwwd', 'dlawhdawj', 'wdlnawndkw', 'zipidus2', 'be079725', 'wadwd', '1992-08-08', 'Muski', 1, 4, '96023c459800293dd817c78af4f00e34', '2014-06-05 20:30:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Kur_sluzba`
--

CREATE TABLE IF NOT EXISTS `Kur_sluzba` (
  `id_kur` int(11) NOT NULL auto_increment,
  `naziv` varchar(20) character set latin1 NOT NULL,
  `ziro_racun` varchar(25) character set latin1 default NULL,
  `oib` varchar(12) character set latin1 default NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id_kur`),
  UNIQUE KEY `id_kur_UNIQUE` (`id_kur`),
  UNIQUE KEY `ziro_racun_UNIQUE` (`ziro_racun`),
  UNIQUE KEY `oib_UNIQUE` (`oib`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `Kur_sluzba`
--

INSERT INTO `Kur_sluzba` (`id_kur`, `naziv`, `ziro_racun`, `oib`, `status`) VALUES
(1, 'naziv1', '08409324-234234', '437926423', 1),
(2, 'naziv1', '32131231', '1231231212', 1),
(3, 'naziv3', '128312-123312', '120319283', 1),
(4, 'naziv4', '9380457-9874', '342432', 1),
(5, 'naziv5', '12312312', '123213123', 1),
(6, 'naziv6', '123131312', '123123131', 1),
(7, 'naziv7', '89692364', '3274624234', 1),
(8, 'naziv8', '131312312', '1231231', 1),
(9, 'naziv9', '08723432-4289243', '975436', 1),
(10, 'naziv10', '9384654-34321', '239829047', 1),
(11, 'Oversea', '123123-123123', '123123213', 1),
(12, 'Hp ekspress', '81273812', '2318738901', 1),
(13, 'BrzinaVrlina', '817238120', '12321312', 1),
(14, 'FedEx', '81302213', '1963127831', 1),
(15, 'Hrvatskaposta', '13297', '123213', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Mjesto_primanja`
--

CREATE TABLE IF NOT EXISTS `Mjesto_primanja` (
  `id_mprim` int(11) NOT NULL auto_increment,
  `grad` varchar(20) character set latin1 NOT NULL,
  PRIMARY KEY  (`id_mprim`),
  UNIQUE KEY `id_mprim_UNIQUE` (`id_mprim`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `Mjesto_primanja`
--

INSERT INTO `Mjesto_primanja` (`id_mprim`, `grad`) VALUES
(1, 'Zagreb'),
(2, 'Split'),
(3, 'Sibenik'),
(4, 'Zadar'),
(5, 'Kutina'),
(6, 'Osijek'),
(7, 'Losinj'),
(8, 'Pozega'),
(9, 'Slavonski brod'),
(10, 'Durdevac'),
(11, 'Jamarice'),
(12, 'Dubrovnik'),
(13, 'Pirovac'),
(14, 'Pula'),
(15, 'Varazdin');

-- --------------------------------------------------------

--
-- Table structure for table `Paket`
--

CREATE TABLE IF NOT EXISTS `Paket` (
  `id_paket` int(11) NOT NULL auto_increment,
  `id_kurs` int(11) NOT NULL,
  `id_topd` int(11) NOT NULL,
  `naziv` varchar(30) character set latin1 NOT NULL,
  `tezina` float default NULL,
  `visina` float default NULL,
  `sirina` float default NULL,
  `duzina` float default NULL,
  `adresa_prim` varchar(45) character set latin1 NOT NULL,
  `grad_prim` varchar(20) character set latin1 NOT NULL,
  `adresa_pos` varchar(45) character set latin1 default NULL,
  `grad_pos` varchar(20) character set latin1 default NULL,
  `gal_slik` int(11) default NULL,
  PRIMARY KEY  (`id_paket`,`id_kurs`,`id_topd`),
  UNIQUE KEY `id_paket_UNIQUE` (`id_paket`),
  UNIQUE KEY `gal_slik_UNIQUE` (`gal_slik`),
  KEY `fk_Paket_Tip_dostave1_idx` (`id_topd`),
  KEY `fk_Paket_Kur_sluzba1_idx` (`id_kurs`),
  KEY `fk_Paket_Gal_slik1_idx` (`gal_slik`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `Paket`
--

INSERT INTO `Paket` (`id_paket`, `id_kurs`, `id_topd`, `naziv`, `tezina`, `visina`, `sirina`, `duzina`, `adresa_prim`, `grad_prim`, `adresa_pos`, `grad_pos`, `gal_slik`) VALUES
(1, 1, 1, 'paket1TRUP', 0, 0, 0, 0, 'asdsada', 'Zagreb', 'null', 'null', 1),
(2, 2, 2, 'paket2', NULL, NULL, NULL, NULL, 'adhwln 44', 'Split', NULL, NULL, NULL),
(3, 3, 3, 'RATATATA', 5.5, 5.4, 4.3, 3.2, 'werads', 'Zagreb', NULL, NULL, NULL),
(4, 6, 1, 'paket4', 4.03, 11.33, 12, 10, 'adwa', 'Zagreb', NULL, NULL, NULL),
(5, 1, 2, 'paket5', 2, 3, 4, 5, 'awdaw 22', 'Split', 'ajlhldns 33', 'Zagreb', NULL),
(6, 1, 2, 'paket6', 8, 5, 7, 9, 'splitska 33', 'Split', NULL, NULL, NULL),
(7, 5, 1, 'paket7', 3, 3, 3, 4, 'puna 44', 'Zagreb', NULL, 'Split', NULL),
(8, 1, 2, 'paket8', NULL, NULL, NULL, NULL, 'pulska 33', 'Pula', NULL, NULL, NULL),
(9, 1, 1, 'paket10', 5, 5, 23, 10, 'awdaw 22', 'Zagreb', NULL, NULL, NULL),
(10, 3, 1, 'paket9', 4, 3, 2, 3, 'sibenska 3', 'Split', NULL, NULL, NULL),
(11, 6, 2, 'jsdnl', NULL, NULL, NULL, NULL, 'awlbdjl', 'Zagreb', NULL, NULL, NULL),
(12, 1, 1, 'naziv_12', NULL, NULL, NULL, NULL, 'korisnicka', 'Split', 'awdadaw', 'dwadawd', 12),
(13, 1, 1, 'naziv_13', NULL, NULL, NULL, NULL, 'korisnicka', 'Split', 'awdadaw', 'dwadawd', 13),
(14, 1, 1, 'naziv_14', NULL, NULL, NULL, NULL, 'korisnicka', 'Split', 'awdadaw', 'dwadawd', 14),
(15, 1, 1, 'PAKETTT15', 0.99, 0.76, 0.32, 0.1, 'korisnicka', 'Split', 'awdadaw', 'dwadawd', 15),
(16, 1, 1, 'naziv_16', NULL, NULL, NULL, NULL, 'korisnicka', 'Split', 'awdadaw', 'dwadawd', 16),
(17, 1, 3, 'Probni', 3, 4, 3, 3, 'korisnicka', 'Split', 'mod111', 'Zagreb', 17),
(18, 3, 1, 'naziv_18', NULL, NULL, NULL, NULL, 'mod111', 'Zagreb', 'Neka ulica', 'Grad', 18);

-- --------------------------------------------------------

--
-- Table structure for table `Paketi_status`
--

CREATE TABLE IF NOT EXISTS `Paketi_status` (
  `Paket_id_paket` int(11) NOT NULL,
  `datum_postavljanja` datetime default NULL,
  `datum_preuzimanja` datetime default NULL,
  `datum_dostave` datetime default NULL,
  `status` int(11) NOT NULL default '0',
  `id_rute` int(11) default NULL,
  `lokacija` varchar(20) default NULL,
  `datum_lok` datetime default NULL,
  `id_kor` varchar(25) default NULL,
  PRIMARY KEY  (`Paket_id_paket`),
  UNIQUE KEY `Paket_id_paket_UNIQUE` (`Paket_id_paket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Paketi_status`
--

INSERT INTO `Paketi_status` (`Paket_id_paket`, `datum_postavljanja`, `datum_preuzimanja`, `datum_dostave`, `status`, `id_rute`, `lokacija`, `datum_lok`, `id_kor`) VALUES
(1, '2014-04-01 21:50:43', NULL, NULL, 1, 1, NULL, NULL, NULL),
(2, '2014-04-01 21:55:22', NULL, NULL, 1, 1, NULL, NULL, NULL),
(3, '2014-04-01 21:55:24', '2014-06-24 07:22:04', NULL, 2, 16, 'Durdevac', '2014-06-24 07:23:17', 'mod3@foi.hr'),
(4, '2014-04-01 21:55:42', NULL, NULL, 4, 2, NULL, NULL, NULL),
(5, '2014-03-27 21:52:47', NULL, NULL, 1, 8, NULL, NULL, NULL),
(6, '2014-03-27 21:52:52', NULL, NULL, 1, 4, NULL, NULL, NULL),
(7, '2014-03-21 21:54:24', NULL, NULL, 1, 6, NULL, NULL, NULL),
(8, '2014-04-01 21:55:39', NULL, NULL, 1, 4, NULL, NULL, NULL),
(9, '2014-04-01 21:50:47', NULL, NULL, 1, 6, NULL, NULL, NULL),
(10, '2014-03-12 21:54:10', NULL, NULL, 1, 1, NULL, NULL, NULL),
(11, '2014-06-11 00:45:54', NULL, NULL, 1, 8, NULL, NULL, NULL),
(12, '2014-06-13 00:46:39', NULL, NULL, 1, 1, NULL, NULL, NULL),
(13, '2014-06-16 00:46:55', NULL, NULL, 1, 1, NULL, NULL, NULL),
(14, '2014-06-16 00:47:15', NULL, NULL, 1, 1, NULL, NULL, NULL),
(15, '2014-06-14 21:14:08', '2014-06-24 06:24:18', '2014-06-24 06:25:14', 3, 15, 'Zagreb', '2014-06-24 06:25:14', 'mod11@foi.hr'),
(16, '2014-06-14 21:15:36', NULL, NULL, 3, 8, NULL, NULL, NULL),
(17, '2014-06-16 06:02:09', '2014-06-16 07:00:08', '2014-06-16 22:52:52', 2, 1, 'Split', '2014-06-23 20:11:48', 'mod11@foi.hr'),
(18, '2014-06-24 05:55:42', NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Prijave`
--

CREATE TABLE IF NOT EXISTS `Prijave` (
  `id_pok` int(11) NOT NULL auto_increment,
  `id_kor` varchar(25) character set latin1 NOT NULL,
  `datum_prijave` datetime default NULL,
  `datum_odjave` datetime default NULL,
  PRIMARY KEY  (`id_pok`,`id_kor`),
  UNIQUE KEY `id_pok_UNIQUE` (`id_pok`),
  KEY `fk_Prijave_Korisnik_idx` (`id_kor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108 ;

--
-- Dumping data for table `Prijave`
--

INSERT INTO `Prijave` (`id_pok`, `id_kor`, `datum_prijave`, `datum_odjave`) VALUES
(1, 'admin@foi.hr', '2014-04-01 20:32:59', '2014-04-01 20:35:04'),
(2, 'admin@foi.hr', '2014-04-01 20:33:19', '2014-04-01 20:40:25'),
(3, 'korisnik1@foi.hr', '2014-04-01 20:34:17', '2014-04-01 21:34:21'),
(4, 'korisnik4@foi.hr', '2014-04-01 20:34:19', '2014-04-01 22:34:27'),
(5, 'korisnik3@foi.hr', NULL, NULL),
(6, 'korisnik3@foi.hr', NULL, NULL),
(7, 'korisnik3@foi.hr', '2014-03-26 20:35:25', '2014-03-26 21:35:34'),
(8, 'mod1@foi.hr', '2014-04-01 20:35:53', '2014-04-01 20:46:56'),
(9, 'admin@foi.hr', '2014-03-01 10:36:24', '2014-03-01 11:36:31'),
(10, 'mod9@foi.hr', '2014-04-01 16:36:55', '2014-04-01 17:22:04'),
(11, 'korisnik1@foi.hr', '2014-06-07 00:00:00', '2014-06-07 21:16:18'),
(12, 'korisnik1@foi.hr', '2014-06-07 21:18:22', '2014-06-07 21:18:28'),
(13, 'zipidus@gmail.com', '2014-06-07 21:32:28', '2014-06-07 21:32:36'),
(14, 'zipidus@gmail.com', '2014-06-07 21:35:00', '2014-06-07 21:35:09'),
(15, 'zipidus@gmail.com', '2014-06-07 21:39:44', '2014-06-07 22:02:53'),
(16, 'zipidus@gmail.com', '2014-06-07 22:06:04', '2014-06-07 22:06:28'),
(17, 'korisnik1@foi.hr', '2014-06-07 22:09:51', '2014-06-07 22:09:58'),
(18, 'korisnik1@foi.hr', '2014-06-07 22:11:13', '2014-06-07 22:11:25'),
(19, 'korisnik1@foi.hr', '2014-06-07 22:12:44', '2014-06-07 22:12:51'),
(20, 'korisnik1@foi.hr', '2014-06-07 22:13:55', '2014-06-07 22:14:00'),
(21, 'korisnik1@foi.hr', '2014-06-07 22:21:11', '2014-06-07 22:21:27'),
(22, 'korisnik1@foi.hr', '2014-06-07 23:42:38', '2014-06-07 23:43:03'),
(23, 'mod3@foi.hr', '2014-06-08 18:16:31', '2014-06-08 18:16:40'),
(24, 'admin@foi.hr', '2014-06-08 18:17:21', '2014-06-08 18:17:24'),
(25, 'mod3@foi.hr', '2014-06-08 18:18:56', '2014-06-08 18:19:01'),
(26, 'admin@foi.hr', '2014-06-08 18:31:21', '2014-06-08 18:31:35'),
(27, 'admin@foi.hr', '2014-06-09 13:37:50', '2014-06-09 13:49:09'),
(28, 'admin@foi.hr', '2014-06-09 13:49:16', '2014-06-09 18:57:55'),
(29, 'admin@foi.hr', '2014-06-09 19:02:01', '2014-06-09 16:03:53'),
(30, 'admin@foi.hr', '2014-06-09 16:04:35', '2014-06-09 16:04:47'),
(31, 'zipidus@gmail.com', '2014-06-09 16:08:57', '2014-06-09 16:09:01'),
(33, 'admin@foi.hr', '2014-06-10 21:28:06', '2014-06-10 21:30:33'),
(34, 'admin@foi.hr', '2014-06-10 22:25:26', '2014-06-09 23:15:02'),
(35, 'mod4@foi.hr', '2014-06-10 07:11:12', '2014-06-10 07:11:20'),
(36, 'admin@foi.hr', '2014-06-10 07:09:55', '2014-06-10 07:35:28'),
(37, 'admin@foi.hr', '2014-06-10 18:31:04', '2014-06-10 18:33:37'),
(38, 'admin@foi.hr', '2014-06-10 19:12:31', '2014-06-10 19:22:30'),
(39, 'admin@foi.hr', '2014-06-10 19:33:18', '2014-06-10 21:28:00'),
(40, 'admin@foi.hr', '2014-06-11 00:42:35', '2014-06-11 01:14:56'),
(41, 'admin@foi.hr', '2014-06-11 02:57:08', '2014-06-11 04:08:36'),
(42, 'admin@foi.hr', '2014-06-11 04:36:38', '2014-06-11 04:53:42'),
(43, 'admin@foi.hr', '2014-06-11 15:28:35', '2014-06-11 15:30:42'),
(44, 'admin@foi.hr', '2014-06-11 17:34:39', '2014-06-11 18:13:41'),
(45, 'korisnik1@foi.hr', '2014-06-12 01:53:37', '2014-06-12 01:53:43'),
(46, 'admin@foi.hr', '2014-06-12 03:06:44', '2014-06-12 03:07:39'),
(47, 'admin@foi.hr', '2014-06-12 08:19:11', '2014-06-12 08:20:22'),
(48, 'admin@foi.hr', '2014-06-13 21:07:24', '2014-06-13 21:08:21'),
(49, 'admin@foi.hr', '2014-06-13 21:34:07', '2014-06-13 21:42:16'),
(50, 'admin@foi.hr', '2014-06-14 18:12:35', '2014-06-14 18:13:51'),
(51, 'admin@foi.hr', '2014-06-14 19:59:15', '2014-06-14 20:08:15'),
(52, 'kanta2323@gmail.com', '2014-06-14 20:09:07', '2014-06-14 20:19:56'),
(53, 'admin@foi.hr', '2014-06-14 20:38:04', '2014-06-14 20:40:08'),
(54, 'kanta2323@gmail.com', '2014-06-14 20:20:39', '2014-06-14 21:24:05'),
(55, 'admin@foi.hr', '2014-06-15 01:30:52', '2014-06-15 01:31:59'),
(56, 'admin@foi.hr', '2014-06-15 02:02:41', '2014-06-15 02:02:50'),
(57, 'kanta2323@gmail.com', '2014-06-15 02:37:17', '2014-06-15 02:57:11'),
(58, 'admin@foi.hr', '2014-06-15 16:46:04', '2014-06-15 16:46:48'),
(59, 'admin@foi.hr', '2014-06-15 16:47:23', '2014-06-15 16:47:46'),
(60, 'korisnik23@foi.hr', '2014-06-15 16:47:53', '2014-06-15 16:48:31'),
(61, 'mod11@foi.hr', '2014-06-15 19:24:54', '2014-06-15 21:47:29'),
(62, 'mod7@foi.hr', '2014-06-15 21:47:36', '2014-06-15 21:48:24'),
(63, 'mod7@foi.hr', '2014-06-15 21:48:48', '2014-06-15 21:56:06'),
(64, 'mod8@foi.hr', '2014-06-15 21:56:13', '2014-06-15 21:58:44'),
(65, 'mod7@foi.hr', '2014-06-15 21:59:30', '2014-06-15 22:02:41'),
(66, 'mod7@foi.hr', '2014-06-15 23:16:17', '2014-06-15 23:16:39'),
(67, 'mod11@foi.hr', '2014-06-16 05:57:02', '2014-06-16 07:19:48'),
(68, 'korisnik1@foi.hr', '2014-06-16 07:19:55', '2014-06-16 07:21:14'),
(69, 'admin@foi.hr', '2014-06-16 07:21:20', '2014-06-16 07:22:55'),
(70, 'admin@foi.hr', '2014-06-16 13:02:49', '2014-06-16 13:04:08'),
(71, 'admin@foi.hr', '2014-06-16 18:24:47', '2014-06-16 18:28:02'),
(72, 'admin@foi.hr', '2014-06-16 22:43:30', '2014-06-16 22:48:16'),
(73, 'mod11@foi.hr', '2014-06-16 22:48:28', '2014-06-16 22:54:30'),
(74, 'mod11@foi.hr', '2014-06-16 23:01:15', '2014-06-16 23:09:44'),
(75, 'korisnik1@foi.hr', '2014-06-16 23:09:50', '2014-06-16 23:10:00'),
(76, 'admin@foi.hr', '2014-06-17 00:12:57', '2014-06-17 00:14:10'),
(77, 'mod11@foi.hr', '2014-06-17 00:14:16', '2014-06-17 00:14:34'),
(78, 'admin@foi.hr', '2014-06-17 22:23:19', '2014-06-18 00:41:53'),
(79, 'admin@foi.hr', '2014-06-18 00:42:02', '2014-06-18 01:09:18'),
(80, 'mod11@foi.hr', '2014-06-18 04:18:24', '2014-06-18 05:51:16'),
(81, 'mod3@foi.hr', '2014-06-18 05:51:22', '2014-06-18 05:52:47'),
(82, 'admin@foi.hr', '2014-06-18 08:36:53', '2014-06-18 10:54:13'),
(83, 'admin@foi.hr', '2014-06-18 19:33:08', '2014-06-18 19:35:26'),
(84, 'admin@foi.hr', '2014-06-20 06:44:59', '2014-06-20 06:54:12'),
(85, 'korisnik1@foi.hr', '2014-06-22 05:30:05', '2014-06-22 05:30:53'),
(86, 'admin@foi.hr', '2014-06-22 05:31:07', '2014-06-22 05:32:13'),
(87, 'mod11@foi.hr', '2014-06-23 19:59:39', '2014-06-23 20:20:31'),
(88, 'korisnik1@foi.hr', '2014-06-23 20:20:37', '2014-06-23 20:22:18'),
(89, 'admin@foi.hr', '2014-06-23 20:22:52', '2014-06-23 20:30:07'),
(90, 'mod11@foi.hr', '2014-06-23 20:55:31', '2014-06-23 23:03:28'),
(91, 'admin@foi.hr', '2014-06-24 01:27:57', '2014-06-24 01:40:15'),
(92, 'korisnik1@foi.hr', '2014-06-24 01:55:10', '2014-06-24 01:55:13'),
(93, 'admin@foi.hr', '2014-06-24 04:30:42', '2014-06-24 04:31:03'),
(94, 'admin@foi.hr', '2014-06-24 04:31:10', '2014-06-24 04:31:12'),
(95, 'admin@foi.hr', '2014-06-24 04:31:36', '2014-06-24 04:32:36'),
(96, 'admin@foi.hr', '2014-06-24 04:37:13', '2014-06-24 05:03:20'),
(97, 'admin@foi.hr', '2014-06-24 05:03:54', '2014-06-24 05:04:02'),
(98, 'admin@foi.hr', '2014-06-24 05:04:39', '2014-06-24 05:04:43'),
(99, 'admin@foi.hr', '2014-06-24 05:07:20', '2014-06-24 05:18:13'),
(100, 'admin@foi.hr', '2014-06-24 05:23:14', '2014-06-24 05:23:54'),
(101, 'admin@foi.hr', '2014-06-24 05:31:37', '2014-06-24 05:32:12'),
(102, 'nesto@coldemail.info', '2014-06-24 05:53:07', '2014-06-24 06:16:35'),
(103, 'mod11@foi.hr', '2014-06-24 06:17:04', '2014-06-24 06:30:01'),
(104, 'admin@foi.hr', '2014-06-24 06:30:07', '2014-06-24 06:55:36'),
(105, 'admin@foi.hr', '2014-06-24 07:12:26', '2014-06-24 07:13:43'),
(106, 'admin@foi.hr', '2014-06-24 07:14:16', '2014-06-24 07:18:40'),
(107, 'mod3@foi.hr', '2014-06-24 07:18:46', '2014-06-24 07:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `Radnje_baza`
--

CREATE TABLE IF NOT EXISTS `Radnje_baza` (
  `id_baza` int(11) NOT NULL auto_increment,
  `id_kor` varchar(25) character set latin1 NOT NULL,
  `datum_rada` datetime NOT NULL,
  `opis` longtext character set latin1,
  `tip` int(11) default NULL,
  PRIMARY KEY  (`id_baza`,`id_kor`),
  UNIQUE KEY `id_baza_UNIQUE` (`id_baza`),
  KEY `fk_Rad_baza_Korisnik1_idx` (`id_kor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=547 ;

--
-- Dumping data for table `Radnje_baza`
--

INSERT INTO `Radnje_baza` (`id_baza`, `id_kor`, `datum_rada`, `opis`, `tip`) VALUES
(1, 'admin@foi.hr', '2014-04-01 20:27:45', 'Select * from Ruta;', 1),
(2, 'korisnik5@foi.hr', '2010-04-14 20:28:05', 'Select * from Ruta;', NULL),
(3, 'mod4@foi.hr', '2009-03-23 18:28:43', 'Select * from Ruta;', NULL),
(4, 'korisnik6@foi.hr', '2014-01-21 15:29:12', 'Select * from Ruta;', NULL),
(5, 'mod6@foi.hr', '2013-04-25 20:29:46', 'Select * from Ruta;', NULL),
(6, 'admin@foi.hr', '2010-04-21 20:29:57', 'Select * from Ruta;', NULL),
(7, 'korisnik4@foi.hr', '2014-03-26 20:30:27', 'Select * from Ruta;', 1),
(8, 'korisnik5@foi.hr', '2014-01-27 20:30:21', 'Select * from Ruta;', NULL),
(9, 'admin@foi.hr', '2014-03-27 20:31:08', 'Select * from Ruta;', NULL),
(10, 'admin@foi.hr', '2014-02-25 20:31:17', 'Select * from Ruta;', NULL),
(11, 'korisnik1@foi.hr', '2014-06-07 21:57:42', 'Zahtjev za novom lozinkom', 2),
(12, 'korisnik1@foi.hr', '2014-06-07 21:58:48', 'Zahtjev za novom lozinkom', 2),
(13, 'korisnik1@foi.hr', '2014-06-07 22:13:55', 'Update Korisnik set broj_neusp=0 where kor_ime=''kor1''', 1),
(14, 'mod3@foi.hr', '2014-06-08 18:16:31', 'Update Korisnik set broj_neusp=0 where kor_ime=''mod3''', 1),
(15, 'admin@foi.hr', '2014-06-08 18:18:31', 'Zakljucavanje korisnickog racuna', 2),
(16, 'mod3@foi.hr', '2014-06-08 18:18:56', 'Update Korisnik set broj_neusp=0 where kor_ime=''mod3''', 1),
(17, 'admin@foi.hr', '2014-06-09 14:06:16', 'Preuzimanje vremena', 2),
(18, 'admin@foi.hr', '2014-06-09 14:06:18', 'Preuzimanje vremena', 2),
(19, 'admin@foi.hr', '2014-06-09 14:06:25', 'Preuzimanje vremena', 2),
(20, 'admin@foi.hr', '2014-06-09 14:06:38', 'Preuzimanje vremena', 2),
(21, 'admin@foi.hr', '2014-06-09 14:06:49', 'Preuzimanje vremena', 2),
(22, 'admin@foi.hr', '2014-06-09 18:37:58', 'Preuzimanje vremena', 2),
(26, 'admin@foi.hr', '2014-06-09 18:46:57', 'Preuzimanje vremena', 2),
(27, 'admin@foi.hr', '2014-06-09 16:02:07', 'Preuzimanje vremena', 2),
(28, 'admin@foi.hr', '2014-06-09 16:02:11', 'Preuzimanje vremena', 2),
(29, 'admin@foi.hr', '2014-06-09 16:04:44', 'Preuzimanje vremena', 2),
(30, 'admin@foi.hr', '2014-06-09 16:12:39', 'Preuzimanje vremena', 2),
(31, 'admin@foi.hr', '2014-06-10 21:13:01', 'Preuzimanje vremena', 2),
(32, 'kanta2323@gmail.com', '2014-06-10 21:18:38', 'Registracija korisnika', 2),
(33, 'kanta2323@gmail.com', '2014-06-10 21:19:27', 'Uspjesna aktivacija', 2),
(34, 'kanta2323@gmail.com', '2014-06-10 21:24:21', 'Uspjesna aktivacija', 2),
(35, 'kanta2323@gmail.com', '2014-06-10 21:25:23', 'Uspjesna aktivacija', 2),
(36, 'admin@foi.hr', '2014-06-10 21:30:20', 'Preuzimanje vremena', 2),
(37, 'admin@foi.hr', '2014-06-09 21:25:29', 'Preuzimanje vremena', 2),
(38, 'admin@foi.hr', '2014-06-09 21:27:26', 'Preuzimanje vremena', 2),
(39, 'admin@foi.hr', '2014-06-09 21:36:08', 'Preuzimanje vremena', 2),
(40, 'admin@foi.hr', '2014-06-09 21:37:14', 'Postavljanje broja stranica', 2),
(41, 'admin@foi.hr', '2014-06-09 21:45:56', 'Postavljanje broja stranica', 2),
(42, 'admin@foi.hr', '2014-06-09 21:53:39', 'Preuzimanje vremena', 2),
(43, 'admin@foi.hr', '2014-06-09 21:58:31', 'Postavljanje broja neuspjelih prijava', 2),
(44, 'mod3@foi.hr', '2014-06-09 22:03:04', 'Zakljucavanje korisnickog racuna', 2),
(45, 'korisnik3@foi.hr', '2014-06-09 22:04:52', 'Zakljucavanje korisnickog racuna', 2),
(46, 'admin@foi.hr', '2014-06-09 22:07:57', 'Postavljanje broja neuspjelih prijava', 2),
(47, 'admin@foi.hr', '2014-06-09 22:09:45', 'Postavljanje broja neuspjelih prijava', 2),
(48, 'admin@foi.hr', '2014-06-09 22:10:06', 'Postavljanje broja neuspjelih prijava', 2),
(49, 'korisnik3@foi.hr', '2014-06-09 22:10:20', 'Zakljucavanje korisnickog racuna', 2),
(50, 'admin@foi.hr', '2014-06-09 22:23:33', 'Postavljanje boje izbornika', 2),
(51, 'admin@foi.hr', '2014-06-09 22:23:44', 'Postavljanje boje izbornika', 2),
(52, 'admin@foi.hr', '2014-06-09 22:24:18', 'Postavljanje boje izbornika', 2),
(53, 'admin@foi.hr', '2014-06-09 22:24:51', 'Postavljanje boje izbornika', 2),
(54, 'admin@foi.hr', '2014-06-09 22:31:01', 'Postavljanje boje izbornika', 2),
(55, 'admin@foi.hr', '2014-06-09 22:31:21', 'Postavljanje boje izbornika', 2),
(56, 'admin@foi.hr', '2014-06-09 22:38:14', 'Postavljanje boje izbornika', 2),
(57, 'admin@foi.hr', '2014-06-09 22:41:11', 'Postavljanje boje izbornika', 2),
(58, 'admin@foi.hr', '2014-06-09 23:01:29', 'Postavljanje boje izbornika', 2),
(59, 'admin@foi.hr', '2014-06-09 23:02:07', 'Postavljanje boje izbornika', 2),
(60, 'admin@foi.hr', '2014-06-09 23:02:08', 'Postavljanje boje izbornika', 2),
(61, 'admin@foi.hr', '2014-06-09 23:02:14', 'Postavljanje boje izbornika', 2),
(62, 'admin@foi.hr', '2014-06-09 23:02:47', 'Postavljanje boje izbornika', 2),
(63, 'admin@foi.hr', '2014-06-09 23:03:36', 'Postavljanje boje izbornika', 2),
(64, 'admin@foi.hr', '2014-06-09 23:03:43', 'Postavljanje boje izbornika', 2),
(65, 'admin@foi.hr', '2014-06-09 23:04:00', 'Postavljanje boje izbornika', 2),
(66, 'admin@foi.hr', '2014-06-09 23:04:06', 'Postavljanje boje izbornika', 2),
(67, 'admin@foi.hr', '2014-06-09 23:04:45', 'Postavljanje boje izbornika', 2),
(68, 'admin@foi.hr', '2014-06-09 23:04:52', 'Postavljanje boje izbornika', 2),
(69, 'admin@foi.hr', '2014-06-09 23:06:23', 'Postavljanje broja neuspjelih prijava', 2),
(70, 'mod2@foi.hr', '2014-06-09 23:06:59', 'Zakljucavanje korisnickog racuna', 2),
(71, 'admin@foi.hr', '2014-06-10 00:26:57', 'Zakljucavanje korisnickog racuna', 2),
(72, 'admin@foi.hr', '2014-06-10 00:28:03', 'Zakljucavanje korisnickog racuna', 2),
(73, 'admin@foi.hr', '2014-06-10 00:28:28', 'Zakljucavanje korisnickog racuna', 2),
(74, 'admin@foi.hr', '2014-06-10 01:00:29', 'Postavljanje broja stranica', 2),
(75, 'admin@foi.hr', '2014-06-10 01:00:41', 'Postavljanje boje izbornika', 2),
(76, 'admin@foi.hr', '2014-06-10 01:02:03', 'Postavljanje boje izbornika', 2),
(77, 'admin@foi.hr', '2014-06-10 01:05:39', 'Postavljanje boje izbornika', 2),
(78, 'admin@foi.hr', '2014-06-10 01:10:08', 'Postavljanje boje izbornika', 2),
(79, 'admin@foi.hr', '2014-06-10 01:10:59', 'Postavljanje boje izbornika', 2),
(80, 'admin@foi.hr', '2014-06-10 01:11:17', 'Postavljanje boje izbornika', 2),
(81, 'admin@foi.hr', '2014-06-10 01:11:26', 'Postavljanje boje izbornika', 2),
(82, 'admin@foi.hr', '2014-06-10 01:11:36', 'Postavljanje boje izbornika', 2),
(83, 'admin@foi.hr', '2014-06-10 01:12:03', 'Postavljanje boje izbornika', 2),
(84, 'admin@foi.hr', '2014-06-10 01:12:12', 'Postavljanje boje izbornika', 2),
(85, 'admin@foi.hr', '2014-06-10 01:12:17', 'Postavljanje boje izbornika', 2),
(86, 'admin@foi.hr', '2014-06-10 01:16:54', 'Postavljanje broja stranica', 2),
(87, 'admin@foi.hr', '2014-06-10 01:20:57', 'Postavljanje broja stranica', 2),
(88, 'admin@foi.hr', '2014-06-10 01:21:20', 'Postavljanje boje izbornika', 2),
(89, 'admin@foi.hr', '2014-06-10 01:21:34', 'Postavljanje boje izbornika', 2),
(90, 'admin@foi.hr', '2014-06-10 01:32:28', 'Postavljanje broja stranica', 2),
(91, 'admin@foi.hr', '2014-06-10 01:48:43', 'Postavljanje boje izbornika', 2),
(92, 'admin@foi.hr', '2014-06-10 01:48:52', 'Postavljanje boje izbornika', 2),
(93, 'admin@foi.hr', '2014-06-10 02:15:49', 'Postavljanje boje izbornika', 2),
(94, 'admin@foi.hr', '2014-06-10 02:15:57', 'Postavljanje boje izbornika', 2),
(95, 'admin@foi.hr', '2014-06-10 04:56:40', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(96, 'admin@foi.hr', '2014-06-10 04:56:40', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(97, 'admin@foi.hr', '2014-06-10 04:59:21', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(98, 'admin@foi.hr', '2014-06-10 04:59:21', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(99, 'admin@foi.hr', '2014-06-10 04:59:23', 'Update Korisnik SET status=1,broj_neusp=''3''WHERE email = ''mod8@foi.hr''', 1),
(100, 'admin@foi.hr', '2014-06-10 04:59:23', 'Korisnicki racun otkljucan, racun korisnika: mod8@foi.hr', 2),
(101, 'admin@foi.hr', '2014-06-10 04:59:36', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(102, 'admin@foi.hr', '2014-06-10 04:59:36', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(103, 'admin@foi.hr', '2014-06-10 05:00:22', 'Update Korisnik SET status=''3'',broj_neusp=0 WHERE email = ''mod3@foi.hr''', 1),
(104, 'admin@foi.hr', '2014-06-10 05:00:22', 'Korisnicki racun zakljucan, racun korisnika: mod3@foi.hr ', 2),
(105, 'admin@foi.hr', '2014-06-10 05:00:31', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(106, 'admin@foi.hr', '2014-06-10 05:00:31', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(107, 'admin@foi.hr', '2014-06-10 05:00:37', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik5@foi.hr''', 1),
(108, 'admin@foi.hr', '2014-06-10 05:00:37', 'Korisnicki racun otkljucan, racun korisnika: korisnik5@foi.hr', 2),
(109, 'admin@foi.hr', '2014-06-10 05:01:11', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik5@foi.hr''', 1),
(110, 'admin@foi.hr', '2014-06-10 05:01:14', 'Korisnicki racun zakljucan, racun korisnika: korisnik5@foi.hr ', 2),
(111, 'admin@foi.hr', '2014-06-10 05:01:17', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik5@foi.hr''', 1),
(112, 'admin@foi.hr', '2014-06-10 05:01:19', 'Korisnicki racun otkljucan, racun korisnika: korisnik5@foi.hr', 2),
(113, 'admin@foi.hr', '2014-06-10 05:02:07', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik5@foi.hr''', 1),
(114, 'admin@foi.hr', '2014-06-10 05:02:09', 'Korisnicki racun zakljucan, racun korisnika: korisnik5@foi.hr ', 2),
(115, 'admin@foi.hr', '2014-06-10 05:02:49', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik5@foi.hr''', 1),
(116, 'admin@foi.hr', '2014-06-10 05:02:49', 'Korisnicki racun otkljucan, racun korisnika: korisnik5@foi.hr', 2),
(117, 'admin@foi.hr', '2014-06-10 05:15:36', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik5@foi.hr''', 1),
(118, 'admin@foi.hr', '2014-06-10 05:15:36', 'Korisnicki racun otkljucan, racun korisnika: korisnik5@foi.hr', 2),
(119, 'admin@foi.hr', '2014-06-10 05:16:13', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik4@foi.hr''', 1),
(120, 'admin@foi.hr', '2014-06-10 05:16:13', 'Korisnicki racun zakljucan, racun korisnika: korisnik4@foi.hr ', 2),
(121, 'admin@foi.hr', '2014-06-10 05:16:15', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik4@foi.hr''', 1),
(122, 'admin@foi.hr', '2014-06-10 05:16:15', 'Korisnicki racun otkljucan, racun korisnika: korisnik4@foi.hr', 2),
(123, 'admin@foi.hr', '2014-06-10 05:16:18', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik4@foi.hr''', 1),
(124, 'admin@foi.hr', '2014-06-10 05:16:18', 'Korisnicki racun zakljucan, racun korisnika: korisnik4@foi.hr ', 2),
(125, 'admin@foi.hr', '2014-06-10 05:18:44', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik5@foi.hr''', 1),
(126, 'admin@foi.hr', '2014-06-10 05:18:44', 'Korisnicki racun zakljucan, racun korisnika: korisnik5@foi.hr ', 2),
(127, 'admin@foi.hr', '2014-06-10 05:18:44', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik5@foi.hr''', 1),
(128, 'admin@foi.hr', '2014-06-10 05:18:44', 'Korisnicki racun otkljucan, racun korisnika: korisnik5@foi.hr', 2),
(129, 'admin@foi.hr', '2014-06-10 05:27:27', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik5@foi.hr''', 1),
(130, 'admin@foi.hr', '2014-06-10 05:27:27', 'Korisnicki racun zakljucan, racun korisnika: korisnik5@foi.hr ', 2),
(131, 'admin@foi.hr', '2014-06-10 05:27:28', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(132, 'admin@foi.hr', '2014-06-10 05:27:28', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(133, 'admin@foi.hr', '2014-06-10 05:28:12', 'Postavljanje boje izbornika', 2),
(134, 'admin@foi.hr', '2014-06-10 05:28:22', 'Postavljanje boje izbornika', 2),
(135, 'admin@foi.hr', '2014-06-10 05:28:32', 'Postavljanje boje izbornika', 2),
(136, 'admin@foi.hr', '2014-06-10 05:28:53', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik4@foi.hr''', 1),
(137, 'admin@foi.hr', '2014-06-10 05:28:53', 'Korisnicki racun otkljucan, racun korisnika: korisnik4@foi.hr', 2),
(138, 'admin@foi.hr', '2014-06-10 05:28:55', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik1@foi.hr''', 1),
(139, 'admin@foi.hr', '2014-06-10 05:28:55', 'Korisnicki racun otkljucan, racun korisnika: korisnik1@foi.hr', 2),
(140, 'admin@foi.hr', '2014-06-10 05:32:05', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik1@foi.hr''', 1),
(141, 'admin@foi.hr', '2014-06-10 05:32:05', 'Korisnicki racun zakljucan, racun korisnika: korisnik1@foi.hr ', 2),
(142, 'admin@foi.hr', '2014-06-10 05:32:06', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik1@foi.hr''', 1),
(143, 'admin@foi.hr', '2014-06-10 05:32:06', 'Korisnicki racun otkljucan, racun korisnika: korisnik1@foi.hr', 2),
(144, 'admin@foi.hr', '2014-06-10 07:10:09', 'Update Korisnik SET status=1,broj_neusp=''4''WHERE email = ''admin@foi.hr''', 1),
(145, 'admin@foi.hr', '2014-06-10 07:10:09', 'Korisnicki racun otkljucan, racun korisnika: admin@foi.hr', 2),
(146, 'admin@foi.hr', '2014-06-10 07:10:13', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik1@foi.hr''', 1),
(147, 'admin@foi.hr', '2014-06-10 07:10:13', 'Korisnicki racun zakljucan, racun korisnika: korisnik1@foi.hr ', 2),
(148, 'admin@foi.hr', '2014-06-10 07:10:13', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik4@foi.hr''', 1),
(149, 'admin@foi.hr', '2014-06-10 07:10:13', 'Korisnicki racun zakljucan, racun korisnika: korisnik4@foi.hr ', 2),
(150, 'admin@foi.hr', '2014-06-10 07:10:15', 'Update Korisnik SET status=''3'',broj_neusp=0 WHERE email = ''mod8@foi.hr''', 1),
(151, 'admin@foi.hr', '2014-06-10 07:10:15', 'Korisnicki racun zakljucan, racun korisnika: mod8@foi.hr ', 2),
(152, 'admin@foi.hr', '2014-06-10 07:10:18', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(153, 'admin@foi.hr', '2014-06-10 07:10:18', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(154, 'admin@foi.hr', '2014-06-10 07:10:20', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(155, 'admin@foi.hr', '2014-06-10 07:10:20', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(156, 'admin@foi.hr', '2014-06-10 07:10:21', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(157, 'admin@foi.hr', '2014-06-10 07:10:21', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(158, 'admin@foi.hr', '2014-06-10 07:10:23', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik5@foi.hr''', 1),
(159, 'admin@foi.hr', '2014-06-10 07:10:23', 'Korisnicki racun otkljucan, racun korisnika: korisnik5@foi.hr', 2),
(160, 'admin@foi.hr', '2014-06-10 07:10:24', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik5@foi.hr''', 1),
(161, 'admin@foi.hr', '2014-06-10 07:10:24', 'Korisnicki racun zakljucan, racun korisnika: korisnik5@foi.hr ', 2),
(162, 'admin@foi.hr', '2014-06-10 07:10:29', 'Update Korisnik SET status=1,broj_neusp=''3''WHERE email = ''mod4@foi.hr''', 1),
(163, 'admin@foi.hr', '2014-06-10 07:10:29', 'Korisnicki racun otkljucan, racun korisnika: mod4@foi.hr', 2),
(164, 'admin@foi.hr', '2014-06-10 07:10:30', 'Update Korisnik SET status=''3'',broj_neusp=0 WHERE email = ''mod4@foi.hr''', 1),
(165, 'admin@foi.hr', '2014-06-10 07:10:30', 'Korisnicki racun zakljucan, racun korisnika: mod4@foi.hr ', 2),
(166, 'admin@foi.hr', '2014-06-10 07:11:34', 'Update Korisnik SET status=1,broj_neusp=''3''WHERE email = ''mod4@foi.hr''', 1),
(167, 'admin@foi.hr', '2014-06-10 07:11:34', 'Korisnicki racun otkljucan, racun korisnika: mod4@foi.hr', 2),
(168, 'admin@foi.hr', '2014-06-10 07:11:38', 'Update Korisnik SET status=''3'',broj_neusp=0 WHERE email = ''mod4@foi.hr''', 1),
(169, 'admin@foi.hr', '2014-06-10 07:11:38', 'Korisnicki racun zakljucan, racun korisnika: mod4@foi.hr ', 2),
(170, 'mod4@foi.hr', '2014-06-10 07:11:48', 'Zakljucavanje korisnickog racuna', 2),
(171, 'admin@foi.hr', '2014-06-10 07:11:54', 'Update Korisnik SET status=''3'',broj_neusp=0 WHERE email = ''mod4@foi.hr''', 1),
(172, 'admin@foi.hr', '2014-06-10 07:11:54', 'Korisnicki racun zakljucan, racun korisnika: mod4@foi.hr ', 2),
(173, 'admin@foi.hr', '2014-06-10 07:58:38', 'Postavljanje boje izbornika', 2),
(174, 'admin@foi.hr', '2014-06-10 07:58:49', 'Postavljanje boje izbornika', 2),
(175, 'admin@foi.hr', '2014-06-10 07:59:04', 'Postavljanje boje izbornika', 2),
(176, 'admin@foi.hr', '2014-06-10 07:59:21', 'Postavljanje boje izbornika', 2),
(177, 'admin@foi.hr', '2014-06-10 02:59:41', 'Preuzimanje vremena', 2),
(178, 'admin@foi.hr', '2014-06-10 05:59:55', 'Preuzimanje vremena', 2),
(179, 'admin@foi.hr', '2014-06-10 06:00:03', 'Postavljanje broja stranica', 2),
(180, 'admin@foi.hr', '2014-06-10 06:02:04', 'Postavljanje broja stranica', 2),
(181, 'admin@foi.hr', '2014-06-10 06:02:19', 'Postavljanje broja stranica', 2),
(182, 'admin@foi.hr', '2014-06-10 06:02:45', 'Postavljanje broja stranica', 2),
(183, 'admin@foi.hr', '2014-06-10 06:03:10', 'Postavljanje broja stranica', 2),
(184, 'admin@foi.hr', '2014-06-10 18:31:29', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(185, 'admin@foi.hr', '2014-06-10 18:31:29', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(186, 'admin@foi.hr', '2014-06-10 18:31:30', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik4@foi.hr''', 1),
(187, 'admin@foi.hr', '2014-06-10 18:31:30', 'Korisnicki racun otkljucan, racun korisnika: korisnik4@foi.hr', 2),
(188, 'admin@foi.hr', '2014-06-10 18:31:31', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik4@foi.hr''', 1),
(189, 'admin@foi.hr', '2014-06-10 18:31:31', 'Korisnicki racun zakljucan, racun korisnika: korisnik4@foi.hr ', 2),
(190, 'admin@foi.hr', '2014-06-10 18:31:37', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(191, 'admin@foi.hr', '2014-06-10 18:31:37', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(192, 'admin@foi.hr', '2014-06-10 18:31:38', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik4@foi.hr''', 1),
(193, 'admin@foi.hr', '2014-06-10 18:31:38', 'Korisnicki racun otkljucan, racun korisnika: korisnik4@foi.hr', 2),
(194, 'admin@foi.hr', '2014-06-10 18:31:41', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik5@foi.hr''', 1),
(195, 'admin@foi.hr', '2014-06-10 18:31:41', 'Korisnicki racun otkljucan, racun korisnika: korisnik5@foi.hr', 2),
(196, 'admin@foi.hr', '2014-06-10 18:32:17', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik4@foi.hr''', 1),
(197, 'admin@foi.hr', '2014-06-10 18:32:17', 'Korisnicki racun zakljucan, racun korisnika: korisnik4@foi.hr ', 2),
(198, 'admin@foi.hr', '2014-06-10 18:32:36', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik5@foi.hr''', 1),
(199, 'admin@foi.hr', '2014-06-10 18:32:36', 'Korisnicki racun zakljucan, racun korisnika: korisnik5@foi.hr ', 2),
(200, 'admin@foi.hr', '2014-06-10 18:32:36', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik4@foi.hr''', 1),
(201, 'admin@foi.hr', '2014-06-10 18:32:36', 'Korisnicki racun otkljucan, racun korisnika: korisnik4@foi.hr', 2),
(202, 'admin@foi.hr', '2014-06-10 18:32:37', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(203, 'admin@foi.hr', '2014-06-10 18:32:37', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(204, 'admin@foi.hr', '2014-06-10 18:32:37', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(205, 'admin@foi.hr', '2014-06-10 18:32:37', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(206, 'admin@foi.hr', '2014-06-10 18:32:37', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(207, 'admin@foi.hr', '2014-06-10 18:32:37', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(208, 'admin@foi.hr', '2014-06-10 18:32:37', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(209, 'admin@foi.hr', '2014-06-10 18:32:37', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(210, 'admin@foi.hr', '2014-06-10 18:32:38', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(211, 'admin@foi.hr', '2014-06-10 18:32:38', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(212, 'admin@foi.hr', '2014-06-10 18:32:38', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(213, 'admin@foi.hr', '2014-06-10 18:32:38', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(214, 'admin@foi.hr', '2014-06-10 18:32:38', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(215, 'admin@foi.hr', '2014-06-10 18:32:38', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(216, 'admin@foi.hr', '2014-06-10 18:32:38', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(217, 'admin@foi.hr', '2014-06-10 18:32:38', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(218, 'admin@foi.hr', '2014-06-10 18:32:39', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(219, 'admin@foi.hr', '2014-06-10 18:32:39', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(220, 'admin@foi.hr', '2014-06-10 18:32:39', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(221, 'admin@foi.hr', '2014-06-10 18:32:39', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(222, 'admin@foi.hr', '2014-06-10 18:32:40', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(223, 'admin@foi.hr', '2014-06-10 18:32:40', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(224, 'admin@foi.hr', '2014-06-10 19:55:31', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(225, 'admin@foi.hr', '2014-06-10 19:55:31', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(226, 'admin@foi.hr', '2014-06-10 19:55:33', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(227, 'admin@foi.hr', '2014-06-10 19:55:33', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(228, 'admin@foi.hr', '2014-06-10 21:05:52', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(229, 'admin@foi.hr', '2014-06-10 21:05:52', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(230, 'admin@foi.hr', '2014-06-10 21:05:54', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(231, 'admin@foi.hr', '2014-06-10 21:05:54', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(232, 'admin@foi.hr', '2014-06-10 21:06:11', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(233, 'admin@foi.hr', '2014-06-10 21:06:11', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(234, 'admin@foi.hr', '2014-06-10 21:06:12', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(235, 'admin@foi.hr', '2014-06-10 21:06:12', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(236, 'admin@foi.hr', '2014-06-11 02:58:09', 'Postavljanje boje izbornika', 2),
(237, 'admin@foi.hr', '2014-06-11 02:58:24', 'Postavljanje boje izbornika', 2),
(238, 'admin@foi.hr', '2014-06-11 02:58:35', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(239, 'admin@foi.hr', '2014-06-11 02:58:35', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(240, 'admin@foi.hr', '2014-06-11 02:58:35', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(241, 'admin@foi.hr', '2014-06-11 02:58:35', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(242, 'admin@foi.hr', '2014-06-11 02:58:37', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik5@foi.hr''', 1),
(243, 'admin@foi.hr', '2014-06-11 02:58:37', 'Korisnicki racun otkljucan, racun korisnika: korisnik5@foi.hr', 2),
(244, 'admin@foi.hr', '2014-06-11 02:58:39', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik5@foi.hr''', 1),
(245, 'admin@foi.hr', '2014-06-11 02:58:39', 'Korisnicki racun zakljucan, racun korisnika: korisnik5@foi.hr ', 2),
(246, 'admin@foi.hr', '2014-06-11 04:00:31', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(247, 'admin@foi.hr', '2014-06-11 04:03:06', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(248, 'admin@foi.hr', '2014-06-11 04:04:46', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(249, 'admin@foi.hr', '2014-06-11 04:06:08', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(250, 'admin@foi.hr', '2014-06-11 04:07:51', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(251, 'admin@foi.hr', '2014-06-11 04:07:51', 'UPDATE Gal_slik SET id_gal=''1'' ,  slika1=''awdaU66'' ,  slika2=''dawdawTTT'' ,  slika3=''dawda32''  WHERE id_gal=''1''', 1),
(252, 'admin@foi.hr', '2014-06-11 04:08:10', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(253, 'admin@foi.hr', '2014-06-11 04:08:11', 'UPDATE Gal_slik SET id_gal=''1'' ,  slika1=''awdaU66'' ,  slika2=''dawdawTTT'' ,  slika3=''dawda32''  WHERE id_gal=''1''', 1),
(254, 'admin@foi.hr', '2014-06-11 04:37:28', 'Uspjesna izmjena podatka kor_ime u tablici  Korisnik', 2),
(255, 'admin@foi.hr', '2014-06-11 04:37:28', 'UPDATE Korisnik SET email=''admin@foi.hr'' ,  ime=''Administator'' ,  prezime=''PrezimeAdmin'' ,  adresa=''ADminska755'' ,  grad=''GRADZZZ'' ,  kor_ime=''admin'' ,  lozinka=''admin2323'' ,  broj=''null'' ,  datum_rod=''1992-12-06'' ,  spol=''Muski'' ,  obavijesti=''2'' ,  status=''4'' ,  slika=''null'' ,  aktivacija=''null'' ,  datum_reg=''0000-00-00'' ,  broj_neusp=''1''  WHERE kor_ime=''admin''', 1),
(256, 'admin@foi.hr', '2014-06-11 04:38:11', 'Uspjesna izmjena podatka kor_ime u tablici  Korisnik', 2),
(257, 'admin@foi.hr', '2014-06-11 04:38:11', 'UPDATE Korisnik SET email=''korisnik2@foi.hr'' ,  ime=''korisnik2'' ,  prezime=''korisnik2'' ,  adresa=''korisnicka'' ,  grad=''Split'' ,  kor_ime=''kor2'' ,  lozinka=''bbd6a54deb2ded160cd43902b3583d4e'' ,  broj=''099'' ,  datum_rod=''1993-04-15'' ,  spol=''Muski'' ,  obavijesti=''1'' ,  status=''2'' ,  slika=''null'' ,  aktivacija=''null'' ,  datum_reg=''null'' ,  broj_neusp=''0''  WHERE kor_ime=''kor2''', 1),
(258, 'admin@foi.hr', '2014-06-11 04:38:21', 'Uspjesna izmjena podatka kor_ime u tablici  Korisnik', 2),
(259, 'admin@foi.hr', '2014-06-11 04:38:21', 'UPDATE Korisnik SET email=''admin@foi.hr'' ,  ime=''Administator'' ,  prezime=''PrezimeAdmin'' ,  adresa=''ADminska755'' ,  grad=''GRADZZZ'' ,  kor_ime=''admin'' ,  lozinka=''admin2323'' ,  broj=''null'' ,  datum_rod=''1992-12-06'' ,  spol=''Muski'' ,  obavijesti=''2'' ,  status=''4'' ,  slika=''null'' ,  aktivacija=''null'' ,  datum_reg=''0000-00-00'' ,  broj_neusp=''0''  WHERE kor_ime=''admin''', 1),
(260, 'admin@foi.hr', '2014-06-11 04:38:39', 'Uspjesna izmjena podatka id_kurs u tablici  Djelatinici', 2),
(261, 'admin@foi.hr', '2014-06-11 04:38:39', 'UPDATE Djelatinici SET id_kurs=''3'' ,  id_kor=''mod3@foi.hr'' ,  status=''2''  WHERE id_kurs=''3''', 1),
(262, 'admin@foi.hr', '2014-06-11 04:38:49', 'Uspjesna izmjena podatka id_diorute u tablici  Dio_rute', 2),
(263, 'admin@foi.hr', '2014-06-11 04:38:49', 'UPDATE Dio_rute SET id_diorute=''5'' ,  id_rute=''3'' ,  id_kurs=''1'' ,  id_dostavnog=''2'' ,  oznaka=''1''  WHERE id_diorute=''5''', 1),
(264, 'admin@foi.hr', '2014-06-11 04:40:09', 'Uspjesna izmjena podatka id_kurs u tablici  Dostavne_lok', 2),
(265, 'admin@foi.hr', '2014-06-11 04:40:09', 'UPDATE Dostavne_lok SET id_kurs=''2'' ,  id_mprima=''2'' ,  status=''0''  WHERE id_kurs=''2''', 1),
(266, 'admin@foi.hr', '2014-06-11 04:40:29', 'Uspjesna izmjena podatka id_kurs u tablici  Dostavne_lok', 2),
(267, 'admin@foi.hr', '2014-06-11 04:40:29', 'UPDATE Dostavne_lok SET id_kurs=''2'' ,  id_mprima=''2'' ,  status=''0''  WHERE id_kurs=''2''', 1),
(268, 'admin@foi.hr', '2014-06-11 04:41:06', 'Uspjesna izmjena podatka id_kurs u tablici  Dostavne_lok', 2),
(269, 'admin@foi.hr', '2014-06-11 04:41:06', 'UPDATE Dostavne_lok SET id_kurs=''2'' ,  id_mprima=''2'' ,  status=''0''  WHERE id_kurs=''2''', 1),
(270, 'admin@foi.hr', '2014-06-11 04:44:41', 'Uspjesna izmjena podatka id_kurs u tablici  Dostavne_lok', 2),
(271, 'admin@foi.hr', '2014-06-11 04:44:41', 'UPDATE Dostavne_lok SET id_kurs=''10'' ,  id_mprima=''12'' ,  status=''1''  WHERE id_kurs=''10''', 1),
(272, 'admin@foi.hr', '2014-06-11 04:46:50', 'Postavljanje boje izbornika', 2),
(273, 'admin@foi.hr', '2014-06-11 04:47:30', 'Postavljanje boje izbornika', 2),
(274, 'admin@foi.hr', '2014-06-11 04:47:45', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(275, 'admin@foi.hr', '2014-06-11 04:47:45', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(276, 'admin@foi.hr', '2014-06-11 04:47:46', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(277, 'admin@foi.hr', '2014-06-11 04:47:46', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(278, 'admin@foi.hr', '2014-06-11 04:47:49', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(279, 'admin@foi.hr', '2014-06-11 04:47:49', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(280, 'admin@foi.hr', '2014-06-11 04:47:49', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(281, 'admin@foi.hr', '2014-06-11 04:47:49', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(282, 'admin@foi.hr', '2014-06-11 04:48:10', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(283, 'admin@foi.hr', '2014-06-11 04:48:10', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(284, 'admin@foi.hr', '2014-06-11 04:48:23', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(285, 'admin@foi.hr', '2014-06-11 04:48:23', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(286, 'admin@foi.hr', '2014-06-11 04:51:26', 'INSERT INTO Gal_slik VALUES ( ''3'',  ''chggvchc'',  ''hchcfhfc'',  ''bcfc'' ) ', 1),
(287, 'admin@foi.hr', '2014-06-11 04:51:26', 'Uspjesno dodavanje u tablicu Gal_slik', 2),
(288, 'admin@foi.hr', '2014-06-11 15:29:05', 'Postavljanje boje izbornika', 2),
(289, 'admin@foi.hr', '2014-06-11 15:29:41', 'Postavljanje boje izbornika', 2),
(290, 'admin@foi.hr', '2014-06-11 18:49:30', 'Uspjesna izmjena podatka kor_ime u tablici  Korisnik', 2),
(291, 'admin@foi.hr', '2014-06-11 18:49:30', 'UPDATE Korisnik SET email=''admin@foi.hr'' ,  ime=''Administator'' ,  prezime=''PrezimeAdmin'' ,  adresa=''ADminska755'' ,  grad=''GRADZZZ'' ,  kor_ime=''admin'' ,  lozinka=''admin2323'' ,  broj=''null'' ,  datum_rod=''1992-12-06'' ,  spol=''Muski'' ,  obavijesti=''2'' ,  status=''4'' ,  slika=''null'' ,  aktivacija=''null'' ,  datum_reg=''0000-00-00'' ,  broj_neusp=''0''  WHERE kor_ime=''admin''', 1),
(292, 'admin@foi.hr', '2014-06-11 18:49:49', 'Uspjesna izmjena podatka kor_ime u tablici  Korisnik', 2),
(293, 'admin@foi.hr', '2014-06-11 18:49:49', 'UPDATE Korisnik SET email=''admin@foi.hr'' ,  ime=''Administator'' ,  prezime=''PrezimeAdmin'' ,  adresa=''ADminska755'' ,  grad=''GRADZZZ'' ,  kor_ime=''admin'' ,  lozinka=''admin2323'' ,  broj=''null'' ,  datum_rod=''1992-12-06'' ,  spol=''Muski'' ,  obavijesti=''2'' ,  status=''4'' ,  slika=''null'' ,  aktivacija=''null'' ,  datum_reg=''0000-00-00'' ,  broj_neusp=''0''  WHERE kor_ime=''admin''', 1),
(294, 'admin@foi.hr', '2014-06-11 21:13:49', 'INSERT INTO Djelatinici VALUES (''1'',''mod1@foi.hr'',1)', 1),
(295, 'admin@foi.hr', '2014-06-11 21:13:49', 'Dodijeljen postar 1, Kurirskoj sluzbi s ID: mod1@foi.hr ...', 2),
(296, 'admin@foi.hr', '2014-06-11 21:14:03', 'INSERT INTO Djelatinici VALUES (''1'',''mod6@foi.hr'',1)', 1),
(297, 'admin@foi.hr', '2014-06-11 21:14:03', 'Dodijeljen postar 1, Kurirskoj sluzbi s ID: mod6@foi.hr ...', 2),
(298, 'admin@foi.hr', '2014-06-11 21:23:30', 'INSERT INTO Djelatinici VALUES (''2'',''mod1@foi.hr'',1)', 1),
(299, 'admin@foi.hr', '2014-06-11 21:23:30', 'Dodijeljen postar 2, Kurirskoj sluzbi s ID: mod1@foi.hr ...', 2),
(300, 'admin@foi.hr', '2014-06-11 21:28:48', 'Uspjesna izmjena podatka kor_ime u tablici  Korisnik', 2),
(301, 'admin@foi.hr', '2014-06-11 21:28:48', 'UPDATE Korisnik SET email=''andre.brudic@hotmail.com'' ,  ime=''Andre'' ,  prezime=''BrundiÄ‡'' ,  adresa=''Zutnicka'' ,  grad=''Zagreb'' ,  kor_ime=''Andre'' ,  lozinka=''2f72c9a8b883d9650bb5'' ,  broj=''0993793482'' ,  datum_rod=''0000-00-00'' ,  spol=''Muski'' ,  obavijesti=''2'' ,  status=''0'' ,  slika=''null'' ,  aktivacija=''7dfb7e9a0d0e1262fa1a67e97f381550'' ,  datum_reg=''2014-05-28'' ,  broj_neusp=''0''  WHERE kor_ime=''Andre''', 1),
(302, 'admin@foi.hr', '2014-06-11 21:31:43', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(303, 'admin@foi.hr', '2014-06-11 21:31:43', 'UPDATE Gal_slik SET id_gal=''3'' ,  slika1=''chggvchcÅ½ Ä'' ,  slika2=''hchcfhfcÅ  Ä‘Å¡Ä'' ,  slika3=''ÄŒ''  WHERE id_gal=''3''', 1),
(304, 'admin@foi.hr', '2014-06-11 21:38:00', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(305, 'admin@foi.hr', '2014-06-11 21:38:00', 'UPDATE Gal_slik SET id_gal=''3'' ,  slika1=''chggvchŠŠ'' ,  slika2=''?Ž?Ž?Ž'' ,  slika3=''Ž??Ž''  WHERE id_gal=''3''', 1),
(306, 'admin@foi.hr', '2014-06-11 21:38:41', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(307, 'admin@foi.hr', '2014-06-11 21:38:41', 'UPDATE Gal_slik SET id_gal=''3'' ,  slika1=''ššŠŠ'' ,  slika2=''????'' ,  slika3=''????''  WHERE id_gal=''3''', 1),
(308, 'admin@foi.hr', '2014-06-11 21:40:14', 'Uspjesna izmjena podatka id_gal u tablici  Gal_slik', 2),
(309, 'admin@foi.hr', '2014-06-11 21:40:14', 'UPDATE Gal_slik SET id_gal=''3'' ,  slika1=''Å½Å½Å½'' ,  slika2=''ÄÄÄ'' ,  slika3=''Å¡Å¡Å¡Ä‡Ä‡Ä‡Ä‡Å ''  WHERE id_gal=''3''', 1),
(310, 'admin@foi.hr', '2014-06-12 01:27:32', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(311, 'admin@foi.hr', '2014-06-12 01:27:32', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(312, 'admin@foi.hr', '2014-06-12 01:27:33', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(313, 'admin@foi.hr', '2014-06-12 01:27:33', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(314, 'korisnik1@foi.hr', '2014-06-12 01:53:23', 'Neuspjesna prijava!', 2),
(315, 'korisnik1@foi.hr', '2014-06-12 01:53:37', 'Uspjesna prijava!', 2),
(316, 'korisnik1@foi.hr', '2014-06-12 01:53:37', 'Update Korisnik set broj_neusp=0 where kor_ime=''kor1''', 1),
(317, 'admin@foi.hr', '2014-06-12 02:41:05', 'Not.mail zipidus@gmail.com,paket-naziv: paket5  ', 2),
(318, 'admin@foi.hr', '2014-06-12 03:06:44', 'Uspjesna prijava!', 2),
(319, 'admin@foi.hr', '2014-06-12 03:07:06', 'Postavljanje broja stranica', 2),
(320, 'admin@foi.hr', '2014-06-12 03:07:21', 'Postavljanje broja stranica', 2),
(321, 'admin@foi.hr', '2014-06-12 08:19:11', 'Uspjesna prijava!', 2),
(322, 'admin@foi.hr', '2014-06-12 08:20:14', 'Preuzimanje vremena', 2),
(323, 'admin@foi.hr', '2014-06-12 08:57:21', 'Uspjesna prijava!', 2),
(324, 'admin@foi.hr', '2014-06-13 20:44:43', 'Uspjesna prijava!', 2),
(325, 'admin@foi.hr', '2014-06-13 21:07:24', 'Uspjesna prijava!', 2),
(326, 'admin@foi.hr', '2014-06-13 21:34:07', 'Uspjesna prijava!', 2),
(327, 'admin@foi.hr', '2014-06-13 21:37:57', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik4@foi.hr''', 1),
(328, 'admin@foi.hr', '2014-06-13 21:37:57', 'Korisnicki racun zakljucan, racun korisnika: korisnik4@foi.hr ', 2),
(329, 'admin@foi.hr', '2014-06-13 21:38:06', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik4@foi.hr''', 1),
(330, 'admin@foi.hr', '2014-06-13 21:38:06', 'Korisnicki racun otkljucan, racun korisnika: korisnik4@foi.hr', 2),
(331, 'admin@foi.hr', '2014-06-13 21:38:16', 'Update Korisnik SET status=1,broj_neusp=''3''WHERE email = ''mod11@foi.hr''', 1),
(332, 'admin@foi.hr', '2014-06-13 21:38:16', 'Korisnicki racun otkljucan, racun korisnika: mod11@foi.hr', 2),
(333, 'admin@foi.hr', '2014-06-13 21:39:46', 'Update Korisnik SET status=''3'',broj_neusp=0 WHERE email = ''mod11@foi.hr''', 1),
(334, 'admin@foi.hr', '2014-06-13 21:39:46', 'Korisnicki racun zakljucan, racun korisnika: mod11@foi.hr ', 2),
(335, 'admin@foi.hr', '2014-06-13 21:40:04', 'Update Korisnik SET status=1,broj_neusp=''4''WHERE email = ''zipidus@gmail.com''', 1),
(336, 'admin@foi.hr', '2014-06-13 21:40:04', 'Korisnicki racun otkljucan, racun korisnika: zipidus@gmail.com', 2),
(337, 'admin@foi.hr', '2014-06-13 21:40:12', 'Update Korisnik SET status=''4'',broj_neusp=0 WHERE email = ''zipidus@gmail.com''', 1),
(338, 'admin@foi.hr', '2014-06-13 21:40:12', 'Korisnicki racun zakljucan, racun korisnika: zipidus@gmail.com ', 2),
(339, 'admin@foi.hr', '2014-06-13 21:41:19', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(340, 'admin@foi.hr', '2014-06-13 21:41:19', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(341, 'admin@foi.hr', '2014-06-13 21:41:24', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik4@foi.hr''', 1),
(342, 'admin@foi.hr', '2014-06-13 21:41:24', 'Korisnicki racun zakljucan, racun korisnika: korisnik4@foi.hr ', 2),
(343, 'korisnik1@foi.hr', '2014-06-13 22:03:01', 'Uspjesna prijava!', 2),
(344, 'admin@foi.hr', '2014-06-13 23:02:45', 'Uspjesna prijava!', 2),
(345, 'admin@foi.hr', '2014-06-14 15:17:36', 'Uspjesna prijava!', 2),
(346, 'admin@foi.hr', '2014-06-14 15:18:20', 'Uspjesna izmjena podatka kor_ime u tablici  Korisnik', 2),
(347, 'admin@foi.hr', '2014-06-14 15:18:20', 'UPDATE Korisnik SET email=''admin@foi.hr'' ,  ime=''Administator'' ,  prezime=''PrezimeAdmin'' ,  adresa=''ADminska755'' ,  grad=''GRADZZZ'' ,  kor_ime=''admin'' ,  lozinka=''admin2323'' ,  broj=''null'' ,  datum_rod=''1992-12-06'' ,  spol=''Muski'' ,  obavijesti=''2'' ,  status=''4'' ,  slika=''null'' ,  aktivacija=''null'' ,  datum_reg=''0000-00-00'' ,  broj_neusp=''0''  WHERE kor_ime=''admin''', 1),
(348, 'admin@foi.hr', '2014-06-14 18:12:35', 'Uspjesna prijava!', 2),
(349, 'admin@foi.hr', '2014-06-14 19:59:15', 'Uspjesna prijava!', 2),
(350, 'kanta2323@gmail.com', '2014-06-14 20:09:07', 'Uspjesna prijava!', 2),
(351, 'kanta2323@gmail.com', '2014-06-14 20:20:39', 'Uspjesna prijava!', 2),
(352, 'admin@foi.hr', '2014-06-14 20:27:28', 'Uspjesna prijava!', 2),
(353, 'admin@foi.hr', '2014-06-14 20:38:04', 'Uspjesna prijava!', 2),
(354, 'admin@foi.hr', '2014-06-14 20:42:50', 'Uspjesna prijava!', 2),
(355, 'admin@foi.hr', '2014-06-14 22:03:13', 'Uspjesna prijava!', 2),
(356, 'kanta2323@gmail.com', '2014-06-15 00:48:37', 'Uspjesna prijava!', 2),
(357, 'admin@foi.hr', '2014-06-15 01:30:52', 'Uspjesna prijava!', 2),
(358, 'admin@foi.hr', '2014-06-15 02:02:41', 'Uspjesna prijava!', 2),
(359, 'admin@foi.hr', '2014-06-15 02:33:00', 'Uspjesna prijava!', 2),
(360, 'kanta2323@gmail.com', '2014-06-15 02:37:17', 'Uspjesna prijava!', 2),
(361, 'admin@foi.hr', '2014-06-15 02:57:16', 'Uspjesna prijava!', 2),
(362, 'admin@foi.hr', '2014-06-15 04:58:51', 'Uspjesna prijava!', 2),
(363, 'admin@foi.hr', '2014-06-15 16:46:04', 'Uspjesna prijava!', 2),
(364, 'mod6@foi.hr', '2014-06-15 16:46:58', 'Uspjesna prijava!', 2),
(365, 'admin@foi.hr', '2014-06-15 16:47:23', 'Uspjesna prijava!', 2),
(366, 'korisnik23@foi.hr', '2014-06-15 16:47:53', 'Uspjesna prijava!', 2),
(367, 'admin@foi.hr', '2014-06-15 18:04:50', 'Uspjesna prijava!', 2),
(368, 'mod11@foi.hr', '2014-06-15 18:33:37', 'Uspjesna prijava!', 2),
(369, 'admin@foi.hr', '2014-06-15 18:59:48', 'Uspjesna prijava!', 2),
(370, 'mod11@foi.hr', '2014-06-15 19:24:54', 'Uspjesna prijava!', 2),
(371, 'mod7@foi.hr', '2014-06-15 21:47:35', 'Uspjesna prijava!', 2),
(372, 'mod7@foi.hr', '2014-06-15 21:48:48', 'Uspjesna prijava!', 2),
(373, 'mod8@foi.hr', '2014-06-15 21:56:13', 'Uspjesna prijava!', 2),
(374, 'mod7@foi.hr', '2014-06-15 21:59:30', 'Uspjesna prijava!', 2),
(375, 'mod7@foi.hr', '2014-06-15 23:16:17', 'Uspjesna prijava!', 2),
(376, 'mod11@foi.hr', '2014-06-15 23:16:47', 'Uspjesna prijava!', 2),
(377, 'mod11@foi.hr', '2014-06-16 02:38:04', 'Uspjesna prijava!', 2),
(378, 'mod11@foi.hr', '2014-06-16 05:57:02', 'Uspjesna prijava!', 2),
(379, 'mod11@foi.hr', '2014-06-16 06:02:09', 'Kreiran paket primatelj: kor1', 2),
(380, 'mod11@foi.hr', '2014-06-16 07:00:08', 'Paket 17 preuzet i opisan ', 2),
(381, 'korisnik1@foi.hr', '2014-06-16 07:19:55', 'Uspjesna prijava!', 2),
(382, 'admin@foi.hr', '2014-06-16 07:21:20', 'Uspjesna prijava!', 2),
(383, 'korisnik1@foi.hr', '2014-06-16 07:23:05', 'Uspjesna prijava!', 2),
(384, 'mod11@foi.hr', '2014-06-16 09:05:22', 'Uspjesna prijava!', 2),
(385, 'mod11@foi.hr', '2014-06-16 10:50:56', 'Azurirana lokacija za paket 17', 2),
(386, 'mod11@foi.hr', '2014-06-16 11:02:23', 'Paket 17 je preuzet', 2),
(387, 'admin@foi.hr', '2014-06-16 13:02:49', 'Uspjesna prijava!', 2),
(388, 'admin@foi.hr', '2014-06-16 18:24:47', 'Uspjesna prijava!', 2),
(389, 'mod11@foi.hr', '2014-06-16 18:55:15', 'Uspjesna prijava!', 2),
(390, 'admin@foi.hr', '2014-06-16 19:23:15', 'Uspjesna prijava!', 2),
(391, 'admin@foi.hr', '2014-06-16 22:43:30', 'Uspjesna prijava!', 2),
(392, 'mod11@foi.hr', '2014-06-16 22:48:28', 'Uspjesna prijava!', 2),
(393, 'mod11@foi.hr', '2014-06-16 22:52:47', 'Azurirana lokacija za paket 17', 2),
(394, 'mod11@foi.hr', '2014-06-16 22:52:52', 'Paket 17 je preuzet', 2),
(395, 'mod11@foi.hr', '2014-06-16 22:53:00', 'Azurirana lokacija za paket 17', 2),
(396, 'mod11@foi.hr', '2014-06-16 23:01:15', 'Uspjesna prijava!', 2),
(397, 'korisnik1@foi.hr', '2014-06-16 23:09:50', 'Uspjesna prijava!', 2),
(398, 'mod11@foi.hr', '2014-06-16 23:16:37', 'Uspjesna prijava!', 2),
(399, 'admin@foi.hr', '2014-06-16 23:33:01', 'Uspjesna prijava!', 2),
(400, 'admin@foi.hr', '2014-06-16 23:35:02', 'Uspjesna prijava!', 2),
(401, 'admin@foi.hr', '2014-06-17 00:12:57', 'Uspjesna prijava!', 2),
(402, 'mod11@foi.hr', '2014-06-17 00:14:16', 'Uspjesna prijava!', 2),
(403, 'mod11@foi.hr', '2014-06-17 00:16:17', 'Uspjesna prijava!', 2),
(404, 'admin@foi.hr', '2014-06-17 01:09:59', 'Uspjesna prijava!', 2),
(405, 'korisnik1@foi.hr', '2014-06-17 03:37:41', 'Uspjesna prijava!', 2),
(406, 'korisnik1@foi.hr', '2014-06-17 07:40:09', 'Uspjesna prijava!', 2),
(407, 'admin@foi.hr', '2014-06-17 13:53:41', 'Uspjesna prijava!', 2),
(408, 'korisnik1@foi.hr', '2014-06-17 17:31:50', 'Uspjesna prijava!', 2),
(409, 'admin@foi.hr', '2014-06-17 20:33:50', 'Uspjesna prijava!', 2),
(410, 'admin@foi.hr', '2014-06-17 22:23:19', 'Uspjesna prijava!', 2),
(411, 'admin@foi.hr', '2014-06-17 23:12:30', 'Not.mail kanta2323@gmail.com,paket-naziv: naziv_16  ', 2),
(412, 'admin@foi.hr', '2014-06-17 23:58:57', 'Uspjesna prijava!', 2),
(413, 'admin@foi.hr', '2014-06-18 00:42:02', 'Uspjesna prijava!', 2),
(414, 'admin@foi.hr', '2014-06-18 01:01:17', 'Uspjesna prijava!', 2),
(415, 'admin@foi.hr', '2014-06-18 01:05:25', 'Uspjesna prijava!', 2),
(416, 'mod11@foi.hr', '2014-06-18 01:09:26', 'Uspjesna prijava!', 2),
(417, 'mod11@foi.hr', '2014-06-18 01:49:00', 'Uspjesna prijava!', 2),
(418, 'mod11@foi.hr', '2014-06-18 04:18:24', 'Uspjesna prijava!', 2),
(419, 'mod3@foi.hr', '2014-06-18 05:51:22', 'Uspjesna prijava!', 2),
(420, 'admin@foi.hr', '2014-06-18 06:16:45', 'Uspjesna prijava!', 2),
(421, 'admin@foi.hr', '2014-06-18 08:36:53', 'Uspjesna prijava!', 2),
(422, 'admin@foi.hr', '2014-06-18 10:11:40', 'Postavljanje boje izbornika', 2),
(423, 'admin@foi.hr', '2014-06-18 10:13:05', 'Postavljanje tipa grafikona', 2),
(424, 'admin@foi.hr', '2014-06-18 10:14:23', 'Postavljanje tipa grafikona', 2),
(425, 'admin@foi.hr', '2014-06-18 10:14:43', 'Postavljanje tipa grafikona', 2),
(426, 'admin@foi.hr', '2014-06-18 10:16:16', 'Postavljanje tipa grafikona', 2),
(427, 'admin@foi.hr', '2014-06-18 10:23:05', 'Postavljanje tipa grafikona', 2),
(428, 'admin@foi.hr', '2014-06-18 10:23:20', 'Postavljanje tipa grafikona', 2),
(429, 'admin@foi.hr', '2014-06-18 10:23:47', 'Postavljanje tipa grafikona', 2),
(430, 'admin@foi.hr', '2014-06-18 10:24:42', 'Postavljanje tipa grafikona', 2),
(431, 'admin@foi.hr', '2014-06-18 10:25:00', 'Postavljanje tipa grafikona', 2),
(432, 'admin@foi.hr', '2014-06-18 10:25:47', 'Postavljanje tipa grafikona', 2),
(433, 'admin@foi.hr', '2014-06-18 10:26:35', 'Postavljanje tipa grafikona', 2),
(434, 'admin@foi.hr', '2014-06-18 10:26:48', 'Postavljanje tipa grafikona', 2),
(435, 'admin@foi.hr', '2014-06-18 10:53:16', 'Uspjesna prijava!', 2),
(436, 'admin@foi.hr', '2014-06-18 10:54:04', 'Uspjesna prijava!', 2),
(437, 'admin@foi.hr', '2014-06-18 10:56:21', 'Uspjesna prijava!', 2),
(438, 'admin@foi.hr', '2014-06-18 19:33:08', 'Uspjesna prijava!', 2),
(439, 'admin@foi.hr', '2014-06-18 21:56:26', 'Uspjesna prijava!', 2),
(440, 'admin@foi.hr', '2014-06-18 22:37:29', 'Uspjesna prijava!', 2),
(441, 'admin@foi.hr', '2014-06-19 00:00:12', 'Uspjesna prijava!', 2),
(442, 'admin@foi.hr', '2014-06-19 22:22:00', 'Uspjesna prijava!', 2),
(443, 'admin@foi.hr', '2014-06-19 22:45:19', 'Uspjesna prijava!', 2),
(444, 'admin@foi.hr', '2014-06-20 06:44:58', 'Uspjesna prijava!', 2),
(445, 'admin@foi.hr', '2014-06-20 06:51:11', 'Postavljanje tipa grafikona', 2),
(446, 'admin@foi.hr', '2014-06-20 23:08:01', 'Uspjesna prijava!', 2),
(447, 'korisnik1@foi.hr', '2014-06-22 05:30:05', 'Uspjesna prijava!', 2),
(448, 'admin@foi.hr', '2014-06-22 05:31:03', 'Neuspjesna prijava!', 2),
(449, 'admin@foi.hr', '2014-06-22 05:31:07', 'Uspjesna prijava!', 2),
(450, 'mod11@foi.hr', '2014-06-23 19:59:39', 'Uspjesna prijava!', 2),
(451, 'mod11@foi.hr', '2014-06-23 20:10:18', 'Azurirana lokacija za paket 17', 2),
(452, 'mod11@foi.hr', '2014-06-23 20:10:22', 'Azurirana lokacija za paket 17', 2),
(453, 'mod11@foi.hr', '2014-06-23 20:11:48', 'Azurirana lokacija za paket 17', 2),
(454, 'korisnik1@foi.hr', '2014-06-23 20:20:37', 'Uspjesna prijava!', 2),
(455, 'admin@foi.hr', '2014-06-23 20:22:52', 'Uspjesna prijava!', 2),
(456, 'admin@foi.hr', '2014-06-23 20:24:01', 'Postavljanje tipa grafikona', 2),
(457, 'admin@foi.hr', '2014-06-23 20:24:14', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik4@foi.hr''', 1),
(458, 'admin@foi.hr', '2014-06-23 20:24:14', 'Korisnicki racun otkljucan, racun korisnika: korisnik4@foi.hr', 2),
(459, 'admin@foi.hr', '2014-06-23 20:24:14', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(460, 'admin@foi.hr', '2014-06-23 20:24:14', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(461, 'admin@foi.hr', '2014-06-23 20:24:30', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''korisnik6@foi.hr''', 1),
(462, 'admin@foi.hr', '2014-06-23 20:24:30', 'Korisnicki racun otkljucan, racun korisnika: korisnik6@foi.hr', 2),
(463, 'admin@foi.hr', '2014-06-23 20:24:31', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''korisnik6@foi.hr''', 1),
(464, 'admin@foi.hr', '2014-06-23 20:24:31', 'Korisnicki racun zakljucan, racun korisnika: korisnik6@foi.hr ', 2),
(465, 'mod11@foi.hr', '2014-06-23 20:55:31', 'Uspjesna prijava!', 2),
(466, 'admin@foi.hr', '2014-06-23 21:04:20', 'Uspjesna prijava!', 2),
(467, 'admin@foi.hr', '2014-06-23 21:09:26', 'Uspjesna prijava!', 2),
(470, 'admin@foi.hr', '2014-06-23 23:17:21', 'Uspjesna prijava!', 2),
(471, 'admin@foi.hr', '2014-06-23 23:17:35', 'Not.mail kanta2323@gmail.com,paket-naziv: naziv_16  ', 2),
(472, 'admin@foi.hr', '2014-06-23 23:18:22', 'Not.mail kanta2323@gmail.com,paket-naziv: naziv_16  ', 2),
(475, 'admin@foi.hr', '2014-06-24 01:27:57', 'Uspjesna prijava!', 2),
(476, 'korisnik1@foi.hr', '2014-06-24 01:40:44', 'Uspjesna prijava!', 2),
(477, 'korisnik1@foi.hr', '2014-06-24 01:55:10', 'Uspjesna prijava!', 2),
(478, 'bojozicaci@mailpick.biz', '2014-06-24 04:05:38', 'Registracija korisnika', 2),
(479, 'bojozicaci@mailpick.biz', '2014-06-24 04:07:49', 'Uspjesna aktivacija', 2),
(480, 'bojozicaci@mailpick.biz', '2014-06-24 04:09:00', 'Uspjesna aktivacija', 2),
(481, 'admin@foi.hr', '2014-06-24 04:26:30', 'Uspjesna prijava!', 2),
(482, 'admin@foi.hr', '2014-06-24 04:28:15', 'Uspjesna prijava!', 2),
(483, 'admin@foi.hr', '2014-06-24 04:28:59', 'Uspjesna prijava!', 2),
(484, 'admin@foi.hr', '2014-06-24 04:29:23', 'Uspjesna prijava!', 2),
(485, 'admin@foi.hr', '2014-06-24 04:30:42', 'Uspjesna prijava!', 2),
(486, 'admin@foi.hr', '2014-06-24 04:31:10', 'Uspjesna prijava!', 2),
(487, 'admin@foi.hr', '2014-06-24 04:31:36', 'Uspjesna prijava!', 2),
(488, 'admin@foi.hr', '2014-06-24 04:35:48', 'Uspjesna prijava!', 2),
(489, 'admin@foi.hr', '2014-06-24 04:35:56', 'Uspjesna prijava!', 2),
(490, 'admin@foi.hr', '2014-06-24 04:36:42', 'Uspjesna prijava!', 2),
(491, 'admin@foi.hr', '2014-06-24 04:37:03', 'Uspjesna prijava!', 2),
(492, 'admin@foi.hr', '2014-06-24 05:03:54', 'Uspjesna prijava!', 2),
(493, 'admin@foi.hr', '2014-06-24 05:04:39', 'Uspjesna prijava!', 2),
(494, 'admin@foi.hr', '2014-06-24 05:07:20', 'Uspjesna prijava!', 2),
(496, 'admin@foi.hr', '2014-06-24 05:23:14', 'Uspjesna prijava!', 2),
(497, 'admin@foi.hr', '2014-06-24 05:31:37', 'Uspjesna prijava!', 2),
(498, 'bojozicaci@mailpick.biz', '2014-06-24 05:32:45', 'Neuspjesna prijava!', 2),
(499, 'bojozicaci@mailpick.biz', '2014-06-24 05:33:04', 'Neuspjesna prijava!', 2),
(500, 'bojozicaci@mailpick.biz', '2014-06-24 05:33:04', 'Zakljucavanje korisnickog racuna', 2),
(501, 'bojozicaci@mailpick.biz', '2014-06-24 05:33:54', 'Zahtjev za novom lozinkom', 2),
(502, 'bojozicaci@mailpick.biz', '2014-06-24 05:36:00', 'Zahtjev za novom lozinkom', 2),
(503, 'bojozicaci@mailpick.biz', '2014-06-24 05:38:31', 'Dodijeljena nova lozinka', 2),
(504, 'nesto@coldemail.info', '2014-06-24 05:42:41', 'Registracija korisnika', 2),
(505, 'nesto@coldemail.info', '2014-06-24 05:46:11', 'Uspjesna aktivacija', 2),
(506, 'nesto@coldemail.info', '2014-06-24 05:48:03', 'Uspjesna aktivacija', 2);
INSERT INTO `Radnje_baza` (`id_baza`, `id_kor`, `datum_rada`, `opis`, `tip`) VALUES
(507, 'nesto@coldemail.info', '2014-06-24 05:48:29', 'Neuspjesna prijava!', 2),
(508, 'nesto@coldemail.info', '2014-06-24 05:48:54', 'Neuspjesna prijava!', 2),
(509, 'nesto@coldemail.info', '2014-06-24 05:49:23', 'Zakljucavanje korisnickog racuna', 2),
(510, 'nesto@coldemail.info', '2014-06-24 05:52:23', 'Uspjesna prijava!', 2),
(511, 'nesto@coldemail.info', '2014-06-24 05:53:04', 'Uspjesna prijava!', 2),
(512, 'nesto@coldemail.info', '2014-06-24 05:55:42', 'Kreiran paket primatelj: mod11', 2),
(513, 'mod11@foi.hr', '2014-06-24 06:17:04', 'Uspjesna prijava!', 2),
(514, 'mod11@foi.hr', '2014-06-24 06:18:48', 'Kreirana ruta', 2),
(515, 'mod11@foi.hr', '2014-06-24 06:24:18', 'Paket 15 preuzet i opisan ', 2),
(516, 'mod11@foi.hr', '2014-06-24 06:24:48', 'Azurirana lokacija za paket 15', 2),
(517, 'mod11@foi.hr', '2014-06-24 06:24:57', 'Azurirana lokacija za paket 15', 2),
(518, 'mod11@foi.hr', '2014-06-24 06:25:14', 'Paket 15 nije preuzet', 2),
(519, 'admin@foi.hr', '2014-06-24 06:30:07', 'Uspjesna prijava!', 2),
(520, 'admin@foi.hr', '2014-06-28 06:30:34', 'Preuzimanje vremena', 2),
(521, 'admin@foi.hr', '2014-06-24 06:31:01', 'Preuzimanje vremena', 2),
(522, 'admin@foi.hr', '2014-06-24 06:31:20', 'Postavljanje broja stranica', 2),
(523, 'admin@foi.hr', '2014-06-24 06:31:31', 'Postavljanje broja stranica', 2),
(524, 'admin@foi.hr', '2014-06-24 06:31:35', 'Postavljanje broja neuspjelih prijava', 2),
(525, 'admin@foi.hr', '2014-06-24 06:31:41', 'Postavljanje broja neuspjelih prijava', 2),
(526, 'admin@foi.hr', '2014-06-24 06:31:51', 'Postavljanje boje izbornika', 2),
(527, 'admin@foi.hr', '2014-06-24 06:33:25', 'Postavljanje boje izbornika', 2),
(528, 'admin@foi.hr', '2014-06-24 06:33:37', 'Postavljanje boje izbornika', 2),
(529, 'admin@foi.hr', '2014-06-24 06:33:54', 'Postavljanje boje izbornika', 2),
(530, 'admin@foi.hr', '2014-06-24 06:34:42', 'Postavljanje tipa grafikona', 2),
(531, 'admin@foi.hr', '2014-06-24 06:34:57', 'Postavljanje tipa grafikona', 2),
(532, 'admin@foi.hr', '2014-06-24 06:36:21', 'Update Korisnik SET status=1,broj_neusp=''2''WHERE email = ''nesto@coldemail.info''', 1),
(533, 'admin@foi.hr', '2014-06-24 06:36:21', 'Korisnicki racun otkljucan, racun korisnika: nesto@coldemail.info', 2),
(534, 'admin@foi.hr', '2014-06-24 06:36:38', 'Update Korisnik SET status=''2'',broj_neusp=0 WHERE email = ''nesto@coldemail.info''', 1),
(535, 'admin@foi.hr', '2014-06-24 06:36:38', 'Korisnicki racun zakljucan, racun korisnika: nesto@coldemail.info ', 2),
(536, 'admin@foi.hr', '2014-06-24 06:39:24', 'Uspjesna izmjena podatka kor_ime u tablici  Korisnik', 2),
(537, 'admin@foi.hr', '2014-06-24 06:39:24', 'UPDATE Korisnik SET email=''nesto@coldemail.info'' ,  ime=''Korisnik'' ,  prezime=''Å ariÄ‡'' ,  adresa=''Neka'' ,  grad=''Zagreb'' ,  kor_ime=''random'' ,  lozinka=''kratka'' ,  broj=''adwwadw'' ,  datum_rod=''2014-06-04'' ,  spol=''Zenski'' ,  obavijesti=''2'' ,  status=''2'' ,  aktivacija=''3819a30b23b8e72a4ba42175c0240a1c'' ,  datum_reg=''2014-06-24'' ,  broj_neusp=''0''  WHERE kor_ime=''random''', 1),
(538, 'patafix@coldemail.info', '2014-06-24 07:01:53', 'Registracija korisnika', 2),
(539, 'admin@foi.hr', '2014-06-24 07:12:26', 'Uspjesna prijava!', 2),
(540, 'admin@foi.hr', '2014-06-24 07:14:16', 'Uspjesna prijava!', 2),
(541, 'admin@foi.hr', '2014-06-24 07:15:00', 'INSERT INTO Kur_sluzba VALUES ( ''11'',  ''Oversea'',  ''123123-123123'',  ''123123213'',  ''1'' ) ', 1),
(542, 'admin@foi.hr', '2014-06-24 07:15:00', 'Uspjesno dodavanje u tablicu Kur_sluzba', 2),
(543, 'mod3@foi.hr', '2014-06-24 07:18:46', 'Uspjesna prijava!', 2),
(544, 'mod3@foi.hr', '2014-06-24 07:20:15', 'Kreirana ruta', 2),
(545, 'mod3@foi.hr', '2014-06-24 07:22:04', 'Paket 3 preuzet i opisan ', 2),
(546, 'mod3@foi.hr', '2014-06-24 07:23:17', 'Azurirana lokacija za paket 3', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Ruta`
--

CREATE TABLE IF NOT EXISTS `Ruta` (
  `id_ruta` int(11) NOT NULL auto_increment,
  `id_kurs` int(11) NOT NULL,
  `naziv` varchar(45) character set latin1 NOT NULL,
  `vrim_traj` time NOT NULL,
  `kilometraza` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id_ruta`,`id_kurs`),
  UNIQUE KEY `id_ruta_UNIQUE` (`id_ruta`),
  KEY `fk_Ruta_Kur_sluzba1_idx` (`id_kurs`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `Ruta`
--

INSERT INTO `Ruta` (`id_ruta`, `id_kurs`, `naziv`, `vrim_traj`, `kilometraza`, `status`) VALUES
(1, 1, 'Split-Zagreb', '00:00:04', 400, 1),
(2, 1, 'Zagreb-Split', '00:00:04', 400, 1),
(3, 1, 'Zagreb-Pula', '02:00:00', 200, 1),
(4, 2, 'Zagreb-Split', '00:04:00', 404, 1),
(5, 3, 'Split-Zagreb', '04:00:00', 400, 1),
(6, 3, 'Zagreb-Split', '04:00:00', 400, 1),
(7, 5, 'Split-Zagreb', '04:00:00', 400, 1),
(8, 6, 'Split-Zagreb', '04:00:00', 400, 1),
(9, 8, 'Zagreb-Losinj', '06:00:00', 500, 1),
(10, 10, 'Split-Dubrovnik', '06:00:00', 303, 1),
(13, 1, 'Pula-Zagreb', '08:05:04', 500, 1),
(14, 1, 'Zagreb-Split', '05:04:03', 250, 1),
(15, 1, 'Nova ruta', '00:00:09', 333, 1),
(16, 3, 'Varazdin-Split', '06:06:06', 320, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Sudionici`
--

CREATE TABLE IF NOT EXISTS `Sudionici` (
  `id_kors` varchar(25) character set latin1 NOT NULL,
  `id_paketa` int(11) NOT NULL,
  `status_s` int(11) NOT NULL,
  PRIMARY KEY  (`id_kors`,`id_paketa`),
  KEY `fk_Sudionici_Korisnik1_idx` (`id_kors`),
  KEY `fk_Sudionici_Paket1` (`id_paketa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sudionici`
--

INSERT INTO `Sudionici` (`id_kors`, `id_paketa`, `status_s`) VALUES
('kanta2323@gmail.com', 5, 2),
('kanta2323@gmail.com', 13, 1),
('kanta2323@gmail.com', 14, 1),
('kanta2323@gmail.com', 15, 1),
('kanta2323@gmail.com', 16, 1),
('korisnik1@foi.hr', 1, 1),
('korisnik1@foi.hr', 4, 1),
('korisnik1@foi.hr', 14, 2),
('korisnik1@foi.hr', 15, 2),
('korisnik1@foi.hr', 16, 2),
('korisnik1@foi.hr', 17, 2),
('korisnik2@foi.hr', 1, 2),
('korisnik2@foi.hr', 10, 1),
('korisnik3@foi.hr', 2, 1),
('korisnik3@foi.hr', 4, 2),
('korisnik3@foi.hr', 10, 2),
('korisnik4@foi.hr', 2, 2),
('korisnik4@foi.hr', 8, 2),
('korisnik6@foi.hr', 8, 1),
('mod11@foi.hr', 17, 1),
('mod11@foi.hr', 18, 2),
('nesto@coldemail.info', 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Tip_dostave`
--

CREATE TABLE IF NOT EXISTS `Tip_dostave` (
  `id_tip` int(11) NOT NULL auto_increment,
  `vrsta` varchar(20) character set latin1 NOT NULL,
  PRIMARY KEY  (`id_tip`),
  UNIQUE KEY `id_tip_UNIQUE` (`id_tip`),
  UNIQUE KEY `vrsta_UNIQUE` (`vrsta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Tip_dostave`
--

INSERT INTO `Tip_dostave` (`id_tip`, `vrsta`) VALUES
(2, 'brza'),
(1, 'obicna'),
(3, 'posebna');

-- --------------------------------------------------------

--
-- Table structure for table `zadaca`
--

CREATE TABLE IF NOT EXISTS `zadaca` (
  `idKor` int(11) NOT NULL auto_increment,
  `email` varchar(45) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `adresa` varchar(45) NOT NULL,
  `grad` varchar(45) NOT NULL,
  `kor_ime` varchar(20) NOT NULL,
  `lozinka` varchar(20) NOT NULL,
  `broj` varchar(15) NOT NULL,
  `datum_rod` datetime NOT NULL,
  `spol` varchar(45) NOT NULL,
  `obavijesti` tinyint(1) NOT NULL default '1',
  `status` int(11) NOT NULL default '0',
  `datum_reg` datetime NOT NULL,
  `aktivacijski_kod` text NOT NULL,
  `slika` text NOT NULL,
  `zivotopis` text NOT NULL,
  PRIMARY KEY  (`idKor`),
  UNIQUE KEY `idKor_UNIQUE` (`idKor`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `zadaca`
--

INSERT INTO `zadaca` (`idKor`, `email`, `ime`, `prezime`, `adresa`, `grad`, `kor_ime`, `lozinka`, `broj`, `datum_rod`, `spol`, `obavijesti`, `status`, `datum_reg`, `aktivacijski_kod`, `slika`, `zivotopis`) VALUES
(1, 'mail1@foi.hr', 'Ime1', 'Prezime1', 'Adresa1', 'Grad1', 'kor1', 'lozinka1', '099 9999999', '2001-05-10 22:18:42', 'Muski', 1, 1, '0000-00-00 00:00:00', '', '', 'sa mld l daslasdlasdlsaasdml'),
(2, 'nsmrcek@foi.hr', 'Nikola', 'Smrcek', 'Zadarska 75', 'Sibenik', 'nsmrcek', 'lozinka', '099 98755543', '1992-12-06 16:00:00', 'Muski', 1, 1, '0000-00-00 00:00:00', '', './img/ss.jpg', 'Osnovna skola itd.'),
(3, 'irepusictgg@foi.hr', 'Ivan', 'Repusic', 'Runovici 33', 'Imotski', 'irepusic', 'lozinka3', '098 12123113', '2011-05-12 22:25:25', 'Muski', 1, 1, '0000-00-00 00:00:00', '', '', 'Japan '),
(4, 'ana@foi.hr', 'Ana', 'Anic', 'Razinska 2', 'Sibenik', 'ana', 'lozinka4', '095 2131231', '2011-05-26 22:26:46', 'Zenski', 1, 2, '0000-00-00 00:00:00', '', '', 'asdasdas'),
(5, 'mail5@foi.hr', 'ime5', 'prezime5', 'Adresa5', 'grad5', 'kor5', 'lozinka5', '095 12312323', '2004-05-26 22:28:18', 'Zenski', 1, 1, '0000-00-00 00:00:00', '', '', 'alndaskalskslaknd'),
(6, 'email6@foi.hr', 'Ime6', 'Prezime6', 'Adresa6', 'Grad6', 'kor6', 'lozinka6', '097 8913131', '2005-05-26 22:29:05', 'Muski', 1, 1, '0000-00-00 00:00:00', '', './img/aa.jpg', 'sandjlsasdnlk'),
(7, 'email7@nesto.hr', 'ime7', 'prezime7', 'adresa7', 'grad7', 'kor7', 'lozinka7', '095 1281328', '1994-02-22 22:30:25', 'Muski', 1, 2, '0000-00-00 00:00:00', '', '', 'aoidhoahwhoawodb'),
(8, 'email8@foi.hr', 'Ime8', 'Prezime8', 'adresa8', 'grad8', 'kor8', 'lozinka8', '099 8128312', '2002-07-30 22:31:28', 'Muski', 1, 1, '0000-00-00 00:00:00', '', '', 'awdouhawdoawpnwp'),
(9, 'email9@foi.hr', 'ime9', 'prezime9', 'adresa9', 'grad9', 'kor9', 'lozinka9', '099 9153333', '1996-07-11 22:32:55', 'Zenski', 1, 1, '0000-00-00 00:00:00', '', '', 'aoudawubawdaw'),
(10, 'email10@foi.hr', 'ime10', 'prezime10', 'adresa10', 'grad10', 'kor10', 'lozinka10', '099 1231233', '2010-05-20 22:33:42', 'Muski', 1, 1, '0000-00-00 00:00:00', '', '', 'aodhowdoawobobobbbb'),
(23, 'zipidus@gmail.com', 'Neaktivni', 'Clan', 'daadw', 'dawdaw', 'ziiipiii', '1234', 'adjblwjd', '1991-07-07 00:00:00', 'zenski', 2, 0, '2014-05-06 19:11:09', '085ecbd4ebb4b6732384fa2a85f16364', './img/zipidus@gmail.com.jpeg', 'awddaw'),
(24, 'jtrupina@foi.hr', 'Josip', 'Trupina', 'Grgura KarlovÄana 26', 'ÄurÄ‘evac', 'jtrupina', 'gunnertillidie', '091 111 1111', '1992-11-17 00:00:00', 'muski', 2, 1, '2014-05-06 19:13:38', '2fb28251353ad3a8c1b93c20ae66141e', './img/as.jpg', 'FC Arsenal > FC Chelsea '),
(25, 'kanta233@gmail.com', 'Moderator', 'Clan', 'adwbwad', 'dwobjjabwdb', 'smr', 'aka', 'auodguawdb', '1999-09-09 00:00:00', 'zenski', 1, 2, '2014-05-06 19:13:43', '2748a78e7fecac28b67062fec1d3d214', './img/kanta2323@gmail.com.jpeg', 'adawdaw'),
(26, 'admin@nesto.hr', 'Admin', 'Istator', 'awdlnd', 'dwjobjlawnd', 'admin', 'admin', 'apidwidn', '1991-09-01 00:00:00', 'muski', 1, 3, '2014-05-06 19:17:17', 'b1b8ab4e44262ebfa0cf914bab605554', './img/admin@nesto.hr.jpeg', 'daowbdawpdn'),
(27, 'kanta2323@gmail.com', 'Smece', 'Repic', 'aedawd', 'dawdaw', 'zzz', 'tt', 'adwdaw', '1999-09-09 00:00:00', 'muski', 2, 1, '2014-05-11 18:31:09', '4f8db6919c8da6f7c4dc9c64202193c4', './img/kanta2323@gmail.com.jpeg', 'dqwdadaw'),
(29, 'dawdaw@adwdawd.com', 'Aawd', 'Tawdwad', 'daw', 'dwwdwad', 'dwadwad', 'tr', 'awdwad', '1999-09-09 00:00:00', 'zenski', 2, 0, '2014-05-27 18:16:59', '70c2587b272633bf84cce97616ea80eb', './img/dawdaw@adwdawd.com.jpeg', 'dwadawd');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cjenik`
--
ALTER TABLE `Cjenik`
  ADD CONSTRAINT `Cjenik_ibfk_1` FOREIGN KEY (`id_rutaa`) REFERENCES `Ruta` (`id_ruta`),
  ADD CONSTRAINT `Cjenik_ibfk_2` FOREIGN KEY (`id_kurs`) REFERENCES `Kur_sluzba` (`id_kur`),
  ADD CONSTRAINT `fk_Cjenik_Ruta1` FOREIGN KEY (`id_rutaa`, `id_kurs`) REFERENCES `Ruta` (`id_ruta`, `id_kurs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cjenik_Tip_dostave1` FOREIGN KEY (`id_tipd`) REFERENCES `Tip_dostave` (`id_tip`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Dio_rute`
--
ALTER TABLE `Dio_rute`
  ADD CONSTRAINT `Dio_rute_ibfk_1` FOREIGN KEY (`id_rute`) REFERENCES `Ruta` (`id_ruta`),
  ADD CONSTRAINT `Dio_rute_ibfk_2` FOREIGN KEY (`id_kurs`) REFERENCES `Kur_sluzba` (`id_kur`),
  ADD CONSTRAINT `fk_Dio_rute_Dostavne_lok1` FOREIGN KEY (`id_dostavnog`) REFERENCES `Dostavne_lok` (`id_mprima`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Dio_rute_Ruta1` FOREIGN KEY (`id_rute`, `id_kurs`) REFERENCES `Ruta` (`id_ruta`, `id_kurs`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Djelatinici`
--
ALTER TABLE `Djelatinici`
  ADD CONSTRAINT `fk_Djelatinici_Korisnik1` FOREIGN KEY (`id_kor`) REFERENCES `Korisnik` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Djelatinici_Kur_sluzba1` FOREIGN KEY (`id_kurs`) REFERENCES `Kur_sluzba` (`id_kur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Dostavne_lok`
--
ALTER TABLE `Dostavne_lok`
  ADD CONSTRAINT `fk_Dostavne_lok_Kur_sluzba1` FOREIGN KEY (`id_kurs`) REFERENCES `Kur_sluzba` (`id_kur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Dostavne_lok_Mjesto_primanja1` FOREIGN KEY (`id_mprima`) REFERENCES `Mjesto_primanja` (`id_mprim`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Paket`
--
ALTER TABLE `Paket`
  ADD CONSTRAINT `fk_Paket_Kur_sluzba1` FOREIGN KEY (`id_kurs`) REFERENCES `Kur_sluzba` (`id_kur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Paket_Tip_dostave1` FOREIGN KEY (`id_topd`) REFERENCES `Tip_dostave` (`id_tip`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Paket_ibfk_1` FOREIGN KEY (`gal_slik`) REFERENCES `Gal_slik` (`id_gal`);

--
-- Constraints for table `Paketi_status`
--
ALTER TABLE `Paketi_status`
  ADD CONSTRAINT `fk_Paketi_status_Paket1` FOREIGN KEY (`Paket_id_paket`) REFERENCES `Paket` (`id_paket`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Prijave`
--
ALTER TABLE `Prijave`
  ADD CONSTRAINT `fk_Prijave_Korisnik` FOREIGN KEY (`id_kor`) REFERENCES `Korisnik` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Radnje_baza`
--
ALTER TABLE `Radnje_baza`
  ADD CONSTRAINT `Radnje_baza_ibfk_1` FOREIGN KEY (`id_kor`) REFERENCES `Korisnik` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Ruta`
--
ALTER TABLE `Ruta`
  ADD CONSTRAINT `fk_Ruta_Kur_sluzba1` FOREIGN KEY (`id_kurs`) REFERENCES `Kur_sluzba` (`id_kur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Sudionici`
--
ALTER TABLE `Sudionici`
  ADD CONSTRAINT `fk_Sudionici_Korisnik1` FOREIGN KEY (`id_kors`) REFERENCES `Korisnik` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Sudionici_Paket1` FOREIGN KEY (`id_paketa`) REFERENCES `Paket` (`id_paket`) ON DELETE NO ACTION ON UPDATE NO ACTION;
