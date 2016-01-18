-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Jan 2016 um 15:20
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
  `cust_pic` varchar(100) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_name`, `cust_dob`, `cust_sex`, `cust_address`, `cust_phone`, `cust_email`, `cust_occup`, `cust_married_id`, `cust_heir`, `cust_heirrel`, `cust_lengthres`, `cust_since`, `cust_sick`, `cust_lastsub`, `cust_active`, `cust_lastupd`, `cust_pic`, `user_id`) VALUES
(0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(1, 'Martin Luther', 437266800, 1, 'Wittenberg', '+49 3491 10111483', '', 'Reformer', 3, 'Katharina Luther', 'Wife', NULL, 1157580000, 0, 1456190000, 1, 1453118461, 'uploads/photos/cust1_200x260.jpg', 1),
(2, 'Jan Hus', 78793200, 1, 'Prague', '+420 1071372', '', 'Reformer', 3, 'Joh. Joseph Hu&szlig;', 'Father', NULL, 1159401600, 0, 1424398400, 1, 1453118583, 'uploads/photos/cust2_200x260.jpg', 1),
(3, 'Jean Calvin', -256006800, 1, 'Geneva', '0760-548193', 'j.calvin@reformed.org', 'Reformer', 3, 'Marie Calvin', 'Wife', NULL, 1157587200, 0, 1458090800, 1, 1438330883, NULL, 1),
(4, 'Huldrych Zwingli', -505620000, 1, 'Zurich', NULL, '', 'Reformer', 3, '', '', NULL, 1159747200, 0, 1458954800, 1, 1420070400, NULL, 1),
(5, 'Heinrich Bullinger', -5662321, 1, 'Zurich', NULL, '', 'Reformer', 3, '', '', NULL, 1158710400, 0, 1426990400, 1, 1436350199, NULL, 3),
(6, 'Ila Kimble  ', -362023200, 1, 'Luwero Diocese', '0772-349669', '', 'Clergy Man', 3, '', '', NULL, 1161820800, 0, 1460682800, 1, 1420070400, NULL, 1),
(7, 'Lesha Detweiler  ', -7200, 1, 'Ndejje', '0782-453096', '', 'Clergy', 3, '', '', NULL, 1156377600, 0, 1428718400, 1, 1420070400, NULL, 1),
(8, 'Ezra Singletary  ', 140043600, 1, 'St.Mark - Luweero', '0782-880948', '', 'Clergy Man / Teacher', 1, '', '', NULL, 1157587200, 0, 1462410800, 1, 1420070400, NULL, 1),
(9, 'Aura Trim  ', -456976800, 1, 'Luteete Arch', '0782-347980', '', 'Pastor', 3, '', '', NULL, 1156377600, 0, 1430446400, 1, 1420070400, NULL, 1),
(10, 'Marci Fleming  ', -285210000, 1, 'Bukalabi Mpwede Kasangombe', '0785 451321', '', 'Pastor', 3, '', '', NULL, 1157580000, 0, 1431310400, 1, 1452785891, NULL, 1),
(11, 'Nydia Melvin  ', -404791200, 1, 'Kiziba Kikyusa Arch', '0772-968444', '', 'Clergy Man', 3, '', '', NULL, 1157932800, 0, 1402174400, 0, 1420070400, NULL, 1),
(12, 'Joshua Vandenburg  ', -552448800, 1, 'Kiziba Kikyusa Arch', '0772-551662', '', 'Clergy Man', 3, '', '', NULL, 1157587200, 0, 1433038400, 1, 1420070400, NULL, 1),
(13, 'Melania Mitchem  ', 158364000, 1, 'Kalere', '0782-380513', '', 'Clergy', 2, '', '', NULL, 1158796800, 0, 1413902400, 0, 1420070400, NULL, 1),
(14, 'Clemmie Ellithorpe  ', -929930400, 1, 'Kazinga Butuntumula', NULL, '', 'Clergy Man', 3, '', '', NULL, 1157580000, 0, 1434766400, 0, 1427241600, NULL, 3),
(15, 'Kristofer Artis  ', -90000, 1, 'Kisenyi', '0', '', '', 1, '', '', NULL, 1157580000, 0, 1435630400, 1, 1452688368, NULL, 1),
(16, 'Lulu Obando  ', -440906400, 1, 'Sempa Parish ', '0782-096008', '', 'Clergy Man', 3, '', '', NULL, 1167782400, 0, 1436424400, 1, 1420070400, NULL, 1),
(17, 'Kai Soriano  ', -86320800, 1, 'Luteete', NULL, '', 'Pastor / Teacher', 3, '', '', NULL, 1157580000, 0, 1437358400, 0, 1427241600, NULL, 3),
(18, 'Lynne Pratico  ', 160264800, 1, 'Bwaziba', NULL, '', 'Clergy / Farmer', 3, '', '', NULL, 1158019200, 0, 1338222400, 0, 1420070400, NULL, 1),
(19, 'Noella Holyfield  ', -633578400, 1, 'Kasana -Kiwogozi', '0772-984673', '', 'Clergy Man', 3, '', '', NULL, 1157587200, 0, 1439086400, 1, 1420070400, NULL, 1),
(20, 'Berry Steve  ', -256525200, 1, 'Bombo', '0782-453477', '', 'Clergy Man', 3, '', '', NULL, 1157932800, 0, 1439950400, 1, 1427241600, NULL, 5),
(21, 'Gregorio Schurr  ', -479527200, 1, 'Kasiso', '0772-532964', '', 'Clergy Man', 3, '', '', NULL, 1156377600, 0, 1440814400, 1, 1420070400, NULL, 1),
(22, 'Arnetta Lobato  ', -744170400, 1, 'Bakijulura', NULL, '', 'Retired', 1, '', '', NULL, 1157932800, 0, 1401678400, 0, 1420070400, NULL, 1),
(23, 'Ayana Mohammed  ', -368762400, 1, 'St. Mark Luweero', '0772-183125', '', 'Clergy Man', 3, '', '', NULL, 1157587200, 0, 1442542400, 1, 1420070400, NULL, 1),
(24, 'Conrad Keitt  ', -748404000, 1, 'Namusale', NULL, '', 'Clergy Man', 3, '', '', NULL, 1160006400, 0, 1443406400, 1, 1420070400, NULL, 1),
(25, 'Stephine Leitner  ', -559792800, 1, 'Buwana', '0773142217', '', 'Clergy Man', 3, '', '', NULL, 1158019200, 0, 1444270400, 1, 1420070400, NULL, 1),
(26, 'Tequila Lino  ', -597549600, 1, 'Sekamuli Area', '0782-880521', '', 'Clergy Man', 3, '', '', NULL, 1195516800, 0, 1445134400, 1, 1420070400, NULL, 1),
(27, 'Deena Hawes  ', -932349600, 1, 'Zirobwe', NULL, '', 'Clergy Man', 3, '', '', NULL, 1190160000, 0, 1445998400, 1, 1420070400, NULL, 1),
(28, 'Kellye Whitley  ', -363924000, 1, 'Lukomera', '0779-253864', '', 'Clergy Man / Teacher', 3, '', '', NULL, 1166572800, 0, 1446862400, 1, 1420070400, NULL, 1),
(29, 'Judi Spillman  ', -573703200, 1, 'Balitta- Lwogi', '0782-559766', '', 'Clergy Man', 3, '', '', NULL, 1189468800, 0, 1447726400, 1, 1420070400, NULL, 1),
(30, 'Emily Ratley  ', -7200, 1, 'Kalere', NULL, '', 'Clergy Man', 3, '', '', NULL, 1159394400, 0, 1448590400, 0, 1427241600, NULL, 3),
(31, 'Robena Burget  ', -7200, 1, 'Kasana', NULL, '', 'Clergy Man', 3, '', '', NULL, 1159394400, 0, 1449454400, 0, 1427241600, NULL, 3),
(32, 'Milda Mcamis  ', -427860000, 1, 'Bweyeeyo-Luweero', NULL, '', 'Clergy Man', 3, '', '', NULL, 1159401600, 0, 1450318400, 1, 1420070400, NULL, 1),
(33, 'Alec Kearl  ', -336794400, 1, 'Nakaseke', '0773-974456', '', 'Pastor / Teacher', 3, '', '', NULL, 1158019200, 0, 1451182400, 1, 1427241600, NULL, 3),
(34, 'Ngoc Alcantar  ', -185335200, 1, 'Kasana Kvule-Luweero', NULL, '', 'Clergy Man', 3, '', '', NULL, 1157932800, 0, 1452046400, 1, 1420070400, NULL, 1),
(35, 'Sharen Harr  ', -33271200, 2, 'Luweero Town Council', '0772-442574', '', 'Accounts Clerk', 3, '', '', NULL, 1156896000, 0, 1452910400, 1, 1420070400, NULL, 1),
(36, 'Crysta Riebe  ', -320032800, 2, 'Kungu- Busula', NULL, '', '', 3, '', '', NULL, 1158796800, 0, 1453774400, 1, 1420070400, NULL, 1),
(37, 'Ronni Knoles  ', -213069600, 1, 'Kungu-Busula', '0772-365951', '', 'Social Worker', 3, '', '', NULL, 1156723200, 0, 1454638400, 1, 1420070400, NULL, 1),
(38, 'Ela Denmark  ', 401230800, 2, 'Kungu-Busula', NULL, '', 'Counsellor / Volunteer', 2, '', '', NULL, 1157241600, 0, 1455502400, 1, 1420070400, NULL, 1),
(39, 'Grace Hamer  ', 55717200, 1, 'Busula', '0701-855942', '', 'Road Supervisor', 2, '', '', NULL, 1157328000, 0, 1456366400, 1, 1420070400, NULL, 1),
(40, 'Emma Bermea  ', -340855200, 2, 'Wobulenzi', NULL, '', 'Teacher', 3, '', '', NULL, 1157328000, 0, 1457230400, 1, 1420070400, NULL, 1),
(41, 'Rosana Breit  ', 534549600, 1, 'Busula', NULL, '', 'Student', 2, '', '', NULL, 1166659200, 0, 1458094400, 1, 1420070400, NULL, 1),
(42, 'Evelynn Mickles  ', 292543200, 2, 'Kungu-Busula', NULL, '', 'Trader - Retail', 3, '', '', NULL, 1157328000, 0, 1458958400, 1, 1420070400, NULL, 1),
(43, 'Tonie Maroney  ', 141858000, 2, 'Bendegere Namusaale', NULL, '', 'Customer Care Manager', 3, '', '', NULL, 1156550400, 0, 1459822400, 1, 1420070400, NULL, 1),
(44, 'Fallon Rosendahl  ', -46231200, 1, 'Buwana Kinyogoga', NULL, '', 'Clergy Man', 3, '', '', NULL, 1158789600, 0, 1460686400, 0, 1427241600, NULL, 3),
(45, 'Renato Loudon  ', -361072800, 1, 'Kaswa- Busula', '0774-764113', '', 'Lay-Reader', 3, '', '', NULL, 1157500800, 0, 1461550400, 1, 1420070400, NULL, 1),
(46, 'Garth Swartwood  ', -184298400, 2, 'Kikoma C/U Wobulenzi Tc', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1157846400, 0, 1462414400, 1, 1420070400, NULL, 1),
(47, 'Joannie Gust  ', 75589200, 2, 'Kikoma Wobulenzi', NULL, '', 'Peasant - Farmer', 3, '', '', NULL, 1157846400, 0, 1463278400, 1, 1420070400, NULL, 1),
(48, 'Fermina Collazo  ', -240890400, 2, 'Kikona Wobulenzi Central', NULL, '', 'Peasant / Farmer', 3, '', '', NULL, 1157932800, 0, 1464142400, 1, 1420070400, NULL, 1),
(49, 'Lavenia Byler  ', -252468000, 1, 'Kayindu C/U', '0785-772868', '', 'Lay-Reader', 3, '', '', NULL, 1157500800, 0, 1465006400, 1, 1420070400, NULL, 1),
(50, 'Willetta Moreau  ', 167522400, 1, 'Katuugo Parish', '0782-447156', '', 'Lay-Reader / Tailor', 3, '', '', NULL, 1157414400, 0, 1465870400, 1, 1420070400, NULL, 1),
(51, 'Alicia Wehner  ', -207453600, 2, 'Waluleeta Makulubita', '0782-461460', '', 'Trainer / Social Worker', 3, '', '', NULL, 1199664000, 0, 1466734400, 1, 1420070400, NULL, 1),
(52, 'Ocie Edds  ', -605412000, 1, 'Administrator Luweero Diocese', NULL, '', 'Diocesan Bishop', 3, '', '', NULL, 1158796800, 0, 1467598400, 1, 1420070400, NULL, 1),
(53, 'Darcy Read  ', 309736800, 2, 'Luwero TC', NULL, '', 'Secretary', 2, '', '', NULL, 1158796800, 0, 1468462400, 1, 1420070400, NULL, 1),
(54, 'Augustina Shuman  ', -244605600, 2, 'Kaswa- Busula', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1157846400, 0, 1469326400, 1, 1420070400, NULL, 1),
(55, 'Catherine Adler  ', 0, 3, 'Luweero Diocese', NULL, '', '', 1, '', '', NULL, 1242086400, 0, 1470190400, 1, 1420070400, NULL, 1),
(56, 'Shanae Bello  ', 77144400, 2, 'Luweero Boys School', NULL, '', 'Teacher', 2, '', '', NULL, 1197936000, 0, 1471054400, 1, 1420070400, NULL, 1),
(57, 'Ferne Munson  ', -7200, 1, 'Bweyeyo', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1159826400, 0, 1471918400, 0, 1427241600, NULL, 3),
(58, 'Ja Nordby  ', -7200, 2, 'Kungu- Kikoma', NULL, '', 'Housewife', 3, '', '', NULL, 1166572800, 0, 1472782400, 1, 1420070400, NULL, 1),
(59, 'Illa Penaflor  ', -179632800, 2, 'Kiwogozi', '0772-662202', '', 'Teacher / MP', 1, '', '', NULL, 1166572800, 0, 1473646400, 1, 1420070400, NULL, 1),
(60, 'Annabelle Bradham  ', -455680800, 1, 'Kiwoko Arc', '0772-657419', '', 'Clergy Man', 3, '', '', NULL, 1167782400, 0, 1474510400, 1, 1420070400, NULL, 1),
(61, 'Tanner Wake  ', -539143200, 1, 'Bukalabi Parish', '0752-631706', '', 'Clergy Man', 3, '', '', NULL, 1157932800, 0, 1475374400, 1, 1420070400, NULL, 1),
(62, 'Cristobal Passman  ', -399088800, 2, 'Luteete Arch', NULL, '', 'Housewife', 3, '', '', NULL, 1168387200, 0, 1476238400, 1, 1420070400, NULL, 1),
(63, 'Rosita Pankratz  ', -394077600, 2, 'Ndejje Village', NULL, '', 'Peasant / Farmer', 3, '', '', NULL, 1168732800, 0, 1477102400, 1, 1420070400, NULL, 1),
(64, 'Angila Gauldin  ', 404949600, 2, 'Nalinya Lwantale Girls P/S', NULL, '', 'Teacher', 2, '', '', NULL, 1168732800, 0, 1477966400, 1, 1420070400, NULL, 1),
(65, 'Jerrica Darnell  ', 534981600, 1, 'Ndejje- Sambwe', NULL, '', 'Student', 2, '', '', NULL, 1168732800, 0, 1478830400, 1, 1420070400, NULL, 1),
(66, 'Paul Mushrush  ', 513554400, 2, 'Ndejje - Sambwe', NULL, '', '', 2, '', '', NULL, 1168732800, 0, 1479694400, 1, 1420070400, NULL, 1),
(67, 'Daren Konkol  ', 0, 0, '', NULL, '', '', 1, '', '', NULL, 0, 0, 60488000, 0, 1427241600, NULL, 0),
(68, 'Kristin Lippard  ', 967323600, 2, 'Ndejje- Sambwe', NULL, '', '', 2, '', '', NULL, 1169510400, 0, 1481422400, 1, 1420070400, NULL, 1),
(69, 'Frederic Marchese  ', 510012000, 1, 'Ndejje- Sambwe', NULL, '', '', 2, '', '', NULL, 1168732800, 0, 1482286400, 1, 1420070400, NULL, 1),
(70, 'Gaynelle Busbee  ', -7200, 0, 'Kikoma Wobulenzi', NULL, '', 'Service Provider NAADS/AGRIC', 3, '', '', NULL, 1169938800, 0, 1483150400, 0, 1427241600, NULL, 3),
(71, 'Remona Sheffler  ', -75693600, 2, 'Kisaawe Muyenga Wobulenzi', NULL, '', 'Teacher', 2, '', '', NULL, 1170111600, 0, 1484014400, 0, 1427241600, NULL, 3),
(72, 'Federico Iliff  ', -115178400, 2, 'Luweero Child Devt Centre', NULL, '', 'Peasant', 2, '', '', NULL, 1156896000, 0, 1517879600, 1, 1420070400, NULL, 1),
(73, 'Chan Milby  ', 864252000, 2, 'St.Peters-Kisugu', NULL, '', '', 2, '', '', NULL, 1200960000, 0, 1485742400, 1, 1420070400, NULL, 1),
(74, 'Piedad Mcgonigal  ', -208231200, 2, 'Ndejje Arch', NULL, '', 'Health Coordinator', 3, '', '', NULL, 1170115200, 0, 1486606400, 1, 1420070400, NULL, 1),
(75, 'Rhonda Pierpont  ', 0, 0, '', NULL, '', '', 1, '', '', NULL, 0, 0, 1487470400, 0, 1420070400, NULL, 1),
(76, 'Celinda Dulac  ', -45194400, 1, 'Luweerotc- Kizito Zone', '0712-219411', '', 'Clergy Man / Teacher', 3, '', '', NULL, 1170115200, 0, 1488334400, 1, 1420070400, NULL, 1),
(77, 'Edmond Kneeland  ', 120348000, 2, 'Luweero', NULL, '', 'Secretary', 3, '', '', NULL, 1170633600, 0, 1489198400, 1, 1420070400, NULL, 1),
(78, 'Lyndia Kump  ', -872301600, 2, 'C/O DCA Kampala', NULL, '', 'Nurse', 2, '', '', NULL, 1170633600, 0, 1490062400, 1, 1420070400, NULL, 1),
(79, 'Michael Poovey  ', -358740000, 2, 'Luweero Diocese', NULL, '', 'CBO Trainer', 3, '', '', NULL, 1170720000, 0, 1490926400, 1, 1420070400, NULL, 1),
(80, 'Omega Prochnow  ', -121312800, 2, 'Luweero Diocese', '0782-352335', '', 'Nurse', 3, '', '', NULL, 1170115200, 0, 1491790400, 1, 1420070400, NULL, 1),
(81, 'Sheri Stuck  ', -873770400, 1, 'Kiteredde Buyuki Katikamu', NULL, '', 'Peasant / Farmer', 3, '', '', NULL, 1188259200, 0, 1492654400, 1, 1420070400, NULL, 1),
(82, 'Shellie Bromley  ', -24544800, 1, 'Kangulumira- Mpologoma ', NULL, '', 'Teacher', 3, '', '', NULL, 1188259200, 0, 1493518400, 0, 1420070400, NULL, 1),
(83, 'Joshua Meiser  ', -1036803600, 1, 'Kikasa Wobulenzi Cetral', '0790-562315', '', 'Building Contractor', 3, 'Anne Meiser', 'Wife', NULL, 1174435200, 0, 1494382400, 1, 1445425402, NULL, 1),
(84, 'Jean Piehl  ', 135727200, 1, 'Wobulenzi-Kigulu', NULL, '', '', 3, '', '', NULL, 1174867200, 0, 1495246400, 1, 1420070400, NULL, 1),
(85, 'Lovella Canaday  ', 399934800, 1, 'Kiwoko - Kasana ', NULL, '', 'Primary Teacher', 2, '', '', NULL, 1175212800, 0, 1496110400, 1, 1420070400, NULL, 1),
(86, 'Val Cauley  ', 200955600, 2, 'Luweero T/C', '0772-688874', '', 'Social Worker', 2, '', '', NULL, 1178236800, 0, 1496974400, 1, 1420070400, NULL, 1),
(87, 'Michale Belvin  ', -600228000, 3, 'Kyatagali - Mabuye -Kamira', NULL, '', 'Lay-Reader / Peasant', 3, '', '', NULL, 1215043200, 0, 1497838400, 1, 1420070400, NULL, 1),
(88, 'Vernon Shade  ', 252712800, 2, 'Kagoma', NULL, '', 'Social Worker', 3, '', '', NULL, 1181174400, 0, 1498702400, 1, 1420070400, NULL, 1),
(89, 'Susie Cratty  ', 72054000, 2, 'Katikamu P/S', '0782-158039', '', 'Teacher', 3, '', '', NULL, 1182211200, 0, 1499566400, 1, 1427241600, NULL, 5),
(90, 'Sima Cunningham  ', 188690400, 1, 'Luweero Town Council', '0772-305106', '', 'Social Worker', 2, '', '', NULL, 1182211200, 0, 1500430400, 1, 1420070400, NULL, 1),
(91, 'Leonel Weitzman  ', -164941200, 1, 'Katikamu Trinity Church', '0774068617', '', 'Lay-Reader', 3, '', '', NULL, 1182384000, 0, 1501294400, 1, 1427241600, NULL, 5),
(92, 'Corine Hansell  ', 135986400, 2, 'Katikamu- Sebamala', '0782-485545', '', 'Teacher', 3, '', '', NULL, 1182384000, 0, 1502158400, 1, 1420070400, NULL, 1),
(93, 'Beatrice Cortez  ', 166744800, 1, 'Kibula LC1 Kabakeddi Parish', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1211241600, 0, 1503022400, 1, 1420070400, NULL, 1),
(94, 'Lore Keltz  ', 16837200, 1, 'Katikamu', '0772-670909', '', 'Clergy Man', 3, '', '', NULL, 1182729600, 0, 1503886400, 1, 1420070400, NULL, 1),
(95, 'Eda Edmonson  ', 261352800, 1, 'Kasoma Zone', '0772-641144', '', 'Health Worker', 2, '', '', NULL, 1182211200, 0, 1504750400, 1, 1420070400, NULL, 1),
(96, 'Clotilde Fuqua  ', -83210400, 1, 'Kangulumira- Mpologoma ', '0773-266136', '', 'Business Man', 3, '', '', NULL, 1185840000, 0, 1505614400, 1, 1420070400, NULL, 1),
(97, 'Rosamaria Hardeman  ', -7200, 1, 'Sempa C/U', '0772964823', '', 'Lay-Reader', 3, '', '', NULL, 1184025600, 0, 1506478400, 1, 1420070400, NULL, 1),
(98, 'Wilfred Dinger  ', 24094800, 1, 'Nalulya Butuntumula Luweero Diocese', '0782-424243', '', 'Lay-Reader', 2, '', '', NULL, 1185840000, 0, 1507342400, 1, 1420070400, NULL, 1),
(99, 'Minh Myrie  ', -161920800, 1, 'Mulilo Zone', NULL, '', 'Tailor', 3, '', '', NULL, 1187049600, 0, 1508206400, 1, 1420070400, NULL, 1),
(100, 'Sherly Boudreau  ', 313974000, 2, 'Kasana T/C', '0782-415747', '', 'Child Development Officer', 2, 'Hans Wurst', '', NULL, 1187654400, 0, 1509070400, 1, 1445427949, NULL, 1),
(101, 'Clay Facer  ', -474516000, 2, 'C/U Kyetume', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1190073600, 0, 1509934400, 1, 1427241600, NULL, 3),
(102, 'Roma Costales  ', 215388000, 1, 'Kidukulu - Makulubita', NULL, '', 'Lay-Reader / Coffe Trader', 3, '', '', NULL, 1194912000, 0, 1510798400, 1, 1427241600, NULL, 3),
(103, 'Shad Kiger  ', -445312800, 2, 'Luweero Tc', '0782-116626', '', 'Teacher', 3, '', '', NULL, 1192492800, 0, 1511662400, 1, 1427241600, NULL, 3),
(104, 'Dwayne Yeoman  ', -7200, 3, 'Kirema Village', NULL, '', '', 1, '', '', NULL, 1192492800, 0, 1512526400, 1, 1427241600, NULL, 3),
(105, 'Latoya Ensley  ', 166658400, 2, 'Luweero Town Council', '0758-885228', '', 'Teacher', 3, '', '', NULL, 1203292800, 0, 1513390400, 1, 1427241600, NULL, 3),
(106, 'Judie Walts  ', -361936800, 1, 'Bbale Central Kiyanda Parish', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1191456000, 0, 1514254400, 1, 1427241600, NULL, 3),
(107, 'Gilda Shim  ', -26791200, 2, 'Wobulenzi Tc', NULL, '', 'Tailor', 3, '', '', NULL, 1193702400, 0, 1515118400, 1, 1427241600, NULL, 3),
(108, 'Sharla Buhl  ', -7200, 0, 'Namba Village - Ziroobwe', NULL, '', 'Shoe-making', 2, '', '', NULL, 1192658400, 0, 1515982400, 0, 1427241600, NULL, 3),
(109, 'Madalene Sunde  ', -56944800, 2, 'Luweero T/C', NULL, '', 'Peasant', 3, '', '', NULL, 1195084800, 0, 1516846400, 1, 1427241600, NULL, 3),
(110, 'Etta Bergh  ', 152143200, 2, 'Luweero Girls'' School', '0772-472944', '', 'Teacher', 3, '', '', NULL, 1194912000, 0, 1517710400, 1, 1427241600, NULL, 3),
(111, 'Thomasine Lash  ', -1167616800, 1, 'Dan Yawe- Vvumba', '0772-923534', '', 'Farmer', 3, '', '', NULL, 1195516800, 0, 1518574400, 1, 1427241600, NULL, 3),
(112, 'Mireille Birdsall  ', 38527200, 1, 'Kasaala P/S - Voc St.Mark', '0782-489069', '', 'Teacher', 3, '', '', NULL, 1196121600, 0, 1519438400, 1, 1427241600, NULL, 3),
(113, 'Shirly Cavalieri  ', 91749600, 2, 'Wobulenzi Town Council', '0774-569606', '', 'Farmer', 3, '', '', NULL, 1196121600, 0, 1520302400, 1, 1427241600, NULL, 3),
(114, 'Lavinia Cavallo  ', -205984800, 1, 'Wakayamba P/S', '0774-085558', '', 'Teacher', 3, '', '', NULL, 1196294400, 0, 1521166400, 1, 1427241600, NULL, 3),
(115, 'Tiny Mable  ', -128829600, 1, 'Luwero Boys'' PS', NULL, '', 'Teacher', 3, '', '', NULL, 1196294400, 0, 1522030400, 1, 1427241600, NULL, 3),
(116, 'Alden Koval  ', -59709600, 1, 'Katikamu', '0781-703077', '', 'Farmer', 3, '', '', NULL, 1171238400, 0, 1522894400, 1, 1427241600, NULL, 3),
(117, 'Romelia Rezentes  ', -482637600, 2, 'Namakofu -Nambi Zirobwe', '0783-016223', '', 'Extensive Farmer', 3, '', '', NULL, 1171756800, 0, 1523758400, 1, 1427241600, NULL, 3),
(118, 'Kaylee Cate  ', 20638800, 2, 'Kalagala Kalanamu Parish', '0782-104384', '', 'Teacher', 3, '', '', NULL, 1198022400, 0, 1524622400, 1, 1427241600, NULL, 3),
(119, 'Toya Rank  ', -7200, 1, 'unknown', NULL, '', 'Teacher', 3, '', '', NULL, 1199142000, 0, 1525486400, 0, 1420070400, NULL, 1),
(120, 'Gregg Stillings  ', 30751200, 2, 'Binyonyi Zone Luweero T/C', '0782-424855', '', 'Secretary Luweero District Admin.', 3, '', '', NULL, 1200355200, 0, 1526350400, 1, 1427241600, NULL, 3),
(121, 'Orville Serafino  ', 121039200, 2, 'Kiwoko Hospital', NULL, '', 'Midwife Kiwoko Hospital', 2, '', '', NULL, 1200960000, 0, 1527214400, 1, 1427241600, NULL, 3),
(122, 'Shaneka Swinford  ', -7200, 2, 'Nabagaya Road Luweero', '0772-344445', '', 'Accounts Clerk (Water Sector)', 3, '', '', NULL, 1208822400, 0, 1528078400, 1, 1427241600, NULL, 3),
(123, 'Margeret Pajak  ', -52797600, 1, 'Kyambogo Mixed PS, Luweero', '0772-949049', '', 'Teacher', 3, '', '', NULL, 1204070400, 0, 1528942400, 1, 1427241600, NULL, 3),
(124, 'Stevie Perrigo  ', -919562400, 1, 'Bakijulura', '0779-544750', '', 'Lay-Reader', 3, '', '', NULL, 1194134400, 0, 1529806400, 1, 1427241600, NULL, 3),
(125, 'Terrie Fassett  ', -1001728800, 1, 'Kande- Katikamu', '0774-647288', '', 'Farmer', 3, '', '', NULL, 1205971200, 0, 1530670400, 1, 1427241600, NULL, 3),
(126, 'Angele Clancy  ', -7200, 2, 'C/O Kabyanga(Nakazzi Luweero)', '0774-446075', '', '', 1, '', '', NULL, 1216252800, 0, 1531534400, 1, 1427241600, NULL, 3),
(127, 'Margarete Zuk  ', 248911200, 1, 'Bugabo - Kibanyi Bamunanika', '0774-639465', '', 'Boda-Boda Transporter', 3, '', '', NULL, 1202083200, 0, 1532398400, 1, 1427241600, NULL, 3),
(128, 'Theresia Rutkowski  ', 149374800, 2, 'Luweero Town Council', '0774-956160', '', 'Teacher', 3, '', '', NULL, 1201737600, 0, 1533262400, 1, 1427241600, NULL, 3),
(129, 'Raye Hambly  ', -7200, 2, 'Nakasero Zone Wobulenzi', '0772-601112', '', 'Teacher', 3, '', '', NULL, 1202342400, 0, 1534126400, 1, 1428392156, NULL, 6),
(130, 'Almeda Vu  ', -555732000, 2, 'Malou Nsamuu Makulubita', NULL, '', 'Lay-Reader', 3, '', '', NULL, 0, 0, 1534990400, 1, 1427241600, NULL, 3),
(131, 'Philomena Shumate  ', -284176800, 2, 'Kizito Lc1', NULL, '', 'Health Information Assistant', 3, '', '', NULL, 0, 0, 1535854400, 1, 1427241600, NULL, 3),
(132, 'Valery Sola  ', -63165600, 2, 'Bunyonyi Zone (Luweero T/C)', NULL, '', '', 4, '', '', NULL, 0, 0, 1536718400, 1, 1427241600, NULL, 3),
(133, 'Vanita Hymel  ', 120175200, 2, 'Kasana Kiwogozi', NULL, '', 'Peasant', 2, '', '', NULL, 1205884800, 0, 1537582400, 1, 1427241600, NULL, 3),
(134, 'Karyn Rhoton  ', -7200, 2, 'Luweero Cdc', NULL, '', 'Peasant', 4, '', '', NULL, 1205798400, 0, 1538446400, 1, 1427241600, NULL, 3),
(135, 'Valerie Laguerre  ', -7200, 2, 'Kasana - Kavule ', NULL, '', 'Peasant', 4, '', '', NULL, 1205798400, 0, 1539310400, 1, 1427241600, NULL, 3),
(136, 'Arturo Cruz  ', 27036000, 2, 'Kasana- Kavule ', NULL, '', 'Restaurant', 2, '', '', NULL, 1205798400, 0, 1540174400, 1, 1427241600, NULL, 3),
(137, 'Lue Hinkel  ', -7200, 2, 'Binyonyi Zone Luweero T/C', NULL, '', 'Farmer', 2, '', '', NULL, 1205798400, 0, 1541038400, 1, 1427241600, NULL, 3),
(138, 'Miesha Runions  ', 182034000, 2, 'Luweero Cdc', NULL, '', 'Peasant', 2, '', '', NULL, 1205798400, 0, 1541902400, 1, 1427241600, NULL, 3),
(139, 'Katharina Clow  ', -1130400, 2, 'Kakinzi- Kakabala', NULL, '', 'Peasant', 2, '', '', NULL, 1205798400, 0, 1542766400, 1, 1427241600, NULL, 3),
(140, 'Antoinette Ortego  ', -57808800, 2, 'Ngogolo', NULL, '', 'Peasant', 1, '', '', NULL, 1205798400, 0, 1543630400, 1, 1427241600, NULL, 3),
(141, 'Scottie Mayhugh  ', -18324000, 1, 'Kigavu Kabakedi Luweero Tc', '0774-443579', '', 'Peasant', 3, '', '', NULL, 1231804800, 0, 1544494400, 1, 1427241600, NULL, 3),
(142, 'Hester Janousek  ', -7200, 2, 'Kasomer Luwero Town Council', NULL, '', 'selfemployeed', 2, '', '', NULL, 1205794800, 0, 1545358400, 0, 1427241600, NULL, 3),
(143, 'Criselda Curro  ', -59191200, 2, 'Nabagaya C/O Luweero Cdc', NULL, '', 'Police-Woman', 1, '', '', NULL, 1205798400, 0, 1546222400, 0, 1427241600, NULL, 3),
(144, 'Kristi Ogren  ', -8215200, 2, 'Kasana- Kavule', NULL, '', 'Peasant', 2, '', '', NULL, 1205798400, 0, 1547086400, 1, 1427241600, NULL, 3),
(145, 'Lesley Nardi  ', 143413200, 2, 'Nabagaya Luweero Tc', NULL, '', 'Peasant', 2, '', '', NULL, 1205798400, 0, 1547950400, 1, 1427241600, NULL, 3),
(146, 'Kai Ridlon  ', -488340000, 1, 'Wakyato Luweero Diocese', NULL, '', 'Parish Priest', 3, '', '', NULL, 1220918400, 0, 1548814400, 1, 1427241600, NULL, 3),
(147, 'Sammy Wrenn  ', -815191200, 1, 'Kikubajinja Lc1 C/O St Mark Luweero ', NULL, '', 'Priest in St. Mark', 3, '', '', NULL, 1204416000, 0, 1549678400, 1, 1427241600, NULL, 3),
(148, 'Jacelyn Broker  ', 257292000, 2, 'Wobulenzi- Katikamu', NULL, '', 'Tailor', 2, '', '', NULL, 1207612800, 0, 1550542400, 1, 1427241600, NULL, 3),
(149, 'Margarett Ingold  ', -386474400, 2, 'Butikwa Kiwoko Kikamulo', NULL, '', 'Nurse Aide', 4, '', '', NULL, 1204934400, 0, 1551406400, 1, 1427241600, NULL, 3),
(150, 'Jefferson Pierson  ', -680061600, 2, 'Kamuli Kikamuloc/O Kiwoko Arch', '0782-884279', '', 'Farmer', 3, '', '', NULL, 1207612800, 0, 1552270400, 1, 1427241600, NULL, 3),
(151, 'Glynda Delcambre  ', 141858000, 1, 'Kamuli-Kikamulo', '0773298713', '', 'Peasant', 3, '', '', NULL, 1210032000, 0, 1553134400, 1, 1427241600, NULL, 3),
(152, 'Melina Zak  ', -7200, 1, 'Kamuli-Kikamulo', '0778-569954', '', 'Peasant / Lay-Reader', 3, '', '', NULL, 1210032000, 0, 1553998400, 1, 1427241600, NULL, 3),
(153, 'Migdalia Windle  ', 283644000, 1, 'Pd Nsawo Cdc', NULL, '', 'Social Worker', 2, '', '', NULL, 1211414400, 0, 1554862400, 1, 1427241600, NULL, 3),
(154, 'Marcellus Felipe  ', -295408800, 2, 'Buto Bamunanika', '0782-008255', '', 'Peasant', 3, '', '', NULL, 1210032000, 0, 1555726400, 0, 1427241600, NULL, 3),
(155, 'Ulrike Graffam  ', 396046800, 2, 'Kibengo Umea P/S', NULL, '', 'Teacher', 3, '', '', NULL, 1210723200, 0, 1556590400, 0, 1427241600, NULL, 3),
(156, 'Shawnta Deltoro  ', 129506400, 2, 'Luweero T/C', '0752-575266', '', 'CDO Finance', 3, '', '', NULL, 1210636800, 0, 1557454400, 1, 1427241600, NULL, 3),
(157, 'Suzan Tibbs  ', 110408400, 2, 'Kalongo Miti Luweero Tc', NULL, '', 'Cook', 3, '', '', NULL, 1213660800, 0, 1558318400, 1, 1427241600, NULL, 3),
(158, 'Louella Dancy  ', -506829600, 1, 'Mubulizi -Tweyanze C/U', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1240876800, 0, 1559182400, 1, 1427241600, NULL, 3),
(159, 'Ruth Anstine  ', 460760400, 1, 'Nakasongola- Ssasira', NULL, '', 'Boda-Boda Man', 2, '', '', NULL, 1214265600, 0, 1560046400, 1, 1427241600, NULL, 3),
(160, 'Nathanial Ruch  ', -538624800, 1, 'Kasoma Zone', NULL, '', 'Peasant', 2, '', '', NULL, 1214870400, 0, 1560910400, 1, 1427241600, NULL, 3),
(161, 'Gwendolyn Kimbro  ', -167364000, 1, 'Kabeera- Kapeeka', '0788-458668', '', 'Peasant / Farmer', 3, '', '', NULL, 1219104000, 0, 1561774400, 1, 1427241600, NULL, 3),
(162, 'Riley Paugh  ', 28850400, 1, 'Kalongomiti', NULL, '', 'Teacher', 3, '', '', NULL, 1219276800, 0, 1562638400, 1, 1427241600, NULL, 3),
(163, 'Claretha Thibodeau  ', 448840800, 1, 'Kirema- Kapeeke', NULL, '', 'Peasant', 3, '', '', NULL, 1219276800, 0, 1563502400, 1, 1427241600, NULL, 3),
(164, 'Iliana Arends  ', -7200, 2, 'Luweero Boys P/S', NULL, '', 'Deputy Head Teacher', 2, '', '', NULL, 1218499200, 0, 1564366400, 1, 1427241600, NULL, 3),
(165, 'Anjelica Averett  ', -31543200, 2, 'Luweero Ss', '0772-843103', '', 'Teacher', 3, '', '', NULL, 1219881600, 0, 1565230400, 1, 1427241600, NULL, 3),
(166, 'Juli Mey  ', -240026400, 2, 'Kakoola- Sekamuli', '0775-571944', '', 'Farmer', 3, '', '', NULL, 1216684800, 0, 1566094400, 1, 1427241600, NULL, 3),
(167, 'Carlota Bennefield  ', -204170400, 1, 'Kizito Zone Luweero Tc', '0772-496690', '', 'Lecturer Kyambogo University', 3, '', '', NULL, 1220486400, 0, 1566958400, 1, 1427241600, NULL, 3),
(168, 'Karisa Stockstill  ', -62647200, 2, 'Kikoma Village- Wobulenzi Tc', NULL, '', 'Lay-Reader', 2, '', '', NULL, 1170115200, 0, 1567822400, 1, 1427241600, NULL, 3),
(169, 'Carolyn Randle  ', -292212000, 2, 'Kasana Market Zone', '0772-608854', '', 'Inspector of Schools', 3, '', '', NULL, 1221523200, 0, 1568686400, 1, 1427241600, NULL, 3),
(170, 'Therese Conniff  ', 328222800, 2, 'Kasoma Zone', '0773-057019', '', 'CDO Sponsorship', 2, '', '', NULL, 1221523200, 0, 1569550400, 1, 1427241600, NULL, 3),
(171, 'Dagmar Lembo  ', 390690000, 2, 'Namirembe -Kirema Parish', '0774-012894', '', 'Business Woman', 3, '', '', NULL, 1222128000, 0, 1570414400, 1, 1427241600, NULL, 3),
(172, 'Rachelle Ponton  ', -33271200, 1, 'Ndejje', NULL, '', 'Teacher', 3, '', '', NULL, 1223337600, 0, 1571278400, 1, 1427241600, NULL, 3),
(173, 'Zetta Zambrano  ', -251344800, 2, 'Kalongo Miti', '0772-344440', '', 'Business', 3, '', '', NULL, 0, 0, 1572142400, 1, 1427241600, NULL, 3),
(174, 'Hoyt Wolverton  ', 336258000, 1, 'Katuugo Cdc', NULL, '', 'Social Worker', 2, '', '', NULL, 1224547200, 0, 1573006400, 0, 1427241600, NULL, 3),
(175, 'Meagan Spore  ', 399416400, 2, 'Nabagaya', '0774-061011', '', 'Social Worker', 2, '', '', NULL, 1328745600, 0, 1573870400, 1, 1427241600, NULL, 3),
(176, 'Trenton Moreira  ', -221104800, 1, 'Buzzibwera', '0779-268607', '', 'Lay-Reader', 3, '', '', NULL, 1226534400, 0, 1574734400, 1, 1427241600, NULL, 3),
(177, 'Chery Schirmer  ', -42429600, 2, 'Wampewo', NULL, '', 'Teacher', 3, '', '', NULL, 1226966400, 0, 1575598400, 1, 1427241600, NULL, 3),
(178, 'Adah Brumbaugh  ', 218584800, 2, 'Busula', NULL, '', 'Peasant', 2, '', '', NULL, 1329350400, 0, 1576462400, 1, 1427241600, NULL, 3),
(179, 'Albina Ono  ', 292024800, 1, 'Nsawo Cdc', NULL, '', 'Social Worker', 2, '', '', NULL, 1227830400, 0, 1577326400, 1, 1427241600, NULL, 3),
(180, 'Marva Poll  ', 397861200, 1, 'State Anthony-Nakaseke', NULL, '', 'State Attorney Nakaseke', 3, '', '', NULL, 1227744000, 0, 1578190400, 0, 1427241600, NULL, 3),
(181, 'Renata Lamothe  ', 48891600, 2, 'Kiwoko Mixed P/S', '0788-717356', '', 'Teacher', 3, '', '', NULL, 1236038400, 0, 1579054400, 1, 1427241600, NULL, 3),
(182, 'Sharell Mccormick  ', -473047200, 1, 'Timuna Parish', '0772-949273', '', 'Priest', 3, '', '', NULL, 1234828800, 0, 1579918400, 1, 1427241600, NULL, 3),
(183, 'Sharan Beacham  ', -371959200, 1, 'Ndeeba Ss', '0782-065219', '', 'Teacher', 3, '', '', NULL, 1236038400, 0, 1580782400, 1, 1427241600, NULL, 3),
(184, 'Annamae Morano  ', -43380000, 1, 'Kampala Road', NULL, '', 'Business Man', 3, '', '', NULL, 1235001600, 0, 1581646400, 1, 1427241600, NULL, 3),
(185, 'Frederic Capone  ', -338436000, 1, 'Kyetume- Nakaseeta', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1228521600, 0, 1582510400, 1, 1427241600, NULL, 3),
(186, 'Lorina Olden  ', 180565200, 1, 'Kamuli - Kikamulo', '0782-375463', '', 'Business Man', 2, '', '', NULL, 1234828800, 0, 1583374400, 1, 1427241600, NULL, 3),
(187, 'Ty Stgelais  ', -7200, 2, 'Luweero Boys P/S', '0758-888415', '', 'Teacher', 2, '', '', NULL, 1242086400, 0, 1584238400, 1, 1427241600, NULL, 3),
(188, 'Brigette Hathaway  ', 0, 2, 'Kyankonnwa Katuugo Kakooge', '0781577505', '', '', 1, '', '', NULL, 1237248000, 0, 1585102400, 1, 1420070400, NULL, 1),
(189, 'Vanita Eaves  ', -496202400, 2, 'Kasana Market Ltc', '0774-285085', '', 'Teacher', 4, '', '', NULL, 1237248000, 0, 1585966400, 1, 1427241600, NULL, 3),
(190, 'Valentin Kenna  ', 607125600, 1, 'Namirembe -Kirema Parish', '0774-012894', '', 'Mechanic', 2, '', '', NULL, 1245628800, 0, 1586830400, 0, 1443692389, NULL, 3),
(191, 'Fredia Grissett  ', 330296400, 1, 'Kiwoko- Kasana ', '0772-647451', '', 'Business', 2, '', '', NULL, 1250553600, 0, 1587694400, 1, 1427241600, NULL, 3),
(192, 'Lettie Amezcua  ', -916192800, 1, 'Kigavu-Kabaledi, Luweero', '0752-624769', '', 'Lay-Reader', 3, '', '', NULL, 1232409600, 0, 1588558400, 1, 1427241600, NULL, 3),
(193, 'Jayson Reader  ', -179892000, 1, 'Buzzibwera', NULL, '', 'Lay-Reader', 3, '', '', NULL, 1231977600, 0, 1589422400, 1, 1427241600, NULL, 3),
(194, 'Shonna Montenegro  ', 383263200, 1, 'Lumu Zone C/O Luweero S S', NULL, '', 'Teacher', 2, '', '', NULL, 1253145600, 0, 1590286400, 1, 1427241600, NULL, 3),
(195, 'Janell Zager  ', -303530400, 2, 'Kasaala Lc1', '0779-294359', '', 'Peasant', 3, '', '', NULL, 1252368000, 0, 1623978800, 1, 1427241600, NULL, 3),
(196, 'Nan Amarante  ', -176176800, 2, 'St.Luke Ndabilako - Sekamuli', NULL, '', 'Lay-Reader', 1, '', '', NULL, 1252886400, 0, 1592014400, 1, 1427241600, NULL, 3),
(197, 'Cheryll Stiger  ', 0, 2, 'Busula /Wobulenzi', NULL, '', '', 1, '', '', NULL, 1254787200, 0, 1592878400, 1, 1420070400, NULL, 1),
(198, 'Godfrey Kakooza', 327016800, 1, 'Luweero', '0785 2135156', '', 'Teacher', 2, '', '', NULL, 1449097200, 0, 1626225200, 1, 1453113851, NULL, 1),
(199, 'Thomas Aquinus', -1834448400, 1, 'Paris', '0215 544665416', '', 'Theologian', 3, '', '', NULL, 1452726000, 0, 1630718000, 1, 1452792535, NULL, 1),
(200, 'St. Martin of Tours', -604026000, 1, 'Tours', '0', '', 'Bishop', 2, '', '', NULL, 1446678000, 0, 1622942000, 1, 1446715769, 'uploads/photos/cust200_200x260.jpg', 3);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(6, 'Loan Application Fee', 'LAF', 10000),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `incomes`
--

INSERT INTO `incomes` (`inc_id`, `cust_id`, `inctype_id`, `inc_amount`, `inc_date`, `inc_receipt`, `inc_text`, `inc_created`, `user_id`) VALUES
(1, 1, 7, 10000, 1452812400, 1483, '', 1453118784, 1),
(2, 1, 3, 6000, 1454108400, 1484, '', 1453118805, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `loans`
--

INSERT INTO `loans` (`loan_id`, `cust_id`, `loanstatus_id`, `loan_no`, `loan_date`, `loan_dateout`, `loan_issued`, `loan_principal`, `loan_interest`, `cur_id`, `loan_appfee_receipt`, `loan_fee`, `loan_fee_receipt`, `loan_rate`, `loan_period`, `loan_repaytotal`, `loan_repaystart`, `loan_purpose`, `loan_sec1`, `loan_sec2`, `loan_guarant1`, `loan_guarant2`, `loan_guarant3`, `loan_feepaid`, `loan_created`, `user_id`) VALUES
(1, 100, 2, 'L 100-2', 1439935200, 1439935200, 1, 850000, 2.5, 1, 1234, 8500, 87874, '162917', 6, 977500, 0, 'test', 'Cow', '', 1, 2, 3, 0, 1439993579, 1),
(2, 1, 2, 'L-1-1', 1452812400, 1454108400, 1, 600000, 2.5, NULL, 1483, 6000, 1484, '65000', 12, 780000, 0, 'Printing Cost', 'Historic Bible Edition', '', 3, 4, 200, 0, 1453118784, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

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
(33, 3, 1445868136, 1445870449, 1),
(34, 1, 1445868949, 1445871011, 1),
(35, 3, 1446199433, 1446199755, 1),
(36, 3, 1446707610, 1446715844, 1),
(37, 1, 1448958617, 1448961123, 0),
(38, 1, 1448961123, 1448963028, 1),
(39, 1, 1448963640, 1448966978, 1),
(40, 1, 1449129129, 1449129414, 1),
(41, 1, 1449601999, 1449602013, 1),
(42, 1, 1452684441, 1452688772, 0),
(43, 1, 1452688772, 1452689110, 0),
(44, 1, 1452689110, 1452690302, 1),
(45, 1, 1452691084, 1452694128, 0),
(46, 3, 1452693304, 1452693550, 1),
(47, 1, 1452694128, 1452694872, 1),
(48, 1, 1452695554, 1452695717, 1),
(49, 1, 1452771955, 1452775702, 1),
(50, 1, 1452775713, 1452775756, 1),
(51, 1, 1452775768, 1452776097, 1),
(52, 1, 1452776107, 1452780267, 1),
(53, 1, 1452780342, 1452780688, 1),
(54, 1, 1452784272, 1452793499, 1),
(55, 1, 1452855837, 1452856043, 1),
(56, 1, 1452856053, 1452879272, 1),
(57, 1, 1452880292, 1452880297, 1),
(58, 1, 1452880348, 1452927043, 0),
(59, 1, 1452927043, 1452928256, 1),
(60, 1, 1452928467, 1452928519, 1),
(61, 1, 1453103689, 1453106269, 0),
(62, 1, 1453106269, 1453113810, 0),
(63, 1, 1453113810, 1453117194, 0),
(64, 1, 1453117194, 1453125800, 1),
(65, 1, 1453126393, NULL, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ltrans`
--

