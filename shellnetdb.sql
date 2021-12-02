/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80021
Source Host           : localhost:3306
Source Database       : shellnetdb

Target Server Type    : MYSQL
Target Server Version : 80021
File Encoding         : 65001

Date: 2021-12-02 14:38:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_hotel`
-- ----------------------------
DROP TABLE IF EXISTS `t_hotel`;
CREATE TABLE `t_hotel` (
  `hotelid` int NOT NULL AUTO_INCREMENT,
  `hotelname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country` varchar(40) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `detailaddr` varchar(50) DEFAULT NULL,
  `features` varchar(200) DEFAULT NULL,
  `server` varchar(200) DEFAULT NULL,
  `photourl` varchar(255) DEFAULT NULL,
  `userid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`hotelid`),
  KEY `fk_hotel_userid` (`userid`),
  CONSTRAINT `fk_hotel_userid` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hotel
-- ----------------------------
INSERT INTO `t_hotel` VALUES ('1', 'Zhenmei Holiday Inn (Dali Erhai cliff sea view store)', 'China', 'Yunnan', 'Dali', '5 jixiang road, dali ancient city', '', '', 'Zhenmei Holiday Inn.jpg', 'beike1');
INSERT INTO `t_hotel` VALUES ('2', 'New Palm Inn', 'China', 'Yunnan', 'Dali', '109 yincang Road, Dali ancient city', 'Bai\'s stream courtyard is adjacent to the southeast of the ancient city, 500 meters away from the ancient city, and the door faces a snack street', 'motorcycles', 'New Palm Inn.jpeg', 'beike1');
INSERT INTO `t_hotel` VALUES ('3', 'Kunming International Hotel', 'China', 'Yunnan', 'Kunming', null, null, null, 'New Palm Inn.jpeg', 'peter1');
INSERT INTO `t_hotel` VALUES ('5', 'Sofitel Hotel', 'China', 'Shanghai', 'Shanghai', null, 'Dinner', null, 'sofitel.jpg', 'beike1');
INSERT INTO `t_hotel` VALUES ('6', 'Shangri la Chuyue hotel', 'China', 'Yunnan', 'Shangri la', '23 Xingfu road ', '', '', 'senew.png', 'beike1');

