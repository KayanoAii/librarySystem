/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : librarydatabase

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2017-07-27 22:06:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_table`
-- ----------------------------
DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE `admin_table` (
  `adminid` int(4) NOT NULL,
  `adminname` varchar(50) NOT NULL,
  `adminpassword` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `sex` char(4) NOT NULL,
  `level` int(2) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_table
-- ----------------------------

-- ----------------------------
-- Table structure for `book_info_table`
-- ----------------------------
DROP TABLE IF EXISTS `book_info_table`;
CREATE TABLE `book_info_table` (
  `ISBN` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `press` varchar(50) NOT NULL,
  `yearofpublication` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `number` int(4) NOT NULL,
  `image` varchar(50) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_info_table
-- ----------------------------
INSERT INTO `book_info_table` VALUES ('1234', '你的朋友是谁', '弘', '日本', '1234', '人文社科', '8', '1.jpg');
INSERT INTO `book_info_table` VALUES ('1235', '谁是你的朋友', '弘', '日本', '1997', '生活方式', '7', '2.jpg');
INSERT INTO `book_info_table` VALUES ('1236', '中', '弘', '日本', '1234', '职场成长', '8', '3.jpg');
INSERT INTO `book_info_table` VALUES ('1237', '六级词汇', '俞敏洪', '中国', '5678', '技能学习', '22', '4.jpg');
INSERT INTO `book_info_table` VALUES ('1238', '匆匆', '清', '新华', '1234', '商业经济', '12', '5.jpg');
INSERT INTO `book_info_table` VALUES ('1239', '你的朋友', '弘', '新华', '1997', '心理情感', '0', '6.jpg');

-- ----------------------------
-- Table structure for `lend_book_list`
-- ----------------------------
DROP TABLE IF EXISTS `lend_book_list`;
CREATE TABLE `lend_book_list` (
  `ISBN` varchar(50) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `lendnumber` int(4) NOT NULL COMMENT '图书被借阅的次数',
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lend_book_list
-- ----------------------------
INSERT INTO `lend_book_list` VALUES ('1235', '谁是你的朋友', '5');
INSERT INTO `lend_book_list` VALUES ('1237', '六级词汇', '14');
INSERT INTO `lend_book_list` VALUES ('1238', '匆匆', '17');

-- ----------------------------
-- Table structure for `lend_book_table`
-- ----------------------------
DROP TABLE IF EXISTS `lend_book_table`;
CREATE TABLE `lend_book_table` (
  `ISBN` varchar(50) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `borrowtime` varchar(50) NOT NULL,
  `returntime` varchar(50) NOT NULL,
  PRIMARY KEY (`username`,`borrowtime`,`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lend_book_table
