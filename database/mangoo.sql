-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 26. Okt 2015 um 15:13
-- Server Version: 5.6.21
-- PHP-Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `mangoo`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
`cur_id` int(11) NOT NULL,
  `cur_name` varchar(50) NOT NULL,
  `cur_short` varchar(8) NOT NULL,
  `cur_rate` decimal(8,4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `currency`
--

INSERT INTO `currency` (`cur_id`, `cur_name`, `cur_short`, `cur_rate`) VALUES
(1, 'Uganda Shilling', 'UGX', '1.0000'),
(2, 'US-Dollar', 'USD', '2600.0000'),
(3, 'Euro', 'EUR', '3300.0000');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
`cust_id` int(11) NOT NULL,
  `cust_name` varchar(75) DEFAULT NULL,
  `cust_dob` int(15) DEFAULT NULL,
  `cust_sex` int(1) DEFAULT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  `cust_phone` varchar(50) DEFAULT NULL,
  `cust_email` varchar(50) DEFAULT NULL,
  `cust_occup` varchar(50) DEFAULT NULL,
  `cust_married_id` int(5) DEFAULT NULL,
  `cust_heir` varchar(50) DEFAULT NULL,
  `cust_heirrel` varchar(25) DEFAULT NULL,
  `cust_lengthres` int(11) DEFAULT NULL,
  `cust_since` int(15) DEFAULT NULL,
  `cust_sick` int(2) NOT NULL,
  `cust_lastsub` int(15) DEFAULT NULL,
  `cust_active` int(1) DEFAULT NULL,
  `cust_lastupd` int(11) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_name`, `cust_dob`, `cust_sex`, `cust_address`, `cust_phone`, `cust_email`, `cust_occup`, `cust_married_id`, `cust_heir`, `cust_heirrel`, `cust_lengthres`, `cust_since`, `cust_sick`, `cust_lastsub`, `cust_active`, `cust_lastupd`, `user_id`) VALUES
(1, 'Martin Luther', -25720000, 1, 'Wittenberg', NULL, '', 'Reformer', 3, '', '', NULL, 1157580000, 0, 1420070400, 1, 1427241600, 3),
(2, 'Jan Hus', -707191200, 1, 'Prague', NULL, '', 'Reformer', 3, '', '', NULL, 1159401600, 0, 1420070400, 1, 1420070400, 1),
(3, 'Jean Calvin', -256006800, 1, 'Geneva', '0760-548193', 'j.calvin@reformed.org', 'Reformer', 3, 'Marie Calvin', 'Wife', NULL, 1157587200, 0, 1420070400, 1, 1438330883, 1),
(4, 'Huldrych Zwingli', -505620000, 1, 'Zurich', NULL, '', 'Reformer', 3, '', '', NULL, 1159747200, 0, 1420070400, 1, 1420070400, 1),
(5, 'Heinrich Bullinger', -5662321, 1, 'Zurich', NULL, '', 'Reformer', 3, '', '', NULL, 1158710400, 0, 1420070400, 1, 1436350199, 3),
(6, 'Ila Kimble  ', -362023200, 1, 'Luwero Diocese', '0772-349669', '', 'Clergy Man', 3, '', '', NULL, 1161820800, 0, 1420070400, 1, 1420070400, 1),
(7, 'Lesha Detweiler  ', -7200, 1, 'Ndejje', '0782-453096', '', 'Clergy', 3, '', '', NULL, 1156377600, 0, 1420070400, 1, 1420070400, 1),
(8, 'Ezra Singletary  ', 140043600, 1, 'St.Mark - Luweero', '0782-880948', '', 'Clergy Man / Teacher', 1, '', '', NULL, 1157587200, 0, 1420070400, 1, 1420070400, 1),
(9, 'Aura Trim  ', -456976800, 1, 'Luteete Arch', '0782-347980', '', 'Pastor', 3, '', '', NULL, 1156377600, 0, 1420070400, 1, 1420070400, 1),
(10, 'Marci Fleming  ', -285127200, 1, 'Bukalabi Mpwede Kasangombe', NULL, '', 'Pastor', 3, '', '', NULL, 1157580000, 0, 1420070400, 0, 1427241600, 3),
(11, 'Nydia Melvin  ', -404791200, 1, 'Kiziba Kikyusa Arch', '0772-968444', '', 'Clergy Man', 3, '', '', NULL, 1157932800, 0, 1390070400, 0, 1420070400, 1),
(12, 'Joshua Vandenburg  ', -552448800, 1, 'Kiziba Kikyusa Arch', '0772-551662', '', 'Clergy Man', 3, '', '', NULL, 1157587200, 0, 1420070400, 1, 1420070400, 1),
(13, 'Melania Mitchem  ', 158364000, 1, 'Kalere', '0782-380513', '', 'Clergy', 2, '', '', NULL, 1158796800, 0, 1400070400, 0, 1420070400, 1),
(14, 'Clemmie Ellithorpe  ', -929930400, 1, 'Kazinga Butuntumula', NULL, '', 'Clergy Man', 3, '', '', NULL, 1157580000, 0, 1420070400, 0, 1427241600, 3),
(15, 'Kristofer Artis  ', -7200, 1, 'Kisenyi', NULL, '', '', 1, '', '', NULL, 1157580000, 0, 1420070400, 0, 1427241600, 3),
(16, 'Lulu Obando  ', -440906400, 1, 'Sempa Parish ', '0782-096008', '', 'Clergy Man', 3, '', '', NULL, 1167782400, 0, 1420000400, 1, 1420070400, 1),
(17, 'Kai Soriano  ', -86320800, 1, 'Luteete', NULL, '', 'Pastor / Teacher', 3, '', '', NULL, 1157580000, 0, 1420070400, 0, 1427241600, 3),
(18, 'Lynne Pratico  ', 160264800, 1, 'Bwaziba', NULL, '', 'Clergy / Farmer', 3, '', '', NULL, 1158019200, 0, 1320070400, 0, 1420070400, 1),
(19, 'Noella Holyfield  ', -633578400, 1, 'Kasana -Kiwogozi', '0772-984673', '', 'Clergy Man', 3, '', '', NULL, 1157587200, 0, 1420070400, 1, 1420070400, 1),
(20, 'Berry Steve  ', -256525200, 1, 'Bombo', '0782-453477', '', 'Clergy Man', 3, '', '', NULL, 1157932800, 0, 1420070400, 1, 1427241600, 5),
(21, 'Gregorio Schurr  ', -479527200, 1, 'Kasiso', '0772-532964', '', 'Clergy Man', 3, '', '', NULL, 1156377600, 0, 1420070400, 1, 1420070400, 1),
(22, 'Arnetta Lobato  ', -744170400, 1, 'Bakijulura', NULL, '', 'Retired', 1, '', '', NULL, 1157932800, 0, 1380070400, 0, 1420070400, 1),
(23, 'Ayana Mohammed  ', -368762400, 1, 'St. Mark Luweero', '0772-183125', '', 'Clergy Man', 3, '', '', NULL, 1157587200, 0, 1420070400, 1, 1420070400, 1),
(24, 'Conrad Keitt  ', -748404000, 1, 'Namusale', NULL, '', 'Clergy Man', 3, '', '', NULL, 1160006400, 0, 1420070400, 1, 1420070400, 1),
(25, 'Stephine Leitner  ', -559792800, 1, 'Buwana', '0773142217', '', 'Clergy Man', 3, '', '', NULL, 1158019200, 0, 1420070400, 1, 1420070400, 1),
(26, 'Tequila Lino  ', -597549600, 1, 'Sekamuli Area', '0782-880521', '', 'Clergy Man', 3, '', '', NULL, 1195516800, 0, 1420070400, 1, 1420070400, 1),
(27, 'Deena Hawes  ', -932349600, 1, 'Zirobwe', NULL, '', 'Clergy Man', 3, '', '', NULL, 1190160000, 0, 1420070400, 1, 1420070400, 1),
(28, 'Kellye Whitley  ', -363924000, 1, 'Lukomera', '0779-253864', '', 'Clergy Man / Teacher', 3, '', '', NULL, 1166572800, 0, 1420070400, 1, 1420070400, 1),
(29, 'Judi Spillman  ', -573703200, 1, 'Balitta- Lwogi', '0782-559766', '', 'Clergy Man', 3, '', '', NULL, 1189468800, 0, 1420070400, 1, 1420070400, 1),
(30, 'Emily Ratley  ', -7200, 1, 'Kalere', NULL, '', 'Clergy Man', 3, '', '', NULL, 1159394400, 0, 1420070400, 0, 1427241600, 3),
(31, 'Robena Burget  ', -7200, 1, 'Kasana', NULL, '', 'Clergy Man', 3, '', '', NULL, 1159394400, 0, 1420070400, 0, 1427241600, 3),
(32, 'Milda Mcamis  ', -427860000, 1, 'Bweyeeyo-Luweero', NULL, '', 'Clergy Man', 3, '', '', NULL, 1159401600, 0, 1420070400, 1, 1420070400, 1),
(33, 'Alec Kearl  ', -336794400, 1, 'Nakaseke', '0773-974456', '', 'Pastor / Teacher', 3, '', '', NULL, 1158019200, 0, 1420070400, 1, 1427241600, 3),
(34, 'Ngoc Alcantar  ', -185335200, 1, 'Kasana Kvule-Luweero', NULL, '', 'Clergy Man', 3, '', '', NULL, 1157932800, 0, 1420070400, 1, 1420070400, 1),
(35, 'Sharen Harr  ', -33271200, 2, 'Luweero Town Council', '0772-442574', '', 'Accounts Clerk', 3, '', '', NULL, 1156896000, 0, 1420070400, 1, 1420070400, 1),
(36, 'Crysta Riebe  ', -320032800, 2, 'Kungu- Busula', NULL, '', '', 3, '', '', NULL, 1158796800, 0, 1420070400, 1, 1420070400, 1),
(37, 'Ronni Knoles  ', -213069600, 1, 'Kungu-Busula', '0772-365951', '', 'Social Worker', 3, '', '', NULL, 1156723200, 0, 1420070400, 1, 1420070400, 1),
(38, 'Ela Denmark  ', 401230800, 2, 'Kungu-Busula', NULL, '', 'Counsellor / Volunteer', 2, '', '', NULL, 1157241600, 0, 1420070400, 1, 1420070400, 1),
(39, 'Grace Hamer  ', 55717200, 1, 'Busula', '0701-855942', '', 'Road Supervisor', 2, '', '', NULL, 1157328000, 0, 1420070400, 1, 1420070400, 1),
(40, 'Emma Bermea  ', -340855200, 2, 'Wobulenzi', NULL, '', 'Teacher', 3, '', '', NULL, 1157328000, 0, 1420070400, 1, 1420070400, 1),
(41, 'Rosana Breit  ', 534549600, 1, 'Busula', NULL, '', 'Student', 2, '', '', NULL, 1166659200, 0, 1420070400, 1, 1420070400, 1),
(42, 'Evelynn Mickles  ', 292543200, 2, 'Kungu-Busula', NULL, '', 'Trader - Retail', 3, '', '', NULL, 1157328000, 0, 1420070400, 1, 1420070400, 1),
(43, 'Tonie Maroney  ', 141858000, 2, 'Bendegere Namusaale', NULL, '', 'Customer Care Manager', 3, '', '', NULL, 1156550400, 0, 1420070400, 1, 1420070400, 1),
(44, 'Fallon Rosendahl  ', -46231200, 1, 'Buwana Kinyogoga', NULL, '', 'Clergy Man', 3, '', '', NULL, 1158789600, 0, 1420070400, 0, 1427241600, 3),
(45, 'Renato Loudon  ', -361072800, 1, 'Kaswa- Busula', '0774-764113', '', 'Lay-Reader', 3, '', '', NULL, 1157500800, 0, 1420070400, 1, 1420070400, 1),
(46, 'Garth Swartwood  ', -184298400, 2, 'Kikoma C/U Wobulenzi Tc', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1157846400, 0, 1420070400, 1, 1420070400, 1),
(47, 'Joannie Gust  ', 75589200, 2, 'Kikoma Wobulenzi', NULL, '', 'Peasant - Farmer', 3, '', '', NULL, 1157846400, 0, 1420070400, 1, 1420070400, 1),
(48, 'Fermina Collazo  ', -240890400, 2, 'Kikona Wobulenzi Central', NULL, '', 'Peasant / Farmer', 3, '', '', NULL, 1157932800, 0, 1420070400, 1, 1420070400, 1),
(49, 'Lavenia Byler  ', -252468000, 1, 'Kayindu C/U', '0785-772868', '', 'Lay-Reader', 3, '', '', NULL, 1157500800, 0, 1420070400, 1, 1420070400, 1),
(50, 'Willetta Moreau  ', 167522400, 1, 'Katuugo Parish', '0782-447156', '', 'Lay-Reader / Tailor', 3, '', '', NULL, 1157414400, 0, 1420070400, 1, 1420070400, 1),
(51, 'Alicia Wehner  ', -207453600, 2, 'Waluleeta Makulubita', '0782-461460', '', 'Trainer / Social Worker', 3, '', '', NULL, 1199664000, 0, 1420070400, 1, 1420070400, 1),
(52, 'Ocie Edds  ', -605412000, 1, 'Administrator Luweero Diocese', NULL, '', 'Diocesan Bishop', 3, '', '', NULL, 1158796800, 0, 1420070400, 1, 1420070400, 1),
(53, 'Darcy Read  ', 309736800, 2, 'Luwero TC', NULL, '', 'Secretary', 2, '', '', NULL, 1158796800, 0, 1420070400, 1, 1420070400, 1),
(54, 'Augustina Shuman  ', -244605600, 2, 'Kaswa- Busula', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1157846400, 0, 1420070400, 1, 1420070400, 1),
(55, 'Catherine Adler  ', 0, 3, 'Luweero Diocese', NULL, '', '', 1, '', '', NULL, 1242086400, 0, 1420070400, 1, 1420070400, 1),
(56, 'Shanae Bello  ', 77144400, 2, 'Luweero Boys School', NULL, '', 'Teacher', 2, '', '', NULL, 1197936000, 0, 1420070400, 1, 1420070400, 1),
(57, 'Ferne Munson  ', -7200, 1, 'Bweyeyo', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1159826400, 0, 1420070400, 0, 1427241600, 3),
(58, 'Ja Nordby  ', -7200, 2, 'Kungu- Kikoma', NULL, '', 'Housewife', 3, '', '', NULL, 1166572800, 0, 1420070400, 1, 1420070400, 1),
(59, 'Illa Penaflor  ', -179632800, 2, 'Kiwogozi', '0772-662202', '', 'Teacher / MP', 1, '', '', NULL, 1166572800, 0, 1420070400, 1, 1420070400, 1),
(60, 'Annabelle Bradham  ', -455680800, 1, 'Kiwoko Arc', '0772-657419', '', 'Clergy Man', 3, '', '', NULL, 1167782400, 0, 1420070400, 1, 1420070400, 1),
(61, 'Tanner Wake  ', -539143200, 1, 'Bukalabi Parish', '0752-631706', '', 'Clergy Man', 3, '', '', NULL, 1157932800, 0, 1420070400, 1, 1420070400, 1),
(62, 'Cristobal Passman  ', -399088800, 2, 'Luteete Arch', NULL, '', 'Housewife', 3, '', '', NULL, 1168387200, 0, 1420070400, 1, 1420070400, 1),
(63, 'Rosita Pankratz  ', -394077600, 2, 'Ndejje Village', NULL, '', 'Peasant / Farmer', 3, '', '', NULL, 1168732800, 0, 1420070400, 1, 1420070400, 1),
(64, 'Angila Gauldin  ', 404949600, 2, 'Nalinya Lwantale Girls P/S', NULL, '', 'Teacher', 2, '', '', NULL, 1168732800, 0, 1420070400, 1, 1420070400, 1),
(65, 'Jerrica Darnell  ', 534981600, 1, 'Ndejje- Sambwe', NULL, '', 'Student', 2, '', '', NULL, 1168732800, 0, 1420070400, 1, 1420070400, 1),
(66, 'Paul Mushrush  ', 513554400, 2, 'Ndejje - Sambwe', NULL, '', '', 2, '', '', NULL, 1168732800, 0, 1420070400, 1, 1420070400, 1),
(67, 'Daren Konkol  ', 0, 0, '', NULL, '', '', 1, '', '', NULL, 0, 0, 0, 0, 1427241600, 0),
(68, 'Kristin Lippard  ', 967323600, 2, 'Ndejje- Sambwe', NULL, '', '', 2, '', '', NULL, 1169510400, 0, 1420070400, 1, 1420070400, 1),
(69, 'Frederic Marchese  ', 510012000, 1, 'Ndejje- Sambwe', NULL, '', '', 2, '', '', NULL, 1168732800, 0, 1420070400, 1, 1420070400, 1),
(70, 'Gaynelle Busbee  ', -7200, 0, 'Kikoma Wobulenzi', NULL, '', 'Service Provider NAADS/AGRIC', 3, '', '', NULL, 1169938800, 0, 1420070400, 0, 1427241600, 3),
(71, 'Remona Sheffler  ', -75693600, 2, 'Kisaawe Muyenga Wobulenzi', NULL, '', 'Teacher', 2, '', '', NULL, 1170111600, 0, 1420070400, 0, 1427241600, 3),
(72, 'Federico Iliff  ', -115178400, 2, 'Luweero Child Devt Centre', NULL, '', 'Peasant', 2, '', '', NULL, 1156896000, 0, 1420070400, 1, 1420070400, 1),
(73, 'Chan Milby  ', 864252000, 2, 'St.Peters-Kisugu', NULL, '', '', 2, '', '', NULL, 1200960000, 0, 1420070400, 1, 1420070400, 1),
(74, 'Piedad Mcgonigal  ', -208231200, 2, 'Ndejje Arch', NULL, '', 'Health Coordinator', 3, '', '', NULL, 1170115200, 0, 1420070400, 1, 1420070400, 1),
(75, 'Rhonda Pierpont  ', 0, 0, '', NULL, '', '', 1, '', '', NULL, 0, 0, 1420070400, 0, 1420070400, 1),
(76, 'Celinda Dulac  ', -45194400, 1, 'Luweerotc- Kizito Zone', '0712-219411', '', 'Clergy Man / Teacher', 3, '', '', NULL, 1170115200, 0, 1420070400, 1, 1420070400, 1),
(77, 'Edmond Kneeland  ', 120348000, 2, 'Luweero', NULL, '', 'Secretary', 3, '', '', NULL, 1170633600, 0, 1420070400, 1, 1420070400, 1),
(78, 'Lyndia Kump  ', -872301600, 2, 'C/O DCA Kampala', NULL, '', 'Nurse', 2, '', '', NULL, 1170633600, 0, 1420070400, 1, 1420070400, 1),
(79, 'Michael Poovey  ', -358740000, 2, 'Luweero Diocese', NULL, '', 'CBO Trainer', 3, '', '', NULL, 1170720000, 0, 1420070400, 1, 1420070400, 1),
(80, 'Omega Prochnow  ', -121312800, 2, 'Luweero Diocese', '0782-352335', '', 'Nurse', 3, '', '', NULL, 1170115200, 0, 1420070400, 1, 1420070400, 1),
(81, 'Sheri Stuck  ', -873770400, 1, 'Kiteredde Buyuki Katikamu', NULL, '', 'Peasant / Farmer', 3, '', '', NULL, 1188259200, 0, 1420070400, 1, 1420070400, 1),
(82, 'Shellie Bromley  ', -24544800, 1, 'Kangulumira- Mpologoma ', NULL, '', 'Teacher', 3, '', '', NULL, 1188259200, 0, 1420070400, 0, 1420070400, 1),
(83, 'Joshua Meiser  ', -1036803600, 1, 'Kikasa Wobulenzi Cetral', '0790-562315', '', 'Building Contractor', 3, 'Anne Meiser', 'Wife', NULL, 1174435200, 0, 1420070400, 1, 1445425402, 1),
(84, 'Jean Piehl  ', 135727200, 1, 'Wobulenzi-Kigulu', NULL, '', '', 3, '', '', NULL, 1174867200, 0, 1420070400, 1, 1420070400, 1),
(85, 'Lovella Canaday  ', 399934800, 1, 'Kiwoko - Kasana ', NULL, '', 'Primary Teacher', 2, '', '', NULL, 1175212800, 0, 1420070400, 1, 1420070400, 1),
(86, 'Val Cauley  ', 200955600, 2, 'Luweero T/C', '0772-688874', '', 'Social Worker', 2, '', '', NULL, 1178236800, 0, 1420070400, 1, 1420070400, 1),
(87, 'Michale Belvin  ', -600228000, 3, 'Kyatagali - Mabuye -Kamira', NULL, '', 'Lay-Reader / Peasant', 3, '', '', NULL, 1215043200, 0, 1420070400, 1, 1420070400, 1),
(88, 'Vernon Shade  ', 252712800, 2, 'Kagoma', NULL, '', 'Social Worker', 3, '', '', NULL, 1181174400, 0, 1420070400, 1, 1420070400, 1),
(89, 'Susie Cratty  ', 72054000, 2, 'Katikamu P/S', '0782-158039', '', 'Teacher', 3, '', '', NULL, 1182211200, 0, 1420070400, 1, 1427241600, 5),
(90, 'Sima Cunningham  ', 188690400, 1, 'Luweero Town Council', '0772-305106', '', 'Social Worker', 2, '', '', NULL, 1182211200, 0, 1420070400, 1, 1420070400, 1),
(91, 'Leonel Weitzman  ', -164941200, 1, 'Katikamu Trinity Church', '0774068617', '', 'Lay-Reader', 3, '', '', NULL, 1182384000, 0, 1420070400, 1, 1427241600, 5),
(92, 'Corine Hansell  ', 135986400, 2, 'Katikamu- Sebamala', '0782-485545', '', 'Teacher', 3, '', '', NULL, 1182384000, 0, 1420070400, 1, 1420070400, 1),
(93, 'Beatrice Cortez  ', 166744800, 1, 'Kibula LC1 Kabakeddi Parish', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1211241600, 0, 1420070400, 1, 1420070400, 1),
(94, 'Lore Keltz  ', 16837200, 1, 'Katikamu', '0772-670909', '', 'Clergy Man', 3, '', '', NULL, 1182729600, 0, 1420070400, 1, 1420070400, 1),
(95, 'Eda Edmonson  ', 261352800, 1, 'Kasoma Zone', '0772-641144', '', 'Health Worker', 2, '', '', NULL, 1182211200, 0, 1420070400, 1, 1420070400, 1),
(96, 'Clotilde Fuqua  ', -83210400, 1, 'Kangulumira- Mpologoma ', '0773-266136', '', 'Business Man', 3, '', '', NULL, 1185840000, 0, 1420070400, 1, 1420070400, 1),
(97, 'Rosamaria Hardeman  ', -7200, 1, 'Sempa C/U', '0772964823', '', 'Lay-Reader', 3, '', '', NULL, 1184025600, 0, 1420070400, 1, 1420070400, 1),
(98, 'Wilfred Dinger  ', 24094800, 1, 'Nalulya Butuntumula Luweero Diocese', '0782-424243', '', 'Lay-Reader', 2, '', '', NULL, 1185840000, 0, 1420070400, 1, 1420070400, 1),
(99, 'Minh Myrie  ', -161920800, 1, 'Mulilo Zone', NULL, '', 'Tailor', 3, '', '', NULL, 1187049600, 0, 1420070400, 1, 1420070400, 1),
(100, 'Sherly Boudreau  ', 313974000, 2, 'Kasana T/C', '0782-415747', '', 'Child Development Officer', 2, 'Hans Wurst', '', NULL, 1187654400, 0, 1420070400, 1, 1445427949, 1),
(101, 'Clay Facer  ', -474516000, 2, 'C/U Kyetume', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1190073600, 0, 1420070400, 1, 1427241600, 3),
(102, 'Roma Costales  ', 215388000, 1, 'Kidukulu - Makulubita', NULL, '', 'Lay-Reader / Coffe Trader', 3, '', '', NULL, 1194912000, 0, 1420070400, 1, 1427241600, 3),
(103, 'Shad Kiger  ', -445312800, 2, 'Luweero Tc', '0782-116626', '', 'Teacher', 3, '', '', NULL, 1192492800, 0, 1420070400, 1, 1427241600, 3),
(104, 'Dwayne Yeoman  ', -7200, 3, 'Kirema Village', NULL, '', '', 1, '', '', NULL, 1192492800, 0, 1420070400, 1, 1427241600, 3),
(105, 'Latoya Ensley  ', 166658400, 2, 'Luweero Town Council', '0758-885228', '', 'Teacher', 3, '', '', NULL, 1203292800, 0, 1420070400, 1, 1427241600, 3),
(106, 'Judie Walts  ', -361936800, 1, 'Bbale Central Kiyanda Parish', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1191456000, 0, 1420070400, 1, 1427241600, 3),
(107, 'Gilda Shim  ', -26791200, 2, 'Wobulenzi Tc', NULL, '', 'Tailor', 3, '', '', NULL, 1193702400, 0, 1420070400, 1, 1427241600, 3),
(108, 'Sharla Buhl  ', -7200, 0, 'Namba Village - Ziroobwe', NULL, '', 'Shoe-making', 2, '', '', NULL, 1192658400, 0, 1420070400, 0, 1427241600, 3),
(109, 'Madalene Sunde  ', -56944800, 2, 'Luweero T/C', NULL, '', 'Peasant', 3, '', '', NULL, 1195084800, 0, 1420070400, 1, 1427241600, 3),
(110, 'Etta Bergh  ', 152143200, 2, 'Luweero Girls'' School', '0772-472944', '', 'Teacher', 3, '', '', NULL, 1194912000, 0, 1420070400, 1, 1427241600, 3),
(111, 'Thomasine Lash  ', -1167616800, 1, 'Dan Yawe- Vvumba', '0772-923534', '', 'Farmer', 3, '', '', NULL, 1195516800, 0, 1420070400, 1, 1427241600, 3),
(112, 'Mireille Birdsall  ', 38527200, 1, 'Kasaala P/S - Voc St.Mark', '0782-489069', '', 'Teacher', 3, '', '', NULL, 1196121600, 0, 1420070400, 1, 1427241600, 3),
(113, 'Shirly Cavalieri  ', 91749600, 2, 'Wobulenzi Town Council', '0774-569606', '', 'Farmer', 3, '', '', NULL, 1196121600, 0, 1420070400, 1, 1427241600, 3),
(114, 'Lavinia Cavallo  ', -205984800, 1, 'Wakayamba P/S', '0774-085558', '', 'Teacher', 3, '', '', NULL, 1196294400, 0, 1420070400, 1, 1427241600, 3),
(115, 'Tiny Mable  ', -128829600, 1, 'Luwero Boys'' PS', NULL, '', 'Teacher', 3, '', '', NULL, 1196294400, 0, 1420070400, 1, 1427241600, 3),
(116, 'Alden Koval  ', -59709600, 1, 'Katikamu', '0781-703077', '', 'Farmer', 3, '', '', NULL, 1171238400, 0, 1420070400, 1, 1427241600, 3),
(117, 'Romelia Rezentes  ', -482637600, 2, 'Namakofu -Nambi Zirobwe', '0783-016223', '', 'Extensive Farmer', 3, '', '', NULL, 1171756800, 0, 1420070400, 1, 1427241600, 3),
(118, 'Kaylee Cate  ', 20638800, 2, 'Kalagala Kalanamu Parish', '0782-104384', '', 'Teacher', 3, '', '', NULL, 1198022400, 0, 1420070400, 1, 1427241600, 3),
(119, 'Toya Rank  ', -7200, 1, 'unknown', NULL, '', 'Teacher', 3, '', '', NULL, 1199142000, 0, 1420070400, 0, 1420070400, 1),
(120, 'Gregg Stillings  ', 30751200, 2, 'Binyonyi Zone Luweero T/C', '0782-424855', '', 'Secretary Luweero District Admin.', 3, '', '', NULL, 1200355200, 0, 1420070400, 1, 1427241600, 3),
(121, 'Orville Serafino  ', 121039200, 2, 'Kiwoko Hospital', NULL, '', 'Midwife Kiwoko Hospital', 2, '', '', NULL, 1200960000, 0, 1420070400, 1, 1427241600, 3),
(122, 'Shaneka Swinford  ', -7200, 2, 'Nabagaya Road Luweero', '0772-344445', '', 'Accounts Clerk (Water Sector)', 3, '', '', NULL, 1208822400, 0, 1420070400, 1, 1427241600, 3),
(123, 'Margeret Pajak  ', -52797600, 1, 'Kyambogo Mixed PS, Luweero', '0772-949049', '', 'Teacher', 3, '', '', NULL, 1204070400, 0, 1420070400, 1, 1427241600, 3),
(124, 'Stevie Perrigo  ', -919562400, 1, 'Bakijulura', '0779-544750', '', 'Lay-Reader', 3, '', '', NULL, 1194134400, 0, 1420070400, 1, 1427241600, 3),
(125, 'Terrie Fassett  ', -1001728800, 1, 'Kande- Katikamu', '0774-647288', '', 'Farmer', 3, '', '', NULL, 1205971200, 0, 1420070400, 1, 1427241600, 3),
(126, 'Angele Clancy  ', -7200, 2, 'C/O Kabyanga(Nakazzi Luweero)', '0774-446075', '', '', 1, '', '', NULL, 1216252800, 0, 1420070400, 1, 1427241600, 3),
(127, 'Margarete Zuk  ', 248911200, 1, 'Bugabo - Kibanyi Bamunanika', '0774-639465', '', 'Boda-Boda Transporter', 3, '', '', NULL, 1202083200, 0, 1420070400, 1, 1427241600, 3),
(128, 'Theresia Rutkowski  ', 149374800, 2, 'Luweero Town Council', '0774-956160', '', 'Teacher', 3, '', '', NULL, 1201737600, 0, 1420070400, 1, 1427241600, 3),
(129, 'Raye Hambly  ', -7200, 2, 'Nakasero Zone Wobulenzi', '0772-601112', '', 'Teacher', 3, '', '', NULL, 1202342400, 0, 1420070400, 1, 1428392156, 6),
(130, 'Almeda Vu  ', -555732000, 2, 'Malou Nsamuu Makulubita', NULL, '', 'Lay-Reader', 3, '', '', NULL, 0, 0, 1420070400, 1, 1427241600, 3),
(131, 'Philomena Shumate  ', -284176800, 2, 'Kizito Lc1', NULL, '', 'Health Information Assistant', 3, '', '', NULL, 0, 0, 1420070400, 1, 1427241600, 3),
(132, 'Valery Sola  ', -63165600, 2, 'Bunyonyi Zone (Luweero T/C)', NULL, '', '', 4, '', '', NULL, 0, 0, 1420070400, 1, 1427241600, 3),
(133, 'Vanita Hymel  ', 120175200, 2, 'Kasana Kiwogozi', NULL, '', 'Peasant', 2, '', '', NULL, 1205884800, 0, 1420070400, 1, 1427241600, 3),
(134, 'Karyn Rhoton  ', -7200, 2, 'Luweero Cdc', NULL, '', 'Peasant', 4, '', '', NULL, 1205798400, 0, 1420070400, 1, 1427241600, 3),
(135, 'Valerie Laguerre  ', -7200, 2, 'Kasana - Kavule ', NULL, '', 'Peasant', 4, '', '', NULL, 1205798400, 0, 1420070400, 1, 1427241600, 3),
(136, 'Arturo Cruz  ', 27036000, 2, 'Kasana- Kavule ', NULL, '', 'Restaurant', 2, '', '', NULL, 1205798400, 0, 1420070400, 1, 1427241600, 3),
(137, 'Lue Hinkel  ', -7200, 2, 'Binyonyi Zone Luweero T/C', NULL, '', 'Farmer', 2, '', '', NULL, 1205798400, 0, 1420070400, 1, 1427241600, 3),
(138, 'Miesha Runions  ', 182034000, 2, 'Luweero Cdc', NULL, '', 'Peasant', 2, '', '', NULL, 1205798400, 0, 1420070400, 1, 1427241600, 3),
(139, 'Katharina Clow  ', -1130400, 2, 'Kakinzi- Kakabala', NULL, '', 'Peasant', 2, '', '', NULL, 1205798400, 0, 1420070400, 1, 1427241600, 3),
(140, 'Antoinette Ortego  ', -57808800, 2, 'Ngogolo', NULL, '', 'Peasant', 1, '', '', NULL, 1205798400, 0, 1420070400, 1, 1427241600, 3),
(141, 'Scottie Mayhugh  ', -18324000, 1, 'Kigavu Kabakedi Luweero Tc', '0774-443579', '', 'Peasant', 3, '', '', NULL, 1231804800, 0, 1420070400, 1, 1427241600, 3),
(142, 'Hester Janousek  ', -7200, 2, 'Kasomer Luwero Town Council', NULL, '', 'selfemployeed', 2, '', '', NULL, 1205794800, 0, 1420070400, 0, 1427241600, 3),
(143, 'Criselda Curro  ', -59191200, 2, 'Nabagaya C/O Luweero Cdc', NULL, '', 'Police-Woman', 1, '', '', NULL, 1205798400, 0, 1420070400, 0, 1427241600, 3),
(144, 'Kristi Ogren  ', -8215200, 2, 'Kasana- Kavule', NULL, '', 'Peasant', 2, '', '', NULL, 1205798400, 0, 1420070400, 1, 1427241600, 3),
(145, 'Lesley Nardi  ', 143413200, 2, 'Nabagaya Luweero Tc', NULL, '', 'Peasant', 2, '', '', NULL, 1205798400, 0, 1420070400, 1, 1427241600, 3),
(146, 'Kai Ridlon  ', -488340000, 1, 'Wakyato Luweero Diocese', NULL, '', 'Parish Priest', 3, '', '', NULL, 1220918400, 0, 1420070400, 1, 1427241600, 3),
(147, 'Sammy Wrenn  ', -815191200, 1, 'Kikubajinja Lc1 C/O St Mark Luweero ', NULL, '', 'Priest in St. Mark', 3, '', '', NULL, 1204416000, 0, 1420070400, 1, 1427241600, 3),
(148, 'Jacelyn Broker  ', 257292000, 2, 'Wobulenzi- Katikamu', NULL, '', 'Tailor', 2, '', '', NULL, 1207612800, 0, 1420070400, 1, 1427241600, 3),
(149, 'Margarett Ingold  ', -386474400, 2, 'Butikwa Kiwoko Kikamulo', NULL, '', 'Nurse Aide', 4, '', '', NULL, 1204934400, 0, 1420070400, 1, 1427241600, 3),
(150, 'Jefferson Pierson  ', -680061600, 2, 'Kamuli Kikamuloc/O Kiwoko Arch', '0782-884279', '', 'Farmer', 3, '', '', NULL, 1207612800, 0, 1420070400, 1, 1427241600, 3),
(151, 'Glynda Delcambre  ', 141858000, 1, 'Kamuli-Kikamulo', '0773298713', '', 'Peasant', 3, '', '', NULL, 1210032000, 0, 1420070400, 1, 1427241600, 3),
(152, 'Melina Zak  ', -7200, 1, 'Kamuli-Kikamulo', '0778-569954', '', 'Peasant / Lay-Reader', 3, '', '', NULL, 1210032000, 0, 1420070400, 1, 1427241600, 3),
(153, 'Migdalia Windle  ', 283644000, 1, 'Pd Nsawo Cdc', NULL, '', 'Social Worker', 2, '', '', NULL, 1211414400, 0, 1420070400, 1, 1427241600, 3),
(154, 'Marcellus Felipe  ', -295408800, 2, 'Buto Bamunanika', '0782-008255', '', 'Peasant', 3, '', '', NULL, 1210032000, 0, 1420070400, 0, 1427241600, 3),
(155, 'Ulrike Graffam  ', 396046800, 2, 'Kibengo Umea P/S', NULL, '', 'Teacher', 3, '', '', NULL, 1210723200, 0, 1420070400, 0, 1427241600, 3),
(156, 'Shawnta Deltoro  ', 129506400, 2, 'Luweero T/C', '0752-575266', '', 'CDO Finance', 3, '', '', NULL, 1210636800, 0, 1420070400, 1, 1427241600, 3),
(157, 'Suzan Tibbs  ', 110408400, 2, 'Kalongo Miti Luweero Tc', NULL, '', 'Cook', 3, '', '', NULL, 1213660800, 0, 1420070400, 1, 1427241600, 3),
(158, 'Louella Dancy  ', -506829600, 1, 'Mubulizi -Tweyanze C/U', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1240876800, 0, 1420070400, 1, 1427241600, 3),
(159, 'Ruth Anstine  ', 460760400, 1, 'Nakasongola- Ssasira', NULL, '', 'Boda-Boda Man', 2, '', '', NULL, 1214265600, 0, 1420070400, 1, 1427241600, 3),
(160, 'Nathanial Ruch  ', -538624800, 1, 'Kasoma Zone', NULL, '', 'Peasant', 2, '', '', NULL, 1214870400, 0, 1420070400, 1, 1427241600, 3),
(161, 'Gwendolyn Kimbro  ', -167364000, 1, 'Kabeera- Kapeeka', '0788-458668', '', 'Peasant / Farmer', 3, '', '', NULL, 1219104000, 0, 1420070400, 1, 1427241600, 3),
(162, 'Riley Paugh  ', 28850400, 1, 'Kalongomiti', NULL, '', 'Teacher', 3, '', '', NULL, 1219276800, 0, 1420070400, 1, 1427241600, 3),
(163, 'Claretha Thibodeau  ', 448840800, 1, 'Kirema- Kapeeke', NULL, '', 'Peasant', 3, '', '', NULL, 1219276800, 0, 1420070400, 1, 1427241600, 3),
(164, 'Iliana Arends  ', -7200, 2, 'Luweero Boys P/S', NULL, '', 'Deputy Head Teacher', 2, '', '', NULL, 1218499200, 0, 1420070400, 1, 1427241600, 3),
(165, 'Anjelica Averett  ', -31543200, 2, 'Luweero Ss', '0772-843103', '', 'Teacher', 3, '', '', NULL, 1219881600, 0, 1420070400, 1, 1427241600, 3),
(166, 'Juli Mey  ', -240026400, 2, 'Kakoola- Sekamuli', '0775-571944', '', 'Farmer', 3, '', '', NULL, 1216684800, 0, 1420070400, 1, 1427241600, 3),
(167, 'Carlota Bennefield  ', -204170400, 1, 'Kizito Zone Luweero Tc', '0772-496690', '', 'Lecturer Kyambogo University', 3, '', '', NULL, 1220486400, 0, 1420070400, 1, 1427241600, 3),
(168, 'Karisa Stockstill  ', -62647200, 2, 'Kikoma Village- Wobulenzi Tc', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1170115200, 0, 1420070400, 1, 1427241600, 3),
(169, 'Carolyn Randle  ', -292212000, 2, 'Kasana Market Zone', '0772-608854', '', 'Inspector of Schools', 3, '', '', NULL, 1221523200, 0, 1420070400, 1, 1427241600, 3),
(170, 'Therese Conniff  ', 328222800, 2, 'Kasoma Zone', '0773-057019', '', 'CDO Sponsorship', 2, '', '', NULL, 1221523200, 0, 1420070400, 1, 1427241600, 3),
(171, 'Dagmar Lembo  ', 390690000, 2, 'Namirembe -Kirema Parish', '0774-012894', '', 'Business Woman', 3, '', '', NULL, 1222128000, 0, 1420070400, 1, 1427241600, 3),
(172, 'Rachelle Ponton  ', -33271200, 1, 'Ndejje', NULL, '', 'Teacher', 3, '', '', NULL, 1223337600, 0, 1420070400, 1, 1427241600, 3),
(173, 'Zetta Zambrano  ', -251344800, 2, 'Kalongo Miti', '0772-344440', '', 'Business', 3, '', '', NULL, 0, 0, 1420070400, 1, 1427241600, 3),
(174, 'Hoyt Wolverton  ', 336258000, 1, 'Katuugo Cdc', NULL, '', 'Social Worker', 2, '', '', NULL, 1224547200, 0, 1420070400, 0, 1427241600, 3),
(175, 'Meagan Spore  ', 399416400, 2, 'Nabagaya', '0774-061011', '', 'Social Worker', 2, '', '', NULL, 1328745600, 0, 1420070400, 1, 1427241600, 3),
(176, 'Trenton Moreira  ', -221104800, 1, 'Buzzibwera', '0779-268607', '', 'Lay-Reader', 3, '', '', NULL, 1226534400, 0, 1420070400, 1, 1427241600, 3),
(177, 'Chery Schirmer  ', -42429600, 2, 'Wampewo', NULL, '', 'Teacher', 3, '', '', NULL, 1226966400, 0, 1420070400, 1, 1427241600, 3),
(178, 'Adah Brumbaugh  ', 218584800, 2, 'Busula', NULL, '', 'Peasant', 2, '', '', NULL, 1329350400, 0, 1420070400, 1, 1427241600, 3),
(179, 'Albina Ono  ', 292024800, 1, 'Nsawo Cdc', NULL, '', 'Social Worker', 2, '', '', NULL, 1227830400, 0, 1420070400, 1, 1427241600, 3),
(180, 'Marva Poll  ', 397861200, 1, 'State Anthony-Nakaseke', NULL, '', 'State Attorney Nakaseke', 3, '', '', NULL, 1227744000, 0, 1420070400, 0, 1427241600, 3),
(181, 'Renata Lamothe  ', 48891600, 2, 'Kiwoko Mixed P/S', '0788-717356', '', 'Teacher', 3, '', '', NULL, 1236038400, 0, 1420070400, 1, 1427241600, 3),
(182, 'Sharell Mccormick  ', -473047200, 1, 'Timuna Parish', '0772-949273', '', 'Priest', 3, '', '', NULL, 1234828800, 0, 1420070400, 1, 1427241600, 3),
(183, 'Sharan Beacham  ', -371959200, 1, 'Ndeeba Ss', '0782-065219', '', 'Teacher', 3, '', '', NULL, 1236038400, 0, 1420070400, 1, 1427241600, 3),
(184, 'Annamae Morano  ', -43380000, 1, 'Kampala Road', NULL, '', 'Business Man', 3, '', '', NULL, 1235001600, 0, 1420070400, 1, 1427241600, 3),
(185, 'Frederic Capone  ', -338436000, 1, 'Kyetume- Nakaseeta', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1228521600, 0, 1420070400, 1, 1427241600, 3),
(186, 'Lorina Olden  ', 180565200, 1, 'Kamuli - Kikamulo', '0782-375463', '', 'Business Man', 2, '', '', NULL, 1234828800, 0, 1420070400, 1, 1427241600, 3),
(187, 'Ty Stgelais  ', -7200, 2, 'Luweero Boys P/S', '0758-888415', '', 'Teacher', 2, '', '', NULL, 1242086400, 0, 1420070400, 1, 1427241600, 3),
(188, 'Brigette Hathaway  ', 0, 2, 'Kyankonnwa Katuugo Kakooge', '0781577505', '', '', 1, '', '', NULL, 1237248000, 0, 1420070400, 1, 1420070400, 1),
(189, 'Vanita Eaves  ', -496202400, 2, 'Kasana Market Ltc', '0774-285085', '', 'Teacher', 4, '', '', NULL, 1237248000, 0, 1420070400, 1, 1427241600, 3),
(190, 'Valentin Kenna  ', 607125600, 1, 'Namirembe -Kirema Parish', '0774-012894', '', 'Mechanic', 2, '', '', NULL, 1245628800, 0, 1420070400, 0, 1443692389, 3),
(191, 'Fredia Grissett  ', 330296400, 1, 'Kiwoko- Kasana ', '0772-647451', '', 'Business', 2, '', '', NULL, 1250553600, 0, 1420070400, 1, 1427241600, 3),
(192, 'Lettie Amezcua  ', -916192800, 1, 'Kigavu-Kabaledi, Luweero', '0752-624769', '', 'Lay-Reader', 3, '', '', NULL, 1232409600, 0, 1420070400, 1, 1427241600, 3),
(193, 'Jayson Reader  ', -179892000, 1, 'Buzzibwera', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1231977600, 0, 1420070400, 1, 1427241600, 3),
(194, 'Shonna Montenegro  ', 383263200, 1, 'Lumu Zone C/O Luweero S S', NULL, '', 'Teacher', 2, '', '', NULL, 1253145600, 0, 1420070400, 1, 1427241600, 3),
(195, 'Janell Zager  ', -303530400, 2, 'Kasaala Lc1', '0779-294359', '', 'Peasant', 3, '', '', NULL, 1252368000, 0, 1420070400, 1, 1427241600, 3),
(196, 'Nan Amarante  ', -176176800, 2, 'St.Luke Ndabilako - Sekamuli', NULL, '', 'Lay-Reader', 1, '', '', NULL, 1252886400, 0, 1420070400, 1, 1427241600, 3),
(197, 'Cheryll Stiger  ', 0, 2, 'Busula /Wobulenzi', NULL, '', '', 1, '', '', NULL, 1254787200, 0, 1420070400, 1, 1420070400, 1),
(198, 'Rolland Martines  ', -38800800, 1, 'Kasana- Kavule', NULL, '', 'Business', 3, '', '', NULL, 1254787200, 0, 1420070400, 1, 1427241600, 3),
(199, 'Conrad Crowl  ', 231022800, 1, 'Kasoma Zone', '0772-554570', '', 'Teacher', 3, '', '', NULL, 1255392000, 0, 1420070400, 1, 1427241600, 3),
(200, 'Laraine Ceasar  ', -7200, 3, 'Ndejje Archdeaconary Health Centre', '0752-631266', '', '', 1, '', '', NULL, 1257379200, 0, 1420070400, 1, 1427241600, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cust_married`
--

CREATE TABLE IF NOT EXISTS `cust_married` (
`cust_married_id` int(11) NOT NULL,
  `cust_married_status` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `cust_married`
--

INSERT INTO `cust_married` (`cust_married_id`, `cust_married_status`) VALUES
(1, 'N/A'),
(2, 'Single'),
(3, 'Married'),
(4, 'Widowed');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `expenditures`
--

CREATE TABLE IF NOT EXISTS `expenditures` (
`exp_id` int(11) NOT NULL,
  `cust_id` int(6) DEFAULT NULL,
  `exptype_id` int(11) NOT NULL,
  `exp_amount` int(11) NOT NULL,
  `exp_date` int(15) DEFAULT NULL,
  `exp_text` varchar(100) DEFAULT NULL,
  `exp_recipient` varchar(75) DEFAULT NULL,
  `exp_receipt` int(11) DEFAULT NULL,
  `exp_voucher` int(11) DEFAULT NULL,
  `exp_created` int(11) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `expenditures`
--

INSERT INTO `expenditures` (`exp_id`, `cust_id`, `exptype_id`, `exp_amount`, `exp_date`, `exp_text`, `exp_recipient`, `exp_receipt`, `exp_voucher`, `exp_created`, `user_id`) VALUES
(1, NULL, 13, 3600, 1420156800, 'Break & Lunch', NULL, NULL, 2555, 1420156800, 1),
(2, NULL, 16, 1000, 1420156800, '', NULL, NULL, 2556, 1420156800, 1),
(3, NULL, 13, 7200, 1420416000, 'Break & Lunch', NULL, NULL, 2557, 1420416000, 1),
(4, NULL, 16, 1000, 1420416000, '', NULL, NULL, 2558, 1420416000, 1),
(5, NULL, 13, 7200, 1420502400, 'Break & Lunch', NULL, NULL, 2559, 1420502400, 1),
(6, NULL, 14, 18000, 1420502400, '2 Dairyz', NULL, NULL, 2560, 1420502400, 1),
(7, NULL, 16, 1500, 1420502400, '', NULL, NULL, 2561, 1420502400, 1),
(8, NULL, 1, 5000, 1420502400, 'Manager', NULL, NULL, 2562, 1420502400, 1),
(9, NULL, 16, 1000, 1420502400, '', NULL, NULL, 2562, 1420502400, 1),
(10, NULL, 13, 3600, 1420588800, 'Break & Lunch', NULL, NULL, 2563, 1420588800, 1),
(11, NULL, 8, 10000, 1445378400, 'Petrol for Motorcycle', 'Petrol Station', 456, 123, 1445426920, 1),
(12, NULL, 1, 5000, 1445814000, 'Airtime for SACCO line', 'MTN Uganda', 0, 456, 1445849776, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `exptype`
--

CREATE TABLE IF NOT EXISTS `exptype` (
`exptype_id` int(11) NOT NULL,
  `exptype_type` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `exptype`
--

INSERT INTO `exptype` (`exptype_id`, `exptype_type`) VALUES
(1, 'Airtime'),
(2, 'Bank Charges'),
(3, 'Committee Welfare'),
(4, 'Electricity'),
(5, 'Gifts'),
(6, 'Internet'),
(7, 'IT'),
(8, 'Motorcycle'),
(9, 'Office Space'),
(10, 'Petty Cash'),
(11, 'Rent'),
(12, 'Staff Facilitation'),
(13, 'Staff Welfare'),
(14, 'Stationary'),
(15, 'Tax'),
(16, 'Transport'),
(17, 'Insurance');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
`fee_id` int(11) NOT NULL,
  `fee_name` varchar(50) NOT NULL,
  `fee_short` varchar(5) NOT NULL,
  `fee_value` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `fees`
--

INSERT INTO `fees` (`fee_id`, `fee_name`, `fee_short`, `fee_value`) VALUES
(1, 'Entry Fee', 'EF', 10000),
(2, 'Withdrawal Fee', 'WF', 1000),
(3, 'Stationary Sales', 'StS', 2000),
(4, 'Anual Subscription', 'ASub', 5000),
(5, 'Loan Fee', 'LF', 1),
(6, 'Loan Application Fee', 'LAF', 0),
(7, 'Loan Fine', 'LFine', 15000),
(8, 'Loan Interest Rate', 'LIR', 2.5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `incomes`
--

CREATE TABLE IF NOT EXISTS `incomes` (
`inc_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `inctype_id` int(11) NOT NULL,
  `inc_amount` int(11) NOT NULL,
  `inc_date` int(15) NOT NULL,
  `inc_receipt` int(11) NOT NULL,
  `inc_text` varchar(200) NOT NULL,
  `inc_created` int(11) NOT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `incomes`
--

INSERT INTO `incomes` (`inc_id`, `cust_id`, `inctype_id`, `inc_amount`, `inc_date`, `inc_receipt`, `inc_text`, `inc_created`, `user_id`) VALUES
(10, 91, 3, 4000, 1424260926, 5814, '', 0, 0),
(11, 91, 7, 1000, 1424260926, 5814, '', 0, 0),
(16, 182, 3, 10000, 1424262327, 5815, '', 0, 0),
(17, 182, 7, 1000, 1424262327, 5815, '', 0, 0),
(21, 0, 3, 4000, 1424264416, 5812, '', 0, 0),
(22, 0, 7, 1000, 1424264416, 5812, '', 0, 0),
(23, 20, 3, 4000, 1424264497, 5812, '', 0, 0),
(24, 20, 7, 1000, 1424264497, 5812, '', 0, 0),
(25, 89, 3, 4000, 1424264598, 5813, '', 0, 0),
(26, 89, 7, 1000, 1424264598, 5813, '', 0, 0),
(53, 91, 4, 10000, 1426453200, 4810, '', 0, 6),
(55, 182, 4, 25000, 1426453200, 4813, '', 0, 5),
(56, 9, 2, 1000, 1423602000, 5865, '', 0, 0),
(57, 13, 2, 1000, 1425416400, 5927, '', 0, 0),
(58, 23, 4, 150000, 1425243600, 5904, '', 0, 1),
(59, 23, 4, 150000, 1422997200, 2551, '', 0, 1),
(61, 35, 4, 100000, 1425848400, 5974, '', 0, 1),
(62, 128, 4, 50000, 1424034000, 5835, '', 0, 1),
(63, 128, 4, 50000, 1426453200, 4816, '', 0, 1),
(64, 60, 2, 1000, 1424379600, 5874, '', 0, 0),
(65, 60, 2, 1000, 1424811600, 5888, '', 0, 0),
(66, 86, 2, 1000, 1426453200, 2453, '', 0, 0),
(79, 105, 5, 75000, 1422835200, 2533, '', 0, 3),
(91, 161, 4, 75000, 1424034000, 5834, '', 0, 3),
(92, 161, 4, 75000, 1425330000, 5917, '', 0, 3),
(94, 161, 4, 75000, 1427144400, 4862, '', 0, 6),
(104, 181, 4, 25000, 1422997200, 2558, '', 0, 3),
(105, 181, 4, 25000, 1425330000, 5915, '', 0, 3),
(106, 192, 4, 20000, 1425848400, 5969, '', 0, 3),
(107, 195, 4, 75000, 1427144400, 4864, '', 0, 6),
(108, 195, 4, 75000, 1421010000, 2437, '', 0, 6),
(109, 195, 4, 75000, 1425502800, 5936, '', 0, 6),
(117, 120, 4, 8750, 1423083600, 5948, '', 0, 6),
(118, 35, 4, 100000, 1427403600, 4872, '', 0, 6),
(125, 92, 4, 37500, 1427662800, 4882, '', 0, 6),
(154, 110, 4, 25000, 1427922000, 4900, '', 0, 6),
(155, 110, 4, 25000, 1425502800, 5940, '', 0, 6),
(156, 110, 4, 25000, 1422824400, 2535, '', 0, 6),
(168, 125, 7, 1000, 1423515600, 2588, '', 0, 0),
(169, 125, 3, 6000, 1427922000, 4902, '', 0, 0),
(171, 182, 4, 25000, 1428354000, 4914, '', 0, 6),
(173, 23, 4, 150000, 1428354000, 4927, '', 0, 5),
(174, 35, 4, 150000, 1428354000, 4928, '', 0, 5),
(175, 89, 4, 10000, 1428354000, 4923, '', 0, 6),
(178, 20, 4, 10000, 1426453200, 4814, '', 0, 6),
(179, 20, 4, 10000, 1428354000, 4924, '', 0, 6),
(194, 38, 4, 50000, 1428526800, 4936, '', 0, 5),
(212, 87, 9, 5, 1428876000, 888, 'Test', 1428927689, 4),
(214, 0, 1, 0, 1428876000, 0, '', 1428927854, 4),
(215, 0, 1, 0, 1428876000, 0, '', 1428927861, 4),
(216, 2, 1, 0, 1428876000, 0, '', 1428927864, 4),
(217, 0, 1, 0, 1428876000, 0, '', 1428927865, 4),
(218, 0, 1, 55, 1428876000, 0, '', 1428928022, 4),
(219, 0, 8, 889798, 1428876000, 111, 'He paid a delayed subscription for the past three years.', 1428928405, 4),
(220, 0, 8, 889798, 1428876000, 111, 'He paid a delayed subscription for the past three years.', 1428928432, 4),
(221, 19, 1, 85000, 1428876000, 8798797, 'He paid a delayed subscription for the past three years.', 1428928474, 4),
(224, 38, 4, 150000, 1427065200, 888, '', 0, 3),
(225, 38, 4, 60000, 1429740000, 999, '', 0, 3),
(226, 161, 4, 75000, 1429740000, 11, '', 0, 3),
(228, 161, 4, 50000, 1429740000, 888, '', 0, 3),
(241, 161, 4, 250000, 1429740000, 1234, '', 0, 3),
(246, 161, 4, 250000, 1429740000, 123, '', 0, 3),
(268, 91, 4, 10000, 1430690400, 100, '', 0, 3),
(269, 91, 4, 10000, 1430690400, 2147483647, '', 0, 3),
(270, 91, 4, 10000, 1430690400, 2147483647, '', 0, 3),
(271, 92, 2, 1000, 1430690400, 375, '', 0, 0),
(276, 92, 4, 262500, 1430690400, 399, '', 0, 3),
(278, 123, 2, 1000, 1430690400, 5000, '', 0, 0),
(281, 123, 2, 1000, 1430690400, 2, '', 0, 0),
(317, 200, 3, 8880, 1435528800, 888, '', 1435576484, 3),
(318, 200, 4, 22200, 1435528800, 2, '', 1435576646, 3),
(319, 200, 4, 22200, 1438120800, 100, '', 1435576666, 3),
(320, 200, 4, 22200, 1440799200, 150, '', 1435576739, 3),
(321, 200, 4, 15000, 1443477600, 230, '', 1435576804, 3),
(322, 200, 4, 22200, 1435528800, 2, '', 1435576818, 3),
(323, 200, 4, 22200, 1435528800, 23, '', 1435576824, 3),
(324, 150, 7, 1000, 1438552800, 560, '', 1438586298, 3),
(325, 150, 3, 10000, 1438639200, 2354, '', 1438586415, 3),
(326, 150, 4, 25000, 1441231200, 987, '', 1438586921, 3),
(327, 150, 4, 25000, 1443823200, 300, '', 1438586955, 3),
(328, 200, 2, 1000, 1447974000, 100, '', 1448004822, 3),
(329, 54, 7, 1000, 1439848800, 1234, '', 1439900046, 1),
(330, 190, 7, 1000, 1439848800, 1234, '', 1439901137, 1),
(331, 190, 7, 1000, 1439848800, 1234, '', 1439901402, 1),
(332, 150, 7, 1000, 1439848800, 9874, '', 1439901479, 1),
(333, 100, 7, 1000, 1439935200, 1234, '', 1439993579, 1),
(334, 100, 3, 8500, 1439935200, 87874, '', 1439993871, 1),
(335, 9, 7, 1000, 1439935200, 123, '', 1439994043, 1),
(336, 12, 7, 1000, 1439935200, 1234, '', 1439995004, 1),
(337, 12, 3, 6000, 1439416800, 54564, '', 1439996898, 1),
(338, 51, 7, 1000, 1439935200, 134, '', 1439996965, 1),
(339, 49, 7, 1000, 1439935200, 1234, '', 1439997396, 1),
(340, 130, 7, 1000, 1440453600, 1234, '', 1440495050, 1),
(341, 130, 7, 1000, 1440453600, 789, '', 1440495125, 1),
(342, 130, 7, 1000, 1440453600, 456, '', 1440495244, 1),
(343, 130, 7, 1000, 1440453600, 1, '', 1440495362, 1),
(344, 130, 7, 1000, 1440453600, 123, '', 1440495553, 1),
(345, 130, 7, 1000, 1440453600, 123, '', 1440495809, 1),
(346, 130, 7, 1000, 1440453600, 123, '', 1440495832, 1),
(347, 130, 3, 12300, 1440453600, 123, '', 1440495891, 1),
(348, 130, 7, 1000, 1440453600, 57, '', 1440496110, 1),
(349, 130, 7, 1000, 1440453600, 8888, '', 1440499563, 1),
(350, 35, 7, 1000, 1440453600, 123, '', 1440506779, 1),
(351, 100, 7, 1000, 1442700000, 1234, '', 1442822395, 1),
(352, 100, 3, 6000, 1442786400, 5678, '', 1442822573, 1),
(353, 101, 7, 1000, 1442786400, 124, '', 1442822716, 1),
(354, 3, 2, 1000, 1436392800, 789, '', 1443690643, 3),
(355, 130, 3, 15000, 1443650400, 123, '', 1443692814, 3),
(356, 100, 4, 21250, 1442700000, 1234, '', 1445244821, 3),
(357, 49, 3, 12500, 1444687200, 5678, '', 1445419109, 3),
(358, 100, 5, 10000, 1445378400, 8910, '', 1445421102, 3),
(359, 100, 4, 21250, 1445378400, 5678, '', 1445421253, 3),
(361, 100, 4, 21250, 1445378400, 132, '', 1445421520, 3),
(362, 83, 7, 1000, 1445378400, 1010, '', 1445425903, 1),
(363, 83, 3, 8000, 1445551200, 510, '', 1445426098, 1),
(364, 83, 4, 20000, 1448060400, 56, '', 1445426181, 1),
(365, 83, 4, 20000, 1450652400, 102, '', 1445426209, 1),
(366, 83, 4, 20000, 1453330800, 160, '', 1445426250, 1),
(367, 83, 4, 20000, 1445378400, 50, '', 1445426323, 1),
(368, 83, 4, 20000, 1445378400, 60, '', 1445426329, 1),
(369, 83, 4, 15000, 1445378400, 15, '', 1445426334, 1),
(370, 83, 4, 20000, 1445378400, 110, '', 1445426351, 1),
(371, 83, 4, 20000, 1445378400, 200, '', 1445426358, 1),
(372, 83, 4, 5000, 1456009200, 120, '', 1445426419, 1),
(373, 21, 7, 0, 1445551200, 123, '', 1445589504, 3),
(374, 183, 7, 0, 1445551200, 561, '', 1445591264, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `inctype`
--

CREATE TABLE IF NOT EXISTS `inctype` (
`inctype_id` int(11) NOT NULL,
  `inctype_type` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `inctype`
--

INSERT INTO `inctype` (`inctype_id`, `inctype_type`) VALUES
(1, 'Entrance Fee'),
(2, 'Withdrawal Fee'),
(3, 'Loan Fee'),
(4, 'Interest'),
(5, 'Loan Default Fines'),
(6, 'Stationary Sales'),
(7, 'Loan Application Fee'),
(8, 'Subscription Fee'),
(9, 'Other'),
(10, 'Insurance');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loan-sec`
--

CREATE TABLE IF NOT EXISTS `loan-sec` (
`loan-sec_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `sec_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loans`
--

CREATE TABLE IF NOT EXISTS `loans` (
`loan_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `loanstatus_id` int(11) NOT NULL,
  `loan_no` varchar(20) NOT NULL,
  `loan_date` int(15) NOT NULL,
  `loan_dateout` int(11) NOT NULL,
  `loan_issued` int(2) NOT NULL,
  `loan_principal` int(11) NOT NULL,
  `loan_interest` float NOT NULL,
  `cur_id` int(11) DEFAULT NULL,
  `loan_appfee_receipt` int(11) NOT NULL,
  `loan_fee` int(11) NOT NULL,
  `loan_fee_receipt` int(11) NOT NULL,
  `loan_rate` decimal(11,0) NOT NULL,
  `loan_period` int(11) NOT NULL,
  `loan_repaytotal` int(11) NOT NULL,
  `loan_repaystart` int(11) NOT NULL,
  `loan_purpose` varchar(250) NOT NULL,
  `loan_sec1` varchar(250) NOT NULL,
  `loan_sec2` varchar(250) NOT NULL,
  `loan_guarant1` int(11) NOT NULL,
  `loan_guarant2` int(11) NOT NULL,
  `loan_guarant3` int(11) NOT NULL,
  `loan_feepaid` int(1) NOT NULL DEFAULT '0',
  `loan_created` int(15) DEFAULT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `loans`
--

INSERT INTO `loans` (`loan_id`, `cust_id`, `loanstatus_id`, `loan_no`, `loan_date`, `loan_dateout`, `loan_issued`, `loan_principal`, `loan_interest`, `cur_id`, `loan_appfee_receipt`, `loan_fee`, `loan_fee_receipt`, `loan_rate`, `loan_period`, `loan_repaytotal`, `loan_repaystart`, `loan_purpose`, `loan_sec1`, `loan_sec2`, `loan_guarant1`, `loan_guarant2`, `loan_guarant3`, `loan_feepaid`, `loan_created`, `user_id`) VALUES
(1, 6, 2, 'L 6-1', 1419984000, 1419984000, 1, 2000000, 2.5, 1, 0, 20000, 0, '335714', 7, 2350000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(2, 7, 2, 'L 7-1', 1419984000, 1419984000, 1, 10000000, 2.5, 1, 0, 100000, 0, '666667', 24, 16000000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(3, 19, 2, 'L 19-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '108333', 12, 1300000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(4, 21, 2, 'L 21-1', 1419984000, 1419984000, 1, 2000000, 2.5, 1, 0, 20000, 0, '216667', 12, 2600000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(5, 23, 2, 'L 23-1', 1419984000, 1419984000, 1, 6000000, 2.5, 1, 0, 60000, 0, '650000', 12, 7800000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(6, 35, 2, 'L 35-1', 1419984000, 1419984000, 1, 6000000, 2.5, 1, 0, 60000, 0, '650000', 12, 7800000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(7, 37, 2, 'L 37-1', 1419984000, 1419984000, 1, 10000000, 2.5, 1, 0, 100000, 0, '1083333', 12, 13000000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(8, 38, 2, 'L 38-1', 1419984000, 1419984000, 1, 2000000, 2.5, 1, 0, 20000, 0, '250000', 10, 2500000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(9, 39, 2, 'L 39-1', 1419984000, 1419984000, 1, 3000000, 2.5, 1, 0, 30000, 0, '375000', 10, 3750000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(10, 43, 2, 'L 43-1', 1419984000, 1419984000, 1, 10000000, 2.5, 1, 0, 100000, 0, '1083333', 12, 13000000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(11, 45, 2, 'L 45-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '115909', 11, 1275000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(12, 50, 2, 'L 50-1', 1419984000, 1419984000, 1, 300000, 2.5, 1, 0, 3000, 0, '57500', 6, 345000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(13, 52, 2, 'L 52-1', 1419984000, 1419984000, 1, 25150000, 2.5, 1, 0, 251500, 0, '1327361', 36, 47785000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(14, 56, 2, 'L 56-1', 1419984000, 1419984000, 1, 600000, 2.5, 1, 0, 6000, 0, '100714', 7, 705000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(15, 59, 2, 'L 59-1', 1419984000, 1419984000, 1, 20000000, 2.5, 1, 0, 200000, 0, '2166667', 12, 26000000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(16, 76, 2, 'L 76-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '108333', 12, 1300000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(17, 82, 4, 'L 82-1', 1419984000, 1419984000, 1, 300000, 2.5, 1, 0, 3000, 0, '67500', 5, 337500, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(18, 86, 2, 'L 86-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '191667', 6, 1150000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(19, 92, 2, 'L 92-1', 1419984000, 1419984000, 1, 1500000, 2.5, 1, 0, 15000, 0, '187500', 10, 1875000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(20, 94, 2, 'L 94-1', 1419984000, 1419984000, 1, 3000000, 2.5, 1, 0, 30000, 0, '325000', 12, 3900000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(21, 95, 2, 'L 95-1', 1419984000, 1419984000, 1, 600000, 2.5, 1, 0, 6000, 0, '115000', 6, 690000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(22, 96, 2, 'L 96-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '108333', 12, 1300000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(23, 97, 2, 'L 97-1', 1419984000, 1419984000, 1, 4000000, 2.5, 1, 0, 40000, 0, '433333', 12, 5200000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(24, 99, 4, 'L 99-1', 1419984000, 1419984000, 1, 500000, 2.5, 1, 0, 5000, 0, '95833', 6, 575000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(25, 100, 2, 'L 100-1', 1419984000, 1419984000, 0, 2500000, 2.5, 1, 0, 25000, 0, '270833', 12, 3250000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(26, 103, 2, 'L 103-1', 1419984000, 1419984000, 1, 2500000, 2.5, 1, 0, 25000, 0, '270833', 12, 3250000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(27, 105, 2, 'L 105-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '225000', 5, 1125000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(28, 110, 2, 'L 110-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '125000', 10, 1250000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(29, 112, 2, 'L 112-1', 1419984000, 1419984000, 1, 500000, 2.5, 1, 0, 5000, 0, '83929', 7, 587500, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(30, 114, 2, 'L 114-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '125000', 10, 1250000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(31, 115, 2, 'L 115-1', 1419984000, 1419984000, 1, 700000, 2.5, 1, 0, 7000, 0, '81136', 11, 892500, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(32, 120, 2, 'L 120-1', 1419984000, 1419984000, 1, 350000, 2.5, 1, 0, 3500, 0, '78750', 5, 393750, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(33, 123, 2, 'L 123-1', 1419984000, 1419984000, 1, 1500000, 2.5, 1, 0, 15000, 0, '287500', 6, 1725000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(34, 124, 2, 'L 124-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '125000', 10, 1250000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(35, 126, 2, 'L 126-1', 1419984000, 1419984000, 1, 1500000, 2.5, 1, 0, 15000, 0, '287500', 6, 1725000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(36, 128, 2, 'L 128-1', 1419984000, 1419984000, 1, 2000000, 2.5, 1, 0, 20000, 0, '216667', 12, 2600000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(37, 141, 2, 'L 141-1', 1419984000, 1419984000, 1, 300000, 2.5, 1, 0, 3000, 0, '57500', 6, 345000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(38, 146, 2, 'L 146-1', 1419984000, 1419984000, 1, 350000, 2.5, 1, 0, 3500, 0, '78750', 5, 393750, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(39, 148, 2, 'L 148-1', 1419984000, 1419984000, 1, 400000, 2.5, 1, 0, 4000, 0, '76667', 6, 460000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(40, 151, 2, 'L 151-1', 1419984000, 1419984000, 1, 500000, 2.5, 1, 0, 5000, 0, '95833', 6, 575000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(41, 152, 2, 'L 152-1', 1419984000, 1419984000, 1, 500000, 2.5, 1, 0, 5000, 0, '95833', 6, 575000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(42, 153, 2, 'L 153-1', 1419984000, 1419984000, 1, 1500000, 2.5, 1, 0, 15000, 0, '162500', 12, 1950000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(43, 155, 4, 'L 155-1', 1419984000, 1419984000, 1, 700000, 2.5, 1, 0, 7000, 0, '134167', 6, 805000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(44, 156, 2, 'L 156-1', 1419984000, 1419984000, 1, 2000000, 2.5, 1, 0, 20000, 0, '300000', 8, 2400000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(45, 161, 2, 'L 161-1', 1419984000, 1419984000, 1, 3000000, 2.5, 1, 0, 30000, 0, '575000', 6, 3450000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(46, 165, 2, 'L 165-1', 1419984000, 1419984000, 1, 2000000, 2.5, 1, 0, 20000, 0, '250000', 10, 2500000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(47, 173, 2, 'L 173-1', 1419984000, 1419984000, 1, 600000, 2.5, 1, 0, 6000, 0, '115000', 6, 690000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(48, 178, 2, 'L 178-1', 1419984000, 1419984000, 1, 700000, 2.5, 1, 0, 7000, 0, '134167', 6, 805000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(49, 181, 2, 'L 181-1', 1419984000, 1419984000, 1, 1000000, 2.5, 1, 0, 10000, 0, '108333', 12, 1300000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(50, 186, 2, 'L 186-1', 1419984000, 1419984000, 1, 500000, 2.5, 1, 0, 5000, 0, '95833', 6, 575000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(51, 187, 2, 'L 187-1', 1419984000, 1419984000, 1, 800000, 2.5, 1, 0, 8000, 0, '153333', 6, 920000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(52, 189, 2, 'L 189-1', 1419984000, 1419984000, 1, 500000, 2.5, 1, 0, 5000, 0, '95833', 6, 575000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(53, 192, 2, 'L 192-1', 1419984000, 1419984000, 1, 500000, 2.5, 1, 0, 5000, 0, '112500', 5, 562500, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(54, 193, 2, 'L 193-1', 1419984000, 1419984000, 1, 500000, 2.5, 1, 0, 5000, 0, '83929', 7, 587500, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(55, 195, 2, 'L 195-1', 1419984000, 1419984000, 1, 3000000, 2.5, 1, 0, 30000, 0, '325000', 12, 3900000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(56, 196, 2, 'L 196-1', 1419984000, 1419984000, 1, 500000, 2.5, 1, 0, 5000, 0, '95833', 6, 575000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(57, 199, 2, 'L 199-1', 1419984000, 1419984000, 1, 2000000, 2.5, 1, 0, 20000, 0, '383333', 6, 2300000, 1420070400, '', '', '', 1, 2, 3, 0, NULL, 1),
(151, 91, 2, 'L 91-1', 1424260926, 1423609200, 1, 400000, 2.5, 1, 0, 4000, 5814, '110000', 4, 440000, 1426028400, 'School Fees', 'Motorcycle Reg No. 874 UBP', '', 125, 92, 263, 0, NULL, 0),
(154, 182, 2, 'L 182-1', 1424262327, 1423609200, 1, 1000000, 2.5, 1, 0, 10000, 5815, '108333', 12, 1300000, 1426028400, 'Development', 'Sales Agreement for Plot', '', 29, 13, 33, 0, NULL, 0),
(157, 20, 2, 'L 20-1', 1424264497, 1423609200, 1, 400000, 2.5, 1, 0, 4000, 5812, '143333', 3, 430000, 1426028400, 'School Fees', 'Cows', '', 294, 325, 89, 0, NULL, 0),
(158, 89, 2, 'L 89-1', 1424264598, 1423609200, 1, 400000, 2.5, 1, 0, 4000, 5813, '143333', 3, 430000, 1426028400, 'School Fees', 'Cows', '', 325, 294, 20, 0, NULL, 0),
(172, 125, 2, 'L 125-1', 1423515600, 1427922000, 1, 600000, 2.5, 1, 2588, 6000, 4902, '165000', 4, 660000, 0, 'school fees', 'cows', '', 113, 91, 92, 0, NULL, 5),
(173, 129, 2, 'L 129-1', 0, 1313442000, 1, 3000000, 2.5, 1, 0, 0, 0, '310000', 12, 3720000, 0, 'Purchase Motorcycle', 'Card for Motorcycle', '', 104, 0, 19, 0, NULL, 1),
(175, 200, 2, 'L 200-1', 1428876000, 1435528800, 1, 888000, 2.5, 1, 848789, 8880, 888, '133200', 8, 1065600, 0, 'TEST', 'zzz', 'zzz', 3, 5, 6, 0, NULL, 4),
(181, 100, 2, 'L 100-2', 1439935200, 1439935200, 1, 850000, 2.5, 1, 1234, 8500, 87874, '162917', 6, 977500, 0, 'test', 'Cow', '', 1, 2, 3, 0, 1439993579, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loanstatus`
--

CREATE TABLE IF NOT EXISTS `loanstatus` (
`loanstatus_id` int(11) NOT NULL,
  `loanstatus_status` varchar(50) NOT NULL,
  `loanstatus_short` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `loanstatus`
--

INSERT INTO `loanstatus` (`loanstatus_id`, `loanstatus_status`, `loanstatus_short`) VALUES
(1, 'Pending', 'PEN'),
(2, 'Approved', 'APP'),
(3, 'Refused', 'REF'),
(4, 'Abandoned', 'ABN'),
(5, 'Cleared', 'CLR');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logrec`
--

CREATE TABLE IF NOT EXISTS `logrec` (
`logrec_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `logrec_start` int(11) DEFAULT NULL,
  `logrec_end` int(11) DEFAULT NULL,
  `logrec_logout` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `logrec`
--

INSERT INTO `logrec` (`logrec_id`, `user_id`, `logrec_start`, `logrec_end`, `logrec_logout`) VALUES
(1, 1, 1436350661, 1436350664, 1),
(2, 3, 1436350678, 1436350685, 1),
(3, 2, 1436350698, NULL, 0),
(4, 1, 1436356107, 1436356114, 1),
(5, 1, 1438089374, 1438090681, 0),
(6, 1, 1438090681, 1438090695, 1),
(7, 1, 1438158654, 1438330717, 0),
(8, 3, 1438159112, 1438163751, 1),
(9, 1, 1438330717, 1438334714, 1),
(10, 3, 1438585702, 1443689697, 0),
(11, 1, 1448005450, 1448006776, 1),
(12, 1, 1439899137, 1439901688, 1),
(13, 1, 1439993545, 1439997667, 1),
(14, 1, 1440493884, 1440507137, 1),
(15, 1, 1442822296, 1442822835, 1),
(16, 1, 1443689663, 1443689682, 1),
(17, 3, 1443689697, 1443690744, 1),
(18, 3, 1443690753, 1444296983, 0),
(19, 3, 1444296983, 1445243194, 0),
(20, 3, 1445243194, 1445418742, 0),
(21, 3, 1445418742, 1445418774, 1),
(22, 3, 1445418802, 1445419966, 1),
(23, 1, 1445419978, 1445421797, 1),
(24, 1, 1445425192, 1445427134, 1),
(25, 3, 1445427146, 1445427157, 1),
(26, 3, 1445427302, 1445427477, 1),
(27, 1, 1445427930, 1445429182, 1),
(28, 3, 1445589423, 1445594594, 1),
(29, 3, 1445849533, 1445851647, 1),
(30, 1, 1445851659, 1445853303, 1),
(31, 1, 1445866890, 1445866893, 1),
(32, 3, 1445867897, 1445867901, 1),
(33, 3, 1445868136, NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ltrans`
--

CREATE TABLE IF NOT EXISTS `ltrans` (
`ltrans_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `ltrans_due` int(11) DEFAULT NULL,
  `ltrans_date` int(15) DEFAULT NULL,
  `ltrans_principaldue` int(11) DEFAULT NULL,
  `ltrans_principal` int(15) DEFAULT NULL,
  `ltrans_interestdue` int(11) DEFAULT NULL,
  `ltrans_interest` int(11) DEFAULT NULL,
  `ltrans_fined` int(1) NOT NULL DEFAULT '0',
  `ltrans_receipt` int(11) DEFAULT NULL,
  `ltrans_created` int(15) DEFAULT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ltrans`
--

INSERT INTO `ltrans` (`ltrans_id`, `loan_id`, `ltrans_due`, `ltrans_date`, `ltrans_principaldue`, `ltrans_principal`, `ltrans_interestdue`, `ltrans_interest`, `ltrans_fined`, `ltrans_receipt`, `ltrans_created`, `user_id`) VALUES
(1, 1, 1435622400, 1426453200, 441600, 100000, 0, 0, 0, 4818, NULL, 1),
(2, 2, 1435622400, NULL, 5689300, NULL, 2300000, NULL, 0, NULL, NULL, 1),
(3, 3, 1435622400, NULL, 430000, NULL, 0, NULL, 0, NULL, NULL, 1),
(4, 4, 1435622400, NULL, 1600000, NULL, 500000, NULL, 0, NULL, NULL, 1),
(5, 5, 1435622400, 1422997200, 4500000, 500000, 1350000, 150000, 0, 5904, NULL, 1),
(6, 6, 1435622400, 1423688400, 5100000, 200000, 1025000, 0, 0, 5810, NULL, 1),
(7, 7, 1435622400, NULL, 3400000, NULL, 2937000, NULL, 0, NULL, NULL, 1),
(8, 8, 1435622400, 1428526800, 270000, 220000, 250000, 50000, 0, 4936, NULL, 5),
(9, 9, 1435622400, NULL, 1750000, NULL, 300000, NULL, 0, NULL, NULL, 1),
(10, 10, 1435622400, NULL, 2000000, NULL, 0, NULL, 0, NULL, NULL, 1),
(11, 11, 1435622400, NULL, 700000, NULL, 215000, NULL, 0, NULL, NULL, 1),
(12, 12, 1435622400, NULL, 32500, NULL, 0, NULL, 0, NULL, NULL, 1),
(13, 13, 1435622400, NULL, 24610000, NULL, 12525000, NULL, 0, NULL, NULL, 1),
(14, 14, 1435622400, NULL, 16000, NULL, 0, NULL, 0, NULL, NULL, 1),
(15, 15, 1435622400, NULL, 34500000, NULL, 9670000, NULL, 0, NULL, NULL, 1),
(16, 16, 1435622400, NULL, 190000, NULL, 0, NULL, 0, NULL, NULL, 1),
(17, 17, 1435622400, NULL, 60780, NULL, 0, NULL, 0, NULL, NULL, 1),
(18, 18, 1435622400, NULL, 183200, NULL, 0, NULL, 0, NULL, NULL, 1),
(19, 19, 1435622400, 1427662800, 1200000, 150000, 300000, 37500, 0, 4882, NULL, 6),
(20, 20, 1435622400, 1428354000, 645000, 245000, 0, 0, 0, 4920, NULL, 5),
(21, 21, 1435622400, NULL, 356000, NULL, 72000, NULL, 0, NULL, NULL, 1),
(22, 22, 1435622400, NULL, 673000, NULL, 45000, NULL, 0, NULL, NULL, 1),
(23, 23, 1435622400, NULL, 2333000, NULL, 950000, NULL, 0, NULL, NULL, 1),
(24, 24, 1435622400, NULL, 415000, NULL, 75000, NULL, 0, NULL, NULL, 1),
(25, 25, 1435622400, NULL, 2010000, NULL, 600000, NULL, 0, NULL, NULL, 1),
(26, 26, 1435622400, NULL, 1850000, NULL, 1100000, NULL, 0, NULL, NULL, 1),
(27, 27, 1354233600, NULL, 525000, NULL, 0, NULL, 0, NULL, NULL, 1),
(28, 28, 1435622400, 1427922000, 1000000, 100000, 250000, 25000, 0, 4900, NULL, 6),
(29, 29, 1435622400, NULL, 285000, NULL, 10000, NULL, 0, NULL, NULL, 1),
(30, 30, 1435622400, 1426021200, 250000, 60000, 0, 0, 0, 5987, NULL, 3),
(31, 31, 1435622400, NULL, 416000, NULL, 0, NULL, 0, NULL, NULL, 1),
(32, 32, 1435622400, 1423083600, 330000, 11250, 24500, 8750, 0, 5948, NULL, 6),
(33, 33, 1435622400, NULL, 570000, NULL, 0, NULL, 0, NULL, NULL, 3),
(34, 34, 1435622400, 1427058000, 475000, 30000, 0, 0, 0, 4853, NULL, 6),
(35, 35, 1435622400, NULL, 1000000, NULL, 25000, NULL, 0, NULL, NULL, 1),
(36, 36, 1435622400, 1424034000, 666400, 170000, 200000, 50000, 0, 5835, NULL, 1),
(37, 37, 1435622400, NULL, 199000, NULL, 24000, NULL, 0, NULL, NULL, 1),
(38, 38, 1435622400, NULL, 154000, NULL, 0, NULL, 0, NULL, NULL, 1),
(39, 39, 1435622400, NULL, 152000, NULL, 40000, NULL, 0, NULL, NULL, 1),
(40, 40, 1435622400, NULL, 375000, NULL, 75000, NULL, 0, NULL, NULL, 1),
(41, 41, 1435622400, NULL, 261000, NULL, 37500, NULL, 0, NULL, NULL, 1),
(42, 42, 1435622400, 1426107600, 495000, 200000, 245000, NULL, 0, 4804, NULL, 3),
(43, 43, 1435622400, NULL, 0, NULL, 5200, NULL, 0, NULL, NULL, 1),
(44, 44, 1435622400, NULL, 460000, NULL, 0, NULL, 0, NULL, NULL, 1),
(45, 45, 1429740000, NULL, 2610000, NULL, 250000, NULL, 0, NULL, NULL, 3),
(46, 46, 1435622400, 1426539600, 930000, 150000, 0, 0, 0, 4821, NULL, 3),
(47, 47, 1435622400, NULL, 400000, NULL, 78000, NULL, 0, NULL, NULL, 1),
(48, 48, 1435622400, NULL, 155000, NULL, 0, NULL, 0, NULL, NULL, 1),
(49, 49, 1435622400, 1422997200, 665600, 84000, 200000, 25000, 0, 2558, NULL, 3),
(50, 50, 1435622400, NULL, 135750, NULL, 0, NULL, 0, NULL, NULL, 1),
(51, 51, 1435622400, NULL, 528000, NULL, 0, NULL, 0, NULL, NULL, 1),
(52, 52, 1435622400, NULL, 10000, NULL, 0, NULL, 0, NULL, NULL, 1),
(53, 53, 1435622400, 1425848400, 500000, 50000, 62500, 20000, 0, 5969, NULL, 3),
(54, 54, 1435622400, NULL, 100000, NULL, 0, NULL, 0, NULL, NULL, 1),
(55, 55, 1435622400, 1427144400, 2250000, 25000, 600000, 75000, 0, 4864, NULL, 6),
(56, 56, 1435622400, NULL, 355000, NULL, 0, NULL, 0, NULL, NULL, 1),
(57, 57, 1435622400, NULL, 266500, NULL, 0, NULL, 0, NULL, NULL, 1),
(155, 151, 1426028400, 1426453200, 100000, 60000, 10000, 10000, 0, 4810, NULL, 6),
(156, 151, 1428706800, 1430690400, 100000, 90000, 10000, 10000, 0, 100, NULL, 3),
(157, 151, 1431385200, 1430690400, 100000, 90000, 10000, 10000, 0, 2147483647, NULL, 3),
(158, 151, 1434063600, 1430690400, 100000, 90000, 10000, 10000, 0, 2147483647, NULL, 3),
(175, 154, 1426028400, 1426453200, 83337, 83400, 25000, 25000, 0, 4813, NULL, 5),
(176, 154, 1428706800, 1428354000, 83333, 83400, 25000, 25000, 0, 4914, NULL, 6),
(177, 154, 1431385200, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(178, 154, 1434063600, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(179, 154, 1436742000, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(180, 154, 1439420400, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(181, 154, 1442098800, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(182, 154, 1444777200, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(183, 154, 1447455600, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(184, 154, 1450134000, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(185, 154, 1452812400, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(186, 154, 1455490800, NULL, 83333, NULL, 25000, NULL, 0, NULL, NULL, 1),
(192, 0, 1426028400, NULL, 133334, NULL, 10000, NULL, 0, NULL, NULL, 1),
(193, 0, 1428706800, NULL, 133333, NULL, 10000, NULL, 0, NULL, NULL, 1),
(194, 0, 1431385200, NULL, 133333, NULL, 10000, NULL, 0, NULL, NULL, 1),
(195, 157, 1426028400, 1426453200, 133334, 90000, 10000, 10000, 0, 4814, NULL, 6),
(196, 157, 1428706800, 1428354000, 133333, 130000, 10000, 10000, 0, 4924, NULL, 6),
(197, 157, 1431385200, NULL, 133333, NULL, 10000, NULL, 0, NULL, NULL, 1),
(198, 158, 1426028400, 1428354000, 133334, 134000, 10000, 10000, 0, 4923, NULL, 6),
(199, 158, 1428706800, NULL, 133333, NULL, 10000, NULL, 0, NULL, NULL, 1),
(200, 158, 1431385200, NULL, 133333, NULL, 10000, NULL, 0, NULL, NULL, 1),
(250, 5, NULL, 1425243600, NULL, 500000, NULL, 150000, 0, 2551, NULL, 1),
(251, 6, NULL, 1425848400, NULL, 100000, NULL, 100000, 0, 5974, NULL, 1),
(252, 36, NULL, 1426453200, NULL, 0, NULL, 150000, 0, 4816, NULL, 1),
(276, 49, NULL, 1425330000, NULL, 83400, NULL, 25000, 0, 5915, NULL, 3),
(277, 53, NULL, 1426021200, NULL, 30000, NULL, NULL, 0, 5994, NULL, 3),
(278, 55, NULL, 1421010000, NULL, 25000, NULL, 75000, 0, 2437, NULL, 6),
(279, 55, NULL, 1425502800, NULL, 25000, NULL, 75000, 0, 5936, NULL, 6),
(283, 6, NULL, 1427403600, NULL, 0, NULL, 100000, 0, 4872, NULL, 6),
(326, 28, NULL, 1425502800, NULL, 100000, NULL, 25000, 0, 5940, NULL, 6),
(327, 28, NULL, 1422824400, NULL, 100000, NULL, 25000, 0, 2535, NULL, 6),
(333, 1, NULL, 1427922000, NULL, 100000, NULL, 0, 0, 4906, NULL, 5),
(334, 172, 1430600400, NULL, 150000, NULL, 15000, NULL, 0, NULL, NULL, 0),
(335, 172, 1433278800, NULL, 150000, NULL, 15000, NULL, 0, NULL, NULL, 0),
(336, 172, 1435957200, NULL, 150000, NULL, 15000, NULL, 0, NULL, NULL, 0),
(337, 172, 1438635600, NULL, 150000, NULL, 15000, NULL, 0, NULL, NULL, 0),
(339, 1, NULL, 1428354000, NULL, 100000, NULL, 0, 0, 4914, NULL, 5),
(340, 5, NULL, 1428354000, NULL, 500000, NULL, 150000, 0, 4927, NULL, 5),
(341, 6, NULL, 1428354000, NULL, 150000, NULL, 150000, 0, 4928, NULL, 5),
(344, 173, 1435611600, 1428354000, 701200, 100000, 0, 0, 0, 4912, NULL, 5),
(355, 8, NULL, 1427065200, NULL, 50000, NULL, 150000, 0, 888, NULL, 3),
(356, 8, NULL, 1429740000, NULL, 0, NULL, 60000, 0, 999, NULL, 3),
(357, 8, NULL, 1429826400, NULL, 0, NULL, 0, 0, 9999, NULL, 3),
(378, 151, NULL, 1430690400, NULL, 10000, NULL, 0, 0, 2147483647, NULL, 3),
(379, 151, NULL, 1430690400, NULL, 10000, NULL, 0, 0, 2147483647, NULL, 3),
(380, 19, NULL, 1430690400, NULL, 127500, NULL, 262500, 0, 399, NULL, 3),
(381, 19, NULL, 1430690400, NULL, 380000, NULL, 0, 0, 380, NULL, 3),
(382, 175, 1438207200, 1435528800, 111000, 111000, 22200, 22200, 0, 2, 1435576646, 3),
(383, 175, 1440885600, 1438120800, 111000, 77800, 22200, 22200, 0, 100, 1435576666, 3),
(384, 175, 1443564000, 1440799200, 111000, 127800, 22200, 22200, 0, 150, 1435576739, 3),
(385, 175, 1446242400, 1443477600, 111000, 0, 22200, 15000, 0, 230, 1435576804, 3),
(386, 175, 1448920800, 1435528800, 111000, 77800, 22200, 22200, 0, 2, 1435576818, 3),
(387, 175, 1451599200, 1435528800, 111000, 27800, 22200, 22200, 0, 23, 1435576824, 3),
(388, 175, 1454277600, NULL, 111000, NULL, 22200, NULL, 0, NULL, 1435576847, 3),
(389, 175, 1456956000, NULL, 111000, NULL, 22200, NULL, 0, NULL, 1435576854, 3),
(396, 181, 1442613600, 1442700000, 141665, 118750, 21250, 21250, 1, 1234, 1445421102, 3),
(397, 181, 1445292000, 1445378400, 141667, 78750, 21250, 21250, 1, 5678, 1445421253, 3),
(398, 181, 1447970400, 1445378400, 141667, 558750, 21250, 21250, 0, 132, 1445421520, 3),
(399, 181, 1450648800, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1),
(400, 181, 1453327200, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1),
(401, 181, 1456005600, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savings`
--

CREATE TABLE IF NOT EXISTS `savings` (
`sav_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `sav_date` int(15) NOT NULL,
  `sav_amount` int(15) NOT NULL DEFAULT '0',
  `cur_id` int(11) NOT NULL,
  `savtype_id` int(11) NOT NULL,
  `sav_receipt` int(11) DEFAULT NULL,
  `sav_slip` int(10) NOT NULL,
  `sav_created` int(15) DEFAULT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=744 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `savings`
--

INSERT INTO `savings` (`sav_id`, `cust_id`, `sav_date`, `sav_amount`, `cur_id`, `savtype_id`, `sav_receipt`, `sav_slip`, `sav_created`, `user_id`) VALUES
(1, 1, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(2, 2, 1420070400, 190400, 1, 1, 0, 0, NULL, 1),
(3, 3, 1420070400, 4000, 1, 1, 0, 0, NULL, 1),
(4, 4, 1420070400, 123183, 1, 1, 0, 0, NULL, 1),
(5, 5, 1420070400, 25700, 1, 1, 0, 0, NULL, 1),
(6, 6, 1420070400, 25700, 1, 1, 0, 0, NULL, 1),
(7, 7, 1420070400, 105953, 1, 1, 0, 0, NULL, 1),
(8, 8, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(9, 9, 1420070400, 550000, 1, 1, 0, 0, NULL, 1),
(10, 10, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(11, 11, 1420070400, 5276, 1, 1, 0, 0, NULL, 1),
(12, 12, 1420070400, 20000, 1, 1, 0, 0, NULL, 1),
(13, 13, 1420070400, 379700, 1, 1, 0, 0, NULL, 1),
(14, 14, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(15, 15, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(16, 16, 1420070400, 30000, 1, 1, 0, 0, NULL, 1),
(17, 17, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(18, 18, 1420070400, 24033, 1, 1, 0, 0, NULL, 1),
(19, 19, 1420070400, 74000, 1, 1, 0, 0, NULL, 1),
(20, 20, 1420070400, 26500, 1, 1, 0, 0, NULL, 1),
(21, 21, 1420070400, 143300, 1, 1, 0, 0, NULL, 1),
(22, 22, 1420070400, 16200, 1, 1, 0, 0, NULL, 1),
(23, 23, 1420070400, 100000, 1, 1, 0, 0, NULL, 1),
(24, 24, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(25, 25, 1420070400, 10200, 1, 1, 0, 0, NULL, 1),
(26, 26, 1420070400, 62500, 1, 1, 0, 0, NULL, 1),
(27, 27, 1420070400, 5100, 1, 1, 0, 0, NULL, 1),
(28, 28, 1420070400, 1200, 1, 1, 0, 0, NULL, 1),
(29, 29, 1420070400, 36000, 1, 1, 0, 0, NULL, 1),
(30, 30, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(31, 31, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(32, 32, 1420070400, 2000, 1, 1, 0, 0, NULL, 1),
(33, 33, 1420070400, 65302, 1, 1, 0, 0, NULL, 1),
(34, 34, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(35, 35, 1420070400, 20000, 1, 1, 0, 0, NULL, 1),
(36, 36, 1420070400, 99800, 1, 1, 0, 0, NULL, 1),
(37, 37, 1420070400, 1500000, 1, 1, 0, 0, NULL, 1),
(38, 38, 1420070400, 4000, 1, 1, 0, 0, NULL, 1),
(39, 39, 1420070400, 293600, 1, 1, 0, 0, NULL, 1),
(40, 40, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(41, 41, 1420070400, 4000, 1, 1, 0, 0, NULL, 1),
(42, 42, 1420070400, 11200, 1, 1, 0, 0, NULL, 1),
(43, 43, 1420070400, 91800, 1, 1, 0, 0, NULL, 1),
(44, 44, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(45, 45, 1420070400, 90800, 1, 1, 0, 0, NULL, 1),
(46, 46, 1420070400, 20000, 1, 1, 0, 0, NULL, 1),
(47, 47, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(48, 48, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(49, 49, 1420070400, 25000, 1, 1, 0, 0, NULL, 1),
(50, 50, 1420070400, 22500, 1, 1, 0, 0, NULL, 1),
(51, 51, 1420070400, 85000, 1, 1, 0, 0, NULL, 1),
(52, 52, 1420070400, 263400, 1, 1, 0, 0, NULL, 1),
(53, 53, 1420070400, 20000, 1, 1, 0, 0, NULL, 1),
(54, 54, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(55, 55, 1420070400, 25800, 1, 1, 0, 0, NULL, 1),
(56, 56, 1420070400, 2029, 1, 1, 0, 0, NULL, 1),
(57, 57, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(58, 58, 1420070400, 30600, 1, 1, 0, 0, NULL, 1),
(59, 59, 1420070400, 90800, 1, 1, 0, 0, NULL, 1),
(60, 60, 1420070400, 10040000, 1, 1, 0, 0, NULL, 1),
(61, 61, 1420070400, 360700, 1, 1, 0, 0, NULL, 1),
(62, 62, 1420070400, 165900, 1, 1, 0, 0, NULL, 1),
(63, 63, 1420070400, 27500, 1, 1, 0, 0, NULL, 1),
(64, 64, 1420070400, 11500, 1, 1, 0, 0, NULL, 1),
(65, 65, 1420070400, 11400, 1, 1, 0, 0, NULL, 1),
(66, 66, 1420070400, 141400, 1, 1, 0, 0, NULL, 1),
(67, 68, 1420070400, 81400, 1, 1, 0, 0, NULL, 1),
(68, 69, 1420070400, 1400, 1, 1, 0, 0, NULL, 1),
(69, 70, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(70, 71, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(71, 72, 1420070400, 80000, 1, 1, 0, 0, NULL, 1),
(72, 73, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(73, 74, 1420070400, 25000, 1, 1, 0, 0, NULL, 1),
(74, 75, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(75, 76, 1420070400, 600, 1, 1, 0, 0, NULL, 1),
(76, 77, 1420070400, 471000, 1, 1, 0, 0, NULL, 1),
(77, 78, 1420070400, 169000, 1, 1, 0, 0, NULL, 1),
(78, 79, 1420070400, 60000, 1, 1, 0, 0, NULL, 1),
(79, 80, 1420070400, 79000, 1, 1, 0, 0, NULL, 1),
(80, 81, 1420070400, 10200, 1, 1, 0, 0, NULL, 1),
(81, 82, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(82, 83, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(83, 84, 1420070400, 51000, 1, 1, 0, 0, NULL, 1),
(84, 85, 1420070400, 51000, 1, 1, 0, 0, NULL, 1),
(85, 86, 1420070400, 199300, 1, 1, 0, 0, NULL, 1),
(86, 87, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(87, 88, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(88, 89, 1420070400, 100000, 1, 1, 0, 0, NULL, 1),
(89, 90, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(90, 91, 1420070400, 99876, 1, 1, 0, 0, NULL, 1),
(91, 92, 1420070400, 375000, 1, 1, 0, 0, NULL, 1),
(92, 93, 1420070400, 10000, 1, 1, 0, 0, NULL, 1),
(93, 94, 1420070400, 400000, 1, 1, 0, 0, NULL, 1),
(94, 95, 1420070400, 86080, 1, 1, 0, 0, NULL, 1),
(95, 96, 1420070400, 184, 1, 1, 0, 0, NULL, 1),
(96, 97, 1420070400, 377800, 1, 1, 0, 0, NULL, 1),
(97, 98, 1420070400, 28000, 1, 1, 0, 0, NULL, 1),
(98, 99, 1420070400, 62, 1, 1, 0, 0, NULL, 1),
(99, 100, 1420070400, 550000, 1, 1, 0, 0, NULL, 1),
(100, 101, 1420070400, 52900, 1, 1, 0, 0, NULL, 1),
(101, 102, 1420070400, 95000, 1, 1, 0, 0, NULL, 1),
(102, 103, 1420070400, 11200, 1, 1, 0, 0, NULL, 1),
(103, 104, 1420070400, 18000, 1, 1, 0, 0, NULL, 1),
(104, 105, 1420070400, 160000, 1, 1, 0, 0, NULL, 1),
(105, 106, 1420070400, 20150, 1, 1, 0, 0, NULL, 1),
(106, 107, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(107, 108, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(108, 109, 1420070400, 20000, 1, 1, 0, 0, NULL, 1),
(109, 110, 1420070400, 176250, 1, 1, 0, 0, NULL, 1),
(110, 111, 1420070400, 7550, 1, 1, 0, 0, NULL, 1),
(111, 112, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(112, 113, 1420070400, 253500, 1, 1, 0, 0, NULL, 1),
(113, 114, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(114, 115, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(115, 116, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(116, 117, 1420070400, 16830, 1, 1, 0, 0, NULL, 1),
(117, 118, 1420070400, 57422, 1, 1, 0, 0, NULL, 1),
(118, 119, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(119, 120, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(120, 121, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(121, 122, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(122, 123, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(123, 124, 1420070400, 160000, 1, 1, 0, 0, NULL, 1),
(124, 125, 1420070400, 30300, 1, 1, 0, 0, NULL, 1),
(125, 126, 1420070400, 375000, 1, 1, 0, 0, NULL, 1),
(126, 127, 1420070400, 50000, 1, 1, 0, 0, NULL, 1),
(127, 128, 1420070400, 500000, 1, 1, 0, 0, NULL, 1),
(128, 129, 1420070400, 60000, 1, 1, 0, 0, NULL, 1),
(129, 130, 1420070400, 18000, 1, 1, 0, 0, NULL, 1),
(130, 131, 1420070400, 9000, 1, 1, 0, 0, NULL, 1),
(131, 132, 1420070400, 15000, 1, 1, 0, 0, NULL, 1),
(132, 133, 1420070400, 45000, 1, 1, 0, 0, NULL, 1),
(133, 134, 1420070400, 14000, 1, 1, 0, 0, NULL, 1),
(134, 135, 1420070400, 5000, 1, 1, 0, 0, NULL, 1),
(135, 136, 1420070400, 10000, 1, 1, 0, 0, NULL, 1),
(136, 137, 1420070400, 5000, 1, 1, 0, 0, NULL, 1),
(137, 138, 1420070400, 20000, 1, 1, 0, 0, NULL, 1),
(138, 139, 1420070400, 5000, 1, 1, 0, 0, NULL, 1),
(139, 140, 1420070400, 30000, 1, 1, 0, 0, NULL, 1),
(140, 141, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(141, 142, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(142, 143, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(143, 144, 1420070400, 20000, 1, 1, 0, 0, NULL, 1),
(144, 145, 1420070400, 28000, 1, 1, 0, 0, NULL, 1),
(145, 146, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(146, 147, 1420070400, 40000, 1, 1, 0, 0, NULL, 1),
(147, 148, 1420070400, 260, 1, 1, 0, 0, NULL, 1),
(148, 149, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(149, 150, 1420070400, 35000, 1, 1, 0, 0, NULL, 1),
(150, 151, 1420070400, 126200, 1, 1, 0, 0, NULL, 1),
(151, 152, 1420070400, 80000, 1, 1, 0, 0, NULL, 1),
(152, 153, 1420070400, 7500, 1, 1, 0, 0, NULL, 1),
(153, 154, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(154, 155, 1420070400, 112, 1, 1, 0, 0, NULL, 1),
(155, 156, 1420070400, 10000, 1, 1, 0, 0, NULL, 1),
(156, 157, 1420070400, 7000, 1, 1, 0, 0, NULL, 1),
(157, 158, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(158, 159, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(159, 160, 1420070400, 3000, 1, 1, 0, 0, NULL, 1),
(160, 161, 1420070400, 695700, 1, 1, 0, 0, NULL, 1),
(161, 162, 1420070400, 45000, 1, 1, 0, 0, NULL, 1),
(162, 163, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(163, 164, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(164, 165, 1420070400, 85000, 1, 1, 0, 0, NULL, 1),
(165, 166, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(166, 167, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(167, 168, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(168, 169, 1420070400, 10080, 1, 1, 0, 0, NULL, 1),
(169, 170, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(170, 171, 1420070400, 5000, 1, 1, 0, 0, NULL, 1),
(171, 172, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(172, 173, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(173, 174, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(174, 175, 1420070400, 3400, 1, 1, 0, 0, NULL, 1),
(175, 176, 1420070400, 1066, 1, 1, 0, 0, NULL, 1),
(176, 177, 1420070400, 8000, 1, 1, 0, 0, NULL, 1),
(177, 178, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(178, 179, 1420070400, 10000, 1, 1, 0, 0, NULL, 1),
(179, 180, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(180, 181, 1420070400, 5500, 1, 1, 0, 0, NULL, 1),
(181, 182, 1420070400, 108600, 1, 1, 0, 0, NULL, 1),
(182, 183, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(183, 184, 1420070400, 80000, 1, 1, 0, 0, NULL, 1),
(184, 185, 1420070400, 10000, 1, 1, 0, 0, NULL, 1),
(185, 186, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(186, 187, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(187, 188, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(188, 189, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(189, 190, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(190, 191, 1420070400, 10000, 1, 1, 0, 0, NULL, 1),
(191, 192, 1420070400, 155000, 1, 1, 0, 0, NULL, 1),
(192, 193, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(193, 194, 1420070400, 10000, 1, 1, 0, 0, NULL, 1),
(194, 195, 1420070400, 750000, 1, 1, 0, 0, NULL, 1),
(195, 196, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(196, 197, 1420070400, 8000, 1, 1, 0, 0, NULL, 1),
(197, 198, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(198, 199, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(199, 200, 1420070400, 38000, 1, 1, 0, 0, NULL, 1),
(548, 9, 1423602000, -450000, 1, 2, 682, 0, NULL, 1),
(549, 13, 1425416400, -250000, 1, 2, 502, 0, NULL, 1),
(550, 53, 1424898000, 400, 1, 1, 5893, 0, NULL, 1),
(551, 53, 1425502800, 30000, 1, 1, 5938, 0, NULL, 1),
(552, 60, 1424379600, -1500000, 1, 2, 694, 0, NULL, 1),
(553, 60, 1424811600, -8501000, 1, 2, 698, 0, NULL, 1),
(555, 61, 1423515600, 100000, 1, 1, 2590, 0, NULL, 1),
(556, 61, 1425330000, 100000, 1, 1, 5914, 0, NULL, 1),
(557, 86, 1426453200, -30000, 1, 2, 645, 0, NULL, 1),
(582, 105, 1422835200, -75000, 1, 6, 2533, 0, NULL, 3),
(660, 119, 1428354000, 50000, 1, 1, 4922, 0, NULL, 5),
(700, 161, 1429740000, 530000, 1, 1, 888, 0, NULL, 3),
(714, 91, 1430690400, -100000, 1, 8, 2147483647, 0, NULL, 3),
(715, 91, 1430690400, -10000, 1, 8, 2147483647, 0, NULL, 3),
(716, -92, 1430690400, -375000, 1, 2, 375, 0, NULL, 3),
(717, -92, 1430690400, -5500, 1, 2, 5, 0, NULL, 3),
(718, -92, 1430690400, -5000, 1, 2, 5, 0, NULL, 3),
(719, -92, 1430690400, -500, 1, 2, 5, 0, NULL, 3),
(720, -92, 1430690400, -5000, 1, 2, 5, 0, NULL, 3),
(721, 92, 1430690400, 5000, 1, 1, 5, 0, NULL, 3),
(722, 92, 1430690400, -380000, 1, 8, 380, 0, NULL, 3),
(723, -123, 1430690400, -555, 1, 2, 555, 0, NULL, 3),
(724, -123, 1430690400, -5000, 1, 2, 5000, 0, NULL, 3),
(726, 123, 1430690400, 500, 1, 1, 500, 0, NULL, 3),
(727, 123, 1430690400, -500, 1, 2, 5, 0, NULL, 3),
(728, 123, 1430690400, 1000, 1, 1, 1000, 0, NULL, 3),
(729, 123, 1430690400, -2, 1, 2, 5, 0, NULL, 3),
(730, 123, 1430690400, 50, 1, 1, 565, 0, NULL, 3),
(731, 50, 1438552800, 50000, 1, 1, 123, 0, 1438586010, 3),
(732, 200, 1447974000, -25000, 1, 2, 100, 123, 1448004822, 3),
(733, 200, 1447974000, -1000, 1, 4, 100, 123, 1448004822, 3),
(734, 3, 1430604000, 15000, 1, 1, 123, 0, 1443690583, 3),
(735, 3, 1434924000, 80000, 1, 1, 456, 0, 1443690611, 3),
(736, 3, 1436392800, -40000, 1, 2, 789, 100, 1443690643, 3),
(737, 3, 1436392800, -1000, 1, 4, 789, 100, 1443690643, 3),
(738, 3, 1443736800, 64000, 1, 1, 1011, 0, 1443690678, 3),
(739, 100, 1445378400, -10000, 1, 6, 8910, 0, 1445421102, 3),
(740, 100, 1445378400, -580000, 1, 8, 132, 0, 1445421520, 3),
(741, 83, 1445292000, 60000, 1, 1, 1234, 0, 1445425542, 1),
(742, 83, 1445378400, 15000, 1, 1, 15, 0, 1445425553, 1),
(743, 83, 1445378400, 20000, 1, 1, 500, 0, 1445426526, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savtype`
--

CREATE TABLE IF NOT EXISTS `savtype` (
`savtype_id` int(11) NOT NULL,
  `savtype_type` varchar(20) NOT NULL,
  `savtype_short` varchar(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `savtype`
--

INSERT INTO `savtype` (`savtype_id`, `savtype_type`, `savtype_short`) VALUES
(1, 'Deposit', 'D'),
(2, 'Withdrawal', 'W'),
(3, 'Interest', 'I'),
(4, 'W/drawal Fee', 'F_W'),
(5, 'Subscription Fee', 'F_S'),
(6, 'Loan Default Fine', 'LDF'),
(7, 'Loan Fee', 'F_L'),
(8, 'Loan Repayment', 'LR');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `securities`
--

CREATE TABLE IF NOT EXISTS `securities` (
`sec_id` int(11) NOT NULL,
  `cust_id` int(8) NOT NULL,
  `loan_id` int(8) NOT NULL,
  `sec_no` varchar(50) NOT NULL,
  `sec_name` varchar(100) NOT NULL,
  `sec_value` int(11) NOT NULL,
  `sec_path` varchar(200) NOT NULL,
  `sec_returned` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `securities`
--

INSERT INTO `securities` (`sec_id`, `cust_id`, `loan_id`, `sec_no`, `sec_name`, `sec_value`, `sec_path`, `sec_returned`) VALUES
(1, 100, 181, '1', 'Cow', 0, 'uploads/securities/L-100-2_Security-01.jpg', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
`set_id` int(11) NOT NULL,
  `set_name` varchar(100) NOT NULL,
  `set_short` varchar(8) NOT NULL,
  `set_value` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `settings`
--

INSERT INTO `settings` (`set_id`, `set_name`, `set_short`, `set_value`) VALUES
(1, 'Minimum Savings Balance', 'MSB', '10000'),
(2, 'Minimum Loan Principal', 'MinLP', '500000'),
(3, 'Maximum Loan Principal', 'MaxLP', '10000000'),
(4, 'Currency Abbreviation', 'CUR', 'UGX');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shares`
--

CREATE TABLE IF NOT EXISTS `shares` (
`share_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `share_date` int(11) NOT NULL,
  `share_amount` int(11) NOT NULL,
  `share_value` int(11) NOT NULL,
  `share_receipt` int(11) NOT NULL,
  `share_trans` int(2) NOT NULL,
  `share_transfrom` int(11) DEFAULT NULL,
  `share_created` int(15) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `shares`
--

INSERT INTO `shares` (`share_id`, `cust_id`, `share_date`, `share_amount`, `share_value`, `share_receipt`, `share_trans`, `share_transfrom`, `share_created`, `user_id`) VALUES
(1, 1, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(2, 2, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(3, 3, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(4, 4, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(5, 5, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(6, 6, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(7, 7, 1420070400, 15, 300000, 0, 0, 0, NULL, 1),
(8, 8, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(9, 9, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(10, 10, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(11, 11, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(12, 12, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(13, 13, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(14, 14, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(15, 15, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(16, 16, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(17, 17, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(18, 18, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(19, 19, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(20, 20, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(21, 21, 1420070400, 5, 100000, 0, 0, 0, NULL, 1),
(22, 22, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(23, 23, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(24, 24, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(25, 25, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(26, 26, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(27, 27, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(28, 28, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(29, 29, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(30, 30, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(31, 31, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(32, 32, 1420070400, 7, 150000, 0, 0, 0, NULL, 1),
(33, 33, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(34, 34, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(35, 35, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(36, 36, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(37, 37, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(38, 38, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(39, 39, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(40, 40, 1420070400, 5, 100000, 0, 0, 0, NULL, 1),
(41, 41, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(42, 42, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(43, 43, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(44, 44, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(45, 45, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(46, 46, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(47, 47, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(48, 48, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(49, 49, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(50, 50, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(51, 51, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(52, 52, 1420070400, 5, 100000, 0, 0, 0, NULL, 1),
(53, 53, 1420070400, 0, 17800, 0, 0, 0, NULL, 1),
(54, 54, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(55, 55, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(56, 56, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(57, 57, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(58, 58, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(59, 59, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(60, 60, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(61, 61, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(62, 62, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(63, 63, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(64, 64, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(65, 65, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(66, 66, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(67, 68, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(68, 69, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(69, 70, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(70, 71, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(71, 72, 1420070400, 0, 10000, 0, 0, 0, NULL, 1),
(72, 73, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(73, 74, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(74, 75, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(75, 76, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(76, 77, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(77, 78, 1420070400, 5, 100000, 0, 0, 0, NULL, 1),
(78, 79, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(79, 80, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(80, 81, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(81, 82, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(82, 83, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(83, 84, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(84, 85, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(85, 86, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(86, 87, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(87, 88, 1420070400, 0, 10000, 0, 0, 0, NULL, 1),
(88, 89, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(89, 90, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(90, 91, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(91, 92, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(92, 93, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(93, 94, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(94, 95, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(95, 96, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(96, 97, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(97, 98, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(98, 99, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(99, 100, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(100, 101, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(101, 102, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(102, 103, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(103, 104, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(104, 105, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(105, 106, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(106, 107, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(107, 108, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(108, 109, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(109, 110, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(110, 111, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(111, 112, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(112, 113, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(113, 114, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(114, 115, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(115, 116, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(116, 117, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(117, 118, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(118, 119, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(119, 120, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(120, 121, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(121, 122, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(122, 123, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(123, 124, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(124, 125, 1420070400, 2, 51500, 0, 0, 0, NULL, 1),
(125, 126, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(126, 127, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(127, 128, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(128, 129, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(129, 130, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(130, 131, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(131, 132, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(132, 133, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(133, 134, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(134, 135, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(135, 136, 1420070400, 0, 15000, 0, 0, 0, NULL, 1),
(136, 137, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(137, 138, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(138, 139, 1420070400, 0, 5000, 0, 0, 0, NULL, 1),
(139, 140, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(140, 141, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(141, 142, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(142, 143, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(143, 144, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(144, 145, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(145, 146, 1420070400, 2, 48000, 0, 0, 0, NULL, 1),
(146, 147, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(147, 148, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(148, 149, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(149, 150, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(150, 151, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(151, 152, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(152, 153, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(153, 154, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(154, 155, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(155, 156, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(156, 157, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(157, 158, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(158, 159, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(159, 160, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(160, 161, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(161, 162, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(162, 163, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(163, 164, 1420070400, 0, 16450, 0, 0, 0, NULL, 1),
(164, 165, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(165, 166, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(166, 167, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(167, 168, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(168, 169, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(169, 170, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(170, 171, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(171, 172, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(172, 173, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(173, 174, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(174, 175, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(175, 176, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(176, 177, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(177, 178, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(178, 179, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(179, 180, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(180, 181, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(181, 182, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(182, 183, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(183, 184, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(184, 185, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(185, 186, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(186, 187, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(187, 188, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(188, 189, 1420070400, 0, 0, 0, 0, 0, NULL, 1),
(189, 190, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(190, 191, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(191, 192, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(192, 193, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(193, 194, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(194, 195, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(195, 196, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(196, 197, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(197, 198, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(198, 199, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(199, 200, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(200, 3, 1430863200, 3, 60000, 1213, 0, NULL, 1443691128, 3),
(201, 3, 1443692344, 1, 20000, 0, 1, 190, 1443692344, 3),
(202, 190, 1443692344, -1, -20000, 0, 1, NULL, 1443692344, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shareval`
--

CREATE TABLE IF NOT EXISTS `shareval` (
`shareval_id` int(11) NOT NULL,
  `shareval_date` int(11) NOT NULL,
  `shareval_value` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `shareval`
--

INSERT INTO `shareval` (`shareval_id`, `shareval_date`, `shareval_value`) VALUES
(1, 1412145318, 20000),
(2, 1415607785, 25000),
(3, 1415607825, 20000),
(4, 1415607939, 20000),
(5, 1417097402, 30000),
(6, 1417097469, 20000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ugroup`
--

CREATE TABLE IF NOT EXISTS `ugroup` (
`ugroup_id` int(11) NOT NULL,
  `ugroup_name` varchar(100) NOT NULL,
  `ugroup_report` int(11) NOT NULL,
  `ugroup_admin` int(11) NOT NULL,
  `ugroup_created` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ugroup`
--

INSERT INTO `ugroup` (`ugroup_id`, `ugroup_name`, `ugroup_report`, `ugroup_admin`, `ugroup_created`) VALUES
(1, 'Administrator', 1, 1, 0),
(2, 'Management', 1, 0, 0),
(3, 'Employees', 0, 0, 1412242620),
(4, 'Ext-Admin', 0, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_pw` varchar(200) NOT NULL,
  `ugroup_id` int(11) NOT NULL,
  `user_created` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_pw`, `ugroup_id`, `user_created`) VALUES
(1, 'admin', '3c29a3c4aff054d9557eea510df85960712812d2', 1, 1436350616),
(2, 'ext-admin', '3c29a3c4aff054d9557eea510df85960712812d2', 4, 1436350622),
(3, 'John Doe', '3c29a3c4aff054d9557eea510df85960712812d2', 2, 1436350633);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `currency`
--
ALTER TABLE `currency`
 ADD PRIMARY KEY (`cur_id`), ADD KEY `cur_id` (`cur_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
 ADD PRIMARY KEY (`cust_id`);

--
-- Indizes für die Tabelle `cust_married`
--
ALTER TABLE `cust_married`
 ADD PRIMARY KEY (`cust_married_id`);

--
-- Indizes für die Tabelle `expenditures`
--
ALTER TABLE `expenditures`
 ADD PRIMARY KEY (`exp_id`);

--
-- Indizes für die Tabelle `exptype`
--
ALTER TABLE `exptype`
 ADD PRIMARY KEY (`exptype_id`);

--
-- Indizes für die Tabelle `fees`
--
ALTER TABLE `fees`
 ADD PRIMARY KEY (`fee_id`);

--
-- Indizes für die Tabelle `incomes`
--
ALTER TABLE `incomes`
 ADD PRIMARY KEY (`inc_id`);

--
-- Indizes für die Tabelle `inctype`
--
ALTER TABLE `inctype`
 ADD PRIMARY KEY (`inctype_id`);

--
-- Indizes für die Tabelle `loan-sec`
--
ALTER TABLE `loan-sec`
 ADD PRIMARY KEY (`loan-sec_id`);

--
-- Indizes für die Tabelle `loans`
--
ALTER TABLE `loans`
 ADD PRIMARY KEY (`loan_id`);

--
-- Indizes für die Tabelle `loanstatus`
--
ALTER TABLE `loanstatus`
 ADD PRIMARY KEY (`loanstatus_id`);

--
-- Indizes für die Tabelle `logrec`
--
ALTER TABLE `logrec`
 ADD PRIMARY KEY (`logrec_id`);

--
-- Indizes für die Tabelle `ltrans`
--
ALTER TABLE `ltrans`
 ADD PRIMARY KEY (`ltrans_id`);

--
-- Indizes für die Tabelle `savings`
--
ALTER TABLE `savings`
 ADD PRIMARY KEY (`sav_id`);

--
-- Indizes für die Tabelle `savtype`
--
ALTER TABLE `savtype`
 ADD PRIMARY KEY (`savtype_id`);

--
-- Indizes für die Tabelle `securities`
--
ALTER TABLE `securities`
 ADD PRIMARY KEY (`sec_id`);

--
-- Indizes für die Tabelle `settings`
--
ALTER TABLE `settings`
 ADD PRIMARY KEY (`set_id`);

--
-- Indizes für die Tabelle `shares`
--
ALTER TABLE `shares`
 ADD PRIMARY KEY (`share_id`);

--
-- Indizes für die Tabelle `shareval`
--
ALTER TABLE `shareval`
 ADD PRIMARY KEY (`shareval_id`);

--
-- Indizes für die Tabelle `ugroup`
--
ALTER TABLE `ugroup`
 ADD PRIMARY KEY (`ugroup_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `currency`
--
ALTER TABLE `currency`
MODIFY `cur_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT für Tabelle `cust_married`
--
ALTER TABLE `cust_married`
MODIFY `cust_married_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `expenditures`
--
ALTER TABLE `expenditures`
MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT für Tabelle `exptype`
--
ALTER TABLE `exptype`
MODIFY `exptype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT für Tabelle `fees`
--
ALTER TABLE `fees`
MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `incomes`
--
ALTER TABLE `incomes`
MODIFY `inc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=375;
--
-- AUTO_INCREMENT für Tabelle `inctype`
--
ALTER TABLE `inctype`
MODIFY `inctype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `loan-sec`
--
ALTER TABLE `loan-sec`
MODIFY `loan-sec_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `loans`
--
ALTER TABLE `loans`
MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT für Tabelle `loanstatus`
--
ALTER TABLE `loanstatus`
MODIFY `loanstatus_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `logrec`
--
ALTER TABLE `logrec`
MODIFY `logrec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT für Tabelle `ltrans`
--
ALTER TABLE `ltrans`
MODIFY `ltrans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=459;
--
-- AUTO_INCREMENT für Tabelle `savings`
--
ALTER TABLE `savings`
MODIFY `sav_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=744;
--
-- AUTO_INCREMENT für Tabelle `savtype`
--
ALTER TABLE `savtype`
MODIFY `savtype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `securities`
--
ALTER TABLE `securities`
MODIFY `sec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `settings`
--
ALTER TABLE `settings`
MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `shares`
--
ALTER TABLE `shares`
MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=203;
--
-- AUTO_INCREMENT für Tabelle `shareval`
--
ALTER TABLE `shareval`
MODIFY `shareval_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `ugroup`
--
ALTER TABLE `ugroup`
MODIFY `ugroup_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