-- ----------------------------
-- Table structure for `t_roomtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_roomtype`;
CREATE TABLE `t_roomtype` (
  `typeid` int NOT NULL AUTO_INCREMENT,
  `hotelid` int NOT NULL,
  `roomtype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `photourl` varchar(255) DEFAULT NULL,
  `area` int DEFAULT NULL,
  `bedtype` varchar(30) DEFAULT NULL,
  `roomserver` varchar(100) DEFAULT NULL,
  `wifi` varchar(10) DEFAULT NULL,
  `personamount` int DEFAULT NULL,
  `roomamount` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`typeid`),
  KEY `fk_hotelid` (`hotelid`),
  CONSTRAINT `fk_hotelid` FOREIGN KEY (`hotelid`) REFERENCES `t_hotel` (`hotelid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roomtype
-- ----------------------------
INSERT INTO `t_roomtype` VALUES ('1', '1', 'Side window Sea View Big Bed Room with balcony', 'Side window Sea View Big bed Room.jpg', '26', 'One Gig Bed', 'Breakfast for two', 'yes', '2', '20', '268');
INSERT INTO `t_roomtype` VALUES ('2', '1', 'Side window Sea View Big Bed Room with balcony', 'Side window Sea View Big bed Room.jpg', '26', 'One Gig Bed', 'Breakfast for two', 'yes', '2', '20', '268');
INSERT INTO `t_roomtype` VALUES ('3', '1', 'Side window Sea View Big Bed Room with balcony', 'Side window Sea View Big bed Room.jpg', '26', 'One Gig Bed', 'Breakfast for two', 'yes', '2', '20', '268');
INSERT INTO `t_roomtype` VALUES ('4', '2', 'Courtyard Big Bed Room', 'Courtyard Big Bed Room.png', '22', 'Double small Bed', 'Breakfast for two', 'yes', '2', '6', '200');
INSERT INTO `t_roomtype` VALUES ('5', '2', 'Courtyard DoubleBed Room', 'Courtyard DoubleBed Room.png', '22', 'One Gig Bed', 'No Breakfast', 'yes', '2', '4', '180');
INSERT INTO `t_roomtype` VALUES ('6', '2', 'Family parent-child Room', 'Family parent-child Room.png', '45', 'One Gig Bed + One  Small Bed', 'No Breakfast', 'yes', '3', '1', '380');
INSERT INTO `t_roomtype` VALUES ('7', '2', 'Family parent-child Suite Room', 'Family parent-child Room.png', '55', 'One Gig Bed + Twod  Small Bed', 'No Breakfast', 'yes', '4', '1', '520');
INSERT INTO `t_roomtype` VALUES ('8', '1', 'Side window Sea View Big Bed Room with balcony', 'Side window Sea View Big bed Room.jpg', '26', 'One Gig Bed', 'Breakfast for two', 'yes', '2', '20', '268');
INSERT INTO `t_roomtype` VALUES ('10', '1', 'Side window Sea View Big Bed Room with balcony', 'Side window Sea View Big bed Room.jpg', '26', 'One Gig Bed', 'Breakfast for two', 'yes', '2', '20', '268');
INSERT INTO `t_roomtype` VALUES ('11', '1', 'Side window Sea View Big Bed Room with balcony', 'Side window Sea View Big bed Room.jpg', '26', 'One Gig Bed', 'Breakfast for two', 'yes', '2', '20', '268');
INSERT INTO `t_roomtype` VALUES ('13', '6', 'hhhh', 'senew.png', '23', 'big', 'wwww', 'yes', '4', '11', '44');
INSERT INTO `t_roomtype` VALUES ('15', '6', 'jjdjdjdj', 'senew.png', '24', 'big', 'jdjdj', 'yes', '20', '20', '2333');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` varchar(40) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `utid` int NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `mail` varchar(40) DEFAULT NULL,
  `companyname` varchar(100) DEFAULT NULL,
  `licencephoto` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`),
  KEY `fk_utid` (`utid`),
  CONSTRAINT `fk_utid` FOREIGN KEY (`utid`) REFERENCES `t_usertype` (`utid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1111', '11111', '1234', '1', '421111', 'gah@gmail.com', 'yves holdings', null, '2021-11-16 08:40:42');
INSERT INTO `t_user` VALUES ('beike1', 'shelladmin1', '000000', '1', '188773553636627', 'beike1@qq.com', 'Shell global hotel reservation network', null, '2021-11-29 14:33:40');
INSERT INTO `t_user` VALUES ('Bill123', 'Bill Gates', '666666', '2', '04144343566', null, null, null, '2021-11-11 18:47:05');
INSERT INTO `t_user` VALUES ('bright', 'Brighter', '111111', '2', null, null, null, null, '2021-10-28 14:54:45');
INSERT INTO `t_user` VALUES ('David445', 'David', '000000', '1', '1374828728648', '444555@qq.com', null, null, '2021-10-28 14:54:53');
INSERT INTO `t_user` VALUES ('gudh123', 'Gu Donghu', '123456', '2', '1242412412', 'gudh@gmail.om', null, null, '2021-11-15 14:51:22');
INSERT INTO `t_user` VALUES ('Jerry123', 'Jerry Wang', '000000', '1', null, null, null, null, '2021-09-16 17:02:33');
INSERT INTO `t_user` VALUES ('peter1', 'peter Williams', 'pwd', '1', '654322345', null, null, null, '2021-10-28 22:14:39');
INSERT INTO `t_user` VALUES ('saif', 'saif', '123456', '2', '1234689777', 'saif@gmail.om', null, null, '2021-11-15 14:34:50');

-- ----------------------------
-- Table structure for `t_usertype`
-- ----------------------------
DROP TABLE IF EXISTS `t_usertype`;
CREATE TABLE `t_usertype` (
  `utid` int NOT NULL,
  `utname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`utid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_usertype
-- ----------------------------
INSERT INTO `t_usertype` VALUES ('1', 'hotel administrator', 'Manage own hotel information and view own hotel orders');
INSERT INTO `t_usertype` VALUES ('2', 'Ordinary member', 'You can book hotel rooms and view your hotel ordering history');

-- ----------------------------
-- View structure for `v_user`
-- ----------------------------
DROP VIEW IF EXISTS `v_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user` AS select `t_user`.`utid` AS `utid`,`t_user`.`userid` AS `userid`,`t_user`.`username` AS `username`,`t_user`.`pwd` AS `pwd`,`t_user`.`mobile` AS `mobile`,`t_user`.`mail` AS `mail`,`t_user`.`companyname` AS `companyname`,`t_user`.`licencephoto` AS `licencephoto`,`t_user`.`createtime` AS `createtime`,`t_usertype`.`utname` AS `utname` from (`t_user` join `t_usertype` on((`t_user`.`utid` = `t_usertype`.`utid`))) ;

-- ----------------------------
-- Procedure structure for `up_getsystime`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_getsystime`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `up_getsystime`()
BEGIN
	#Routine body goes here...
	SELECT CURRENT_TIMESTAMP;
END
;;
DELIMITER ;