INSERT INTO `ltrans` (`ltrans_id`, `loan_id`, `ltrans_due`, `ltrans_date`, `ltrans_principaldue`, `ltrans_principal`, `ltrans_interestdue`, `ltrans_interest`, `ltrans_fined`, `ltrans_receipt`, `ltrans_created`, `user_id`) VALUES
(1, 1, 1456956000, 1458424800, 141665, 118750, 21250, 21250, 0, 1234, 1445421102, 3),
(2, 1, 1459634400, 1461103200, 141667, 78750, 21250, 21250, 0, 5678, 1445421253, 3),
(3, 1, 1462312800, 1461103200, 141667, 558750, 21250, 21250, 0, 132, 1445421520, 3),
(4, 1, 1464991200, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1),
(5, 1, 1467669600, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1),
(6, 1, 1470348000, NULL, 141667, NULL, 21250, NULL, 0, NULL, NULL, 1),
(7, 2, 1456786800, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(8, 2, 1459465200, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(9, 2, 1462143600, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(10, 2, 1464822000, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(11, 2, 1467500400, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(12, 2, 1470178800, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(13, 2, 1472857200, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(14, 2, 1475535600, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(15, 2, 1478214000, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(16, 2, 1480892400, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(17, 2, 1483570800, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1),
(18, 2, 1486249200, NULL, 50000, NULL, 15000, NULL, 0, NULL, NULL, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;

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
(8, 8, 1420070400, 0, 1, 1, 0, 0, NULL, 1),
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
(201, 1, 1435183200, 25000, 0, 1, 509, 0, 1453118311, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `securities`
--

INSERT INTO `securities` (`sec_id`, `cust_id`, `loan_id`, `sec_no`, `sec_name`, `sec_value`, `sec_path`, `sec_returned`) VALUES
(1, 100, 1, '1', 'Cow', 0, 'uploads/securities/L-100-2_Security-01.jpg', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
`set_id` int(11) NOT NULL,
  `set_name` varchar(100) NOT NULL,
  `set_short` varchar(8) NOT NULL,
  `set_value` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `settings`
--

INSERT INTO `settings` (`set_id`, `set_name`, `set_short`, `set_value`) VALUES
(1, 'Minimum Savings Balance', 'MSB', '10000'),
(2, 'Minimum Loan Principal', 'MinLP', '500000'),
(3, 'Maximum Loan Principal', 'MaxLP', '10000000'),
(4, 'Currency Abbreviation', 'CUR', 'UGX'),
(5, 'Auto-fine Defaulters', 'AUF', '0'),
(6, 'Account Deactivation', 'DEACT', '0'),
(7, 'Dashboard Left', 'DashL', 'dashboard/dash_loandefaults.php'),
(8, 'Dashboard Right', 'DashR', 'dashboard/dash_none.php');

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
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=latin1;

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
(216, 1, 1442527200, 2, 40000, 728, 0, NULL, 1453118433, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shareval`
--

CREATE TABLE IF NOT EXISTS `shareval` (
`shareval_id` int(11) NOT NULL,
  `shareval_date` int(11) NOT NULL,
  `shareval_value` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `shareval`
--

INSERT INTO `shareval` (`shareval_id`, `shareval_date`, `shareval_value`) VALUES
(1, 1412145318, 20000),
(2, 1415607785, 25000),
(3, 1415607825, 20000),
(4, 1415607939, 20000),
(5, 1417097402, 30000),
(6, 1417097469, 20000),
(7, 1452686229, 20),
(8, 1452686241, 20000),
(9, 1452687361, 2),
(10, 1452687741, 20000),
(11, 1452868456, 20000),
(12, 1452868464, 20000),
(13, 1452868471, 20000),
(14, 1452868527, 120000),
(15, 1452868544, 20000),
(16, 1452869697, 20000),
(17, 1452869820, 20000),
(18, 1453113988, 20000),
(19, 1453114172, 20000),
(20, 1453116147, 20000),
(21, 1453117607, 20000),
(22, 1453117609, 20000);

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
(2, 'Management', 0, 1, 1, 1453124730),
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
(2, 'ext-admin', '3c29a3c4aff054d9557eea510df85960712812d2', 4, 1436350622),
(3, 'John Doe', '3c29a3c4aff054d9557eea510df85960712812d2', 2, 1436350633);

--
-- Indizes der exportierten Tabellen
--

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
MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT;
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
MODIFY `inc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `inctype`
--
ALTER TABLE `inctype`
MODIFY `inctype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `loans`
--
ALTER TABLE `loans`
MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `loanstatus`
--
ALTER TABLE `loanstatus`
MODIFY `loanstatus_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `logrec`
--
ALTER TABLE `logrec`
MODIFY `logrec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT für Tabelle `ltrans`
--
ALTER TABLE `ltrans`
MODIFY `ltrans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT für Tabelle `savings`
--
ALTER TABLE `savings`
MODIFY `sav_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT für Tabelle `savtype`
--
ALTER TABLE `savtype`
MODIFY `savtype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `securities`
--
ALTER TABLE `securities`
MODIFY `sec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `settings`
--
ALTER TABLE `settings`
MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `shares`
--
ALTER TABLE `shares`
MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=217;
--
-- AUTO_INCREMENT für Tabelle `shareval`
--
ALTER TABLE `shareval`
MODIFY `shareval_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
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
