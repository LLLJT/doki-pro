/*
Navicat MySQL Data Transfer

Source Server         : dokiiiii
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : doki

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2020-05-31 02:12:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogtitle` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blogcontent` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blogtypeid` int(11) NOT NULL,
  `blogwatch` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `check_flag` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `blogtype_fk` (`blogtypeid`),
  CONSTRAINT `blogtype_fk` FOREIGN KEY (`blogtypeid`) REFERENCES `blogtype` (`blogtypeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userid_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '哇啊啊啊我死了', 'blog的内容，待补充', '1', '0', '11', null, '1');
INSERT INTO `blog` VALUES ('2', '震惊', '我发帖了', '2', '0', '11', null, '1');
INSERT INTO `blog` VALUES ('3', '嘿嘿', 'warma又更新了', '3', '0', '11', null, '1');
INSERT INTO `blog` VALUES ('4', 'yoyoyoyo', 'ahashhsad', '1', '0', '11', null, '1');

-- ----------------------------
-- Table structure for blogcollect
-- ----------------------------
DROP TABLE IF EXISTS `blogcollect`;
CREATE TABLE `blogcollect` (
  `id` int(11) NOT NULL,
  `blogid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogid` (`blogid`),
  KEY `userid` (`userid`),
  CONSTRAINT `blogcollect_ibfk_1` FOREIGN KEY (`blogid`) REFERENCES `blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blogcollect_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blogcollect
-- ----------------------------

-- ----------------------------
-- Table structure for blogcomment
-- ----------------------------
DROP TABLE IF EXISTS `blogcomment`;
CREATE TABLE `blogcomment` (
  `id` int(11) NOT NULL,
  `blogid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogid` (`blogid`),
  KEY `userid` (`userid`),
  CONSTRAINT `blogcomment_ibfk_1` FOREIGN KEY (`blogid`) REFERENCES `blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blogcomment_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blogcomment
-- ----------------------------

-- ----------------------------
-- Table structure for blogtype
-- ----------------------------
DROP TABLE IF EXISTS `blogtype`;
CREATE TABLE `blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogtypeid` int(11) NOT NULL,
  `typename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogtypeid` (`blogtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blogtype
-- ----------------------------
INSERT INTO `blogtype` VALUES ('2', '1', '分类1');
INSERT INTO `blogtype` VALUES ('3', '2', '分类2');
INSERT INTO `blogtype` VALUES ('4', '3', '分类3');
INSERT INTO `blogtype` VALUES ('5', '4', '分类4');

-- ----------------------------
-- Table structure for hotword
-- ----------------------------
DROP TABLE IF EXISTS `hotword`;
CREATE TABLE `hotword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotcontent` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of hotword
-- ----------------------------
INSERT INTO `hotword` VALUES ('1', '赌王大方小女儿状告胞姐', '50');
INSERT INTO `hotword` VALUES ('2', '张文宏高福对疫苗的最新判断', '49');
INSERT INTO `hotword` VALUES ('3', '母猪上树了', '33');
INSERT INTO `hotword` VALUES ('4', '辉夜大小姐更新了', '20');
INSERT INTO `hotword` VALUES ('5', '高三生或将取消高考', '91');
INSERT INTO `hotword` VALUES ('6', '哈哈哈哈哈', '12');
INSERT INTO `hotword` VALUES ('7', 'ljtnb', '1111');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '1', 'admin');
INSERT INTO `role` VALUES ('2', '2', 'user');
INSERT INTO `role` VALUES ('3', '3', 'vtuber');

-- ----------------------------
-- Table structure for searchresult
-- ----------------------------
DROP TABLE IF EXISTS `searchresult`;
CREATE TABLE `searchresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `searchtitle` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `searchcontent` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `searchtime` date DEFAULT NULL,
  `userid` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `searchresult_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of searchresult
-- ----------------------------
INSERT INTO `searchresult` VALUES ('6', 'aaa', null, null, '11');
INSERT INTO `searchresult` VALUES ('7', 'aaa', null, '2020-05-31', '11');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telephone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `blogcount` int(11) DEFAULT NULL,
  `roleid` int(11) NOT NULL DEFAULT '2',
  `birthday` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`username`),
  KEY `role` (`roleid`) USING BTREE,
  KEY `id` (`id`),
  CONSTRAINT `role` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=201820 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'LLLJT', '123456', '16', '男', '1512556489', '1', '2', null, null, null);
INSERT INTO `user` VALUES ('2', 'Ocean', '012345', '15', '男', '1812654324', '1', '2', null, null, null);
INSERT INTO `user` VALUES ('3', 'Forest', '654789', '17', '女', '1398796542', '1', '2', null, null, null);
INSERT INTO `user` VALUES ('4', 'Desert', '963852', '16', '男', '1655974561', '1', '2', null, null, null);
INSERT INTO `user` VALUES ('5', 'huawuyu', '741852', '19', '男', '1614569231', '1', '2', null, null, null);
INSERT INTO `user` VALUES ('6', '伪物语', '963321', '15', '男', '1398796542', '0', '2', null, null, null);
INSERT INTO `user` VALUES ('7', '猫物语', '456123', '15', '女', '1658943256', '1', '2', null, null, null);
INSERT INTO `user` VALUES ('8', '化物语', '698745', '14', '女', '1698743215', '0', '2', null, null, null);
INSERT INTO `user` VALUES ('9', '花物语', '654321', '17', '女', '1915201314', '0', '2', null, null, null);
INSERT INTO `user` VALUES ('10', '伤物语', '987321', '15', '女', '1412635201', '0', '2', null, null, null);
INSERT INTO `user` VALUES ('11', 'LLLLJT', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '0', '1', null, null, null);
INSERT INTO `user` VALUES ('201812', '卡其脱离太', 'e10adc3949ba59abbe56e057f20f883e', '13', '男', '13113113331', '0', '2', null, null, null);
INSERT INTO `user` VALUES ('201813', 'waaaaaaaa', 'f725a541c3b8b155d595ff08928d5c44', '15', '男', '13333333333', null, '2', '2010-04-25', 'aaaaaaaaa', null);
INSERT INTO `user` VALUES ('201814', 'waaaaaaa', 'fc5e038d38a57032085441e7fe7010b0', '15', '男', '13344445555', null, '2', '1997-04-26', '13333333', null);
INSERT INTO `user` VALUES ('201815', 'huawuyu', '4f0b36a34946153c358f8b243428a1eb', '17', '女', '12121212121', null, '2', '2020-05-26', '133333', null);
INSERT INTO `user` VALUES ('201816', 'waaaaaaa', '0ff5247ca8a0dd247b3ed7428922b7ef', '16', '男', '13131313131', null, '2', '2019-05-26', '12121212121', null);
INSERT INTO `user` VALUES ('201817', 'waaaaaaa', '4f0b36a34946153c358f8b243428a1eb', '12', '女', '12121212121', null, '1', '2020-05-26', '2312321312', null);
INSERT INTO `user` VALUES ('201818', 'LLLLJT111', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '13', '男', '12121212121', null, '1', '2020-05-17', '1321312321323', null);
INSERT INTO `user` VALUES ('201819', '哈哈哈哈哈哈', '1681fb94fcc62a9ae48575ab67acc0c6', '16', '女', '12121212121', null, '2', '2017-05-26', '123321312321', null);

-- ----------------------------
-- Table structure for vtuber
-- ----------------------------
DROP TABLE IF EXISTS `vtuber`;
CREATE TABLE `vtuber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Vname` varchar(45) NOT NULL,
  `soundquality` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `petphrase` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hobby` varchar(45) DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `character` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of vtuber
-- ----------------------------
INSERT INTO `vtuber` VALUES ('1', 'ほしの わたる', '中村优一', '无', '运动', '175', '59', '冷静');
INSERT INTO `vtuber` VALUES ('2', 'さわき りんな', '河合春华', '无', '运动', '161', '49', '开朗');
INSERT INTO `vtuber` VALUES ('3', 'はやま うみ', '石川乃奈', '无', '做菜', '158', '43', '内向');
INSERT INTO `vtuber` VALUES ('4', 'あさくら なおこ', '筱崎双叶', '无', '学习', '165', '52', '认真');
INSERT INTO `vtuber` VALUES ('5', 'ろくじょう みやほ', '草柳顺子', '无', '冷笑话', '154', '44', '可爱');
INSERT INTO `vtuber` VALUES ('6', 'ふじむら しず', '北都南', '无', '做菜', '147', '41', '内向');
INSERT INTO `vtuber` VALUES ('7', 'きりしま さえり', '凉宫琉那', '无', '喝酒', '153', '44', '开朗');

-- ----------------------------
-- Table structure for wordrequest
-- ----------------------------
DROP TABLE IF EXISTS `wordrequest`;
CREATE TABLE `wordrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updatecontent` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of wordrequest
-- ----------------------------
