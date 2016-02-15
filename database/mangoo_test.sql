-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Feb 2016 um 10:52
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `custmarried`
--

INSERT INTO `custmarried` (`custmarried_id`, `custmarried_status`) VALUES
(0, 'N/A'),
(1, 'Single'),
(2, 'Married'),
(3, 'Widowed');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
`cust_id` int(11) NOT NULL,
  `cust_no` varchar(20) DEFAULT NULL,
  `cust_name` varchar(75) DEFAULT NULL,
  `cust_dob` int(15) DEFAULT NULL,
  `custsex_id` int(1) DEFAULT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  `cust_phone` varchar(50) DEFAULT NULL,
  `cust_email` varchar(50) DEFAULT NULL,
  `cust_occup` varchar(50) DEFAULT NULL,
  `custmarried_id` int(5) DEFAULT NULL,
  `cust_heir` varchar(50) DEFAULT NULL,
  `cust_heirrel` varchar(25) DEFAULT NULL,
  `cust_lengthres` int(11) DEFAULT NULL,
  `cust_since` int(15) DEFAULT NULL,
  `custsick_id` int(8) DEFAULT NULL,
  `cust_lastsub` int(15) DEFAULT NULL,
  `cust_active` int(1) DEFAULT NULL,
  `cust_lastupd` int(11) DEFAULT NULL,
  `cust_pic` varchar(100) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_no`, `cust_name`, `cust_dob`, `custsex_id`, `cust_address`, `cust_phone`, `cust_email`, `cust_occup`, `custmarried_id`, `cust_heir`, `cust_heirrel`, `cust_lengthres`, `cust_since`, `custsick_id`, `cust_lastsub`, `cust_active`, `cust_lastupd`, `cust_pic`, `user_id`) VALUES
(0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, '001/2006', 'Martin Luther', 437266800, 1, 'Wittenberg', '+49 3491 10111483', '', 'Reformer', 2, 'Katharina Luther', 'Wife', NULL, 1157580000, 1, 1456190000, 1, 1454670777, 'uploads/photos/cust1_146x190.jpg', 1),
(2, '002/2006', 'Jan Hus', 78793200, 1, 'Prague', '+420 1071372', '', 'Reformer', 2, 'Joh. Joseph Hu&szlig;', 'Father', NULL, 1159401600, 0, 1424398400, 1, 1454670766, 'uploads/photos/cust2_146x190.jpg', 1),
(3, '003/2006', 'Jean Calvin', -256006800, 1, 'Geneva', '0760-548193', 'j.calvin@reformed.org', 'Reformer', 2, 'Marie Calvin', 'Wife', NULL, 1157587200, 0, 1458090800, 1, 1454670786, 'uploads/photos/cust3_146x190.jpg', 1),
(4, '004/2006', 'Huldrych Zwingli', -505702800, 1, 'Zurich', '+44 121 548621', '', 'Reformer', 2, '', '', NULL, 1159747200, 0, 1458954800, 1, 1454670791, 'uploads/photos/cust4_146x190.jpg', 1),
(5, '005/2006', 'Heinrich Bullinger', -5706000, 1, 'Zurich', '0854 12135', '', 'Reformer', 2, '', '', NULL, 1158710400, 0, 1426990400, 1, 1454670800, NULL, 1),
(6, '006/2006', 'Ila Kimble  ', -362106000, 4, 'Luwero Diocese', '0772-349669', '', 'Clergy Man', 2, 'Kimble Morgan', 'Brother', NULL, 1161820800, 1, 1460682800, 1, 1454655588, NULL, 1),
(7, '007/2006', 'Lesha Detweiler  ', -7200, 1, 'Ndejje', '0782-453096', '', 'Clergy', 2, '', '', NULL, 1156377600, 0, 1428718400, 1, 1420070400, NULL, 1),
(8, '008/2006', 'Elisabeth Nalongo', 252543600, 2, 'Nakasongola', '0897 456163', '', '', 3, '', '', NULL, 1157587200, 0, 1421621995, 1, 1453822502, NULL, 1),
(9, '009/2006', 'Aura Trim  ', -456976800, 1, 'Luteete Arch', '0782-347980', '', 'Pastor', 2, '', '', NULL, 1156377600, 0, 1430446400, 1, 1420070400, NULL, 1),
(10, '010/2006', 'Marci Fleming  ', -285210000, 1, 'Bukalabi Mpwede Kasangombe', '0785 451321', '', 'Pastor', 2, '', '', NULL, 1157580000, 0, 1431310400, 1, 1452785891, NULL, 1),
(11, '011/2006', 'Nydius Melvinus', -341802000, 3, 'Kiziba Kikyusa Archdeaconry', '0772-968414', 'huxpoll@yahoo.com', 'Preacher', 2, 'Mrs. Luna Mwamiza', 'Wife', NULL, 1157932800, 1, 1402174400, 0, 1454656213, NULL, 1),
(12, '012/2006', 'Joshua Vandenburg  ', -552448800, 1, 'Kiziba Kikyusa Arch', '0772-551662', '', 'Clergy Man', 2, '', '', NULL, 1157587200, 0, 1433038400, 1, 1420070400, NULL, 1),
(13, '013/2006', 'Melania Mitchem  ', 158364000, 1, 'Kalere', '0782-380513', '', 'Clergy', 1, '', '', NULL, 1158796800, 0, 1413902400, 0, 1420070400, NULL, 1),
(14, '014/2006', 'Clemmie Ellithorpe  ', -929930400, 1, 'Kazinga Butuntumula', NULL, '', 'Clergy Man', 2, '', '', NULL, 1157580000, 0, 1434766400, 0, 1427241600, NULL, 3),
(15, '015/2006', 'Kristofer Artis  ', -90000, 1, 'Kisenyi', '0', '', '', 0, '', '', NULL, 1157580000, 0, 1435630400, 1, 1452688368, NULL, 1),
(16, '016/2007', 'Lulu Obando  ', -440906400, 1, 'Sempa Parish ', '0782-096008', '', 'Clergy Man', 2, '', '', NULL, 1167782400, 0, 1436424400, 1, 1420070400, NULL, 1),
(17, '017/2006', 'Kai Soriano  ', -86403600, 1, 'Luteete', '02314 549945', '', 'Pastor / Teacher', 2, '', '', NULL, 1157580000, 0, 1437358400, 1, 1453822238, NULL, 1),
(18, '018/2006', 'Lynne Pratico  ', 160182000, 1, 'Bwaziba', '0891 128461', '', 'Clergy / Farmer', 2, '', '', NULL, 1158019200, 0, 1418222400, 0, 1453145549, NULL, 1),
(19, '019/2006', 'Noella Holyfield  ', -633578400, 1, 'Kasana -Kiwogozi', '0772-984673', '', 'Clergy Man', 2, '', '', NULL, 1157587200, 0, 1439086400, 1, 1420070400, NULL, 1),
(20, '020/2006', 'Berry Steve  ', -256525200, 1, 'Bombo', '0782-453477', '', 'Clergy Man', 2, '', '', NULL, 1157932800, 0, 1439950400, 1, 1427241600, NULL, 5),
(21, '021/2006', 'Gregorio Schurr  ', -479527200, 1, 'Kasiso', '0772-532964', '', 'Clergy Man', 2, '', '', NULL, 1156377600, 0, 1440814400, 1, 1420070400, NULL, 1),
(22, '022/2006', 'Arnetta Lobato  ', -744170400, 2, 'Bakijulura', '0785 368641', '', 'Retired', 3, '', '', NULL, 1157932800, 1, 1401678400, 1, 1454572704, NULL, 1),
(23, '023/2006', 'Ayana Mohammed  ', -368762400, 1, 'St. Mark Luweero', '0772-183125', '', 'Clergy Man', 2, '', '', NULL, 1157587200, 0, 1442542400, 1, 1420070400, NULL, 1),
(24, '024/2006', 'Conrad Keitt  ', -748404000, 1, 'Namusale', NULL, '', 'Clergy Man', 2, '', '', NULL, 1160006400, 0, 1443406400, 1, 1420070400, NULL, 1),
(25, '025/2006', 'Stephine Leitner  ', -559792800, 1, 'Buwana', '0773142217', '', 'Clergy Man', 2, '', '', NULL, 1158019200, 0, 1444270400, 1, 1420070400, NULL, 1),
(26, '026/2007', 'Tequila Lino  ', -597549600, 1, 'Sekamuli Area', '0782-880521', '', 'Clergy Man', 2, '', '', NULL, 1195516800, 0, 1445134400, 1, 1420070400, NULL, 1),
(27, '027/2007', 'Deena Hawes  ', -932349600, 1, 'Zirobwe', NULL, '', 'Clergy Man', 2, '', '', NULL, 1190160000, 0, 1445998400, 1, 1420070400, NULL, 1),
(28, '028/2006', 'Kellye Whitley  ', -363924000, 1, 'Lukomera', '0779-253864', '', 'Clergy Man / Teacher', 2, '', '', NULL, 1166572800, 0, 1446862400, 1, 1420070400, NULL, 1),
(29, '029/2007', 'Judi Spillman  ', -573703200, 1, 'Balitta- Lwogi', '0782-559766', '', 'Clergy Man', 2, '', '', NULL, 1189468800, 0, 1447726400, 1, 1420070400, NULL, 1),
(30, '030/2006', 'Lion of Juda Secondary School', -3600, 6, 'Luweero', '0251-1213159', '', '', 0, 'Dr. Raul Philips', 'Headmaster', NULL, 1159394400, 0, 1448590400, 1, 1454954625, NULL, 1),
(31, '031/2006', 'Robena Burget  ', -90000, 5, 'Kasana', '02589 452103', '', 'Clergy Man', 2, '', '', NULL, 1159394400, 0, 1449454400, 0, 1454655778, NULL, 1),
(32, '032/2006', 'Milda Mcamis  ', -427860000, 1, 'Bweyeeyo-Luweero', NULL, '', 'Clergy Man', 2, '', '', NULL, 1159401600, 0, 1450318400, 1, 1420070400, NULL, 1),
(33, '033/2006', 'Alec Kearl  ', -336794400, 1, 'Nakaseke', '0773-974456', '', 'Pastor / Teacher', 2, '', '', NULL, 1158019200, 0, 1451182400, 1, 1427241600, NULL, 3),
(34, '034/2006', 'Ngoc Alcantar  ', -185335200, 1, 'Kasana Kvule-Luweero', NULL, '', 'Clergy Man', 2, '', '', NULL, 1157932800, 0, 1452046400, 1, 1420070400, NULL, 1),
(35, '035/2006', 'Sharen Harr  ', -33271200, 2, 'Luweero Town Council', '0772-442574', '', 'Accounts Clerk', 2, '', '', NULL, 1156896000, 0, 1452910400, 1, 1420070400, NULL, 1),
(36, '036/2006', 'Kryshtam Rebem  ', -320115600, 2, 'Kungu-Busula', '09125 - 54138', '', '', 2, '', '', NULL, 1158796800, 0, 1453774400, 1, 1454959237, NULL, 1),
(37, '037/2006', 'Ronni Knoles  ', -213069600, 1, 'Kungu-Busula', '0772-365951', '', 'Social Worker', 2, '', '', NULL, 1156723200, 0, 1454638400, 1, 1420070400, NULL, 1),
(38, '038/2006', 'Ela Denmark  ', 401230800, 2, 'Kungu-Busula', NULL, '', 'Counsellor / Volunteer', 1, '', '', NULL, 1157241600, 0, 1455502400, 1, 1420070400, NULL, 1),
(39, '039/2006', 'Grace Hamer  ', 55717200, 1, 'Busula', '0701-855942', '', 'Road Supervisor', 1, '', '', NULL, 1157328000, 0, 1456366400, 1, 1420070400, NULL, 1),
(40, '040/2006', 'Emma Bermea  ', -340855200, 2, 'Wobulenzi', NULL, '', 'Teacher', 2, '', '', NULL, 1157328000, 0, 1457230400, 1, 1420070400, NULL, 1),
(41, '041/2006', 'Rosana Breit  ', 534549600, 1, 'Busula', NULL, '', 'Student', 1, '', '', NULL, 1166659200, 0, 1458094400, 1, 1420070400, NULL, 1),
(42, '042/2006', 'Evelynn Mickles  ', 292543200, 2, 'Kungu-Busula', NULL, '', 'Trader - Retail', 2, '', '', NULL, 1157328000, 0, 1458958400, 1, 1420070400, NULL, 1),
(43, '043/2006', 'Tonie Maroney  ', 141858000, 2, 'Bendegere Namusaale', NULL, '', 'Customer Care Manager', 2, '', '', NULL, 1156550400, 0, 1459822400, 1, 1420070400, NULL, 1),
(44, '044/2006', 'Fallon Rosendahl  ', -46231200, 1, 'Buwana Kinyogoga', NULL, '', 'Clergy Man', 2, '', '', NULL, 1158789600, 0, 1460686400, 0, 1427241600, NULL, 3),
(45, '045/2006', 'Renato Loudon  ', -361072800, 1, 'Kaswa- Busula', '0774-764113', '', 'Lay-Reader', 2, '', '', NULL, 1157500800, 0, 1461550400, 1, 1420070400, NULL, 1),
(46, '046/2006', 'Garth Swartwood  ', -184298400, 2, 'Kikoma C/U Wobulenzi Tc', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1157846400, 0, 1462414400, 1, 1420070400, NULL, 1),
(47, '047/2006', 'Joannie Gust  ', 75589200, 2, 'Kikoma Wobulenzi', NULL, '', 'Peasant - Farmer', 2, '', '', NULL, 1157846400, 0, 1463278400, 1, 1420070400, NULL, 1),
(48, '048/2006', 'Fermina Collazo  ', -240890400, 2, 'Kikona Wobulenzi Central', NULL, '', 'Peasant / Farmer', 2, '', '', NULL, 1157932800, 0, 1464142400, 1, 1420070400, NULL, 1),
(49, '049/2006', 'Lavenia Byler  ', -252468000, 1, 'Kayindu C/U', '0785-772868', '', 'Lay-Reader', 2, '', '', NULL, 1157500800, 0, 1465006400, 1, 1420070400, NULL, 1),
(50, '050/2006', 'Willetta Moreau  ', 167522400, 1, 'Katuugo Parish', '0782-447156', '', 'Lay-Reader / Tailor', 2, '', '', NULL, 1157414400, 0, 1465870400, 1, 1420070400, NULL, 1),
(51, '051/2008', 'Alicia Wehner  ', -207453600, 2, 'Waluleeta Makulubita', '0782-461460', '', 'Trainer / Social Worker', 2, '', '', NULL, 1199664000, 0, 1466734400, 1, 1420070400, NULL, 1),
(52, '052/2006', 'Ocie Edds  ', -605412000, 1, 'Administrator Luweero Diocese', NULL, '', 'Diocesan Bishop', 2, '', '', NULL, 1158796800, 0, 1467598400, 1, 1420070400, NULL, 1),
(53, '053/2006', 'Darcy Read  ', 309736800, 2, 'Luwero TC', NULL, '', 'Secretary', 1, '', '', NULL, 1158796800, 0, 1468462400, 1, 1420070400, NULL, 1),
(54, '054/2006', 'Augustina Shuman  ', -244605600, 2, 'Kaswa- Busula', NULL, '', 'Lay-Reader', 1, '', '', NULL, 1157846400, 0, 1469326400, 1, 1420070400, NULL, 1),
(55, '055/2009', 'Catherine Adler  ', -3600, 3, 'Luweero Diocese', '0785 368641', '', '', 3, '', '', NULL, 1242086400, 3, 1470190400, 1, 1454572218, NULL, 1),
(56, '056/2007', 'Shanae Bello  ', 77144400, 2, 'Luweero Boys School', NULL, '', 'Teacher', 1, '', '', NULL, 1197936000, 0, 1471054400, 1, 1420070400, NULL, 1),
(57, '057/2006', 'Ferne Munson  ', -7200, 1, 'Bweyeyo', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1159826400, 0, 1471918400, 0, 1427241600, NULL, 3),
(58, '058/2006', 'Ja Nordby  ', -7200, 2, 'Kungu- Kikoma', NULL, '', 'Housewife', 2, '', '', NULL, 1166572800, 0, 1472782400, 1, 1420070400, NULL, 1),
(59, '059/2006', 'Illa Penaflor  ', -179632800, 2, 'Kiwogozi', '0772-662202', '', 'Teacher / MP', 0, '', '', NULL, 1166572800, 0, 1473646400, 1, 1420070400, NULL, 1),
(60, '060/2007', 'Annabelle Bradham  ', -455763600, 5, 'Kiwoko Arch', '0772-657419', '', 'Clergy Man', 2, '', '', NULL, 1167782400, 0, 1474510400, 1, 1454655767, NULL, 1),
(61, '061/2006', 'Tanner Wake  ', -539143200, 1, 'Bukalabi Parish', '0752-631706', '', 'Clergy Man', 2, '', '', NULL, 1157932800, 0, 1475374400, 1, 1420070400, NULL, 1),
(62, '062/2007', 'Cristobal Passman  ', -399088800, 2, 'Luteete Arch', NULL, '', 'Housewife', 2, '', '', NULL, 1168387200, 0, 1476238400, 1, 1420070400, NULL, 1),
(63, '063/2007', 'Rosita Pankratz  ', -394077600, 2, 'Ndejje Village', NULL, '', 'Peasant / Farmer', 2, '', '', NULL, 1168732800, 0, 1477102400, 1, 1420070400, NULL, 1),
(64, '064/2007', 'Angila Gauldin  ', 404949600, 2, 'Nalinya Lwantale Girls P/S', NULL, '', 'Teacher', 1, '', '', NULL, 1168732800, 0, 1477966400, 1, 1420070400, NULL, 1),
(65, '065/2007', 'Jerrica Darnell  ', 534981600, 1, 'Ndejje- Sambwe', NULL, '', 'Student', 1, '', '', NULL, 1168732800, 0, 1478830400, 1, 1420070400, NULL, 1),
(66, '066/2007', 'Paul Mushrush  ', 513554400, 2, 'Ndejje - Sambwe', NULL, '', '', 1, '', '', NULL, 1168732800, 0, 1479694400, 1, 1420070400, NULL, 1),
(67, '067/1970', 'Daren Konkol', -3600, 1, 'Entebbe', '0201 456316', 'konkol@yahoo.com', '', 2, '', '', NULL, 0, 0, 1322745195, 1, 1454605531, NULL, 1),
(68, '068/2007', 'Kristin Lippard  ', 967323600, 2, 'Ndejje- Sambwe', NULL, '', '', 1, '', '', NULL, 1169510400, 0, 1481422400, 1, 1420070400, NULL, 1),
(69, '069/2007', 'Frederic Marchese  ', 510012000, 1, 'Ndejje- Sambwe', NULL, '', '', 1, '', '', NULL, 1168732800, 0, 1482286400, 1, 1420070400, NULL, 1),
(70, '070/2007', 'Gaynelle Busbee  ', -90000, 0, 'Kikoma Wobulenzi', '0566121212', '', 'Service Provider', 2, '', '', NULL, 1169938800, 0, 1483150400, 0, 1453146345, NULL, 1),
(71, '071/2007', 'Remona Sheffler  ', -75693600, 2, 'Kisaawe Muyenga Wobulenzi', NULL, '', 'Teacher', 1, '', '', NULL, 1170111600, 0, 1484014400, 0, 1427241600, NULL, 3),
(72, '072/2006', 'Federica Iliff  ', -115261200, 2, 'Luweero Child Devt Centre', '02589 452103', '', 'Peasant', 1, '', '', NULL, 1156896000, 0, 1517879600, 1, 1455023003, NULL, 1),
(73, '073/2008', 'Chan Milby  ', 864252000, 2, 'St.Peters-Kisugu', NULL, '', '', 1, '', '', NULL, 1200960000, 0, 1485742400, 1, 1420070400, NULL, 1),
(74, '074/2007', 'Piedad Mcgonigal  ', -208231200, 2, 'Ndejje Arch', NULL, '', 'Health Coordinator', 2, '', '', NULL, 1170115200, 0, 1486606400, 1, 1420070400, NULL, 1),
(75, '075/1970', 'Rhonda Pierpont  ', 0, 0, '', NULL, '', '', 0, '', '', NULL, 0, 0, 1487470400, 0, 1420070400, NULL, 1),
(76, '076/2007', 'Celinda Dulac  ', -45194400, 1, 'Luweerotc- Kizito Zone', '0712-219411', '', 'Clergy Man / Teacher', 2, '', '', NULL, 1170115200, 0, 1488334400, 1, 1420070400, NULL, 1),
(77, '077/2007', 'Edmond Kneeland  ', 120348000, 2, 'Luweero', NULL, '', 'Secretary', 2, '', '', NULL, 1170633600, 0, 1489198400, 1, 1420070400, NULL, 1),
(78, '078/2007', 'Lyndia Kump  ', -872301600, 2, 'C/O DCA Kampala', NULL, '', 'Nurse', 1, '', '', NULL, 1170633600, 0, 1490062400, 1, 1420070400, NULL, 1),
(79, '079/2007', 'Michael Poovey  ', -358740000, 2, 'Luweero Diocese', NULL, '', 'CBO Trainer', 2, '', '', NULL, 1170720000, 0, 1490926400, 1, 1420070400, NULL, 1),
(80, '080/2007', 'Omega Prochnow  ', -121312800, 2, 'Luweero Diocese', '0782-352335', '', 'Nurse', 2, '', '', NULL, 1170115200, 0, 1491790400, 1, 1420070400, NULL, 1),
(81, '081/2007', 'Sheri Stuck  ', -873770400, 1, 'Kiteredde Buyuki Katikamu', NULL, '', 'Peasant / Farmer', 2, '', '', NULL, 1188259200, 0, 1492654400, 1, 1420070400, NULL, 1),
(82, '082/2007', 'Shellie Bromley  ', -24544800, 1, 'Kangulumira- Mpologoma ', NULL, '', 'Teacher', 2, '', '', NULL, 1188259200, 0, 1493518400, 0, 1420070400, NULL, 1),
(83, '083/2007', 'Joshua Meiser  ', -1036803600, 1, 'Kikasa Wobulenzi Cetral', '0790-562315', '', 'Building Contractor', 2, 'Anne Meiser', 'Wife', NULL, 1174435200, 0, 1494382400, 1, 1445425402, NULL, 1),
(84, '084/2007', 'Jean Piehl  ', 135727200, 1, 'Wobulenzi-Kigulu', NULL, '', '', 2, '', '', NULL, 1174867200, 0, 1495246400, 1, 1420070400, NULL, 1),
(85, '085/2007', 'Lovella Canaday  ', 399934800, 1, 'Kiwoko - Kasana ', NULL, '', 'Primary Teacher', 1, '', '', NULL, 1175212800, 0, 1496110400, 1, 1420070400, NULL, 1),
(86, '086/2007', 'Val Cauley  ', 200955600, 2, 'Luweero T/C', '0772-688874', '', 'Social Worker', 1, '', '', NULL, 1178236800, 0, 1496974400, 1, 1420070400, NULL, 1),
(87, '087/2008', 'Michale Belvin  ', -600228000, 3, 'Kyatagali - Mabuye -Kamira', NULL, '', 'Lay-Reader / Peasant', 2, '', '', NULL, 1215043200, 0, 1497838400, 1, 1420070400, NULL, 1),
(88, '088/2007', 'Vernon Shade  ', 252712800, 2, 'Kagoma', NULL, '', 'Social Worker', 2, '', '', NULL, 1181174400, 0, 1498702400, 1, 1420070400, NULL, 1),
(89, '089/2007', 'Susie Cratty  ', 72054000, 2, 'Katikamu P/S', '0782-158039', '', 'Teacher', 2, '', '', NULL, 1182211200, 0, 1499566400, 1, 1427241600, NULL, 5),
(90, '090/2007', 'Sima Cunningham  ', 188690400, 1, 'Luweero Town Council', '0772-305106', '', 'Social Worker', 1, '', '', NULL, 1182211200, 0, 1500430400, 1, 1420070400, NULL, 1),
(91, '091/2007', 'Leonel Weitzman  ', -164941200, 1, 'Katikamu Trinity Church', '0774068617', '', 'Lay-Reader', 2, '', '', NULL, 1182384000, 0, 1501294400, 1, 1427241600, NULL, 5),
(92, '092/2007', 'Corine Hansell  ', 135986400, 2, 'Katikamu- Sebamala', '0782-485545', '', 'Teacher', 2, '', '', NULL, 1182384000, 0, 1502158400, 1, 1420070400, NULL, 1),
(93, '093/2008', 'Beatrice Cortez  ', 166744800, 1, 'Kibula LC1 Kabakeddi Parish', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1211241600, 0, 1503022400, 1, 1420070400, NULL, 1),
(94, '094/2007', 'Lore Keltz  ', 16837200, 1, 'Katikamu', '0772-670909', '', 'Clergy Man', 2, '', '', NULL, 1182729600, 0, 1503886400, 1, 1420070400, NULL, 1),
(95, '095/2007', 'Eda Edmonson  ', 261352800, 1, 'Kasoma Zone', '0772-641144', '', 'Health Worker', 1, '', '', NULL, 1182211200, 0, 1504750400, 1, 1420070400, NULL, 1),
(96, '096/2007', 'Clotilde Fuqua  ', -83210400, 1, 'Kangulumira- Mpologoma ', '0773-266136', '', 'Business Man', 2, '', '', NULL, 1185840000, 0, 1505614400, 1, 1420070400, NULL, 1),
(97, '097/2007', 'Rosamaria Hardeman  ', -7200, 1, 'Sempa C/U', '0772964823', '', 'Lay-Reader', 2, '', '', NULL, 1184025600, 0, 1506478400, 1, 1420070400, NULL, 1),
(98, '098/2007', 'Wilfred Dinger  ', 24094800, 1, 'Nalulya Butuntumula Luweero Diocese', '0782-424243', '', 'Lay-Reader', 1, '', '', NULL, 1185840000, 0, 1507342400, 1, 1420070400, NULL, 1),
(99, '099/2007', 'Minh Myrie  ', -161920800, 1, 'Mulilo Zone', NULL, '', 'Tailor', 2, '', '', NULL, 1187049600, 0, 1508206400, 1, 1420070400, NULL, 1),
(100, '100/2007', 'Sherly Boudreau  ', 313974000, 2, 'Kasana T/C', '0782-415747', '', 'Child Development Officer', 1, 'Hans Wurst', '', NULL, 1187654400, 0, 1509070400, 1, 1445427949, NULL, 1),
(101, '101/2007', 'Clay Facer  ', -474598800, 6, 'C/U Kyetume', '0251-1213159', '', 'Lay-Reader', 1, '', '', NULL, 1190073600, 0, 1509934400, 1, 1454956530, NULL, 1),
(102, '102/2007', 'Roma Costales  ', 215388000, 1, 'Kidukulu - Makulubita', NULL, '', 'Lay-Reader / Coffe Trader', 2, '', '', NULL, 1194912000, 0, 1510798400, 1, 1427241600, NULL, 3),
(103, '103/2007', 'Shad Kiger  ', -445395600, 1, 'Luweero Tc', '0782-116626', '', 'Teacher', 2, '', '', NULL, 1192492800, 0, 1511662400, 1, 1454587328, NULL, 1),
(104, '104/2007', 'Dwayne Yeoman  ', -7200, 3, 'Kirema Village', NULL, '', '', 0, '', '', NULL, 1192492800, 0, 1512526400, 1, 1427241600, NULL, 3),
(105, '105/2008', 'Latoya Ensley  ', 166658400, 2, 'Luweero Town Council', '0758-885228', '', 'Teacher', 2, '', '', NULL, 1203292800, 0, 1513390400, 1, 1427241600, NULL, 3),
(106, '106/2007', 'Judie Walts  ', -361936800, 1, 'Bbale Central Kiyanda Parish', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1191456000, 0, 1514254400, 1, 1427241600, NULL, 3),
(107, '107/2007', 'Gilda Shim  ', -26791200, 2, 'Wobulenzi Tc', NULL, '', 'Tailor', 2, '', '', NULL, 1193702400, 0, 1515118400, 1, 1427241600, NULL, 3),
(108, '108/2007', 'Sharla Buhl  ', -7200, 0, 'Namba Village - Ziroobwe', NULL, '', 'Shoe-making', 1, '', '', NULL, 1192658400, 0, 1515982400, 0, 1427241600, NULL, 3),
(109, '109/2007', 'Madalene Sunde  ', -56944800, 2, 'Luweero T/C', NULL, '', 'Peasant', 2, '', '', NULL, 1195084800, 0, 1516846400, 1, 1427241600, NULL, 3),
(110, '110/2007', 'Etta Bergh  ', 152143200, 2, 'Luweero Girls'' School', '0772-472944', '', 'Teacher', 2, '', '', NULL, 1194912000, 0, 1517710400, 1, 1427241600, NULL, 3),
(111, '111/2007', 'Thomasine Lash  ', -1167616800, 1, 'Dan Yawe- Vvumba', '0772-923534', '', 'Farmer', 2, '', '', NULL, 1195516800, 0, 1518574400, 1, 1427241600, NULL, 3),
(112, '112/2007', 'Mireille Birdsall  ', 38527200, 1, 'Kasaala P/S - Voc St.Mark', '0782-489069', '', 'Teacher', 2, '', '', NULL, 1196121600, 0, 1519438400, 1, 1427241600, NULL, 3),
(113, '113/2007', 'Shirly Cavalieri  ', 91749600, 2, 'Wobulenzi Town Council', '0774-569606', '', 'Farmer', 2, '', '', NULL, 1196121600, 0, 1520302400, 1, 1427241600, NULL, 3),
(114, '114/2007', 'Lavinia Cavallo  ', -205984800, 1, 'Wakayamba P/S', '0774-085558', '', 'Teacher', 2, '', '', NULL, 1196294400, 0, 1521166400, 1, 1427241600, NULL, 3),
(115, '115/2007', 'Tiny Mable  ', -128829600, 1, 'Luwero Boys'' PS', NULL, '', 'Teacher', 2, '', '', NULL, 1196294400, 0, 1522030400, 1, 1427241600, NULL, 3),
(116, '116/2007', 'Alden Koval  ', -59709600, 1, 'Katikamu', '0781-703077', '', 'Farmer', 2, '', '', NULL, 1171238400, 0, 1522894400, 1, 1427241600, NULL, 3),
(117, '117/2007', 'Romelia Rezentes  ', -482637600, 2, 'Namakofu -Nambi Zirobwe', '0783-016223', '', 'Extensive Farmer', 2, '', '', NULL, 1171756800, 0, 1523758400, 1, 1427241600, NULL, 3),
(118, '118/2007', 'Kaylee Cate  ', 20638800, 2, 'Kalagala Kalanamu Parish', '0782-104384', '', 'Teacher', 2, '', '', NULL, 1198022400, 0, 1524622400, 1, 1427241600, NULL, 3),
(119, '119/2008', 'Toya Rank  ', -7200, 1, 'unknown', NULL, '', 'Teacher', 2, '', '', NULL, 1199142000, 0, 1525486400, 0, 1420070400, NULL, 1),
(120, '120/2008', 'Gregg Stillings  ', 30751200, 2, 'Binyonyi Zone Luweero T/C', '0782-424855', '', 'Secretary Luweero District Admin.', 2, '', '', NULL, 1200355200, 0, 1526350400, 1, 1427241600, NULL, 3),
(121, '121/2008', 'Orville Serafino  ', 121039200, 2, 'Kiwoko Hospital', NULL, '', 'Midwife Kiwoko Hospital', 1, '', '', NULL, 1200960000, 0, 1527214400, 1, 1427241600, NULL, 3),
(122, '122/2008', 'Shaneka Swinford  ', -7200, 2, 'Nabagaya Road Luweero', '0772-344445', '', 'Accounts Clerk (Water Sector)', 2, '', '', NULL, 1208822400, 0, 1528078400, 1, 1427241600, NULL, 3),
(123, '123/2008', 'Margeret Pajak  ', -52880400, 2, 'Kyambogo Mixed PS, Luweero', '0772-949049', '', 'Teacher', 2, '', '', NULL, 1204070400, 0, 1528942400, 1, 1453829174, NULL, 1),
(124, '124/2007', 'Stevie Perrigo  ', -919562400, 1, 'Bakijulura', '0779-544750', '', 'Lay-Reader', 2, '', '', NULL, 1194134400, 0, 1529806400, 1, 1427241600, NULL, 3),
(125, '125/2008', 'Terrie Fassett  ', -1001728800, 1, 'Kande- Katikamu', '0774-647288', '', 'Farmer', 2, '', '', NULL, 1205971200, 0, 1530670400, 1, 1427241600, NULL, 3),
(126, '126/2008', 'Angele Clancy  ', -7200, 2, 'C/O Kabyanga(Nakazzi Luweero)', '0774-446075', '', '', 0, '', '', NULL, 1216252800, 0, 1531534400, 1, 1427241600, NULL, 3),
(127, '127/2008', 'Margarete Zuk  ', 248911200, 1, 'Bugabo - Kibanyi Bamunanika', '0774-639465', '', 'Boda-Boda Transporter', 2, '', '', NULL, 1202083200, 0, 1532398400, 1, 1427241600, NULL, 3),
(128, '128/2008', 'Theresia Rutkowski  ', 149374800, 2, 'Luweero Town Council', '0774-956160', '', 'Teacher', 2, '', '', NULL, 1201737600, 0, 1533262400, 1, 1427241600, NULL, 3),
(129, '129/2008', 'Raye Hambly  ', -7200, 2, 'Nakasero Zone Wobulenzi', '0772-601112', '', 'Teacher', 2, '', '', NULL, 1202342400, 0, 1534126400, 1, 1428392156, NULL, 6),
(130, '130/1970', 'Almeda Vu  ', -555732000, 2, 'Malou Nsamuu Makulubita', NULL, '', 'Lay-Reader', 2, '', '', NULL, 0, 0, 1534990400, 1, 1427241600, NULL, 3),
(131, '131/1970', 'Philomena Shumate  ', -284176800, 2, 'Kizito Lc1', NULL, '', 'Health Information Assistant', 2, '', '', NULL, 0, 0, 1535854400, 1, 1427241600, NULL, 3),
(132, '132/1970', 'Valery Sola  ', -63165600, 2, 'Bunyonyi Zone (Luweero T/C)', NULL, '', '', 3, '', '', NULL, 0, 0, 1536718400, 1, 1427241600, NULL, 3),
(133, '133/2008', 'Vanita Hymel  ', 120175200, 2, 'Kasana Kiwogozi', NULL, '', 'Peasant', 1, '', '', NULL, 1205884800, 0, 1537582400, 1, 1427241600, NULL, 3),
(134, '134/2008', 'Karyn Rhoton  ', -7200, 2, 'Luweero Cdc', NULL, '', 'Peasant', 3, '', '', NULL, 1205798400, 0, 1538446400, 1, 1427241600, NULL, 3),
(135, '135/2008', 'Valerie Laguerre  ', -7200, 2, 'Kasana - Kavule ', NULL, '', 'Peasant', 3, '', '', NULL, 1205798400, 0, 1539310400, 1, 1427241600, NULL, 3),
(136, '136/2008', 'Arturo Cruz  ', 27036000, 2, 'Kasana- Kavule ', NULL, '', 'Restaurant', 1, '', '', NULL, 1205798400, 0, 1540174400, 1, 1427241600, NULL, 3),
(137, '137/2008', 'Lue Hinkel  ', -7200, 2, 'Binyonyi Zone Luweero T/C', NULL, '', 'Farmer', 1, '', '', NULL, 1205798400, 0, 1541038400, 1, 1427241600, NULL, 3),
(138, '138/2008', 'Miesha Runions  ', 182034000, 2, 'Luweero Cdc', NULL, '', 'Peasant', 1, '', '', NULL, 1205798400, 0, 1541902400, 1, 1427241600, NULL, 3),
(139, '139/2008', 'Katharina Clow  ', -1130400, 2, 'Kakinzi- Kakabala', NULL, '', 'Peasant', 1, '', '', NULL, 1205798400, 0, 1542766400, 1, 1427241600, NULL, 3),
(140, '140/2008', 'Antoinette Ortego  ', -57808800, 2, 'Ngogolo', NULL, '', 'Peasant', 0, '', '', NULL, 1205798400, 0, 1543630400, 1, 1427241600, NULL, 3),
(141, '141/2009', 'Scottie Mayhugh  ', -18324000, 1, 'Kigavu Kabakedi Luweero Tc', '0774-443579', '', 'Peasant', 2, '', '', NULL, 1231804800, 0, 1544494400, 1, 1427241600, NULL, 3),
(142, '142/2008', 'Hester Janousek  ', -7200, 2, 'Kasomer Luwero Town Council', NULL, '', 'selfemployeed', 1, '', '', NULL, 1205794800, 0, 1545358400, 0, 1427241600, NULL, 3),
(143, '143/2008', 'Criselda Curro  ', -59191200, 2, 'Nabagaya C/O Luweero Cdc', NULL, '', 'Police-Woman', 0, '', '', NULL, 1205798400, 0, 1546222400, 0, 1427241600, NULL, 3),
(144, '144/2008', 'Kristi Ogren  ', -8215200, 2, 'Kasana- Kavule', NULL, '', 'Peasant', 1, '', '', NULL, 1205798400, 0, 1547086400, 1, 1427241600, NULL, 3),
(145, '145/2008', 'Lesley Nardi  ', 143413200, 2, 'Nabagaya Luweero Tc', NULL, '', 'Peasant', 1, '', '', NULL, 1205798400, 0, 1547950400, 1, 1427241600, NULL, 3),
(146, '146/2008', 'Kai Ridlon  ', -488340000, 1, 'Wakyato Luweero Diocese', NULL, '', 'Parish Priest', 2, '', '', NULL, 1220918400, 0, 1548814400, 1, 1427241600, NULL, 3),
(147, '147/2008', 'Sammy Wrenn  ', -815191200, 1, 'Kikubajinja Lc1 C/O St Mark Luweero ', NULL, '', 'Priest in St. Mark', 2, '', '', NULL, 1204416000, 0, 1549678400, 1, 1427241600, NULL, 3),
(148, '148/2008', 'Jacelyn Broker  ', 257292000, 2, 'Wobulenzi- Katikamu', NULL, '', 'Tailor', 1, '', '', NULL, 1207612800, 0, 1550542400, 1, 1427241600, NULL, 3),
(149, '149/2008', 'Margarett Ingold  ', -386474400, 2, 'Butikwa Kiwoko Kikamulo', NULL, '', 'Nurse Aide', 3, '', '', NULL, 1204934400, 0, 1551406400, 1, 1427241600, NULL, 3),
(150, '150/2008', 'Jefferson Pierson  ', -680061600, 2, 'Kamuli Kikamuloc/O Kiwoko Arch', '0782-884279', '', 'Farmer', 2, '', '', NULL, 1207612800, 0, 1552270400, 1, 1454585394, NULL, 1),
(151, '151/2008', 'Glynda Delcambre  ', 141858000, 1, 'Kamuli-Kikamulo', '0773298713', '', 'Peasant', 2, '', '', NULL, 1210032000, 0, 1553134400, 1, 1427241600, NULL, 3),
(152, '152/2008', 'Melina Zak  ', -7200, 1, 'Kamuli-Kikamulo', '0778-569954', '', 'Peasant / Lay-Reader', 2, '', '', NULL, 1210032000, 0, 1553998400, 1, 1427241600, NULL, 3),
(153, '153/2008', 'Migdalia Windle  ', 283644000, 1, 'Pd Nsawo Cdc', NULL, '', 'Social Worker', 1, '', '', NULL, 1211414400, 0, 1554862400, 1, 1427241600, NULL, 3),
(154, '154/2008', 'Marcellus Felipe  ', -295408800, 2, 'Buto Bamunanika', '0782-008255', '', 'Peasant', 2, '', '', NULL, 1210032000, 0, 1555726400, 0, 1427241600, NULL, 3),
(155, '155/2008', 'Ulrike Graffam  ', 396046800, 2, 'Kibengo Umea P/S', NULL, '', 'Teacher', 2, '', '', NULL, 1210723200, 0, 1556590400, 0, 1427241600, NULL, 3),
(156, '156/2008', 'Shawnta Deltoro  ', 129506400, 2, 'Luweero T/C', '0752-575266', '', 'CDO Finance', 2, '', '', NULL, 1210636800, 0, 1557454400, 1, 1427241600, NULL, 3),
(157, '157/2008', 'Suzan Tibbs  ', 110408400, 2, 'Kalongo Miti Luweero Tc', NULL, '', 'Cook', 2, '', '', NULL, 1213660800, 0, 1558318400, 1, 1427241600, NULL, 3),
(158, '158/2009', 'Louella Dancy  ', -506829600, 1, 'Mubulizi -Tweyanze C/U', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1240876800, 0, 1559182400, 1, 1427241600, NULL, 3),
(159, '159/2008', 'Ruth Anstine  ', 460760400, 1, 'Nakasongola- Ssasira', NULL, '', 'Boda-Boda Man', 1, '', '', NULL, 1214265600, 0, 1560046400, 1, 1427241600, NULL, 3),
(160, '160/2008', 'Nathanial Ruch  ', -538624800, 1, 'Kasoma Zone', NULL, '', 'Peasant', 1, '', '', NULL, 1214870400, 0, 1560910400, 1, 1427241600, NULL, 3),
(161, '161/2008', 'Gwendolyn Kimbro  ', -167364000, 1, 'Kabeera- Kapeeka', '0788-458668', '', 'Peasant / Farmer', 2, '', '', NULL, 1219104000, 0, 1561774400, 1, 1427241600, NULL, 3),
(162, '162/2008', 'Riley Paugh  ', 28850400, 1, 'Kalongomiti', NULL, '', 'Teacher', 2, '', '', NULL, 1219276800, 0, 1562638400, 1, 1427241600, NULL, 3),
(163, '163/2008', 'Claretha Thibodeau  ', 448840800, 1, 'Kirema- Kapeeke', NULL, '', 'Peasant', 2, '', '', NULL, 1219276800, 0, 1563502400, 1, 1427241600, NULL, 3),
(164, '164/2008', 'Iliana Arends  ', -7200, 2, 'Luweero Boys P/S', NULL, '', 'Deputy Head Teacher', 1, '', '', NULL, 1218499200, 0, 1564366400, 1, 1427241600, NULL, 3),
(165, '165/2008', 'Anjelica Averett  ', -31543200, 2, 'Luweero Ss', '0772-843103', '', 'Teacher', 2, '', '', NULL, 1219881600, 0, 1565230400, 1, 1427241600, NULL, 3),
(166, '166/2008', 'Juli Mey  ', -240026400, 2, 'Kakoola- Sekamuli', '0775-571944', '', 'Farmer', 2, '', '', NULL, 1216684800, 0, 1566094400, 1, 1427241600, NULL, 3),
(167, '167/2008', 'Carlota Bennefield  ', -204170400, 1, 'Kizito Zone Luweero Tc', '0772-496690', '', 'Lecturer Kyambogo University', 2, '', '', NULL, 1220486400, 0, 1566958400, 1, 1427241600, NULL, 3),
(168, '168/2007', 'Karisa Stockstill  ', -62647200, 2, 'Kikoma Village- Wobulenzi Tc', NULL, '', 'Lay-Reader', 1, '', '', NULL, 1170115200, 0, 1567822400, 1, 1427241600, NULL, 3),
(169, '169/2008', 'Carolyn Randle  ', -292212000, 2, 'Kasana Market Zone', '0772-608854', '', 'Inspector of Schools', 2, '', '', NULL, 1221523200, 0, 1568686400, 1, 1427241600, NULL, 3),
(170, '170/2008', 'Therese Conniff  ', 328222800, 2, 'Kasoma Zone', '0773-057019', '', 'CDO Sponsorship', 1, '', '', NULL, 1221523200, 0, 1569550400, 1, 1427241600, NULL, 3),
(171, '171/2008', 'Dagmar Lembo  ', 390690000, 2, 'Namirembe -Kirema Parish', '0774-012894', '', 'Business Woman', 2, '', '', NULL, 1222128000, 0, 1570414400, 1, 1427241600, NULL, 3),
(172, '172/2008', 'Rachelle Ponton  ', -33271200, 1, 'Ndejje', NULL, '', 'Teacher', 2, '', '', NULL, 1223337600, 0, 1571278400, 1, 1427241600, NULL, 3),
(173, '173/1970', 'Zetta Zambrano  ', -251344800, 2, 'Kalongo Miti', '0772-344440', '', 'Business', 2, '', '', NULL, 0, 0, 1572142400, 1, 1427241600, NULL, 3),
(174, '174/2008', 'Hoyt Wolverton  ', 336258000, 1, 'Katuugo Cdc', NULL, '', 'Social Worker', 1, '', '', NULL, 1224547200, 0, 1573006400, 0, 1427241600, NULL, 3),
(175, '175/2012', 'Meagan Spore  ', 399416400, 2, 'Nabagaya', '0774-061011', '', 'Social Worker', 1, '', '', NULL, 1328745600, 0, 1573870400, 1, 1427241600, NULL, 3),
(176, '176/2008', 'Trenton Moreira  ', -221104800, 1, 'Buzzibwera', '0779-268607', '', 'Lay-Reader', 2, '', '', NULL, 1226534400, 0, 1574734400, 1, 1427241600, NULL, 3),
(177, '177/2008', 'Chery Schirmer  ', -42429600, 2, 'Wampewo', NULL, '', 'Teacher', 2, '', '', NULL, 1226966400, 0, 1575598400, 1, 1427241600, NULL, 3),
(178, '178/2012', 'Adah Brumbaugh  ', 218584800, 2, 'Busula', NULL, '', 'Peasant', 1, '', '', NULL, 1329350400, 0, 1576462400, 1, 1427241600, NULL, 3),
(179, '179/2008', 'Albina Ono  ', 292024800, 1, 'Nsawo Cdc', NULL, '', 'Social Worker', 1, '', '', NULL, 1227830400, 0, 1577326400, 1, 1427241600, NULL, 3),
(180, '180/2008', 'Marva Poll  ', 397861200, 1, 'State Anthony-Nakaseke', NULL, '', 'State Attorney Nakaseke', 2, '', '', NULL, 1227744000, 0, 1578190400, 0, 1427241600, NULL, 3),
(181, '181/2009', 'Renata Lamothe  ', 48891600, 2, 'Kiwoko Mixed P/S', '0788-717356', '', 'Teacher', 2, '', '', NULL, 1236038400, 0, 1579054400, 1, 1427241600, NULL, 3),
(182, '182/2009', 'Sharell Mccormick  ', -473047200, 1, 'Timuna Parish', '0772-949273', '', 'Priest', 2, '', '', NULL, 1234828800, 0, 1579918400, 1, 1427241600, NULL, 3),
(183, '183/2009', 'Sharan Beacham  ', -371959200, 1, 'Ndeeba Ss', '0782-065219', '', 'Teacher', 2, '', '', NULL, 1236038400, 0, 1580782400, 1, 1427241600, NULL, 3),
(184, '184/2009', 'Annamae Morano  ', -43380000, 1, 'Kampala Road', NULL, '', 'Business Man', 2, '', '', NULL, 1235001600, 0, 1581646400, 1, 1427241600, NULL, 3),
(185, '185/2008', 'Frederic Capone  ', -338436000, 1, 'Kyetume- Nakaseeta', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1228521600, 0, 1582510400, 1, 1427241600, NULL, 3),
(186, '186/2009', 'Lorina Olden  ', 180565200, 1, 'Kamuli - Kikamulo', '0782-375463', '', 'Business Man', 1, '', '', NULL, 1234828800, 0, 1583374400, 1, 1427241600, NULL, 3),
(187, '187/2009', 'Ty Stgelais', -90000, 1, 'Luweero Boys P/S', '0758-888415', '', 'Teacher', 1, '', '', NULL, 1242086400, 0, 1584238400, 1, 1454587369, NULL, 1),
(188, '188/2009', 'Brigette Hathaway  ', 0, 2, 'Kyankonnwa Katuugo Kakooge', '0781577505', '', '', 0, '', '', NULL, 1237248000, 0, 1585102400, 1, 1420070400, NULL, 1),
(189, '189/2009', 'Vanita Eaves  ', -496202400, 2, 'Kasana Market Ltc', '0774-285085', '', 'Teacher', 3, '', '', NULL, 1237248000, 0, 1585966400, 1, 1427241600, NULL, 3),
(190, '190/2009', 'Valentin Kenna  ', 607125600, 1, 'Namirembe -Kirema Parish', '0774-012894', '', 'Mechanic', 1, '', '', NULL, 1245628800, 0, 1586830400, 0, 1443692389, NULL, 3),
(191, '191/2009', 'Fredia Grissett  ', 330296400, 1, 'Kiwoko- Kasana ', '0772-647451', '', 'Business', 1, '', '', NULL, 1250553600, 0, 1587694400, 1, 1427241600, NULL, 3),
(192, '192/2009', 'Lettie Amezcua  ', -916192800, 1, 'Kigavu-Kabaledi, Luweero', '0752-624769', '', 'Lay-Reader', 2, '', '', NULL, 1232409600, 0, 1588558400, 1, 1427241600, NULL, 3),
(193, '193/2009', 'Jayson Reader  ', -179892000, 1, 'Buzzibwera', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1231977600, 0, 1589422400, 1, 1427241600, NULL, 3),
(194, '194/2009', 'Shonna Montenegro  ', 383263200, 1, 'Lumu Zone C/O Luweero S S', NULL, '', 'Teacher', 1, '', '', NULL, 1253145600, 0, 1590286400, 1, 1427241600, NULL, 3),
(195, '195/2009', 'Janell Zager  ', -303530400, 2, 'Kasaala Lc1', '0779-294359', '', 'Peasant', 2, '', '', NULL, 1252368000, 0, 1623978800, 1, 1427241600, NULL, 3),
(196, '196/2009', 'Nan Amarante  ', -176176800, 2, 'St.Luke Ndabilako - Sekamuli', NULL, '', 'Lay-Reader', 0, '', '', NULL, 1252886400, 0, 1592014400, 1, 1427241600, NULL, 3),
(197, '197/2009', 'Cheryll Stiger  ', 0, 2, 'Busula /Wobulenzi', NULL, '', '', 0, '', '', NULL, 1254787200, 0, 1592878400, 1, 1420070400, NULL, 1),
(198, '198/2015', 'Godfrey Kakooza', 327016800, 1, 'Luweero', '0785 2135156', '', 'Teacher', 1, '', '', NULL, 1449097200, 0, 1626225200, 1, 1453113851, NULL, 1),
(199, '199/2016', 'Thomas Aquinus', -1834448400, 1, 'Paris', '0215 544665416', '', 'Theologian', 2, '', '', NULL, 1452726000, 0, 1630718000, 1, 1452792535, NULL, 1),
(200, '200/2015', 'St. Martin of Tours', -604026000, 1, 'Tours', '0123 456789', '', 'Bishop', 1, '', '', NULL, 1446678000, 0, 1622942000, 1, 1453829237, 'uploads/photos/cust200_146x190.jpg', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `expenses`
--

INSERT INTO `expenses` (`exp_id`, `cust_id`, `exptype_id`, `exp_amount`, `exp_date`, `exp_text`, `exp_recipient`, `exp_receipt`, `exp_voucher`, `exp_created`, `user_id`) VALUES
(1, NULL, 1, 15000, 1453158000, 'Airtime for Manager', 'Airtel', 0, 201, 1453207875, 2),
(2, NULL, 6, 60000, 1453676400, '2GB data bundle', 'MTN', 70812, 562, 1453213126, 1),
(3, NULL, 4, 50000, 1454281200, 'Power Bill for January', 'UMEME', 21511494, 156, 1454318269, 1),
(4, NULL, 19, 453567, 1451516400, 'Distributed Interest for 2015', NULL, NULL, NULL, 1455093137, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `exptype`
--

CREATE TABLE IF NOT EXISTS `exptype` (
`exptype_id` int(11) NOT NULL,
  `exptype_type` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

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
(17, 'Insurance'),
(18, 'Annual Share Dividend'),
(19, 'Annual Savings Interest');

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
(6, 'Loan Application Fee', 'LAF', 10000),
(7, 'Loan Fine', 'LFine', 15000),
(8, 'Loan Interest Rate', 'LIR', 4);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `incomes`
--

INSERT INTO `incomes` (`inc_id`, `cust_id`, `inctype_id`, `inc_amount`, `inc_date`, `inc_receipt`, `inc_text`, `inc_created`, `user_id`) VALUES
(1, 1, 7, 10000, 1452812400, 1483, '', 1453118784, 1),
(2, 1, 3, 6000, 1454108400, 1484, '', 1453118805, 1),
(3, 1, 2, 1000, 1453158000, 1281, '', 1453207255, 2),
(5, 90, 9, 18000, 1453244400, 180, '', 1453208404, 1),
(6, 100, 2, 1000, 1454281200, 5678, '', 1454329440, 1),
(11, 160, 7, 10000, 1454281200, 56, '', 1454335368, 1),
(12, 160, 3, 9000, 1454367600, 5656, '', 1454335387, 1),
(21, 4, 2, 1000, 1423436400, 548, '', 1455024777, 1),
(22, 5, 2, 1000, 1448924400, 659, '', 1455025157, 1),
(23, 12, 2, 1000, 1435615200, 884, '', 1455025453, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `loans`
--

INSERT INTO `loans` (`loan_id`, `cust_id`, `loanstatus_id`, `loan_no`, `loan_date`, `loan_dateout`, `loan_issued`, `loan_principal`, `loan_interest`, `cur_id`, `loan_appfee_receipt`, `loan_fee`, `loan_fee_receipt`, `loan_rate`, `loan_period`, `loan_repaytotal`, `loan_repaystart`, `loan_purpose`, `loan_sec1`, `loan_sec2`, `loan_guarant1`, `loan_guarant2`, `loan_guarant3`, `loan_feepaid`, `loan_created`, `user_id`) VALUES
(1, 100, 2, 'L 100-2', 1439935200, 1439935200, 1, 850000, 2.5, 1, 1234, 8500, 87874, '162917', 6, 977500, 0, 'test', 'Cow', '', 1, 2, 3, 0, 1439993579, 1),
(2, 1, 2, 'L-1-1', 1452812400, 1454108400, 1, 600000, 2.5, NULL, 1483, 6000, 1484, '65000', 12, 780000, 0, 'Printing Cost', 'Historic Bible Edition', 'Herd of pigs', 3, 4, 200, 0, 1453118784, 1),
(3, 160, 2, 'L-160-1', 1454281200, 1454367600, 1, 900000, 3, NULL, 56, 9000, 5656, '252000', 4, 1008000, 0, 'Boda Repair', 'Boda', '', 1, 3, 156, 0, 1454335368, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `logrec`
--

INSERT INTO `logrec` (`logrec_id`, `user_id`, `logrec_start`, `logrec_end`, `logrec_logout`) VALUES
(1, 1, 1455027108, 1455092999, 0),
(2, 1, 1455092999, 1455097924, 1),
(3, 3, 1455094234, 1455097932, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(19, 3, 1457046000, NULL, 225000, NULL, 27000, NULL, 0, NULL, NULL, 1),
(20, 3, 1459724400, NULL, 225000, NULL, 20250, NULL, 0, NULL, NULL, 1),
(21, 3, 1462402800, NULL, 225000, NULL, 13500, NULL, 0, NULL, NULL, 1),
(22, 3, 1465081200, NULL, 225000, NULL, 6750, NULL, 0, NULL, NULL, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `savings`
--

INSERT INTO `savings` (`sav_id`, `cust_id`, `sav_date`, `sav_amount`, `cur_id`, `savtype_id`, `sav_receipt`, `sav_slip`, `sav_created`, `user_id`) VALUES
(1, 1, 1420070400, 30000, 1, 1, 610, 0, NULL, 1),
(2, 2, 1420070400, 190400, 1, 1, 0, 0, NULL, 1),
(3, 3, 1420070400, 4000, 1, 1, 0, 0, NULL, 1),
(4, 4, 1420070400, 123183, 1, 1, 0, 0, NULL, 1),
(5, 5, 1420070400, 25700, 1, 1, 0, 0, NULL, 1),
(6, 6, 1420070400, 25700, 1, 1, 0, 0, NULL, 1),
(7, 7, 1420070400, 105900, 1, 1, 0, 0, NULL, 1),
(8, 8, 1420070400, 98000, 1, 1, 0, 0, NULL, 1),
(9, 9, 1420070400, 550000, 1, 1, 0, 0, NULL, 1),
(10, 10, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
(11, 11, 1420070400, 5276, 1, 1, 0, 0, NULL, 1),
(12, 12, 1420070400, 20000, 1, 1, 0, 0, NULL, 1),
(13, 13, 1420070400, 379700, 1, 1, 0, 0, NULL, 1),
(14, 14, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
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
(200, 9, 1423602000, -450000, 1, 2, 682, 0, NULL, 1),
(201, 1, 1435183200, 25000, 0, 1, 509, 0, 1453118311, 1),
(202, 1, 1453158000, -26000, 0, 2, 1281, 603, 1453207255, 2),
(203, 1, 1453158000, -1000, 0, 4, 1281, 603, 1453207255, 2),
(204, 1, 1453762800, -8000, 0, 2, 5678, 1234, 1453793443, 1),
(205, 1, 1453762800, -1000, 0, 4, 5678, 1234, 1453793443, 1),
(206, 3, 1469484000, 14000, 0, 1, 7, 0, 1453795583, 1),
(207, 100, 1454281200, -500000, 0, 2, 5678, 1234, 1454329440, 1),
(208, 100, 1454281200, -1000, 0, 4, 5678, 1234, 1454329440, 1),
(209, 111, 1454972400, 160000, 0, 1, 150, 0, 1455006663, 1),
(210, 45, 1454972400, 465, 0, 1, 9200, 0, 1455010623, 1),
(211, 45, 1454972400, 8000, 0, 1, 845, 0, 1455010641, 1),
(212, 45, 1454972400, 735, 0, 1, 4564, 0, 1455010657, 1),
(214, 4, 1423436400, -82183, 0, 2, 548, 54561, 1455024777, 1),
(215, 5, 1448924400, -15000, 0, 2, 659, 13, 1455025157, 1),
(216, 12, 1435615200, -10000, 0, 2, 884, 466, 1455025453, 1),
(217, 1, 1451516400, 860, 0, 3, NULL, 0, 1455093137, 1),
(218, 2, 1451516400, 3808, 0, 3, NULL, 0, 1455093137, 1),
(219, 3, 1451516400, 80, 0, 3, NULL, 0, 1455093137, 1),
(220, 4, 1451516400, 1001, 0, 3, NULL, 0, 1455093137, 1),
(221, 5, 1451516400, 490, 0, 3, NULL, 0, 1455093137, 1),
(222, 6, 1451516400, 514, 0, 3, NULL, 0, 1455093137, 1),
(223, 7, 1451516400, 2118, 0, 3, NULL, 0, 1455093137, 1),
(224, 8, 1451516400, 1960, 0, 3, NULL, 0, 1455093137, 1),
(225, 9, 1451516400, 2990, 0, 3, NULL, 0, 1455093137, 1),
(226, 10, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(227, 12, 1451516400, 298, 0, 3, NULL, 0, 1455093137, 1),
(228, 15, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(229, 16, 1451516400, 600, 0, 3, NULL, 0, 1455093137, 1),
(230, 17, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(231, 19, 1451516400, 1480, 0, 3, NULL, 0, 1455093137, 1),
(232, 20, 1451516400, 530, 0, 3, NULL, 0, 1455093137, 1),
(233, 21, 1451516400, 2866, 0, 3, NULL, 0, 1455093137, 1),
(234, 22, 1451516400, 324, 0, 3, NULL, 0, 1455093137, 1),
(235, 23, 1451516400, 2000, 0, 3, NULL, 0, 1455093137, 1),
(236, 24, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(237, 25, 1451516400, 204, 0, 3, NULL, 0, 1455093137, 1),
(238, 26, 1451516400, 1250, 0, 3, NULL, 0, 1455093137, 1),
(239, 27, 1451516400, 102, 0, 3, NULL, 0, 1455093137, 1),
(240, 28, 1451516400, 24, 0, 3, NULL, 0, 1455093137, 1),
(241, 29, 1451516400, 720, 0, 3, NULL, 0, 1455093137, 1),
(242, 30, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(243, 32, 1451516400, 40, 0, 3, NULL, 0, 1455093137, 1),
(244, 33, 1451516400, 1306, 0, 3, NULL, 0, 1455093137, 1),
(245, 34, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(246, 35, 1451516400, 400, 0, 3, NULL, 0, 1455093137, 1),
(247, 36, 1451516400, 1996, 0, 3, NULL, 0, 1455093137, 1),
(248, 37, 1451516400, 30000, 0, 3, NULL, 0, 1455093137, 1),
(249, 38, 1451516400, 80, 0, 3, NULL, 0, 1455093137, 1),
(250, 39, 1451516400, 5872, 0, 3, NULL, 0, 1455093137, 1),
(251, 40, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(252, 41, 1451516400, 80, 0, 3, NULL, 0, 1455093137, 1),
(253, 42, 1451516400, 224, 0, 3, NULL, 0, 1455093137, 1),
(254, 43, 1451516400, 1836, 0, 3, NULL, 0, 1455093137, 1),
(255, 45, 1451516400, 1816, 0, 3, NULL, 0, 1455093137, 1),
(256, 46, 1451516400, 400, 0, 3, NULL, 0, 1455093137, 1),
(257, 47, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(258, 48, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(259, 49, 1451516400, 500, 0, 3, NULL, 0, 1455093137, 1),
(260, 50, 1451516400, 450, 0, 3, NULL, 0, 1455093137, 1),
(261, 51, 1451516400, 1700, 0, 3, NULL, 0, 1455093137, 1),
(262, 52, 1451516400, 5268, 0, 3, NULL, 0, 1455093137, 1),
(263, 53, 1451516400, 400, 0, 3, NULL, 0, 1455093137, 1),
(264, 54, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(265, 55, 1451516400, 516, 0, 3, NULL, 0, 1455093137, 1),
(266, 56, 1451516400, 41, 0, 3, NULL, 0, 1455093137, 1),
(267, 58, 1451516400, 612, 0, 3, NULL, 0, 1455093137, 1),
(268, 59, 1451516400, 1816, 0, 3, NULL, 0, 1455093137, 1),
(269, 60, 1451516400, 200800, 0, 3, NULL, 0, 1455093137, 1),
(270, 61, 1451516400, 7214, 0, 3, NULL, 0, 1455093137, 1),
(271, 62, 1451516400, 3318, 0, 3, NULL, 0, 1455093137, 1),
(272, 63, 1451516400, 550, 0, 3, NULL, 0, 1455093137, 1),
(273, 64, 1451516400, 230, 0, 3, NULL, 0, 1455093137, 1),
(274, 65, 1451516400, 228, 0, 3, NULL, 0, 1455093137, 1),
(275, 66, 1451516400, 2828, 0, 3, NULL, 0, 1455093137, 1),
(276, 67, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(277, 68, 1451516400, 1628, 0, 3, NULL, 0, 1455093137, 1),
(278, 69, 1451516400, 28, 0, 3, NULL, 0, 1455093137, 1),
(279, 72, 1451516400, 1600, 0, 3, NULL, 0, 1455093137, 1),
(280, 73, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(281, 74, 1451516400, 500, 0, 3, NULL, 0, 1455093137, 1),
(282, 76, 1451516400, 12, 0, 3, NULL, 0, 1455093137, 1),
(283, 77, 1451516400, 9420, 0, 3, NULL, 0, 1455093137, 1),
(284, 78, 1451516400, 3380, 0, 3, NULL, 0, 1455093137, 1),
(285, 79, 1451516400, 1200, 0, 3, NULL, 0, 1455093137, 1),
(286, 80, 1451516400, 1580, 0, 3, NULL, 0, 1455093137, 1),
(287, 81, 1451516400, 204, 0, 3, NULL, 0, 1455093137, 1),
(288, 83, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(289, 84, 1451516400, 1020, 0, 3, NULL, 0, 1455093137, 1),
(290, 85, 1451516400, 1020, 0, 3, NULL, 0, 1455093137, 1),
(291, 86, 1451516400, 3986, 0, 3, NULL, 0, 1455093137, 1),
(292, 87, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(293, 88, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(294, 89, 1451516400, 2000, 0, 3, NULL, 0, 1455093137, 1),
(295, 90, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(296, 91, 1451516400, 1998, 0, 3, NULL, 0, 1455093137, 1),
(297, 92, 1451516400, 7500, 0, 3, NULL, 0, 1455093137, 1),
(298, 93, 1451516400, 200, 0, 3, NULL, 0, 1455093137, 1),
(299, 94, 1451516400, 8000, 0, 3, NULL, 0, 1455093137, 1),
(300, 95, 1451516400, 1722, 0, 3, NULL, 0, 1455093137, 1),
(301, 96, 1451516400, 4, 0, 3, NULL, 0, 1455093137, 1),
(302, 97, 1451516400, 7556, 0, 3, NULL, 0, 1455093137, 1),
(303, 98, 1451516400, 560, 0, 3, NULL, 0, 1455093137, 1),
(304, 99, 1451516400, 1, 0, 3, NULL, 0, 1455093137, 1),
(305, 100, 1451516400, 11000, 0, 3, NULL, 0, 1455093137, 1),
(306, 101, 1451516400, 1058, 0, 3, NULL, 0, 1455093137, 1),
(307, 102, 1451516400, 1900, 0, 3, NULL, 0, 1455093137, 1),
(308, 103, 1451516400, 224, 0, 3, NULL, 0, 1455093137, 1),
(309, 104, 1451516400, 360, 0, 3, NULL, 0, 1455093137, 1),
(310, 105, 1451516400, 3200, 0, 3, NULL, 0, 1455093137, 1),
(311, 106, 1451516400, 403, 0, 3, NULL, 0, 1455093137, 1),
(312, 107, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(313, 109, 1451516400, 400, 0, 3, NULL, 0, 1455093137, 1),
(314, 110, 1451516400, 3525, 0, 3, NULL, 0, 1455093137, 1),
(315, 111, 1451516400, 151, 0, 3, NULL, 0, 1455093137, 1),
(316, 112, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(317, 113, 1451516400, 5070, 0, 3, NULL, 0, 1455093137, 1),
(318, 114, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(319, 115, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(320, 116, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(321, 117, 1451516400, 337, 0, 3, NULL, 0, 1455093137, 1),
(322, 118, 1451516400, 1148, 0, 3, NULL, 0, 1455093137, 1),
(323, 120, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(324, 121, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(325, 122, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(326, 123, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(327, 124, 1451516400, 3200, 0, 3, NULL, 0, 1455093137, 1),
(328, 125, 1451516400, 606, 0, 3, NULL, 0, 1455093137, 1),
(329, 126, 1451516400, 7500, 0, 3, NULL, 0, 1455093137, 1),
(330, 127, 1451516400, 1000, 0, 3, NULL, 0, 1455093137, 1),
(331, 128, 1451516400, 10000, 0, 3, NULL, 0, 1455093137, 1),
(332, 129, 1451516400, 1200, 0, 3, NULL, 0, 1455093137, 1),
(333, 130, 1451516400, 360, 0, 3, NULL, 0, 1455093137, 1),
(334, 131, 1451516400, 180, 0, 3, NULL, 0, 1455093137, 1),
(335, 132, 1451516400, 300, 0, 3, NULL, 0, 1455093137, 1),
(336, 133, 1451516400, 900, 0, 3, NULL, 0, 1455093137, 1),
(337, 134, 1451516400, 280, 0, 3, NULL, 0, 1455093137, 1),
(338, 135, 1451516400, 100, 0, 3, NULL, 0, 1455093137, 1),
(339, 136, 1451516400, 200, 0, 3, NULL, 0, 1455093137, 1),
(340, 137, 1451516400, 100, 0, 3, NULL, 0, 1455093137, 1),
(341, 138, 1451516400, 400, 0, 3, NULL, 0, 1455093137, 1),
(342, 139, 1451516400, 100, 0, 3, NULL, 0, 1455093137, 1),
(343, 140, 1451516400, 600, 0, 3, NULL, 0, 1455093137, 1),
(344, 141, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(345, 144, 1451516400, 400, 0, 3, NULL, 0, 1455093137, 1),
(346, 145, 1451516400, 560, 0, 3, NULL, 0, 1455093137, 1),
(347, 146, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(348, 147, 1451516400, 800, 0, 3, NULL, 0, 1455093137, 1),
(349, 148, 1451516400, 5, 0, 3, NULL, 0, 1455093137, 1),
(350, 149, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(351, 150, 1451516400, 700, 0, 3, NULL, 0, 1455093137, 1),
(352, 151, 1451516400, 2524, 0, 3, NULL, 0, 1455093137, 1),
(353, 152, 1451516400, 1600, 0, 3, NULL, 0, 1455093137, 1),
(354, 153, 1451516400, 150, 0, 3, NULL, 0, 1455093137, 1),
(355, 156, 1451516400, 200, 0, 3, NULL, 0, 1455093137, 1),
(356, 157, 1451516400, 140, 0, 3, NULL, 0, 1455093137, 1),
(357, 158, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(358, 159, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(359, 160, 1451516400, 60, 0, 3, NULL, 0, 1455093137, 1),
(360, 161, 1451516400, 13914, 0, 3, NULL, 0, 1455093137, 1),
(361, 162, 1451516400, 900, 0, 3, NULL, 0, 1455093137, 1),
(362, 163, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(363, 164, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(364, 165, 1451516400, 1700, 0, 3, NULL, 0, 1455093137, 1),
(365, 166, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(366, 167, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(367, 168, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(368, 169, 1451516400, 202, 0, 3, NULL, 0, 1455093137, 1),
(369, 170, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(370, 171, 1451516400, 100, 0, 3, NULL, 0, 1455093137, 1),
(371, 172, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(372, 173, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(373, 175, 1451516400, 68, 0, 3, NULL, 0, 1455093137, 1),
(374, 176, 1451516400, 21, 0, 3, NULL, 0, 1455093137, 1),
(375, 177, 1451516400, 160, 0, 3, NULL, 0, 1455093137, 1),
(376, 178, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(377, 179, 1451516400, 200, 0, 3, NULL, 0, 1455093137, 1),
(378, 181, 1451516400, 110, 0, 3, NULL, 0, 1455093137, 1),
(379, 182, 1451516400, 2172, 0, 3, NULL, 0, 1455093137, 1),
(380, 183, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(381, 184, 1451516400, 1600, 0, 3, NULL, 0, 1455093137, 1),
(382, 185, 1451516400, 200, 0, 3, NULL, 0, 1455093137, 1),
(383, 186, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(384, 187, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(385, 188, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(386, 189, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(387, 191, 1451516400, 200, 0, 3, NULL, 0, 1455093137, 1),
(388, 192, 1451516400, 3100, 0, 3, NULL, 0, 1455093137, 1),
(389, 193, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(390, 194, 1451516400, 200, 0, 3, NULL, 0, 1455093137, 1),
(391, 195, 1451516400, 15000, 0, 3, NULL, 0, 1455093137, 1),
(392, 196, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(393, 197, 1451516400, 160, 0, 3, NULL, 0, 1455093137, 1),
(394, 198, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(395, 199, 1451516400, 0, 0, 3, NULL, 0, 1455093137, 1),
(396, 200, 1451516400, 760, 0, 3, NULL, 0, 1455093137, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savtype`
--

