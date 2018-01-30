-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 16. Okt 2017 um 15:19
-- Server-Version: 10.1.25-MariaDB-
-- PHP-Version: 7.0.22-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mangoo`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `custmarried`
--

CREATE TABLE `custmarried` (
  `custmarried_id` int(11) NOT NULL,
  `custmarried_status` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `custmarried`
--

INSERT INTO `custmarried` (`custmarried_id`, `custmarried_status`) VALUES
(0, 'N/A'),
(1, 'Single'),
(2, 'Married'),
(3, 'Widowed'),
(4, 'Divorced');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_no` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cust_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cust_dob` int(11) DEFAULT NULL,
  `custsex_id` int(11) NOT NULL,
  `cust_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cust_phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cust_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cust_occup` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `custmarried_id` int(11) NOT NULL,
  `cust_heir` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cust_heirrel` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cust_lengthres` int(11) DEFAULT NULL,
  `cust_since` int(11) DEFAULT NULL,
  `custsick_id` int(11) DEFAULT NULL,
  `cust_lastsub` int(11) DEFAULT NULL,
  `cust_active` int(1) NOT NULL DEFAULT '0',
  `cust_lastupd` int(11) DEFAULT NULL,
  `cust_pic` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_no`, `cust_name`, `cust_dob`, `custsex_id`, `cust_address`, `cust_phone`, `cust_email`, `cust_occup`, `custmarried_id`, `cust_heir`, `cust_heirrel`, `cust_lengthres`, `cust_since`, `custsick_id`, `cust_lastsub`, `cust_active`, `cust_lastupd`, `cust_pic`, `user_id`) VALUES
