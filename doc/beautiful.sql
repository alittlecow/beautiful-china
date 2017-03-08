/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50171
Source Host           : localhost:3306
Source Database       : beautiful

Target Server Type    : MYSQL
Target Server Version : 50171
File Encoding         : 65001

Date: 2017-03-08 17:45:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `NAME` varchar(50) NOT NULL,
  `CURRENT_VALUE` int(11) NOT NULL DEFAULT '0',
  `INCREMENT` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------
INSERT INTO `sys_sequence` VALUES ('TBL_FS', '159', '1');

-- ----------------------------
-- Table structure for tb_answer
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer`;
CREATE TABLE `tb_answer` (
  `pass_id` int(11) DEFAULT NULL COMMENT '回复人',
  `time` datetime DEFAULT NULL COMMENT '回复时间',
  `type` varchar(1) DEFAULT NULL COMMENT '回复人类型P:个人S:客服',
  `content` varchar(2000) DEFAULT NULL COMMENT '回复内容',
  `question_id` int(11) DEFAULT NULL COMMENT '问题id',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_answer
-- ----------------------------
INSERT INTO `tb_answer` VALUES ('1', '2016-01-04 16:20:17', 'S', 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', '1', '1');
INSERT INTO `tb_answer` VALUES ('2', '2016-01-20 16:21:28', 'S', 'hhhh', '2', '2');
INSERT INTO `tb_answer` VALUES ('3', '2016-01-14 16:22:41', '3', '3', '3', '3');
INSERT INTO `tb_answer` VALUES ('4', '2016-01-23 16:22:52', 'S', 'ttttt', '4', '4');
INSERT INTO `tb_answer` VALUES ('5', '2015-12-31 16:23:09', 'S', 'hhhhhh', '5', '5');
INSERT INTO `tb_answer` VALUES (null, '2016-01-04 16:20:17', 'S', 'TTTTTTTTTTT', '6', '6');
INSERT INTO `tb_answer` VALUES ('0', '2016-01-18 14:17:27', 'S', null, '7', '7');
INSERT INTO `tb_answer` VALUES ('0', '2016-01-18 14:19:41', 'S', 'hhhh', '8', '8');
INSERT INTO `tb_answer` VALUES ('31', '2016-01-18 15:51:12', 'S', '搜索', '1', '9');
INSERT INTO `tb_answer` VALUES ('31', '2016-01-18 16:25:14', 'S', '搜索', '1', '10');
INSERT INTO `tb_answer` VALUES ('12', '2016-01-21 18:00:26', 'S', 'jk,j,kjh', '9', '11');
INSERT INTO `tb_answer` VALUES ('21', '2016-01-19 18:00:57', 'S', '55555', '8', '12');
INSERT INTO `tb_answer` VALUES ('102', '2016-01-27 10:55:01', 'S', 'qqqqqq', '1', '13');

-- ----------------------------
-- Table structure for tb_contact
-- ----------------------------
DROP TABLE IF EXISTS `tb_contact`;
CREATE TABLE `tb_contact` (
  `dealtime` datetime DEFAULT NULL COMMENT '处理时间',
  `pass_id` int(11) DEFAULT NULL COMMENT '处理人员',
  `deal` varchar(1000) DEFAULT NULL COMMENT '处理结果',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(1) DEFAULT NULL COMMENT '状态N:未处理S:处理完成，关闭',
  `type` varchar(1) DEFAULT NULL COMMENT '类型A：咨询C:投诉',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT 'email',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_contact
-- ----------------------------
INSERT INTO `tb_contact` VALUES ('2016-01-19 14:19:59', '1', 'uuuktykyiui', '2016-01-27 14:20:19', 'N', 'A', '111', '111111', '11@', '1111', '1');
INSERT INTO `tb_contact` VALUES ('2016-01-28 14:21:10', '2', 'mmm', '2016-02-04 14:21:16', 'S', 'C', '222', '222222', '22@', '2222', '2');

-- ----------------------------
-- Table structure for tb_customline
-- ----------------------------
DROP TABLE IF EXISTS `tb_customline`;
CREATE TABLE `tb_customline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  `arrivetime` datetime DEFAULT NULL,
  `returntime` datetime DEFAULT NULL,
  `hotellevel` int(11) DEFAULT NULL,
  `otherrequirement` varchar(2000) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `result` varchar(2000) DEFAULT NULL,
  `pass_id` int(11) DEFAULT NULL,
  `dealtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customline
-- ----------------------------
INSERT INTO `tb_customline` VALUES ('1', 'zzz', '1', 'sdfs@123.com', '13167476475', '134', '2016-01-08 09:52:47', '2016-01-19 00:00:00', '3', '123123', '1', '2016-01-20 00:00:00', '1231', '0', '2016-01-11 00:00:00');
INSERT INTO `tb_customline` VALUES ('2', '绕弯儿 ', '2', '1134', '34141', '3241', '2016-01-04 10:13:11', '2016-01-10 10:13:17', '2', '', '2', '2016-01-08 10:12:30', '123', '0', '2016-01-10 15:32:15');
INSERT INTO `tb_customline` VALUES ('6', 'dad', '', 'dsa@qq.com', '3213', null, null, '2016-01-22 00:00:00', null, 'eqweqw', null, '2016-01-21 00:00:00', '', '0', null);
INSERT INTO `tb_customline` VALUES ('10', 'cat', '1', '12', '321', '5', '2016-01-08 00:00:00', null, '4', '31', null, '2016-01-14 19:55:20', null, null, null);
INSERT INTO `tb_customline` VALUES ('11', 'ok', '1', 'da', '42', '4', '2016-01-02 00:00:00', null, '4', '21212', null, '2016-01-14 20:07:07', null, null, null);
INSERT INTO `tb_customline` VALUES ('12', 'ok', '1', 'da', '42', '4', '2016-01-02 00:00:00', null, '4', '21212', null, '2016-01-14 20:10:55', null, null, null);
INSERT INTO `tb_customline` VALUES ('13', 'dog', '2', 'dog@qq.com', '153', '5', '2016-01-01 00:00:00', null, '3', 'meeeee', null, '2016-01-15 14:33:38', null, null, null);
INSERT INTO `tb_customline` VALUES ('14', 'dog', '1', '31', '3213', '4', '2016-01-06 00:00:00', null, '5', '5342', null, '2016-01-15 15:25:23', null, null, null);
INSERT INTO `tb_customline` VALUES ('15', 'mice', '2', '12@qq.com', '153', '15', '2016-02-06 00:00:00', null, '4', 'no', null, '2016-01-15 18:17:29', null, null, null);
INSERT INTO `tb_customline` VALUES ('16', '1', '2', '2@qq.com', '1', '2', '2016-01-23 00:00:00', null, '0', '', null, '2016-01-15 20:19:03', null, null, null);
INSERT INTO `tb_customline` VALUES ('17', '12', '2', '213@qq.com', '123', '12', '2016-01-21 00:00:00', null, '4', '321', null, '2016-01-15 20:28:42', null, null, null);
INSERT INTO `tb_customline` VALUES ('18', 'rookie', '1', 'simida@qq.com', '153', '20', '2016-01-21 00:00:00', null, '5', 'qqqqq', null, '2016-01-18 17:46:49', null, null, null);
INSERT INTO `tb_customline` VALUES ('19', '31', '1', '132@qq.com', '31', '21', '2016-02-03 00:00:00', null, '4', '22121', null, '2016-01-19 15:02:22', null, null, null);
INSERT INTO `tb_customline` VALUES ('20', '31', '1', '132@qq.com', '31', '21', '2016-02-03 00:00:00', null, '4', '22121', null, '2016-01-19 15:05:40', null, null, null);
INSERT INTO `tb_customline` VALUES ('21', 'qwe', '1', 'qww@qq.com', '3212', '20', '2016-01-27 00:00:00', null, '4', 'ewqe', null, '2016-01-19 17:06:05', null, null, null);
INSERT INTO `tb_customline` VALUES ('22', 'haha', '2', '22223@qq.com', '125', '10', '2016-01-29 00:00:00', null, '4', '没有', null, '2016-01-20 11:04:25', null, null, null);
INSERT INTO `tb_customline` VALUES ('23', 'das', '2', '123@qq.com', '123', '12', '2016-01-27 00:00:00', null, '5', '12', null, '2016-01-20 15:36:44', null, null, null);

-- ----------------------------
-- Table structure for tb_destinationday
-- ----------------------------
DROP TABLE IF EXISTS `tb_destinationday`;
CREATE TABLE `tb_destinationday` (
  `cst_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  PRIMARY KEY (`cst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_destinationday
-- ----------------------------
INSERT INTO `tb_destinationday` VALUES ('2', '17', '78');
INSERT INTO `tb_destinationday` VALUES ('3', '12', '22');
INSERT INTO `tb_destinationday` VALUES ('4', '13', '1');
INSERT INTO `tb_destinationday` VALUES ('5', '20', '123');
INSERT INTO `tb_destinationday` VALUES ('6', '13', '123');
INSERT INTO `tb_destinationday` VALUES ('7', '14', '1234');
INSERT INTO `tb_destinationday` VALUES ('8', '12', '1');
INSERT INTO `tb_destinationday` VALUES ('9', '18', '22');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `orderno` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '购买者id',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `email` varchar(127) DEFAULT NULL COMMENT '联系邮箱',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `dept_id` int(11) DEFAULT NULL COMMENT '供应商代码',
  `tour_id` int(11) DEFAULT NULL COMMENT '线路代码',
  `adults` int(11) DEFAULT NULL COMMENT '成人数',
  `children` int(11) DEFAULT NULL COMMENT '儿童数',
  `room` int(11) DEFAULT NULL COMMENT '房间数',
  `departure` datetime DEFAULT NULL COMMENT '出团时间',
  `total` decimal(8,2) DEFAULT NULL COMMENT '订单总额',
  `state` varchar(2) DEFAULT NULL COMMENT '订单状态',
  `placedtime` datetime DEFAULT NULL COMMENT '下单时间',
  `point` int(11) DEFAULT NULL COMMENT '所获积分',
  `gross` decimal(8,2) DEFAULT NULL COMMENT '总差价',
  `net` decimal(8,2) DEFAULT NULL COMMENT '净额',
  `tax` decimal(8,2) DEFAULT NULL COMMENT '税额',
  `eva_state` varchar(2) DEFAULT 'F' COMMENT '评价状态（T：已评价  F：未评价）',
  PRIMARY KEY (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('201602031922281000001', '1', '111', '22@11.com', '1212', null, '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'P', '2016-02-03 19:22:28', '0', '0.00', '0.00', '0.00', 'T');
INSERT INTO `tb_order` VALUES ('201602031922521000002', '1', '111', '22@11.com', '1212', null, '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'CC', '2016-02-03 19:22:52', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031922541000003', '1', '111', '22@11.com', '1212', null, '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'P', '2016-02-03 19:22:54', '0', '0.00', '0.00', '0.00', 'T');
INSERT INTO `tb_order` VALUES ('201602031922551000004', '1', '111', '22@11.com', '1212', null, '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:22:56', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031923221000005', '1', 'zhangyun', 'zhangyun@163.com', '12345678', null, '2', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'P', '2016-02-03 19:23:23', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031933311000001', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '3', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'S', '2016-02-03 19:33:31', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031933481000002', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '4', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:33:48', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031933501000003', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '5', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:33:51', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031933521000004', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '5', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'S', '2016-02-03 19:33:52', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031933541000005', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:33:54', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031933561000006', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '5', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:33:56', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031933571000007', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '6', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'S', '2016-02-03 19:33:58', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934141000008', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '7', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:34:14', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934161000009', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '8', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'SS', '2016-02-03 19:34:16', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934171000010', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '9', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'SS', '2016-02-03 19:34:18', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934191000011', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '10', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'SS', '2016-02-03 19:34:19', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934201000012', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:34:21', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934221000013', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'CC', '2016-02-03 19:34:22', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934241000014', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:34:24', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934261000015', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:34:26', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934271000016', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:34:28', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602031934291000017', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:34:29', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602032038011000018', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-03 20:38:01', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602032038381000019', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-03 20:38:39', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602032039371000020', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'CC', '2016-02-03 20:39:38', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602032040231000021', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'CC', '2016-02-03 20:40:24', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602032040561000022', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'CC', '2016-02-03 20:40:57', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602032042231000001', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'CC', '2016-02-03 20:42:23', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602032043361000002', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'CC', '2016-02-03 20:43:37', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602041014021000001', '1', '1212', '1065300897@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'CC', '2016-02-04 10:14:02', '0', '0.00', '0.00', '0.00', 'F');
INSERT INTO `tb_order` VALUES ('201602041821104000002', '4', 'fengchangtong', '561163@qq.com', '15150572324', '1', '1', '0', '0', '0', '2016-03-05 00:00:00', '0.00', 'P', '2016-02-04 18:21:10', '0', '0.00', '0.00', '0.00', 'F');

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question` (
  `status` varchar(1) DEFAULT NULL COMMENT 'QA状态(O:未关闭C:关闭)',
  `time` datetime DEFAULT NULL COMMENT '提问时间',
  `user_id` int(11) DEFAULT NULL COMMENT '提问人id',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `tour_id` int(11) DEFAULT NULL COMMENT '线路id',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES ('C', '2016-01-12 18:22:14', '55', '5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555', '1', '1');
INSERT INTO `tb_question` VALUES ('C', '2016-01-13 18:22:46', '99', '999', '1', '2');
INSERT INTO `tb_question` VALUES ('O', '2016-01-04 18:23:19', '22', '222', '1', '3');
INSERT INTO `tb_question` VALUES ('C', '2016-01-30 18:23:33', '66', '666', '1', '4');
INSERT INTO `tb_question` VALUES ('C', '2016-01-13 18:23:50', '8', '88', '1', '5');
INSERT INTO `tb_question` VALUES ('C', '2016-01-16 15:49:16', '123', '13221312313213123', '2', '6');
INSERT INTO `tb_question` VALUES ('C', '2016-01-18 15:50:38', '31', '你猜', '2', '7');
INSERT INTO `tb_question` VALUES ('C', '2016-01-12 18:22:14', '55', '555', '2', '8');
INSERT INTO `tb_question` VALUES ('C', '2016-01-12 18:22:14', '66', '555', '1', '9');
INSERT INTO `tb_question` VALUES (null, '2016-02-03 15:35:32', '0', 'ssdssdsd', '63', '10');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `11` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for th_order
-- ----------------------------
DROP TABLE IF EXISTS `th_order`;
CREATE TABLE `th_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orderno` varchar(100) NOT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '购买者id',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `email` varchar(127) DEFAULT NULL COMMENT '联系邮箱',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `dept_id` int(11) DEFAULT NULL COMMENT '供应商代码',
  `tour_id` int(11) DEFAULT NULL COMMENT '线路代码',
  `adults` int(11) DEFAULT NULL COMMENT '成人数',
  `children` int(11) DEFAULT NULL COMMENT '儿童数',
  `room` int(11) DEFAULT NULL COMMENT '房间数',
  `departure` datetime DEFAULT NULL COMMENT '出团时间',
  `total` decimal(8,2) DEFAULT NULL COMMENT '订单总额',
  `state` varchar(2) DEFAULT NULL COMMENT '订单状态',
  `placedtime` datetime DEFAULT NULL COMMENT '下单时间',
  `point` int(11) DEFAULT NULL COMMENT '所获积分',
  `gross` decimal(8,2) DEFAULT NULL COMMENT '总差价',
  `net` decimal(8,2) DEFAULT NULL COMMENT '净额',
  `tax` decimal(8,2) DEFAULT NULL COMMENT '税额',
  `operatetime` datetime DEFAULT NULL COMMENT '操作时间',
  `pass_id` int(11) DEFAULT NULL COMMENT '操作人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of th_order
-- ----------------------------
INSERT INTO `th_order` VALUES ('104', '201602031933541000005', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:33:54', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('116', '201602031934291000017', '1', 'zhangyun', 'zhangyun@163.com', '12345678', '1', '1', '3', '2', '0', '2016-03-05 00:00:00', '525.00', 'N', '2016-02-03 19:34:29', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('117', '201602032038011000018', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-03 20:38:01', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('118', '201602032038381000019', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-03 20:38:39', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('119', '201602032039371000020', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-03 20:39:38', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('120', '201602032040231000021', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-03 20:40:24', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('121', '201602032040561000022', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-03 20:40:57', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('122', '201602032042231000001', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-03 20:42:23', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('123', '201602032043361000002', '1', '11', '11@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-03 20:43:37', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('124', '201602041014021000001', '1', '1212', '1065300897@qq.com', '11', '1', '1', '2', '2', '0', '2016-03-05 00:00:00', '420.00', 'N', '2016-02-04 10:14:02', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('125', '201602041817054000001', '4', 'fct', 'fengchangtong110@126.com', '15150572324', '1', '1', '1', '0', '0', '2016-03-05 00:00:00', '105.00', 'N', '2016-02-04 18:17:06', '0', '0.00', '0.00', '0.00', null, null);
INSERT INTO `th_order` VALUES ('126', '201602041821104000002', '4', 'fengchangtong', '561163@qq.com', '15150572324', '1', '1', '0', '0', '0', '2016-03-05 00:00:00', '0.00', 'N', '2016-02-04 18:21:10', '0', '0.00', '0.00', '0.00', null, null);

-- ----------------------------
-- Table structure for th_rating
-- ----------------------------
DROP TABLE IF EXISTS `th_rating`;
CREATE TABLE `th_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(1) DEFAULT NULL,
  `targetid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `alllevel` int(1) DEFAULT NULL,
  `allcontent` varchar(2000) DEFAULT NULL,
  `routinglevel` int(1) DEFAULT NULL,
  `routingcontent` varchar(2000) DEFAULT NULL,
  `hotellevel` int(1) DEFAULT NULL,
  `hotelcontent` varchar(2000) DEFAULT NULL,
  `trafficlevel` int(1) DEFAULT NULL,
  `trafficcontent` varchar(2000) DEFAULT NULL,
  `picture` int(1) DEFAULT NULL,
  `ratingtime` datetime DEFAULT NULL,
  `source` varchar(1) DEFAULT NULL,
  `orderno` varchar(100) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of th_rating
-- ----------------------------
INSERT INTO `th_rating` VALUES ('1', 'T', '1', '1', '1', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', '2', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', '3', 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', '2', 'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', null, '2016-01-21 18:13:55', null, null);
INSERT INTO `th_rating` VALUES ('2', 'T', '1', '1', '2', 'ddddddd', '3', 'dddddd', '1', 'cccccccc', '2', 'sssssssss', null, '2016-01-11 10:23:12', null, null);
INSERT INTO `th_rating` VALUES ('3', 'T', '1', '2', '3', 'EEEEE', '3', 'EEEEE', '3', 'EEEEEE', '3', 'EEEEE', null, '2016-01-28 10:23:51', null, null);
INSERT INTO `th_rating` VALUES ('4', 'T', '1', '2', '3', 'RRRR', '2', 'RRRR', '2', 'RRRR', '2', 'RRRR', null, '2016-01-20 10:25:12', null, null);
INSERT INTO `th_rating` VALUES ('5', 'T', '1', '1', '1', 'LLLL', '1', 'LLLLLLLL', '1', 'LLLLLLLLLL', '1', 'LLLLLLLL', null, '2016-01-20 09:38:41', null, null);
INSERT INTO `th_rating` VALUES ('6', 'T', '1', '1', '1', 'PPPPPPPPPP', '1', 'PPPPPPPPP', '1', 'PPPPPPPPPPP', '1', '11PPPPPPPPPP', null, '2016-01-26 09:39:13', null, null);
INSERT INTO `th_rating` VALUES ('7', 'T', '1', '1', '1', 'OOOOOOOOO', '1', 'OOOOOOOOO', '1', 'OOOOOOOOOOO', '1', 'OOOOOOOOOOO', null, '2016-01-24 09:39:43', null, null);
INSERT INTO `th_rating` VALUES ('8', 'T', '1', '1', '1', 'IIIIIIIII', '1', 'IIIIIIIIIIIIIII', '1', 'IIIIIIIIIIIIII', '1', 'IIIIIIIIIIIII', null, '2016-01-27 09:40:04', null, null);
INSERT INTO `th_rating` VALUES ('9', 'T', '2', '1', '2', '', '1', '', '2', '', '1', '', null, '2016-01-31 14:22:29', null, '201601251014411000003');
INSERT INTO `th_rating` VALUES ('10', 'T', '2', '1', '3', '', '1', '', '3', '', '1', '', null, '2016-01-31 17:55:54', null, '201601311625531000002');
INSERT INTO `th_rating` VALUES ('11', 'T', '27', '1', '2', '', '1', '', '1', '', '1', '', null, '2016-02-03 18:18:58', null, '201601251014031025002');
INSERT INTO `th_rating` VALUES ('12', 'T', '62', '1', '1', '', '1', '', '1', '', '1', '', null, '2016-02-03 18:19:19', null, '201601251014031060002');
INSERT INTO `th_rating` VALUES ('13', 'T', '19', '1', '1', '', '2', '', '1', '', '2', '', null, '2016-02-03 18:26:54', null, '201601251014031017002');
INSERT INTO `th_rating` VALUES ('14', 'T', '31', '1', '1', '', '1', '', '1', '', '1', '', null, '2016-02-03 18:27:45', null, '201601251014031029002');
INSERT INTO `th_rating` VALUES ('15', 'T', '39', '1', '1', '', '2', '', '1', '', '1', '', null, '2016-02-03 18:28:28', null, '201601251014031037002');
INSERT INTO `th_rating` VALUES ('16', 'T', '17', '1', '3', '', '1', '', '3', '', '1', '', null, '2016-02-03 18:28:51', null, '201601251014031015002');
INSERT INTO `th_rating` VALUES ('17', 'T', '1', '1', '1', '', '3', '', '1', '', '1', '', null, '2016-02-04 19:06:14', null, '201602031922541000003');
INSERT INTO `th_rating` VALUES ('18', 'T', '1', '1', '3', '', '2', '', '1', '', '3', '', null, '2016-02-04 19:06:47', null, '201602031922281000001');

-- ----------------------------
-- Table structure for th_tourdate
-- ----------------------------
DROP TABLE IF EXISTS `th_tourdate`;
CREATE TABLE `th_tourdate` (
  `thd_id` int(11) NOT NULL AUTO_INCREMENT,
  `trd_id` int(11) NOT NULL COMMENT '出团日期及库存表ID',
  `thd_flow` varchar(1) NOT NULL COMMENT '流水方向',
  `thd_before` int(11) NOT NULL COMMENT '发生前剩余库存',
  `thd_amount` int(11) NOT NULL COMMENT '发生量',
  `thd_after` int(11) NOT NULL COMMENT '发生后剩余库存',
  `thd_orderno` varchar(20) NOT NULL COMMENT '订单号',
  `thd_type` varchar(4) NOT NULL COMMENT '台账类型(人为增加,新订单,订单调整,退单)',
  `trd_inventory` int(11) NOT NULL COMMENT '库存总数',
  `trd_sales` int(11) NOT NULL COMMENT '已售数量，已经完全支付',
  `trd_pending` int(11) NOT NULL COMMENT '已提交，未支付的数量',
  `trd_time` datetime NOT NULL COMMENT '操作时间',
  `pass_loginname` varchar(30) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`thd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存台账表';

-- ----------------------------
-- Records of th_tourdate
-- ----------------------------

-- ----------------------------
-- Table structure for tm_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `tm_attribute_value`;
CREATE TABLE `tm_attribute_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_id` int(11) NOT NULL COMMENT '属性id',
  `value_en` varchar(100) NOT NULL COMMENT '值英文',
  `value_fr` varchar(100) NOT NULL COMMENT '值法文',
  `sort` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_attribute_value
-- ----------------------------
INSERT INTO `tm_attribute_value` VALUES ('8', '5', 'fsd', 'fsd', '12');
INSERT INTO `tm_attribute_value` VALUES ('9', '6', 'dfs', 'dfs', '22');
INSERT INTO `tm_attribute_value` VALUES ('10', '6', 'dsa', 'dsa', '1');
INSERT INTO `tm_attribute_value` VALUES ('11', '6', 'qqd', 'dad', '1');
INSERT INTO `tm_attribute_value` VALUES ('12', '7', 'dfs', 'fads', '12');
INSERT INTO `tm_attribute_value` VALUES ('13', '7', 'fds', 'fsdfd', '22');
INSERT INTO `tm_attribute_value` VALUES ('41', '1', '的十分大方dsf', ' 是是', '3');
INSERT INTO `tm_attribute_value` VALUES ('42', '1', '二二', '任务', '2');
INSERT INTO `tm_attribute_value` VALUES ('44', '1', '11', '11', '11');
INSERT INTO `tm_attribute_value` VALUES ('45', '1', '11', '11', '111');

-- ----------------------------
-- Table structure for tm_category
-- ----------------------------
DROP TABLE IF EXISTS `tm_category`;
CREATE TABLE `tm_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL COMMENT '分类编号',
  `name_en` varchar(50) NOT NULL COMMENT '分类名称英文',
  `name_fr` varchar(50) NOT NULL COMMENT '分类名称法文',
  `parent` int(11) DEFAULT NULL COMMENT '父级分类ID',
  `level` int(11) NOT NULL COMMENT '级别',
  `subcode` varchar(3) NOT NULL COMMENT '下级待分配编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_category
-- ----------------------------
INSERT INTO `tm_category` VALUES ('1', '001', 'bb', 'bbb', '0', '0', '033');
INSERT INTO `tm_category` VALUES ('222', '001031', '1', '1', '1', '1', '014');
INSERT INTO `tm_category` VALUES ('223', '001031001', '2', '2', '222', '2', '003');
INSERT INTO `tm_category` VALUES ('227', '001031001003', '6', '6', '223', '3', '004');
INSERT INTO `tm_category` VALUES ('229', '001031003001', '7', '7', '228', '3', '000');
INSERT INTO `tm_category` VALUES ('230', '001031003002', '8', '8', '228', '3', '000');
INSERT INTO `tm_category` VALUES ('234', '001031006001', 'asdf', 'sadf', '233', '3', '000');
INSERT INTO `tm_category` VALUES ('236', '001031007001', 'aa', 'aa', '235', '3', '000');
INSERT INTO `tm_category` VALUES ('238', '001031008001', 'as', 'as', '237', '3', '000');
INSERT INTO `tm_category` VALUES ('242', '001031011001', '44', '444', '241', '3', '000');
INSERT INTO `tm_category` VALUES ('252', '001031001003002', 'ouyku', 'lyukuyilk', '227', '4', '001');
INSERT INTO `tm_category` VALUES ('254', '001031001003002001', 'ltultuil', 'lutilui', '252', '5', '000');
INSERT INTO `tm_category` VALUES ('255', '001031001003004', 'tiylkitu', 'lukltut', '227', '4', '000');
INSERT INTO `tm_category` VALUES ('256', '001033', 'twghtwg', 'qetrg', '1', '1', '000');

-- ----------------------------
-- Table structure for tm_cate_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tm_cate_attribute`;
CREATE TABLE `tm_cate_attribute` (
  `sort` int(11) NOT NULL COMMENT '排序',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) NOT NULL,
  `name_fr` varchar(100) NOT NULL,
  `cate_code` varchar(100) NOT NULL COMMENT '分类编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='分类属性表';

-- ----------------------------
-- Records of tm_cate_attribute
-- ----------------------------
INSERT INTO `tm_cate_attribute` VALUES ('1212', '1', 'pou', 'bbbpp', '001');
INSERT INTO `tm_cate_attribute` VALUES ('34', '5', 'o345', 'hotelfr345', '001002');
INSERT INTO `tm_cate_attribute` VALUES ('11', '6', 'fsd', 'sdffds', '001001001');
INSERT INTO `tm_cate_attribute` VALUES ('99', '7', 'p99', 'dsfds', '001001');
INSERT INTO `tm_cate_attribute` VALUES ('34', '9', 'gd', 'dg', '001');

-- ----------------------------
-- Table structure for tm_city
-- ----------------------------
DROP TABLE IF EXISTS `tm_city`;
CREATE TABLE `tm_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '城市ID',
  `name` varchar(100) DEFAULT NULL COMMENT '城市名英语',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_city
-- ----------------------------
INSERT INTO `tm_city` VALUES ('1', '24980149862662155');
INSERT INTO `tm_city` VALUES ('2', '24980149862662156');
INSERT INTO `tm_city` VALUES ('3', '24980149862662157');
INSERT INTO `tm_city` VALUES ('4', '24980149862662158');
INSERT INTO `tm_city` VALUES ('5', '24980149862662159');
INSERT INTO `tm_city` VALUES ('6', '24980149862662160');
INSERT INTO `tm_city` VALUES ('7', '24980149862662160');
INSERT INTO `tm_city` VALUES ('45', 'beijing');
INSERT INTO `tm_city` VALUES ('100', 'nanjing');

-- ----------------------------
-- Table structure for tm_destination_city
-- ----------------------------
DROP TABLE IF EXISTS `tm_destination_city`;
CREATE TABLE `tm_destination_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `title_en` varchar(50) NOT NULL,
  `title_fr` varchar(50) NOT NULL,
  `desc_en` text,
  `desc_fr` text,
  `status` varchar(1) NOT NULL,
  `photo_one` varchar(100) DEFAULT NULL,
  `photo_two` varchar(100) DEFAULT NULL,
  `photo_three` varchar(100) DEFAULT NULL,
  `photo_four` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_destination_city
-- ----------------------------
INSERT INTO `tm_destination_city` VALUES ('100', '100', 'abc', 'abcfr', 'dfsafdsfsafaaaaaaaaaaafddddd', 'fdsafddddddddddddddddddddddddddddrrrrrrrrrrrrrrrr', 'N', '/img/product/1.jpg', '/img/product/2.jpg', '/img/product/3.jpg', '/img/product/4.jpg');
INSERT INTO `tm_destination_city` VALUES ('131', '17', 'rfedsaASDFG', 'GFDSA', '', '', 'N', '/upload/destination/root/1454307664497.jpg', null, null, null);
INSERT INTO `tm_destination_city` VALUES ('132', '17', 'ces11WE', 'cse11WEW', '3rwesdfasASDDDDDDDDDDDDDD', 'sdFSADFASDFASDF', 'S', '/upload/destination/root/1454225634785.jpg', null, null, '/upload/destination/root/1454225657664.jpg');
INSERT INTO `tm_destination_city` VALUES ('134', '13', '电风扇', '是的', '的撒', '的', 'N', null, null, null, null);
INSERT INTO `tm_destination_city` VALUES ('135', '28', '111', 'qeer', '', '', 'N', null, null, null, null);
INSERT INTO `tm_destination_city` VALUES ('136', '13', 'dfd', 'fd', 'fd', 'fd', 'N', '/upload/destination/root/1454307909125.jpg', '/upload/destination/root/1454307909134.jpg', null, null);
INSERT INTO `tm_destination_city` VALUES ('137', '13', 'fds', 'sd ', 'd', 'd', 'N', '/upload/destination/root/1454307883870.jpg', '/upload/destination/root/1454307883876.jpg', null, null);
INSERT INTO `tm_destination_city` VALUES ('149', '17', 's', 's', '', '', 'N', '/upload/destination/root/1454308384319.jpg', null, null, null);
INSERT INTO `tm_destination_city` VALUES ('150', '17', 'gfds', 'fds', '', '', 'N', null, null, null, null);
INSERT INTO `tm_destination_city` VALUES ('161', '1', '1', '1', '', '', 'N', '/upload/destination/root/1454384151980.jpg', '/upload/destination/root/1454384151986.jpg', '/upload/destination/root/1454384151990.bmp', '');
INSERT INTO `tm_destination_city` VALUES ('162', '17', '232', '234', '', '', 'N', '/upload/destination/root/1454385687700.jpg', '', '', null);
INSERT INTO `tm_destination_city` VALUES ('163', '17', '123123', '123123', '', '', 'N', '/upload/destination/root/1454385821163.jpg', '/upload/destination/root/1454385821167.jpg', '', null);
INSERT INTO `tm_destination_city` VALUES ('164', '1', 'aa', 'aa', '', '', 'N', '', null, null, null);
INSERT INTO `tm_destination_city` VALUES ('165', '28', 'sdaf', 'asdf', '', '', 'N', '', '', null, null);

-- ----------------------------
-- Table structure for tm_display
-- ----------------------------
DROP TABLE IF EXISTS `tm_display`;
CREATE TABLE `tm_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(50) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_display
-- ----------------------------
INSERT INTO `tm_display` VALUES ('1', 'sdfdsf', 'zzz', 'S');
INSERT INTO `tm_display` VALUES ('2', 'wef33e412', 'ccc', 'N');
INSERT INTO `tm_display` VALUES ('3', 'werqwsdf113124', 'xxx', 'N');
INSERT INTO `tm_display` VALUES ('4', 'MOST POPULAR', 'POPULAR', 'S');
INSERT INTO `tm_display` VALUES ('5', '123', '1234', 'N');
INSERT INTO `tm_display` VALUES ('33', '33', '33', 'n');
INSERT INTO `tm_display` VALUES ('34', '234', '222', 'N');
INSERT INTO `tm_display` VALUES ('35', '121', '12', 'N');
INSERT INTO `tm_display` VALUES ('36', '12我', '12', 'N');
INSERT INTO `tm_display` VALUES ('37', '12', '123', 'N');
INSERT INTO `tm_display` VALUES ('38', '5555', '5555', 'N');
INSERT INTO `tm_display` VALUES ('39', 'aaa', 'aaaa', 'N');
INSERT INTO `tm_display` VALUES ('40', 'third', 'theme', 'N');
INSERT INTO `tm_display` VALUES ('41', null, null, 'W');

-- ----------------------------
-- Table structure for tm_displayitem
-- ----------------------------
DROP TABLE IF EXISTS `tm_displayitem`;
CREATE TABLE `tm_displayitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `if_show` varchar(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_displayitem
-- ----------------------------
INSERT INTO `tm_displayitem` VALUES ('1', 'line', '1', 'Y', '3251', '/img/product/1.jpg');
INSERT INTO `tm_displayitem` VALUES ('12', 'theme', '2', 'Y', '2', '/img/product/2.jpg');
INSERT INTO `tm_displayitem` VALUES ('36', 'first', '1', 'Y', '1', '/img/product/1.jpg');
INSERT INTO `tm_displayitem` VALUES ('39', '33', null, 'N', '123123', null);
INSERT INTO `tm_displayitem` VALUES ('42', 'zzz', null, 'N', '32', '/upload/display/root/1454494193845.jpg');
INSERT INTO `tm_displayitem` VALUES ('45', 'ccc', null, 'N', '2', '');

-- ----------------------------
-- Table structure for tm_endcity
-- ----------------------------
DROP TABLE IF EXISTS `tm_endcity`;
CREATE TABLE `tm_endcity` (
  `tour_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_endcity
-- ----------------------------

-- ----------------------------
-- Table structure for tm_hotel
-- ----------------------------
DROP TABLE IF EXISTS `tm_hotel`;
CREATE TABLE `tm_hotel` (
  `htl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '酒店id',
  `dept_code` varchar(20) NOT NULL,
  `htl_name_cn` varchar(50) NOT NULL COMMENT '酒店名称中文',
  `htl_name_en` varchar(50) NOT NULL COMMENT '酒店名称英文',
  `htl_name_fr` varchar(50) NOT NULL COMMENT '酒店名称法语',
  `htl_tel` varchar(50) NOT NULL COMMENT '联系电话',
  `htl_fax` varchar(50) NOT NULL COMMENT '传真',
  `htl_desc_en` varchar(50) NOT NULL COMMENT '酒店描述英文',
  `htl_desc_fr` varchar(50) NOT NULL COMMENT '酒店描述法语',
  `htl_address_cn` varchar(50) NOT NULL COMMENT '酒店详细地址中文',
  `htl_address_en` varchar(50) NOT NULL COMMENT '酒店详细地址英文',
  `htl_address_fr` varchar(50) NOT NULL COMMENT '酒店详细地址法语',
  `htl_status` varchar(1) NOT NULL,
  `htl_createtime` datetime NOT NULL COMMENT '创建时间',
  `htl_user` varchar(50) NOT NULL COMMENT '创建人',
  `htl_city_id` int(11) NOT NULL,
  PRIMARY KEY (`htl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_hotel
-- ----------------------------
INSERT INTO `tm_hotel` VALUES ('7', 'TNLY', '3', '22', '3', '1234567', '3', '3', '3', '3', '33', '3', 'N', '2016-02-01 13:58:46', 'root', '28');
INSERT INTO `tm_hotel` VALUES ('10', 'fd', '11', '11', '111', '11112323', '11', '111', '111', '11', '11', '11', 'N', '2016-01-10 14:01:33', 'root', '13');
INSERT INTO `tm_hotel` VALUES ('11', 'TNLY', '234', '44', '234', '2343243', '234', '', '', 'werqw', 'eqw', 'eqwe', 'N', '2016-01-11 11:55:01', 'root', '14');
INSERT INTO `tm_hotel` VALUES ('12', '22', 'rwqerqw', 'wqetqwe', 'erqwer', '12312423', 'weqrqwer', 'qwe', 'rqwer', 'werq', 'wqer', 'qwer', 'N', '2016-01-31 17:52:19', 'root', '28');
INSERT INTO `tm_hotel` VALUES ('13', '22', 'wqer', 'wqer', 'wqer', '13223423232', 'dafgdgffew', 'asd', 'fasdf', 'sadf', 'sadf', 'ads', 'N', '2016-01-31 17:52:53', 'root', '17');
INSERT INTO `tm_hotel` VALUES ('18', '22', '222', '222', '222', '2222222', '22', '', '', '2', '2', '2', 'N', '2016-01-31 17:58:17', 'root', '17');
INSERT INTO `tm_hotel` VALUES ('19', 'TNLY', 'gfds', 'tgrfrde', 'gfbvdc', '32432433', 'bcvx', '', '', '234', '234', '34', 'N', '2016-02-02 15:45:48', 'root', '17');
INSERT INTO `tm_hotel` VALUES ('20', 'TNLY', '橘子水晶', 'orange', 'orange\'s', '13212345678', 'asddas', '高端大气上档次', 'gao duan da qi shang dangci', '南京市秦淮区桔子水晶酒店', 'orange hotel', 'orange\'s hotel', 'N', '2016-02-02 15:46:16', 'root', '1');
INSERT INTO `tm_hotel` VALUES ('21', 'TNLY', 'hotel-cn-px', 'hotel-en-px', 'hotel-fr-px', '1234567', '123123123123', 'hotel-desc-en-px', 'hotel-desc-fr-px', '12312312--pc-cn', '12312312--pc-en', '12312312--pc-fr', 'N', '2016-02-02 15:49:44', 'root', '28');

-- ----------------------------
-- Table structure for tm_hoteltype
-- ----------------------------
DROP TABLE IF EXISTS `tm_hoteltype`;
CREATE TABLE `tm_hoteltype` (
  `htp_id` int(11) NOT NULL AUTO_INCREMENT,
  `htl_id` int(11) NOT NULL,
  `htl_name_en` varchar(50) NOT NULL,
  `htl_name_fr` varchar(50) NOT NULL,
  `htl_people` int(11) NOT NULL,
  `htl_price` decimal(8,2) DEFAULT NULL,
  `htl_spread` decimal(8,2) DEFAULT NULL,
  `htl_rule` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`htp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_hoteltype
-- ----------------------------
INSERT INTO `tm_hoteltype` VALUES ('2', '2', 'er', 'ertyr', '45', '4.00', '5.00', 'htsgr');

-- ----------------------------
-- Table structure for tm_indexconfig
-- ----------------------------
DROP TABLE IF EXISTS `tm_indexconfig`;
CREATE TABLE `tm_indexconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL COMMENT '关联id',
  `type` varchar(10) NOT NULL COMMENT '类型（B:banner图；MP:most popular tours；T:theme；F:first trip）',
  `image` varchar(255) NOT NULL COMMENT '图片路径',
  `sort` int(1) NOT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_indexconfig
-- ----------------------------
INSERT INTO `tm_indexconfig` VALUES ('1', '1', 'banner', 'img/slides_bg/slide_2.jpg', '2');
INSERT INTO `tm_indexconfig` VALUES ('2', '2', 'firstTrip', '/img/test/4.jpg', '2');
INSERT INTO `tm_indexconfig` VALUES ('3', '1', 'popular', '/img/test/1.jpg', '1');
INSERT INTO `tm_indexconfig` VALUES ('4', '80', 'theme', '/img/product/1.jpg', '1');
INSERT INTO `tm_indexconfig` VALUES ('5', '81', 'theme', '/img/product/2.jpg', '2');
INSERT INTO `tm_indexconfig` VALUES ('6', '1', 'banner', 'img/slides_bg/slide_1.jpg', '1');
INSERT INTO `tm_indexconfig` VALUES ('7', '1', 'banner', 'img/slides_bg/slide_3.jpg', '3');
INSERT INTO `tm_indexconfig` VALUES ('8', '1', 'banner', 'img/slides_bg/slide_4.jpg', '4');
INSERT INTO `tm_indexconfig` VALUES ('9', '2', 'popular', '/img/test/4.jpg', '2');
INSERT INTO `tm_indexconfig` VALUES ('10', '3', 'popular', '/upload/tour/root/1454315208272.jpg', '3');
INSERT INTO `tm_indexconfig` VALUES ('11', '4', 'popular', '/img/test/2.jpg', '4');
INSERT INTO `tm_indexconfig` VALUES ('12', '7', 'popular', '/img/test/3.jpg', '5');
INSERT INTO `tm_indexconfig` VALUES ('13', '6', 'popular', '/img/test/3.jpg', '6');
INSERT INTO `tm_indexconfig` VALUES ('14', '82', 'theme', '/img/product/3.jpg', '3');
INSERT INTO `tm_indexconfig` VALUES ('15', '84', 'theme', '/img/product/4.jpg', '4');
INSERT INTO `tm_indexconfig` VALUES ('16', '85', 'theme', '/img/product/5.jpg', '5');
INSERT INTO `tm_indexconfig` VALUES ('17', '86', 'theme', '/img/product/6.jpg', '6');
INSERT INTO `tm_indexconfig` VALUES ('18', '1', 'firstTrip', '/img/test/1.jpg', '1');
INSERT INTO `tm_indexconfig` VALUES ('19', '3', 'firstTrip', '/img/test/3.jpg', '3');
INSERT INTO `tm_indexconfig` VALUES ('20', '1', 'city', '/img/test/1.jpg', '1');
INSERT INTO `tm_indexconfig` VALUES ('21', '2', 'city', '/img/test/1.jpg', '1');
INSERT INTO `tm_indexconfig` VALUES ('23', '3', 'city', '/img/test/1.jpg', '1');
INSERT INTO `tm_indexconfig` VALUES ('24', '4', 'city', '/img/test/1.jpg', '1');
INSERT INTO `tm_indexconfig` VALUES ('25', '5', 'city', '/img/test/1.jpg', '1');
INSERT INTO `tm_indexconfig` VALUES ('26', '6', 'city', '/img/test/1.jpg', '1');

-- ----------------------------
-- Table structure for tm_option
-- ----------------------------
DROP TABLE IF EXISTS `tm_option`;
CREATE TABLE `tm_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) NOT NULL COMMENT '英文名称',
  `name_fr` varchar(100) NOT NULL COMMENT '法文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_option
-- ----------------------------
INSERT INTO `tm_option` VALUES ('2', 'as', 'as');
INSERT INTO `tm_option` VALUES ('11', 'zs', 'as');
INSERT INTO `tm_option` VALUES ('15', 'a', 'a');
INSERT INTO `tm_option` VALUES ('16', 'sd', 'sd');
INSERT INTO `tm_option` VALUES ('18', 'efrewqf', 'feqf');

-- ----------------------------
-- Table structure for tm_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tm_product_attribute`;
CREATE TABLE `tm_product_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_id` int(11) NOT NULL COMMENT '属性ID',
  `av_id` int(11) NOT NULL COMMENT '属性值ID',
  `tour_id` int(11) NOT NULL COMMENT '线路ID',
  `value_en` varchar(100) NOT NULL COMMENT '值英文',
  `value_fr` varchar(100) NOT NULL COMMENT '值法文',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_product_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for tm_sights
-- ----------------------------
DROP TABLE IF EXISTS `tm_sights`;
CREATE TABLE `tm_sights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_fr` varchar(50) NOT NULL,
  `desc_en` varchar(2000) DEFAULT NULL,
  `desc_fr` varchar(2000) DEFAULT NULL,
  `level` varchar(20) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_sights
-- ----------------------------
INSERT INTO `tm_sights` VALUES ('10', '4', '43', '43', '4', '', 'todo', '43.00');
INSERT INTO `tm_sights` VALUES ('15', '106', 'qw', 'qw', '', '', 'todo', '2.00');

-- ----------------------------
-- Table structure for tm_startcity
-- ----------------------------
DROP TABLE IF EXISTS `tm_startcity`;
CREATE TABLE `tm_startcity` (
  `tour_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_startcity
-- ----------------------------
INSERT INTO `tm_startcity` VALUES ('12', '12');
INSERT INTO `tm_startcity` VALUES ('2', '18');
INSERT INTO `tm_startcity` VALUES ('3', '25');
INSERT INTO `tm_startcity` VALUES ('4', '18');
INSERT INTO `tm_startcity` VALUES ('4', '12');
INSERT INTO `tm_startcity` VALUES ('4', '17');
INSERT INTO `tm_startcity` VALUES ('7', '13');
INSERT INTO `tm_startcity` VALUES ('6', '14');
INSERT INTO `tm_startcity` VALUES ('12', '12');
INSERT INTO `tm_startcity` VALUES ('2', '18');
INSERT INTO `tm_startcity` VALUES ('3', '25');
INSERT INTO `tm_startcity` VALUES ('4', '18');
INSERT INTO `tm_startcity` VALUES ('4', '12');
INSERT INTO `tm_startcity` VALUES ('4', '17');
INSERT INTO `tm_startcity` VALUES ('7', '13');
INSERT INTO `tm_startcity` VALUES ('6', '14');

-- ----------------------------
-- Table structure for tm_theme
-- ----------------------------
DROP TABLE IF EXISTS `tm_theme`;
CREATE TABLE `tm_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题id',
  `title` varchar(100) DEFAULT NULL COMMENT '主题名称法文',
  `desc` varchar(255) DEFAULT NULL COMMENT '主题描述法文',
  `photo_one` varchar(50) DEFAULT NULL,
  `photo_two` varchar(50) DEFAULT NULL,
  `photo_three` varchar(50) DEFAULT NULL,
  `photo_four` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_theme
-- ----------------------------
INSERT INTO `tm_theme` VALUES ('80', '24980149862662146', 'hijklmn', '/upload/lineTheme/root/1454321243639.jpg', '/upload/lineTheme/root/1454322403418.jpg', '/upload/lineTheme/root/1454322643945.jpg', '/upload/lineTheme/root/1454322643949.jpg');
INSERT INTO `tm_theme` VALUES ('81', '24980149862662147', 'asdadasdad', '/upload/lineTheme/root/1454322505441.jpg', null, null, null);
INSERT INTO `tm_theme` VALUES ('82', '24980149862662148', 'dqwdqd\r\nasdadad\r\nqweqeqweqweq', null, null, null, null);
INSERT INTO `tm_theme` VALUES ('84', '24980149862662148', null, '/upload/lineTheme/root/1454385380802.jpg', '/upload/lineTheme/root/1454385380808.jpg', '/upload/lineTheme/root/1454385380813.jpg', '');
INSERT INTO `tm_theme` VALUES ('85', '24980149862662149', null, '/upload/lineTheme/root/1454385410415.jpg', '/upload/lineTheme/root/1454385410432.jpg', '', null);
INSERT INTO `tm_theme` VALUES ('86', '24980149862662150', null, '/upload/lineTheme/root/1454385520725.jpg', '/upload/lineTheme/root/1454385520732.jpg', '', null);
INSERT INTO `tm_theme` VALUES ('87', '24980149862662151', null, '/upload/lineTheme/root/1454385778282.jpg', '/upload/lineTheme/root/1454385778288.jpg', '', null);
INSERT INTO `tm_theme` VALUES ('90', '24980149862662152', null, '/upload/lineTheme/root/1454386551777.jpg', '', null, null);
INSERT INTO `tm_theme` VALUES ('91', '24980149862662153', null, '', null, null, null);
INSERT INTO `tm_theme` VALUES ('92', '24980149862662154', null, '', null, null, null);
INSERT INTO `tm_theme` VALUES ('93', 'beatiful chian fr', 'beatiful chian fr', '/upload/lineTheme/root/1454397091407.jpg', '/upload/lineTheme/root/1454397091437.jpg', null, null);
INSERT INTO `tm_theme` VALUES ('95', '234', '', null, null, null, null);
INSERT INTO `tm_theme` VALUES ('100', 'bigMoneyfr', '$$$$$$$$$$$$', '/upload/lineTheme/root/1454397168997.jpg', '/upload/lineTheme/root/1454397169037.jpg', '/upload/lineTheme/root/1454397169041.jpg', '/upload/lineTheme/root/1454397169046.jpg');

-- ----------------------------
-- Table structure for tm_tour
-- ----------------------------
DROP TABLE IF EXISTS `tm_tour`;
CREATE TABLE `tm_tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `dept_code` varchar(20) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `startcity` int(11) NOT NULL,
  `endcity` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `operatetime` datetime NOT NULL,
  `operator` varchar(30) NOT NULL,
  `subtitle` varchar(300) DEFAULT NULL COMMENT '副标题名称英文',
  `advancedays` int(11) DEFAULT NULL COMMENT '提前预定天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_tour
-- ----------------------------
INSERT INTO `tm_tour` VALUES ('1', '线路1', 'fds', '2', '24980149862662144', '1', '32', '2', '32', 'S', '2016-01-20 11:31:45', 'root', 'xianlu1', '3');
INSERT INTO `tm_tour` VALUES ('2', 'ccc', 'sf', '3', '24980149862662144', '14', '34', '4', '23', 'S', '2016-01-07 11:33:01', 'root', 'dfs', '4');
INSERT INTO `tm_tour` VALUES ('3', 'xxx', 'fds', '3', '24980149862662145', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('4', 'xxx', 'fds', '3', '24980149862662145', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('6', 'xxx', 'fds', '3', '24980149862662145', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('7', 'xxx', 'fds', '3', '24980149862662145', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('8', 'xxx', 'fds', '3', '24980149862662145', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('9', 'xxx', 'fds', '3', '24980149862662145', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('10', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('11', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('12', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('13', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('14', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('15', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('16', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('17', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('18', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('19', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('20', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('21', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('22', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('23', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('24', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('27', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('28', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('29', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('30', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('31', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('32', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('34', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('35', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('36', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('38', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('39', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('40', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('42', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('43', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('44', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('45', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('46', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('47', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('48', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('49', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('50', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('51', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('52', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('53', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('54', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('55', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('56', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('57', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('60', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('61', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('62', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('63', 'efs', 'TNLY', '0', 'sdf', '28', '39', '3', '4', 'N', '2016-01-31 18:05:28', 'root', 'sadf', '4');
INSERT INTO `tm_tour` VALUES ('64', '12', 'TNLY', '0', '123', '36', '30', '3', '4', 'N', '2016-02-01 13:52:07', 'root', '123', '4');
INSERT INTO `tm_tour` VALUES ('70', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('71', 'zzz', 'fds', '2', '1111enen', '1', '32', '2', '32', 'S', '2016-01-20 11:31:45', 'root', 'xianlu1', '3');
INSERT INTO `tm_tour` VALUES ('72', 'ccc', 'sf', '3', 'enenenen', '14', '34', '4', '23', 'S', '2016-01-07 11:33:01', 'root', 'dfs', '4');
INSERT INTO `tm_tour` VALUES ('73', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('74', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('75', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('76', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('77', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('78', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('79', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('101', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('102', 'xxx', 'fds', '3', 'fsdaenenenenen', '3', '34', '3', '342', 'S', '2016-01-21 11:34:18', 'root', 'fds', '2');
INSERT INTO `tm_tour` VALUES ('176', '123', 'TNLY', '0', '234', '30', '30', '4', '3', 'N', '2016-01-31 18:06:30', 'root', '234', '4');
INSERT INTO `tm_tour` VALUES ('177', '1212', 'TNLY', '0', '12', '17', '17', '3', '4', 'N', '2016-02-01 16:26:54', 'root', '12', '4');
INSERT INTO `tm_tour` VALUES ('178', '10086', 'TNLY', '0', 'shangirla_en_tour', '44', '30', '8', '5', 'N', '2016-02-02 16:06:02', 'root', 'shangirla_fr_title', '2');
INSERT INTO `tm_tour` VALUES ('179', 'dsf', 'TNLY', '0', 'sdf', '17', '28', '4', '5', 'N', '2016-02-02 16:54:30', 'root', 'fsdf', '3');
INSERT INTO `tm_tour` VALUES ('180', 'sdg', 'TNLY', '0', 'fdsf', '17', '17', '5', '3', 'N', '2016-02-02 16:56:26', 'root', 'sd', '3');
INSERT INTO `tm_tour` VALUES ('181', '132', 'TNLY', '0', '123', '28', '17', '4', '4', 'N', '2016-02-03 15:52:45', 'root', '123', '4');
INSERT INTO `tm_tour` VALUES ('182', '1', 'TNLY', '0', '1', '1', '17', '4', '4', 'N', '2016-02-03 15:53:14', 'root', '1', '4');
INSERT INTO `tm_tour` VALUES ('183', 'rete', 'TNLY', '0', 'wert', '17', '28', '4', '4', 'N', '2016-02-03 20:34:15', 'root', 'ert', '3');
INSERT INTO `tm_tour` VALUES ('184', '1212', 'TNLY', '0', '12', '17', '30', '5', '4', 'N', '2016-02-03 21:14:24', 'root', '212', '5');
INSERT INTO `tm_tour` VALUES ('185', 'dgd', null, '0', 'dsfg', '17', '17', '5', '3', 'N', '2016-02-04 17:29:28', 'root', 'dsf', '4');

-- ----------------------------
-- Table structure for tm_tourconfig
-- ----------------------------
DROP TABLE IF EXISTS `tm_tourconfig`;
CREATE TABLE `tm_tourconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `content_en` text,
  `content_fr` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_tourconfig
-- ----------------------------
INSERT INTO `tm_tourconfig` VALUES ('1', '1', 'include', 'include', '\n    Entrance to attractions listed in the itinerary\n    Meals mentioned in the itinerary\n    Private transfers between the airport or railway station, attractions, ports, and hotels\n    Private local English-speaking tour guide and driver service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee\n    Specified flights, trains, and Cruise\n', '\n    Entrance to attractions listed in the itinerary\n    Meals mentioned in the itinerary\n    Private transfers between the airport or railway station, attractions, ports, and hotels\n    Private local English-speaking tour guide and driver service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee\n    Specified flights, trains, and Cruise\n');
INSERT INTO `tm_tourconfig` VALUES ('2', '1', 'exclude', 'exclude', '1\n2\n3\n4\n5\n6\n7', '\n    Entrance to attractions listed in the itinerary\n    Meals mentioned in the itinerary\n    Private transfers between the airport or railway station, attractions, ports, and hotels\n    Private local English-speaking tour guide and driver service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee\n    Specified flights, trains, and Cruise');
INSERT INTO `tm_tourconfig` VALUES ('4', '1', 'exclude', 'exclude', '1(;)\n2(;)\n3(;)\n4(;)\n5(;)\n6(;)\n7(;)', '\n    Entrance to attractions listed in the itinerary\n    Meals mentioned in the itinerary\n    Private transfers between the airport or railway station, attractions, ports, and hotels\n    Private local English-speaking tour guide and driver service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee\n    Specified flights, trains, and Cruise');
INSERT INTO `tm_tourconfig` VALUES ('5', '1', 'include', '', '\n    Entrance to attractions listed in the itinerary(;)\n    Meals mentioned in the itinerary(;)\n    Private transfers between the airport or railway station, (;)attractions, ports, and hotels\n    Private local English-speaking tour guide and driver service (;)(except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee(;)\n    Specified flights, trains, and Cruise(;)', '\n    Entrance to attractions listed in the itinerary\n    Meals mentioned in the itinerary\n    Private transfers between the airport or railway station, attractions, ports, and hotels\n    Private local English-speaking tour guide and driver service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee\n    Specified flights, trains, and Cruise\n');
INSERT INTO `tm_tourconfig` VALUES ('531', '1', 'important', 'important', '\n    Entrance to attractions listed in the itinerary(;)\n    Meals mentioned in the itinerary(;)\n    Private transfers between the airport or railway station(;), attractions, ports, and hotels\n    Private local English-speaking tour guide and driver (;)service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee(;)\n    Specified flights, trains, and Cruise(;)', '\n    Entrance to attractions listed in the itinerary\n    Meals mentioned in the itinerary\n    Private transfers between the airport or railway station, attractions, ports, and hotels\n    Private local English-speaking tour guide and driver service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee\n    Specified flights, trains, and Cruise');
INSERT INTO `tm_tourconfig` VALUES ('532', '1', 'triphint', 'triphint', '\n    Entrance to attractions listed in the itinerary(;)\n    Meals mentioned in the itinerary(;)\n    Private transfers between the airport or railway s(;)tation, attractions, ports, and hotels\n    Private local English-speaking tour guide and driver(;) service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee(;)\n    Specified flights, trains, and Cruise(;)', '\n    Entrance to attractions listed in the itinerary\n    Meals mentioned in the itinerary\n    Private transfers between the airport or railway station, attractions, ports, and hotels\n    Private local English-speaking tour guide and driver service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee\n    Specified flights, trains, and Cruise');
INSERT INTO `tm_tourconfig` VALUES ('534', '1', 'term', 'term', '\n    Entrance to attractions listed in the itinerary(;)\n    Meals mentioned in the itinerary(;)\n    Private transfers between the airport or railway statio(;)n, attractions, ports, and hotels\n    Private local English-speaking tour guide and drive(;)r service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee(;)\n    Specified flights, trains, and Cruise(;)', '\n    Entrance to attractions listed in the itinerary\n    Meals mentioned in the itinerary\n    Private transfers between the airport or railway station, attractions, ports, and hotels\n    Private local English-speaking tour guide and driver service (except tips based on your willingness)\n    Hotel accommodation with breakfast and service fee\n    Specified flights, trains, and Cruise');
INSERT INTO `tm_tourconfig` VALUES ('579', '178', 'include', 'include', 'include-en-pengxiao', 'include-fr-pengxiao');
INSERT INTO `tm_tourconfig` VALUES ('580', '178', 'exclude', 'exclude', 'exclude--en--pengxiao', 'exclude--fr--pengxiao');
INSERT INTO `tm_tourconfig` VALUES ('581', '178', 'important', 'important', 'important--en--pengxiao', 'important--fr--pengxiao');
INSERT INTO `tm_tourconfig` VALUES ('582', '178', 'triphint', 'triphint', 'trip tips --en---pengxiao', 'trip tips --fr---pengxiao');
INSERT INTO `tm_tourconfig` VALUES ('583', '178', 'describe', 'describe', 'describe-en-pengxiao​dsfs', 'describe-fr-pengxiao​sf');
INSERT INTO `tm_tourconfig` VALUES ('584', '178', 'term', 'term', 'term---en--pengxiao', 'term---fr--pengxiao');
INSERT INTO `tm_tourconfig` VALUES ('585', '178', 'destination', 'destination', '111111111111111111111111111shangirla---test---pengxiao​--en', '111111111111111111111111111shangirla---test---pengxiao​--fr');
INSERT INTO `tm_tourconfig` VALUES ('586', '178', 'meals', 'meals', 'meal -en -pengxiao​', 'meal -fr -pengxiao​');
INSERT INTO `tm_tourconfig` VALUES ('587', '178', 'transport', 'transport', 'transport---en--pengxiao​', 'meal -fr-pengxiao​​');
INSERT INTO `tm_tourconfig` VALUES ('588', '178', 'hotel', 'hotel', 'hotel-en-pengxiao​', 'hotel-fr-pengxiao​sdf');
INSERT INTO `tm_tourconfig` VALUES ('621', '183', 'include', 'include', 'ert(;)er', 'ertert(;)tert');
INSERT INTO `tm_tourconfig` VALUES ('627', '184', 'include', 'include', '11', '22');
INSERT INTO `tm_tourconfig` VALUES ('628', '184', 'exclude', 'exclude', 'wqet', 'asdfwer');
INSERT INTO `tm_tourconfig` VALUES ('629', '184', 'important', 'important', '3242', 'werewq');
INSERT INTO `tm_tourconfig` VALUES ('630', '184', 'triphint', 'triphint', 'adghgdf', 'sadg');
INSERT INTO `tm_tourconfig` VALUES ('631', '184', 'describe', 'describe', 'dsaf', 'adsfasd');
INSERT INTO `tm_tourconfig` VALUES ('632', '184', 'term', 'term', '3242', 'werewq');
INSERT INTO `tm_tourconfig` VALUES ('633', '185', 'include', 'include', '', '');
INSERT INTO `tm_tourconfig` VALUES ('634', '185', 'exclude', 'exclude', '', '');
INSERT INTO `tm_tourconfig` VALUES ('635', '185', 'important', 'important', '', '');
INSERT INTO `tm_tourconfig` VALUES ('636', '185', 'triphint', 'triphint', '', '');
INSERT INTO `tm_tourconfig` VALUES ('637', '185', 'describe', 'describe', '', '');
INSERT INTO `tm_tourconfig` VALUES ('638', '185', 'term', 'term', '', '');

-- ----------------------------
-- Table structure for tm_tourdate
-- ----------------------------
DROP TABLE IF EXISTS `tm_tourdate`;
CREATE TABLE `tm_tourdate` (
  `trd_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) DEFAULT NULL,
  `trd_time` date NOT NULL COMMENT '时间',
  `trd_price` decimal(8,2) NOT NULL COMMENT '当日价格',
  `trd_inventory` int(11) NOT NULL COMMENT '库存总数',
  `trd_sales` int(11) NOT NULL COMMENT '已售数量',
  `trd_pending` int(11) NOT NULL COMMENT '已提交，未支付的数量',
  `trd_remain` int(11) NOT NULL COMMENT '剩余库存',
  `trd_warn` int(11) NOT NULL COMMENT '库存预警值',
  PRIMARY KEY (`trd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_tourdate
-- ----------------------------
INSERT INTO `tm_tourdate` VALUES ('1', '4', '2016-04-05', '20.00', '5', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('2', '2', '2016-04-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('3', '1', '2016-04-05', '105.00', '15', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('4', '3', '2016-04-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('6', '5', '2016-04-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('7', '6', '2016-04-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('8', '7', '2016-04-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('9', '8', '2016-03-07', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('10', '9', '2016-03-08', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('11', '10', '2016-03-09', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('12', '11', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('13', '12', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('14', '13', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('15', '14', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('16', '15', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('17', '16', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('18', '17', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('19', '18', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('20', '19', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('21', '1', '2016-03-05', '1.00', '108', '1', '1', '1', '1');
INSERT INTO `tm_tourdate` VALUES ('22', '20', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('23', '21', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('24', '22', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('25', '23', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('26', '24', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('27', '25', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('28', '26', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('29', '27', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('30', '30', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('31', '31', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('34', '34', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('35', '35', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('36', '36', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('37', '37', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('38', '38', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('39', '39', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('40', '40', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('41', '41', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('42', '42', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('43', '43', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('44', '44', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('45', '45', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('46', '46', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('47', '47', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('48', '48', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('49', '49', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('50', '50', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('51', '51', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('52', '52', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('53', '53', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('54', '54', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('55', '55', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('56', '56', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('57', '57', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('58', '58', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('59', '59', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('60', '60', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('61', '61', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('62', '62', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('63', '63', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('70', '79', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('71', '74', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('72', '72', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('73', '71', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('74', '73', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('75', '70', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('76', '75', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('77', '76', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('78', '77', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('79', '78', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('101', '101', '2016-03-05', '105.00', '0', '0', '0', '0', '0');
INSERT INTO `tm_tourdate` VALUES ('102', '102', '2016-03-05', '33.00', '33', '33', '33', '33', '33');
INSERT INTO `tm_tourdate` VALUES ('114', '64', '2016-03-05', '4.00', '4', '0', '0', '4', '3');
INSERT INTO `tm_tourdate` VALUES ('115', '2', '2016-03-05', '232.00', '321', '0', '0', '321', '231');
INSERT INTO `tm_tourdate` VALUES ('116', '65', '2016-03-05', '232.00', '321', '0', '0', '321', '231');
INSERT INTO `tm_tourdate` VALUES ('118', '66', '2016-03-05', '4.00', '9', '0', '0', '9', '6');
INSERT INTO `tm_tourdate` VALUES ('119', '175', '2016-03-05', '4.00', '9', '0', '0', '9', '6');
INSERT INTO `tm_tourdate` VALUES ('123', '178', '2016-03-05', '21.23', '100', '0', '0', '100', '10');
INSERT INTO `tm_tourdate` VALUES ('124', '178', '2016-03-05', '21.23', '100', '0', '0', '100', '10');
INSERT INTO `tm_tourdate` VALUES ('125', '178', '2016-03-05', '21.23', '100', '0', '0', '100', '10');

-- ----------------------------
-- Table structure for tm_tourdetail
-- ----------------------------
DROP TABLE IF EXISTS `tm_tourdetail`;
CREATE TABLE `tm_tourdetail` (
  `trde_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) DEFAULT NULL,
  `trde_day` int(11) NOT NULL COMMENT '第几天',
  `trde_title_en` varchar(100) NOT NULL COMMENT '标题英文',
  `trde_title_fr` varchar(100) NOT NULL COMMENT '标题法文',
  `trde_content_en` varchar(2000) NOT NULL COMMENT '形成描述英文',
  `trde_content_fr` varchar(2000) NOT NULL COMMENT '形成描述法文',
  `trde_destination_en` varchar(1000) DEFAULT NULL COMMENT '目的地英文',
  `trde_destination_fr` varchar(1000) DEFAULT NULL COMMENT '目的地法文',
  `trde_meals_en` varchar(500) DEFAULT NULL COMMENT '餐饮安排描述英文',
  `trde_meals_fr` varchar(500) DEFAULT NULL COMMENT '餐饮安排描述法文',
  `trde_transport_en` varchar(500) DEFAULT NULL COMMENT '交通安排描述英文',
  `trde_transport_fr` varchar(500) DEFAULT NULL COMMENT '交通安排描述法文',
  `trde_hotel_en` varchar(1000) DEFAULT NULL COMMENT '酒店安排描述英文',
  `trde_hotel_fr` varchar(1000) DEFAULT NULL COMMENT '酒店安排描述英文',
  PRIMARY KEY (`trde_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='行程详情';

-- ----------------------------
-- Records of tm_tourdetail
-- ----------------------------
INSERT INTO `tm_tourdetail` VALUES ('30', '1', '1', 'Shanghai Departure', '12', 'As your China trip comes to end, your tour guide, driver and car will pick you up from your hotel and transfer you to Shanghai Pudong International Airport for your departure flight home. The guide will assist you with flight check-in and luggage, and see you off at the point of security check.', '12', 'des-en', 'des-fr', 'emal-en', 'meal-fr', 'transport-en', 'transport-fr', 'hotel-en', 'hotel-fr');
INSERT INTO `tm_tourdetail` VALUES ('31', '1', '2', 'Shanghai – Metropolis of East and West', '', 'China’s most prosperous city oozes vibes of both tradition and modernity. See the typical Shanghainese life at Shikumen, South China’s classical landscape garden at Yuyuan Garden, enjoy a bird’s eye view over Shanghai on the sightseeing deck of Oriental Pearl TV Tower, and finally have a walk around the Bund to learn Shanghai history.', '', '111-en', '222-fr', '111-en', '222-fr', '111-en', '111-fr', '111-ne', '111-fr');
INSERT INTO `tm_tourdetail` VALUES ('45', '178', '1', 'day1--en--pengxiao', 'day1-fr---pengxiao', 'hello day1 -en', 'hello day1 -fr', null, null, null, null, null, null, null, null);
INSERT INTO `tm_tourdetail` VALUES ('76', '178', '2', 'day2---en--pengxiao', 'day2--fr--pengxiao', 'content--en', 'content--fr', null, null, null, null, null, null, null, null);
INSERT INTO `tm_tourdetail` VALUES ('77', '178', '3', 'day3--en--pengxiao', 'day3-fr--pengxiao', 'hello day3 en', 'hello  day3 fr', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for tm_tourhotel
-- ----------------------------
DROP TABLE IF EXISTS `tm_tourhotel`;
CREATE TABLE `tm_tourhotel` (
  `toh_id` int(50) NOT NULL AUTO_INCREMENT,
  `htl_id` varchar(100) NOT NULL COMMENT '酒店id',
  `htl_price` decimal(8,2) NOT NULL COMMENT '差价',
  PRIMARY KEY (`toh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_tourhotel
-- ----------------------------

-- ----------------------------
-- Table structure for tm_tour_dest
-- ----------------------------
DROP TABLE IF EXISTS `tm_tour_dest`;
CREATE TABLE `tm_tour_dest` (
  `tour_id` int(11) DEFAULT NULL,
  `dest_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_tour_dest
-- ----------------------------
INSERT INTO `tm_tour_dest` VALUES ('101', '100');
INSERT INTO `tm_tour_dest` VALUES ('102', '100');
INSERT INTO `tm_tour_dest` VALUES ('1', '100');
INSERT INTO `tm_tour_dest` VALUES ('2', '100');
INSERT INTO `tm_tour_dest` VALUES ('3', '100');
INSERT INTO `tm_tour_dest` VALUES ('4', '100');
INSERT INTO `tm_tour_dest` VALUES ('5', '100');
INSERT INTO `tm_tour_dest` VALUES ('6', '100');
INSERT INTO `tm_tour_dest` VALUES ('7', '100');
INSERT INTO `tm_tour_dest` VALUES ('8', '100');
INSERT INTO `tm_tour_dest` VALUES ('9', '100');
INSERT INTO `tm_tour_dest` VALUES ('10', '100');
INSERT INTO `tm_tour_dest` VALUES ('11', '100');
INSERT INTO `tm_tour_dest` VALUES ('12', '1000');
INSERT INTO `tm_tour_dest` VALUES ('13', '100');
INSERT INTO `tm_tour_dest` VALUES ('14', '100');
INSERT INTO `tm_tour_dest` VALUES ('15', '100');
INSERT INTO `tm_tour_dest` VALUES ('16', '100');
INSERT INTO `tm_tour_dest` VALUES ('101', '100');
INSERT INTO `tm_tour_dest` VALUES ('102', '100');
INSERT INTO `tm_tour_dest` VALUES ('1', '100');
INSERT INTO `tm_tour_dest` VALUES ('2', '100');
INSERT INTO `tm_tour_dest` VALUES ('3', '100');
INSERT INTO `tm_tour_dest` VALUES ('4', '100');
INSERT INTO `tm_tour_dest` VALUES ('5', '100');
INSERT INTO `tm_tour_dest` VALUES ('6', '100');
INSERT INTO `tm_tour_dest` VALUES ('7', '100');
INSERT INTO `tm_tour_dest` VALUES ('8', '100');
INSERT INTO `tm_tour_dest` VALUES ('9', '100');
INSERT INTO `tm_tour_dest` VALUES ('10', '100');
INSERT INTO `tm_tour_dest` VALUES ('11', '100');
INSERT INTO `tm_tour_dest` VALUES ('12', '1000');
INSERT INTO `tm_tour_dest` VALUES ('13', '100');
INSERT INTO `tm_tour_dest` VALUES ('14', '100');
INSERT INTO `tm_tour_dest` VALUES ('15', '100');
INSERT INTO `tm_tour_dest` VALUES ('16', '100');

-- ----------------------------
-- Table structure for tm_tour_image
-- ----------------------------
DROP TABLE IF EXISTS `tm_tour_image`;
CREATE TABLE `tm_tour_image` (
  `tour_id` int(11) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `orders` int(11) NOT NULL COMMENT '图片顺序',
  `thumbnail` int(11) NOT NULL DEFAULT '0' COMMENT '1主缩略图 0不是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_tour_image
-- ----------------------------
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/4.jpg', '3', '1');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/6.jpg', '5', '0');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/7.jpg', '6', '0');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/8.jpg', '7', '0');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/9.jpg', '0', '0');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/10.jpg', '0', '0');
INSERT INTO `tm_tour_image` VALUES ('63', '/img/test/2.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('42', '/img/test/1.jpg', '2', '1');
INSERT INTO `tm_tour_image` VALUES ('3', '/img/test/2.jpg', '0', '0');
INSERT INTO `tm_tour_image` VALUES ('4', '/img/test/2.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('6', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('7', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('8', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('9', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('10', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('11', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('12', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('13', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('14', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('15', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('16', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('17', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('18', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('19', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('20', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('21', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('22', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('23', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('24', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('27', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('28', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('29', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('30', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('31', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('32', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('101', '/img/product/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('102', '/img/product/4.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('38', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('39', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('40', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('43', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('44', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('45', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('46', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('47', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('48', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('49', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('50', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('51', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('52', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('53', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('54', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('55', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('56', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('57', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('58', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('59', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('60', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('61', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('62', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('71', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('72', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('73', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('74', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('75', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('76', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('77', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('78', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('79', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('70', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('36', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('64', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('3', '/upload/tour/root/1454315208272.jpg', '1', '1');
INSERT INTO `tm_tour_image` VALUES ('177', '/upload/tour/root/1.jpg', '2', '0');
INSERT INTO `tm_tour_image` VALUES ('178', '/upload/tour/root/1454397327310.jpg', '1', '1');
INSERT INTO `tm_tour_image` VALUES ('1', '/img/test/1.jpg', '1', '1');
INSERT INTO `tm_tour_image` VALUES ('1', '/img/test/2.jpg', '2', '0');
INSERT INTO `tm_tour_image` VALUES ('1', '/img/test/3.jpg', '8', '0');
INSERT INTO `tm_tour_image` VALUES ('1', '/img/test/5.jpg', '4', '0');
INSERT INTO `tm_tour_image` VALUES ('181', '/upload/tour/root/1454489458830.jpg', '-1', '0');
INSERT INTO `tm_tour_image` VALUES ('182', '/upload/tour/root/1454490773473.jpg', '-1', '0');
INSERT INTO `tm_tour_image` VALUES ('182', '/upload/tour/root/1454490773473.jpg', '-1', '0');
INSERT INTO `tm_tour_image` VALUES ('182', '/upload/tour/root/1454492894939.jpg', '-1', '0');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/4.jpg', '3', '1');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/6.jpg', '5', '0');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/7.jpg', '6', '0');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/8.jpg', '7', '0');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/9.jpg', '0', '0');
INSERT INTO `tm_tour_image` VALUES ('2', '/img/test/10.jpg', '0', '0');
INSERT INTO `tm_tour_image` VALUES ('63', '/img/test/2.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('42', '/img/test/1.jpg', '2', '1');
INSERT INTO `tm_tour_image` VALUES ('3', '/img/test/2.jpg', '0', '0');
INSERT INTO `tm_tour_image` VALUES ('4', '/img/test/2.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('6', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('7', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('8', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('9', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('10', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('11', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('12', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('13', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('14', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('15', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('16', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('17', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('18', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('19', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('20', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('21', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('22', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('23', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('24', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('27', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('28', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('29', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('30', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('31', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('32', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('101', '/img/product/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('102', '/img/product/4.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('38', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('39', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('40', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('43', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('44', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('45', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('46', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('47', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('48', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('49', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('50', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('51', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('52', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('53', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('54', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('55', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('56', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('57', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('58', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('59', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('60', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('61', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('62', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('71', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('72', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('73', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('74', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('75', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('76', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('77', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('78', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('79', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('70', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('36', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('64', '/img/test/3.jpg', '0', '1');
INSERT INTO `tm_tour_image` VALUES ('3', '/upload/tour/root/1454315208272.jpg', '1', '1');
INSERT INTO `tm_tour_image` VALUES ('177', '/upload/tour/root/1.jpg', '2', '0');
INSERT INTO `tm_tour_image` VALUES ('178', '/upload/tour/root/1454397327310.jpg', '1', '1');
INSERT INTO `tm_tour_image` VALUES ('1', '/img/test/1.jpg', '1', '1');
INSERT INTO `tm_tour_image` VALUES ('1', '/img/test/2.jpg', '2', '0');
INSERT INTO `tm_tour_image` VALUES ('1', '/img/test/3.jpg', '8', '0');
INSERT INTO `tm_tour_image` VALUES ('1', '/img/test/5.jpg', '4', '0');
INSERT INTO `tm_tour_image` VALUES ('181', '/upload/tour/root/1454489458830.jpg', '-1', '0');
INSERT INTO `tm_tour_image` VALUES ('182', '/upload/tour/root/1454490773473.jpg', '-1', '0');
INSERT INTO `tm_tour_image` VALUES ('182', '/upload/tour/root/1454490773473.jpg', '-1', '0');
INSERT INTO `tm_tour_image` VALUES ('182', '/upload/tour/root/1454492894939.jpg', '-1', '0');

-- ----------------------------
-- Table structure for tm_tour_option_value
-- ----------------------------
DROP TABLE IF EXISTS `tm_tour_option_value`;
CREATE TABLE `tm_tour_option_value` (
  `tour_id` int(11) NOT NULL COMMENT '旅游线路ID',
  `value_id` int(11) NOT NULL COMMENT '选项值ID',
  `value_price` decimal(8,2) NOT NULL COMMENT '线路选项差价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_tour_option_value
-- ----------------------------

-- ----------------------------
-- Table structure for tm_tour_theme
-- ----------------------------
DROP TABLE IF EXISTS `tm_tour_theme`;
CREATE TABLE `tm_tour_theme` (
  `tour_id` int(11) NOT NULL COMMENT '线路代码',
  `thm_id` int(11) NOT NULL COMMENT '主题代码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_tour_theme
-- ----------------------------
INSERT INTO `tm_tour_theme` VALUES ('101', '100');
INSERT INTO `tm_tour_theme` VALUES ('102', '100');
INSERT INTO `tm_tour_theme` VALUES ('3', '100');
INSERT INTO `tm_tour_theme` VALUES ('4', '100');
INSERT INTO `tm_tour_theme` VALUES ('5', '100');
INSERT INTO `tm_tour_theme` VALUES ('2', '100');
INSERT INTO `tm_tour_theme` VALUES ('1', '100');
INSERT INTO `tm_tour_theme` VALUES ('6', '100');
INSERT INTO `tm_tour_theme` VALUES ('181', '81');
INSERT INTO `tm_tour_theme` VALUES ('182', '80');
INSERT INTO `tm_tour_theme` VALUES ('183', '81');
INSERT INTO `tm_tour_theme` VALUES ('7', '100');
INSERT INTO `tm_tour_theme` VALUES ('8', '100');
INSERT INTO `tm_tour_theme` VALUES ('9', '100');
INSERT INTO `tm_tour_theme` VALUES ('10', '100');
INSERT INTO `tm_tour_theme` VALUES ('11', '100');
INSERT INTO `tm_tour_theme` VALUES ('12', '100');
INSERT INTO `tm_tour_theme` VALUES ('13', '100');
INSERT INTO `tm_tour_theme` VALUES ('14', '100');
INSERT INTO `tm_tour_theme` VALUES ('15', '100');
INSERT INTO `tm_tour_theme` VALUES ('16', '100');
INSERT INTO `tm_tour_theme` VALUES ('17', '100');
INSERT INTO `tm_tour_theme` VALUES ('184', '81');
INSERT INTO `tm_tour_theme` VALUES ('185', '81');
INSERT INTO `tm_tour_theme` VALUES ('101', '100');
INSERT INTO `tm_tour_theme` VALUES ('102', '100');
INSERT INTO `tm_tour_theme` VALUES ('3', '100');
INSERT INTO `tm_tour_theme` VALUES ('4', '100');
INSERT INTO `tm_tour_theme` VALUES ('5', '100');
INSERT INTO `tm_tour_theme` VALUES ('2', '100');
INSERT INTO `tm_tour_theme` VALUES ('1', '100');
INSERT INTO `tm_tour_theme` VALUES ('6', '100');
INSERT INTO `tm_tour_theme` VALUES ('181', '81');
INSERT INTO `tm_tour_theme` VALUES ('182', '80');
INSERT INTO `tm_tour_theme` VALUES ('183', '81');
INSERT INTO `tm_tour_theme` VALUES ('7', '100');
INSERT INTO `tm_tour_theme` VALUES ('8', '100');
INSERT INTO `tm_tour_theme` VALUES ('9', '100');
INSERT INTO `tm_tour_theme` VALUES ('10', '100');
INSERT INTO `tm_tour_theme` VALUES ('11', '100');
INSERT INTO `tm_tour_theme` VALUES ('12', '100');
INSERT INTO `tm_tour_theme` VALUES ('13', '100');
INSERT INTO `tm_tour_theme` VALUES ('14', '100');
INSERT INTO `tm_tour_theme` VALUES ('15', '100');
INSERT INTO `tm_tour_theme` VALUES ('16', '100');
INSERT INTO `tm_tour_theme` VALUES ('17', '100');
INSERT INTO `tm_tour_theme` VALUES ('184', '81');
INSERT INTO `tm_tour_theme` VALUES ('185', '81');

-- ----------------------------
-- Table structure for tm_value
-- ----------------------------
DROP TABLE IF EXISTS `tm_value`;
CREATE TABLE `tm_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `value_en` varchar(100) NOT NULL COMMENT '选项值英文',
  `value_fr` varchar(100) NOT NULL COMMENT '选项值法文',
  `notes_en` varchar(100) NOT NULL COMMENT '选项值英文备注',
  `notes_fr` varchar(100) NOT NULL COMMENT '选项值法文备注',
  `price` decimal(8,2) NOT NULL COMMENT '选项差价（套餐自带为0）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_value
-- ----------------------------
INSERT INTO `tm_value` VALUES ('1', '2', 'sdddddddddddd', 'asdfs', 'dfsdf', 'ffsdf', '0.00');
INSERT INTO `tm_value` VALUES ('25', '2', 'we', 'sf', 'sdf', 'sf', '0.00');
INSERT INTO `tm_value` VALUES ('27', '8', 'dsf', 'sdf', 'sd', 'fsf', '0.00');
INSERT INTO `tm_value` VALUES ('43', '11', 'we', 'we', 'we', 'ew', '0.00');
INSERT INTO `tm_value` VALUES ('49', '15', 'eew', 'wee', '', '', '0.00');
INSERT INTO `tm_value` VALUES ('50', '11', '我问问', 'ww', 'we', '', '0.00');
INSERT INTO `tm_value` VALUES ('51', '11', 'd', 'd', 'd', 'd', '0.00');
INSERT INTO `tm_value` VALUES ('55', '16', '123', '12', '3123123', '123123', '0.00');
INSERT INTO `tm_value` VALUES ('56', '16', 'ftrwq', 'egv', 'rgeq', 'rgerq', '0.00');

-- ----------------------------
-- Table structure for ts_dept
-- ----------------------------
DROP TABLE IF EXISTS `ts_dept`;
CREATE TABLE `ts_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `dept_code` varchar(20) DEFAULT NULL COMMENT '部门代码',
  `level_code` varchar(20) DEFAULT NULL COMMENT '部门级别代码',
  `dept_name_en` varchar(50) DEFAULT NULL COMMENT '部门名称英文',
  `dept_name_fr` varchar(100) DEFAULT NULL COMMENT '部门名称法文',
  `dept_parent` varchar(20) DEFAULT NULL COMMENT '上级部门代码',
  `status` varchar(1) DEFAULT NULL COMMENT '状态(N:正常,S:停用)',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `pass_loginname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `idx_dept_code` (`dept_code`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_dept
-- ----------------------------
INSERT INTO `ts_dept` VALUES ('1', 'fds', 'ADMIN', 'System Management', 'system', '', 'S', '2016-01-31 15:58:23', 'root');
INSERT INTO `ts_dept` VALUES ('2', 'TNLY', 'SUPPLIER', '途牛旅游', 'tuniulvyou', 'PLATEFORM', 'S', '2015-12-24 23:26:41', 'root');
INSERT INTO `ts_dept` VALUES ('3', 'PLATEFORM', 'SUPPLIER', '旅游管理', 'lvyouguanli', '', 'S', '2015-12-24 23:18:18', 'system');
INSERT INTO `ts_dept` VALUES ('23', 'cscode', 'cslcode', '测试2', 'ceshi2', '测试', 'S', '2016-02-01 14:51:54', 'root');
INSERT INTO `ts_dept` VALUES ('24', 'plat', 'platLcode', 'platf', 'plat', 'PLATEFORM', 'N', '2016-01-30 16:39:18', 'root');
INSERT INTO `ts_dept` VALUES ('25', '测试', 'ces', '测试', 'text', 'ADMIN', 'N', '2016-02-01 14:51:34', 'root');
INSERT INTO `ts_dept` VALUES ('36', 'shanji', 'sdd', 'gfdasd', 'asda', '', 'N', '2016-01-05 10:40:55', 'root');
INSERT INTO `ts_dept` VALUES ('37', 'dfas', 'fd', 'rrr', 'abc', 'shanji', 'N', '2016-01-05 10:41:37', 'root');
INSERT INTO `ts_dept` VALUES ('38', '77', '77', '77', 'adas', 'cscode', 'N', '2016-01-29 20:12:41', 'root');

-- ----------------------------
-- Table structure for ts_language
-- ----------------------------
DROP TABLE IF EXISTS `ts_language`;
CREATE TABLE `ts_language` (
  `uuid` varchar(64) NOT NULL COMMENT '主键',
  `type` varchar(8) DEFAULT NULL COMMENT '类型en fr',
  `content` varchar(128) DEFAULT NULL COMMENT '内容值',
  `operate_at` datetime DEFAULT NULL,
  `operate_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_language
-- ----------------------------
INSERT INTO `ts_language` VALUES ('24980149862662144', 'en', '1111enen', null, null);
INSERT INTO `ts_language` VALUES ('24980149862662145', 'en', 'fsdaenenenenen', null, null);
INSERT INTO `ts_language` VALUES ('24980149862662146', 'en', 'Navires de croisière', null, null);
INSERT INTO `ts_language` VALUES ('24980149862662147', 'en', 'dd', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662148', 'en', 'test11', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662149', 'en', '23', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662150', 'en', '11', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662151', 'en', 'bigMoneyfr', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662152', 'en', 'theme1', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662153', 'en', 'theme2', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662154', 'en', 'theme3', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662155', 'en', '上海英', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662156', 'en', '广州英', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662157', 'en', 'Beijing', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662158', 'en', '桂林英', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662159', 'en', '测试城市en', '2017-03-08 00:00:00', 'PX');
INSERT INTO `ts_language` VALUES ('24980149862662160', 'en', 'shangirla', '2017-03-08 00:00:00', 'PX');

-- ----------------------------
-- Table structure for ts_level
-- ----------------------------
DROP TABLE IF EXISTS `ts_level`;
CREATE TABLE `ts_level` (
  `level_code` varchar(20) NOT NULL COMMENT '部门级别代码',
  `level_name_en` varchar(50) DEFAULT NULL COMMENT '部门级别名称英文',
  `level_name_fr` varchar(50) DEFAULT NULL COMMENT '部门级别名称法语',
  `level_parent` varchar(20) DEFAULT NULL COMMENT '上级部门级别代码',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `pass_loginname` varchar(30) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`level_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_level
-- ----------------------------
INSERT INTO `ts_level` VALUES ('PLATEFORM', 'plateform', 'platefye', 'SCM', '2016-01-01 20:17:04', 'root');
INSERT INTO `ts_level` VALUES ('SUPPLIER', 'supplier', 'Les fournisseurs', 'PLATEFORM', '2015-11-16 18:34:28', 'system');

-- ----------------------------
-- Table structure for ts_mailhistory
-- ----------------------------
DROP TABLE IF EXISTS `ts_mailhistory`;
CREATE TABLE `ts_mailhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮件历史id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(1000) DEFAULT NULL COMMENT '邮件内容',
  `user_id` int(11) DEFAULT NULL COMMENT '收件人id',
  `email` varchar(30) DEFAULT NULL COMMENT '收件人email',
  `type` varchar(20) DEFAULT NULL COMMENT '邮件类型NEWORDER:新订单INVOICE:发票',
  `orderno` varchar(30) DEFAULT NULL COMMENT '关联单号如果是订单就指订单号，也可以是其他单号',
  `operatetime` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='邮件发送历史表';

-- ----------------------------
-- Records of ts_mailhistory
-- ----------------------------
INSERT INTO `ts_mailhistory` VALUES ('1', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=105&authcode=WetjnH45Fdcz0mc5y73T', '105', '1065300897@qq.com', 's', '1', '2016-01-28 14:19:57');
INSERT INTO `ts_mailhistory` VALUES ('2', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=105&authcode=q1BoQlDCxchTHJ98voAf', '105', '1065300897@qq.com', 's', '2', '2016-01-28 17:04:31');
INSERT INTO `ts_mailhistory` VALUES ('3', 'Register successfully', 'Congratulations to you, dear zhangyun users registered success', '1', '1065300897@qq.com', 'f', '3', '2016-01-28 17:32:28');
INSERT INTO `ts_mailhistory` VALUES ('4', 'Register successfully', 'Congratulations to you, dear zhangyun users registered success', '2', '1065300897@qq.com', 'f', '4', '2016-01-28 17:48:58');
INSERT INTO `ts_mailhistory` VALUES ('5', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=2&authcode=pbRfBk4QgULj8EEUSCYi', '2', '1065300897@qq.com', null, null, '2016-01-28 18:03:21');
INSERT INTO `ts_mailhistory` VALUES ('6', 'Register successfully', 'Congratulations to you, dear zhangyun users registered success', '1', '1065300897@qq.com', null, null, '2016-01-28 18:10:54');
INSERT INTO `ts_mailhistory` VALUES ('7', 'Register successfully', 'Congratulations to you, dear zhy users registered success', '2', '1582339899@qq.com', null, null, '2016-01-28 18:14:36');
INSERT INTO `ts_mailhistory` VALUES ('8', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=2&authcode=3MblouOuyP9mvfOCGref', '2', '1582339899@qq.com', null, null, '2016-01-28 18:18:32');
INSERT INTO `ts_mailhistory` VALUES ('9', 'Register successfully', 'Congratulations to you, dear zhangyun users registered success', '2', '1065300897@qq.com', null, null, '2016-01-28 18:27:51');
INSERT INTO `ts_mailhistory` VALUES ('10', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=2&authcode=2tdfcbGY5HXXlev95lpJ', '2', '1065300897@qq.com', null, null, '2016-01-28 18:28:51');
INSERT INTO `ts_mailhistory` VALUES ('11', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=2&authcode=CxPtatjMBI3tI8acc0qO', '2', '1065300897@qq.com', null, null, '2016-01-28 19:13:10');
INSERT INTO `ts_mailhistory` VALUES ('12', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=2&authcode=yxlCseLjXNhVre5Az9q5', '2', '1065300897@qq.com', null, null, '2016-01-28 19:16:34');
INSERT INTO `ts_mailhistory` VALUES ('13', 'Register successfully', 'Congratulations to you, dear zhangyun users registered success', '1', '1065300897@qq.com', null, null, '2016-01-28 19:38:21');
INSERT INTO `ts_mailhistory` VALUES ('14', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=1&authcode=4CWg9sXn79MJ6f5lmr70', '1', '1065300897@qq.com', null, null, '2016-01-28 19:40:01');
INSERT INTO `ts_mailhistory` VALUES ('15', 'Register successfully', 'Congratulations to you, dear pengxyc users registered success', '3', 'pengxyc@163.com', null, null, '2016-01-29 21:14:07');
INSERT INTO `ts_mailhistory` VALUES ('16', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=3&amp;authcode=YzrwI9gzi4vRm2X3TP1a', '3', 'pengxyc@163.com', null, null, '2016-01-29 21:18:28');
INSERT INTO `ts_mailhistory` VALUES ('17', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=3&amp;authcode=uh5yAp58O57wUcS9reuh', '3', 'pengxyc@163.com', null, null, '2016-01-29 21:23:23');
INSERT INTO `ts_mailhistory` VALUES ('18', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=3&amp;authcode=1L4ngAtTrLD6nEJ4D566', '3', 'pengxyc@163.com', null, null, '2016-01-29 21:34:18');
INSERT INTO `ts_mailhistory` VALUES ('19', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=1&amp;authcode=IEIMj9ut3jOx23OWLAR9', '1', '1065300897@qq.com', null, null, '2016-01-30 14:04:35');
INSERT INTO `ts_mailhistory` VALUES ('20', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=66&amp;authcode=d7qij940pqBUMR5mvt9m', '66', '746848281@qq.com', null, null, '2016-01-30 14:24:29');
INSERT INTO `ts_mailhistory` VALUES ('21', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=4&amp;authcode=CMk9UNIKuQPiRMu0zGme', '4', '1065300897@qq.com', null, null, '2016-01-31 10:12:28');
INSERT INTO `ts_mailhistory` VALUES ('22', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=66&amp;authcode=LrL4g8GeS0MzETtbXPo6', '66', '746848281@qq.com', null, null, '2016-01-31 13:58:42');
INSERT INTO `ts_mailhistory` VALUES ('23', 'Register successfully', 'Congratulations to you, dear fct users registered success', '4', '904611647@qq.com', null, null, '2016-02-01 11:29:12');
INSERT INTO `ts_mailhistory` VALUES ('24', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=4&amp;authcode=QyzK7inhKsuw2LeFyUgu', '4', '904611647@qq.com', null, null, '2016-02-02 10:55:53');
INSERT INTO `ts_mailhistory` VALUES ('25', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=4&amp;authcode=OrGovxqFNjX3NKdKPfWr', '4', '904611647@qq.com', null, null, '2016-02-02 10:58:16');
INSERT INTO `ts_mailhistory` VALUES ('26', 'Register successfully', '<div>Dear &nbsp;ch746848281,</div><div><br></div><div>Welcome to Beautiful China!&nbsp;Your &nbsp;Beautiful China&nbsp;account has been created.<br><br></div><div><p>Sincerely,</p>\n<p>Beautiful China<br></p><p><br></p><p><br></p><p>Please do not reply to this email.<br></p></div>', '6', '746848281@qq.com', null, null, '2016-02-03 15:40:30');
INSERT INTO `ts_mailhistory` VALUES ('27', 'Register successfully', '<div>Dear &nbsp;zhangyun,</div><div><br></div><div>Welcome to Beautiful China!&nbsp;Your &nbsp;Beautiful China&nbsp;account has been created.<br><br></div><div><p>Sincerely,</p>\n<p>Beautiful China<br></p><p><br></p><p><br></p><p>Please do not reply to this email.<br></p></div>', '7', '1065300897@qq.com', null, null, '2016-03-06 14:47:26');
INSERT INTO `ts_mailhistory` VALUES ('28', 'Register successfully', '<div>Dear &nbsp;zhangyun,</div><div><br></div><div>Welcome to Beautiful China!&nbsp;Your &nbsp;Beautiful China&nbsp;account has been created.<br><br></div><div><p>Sincerely,</p>\n<p>Beautiful China<br></p><p><br></p><p><br></p><p>Please do not reply to this email.<br></p></div>', '8', '1065300897@qq.com', null, null, '2016-03-06 14:52:06');
INSERT INTO `ts_mailhistory` VALUES ('29', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=8&authcode=09jCzE8HvdxDCarBTUkhtresadsfgjm', '8', '1065300897@qq.com', null, null, '2016-03-06 14:54:10');
INSERT INTO `ts_mailhistory` VALUES ('30', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=8&amp;authcode=iVKAOEbrjCd2lBKLb1yktresadsfgjm', '8', '1065300897@qq.com', null, null, '2016-03-06 14:57:41');
INSERT INTO `ts_mailhistory` VALUES ('31', 'To reset your password', 'The reset password link:http://localhost:8080/resetPassword?id=8&authcode=FJX0DU70hI7gnjP56Sjf', '8', '1065300897@qq.com', null, null, '2016-03-06 15:02:03');
INSERT INTO `ts_mailhistory` VALUES ('32', 'Register successfully', '<div>Dear &nbsp;#Username#,</div><div><br></div><div>Welcome to Beautiful China!&nbsp;Your &nbsp;Beautiful China&nbsp;account has been created.<br><br></div><div><p>Sincerely,</p>\n<p>Beautiful China<br></p><p><br></p><p><br></p><p>Please do not reply to this email.<br></p></div>', '8', '', null, null, '2017-03-08 17:03:29');
INSERT INTO `ts_mailhistory` VALUES ('33', 'Register successfully', '<div>Dear &nbsp;#Username#,</div><div><br></div><div>Welcome to Beautiful China!&nbsp;Your &nbsp;Beautiful China&nbsp;account has been created.<br><br></div><div><p>Sincerely,</p>\n<p>Beautiful China<br></p><p><br></p><p><br></p><p>Please do not reply to this email.<br></p></div>', '14', '', null, null, '2017-03-08 17:15:14');
INSERT INTO `ts_mailhistory` VALUES ('34', 'Register successfully', '<div>Dear &nbsp;#Username#,</div><div><br></div><div>Welcome to Beautiful China!&nbsp;Your &nbsp;Beautiful China&nbsp;account has been created.<br><br></div><div><p>Sincerely,</p>\n<p>Beautiful China<br></p><p><br></p><p><br></p><p>Please do not reply to this email.<br></p></div>', '15', '', null, null, '2017-03-08 17:16:08');

-- ----------------------------
-- Table structure for ts_mailtemplate
-- ----------------------------
DROP TABLE IF EXISTS `ts_mailtemplate`;
CREATE TABLE `ts_mailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `name` varchar(50) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL COMMENT '邮件标题(英语)',
  `title_fr` varchar(100) DEFAULT NULL COMMENT '邮件标题(法语)',
  `content_en` varchar(1000) DEFAULT NULL COMMENT '邮件内容(英语)',
  `content_fr` varchar(1000) DEFAULT NULL COMMENT '邮件内容(法语)',
  `operatetime` datetime DEFAULT NULL COMMENT '操作时间',
  `pass_id` int(11) DEFAULT NULL COMMENT '操作人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_mailtemplate
-- ----------------------------
INSERT INTO `ts_mailtemplate` VALUES ('1', 'register', 'Register successfully', 'agréé', '<div>Dear &nbsp;#Username#,</div><div><br></div><div>Welcome to Beautiful China!&nbsp;Your &nbsp;Beautiful China&nbsp;account has been created.<br><br></div><div><p>Sincerely,</p>\n<p>Beautiful China<br></p><p><br></p><p><br></p><p>Please do not reply to this email.<br></p></div>', '<span class=\"hps\">Cher</span> <span class=\"hps\">#</span><span class=\"hps\">Username#</span>,<br><br><span class=\"hps\">Bienvenue à</span> <span class=\"hps\">Belle</span> <span class=\"hps\">Chine!</span> <span class=\"hps\">Votre</span> <span class=\"hps\">Belle</span> <span class=\"hps\">compte</span> <span class=\"hps\">la Chine</span> <span class=\"hps\">a été créé.</span><br><br><span class=\"hps\">Cordialement,</span><br><br><span class=\"hps\">belle</span> <span class=\"hps\">Chine</span><br><br><br><br><br><br><span class=\"hps\">S\'il vous plait ne répondez pas à cet email.</span>', '2015-11-25 13:56:35', '101');
INSERT INTO `ts_mailtemplate` VALUES ('2', 'resetPassword', 'To reset your password', 'Mot de passe de remplacement', 'The reset password link:#domain#resetPassword?id=#id#&authcode=#authcode#', 'Mot de passe de remplacement liaisons:#domain#resetPassword?id=#id#&amp;authcode=#authcode#', null, null);
INSERT INTO `ts_mailtemplate` VALUES ('32', '的撒', '的飞洒', ' 撒', '的撒', '的撒', null, null);
INSERT INTO `ts_mailtemplate` VALUES ('33', 'kjhmngfbds', 'fghjm,..', 'mgfvbdc', 'gfdsa', 'dfvghjk,hjmgfbadsfvghj', null, null);
INSERT INTO `ts_mailtemplate` VALUES ('34', 'gfh', 'gh', 'sfgh', 'dfgh', 'fghdfgh', null, null);

-- ----------------------------
-- Table structure for ts_menu
-- ----------------------------
DROP TABLE IF EXISTS `ts_menu`;
CREATE TABLE `ts_menu` (
  `menu_code` varchar(20) NOT NULL COMMENT '菜单代码',
  `menu_name_en` varchar(50) DEFAULT NULL COMMENT '菜单名称英文',
  `menu_name_fr` varchar(50) DEFAULT NULL COMMENT '菜单名称法语',
  `menu_link` varchar(50) DEFAULT NULL COMMENT '菜单链接',
  `module_code` varchar(20) DEFAULT NULL COMMENT '模块代码',
  `plate_code` varchar(20) DEFAULT NULL COMMENT '板块代码',
  `menu_level` varchar(10) DEFAULT NULL COMMENT '管理级别(0000)第一位1表示超级管理员级别/第二位1表示总部管理级别/第三位1表示区域管理级别/第四位1表示供应商操作级别',
  `menu_sort` int(11) DEFAULT NULL COMMENT '排序',
  `menu_notes` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` varchar(1) DEFAULT NULL COMMENT '状态(N:正常,S:停用)',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `pass_loginname` varchar(30) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_menu
-- ----------------------------
INSERT INTO `ts_menu` VALUES ('B002-001_117', 'Tour Date Management', 'Gestion des tourdate', 'tourdatemanage', 'B002-001', 'B002', '1000', '1', 'Tour Date Management 线路出团管理', 'N', '2016-02-03 13:49:26', 'root');
INSERT INTO `ts_menu` VALUES ('B002-001_120', 'Tour Route Management', 'Gestion de voyages', 'tourmanage', 'B002-001', 'B002', '1000', '1', 'Tour Route Management 旅游路线管理', 'N', '2016-02-03 17:06:28', 'root');
INSERT INTO `ts_menu` VALUES ('B002-001_129', 'Hotel Management', 'Hotel Management', 'hotelmanage', 'B002-002', 'B002', '1000', '1', 'Hotel Management 酒店管理', 'N', '2016-02-03 13:40:56', 'root');
INSERT INTO `ts_menu` VALUES ('B002-001_135', 'Category Management', 'De la gestion par catégories de produits', 'categoryManage', 'B002-001', 'B002', '1000', '1', 'Category Management 分类管理', 'N', '2016-02-01 13:40:55', 'root');
INSERT INTO `ts_menu` VALUES ('B002-001_136', 'Line Theme Manager', 'Lignes de gestion, par thème', 'linethememanager', 'B002-001', 'B002', '1000', '1', 'LineThemeManager 线路主题管理', 'N', '2016-01-04 22:00:25', 'root');
INSERT INTO `ts_menu` VALUES ('B002-001_139', 'Sights Management', 'Gestion d\'attraction', 'sightsmanage', 'B002-001', 'B002', '1000', '1', 'Sights Management 景点管理', 'N', '2016-01-05 17:45:29', 'root');
INSERT INTO `ts_menu` VALUES ('B002-001_140', 'Destination Management', 'Gestion de destination', 'destinationmanage', 'B002-001', 'B002', '1000', '1', 'Destination Management 目的地管理', 'N', '2016-01-29 20:31:43', 'root');
INSERT INTO `ts_menu` VALUES ('B002-001_144', 'City Management', 'La gestion de la ville', 'citymanage', 'B001-001', 'B001', '1101', '7', 'City Management 城市管理', 'N', '2016-02-02 14:31:01', 'root');
INSERT INTO `ts_menu` VALUES ('B002-001_2', 'Customline Management', 'L’adaptation des lignes ', 'customlinemanage', 'B003-001', 'B003', '0000', '1', 'Customline Management 定制线路', 'N', '2016-02-02 14:32:49', 'root');
INSERT INTO `ts_menu` VALUES ('B004-001-001', 'Menu Management', 'Gestion du menu', 'menumanage', 'B004-001', 'B004', '1000', '1', 'Menu Management 菜单管理', 'N', '2016-02-02 14:33:10', 'root');
INSERT INTO `ts_menu` VALUES ('B004-001-002', 'Role Management', 'Gestion des rôles', 'rolemanage', 'B004-001', 'B004', '1000', '2', 'Role Management 角色管理', 'N', '2015-12-10 15:09:21', '');
INSERT INTO `ts_menu` VALUES ('B004-001_1', 'SystemConfig', 'Système config', 'syscfgmanage', 'B001-001', 'B001', '0001', '1', 'SystemConfig 系统配置', 'N', '2016-02-02 14:33:35', 'root');
INSERT INTO `ts_menu` VALUES ('B004-001_11', '编辑器', '123123', 'htmleditorpanel', 'B001-001', 'B001', '1101', '1', '11', 'N', '2016-02-02 14:34:49', 'root');
INSERT INTO `ts_menu` VALUES ('B004-001_110', 'Option Management', 'Options de gestion', 'option', 'B002-001', 'B002', '0001', '1', 'Option Management 选项管理', 'N', '2016-02-02 14:34:01', 'root');
INSERT INTO `ts_menu` VALUES ('B004-001_137', '示例', ' kkkdddd', 'example', 'B001-001', 'B001', '1100', '4', 'sffsddff212121221', 'N', '2016-02-02 14:35:09', 'root');
INSERT INTO `ts_menu` VALUES ('B004-001_155', 'Order Detail Management', 'Les détails de la gestion de l\'ordre', 'ordermanage', 'B002-002', 'B002', '0000', '1', 'Order Management 订单管理', 'N', '2016-02-02 14:35:20', 'root');
INSERT INTO `ts_menu` VALUES ('B004-002_1', 'Department Info Management', 'Des informations de gestion', 'dim', 'B004-002', 'B004', '1000', '1', 'Department Info Management 部门信息管理', 'N', '2016-02-02 14:35:37', 'root');
INSERT INTO `ts_menu` VALUES ('B004-002_116', 'SupplierApplyInfo Management', 'Informations sur les fournisseurs', 'suppliermanage', 'B003-003', 'B003', '1000', '1', 'SupplierApplyInfoManagement 供应商申请信息管理', 'N', '2016-02-02 14:35:56', 'root');
INSERT INTO `ts_menu` VALUES ('B004-002_14', 'Department Level Management', 'Gestion de niveau de service', 'dlm', 'B004-002', 'B004', '1000', '1', 'Department Level Management 部门等级管理 ', 'N', '2016-02-02 14:36:16', 'root');
INSERT INTO `ts_menu` VALUES ('B004-002_148', 'Consultive Management', 'Gestion de consultation', 'consultiveManagement', 'B003-002', 'B003', '1000', '1', 'Consultive Management 咨询管理', 'N', '2016-02-02 14:36:40', 'root');
INSERT INTO `ts_menu` VALUES ('B004-002_152', 'Consulting The Complaint Management ', 'La gestion des plaintes pour', 'consultingManage', 'B003-002', 'B003', '1000', '1', 'Consulting The Complaint Management  咨询投诉管理', 'N', '2016-01-28 10:14:02', 'root');
INSERT INTO `ts_menu` VALUES ('B004-002_5', 'Platform Management', 'Une plate-forme de gestion des', 'platformmanage', 'B004-002', 'B004', '1000', '2', 'PlatformManage 平台用户管理', 'N', '2016-02-02 14:37:03', 'root');
INSERT INTO `ts_menu` VALUES ('B004-002_6', 'Website User Management', 'La gestion par les utilisateurs du site', 'WebsiteUserManagement', 'B004-002', 'B004', '1000', '2', 'Website User Management 网站用户管理', 'N', '2015-12-10 20:17:04', '');
INSERT INTO `ts_menu` VALUES ('B004-003_121', 'Attribute Management', 'Gestion des attributs', 'attributemanage', 'B002-001', 'B002', '1100', '1', 'AttributeManagement 属性管理', 'N', '2016-02-02 14:37:34', 'root');
INSERT INTO `ts_menu` VALUES ('B004-003_40', 'Mail History  Management', 'L’histoire du courrier', 'MailHistoryManage', 'B004-003', 'B004', '1000', '1', 'Mail History  Manage 邮件历史记录', 'N', '2016-02-02 14:38:03', 'root');
INSERT INTO `ts_menu` VALUES ('B004-003_48', 'Mail Template Management', 'Le modèle de gestion du courrier', 'mailtemplatemanage', 'B004-003', 'B004', '1000', '1', 'Mail Template Manage 邮件模板管理', 'N', '2015-11-27 11:07:58', '');
INSERT INTO `ts_menu` VALUES ('B004-004_1', 'Display Management', 'La gestion montrent', 'displaymanage', 'B004-004', 'B004', '0000', '1', 'Display Management 首页显示管理', 'N', '2016-01-27 17:41:44', 'root');

-- ----------------------------
-- Table structure for ts_module
-- ----------------------------
DROP TABLE IF EXISTS `ts_module`;
CREATE TABLE `ts_module` (
  `module_code` varchar(20) NOT NULL DEFAULT '' COMMENT '模块代码',
  `module_name_en` varchar(50) DEFAULT NULL COMMENT '模块名称英文',
  `module_name_fr` varchar(50) DEFAULT NULL COMMENT '模块名称法语',
  `module_notes` varchar(200) DEFAULT NULL COMMENT '备注',
  `module_sort` int(11) DEFAULT '0' COMMENT '顺序',
  `status` varchar(1) DEFAULT NULL COMMENT '状态(N:正常,S:停用)',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `pass_loginname` varchar(30) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`module_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of ts_module
-- ----------------------------
INSERT INTO `ts_module` VALUES ('B001-001', 'Basic Parameter Management', 'Gestion de paramètres de base', '基础参数管理', '1', 'N', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_module` VALUES ('B002-001', 'Product Management', 'La gestion des produits', '产品管理', '1', 'N', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_module` VALUES ('B002-002', 'Order Management', 'La gestion des commandes', '订单管理', '2', 'N', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_module` VALUES ('B003-001', 'Customer service management', 'Gestion des services aux clients', '客户服务管理', '1', 'N', '2016-01-27 18:45:51', 'system');
INSERT INTO `ts_module` VALUES ('B003-002', 'Complaint Management', 'Conseils de gestion des plaintes', '投诉咨询管理', '2', 'N', '2016-01-28 10:10:12', 'system');
INSERT INTO `ts_module` VALUES ('B003-003', 'Supplier Management', 'Gestion des fournisseurs', '供应商管理', '3', 'N', '2016-01-28 10:20:01', 'system');
INSERT INTO `ts_module` VALUES ('B004-001', 'Authorization Management', 'Autorisation de la gestion', '权限管理', '1', 'N', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_module` VALUES ('B004-002', 'User Management', 'La gestion des utilisateurs', '用户管理', '2', 'N', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_module` VALUES ('B004-003', 'Email Management', 'La gestion du courrier électronique', '邮件管理', '1', 'N', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_module` VALUES ('B004-004', 'Site Configuration', 'La configuration du site web', '网站配置', '1', 'N', '2016-01-27 17:32:57', 'system');

-- ----------------------------
-- Table structure for ts_plate
-- ----------------------------
DROP TABLE IF EXISTS `ts_plate`;
CREATE TABLE `ts_plate` (
  `plate_code` varchar(20) NOT NULL DEFAULT '' COMMENT '板块代码',
  `plate_name_en` varchar(50) DEFAULT NULL COMMENT '板块名称英文',
  `plate_name_fr` varchar(50) DEFAULT NULL COMMENT '板块名称法语',
  `plate_notes` varchar(200) DEFAULT NULL COMMENT '备注',
  `plate_sort` int(11) DEFAULT NULL COMMENT '顺序',
  `status` varchar(1) DEFAULT NULL COMMENT '状态(N:正常,S:停用)',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `pass_loginname` varchar(30) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`plate_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='板块表';

-- ----------------------------
-- Records of ts_plate
-- ----------------------------
INSERT INTO `ts_plate` VALUES ('B001', 'Basic Data Management', 'Gestion d’une base de données', '基础数据管理', '1', 'N', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_plate` VALUES ('B002', 'Sales Management', 'La distribution', '销售管理', '2', 'N', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_plate` VALUES ('B003', 'Customers support', 'L’appui aux clients', '客户支持', '3', 'N', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_plate` VALUES ('B004', 'System Management', 'La mise en place de systèmes', '系统管理', '4', 'N', '2015-11-16 18:34:28', 'system');

-- ----------------------------
-- Table structure for ts_platform
-- ----------------------------
DROP TABLE IF EXISTS `ts_platform`;
CREATE TABLE `ts_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(20) DEFAULT '' COMMENT '名姓',
  `email` varchar(30) DEFAULT '' COMMENT 'email',
  `loginname` varchar(30) DEFAULT '' COMMENT '录名登',
  `pwd` varchar(40) DEFAULT '' COMMENT '密码',
  `dept_code` varchar(20) DEFAULT '' COMMENT '部门代码',
  `role_code` varchar(20) DEFAULT '' COMMENT '角色代码',
  `logintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `loginip` varchar(50) DEFAULT '' COMMENT '最后登录ip',
  `status` varchar(1) DEFAULT '' COMMENT '状态(N:正常,S:停用)',
  `tel` varchar(20) DEFAULT '' COMMENT '联系电话',
  `tel2` varchar(20) DEFAULT '' COMMENT '联系电话',
  `psw` varchar(70) DEFAULT NULL,
  `authcode` varchar(50) DEFAULT NULL,
  `operatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_platform
-- ----------------------------
INSERT INTO `ts_platform` VALUES ('1', 'Super administrator', '904611647@qq.com', 'max', '11', 'cscode', '23', '2015-12-08 11:21:55', '192.168.1.1', 'S', '111', '111', '', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('2', '途牛旅游管理员', '904611647@qq.com', 'tuniu', '11', 'TNLY', '11', '2015-12-06 11:22:16', '', 'N', '3411245554', '4353454', '', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('4', 'root', '1065300897@qq.com', 'root', '767fff9bc8e984e1f876edec99032c90', 'ADMIN', 'ADMIN', '2015-12-16 13:39:52', '', 'N', '1', '1', '344d524ec7b8a81b286de7044ef5ebcc7ffffead55dc66ee5f211bab79d12a8b', 'CMk9UNIKuQPiRMu0zGme', '2016-01-31 10:12:28');
INSERT INTO `ts_platform` VALUES ('8', '富士达', '324', 'dsf', '11', null, '11', null, '', 'N', '342', '34', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('13', 'dd', 'd', 'dgd', 'dd', null, '111', null, '', 'N', 'd', 'd', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('20', '第三方', 's@qq.com', '水电费', 'ds dd', 'cscode', 'dfdf', null, '', 'N', '321', '213', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('21', '电风扇', '1@qq.com', ' sdf', ' sd ', null, 'dfdf', null, '', 'N', '11', '11', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('22', '士大夫撒', 'dd', '都是对的', 'ds  ', null, '11', null, '', 'N', 'd', 'd', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('23', 'dfs', '321@qq.com', 'ddfsf', 'fsdfsd', null, '11', null, '', 'N', '111', '11', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('24', 'ad', '11@111.com', '11', '5591fc48b58ca98137a13c7747f9083f', 'PLATEFORM', '111', null, '', 'N', '11', '11', 'a1823fea0a27fdf0f12f851086660bc07ffffeadd6cc42696e01146d672cf569', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('36', '231', 'fdfd@qq.com', '213', '213', null, '11', null, '', 'N', '231', '213', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('37', '1', 'fdfd@qq.com', '1', '213', null, '1', null, '', 'N', '231', '23', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('38', '231', 'fdfd@qq.com', '231', '1231', null, '111', null, '', 'N', '213', '2312', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('39', '321', 'fdfd@qq.com', '213', '213', null, '1', null, '', 'N', '213', '213', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('41', '1', '2@qq.com', '1', '11', null, '34', null, '', 'N', '1', '1', null, '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('49', 'cheng', '22@qq.com', 'cheng', 'e359488a2d25227041b8697a938222f8', 'TNLY', '11', null, '', 'N', '11', '11', '8c5e5bd07c9a377e31ba7bb37278f7507ffffeae2dc2cf4b019d38359f62f6f0', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('50', 'hh', '11@qq.com', 'hh', '845a0d26a38883f554dc00f04fdab2da', 'TNLY', '1', null, '', 'N', '1', '1', 'ee79d9823ad92382f47f6129d62f0be87ffffeae2dc612345450d8a6e6abc1fb', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('51', 'ch', '11@qq.com', 'ch', 'caf926df2f0a2e702fe56977d2a44950', 'TNLY', '11', null, '', 'N', '11', '11', '1572b127d43e5a690a838340d9f15db77ffffeae2dd0355b23fe150d52dfafc3', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('60', 'root', 'fdas@fs.fdssfd', 'fdsf', '51a312dec6ba4576fb45a7fa896b16b3', 'TNLY', '111', null, '', 'N', '7654324567', '24567890', '588a39033fb4ab3ae346807ea3edc5617ffffeadd553df537a69c0285a3ee490', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('61', '11', '11@qq.com', '11', 'e8fe7c67c679a41c473d98728c796722', 'TNLY', '111', null, '', 'N', '11', '11', '3c857c7177a2acec02b5ba0925605cbd7ffffeadd6cac1bb47b1064500739001', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('62', 'wwww', 'pp@pp.pp', 'dfsfd', 'f13cf02ff42878bf7af5e9d659869160', 'PLATEFORM', '11', null, '', 'N', '12232314', '321323', '8929f0f93abf92957458cc05e474afde7ffffeadd628453c2d4b19ca06befc7b', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('63', 'asfd', 'fds@dsd.fddf', 'fdsfd', '0aed8b3b765c6ca539b481b2706f7331', 'TNLY', '11', null, '', 'N', '3424234', '34214', 'd01d7748de5999f3ca253212a12e28827ffffeadda17a7254b34d48451ea1c7c', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('64', 'baitong', 'baitong@qq.com', 'baitong', '5aa48903942a4c0bbf1220f0892772e6', 'PLATEFORM', '11', null, '', 'N', '223144', '5432424', 'aa60ef7f5dcb833deefc8b06d904f3a27ffffeaddb9ef001147c4f8e099ed0bc', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('65', 'safdf', 'baitoffng@qq.com', 'dfsafasfd', '881fdf461d7a78e747e322826d8e4f4e', 'TNLY', '11', null, '', 'N', '2133', '454', '55b8ac0bf2f0a8a6f8375c213095fcb37ffffeaddb31c1096979322d34854da1', '', '0000-00-00 00:00:00');
INSERT INTO `ts_platform` VALUES ('66', 'chenghuan', '746848281@qq.com', 'chenghuan', 'b295f938b6582e2f35db6938336d1c67', 'PLATEFORM', '11', null, '', 'N', '11', '111', '9dc862f370cda90534cd1b7073ca29a27ffffead519de91a05a32b82483fcb5f', 'LrL4g8GeS0MzETtbXPo6', '2016-01-31 13:58:42');
INSERT INTO `ts_platform` VALUES ('67', 'easy', '123@qq.com', 'easy', 'a1ce546082cf2ffe3230a767ab698bca', '测试', '11', null, '', 'N', '123', '456', 'd0dff682d5cf98021fe6ec3ba8c9d4fb7ffffead67a6793c6d9980443c5e726b', null, null);
INSERT INTO `ts_platform` VALUES ('68', 'easy1', '2131@qq.com', 'easy1', '1ddcae711db1b2212f1c951871fdf16d', 'shanji', 'we', null, '', 'N', '123131', '1231321', '2c871c0c1df71ad4d676e46ef8b1741f7ffffead67ee85da1b6046b507ee1670', null, null);

-- ----------------------------
-- Table structure for ts_role
-- ----------------------------
DROP TABLE IF EXISTS `ts_role`;
CREATE TABLE `ts_role` (
  `role_code` varchar(20) NOT NULL COMMENT '角色代码',
  `role_name_en` varchar(50) DEFAULT NULL COMMENT '角色名称英语',
  `role_name_fr` varchar(50) DEFAULT NULL COMMENT '角色名称法语',
  `role_level` varchar(10) DEFAULT NULL COMMENT '管理级别(0000)第一位1表示超级管理员级别/第二位1表示总部管理级别/第三位1表示区域管理级别/第四位1表示供应商操作级别',
  `role_notes` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` varchar(1) DEFAULT NULL COMMENT '状态(N:正常,S:停用)',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `pass_loginname` varchar(30) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`role_code`),
  KEY `idx_role_name` (`role_name_en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ts_role
-- ----------------------------
INSERT INTO `ts_role` VALUES ('1', 'hgf', 'jhgfee', '0100', 'hgfddd', 'N', '2016-01-31 15:05:40', 'root');
INSERT INTO `ts_role` VALUES ('11', 'hgfds', 'hgfd', '0100', 'hgfdsd', 'N', '2015-12-17 16:09:20', 'test');
INSERT INTO `ts_role` VALUES ('111', 'WEsdf', 'sd', '1100', 'ss', 'S', '2015-12-15 11:51:25', 'test');
INSERT INTO `ts_role` VALUES ('1q', 'qqq', '33', '0001', '1', 'N', '2015-12-24 23:15:29', 'root');
INSERT INTO `ts_role` VALUES ('23', '3', '3', '0100', '2', 'N', '2015-12-23 13:03:03', 'test');
INSERT INTO `ts_role` VALUES ('34', '34', '34', '0100', '34', 'N', '2015-12-23 11:37:28', 'test');
INSERT INTO `ts_role` VALUES ('4', '44', '444', '0001', '4', 'N', '2015-12-23 13:05:05', 'test');
INSERT INTO `ts_role` VALUES ('4556', '5654', '5645', '0101', '5645', 'N', '2015-12-09 16:55:09', 'test');
INSERT INTO `ts_role` VALUES ('ADMIN', 'administrator', 'administrateurs', '1100', '超级管理员', 'N', '2015-12-23 11:43:23', 'test');
INSERT INTO `ts_role` VALUES ('asd', 'das', 'as', '0001', 'daSD', 'N', '2015-12-15 11:52:02', 'test');
INSERT INTO `ts_role` VALUES ('asdafwe', 'qer', '00', '0100', 'ert', 'N', '2015-12-23 11:46:26', 'test');
INSERT INTO `ts_role` VALUES ('dfdf', '3434', '3434', '1001', '343', 'S', '2015-12-09 16:46:51', 'test');
INSERT INTO `ts_role` VALUES ('dfg', 'dfg', 'dfg', '0100', 'er', 'N', '2015-12-24 23:15:21', 'root');
INSERT INTO `ts_role` VALUES ('ds', 'sd', 'sd', '0100', 's', 'N', '2015-12-10 09:43:35', 'test');
INSERT INTO `ts_role` VALUES ('ert', 'wert', 'wert', '0001', 'wer', 'N', '2015-12-21 10:35:02', 'test');
INSERT INTO `ts_role` VALUES ('ertwer', 'ert', 'ert', '1101', 'wer', 'N', '2016-01-30 15:24:00', 'root');
INSERT INTO `ts_role` VALUES ('etser', 'sdaf', 'werw', '0100', 'sdf', 'N', '2015-12-21 10:34:24', 'test');
INSERT INTO `ts_role` VALUES ('ewr', 'dsg', 'qw', '0100', 'dsg', 'N', '2015-12-15 11:59:40', 'test');
INSERT INTO `ts_role` VALUES ('fg', 'fg', 'fg', '1000', 'fg', 'N', '2015-12-09 16:29:07', 'test');
INSERT INTO `ts_role` VALUES ('ghhhf', 'gg', 'g', '0100', 'gg', 'N', '2015-12-21 17:50:43', 'test');
INSERT INTO `ts_role` VALUES ('nmbvc', 'mnbvcx', 'nbvc', '0001', 'cnbvcx', 'N', '2015-12-15 12:03:13', 'test');
INSERT INTO `ts_role` VALUES ('qq', 'qq', 'qq', '0001', '', 'N', '2015-12-23 11:38:19', 'test');
INSERT INTO `ts_role` VALUES ('qqq', 'qqq', 'qqq', '0001', 'q', 'N', '2015-12-23 11:38:55', 'test');
INSERT INTO `ts_role` VALUES ('qwer', 'rew', 'ty', '0100', 'ert', 'N', '2015-12-21 10:34:47', 'test');
INSERT INTO `ts_role` VALUES ('rt', 'er', 'r', '0100', 'w', 'N', '2015-12-21 10:35:22', 'test');
INSERT INTO `ts_role` VALUES ('rtyu', 'wer', 'wert', '0100', 'wer', 'N', '2015-12-21 10:34:55', 'test');
INSERT INTO `ts_role` VALUES ('sd', 'ds', 'sd', '0100', 'ds', 'N', '2015-12-10 09:43:46', 'test');
INSERT INTO `ts_role` VALUES ('sdf', 'asdf', 'asdg', '0100', 'sadf', 'S', '2015-12-09 16:29:26', 'test');
INSERT INTO `ts_role` VALUES ('sfa', 'adsf', 'adsf', '0100', 'sdaf', 'N', '2015-12-21 10:34:31', 'test');
INSERT INTO `ts_role` VALUES ('SUPPLIER ADMIN', 'supplier administrator', 'Les fournisseurs de', '0001', '供应商管理员', 'N', '2015-11-28 14:28:13', 'test');
INSERT INTO `ts_role` VALUES ('test', '55', 't', '1000', 't', 'N', '2015-12-01 18:23:37', 'test');
INSERT INTO `ts_role` VALUES ('test1', 'test', 'test', '1000', 'test', 'S', '2015-12-01 18:21:00', 'test');
INSERT INTO `ts_role` VALUES ('test2', 'e', 'e', '0101', 'eeee', 'N', '2015-12-09 16:28:23', 'test');
INSERT INTO `ts_role` VALUES ('we', 'we', 'we', '0001', 'we', 'N', '2015-12-10 09:43:01', 'test');
INSERT INTO `ts_role` VALUES ('zhf', 'easyblue', 'easyblue', '1101', 'abc', 'N', '2016-01-11 09:38:51', 'root');

-- ----------------------------
-- Table structure for ts_rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `ts_rolemenu`;
CREATE TABLE `ts_rolemenu` (
  `role_code` varchar(20) NOT NULL DEFAULT '' COMMENT '角色代码',
  `menu_code` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单代码',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `pass_loginname` varchar(30) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`role_code`,`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of ts_rolemenu
-- ----------------------------
INSERT INTO `ts_rolemenu` VALUES ('1', 'B002-001_115', '2016-01-19 11:33:17', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1', 'B002-001_117', '2016-01-19 11:33:17', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1', 'B002-001_120', '2016-01-19 11:33:17', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1', 'B002-001_125', '2016-01-19 11:33:17', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1', 'B002-001_129', '2016-01-19 11:33:17', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1', 'B002-001_135', '2016-01-19 11:33:17', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1', 'B002-001_136', '2016-01-19 11:33:17', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1', 'B002-001_139', '2016-01-19 11:33:17', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1', 'B002-001_140', '2016-01-19 11:33:17', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B002-001_117', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B002-001_120', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B002-001_129', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B002-001_135', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B002-001_136', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B002-001_139', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B002-001_140', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B002-001_144', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B002-001_2', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-001-001', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-001-002', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-001_1', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-001_11', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-001_110', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-001_137', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-001_155', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-002_1', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-002_116', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-002_14', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-002_148', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-002_152', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-002_5', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-002_6', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-003_121', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-003_40', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-003_48', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('11', 'B004-004_1', '2016-02-03 21:13:33', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1q', 'B002-001_144', '2016-01-11 13:24:06', 'root');
INSERT INTO `ts_rolemenu` VALUES ('1q', 'B004-001-001', '2016-01-11 13:24:06', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B002-001_117', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B002-001_120', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B002-001_129', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B002-001_135', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B002-001_136', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B002-001_139', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B002-001_140', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B002-001_144', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B002-001_2', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-001-001', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-001-002', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-001_1', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-001_110', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-001_155', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-002_1', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-002_116', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-002_14', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-002_148', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-002_152', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-002_5', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-002_6', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-003_121', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-003_40', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-003_48', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ADMIN', 'B004-004_1', '2016-02-03 21:13:07', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B002-001_117', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B002-001_120', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B002-001_129', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B002-001_135', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B002-001_136', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B002-001_139', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B002-001_140', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B002-001_144', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-001-001', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-001-002', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-001_1', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-001_11', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-001_110', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-001_137', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-001_155', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-002_1', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-002_116', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-002_14', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-002_148', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-002_152', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-002_5', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-002_6', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-003_121', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-003_40', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('asd', 'B004-003_48', '2016-02-03 21:13:24', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_115', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_117', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_120', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_125', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_129', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_135', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_136', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_139', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_140', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B002-001_144', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001-001', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001-002', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001_1', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001_10', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001_11', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001_110', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001_123', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001_137', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001_19', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001_7', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-001_9', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-002_1', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-002_116', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-002_14', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-002_142', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-002_148', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-002_151', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-002_5', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-002_6', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-003_121', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-003_36', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-003_40', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ert', 'B004-003_48', '2016-01-18 19:32:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_115', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_117', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_120', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_125', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_129', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_135', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_136', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_139', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_140', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B002-001_144', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001-001', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001-002', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001_1', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001_10', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001_11', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001_110', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001_123', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001_137', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001_19', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001_7', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-001_9', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-002_1', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-002_116', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-002_14', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-002_142', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-002_148', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-002_151', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-002_5', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-002_6', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-003_121', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-003_36', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-003_40', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('etser', 'B004-003_48', '2016-01-18 19:32:54', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_115', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_117', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_120', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_125', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_129', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_135', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_136', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_139', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_140', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B002-001_144', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001-001', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001-002', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001_1', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001_10', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001_11', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001_110', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001_123', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001_137', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001_19', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001_7', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-001_9', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-002_1', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-002_116', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-002_14', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-002_142', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-002_148', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-002_151', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-002_5', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-002_6', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-003_121', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-003_36', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-003_40', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ewr', 'B004-003_48', '2016-01-18 19:33:11', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ghhhf', 'B002-001_115', '2016-01-14 11:49:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('ghhhf', 'B002-001_117', '2016-01-14 11:49:27', 'root');
INSERT INTO `ts_rolemenu` VALUES ('SUPPLIER ADMIN', 'B002-001-001', '2015-11-16 18:34:28', 'system');
INSERT INTO `ts_rolemenu` VALUES ('test2', 'B004-001-001', '2016-02-04 10:06:26', 'root');
INSERT INTO `ts_rolemenu` VALUES ('test2', 'B004-002_1', '2016-02-04 10:06:26', 'root');
INSERT INTO `ts_rolemenu` VALUES ('test2', 'B004-002_14', '2016-02-04 10:06:26', 'root');
INSERT INTO `ts_rolemenu` VALUES ('test2', 'B004-002_5', '2016-02-04 10:06:26', 'root');
INSERT INTO `ts_rolemenu` VALUES ('test2', 'B004-002_6', '2016-02-04 10:06:26', 'root');
INSERT INTO `ts_rolemenu` VALUES ('we', 'B004-002_148', '2016-02-04 16:56:20', 'root');
INSERT INTO `ts_rolemenu` VALUES ('we', 'B004-002_152', '2016-02-04 16:56:20', 'root');
INSERT INTO `ts_rolemenu` VALUES ('we', 'B004-002_5', '2016-02-04 16:56:20', 'root');
INSERT INTO `ts_rolemenu` VALUES ('we', 'B004-003_48', '2016-02-04 16:56:20', 'root');

-- ----------------------------
-- Table structure for ts_supplier
-- ----------------------------
DROP TABLE IF EXISTS `ts_supplier`;
CREATE TABLE `ts_supplier` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `dept_code` varchar(20) DEFAULT NULL COMMENT '供应商编码(部门代码)',
  `sup_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `sup_address` varchar(100) DEFAULT NULL COMMENT '供应商地址',
  `sup_tel` varchar(20) DEFAULT NULL COMMENT '供应商电话',
  `sup_tel2` varchar(20) DEFAULT NULL COMMENT '供应商电话2',
  `sup_legal` varchar(20) DEFAULT NULL COMMENT '法人',
  `sup_desc` varchar(500) DEFAULT NULL COMMENT '供应商描述',
  `sup_license` varchar(50) DEFAULT NULL COMMENT '许可证',
  `sup_contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `sup_email` varchar(30) DEFAULT NULL COMMENT 'email',
  `sup_website` varchar(50) DEFAULT NULL COMMENT '网址',
  `sup_status` varchar(1) DEFAULT NULL COMMENT '状态(N:正常,W:等待确认，S:暂停,R:审批驳回)',
  `sup_s_remark` varchar(200) DEFAULT NULL COMMENT '暂停备注',
  `sup_r_reason` varchar(500) DEFAULT NULL COMMENT '驳回原因',
  `sup_regtime` datetime DEFAULT NULL COMMENT '注册时间',
  `approver` varchar(30) DEFAULT NULL COMMENT '审批人',
  `sup_approvetime` datetime DEFAULT NULL COMMENT '审批时间',
  PRIMARY KEY (`sup_id`),
  KEY `idx_dept_code` (`dept_code`),
  KEY `idx_sup_name` (`sup_name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='供应商表';

-- ----------------------------
-- Records of ts_supplier
-- ----------------------------
INSERT INTO `ts_supplier` VALUES ('1', 'TNLY', '途牛旅游', '中央路188号', '13233333333', '13756565656', '赵途牛', '途牛就是好哇', null, '赵小牛', '904611647@qq.com', 'http://www.tuniu.com', 'N', null, null, '2015-11-16 18:34:28', 'root', '2016-02-01 10:39:20');
INSERT INTO `ts_supplier` VALUES ('2', '22', 'sfd', 'dsf', '231', '1223', 'fds', 'dfs', 'fd', 'dsf', 'sdf@dd.com', 'fds', 'R', 'dfs', 'eee', '2015-12-01 15:30:01', 'root', '2016-01-31 16:40:57');
INSERT INTO `ts_supplier` VALUES ('3', 'fd', 'sdf', 'fds', 'fds', 'fsd', 'sdf', 'fds', 'fds', 'sdf', 'fds', 'sfs', 'R', 'fds', '看了记录', '2015-12-01 16:19:59', 'root', '2016-01-08 10:15:16');
INSERT INTO `ts_supplier` VALUES ('33', '33', '33', '33', '33', '33', '33', '33', '33', '33', '33', '33', 'N', '33', '33', '2016-01-21 10:38:56', '33', '2016-01-14 10:39:02');
INSERT INTO `ts_supplier` VALUES ('44', '44', '44', '44', '44', '44', '44', '44', '44', '44', '44', '44', 'R', '44', 'sdfsdf ', '2016-01-14 10:40:03', 'root', '2016-02-01 10:40:33');
INSERT INTO `ts_supplier` VALUES ('45', '12', '12', null, '123', '13', '123', null, null, null, null, null, 'n', null, null, '2000-01-23 00:00:00', '123', '2000-01-23 00:00:00');
INSERT INTO `ts_supplier` VALUES ('46', '234', 'ccccccccccccc', null, '1111111', '12324', 'W234', null, null, null, null, null, 'W', null, null, '2016-02-16 00:00:00', '23EWF', '2016-02-20 00:00:00');
INSERT INTO `ts_supplier` VALUES ('47', 'ccc', 'vvvvvv', null, '4444444444', '3333333', 'cccccc', null, null, null, null, null, 'W', null, null, null, null, null);
INSERT INTO `ts_supplier` VALUES ('48', 'zzzz', 'zzzzzz', null, '3333333', '11111111111', 'zzzz', null, null, null, null, null, 'W', null, null, '2016-02-03 18:01:18', null, null);
INSERT INTO `ts_supplier` VALUES ('49', 'zzzz', 'zzzz', '', '12313', '12312', 'zzzz', 'zzzzzz', '', null, 'wewf', '', 'W', null, null, '2016-02-03 21:04:10', null, null);

-- ----------------------------
-- Table structure for ts_systemconfig
-- ----------------------------
DROP TABLE IF EXISTS `ts_systemconfig`;
CREATE TABLE `ts_systemconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(50) NOT NULL,
  `name_fr` varchar(50) NOT NULL,
  `value_en` varchar(50) NOT NULL,
  `value_fr` varchar(50) NOT NULL,
  `operatetime` datetime NOT NULL,
  `operator` varchar(30) NOT NULL,
  `group_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_systemconfig
-- ----------------------------
INSERT INTO `ts_systemconfig` VALUES ('59', 'tel', 'tel', '1855-695-7770', '1855-695-7770', '2016-01-31 18:12:20', 'root', 'tel');
INSERT INTO `ts_systemconfig` VALUES ('63', 'email', 'email', 'info@bchina.com', 'info@bchina.com', '2016-01-31 18:16:48', 'root', 'email');

-- ----------------------------
-- Table structure for ts_user
-- ----------------------------
DROP TABLE IF EXISTS `ts_user`;
CREATE TABLE `ts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别(F:女 M：男)',
  `passport` varchar(9) DEFAULT NULL COMMENT '护照号',
  `status` varchar(1) DEFAULT 'N' COMMENT '状态(N:正常,S:停用)',
  `locktime` datetime DEFAULT NULL COMMENT '冻结时间',
  `lockreson` varchar(200) DEFAULT NULL COMMENT '冻结原因',
  `regtime` datetime DEFAULT NULL COMMENT '注册时间',
  `point` int(11) DEFAULT NULL COMMENT '总积分',
  `usablepoint` int(11) DEFAULT NULL COMMENT '可用积分',
  `type` varchar(1) DEFAULT NULL COMMENT '用户类型(A:代理商,N:普通用户)',
  `facebookname` varchar(30) DEFAULT NULL COMMENT 'facebook账号',
  `facebookpwd` varchar(20) DEFAULT NULL COMMENT 'facebook密码',
  `ip` varchar(50) DEFAULT NULL COMMENT '最后登录ip',
  `authcode` varchar(50) DEFAULT NULL COMMENT '随机码',
  `operatetime` datetime DEFAULT NULL,
  `psw` varchar(200) NOT NULL COMMENT '加密盐',
  PRIMARY KEY (`id`),
  KEY `idx_user_email` (`email`),
  KEY `idx_user_password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ts_user
-- ----------------------------
INSERT INTO `ts_user` VALUES ('1', null, null, '', '6b91b1424dadb1f4c579fd60d01bacbc', null, null, 'N', null, null, '2017-03-08 17:16:07', null, null, 'N', null, null, null, null, null, '15ad13ffbfb1c67b288a6b3c5d23e3097ffffea56d9c539e7bcc5b0d30d6ec8a');
INSERT INTO `ts_user` VALUES ('16', null, null, '', 'a4388f1041a9928ac153c118f6b01eb8', null, null, 'N', null, null, '2017-03-08 17:24:26', null, null, 'N', null, null, null, null, null, '6fd9f69b3c070bcdec825c9593c680f07ffffea56d93cf58684778c2d26876a6');
INSERT INTO `ts_user` VALUES ('17', null, null, '', 'c6604b96d425444ced73c1f3e81400e8', null, null, 'N', null, null, '2017-03-08 17:34:49', null, null, 'N', null, null, null, null, null, 'cfa31a67b50c84328036d1fc9d964ff47ffffea56ded727950ea40897b262157');
INSERT INTO `ts_user` VALUES ('18', null, null, '', '80abf74d52ac608f99b6e23e2e121ef3', null, null, 'N', null, null, '2017-03-08 17:34:53', null, null, 'N', null, null, null, null, null, 'c093c2976b71d2ff61a7c82436062e217ffffea56ded7f9b333ae646f0e84a14');
INSERT INTO `ts_user` VALUES ('19', null, null, '', 'a6e16f84486248144a949d847e76f2e1', null, null, 'N', null, null, '2017-03-08 17:34:52', null, null, 'N', null, null, null, null, null, '8a58da3a8f9baae054aedd418f23621e7ffffea56ded7e0a5da04d3e94ff963a');
INSERT INTO `ts_user` VALUES ('20', null, null, '', 'fcb167375a7d596d2d76d563845485f7', null, null, 'N', null, null, '2017-03-08 17:36:26', null, null, 'N', null, null, null, null, null, '4474e1c971ea99e204bda3cb03698eb87ffffea56deec9cf1461a488cd59c788');
INSERT INTO `ts_user` VALUES ('21', null, null, '', '5c3c0a1b365b98362e1a200562d38a0b', null, null, 'N', null, null, '2017-03-08 17:42:05', null, null, 'N', null, null, null, null, null, '11bf3443f560a723255f3dbd0622cd727ffffea56de4186d3d25c517cc60b018');
INSERT INTO `ts_user` VALUES ('22', null, null, '', '9211b01abc7771bac5fa5764a45bd53e', null, null, 'N', null, null, '2017-03-08 17:42:28', null, null, 'N', null, null, null, null, null, '85e1b3a60d1284bf49c42070e5fff77b7ffffea56de4705b72eca7e9a95d0848');

-- ----------------------------
-- Table structure for ts_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `ts_userinfo`;
CREATE TABLE `ts_userinfo` (
  `user_id` int(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `sex` varchar(64) DEFAULT NULL,
  `nationality` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `passport` varchar(64) DEFAULT NULL,
  `tel` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ts_userinfo
-- ----------------------------
INSERT INTO `ts_userinfo` VALUES ('1', 'pp', null, null, '', null, null, null, null, null);
INSERT INTO `ts_userinfo` VALUES ('1', 'yy', null, null, '', null, null, null, null, null);
INSERT INTO `ts_userinfo` VALUES ('1', 'yy', null, null, '', null, null, null, null, null);
INSERT INTO `ts_userinfo` VALUES ('1', 'yy', null, null, '', null, null, null, null, null);
INSERT INTO `ts_userinfo` VALUES ('1', 'yy', null, null, '', null, null, null, null, null);
INSERT INTO `ts_userinfo` VALUES ('1', '11', null, null, '', null, null, null, null, null);
INSERT INTO `ts_userinfo` VALUES ('1', 'pp', null, null, '', null, null, null, null, null);
INSERT INTO `ts_userinfo` VALUES ('1', 'pp', null, null, '', null, null, null, null, null);

-- ----------------------------
-- Procedure structure for pxproc
-- ----------------------------
DROP PROCEDURE IF EXISTS `pxproc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pxproc`(OUT param1 INT)
BEGIN
SELECT COUNT(1) FROM beautiful.ts_user;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `currval`(seq_name VARCHAR(50)) RETURNS int(11)
BEGIN
DECLARE VALUE INTEGER;
SET VALUE=0;
SELECT current_value INTO VALUE
FROM sys_sequence 
WHERE NAME=seq_name;
RETURN VALUE;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `nextval`(seq_name varchar(50)) RETURNS int(11)
BEGIN
UPDATE sys_sequence
SET CURRENT_VALUE = CURRENT_VALUE + INCREMENT
where name=seq_name;
return currval(seq_name);
END
;;
DELIMITER ;
