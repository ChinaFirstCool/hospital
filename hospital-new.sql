/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : hospital

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 16/03/2021 11:33:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '科室id',
  `departmentName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室名称',
  `departmentDesc` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室介绍',
  `birthDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成立日期',
  `chargeMan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  PRIMARY KEY (`departmentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (1, '眼鼻猴科', '<p>眼鼻猴科眼鼻猴科眼鼻猴科眼鼻猴科眼鼻猴科眼鼻猴科眼鼻猴科眼鼻猴科眼鼻猴科</p>', '2021-03-16', '赵');

-- ----------------------------
-- Table structure for t_doctor
-- ----------------------------
DROP TABLE IF EXISTS `t_doctor`;
CREATE TABLE `t_doctor`  (
  `doctorNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'doctorNumber',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `departmentObj` int(11) NOT NULL COMMENT '所在科室',
  `doctorName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生姓名',
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `doctorPhoto` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生照片',
  `birthDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生职位',
  `experience` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作经验',
  `contactWay` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `goodAt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '擅长',
  `doctorDesc` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生介绍',
  PRIMARY KEY (`doctorNumber`) USING BTREE,
  INDEX `departmentObj`(`departmentObj`) USING BTREE,
  CONSTRAINT `t_doctor_ibfk_1` FOREIGN KEY (`departmentObj`) REFERENCES `t_department` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_doctor
-- ----------------------------
INSERT INTO `t_doctor` VALUES ('00001', '123456', 1, '王医生', '男', 'upload/f12349f2-cd83-4c57-8fe1-869771797c8f.png', '2006-03-07', '主治医师', '5年', '1824458579', '骨科', '<p>擅长救治病人擅长救治病人擅长救治病人擅长救治病人</p>');

-- ----------------------------
-- Table structure for t_leaveword
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword`  (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `leaveTitle` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言时间',
  `replyContent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理回复',
  `replyTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`leaveWordId`) USING BTREE,
  INDEX `userObj`(`userObj`) USING BTREE,
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES (1, '注意留言', '注意留言注意留言注意留言注意留言', 'user', '2021-03-16 09:34:07', '回复回复回复回复', '2021-03-16 09:34:18');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `newsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻id',
  `newsTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻标题',
  `newsPhoto` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻图片',
  `newsContent` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻内容',
  `newsDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻日期',
  `newsFrom` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻来源',
  PRIMARY KEY (`newsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES (1, '新闻标题', 'upload/NoImage.jpg', '<p>新闻标题新闻标题新闻标题新闻标题新闻标题</p>', '2021-03-16', '来');

-- ----------------------------
-- Table structure for t_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo`  (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约id',
  `userObj` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约用户',
  `doctorObj` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约医生',
  `orderDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约日期',
  `timeInterval` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时段',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `orderTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  `checkState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理状态',
  `replyContent` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生回复',
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `userObj`(`userObj`) USING BTREE,
  INDEX `doctorObj`(`doctorObj`) USING BTREE,
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_orderinfo_ibfk_2` FOREIGN KEY (`doctorObj`) REFERENCES `t_doctor` (`doctorNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES (1, 'user', '00001', '2021-03-16', '34546', '43567545', '2021-03-16 09:34:46', '问问', '医生回复医生回复医生回复医生回复');

-- ----------------------------
-- Table structure for t_patient
-- ----------------------------
DROP TABLE IF EXISTS `t_patient`;
CREATE TABLE `t_patient`  (
  `patientId` int(11) NOT NULL AUTO_INCREMENT COMMENT '病人id',
  `doctorObj` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生',
  `patientName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '病人姓名',
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `cardNumber` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `illnessCase` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '病人病例',
  `addTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记时间',
  PRIMARY KEY (`patientId`) USING BTREE,
  INDEX `doctorObj`(`doctorObj`) USING BTREE,
  CONSTRAINT `t_patient_ibfk_1` FOREIGN KEY (`doctorObj`) REFERENCES `t_doctor` (`doctorNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_patient
-- ----------------------------
INSERT INTO `t_patient` VALUES (1, '00001', '狗剩', '男', '1235686796432314', '24565734234', '<p><span style=\"font-size: 14px; text-align: right;\">病人病例</span><span style=\"font-size: 14px; text-align: right;\">病人病例</span><span style=\"font-size: 14px; text-align: right;\">病人病例</span><span style=\"font-size: 14px; text-align: right;\">病人病例</span><span style=\"font-size: 14px; text-align: right;\">病人病例</span><span style=\"font-size: 14px; text-align: right;\">病人病例</span><span style=\"font-size: 14px; text-align: right;\">病人病例</span></p>', '2021-03-16 09:31:55');

-- ----------------------------
-- Table structure for t_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo`  (
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user_name',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `birthDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `userPhoto` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `address` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `regTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user', '123456', 'user', '男', '2021-03-16', 'upload/NoImage.jpg', '13254635', '3254636', '34654', '2021-03-16 09:33:40');

SET FOREIGN_KEY_CHECKS = 1;
