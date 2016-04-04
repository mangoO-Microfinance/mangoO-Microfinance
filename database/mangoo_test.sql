-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 23. Mrz 2016 um 12:25
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
-- Tabellenstruktur für Tabelle `custmarried`
--

CREATE TABLE IF NOT EXISTS `custmarried` (
`custmarried_id` int(11) NOT NULL,
  `custmarried_status` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `customer` (
`cust_id` int(11) NOT NULL,
  `cust_no` varchar(50) DEFAULT NULL,
  `cust_name` varchar(100) DEFAULT NULL,
  `cust_dob` int(11) DEFAULT NULL,
  `custsex_id` int(11) DEFAULT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  `cust_phone` varchar(50) DEFAULT NULL,
  `cust_email` varchar(100) DEFAULT NULL,
  `cust_occup` varchar(50) DEFAULT NULL,
  `custmarried_id` int(11) DEFAULT NULL,
  `cust_heir` varchar(100) DEFAULT NULL,
  `cust_heirrel` varchar(50) DEFAULT NULL,
  `cust_lengthres` int(11) DEFAULT NULL,
  `cust_since` int(11) DEFAULT NULL,
  `custsick_id` int(11) DEFAULT NULL,
  `cust_lastsub` int(11) DEFAULT NULL,
  `cust_active` int(1) NOT NULL DEFAULT '0',
  `cust_lastupd` int(11) DEFAULT NULL,
  `cust_pic` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_no`, `cust_name`, `cust_dob`, `custsex_id`, `cust_address`, `cust_phone`, `cust_email`, `cust_occup`, `custmarried_id`, `cust_heir`, `cust_heirrel`, `cust_lengthres`, `cust_since`, `custsick_id`, `cust_lastsub`, `cust_active`, `cust_lastupd`, `cust_pic`, `user_id`) VALUES
(0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(1, '001/2016', 'John Wycliff', -1262307600, 1, 'Yorkshire', '031 12 1384', '', 'Theologian', 1, '', '', NULL, 1140000000, 0, 1630718000, 1, 1457431040, 'uploads/photos/customers/cust1_146x190.jpg', 1),
(2, '002/2006', 'Jan Hus', 78793200, 1, 'Prague', '0607 1415', '', 'Reformer', 2, 'Joh. Joseph Hu&szlig;', 'Father', NULL, 1141776000, 0, 1456268400, 1, 1457431296, 'uploads/photos/customers/cust2_146x190.jpg', 1),
(3, '003/2006', 'Martin Luther', 437266800, 1, 'Geneva', '018 02 1546', '', 'Reformer', 2, 'Katharina von Bora', 'Wife', NULL, 1141884000, 1, 1458090800, 1, 1457431701, 'uploads/photos/customers/cust3_146x190.jpg', 1),
(4, '004/2006', 'Huldrych Zwingli', 441759600, 1, 'Zurich', '011 10 1531', '', 'Reformer', 2, 'Anna Reinhart', 'Wife', NULL, 1155552000, 0, 1458954800, 1, 1457433917, 'uploads/photos/customers/cust4_146x190.jpg', 1),
(5, '005/2006', 'Martin Bucer', 689814000, 1, 'Strasbourg', '010 31551', '', 'Reformer', 2, 'Elisabeth Silbereisen', 'Wife', NULL, 1159440000, 0, 1426990400, 1, 1457434157, 'uploads/photos/customers/cust5_146x190.jpg', 1),
(6, '006/2015', 'Philip Melanchthon', 856047600, 1, 'Wittenberg', '019 041560', '', 'Reformer', 2, 'Katharina Krapp', 'Wife', NULL, 1163328000, 0, 1622942000, 1, 1457434738, 'uploads/photos/customers/cust6_146x190.jpg', 1),
(7, '007/2006', 'Heinrich Bullinger', -2065654800, 1, 'Zurich', '017 091575', '', 'Reformer', 2, 'Anna Adlischweiler', 'Wife', NULL, 1167216000, 0, 1456190000, 1, 1457434831, 'uploads/photos/customers/cust7_146x190.jpg', 1),
(8, '008/2006', 'Johannes Calvin', -1908579600, 1, 'Geneva', '027 051564', '', 'Reformer', 2, 'Idelette de Bure', 'Wife', NULL, 1171104000, 0, 1425077995, 1, 1458667201, 'uploads/photos/customers/cust8_146x190.jpg', 1),
(9, '009/2006', 'John Knox', -1767229200, 1, 'Edinburgh', '024 111572', '', 'Reformer', 1, '', '', NULL, 1174992000, 0, 1430446400, 1, 1457435038, 'uploads/photos/customers/cust9_146x190.jpg', 1),
(10, '010/2006', 'Caspar Olevian', -1053824400, 1, 'Heidelberg', '015 031587', '', 'Reformer', 2, 'Philippine von Metz', 'Wife', NULL, 1178880000, 0, 1431310400, 1, 1457435215, 'uploads/photos/customers/cust10_146x190.jpg', 1),
(11, '011/2006', 'Nydius Melvinus', -341802000, 3, 'Kiziba Kikyusa Archdeaconry', '0772-968414', 'huxpoll@yahoo.com', 'Preacher', 2, 'Mrs. Luna Mwamiza', 'Wife', NULL, 1182768000, 1, 1402174400, 0, 1454656213, NULL, 1),
(12, '012/2006', 'Joshua Vandenburg  ', -552448800, 1, 'Kiziba Kikyusa Arch', '0772-551662', '', 'Clergy Man', 2, '', '', NULL, 1186656000, 0, 1433038400, 1, 1420070400, NULL, 1),
(13, '013/2006', 'Melania Mitchem  ', 158364000, 1, 'Kalere', '0782-380513', '', 'Clergy', 1, '', '', NULL, 1190544000, 0, 1413902400, 0, 1420070400, NULL, 1),
(14, '014/2006', 'Clemmie Ellithorpe  ', -929930400, 1, 'Kazinga Butuntumula', NULL, '', 'Clergy Man', 2, '', '', NULL, 1194432000, 0, 1434766400, 0, 1427241600, NULL, 3),
(15, '015/2006', 'Kristofer Artis  ', -90000, 1, 'Kisenyi', '0', '', '', 0, '', '', NULL, 1198320000, 0, 1435630400, 1, 1452688368, NULL, 1),
(16, '016/2007', 'Lulu Obando  ', -440989200, 7, 'Sempa Parish ', '0782-096008', '', 'Clergy Man', 2, '', '', NULL, 1202208000, 0, 1436424400, 1, 1458640847, NULL, 1),
(17, '017/2006', 'Kai Soriano  ', -86403600, 1, 'Luteete', '02314 549945', '', 'Pastor / Teacher', 2, '', '', NULL, 1206096000, 0, 1437358400, 1, 1453822238, NULL, 1),
(18, '018/2006', 'Lynne Pratico  ', 160182000, 1, 'Bwaziba', '0891 128461', '', 'Clergy / Farmer', 2, '', '', NULL, 1209984000, 0, 1418222400, 0, 1453145549, NULL, 1),
(19, '019/2006', 'Noella Holyfield  ', -633578400, 1, 'Kasana -Kiwogozi', '0772-984673', '', 'Clergy Man', 2, '', '', NULL, 1213872000, 0, 1439086400, 1, 1420070400, NULL, 1),
(20, '020/2006', 'Berry Steve  ', -256525200, 1, 'Bombo', '0782-453477', '', 'Clergy Man', 2, '', '', NULL, 1217760000, 0, 1439950400, 1, 1427241600, NULL, 2),
(21, '021/2006', 'Gregorio Schurr  ', -479527200, 1, 'Kasiso', '0772-532964', '', 'Clergy Man', 2, '', '', NULL, 1221648000, 0, 1440814400, 1, 1420070400, NULL, 1),
(22, '022/2006', 'Arnetta Lobato', -744170400, 2, 'Bakijulura', '0785 368641', '', 'Retired', 3, '', '', NULL, 1225536000, 1, 1424991595, 1, 1458718116, NULL, 1),
(23, '023/2006', 'Ayana Mohammed  ', -368762400, 1, 'St. Mark Luweero', '0772-183125', '', 'Clergy Man', 2, '', '', NULL, 1229424000, 0, 1442542400, 1, 1420070400, NULL, 1),
(24, '024/2006', 'Conrad Keitt  ', -748404000, 1, 'Namusale', NULL, '', 'Clergy Man', 2, '', '', NULL, 1233312000, 0, 1443406400, 1, 1420070400, NULL, 1),
(25, '025/2006', 'Stephine Leitner  ', -559875600, 1, 'Buwana', '0773142217', '', 'Clergy Man', 2, '', '', NULL, 1237200000, 0, 1444270400, 0, 1458639837, NULL, 1),
(26, '026/2007', 'Tequila Lino  ', -597549600, 1, 'Sekamuli Area', '0782-880521', '', 'Clergy Man', 2, '', '', NULL, 1241088000, 0, 1445134400, 1, 1420070400, NULL, 1),
(27, '027/2007', 'Deena Hawes  ', -932349600, 1, 'Zirobwe', NULL, '', 'Clergy Man', 2, '', '', NULL, 1244976000, 0, 1445998400, 1, 1420070400, NULL, 1),
(28, '028/2006', 'Kellye Whitley  ', -363924000, 1, 'Lukomera', '0779-253864', '', 'Clergy Man / Teacher', 2, '', '', NULL, 1248864000, 0, 1446862400, 1, 1420070400, NULL, 1),
(29, '029/2007', 'Judi Spillman  ', -573703200, 1, 'Balitta- Lwogi', '0782-559766', '', 'Clergy Man', 2, '', '', NULL, 1252752000, 0, 1447726400, 1, 1420070400, NULL, 1),
(30, '030/2006', 'Lion of Juda Secondary School', -3600, 6, 'Luweero', '0251-1213159', '', '', 0, 'Dr. Raul Philips', 'Headmaster', NULL, 1256640000, 0, 1448590400, 1, 1454954625, NULL, 1),
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
(50, '050/2006', 'Patrick Mukisa', 167439600, 1, 'Katuugo Parish', '0782-447156', '', 'Lay-Reader / Tailor', 2, '', '', NULL, 1334400000, 0, 1465870400, 1, 1455603209, NULL, 1),
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
(75, '075/1970', 'Rhonda Pierpont  ', -3600, 2, 'Nakasongola', '0215161', '', '', 0, '', '', NULL, 1431600000, 0, 1487470400, 0, 1457942698, NULL, 1),
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
(88, '088/2007', 'Vernon Shade  ', 252712800, 2, 'Kagoma', NULL, '', 'Social Worker', 2, '', '', NULL, 1482144000, 0, 1498702400, 1, 1420070400, NULL, 1),
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

CREATE TABLE IF NOT EXISTS `custsex` (
`custsex_id` int(11) NOT NULL,
  `custsex_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `custsex`
--

INSERT INTO `custsex` (`custsex_id`, `custsex_name`) VALUES
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

CREATE TABLE IF NOT EXISTS `custsick` (
`custsick_id` int(11) NOT NULL,
  `custsick_name` varchar(50) NOT NULL,
  `custsick_risk` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `emplmarried` (
`emplmarried_id` int(11) NOT NULL,
  `emplmarried_status` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `emplmarried`
--

INSERT INTO `emplmarried` (`emplmarried_id`, `emplmarried_status`) VALUES
(1, 'Single'),
(2, 'Married'),
(3, 'Widowed'),
(4, 'Divorced');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
`empl_id` int(11) NOT NULL,
  `empl_no` varchar(50) DEFAULT NULL,
  `empl_name` varchar(100) DEFAULT NULL,
  `empl_dob` int(11) DEFAULT NULL,
  `emplsex_id` int(11) NOT NULL DEFAULT '1',
  `emplmarried_id` int(11) NOT NULL,
  `empl_position` varchar(100) DEFAULT NULL,
  `empl_salary` int(11) DEFAULT NULL,
  `empl_address` varchar(100) DEFAULT NULL,
  `empl_phone` varchar(50) DEFAULT NULL,
  `empl_email` varchar(100) DEFAULT NULL,
  `empl_in` int(11) DEFAULT NULL,
  `empl_out` int(11) DEFAULT NULL,
  `empl_lastupd` int(11) NOT NULL,
  `empl_active` int(1) NOT NULL DEFAULT '0',
  `empl_pic` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`empl_id`, `empl_no`, `empl_name`, `empl_dob`, `emplsex_id`, `emplmarried_id`, `empl_position`, `empl_salary`, `empl_address`, `empl_phone`, `empl_email`, `empl_in`, `empl_out`, `empl_lastupd`, `empl_active`, `empl_pic`, `user_id`) VALUES
(0, '0', '0', 0, 0, 0, '', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1),
(1, '001', 'Simon Peter', 18486000, 1, 2, 'Leader', 500000, 'Bethsaida', '01234567', '', 1551600, NULL, 1458731310, 0, 'uploads/photos/employees/empl1_146x190.jpg', 1),
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

CREATE TABLE IF NOT EXISTS `emplsex` (
`emplsex_id` int(11) NOT NULL,
  `emplsex_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `emplsex`
--

INSERT INTO `emplsex` (`emplsex_id`, `emplsex_name`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `expenses`
--

INSERT INTO `expenses` (`exp_id`, `cust_id`, `exptype_id`, `exp_amount`, `exp_date`, `exp_text`, `exp_recipient`, `exp_receipt`, `exp_voucher`, `exp_created`, `user_id`) VALUES
(1, NULL, 1, 15000, 1453158000, 'Airtime for Manager', 'Airtel', 0, 201, 1453207875, 2),
(2, NULL, 6, 60000, 1453676400, '2GB data bundle', 'MTN', 70812, 562, 1453213126, 1),
(3, NULL, 4, 50000, 1454281200, 'Power Bill for January', 'UMEME', 21511494, 156, 1454318269, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `exptype`
--

CREATE TABLE IF NOT EXISTS `exptype` (
`exptype_id` int(11) NOT NULL,
  `exptype_type` varchar(50) NOT NULL,
  `exptype_short` varchar(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

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
(14, 'Stationary', 'EXP_STN'),
(15, 'Tax', 'EXP_TAX'),
(16, 'Transport', 'EXP_TRN'),
(17, 'Insurance', 'EXP_INS'),
(18, 'Annual Share Dividend', 'EXP_SHD'),
(19, 'Annual Savings Interest', 'EXP_INT');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
`fee_id` int(11) NOT NULL,
  `fee_name` varchar(50) NOT NULL,
  `fee_short` varchar(8) NOT NULL,
  `fee_value` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `fees`
--

INSERT INTO `fees` (`fee_id`, `fee_name`, `fee_short`, `fee_value`) VALUES
(1, 'Entry Fee', 'FEE_ENT', 10000),
(2, 'Withdrawal Fee', 'FEE_WDL', 1000),
(3, 'Stationary Sales', 'FEE_STS', 2000),
(4, 'Anual Subscription', 'FEE_ASB', 5000),
(5, 'Loan Fee', 'FEE_LOF', 1),
(6, 'Loan Application Fee', 'FEE_LAP', 10000),
(7, 'Loan Default Fine', 'FEE_LDF', 15000),
(8, 'Loan Interest Rate', 'FEE_LIR', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `incomes`
--

CREATE TABLE IF NOT EXISTS `incomes` (
`inc_id` int(11) NOT NULL,
  `inctype_id` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `ltrans_id` int(11) DEFAULT NULL,
  `sav_id` int(11) DEFAULT NULL,
  `inc_amount` int(11) NOT NULL,
  `inc_date` int(15) NOT NULL,
  `inc_receipt` int(11) NOT NULL,
  `inc_text` varchar(200) NOT NULL,
  `inc_created` int(11) NOT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

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
(14, 2, 15, NULL, NULL, 450, 1000, 1457046000, 1563, '', 1457081766, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `inctype`
--

CREATE TABLE IF NOT EXISTS `inctype` (
`inctype_id` int(11) NOT NULL,
  `inctype_type` varchar(50) NOT NULL,
  `inctype_short` varchar(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `inctype`
--

INSERT INTO `inctype` (`inctype_id`, `inctype_type`, `inctype_short`) VALUES
(1, 'Entrance Fee', 'INC_ENF'),
(2, 'Withdrawal Fee', 'INC_WDF'),
(3, 'Loan Fee', 'INC_LOF'),
(4, 'Loan Interest', 'INC_INT'),
(5, 'Loan Default Fine', 'INC_LDF'),
(6, 'Stationary Sales', 'INC_STS'),
(7, 'Loan Application Fee', 'INC_LAF'),
(8, 'Subscription Fee', 'INC_SUF'),
(9, 'Other', 'INC_OTH'),
(10, 'Insurance', 'INC_INS');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `loans`
--

INSERT INTO `loans` (`loan_id`, `cust_id`, `loanstatus_id`, `loan_no`, `loan_date`, `loan_dateout`, `loan_issued`, `loan_principal`, `loan_interest`, `loan_appfee_receipt`, `loan_fee`, `loan_fee_receipt`, `loan_rate`, `loan_period`, `loan_repaytotal`, `loan_repaystart`, `loan_purpose`, `loan_sec1`, `loan_sec2`, `loan_guarant1`, `loan_guarant2`, `loan_guarant3`, `loan_feepaid`, `loan_created`, `user_id`) VALUES
(1, 100, 2, 'L-100-2', 1439935200, 1439935200, 1, 850000, 2.5, 1234, 8500, 87874, '162917', 6, 977500, 0, 'test', 'Cow', '', 1, 2, 3, 0, 1439993579, 1),
(2, 1, 2, 'L-1-1', 1452812400, 1454108400, 1, 600000, 2.5, 1483, 6000, 1484, '65000', 12, 780000, 0, 'Printing Cost', 'Historic Bible Edition', 'Herd of pigs', 3, 4, 200, 0, 1453118784, 1),
(4, 5, 2, 'L-5-1', 1454194800, 1456268400, 1, 800000, 3, 8501, 8000, 1712, '104000', 10, 1040000, 0, 'Aquisition of a plot', 'House', '', 2, 4, 26, 0, 1456487835, 1),
(5, 20, 1, 'L-20-1', 1454540400, 0, 0, 900000, 2, 18, 9000, 0, '168000', 6, 1008000, 0, 'Business Boost', 'Motorcycle', 'Land Title', 63, 120, 11, 0, 1456491502, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `logrec`
--

INSERT INTO `logrec` (`logrec_id`, `user_id`, `logrec_start`, `logrec_end`, `logrec_logout`) VALUES
(1, 1, 1458026228, 1458035935, 1),
(2, 1, 1458639083, 1458666852, 1),
(3, 1, 1458666860, 1458670114, 1),
(4, 1, 1458717669, NULL, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ltrans`
--

INSERT INTO `ltrans` (`ltrans_id`, `loan_id`, `ltrans_due`, `ltrans_date`, `ltrans_principaldue`, `ltrans_principal`, `ltrans_interestdue`, `ltrans_interest`, `ltrans_fined`, `ltrans_receipt`, `ltrans_created`, `user_id`) VALUES
(1, 1, 1456956000, 1458424800, 141665, 118750, 21250, 21250, 0, 1234, 1445421102, 3),
(2, 1, 1459634400, 1461103200, 141667, 78750, 21250, 21250, 0, 5678, 1445421253, 3),
(3, 1, 1462312800, NULL, 141667, NULL, 21250, NULL, 0, NULL, 1445421520, 1),
(4, 1, 1464991200, NULL, 141667, NULL, 21250, NULL, 0, NULL, 1454333347, 1),
(5, 1, 1467669600, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1),
(6, 1, 1470348000, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1),
(7, 2, 1456786800, NULL, 50000, NULL, 15000, NULL, 0, NULL, 1464250261, 1),
(8, 2, 1459465200, NULL, 50000, NULL, 15000, NULL, 0, NULL, 1464250261, 1),
(9, 2, 1462143600, NULL, 50000, NULL, 15000, NULL, 0, NULL, 1464250261, 1),
(10, 2, 1464822000, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(11, 2, 1467500400, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(12, 2, 1470178800, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(13, 2, 1472857200, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(14, 2, 1475535600, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(15, 2, 1478214000, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(16, 2, 1480892400, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(17, 2, 1483570800, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(18, 2, 1486249200, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(23, 4, 1458946800, NULL, 80000, NULL, 24000, NULL, 0, NULL, NULL, 1),
(24, 4, 1461625200, NULL, 80000, NULL, 21600, NULL, 0, NULL, NULL, 1),
(25, 4, 1464303600, NULL, 80000, NULL, 19200, NULL, 0, NULL, NULL, 1),
(26, 4, 1466982000, NULL, 80000, NULL, 16800, NULL, 0, NULL, NULL, 1),
(27, 4, 1469660400, NULL, 80000, NULL, 14400, NULL, 0, NULL, NULL, 1),
(28, 4, 1472338800, NULL, 80000, NULL, 12000, NULL, 0, NULL, NULL, 1),
(29, 4, 1475017200, NULL, 80000, NULL, 9600, NULL, 0, NULL, NULL, 1),
(30, 4, 1477695600, NULL, 80000, NULL, 7200, NULL, 0, NULL, NULL, 1),
(31, 4, 1480374000, NULL, 80000, NULL, 4800, NULL, 0, NULL, NULL, 1),
(32, 4, 1483052400, NULL, 80000, NULL, 2400, NULL, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savbalance`
--

CREATE TABLE IF NOT EXISTS `savbalance` (
`savbal_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `savbal_balance` int(11) NOT NULL,
  `savbal_date` int(11) NOT NULL,
  `savbal_created` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `savbalance`
--

INSERT INTO `savbalance` (`savbal_id`, `cust_id`, `savbal_balance`, `savbal_date`, `savbal_created`, `user_id`) VALUES
(1, 1, 19000, 1453762800, 1457027075, 1),
(2, 2, 190400, 1420070400, 1457027075, 1),
(3, 3, 18000, 1469484000, 1457027075, 1),
(4, 4, 38500, 1456527600, 1457027075, 1),
(5, 5, 299700, 1455750000, 1457027075, 1),
(6, 6, 25700, 1420070400, 1457027075, 1),
(7, 7, 105900, 1420070400, 1457027075, 1),
(8, 8, 93000, 1456614000, 1457027075, 1),
(9, 9, 100000, 1423602000, 1457027075, 1),
(10, 10, 35000, 1456354800, 1457027075, 1),
(11, 11, 5276, 1420070400, 1457027075, 1),
(12, 12, 10000, 1435615200, 1457027075, 1),
(13, 13, 379700, 1420070400, 1457027075, 1),
(14, 14, 0, 1420070400, 1457027075, 1),
(15, 15, 80000, 1420070400, 1457027075, 1),
(16, 16, 30000, 1420070400, 1457027075, 1),
(17, 17, 0, 1420070400, 1457027075, 1),
(18, 18, 24033, 1420070400, 1457027075, 1),
(19, 19, 74000, 1420070400, 1457027075, 1),
(20, 20, 477000, 1456441200, 1457027075, 1),
(21, 21, 143300, 1420070400, 1457027075, 1),
(22, 22, 16200, 1420070400, 1457027075, 1),
(23, 23, 100000, 1420070400, 1457027075, 1),
(24, 24, 0, 1420070400, 1457027075, 1),
(25, 25, 10200, 1420070400, 1457027075, 1),
(26, 26, 62500, 1420070400, 1457027075, 1),
(27, 27, 5100, 1420070400, 1457027075, 1),
(28, 28, 1200, 1420070400, 1457027075, 1),
(29, 29, 36000, 1420070400, 1457027075, 1),
(30, 30, 0, 1420070400, 1457027075, 1),
(31, 31, 0, 1420070400, 1457027075, 1),
(32, 32, 2000, 1420070400, 1457027075, 1),
(33, 33, 65302, 1420070400, 1457027075, 1),
(34, 34, 0, 1420070400, 1457027075, 1),
(35, 35, 20000, 1420070400, 1457027075, 1),
(36, 36, 99800, 1420070400, 1457027075, 1),
(37, 37, 1500000, 1420070400, 1457027075, 1),
(38, 38, 4000, 1420070400, 1457027075, 1),
(39, 39, 293600, 1420070400, 1457027075, 1),
(40, 40, 0, 1420070400, 1457027075, 1),
(41, 41, 4000, 1420070400, 1457027075, 1),
(42, 42, 11200, 1420070400, 1457027075, 1),
(43, 43, 91800, 1420070400, 1457027075, 1),
(44, 44, 0, 1420070400, 1457027075, 1),
(45, 45, 100000, 1454972400, 1457027075, 1),
(46, 46, 20000, 1420070400, 1457027075, 1),
(47, 47, 0, 1420070400, 1457027075, 1),
(48, 48, 0, 1420070400, 1457027075, 1),
(49, 49, 25000, 1420070400, 1457027075, 1),
(50, 50, 22500, 1420070400, 1457027075, 1),
(51, 51, 85000, 1420070400, 1457027075, 1),
(52, 52, 263400, 1420070400, 1457027075, 1),
(53, 53, 20000, 1420070400, 1457027075, 1),
(54, 54, 0, 1420070400, 1457027075, 1),
(55, 55, 25800, 1420070400, 1457027075, 1),
(56, 56, 2029, 1420070400, 1457027075, 1),
(57, 57, 0, 1420070400, 1457027075, 1),
(58, 58, 30600, 1420070400, 1457027075, 1),
(59, 59, 90800, 1420070400, 1457027075, 1),
(60, 60, 10040000, 1420070400, 1457027075, 1),
(61, 61, 360700, 1420070400, 1457027075, 1),
(62, 62, 165900, 1420070400, 1457027075, 1),
(63, 63, 27500, 1420070400, 1457027075, 1),
(64, 64, 11500, 1420070400, 1457027075, 1),
(65, 65, 11400, 1420070400, 1457027075, 1),
(66, 66, 141400, 1420070400, 1457027075, 1),
(67, 67, 35000, 1453590000, 1457027075, 1),
(68, 68, 81400, 1420070400, 1457027075, 1),
(69, 69, 1400, 1420070400, 1457027075, 1),
(70, 70, 0, 1420070400, 1457027075, 1),
(71, 71, 0, 1420070400, 1457027075, 1),
(72, 72, 80000, 1420070400, 1457027075, 1),
(73, 73, 0, 1420070400, 1457027075, 1),
(74, 74, 25000, 1420070400, 1457027075, 1),
(75, 75, 0, 1420070400, 1457027075, 1),
(76, 76, 600, 1420070400, 1457027075, 1),
(77, 77, 471000, 1420070400, 1457027075, 1),
(78, 78, 169000, 1420070400, 1457027075, 1),
(79, 79, 60000, 1420070400, 1457027075, 1),
(80, 80, 79000, 1420070400, 1457027075, 1),
(81, 81, 10200, 1420070400, 1457027075, 1),
(82, 82, 0, 1420070400, 1457027075, 1),
(83, 83, 0, 1420070400, 1457027075, 1),
(84, 84, 51000, 1420070400, 1457027075, 1),
(85, 85, 51000, 1420070400, 1457027075, 1),
(86, 86, 199300, 1420070400, 1457027075, 1),
(87, 87, 0, 1420070400, 1457027075, 1),
(88, 88, 0, 1420070400, 1457027075, 1),
(89, 89, 100000, 1420070400, 1457027075, 1),
(90, 90, 0, 1420070400, 1457027075, 1),
(91, 91, 99876, 1420070400, 1457027075, 1),
(92, 92, 375000, 1420070400, 1457027075, 1),
(93, 93, 10000, 1420070400, 1457027075, 1),
(94, 94, 400000, 1420070400, 1457027075, 1),
(95, 95, 86080, 1420070400, 1457027075, 1),
(96, 96, 184, 1420070400, 1457027075, 1),
(97, 97, 377800, 1420070400, 1457027075, 1),
(98, 98, 28000, 1420070400, 1457027075, 1),
(99, 99, 62, 1420070400, 1457027075, 1),
(100, 100, 49000, 1454281200, 1457027075, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savings`
--

CREATE TABLE IF NOT EXISTS `savings` (
`sav_id` int(11) NOT NULL,
  `savtype_id` int(11) NOT NULL,
  `sav_mother` int(11) DEFAULT NULL,
  `cust_id` int(11) NOT NULL,
  `ltrans_id` int(11) DEFAULT NULL,
  `sav_date` int(15) NOT NULL,
  `sav_amount` int(15) NOT NULL DEFAULT '0',
  `sav_receipt` int(11) DEFAULT NULL,
  `sav_slip` int(10) NOT NULL,
  `sav_created` int(15) DEFAULT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `savings`
--

INSERT INTO `savings` (`sav_id`, `savtype_id`, `sav_mother`, `cust_id`, `ltrans_id`, `sav_date`, `sav_amount`, `sav_receipt`, `sav_slip`, `sav_created`, `user_id`) VALUES
(1, 1, NULL, 1, NULL, 1420070400, 30000, 610, 0, NULL, 1),
(2, 1, NULL, 2, NULL, 1420070400, 190400, 0, 0, NULL, 1),
(3, 1, NULL, 3, NULL, 1420070400, 4000, 0, 0, NULL, 1),
(4, 1, NULL, 4, NULL, 1420070400, 123183, 0, 0, NULL, 1),
(5, 1, NULL, 5, NULL, 1420070400, 25700, 0, 0, NULL, 1),
(6, 1, NULL, 6, NULL, 1420070400, 25700, 0, 0, NULL, 1),
(7, 1, NULL, 7, NULL, 1420070400, 105900, 0, 0, NULL, 1),
(8, 1, NULL, 8, NULL, 1420070400, 98000, 0, 0, NULL, 1),
(9, 1, NULL, 9, NULL, 1420070400, 550000, 0, 0, NULL, 1),
(10, 1, NULL, 10, NULL, 1420070400, 0, 0, 0, NULL, 1),
(11, 1, NULL, 11, NULL, 1420070400, 5276, 0, 0, NULL, 1),
(12, 1, NULL, 12, NULL, 1420070400, 20000, 0, 0, NULL, 1),
(13, 1, NULL, 13, NULL, 1420070400, 379700, 0, 0, NULL, 1),
(14, 1, NULL, 14, NULL, 1420070400, 0, 0, 0, NULL, 1),
(16, 1, NULL, 16, NULL, 1420070400, 30000, 0, 0, NULL, 1),
(17, 1, NULL, 17, NULL, 1420070400, 0, 0, 0, NULL, 1),
(18, 1, NULL, 18, NULL, 1420070400, 24033, 0, 0, NULL, 1),
(19, 1, NULL, 19, NULL, 1420070400, 74000, 0, 0, NULL, 1),
(20, 1, NULL, 20, NULL, 1420070400, 26500, 0, 0, NULL, 1),
(21, 1, NULL, 21, NULL, 1420070400, 143300, 0, 0, NULL, 1),
(22, 1, NULL, 22, NULL, 1420070400, 16200, 0, 0, NULL, 1),
(23, 1, NULL, 23, NULL, 1420070400, 100000, 0, 0, NULL, 1),
(24, 1, NULL, 24, NULL, 1420070400, 0, 0, 0, NULL, 1),
(25, 1, NULL, 25, NULL, 1420070400, 10200, 0, 0, NULL, 1),
(26, 1, NULL, 26, NULL, 1420070400, 62500, 0, 0, NULL, 1),
(27, 1, NULL, 27, NULL, 1420070400, 5100, 0, 0, NULL, 1),
(28, 1, NULL, 28, NULL, 1420070400, 1200, 0, 0, NULL, 1),
(29, 1, NULL, 29, NULL, 1420070400, 36000, 0, 0, NULL, 1),
(30, 1, NULL, 30, NULL, 1420070400, 0, 0, 0, NULL, 1),
(31, 1, NULL, 31, NULL, 1420070400, 0, 0, 0, NULL, 1),
(32, 1, NULL, 32, NULL, 1420070400, 2000, 0, 0, NULL, 1),
(33, 1, NULL, 33, NULL, 1420070400, 65302, 0, 0, NULL, 1),
(34, 1, NULL, 34, NULL, 1420070400, 0, 0, 0, NULL, 1),
(35, 1, NULL, 35, NULL, 1420070400, 20000, 0, 0, NULL, 1),
(36, 1, NULL, 36, NULL, 1420070400, 99800, 0, 0, NULL, 1),
(37, 1, NULL, 37, NULL, 1420070400, 1500000, 0, 0, NULL, 1),
(38, 1, NULL, 38, NULL, 1420070400, 4000, 0, 0, NULL, 1),
(39, 1, NULL, 39, NULL, 1420070400, 293600, 0, 0, NULL, 1),
(40, 1, NULL, 40, NULL, 1420070400, 0, 0, 0, NULL, 1),
(41, 1, NULL, 41, NULL, 1420070400, 4000, 0, 0, NULL, 1),
(42, 1, NULL, 42, NULL, 1420070400, 11200, 0, 0, NULL, 1),
(43, 1, NULL, 43, NULL, 1420070400, 91800, 0, 0, NULL, 1),
(44, 1, NULL, 44, NULL, 1420070400, 0, 0, 0, NULL, 1),
(45, 1, NULL, 45, NULL, 1420070400, 90800, 0, 0, NULL, 1),
(46, 1, NULL, 46, NULL, 1420070400, 20000, 0, 0, NULL, 1),
(47, 1, NULL, 47, NULL, 1420070400, 0, 0, 0, NULL, 1),
(48, 1, NULL, 48, NULL, 1420070400, 0, 0, 0, NULL, 1),
(49, 1, NULL, 49, NULL, 1420070400, 25000, 0, 0, NULL, 1),
(50, 1, NULL, 50, NULL, 1420070400, 22500, 0, 0, NULL, 1),
(51, 1, NULL, 51, NULL, 1420070400, 85000, 0, 0, NULL, 1),
(52, 1, NULL, 52, NULL, 1420070400, 263400, 0, 0, NULL, 1),
(53, 1, NULL, 53, NULL, 1420070400, 20000, 0, 0, NULL, 1),
(54, 1, NULL, 54, NULL, 1420070400, 0, 0, 0, NULL, 1),
(55, 1, NULL, 55, NULL, 1420070400, 25800, 0, 0, NULL, 1),
(56, 1, NULL, 56, NULL, 1420070400, 2029, 0, 0, NULL, 1),
(57, 1, NULL, 57, NULL, 1420070400, 0, 0, 0, NULL, 1),
(58, 1, NULL, 58, NULL, 1420070400, 30600, 0, 0, NULL, 1),
(59, 1, NULL, 59, NULL, 1420070400, 90800, 0, 0, NULL, 1),
(60, 1, NULL, 60, NULL, 1420070400, 10040000, 0, 0, NULL, 1),
(61, 1, NULL, 61, NULL, 1420070400, 360700, 0, 0, NULL, 1),
(62, 1, NULL, 62, NULL, 1420070400, 165900, 0, 0, NULL, 1),
(63, 1, NULL, 63, NULL, 1420070400, 27500, 0, 0, NULL, 1),
(64, 1, NULL, 64, NULL, 1420070400, 11500, 0, 0, NULL, 1),
(65, 1, NULL, 65, NULL, 1420070400, 11400, 0, 0, NULL, 1),
(66, 1, NULL, 66, NULL, 1420070400, 141400, 0, 0, NULL, 1),
(67, 1, NULL, 68, NULL, 1420070400, 81400, 0, 0, NULL, 1),
(68, 1, NULL, 69, NULL, 1420070400, 1400, 0, 0, NULL, 1),
(69, 1, NULL, 70, NULL, 1420070400, 0, 0, 0, NULL, 1),
(70, 1, NULL, 71, NULL, 1420070400, 0, 0, 0, NULL, 1),
(71, 1, NULL, 72, NULL, 1420070400, 80000, 0, 0, NULL, 1),
(72, 1, NULL, 73, NULL, 1420070400, 0, 0, 0, NULL, 1),
(73, 1, NULL, 74, NULL, 1420070400, 25000, 0, 0, NULL, 1),
(74, 1, NULL, 75, NULL, 1420070400, 0, 0, 0, NULL, 1),
(75, 1, NULL, 76, NULL, 1420070400, 600, 0, 0, NULL, 1),
(76, 1, NULL, 77, NULL, 1420070400, 471000, 0, 0, NULL, 1),
(77, 1, NULL, 78, NULL, 1420070400, 169000, 0, 0, NULL, 1),
(78, 1, NULL, 79, NULL, 1420070400, 60000, 0, 0, NULL, 1),
(79, 1, NULL, 80, NULL, 1420070400, 79000, 0, 0, NULL, 1),
(80, 1, NULL, 81, NULL, 1420070400, 10200, 0, 0, NULL, 1),
(81, 1, NULL, 82, NULL, 1420070400, 0, 0, 0, NULL, 1),
(82, 1, NULL, 83, NULL, 1420070400, 0, 0, 0, NULL, 1),
(83, 1, NULL, 84, NULL, 1420070400, 51000, 0, 0, NULL, 1),
(84, 1, NULL, 85, NULL, 1420070400, 51000, 0, 0, NULL, 1),
(85, 1, NULL, 86, NULL, 1420070400, 199300, 0, 0, NULL, 1),
(86, 1, NULL, 87, NULL, 1420070400, 0, 0, 0, NULL, 1),
(87, 1, NULL, 88, NULL, 1420070400, 0, 0, 0, NULL, 1),
(88, 1, NULL, 89, NULL, 1420070400, 100000, 0, 0, NULL, 1),
(89, 1, NULL, 90, NULL, 1420070400, 0, 0, 0, NULL, 1),
(90, 1, NULL, 91, NULL, 1420070400, 99876, 0, 0, NULL, 1),
(91, 1, NULL, 92, NULL, 1420070400, 375000, 0, 0, NULL, 1),
(92, 1, NULL, 93, NULL, 1420070400, 10000, 0, 0, NULL, 1),
(93, 1, NULL, 94, NULL, 1420070400, 400000, 0, 0, NULL, 1),
(94, 1, NULL, 95, NULL, 1420070400, 86080, 0, 0, NULL, 1),
(95, 1, NULL, 96, NULL, 1420070400, 184, 0, 0, NULL, 1),
(96, 1, NULL, 97, NULL, 1420070400, 377800, 0, 0, NULL, 1),
(97, 1, NULL, 98, NULL, 1420070400, 28000, 0, 0, NULL, 1),
(98, 1, NULL, 99, NULL, 1420070400, 62, 0, 0, NULL, 1),
(99, 1, NULL, 100, NULL, 1420070400, 550000, 0, 0, NULL, 1),
(200, 2, NULL, 9, NULL, 1423602000, -450000, 682, 0, NULL, 1),
(201, 1, NULL, 1, NULL, 1435183200, 25000, 509, 0, 1453118311, 1),
(202, 2, NULL, 1, NULL, 1453158000, -26000, 1281, 603, 1453207255, 2),
(203, 4, NULL, 1, NULL, 1453158000, -1000, 1281, 603, 1453207255, 2),
(204, 2, NULL, 1, NULL, 1453762800, -8000, 5678, 1234, 1453793443, 1),
(205, 4, NULL, 1, NULL, 1453762800, -1000, 5678, 1234, 1453793443, 1),
(206, 1, NULL, 3, NULL, 1469484000, 14000, 7, 0, 1453795583, 1),
(207, 2, NULL, 100, NULL, 1454281200, -500000, 5678, 1234, 1454329440, 1),
(208, 4, NULL, 100, NULL, 1454281200, -1000, 5678, 1234, 1454329440, 1),
(210, 1, NULL, 45, NULL, 1454972400, 465, 9200, 0, 1455010623, 1),
(211, 1, NULL, 45, NULL, 1454972400, 8000, 845, 0, 1455010641, 1),
(212, 1, NULL, 45, NULL, 1454972400, 735, 4564, 0, 1455010657, 1),
(214, 2, NULL, 4, NULL, 1423436400, -82183, 548, 54561, 1455024777, 1),
(215, 2, NULL, 5, NULL, 1448924400, -15000, 659, 13, 1455025157, 1),
(216, 2, NULL, 12, NULL, 1435615200, -10000, 884, 466, 1455025453, 1),
(397, 1, NULL, 10, NULL, 1456268400, 20000, 1323, 0, 1456314395, 1),
(398, 1, NULL, 10, NULL, 1456354800, 15000, 1324, 0, 1456314409, 1),
(408, 5, NULL, 8, NULL, 1456614000, -5000, 1234, 0, 1456319256, 1),
(409, 1, NULL, 67, NULL, 1453590000, 35000, 350, 0, 1456320996, 1),
(416, 1, NULL, 5, NULL, 1455750000, 289000, 153, 0, 1456487741, 1),
(419, 1, NULL, 20, NULL, 1456441200, 450500, 126, 0, 1456491436, 1),
(420, 1, NULL, 4, NULL, 1453244400, 9000, 999, 0, 1456572212, 1),
(421, 1, NULL, 4, NULL, 1422745200, 10000, 111, 0, 1456572245, 1),
(422, 1, NULL, 4, NULL, 1455663600, 7500, 123, 0, 1456575001, 1),
(429, 2, NULL, 4, NULL, 1456527600, -28000, 151, 848, 1456576375, 2),
(430, 4, 429, 4, NULL, 1456527600, -1000, 151, 848, 1456576375, 2),
(445, 1, NULL, 1, NULL, 1457046000, 6000, 5153, 0, 1457081348, 1),
(446, 1, NULL, 1, NULL, 1457046000, 7000, 813, 0, 1457081566, 1),
(447, 2, NULL, 1, NULL, 1456959600, -12000, 1236, 991, 1457081678, 1),
(448, 4, 447, 1, NULL, 1456959600, -1000, 1236, 991, 1457081678, 1),
(449, 1, NULL, 15, NULL, 1456614000, 99000, 1613, 0, 1457081752, 1),
(450, 2, NULL, 15, NULL, 1457046000, -18000, 1563, 516, 1457081766, 1),
(451, 4, 450, 15, NULL, 1457046000, -1000, 1563, 516, 1457081766, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savtype`
--

CREATE TABLE IF NOT EXISTS `savtype` (
`savtype_id` int(11) NOT NULL,
  `savtype_type` varchar(20) NOT NULL,
  `savtype_short` varchar(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

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
(1, 100, 1, '1', '', 0, 'uploads/securities/L-100-2_Security-01.jpg', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
`set_id` int(11) NOT NULL,
  `set_name` varchar(100) NOT NULL,
  `set_short` varchar(8) NOT NULL,
  `set_value` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `settings`
--

INSERT INTO `settings` (`set_id`, `set_name`, `set_short`, `set_value`) VALUES
(1, 'Minimum Savings Balance', 'SET_MSB', '10000'),
(2, 'Minimum Loan Principal', 'SET_MLP', '500000'),
(3, 'Maximum Loan Principal', 'SET_XLP', '10000000'),
(4, 'Currency Abbreviation', 'SET_CUR', 'UGX'),
(5, 'Auto-fine Defaulters', 'SET_AUF', ''),
(6, 'Account Deactivation', 'SET_DEA', ''),
(7, 'Dashboard Left', 'SET_DBL', 'dashboard/dash_subscr.php'),
(8, 'Dashboard Right', 'SET_DBR', 'dashboard/dash_loandefaults.php'),
(9, 'Interest Calculation', 'SET_ICL', 'modules/mod_inter_fixed.php'),
(10, 'Guarantor Limit', 'SET_GUA', '3'),
(11, 'Minimum Membership', 'SET_MEM', '6'),
(12, 'Maximum Principal-Savings Ratio', 'SET_PSR', '500');

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
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;

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
(224, 4, 1454713200, -1, -20000, 1020, 0, NULL, 1454663138, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shareval`
--

CREATE TABLE IF NOT EXISTS `shareval` (
`shareval_id` int(11) NOT NULL,
  `shareval_date` int(11) NOT NULL,
  `shareval_value` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `ugroup` (
`ugroup_id` int(11) NOT NULL,
  `ugroup_name` varchar(100) NOT NULL,
  `ugroup_admin` int(11) NOT NULL,
  `ugroup_delete` int(2) NOT NULL,
  `ugroup_report` int(11) NOT NULL,
  `ugroup_created` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ugroup`
--

INSERT INTO `ugroup` (`ugroup_id`, `ugroup_name`, `ugroup_admin`, `ugroup_delete`, `ugroup_report`, `ugroup_created`) VALUES
(1, 'Administrator', 1, 1, 1, 1453123220),
(2, 'Management', 0, 1, 1, 1453144125),
(3, 'Employee', 0, 1, 0, 1453125729),
(4, 'Ext-Admin', 1, 0, 0, 1453123276);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_pw` varchar(255) NOT NULL,
  `ugroup_id` int(11) NOT NULL,
  `empl_id` int(11) NOT NULL,
  `user_created` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_pw`, `ugroup_id`, `empl_id`, `user_created`) VALUES
(0, '', '', 0, 0, 0),
(1, 'admin', '$2y$10$nFgCoIxOQgYDVcDHBVdUnOOD4jjaeNMCAkhlF9kpSl1iJuEuGOr2C', 1, 1, 1455784732),
(2, 'ext-admin', '$2y$10$wyLD0aCQtjBxv1AGC6U3XObVQTJcieD/Ghv7Cj5cyrBAeGVtkRxv2', 4, 10, 1457428312),
(3, 'John Doe', '$2y$10$X12Q6IjsvOOgdQz/bHR9u.DXAGDW1.lIWceZRr1M4rdKizmGiE3se', 2, 4, 1457441127);

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
MODIFY `custmarried_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT für Tabelle `custsex`
--
ALTER TABLE `custsex`
MODIFY `custsex_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `custsick`
--
ALTER TABLE `custsick`
MODIFY `custsick_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `emplmarried`
--
ALTER TABLE `emplmarried`
MODIFY `emplmarried_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
MODIFY `empl_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT für Tabelle `emplsex`
--
ALTER TABLE `emplsex`
MODIFY `emplsex_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `expenses`
--
ALTER TABLE `expenses`
MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `exptype`
--
ALTER TABLE `exptype`
MODIFY `exptype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT für Tabelle `fees`
--
ALTER TABLE `fees`
MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `incomes`
--
ALTER TABLE `incomes`
MODIFY `inc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT für Tabelle `inctype`
--
ALTER TABLE `inctype`
MODIFY `inctype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `loans`
--
ALTER TABLE `loans`
MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `loanstatus`
--
ALTER TABLE `loanstatus`
MODIFY `loanstatus_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `logrec`
--
ALTER TABLE `logrec`
MODIFY `logrec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `ltrans`
--
ALTER TABLE `ltrans`
MODIFY `ltrans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT für Tabelle `savbalance`
--
ALTER TABLE `savbalance`
MODIFY `savbal_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT für Tabelle `savings`
--
ALTER TABLE `savings`
MODIFY `sav_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=452;
--
-- AUTO_INCREMENT für Tabelle `savtype`
--
ALTER TABLE `savtype`
MODIFY `savtype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `securities`
--
ALTER TABLE `securities`
MODIFY `sec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `settings`
--
ALTER TABLE `settings`
MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT für Tabelle `shares`
--
ALTER TABLE `shares`
MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=225;
--
-- AUTO_INCREMENT für Tabelle `shareval`
--
ALTER TABLE `shareval`
MODIFY `shareval_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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