(0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(1, '001/2016', 'John Wycliff', -1262307600, 1, 'Yorkshire', '031 12 1384', '', 'Theologian', 1, '', '', NULL, 1140000000, 0, 1630718000, 1, 1457431040, 'uploads/photos/customers/cust1_146x190.jpg', 1),
(2, '002/2006', 'Jan Hus', 78793200, 1, 'Prague', '0607 1415', '', 'Reformer', 2, 'Joh. Joseph Hu&szlig;', 'Father', NULL, 1141776000, 0, 1456268400, 1, 1457431296, 'uploads/photos/customers/cust2_146x190.jpg', 1),
(3, '003/2006', 'Martin Luther', 437266800, 1, 'Geneva', '018 02 1546', '', 'Reformer', 2, 'Katharina von Bora', 'Wife', NULL, 1141884000, 5, 1475963995, 1, 1507576835, 'uploads/photos/customers/cust3_146x190.jpg', 1),
(4, '004/2006', 'Huldrych Zwingli', 441759600, 1, 'Zurich', '011 10 1531', '', 'Reformer', 2, 'Anna Reinhart', 'Wife', NULL, 1155552000, 0, 1507500000, 1, 1457433917, 'uploads/photos/customers/cust4_146x190.jpg', 1),
(5, '005/2006', 'Martin Bucer', 689814000, 1, 'Strasbourg', '010 31551', '', 'Reformer', 2, 'Elisabeth Silbereisen', 'Wife', NULL, 1159440000, 0, 1426990400, 1, 1457434157, 'uploads/photos/customers/cust5_146x190.jpg', 1),
(6, '006/2015', 'Philip Melanchthon', 856047600, 1, 'Wittenberg', '019 041560', '', 'Reformer', 2, 'Katharina Krapp', 'Wife', NULL, 1163328000, 0, 1622942000, 1, 1457434738, 'uploads/photos/customers/cust6_146x190.jpg', 1),
(7, '007/2006', 'Heinrich Bullinger', -2065654800, 1, 'Zurich', '017 091575', '', 'Reformer', 2, 'Anna Adlischweiler', 'Wife', NULL, 1167216000, 0, 1456190000, 1, 1457434831, 'uploads/photos/customers/cust7_146x190.jpg', 1),
(8, '008/2006', 'Johannes Calvin', -1908579600, 1, 'Geneva', '027 051564', '', 'Reformer', 2, 'Idelette de Bure', 'Wife', NULL, 1171104000, 0, 1425077995, 1, 1458667201, 'uploads/photos/customers/cust8_146x190.jpg', 1),
(9, '009/2006', 'John Knox', -1767229200, 1, 'Edinburgh', '024 111572', '', 'Reformer', 1, '', '', NULL, 1174992000, 0, 1430446400, 1, 1457435038, 'uploads/photos/customers/cust9_146x190.jpg', 1),
(10, '010/2006', 'Caspar Olevian', -1053824400, 1, 'Heidelberg', '015 031587', '', 'Reformer', 2, 'Philippine von Metz', 'Wife', NULL, 1178880000, 0, 1508104800, 1, 1457435215, 'uploads/photos/customers/cust10_146x190.jpg', 1),
(11, '011/2006', 'Nydius Melvinus', -341802000, 3, 'Kiziba Kikyusa Archdeaconry', '0772-968414', 'huxpoll@yahoo.com', 'Preacher', 2, 'Mrs. Luna Mwamiza', 'Wife', NULL, 1182768000, 1, 1402174400, 0, 1454656213, NULL, 1),
(12, '012/2006', 'Joshua Vandenburg  ', -552448800, 1, 'Kiziba Kikyusa Arch', '0772-551662', '', 'Clergy Man', 2, '', '', NULL, 1186656000, 0, 1469138400, 1, 1420070400, NULL, 1),
(13, '013/2006', 'Melania Mitchem  ', 158364000, 1, 'Kalere', '0782-380513', '', 'Clergy', 1, '', '', NULL, 1190544000, 0, 1413902400, 0, 1420070400, NULL, 1),
(14, '014/2006', 'Clemmie Ellithorpe  ', -929930400, 1, 'Kazinga Butuntumula', '021513', '', 'Clergy Man', 2, '', '', NULL, 1194432000, 0, 1469138400, 1, 1469178601, NULL, 1),
(15, '015/2006', 'Kristofer Artis  ', -90000, 1, 'Kisenyi', '0', '', '', 0, '', '', NULL, 1198320000, 0, 1508104800, 1, 1452688368, NULL, 1),
(16, '016/2007', 'Lulu Obando  ', -440989200, 7, 'Sempa Parish ', '0782-096008', '', 'Clergy Man', 2, '', '', NULL, 1202208000, 0, 1436424400, 1, 1458640847, NULL, 1),
(17, '017/2006', 'Kai Soriano  ', -86403600, 1, 'Luteete', '02314 549945', '', 'Pastor / Teacher', 2, '', '', NULL, 1206096000, 0, 1437358400, 1, 1453822238, NULL, 1),
(18, '018/2006', 'Lynne Pratico  ', 160182000, 1, 'Bwaziba', '0891 128461', '', 'Clergy / Farmer', 2, '', '', NULL, 1209984000, 0, 1418222400, 0, 1453145549, NULL, 1),
(19, '019/2006', 'Noella Holyfield  ', -633578400, 1, 'Kasana -Kiwogozi', '0772-984673', '', 'Clergy Man', 2, '', '', NULL, 1213872000, 0, 1439086400, 1, 1420070400, NULL, 1),
(20, '020/2006', 'Berry Steve  ', -256525200, 1, 'Bombo', '0782-453477', '', 'Clergy Man', 2, '', '', NULL, 1217760000, 0, 1507672800, 1, 1427241600, NULL, 2),
(21, '021/2006', 'Gregorio Schurr  ', -479527200, 1, 'Kasiso', '0772-532964', '', 'Clergy Man', 2, '', '', NULL, 1221648000, 0, 1440814400, 1, 1420070400, NULL, 1),
(22, '022/2006', 'Arnetta Lobato', -744170400, 2, 'Bakijulura', '0785 368641', '', 'Retired', 3, '', '', NULL, 1225536000, 1, 1424991595, 1, 1458718116, NULL, 1),
(23, '023/2006', 'Ayana Mohammed  ', -368762400, 1, 'St. Mark Luweero', '0772-183125', '', 'Clergy Man', 2, '', '', NULL, 1229424000, 0, 1442542400, 1, 1420070400, NULL, 1),
(24, '024/2006', 'Conrad Keitt  ', -748404000, 1, 'Namusale', NULL, '', 'Clergy Man', 2, '', '', NULL, 1233312000, 0, 1443406400, 1, 1420070400, NULL, 1),
(25, '025/2006', 'Stephine Leitner  ', -559875600, 1, 'Buwana', '0773142217', '', 'Clergy Man', 2, '', '', NULL, 1237200000, 0, 1444270400, 0, 1458639837, NULL, 1),
(26, '026/2007', 'Tequila Lino  ', -597549600, 1, 'Sekamuli Area', '0782-880521', '', 'Clergy Man', 2, '', '', NULL, 1241088000, 0, 1445134400, 1, 1420070400, NULL, 1),
(27, '027/2007', 'Deena Hawes  ', -932349600, 1, 'Zirobwe', NULL, '', 'Clergy Man', 2, '', '', NULL, 1244976000, 0, 1445998400, 1, 1420070400, NULL, 1),
(28, '028/2006', 'Kellye Whitley  ', -363924000, 1, 'Lukomera', '0779-253864', '', 'Clergy Man / Teacher', 2, '', '', NULL, 1248864000, 0, 1446862400, 0, 1507628187, NULL, 1),
(29, '029/2007', 'Judi Spillman  ', -573703200, 1, 'Balitta- Lwogi', '0782-559766', '', 'Clergy Man', 2, '', '', NULL, 1252752000, 0, 1447726400, 1, 1420070400, NULL, 1),
(30, '030/2006', 'Lion of Juda Secondary School', -3600, 6, 'Luweero', '0251-1213159', '', '', 0, 'Dr. Raul Philips', 'Headmaster', NULL, 1256640000, 0, 1507672800, 1, 1454954625, NULL, 1),
(31, '031/2006', 'Robena Burget  ', -90000, 5, 'Kasana', '02589 452103', '', 'Clergy Man', 2, '', '', NULL, 1260528000, 0, 1449454400, 0, 1454655778, NULL, 1),
(32, '032/2006', 'Milda Mcamis  ', -427860000, 1, 'Bweyeeyo-Luweero', NULL, '', 'Clergy Man', 2, '', '', NULL, 1264416000, 0, 1450318400, 1, 1420070400, NULL, 1),
(33, '033/2006', 'Alec Kearl  ', -336794400, 1, 'Nakaseke', '0773-974456', '', 'Pastor / Teacher', 2, '', '', NULL, 1268304000, 0, 1451182400, 1, 1427241600, NULL, 3),
(34, '034/2006', 'Ngoc Alcantar  ', -185335200, 1, 'Kasana Kvule-Luweero', NULL, '', 'Clergy Man', 2, '', '', NULL, 1272192000, 0, 1452046400, 1, 1420070400, NULL, 1),
(35, '035/2006', 'Sharen Harr  ', -33271200, 2, 'Luweero Town Council', '0772-442574', '', 'Accounts Clerk', 2, '', '', NULL, 1276080000, 0, 1452910400, 1, 1420070400, NULL, 1),
(36, '036/2006', 'Kryshtam Rebem  ', -320115600, 2, 'Kungu-Busula', '09125 - 54138', '', '', 2, '', '', NULL, 1279968000, 0, 1453774400, 1, 1454959237, NULL, 1),
(37, '037/2006', 'Ronni Knoles  ', -213069600, 1, 'Kungu-Busula', '0772-365951', '', 'Social Worker', 2, '', '', NULL, 1283856000, 0, 1454638400, 1, 1420070400, NULL, 1),
(38, '038/2006', 'Ela Denmark  ', 401230800, 2, 'Kungu-Busula', NULL, '', 'Counsellor / Volunteer', 1, '', '', NULL, 1287744000, 0, 1455502400, 1, 1420070400, NULL, 1),
(39, '039/2006', 'Grace Hamer  ', 55717200, 1, 'Busula', '0701-855942', '', 'Road Supervisor', 1, '', '', NULL, 1291632000, 0, 1456366400, 1, 1420070400, NULL, 1),
(40, '040/2006', 'Emma Bermea  ', -340855200, 2, 'Wobulenzi', NULL, '', 'Teacher', 2, '', '', NULL, 1295520000, 0, 1457230400, 1, 1420070400, NULL, 1),
(41, '041/2006', 'Rosana Breit  ', 534549600, 1, 'Busula', NULL, '', 'Student', 1, '', '', NULL, 1299408000, 0, 1458094400, 1, 1420070400, NULL, 1),
(42, '042/2006', 'Evelynn Mickles  ', 292543200, 2, 'Kungu-Busula', NULL, '', 'Trader - Retail', 2, '', '', NULL, 1303296000, 0, 1458958400, 1, 1420070400, NULL, 1),
(43, '043/2006', 'Tonie Maroney  ', 141858000, 2, 'Bendegere Namusaale', NULL, '', 'Customer Care Manager', 2, '', '', NULL, 1307184000, 0, 1459822400, 1, 1420070400, NULL, 1),
(44, '044/2006', 'Fallon Rosendahl  ', -46231200, 1, 'Buwana Kinyogoga', NULL, '', 'Clergy Man', 2, '', '', NULL, 1311072000, 0, 1460686400, 0, 1427241600, NULL, 3),
(45, '045/2006', 'Renato Loudon  ', -361072800, 1, 'Kaswa- Busula', '0774-764113', '', 'Lay-Reader', 2, '', '', NULL, 1314960000, 0, 1461550400, 1, 1420070400, NULL, 1),
(46, '046/2006', 'Garth Swartwood  ', -184298400, 2, 'Kikoma C/U Wobulenzi Tc', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1318848000, 0, 1462414400, 1, 1420070400, NULL, 1),
(47, '047/2006', 'Joannie Gust  ', 75589200, 2, 'Kikoma Wobulenzi', NULL, '', 'Peasant - Farmer', 2, '', '', NULL, 1322736000, 0, 1463278400, 1, 1420070400, NULL, 1),
(48, '048/2006', 'Fermina Collazo  ', -240890400, 2, 'Kikona Wobulenzi Central', NULL, '', 'Peasant / Farmer', 2, '', '', NULL, 1326624000, 0, 1464142400, 1, 1420070400, NULL, 1),
(49, '049/2006', 'Lavenia Byler  ', -252468000, 1, 'Kayindu C/U', '0785-772868', '', 'Lay-Reader', 2, '', '', NULL, 1330512000, 0, 1465006400, 1, 1420070400, NULL, 1),
(50, '050/2006', 'Patrick Mukasa', 167439600, 1, 'Katuugo Parish', '0782-447156', '', 'Lay-Reader / Tailor', 2, '', '', NULL, 1334400000, 0, 1507672800, 1, 1460549411, NULL, 1),
(51, '051/2008', 'Alicia Wehner  ', -207453600, 2, 'Waluleeta Makulubita', '0782-461460', '', 'Trainer / Social Worker', 2, '', '', NULL, 1338288000, 0, 1466734400, 1, 1420070400, NULL, 1),
(52, '052/2006', 'Ocie Edds  ', -605412000, 1, 'Administrator Luweero Diocese', NULL, '', 'Diocesan Bishop', 2, '', '', NULL, 1342176000, 0, 1467598400, 1, 1420070400, NULL, 1),
(53, '053/2006', 'Darcy Read  ', 309736800, 2, 'Luwero TC', NULL, '', 'Secretary', 1, '', '', NULL, 1346064000, 0, 1468462400, 1, 1420070400, NULL, 1),
(54, '054/2006', 'Augustina Shuman  ', -244605600, 2, 'Kaswa- Busula', NULL, '', 'Lay-Reader', 1, '', '', NULL, 1349952000, 0, 1469326400, 1, 1420070400, NULL, 1),
(55, '055/2009', 'Catherine Adler  ', -3600, 3, 'Luweero Diocese', '0785 368641', '', '', 3, '', '', NULL, 1353840000, 3, 1470190400, 1, 1454572218, NULL, 1),
(56, '056/2007', 'Shanae Bello  ', 77144400, 2, 'Luweero Boys School', NULL, '', 'Teacher', 1, '', '', NULL, 1357728000, 0, 1471054400, 1, 1420070400, NULL, 1),
(57, '057/2006', 'Ferne Munson  ', -7200, 1, 'Bweyeyo', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1361616000, 0, 1471918400, 0, 1427241600, NULL, 3),
(58, '058/2006', 'Ja Nordby  ', -7200, 2, 'Kungu- Kikoma', NULL, '', 'Housewife', 2, '', '', NULL, 1365504000, 0, 1472782400, 1, 1420070400, NULL, 1),
(59, '059/2006', 'Illa Penaflor  ', -179632800, 2, 'Kiwogozi', '0772-662202', '', 'Teacher / MP', 0, '', '', NULL, 1369392000, 0, 1473646400, 1, 1420070400, NULL, 1),
(60, '060/2007', 'Annabelle Bradham  ', -455763600, 5, 'Kiwoko Arch', '0772-657419', '', 'Clergy Man', 2, '', '', NULL, 1373280000, 0, 1474510400, 1, 1454655767, NULL, 1),
(61, '061/2006', 'Tanner Wake  ', -539143200, 1, 'Bukalabi Parish', '0752-631706', '', 'Clergy Man', 2, '', '', NULL, 1377168000, 0, 1475374400, 1, 1420070400, NULL, 1),
(62, '062/2007', 'Cristobal Passman  ', -399088800, 2, 'Luteete Arch', NULL, '', 'Housewife', 2, '', '', NULL, 1381056000, 0, 1476238400, 1, 1420070400, NULL, 1),
(63, '063/2007', 'Rosita Pankratz  ', -394077600, 2, 'Ndejje Village', NULL, '', 'Peasant / Farmer', 2, '', '', NULL, 1384944000, 0, 1477102400, 1, 1420070400, NULL, 1),
(64, '064/2007', 'Angila Gauldin  ', 404949600, 2, 'Nalinya Lwantale Girls P/S', NULL, '', 'Teacher', 1, '', '', NULL, 1388832000, 0, 1477966400, 1, 1420070400, NULL, 1),
(65, '065/2007', 'Jerrica Darnell  ', 534981600, 1, 'Ndejje- Sambwe', NULL, '', 'Student', 1, '', '', NULL, 1392720000, 0, 1478830400, 1, 1420070400, NULL, 1),
(66, '066/2007', 'Paul Mushrush  ', 513554400, 2, 'Ndejje - Sambwe', NULL, '', '', 1, '', '', NULL, 1396608000, 0, 1479694400, 1, 1420070400, NULL, 1),
(67, '067/1970', 'Daren Konkol', -3600, 1, 'Entebbe', '0201 456316', 'konkol@yahoo.com', '', 2, '', '', NULL, 1400496000, 0, 1424905195, 1, 1457078853, NULL, 1),
(68, '068/2007', 'Kristin Lippard  ', 967323600, 2, 'Ndejje- Sambwe', NULL, '', '', 1, '', '', NULL, 1404384000, 0, 1481422400, 1, 1420070400, NULL, 1),
(69, '069/2007', 'Frederic Marchese  ', 510012000, 1, 'Ndejje- Sambwe', NULL, '', '', 1, '', '', NULL, 1408272000, 0, 1482286400, 1, 1420070400, NULL, 1),
(70, '070/2007', 'Gaynelle Busbee  ', -90000, 0, 'Kikoma Wobulenzi', '0566121212', '', 'Service Provider', 2, '', '', NULL, 1412160000, 0, 1483150400, 0, 1453146345, NULL, 1),
(71, '071/2007', 'Remona Sheffler  ', -75693600, 2, 'Kisaawe Muyenga Wobulenzi', NULL, '', 'Teacher', 1, '', '', NULL, 1416048000, 0, 1484014400, 0, 1427241600, NULL, 3),
(72, '072/2006', 'Federica Iliff  ', -115261200, 2, 'Luweero Child Devt Centre', '02589 452103', '', 'Peasant', 1, '', '', NULL, 1419936000, 0, 1517879600, 1, 1455023003, NULL, 1),
(73, '073/2008', 'Chan Milby  ', 864252000, 2, 'St.Peters-Kisugu', NULL, '', '', 1, '', '', NULL, 1423824000, 0, 1485742400, 1, 1420070400, NULL, 1),
(74, '074/2007', 'Piedad Mcgonigal  ', -208231200, 2, 'Ndejje Arch', NULL, '', 'Health Coordinator', 2, '', '', NULL, 1427712000, 0, 1486606400, 1, 1420070400, NULL, 1),
(75, '075/1970', 'Rhonda Pierpont  ', -3600, 2, 'Nakasongola', '0215161', '', '', 0, '', '', NULL, 1431600000, 0, 1487470400, 1, 1460789669, NULL, 1),
(76, '076/2007', 'Celinda Dulac  ', -45194400, 1, 'Luweerotc- Kizito Zone', '0712-219411', '', 'Clergy Man / Teacher', 2, '', '', NULL, 1435488000, 0, 1488334400, 1, 1420070400, NULL, 1),
(77, '077/2007', 'Edmond Kneeland  ', 120348000, 2, 'Luweero', NULL, '', 'Secretary', 2, '', '', NULL, 1439376000, 0, 1489198400, 1, 1420070400, NULL, 1),
(78, '078/2007', 'Lyndia Kump  ', -872301600, 2, 'C/O DCA Kampala', NULL, '', 'Nurse', 1, '', '', NULL, 1443264000, 0, 1490062400, 1, 1420070400, NULL, 1),
(79, '079/2007', 'Michael Poovey  ', -358740000, 2, 'Luweero Diocese', NULL, '', 'CBO Trainer', 2, '', '', NULL, 1447152000, 0, 1490926400, 1, 1420070400, NULL, 1),
(80, '080/2007', 'Omega Prochnow  ', -121312800, 2, 'Luweero Diocese', '0782-352335', '', 'Nurse', 2, '', '', NULL, 1451040000, 0, 1491790400, 1, 1420070400, NULL, 1),
(81, '081/2007', 'Sheri Stuck  ', -873770400, 1, 'Kiteredde Buyuki Katikamu', NULL, '', 'Peasant / Farmer', 2, '', '', NULL, 1454928000, 0, 1492654400, 1, 1420070400, NULL, 1),
(82, '082/2007', 'Shellie Bromley  ', -24544800, 1, 'Kangulumira- Mpologoma ', NULL, '', 'Teacher', 2, '', '', NULL, 1458816000, 0, 1493518400, 0, 1420070400, NULL, 1),
(83, '083/2007', 'Joshua Meiser  ', -1036803600, 1, 'Kikasa Wobulenzi Cetral', '0790-562315', '', 'Building Contractor', 2, 'Anne Meiser', 'Wife', NULL, 1462704000, 0, 1494382400, 1, 1445425402, NULL, 1),
(84, '084/2007', 'Jean Piehl  ', 135727200, 1, 'Wobulenzi-Kigulu', NULL, '', '', 2, '', '', NULL, 1466592000, 0, 1495246400, 1, 1420070400, NULL, 1),
(85, '085/2007', 'Lovella Canaday  ', 399934800, 1, 'Kiwoko - Kasana ', NULL, '', 'Primary Teacher', 1, '', '', NULL, 1470480000, 0, 1496110400, 1, 1420070400, NULL, 1),
(86, '086/2007', 'Val Cauley  ', 200955600, 2, 'Luweero T/C', '0772-688874', '', 'Social Worker', 1, '', '', NULL, 1474368000, 0, 1496974400, 1, 1420070400, NULL, 1),
(87, '087/2008', 'Michale Belvin  ', -600228000, 3, 'Kyatagali - Mabuye -Kamira', NULL, '', 'Lay-Reader / Peasant', 2, '', '', NULL, 1478256000, 0, 1497838400, 1, 1420070400, NULL, 1),
(88, '088/2007', 'Vernon Shade  ', 252630000, 2, 'Kagoma', '0', '', 'Social Worker', 2, '', '', NULL, 1482144000, 0, 1498702400, 1, 1460387555, NULL, 1),
(89, '089/2007', 'Susie Cratty  ', 72054000, 2, 'Katikamu P/S', '0782-158039', '', 'Teacher', 2, '', '', NULL, 1486032000, 0, 1499566400, 1, 1427241600, NULL, 2),
(90, '090/2007', 'Sima Cunningham  ', 188690400, 1, 'Luweero Town Council', '0772-305106', '', 'Social Worker', 1, '', '', NULL, 1489920000, 0, 1500430400, 1, 1420070400, NULL, 1),
(91, '091/2007', 'Leonel Weitzman  ', -164941200, 1, 'Katikamu Trinity Church', '0774068617', '', 'Lay-Reader', 2, '', '', NULL, 1493808000, 0, 1501294400, 1, 1427241600, NULL, 2),
(92, '092/2007', 'Corine Hansell  ', 135986400, 2, 'Katikamu- Sebamala', '0782-485545', '', 'Teacher', 2, '', '', NULL, 1497696000, 0, 1502158400, 1, 1420070400, NULL, 1),
(93, '093/2008', 'Beatrice Cortez  ', 166744800, 1, 'Kibula LC1 Kabakeddi Parish', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1501584000, 0, 1503022400, 1, 1420070400, NULL, 1),
(94, '094/2007', 'Lore Keltz  ', 16837200, 1, 'Katikamu', '0772-670909', '', 'Clergy Man', 2, '', '', NULL, 1505472000, 0, 1503886400, 1, 1420070400, NULL, 1),
(95, '095/2007', 'Eda Edmonson  ', 261352800, 1, 'Kasoma Zone', '0772-641144', '', 'Health Worker', 1, '', '', NULL, 1509360000, 0, 1504750400, 1, 1420070400, NULL, 1),
(96, '096/2007', 'Clotilde Fuqua  ', -83210400, 1, 'Kangulumira- Mpologoma ', '0773-266136', '', 'Business Man', 2, '', '', NULL, 1513248000, 0, 1505614400, 1, 1420070400, NULL, 1),
(97, '097/2007', 'Rosamaria Hardeman  ', -7200, 1, 'Sempa C/U', '0772964823', '', 'Lay-Reader', 2, '', '', NULL, 1517136000, 0, 1506478400, 1, 1420070400, NULL, 1),
(98, '098/2007', 'Wilfred Dinger  ', 24094800, 1, 'Nalulya Butuntumula Luweero Diocese', '0782-424243', '', 'Lay-Reader', 1, '', '', NULL, 1521024000, 0, 1507342400, 1, 1420070400, NULL, 1),
(99, '099/2007', 'Minh Myrie  ', -161920800, 1, 'Mulilo Zone', NULL, '', 'Tailor', 2, '', '', NULL, 1524912000, 0, 1508206400, 1, 1420070400, NULL, 1),
(100, '100/2007', 'Sherly Boudreau', 313974000, 2, 'Kasana T/C', '0782-415747', '', 'Child Development Officer', 1, 'Hans Wurst', '', NULL, 1528800000, 0, 1509070400, 1, 1456493050, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `custsex`
--

CREATE TABLE `custsex` (
  `custsex_id` int(11) NOT NULL,
  `custsex_name` varchar(25) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `custsex`
--

INSERT INTO `custsex` (`custsex_id`, `custsex_name`) VALUES
(0, NULL),
(1, 'Male'),
(2, 'Female'),
(3, 'Couple'),
(4, 'Family'),
(5, 'Group'),
(6, 'Institution'),
(7, 'Business');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `custsick`
--

CREATE TABLE `custsick` (
  `custsick_id` int(11) NOT NULL,
  `custsick_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `custsick_risk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `custsick`
--

INSERT INTO `custsick` (`custsick_id`, `custsick_name`, `custsick_risk`) VALUES
(0, 'None', 0),
(1, 'Heart Attack', 1),
(2, 'Stroke', 1),
(3, 'Cancer', 3),
(4, 'HIV/AIDS', 3),
(5, 'Ulcer', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `emplmarried`
--

CREATE TABLE `emplmarried` (
  `emplmarried_id` int(11) NOT NULL,
  `emplmarried_status` varchar(15) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `emplmarried`
--

INSERT INTO `emplmarried` (`emplmarried_id`, `emplmarried_status`) VALUES
(0, NULL),
(1, 'Single'),
(2, 'Married'),
(3, 'Widowed'),
(4, 'Divorced');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `empl_id` int(11) NOT NULL,
  `empl_no` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `empl_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `empl_dob` int(11) DEFAULT NULL,
  `emplsex_id` int(11) NOT NULL,
  `emplmarried_id` int(11) NOT NULL,
  `empl_position` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `empl_salary` int(11) DEFAULT NULL,
  `empl_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `empl_phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `empl_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `empl_in` int(11) DEFAULT NULL,
  `empl_out` int(11) DEFAULT NULL,
  `empl_lastupd` int(11) DEFAULT NULL,
  `empl_active` int(1) NOT NULL DEFAULT '0',
  `empl_pic` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`empl_id`, `empl_no`, `empl_name`, `empl_dob`, `emplsex_id`, `emplmarried_id`, `empl_position`, `empl_salary`, `empl_address`, `empl_phone`, `empl_email`, `empl_in`, `empl_out`, `empl_lastupd`, `empl_active`, `empl_pic`, `user_id`) VALUES
(0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1),
(1, '001', 'Simon Peter', 18486000, 1, 2, 'Leader', 500001, 'Bethsaida', '01234567', '', 1551600, NULL, 1507581980, 0, 'uploads/photos/employees/empl1_146x190.jpg', 1),
(2, '002', 'Andrew', -3600, 1, 1, 'First Officer', 0, 'Bethsaida', '0123456789', '', 334274400, NULL, 1458731385, 0, 'uploads/photos/employees/empl2_146x190.jpg', 1),
(3, '003', 'James, Son of Zebedee', -3600, 1, 2, '', 0, 'Capharnaum', '01234567', '', -3600, NULL, 1457528117, 0, 'uploads/photos/employees/empl3_146x190.jpg', 1),
(4, '004', 'John, Son of Zebedee', -3600, 1, 2, '', 0, 'Capharnaum', '0123456', '', NULL, NULL, 1457440368, 0, 'uploads/photos/employees/empl4_146x190.jpg', 1),
(5, '005', 'Philip, the Apostle', 542415600, 1, 1, '', 0, 'Bethsaida', '023153', '', -3600, NULL, 1458033142, 0, 'uploads/photos/employees/empl5_146x190.jpg', 1),
(6, '006', 'Bartholomew', NULL, 1, 1, '', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 'uploads/photos/employees/empl6_146x190.jpg', 1),
(7, '007', 'Thomas', -3600, 1, 2, '', 0, 'Jerusalem', '0123456', '', -3600, NULL, 1458034571, 0, NULL, 1),
(8, '008', 'Matthew', -3600, 1, 2, '', 0, 'Galilea', '0123456', '', NULL, NULL, 1457440519, 0, NULL, 1),
(9, '009', 'James the Younger', NULL, 1, 1, '', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1),
(10, '010', 'Judas Thaddaeus', -3600, 1, 2, '', 0, 'Capharnaum', '0123456', '', -3600, NULL, 1465480451, 0, NULL, 1),
(11, '011', 'Simon, the Zealot', -3600, 1, 1, '', 0, 'Canan', '0123456', '', -3600, NULL, 1458033133, 0, NULL, 1),
(12, '012', 'Judas Iscariot', -3600, 1, 3, 'Treasurer', 30, 'Nazareth', '0416468416', '', 537577200, 1410213600, 1458731879, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `emplsex`
--

CREATE TABLE `emplsex` (
  `emplsex_id` int(11) NOT NULL,
  `emplsex_name` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `emplsex`
--

INSERT INTO `emplsex` (`emplsex_id`, `emplsex_name`) VALUES
(0, NULL),
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `expenses`
--

CREATE TABLE `expenses` (
  `exp_id` int(11) NOT NULL,
  `cust_id` int(6) DEFAULT NULL,
  `exptype_id` int(11) NOT NULL,
  `exp_amount` int(11) NOT NULL,
  `exp_date` int(15) DEFAULT NULL,
  `exp_text` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `exp_recipient` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `exp_receipt` int(11) DEFAULT NULL,
  `exp_voucher` int(11) DEFAULT NULL,
  `exp_created` int(11) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `expenses`
--

INSERT INTO `expenses` (`exp_id`, `cust_id`, `exptype_id`, `exp_amount`, `exp_date`, `exp_text`, `exp_recipient`, `exp_receipt`, `exp_voucher`, `exp_created`, `user_id`) VALUES
(1, NULL, 1, 15000, 1453158000, 'Airtime for Manager', 'Airtel', 0, 201, 1453207875, 2),
(2, NULL, 6, 60000, 1453676400, '2GB data bundle', 'MTN', 70812, 562, 1453213126, 1),
(3, NULL, 4, 50000, 1454281200, 'Power Bill for January', 'UMEME', 21511494, 156, 1454318269, 1),
(4, NULL, 7, 80000, 1459461600, 'Purchase of Charger', 'Millenium Computers 3000', 13561, 531, 1459795825, 1),
(6, 6, 19, 9000, 1467324000, NULL, NULL, NULL, 1011, 1462354956, 1),
(8, NULL, 19, 372222, 1483138800, 'Distributed Interest for 2016', NULL, NULL, NULL, 1507582662, 1),
(9, NULL, 18, 177360, 1483138800, 'Distributed Dividend for 2016', NULL, NULL, NULL, 1507582710, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `exptype`
--

CREATE TABLE `exptype` (
  `exptype_id` int(11) NOT NULL,
  `exptype_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `exptype_short` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `exptype`
--

INSERT INTO `exptype` (`exptype_id`, `exptype_type`, `exptype_short`) VALUES
(1, 'Airtime', 'EXP_AIT'),
(2, 'Bank Charges', 'EXP_BCH'),
(3, 'Committee Welfare', 'EXP_COW'),
(4, 'Electricity', 'EXP_ELC'),
(5, 'Gifts', 'EXP_GFT'),
(6, 'Internet', 'EXP_ITN'),
(7, 'IT', 'EXP_ITC'),
(8, 'Motorcycle', 'EXP_MOT'),
(9, 'Office Space', 'EXP_OFF'),
(10, 'Petty Cash', 'EXP_PCA'),
(11, 'Rent', 'EXP_RNT'),
(12, 'Staff Facilitation', 'EXP_SFC'),
(13, 'Staff Welfare', 'EXP_SWF'),
(14, 'Stationery', 'EXP_STN'),
(15, 'Tax', 'EXP_TAX'),
(16, 'Transport', 'EXP_TRN'),
(17, 'Insurance', 'EXP_INS'),
(18, 'Share Dividend', 'EXP_SHD'),
(19, 'Savings Interest', 'EXP_INT');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fees`
--

CREATE TABLE `fees` (
  `fee_id` int(11) NOT NULL,
  `fee_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `fee_short` varchar(8) COLLATE utf8_bin NOT NULL,
  `fee_value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `fees`
--

INSERT INTO `fees` (`fee_id`, `fee_name`, `fee_short`, `fee_value`) VALUES
(1, 'Entrance Fee', 'FEE_ENT', 10000),
(2, 'Withdrawal Fee', 'FEE_WDL', 1000),
(3, 'Stationery Sales', 'FEE_STS', 3000),
(4, 'Anual Subscription', 'FEE_ASB', 5000),
(5, 'Loan Fee', 'FEE_LOF', 1.25),
(6, 'Loan Application Fee', 'FEE_LAP', 10000),
(7, 'Loan Default Fine', 'FEE_LDF', 15000),
(8, 'Loan Interest Rate', 'FEE_LIR', 2),
(9, 'Loan Insurance', 'FEE_INS', 1.5),
(10, 'Loan Stationary', 'FEE_XL1', 1000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `incomes`
--

CREATE TABLE `incomes` (
  `inc_id` int(11) NOT NULL,
  `inctype_id` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `ltrans_id` int(11) DEFAULT NULL,
  `sav_id` int(11) DEFAULT NULL,
  `inc_amount` int(11) NOT NULL,
  `inc_date` int(15) NOT NULL,
  `inc_receipt` int(11) NOT NULL,
  `inc_text` varchar(200) COLLATE utf8_bin NOT NULL,
  `inc_created` int(11) NOT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `incomes`
--

INSERT INTO `incomes` (`inc_id`, `inctype_id`, `cust_id`, `loan_id`, `ltrans_id`, `sav_id`, `inc_amount`, `inc_date`, `inc_receipt`, `inc_text`, `inc_created`, `user_id`) VALUES
(1, 7, 1, NULL, NULL, NULL, 10000, 1452812400, 1483, '', 1453118784, 1),
(2, 3, 1, NULL, NULL, NULL, 6000, 1454108400, 1484, '', 1453118805, 1),
(3, 2, 1, NULL, NULL, NULL, 1000, 1453158000, 1281, '', 1453207255, 2),
(4, 9, 90, NULL, NULL, NULL, 18000, 1453244400, 180, '', 1453208404, 1),
(5, 2, 100, NULL, NULL, NULL, 1000, 1454281200, 5678, '', 1454329440, 1),
(6, 2, 4, NULL, NULL, NULL, 1000, 1423436400, 548, '', 1455024777, 1),
(7, 2, 5, NULL, NULL, NULL, 1000, 1448924400, 659, '', 1455025157, 1),
(8, 2, 12, NULL, NULL, NULL, 1000, 1435615200, 884, '', 1455025453, 1),
(9, 7, 5, NULL, NULL, NULL, 10000, 1454194800, 8501, '', 1456487835, 1),
(10, 7, 20, 5, NULL, NULL, 10000, 1454540400, 18, '', 1456491502, 1),
(11, 3, 5, 4, NULL, NULL, 8000, 1456268400, 1712, '', 1456491634, 1),
(12, 2, 4, NULL, NULL, 429, 1000, 1456527600, 151, '', 1456576375, 1),
(13, 2, 1, NULL, NULL, 447, 1000, 1456959600, 1236, '', 1457081678, 1),
(14, 2, 15, NULL, NULL, 450, 1000, 1457046000, 1563, '', 1457081766, 1),
(15, 7, 65, 6, NULL, NULL, 10000, 1460325600, 551, '', 1460388152, 1),
(16, 7, 17, 7, NULL, NULL, 10000, 1460412000, 546, '', 1460473151, 1),
(17, 7, 17, 8, NULL, NULL, 10000, 1460412000, 4664, '', 1460473263, 1),
(18, 3, 17, 8, NULL, NULL, 5600, 1460412000, 123, '', 1460479717, 1),
(19, 3, 17, 8, NULL, NULL, 5600, 1460412000, 646894, '', 1460480288, 1),
(20, 3, 17, 8, NULL, NULL, 5600, 1460412000, 684698, '', 1460480655, 1),
(21, 3, 17, 8, NULL, NULL, 5600, 1460412000, 6468, '', 1460480758, 1),
(22, 3, 17, 8, NULL, NULL, 5600, 1460412000, 6464, '', 1460481112, 1),
(23, 3, 17, 8, NULL, NULL, 5600, 1460412000, 6846, '', 1460481451, 1),
(26, 4, 5, NULL, 23, NULL, 24000, 1460498400, 216, '', 1460535050, 1),
(27, 3, 5, 4, NULL, NULL, 8000, 1460498400, 6464, '', 1460538480, 1),
(28, 3, 5, 4, NULL, NULL, 8000, 1460498400, 646, '', 1460538562, 1),
(29, 4, 5, NULL, 175, NULL, 21000, 1460498400, 555, '', 1460538723, 1),
(30, 4, 5, NULL, 176, NULL, 20130, 1460498400, 983, '', 1460539057, 1),
(31, 4, 5, NULL, 177, NULL, 21064, 1460498400, 123, '', 1460539231, 1),
(32, 4, 5, NULL, 178, NULL, 21544, 1460498400, 313, '', 1460539403, 1),
(33, 3, 5, 4, NULL, NULL, 8000, 1460498400, 646, '', 1460539725, 1),
(34, 4, 5, NULL, 185, NULL, 21000, 1460498400, 1689, '', 1460539919, 1),
(35, 3, 20, 5, NULL, NULL, 8000, 1460498400, 4711, '', 1460542720, 1),
(36, 10, 20, 5, NULL, NULL, 12000, 1460498400, 4711, '', 1460542720, 1),
(37, 4, 20, NULL, 195, NULL, 16000, 1460498400, 1234, '', 1460546121, 1),
(38, 4, 20, NULL, 196, NULL, 13720, 1460498400, 56, '', 1460546308, 1),
(39, 4, 20, NULL, 197, NULL, 12414, 1460498400, 1010, '', 1460546608, 1),
(40, 4, 20, NULL, 198, NULL, 12117, 1460498400, 5050, '', 1460546628, 1),
(41, 3, 20, 5, NULL, NULL, 7500, 1460498400, 65456, '', 1460547162, 1),
(42, 10, 20, 5, NULL, NULL, 11250, 1460498400, 65456, '', 1460547162, 1),
(44, 4, 20, NULL, 201, NULL, 15000, 1460498400, 999, '', 1460547290, 1),
(45, 4, 20, NULL, 202, NULL, 13300, 1460498400, 888, '', 1460547333, 1),
(46, 4, 20, NULL, 203, NULL, 11566, 1460498400, 1010, '', 1460547431, 1),
(47, 4, 20, NULL, 204, NULL, 8700, 1460498400, 180, '', 1460547469, 1),
(49, 4, 20, NULL, 205, NULL, 5274, 1460498400, 15, '', 1460547566, 1),
(52, 7, 50, 9, NULL, NULL, 10000, 1461103200, 9876, '', 1460549998, 1),
(53, 3, 50, 9, NULL, NULL, 9000, 1461708000, 6556, '', 1460550055, 1),
(54, 10, 50, 9, NULL, NULL, 13500, 1461708000, 6556, '', 1460550055, 1),
(55, 7, 40, 10, NULL, NULL, 10000, 1462053600, 991, '', 1460550227, 1),
(56, 7, 40, 11, NULL, NULL, 10000, 1462140000, 8486, '', 1460550300, 1),
(57, 7, 35, 12, NULL, NULL, 10000, 1464645600, 153136, '', 1460550528, 1),
(58, 7, 19, 13, NULL, NULL, 10000, 1460498400, 4456, '', 1460550633, 1),
(59, 3, 19, 13, NULL, NULL, 25000, 1461967200, 654156, '', 1460550649, 1),
(60, 10, 19, 13, NULL, NULL, 37500, 1461967200, 654156, '', 1460550649, 1),
(61, 7, 60, 14, NULL, NULL, 10000, 1464732000, 1712, '', 1460557716, 1),
(62, 7, 49, 15, NULL, NULL, 10000, 1461967200, 565, '', 1460557834, 1),
(63, 3, 49, 15, NULL, NULL, 76000, 1461967200, 4646, '', 1460558655, 1),
(64, 10, 49, 15, NULL, NULL, 114000, 1461967200, 4646, '', 1460558655, 1),
(65, 11, 49, 15, NULL, NULL, 8000, 1461967200, 4646, '', 1460558655, 1),
(66, 7, 45, 16, NULL, NULL, 10000, 1467151200, 514641, '', 1460558956, 1),
(67, 3, 45, 16, NULL, NULL, 90000, 1467410400, 654654, '', 1460558992, 1),
(68, 10, 45, 16, NULL, NULL, 135000, 1467410400, 654654, '', 1460558992, 1),
(69, 7, 75, 17, NULL, NULL, 10000, 1460757600, 564, '', 1460789883, 1),
(70, 3, 75, 17, NULL, NULL, 50000, 1461448800, 2344, '', 1460790080, 1),
(71, 10, 75, 17, NULL, NULL, 75000, 1461448800, 2344, '', 1460790080, 1),
(72, 11, 75, 17, NULL, NULL, 5000, 1461448800, 2344, '', 1460790080, 1),
(73, 4, 75, NULL, 253, NULL, 150000, 1464127200, 123, '', 1460790208, 1),
(74, 4, 75, NULL, 254, NULL, 130500, 1465336800, 999, '', 1460790288, 1),
(75, 8, 12, NULL, NULL, 0, 5000, 1469138400, 999, '', 1469178552, 1),
(76, 8, 14, NULL, NULL, 0, 5000, 1469138400, 888, '', 1469178616, 1),
(80, 8, 4, NULL, NULL, 469, 5000, 1507500000, 4711, '', 1507577418, 1),
(85, 9, 17, 0, NULL, NULL, 54800, 1507500000, 4545, 'IT Sales', 1507582608, 1),
(86, 2, 4, NULL, NULL, 632, 1000, 1507586400, 13, '', 1507627793, 1),
(88, 4, 1, NULL, 7, NULL, 15000, 1459461600, 78978, '', 1507628706, 1),
(89, 4, 1, NULL, 8, NULL, 15000, 1463263200, 123123, '', 1507628767, 1),
(92, 7, 10, 18, NULL, NULL, 10000, 1507586400, 560, '', 1507629416, 1),
(93, 3, 10, 18, NULL, NULL, 10000, 1507672800, 800000, '', 1507629498, 1),
(94, 10, 10, 18, NULL, NULL, 12000, 1507672800, 800000, '', 1507629498, 1),
(95, 11, 10, 18, NULL, NULL, 1000, 1507672800, 800000, '', 1507629498, 1),
(96, 8, 50, NULL, NULL, 0, 5000, 1507672800, 8456, '', 1507732097, 1),
(97, 4, 50, NULL, 207, NULL, 27000, 1507672800, 13546, '', 1507732124, 1),
(104, 2, 50, NULL, NULL, 645, 1000, 1507672800, 64, '', 1507736231, 1),
(106, 2, 20, NULL, NULL, 647, 1000, 1507672800, 48, '', 1507740340, 1),
(107, 2, 20, NULL, NULL, 648, 1000, 1507672800, 646, '', 1507740366, 1),
(108, 8, 20, NULL, NULL, 650, 5000, 1507672800, 849, '', 1507740441, 1),
(109, 8, 30, NULL, NULL, 653, 5000, 1507672800, 979, '', 1507740564, 1),
(110, 4, 50, NULL, 208, NULL, 20000, 1507672800, 21, '', 1507740798, 1),
(111, 5, 50, NULL, 209, 655, 5000, 1507672800, 84648, '', 1507740867, 0),
(112, 5, 50, NULL, 210, 656, 15000, 1507672800, 45646, '', 1507748327, 0),
(113, 8, 10, NULL, NULL, 657, 5000, 1508104800, 458, '', 1508149777, 1),
(114, 8, 15, NULL, NULL, 658, 5000, 1508104800, 846, '', 1508150086, 1),
(115, 7, 15, 19, NULL, NULL, 10000, 1508104800, 123, '', 1508150253, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `inctype`
--

CREATE TABLE `inctype` (
  `inctype_id` int(11) NOT NULL,
  `inctype_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `inctype_short` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `inctype`
--

INSERT INTO `inctype` (`inctype_id`, `inctype_type`, `inctype_short`) VALUES
(1, 'Entrance Fee', 'INC_ENF'),
(2, 'Withdrawal Fee', 'INC_WDF'),
(3, 'Loan Fee', 'INC_LOF'),
(4, 'Loan Interest', 'INC_INT'),
(5, 'Loan Default Fine', 'INC_LDF'),
(6, 'Stationery Sales', 'INC_STS'),
(7, 'Loan Application Fee', 'INC_LAF'),
(8, 'Subscription Fee', 'INC_SUF'),
(9, 'Other', 'INC_OTH'),
(10, 'Insurance', 'INC_INS'),
(11, 'Loan Stationary', 'INC_XL1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `loanstatus_id` int(11) NOT NULL,
  `loan_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `loan_date` int(15) NOT NULL,
  `loan_dateout` int(11) NOT NULL,
  `loan_issued` int(2) NOT NULL,
  `loan_principal` int(11) NOT NULL,
  `loan_principalapproved` int(11) NOT NULL,
  `loan_interest` float NOT NULL,
  `loan_appfee_receipt` int(11) NOT NULL,
  `loan_fee` int(11) NOT NULL,
  `loan_fee_receipt` int(11) NOT NULL,
  `loan_insurance` int(11) NOT NULL,
  `loan_insurance_receipt` int(11) NOT NULL,
  `loan_rate` decimal(11,0) NOT NULL,
  `loan_period` int(11) NOT NULL,
  `loan_repaytotal` int(11) NOT NULL,
  `loan_purpose` varchar(250) COLLATE utf8_bin NOT NULL,
  `loan_guarant1` int(11) NOT NULL,
  `loan_guarant2` int(11) NOT NULL,
  `loan_guarant3` int(11) NOT NULL,
  `loan_feepaid` int(1) NOT NULL DEFAULT '0',
  `loan_created` int(15) DEFAULT NULL,
  `loan_xtra1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `loan_xtraFee1` int(11) DEFAULT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `loans`
--

INSERT INTO `loans` (`loan_id`, `cust_id`, `loanstatus_id`, `loan_no`, `loan_date`, `loan_dateout`, `loan_issued`, `loan_principal`, `loan_principalapproved`, `loan_interest`, `loan_appfee_receipt`, `loan_fee`, `loan_fee_receipt`, `loan_insurance`, `loan_insurance_receipt`, `loan_rate`, `loan_period`, `loan_repaytotal`, `loan_purpose`, `loan_guarant1`, `loan_guarant2`, `loan_guarant3`, `loan_feepaid`, `loan_created`, `loan_xtra1`, `loan_xtraFee1`, `user_id`) VALUES
(1, 100, 2, 'L-100/2007-1', 1439935200, 1439935200, 1, 850000, 0, 2.5, 1234, 8500, 87874, 0, 0, '162917', 6, 977500, 'To buy land plot', 1, 2, 3, 0, 1439993579, NULL, NULL, 1),
(2, 1, 4, 'L-001/2016-1', 1452812400, 1454108400, 1, 600000, 600000, 2.5, 1483, 6000, 1484, 0, 0, '65000', 12, 780000, 'Printing Cost', 3, 4, 200, 0, 1453118784, NULL, NULL, 1),
(4, 5, 2, 'L-005/2006-1', 1454194800, 1460498400, 1, 800000, 700000, 3, 8501, 8000, 646, 0, 0, '104000', 10, 1040000, 'Aquisition of a plot', 2, 4, 26, 0, 1456487835, NULL, NULL, 1),
(5, 20, 2, 'L-020/2006-1', 1454540400, 1460498400, 1, 900000, 750000, 2, 18, 7500, 65456, 11250, 65456, '168000', 6, 1008000, 'Business Boost', 63, 120, 11, 0, 1456491502, NULL, NULL, 1),
(6, 65, 1, 'L-065/2007-1', 1460325600, 0, 0, 1250000, 0, 3, 551, 12500, 0, 0, 0, '245500', 6, 1475000, 'Roofing', 75, 22, 37, 0, 1460388152, NULL, NULL, 1),
(8, 17, 2, 'L-017/2006-1', 1460412000, 1460412000, 1, 560000, 400000, 3, 4664, 5600, 6846, 0, 0, '41800', 22, 929600, 'Buying farm land', 58, 31, 100, 0, 1460473263, 'Gertrud', NULL, 1),
(9, 50, 2, 'L-050/2006-1', 1461103200, 1461708000, 1, 1200000, 900000, 3, 9876, 9000, 6556, 13500, 6556, '236000', 6, 1416000, 'Business investment', 1, 2, 3, 0, 1460549998, '', NULL, 1),
(10, 40, 3, 'L-040/2006-1', 1462053600, 0, 0, 1100000, 0, 3, 991, 11000, 0, 16500, 0, '253000', 5, 1265000, 'Chicken feeds', 1, 4, 6, 0, 1460550227, '', NULL, 1),
(11, 40, 1, 'L-040/2006-2', 1462140000, 0, 0, 1100000, 0, 3, 8486, 11000, 0, 16500, 0, '253000', 5, 1265000, 'House building', 1, 4, 9, 0, 1460550300, 'Ernie', NULL, 1),
(12, 35, 3, 'L-035/2006-1', 1464645600, 0, 0, 900000, 0, 3, 153136, 9000, 0, 13500, 0, '327000', 3, 981000, 'Construction work', 15, 41, 79, 0, 1460550528, '', NULL, 1),
(13, 19, 2, 'L-019/2006-1', 1460498400, 1461967200, 1, 3000000, 2500000, 3, 4456, 25000, 654156, 37500, 654156, '340000', 12, 4080000, 'Invest in cattle', 42, 79, 98, 0, 1460550633, 'Johanna', NULL, 1),
(14, 60, 1, 'L-060/2007-1', 1464732000, 0, 0, 600000, 0, 4, 1712, 6000, 0, 9000, 0, '124000', 6, 744000, 'School fees', 22, 40, 59, 0, 1460557716, 'Anabelle Bradham', NULL, 1),
(15, 49, 2, 'L-049/2006-1', 1461967200, 1461967200, 1, 8000000, 7600000, 3, 565, 76000, 4646, 114000, 4646, '907000', 12, 10880000, 'Building', 40, 60, 79, 0, 1460557834, 'Nobbi', 5000, 1),
(16, 45, 2, 'L-045/2006-1', 1467151200, 1467410400, 1, 9000000, 9000000, 4, 514641, 90000, 654654, 135000, 654654, '923000', 16, 14760000, 'Buying plot of land', 60, 62, 40, 0, 1460558956, '', NULL, 1),
(17, 75, 2, 'L-075/1970-1', 1460757600, 1461448800, 1, 8000000, 5000000, 3, 564, 50000, 2344, 75000, 2344, '1573000', 6, 9440000, 'Buying land', 94, 97, 22, 0, 1460789883, '', 5000, 1),
(18, 10, 2, 'L-010/2006-1', 1507586400, 1507672800, 1, 1200000, 800000, 2.5, 560, 10000, 800000, 12000, 800000, '150000', 10, 1500000, 'Land aqcuisition', 98, 20, 5, 0, 1507629416, 'Amada Olevian', 1000, 1),
(19, 15, 1, 'L-015/2006-1', 1508104800, 0, 0, 600000, 0, 2.3, 123, 7500, 0, 9000, 0, '133800', 5, 669000, 'School fees', 95, 66, 23, 0, 1508150253, '', 1000, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loanstatus`
--

CREATE TABLE `loanstatus` (
  `loanstatus_id` int(11) NOT NULL,
  `loanstatus_status` varchar(50) COLLATE utf8_bin NOT NULL,
  `loanstatus_short` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `loanstatus`
--

INSERT INTO `loanstatus` (`loanstatus_id`, `loanstatus_status`, `loanstatus_short`) VALUES
(1, 'Pending', 'LST_PEN'),
(2, 'Approved', 'LST_APP'),
(3, 'Refused', 'LST_REF'),
(4, 'Abandoned', 'LST_ABN'),
(5, 'Cleared', 'LST_CLR');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logrec`
--

CREATE TABLE `logrec` (
  `logrec_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `logrec_start` int(11) DEFAULT NULL,
  `logrec_end` int(11) DEFAULT NULL,
  `logrec_logout` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `logrec`
--

INSERT INTO `logrec` (`logrec_id`, `user_id`, `logrec_start`, `logrec_end`, `logrec_logout`) VALUES
(1, 1, 1458026228, 1459793333, 1),
(2, 1, 1458639083, 1458666852, 1),
(3, 1, 1458666860, 1458670114, 1),
(4, 1, 1458717669, 1458733206, 1),
(5, 1, 1458734461, 1458735254, 1),
(6, 1, 1459001753, 1459001765, 1),
(7, 2, 1459326864, 1459326891, 1),
(8, 1, 1459326903, 1459331867, 1),
(9, 1, 1459784538, 1459791828, 1),
(10, 1, 1459793363, 1459793767, 1),
(11, 1, 1459795734, 1459795996, 1),
(12, 1, 1460204664, 1460205585, 1),
(13, 1, 1460361736, 1460370046, 0),
(14, 1, 1460370046, 1460370260, 1),
(15, 1, 1460386502, 1460471813, 0),
(16, 1, 1460471813, 1460482606, 1),
(17, 1, 1460482632, 1460484435, 1),
(18, 1, 1460484465, 1460484467, 1),
(19, 1, 1460529114, 1460564336, 1),
(20, 1, 1460625771, 1460627784, 1),
(21, 1, 1460629702, 1460630173, 1),
(22, 1, 1460789156, 1461143055, 0),
(23, 1, 1461143055, 1461315675, 0),
(24, 1, 1461315675, 1469179191, 1),
(25, 1, 1469179204, 1469179207, 1),
(26, 1, 1461570119, 1461570773, 1),
(27, 1, 1461844411, 1462345641, 0),
(28, 1, 1462345641, 1462355982, 1),
(29, 1, 1462369592, 1462376237, 0),
(30, 1, 1462376237, 1462377696, 1),
(31, 1, 1462448431, 1507561317, 0),
(32, 1, 1507561317, 1507561368, 0),
(33, 1, 1507561368, 1507561459, 0),
(34, 1, 1507561459, 1507563740, 0),
(35, 1, 1507563740, 1507572001, 0),
(36, 1, 1507572001, 1507572080, 1),
(37, 1, 1507572094, 1507573954, 1),
(38, 3, 1507573968, 1507573976, 1),
(39, 1, 1507573990, 1507581557, 0),
(40, 1, 1507581557, 1507584155, 1),
(41, 1, 1507584622, 1507584662, 1),
(42, 1, 1507627342, 1507630786, 1),
(43, 1, 1507634939, 1507635099, 1),
(44, 1, 1507635487, 1507664454, 0),
(45, 3, 1507661078, 1507661084, 1),
(46, 1, 1507664454, 1507668937, 0),
(47, 1, 1507668937, 1507672482, 1),
(48, 1, 1507672770, 1507672784, 1),
(49, 1, 1507731873, 1507740301, 0),
(50, 1, 1507740301, 1507747087, 0),
(51, 1, 1507747087, 1507748615, 1),
(52, 1, 1507749015, 1507749160, 1),
(53, 1, 1508143696, 1508156672, 0),
(54, 1, 1508156672, 1508159377, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ltrans`
--

CREATE TABLE `ltrans` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `ltrans`
--

INSERT INTO `ltrans` (`ltrans_id`, `loan_id`, `ltrans_due`, `ltrans_date`, `ltrans_principaldue`, `ltrans_principal`, `ltrans_interestdue`, `ltrans_interest`, `ltrans_fined`, `ltrans_receipt`, `ltrans_created`, `user_id`) VALUES
(1, 1, 1456956000, 1458424800, 141665, 118750, 21250, 21250, 0, 1234, 1445421102, 3),
(2, 1, 1459634400, 1461103200, 725000, 78750, 21750, 21250, 0, 5678, 1445421253, 3),
(3, 1, 1462312800, NULL, 141667, NULL, 21250, NULL, 0, NULL, 1445421520, 1),
(4, 1, 1464991200, NULL, 141667, NULL, 21250, NULL, 0, NULL, 1454333347, 1),
(5, 1, 1467669600, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1),
(6, 1, 1470348000, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1),
(7, 2, 1456786800, 1459461600, 50000, 45000, 15000, 15000, 0, 78978, 1507628706, 1),
(8, 2, 1459465200, 1463263200, 50000, 105000, 15000, 15000, 0, 123123, 1507628767, 1),
(9, 2, 1462143600, NULL, 50000, NULL, 15000, NULL, 0, NULL, 1507628940, 1),
(10, 2, 1464822000, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(11, 2, 1467500400, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(12, 2, 1470178800, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(13, 2, 1472857200, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(14, 2, 1475535600, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(15, 2, 1478214000, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(16, 2, 1480892400, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(17, 2, 1483570800, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(18, 2, 1486249200, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(143, 8, 1463090400, NULL, 22000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(144, 8, 1465768800, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(145, 8, 1468447200, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(146, 8, 1471125600, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(147, 8, 1473804000, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(148, 8, 1476482400, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(149, 8, 1479160800, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(150, 8, 1481839200, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(151, 8, 1484517600, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(152, 8, 1487196000, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(153, 8, 1489874400, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(154, 8, 1492552800, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(155, 8, 1495231200, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(156, 8, 1497909600, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(157, 8, 1500588000, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(158, 8, 1503266400, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(159, 8, 1505944800, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(160, 8, 1508623200, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(161, 8, 1511301600, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(162, 8, 1513980000, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(163, 8, 1516658400, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(164, 8, 1519336800, NULL, 18000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(185, 4, 1463176800, 1460498400, 70000, 49000, 21000, 21000, 0, 1689, 1460539919, 1),
(186, 4, 1465855200, NULL, 70000, NULL, 18900, NULL, 0, NULL, NULL, 1),
(187, 4, 1468533600, NULL, 70000, NULL, 16800, NULL, 0, NULL, NULL, 1),
(188, 4, 1471212000, NULL, 70000, NULL, 14700, NULL, 0, NULL, NULL, 1),
(189, 4, 1473890400, NULL, 70000, NULL, 12600, NULL, 0, NULL, NULL, 1),
(190, 4, 1476568800, NULL, 70000, NULL, 10500, NULL, 0, NULL, NULL, 1),
(191, 4, 1479247200, NULL, 70000, NULL, 8400, NULL, 0, NULL, NULL, 1),
(192, 4, 1481925600, NULL, 70000, NULL, 6300, NULL, 0, NULL, NULL, 1),
(193, 4, 1484604000, NULL, 70000, NULL, 4200, NULL, 0, NULL, NULL, 1),
(194, 4, 1487282400, NULL, 70000, NULL, 2100, NULL, 0, NULL, NULL, 1),
(201, 5, 1463176800, 1460498400, 125000, 85000, 15000, 15000, 0, 999, 1460547290, 1),
(202, 5, 1465855200, 1460498400, 133000, 86700, 13300, 13300, 0, 888, 1460547333, 1),
(203, 5, 1468533600, 1460498400, 143300, 143300, 11566, 11566, 0, 1010, 1460547431, 1),
(204, 5, 1471212000, 1460498400, 145000, 171300, 8700, 8700, 0, 180, 1460547469, 1),
(205, 5, 1473890400, 1460498400, 131700, 134726, 5274, 5274, 0, 15, 1460547566, 1),
(206, 5, 1476568800, NULL, 128974, NULL, 2579, NULL, 0, NULL, NULL, 1),
(207, 9, 1464386400, 1507672800, 150000, 193000, 27000, 27000, 0, 13546, 1507732124, 1),
(208, 9, 1467064800, 1507672800, 150000, 0, 22500, 20000, 0, 21, 1507740798, 1),
(209, 9, 1469743200, NULL, 150000, NULL, 18000, NULL, 1, NULL, 1507740867, 1),
(210, 9, 1472421600, NULL, 150000, NULL, 13500, NULL, 1, NULL, 1507748327, 1),
(211, 9, 1475100000, NULL, 150000, NULL, 9000, NULL, 0, NULL, NULL, 1),
(212, 9, 1477778400, NULL, 150000, NULL, 4500, NULL, 0, NULL, NULL, 1),
(213, 13, 1464645600, NULL, 212000, NULL, 75000, NULL, 0, NULL, NULL, 1),
(214, 13, 1467324000, NULL, 208000, NULL, 68640, NULL, 0, NULL, NULL, 1),
(215, 13, 1470002400, NULL, 208000, NULL, 62400, NULL, 0, NULL, NULL, 1),
(216, 13, 1472680800, NULL, 208000, NULL, 56160, NULL, 0, NULL, NULL, 1),
(217, 13, 1475359200, NULL, 208000, NULL, 49920, NULL, 0, NULL, NULL, 1),
(218, 13, 1478037600, NULL, 208000, NULL, 43680, NULL, 0, NULL, NULL, 1),
(219, 13, 1480716000, NULL, 208000, NULL, 37440, NULL, 0, NULL, NULL, 1),
(220, 13, 1483394400, NULL, 208000, NULL, 31200, NULL, 0, NULL, NULL, 1),
(221, 13, 1486072800, NULL, 208000, NULL, 24960, NULL, 0, NULL, NULL, 1),
(222, 13, 1488751200, NULL, 208000, NULL, 18720, NULL, 0, NULL, NULL, 1),
(223, 13, 1491429600, NULL, 208000, NULL, 12480, NULL, 0, NULL, NULL, 1),
(224, 13, 1494108000, NULL, 208000, NULL, 6240, NULL, 0, NULL, NULL, 1),
(225, 15, 1464645600, NULL, 637000, NULL, 228000, NULL, 0, NULL, NULL, 1),
(226, 15, 1467324000, NULL, 633000, NULL, 208890, NULL, 0, NULL, NULL, 1),
(227, 15, 1470002400, NULL, 633000, NULL, 189900, NULL, 0, NULL, NULL, 1),
(228, 15, 1472680800, NULL, 633000, NULL, 170910, NULL, 0, NULL, NULL, 1),
(229, 15, 1475359200, NULL, 633000, NULL, 151920, NULL, 0, NULL, NULL, 1),
(230, 15, 1478037600, NULL, 633000, NULL, 132930, NULL, 0, NULL, NULL, 1),
(231, 15, 1480716000, NULL, 633000, NULL, 113940, NULL, 0, NULL, NULL, 1),
(232, 15, 1483394400, NULL, 633000, NULL, 94950, NULL, 0, NULL, NULL, 1),
(233, 15, 1486072800, NULL, 633000, NULL, 75960, NULL, 0, NULL, NULL, 1),
(234, 15, 1488751200, NULL, 633000, NULL, 56970, NULL, 0, NULL, NULL, 1),
(235, 15, 1491429600, NULL, 633000, NULL, 37980, NULL, 0, NULL, NULL, 1),
(236, 15, 1494108000, NULL, 633000, NULL, 18990, NULL, 0, NULL, NULL, 1),
(237, 16, 1470088800, NULL, 555000, NULL, 360000, NULL, 0, NULL, NULL, 1),
(238, 16, 1472767200, NULL, 563000, NULL, 337800, NULL, 0, NULL, NULL, 1),
(239, 16, 1475445600, NULL, 563000, NULL, 315280, NULL, 0, NULL, NULL, 1),
(240, 16, 1478124000, NULL, 563000, NULL, 292760, NULL, 0, NULL, NULL, 1),
(241, 16, 1480802400, NULL, 563000, NULL, 270240, NULL, 0, NULL, NULL, 1),
(242, 16, 1483480800, NULL, 563000, NULL, 247720, NULL, 0, NULL, NULL, 1),
(243, 16, 1486159200, NULL, 563000, NULL, 225200, NULL, 0, NULL, NULL, 1),
(244, 16, 1488837600, NULL, 563000, NULL, 202680, NULL, 0, NULL, NULL, 1),
(245, 16, 1491516000, NULL, 563000, NULL, 180160, NULL, 0, NULL, NULL, 1),
(246, 16, 1494194400, NULL, 563000, NULL, 157640, NULL, 0, NULL, NULL, 1),
(247, 16, 1496872800, NULL, 563000, NULL, 135120, NULL, 0, NULL, NULL, 1),
(248, 16, 1499551200, NULL, 563000, NULL, 112600, NULL, 0, NULL, NULL, 1),
(249, 16, 1502229600, NULL, 563000, NULL, 90080, NULL, 0, NULL, NULL, 1),
(250, 16, 1504908000, NULL, 563000, NULL, 67560, NULL, 0, NULL, NULL, 1),
(251, 16, 1507586400, NULL, 563000, NULL, 45040, NULL, 0, NULL, NULL, 1),
(252, 16, 1510264800, NULL, 563000, NULL, 22520, NULL, 0, NULL, NULL, 1),
(253, 17, 1464127200, 1464127200, 835000, 650000, 150000, 150000, 0, 123, 1460790208, 1),
(254, 17, 1466805600, 1465336800, 870000, 1069500, 130500, 130500, 0, 999, 1460790288, 1),
(255, 17, 1469484000, NULL, 820500, NULL, 98415, NULL, 0, NULL, NULL, 1),
(256, 17, 1472162400, NULL, 820000, NULL, 73800, NULL, 0, NULL, NULL, 1),
(257, 17, 1474840800, NULL, 820000, NULL, 49200, NULL, 0, NULL, NULL, 1),
(258, 17, 1477519200, NULL, 820000, NULL, 24600, NULL, 0, NULL, NULL, 1),
(259, 18, 1510351200, NULL, 80000, NULL, 20000, NULL, 0, NULL, NULL, 1),
(260, 18, 1513029600, NULL, 80000, NULL, 18000, NULL, 0, NULL, NULL, 1),
(261, 18, 1515708000, NULL, 80000, NULL, 16000, NULL, 0, NULL, NULL, 1),
(262, 18, 1518386400, NULL, 80000, NULL, 14000, NULL, 0, NULL, NULL, 1),
(263, 18, 1521064800, NULL, 80000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(264, 18, 1523743200, NULL, 80000, NULL, 10000, NULL, 0, NULL, NULL, 1),
(265, 18, 1526421600, NULL, 80000, NULL, 8000, NULL, 0, NULL, NULL, 1),
(266, 18, 1529100000, NULL, 80000, NULL, 6000, NULL, 0, NULL, NULL, 1),
(267, 18, 1531778400, NULL, 80000, NULL, 4000, NULL, 0, NULL, NULL, 1),
(268, 18, 1534456800, NULL, 80000, NULL, 2000, NULL, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savbalance`
--

CREATE TABLE `savbalance` (
  `savbal_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `savbal_balance` int(11) NOT NULL,
  `savbal_fixed` int(11) NOT NULL,
  `savbal_date` int(11) NOT NULL,
  `savbal_created` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `savbalance`
--

INSERT INTO `savbalance` (`savbal_id`, `cust_id`, `savbal_balance`, `savbal_fixed`, `savbal_date`, `savbal_created`, `user_id`) VALUES
(1, 1, 27850, 0, 1459329125, 1459329125, 1),
(2, 2, 198088, 0, 1459329125, 1459329125, 1),
(3, 3, 19200, 0, 1459329125, 1459329125, 1),
(4, 4, 157000, 0, 1459329125, 1459329125, 1),
(5, 5, 305943, 0, 1459329125, 1459329125, 1),
(6, 6, 182192, 0, 1459329125, 1459329125, 1),
(7, 7, 123018, 0, 1459329125, 1459329125, 1),
(8, 8, 95876, 0, 1459329125, 1459329125, 1),
(9, 9, 106000, 0, 1459329125, 1459329125, 1),
(10, 10, 31555, 0, 1459329125, 1459329125, 1),
(11, 11, 5276, 0, 1459329125, 1459329125, 1),
(12, 12, 11200, 0, 1459329125, 1459329125, 1),
(13, 13, 379700, 0, 1459329125, 1459329125, 1),
(14, 14, 0, 0, 1459329125, 1459329125, 1),
(15, 15, 82370, 0, 1459329125, 1459329125, 1),
(16, 16, 32330, 0, 1459329125, 1459329125, 1),
(17, 17, 1000, 0, 1459329125, 1459329125, 1),
(18, 18, 24033, 0, 1459329125, 1459329125, 1),
(19, 19, 76480, 0, 1459329125, 1459329125, 1),
(20, 20, 9000, 9000, 1459329125, 1459329125, 1),
(21, 21, 151166, 0, 1459329125, 1459329125, 1),
(22, 22, 18524, 0, 1459329125, 1459329125, 1),
(23, 23, 103000, 0, 1459329125, 1459329125, 1),
(24, 24, 1000, 0, 1459329125, 1459329125, 1),
(25, 25, 36200, 0, 1459329125, 1459329125, 1),
(26, 26, 66750, 0, 1459329125, 1459329125, 1),
(27, 27, 7202, 0, 1459329125, 1459329125, 1),
(28, 28, 3224, 0, 1459329125, 1459329125, 1),
(29, 29, 40720, 0, 1459329125, 1459329125, 1),
(30, 30, 20000, 20000, 1459329125, 1459329125, 1),
(31, 31, 0, 0, 1459329125, 1459329125, 1),
(32, 32, 9040, 0, 1459329125, 1459329125, 1),
(33, 33, 67608, 0, 1459329125, 1459329125, 1),
(34, 34, 1000, 0, 1459329125, 1459329125, 1),
(35, 35, 21400, 0, 1459329125, 1459329125, 1),
(36, 36, 103796, 0, 1459329125, 1459329125, 1),
(37, 37, 1531000, 0, 1459329125, 1459329125, 1),
(38, 38, 6080, 0, 1459329125, 1459329125, 1),
(39, 39, 300472, 0, 1459329125, 1459329125, 1),
(40, 40, 5000, 0, 1459329125, 1459329125, 1),
(41, 41, 5080, 0, 1459329125, 1459329125, 1),
(42, 42, 13424, 0, 1459329125, 1459329125, 1),
(43, 43, 94636, 0, 1459329125, 1459329125, 1),
(44, 44, 0, 0, 1459329125, 1459329125, 1),
(45, 45, 103980, 0, 1459329125, 1459329125, 1),
(46, 46, 22400, 0, 1459329125, 1459329125, 1),
(47, 47, 1000, 0, 1459329125, 1459329125, 1),
(48, 48, 1000, 0, 1459329125, 1459329125, 1),
(49, 49, 29500, 0, 1459329125, 1459329125, 1),
(50, 50, 87000, 100000, 1459329125, 1459329125, 1),
(51, 51, 87700, 0, 1459329125, 1459329125, 1),
(52, 52, 273668, 0, 1459329125, 1459329125, 1),
(53, 53, 20400, 0, 1459329125, 1459329125, 1),
(54, 54, 1000, 0, 1459329125, 1459329125, 1),
(55, 55, 29316, 0, 1459329125, 1459329125, 1),
(56, 56, 3070, 0, 1459329125, 1459329125, 1),
(57, 57, 0, 0, 1459329125, 1459329125, 1),
(58, 58, 33212, 0, 1459329125, 1459329125, 1),
(59, 59, 93616, 0, 1459329125, 1459329125, 1),
(60, 60, 10242800, 0, 1459329125, 1459329125, 1),
(61, 61, 368914, 0, 1459329125, 1459329125, 1),
(62, 62, 170218, 0, 1459329125, 1459329125, 1),
(63, 63, 29050, 0, 1459329125, 1459329125, 1),
(64, 64, 12730, 0, 1459329125, 1459329125, 1),
(65, 65, 12628, 0, 1459329125, 1459329125, 1),
(66, 66, 145228, 0, 1459329125, 1459329125, 1),
(67, 67, 78263, 0, 1459329125, 1459329125, 1),
(68, 68, 84028, 0, 1459329125, 1459329125, 1),
(69, 69, 2428, 0, 1459329125, 1459329125, 1),
(70, 70, 0, 0, 1459329125, 1459329125, 1),
(71, 71, 0, 0, 1459329125, 1459329125, 1),
(72, 72, 81650, 0, 1459329125, 1459329125, 1),
(73, 73, 1000, 0, 1459329125, 1459329125, 1),
(74, 74, 26500, 0, 1459329125, 1459329125, 1),
(75, 75, 0, 0, 1459329125, 1459329125, 1),
(76, 76, 1612, 0, 1459329125, 1459329125, 1),
(77, 77, 482420, 0, 1459329125, 1459329125, 1),
(78, 78, 177380, 0, 1459329125, 1459329125, 1),
(79, 79, 62200, 0, 1459329125, 1459329125, 1),
(80, 80, 81580, 0, 1459329125, 1459329125, 1),
(81, 81, 11404, 0, 1459329125, 1459329125, 1),
(82, 82, 0, 0, 1459329125, 1459329125, 1),
(83, 83, 1000, 0, 1459329125, 1459329125, 1),
(84, 84, 53020, 0, 1459329125, 1459329125, 1),
(85, 85, 53020, 0, 1459329125, 1459329125, 1),
(86, 86, 205286, 0, 1459329125, 1459329125, 1),
(87, 87, 1000, 0, 1459329125, 1459329125, 1),
(88, 88, 0, 0, 1459329125, 1459329125, 1),
(89, 89, 103000, 0, 1459329125, 1459329125, 1),
(90, 90, 4000, 0, 1459329125, 1459329125, 1),
(91, 91, 103874, 0, 1459329125, 1459329125, 1),
(92, 92, 385500, 0, 1459329125, 1459329125, 1),
(93, 93, 11200, 0, 1459329125, 1459329125, 1),
(94, 94, 409000, 0, 1459329125, 1459329125, 1),
(95, 95, 91802, 0, 1459329125, 1459329125, 1),
(96, 96, 2188, 0, 1459329125, 1459329125, 1),
(97, 97, 386356, 0, 1459329125, 1459329125, 1),
(98, 98, 29560, 0, 1459329125, 1459329125, 1),
(99, 99, 2063, 0, 1459329125, 1459329125, 1),
(100, 100, 52782, 0, 1459329125, 1459329125, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savings`
--

CREATE TABLE `savings` (
  `sav_id` int(11) NOT NULL,
  `savtype_id` int(11) NOT NULL,
  `sav_mother` int(11) DEFAULT NULL,
  `cust_id` int(11) NOT NULL,
  `ltrans_id` int(11) DEFAULT NULL,
  `sav_date` int(15) NOT NULL,
  `sav_amount` int(15) NOT NULL DEFAULT '0',
  `sav_receipt` int(11) DEFAULT NULL,
  `sav_slip` int(10) NOT NULL,
  `sav_payer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sav_fixed` int(11) DEFAULT NULL,
  `sav_created` int(15) DEFAULT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `savings`
--

INSERT INTO `savings` (`sav_id`, `savtype_id`, `sav_mother`, `cust_id`, `ltrans_id`, `sav_date`, `sav_amount`, `sav_receipt`, `sav_slip`, `sav_payer`, `sav_fixed`, `sav_created`, `user_id`) VALUES
(1, 1, NULL, 1, NULL, 1420070400, 30000, 610, 0, NULL, NULL, NULL, 1),
(2, 1, NULL, 2, NULL, 1420070400, 190400, 0, 0, NULL, NULL, NULL, 1),
(3, 1, NULL, 3, NULL, 1420070400, 4000, 0, 0, NULL, NULL, NULL, 1),
(4, 1, NULL, 4, NULL, 1420070400, 123183, 0, 0, NULL, NULL, NULL, 1),
(5, 1, NULL, 5, NULL, 1420070400, 25700, 0, 0, NULL, NULL, NULL, 1),
(6, 1, NULL, 6, NULL, 1420070400, 25700, 0, 0, NULL, NULL, NULL, 1),
(7, 1, NULL, 7, NULL, 1420070400, 105900, 0, 0, NULL, NULL, NULL, 1),
(8, 1, NULL, 8, NULL, 1420070400, 98000, 0, 0, NULL, NULL, NULL, 1),
(9, 1, NULL, 9, NULL, 1420070400, 550000, 0, 0, NULL, NULL, NULL, 1),
(10, 1, NULL, 10, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(11, 1, NULL, 11, NULL, 1420070400, 5276, 0, 0, NULL, NULL, NULL, 1),
(12, 1, NULL, 12, NULL, 1420070400, 20000, 0, 0, NULL, NULL, NULL, 1),
(13, 1, NULL, 13, NULL, 1420070400, 379700, 0, 0, NULL, NULL, NULL, 1),
(14, 1, NULL, 14, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(16, 1, NULL, 16, NULL, 1420070400, 30000, 0, 0, NULL, NULL, NULL, 1),
(17, 1, NULL, 17, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(18, 1, NULL, 18, NULL, 1420070400, 24033, 0, 0, NULL, NULL, NULL, 1),
(19, 1, NULL, 19, NULL, 1420070400, 74000, 0, 0, NULL, NULL, NULL, 1),
(20, 1, NULL, 20, NULL, 1420070400, 26500, 0, 0, NULL, NULL, NULL, 1),
(21, 1, NULL, 21, NULL, 1420070400, 143300, 0, 0, NULL, NULL, NULL, 1),
(22, 1, NULL, 22, NULL, 1420070400, 16200, 0, 0, NULL, NULL, NULL, 1),
(23, 1, NULL, 23, NULL, 1420070400, 100000, 0, 0, NULL, NULL, NULL, 1),
(24, 1, NULL, 24, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(25, 1, NULL, 25, NULL, 1420070400, 10200, 0, 0, NULL, NULL, NULL, 1),
(26, 1, NULL, 26, NULL, 1420070400, 62500, 0, 0, NULL, NULL, NULL, 1),
(27, 1, NULL, 27, NULL, 1420070400, 5100, 0, 0, NULL, NULL, NULL, 1),
(28, 1, NULL, 28, NULL, 1420070400, 1200, 0, 0, NULL, NULL, NULL, 1),
(29, 1, NULL, 29, NULL, 1420070400, 36000, 0, 0, NULL, NULL, NULL, 1),
(30, 1, NULL, 30, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(31, 1, NULL, 31, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(32, 1, NULL, 32, NULL, 1420070400, 2000, 0, 0, NULL, NULL, NULL, 1),
(33, 1, NULL, 33, NULL, 1420070400, 65302, 0, 0, NULL, NULL, NULL, 1),
(34, 1, NULL, 34, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(35, 1, NULL, 35, NULL, 1420070400, 20000, 0, 0, NULL, NULL, NULL, 1),
(36, 1, NULL, 36, NULL, 1420070400, 99800, 0, 0, NULL, NULL, NULL, 1),
(37, 1, NULL, 37, NULL, 1420070400, 1500000, 0, 0, NULL, NULL, NULL, 1),
(38, 1, NULL, 38, NULL, 1420070400, 4000, 0, 0, NULL, NULL, NULL, 1),
(39, 1, NULL, 39, NULL, 1420070400, 293600, 0, 0, NULL, NULL, NULL, 1),
(40, 1, NULL, 40, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(41, 1, NULL, 41, NULL, 1420070400, 4000, 0, 0, NULL, NULL, NULL, 1),
(42, 1, NULL, 42, NULL, 1420070400, 11200, 0, 0, NULL, NULL, NULL, 1),
(43, 1, NULL, 43, NULL, 1420070400, 91800, 0, 0, NULL, NULL, NULL, 1),
(44, 1, NULL, 44, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(45, 1, NULL, 45, NULL, 1420070400, 90800, 0, 0, NULL, NULL, NULL, 1),
(46, 1, NULL, 46, NULL, 1420070400, 20000, 0, 0, NULL, NULL, NULL, 1),
(47, 1, NULL, 47, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(48, 1, NULL, 48, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(49, 1, NULL, 49, NULL, 1420070400, 25000, 0, 0, NULL, NULL, NULL, 1),
(51, 1, NULL, 51, NULL, 1420070400, 85000, 0, 0, NULL, NULL, NULL, 1),
(52, 1, NULL, 52, NULL, 1420070400, 263400, 0, 0, NULL, NULL, NULL, 1),
(53, 1, NULL, 53, NULL, 1420070400, 20000, 0, 0, NULL, NULL, NULL, 1),
(54, 1, NULL, 54, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(55, 1, NULL, 55, NULL, 1420070400, 25800, 0, 0, NULL, NULL, NULL, 1),
(56, 1, NULL, 56, NULL, 1420070400, 2029, 0, 0, NULL, NULL, NULL, 1),
(57, 1, NULL, 57, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(58, 1, NULL, 58, NULL, 1420070400, 30600, 0, 0, NULL, NULL, NULL, 1),
(59, 1, NULL, 59, NULL, 1420070400, 90800, 0, 0, NULL, NULL, NULL, 1),
(60, 1, NULL, 60, NULL, 1420070400, 10040000, 0, 0, NULL, NULL, NULL, 1),
(61, 1, NULL, 61, NULL, 1420070400, 360700, 0, 0, NULL, NULL, NULL, 1),
(62, 1, NULL, 62, NULL, 1420070400, 165900, 0, 0, NULL, NULL, NULL, 1),
(63, 1, NULL, 63, NULL, 1420070400, 27500, 0, 0, NULL, NULL, NULL, 1),
(64, 1, NULL, 64, NULL, 1420070400, 11500, 0, 0, NULL, NULL, NULL, 1),
(65, 1, NULL, 65, NULL, 1420070400, 11400, 0, 0, NULL, NULL, NULL, 1),
(66, 1, NULL, 66, NULL, 1420070400, 141400, 0, 0, NULL, NULL, NULL, 1),
(67, 1, NULL, 68, NULL, 1420070400, 81400, 0, 0, NULL, NULL, NULL, 1),
(68, 1, NULL, 69, NULL, 1420070400, 1400, 0, 0, NULL, NULL, NULL, 1),
(69, 1, NULL, 70, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(70, 1, NULL, 71, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(71, 1, NULL, 72, NULL, 1420070400, 80000, 0, 0, NULL, NULL, NULL, 1),
(72, 1, NULL, 73, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(73, 1, NULL, 74, NULL, 1420070400, 25000, 0, 0, NULL, NULL, NULL, 1),
(74, 1, NULL, 75, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(75, 1, NULL, 76, NULL, 1420070400, 600, 0, 0, NULL, NULL, NULL, 1),
(76, 1, NULL, 77, NULL, 1420070400, 471000, 0, 0, NULL, NULL, NULL, 1),
(77, 1, NULL, 78, NULL, 1420070400, 169000, 0, 0, NULL, NULL, NULL, 1),
(78, 1, NULL, 79, NULL, 1420070400, 60000, 0, 0, NULL, NULL, NULL, 1),
(79, 1, NULL, 80, NULL, 1420070400, 79000, 0, 0, NULL, NULL, NULL, 1),
(80, 1, NULL, 81, NULL, 1420070400, 10200, 0, 0, NULL, NULL, NULL, 1),
(81, 1, NULL, 82, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(82, 1, NULL, 83, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(83, 1, NULL, 84, NULL, 1420070400, 51000, 0, 0, NULL, NULL, NULL, 1),
(84, 1, NULL, 85, NULL, 1420070400, 51000, 0, 0, NULL, NULL, NULL, 1),
(85, 1, NULL, 86, NULL, 1420070400, 199300, 0, 0, NULL, NULL, NULL, 1),
(86, 1, NULL, 87, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(87, 1, NULL, 88, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(88, 1, NULL, 89, NULL, 1420070400, 100000, 0, 0, NULL, NULL, NULL, 1),
(89, 1, NULL, 90, NULL, 1420070400, 0, 0, 0, NULL, NULL, NULL, 1),
(90, 1, NULL, 91, NULL, 1420070400, 99876, 0, 0, NULL, NULL, NULL, 1),
(91, 1, NULL, 92, NULL, 1420070400, 375000, 0, 0, NULL, NULL, NULL, 1),
(92, 1, NULL, 93, NULL, 1420070400, 10000, 0, 0, NULL, NULL, NULL, 1),
(93, 1, NULL, 94, NULL, 1420070400, 400000, 0, 0, NULL, NULL, NULL, 1),
(94, 1, NULL, 95, NULL, 1420070400, 86080, 0, 0, NULL, NULL, NULL, 1),
(95, 1, NULL, 96, NULL, 1420070400, 184, 0, 0, NULL, NULL, NULL, 1),
(96, 1, NULL, 97, NULL, 1420070400, 377800, 0, 0, NULL, NULL, NULL, 1),
(97, 1, NULL, 98, NULL, 1420070400, 28000, 0, 0, NULL, NULL, NULL, 1),
(98, 1, NULL, 99, NULL, 1420070400, 62, 0, 0, NULL, NULL, NULL, 1),
(99, 1, NULL, 100, NULL, 1420070400, 550000, 0, 0, NULL, NULL, NULL, 1),
(200, 2, NULL, 9, NULL, 1423602000, -450000, 682, 0, NULL, NULL, NULL, 1),
(201, 1, NULL, 1, NULL, 1435183200, 25000, 509, 0, NULL, NULL, 1453118311, 1),
(202, 2, NULL, 1, NULL, 1453158000, -26000, 1281, 603, NULL, NULL, 1453207255, 2),
(203, 4, NULL, 1, NULL, 1453158000, -1000, 1281, 603, NULL, NULL, 1453207255, 2),
(204, 2, NULL, 1, NULL, 1453762800, -8000, 5678, 1234, NULL, NULL, 1453793443, 1),
(205, 4, NULL, 1, NULL, 1453762800, -1000, 5678, 1234, NULL, NULL, 1453793443, 1),
(206, 1, NULL, 3, NULL, 1469484000, 14000, 7, 0, NULL, NULL, 1453795583, 1),
(207, 2, NULL, 100, NULL, 1454281200, -500000, 5678, 1234, NULL, NULL, 1454329440, 1),
(208, 4, NULL, 100, NULL, 1454281200, -1000, 5678, 1234, NULL, NULL, 1454329440, 1),
(210, 1, NULL, 45, NULL, 1454972400, 465, 9200, 0, NULL, NULL, 1455010623, 1),
(211, 1, NULL, 45, NULL, 1454972400, 8000, 845, 0, NULL, NULL, 1455010641, 1),
(212, 1, NULL, 45, NULL, 1454972400, 735, 4564, 0, NULL, NULL, 1455010657, 1),
(214, 2, NULL, 4, NULL, 1423436400, -82183, 548, 54561, NULL, NULL, 1455024777, 1),
(215, 2, NULL, 5, NULL, 1448924400, -15000, 659, 13, NULL, NULL, 1455025157, 1),
(216, 2, NULL, 12, NULL, 1435615200, -10000, 884, 466, NULL, NULL, 1455025453, 1),
(397, 1, NULL, 10, NULL, 1456268400, 20000, 1323, 0, NULL, NULL, 1456314395, 1),
(398, 1, NULL, 10, NULL, 1456354800, 15000, 1324, 0, NULL, NULL, 1456314409, 1),
(408, 5, NULL, 8, NULL, 1456614000, -5000, 1234, 0, NULL, NULL, 1456319256, 1),
(409, 1, NULL, 67, NULL, 1453590000, 35000, 350, 0, NULL, NULL, 1456320996, 1),
(416, 1, NULL, 5, NULL, 1455750000, 289000, 153, 0, NULL, NULL, 1456487741, 1),
(419, 1, NULL, 20, NULL, 1456441200, 450500, 126, 0, NULL, NULL, 1456491436, 1),
(420, 1, NULL, 4, NULL, 1453244400, 9000, 999, 0, NULL, NULL, 1456572212, 1),
(421, 1, NULL, 4, NULL, 1422745200, 10000, 111, 0, NULL, NULL, 1456572245, 1),
(422, 1, NULL, 4, NULL, 1455663600, 7500, 123, 0, NULL, NULL, 1456575001, 1),
(429, 2, NULL, 4, NULL, 1456527600, -28000, 151, 848, NULL, NULL, 1456576375, 2),
(430, 4, 429, 4, NULL, 1456527600, -1000, 151, 848, NULL, NULL, 1456576375, 2),
(445, 1, NULL, 1, NULL, 1457046000, 6000, 5153, 0, NULL, NULL, 1457081348, 1),
(446, 1, NULL, 1, NULL, 1457046000, 7000, 813, 0, NULL, NULL, 1457081566, 1),
(447, 2, NULL, 1, NULL, 1456959600, -12000, 1236, 991, NULL, NULL, 1457081678, 1),
(448, 4, 447, 1, NULL, 1456959600, -1000, 1236, 991, NULL, NULL, 1457081678, 1),
(449, 1, NULL, 15, NULL, 1456614000, 99000, 1613, 0, NULL, NULL, 1457081752, 1),
(450, 2, NULL, 15, NULL, 1457046000, -18000, 1563, 516, NULL, NULL, 1457081766, 1),
(451, 4, 450, 15, NULL, 1457046000, -1000, 1563, 516, NULL, NULL, 1457081766, 1),
(452, 1, NULL, 15, NULL, 1460325600, 5000, 123, 0, NULL, NULL, 1460370069, 1),
(458, 1, NULL, 4, NULL, 1460498400, 120000, 5015, 0, NULL, 1468360800, 1460559554, 1),
(459, 1, NULL, 25, NULL, 1460498400, 26000, 26, 0, NULL, 0, 1460560269, 1),
(460, 1, NULL, 67, NULL, 1460584800, 42000, 516, 0, 'Markus', 0, 1460626282, 1),
(462, 1, NULL, 6, NULL, 1462312800, 120000, 516, 0, 'Alex Murenge', 1467237600, 1462352971, 1),
(463, 1, NULL, 6, NULL, 1462312800, 23000, 213, 0, 'Martin Luther', 0, 1462354130, 1),
(467, 3, NULL, 6, NULL, 1467324000, 9000, 1011, 0, 'Iryaruvumba SACCO', 0, 1462354956, 1),
(468, 5, NULL, 3, NULL, 1507500000, -5000, 234, 0, NULL, NULL, 1507577084, 1),
(469, 5, NULL, 4, NULL, 1507500000, -5000, 4711, 0, NULL, NULL, 1507577418, 1),
(470, 3, NULL, 1, NULL, 1483138800, 420, NULL, 0, NULL, NULL, 1507582662, 1),
(471, 3, NULL, 2, NULL, 1483138800, 3808, NULL, 0, NULL, NULL, 1507582662, 1),
(472, 3, NULL, 3, NULL, 1483138800, 200, NULL, 0, NULL, NULL, 1507582662, 1),
(473, 3, NULL, 4, NULL, 1483138800, 2562, NULL, 0, NULL, NULL, 1507582662, 1),
(474, 3, NULL, 5, NULL, 1483138800, 5243, NULL, 0, NULL, NULL, 1507582662, 1),
(475, 3, NULL, 6, NULL, 1483138800, 2492, NULL, 0, NULL, NULL, 1507582662, 1),
(476, 3, NULL, 7, NULL, 1483138800, 2118, NULL, 0, NULL, NULL, 1507582662, 1),
(477, 3, NULL, 8, NULL, 1483138800, 1876, NULL, 0, NULL, NULL, 1507582662, 1),
(478, 3, NULL, 9, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582662, 1),
(479, 3, NULL, 10, NULL, 1483138800, 595, NULL, 0, NULL, NULL, 1507582662, 1),
(480, 3, NULL, 12, NULL, 1483138800, 200, NULL, 0, NULL, NULL, 1507582662, 1),
(481, 3, NULL, 15, NULL, 1483138800, 1420, NULL, 0, NULL, NULL, 1507582662, 1),
(482, 3, NULL, 16, NULL, 1483138800, 600, NULL, 0, NULL, NULL, 1507582662, 1),
(483, 3, NULL, 19, NULL, 1483138800, 1480, NULL, 0, NULL, NULL, 1507582662, 1),
(484, 3, NULL, 20, NULL, 1483138800, 8189, NULL, 0, NULL, NULL, 1507582662, 1),
(485, 3, NULL, 21, NULL, 1483138800, 2866, NULL, 0, NULL, NULL, 1507582662, 1),
(486, 3, NULL, 22, NULL, 1483138800, 324, NULL, 0, NULL, NULL, 1507582662, 1),
(487, 3, NULL, 23, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582662, 1),
(488, 3, NULL, 26, NULL, 1483138800, 1250, NULL, 0, NULL, NULL, 1507582662, 1),
(489, 3, NULL, 27, NULL, 1483138800, 102, NULL, 0, NULL, NULL, 1507582662, 1),
(490, 3, NULL, 28, NULL, 1483138800, 24, NULL, 0, NULL, NULL, 1507582662, 1),
(491, 3, NULL, 29, NULL, 1483138800, 720, NULL, 0, NULL, NULL, 1507582662, 1),
(492, 3, NULL, 32, NULL, 1483138800, 40, NULL, 0, NULL, NULL, 1507582662, 1),
(493, 3, NULL, 33, NULL, 1483138800, 1306, NULL, 0, NULL, NULL, 1507582662, 1),
(494, 3, NULL, 35, NULL, 1483138800, 400, NULL, 0, NULL, NULL, 1507582662, 1),
(495, 3, NULL, 36, NULL, 1483138800, 1996, NULL, 0, NULL, NULL, 1507582662, 1),
(496, 3, NULL, 37, NULL, 1483138800, 30000, NULL, 0, NULL, NULL, 1507582662, 1),
(497, 3, NULL, 38, NULL, 1483138800, 80, NULL, 0, NULL, NULL, 1507582662, 1),
(498, 3, NULL, 39, NULL, 1483138800, 5872, NULL, 0, NULL, NULL, 1507582662, 1),
(499, 3, NULL, 41, NULL, 1483138800, 80, NULL, 0, NULL, NULL, 1507582662, 1),
(500, 3, NULL, 42, NULL, 1483138800, 224, NULL, 0, NULL, NULL, 1507582662, 1),
(501, 3, NULL, 43, NULL, 1483138800, 1836, NULL, 0, NULL, NULL, 1507582662, 1),
(502, 3, NULL, 45, NULL, 1483138800, 1980, NULL, 0, NULL, NULL, 1507582662, 1),
(503, 3, NULL, 46, NULL, 1483138800, 400, NULL, 0, NULL, NULL, 1507582662, 1),
(504, 3, NULL, 49, NULL, 1483138800, 500, NULL, 0, NULL, NULL, 1507582662, 1),
(506, 3, NULL, 51, NULL, 1483138800, 1700, NULL, 0, NULL, NULL, 1507582662, 1),
(507, 3, NULL, 52, NULL, 1483138800, 5268, NULL, 0, NULL, NULL, 1507582662, 1),
(508, 3, NULL, 53, NULL, 1483138800, 400, NULL, 0, NULL, NULL, 1507582662, 1),
(509, 3, NULL, 55, NULL, 1483138800, 516, NULL, 0, NULL, NULL, 1507582662, 1),
(510, 3, NULL, 56, NULL, 1483138800, 41, NULL, 0, NULL, NULL, 1507582662, 1),
(511, 3, NULL, 58, NULL, 1483138800, 612, NULL, 0, NULL, NULL, 1507582662, 1),
(512, 3, NULL, 59, NULL, 1483138800, 1816, NULL, 0, NULL, NULL, 1507582662, 1),
(513, 3, NULL, 60, NULL, 1483138800, 200800, NULL, 0, NULL, NULL, 1507582662, 1),
(514, 3, NULL, 61, NULL, 1483138800, 7214, NULL, 0, NULL, NULL, 1507582662, 1),
(515, 3, NULL, 62, NULL, 1483138800, 3318, NULL, 0, NULL, NULL, 1507582662, 1),
(516, 3, NULL, 63, NULL, 1483138800, 550, NULL, 0, NULL, NULL, 1507582662, 1),
(517, 3, NULL, 64, NULL, 1483138800, 230, NULL, 0, NULL, NULL, 1507582662, 1),
(518, 3, NULL, 65, NULL, 1483138800, 228, NULL, 0, NULL, NULL, 1507582662, 1),
(519, 3, NULL, 66, NULL, 1483138800, 2828, NULL, 0, NULL, NULL, 1507582662, 1),
(520, 3, NULL, 67, NULL, 1483138800, 1263, NULL, 0, NULL, NULL, 1507582662, 1),
(521, 3, NULL, 68, NULL, 1483138800, 1628, NULL, 0, NULL, NULL, 1507582662, 1),
(522, 3, NULL, 69, NULL, 1483138800, 28, NULL, 0, NULL, NULL, 1507582662, 1),
(523, 3, NULL, 72, NULL, 1483138800, 1600, NULL, 0, NULL, NULL, 1507582662, 1),
(524, 3, NULL, 74, NULL, 1483138800, 500, NULL, 0, NULL, NULL, 1507582662, 1),
(525, 3, NULL, 76, NULL, 1483138800, 12, NULL, 0, NULL, NULL, 1507582662, 1),
(526, 3, NULL, 77, NULL, 1483138800, 9420, NULL, 0, NULL, NULL, 1507582662, 1),
(527, 3, NULL, 78, NULL, 1483138800, 3380, NULL, 0, NULL, NULL, 1507582662, 1),
(528, 3, NULL, 79, NULL, 1483138800, 1200, NULL, 0, NULL, NULL, 1507582662, 1),
(529, 3, NULL, 80, NULL, 1483138800, 1580, NULL, 0, NULL, NULL, 1507582662, 1),
(530, 3, NULL, 81, NULL, 1483138800, 204, NULL, 0, NULL, NULL, 1507582662, 1),
(531, 3, NULL, 84, NULL, 1483138800, 1020, NULL, 0, NULL, NULL, 1507582662, 1),
(532, 3, NULL, 85, NULL, 1483138800, 1020, NULL, 0, NULL, NULL, 1507582662, 1),
(533, 3, NULL, 86, NULL, 1483138800, 3986, NULL, 0, NULL, NULL, 1507582662, 1),
(534, 3, NULL, 89, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582662, 1),
(535, 3, NULL, 91, NULL, 1483138800, 1998, NULL, 0, NULL, NULL, 1507582662, 1),
(536, 3, NULL, 92, NULL, 1483138800, 7500, NULL, 0, NULL, NULL, 1507582662, 1),
(537, 3, NULL, 93, NULL, 1483138800, 200, NULL, 0, NULL, NULL, 1507582662, 1),
(538, 3, NULL, 94, NULL, 1483138800, 8000, NULL, 0, NULL, NULL, 1507582662, 1),
(539, 3, NULL, 95, NULL, 1483138800, 1722, NULL, 0, NULL, NULL, 1507582662, 1),
(540, 3, NULL, 96, NULL, 1483138800, 4, NULL, 0, NULL, NULL, 1507582662, 1),
(541, 3, NULL, 97, NULL, 1483138800, 7556, NULL, 0, NULL, NULL, 1507582662, 1),
(542, 3, NULL, 98, NULL, 1483138800, 560, NULL, 0, NULL, NULL, 1507582662, 1),
(543, 3, NULL, 99, NULL, 1483138800, 1, NULL, 0, NULL, NULL, 1507582662, 1),
(544, 3, NULL, 100, NULL, 1483138800, 1782, NULL, 0, NULL, NULL, 1507582662, 1),
(546, 9, NULL, 1, NULL, 1483138800, 8430, NULL, 0, NULL, NULL, 1507582710, 1),
(547, 9, NULL, 2, NULL, 1483138800, 3880, NULL, 0, NULL, NULL, 1507582710, 1),
(548, 9, NULL, 3, NULL, 1483138800, 6000, NULL, 0, NULL, NULL, 1507582710, 1),
(549, 9, NULL, 4, NULL, 1483138800, 3700, NULL, 0, NULL, NULL, 1507582710, 1),
(550, 9, NULL, 5, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(551, 9, NULL, 6, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(552, 9, NULL, 7, NULL, 1483138800, 15000, NULL, 0, NULL, NULL, 1507582710, 1),
(553, 9, NULL, 8, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(554, 9, NULL, 9, NULL, 1483138800, 4000, NULL, 0, NULL, NULL, 1507582710, 1),
(555, 9, NULL, 10, NULL, 1483138800, 960, NULL, 0, NULL, NULL, 1507582710, 1),
(556, 9, NULL, 12, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(557, 9, NULL, 15, NULL, 1483138800, 950, NULL, 0, NULL, NULL, 1507582710, 1),
(558, 9, NULL, 16, NULL, 1483138800, 1730, NULL, 0, NULL, NULL, 1507582710, 1),
(559, 9, NULL, 17, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(560, 9, NULL, 19, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(561, 9, NULL, 20, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(562, 9, NULL, 21, NULL, 1483138800, 5000, NULL, 0, NULL, NULL, 1507582710, 1),
(563, 9, NULL, 22, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(564, 9, NULL, 23, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(565, 9, NULL, 24, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(566, 9, NULL, 26, NULL, 1483138800, 3000, NULL, 0, NULL, NULL, 1507582710, 1),
(567, 9, NULL, 27, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(568, 9, NULL, 28, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(569, 9, NULL, 29, NULL, 1483138800, 4000, NULL, 0, NULL, NULL, 1507582710, 1),
(570, 9, NULL, 32, NULL, 1483138800, 7000, NULL, 0, NULL, NULL, 1507582710, 1),
(571, 9, NULL, 33, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(572, 9, NULL, 34, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(573, 9, NULL, 35, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(574, 9, NULL, 36, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(575, 9, NULL, 37, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(576, 9, NULL, 38, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(577, 9, NULL, 39, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(578, 9, NULL, 40, NULL, 1483138800, 5000, NULL, 0, NULL, NULL, 1507582710, 1),
(579, 9, NULL, 41, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(580, 9, NULL, 42, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(581, 9, NULL, 43, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(582, 9, NULL, 45, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(583, 9, NULL, 46, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(584, 9, NULL, 47, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(585, 9, NULL, 48, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(586, 9, NULL, 49, NULL, 1483138800, 4000, NULL, 0, NULL, NULL, 1507582710, 1),
(588, 9, NULL, 51, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(589, 9, NULL, 52, NULL, 1483138800, 5000, NULL, 0, NULL, NULL, 1507582710, 1),
(590, 9, NULL, 54, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(591, 9, NULL, 55, NULL, 1483138800, 3000, NULL, 0, NULL, NULL, 1507582710, 1),
(592, 9, NULL, 56, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(593, 9, NULL, 58, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(594, 9, NULL, 59, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(595, 9, NULL, 60, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(596, 9, NULL, 61, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(597, 9, NULL, 62, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(598, 9, NULL, 63, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(599, 9, NULL, 64, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(600, 9, NULL, 65, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(601, 9, NULL, 66, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(602, 9, NULL, 68, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(603, 9, NULL, 69, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(604, 9, NULL, 72, NULL, 1483138800, 50, NULL, 0, NULL, NULL, 1507582710, 1),
(605, 9, NULL, 73, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(606, 9, NULL, 74, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(607, 9, NULL, 76, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(608, 9, NULL, 77, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(609, 9, NULL, 78, NULL, 1483138800, 5000, NULL, 0, NULL, NULL, 1507582710, 1),
(610, 9, NULL, 79, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(611, 9, NULL, 80, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(612, 9, NULL, 81, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(613, 9, NULL, 83, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(614, 9, NULL, 84, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(615, 9, NULL, 85, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(616, 9, NULL, 86, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(617, 9, NULL, 87, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(618, 9, NULL, 89, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(619, 9, NULL, 90, NULL, 1483138800, 4000, NULL, 0, NULL, NULL, 1507582710, 1),
(620, 9, NULL, 91, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(621, 9, NULL, 92, NULL, 1483138800, 3000, NULL, 0, NULL, NULL, 1507582710, 1),
(622, 9, NULL, 93, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(623, 9, NULL, 94, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(624, 9, NULL, 95, NULL, 1483138800, 4000, NULL, 0, NULL, NULL, 1507582710, 1),
(625, 9, NULL, 96, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(626, 9, NULL, 97, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(627, 9, NULL, 98, NULL, 1483138800, 1000, NULL, 0, NULL, NULL, 1507582710, 1),
(628, 9, NULL, 99, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(629, 9, NULL, 100, NULL, 1483138800, 2000, NULL, 0, NULL, NULL, 1507582710, 1),
(632, 2, NULL, 4, NULL, 1507586400, -1762, 13, 2356, NULL, NULL, 1507627793, 1),
(633, 4, 632, 4, NULL, 1507586400, -1000, 13, 2356, NULL, NULL, 1507627793, 1),
(634, 1, NULL, 50, NULL, 1507672800, 100000, 8463, 0, '', 1539122400, 1507732181, 1),
(640, 1, NULL, 50, NULL, 1480892400, 25000, 354, 0, '', 1507413600, 1507733823, 1),
(641, 1, NULL, 50, NULL, 1507759200, 12000, 689, 0, '', 0, 1507733861, 1),
(645, 2, NULL, 50, NULL, 1507672800, -10000, 64, 135, NULL, NULL, 1507736231, 1),
(647, 2, NULL, 20, NULL, 1507672800, -400189, 48, 1635, NULL, NULL, 1507740340, 1),
(648, 2, NULL, 20, NULL, 1507672800, -82000, 646, 689, NULL, NULL, 1507740366, 1),
(649, 1, NULL, 20, NULL, 1507672800, 9000, 35, 0, '', 1508882400, 1507740424, 1),
(650, 5, NULL, 20, NULL, 1507672800, -5000, 849, 0, NULL, NULL, 1507740441, 1),
(651, 1, NULL, 30, NULL, 1507672800, 20000, 236, 0, '', 1572476400, 1507740487, 1),
(652, 1, NULL, 30, NULL, 1507672800, 5000, 689, 0, '', 0, 1507740557, 1),
(653, 5, NULL, 30, NULL, 1507672800, -5000, 979, 0, NULL, NULL, 1507740564, 1),
(654, 8, NULL, 50, 208, 1507672800, -20000, 21, 0, NULL, NULL, 1507740798, 1),
(655, 6, NULL, 50, 209, 1507672800, -5000, 84648, 0, NULL, NULL, 1507740867, 1),
(656, 6, NULL, 50, 210, 1507672800, -15000, 45646, 0, NULL, NULL, 1507748327, 1),
(657, 5, NULL, 10, NULL, 1508104800, -5000, 458, 0, NULL, NULL, 1508149777, 1),
(658, 5, NULL, 15, NULL, 1508104800, -5000, 846, 0, NULL, NULL, 1508150086, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savtype`
--

CREATE TABLE `savtype` (
  `savtype_id` int(11) NOT NULL,
  `savtype_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `savtype_short` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `savtype`
--

INSERT INTO `savtype` (`savtype_id`, `savtype_type`, `savtype_short`) VALUES
(1, 'Deposit', 'SAV_DEP'),
(2, 'Withdrawal', 'SAV_WDL'),
(3, 'Savings Interest', 'SAV_INT'),
(4, 'W/drawal Fee', 'SAV_WDF'),
(5, 'Subscription Fee', 'SAV_SUF'),
(6, 'Loan Default Fine', 'SAV_LDF'),
(7, 'Loan Fee', 'SAV_LOF'),
(8, 'Loan Repayment', 'SAV_LRP'),
(9, 'Share Dividend', 'SAV_SHD');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `securities`
--

CREATE TABLE `securities` (
  `sec_id` int(11) NOT NULL,
  `cust_id` int(8) NOT NULL,
  `loan_id` int(8) NOT NULL,
  `sec_no` varchar(50) COLLATE utf8_bin NOT NULL,
  `sec_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `sec_value` int(11) NOT NULL,
  `sec_path` varchar(200) COLLATE utf8_bin NOT NULL,
  `sec_returned` int(1) NOT NULL DEFAULT '0',
  `sec_date` int(11) NOT NULL,
  `sec_returned_date` int(11) NOT NULL,
  `sec_lastupd` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `securities`
--

INSERT INTO `securities` (`sec_id`, `cust_id`, `loan_id`, `sec_no`, `sec_name`, `sec_value`, `sec_path`, `sec_returned`, `sec_date`, `sec_returned_date`, `sec_lastupd`, `user_id`) VALUES
(1, 100, 1, '1', 'Ox', 0, 'uploads/securities/1_01.jpg', 0, 0, 0, 1517345081, 1),
(2, 100, 1, '2', 'Motoca', 0, '', 0, 0, 0, 0, 0),
(4, 15, 19, '1', 'Savings account at Stanbic', 0, '', 0, 0, 0, 1517345109, 1),
(5, 15, 19, '2', 'Two Chickens', 0, 'uploads/securities/19_02.jpg', 0, 0, 0, 0, 0),
(6, 50, 9, '1', 'Family home', 0, 'uploads/securities/9_01.png', 0, 0, 0, 0, 0),
(7, 40, 10, '2', 'Taxi', 0, 'uploads/securities/10_02.jpg', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `settings`
--

CREATE TABLE `settings` (
  `set_id` int(11) NOT NULL,
  `set_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `set_short` varchar(8) COLLATE utf8_bin NOT NULL,
  `set_value` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `settings`
--

INSERT INTO `settings` (`set_id`, `set_name`, `set_short`, `set_value`) VALUES
(1, 'Minimum Savings Balance', 'SET_MSB', '5000'),
(2, 'Minimum Loan Principal', 'SET_MLP', '500000'),
(3, 'Maximum Loan Principal', 'SET_XLP', '10000000'),
(4, 'Currency Abbreviation', 'SET_CUR', 'UGX'),
(5, 'Auto-fine Defaulters', 'SET_AUF', ''),
(6, 'Account Deactivation', 'SET_DEA', ''),
(7, 'Dashboard Left', 'SET_DBL', 'dashboard/dash_subscr.php'),
(8, 'Dashboard Right', 'SET_DBR', 'dashboard/dash_loandefaults.php'),
(9, 'Interest Calculation', 'SET_ICL', 'modules/mod_inter_float.php'),
(10, 'Guarantor Limit', 'SET_GUA', '3'),
(11, 'Minimum Membership', 'SET_MEM', '6'),
(12, 'Maximum Principal-Savings Ratio', 'SET_PSR', ''),
(13, 'Customer Number Format', 'SET_CNO', '%N%/%Y'),
(14, 'Employee Number Format', 'SET_ENO', '%N'),
(15, 'Additional Field Loans', 'SET_XL1', 'Spouse'),
(16, 'Fixed Savings', 'SET_SFX', '1'),
(17, 'Customer Search by ID', 'SET_CSI', '0'),
(18, 'Use Fixed Deposits for Fine', 'SET_F4F', '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shares`
--

CREATE TABLE `shares` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `shares`
--

INSERT INTO `shares` (`share_id`, `cust_id`, `share_date`, `share_amount`, `share_value`, `share_receipt`, `share_trans`, `share_transfrom`, `share_created`, `user_id`) VALUES
(2, 2, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(3, 3, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(4, 4, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(5, 5, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(6, 6, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(7, 7, 1420070400, 15, 300000, 0, 0, 0, NULL, 1),
(8, 8, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(9, 9, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(11, 11, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(12, 12, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(13, 13, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(16, 16, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
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
(45, 45, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(46, 46, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(47, 47, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(48, 48, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(49, 49, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(50, 50, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(51, 51, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(52, 52, 1420070400, 5, 100000, 0, 0, 0, NULL, 1),
(54, 54, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(55, 55, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(56, 56, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
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
(72, 73, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(73, 74, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(75, 76, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(76, 77, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(77, 78, 1420070400, 5, 100000, 0, 0, 0, NULL, 1),
(78, 79, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(79, 80, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(80, 81, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(82, 83, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(83, 84, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(84, 85, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(85, 86, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(86, 87, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
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
(200, 3, 1430863200, 3, 60000, 1213, 0, NULL, 1443691128, 3),
(201, 3, 1443692344, 1, 20000, 0, 1, 190, 1443692344, 3),
(210, 1, 1452726000, 1, 20000, 1234, 0, NULL, 1452776435, 1),
(211, 2, 1452726000, 3, 60000, 333, 0, NULL, 1452784683, 1),
(212, 10, 1452726000, 1, 20000, 4521, 0, NULL, 1452785901, 1),
(214, 72, 1453071600, 1, 20000, 1801, 0, NULL, 1453104429, 1),
(215, 15, 1453071600, 1, 20000, 123, 0, NULL, 1453110172, 1),
(216, 1, 1442527200, 2, 40000, 728, 0, NULL, 1453118433, 1),
(217, 17, 1450306800, 1, 20000, 5, 0, NULL, 1453832033, 1),
(218, 1, 1454367600, 7, 140000, 707, 0, NULL, 1454424313, 1),
(219, 1, 1454626800, -1, -20000, 123, 0, NULL, 1454657860, 1),
(220, 4, 1454661409, 1, 20000, 0, 1, 72, 1454661409, 1),
(221, 72, 1454661409, -1, -20000, 0, 1, NULL, 1454661409, 1),
(222, 4, 1454626800, 2, 40000, 1357, 0, NULL, 1454662667, 1),
(223, 4, 1454626800, 1, 20000, 2468, 0, NULL, 1454662707, 1),
(224, 4, 1454713200, -1, -20000, 1020, 0, NULL, 1454663138, 1),
(225, 16, 1460498400, 1, 20000, 851, 0, NULL, 1460562659, 1),
(226, 16, 1460584800, 1, 20000, 848, 0, NULL, 1460562702, 1),
(228, 16, 1460671200, -1, -20000, 883, 0, NULL, 1460562743, 1),
(230, 4, 1507413600, 3, 60000, 815, 0, NULL, 1507628081, 1),
(231, 4, 1507586400, -1, -20000, 555, 0, NULL, 1507628120, 1),
(233, 28, 1507628187, -2, -40000, 0, 1, NULL, 1507628187, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shareval`
--

CREATE TABLE `shareval` (
  `shareval_id` int(11) NOT NULL,
  `shareval_date` int(11) NOT NULL,
  `shareval_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `shareval`
--

INSERT INTO `shareval` (`shareval_id`, `shareval_date`, `shareval_value`) VALUES
(1, 1454423560, 10000),
(2, 1454423597, 20000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ugroup`
--

CREATE TABLE `ugroup` (
  `ugroup_id` int(11) NOT NULL,
  `ugroup_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `ugroup_admin` int(11) NOT NULL,
  `ugroup_delete` int(2) NOT NULL,
  `ugroup_report` int(11) NOT NULL,
  `ugroup_created` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `ugroup`
--

INSERT INTO `ugroup` (`ugroup_id`, `ugroup_name`, `ugroup_admin`, `ugroup_delete`, `ugroup_report`, `ugroup_created`) VALUES
(1, 'Administrator', 1, 1, 1, 1453123220),
(2, 'Management', 0, 1, 1, 1507575408),
(3, 'Employee', 0, 1, 0, 1453125729),
(4, 'Ext-Admin', 1, 0, 0, 1453123276);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `user_pw` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ugroup_id` int(11) NOT NULL,
  `empl_id` int(11) NOT NULL,
  `user_created` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_pw`, `ugroup_id`, `empl_id`, `user_created`) VALUES
(0, NULL, NULL, 0, 0, 0),
(1, 'admin', '$2y$10$7cBzh4VmfY0OBW9ng4iiWemZdK/QE7ZWwGEJTJmMzwA2AV6g3KF/i', 1, 1, 1459326888),
(2, 'ext-admin', '$2y$10$AjVSpVOtNsULIL5e37MPc.XQN4WADFVvWjb9xE0BQPZNXrEXQuMGO', 4, 10, 1460204701),
(3, 'John Doe', '$2y$10$R86u.wUMl9DhD5.1/iJtn.iMmLIGw6JRA0kijWVlF.fN/fISYbhRK', 2, 0, 1507572770),
(4, 'Tom', '$2y$10$O4OBuJdipnN3t8ceJncia.UXR3ewAXMRNfhQ2MgPW.r8sTDMB4hY2', 4, 7, 1507574867);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `custmarried`
--
ALTER TABLE `custmarried`
  ADD PRIMARY KEY (`custmarried_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indizes für die Tabelle `custsex`
--
ALTER TABLE `custsex`
  ADD PRIMARY KEY (`custsex_id`);

--
-- Indizes für die Tabelle `custsick`
--
ALTER TABLE `custsick`
  ADD PRIMARY KEY (`custsick_id`);

--
-- Indizes für die Tabelle `emplmarried`
--
ALTER TABLE `emplmarried`
  ADD PRIMARY KEY (`emplmarried_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empl_id`);

--
-- Indizes für die Tabelle `emplsex`
--
ALTER TABLE `emplsex`
  ADD PRIMARY KEY (`emplsex_id`);

--
-- Indizes für die Tabelle `expenses`
--
ALTER TABLE `expenses`
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
-- Indizes für die Tabelle `savbalance`
--
ALTER TABLE `savbalance`
  ADD PRIMARY KEY (`savbal_id`);

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
-- AUTO_INCREMENT für Tabelle `custmarried`
--
ALTER TABLE `custmarried`
  MODIFY `custmarried_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT für Tabelle `custsex`
--
ALTER TABLE `custsex`
  MODIFY `custsex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `custsick`
--
ALTER TABLE `custsick`
  MODIFY `custsick_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `emplmarried`
--
ALTER TABLE `emplmarried`
  MODIFY `emplmarried_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `empl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT für Tabelle `emplsex`
--
ALTER TABLE `emplsex`
  MODIFY `emplsex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `expenses`
--
ALTER TABLE `expenses`
  MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `exptype`
--
ALTER TABLE `exptype`
  MODIFY `exptype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT für Tabelle `fees`
--
ALTER TABLE `fees`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `incomes`
--
ALTER TABLE `incomes`
  MODIFY `inc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT für Tabelle `inctype`
--
ALTER TABLE `inctype`
  MODIFY `inctype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT für Tabelle `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT für Tabelle `loanstatus`
--
ALTER TABLE `loanstatus`
  MODIFY `loanstatus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `logrec`
--
ALTER TABLE `logrec`
  MODIFY `logrec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT für Tabelle `ltrans`
--
ALTER TABLE `ltrans`
  MODIFY `ltrans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;
--
-- AUTO_INCREMENT für Tabelle `savbalance`
--
ALTER TABLE `savbalance`
  MODIFY `savbal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT für Tabelle `savings`
--
ALTER TABLE `savings`
  MODIFY `sav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=659;
--
-- AUTO_INCREMENT für Tabelle `savtype`
--
ALTER TABLE `savtype`
  MODIFY `savtype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `securities`
--
ALTER TABLE `securities`
  MODIFY `sec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `settings`
--
ALTER TABLE `settings`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT für Tabelle `shares`
--
ALTER TABLE `shares`
  MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;
--
-- AUTO_INCREMENT für Tabelle `shareval`
--
ALTER TABLE `shareval`
  MODIFY `shareval_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `ugroup`
--
ALTER TABLE `ugroup`
  MODIFY `ugroup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
