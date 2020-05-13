/*
Navicat MySQL Data Transfer

Source Server         : connect
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : examsystem

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2020-05-13 23:39:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for academy
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of academy
-- ----------------------------
INSERT INTO `academy` VALUES ('1', '数学与计算机学院');
INSERT INTO `academy` VALUES ('2', '农学院');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `professionId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `professionId` (`professionId`),
  CONSTRAINT `professionId` FOREIGN KEY (`professionId`) REFERENCES `profession` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '计科1161', '1');
INSERT INTO `class` VALUES ('2', '计科1162', '1');
INSERT INTO `class` VALUES ('3', '计科1163', '1');
INSERT INTO `class` VALUES ('4', '计科1164', '1');
INSERT INTO `class` VALUES ('5', '软件1161', '2');
INSERT INTO `class` VALUES ('6', '软件1162', '2');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `classIds` varchar(255) NOT NULL,
  `filePath` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId1` (`subjectId`),
  CONSTRAINT `subjectId1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('19', '1', '1,2,3,4,5', '高等数学1.xlsx', '60');
INSERT INTO `exam` VALUES ('20', '2', '1,2,3,4,5,6', '高等数学2.xlsx', '90');

-- ----------------------------
-- Table structure for exam_info
-- ----------------------------
DROP TABLE IF EXISTS `exam_info`;
CREATE TABLE `exam_info` (
  `studentId` varchar(20) NOT NULL,
  `examId` int(11) NOT NULL,
  `score` int(5) NOT NULL,
  PRIMARY KEY (`studentId`,`examId`),
  KEY `examId` (`examId`),
  CONSTRAINT `examId` FOREIGN KEY (`examId`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentId1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_info
-- ----------------------------
INSERT INTO `exam_info` VALUES ('201611621123', '19', '100');
INSERT INTO `exam_info` VALUES ('201611621123', '20', '100');
INSERT INTO `exam_info` VALUES ('201611621124', '19', '100');
INSERT INTO `exam_info` VALUES ('201611621223', '19', '100');
INSERT INTO `exam_info` VALUES ('201611621223', '20', '60');
INSERT INTO `exam_info` VALUES ('201611621224', '19', '100');
INSERT INTO `exam_info` VALUES ('201611621224', '20', '60');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('5', '高等数学1考试已发布，考试时长60分钟，请需要参加考试的同学们尽快完成考试');
INSERT INTO `message` VALUES ('6', '高等数学2考试已发布，考试时长90分钟，请需要参加考试的同学们尽快完成考试');

-- ----------------------------
-- Table structure for message_info
-- ----------------------------
DROP TABLE IF EXISTS `message_info`;
CREATE TABLE `message_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(20) NOT NULL,
  `messageId` int(11) NOT NULL,
  `isRead` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messageId` (`messageId`),
  KEY `studentId2` (`studentId`),
  CONSTRAINT `messageId` FOREIGN KEY (`messageId`) REFERENCES `message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentId2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_info
-- ----------------------------
INSERT INTO `message_info` VALUES ('1', '201611621101', '5', '0');
INSERT INTO `message_info` VALUES ('2', '201611621101', '6', '0');
INSERT INTO `message_info` VALUES ('3', '201611621102', '5', '0');
INSERT INTO `message_info` VALUES ('4', '201611621102', '6', '0');
INSERT INTO `message_info` VALUES ('5', '201611621103', '5', '0');
INSERT INTO `message_info` VALUES ('6', '201611621103', '6', '0');
INSERT INTO `message_info` VALUES ('7', '201611621123', '5', '1');
INSERT INTO `message_info` VALUES ('8', '201611621123', '6', '1');
INSERT INTO `message_info` VALUES ('9', '201611621124', '5', '0');
INSERT INTO `message_info` VALUES ('10', '201611621124', '6', '0');
INSERT INTO `message_info` VALUES ('11', '201611621125', '5', '0');
INSERT INTO `message_info` VALUES ('12', '201611621125', '6', '0');

-- ----------------------------
-- Table structure for practice
-- ----------------------------
DROP TABLE IF EXISTS `practice`;
CREATE TABLE `practice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `options` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `analysis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  CONSTRAINT `subjectId` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of practice
-- ----------------------------
INSERT INTO `practice` VALUES ('1', '1', '1', '3+4=？', '1$$2$$7$$4', 'C', '3+4=7，答错是猪');
INSERT INTO `practice` VALUES ('3', '1', '1', '1+2=？', '1$$2$$3$$4', 'C', '1+2=3，答错是猪');
INSERT INTO `practice` VALUES ('4', '2', '2', '1+2=？', '1$$3$$3$$4', 'BC', '1+2=3，答错是猪');
INSERT INTO `practice` VALUES ('5', '2', '3', '1+2=$$', '', '3', '1+2=3，答错是猪');
INSERT INTO `practice` VALUES ('6', '2', '3', '1+2=$$', '', '3', '1+2=3，答错是猪');
INSERT INTO `practice` VALUES ('7', '1', '1', '2+2=?', '1$$2$$3$$4', 'D', '2+2=4');
INSERT INTO `practice` VALUES ('8', '1', '2', '2+2=?', '1$$2$$4$$4', 'CD', '2+2=4');
INSERT INTO `practice` VALUES ('9', '2', '3', '2+2=$$', '', '4', '2+2=4');

-- ----------------------------
-- Table structure for practice_info
-- ----------------------------
DROP TABLE IF EXISTS `practice_info`;
CREATE TABLE `practice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(20) NOT NULL,
  `practiceId` int(11) NOT NULL,
  `isError` int(5) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studentId` (`studentId`) USING BTREE,
  KEY `practiceId` (`practiceId`) USING BTREE,
  CONSTRAINT `practiceId` FOREIGN KEY (`practiceId`) REFERENCES `practice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentId` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of practice_info
-- ----------------------------
INSERT INTO `practice_info` VALUES ('16', '201611621123', '6', '0', '3');
INSERT INTO `practice_info` VALUES ('17', '201611621123', '5', '0', '3');
INSERT INTO `practice_info` VALUES ('18', '201611621123', '1', '1', '');
INSERT INTO `practice_info` VALUES ('20', '201611621123', '3', '1', '');
INSERT INTO `practice_info` VALUES ('21', '201611621123', '4', '1', '');
INSERT INTO `practice_info` VALUES ('22', '201611621123', '8', '0', 'CD');
INSERT INTO `practice_info` VALUES ('23', '201611621123', '9', '1', '');
INSERT INTO `practice_info` VALUES ('24', '201611621123', '7', '1', '');

-- ----------------------------
-- Table structure for profession
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `academyId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profession
-- ----------------------------
INSERT INTO `profession` VALUES ('1', '计算机科学与技术', '1');
INSERT INTO `profession` VALUES ('2', '软件工程', '1');
INSERT INTO `profession` VALUES ('3', '物联网工程', '1');
INSERT INTO `profession` VALUES ('4', '林学', '2');
INSERT INTO `profession` VALUES ('5', '养殖', '3');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sex` int(1) NOT NULL,
  `classId` int(11) NOT NULL,
  `headImg` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classId` (`classId`),
  CONSTRAINT `classId` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201611621101', 'e10adc3949ba59abbe56e057f20f883e', '', '小明', '1', '1', null, null);
INSERT INTO `student` VALUES ('201611621102', 'e10adc3949ba59abbe56e057f20f883e', '', '小红', '0', '1', null, null);
INSERT INTO `student` VALUES ('201611621103', 'e10adc3949ba59abbe56e057f20f883e', '', '小蓝', '1', '1', null, null);
INSERT INTO `student` VALUES ('201611621123', 'df10ef8509dc176d733d59549e7dbfaf', 'qilong4396@163.com', '廖奕浩', '1', '1', '201611621123.png', '你好啊');
INSERT INTO `student` VALUES ('201611621124', 'df10ef8509dc176d733d59549e7dbfaf', '', '李文杰', '0', '1', '201611621123.png', '你好啊');
INSERT INTO `student` VALUES ('201611621125', 'df10ef8509dc176d733d59549e7dbfaf', '', '李润林', '1', '1', '201611621123.png', '你好啊');
INSERT INTO `student` VALUES ('201611621201', 'e10adc3949ba59abbe56e057f20f883e', '', '小明2', '1', '2', '', '');
INSERT INTO `student` VALUES ('201611621202', 'e10adc3949ba59abbe56e057f20f883e', '', '小红2', '0', '2', '', '');
INSERT INTO `student` VALUES ('201611621203', 'e10adc3949ba59abbe56e057f20f883e', '', '小蓝2', '1', '2', '', '');
INSERT INTO `student` VALUES ('201611621223', 'df10ef8509dc176d733d59549e7dbfaf', '', '廖奕浩2', '1', '2', '201611621123.png', '你好啊');
INSERT INTO `student` VALUES ('201611621224', 'df10ef8509dc176d733d59549e7dbfaf', '', '李文杰2', '0', '2', '201611621123.png', '你好啊');
INSERT INTO `student` VALUES ('201611621225', 'df10ef8509dc176d733d59549e7dbfaf', '', '李润林2', '1', '2', '201611621123.png', '你好啊');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `professionIds` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `professionId1` (`professionIds`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '高等数学1', '1');
INSERT INTO `subject` VALUES ('2', '高等数学2', '1');
INSERT INTO `subject` VALUES ('3', '大学英语1', '1');
INSERT INTO `subject` VALUES ('4', '数据结构', '1');
INSERT INTO `subject` VALUES ('5', '操作系统', '1');
INSERT INTO `subject` VALUES ('6', '计算机网络', '1');
INSERT INTO `subject` VALUES ('7', '计算机组成原理', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(20) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('10086', 'e10adc3949ba59abbe56e057f20f883e', '张莹');