-- ----------------------------
INSERT INTO `lend_book_table` VALUES ('1237', '六级词汇', 'a', ' 2017-07-27 13:50:29', '');
INSERT INTO `lend_book_table` VALUES ('1235', '谁是你的朋友', 'a', ' 2017-07-27 13:54:09', '');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `usrid` int(4) NOT NULL AUTO_INCREMENT,
  `usrname` varchar(8) NOT NULL,
  `usrsex` varchar(50) DEFAULT NULL,
  `usrage` int(4) DEFAULT NULL,
  `usrtell` varchar(50) DEFAULT NULL,
  `vocation` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `usrpass` varchar(200) NOT NULL,
  `image` varchar(255) DEFAULT 'pic.png',
  PRIMARY KEY (`usrid`),
  UNIQUE KEY `usrtell` (`usrtell`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('12', '成龙', '男', '30', '18900738069', '老板', '江油市瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('13', '孙中山', '女', '32', '18890718050', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('14', '王璐', '女', '21', '13860928097', '老师', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('15', '李逍遥', '男', '29', '13770428099', '工程师', '资阳市', 'a', null);
INSERT INTO `user_info` VALUES ('16', '陈东', '男', '35', '18910738069', '农民', '绵阳市瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('17', '杨丽', '女', '35', '18690718050', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('18', '黎辉', '男', '19', '13750728099', '工程师', '资阳市', 'a', null);
INSERT INTO `user_info` VALUES ('19', '张帅', '男', '26', '18930738069', '老板', '江油市瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('20', '刘备', '男', '101', '18090718050', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('21', '曹操', '男', '43', '13770718099', '程序员', '德阳市', 'a', null);
INSERT INTO `user_info` VALUES ('22', '江源', '男', '29', '15900738069', '老板', '江油市瑞安路20号', 'aa', null);
INSERT INTO `user_info` VALUES ('23', '李世民', '男', '30', '18902738060', '公务员', '金堂县瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('24', '张飞', '男', '55', '18870718050', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('25', '关羽', '男', '19', '13774728099', '个体户', '泸州市', 'a', null);
INSERT INTO `user_info` VALUES ('26', '韩信', '男', '56', '18912738069', '个体户', '江油市瑞安路20号', 'aa', null);
INSERT INTO `user_info` VALUES ('27', '赵军', '男', '19', '18890718051', '建筑师', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('28', '黄米', '男', '19', '13780728099', '工程师', '资阳市', 'aa', null);
INSERT INTO `user_info` VALUES ('29', '朱德伦', '男', '30', '18967738069', '老板', '瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('30', '杨晓丽', '女', '38', '11490718050', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('33', '唐莉', '女', '21', '13600028097', '老师', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('34', '李遥', '女', '29', '13570428099', '工程师', '资阳市', 'a', null);
INSERT INTO `user_info` VALUES ('35', '王飞鸿', '男', '39', '18910178069', '农民', '绵阳市瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('36', '杨一番', '女', '35', '15691718050', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('37', '孙膑', '男', '19', '13850728099', '工程师', '资阳市', 'a', null);
INSERT INTO `user_info` VALUES ('38', '夏邑', '男', '26', '18333738069', '老板', '江油市瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('39', '刘一备', '男', '19', '18280718050', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('40', '胡辉', '男', '32', '18590718050', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('41', '张某', '男', '19', '13710728099', '工程师', '资阳市', 'a', null);
INSERT INTO `user_info` VALUES ('42', '曾国藩', '男', '30', '18902838060', '公务员', '金堂县瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('43', '关山', '男', '19', '13774448099', '个体户', '泸州市', 'a', null);
INSERT INTO `user_info` VALUES ('44', '韩寒', '男', '56', '89000038069', '作家', '山东省', 'a', null);
INSERT INTO `user_info` VALUES ('45', '赵一军', '男', '19', '16600718051', '建筑师', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('46', '黄老邪', '男', '190', '13550728099', '工程师', '内江市', 'a', null);
INSERT INTO `user_info` VALUES ('47', '孟非', '男', '30', '10167738069', '主持人', '江苏', 'aa', null);
INSERT INTO `user_info` VALUES ('48', '晓丽', '女', '30', '67890718050', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('52', '唐名号', '男', '21', '13600128097', '老师', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('53', '李一遥', '女', '29', '13440428099', '工程师', '资阳市', 'a', null);
INSERT INTO `user_info` VALUES ('54', '王鸿', '男', '39', '18010178069', '农民', '绵阳市瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('55', '杨一', '女', '35', '15691718059', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('56', '孙吴', '男', '19', '13858728099', '工程师', '资阳市', 'aa', null);
INSERT INTO `user_info` VALUES ('58', '赵一备', '男', '19', '182807180', '个体户', '资中10号', 'a', null);
INSERT INTO `user_info` VALUES ('59', '曹林', '男', '43', '13330718099', '程序员', '德阳市', 'a', null);
INSERT INTO `user_info` VALUES ('60', '江珊', '女', '29', '15679738069', '老板', '江油市瑞安路20号', 'a', null);
INSERT INTO `user_info` VALUES ('61', '胡辉明', '男', '32', '18590718151', '个体户', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('62', '曾藩', '男', '30', '189028456060', '公务员', '金堂县', 'a', null);
INSERT INTO `user_info` VALUES ('63', '许三多', '男', '55', '14370718050', '军人', '资中瑞安路10号', 'a', null);
INSERT INTO `user_info` VALUES ('64', '关伦', '男', '19', '13774698099', '个体户', '泸州市', 'a', null);
INSERT INTO `user_info` VALUES ('65', '韩微寒', '男', '56', '89061038069', '作家', '山东省', 'a', null);
INSERT INTO `user_info` VALUES ('68', '孟一非', '男', '30', '1016338069', '主持人', '江苏', 'a', null);
INSERT INTO `user_info` VALUES ('115', '侯德健', '男', '25', '7777377', '歌手', '香港金沙路', 'a', null);
INSERT INTO `user_info` VALUES ('116', '毛泽西', '男', '27', '9953999', '公务员', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('117', '林立风', '男', '42', '99990099', '公务员', '台州市', 'a', null);
INSERT INTO `user_info` VALUES ('118', '三文鱼', '男', '32', '93229999', '公务员', '石家庄市', 'a', null);
INSERT INTO `user_info` VALUES ('119', '小明', '男', '32', '999097699', '工人', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('120', '林萧峰', '男', '42', '72342775', '服务员', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('122', '林立果', '男', '22', '955999999', '公务员', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('124', '林立果', '男', '22', '1100999', '公务员', '北京市', 'aa', null);
INSERT INTO `user_info` VALUES ('126', '赵小兰', '女', '29', '1308863223', '商人', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('127', '韩寒阅', '男', '22', '99565690', '公务员', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('128', '万果', '男', '22', '1238999', '公务员', '台州', 'a', null);
INSERT INTO `user_info` VALUES ('129', '美猴王', '男', '20', '999888899', '公务员', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('130', '赵小玲', '女', '22', '7777777', '服务员', '北京市', 'a', null);
INSERT INTO `user_info` VALUES ('131', '秦汉', '男', '22', '979549', '演员', '台北', 'a', null);
INSERT INTO `user_info` VALUES ('132', '谢霆锋', '男', '22', '99945345', '歌手', '台北', 'a', null);
INSERT INTO `user_info` VALUES ('133', '阿娇', '女', '22', '99770929', '公务员', '台南', 'a', null);
INSERT INTO `user_info` VALUES ('134', '王帅帅', '男', '19', '02887879930', '设计师', '中山市', 'a', null);
INSERT INTO `user_info` VALUES ('136', '张伟', '男', '20', '13,984,280,788', '教师', '乐山市', 'a', null);
INSERT INTO `user_info` VALUES ('138', '李毅', '男', '19', '13,880,428,077', '律师', '成都市', 'a', null);
INSERT INTO `user_info` VALUES ('140', '徐向东', '男', '21', '13,882,408,382', '工人', '绵阳市', 'a', null);
INSERT INTO `user_info` VALUES ('141', '徐娜', '女', '19', '18,832,079,432', '学生', '德阳市', 'a', null);
INSERT INTO `user_info` VALUES ('142', '向裴', '女', '18', '13,170,832,907', '护士', '汉源县', 'a', null);
INSERT INTO `user_info` VALUES ('153', '何艳', '女', '19', '13,380,428,077', '律师', '成都市', 'a', null);
INSERT INTO `user_info` VALUES ('154', '孙正平', '男', '20', '13,684,280,788', '教师', '乐山市', 'aa', null);
INSERT INTO `user_info` VALUES ('155', '马翔', '男', '21', '13,892,408,382', '工人', '绵阳市', 'a', null);
INSERT INTO `user_info` VALUES ('156', '李煜', '女', '19', '18,832,579,432', '学生', '德阳市', 'a', null);
INSERT INTO `user_info` VALUES ('157', '佩琪林', '女', '18', '13,170,432,907', '护士', '汉源县', 'aa', null);
INSERT INTO `user_info` VALUES ('159', 'a', null, null, null, null, null, '123', 'pic.png');
INSERT INTO `user_info` VALUES ('160', 'aaa', null, null, null, null, null, '123', 'pic.png');
INSERT INTO `user_info` VALUES ('161', '123', null, null, null, null, null, '123', 'pic.png');

-- ----------------------------
-- View structure for `commend`
-- ----------------------------
DROP VIEW IF EXISTS `commend`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `commend` AS select `book_info_table`.`ISBN` AS `ISBN`,`book_info_table`.`name` AS `name`,`book_info_table`.`author` AS `author`,`book_info_table`.`press` AS `press`,`book_info_table`.`yearofpublication` AS `yearofpublication`,`book_info_table`.`category` AS `catogory`,`book_info_table`.`number` AS `number`,`lend_book_list`.`lendnumber` AS `lendnumber` from (`lend_book_list` left join `book_info_table` on((`lend_book_list`.`ISBN` = `book_info_table`.`ISBN`))) ;