CREATE TABLE IF NOT EXISTS `savtype` (
`savtype_id` int(11) NOT NULL,
  `savtype_type` varchar(20) NOT NULL,
  `savtype_short` varchar(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `savtype`
--

INSERT INTO `savtype` (`savtype_id`, `savtype_type`, `savtype_short`) VALUES
(1, 'Deposit', 'D'),
(2, 'Withdrawal', 'W'),
(3, 'Savings Interest', 'I'),
(4, 'W/drawal Fee', 'F_W'),
(5, 'Subscription Fee', 'F_S'),
(6, 'Loan Default Fine', 'LDF'),
(7, 'Loan Fee', 'F_L'),
(8, 'Loan Repayment', 'LR'),
(9, 'Share Dividend', 'SHD');

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
(1, 'Minimum Savings Balance', 'MSB', '10000'),
(2, 'Minimum Loan Principal', 'MinLP', '500000'),
(3, 'Maximum Loan Principal', 'MaxLP', '10000000'),
(4, 'Currency Abbreviation', 'CUR', 'UGX'),
(5, 'Auto-fine Defaulters', 'AUF', ''),
(6, 'Account Deactivation', 'DEACT', ''),
(7, 'Dashboard Left', 'DashL', 'dashboard/dash_subscr.php'),
(8, 'Dashboard Right', 'DashR', 'dashboard/dash_loandefaults.php'),
(9, 'Interest Calculation', 'IntCALC', 'modules/mod_inter_float.php'),
(10, 'Guarantor Limit', 'MaxGuar', '3'),
(11, 'Minimum Membership', 'MinMemb', '4'),
(12, 'Maximum Principal-Savings Ratio', 'MaxPSR', '500');

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
(100, 101, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(101, 102, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(102, 103, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(103, 104, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(104, 105, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(105, 106, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(106, 107, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
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
(134, 135, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(136, 137, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(137, 138, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(140, 141, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(143, 144, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(145, 146, 1420070400, 2, 48000, 0, 0, 0, NULL, 1),
(146, 147, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(147, 148, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(148, 149, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(149, 150, 1420070400, 4, 80000, 0, 0, 0, NULL, 1),
(150, 151, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(151, 152, 1420070400, 3, 60000, 0, 0, 0, NULL, 1),
(152, 153, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(155, 156, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(156, 157, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(157, 158, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(158, 159, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(159, 160, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(160, 161, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(161, 162, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(162, 163, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(164, 165, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(165, 166, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(166, 167, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(167, 168, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(168, 169, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(169, 170, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(170, 171, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(171, 172, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(172, 173, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(174, 175, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(175, 176, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(176, 177, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(177, 178, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(178, 179, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(180, 181, 1420070400, 2, 40000, 0, 0, 0, NULL, 1),
(181, 182, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(182, 183, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(186, 187, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
(187, 188, 1420070400, 1, 20000, 0, 0, 0, NULL, 1),
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
  `user_pw` varchar(200) NOT NULL,
  `ugroup_id` int(11) NOT NULL,
  `user_created` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_pw`, `ugroup_id`, `user_created`) VALUES
(1, 'admin', '3c29a3c4aff054d9557eea510df85960712812d2', 1, 1452869051),
(2, 'ext-admin', '3c29a3c4aff054d9557eea510df85960712812d2', 4, 1453231226),
(3, 'John Doe', '3c29a3c4aff054d9557eea510df85960712812d2', 2, 1436350633);

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
MODIFY `custmarried_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=201;
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
-- AUTO_INCREMENT für Tabelle `expenses`
--
ALTER TABLE `expenses`
MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
MODIFY `inc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT für Tabelle `inctype`
--
ALTER TABLE `inctype`
MODIFY `inctype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `loans`
--
ALTER TABLE `loans`
MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `loanstatus`
--
ALTER TABLE `loanstatus`
MODIFY `loanstatus_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `logrec`
--
ALTER TABLE `logrec`
MODIFY `logrec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `ltrans`
--
ALTER TABLE `ltrans`
MODIFY `ltrans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT für Tabelle `savings`
--
ALTER TABLE `savings`
MODIFY `sav_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=397;
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
-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
