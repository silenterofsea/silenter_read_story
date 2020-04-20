/*
Navicat MySQL Data Transfer

Source Server         : 39.109.115.31
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : bayeqd

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-03-27 08:45:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mirrormx_customer_chat_data
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_data`;
CREATE TABLE `mirrormx_customer_chat_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `data_type_ix` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mirrormx_customer_chat_data
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_data` VALUES ('1', 'canned_message', '你好呀', '你好!');
INSERT INTO `mirrormx_customer_chat_data` VALUES ('2', 'canned_message', '11', '11111111111111111');

-- ----------------------------
-- Table structure for mirrormx_customer_chat_department
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_department`;
CREATE TABLE `mirrormx_customer_chat_department` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mirrormx_customer_chat_department
-- ----------------------------

-- ----------------------------
-- Table structure for mirrormx_customer_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_message`;
CREATE TABLE `mirrormx_customer_chat_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `talk_id` int(10) unsigned NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_fk_talk` (`talk_id`) USING BTREE,
  KEY `message_from_id_ix` (`from_id`) USING BTREE,
  KEY `message_to_id_ix` (`to_id`) USING BTREE,
  KEY `message_datetime_ix` (`datetime`) USING BTREE,
  CONSTRAINT `message_fk_talk` FOREIGN KEY (`talk_id`) REFERENCES `mirrormx_customer_chat_talk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mirrormx_customer_chat_message
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_message` VALUES ('1', '2', '-1', '你好呀', '2019-12-13 07:35:26', '1', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('2', '2', '-1', '*-D', '2019-12-13 07:35:33', '1', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('3', '1', '-1', '你好!', '2019-12-13 07:36:02', '1', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('4', '2', '-1', '你说你 马呢', '2019-12-13 07:49:32', '1', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('5', '1', '2', '1', '2019-12-13 07:49:54', '2', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('6', '2', '-1', '1', '2019-12-13 07:50:22', '1', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('7', '3', '-1', 'pa', '2019-12-13 07:50:52', '3', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('8', '1', '-1', '你说你                    .-\' _..`.                   /  .\'_.\'.\'                  | .\' (.)`.                  ;\'   ,_   `.  .--.__________.\'    ;  `.;-\' |  ./               / |  |               /  `..\'`-._  _____, ..\'      / | |     | |\\ \\     / /| |     | | \\ \\    / / | |     | |  \\ \\   /_/  |_|     |_|   \\_\\  |__\\  |__\\    |__\\  |__\\呢', '2019-12-13 07:51:02', '3', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('9', '2', '-1', '不说话了吗栽种', '2019-12-13 07:51:59', '1', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('10', '1', '3', '1111', '2019-12-13 07:52:24', '4', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('11', '3', '-1', 'sb', '2019-12-13 07:53:04', '3', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('12', '1', '-1', '崽种', '2019-12-13 07:53:19', '3', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('13', '4', '-1', '123', '2019-12-13 08:06:07', '5', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('14', '1', '-1', '????', '2019-12-13 08:07:49', '5', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('15', '4', '-1', '测试测试', '2019-12-13 08:08:18', '5', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('16', '3', '-1', '爬', '2019-12-13 08:10:14', '3', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('17', '3', '-1', '？？？', '2019-12-13 08:10:34', '3', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('18', '5', '-1', '？？', '2019-12-13 08:10:52', '6', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('19', '1', '-1', '你好菜啊', '2019-12-13 08:11:06', '6', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('20', '5', '-1', '不要在这里逼逼赖赖', '2019-12-13 08:11:21', '6', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('21', '1', '-1', '你这个不够圆润啊', '2019-12-13 08:11:44', '6', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('22', '6', '-1', ':(', '2019-12-13 08:14:04', '7', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('23', '1', '-1', '给你马来一拳', '2019-12-13 08:14:20', '7', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('24', '1', '-1', ' :) ', '2019-12-13 08:16:09', '7', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('25', '1', '-1', '你的(￣。。￣)呢', '2019-12-13 08:17:14', '7', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('26', '6', '-1', ':D', '2019-12-13 08:17:47', '7', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('27', '1', '6', '1', '2019-12-13 08:18:49', '9', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('28', '1', '6', '1', '2019-12-13 08:18:58', '10', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('29', '7', '-1', '嗯？', '2019-12-13 08:19:16', '8', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('30', '1', '-1', '我的马不见了', '2019-12-13 08:19:43', '8', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('31', '7', '-1', '行吧', '2019-12-13 08:19:55', '8', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('32', '6', '-1', ':^^', '2019-12-13 08:20:26', '7', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('33', '1', '-1', '给你马来一拳', '2019-12-13 08:20:36', '7', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('34', '6', '-1', '=)', '2019-12-13 08:20:41', '7', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('35', '6', '-1', '&gt;:D', '2019-12-13 08:20:51', '7', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('36', '8', '-1', '&lt;style&gt;*{color:red}&lt;/style&gt;', '2019-12-13 08:31:03', '11', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('37', '9', '-1', '你好 怎么充值', '2019-12-14 05:44:20', '12', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('38', '1', '-1', '点击充值然后需要充值的金额充值即可', '2019-12-14 05:45:17', '12', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('39', '9', '-1', '你好', '2019-12-14 05:47:33', '12', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('40', '9', '-1', '谢谢', '2019-12-14 05:50:17', '12', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('41', '10', '-1', ':)', '2019-12-14 05:54:08', '13', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('42', '10', '-1', '您好怎么充值', '2019-12-14 05:54:15', '13', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('43', '1', '-1', '点击钱包，输入充值金额然后进行充值即可', '2019-12-14 05:56:31', '13', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('44', '12', '-1', 'nin hao', '2019-12-16 06:19:05', '15', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('45', '13', '-1', '哈喽哈喽', '2019-12-16 06:19:13', '16', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('46', '1', '-1', '哈喽', '2019-12-16 06:20:07', '16', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('47', '14', '-1', '您好，请问怎么充值', '2019-12-16 06:20:24', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('48', '1', '-1', '嗯嗯', '2019-12-16 06:21:29', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('49', '14', '-1', '谢谢', '2019-12-16 06:21:43', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('50', '14', '-1', '我明白了', '2019-12-16 06:21:46', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('51', '1', '-1', '对接这个上去', '2019-12-16 06:25:17', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('52', '1', '-1', '需要多长时间', '2019-12-16 06:25:22', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('53', '1', '-1', '我来算下时间', '2019-12-16 06:25:24', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('54', '14', '-1', '1', '2019-12-16 06:26:51', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('55', '1', '-1', '怎么不显示刚登录进来对话 那句您好有什么可以帮到您', '2019-12-16 06:27:31', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('56', '1', '-1', '这个在哪里设置', '2019-12-16 06:27:43', '17', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('57', '15', '-1', '11', '2019-12-16 07:44:59', '18', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('58', '16', '-1', ';-D', '2019-12-17 02:14:48', '19', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('59', '1', '-1', '你好', '2019-12-17 03:09:54', '19', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('60', '17', '-1', 'ni hao', '2019-12-18 03:37:39', '20', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('61', '1', '-1', '您好', '2019-12-18 03:37:54', '20', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('62', '17', '-1', '89076047ly1g3rrhjf0jij20u01907a2.jpg', '2019-12-18 03:38:11', '20', '{\"type\":\"files\",\"files\":[{\"name\":\"89076047ly1g3rrhjf0jij20u01907a2.jpg\",\"size\":218354,\"type\":\"image\\/jpeg\"}]}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('63', '18', '-1', '你好', '2020-01-17 15:04:18', '21', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('64', '1', '-1', '222', '2020-01-17 15:04:52', '21', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('65', '1', '-1', '33', '2020-01-17 15:05:05', '21', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('66', '18', '-1', '你好呀', '2020-01-17 15:05:11', '21', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('67', '19', '-1', '你好呀', '2020-01-17 15:09:24', '22', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('68', '1', '-1', '可以呀', '2020-01-17 15:09:33', '21', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('69', '1', '-1', '仁恩', '2020-01-17 15:09:58', '21', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('70', '1', '-1', '人呢', '2020-01-17 15:10:04', '21', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('71', '19', '-1', ':|  :-D', '2020-01-17 15:10:26', '22', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('72', '1', '-1', '你好', '2020-01-17 15:10:37', '22', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('73', '1', '-1', '你谁啊', '2020-01-17 15:10:44', '22', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('74', '19', '-1', '1111', '2020-01-17 15:10:50', '22', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('75', '20', '-1', '', '2020-02-13 19:07:07', '23', '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('76', '1', '20', '你好', '2020-02-13 19:07:19', '23', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('77', '-2', '-1', '', '2020-02-13 19:07:19', '23', '{\"type\":\"talk_owner\",\"id\":1,\"user\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('82', '22', '-1', '', '2020-02-14 13:23:34', '24', '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('83', '22', '-1', '11', '2020-02-14 13:23:34', '24', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('84', '22', '-1', '忍呢', '2020-02-14 13:24:57', '24', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('85', '1', '-1', '11', '2020-02-14 13:25:02', '24', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('86', '-2', '-1', '', '2020-02-14 13:25:02', '24', '{\"type\":\"talk_owner\",\"id\":1,\"user\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('87', '22', '-1', '*-D', '2020-02-14 13:25:44', '24', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('88', '1', '-1', '11111111111111111', '2020-02-14 13:26:25', '24', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('93', '25', '-1', '', '2020-02-14 18:39:09', '25', '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('94', '25', '-1', '1', '2020-02-14 18:39:09', '25', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('95', '25', '-1', '2222', '2020-02-14 18:39:46', '25', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('96', '1', '-1', ' :D ', '2020-02-14 18:40:17', '25', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('97', '-2', '-1', '', '2020-02-14 18:40:17', '25', '{\"type\":\"talk_owner\",\"id\":1,\"user\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('98', '26', '-1', '', '2020-02-15 10:07:51', '26', '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('99', '26', '-1', '你好', '2020-02-15 10:07:51', '26', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('100', '1', '-1', '你好', '2020-02-15 10:08:56', '26', null);
INSERT INTO `mirrormx_customer_chat_message` VALUES ('101', '-2', '-1', '', '2020-02-15 10:08:56', '26', '{\"type\":\"talk_owner\",\"id\":1,\"user\":\"admin\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('102', '27', '-1', '', '2020-03-02 13:19:30', '27', '{\"type\":\"talk_start\"}');
INSERT INTO `mirrormx_customer_chat_message` VALUES ('103', '27', '-1', '1111', '2020-03-02 13:19:30', '27', null);

-- ----------------------------
-- Table structure for mirrormx_customer_chat_shared_file
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_shared_file`;
CREATE TABLE `mirrormx_customer_chat_shared_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_name` varchar(255) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `upload_id` int(10) unsigned NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shared_file_fk_upload` (`upload_id`) USING BTREE,
  CONSTRAINT `shared_file_fk_upload` FOREIGN KEY (`upload_id`) REFERENCES `mirrormx_customer_chat_upload` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mirrormx_customer_chat_shared_file
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_shared_file` VALUES ('1', '89076047ly1g3rrhjf0jij20u01907a2.jpg', 'S0tChbVzdH2aNfVmnuUnGqwb6Z8FYvI', 'image/jpeg', '218354', '1', '4ybpAg5ymjwKZ10tD9EoUv2UyZrNODs');

-- ----------------------------
-- Table structure for mirrormx_customer_chat_talk
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_talk`;
CREATE TABLE `mirrormx_customer_chat_talk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(32) DEFAULT NULL,
  `department_id` smallint(5) unsigned DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extra` text,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `talk_fk_department` (`department_id`) USING BTREE,
  KEY `talk_owner_ix` (`owner`) USING BTREE,
  KEY `talk_last_activity_ix` (`last_activity`) USING BTREE,
  CONSTRAINT `talk_fk_department` FOREIGN KEY (`department_id`) REFERENCES `mirrormx_customer_chat_department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mirrormx_customer_chat_talk
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('1', 'closed', null, '1', '2019-12-13 07:36:02', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('2', 'closed', null, '1', '2019-12-13 07:49:54', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('3', 'closed', null, '1', '2019-12-13 07:53:19', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('4', 'closed', null, '1', '2019-12-13 07:52:24', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('5', 'closed', null, '1', '2019-12-13 08:07:49', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('6', 'closed', null, '1', '2019-12-13 08:11:44', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('7', 'closed', null, '1', '2019-12-13 08:20:36', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('8', 'closed', null, '1', '2019-12-13 08:19:43', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('9', 'closed', null, '1', '2019-12-13 08:18:49', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('10', 'closed', null, '1', '2019-12-13 08:18:58', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('11', 'closed', null, null, '2019-12-13 08:31:03', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('12', 'closed', null, '1', '2019-12-14 05:45:17', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('13', 'closed', null, '1', '2019-12-14 05:56:31', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('14', 'closed', null, null, '2019-12-14 06:39:32', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('15', 'closed', null, null, '2019-12-16 06:19:05', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('16', 'closed', null, '1', '2019-12-16 06:20:07', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('17', 'closed', null, '1', '2019-12-16 06:27:43', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('18', 'closed', null, null, '2019-12-16 07:44:59', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('19', 'closed', null, '1', '2019-12-17 03:09:54', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('20', 'closed', null, '1', '2020-01-17 15:03:25', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('21', 'closed', null, '1', '2020-02-12 08:19:59', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('22', 'closed', null, '1', '2020-02-12 08:19:59', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('23', 'closed', null, '1', '2020-02-13 19:21:15', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('24', 'closed', null, '1', '2020-02-14 13:50:27', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('25', 'closed', null, '1', '2020-02-15 07:34:05', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('26', 'closed', null, '1', '2020-02-23 13:25:01', null);
INSERT INTO `mirrormx_customer_chat_talk` VALUES ('27', 'new', null, null, '2020-03-02 13:19:30', null);

-- ----------------------------
-- Table structure for mirrormx_customer_chat_upload
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_upload`;
CREATE TABLE `mirrormx_customer_chat_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `state` varchar(16) NOT NULL,
  `files_info` text,
  `size` int(10) unsigned DEFAULT NULL,
  `progress` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `upload_fk_message` (`message_id`) USING BTREE,
  CONSTRAINT `upload_fk_message` FOREIGN KEY (`message_id`) REFERENCES `mirrormx_customer_chat_message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mirrormx_customer_chat_upload
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_upload` VALUES ('1', '62', 'uploaded', '[{\"name\":\"89076047ly1g3rrhjf0jij20u01907a2.jpg\",\"type\":\"image\\/jpeg\",\"size\":218354}]', '218354', '218354');

-- ----------------------------
-- Table structure for mirrormx_customer_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_user`;
CREATE TABLE `mirrormx_customer_chat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `info` text,
  `roles` varchar(128) DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_mail_ix` (`mail`) USING BTREE,
  KEY `user_last_activity_ix` (`last_activity`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mirrormx_customer_chat_user
-- ----------------------------
INSERT INTO `mirrormx_customer_chat_user` VALUES ('1', 'admin', 'admin', 'e86e685ea0ff10e1ea942ba647e63fea2383fa0b', '/customlivechat/upload/avatars/iztxr0phbbm5JkIiCvgxxmOJYXwjmkHFTadlbCCmOYsxiaQVG6sethXsetLBOsgH.png', '{\"ip\":\"39.158.164.22\"}', 'ADMIN,OPERATOR', '2020-03-02 13:29:24');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('2', 'anonymous-1576222526', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.98.116.92\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 6.1) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"78.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-13 08:13:03');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('3', 'anonymous-1576223452', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.98.116.92\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit\\/604.1.38 (KHTML, like Gecko) Version\\/11.0 Mobile\\/15A372 Safari\\/604.1\",\"browserName\":\"safari\",\"browserVersion\":\"11.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '0000-00-00 00:00:00');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('4', 'anonymous-1576224367', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.66.255.73\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/index\\/my\\/index.html\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit\\/604.1.38 (KHTML, like Gecko) Version\\/11.0 Mobile\\/15A372 Safari\\/604.1\",\"browserName\":\"safari\",\"browserVersion\":\"11.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-13 11:13:20');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('5', 'anonymous-1576224652', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.98.116.92\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit\\/604.1.38 (KHTML, like Gecko) Version\\/11.0 Mobile\\/15A372 Safari\\/604.1\",\"browserName\":\"safari\",\"browserVersion\":\"11.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '0000-00-00 00:00:00');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('6', 'anonymous-1576224844', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.98.116.92\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/index\\/my\\/index.html\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit\\/604.1.38 (KHTML, like Gecko) Version\\/11.0 Mobile\\/15A372 Safari\\/604.1\",\"browserName\":\"safari\",\"browserVersion\":\"11.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-13 09:53:25');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('7', 'anonymous-1576225112', 'no@e.mail.provided', 'x', null, '{\"ip\":\"117.136.41.70\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (Linux; U; Android 9; zh-CN; MI 8 UD Build\\/PKQ1.180729.001) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/57.0.2987.108 Quark\\/3.6.2.122 Mobile Safari\\/537.36\",\"browserName\":\"android\",\"browserVersion\":\"mozilla\\/5.0 (linux; u; android 9; zh-cn; mi 8 ud build\\/pkq1.180729.001) applewebkit\\/537.36 (khtml, like gecko) version\\/4.0 chrome\\/57.0.2987.108 quark\\/3.6.2.122 mobile safari\\/537.36\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Shenzhen\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":22.5333,\"longitude\":114.1333,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-13 08:31:33');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('8', 'anonymous-1576225863', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.98.116.92\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit\\/604.1.38 (KHTML, like Gecko) Version\\/11.0 Mobile\\/15A372 Safari\\/604.1\",\"browserName\":\"safari\",\"browserVersion\":\"11.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-13 09:33:38');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('9', 'anonymous-1576302260', 'no@e.mail.provided', 'x', null, '{\"ip\":\"112.96.194.32\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 9; YAL-AL00 Build\\/HUAWEIYAL-AL00; wv) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/66.0.3359.126 MQQBrowser\\/6.2 TBS\\/45016 Mobile Safari\\/537.36 MMWEBID\\/3526 MicroMessenger\\/7.0.9.1560(0x27000935) Process\\/tools NetType\\/4G Language\\/zh_CN ABI\\/arm64\",\"browserName\":\"android\",\"browserVersion\":\"mozilla\\/5.0 (linux; android 9; yal-al00 build\\/huaweiyal-al00; wv) applewebkit\\/537.36 (khtml, like gecko) version\\/4.0 chrome\\/66.0.3359.126 mqqbrowser\\/6.2 tbs\\/45016 mobile safari\\/537.36 mmwebid\\/3526 micromessenger\\/7.0.9.1560(0x27000935) process\\/tools nettype\\/4g language\\/zh_cn abi\\/arm64\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-14 05:51:00');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('10', 'anonymous-1576302848', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.66.255.73\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.25 Mobile Safari\\/537.36\",\"browserName\":\"android\",\"browserVersion\":\"6.0\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-14 06:05:48');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('11', 'anonymous-1576305572', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.66.255.73\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.25 Mobile Safari\\/537.36\",\"browserName\":\"android\",\"browserVersion\":\"6.0\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-14 06:40:27');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('12', 'anonymous-1576477145', 'no@e.mail.provided', 'x', null, '{\"ip\":\"116.22.199.81\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-mobile\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.25 Mobile Safari\\/537.36\",\"browserName\":\"android\",\"browserVersion\":\"6.0\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-16 06:19:55');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('13', 'anonymous-1576477153', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.240.164.144\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/index\\/index\\/home.html\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 11_4_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/11.0 Mobile\\/15E148 Safari\\/604.1\",\"browserName\":\"safari\",\"browserVersion\":\"11.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"43\",\"regionName\":\"Hunan\",\"city\":\"Changsha\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":28.1792,\"longitude\":113.1136,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-16 06:20:00');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('14', 'anonymous-1576477223', 'no@e.mail.provided', 'x', null, '{\"ip\":\"116.22.199.81\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/index\\/index\\/home.html\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.25 Mobile Safari\\/537.36\",\"browserName\":\"android\",\"browserVersion\":\"6.0\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-16 08:06:17');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('15', 'anonymous-1576482299', 'no@e.mail.provided', 'x', null, '{\"ip\":\"116.22.199.81\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/index\\/index\\/home.html\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit\\/604.1.38 (KHTML, like Gecko) Version\\/11.0 Mobile\\/15A372 Safari\\/604.1\",\"browserName\":\"safari\",\"browserVersion\":\"11.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-16 08:06:20');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('16', 'anonymous-1576548887', 'no@e.mail.provided', 'x', null, '{\"ip\":\"117.136.32.52\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/index\\/rot_order\\/index.html\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 9; ALP-AL00 Build\\/HUAWEIALP-AL00; wv) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/66.0.3359.126 MQQBrowser\\/6.2 TBS\\/045016 Mobile Safari\\/537.36 2.0.5 CK 2.0\",\"browserName\":\"android\",\"browserVersion\":\"mozilla\\/5.0 (linux; android 9; alp-al00 build\\/huaweialp-al00; wv) applewebkit\\/537.36 (khtml, like gecko) version\\/4.0 chrome\\/66.0.3359.126 mqqbrowser\\/6.2 tbs\\/045016 mobile safari\\/537.36 2.0.5 ck 2.0\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-17 02:17:21');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('17', 'anonymous-1576640259', 'no@e.mail.provided', 'x', null, '{\"ip\":\"113.68.15.181\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/index\\/my\\/index.html\",\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.25 Mobile Safari\\/537.36\",\"browserName\":\"android\",\"browserVersion\":\"6.0\",\"os\":\"android\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2019-12-18 03:40:12');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('18', 'anonymous-1579273458', 'no@e.mail.provided', 'x', null, '{\"ip\":\"127.0.0.1\",\"referer\":\"http:\\/\\/qd.cn\\/customlivechat\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.117 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"79.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"62\",\"regionName\":\"Gansu\",\"city\":\"Lanzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":36.0564,\"longitude\":103.7922,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-01-17 16:06:36');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('19', 'anonymous-1579273764', 'no@e.mail.provided', 'x', null, '{\"ip\":\"127.0.0.1\",\"referer\":\"\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko\\/20100101 Firefox\\/72.0\",\"browserName\":\"firefox\",\"browserVersion\":\"72.0\",\"os\":\"windows\",\"engine\":\"gecko\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"62\",\"regionName\":\"Gansu\",\"city\":\"Lanzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":36.0564,\"longitude\":103.7922,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-01-17 16:02:45');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('20', 'visitor.31653-1581620826', 'no@e.mail.provided', 'x', '/customlivechat/img/avatar.png', '{\"ip\":\"112.37.145.225\",\"referer\":\"http:\\/\\/qd2.251zy.com\\/admin.html\",\"userAgent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.5 Safari\\/605.1.15\",\"browserName\":\"safari\",\"browserVersion\":\"13.0\",\"os\":\"macintosh\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"37\",\"regionName\":\"Shandong\",\"city\":\"Binzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":37.3667,\"longitude\":118.0167,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-02-13 19:09:16');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('21', 'anonymous-1581686413', 'no@e.mail.provided', 'x', null, '{\"ip\":\"117.136.105.176\",\"referer\":\"http:\\/\\/qd2.251zy.com\\/admin.html\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit\\/604.1.38 (KHTML, like Gecko) Version\\/11.0 Mobile\\/15A372 Safari\\/604.1 SE 2.X MetaSr 1.0\",\"browserName\":\"safari\",\"browserVersion\":\"11.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\"}', 'GUEST', '2020-02-14 13:20:24');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('22', 'anonymous-1581686614', 'no@e.mail.provided', 'x', null, '{\"ip\":\"117.136.105.176\",\"referer\":\"http:\\/\\/qd2.251zy.com\\/customlivechat\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/65.0.3314.0 Safari\\/537.36 SE 2.X MetaSr 1.0\",\"browserName\":\"chrome\",\"browserVersion\":\"65.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"city\":null,\"zipCode\":null,\"timeZone\":null,\"latitude\":34.7725,\"longitude\":113.7266,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-02-14 13:27:49');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('23', 'anonymous-1581697922', 'no@e.mail.provided', 'x', null, '{\"ip\":\"103.1.30.93\",\"referer\":\"\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 6.1) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"80.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"LA\",\"countryName\":\"Laos\",\"city\":null,\"zipCode\":null,\"timeZone\":\"Asia\\/Vientiane\",\"latitude\":18,\"longitude\":105,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-02-14 16:34:53');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('24', 'visitor.89134-1581698043', 'no@e.mail.provided', 'x', '/customlivechat/img/avatar.png', '{\"ip\":\"125.74.249.176\",\"referer\":\"http:\\/\\/qd2.251zy.com\\/admin.html\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.130 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"79.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"62\",\"regionName\":\"Gansu\",\"city\":\"Lanzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":36.0564,\"longitude\":103.7922,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-02-14 16:34:33');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('25', 'anonymous-1581705549', 'no@e.mail.provided', 'x', null, '{\"ip\":\"125.74.249.176\",\"referer\":\"http:\\/\\/10.168.1.254\\/index\\/support\\/index.html\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit\\/604.1.38 (KHTML, like Gecko) Version\\/11.0 Mobile\\/15A372 Safari\\/604.1\",\"browserName\":\"safari\",\"browserVersion\":\"11.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"62\",\"regionName\":\"Gansu\",\"city\":\"Lanzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":36.0564,\"longitude\":103.7922,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-02-14 18:42:09');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('26', 'anonymous-1581761271', 'no@e.mail.provided', 'x', null, '{\"ip\":\"153.118.244.64\",\"referer\":\"\",\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.1 Mobile\\/15E148 Safari\\/604.1\",\"browserName\":\"safari\",\"browserVersion\":\"13.0\",\"os\":\"iphone\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"37\",\"regionName\":\"Shandong\",\"city\":\"Jinan\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":36.6683,\"longitude\":116.9972,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-02-15 10:08:26');
INSERT INTO `mirrormx_customer_chat_user` VALUES ('27', 'anonymous-1583126370', 'no@e.mail.provided', 'x', null, '{\"ip\":\"39.158.164.22\",\"referer\":\"http:\\/\\/qd.zm297.cn\\/admin.html\",\"userAgent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/12.1.1 Safari\\/605.1.15\",\"browserName\":\"safari\",\"browserVersion\":\"12.1\",\"os\":\"macintosh\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"city\":null,\"zipCode\":null,\"timeZone\":null,\"latitude\":34.7725,\"longitude\":113.7266,\"metroCode\":null,\"utcOffset\":-480}}', 'GUEST', '2020-03-02 13:19:45');

-- ----------------------------
-- Table structure for mirrormx_customer_chat_user_department
-- ----------------------------
DROP TABLE IF EXISTS `mirrormx_customer_chat_user_department`;
CREATE TABLE `mirrormx_customer_chat_user_department` (
  `user_id` int(11) NOT NULL,
  `department_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `user_department_uq` (`user_id`,`department_id`) USING BTREE,
  KEY `user_department_fk_department` (`department_id`) USING BTREE,
  CONSTRAINT `user_department_fk_department` FOREIGN KEY (`department_id`) REFERENCES `mirrormx_customer_chat_department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_department_fk_user` FOREIGN KEY (`user_id`) REFERENCES `mirrormx_customer_chat_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mirrormx_customer_chat_user_department
-- ----------------------------

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '权限状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE,
  KEY `index_system_auth_title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-权限';

-- ----------------------------
-- Records of system_auth
-- ----------------------------
INSERT INTO `system_auth` VALUES ('1', '测试账号', '1', '0', '拥有全部权限', '2019-10-17 06:04:15');
INSERT INTO `system_auth` VALUES ('2', '代理', '1', '0', '代理', '2020-02-06 09:09:03');

-- ----------------------------
-- Table structure for system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色',
  `node` varchar(200) DEFAULT NULL COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=884 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-权限-授权';

-- ----------------------------
-- Records of system_auth_node
-- ----------------------------
INSERT INTO `system_auth_node` VALUES ('765', '1', 'admin');
INSERT INTO `system_auth_node` VALUES ('766', '1', 'admin/auth');
INSERT INTO `system_auth_node` VALUES ('767', '1', 'admin/auth/index');
INSERT INTO `system_auth_node` VALUES ('768', '1', 'admin/auth/apply');
INSERT INTO `system_auth_node` VALUES ('769', '1', 'admin/auth/add');
INSERT INTO `system_auth_node` VALUES ('770', '1', 'admin/auth/edit');
INSERT INTO `system_auth_node` VALUES ('771', '1', 'admin/auth/refresh');
INSERT INTO `system_auth_node` VALUES ('772', '1', 'admin/auth/forbid');
INSERT INTO `system_auth_node` VALUES ('773', '1', 'admin/auth/resume');
INSERT INTO `system_auth_node` VALUES ('774', '1', 'admin/auth/remove');
INSERT INTO `system_auth_node` VALUES ('775', '1', 'admin/config');
INSERT INTO `system_auth_node` VALUES ('776', '1', 'admin/config/info');
INSERT INTO `system_auth_node` VALUES ('777', '1', 'admin/config/config');
INSERT INTO `system_auth_node` VALUES ('778', '1', 'admin/config/file');
INSERT INTO `system_auth_node` VALUES ('779', '1', 'admin/deal');
INSERT INTO `system_auth_node` VALUES ('780', '1', 'admin/deal/order_list');
INSERT INTO `system_auth_node` VALUES ('781', '1', 'admin/deal/deal_console');
INSERT INTO `system_auth_node` VALUES ('782', '1', 'admin/deal/goods_list');
INSERT INTO `system_auth_node` VALUES ('783', '1', 'admin/deal/goods_cate');
INSERT INTO `system_auth_node` VALUES ('784', '1', 'admin/deal/add_goods');
INSERT INTO `system_auth_node` VALUES ('785', '1', 'admin/deal/add_cate');
INSERT INTO `system_auth_node` VALUES ('786', '1', 'admin/deal/edit_goods');
INSERT INTO `system_auth_node` VALUES ('787', '1', 'admin/deal/edit_cate');
INSERT INTO `system_auth_node` VALUES ('788', '1', 'admin/deal/edit_goods_status');
INSERT INTO `system_auth_node` VALUES ('789', '1', 'admin/deal/del_goods');
INSERT INTO `system_auth_node` VALUES ('790', '1', 'admin/deal/del_cate');
INSERT INTO `system_auth_node` VALUES ('791', '1', 'admin/deal/user_recharge');
INSERT INTO `system_auth_node` VALUES ('792', '1', 'admin/deal/edit_recharge');
INSERT INTO `system_auth_node` VALUES ('793', '1', 'admin/deal/deposit_list');
INSERT INTO `system_auth_node` VALUES ('794', '1', 'admin/deal/do_deposit');
INSERT INTO `system_auth_node` VALUES ('795', '1', 'admin/deal/do_deposit2');
INSERT INTO `system_auth_node` VALUES ('796', '1', 'admin/deal/daochu');
INSERT INTO `system_auth_node` VALUES ('797', '1', 'admin/deal/do_deposit3');
INSERT INTO `system_auth_node` VALUES ('798', '1', 'admin/deal/do_commission');
INSERT INTO `system_auth_node` VALUES ('799', '1', 'admin/deal/order_log');
INSERT INTO `system_auth_node` VALUES ('800', '1', 'admin/deal/team_reward');
INSERT INTO `system_auth_node` VALUES ('801', '1', 'admin/help');
INSERT INTO `system_auth_node` VALUES ('802', '1', 'admin/help/message_ctrl');
INSERT INTO `system_auth_node` VALUES ('803', '1', 'admin/help/add_message');
INSERT INTO `system_auth_node` VALUES ('804', '1', 'admin/help/edit_message');
INSERT INTO `system_auth_node` VALUES ('805', '1', 'admin/help/del_message');
INSERT INTO `system_auth_node` VALUES ('806', '1', 'admin/help/home_msg');
INSERT INTO `system_auth_node` VALUES ('807', '1', 'admin/help/edit_home_msg');
INSERT INTO `system_auth_node` VALUES ('808', '1', 'admin/help/banner');
INSERT INTO `system_auth_node` VALUES ('809', '1', 'admin/help/edit_banner');
INSERT INTO `system_auth_node` VALUES ('810', '1', 'admin/help/add_banner');
INSERT INTO `system_auth_node` VALUES ('811', '1', 'admin/index');
INSERT INTO `system_auth_node` VALUES ('812', '1', 'admin/index/main');
INSERT INTO `system_auth_node` VALUES ('813', '1', 'admin/index/clearruntime');
INSERT INTO `system_auth_node` VALUES ('814', '1', 'admin/index/buildoptimize');
INSERT INTO `system_auth_node` VALUES ('815', '1', 'admin/menu');
INSERT INTO `system_auth_node` VALUES ('816', '1', 'admin/menu/index');
INSERT INTO `system_auth_node` VALUES ('817', '1', 'admin/menu/add');
INSERT INTO `system_auth_node` VALUES ('818', '1', 'admin/menu/edit');
INSERT INTO `system_auth_node` VALUES ('819', '1', 'admin/menu/resume');
INSERT INTO `system_auth_node` VALUES ('820', '1', 'admin/menu/forbid');
INSERT INTO `system_auth_node` VALUES ('821', '1', 'admin/menu/remove');
INSERT INTO `system_auth_node` VALUES ('822', '1', 'admin/oplog');
INSERT INTO `system_auth_node` VALUES ('823', '1', 'admin/oplog/index');
INSERT INTO `system_auth_node` VALUES ('824', '1', 'admin/oplog/clear');
INSERT INTO `system_auth_node` VALUES ('825', '1', 'admin/oplog/remove');
INSERT INTO `system_auth_node` VALUES ('826', '1', 'admin/pay');
INSERT INTO `system_auth_node` VALUES ('827', '1', 'admin/pay/index');
INSERT INTO `system_auth_node` VALUES ('828', '1', 'admin/pay/edit');
INSERT INTO `system_auth_node` VALUES ('829', '1', 'admin/pay/forbid');
INSERT INTO `system_auth_node` VALUES ('830', '1', 'admin/pay/resume');
INSERT INTO `system_auth_node` VALUES ('831', '1', 'admin/queue');
INSERT INTO `system_auth_node` VALUES ('832', '1', 'admin/queue/index');
INSERT INTO `system_auth_node` VALUES ('833', '1', 'admin/queue/redo');
INSERT INTO `system_auth_node` VALUES ('834', '1', 'admin/queue/processstart');
INSERT INTO `system_auth_node` VALUES ('835', '1', 'admin/queue/processstop');
INSERT INTO `system_auth_node` VALUES ('836', '1', 'admin/queue/remove');
INSERT INTO `system_auth_node` VALUES ('837', '1', 'admin/user');
INSERT INTO `system_auth_node` VALUES ('838', '1', 'admin/user/index');
INSERT INTO `system_auth_node` VALUES ('839', '1', 'admin/user/add');
INSERT INTO `system_auth_node` VALUES ('840', '1', 'admin/user/edit');
INSERT INTO `system_auth_node` VALUES ('841', '1', 'admin/user/pass');
INSERT INTO `system_auth_node` VALUES ('842', '1', 'admin/user/forbid');
INSERT INTO `system_auth_node` VALUES ('843', '1', 'admin/user/resume');
INSERT INTO `system_auth_node` VALUES ('844', '1', 'admin/user/remove');
INSERT INTO `system_auth_node` VALUES ('845', '1', 'admin/users');
INSERT INTO `system_auth_node` VALUES ('846', '1', 'admin/users/index');
INSERT INTO `system_auth_node` VALUES ('847', '1', 'admin/users/level');
INSERT INTO `system_auth_node` VALUES ('848', '1', 'admin/users/add_users');
INSERT INTO `system_auth_node` VALUES ('849', '1', 'admin/users/edit_users');
INSERT INTO `system_auth_node` VALUES ('850', '1', 'admin/users/edit_users_ankou');
INSERT INTO `system_auth_node` VALUES ('851', '1', 'admin/users/edit_users_status');
INSERT INTO `system_auth_node` VALUES ('852', '1', 'admin/users/edit_users_ewm');
INSERT INTO `system_auth_node` VALUES ('853', '1', 'admin/users/cs_list');
INSERT INTO `system_auth_node` VALUES ('854', '1', 'admin/users/add_cs');
INSERT INTO `system_auth_node` VALUES ('855', '1', 'admin/users/edit_cs_status');
INSERT INTO `system_auth_node` VALUES ('856', '1', 'admin/users/edit_cs');
INSERT INTO `system_auth_node` VALUES ('857', '1', 'admin/users/cs_code');
INSERT INTO `system_auth_node` VALUES ('858', '1', 'admin/users/edit_users_bk');
INSERT INTO `system_auth_node` VALUES ('859', '1', 'admin/users/edit_users_level');
INSERT INTO `system_auth_node` VALUES ('876', '2', 'admin');
INSERT INTO `system_auth_node` VALUES ('877', '2', 'admin/deal');
INSERT INTO `system_auth_node` VALUES ('878', '2', 'admin/deal/order_list');
INSERT INTO `system_auth_node` VALUES ('879', '2', 'admin/deal/user_recharge');
INSERT INTO `system_auth_node` VALUES ('880', '2', 'admin/deal/deposit_list');
INSERT INTO `system_auth_node` VALUES ('881', '2', 'admin/users');
INSERT INTO `system_auth_node` VALUES ('882', '2', 'admin/users/index');
INSERT INTO `system_auth_node` VALUES ('883', '2', 'admin/users/edit_users_ewm');

-- ----------------------------
-- Table structure for system_auth_node_copy
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node_copy`;
CREATE TABLE `system_auth_node_copy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色',
  `node` varchar(200) DEFAULT NULL COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=765 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-权限-授权';

-- ----------------------------
-- Records of system_auth_node_copy
-- ----------------------------
INSERT INTO `system_auth_node_copy` VALUES ('608', '1', 'admin');
INSERT INTO `system_auth_node_copy` VALUES ('609', '1', 'admin/auth');
INSERT INTO `system_auth_node_copy` VALUES ('610', '1', 'admin/auth/index');
INSERT INTO `system_auth_node_copy` VALUES ('611', '1', 'admin/auth/apply');
INSERT INTO `system_auth_node_copy` VALUES ('612', '1', 'admin/auth/add');
INSERT INTO `system_auth_node_copy` VALUES ('613', '1', 'admin/auth/edit');
INSERT INTO `system_auth_node_copy` VALUES ('614', '1', 'admin/auth/refresh');
INSERT INTO `system_auth_node_copy` VALUES ('615', '1', 'admin/auth/forbid');
INSERT INTO `system_auth_node_copy` VALUES ('616', '1', 'admin/auth/resume');
INSERT INTO `system_auth_node_copy` VALUES ('617', '1', 'admin/auth/remove');
INSERT INTO `system_auth_node_copy` VALUES ('618', '1', 'admin/config');
INSERT INTO `system_auth_node_copy` VALUES ('619', '1', 'admin/config/info');
INSERT INTO `system_auth_node_copy` VALUES ('620', '1', 'admin/config/config');
INSERT INTO `system_auth_node_copy` VALUES ('621', '1', 'admin/config/file');
INSERT INTO `system_auth_node_copy` VALUES ('622', '1', 'admin/deal');
INSERT INTO `system_auth_node_copy` VALUES ('623', '1', 'admin/deal/order_list');
INSERT INTO `system_auth_node_copy` VALUES ('624', '1', 'admin/deal/deal_console');
INSERT INTO `system_auth_node_copy` VALUES ('625', '1', 'admin/deal/goods_list');
INSERT INTO `system_auth_node_copy` VALUES ('626', '1', 'admin/deal/add_goods');
INSERT INTO `system_auth_node_copy` VALUES ('627', '1', 'admin/deal/edit_goods');
INSERT INTO `system_auth_node_copy` VALUES ('628', '1', 'admin/deal/edit_goods_status');
INSERT INTO `system_auth_node_copy` VALUES ('629', '1', 'admin/deal/del_goods');
INSERT INTO `system_auth_node_copy` VALUES ('630', '1', 'admin/deal/user_recharge');
INSERT INTO `system_auth_node_copy` VALUES ('631', '1', 'admin/deal/edit_recharge');
INSERT INTO `system_auth_node_copy` VALUES ('632', '1', 'admin/deal/deposit_list');
INSERT INTO `system_auth_node_copy` VALUES ('633', '1', 'admin/deal/do_deposit');
INSERT INTO `system_auth_node_copy` VALUES ('634', '1', 'admin/deal/do_commission');
INSERT INTO `system_auth_node_copy` VALUES ('635', '1', 'admin/deal/order_log');
INSERT INTO `system_auth_node_copy` VALUES ('636', '1', 'admin/deal/team_reward');
INSERT INTO `system_auth_node_copy` VALUES ('637', '1', 'admin/help');
INSERT INTO `system_auth_node_copy` VALUES ('638', '1', 'admin/help/message_ctrl');
INSERT INTO `system_auth_node_copy` VALUES ('639', '1', 'admin/help/add_message');
INSERT INTO `system_auth_node_copy` VALUES ('640', '1', 'admin/help/edit_message');
INSERT INTO `system_auth_node_copy` VALUES ('641', '1', 'admin/help/del_message');
INSERT INTO `system_auth_node_copy` VALUES ('642', '1', 'admin/help/home_msg');
INSERT INTO `system_auth_node_copy` VALUES ('643', '1', 'admin/help/edit_home_msg');
INSERT INTO `system_auth_node_copy` VALUES ('644', '1', 'admin/index');
INSERT INTO `system_auth_node_copy` VALUES ('645', '1', 'admin/index/main');
INSERT INTO `system_auth_node_copy` VALUES ('646', '1', 'admin/index/clearruntime');
INSERT INTO `system_auth_node_copy` VALUES ('647', '1', 'admin/index/buildoptimize');
INSERT INTO `system_auth_node_copy` VALUES ('648', '1', 'admin/menu');
INSERT INTO `system_auth_node_copy` VALUES ('649', '1', 'admin/menu/index');
INSERT INTO `system_auth_node_copy` VALUES ('650', '1', 'admin/menu/add');
INSERT INTO `system_auth_node_copy` VALUES ('651', '1', 'admin/menu/edit');
INSERT INTO `system_auth_node_copy` VALUES ('652', '1', 'admin/menu/resume');
INSERT INTO `system_auth_node_copy` VALUES ('653', '1', 'admin/menu/forbid');
INSERT INTO `system_auth_node_copy` VALUES ('654', '1', 'admin/menu/remove');
INSERT INTO `system_auth_node_copy` VALUES ('655', '1', 'admin/oplog');
INSERT INTO `system_auth_node_copy` VALUES ('656', '1', 'admin/oplog/index');
INSERT INTO `system_auth_node_copy` VALUES ('657', '1', 'admin/oplog/clear');
INSERT INTO `system_auth_node_copy` VALUES ('658', '1', 'admin/oplog/remove');
INSERT INTO `system_auth_node_copy` VALUES ('659', '1', 'admin/pay');
INSERT INTO `system_auth_node_copy` VALUES ('660', '1', 'admin/pay/index');
INSERT INTO `system_auth_node_copy` VALUES ('661', '1', 'admin/pay/edit');
INSERT INTO `system_auth_node_copy` VALUES ('662', '1', 'admin/pay/forbid');
INSERT INTO `system_auth_node_copy` VALUES ('663', '1', 'admin/pay/resume');
INSERT INTO `system_auth_node_copy` VALUES ('664', '1', 'admin/queue');
INSERT INTO `system_auth_node_copy` VALUES ('665', '1', 'admin/queue/index');
INSERT INTO `system_auth_node_copy` VALUES ('666', '1', 'admin/queue/redo');
INSERT INTO `system_auth_node_copy` VALUES ('667', '1', 'admin/queue/processstart');
INSERT INTO `system_auth_node_copy` VALUES ('668', '1', 'admin/queue/processstop');
INSERT INTO `system_auth_node_copy` VALUES ('669', '1', 'admin/queue/remove');
INSERT INTO `system_auth_node_copy` VALUES ('670', '1', 'admin/user');
INSERT INTO `system_auth_node_copy` VALUES ('671', '1', 'admin/user/index');
INSERT INTO `system_auth_node_copy` VALUES ('672', '1', 'admin/user/add');
INSERT INTO `system_auth_node_copy` VALUES ('673', '1', 'admin/user/edit');
INSERT INTO `system_auth_node_copy` VALUES ('674', '1', 'admin/user/pass');
INSERT INTO `system_auth_node_copy` VALUES ('675', '1', 'admin/user/forbid');
INSERT INTO `system_auth_node_copy` VALUES ('676', '1', 'admin/user/resume');
INSERT INTO `system_auth_node_copy` VALUES ('677', '1', 'admin/user/remove');
INSERT INTO `system_auth_node_copy` VALUES ('678', '1', 'admin/users');
INSERT INTO `system_auth_node_copy` VALUES ('679', '1', 'admin/users/index');
INSERT INTO `system_auth_node_copy` VALUES ('680', '1', 'admin/users/level');
INSERT INTO `system_auth_node_copy` VALUES ('681', '1', 'admin/users/add_users');
INSERT INTO `system_auth_node_copy` VALUES ('682', '1', 'admin/users/edit_users');
INSERT INTO `system_auth_node_copy` VALUES ('683', '1', 'admin/users/edit_users_ankou');
INSERT INTO `system_auth_node_copy` VALUES ('684', '1', 'admin/users/edit_users_status');
INSERT INTO `system_auth_node_copy` VALUES ('685', '1', 'admin/users/edit_users_ewm');
INSERT INTO `system_auth_node_copy` VALUES ('686', '1', 'admin/users/cs_list');
INSERT INTO `system_auth_node_copy` VALUES ('687', '1', 'admin/users/add_cs');
INSERT INTO `system_auth_node_copy` VALUES ('688', '1', 'admin/users/edit_cs_status');
INSERT INTO `system_auth_node_copy` VALUES ('689', '1', 'admin/users/edit_cs');
INSERT INTO `system_auth_node_copy` VALUES ('690', '1', 'admin/users/cs_code');
INSERT INTO `system_auth_node_copy` VALUES ('691', '1', 'admin/users/edit_users_bk');
INSERT INTO `system_auth_node_copy` VALUES ('692', '1', 'admin/users/edit_users_level');
INSERT INTO `system_auth_node_copy` VALUES ('756', '2', 'admin');
INSERT INTO `system_auth_node_copy` VALUES ('757', '2', 'admin/deal');
INSERT INTO `system_auth_node_copy` VALUES ('758', '2', 'admin/deal/order_list');
INSERT INTO `system_auth_node_copy` VALUES ('759', '2', 'admin/deal/user_recharge');
INSERT INTO `system_auth_node_copy` VALUES ('760', '2', 'admin/deal/deposit_list');
INSERT INTO `system_auth_node_copy` VALUES ('761', '2', 'admin/users');
INSERT INTO `system_auth_node_copy` VALUES ('762', '2', 'admin/users/index');
INSERT INTO `system_auth_node_copy` VALUES ('763', '2', 'admin/users/edit_users_ewm');
INSERT INTO `system_auth_node_copy` VALUES ('764', '2', 'admin/users/edit_users_level');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '配置名',
  `value` varchar(500) DEFAULT '' COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_config_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-配置';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', 'app_name', '发财猫抢单系统');
INSERT INTO `system_config` VALUES ('2', 'site_name', '发财猫');
INSERT INTO `system_config` VALUES ('3', 'app_version', 'baidu');
INSERT INTO `system_config` VALUES ('4', 'site_copy', '©版权所有 2019-2020 发财猫');
INSERT INTO `system_config` VALUES ('5', 'site_icon', 'http://10.168.1.254/upload/0fcc79458bb3f14c/b5c980e193e25fb0.png');
INSERT INTO `system_config` VALUES ('7', 'miitbeian', 'baidu.com');
INSERT INTO `system_config` VALUES ('8', 'storage_type', 'local');
INSERT INTO `system_config` VALUES ('9', 'storage_local_exts', 'doc,gif,icon,jpg,mp3,mp4,p12,pem,png,rar');
INSERT INTO `system_config` VALUES ('10', 'storage_qiniu_bucket', 'https');
INSERT INTO `system_config` VALUES ('11', 'storage_qiniu_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES ('12', 'storage_qiniu_access_key', '用你自己的吧');
INSERT INTO `system_config` VALUES ('13', 'storage_qiniu_secret_key', '用你自己的吧');
INSERT INTO `system_config` VALUES ('14', 'storage_oss_bucket', 'cuci-mytest');
INSERT INTO `system_config` VALUES ('15', 'storage_oss_endpoint', 'oss-cn-hangzhou.aliyuncs.com');
INSERT INTO `system_config` VALUES ('16', 'storage_oss_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES ('17', 'storage_oss_keyid', '用你自己的吧');
INSERT INTO `system_config` VALUES ('18', 'storage_oss_secret', '用你自己的吧');
INSERT INTO `system_config` VALUES ('36', 'storage_oss_is_https', 'http');
INSERT INTO `system_config` VALUES ('43', 'storage_qiniu_region', '华东');
INSERT INTO `system_config` VALUES ('44', 'storage_qiniu_is_https', 'https');
INSERT INTO `system_config` VALUES ('45', 'wechat_mch_id', '1332187001');
INSERT INTO `system_config` VALUES ('46', 'wechat_mch_key', 'A82DC5BD1F3359081049C568D8502BC5');
INSERT INTO `system_config` VALUES ('47', 'wechat_mch_ssl_type', 'p12');
INSERT INTO `system_config` VALUES ('48', 'wechat_mch_ssl_p12', '65b8e4f56718182d/1bc857ee646aa15d.p12');
INSERT INTO `system_config` VALUES ('49', 'wechat_mch_ssl_key', 'cc2e3e1345123930/c407d033294f283d.pem');
INSERT INTO `system_config` VALUES ('50', 'wechat_mch_ssl_cer', '966eaf89299e9c95/7014872cc109b29a.pem');
INSERT INTO `system_config` VALUES ('51', 'wechat_token', 'mytoken');
INSERT INTO `system_config` VALUES ('52', 'wechat_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('53', 'wechat_appsecret', '9978422e0e431643d4b42868d183d60b');
INSERT INTO `system_config` VALUES ('54', 'wechat_encodingaeskey', '');
INSERT INTO `system_config` VALUES ('55', 'wechat_push_url', '消息推送地址：http://127.0.0.1:8000/wechat/api.push');
INSERT INTO `system_config` VALUES ('56', 'wechat_type', 'thr');
INSERT INTO `system_config` VALUES ('57', 'wechat_thr_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('58', 'wechat_thr_appkey', '5caf4b0727f6e46a7e6ccbe773cc955d');
INSERT INTO `system_config` VALUES ('60', 'wechat_thr_appurl', '消息推送地址：http://127.0.0.1:2314/wechat/api.push');
INSERT INTO `system_config` VALUES ('61', 'component_appid', 'wx28b58798480874f9');
INSERT INTO `system_config` VALUES ('62', 'component_appsecret', '8d0e1ec14ea0adc5027dd0ad82c64bc9');
INSERT INTO `system_config` VALUES ('63', 'component_token', 'P8QHTIxpBEq88IrxatqhgpBm2OAQROkI');
INSERT INTO `system_config` VALUES ('64', 'component_encodingaeskey', 'L5uFIa0U6KLalPyXckyqoVIJYLhsfrg8k9YzybZIHsx');
INSERT INTO `system_config` VALUES ('65', 'system_message_state', '0');
INSERT INTO `system_config` VALUES ('66', 'sms_zt_username', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('67', 'sms_zt_password', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('68', 'sms_reg_template', '您的验证码为{code}，请在十分钟内完成操作！');
INSERT INTO `system_config` VALUES ('69', 'sms_secure', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('70', 'store_title', '测试商城');
INSERT INTO `system_config` VALUES ('71', 'store_order_wait_time', '0.50');
INSERT INTO `system_config` VALUES ('72', 'store_order_clear_time', '24.00');
INSERT INTO `system_config` VALUES ('73', 'store_order_confirm_time', '60.00');
INSERT INTO `system_config` VALUES ('74', 'sms_zt_username2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES ('75', 'sms_zt_password2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES ('76', 'sms_secure2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES ('77', 'sms_reg_template2', '您的验证码为{code}，请在十分钟内完成操作！2');
INSERT INTO `system_config` VALUES ('78', 'michat_appid', '2882303761518074614');
INSERT INTO `system_config` VALUES ('79', 'michat_appkey', '5861807470614');
INSERT INTO `system_config` VALUES ('80', 'michat_appsecert', 'CP/WUTUgDuyOxgLQ5ztesg==');

-- ----------------------------
-- Table structure for system_data
-- ----------------------------
DROP TABLE IF EXISTS `system_data`;
CREATE TABLE `system_data` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置名',
  `value` longtext COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_data_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-数据';

-- ----------------------------
-- Records of system_data
-- ----------------------------
INSERT INTO `system_data` VALUES ('1', 'menudata', '[{\"name\":\"请输入名称\",\"type\":\"scancode_push\",\"key\":\"scancode_push\"}]');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-日志';

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', 'admin/login/index', '140.255.85.95', '系统管理', '用户登录系统成功', 'admin', '2020-02-14 12:46:21');
INSERT INTO `system_log` VALUES ('2', 'admin/login/index', '211.97.128.58', '系统管理', '用户登录系统成功', 'admin', '2020-02-14 12:49:05');
INSERT INTO `system_log` VALUES ('3', 'admin/login/index', '117.136.105.176', '系统管理', '用户登录系统成功', 'admin', '2020-02-14 13:19:31');
INSERT INTO `system_log` VALUES ('4', 'admin/login/index', '125.74.249.176', '系统管理', '用户登录系统成功', 'admin', '2020-02-14 14:06:10');
INSERT INTO `system_log` VALUES ('5', 'admin/login/index', '112.95.206.157', '系统管理', '用户登录系统成功', 'admin', '2020-02-14 15:52:49');
INSERT INTO `system_log` VALUES ('6', 'admin/login/index', '125.74.249.176', '系统管理', '用户登录系统成功', 'admin', '2020-02-14 17:02:41');
INSERT INTO `system_log` VALUES ('7', 'admin/login/index', '112.37.145.225', '系统管理', '用户登录系统成功', 'admin', '2020-02-14 17:13:29');
INSERT INTO `system_log` VALUES ('8', 'admin/login/index', '125.74.249.176', '系统管理', '用户登录系统成功', 'admin', '2020-02-15 03:25:08');
INSERT INTO `system_log` VALUES ('9', 'admin/login/index', '113.129.232.177', '系统管理', '用户登录系统成功', 'admin', '2020-02-15 05:58:44');
INSERT INTO `system_log` VALUES ('10', 'admin/login/index', '125.74.249.176', '系统管理', '用户登录系统成功', 'admin', '2020-02-15 07:27:15');
INSERT INTO `system_log` VALUES ('11', 'admin/login/index', '125.74.249.176', '系统管理', '用户登录系统成功', 'admin', '2020-02-16 03:36:43');
INSERT INTO `system_log` VALUES ('12', 'admin/login/index', '112.37.145.225', '系统管理', '用户登录系统成功', 'admin', '2020-02-16 07:35:29');
INSERT INTO `system_log` VALUES ('13', 'admin/login/index', '112.37.145.225', '系统管理', '用户登录系统成功', 'admin', '2020-02-16 09:20:17');
INSERT INTO `system_log` VALUES ('14', 'admin/login/index', '112.37.145.225', '系统管理', '用户登录系统成功', 'admin', '2020-02-16 17:43:34');
INSERT INTO `system_log` VALUES ('15', 'admin/login/index', '113.127.144.159', '系统管理', '用户登录系统成功', 'wangpeng', '2020-02-17 12:53:49');
INSERT INTO `system_log` VALUES ('16', 'admin/login/index', '113.129.131.120', '系统管理', '用户登录系统成功', 'admin', '2020-02-18 07:47:36');
INSERT INTO `system_log` VALUES ('17', 'admin/login/index', '112.37.145.225', '系统管理', '用户登录系统成功', 'admin', '2020-02-18 09:59:51');
INSERT INTO `system_log` VALUES ('18', 'admin/login/index', '125.74.249.176', '系统管理', '用户登录系统成功', 'admin', '2020-02-19 12:12:02');
INSERT INTO `system_log` VALUES ('19', 'admin/login/index', '112.37.145.225', '系统管理', '用户登录系统成功', 'admin', '2020-02-20 10:39:46');
INSERT INTO `system_log` VALUES ('20', 'admin/login/index', '112.37.145.225', '系统管理', '用户登录系统成功', 'admin', '2020-02-21 06:42:38');
INSERT INTO `system_log` VALUES ('21', 'admin/login/index', '113.127.52.85', '系统管理', '用户登录系统成功', 'admin', '2020-02-21 10:47:46');
INSERT INTO `system_log` VALUES ('22', 'admin/login/index', '10.168.1.132', '系统管理', '用户登录系统成功', 'admin', '2020-02-23 15:44:38');
INSERT INTO `system_log` VALUES ('23', 'admin/login/index', '10.168.1.132', '系统管理', '用户登录系统成功', 'admin', '2020-02-23 15:49:24');
INSERT INTO `system_log` VALUES ('24', 'admin/login/index', '10.168.1.132', '系统管理', '用户登录系统成功', 'admin', '2020-02-23 15:50:45');
INSERT INTO `system_log` VALUES ('25', 'admin/login/index', '10.168.1.132', '系统管理', '用户登录系统成功', 'admin', '2020-02-23 15:52:26');
INSERT INTO `system_log` VALUES ('26', 'admin/login/index', '39.158.164.22', '系统管理', '用户登录系统成功', 'admin', '2020-03-02 12:26:26');
INSERT INTO `system_log` VALUES ('27', 'admin/login/index', '182.246.112.192', '系统管理', '用户登录系统成功', 'admin', '2020-03-08 17:42:05');
INSERT INTO `system_log` VALUES ('28', 'admin/login/index', '111.58.248.242', '系统管理', '用户登录系统成功', 'admin', '2020-03-23 23:39:01');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '父ID',
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `node` varchar(200) DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) DEFAULT '_self' COMMENT '打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_menu_node` (`node`(191)) USING BTREE,
  KEY `index_system_menu_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-菜单';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '0', '后台首页', '', '', 'admin/index/main', '', '_self', '500', '1', '2018-09-05 09:59:38');
INSERT INTO `system_menu` VALUES ('2', '0', '系统管理', '', '', '#', '', '_self', '0', '1', '2018-09-05 10:04:52');
INSERT INTO `system_menu` VALUES ('3', '4', '系统菜单管理', '', 'layui-icon layui-icon-layouts', 'admin/menu/index', '', '_self', '1', '1', '2018-09-05 10:05:26');
INSERT INTO `system_menu` VALUES ('4', '2', '系统配置', '', '', '#', '', '_self', '20', '1', '2018-09-05 10:07:17');
INSERT INTO `system_menu` VALUES ('5', '12', '系统用户管理', '', 'layui-icon layui-icon-username', 'admin/user/index', '', '_self', '1', '1', '2018-09-06 03:10:42');
INSERT INTO `system_menu` VALUES ('7', '12', '访问权限管理', '', 'layui-icon layui-icon-vercode', 'admin/auth/index', '', '_self', '2', '1', '2018-09-06 07:17:14');
INSERT INTO `system_menu` VALUES ('11', '4', '系统参数配置', '', 'layui-icon layui-icon-set', 'admin/config/info', '', '_self', '4', '1', '2018-09-06 08:43:47');
INSERT INTO `system_menu` VALUES ('12', '2', '权限管理', '', '', '#', '', '_self', '10', '1', '2018-09-06 10:01:31');
INSERT INTO `system_menu` VALUES ('62', '0', '角色', '', 'layui-icon layui-icon-username', '#', '', '_self', '19', '1', '2019-10-17 05:43:53');
INSERT INTO `system_menu` VALUES ('63', '62', '会员管理', '', '', '#', '', '_self', '0', '1', '2019-10-17 05:44:17');
INSERT INTO `system_menu` VALUES ('64', '63', '会员列表', '', 'layui-icon layui-icon-username', 'admin/users/index', '', '_self', '0', '1', '2019-10-17 05:44:45');
INSERT INTO `system_menu` VALUES ('65', '0', '帮助中心', '', 'fa fa-flag-o', '#', '', '_self', '2', '1', '2019-10-18 02:42:54');
INSERT INTO `system_menu` VALUES ('66', '67', '公告管理', '', 'layui-icon layui-icon-speaker', 'admin/help/message_ctrl', '', '_self', '0', '0', '2019-10-18 02:45:12');
INSERT INTO `system_menu` VALUES ('67', '65', '首页文本', '', '', '#', '', '_self', '0', '1', '2019-10-18 06:50:42');
INSERT INTO `system_menu` VALUES ('68', '67', '文本管理', '', 'fa fa-book', 'admin/help/home_msg', '', '_self', '0', '1', '2019-10-18 07:13:53');
INSERT INTO `system_menu` VALUES ('69', '0', '交易', '', 'fa fa-balance-scale', '#', '', '_self', '18', '1', '2019-10-19 06:38:16');
INSERT INTO `system_menu` VALUES ('70', '69', '商品管理', '', '', '#', '', '_self', '1', '1', '2019-10-19 06:39:55');
INSERT INTO `system_menu` VALUES ('71', '70', '商品列表', '', 'fa fa-shopping-cart', 'admin/deal/goods_list', '', '_self', '0', '1', '2019-10-19 06:40:50');
INSERT INTO `system_menu` VALUES ('72', '69', '交易管理', '', '', '#', '', '_self', '2', '1', '2019-10-19 07:31:16');
INSERT INTO `system_menu` VALUES ('73', '72', '交易控制', '', 'layui-icon layui-icon-console', 'admin/deal/deal_console', '', '_self', '1', '1', '2019-10-19 07:32:25');
INSERT INTO `system_menu` VALUES ('74', '72', '充值管理', '', 'layui-icon layui-icon-chart-screen', 'admin/deal/user_recharge', '', '_self', '3', '1', '2019-10-22 06:15:27');
INSERT INTO `system_menu` VALUES ('75', '72', '订单列表', '', 'layui-icon layui-icon-cart-simple', 'admin/deal/order_list', '', '_self', '4', '1', '2019-10-24 08:10:29');
INSERT INTO `system_menu` VALUES ('76', '72', '提现管理', '', 'fa fa-legal', 'admin/deal/deposit_list', '', '_self', '2', '1', '2019-10-24 08:44:52');
INSERT INTO `system_menu` VALUES ('77', '62', '客服管理', '', '', '#', '', '_self', '0', '1', '2019-10-25 02:01:53');
INSERT INTO `system_menu` VALUES ('78', '77', '客服列表', '', 'layui-icon layui-icon-group', 'admin/users/cs_list', '', '_self', '0', '1', '2019-10-25 02:07:17');
INSERT INTO `system_menu` VALUES ('79', '77', '客服代码', '', 'layui-icon layui-icon-fonts-code', 'admin/users/cs_code', '', '_self', '0', '1', '2019-10-29 05:53:55');
INSERT INTO `system_menu` VALUES ('82', '67', '首页轮播图', '', 'layui-icon layui-icon-carousel', 'admin/help/banner', '', '_self', '0', '1', '2019-12-11 03:21:29');
INSERT INTO `system_menu` VALUES ('83', '70', '商品分类', '', '', '/admin/deal/goods_cate', '', '_self', '0', '1', '2020-01-05 03:16:29');
INSERT INTO `system_menu` VALUES ('84', '4', '支付方式管理', '', '', '/admin/pay/index', '', '_self', '0', '1', '2020-01-14 12:50:29');
INSERT INTO `system_menu` VALUES ('85', '63', '会员等级', '', '', '/admin/users/level', '', '_self', '0', '1', '2020-02-05 08:55:18');
INSERT INTO `system_menu` VALUES ('86', '72', '利息宝', '', '', '/admin/deal/lixibao', '', '_self', '0', '1', '2020-02-11 15:49:11');

-- ----------------------------
-- Table structure for system_queue
-- ----------------------------
DROP TABLE IF EXISTS `system_queue`;
CREATE TABLE `system_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `data` longtext NOT NULL COMMENT '执行参数',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '任务状态(1新任务,2处理中,3成功,4失败)',
  `preload` varchar(500) DEFAULT '' COMMENT '执行内容',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `double` tinyint(1) DEFAULT '1' COMMENT '单例模式',
  `desc` varchar(500) DEFAULT '' COMMENT '状态描述',
  `start_at` varchar(20) DEFAULT '' COMMENT '开始时间',
  `end_at` varchar(20) DEFAULT '' COMMENT '结束时间',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_queue_double` (`double`) USING BTREE,
  KEY `index_system_queue_time` (`time`) USING BTREE,
  KEY `index_system_queue_title` (`title`) USING BTREE,
  KEY `index_system_queue_create_at` (`create_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-任务';

-- ----------------------------
-- Records of system_queue
-- ----------------------------

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) DEFAULT '' COMMENT '用户密码',
  `qq` varchar(16) DEFAULT '' COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT '' COMMENT '联系手机',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(255) DEFAULT '' COMMENT '登录IP',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `authorize` varchar(255) DEFAULT '' COMMENT '权限授权',
  `tags` varchar(255) DEFAULT '' COMMENT '用户标签',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_user_username` (`username`) USING BTREE,
  KEY `index_system_user_status` (`status`) USING BTREE,
  KEY `index_system_user_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统-用户';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('10000', 'admin', 'dc483e80a7a0bd9ef71d8cf973673924', '1454812003', '', '', '2020-03-23 23:39:01', '111.58.248.242', '885', '', '', '发财猫', '1', '0', '2015-11-13 07:14:22');
INSERT INTO `system_user` VALUES ('10001', 'test', '0ab44bd43d6b18fcd5cd928d6faab1b8', '', '', '13800000000', '2020-02-06 19:06:52', '127.0.0.1', '5', '2', '', '', '1', '1', '2020-02-06 09:08:45');

-- ----------------------------
-- Table structure for xy_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `xy_balance_log`;
CREATE TABLE `xy_balance_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交易对象id',
  `oid` char(18) NOT NULL COMMENT '交易单号',
  `num` decimal(10,2) NOT NULL COMMENT '交易金额',
  `type` int(2) NOT NULL COMMENT '交易类型 0系统 1充值 2交易 3返佣 4强制交易 5推广返佣 6下级交易返佣',
  `status` int(1) DEFAULT '1' COMMENT '收入1 支出2',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员-收支明细表';

-- ----------------------------
-- Records of xy_balance_log
-- ----------------------------
INSERT INTO `xy_balance_log` VALUES ('1', '3', '0', 'UB2003240047129492', '5934.00', '2', '2', '1584982095');

-- ----------------------------
-- Table structure for xy_bankinfo
-- ----------------------------
DROP TABLE IF EXISTS `xy_bankinfo`;
CREATE TABLE `xy_bankinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `bankname` varchar(100) NOT NULL DEFAULT '' COMMENT '银行名称',
  `cardnum` varchar(50) NOT NULL DEFAULT '' COMMENT '卡号',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `site` varchar(255) NOT NULL DEFAULT '' COMMENT '开户行地址',
  `tel` varchar(20) NOT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，1启用，0禁用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Uid` (`uid`) USING BTREE,
  KEY `Cardnum` (`cardnum`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-银行卡信息表';

-- ----------------------------
-- Records of xy_bankinfo
-- ----------------------------

-- ----------------------------
-- Table structure for xy_bank_list
-- ----------------------------
DROP TABLE IF EXISTS `xy_bank_list`;
CREATE TABLE `xy_bank_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(15) NOT NULL COMMENT '银行编号',
  `bankname` varchar(255) NOT NULL COMMENT '银行名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='提现银行编码表';

-- ----------------------------
-- Records of xy_bank_list
-- ----------------------------
INSERT INTO `xy_bank_list` VALUES ('1', 'ICBC', '工商银行');
INSERT INTO `xy_bank_list` VALUES ('2', 'ABC', '农业银行');
INSERT INTO `xy_bank_list` VALUES ('3', 'CMB', '招商银行');
INSERT INTO `xy_bank_list` VALUES ('4', 'BCM', '交通银行');
INSERT INTO `xy_bank_list` VALUES ('5', 'CCB', '建设银行');
INSERT INTO `xy_bank_list` VALUES ('6', 'CMBC', '民生银行');
INSERT INTO `xy_bank_list` VALUES ('7', 'CIB', '兴业银行');
INSERT INTO `xy_bank_list` VALUES ('8', 'BOC', '中国银行');
INSERT INTO `xy_bank_list` VALUES ('9', 'SPDB', '浦发银行');
INSERT INTO `xy_bank_list` VALUES ('10', 'CEB ', '光大银行');
INSERT INTO `xy_bank_list` VALUES ('11', 'PSBC', '邮政储蓄银行');
INSERT INTO `xy_bank_list` VALUES ('12', 'PAB', '平安银行');
INSERT INTO `xy_bank_list` VALUES ('13', 'HXB', '华夏银行');
INSERT INTO `xy_bank_list` VALUES ('14', 'CGB', '广发银行');
INSERT INTO `xy_bank_list` VALUES ('15', 'HKBEA', '东亚银行');
INSERT INTO `xy_bank_list` VALUES ('16', 'NBCB', '宁波银行');
INSERT INTO `xy_bank_list` VALUES ('17', 'CITIC', '中信银行');
INSERT INTO `xy_bank_list` VALUES ('18', 'CBHB', '渤海银行');
INSERT INTO `xy_bank_list` VALUES ('19', 'BOB', '北京银行');
INSERT INTO `xy_bank_list` VALUES ('20', 'BJCB', '南京银行');
INSERT INTO `xy_bank_list` VALUES ('21', 'SHB', '上海银行');
INSERT INTO `xy_bank_list` VALUES ('22', 'GZYH', '广州银行');
INSERT INTO `xy_bank_list` VALUES ('23', 'HZYH', '杭州银行');
INSERT INTO `xy_bank_list` VALUES ('24', 'HZLHNCSYYH', '杭州联合商业银行');

-- ----------------------------
-- Table structure for xy_banner
-- ----------------------------
DROP TABLE IF EXISTS `xy_banner`;
CREATE TABLE `xy_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` text,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='首页轮播图';

-- ----------------------------
-- Records of xy_banner
-- ----------------------------
INSERT INTO `xy_banner` VALUES ('6', 'http://qd.zm297.cn/upload/7512abcbb450969b/a24b178e8b8a8d40.png', null, '/');

-- ----------------------------
-- Table structure for xy_convey
-- ----------------------------
DROP TABLE IF EXISTS `xy_convey`;
CREATE TABLE `xy_convey` (
  `id` char(18) NOT NULL,
  `uid` int(10) NOT NULL COMMENT '会员ID',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '交易金额',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '下单时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '完成交易时间',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '订单状态 0待付款 1交易完成 2用户取消  3强制完成 4强制取消  5交易冻结',
  `commission` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `c_status` int(1) NOT NULL DEFAULT '0' COMMENT '佣金发放状态 0未发放 1已发放 2账号冻结',
  `add_id` int(11) NOT NULL COMMENT '收货地址',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_count` int(2) NOT NULL DEFAULT '1' COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-订单表';

-- ----------------------------
-- Records of xy_convey
-- ----------------------------
INSERT INTO `xy_convey` VALUES ('UB2003240047129492', '3', '5934.00', '1584982032', '1584982095', '5', '14.84', '0', '174', '81', '6');
INSERT INTO `xy_convey` VALUES ('UB2003240051025221', '3', '1978.00', '1584982262', '1584982382', '0', '4.95', '0', '174', '81', '2');

-- ----------------------------
-- Table structure for xy_cs
-- ----------------------------
DROP TABLE IF EXISTS `xy_cs`;
CREATE TABLE `xy_cs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL COMMENT '手机号',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `pwd` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '盐',
  `qq` varchar(20) NOT NULL COMMENT 'QQ号',
  `wechat` varchar(150) NOT NULL COMMENT '微信号',
  `qr_code` varchar(150) NOT NULL COMMENT '微信二维码',
  `btime` char(5) NOT NULL DEFAULT '0' COMMENT '上班时间',
  `etime` char(5) NOT NULL COMMENT '下班时间',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '账号状态 1启用 2禁用',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='客服-用户表';

-- ----------------------------
-- Records of xy_cs
-- ----------------------------
INSERT INTO `xy_cs` VALUES ('1', '18812312312', '客服一号', '12346578', '', '81', 'https://www.baidu.com', '', '08:01', '18:00', '1', '1571970644');
INSERT INTO `xy_cs` VALUES ('2', '18812312313', '客服二号', '12345678', '', '81', 'https://www.baidu.com', '', '10:00', '20:00', '2', '1571971118');
INSERT INTO `xy_cs` VALUES ('3', '18812345678', '商务咨询', 'c123456789.', '', '81', 'https://www.baidu.com', '', '10:00', '22:00', '2', '1575521614');
INSERT INTO `xy_cs` VALUES ('4', '18878978978', '广告加盟', 'queen123456', '', '81', 'https://www.baidu.com', '', '09:00', '21:00', '2', '1575595897');

-- ----------------------------
-- Table structure for xy_deal_elog
-- ----------------------------
DROP TABLE IF EXISTS `xy_deal_elog`;
CREATE TABLE `xy_deal_elog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` char(18) NOT NULL COMMENT '相关订单',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `errmsg` varchar(255) NOT NULL COMMENT '错误信息',
  `addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='交易错误日志表';

-- ----------------------------
-- Records of xy_deal_elog
-- ----------------------------
INSERT INTO `xy_deal_elog` VALUES ('1', 'SY1912061259444913', '0', '充值成功但是修改订单状态失败!请尝试在后台确认并修改订单状态', '1575611363');
INSERT INTO `xy_deal_elog` VALUES ('3', 'SY1912061259444913', '0', '充值成功但是查不到订单号或者是重复触发回调!请尝试在后台确认订单详情', '1575612620');
INSERT INTO `xy_deal_elog` VALUES ('5', 'SY1912061259444913', '0', '充值成功但是查不到订单号或者是重复触发回调!请尝试在后台确认订单详情', '1575612979');
INSERT INTO `xy_deal_elog` VALUES ('6', 'SY1912061418399195', '0', '充值成功但是查不到订单号或者是重复触发回调!请尝试在后台确认订单详情', '1575613761');
INSERT INTO `xy_deal_elog` VALUES ('7', 'SY1912061713179792', '510', '签名不正确', '1575623644');
INSERT INTO `xy_deal_elog` VALUES ('8', '0', '0', 'Undefined index: appid', '1575632178');
INSERT INTO `xy_deal_elog` VALUES ('9', '0', '0', 'Undefined index: appid', '1575632238');
INSERT INTO `xy_deal_elog` VALUES ('10', '', '0', '签名错误', '1576983298');

-- ----------------------------
-- Table structure for xy_deposit
-- ----------------------------
DROP TABLE IF EXISTS `xy_deposit`;
CREATE TABLE `xy_deposit` (
  `id` char(18) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '提现用户',
  `bk_id` int(11) NOT NULL COMMENT '银行卡信息',
  `num` decimal(12,2) NOT NULL COMMENT '提现金额',
  `addtime` int(10) NOT NULL COMMENT '提交时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 1待处理 2审核通过 3审核不通过',
  `type` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-余额提现表';

-- ----------------------------
-- Records of xy_deposit
-- ----------------------------
INSERT INTO `xy_deposit` VALUES ('CO2002151123017700', '1', '0', '1.00', '1581736981', '1582012078', '3', 'wx');
INSERT INTO `xy_deposit` VALUES ('CO2002151124061355', '1', '0', '1.00', '1581737046', '1582012077', '3', 'zfb');
INSERT INTO `xy_deposit` VALUES ('CO2002151149131653', '1', '0', '10.00', '1581738553', '1582012075', '3', 'wx');
INSERT INTO `xy_deposit` VALUES ('CO2002151639328659', '1', '0', '100.00', '1581755972', '1581759277', '3', 'wx');
INSERT INTO `xy_deposit` VALUES ('CO2002181831283615', '21', '0', '200.00', '1582021888', '1582022092', '2', 'zfb');
INSERT INTO `xy_deposit` VALUES ('CO2002192019481531', '30', '0', '101.00', '1582114788', '1582195271', '3', 'zfb');

-- ----------------------------
-- Table structure for xy_goods_cate
-- ----------------------------
DROP TABLE IF EXISTS `xy_goods_cate`;
CREATE TABLE `xy_goods_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商店名称',
  `bili` varchar(255) NOT NULL COMMENT '商品名称',
  `cate_info` varchar(255) DEFAULT '' COMMENT '商品描述',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `cate_pic` varchar(120) DEFAULT '' COMMENT '商品展示图片',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `status` int(1) DEFAULT '0' COMMENT '上架状态 0不上架 1上架',
  `min` varchar(255) DEFAULT NULL COMMENT '最小金额限制',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of xy_goods_cate
-- ----------------------------
INSERT INTO `xy_goods_cate` VALUES ('1', '淘宝天猫', '0.0025', '抢单佣金', null, '/statics/img/tb.svg', '1582282544', '0', '100');
INSERT INTO `xy_goods_cate` VALUES ('2', '京东商城', '0.0030', '抢单佣金', null, '/statics/img/gd.svg', '1582282558', '0', '100');
INSERT INTO `xy_goods_cate` VALUES ('3', '唯品会', '0.0035', '抢单佣金', null, '/statics/img/w.svg', '1582282580', '0', '100');
INSERT INTO `xy_goods_cate` VALUES ('4', '拼多多', '0.0040', '抢单佣金', null, '/statics/img/pdd.png', '1582282592', '0', '100');

-- ----------------------------
-- Table structure for xy_goods_list
-- ----------------------------
DROP TABLE IF EXISTS `xy_goods_list`;
CREATE TABLE `xy_goods_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) NOT NULL COMMENT '商店名称',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `goods_info` varchar(255) DEFAULT '' COMMENT '商品描述',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_pic` varchar(120) DEFAULT '' COMMENT '商品展示图片',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '上架状态 0不上架 1上架',
  `cid` int(11) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=642 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of xy_goods_list
-- ----------------------------
INSERT INTO `xy_goods_list` VALUES ('41', '明凰服饰专营店', '男女冲锋衣工装棉服外套修身加厚款', '邮乐支持微信，支付宝，网银，邮储卡和银联卡支付。（不同商品请分开下单）', '85.00', '/upload/goods_img/户外服饰/5db3b8b22c022.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('42', '户外途量工厂专卖店', '春夏季运动风衣钓鱼防晒衣男女超薄透气皮肤衣防风外套户外速干潮流衣服情侣款皮肤衣', '大码骑行长袖', '29.90', '/upload/goods_img/户外服饰/5db3b8b23604c.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('43', '探路者正江专卖店', '探路者/TOREAD 冲锋裤 运动裤 秋冬户外软壳裤男透气防风保暖徒步裤KAMG91159', '', '428.00', '/upload/goods_img/户外服饰/5db3b8b25312b.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('44', '探路者正江专卖店', '探路者运动服 探路者冲锋衣 19秋冬户外女式防水透湿套绒冲锋衣TAWH92285', '', '839.00', '/upload/goods_img/户外服饰/5db3b8b25d925.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('45', '好看哒专营店', '防晒衣女中长款薄款防晒服', 'FSY-6387', '45.00', '/upload/goods_img/户外服饰/5db3b8b56628b.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('46', '宝仕母婴专营店专柜', 'L户外皮肤衣防紫外线防晒衣男女夏季超薄透气防晒服运动风衣', '', '75.00', '/upload/goods_img/户外服饰/5db3b8b573966.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('47', '好看哒专营店', '防晒衣女夏季新款韩版连帽系带长袖防晒衣糖果色沙滩户外披肩防晒衣', 'FSY-54', '19.90', '/upload/goods_img/户外服饰/5db3b8b88f380.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('48', '户外途量工厂专卖店', '户外速干T恤男 女休闲跑步运动健身短袖大码情侣快干衣排汗透气', '', '22.80', '/upload/goods_img/户外服饰/5db3b8b8abc8f.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('49', '好看哒专营店', '防晒衣 户外薄款防紫外线印花防晒衣', 'FSY-1736', '25.00', '/upload/goods_img/户外服饰/5db3b8b8c0c84.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('50', '好看哒专营店', '防晒衣夏季女蝙蝠袖连帽拉链短款防晒衣', 'FSY-5423', '35.00', '/upload/goods_img/户外服饰/5db3b8b9b16a1.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('51', '好看哒专营店', '防晒衣男士薄款纯色连帽防晒衣', 'FSY-4167', '35.00', '/upload/goods_img/户外服饰/5db3b8b9bbe9c.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('52', '户外途量工厂专卖店', '城徒 户外春夏单层冲锋衣女防晒衣男轻薄防风钓鱼服透气速干外套长袖衫', '', '35.80', '/upload/goods_img/户外服饰/5db3b8ba1b847.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('53', '好看哒专营店', '防晒衣韩版短款薄款连帽长袖防晒衣', 'FSY-5439', '36.00', '/upload/goods_img/户外服饰/5db3b8ba72314.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('54', '好看哒专营店', '防晒衣女中长款涂鸦薄款防晒衣', 'FSY-5282', '36.00', '/upload/goods_img/户外服饰/5db3b8ba99fd5.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('55', '好看哒专营店', '防晒衣女中长款薄款防晒衣', 'FSY-5456', '37.90', '/upload/goods_img/户外服饰/5db3b8baa8e20.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('56', '户外途量工厂专卖店', '秋冬户外男抓绒衣摇粒绒女外套保暖冲锋衣内胆开衫卫衣', '', '39.00', '/upload/goods_img/户外服饰/5db3b8bab267b.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('57', '户外途量工厂专卖店', '户外秋冬季加绒加厚抓绒衣男女摇粒绒保暖抓绒外套开衫冲锋衣内胆', '', '49.00', '/upload/goods_img/户外服饰/5db3b8bae0cb5.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('58', '江门新会馆', '【江门新会馆】caxa断码 两截速干裤女 韩版修身透气徒步快干裤野外登山跑步长裤', '', '50.00', '/upload/goods_img/户外服饰/5db3b8baf06b9.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('59', '宝仕母婴专营店专柜', 'L夏季休闲短裤男宽松5分中裤子男士运动五分裤大码跑步速干沙滩裤', '', '55.00', '/upload/goods_img/户外服饰/5db3b8bb2ba54.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('60', '江门新会馆', '【江门新会馆】caxa修身户外健身速干裤女 快干弹力透气登山大码长裤 弹力户外裤', '', '60.00', '/upload/goods_img/户外服饰/5db3b8bb513ed.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('61', '探路者正江专卖店', '探路者/TOREADt恤女户外夏季快干速干透气运动服TAJG82984', '', '61.00', '/upload/goods_img/户外服饰/5db3b8bb5ac47.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('62', '铁好家居美妆日用百货专营店', '佳钓尼 夏遮阳防晒帽套头面罩透气防紫外线渔夫帽', '', '48.00', '/upload/goods_img/户外服饰/5db3b8bb8e0a3.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('63', '宝仕母婴专营店专柜', '防晒衣男女情侣春夏季防雨风衣超薄透气速干钓鱼防晒服户外皮肤衣MN', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bb9f9e7.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('64', '户外途量工厂专卖店', '城徒 春夏季速干裤男女大码轻薄快干透气户外修身显瘦弹力冲锋裤', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbb3e24.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('65', '宝仕母婴专营店专柜', 'L运动户外夏季速干t恤 男女短袖速干衣快干t恤 吸汗透气', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbe33ff.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('66', '宝仕母婴专营店专柜', 'L健身房教练速干T恤男女 圆领情侣夏季短袖汗衫', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bc1bca2.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('67', '户外途量工厂专卖店', '城徒 冬季正品户外冲锋裤男女抓绒裤保暖防风防水加厚软壳裤登山裤长裤', '', '75.00', '/upload/goods_img/户外服饰/5db3b8bc42dab.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('68', '江门新会馆', '【江门新会馆】caxa修身弹力女款休闲棉裤 户外休闲快干长裤 女士跑步登山健身裤', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bc96997.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('69', '江门新会馆', '【江门新会馆】caxa休闲修身速干裤 透气轻薄运动裤耐磨健身户外裤多袋裤七分裤', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcac92c.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('70', '探路者正江专卖店', '探路者/TOREAD 运动服 短袖户外女运动跑步排汗透气圆领速干T恤TAJF82784', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcc53b9.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('71', '户外途量工厂专卖店', '冲锋裤男户外秋冬防风防水软壳裤女加绒加厚抓绒裤保暖徒步登山裤', '', '79.00', '/upload/goods_img/户外服饰/5db3b8bd362c1.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('72', '探路者正江专卖店', '探路者/TOREADT恤女 夏户外女式超轻透气速干衣圆领T恤短袖KAJG82352', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd44554.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('73', '探路者正江专卖店', '探路者/TOREAD 短袖 18春夏新款户外女式圆领速干透气印花短袖T恤TAJG82939', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd602ab.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('74', '探路者正江专卖店', '探路者/TOREAD夏新款户外运动透气弹力速干女式半袖短袖T恤KAJG82310', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be68f86.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('75', '探路者正江专卖店', '探路者/TOREAD T恤女款 秋季户外短袖女时尚速干透气短袖T恤TAJG82938', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be96a09.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('76', '洋湖轩榭官方旗舰店', '洋湖轩榭 春秋季新款中老年男装连帽冲锋衣爸爸装休闲夹克衫外套男A', '钜惠双十一 感恩惠顾', '126.42', '/upload/goods_img/户外服饰/5db3b8bea6025.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('77', '南城百货专营店', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '158.00', '/upload/goods_img/户外服饰/5db3b8bede68a.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('78', '正江服饰专营店', '包邮韵格NT1021男士紧身训练PRO运动健身跑步长袖弹力速干服纯色衣服', '', '59.00', '/upload/goods_img/户外服饰/5db3b8beeb97d.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('79', '流行饰品运动户外器械', '汤河店 户外冲锋裤男女可脱卸秋冬季加绒加厚保暖软壳防风防水登山滑雪裤', '', '179.00', '/upload/goods_img/户外服饰/5db3b8bf07cf9.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('80', '流行饰品运动户外器械', '汤河店 韩国正品vvc防晒衣女经典薄夏季中长款防晒服户外防紫外线皮肤衣', '', '499.00', '/upload/goods_img/户外服饰/5db3b8bf2bf21.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('81', '乐颐汇数码专营店', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', '2400万AI高清自拍，麒麟710处理器，炫光渐变色', '989.00', '/upload/goods_img/手机数码/5db3b8700e46c.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('82', '乐颐汇数码专营店', '华为/HUAWEI 畅享9 手机 全网通 4GB+128GB', '6.26英寸珍珠屏 4000mAh大电池', '1099.00', '/upload/goods_img/手机数码/5db3b8731cf7b.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('83', '米果商贸专柜', '折叠式平板电脑支架底座懒人手机支架【颜色随机发货】', '', '9.90', '/upload/goods_img/手机数码/5db3b87337179.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('84', '邮乐韵菲专营店', '（亏本促销）车载手机支架双面吸盘式家居懒人多功能通用可弯曲创意手机支架', '', '1.00', '/upload/goods_img/手机数码/5db3b87345fc4.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('85', '麦尚科技专营店', '手机支架懒人支架卡通创意平板电脑桌面支撑座【款式随机】', '', '9.90', '/upload/goods_img/手机数码/5db3b8734f81e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('86', '邮乐韵菲专营店', '无线蓝牙耳机迷你超小苹果安卓通用耳机', '送两条充电线+一个收纳盒', '15.90', '/upload/goods_img/手机数码/5db3b873b60d7.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('87', '万品好易购商城', 'XO NB23 八角宝石锌合金数据线', '产品颜色：黑色  白色 宝石外观 不拘一格;  锌合金 更出色；  2.4A极速充电，高效传输文件', '49.00', '/upload/goods_img/手机数码/5db3b873bf931.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('88', '万品好易购商城', 'XO F1 户外Mini蓝牙音箱 经典挂扣 防水 防尘/防摔 抗干扰性强 无线链接 免提通话', '音量调节/音乐播放、暂停/上下曲切换 语音报号/来电铃声/数据输出/直读SD卡', '99.00', '/upload/goods_img/手机数码/5db3b873d7806.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('89', '万品好易购商城', 'XO  PB39 移动电源 8000mAh', '8000mAh大容量 双输出带LED灯  ； 电源保护, 好用更安全； 智能分流 高效输出', '119.00', '/upload/goods_img/手机数码/5db3b8740878f.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('90', '万品好易购商城', 'XO BS8 运动蓝牙耳机源于经典 加以升级 鲨鱼鳍耳翼 舒适牢固', '源于经典 加以升级； 鲨鱼鳍耳翼 舒适牢固 ； 无惧雨水  防水防汗； 蓝牙4.2版本，深度降噪', '169.00', '/upload/goods_img/手机数码/5db3b87419133.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('91', '万品好易购商城', 'XO BS7 运动蓝牙耳机 深度降噪 通话更清晰 轻松操控 随意切换', '强劲的CSR芯片 提升续航能力； 蓝牙4.1版本，深度降噪，通话更清晰； 霍尔磁控开关，智能感应', '199.00', '/upload/goods_img/手机数码/5db3b8742586e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('92', '万品好易购商城', 'XO A8 蓝牙音箱 智能触控 自由切换 大容量电池 可连续播放约4-6小时 土豪金 星空银 银色', '智能触控，自由切换； 内置1000毫安聚合物电池，全频高清喇叭+低音振膜,可连续播放约4-6小时', '169.00', '/upload/goods_img/手机数码/5db3b874390f2.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('93', '普润家居专营店', 'oppo蓝牙耳机迷你vivo超小隐形运动通用华为无线耳塞超长待机开车', '', '79.00', '/upload/goods_img/手机数码/5db3b874496ae.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('94', '木易生活专柜', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '12.90', '/upload/goods_img/手机数码/5db3b874588e2.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('95', '木易生活专柜', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1*', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1', '15.90', '/upload/goods_img/手机数码/5db3b8746c166.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('96', '北京信酷数码商城专柜', 'iPhone 苹果原装充电器套装/数据线+充电头电源适配器 通用型', '【全国包邮】 充电套装更优惠', '69.00', '/upload/goods_img/手机数码/5db3b874784b9.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('97', '小牛数码家居专柜', '飞利浦/PHILIPS 多功能可伸缩车载手机支架DLK35002', '多功能可伸缩车载手机支架', '68.00', '/upload/goods_img/手机数码/5db3b87484bf4.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('98', '北京信酷数码商城专柜', '苹果 iphone X /XS MAX/XS/XR/钢化膜 全屏全覆盖 手机贴膜', '', '19.00', '/upload/goods_img/手机数码/5db3b87493e28.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('99', '邮乐萍乡馆', '南孚(NANFU)3V纽扣电池两粒 CR2032/CR2025/CR2016锂电池电子汽车钥匙遥控', '奔驰c200l福特 新蒙迪欧 高尔夫7 新马自达昂克赛拉阿特兹 手表奔驰大众汽车钥匙电池', '9.90', '/upload/goods_img/手机数码/5db3b874a670c.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('100', '信酷小米专营店', '小米（MI） 车载充电器快充版 QC3.0 双口输出 智能温度控制 兼容iOS和Android设备', '小米正品 全国包邮', '89.00', '/upload/goods_img/手机数码/5db3b874b8050.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('101', '北京信酷数码商城专柜', '苹果 iPhone6/6S/6Plus/6SPlus/iPhone7/7P防爆钢化玻璃膜高清手机贴膜', '进口AGC玻璃板！超薄钢化玻璃膜！秒杀国产玻璃！', '26.00', '/upload/goods_img/手机数码/5db3b874c207b.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('102', '北京信酷数码商城专柜', 'OPPO手机原装耳机R11/PLUS入耳式线控r11s/r15耳机 白色盒装', '', '38.80', '/upload/goods_img/手机数码/5db3b874d31ef.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('103', '北京信酷数码商城专柜', '华为（HUAWEI）小天鹅无线蓝牙免提通话音箱4.0 便携户外/车载迷你音响AM08', '音·触即发！360°音效技术，音质真实自然，简洁触控操作，支持蓝牙免提通话。', '95.00', '/upload/goods_img/手机数码/5db3b874e280a.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('104', '北京信酷数码商城专柜', '三星 32G内存卡(CLASS10 48MB/s)  手机内存卡32g MicroSD存储卡', '正品行货 支持专柜验货 实行三包政策 轻放心购买', '95.00', '/upload/goods_img/手机数码/5db3b874edfa5.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('105', '北京信酷数码商城专柜', '华为/HUAWEI 华为快速充电套装 4.5V/5A充电头+type-c线  华为充电器', '支持p20/mate10/9pro/p10plus荣耀10/v10/note10等机型', '98.00', '/upload/goods_img/手机数码/5db3b87504947.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('106', '北京信酷数码商城专柜', '小米（MI）小米手环2（黑色）智能运动 防水 心率监测 计步器 久坐提醒', '正品行货 全国包邮', '159.00', '/upload/goods_img/手机数码/5db3b875133ab.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('107', '信酷小米专营店', '小米活塞耳机 清新版 黑色 蓝色 入耳式手机耳机 通用耳麦', '小米正品 全国包邮', '45.00', '/upload/goods_img/手机数码/5db3b8751ef2e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('108', '信酷小米专营店', '小米支架式自拍杆 灰色 黑色 蓝牙遥控迷你便携带三脚架多功能', '小米正品 全国包邮', '105.00', '/upload/goods_img/手机数码/5db3b875327b2.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('109', '信酷小米专营店', '小米（MI）方盒子蓝牙音箱2 无线迷你随身户外便携客厅家用小音响', '小米正品 全国包邮', '149.00', '/upload/goods_img/手机数码/5db3b87546807.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('110', '信酷小米专营店', '小米（MI）小米运动蓝牙耳机mini 黑色白色 无线蓝牙入耳式运动耳机', '小米正品 全国包邮', '169.00', '/upload/goods_img/手机数码/5db3b8755a85b.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('111', '信酷小米专营店', '小米（MI）小钢炮2代 无线蓝牙便携音箱', '小米正品 全国包邮', '139.00', '/upload/goods_img/手机数码/5db3b87564c6e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('112', '铁好家居美妆日用百货专营店', '公牛BULL 独立3孔位2USB创意魔方插座 1.5米线GN-UUB122【热卖推荐】', '立体集成结构 小巧轻便 五重保护', '67.00', '/upload/goods_img/手机数码/5db3b87575612.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('116', '邮乐萍乡馆', '南孚 安卓数据线 NF-LM001 小米华为OPPO三星vivo充电器通用', '', '9.90', '/upload/goods_img/手机数码/5db3b875a923e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('117', '铁好家电数码专营店', '公牛BULL 二合一苹果lighting+micro USB数据线GN-J81N【热卖推荐】', 'MFi官方认证，快速充电，抗折断', '69.00', '/upload/goods_img/手机数码/5db3b875b2e80.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('118', '邮乐萍乡馆', '南孚(NANFU)LR6AA聚能环 5号+7号碱性干电池【共4粒装】', '', '9.90', '/upload/goods_img/手机数码/5db3b875be233.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('119', '岳灵生活专营店', '南孚手机充电宝 10000毫安大容量礼盒装NFCT10', '', '169.00', '/upload/goods_img/手机数码/5db3b875cad56.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('120', '邮乐萍乡馆', '南孚(NANFU)LR03AAA聚能环7号电池碱性干电池12粒装儿童玩具遥控器赛车闹钟智能门锁电池', 'AAA干电池持久电力家用', '27.80', '/upload/goods_img/手机数码/5db3b875d3610.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('121', '中国农垦官方旗舰店', '买2份送一份【中国农垦】黑龙江北大荒  支豆浆粉早餐豆浆粉 非转基因大豆 五谷豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d338ebc.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('122', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒支装豆浆粉（醇豆浆、红枣味可选） 非转基因大豆', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3432ce.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('123', '牛牛食品专营店', '(8月新货)蒙牛小真果粒125ml*20盒草莓味果粒酸奶小胖丁迷你装', '8月份的新货,超好喝，儿童，果粒，健康营养，', '22.70', '/upload/goods_img/特色美食/5db3b8d34deb1.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('124', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 支装豆浆粉 麦香甜豆浆粉 28g*10袋', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3651ce.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('125', '禾煜食品旗舰店', '禾煜 黄冰糖418g包  冰糖土冰糖  煲汤食材', '黄冰糖买2送1', '15.00', '/upload/goods_img/特色美食/5db3b8d66e304.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('126', '新农哥旗舰店', '【新农哥】板栗仁108gx4袋  休闲零食小吃', '', '26.90', '/upload/goods_img/特色美食/5db3b8d6832f9.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('127', '新农哥旗舰店', '新农哥 每日坚果 混合果仁 缤纷坚果仁175g*2盒  休闲零食', '缤纷美味 一吃钟情', '59.90', '/upload/goods_img/特色美食/5db3b8d68e2c4.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('128', '众天蜂蜜邮乐农品旗舰店', '众天山花蜂蜜500g', '秦岭深处 百花酿造而成 最受欢迎的蜂蜜 性价比极高！', '19.90', '/upload/goods_img/特色美食/5db3b8d6a2ed1.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('129', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 非转基因大豆 豆浆粉 红枣豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d6ae283.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('130', '考拉小哥专营店', '薛小贱 每日坚果25g*1包', '厂家直供、7种混合、日期新鲜', '1.66', '/upload/goods_img/特色美食/5db3b8d6b8e66.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('131', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂五宝茶 益本茶 男人茶养生茶 草本', '【萃涣堂】五宝益本茶 男人茶买2送1五宝茶男人茶枸杞茶玛咖片黄精男肾茶老公八宝茶养生茶 做性福的男人', '19.00', '/upload/goods_img/特色美食/5db3b8d6c8481.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('132', '萃涣堂蒲公英茶专柜', '【滨州馆】寻味山东新鲜现做手工 滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '寻味山东 新鲜现做手工滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '1.00', '/upload/goods_img/特色美食/5db3b8d6cc302.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('133', '正江食品专营店', '寿全斋  红枣姜茶 姜茶 12g*10条', '', '25.00', '/upload/goods_img/特色美食/5db3b8d6debe7.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('134', '阿坝州理县地方扶贫馆', '四川浓香菜籽油 5升农家非转基因5l纯菜子粮油食用油约10斤植物油', '2019新油，滴滴香浓，四川非转基因纯菜籽油', '66.00', '/upload/goods_img/特色美食/5db3b8d6f246b.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('135', '千岛湖品牌农产品馆', '千岛湖 千岛渔娘 糍粑（4味）200g', '买二赠一 糍粑', '15.00', '/upload/goods_img/特色美食/5db3b8d706ecd.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('136', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '0.50', '/upload/goods_img/特色美食/5db3b8d713dd8.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('137', '果蔻食品专营店', '果蔻 每日坚果B款20g/包简装无礼盒成人儿童孕妇混合果仁坚果零食大礼包', '科学配比  营养美味', '1.39', '/upload/goods_img/特色美食/5db3b8d729985.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('138', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '0.50', '/upload/goods_img/特色美食/5db3b8d736890.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('139', '佳林院红枣旗舰店', '【0.4元/袋佳林院泡茶煮粥煲汤枣圈】山东特产乐陵红枣每袋约12克袋装50袋起拍包邮部分偏远地区除外', '佳林院品牌装，泡茶煮粥枣圈，拼团价0.4元/袋，每袋约12克装，50袋起拍，食用方便，经济实惠！', '0.40', '/upload/goods_img/特色美食/5db3b8d798327.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('140', '果蔻食品专营店', '果蔻 每日坚果25g*1包成人儿童孕妇混合坚果混合果仁小吃零食', '', '1.65', '/upload/goods_img/特色美食/5db3b8d7aa43b.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('141', '萃涣堂蒲公英茶专柜', '【滨州馆】红枣黑糖姜茶大姨妈水姜糖女老姜块生姜姜汁姜汤红糖姜枣茶小袋装25克/袋', '姜味浓,红枣多,顺畅暖暖,效果杠杠“冬吃萝卜夏吃姜。”传统组方真材实料。', '0.90', '/upload/goods_img/特色美食/5db3b8dab8392.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('142', '南阳专区专营店', '南阳西峡现摘金桃黄心猕猴桃15枚 （单枚60g-90g）买一送一 共30枚，合并发一箱', '买一赠一活动', '19.90', '/upload/goods_img/特色美食/5db3b8dac3745.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('143', '果然好口福专柜', '宁 福吉 5斤起拍新疆原味生核桃新货 特产薄皮核桃 坚果炒货休闲零食包邮', '新疆薄皮核桃  送夹子', '9.90', '/upload/goods_img/特色美食/5db3b8daea466.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('144', '刘陶生鲜旗舰店', '刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果2', '', '25.50', '/upload/goods_img/特色美食/5db3b8db3a40e.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('145', '丹东邮政农特产品专营店', '2019年丹东新鲜板栗4斤东北农家生板栗毛栗子现摘栗子应季水果干', '', '19.90', '/upload/goods_img/特色美食/5db3b8db3a7f6.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('146', '果然好口福专柜', '宁福吉 新疆和田大枣煲粥枣500克包邮', '', '6.60', '/upload/goods_img/特色美食/5db3b8db578d5.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('147', '小呆妞旗舰店', '预售小呆妞四川蒲江金艳黄心猕猴桃90-110g中果24枚 72内小时发货', '关于售后：签收24小时内后台申请退款请提供坏果和快递单合照，会根据实际损坏赔付', '27.90', '/upload/goods_img/特色美食/5db3b8db63c28.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('148', '萃涣堂蒲公英茶专柜', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包伴手礼花茶茶包组合玫瑰茉莉绿茶袋泡三', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包', '0.90', '/upload/goods_img/特色美食/5db3b8db71303.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('149', '丹东邮政农特产品专营店', '新鲜现挖番薯红黄心密署农家自种蒸煮粉糯香甜沙地地瓜烤烟署5斤', '', '16.80', '/upload/goods_img/特色美食/5db3b8db862f8.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('150', '川锅壹号旗舰店', '川锅壹号辣白菜228g韩国泡菜下饭菜正宗朝鲜口味拌饭菜版面菜', '酸辣可口 老少皆宜', '5.90', '/upload/goods_img/特色美食/5db3b8dbcdf79.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('151', '福香御旗舰店', '福香御 慢生长2018东北大米雪花米10斤真空包邮色选米', '初霜收割，180天慢生长周期，30天鲜磨直达，大米胚乳含量极为丰富，口感软糯香甜。', '27.90', '/upload/goods_img/特色美食/5db3b8dbdb26c.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('152', '兰州鲜合苑百合特产店专营店', '现包现发100%新鲜正宗兰州市七里河区产兰州鲜百合3年生兰州百合农家甜百合，约16颗百合一斤', '兰州鲜百合，无任何添加剂，宝宝也可以放心食用', '19.90', '/upload/goods_img/特色美食/5db3b8dbe8d2f.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('153', '当季鲜果', '黄金奇异果12枚包邮（中果70-90克，拍2件多送6枚，合并发30枚）金艳黄心猕猴桃新鲜水果', '快递随机，不能指定快递，下单后72小时内发货，下雨天顺延，购买前请阅读售后要求，介意慎拍', '9.90', '/upload/goods_img/特色美食/5db3b8dc0be0c.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('154', '丹东邮政农特产品专营店', '东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田', '东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田', '28.80', '/upload/goods_img/特色美食/5db3b8dc17d77.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('155', '川锅壹号旗舰店', '川锅壹号蟹黄酱拌饭酱秃黄油拌面酱蟹粉酱蟹黄膏酱料即食螃蟹酱', '金脂香软 经典美味', '9.90', '/upload/goods_img/特色美食/5db3b8dc2c59c.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('156', '刘陶生鲜旗舰店', '刘陶 云南昭通丑苹果5斤大果（13-15个）新鲜水果', '拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买', '27.00', '/upload/goods_img/特色美食/5db3b8dc365c6.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('157', '福香御旗舰店', '福香御 大米5kg装2018新米圆粒珍珠米寿司香米秋田小町农家东北大米包邮', '', '29.99', '/upload/goods_img/特色美食/5db3b8de5a091.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('158', '刘陶生鲜旗舰店', '刘陶 云南石林人生果圆果净果5斤（25-35个）大果新鲜水果2', '拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买', '25.00', '/upload/goods_img/特色美食/5db3b8de6ec9e.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('159', '刘陶生鲜旗舰店', '刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果特卖', '', '25.50', '/upload/goods_img/特色美食/5db3b8de7ac09.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('160', '萃涣堂蒲公英茶专柜', '【萃涣堂】 蜜桃乌龙茶  水果茶 三角包共蜜桃白桃乌龙茶袋泡花茶包花', '新品上市!独立三角袋泡茶,携带冲泡更便捷!【萃涣堂】 蜜桃乌龙茶 水果茶 三角包', '0.90', '/upload/goods_img/特色美食/5db3b8de97517.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list` VALUES ('176', '海信电器旗舰店', '海信（Hisense）HZ32E30D 32英寸蓝光高清平板液晶电视机 酒店宾馆卧室推荐', '【海信今日限时特惠-到手价788元！】限量200台！抢完即止！', '749.00', '/upload/goods_img/大家电/5db3b89f51194.jpg', '1572059510', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('178', '吉舜诚商城专柜', '飞利浦（PHILIPS）  19英寸液晶电视机 显示器两用 hdmi高清接口', '19PFF2650', '799.00', '/upload/goods_img/大家电/5db3b89fb14ba.jpg', '1572059510', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('179', '创维集团官方旗舰店', '创维/SKYWORTH 32X3 32英寸窄边非智能老人机蓝光高清节能LED平板液晶电视机工程机', '蓝光高清，经典窄边，节能液晶，简单好用，谁用谁知道，实用耐用款', '799.00', '/upload/goods_img/大家电/5db3b89fc8fa8.jpg', '1572059510', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('210', '好看哒专营店', '防晒衣夏季女蝙蝠袖连帽拉链短款防晒衣', 'FSY-5423', '35.00', '/upload/goods_img/户外服饰/5db3b8b9b16a1.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('211', '好看哒专营店', '防晒衣男士薄款纯色连帽防晒衣', 'FSY-4167', '35.00', '/upload/goods_img/户外服饰/5db3b8b9bbe9c.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('212', '户外途量工厂专卖店', '城徒 户外春夏单层冲锋衣女防晒衣男轻薄防风钓鱼服透气速干外套长袖衫', '', '35.80', '/upload/goods_img/户外服饰/5db3b8ba1b847.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('213', '好看哒专营店', '防晒衣韩版短款薄款连帽长袖防晒衣', 'FSY-5439', '36.00', '/upload/goods_img/户外服饰/5db3b8ba72314.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('214', '好看哒专营店', '防晒衣女中长款涂鸦薄款防晒衣', 'FSY-5282', '36.00', '/upload/goods_img/户外服饰/5db3b8ba99fd5.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('215', '好看哒专营店', '防晒衣女中长款薄款防晒衣', 'FSY-5456', '37.90', '/upload/goods_img/户外服饰/5db3b8baa8e20.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('216', '户外途量工厂专卖店', '秋冬户外男抓绒衣摇粒绒女外套保暖冲锋衣内胆开衫卫衣', '', '39.00', '/upload/goods_img/户外服饰/5db3b8bab267b.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('217', '户外途量工厂专卖店', '户外秋冬季加绒加厚抓绒衣男女摇粒绒保暖抓绒外套开衫冲锋衣内胆', '', '49.00', '/upload/goods_img/户外服饰/5db3b8bae0cb5.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('218', '江门新会馆', '【江门新会馆】caxa断码 两截速干裤女 韩版修身透气徒步快干裤野外登山跑步长裤', '', '50.00', '/upload/goods_img/户外服饰/5db3b8baf06b9.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('219', '宝仕母婴专营店专柜', 'L夏季休闲短裤男宽松5分中裤子男士运动五分裤大码跑步速干沙滩裤', '', '55.00', '/upload/goods_img/户外服饰/5db3b8bb2ba54.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('220', '江门新会馆', '【江门新会馆】caxa修身户外健身速干裤女 快干弹力透气登山大码长裤 弹力户外裤', '', '60.00', '/upload/goods_img/户外服饰/5db3b8bb513ed.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('221', '探路者正江专卖店', '探路者/TOREADt恤女户外夏季快干速干透气运动服TAJG82984', '', '61.00', '/upload/goods_img/户外服饰/5db3b8bb5ac47.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('222', '铁好家居美妆日用百货专营店', '佳钓尼 夏遮阳防晒帽套头面罩透气防紫外线渔夫帽', '', '48.00', '/upload/goods_img/户外服饰/5db3b8bb8e0a3.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('223', '宝仕母婴专营店专柜', '防晒衣男女情侣春夏季防雨风衣超薄透气速干钓鱼防晒服户外皮肤衣MN', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bb9f9e7.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('224', '户外途量工厂专卖店', '城徒 春夏季速干裤男女大码轻薄快干透气户外修身显瘦弹力冲锋裤', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbb3e24.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('225', '宝仕母婴专营店专柜', 'L运动户外夏季速干t恤 男女短袖速干衣快干t恤 吸汗透气', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbe33ff.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('226', '宝仕母婴专营店专柜', 'L健身房教练速干T恤男女 圆领情侣夏季短袖汗衫', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bc1bca2.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('227', '户外途量工厂专卖店', '城徒 冬季正品户外冲锋裤男女抓绒裤保暖防风防水加厚软壳裤登山裤长裤', '', '75.00', '/upload/goods_img/户外服饰/5db3b8bc42dab.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('228', '江门新会馆', '【江门新会馆】caxa修身弹力女款休闲棉裤 户外休闲快干长裤 女士跑步登山健身裤', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bc96997.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('229', '江门新会馆', '【江门新会馆】caxa休闲修身速干裤 透气轻薄运动裤耐磨健身户外裤多袋裤七分裤', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcac92c.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('230', '探路者正江专卖店', '探路者/TOREAD 运动服 短袖户外女运动跑步排汗透气圆领速干T恤TAJF82784', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcc53b9.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('231', '户外途量工厂专卖店', '冲锋裤男户外秋冬防风防水软壳裤女加绒加厚抓绒裤保暖徒步登山裤', '', '79.00', '/upload/goods_img/户外服饰/5db3b8bd362c1.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('232', '探路者正江专卖店', '探路者/TOREADT恤女 夏户外女式超轻透气速干衣圆领T恤短袖KAJG82352', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd44554.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('233', '探路者正江专卖店', '探路者/TOREAD 短袖 18春夏新款户外女式圆领速干透气印花短袖T恤TAJG82939', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd602ab.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('234', '探路者正江专卖店', '探路者/TOREAD夏新款户外运动透气弹力速干女式半袖短袖T恤KAJG82310', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be68f86.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('235', '探路者正江专卖店', '探路者/TOREAD T恤女款 秋季户外短袖女时尚速干透气短袖T恤TAJG82938', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be96a09.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('236', '洋湖轩榭官方旗舰店', '洋湖轩榭 春秋季新款中老年男装连帽冲锋衣爸爸装休闲夹克衫外套男A', '钜惠双十一 感恩惠顾', '126.42', '/upload/goods_img/户外服饰/5db3b8bea6025.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('237', '南城百货专营店', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '158.00', '/upload/goods_img/户外服饰/5db3b8bede68a.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('238', '正江服饰专营店', '包邮韵格NT1021男士紧身训练PRO运动健身跑步长袖弹力速干服纯色衣服', '', '59.00', '/upload/goods_img/户外服饰/5db3b8beeb97d.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('239', '流行饰品运动户外器械', '汤河店 户外冲锋裤男女可脱卸秋冬季加绒加厚保暖软壳防风防水登山滑雪裤', '', '179.00', '/upload/goods_img/户外服饰/5db3b8bf07cf9.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('240', '流行饰品运动户外器械', '汤河店 韩国正品vvc防晒衣女经典薄夏季中长款防晒服户外防紫外线皮肤衣', '', '499.00', '/upload/goods_img/户外服饰/5db3b8bf2bf21.jpg', '1572059516', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('241', '乐颐汇数码专营店', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', '2400万AI高清自拍，麒麟710处理器，炫光渐变色', '989.00', '/upload/goods_img/手机数码/5db3b8700e46c.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('242', '乐颐汇数码专营店', '华为/HUAWEI 畅享9 手机 全网通 4GB+128GB', '6.26英寸珍珠屏 4000mAh大电池', '1099.00', '/upload/goods_img/手机数码/5db3b8731cf7b.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('243', '米果商贸专柜', '折叠式平板电脑支架底座懒人手机支架【颜色随机发货】', '', '9.90', '/upload/goods_img/手机数码/5db3b87337179.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('244', '邮乐韵菲专营店', '（亏本促销）车载手机支架双面吸盘式家居懒人多功能通用可弯曲创意手机支架', '', '1.00', '/upload/goods_img/手机数码/5db3b87345fc4.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('245', '麦尚科技专营店', '手机支架懒人支架卡通创意平板电脑桌面支撑座【款式随机】', '', '9.90', '/upload/goods_img/手机数码/5db3b8734f81e.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('246', '邮乐韵菲专营店', '无线蓝牙耳机迷你超小苹果安卓通用耳机', '送两条充电线+一个收纳盒', '15.90', '/upload/goods_img/手机数码/5db3b873b60d7.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('247', '万品好易购商城', 'XO NB23 八角宝石锌合金数据线', '产品颜色：黑色  白色 宝石外观 不拘一格;  锌合金 更出色；  2.4A极速充电，高效传输文件', '49.00', '/upload/goods_img/手机数码/5db3b873bf931.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('248', '万品好易购商城', 'XO F1 户外Mini蓝牙音箱 经典挂扣 防水 防尘/防摔 抗干扰性强 无线链接 免提通话', '音量调节/音乐播放、暂停/上下曲切换 语音报号/来电铃声/数据输出/直读SD卡', '99.00', '/upload/goods_img/手机数码/5db3b873d7806.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('249', '万品好易购商城', 'XO  PB39 移动电源 8000mAh', '8000mAh大容量 双输出带LED灯  ； 电源保护, 好用更安全； 智能分流 高效输出', '119.00', '/upload/goods_img/手机数码/5db3b8740878f.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('250', '万品好易购商城', 'XO BS8 运动蓝牙耳机源于经典 加以升级 鲨鱼鳍耳翼 舒适牢固', '源于经典 加以升级； 鲨鱼鳍耳翼 舒适牢固 ； 无惧雨水  防水防汗； 蓝牙4.2版本，深度降噪', '169.00', '/upload/goods_img/手机数码/5db3b87419133.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('251', '万品好易购商城', 'XO BS7 运动蓝牙耳机 深度降噪 通话更清晰 轻松操控 随意切换', '强劲的CSR芯片 提升续航能力； 蓝牙4.1版本，深度降噪，通话更清晰； 霍尔磁控开关，智能感应', '199.00', '/upload/goods_img/手机数码/5db3b8742586e.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('252', '万品好易购商城', 'XO A8 蓝牙音箱 智能触控 自由切换 大容量电池 可连续播放约4-6小时 土豪金 星空银 银色', '智能触控，自由切换； 内置1000毫安聚合物电池，全频高清喇叭+低音振膜,可连续播放约4-6小时', '169.00', '/upload/goods_img/手机数码/5db3b874390f2.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('253', '普润家居专营店', 'oppo蓝牙耳机迷你vivo超小隐形运动通用华为无线耳塞超长待机开车', '', '79.00', '/upload/goods_img/手机数码/5db3b874496ae.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('254', '木易生活专柜', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '12.90', '/upload/goods_img/手机数码/5db3b874588e2.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('255', '木易生活专柜', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1*', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1', '15.90', '/upload/goods_img/手机数码/5db3b8746c166.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('256', '北京信酷数码商城专柜', 'iPhone 苹果原装充电器套装/数据线+充电头电源适配器 通用型', '【全国包邮】 充电套装更优惠', '69.00', '/upload/goods_img/手机数码/5db3b874784b9.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('257', '小牛数码家居专柜', '飞利浦/PHILIPS 多功能可伸缩车载手机支架DLK35002', '多功能可伸缩车载手机支架', '68.00', '/upload/goods_img/手机数码/5db3b87484bf4.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('258', '北京信酷数码商城专柜', '苹果 iphone X /XS MAX/XS/XR/钢化膜 全屏全覆盖 手机贴膜', '', '19.00', '/upload/goods_img/手机数码/5db3b87493e28.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('259', '邮乐萍乡馆', '南孚(NANFU)3V纽扣电池两粒 CR2032/CR2025/CR2016锂电池电子汽车钥匙遥控', '奔驰c200l福特 新蒙迪欧 高尔夫7 新马自达昂克赛拉阿特兹 手表奔驰大众汽车钥匙电池', '9.90', '/upload/goods_img/手机数码/5db3b874a670c.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('260', '信酷小米专营店', '小米（MI） 车载充电器快充版 QC3.0 双口输出 智能温度控制 兼容iOS和Android设备', '小米正品 全国包邮', '89.00', '/upload/goods_img/手机数码/5db3b874b8050.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('261', '北京信酷数码商城专柜', '苹果 iPhone6/6S/6Plus/6SPlus/iPhone7/7P防爆钢化玻璃膜高清手机贴膜', '进口AGC玻璃板！超薄钢化玻璃膜！秒杀国产玻璃！', '26.00', '/upload/goods_img/手机数码/5db3b874c207b.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('262', '北京信酷数码商城专柜', 'OPPO手机原装耳机R11/PLUS入耳式线控r11s/r15耳机 白色盒装', '', '38.80', '/upload/goods_img/手机数码/5db3b874d31ef.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('263', '北京信酷数码商城专柜', '华为（HUAWEI）小天鹅无线蓝牙免提通话音箱4.0 便携户外/车载迷你音响AM08', '音·触即发！360°音效技术，音质真实自然，简洁触控操作，支持蓝牙免提通话。', '95.00', '/upload/goods_img/手机数码/5db3b874e280a.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('264', '北京信酷数码商城专柜', '三星 32G内存卡(CLASS10 48MB/s)  手机内存卡32g MicroSD存储卡', '正品行货 支持专柜验货 实行三包政策 轻放心购买', '95.00', '/upload/goods_img/手机数码/5db3b874edfa5.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('265', '北京信酷数码商城专柜', '华为/HUAWEI 华为快速充电套装 4.5V/5A充电头+type-c线  华为充电器', '支持p20/mate10/9pro/p10plus荣耀10/v10/note10等机型', '98.00', '/upload/goods_img/手机数码/5db3b87504947.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('266', '北京信酷数码商城专柜', '小米（MI）小米手环2（黑色）智能运动 防水 心率监测 计步器 久坐提醒', '正品行货 全国包邮', '159.00', '/upload/goods_img/手机数码/5db3b875133ab.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('267', '信酷小米专营店', '小米活塞耳机 清新版 黑色 蓝色 入耳式手机耳机 通用耳麦', '小米正品 全国包邮', '45.00', '/upload/goods_img/手机数码/5db3b8751ef2e.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('268', '信酷小米专营店', '小米支架式自拍杆 灰色 黑色 蓝牙遥控迷你便携带三脚架多功能', '小米正品 全国包邮', '105.00', '/upload/goods_img/手机数码/5db3b875327b2.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('269', '信酷小米专营店', '小米（MI）方盒子蓝牙音箱2 无线迷你随身户外便携客厅家用小音响', '小米正品 全国包邮', '149.00', '/upload/goods_img/手机数码/5db3b87546807.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('270', '信酷小米专营店', '小米（MI）小米运动蓝牙耳机mini 黑色白色 无线蓝牙入耳式运动耳机', '小米正品 全国包邮', '169.00', '/upload/goods_img/手机数码/5db3b8755a85b.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('271', '信酷小米专营店', '小米（MI）小钢炮2代 无线蓝牙便携音箱', '小米正品 全国包邮', '139.00', '/upload/goods_img/手机数码/5db3b87564c6e.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('272', '铁好家居美妆日用百货专营店', '公牛BULL 独立3孔位2USB创意魔方插座 1.5米线GN-UUB122【热卖推荐】', '立体集成结构 小巧轻便 五重保护', '67.00', '/upload/goods_img/手机数码/5db3b87575612.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('276', '邮乐萍乡馆', '南孚 安卓数据线 NF-LM001 小米华为OPPO三星vivo充电器通用', '', '9.90', '/upload/goods_img/手机数码/5db3b875a923e.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('277', '铁好家电数码专营店', '公牛BULL 二合一苹果lighting+micro USB数据线GN-J81N【热卖推荐】', 'MFi官方认证，快速充电，抗折断', '69.00', '/upload/goods_img/手机数码/5db3b875b2e80.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('278', '邮乐萍乡馆', '南孚(NANFU)LR6AA聚能环 5号+7号碱性干电池【共4粒装】', '', '9.90', '/upload/goods_img/手机数码/5db3b875be233.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('279', '岳灵生活专营店', '南孚手机充电宝 10000毫安大容量礼盒装NFCT10', '', '169.00', '/upload/goods_img/手机数码/5db3b875cad56.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('280', '邮乐萍乡馆', '南孚(NANFU)LR03AAA聚能环7号电池碱性干电池12粒装儿童玩具遥控器赛车闹钟智能门锁电池', 'AAA干电池持久电力家用', '27.80', '/upload/goods_img/手机数码/5db3b875d3610.jpg', '1572059524', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('281', '中国农垦官方旗舰店', '买2份送一份【中国农垦】黑龙江北大荒  支豆浆粉早餐豆浆粉 非转基因大豆 五谷豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d338ebc.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('282', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒支装豆浆粉（醇豆浆、红枣味可选） 非转基因大豆', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3432ce.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('283', '牛牛食品专营店', '(8月新货)蒙牛小真果粒125ml*20盒草莓味果粒酸奶小胖丁迷你装', '8月份的新货,超好喝，儿童，果粒，健康营养，', '22.70', '/upload/goods_img/特色美食/5db3b8d34deb1.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('284', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 支装豆浆粉 麦香甜豆浆粉 28g*10袋', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3651ce.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('285', '禾煜食品旗舰店', '禾煜 黄冰糖418g包  冰糖土冰糖  煲汤食材', '黄冰糖买2送1', '15.00', '/upload/goods_img/特色美食/5db3b8d66e304.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('286', '新农哥旗舰店', '【新农哥】板栗仁108gx4袋  休闲零食小吃', '', '26.90', '/upload/goods_img/特色美食/5db3b8d6832f9.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('287', '新农哥旗舰店', '新农哥 每日坚果 混合果仁 缤纷坚果仁175g*2盒  休闲零食', '缤纷美味 一吃钟情', '59.90', '/upload/goods_img/特色美食/5db3b8d68e2c4.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('288', '众天蜂蜜邮乐农品旗舰店', '众天山花蜂蜜500g', '秦岭深处 百花酿造而成 最受欢迎的蜂蜜 性价比极高！', '19.90', '/upload/goods_img/特色美食/5db3b8d6a2ed1.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('289', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 非转基因大豆 豆浆粉 红枣豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d6ae283.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('290', '考拉小哥专营店', '薛小贱 每日坚果25g*1包', '厂家直供、7种混合、日期新鲜', '1.66', '/upload/goods_img/特色美食/5db3b8d6b8e66.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('291', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂五宝茶 益本茶 男人茶养生茶 草本', '【萃涣堂】五宝益本茶 男人茶买2送1五宝茶男人茶枸杞茶玛咖片黄精男肾茶老公八宝茶养生茶 做性福的男人', '19.00', '/upload/goods_img/特色美食/5db3b8d6c8481.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('292', '萃涣堂蒲公英茶专柜', '【滨州馆】寻味山东新鲜现做手工 滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '寻味山东 新鲜现做手工滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '1.00', '/upload/goods_img/特色美食/5db3b8d6cc302.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('293', '正江食品专营店', '寿全斋  红枣姜茶 姜茶 12g*10条', '', '25.00', '/upload/goods_img/特色美食/5db3b8d6debe7.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('294', '阿坝州理县地方扶贫馆', '四川浓香菜籽油 5升农家非转基因5l纯菜子粮油食用油约10斤植物油', '2019新油，滴滴香浓，四川非转基因纯菜籽油', '66.00', '/upload/goods_img/特色美食/5db3b8d6f246b.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('295', '千岛湖品牌农产品馆', '千岛湖 千岛渔娘 糍粑（4味）200g', '买二赠一 糍粑', '15.00', '/upload/goods_img/特色美食/5db3b8d706ecd.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('296', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '0.50', '/upload/goods_img/特色美食/5db3b8d713dd8.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('297', '果蔻食品专营店', '果蔻 每日坚果B款20g/包简装无礼盒成人儿童孕妇混合果仁坚果零食大礼包', '科学配比  营养美味', '1.39', '/upload/goods_img/特色美食/5db3b8d729985.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('298', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '0.50', '/upload/goods_img/特色美食/5db3b8d736890.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('299', '佳林院红枣旗舰店', '【0.4元/袋佳林院泡茶煮粥煲汤枣圈】山东特产乐陵红枣每袋约12克袋装50袋起拍包邮部分偏远地区除外', '佳林院品牌装，泡茶煮粥枣圈，拼团价0.4元/袋，每袋约12克装，50袋起拍，食用方便，经济实惠！', '0.40', '/upload/goods_img/特色美食/5db3b8d798327.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('300', '果蔻食品专营店', '果蔻 每日坚果25g*1包成人儿童孕妇混合坚果混合果仁小吃零食', '', '1.65', '/upload/goods_img/特色美食/5db3b8d7aa43b.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('301', '萃涣堂蒲公英茶专柜', '【滨州馆】红枣黑糖姜茶大姨妈水姜糖女老姜块生姜姜汁姜汤红糖姜枣茶小袋装25克/袋', '姜味浓,红枣多,顺畅暖暖,效果杠杠“冬吃萝卜夏吃姜。”传统组方真材实料。', '0.90', '/upload/goods_img/特色美食/5db3b8dab8392.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('302', '南阳专区专营店', '南阳西峡现摘金桃黄心猕猴桃15枚 （单枚60g-90g）买一送一 共30枚，合并发一箱', '买一赠一活动', '19.90', '/upload/goods_img/特色美食/5db3b8dac3745.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('303', '果然好口福专柜', '宁 福吉 5斤起拍新疆原味生核桃新货 特产薄皮核桃 坚果炒货休闲零食包邮', '新疆薄皮核桃  送夹子', '9.90', '/upload/goods_img/特色美食/5db3b8daea466.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('304', '刘陶生鲜旗舰店', '刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果2', '', '25.50', '/upload/goods_img/特色美食/5db3b8db3a40e.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('305', '丹东邮政农特产品专营店', '2019年丹东新鲜板栗4斤东北农家生板栗毛栗子现摘栗子应季水果干', '', '19.90', '/upload/goods_img/特色美食/5db3b8db3a7f6.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('306', '果然好口福专柜', '宁福吉 新疆和田大枣煲粥枣500克包邮', '', '6.60', '/upload/goods_img/特色美食/5db3b8db578d5.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('307', '小呆妞旗舰店', '预售小呆妞四川蒲江金艳黄心猕猴桃90-110g中果24枚 72内小时发货', '关于售后：签收24小时内后台申请退款请提供坏果和快递单合照，会根据实际损坏赔付', '27.90', '/upload/goods_img/特色美食/5db3b8db63c28.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('308', '萃涣堂蒲公英茶专柜', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包伴手礼花茶茶包组合玫瑰茉莉绿茶袋泡三', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包', '0.90', '/upload/goods_img/特色美食/5db3b8db71303.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('309', '丹东邮政农特产品专营店', '新鲜现挖番薯红黄心密署农家自种蒸煮粉糯香甜沙地地瓜烤烟署5斤', '', '16.80', '/upload/goods_img/特色美食/5db3b8db862f8.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('310', '川锅壹号旗舰店', '川锅壹号辣白菜228g韩国泡菜下饭菜正宗朝鲜口味拌饭菜版面菜', '酸辣可口 老少皆宜', '5.90', '/upload/goods_img/特色美食/5db3b8dbcdf79.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('311', '福香御旗舰店', '福香御 慢生长2018东北大米雪花米10斤真空包邮色选米', '初霜收割，180天慢生长周期，30天鲜磨直达，大米胚乳含量极为丰富，口感软糯香甜。', '27.90', '/upload/goods_img/特色美食/5db3b8dbdb26c.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('312', '兰州鲜合苑百合特产店专营店', '现包现发100%新鲜正宗兰州市七里河区产兰州鲜百合3年生兰州百合农家甜百合，约16颗百合一斤', '兰州鲜百合，无任何添加剂，宝宝也可以放心食用', '19.90', '/upload/goods_img/特色美食/5db3b8dbe8d2f.jpg', '1572059535', '0', '2');
INSERT INTO `xy_goods_list` VALUES ('376', '户外途量工厂专卖店', '秋冬户外男抓绒衣摇粒绒女外套保暖冲锋衣内胆开衫卫衣', '', '39.00', '/upload/goods_img/户外服饰/5db3b8bab267b.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('377', '户外途量工厂专卖店', '户外秋冬季加绒加厚抓绒衣男女摇粒绒保暖抓绒外套开衫冲锋衣内胆', '', '49.00', '/upload/goods_img/户外服饰/5db3b8bae0cb5.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('378', '江门新会馆', '【江门新会馆】caxa断码 两截速干裤女 韩版修身透气徒步快干裤野外登山跑步长裤', '', '50.00', '/upload/goods_img/户外服饰/5db3b8baf06b9.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('379', '宝仕母婴专营店专柜', 'L夏季休闲短裤男宽松5分中裤子男士运动五分裤大码跑步速干沙滩裤', '', '55.00', '/upload/goods_img/户外服饰/5db3b8bb2ba54.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('381', '探路者正江专卖店', '探路者/TOREADt恤女户外夏季快干速干透气运动服TAJG82984', '', '61.00', '/upload/goods_img/户外服饰/5db3b8bb5ac47.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('382', '铁好家居美妆日用百货专营店', '佳钓尼 夏遮阳防晒帽套头面罩透气防紫外线渔夫帽', '', '48.00', '/upload/goods_img/户外服饰/5db3b8bb8e0a3.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('383', '宝仕母婴专营店专柜', '防晒衣男女情侣春夏季防雨风衣超薄透气速干钓鱼防晒服户外皮肤衣MN', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bb9f9e7.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('384', '户外途量工厂专卖店', '城徒 春夏季速干裤男女大码轻薄快干透气户外修身显瘦弹力冲锋裤', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbb3e24.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('385', '宝仕母婴专营店专柜', 'L运动户外夏季速干t恤 男女短袖速干衣快干t恤 吸汗透气', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbe33ff.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('386', '宝仕母婴专营店专柜', 'L健身房教练速干T恤男女 圆领情侣夏季短袖汗衫', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bc1bca2.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('387', '户外途量工厂专卖店', '城徒 冬季正品户外冲锋裤男女抓绒裤保暖防风防水加厚软壳裤登山裤长裤', '', '75.00', '/upload/goods_img/户外服饰/5db3b8bc42dab.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('389', '江门新会馆', '【江门新会馆】caxa休闲修身速干裤 透气轻薄运动裤耐磨健身户外裤多袋裤七分裤', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcac92c.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('390', '探路者正江专卖店', '探路者/TOREAD 运动服 短袖户外女运动跑步排汗透气圆领速干T恤TAJF82784', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcc53b9.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('391', '户外途量工厂专卖店', '冲锋裤男户外秋冬防风防水软壳裤女加绒加厚抓绒裤保暖徒步登山裤', '', '79.00', '/upload/goods_img/户外服饰/5db3b8bd362c1.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('392', '探路者正江专卖店', '探路者/TOREADT恤女 夏户外女式超轻透气速干衣圆领T恤短袖KAJG82352', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd44554.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('393', '探路者正江专卖店', '探路者/TOREAD 短袖 18春夏新款户外女式圆领速干透气印花短袖T恤TAJG82939', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd602ab.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('394', '探路者正江专卖店', '探路者/TOREAD夏新款户外运动透气弹力速干女式半袖短袖T恤KAJG82310', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be68f86.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('395', '探路者正江专卖店', '探路者/TOREAD T恤女款 秋季户外短袖女时尚速干透气短袖T恤TAJG82938', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be96a09.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('396', '洋湖轩榭官方旗舰店', '洋湖轩榭 春秋季新款中老年男装连帽冲锋衣爸爸装休闲夹克衫外套男A', '钜惠双十一 感恩惠顾', '126.42', '/upload/goods_img/户外服饰/5db3b8bea6025.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('397', '南城百货专营店', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '158.00', '/upload/goods_img/户外服饰/5db3b8bede68a.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('398', '正江服饰专营店', '包邮韵格NT1021男士紧身训练PRO运动健身跑步长袖弹力速干服纯色衣服', '', '59.00', '/upload/goods_img/户外服饰/5db3b8beeb97d.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('399', '流行饰品运动户外器械', '汤河店 户外冲锋裤男女可脱卸秋冬季加绒加厚保暖软壳防风防水登山滑雪裤', '', '179.00', '/upload/goods_img/户外服饰/5db3b8bf07cf9.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('400', '流行饰品运动户外器械', '汤河店 韩国正品vvc防晒衣女经典薄夏季中长款防晒服户外防紫外线皮肤衣', '', '499.00', '/upload/goods_img/户外服饰/5db3b8bf2bf21.jpg', '1572059516', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('401', '乐颐汇数码专营店', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', '2400万AI高清自拍，麒麟710处理器，炫光渐变色', '989.00', '/upload/goods_img/手机数码/5db3b8700e46c.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('402', '乐颐汇数码专营店', '华为/HUAWEI 畅享9 手机 全网通 4GB+128GB', '6.26英寸珍珠屏 4000mAh大电池', '1099.00', '/upload/goods_img/手机数码/5db3b8731cf7b.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('403', '米果商贸专柜', '折叠式平板电脑支架底座懒人手机支架【颜色随机发货】', '', '9.90', '/upload/goods_img/手机数码/5db3b87337179.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('404', '邮乐韵菲专营店', '（亏本促销）车载手机支架双面吸盘式家居懒人多功能通用可弯曲创意手机支架', '', '1.00', '/upload/goods_img/手机数码/5db3b87345fc4.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('405', '麦尚科技专营店', '手机支架懒人支架卡通创意平板电脑桌面支撑座【款式随机】', '', '9.90', '/upload/goods_img/手机数码/5db3b8734f81e.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('406', '邮乐韵菲专营店', '无线蓝牙耳机迷你超小苹果安卓通用耳机', '送两条充电线+一个收纳盒', '15.90', '/upload/goods_img/手机数码/5db3b873b60d7.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('407', '万品好易购商城', 'XO NB23 八角宝石锌合金数据线', '产品颜色：黑色  白色 宝石外观 不拘一格;  锌合金 更出色；  2.4A极速充电，高效传输文件', '49.00', '/upload/goods_img/手机数码/5db3b873bf931.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('408', '万品好易购商城', 'XO F1 户外Mini蓝牙音箱 经典挂扣 防水 防尘/防摔 抗干扰性强 无线链接 免提通话', '音量调节/音乐播放、暂停/上下曲切换 语音报号/来电铃声/数据输出/直读SD卡', '99.00', '/upload/goods_img/手机数码/5db3b873d7806.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('409', '万品好易购商城', 'XO  PB39 移动电源 8000mAh', '8000mAh大容量 双输出带LED灯  ； 电源保护, 好用更安全； 智能分流 高效输出', '119.00', '/upload/goods_img/手机数码/5db3b8740878f.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('410', '万品好易购商城', 'XO BS8 运动蓝牙耳机源于经典 加以升级 鲨鱼鳍耳翼 舒适牢固', '源于经典 加以升级； 鲨鱼鳍耳翼 舒适牢固 ； 无惧雨水  防水防汗； 蓝牙4.2版本，深度降噪', '169.00', '/upload/goods_img/手机数码/5db3b87419133.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('411', '万品好易购商城', 'XO BS7 运动蓝牙耳机 深度降噪 通话更清晰 轻松操控 随意切换', '强劲的CSR芯片 提升续航能力； 蓝牙4.1版本，深度降噪，通话更清晰； 霍尔磁控开关，智能感应', '199.00', '/upload/goods_img/手机数码/5db3b8742586e.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('412', '万品好易购商城', 'XO A8 蓝牙音箱 智能触控 自由切换 大容量电池 可连续播放约4-6小时 土豪金 星空银 银色', '智能触控，自由切换； 内置1000毫安聚合物电池，全频高清喇叭+低音振膜,可连续播放约4-6小时', '169.00', '/upload/goods_img/手机数码/5db3b874390f2.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('413', '普润家居专营店', 'oppo蓝牙耳机迷你vivo超小隐形运动通用华为无线耳塞超长待机开车', '', '79.00', '/upload/goods_img/手机数码/5db3b874496ae.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('414', '木易生活专柜', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '12.90', '/upload/goods_img/手机数码/5db3b874588e2.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('415', '木易生活专柜', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1*', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1', '15.90', '/upload/goods_img/手机数码/5db3b8746c166.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('416', '北京信酷数码商城专柜', 'iPhone 苹果原装充电器套装/数据线+充电头电源适配器 通用型', '【全国包邮】 充电套装更优惠', '69.00', '/upload/goods_img/手机数码/5db3b874784b9.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('417', '小牛数码家居专柜', '飞利浦/PHILIPS 多功能可伸缩车载手机支架DLK35002', '多功能可伸缩车载手机支架', '68.00', '/upload/goods_img/手机数码/5db3b87484bf4.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('418', '北京信酷数码商城专柜', '苹果 iphone X /XS MAX/XS/XR/钢化膜 全屏全覆盖 手机贴膜', '', '19.00', '/upload/goods_img/手机数码/5db3b87493e28.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('419', '邮乐萍乡馆', '南孚(NANFU)3V纽扣电池两粒 CR2032/CR2025/CR2016锂电池电子汽车钥匙遥控', '奔驰c200l福特 新蒙迪欧 高尔夫7 新马自达昂克赛拉阿特兹 手表奔驰大众汽车钥匙电池', '9.90', '/upload/goods_img/手机数码/5db3b874a670c.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('420', '信酷小米专营店', '小米（MI） 车载充电器快充版 QC3.0 双口输出 智能温度控制 兼容iOS和Android设备', '小米正品 全国包邮', '89.00', '/upload/goods_img/手机数码/5db3b874b8050.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('421', '北京信酷数码商城专柜', '苹果 iPhone6/6S/6Plus/6SPlus/iPhone7/7P防爆钢化玻璃膜高清手机贴膜', '进口AGC玻璃板！超薄钢化玻璃膜！秒杀国产玻璃！', '26.00', '/upload/goods_img/手机数码/5db3b874c207b.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('422', '北京信酷数码商城专柜', 'OPPO手机原装耳机R11/PLUS入耳式线控r11s/r15耳机 白色盒装', '', '38.80', '/upload/goods_img/手机数码/5db3b874d31ef.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('423', '北京信酷数码商城专柜', '华为（HUAWEI）小天鹅无线蓝牙免提通话音箱4.0 便携户外/车载迷你音响AM08', '音·触即发！360°音效技术，音质真实自然，简洁触控操作，支持蓝牙免提通话。', '95.00', '/upload/goods_img/手机数码/5db3b874e280a.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('424', '北京信酷数码商城专柜', '三星 32G内存卡(CLASS10 48MB/s)  手机内存卡32g MicroSD存储卡', '正品行货 支持专柜验货 实行三包政策 轻放心购买', '95.00', '/upload/goods_img/手机数码/5db3b874edfa5.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('425', '北京信酷数码商城专柜', '华为/HUAWEI 华为快速充电套装 4.5V/5A充电头+type-c线  华为充电器', '支持p20/mate10/9pro/p10plus荣耀10/v10/note10等机型', '98.00', '/upload/goods_img/手机数码/5db3b87504947.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('426', '北京信酷数码商城专柜', '小米（MI）小米手环2（黑色）智能运动 防水 心率监测 计步器 久坐提醒', '正品行货 全国包邮', '159.00', '/upload/goods_img/手机数码/5db3b875133ab.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('427', '信酷小米专营店', '小米活塞耳机 清新版 黑色 蓝色 入耳式手机耳机 通用耳麦', '小米正品 全国包邮', '45.00', '/upload/goods_img/手机数码/5db3b8751ef2e.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('428', '信酷小米专营店', '小米支架式自拍杆 灰色 黑色 蓝牙遥控迷你便携带三脚架多功能', '小米正品 全国包邮', '105.00', '/upload/goods_img/手机数码/5db3b875327b2.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('429', '信酷小米专营店', '小米（MI）方盒子蓝牙音箱2 无线迷你随身户外便携客厅家用小音响', '小米正品 全国包邮', '149.00', '/upload/goods_img/手机数码/5db3b87546807.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('430', '信酷小米专营店', '小米（MI）小米运动蓝牙耳机mini 黑色白色 无线蓝牙入耳式运动耳机', '小米正品 全国包邮', '169.00', '/upload/goods_img/手机数码/5db3b8755a85b.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('431', '信酷小米专营店', '小米（MI）小钢炮2代 无线蓝牙便携音箱', '小米正品 全国包邮', '139.00', '/upload/goods_img/手机数码/5db3b87564c6e.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('432', '铁好家居美妆日用百货专营店', '公牛BULL 独立3孔位2USB创意魔方插座 1.5米线GN-UUB122【热卖推荐】', '立体集成结构 小巧轻便 五重保护', '67.00', '/upload/goods_img/手机数码/5db3b87575612.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('436', '邮乐萍乡馆', '南孚 安卓数据线 NF-LM001 小米华为OPPO三星vivo充电器通用', '', '9.90', '/upload/goods_img/手机数码/5db3b875a923e.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('437', '铁好家电数码专营店', '公牛BULL 二合一苹果lighting+micro USB数据线GN-J81N【热卖推荐】', 'MFi官方认证，快速充电，抗折断', '69.00', '/upload/goods_img/手机数码/5db3b875b2e80.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('438', '邮乐萍乡馆', '南孚(NANFU)LR6AA聚能环 5号+7号碱性干电池【共4粒装】', '', '9.90', '/upload/goods_img/手机数码/5db3b875be233.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('439', '岳灵生活专营店', '南孚手机充电宝 10000毫安大容量礼盒装NFCT10', '', '169.00', '/upload/goods_img/手机数码/5db3b875cad56.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('440', '邮乐萍乡馆', '南孚(NANFU)LR03AAA聚能环7号电池碱性干电池12粒装儿童玩具遥控器赛车闹钟智能门锁电池', 'AAA干电池持久电力家用', '27.80', '/upload/goods_img/手机数码/5db3b875d3610.jpg', '1572059524', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('441', '中国农垦官方旗舰店', '买2份送一份【中国农垦】黑龙江北大荒  支豆浆粉早餐豆浆粉 非转基因大豆 五谷豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d338ebc.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('442', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒支装豆浆粉（醇豆浆、红枣味可选） 非转基因大豆', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3432ce.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('443', '牛牛食品专营店', '(8月新货)蒙牛小真果粒125ml*20盒草莓味果粒酸奶小胖丁迷你装', '8月份的新货,超好喝，儿童，果粒，健康营养，', '22.70', '/upload/goods_img/特色美食/5db3b8d34deb1.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('444', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 支装豆浆粉 麦香甜豆浆粉 28g*10袋', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3651ce.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('445', '禾煜食品旗舰店', '禾煜 黄冰糖418g包  冰糖土冰糖  煲汤食材', '黄冰糖买2送1', '15.00', '/upload/goods_img/特色美食/5db3b8d66e304.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('446', '新农哥旗舰店', '【新农哥】板栗仁108gx4袋  休闲零食小吃', '', '26.90', '/upload/goods_img/特色美食/5db3b8d6832f9.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('447', '新农哥旗舰店', '新农哥 每日坚果 混合果仁 缤纷坚果仁175g*2盒  休闲零食', '缤纷美味 一吃钟情', '59.90', '/upload/goods_img/特色美食/5db3b8d68e2c4.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('448', '众天蜂蜜邮乐农品旗舰店', '众天山花蜂蜜500g', '秦岭深处 百花酿造而成 最受欢迎的蜂蜜 性价比极高！', '19.90', '/upload/goods_img/特色美食/5db3b8d6a2ed1.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('449', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 非转基因大豆 豆浆粉 红枣豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d6ae283.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('450', '考拉小哥专营店', '薛小贱 每日坚果25g*1包', '厂家直供、7种混合、日期新鲜', '1.66', '/upload/goods_img/特色美食/5db3b8d6b8e66.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('451', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂五宝茶 益本茶 男人茶养生茶 草本', '【萃涣堂】五宝益本茶 男人茶买2送1五宝茶男人茶枸杞茶玛咖片黄精男肾茶老公八宝茶养生茶 做性福的男人', '19.00', '/upload/goods_img/特色美食/5db3b8d6c8481.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('452', '萃涣堂蒲公英茶专柜', '【滨州馆】寻味山东新鲜现做手工 滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '寻味山东 新鲜现做手工滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '1.00', '/upload/goods_img/特色美食/5db3b8d6cc302.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('453', '正江食品专营店', '寿全斋  红枣姜茶 姜茶 12g*10条', '', '25.00', '/upload/goods_img/特色美食/5db3b8d6debe7.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('454', '阿坝州理县地方扶贫馆', '四川浓香菜籽油 5升农家非转基因5l纯菜子粮油食用油约10斤植物油', '2019新油，滴滴香浓，四川非转基因纯菜籽油', '66.00', '/upload/goods_img/特色美食/5db3b8d6f246b.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('455', '千岛湖品牌农产品馆', '千岛湖 千岛渔娘 糍粑（4味）200g', '买二赠一 糍粑', '15.00', '/upload/goods_img/特色美食/5db3b8d706ecd.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('456', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '0.50', '/upload/goods_img/特色美食/5db3b8d713dd8.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('457', '果蔻食品专营店', '果蔻 每日坚果B款20g/包简装无礼盒成人儿童孕妇混合果仁坚果零食大礼包', '科学配比  营养美味', '1.39', '/upload/goods_img/特色美食/5db3b8d729985.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('458', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '0.50', '/upload/goods_img/特色美食/5db3b8d736890.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('459', '佳林院红枣旗舰店', '【0.4元/袋佳林院泡茶煮粥煲汤枣圈】山东特产乐陵红枣每袋约12克袋装50袋起拍包邮部分偏远地区除外', '佳林院品牌装，泡茶煮粥枣圈，拼团价0.4元/袋，每袋约12克装，50袋起拍，食用方便，经济实惠！', '0.40', '/upload/goods_img/特色美食/5db3b8d798327.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('460', '果蔻食品专营店', '果蔻 每日坚果25g*1包成人儿童孕妇混合坚果混合果仁小吃零食', '', '1.65', '/upload/goods_img/特色美食/5db3b8d7aa43b.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('461', '萃涣堂蒲公英茶专柜', '【滨州馆】红枣黑糖姜茶大姨妈水姜糖女老姜块生姜姜汁姜汤红糖姜枣茶小袋装25克/袋', '姜味浓,红枣多,顺畅暖暖,效果杠杠“冬吃萝卜夏吃姜。”传统组方真材实料。', '0.90', '/upload/goods_img/特色美食/5db3b8dab8392.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('462', '南阳专区专营店', '南阳西峡现摘金桃黄心猕猴桃15枚 （单枚60g-90g）买一送一 共30枚，合并发一箱', '买一赠一活动', '19.90', '/upload/goods_img/特色美食/5db3b8dac3745.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('463', '果然好口福专柜', '宁 福吉 5斤起拍新疆原味生核桃新货 特产薄皮核桃 坚果炒货休闲零食包邮', '新疆薄皮核桃  送夹子', '9.90', '/upload/goods_img/特色美食/5db3b8daea466.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('464', '刘陶生鲜旗舰店', '刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果2', '', '25.50', '/upload/goods_img/特色美食/5db3b8db3a40e.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('465', '丹东邮政农特产品专营店', '2019年丹东新鲜板栗4斤东北农家生板栗毛栗子现摘栗子应季水果干', '', '19.90', '/upload/goods_img/特色美食/5db3b8db3a7f6.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('466', '果然好口福专柜', '宁福吉 新疆和田大枣煲粥枣500克包邮', '', '6.60', '/upload/goods_img/特色美食/5db3b8db578d5.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('467', '小呆妞旗舰店', '预售小呆妞四川蒲江金艳黄心猕猴桃90-110g中果24枚 72内小时发货', '关于售后：签收24小时内后台申请退款请提供坏果和快递单合照，会根据实际损坏赔付', '27.90', '/upload/goods_img/特色美食/5db3b8db63c28.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('468', '萃涣堂蒲公英茶专柜', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包伴手礼花茶茶包组合玫瑰茉莉绿茶袋泡三', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包', '0.90', '/upload/goods_img/特色美食/5db3b8db71303.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('469', '丹东邮政农特产品专营店', '新鲜现挖番薯红黄心密署农家自种蒸煮粉糯香甜沙地地瓜烤烟署5斤', '', '16.80', '/upload/goods_img/特色美食/5db3b8db862f8.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('470', '川锅壹号旗舰店', '川锅壹号辣白菜228g韩国泡菜下饭菜正宗朝鲜口味拌饭菜版面菜', '酸辣可口 老少皆宜', '5.90', '/upload/goods_img/特色美食/5db3b8dbcdf79.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('471', '福香御旗舰店', '福香御 慢生长2018东北大米雪花米10斤真空包邮色选米', '初霜收割，180天慢生长周期，30天鲜磨直达，大米胚乳含量极为丰富，口感软糯香甜。', '27.90', '/upload/goods_img/特色美食/5db3b8dbdb26c.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('472', '兰州鲜合苑百合特产店专营店', '现包现发100%新鲜正宗兰州市七里河区产兰州鲜百合3年生兰州百合农家甜百合，约16颗百合一斤', '兰州鲜百合，无任何添加剂，宝宝也可以放心食用', '19.90', '/upload/goods_img/特色美食/5db3b8dbe8d2f.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('473', '当季鲜果', '黄金奇异果12枚包邮（中果70-90克，拍2件多送6枚，合并发30枚）金艳黄心猕猴桃新鲜水果', '快递随机，不能指定快递，下单后72小时内发货，下雨天顺延，购买前请阅读售后要求，介意慎拍', '9.90', '/upload/goods_img/特色美食/5db3b8dc0be0c.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('474', '丹东邮政农特产品专营店', '东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田', '东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田', '28.80', '/upload/goods_img/特色美食/5db3b8dc17d77.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('475', '川锅壹号旗舰店', '川锅壹号蟹黄酱拌饭酱秃黄油拌面酱蟹粉酱蟹黄膏酱料即食螃蟹酱', '金脂香软 经典美味', '9.90', '/upload/goods_img/特色美食/5db3b8dc2c59c.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('476', '刘陶生鲜旗舰店', '刘陶 云南昭通丑苹果5斤大果（13-15个）新鲜水果', '拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买', '27.00', '/upload/goods_img/特色美食/5db3b8dc365c6.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('477', '福香御旗舰店', '福香御 大米5kg装2018新米圆粒珍珠米寿司香米秋田小町农家东北大米包邮', '', '29.99', '/upload/goods_img/特色美食/5db3b8de5a091.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('478', '刘陶生鲜旗舰店', '刘陶 云南石林人生果圆果净果5斤（25-35个）大果新鲜水果2', '拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买', '25.00', '/upload/goods_img/特色美食/5db3b8de6ec9e.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('479', '刘陶生鲜旗舰店', '刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果特卖', '', '25.50', '/upload/goods_img/特色美食/5db3b8de7ac09.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('480', '萃涣堂蒲公英茶专柜', '【萃涣堂】 蜜桃乌龙茶  水果茶 三角包共蜜桃白桃乌龙茶袋泡花茶包花', '新品上市!独立三角袋泡茶,携带冲泡更便捷!【萃涣堂】 蜜桃乌龙茶 水果茶 三角包', '0.90', '/upload/goods_img/特色美食/5db3b8de97517.jpg', '1572059535', '0', '3');
INSERT INTO `xy_goods_list` VALUES ('497', '邮滋味如皋馆专柜', '邮乐特卖：庭美家用消毒柜    型号：YTP-280    如皋免费送货上门，南通包邮，华东地区配送', '庭美消毒柜，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238', '755.00', '/upload/goods_img/大家电/5db3b89f5ec57.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('498', '吉舜诚商城专柜', '飞利浦（PHILIPS）  19英寸液晶电视机 显示器两用 hdmi高清接口', '19PFF2650', '799.00', '/upload/goods_img/大家电/5db3b89fb14ba.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('499', '创维集团官方旗舰店', '创维/SKYWORTH 32X3 32英寸窄边非智能老人机蓝光高清节能LED平板液晶电视机工程机', '蓝光高清，经典窄边，节能液晶，简单好用，谁用谁知道，实用耐用款', '799.00', '/upload/goods_img/大家电/5db3b89fc8fa8.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('500', '吉舜诚商城专柜', '飞利浦（PHILIPS）22英寸LED高清液晶平板电视机含底座 黑色', '22PFF2650/T3', '899.00', '/upload/goods_img/大家电/5db3b89fd917b.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('501', '创维集团官方旗舰店', '创维/SKYWORTH 32X6 32英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机', '超值钜惠，高清智能电视，WIFI，酷开系统，10核处理器', '899.00', '/upload/goods_img/大家电/5db3b89fe6086.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('502', '海信电器旗舰店', '海信 (Hisense) HZ32E35A 32英寸AI智能WIFI 轻薄金属 卧室神器高清电视机', '', '899.00', '/upload/goods_img/大家电/5db3b8a0004c2.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('503', '邮滋味如皋馆专柜', '创维邮乐特卖： 32寸液晶电视机，型号：32E381S   如皋免费送货上门，南通包邮，华东地区配货', '创维液晶电视大品牌，夏季特惠；每月现场有特惠活动', '899.00', '/upload/goods_img/大家电/5db3b8a01be30.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('504', '琥麟电器专柜', '海信 XQB60-H3568 6公斤全自动波轮洗衣机', '', '749.00', '/upload/goods_img/大家电/5db3b8a0279b3.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('505', '邮滋味如皋馆专柜', '创维7公斤全自动波轮洗衣机，型号：XQB70-21C淡雅银，如皋免费送货上门，南通包邮，华东地区配送', '创维家电大品牌，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238', '928.00', '/upload/goods_img/大家电/5db3b8a0367fe.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('506', '邮滋味如皋馆专柜', '创维单冷冰柜，型号：BD/C-160雅白，如皋地区免费送货上门安装，南通地区包邮，华东地区配货', '创维冰柜，安全健康专家，免费上门安装，绝对优惠，每月线下更有现场特惠活动', '999.00', '/upload/goods_img/大家电/5db3b8a042f39.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('507', '创维集团官方旗舰店', '创维（SKYWORTH）32H5 32英寸高清HDR 护眼全面屏 AI人工智能语音 网络WIFI 卧', '高清HDR 护眼全面屏 AI人工智能语音 网络WIFI', '999.00', '/upload/goods_img/大家电/5db3b8a0511cd.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('508', '邮滋味如皋馆专柜', '创维/SKYWORTH热水器，型号：DSZF-D5501-80，如皋免费送货上门，南通包邮 创维/', '创维家电大品牌，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238', '999.00', '/upload/goods_img/大家电/5db3b8a07389d.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('509', '琥麟电器专柜', 'Hisense/海信 HB80DA332G8KG公斤大容量家用全自动节能波轮洗衣机', '', '899.00', '/upload/goods_img/大家电/5db3b8a386615.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('510', '琥麟电器专柜', '海信 BCD-163N/B 冰柜冷藏冷冻双温家用商用小型卧式', '', '999.00', '/upload/goods_img/大家电/5db3b8a390a27.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('513', '甲子商城旗舰店', '康佳/KONKA  LED39E330C 39英寸卧室电视高清蓝光节能平板液晶电视', '', '949.00', '/upload/goods_img/大家电/5db3b8a9b22ae.jpg', '1572059510', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('521', '明凰服饰专营店', '男女冲锋衣工装棉服外套修身加厚款', '邮乐支持微信，支付宝，网银，邮储卡和银联卡支付。（不同商品请分开下单）', '85.00', '/upload/goods_img/户外服饰/5db3b8b22c022.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('522', '户外途量工厂专卖店', '春夏季运动风衣钓鱼防晒衣男女超薄透气皮肤衣防风外套户外速干潮流衣服情侣款皮肤衣', '大码骑行长袖', '29.90', '/upload/goods_img/户外服饰/5db3b8b23604c.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('523', '探路者正江专卖店', '探路者/TOREAD 冲锋裤 运动裤 秋冬户外软壳裤男透气防风保暖徒步裤KAMG91159', '', '428.00', '/upload/goods_img/户外服饰/5db3b8b25312b.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('524', '探路者正江专卖店', '探路者运动服 探路者冲锋衣 19秋冬户外女式防水透湿套绒冲锋衣TAWH92285', '', '839.00', '/upload/goods_img/户外服饰/5db3b8b25d925.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('525', '好看哒专营店', '防晒衣女中长款薄款防晒服', 'FSY-6387', '45.00', '/upload/goods_img/户外服饰/5db3b8b56628b.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('526', '宝仕母婴专营店专柜', 'L户外皮肤衣防紫外线防晒衣男女夏季超薄透气防晒服运动风衣', '', '75.00', '/upload/goods_img/户外服饰/5db3b8b573966.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('527', '好看哒专营店', '防晒衣女夏季新款韩版连帽系带长袖防晒衣糖果色沙滩户外披肩防晒衣', 'FSY-54', '19.90', '/upload/goods_img/户外服饰/5db3b8b88f380.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('528', '户外途量工厂专卖店', '户外速干T恤男 女休闲跑步运动健身短袖大码情侣快干衣排汗透气', '', '22.80', '/upload/goods_img/户外服饰/5db3b8b8abc8f.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('529', '好看哒专营店', '防晒衣 户外薄款防紫外线印花防晒衣', 'FSY-1736', '25.00', '/upload/goods_img/户外服饰/5db3b8b8c0c84.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('530', '好看哒专营店', '防晒衣夏季女蝙蝠袖连帽拉链短款防晒衣', 'FSY-5423', '35.00', '/upload/goods_img/户外服饰/5db3b8b9b16a1.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('531', '好看哒专营店', '防晒衣男士薄款纯色连帽防晒衣', 'FSY-4167', '35.00', '/upload/goods_img/户外服饰/5db3b8b9bbe9c.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('532', '户外途量工厂专卖店', '城徒 户外春夏单层冲锋衣女防晒衣男轻薄防风钓鱼服透气速干外套长袖衫', '', '35.80', '/upload/goods_img/户外服饰/5db3b8ba1b847.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('533', '好看哒专营店', '防晒衣韩版短款薄款连帽长袖防晒衣', 'FSY-5439', '36.00', '/upload/goods_img/户外服饰/5db3b8ba72314.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('534', '好看哒专营店', '防晒衣女中长款涂鸦薄款防晒衣', 'FSY-5282', '36.00', '/upload/goods_img/户外服饰/5db3b8ba99fd5.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('535', '好看哒专营店', '防晒衣女中长款薄款防晒衣', 'FSY-5456', '37.90', '/upload/goods_img/户外服饰/5db3b8baa8e20.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('536', '户外途量工厂专卖店', '秋冬户外男抓绒衣摇粒绒女外套保暖冲锋衣内胆开衫卫衣', '', '39.00', '/upload/goods_img/户外服饰/5db3b8bab267b.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('537', '户外途量工厂专卖店', '户外秋冬季加绒加厚抓绒衣男女摇粒绒保暖抓绒外套开衫冲锋衣内胆', '', '49.00', '/upload/goods_img/户外服饰/5db3b8bae0cb5.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('538', '江门新会馆', '【江门新会馆】caxa断码 两截速干裤女 韩版修身透气徒步快干裤野外登山跑步长裤', '', '50.00', '/upload/goods_img/户外服饰/5db3b8baf06b9.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('539', '宝仕母婴专营店专柜', 'L夏季休闲短裤男宽松5分中裤子男士运动五分裤大码跑步速干沙滩裤', '', '55.00', '/upload/goods_img/户外服饰/5db3b8bb2ba54.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('540', '江门新会馆', '【江门新会馆】caxa修身户外健身速干裤女 快干弹力透气登山大码长裤 弹力户外裤', '', '60.00', '/upload/goods_img/户外服饰/5db3b8bb513ed.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('541', '探路者正江专卖店', '探路者/TOREADt恤女户外夏季快干速干透气运动服TAJG82984', '', '61.00', '/upload/goods_img/户外服饰/5db3b8bb5ac47.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('542', '铁好家居美妆日用百货专营店', '佳钓尼 夏遮阳防晒帽套头面罩透气防紫外线渔夫帽', '', '48.00', '/upload/goods_img/户外服饰/5db3b8bb8e0a3.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('543', '宝仕母婴专营店专柜', '防晒衣男女情侣春夏季防雨风衣超薄透气速干钓鱼防晒服户外皮肤衣MN', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bb9f9e7.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('544', '户外途量工厂专卖店', '城徒 春夏季速干裤男女大码轻薄快干透气户外修身显瘦弹力冲锋裤', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbb3e24.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('545', '宝仕母婴专营店专柜', 'L运动户外夏季速干t恤 男女短袖速干衣快干t恤 吸汗透气', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbe33ff.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('546', '宝仕母婴专营店专柜', 'L健身房教练速干T恤男女 圆领情侣夏季短袖汗衫', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bc1bca2.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('547', '户外途量工厂专卖店', '城徒 冬季正品户外冲锋裤男女抓绒裤保暖防风防水加厚软壳裤登山裤长裤', '', '75.00', '/upload/goods_img/户外服饰/5db3b8bc42dab.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('548', '江门新会馆', '【江门新会馆】caxa修身弹力女款休闲棉裤 户外休闲快干长裤 女士跑步登山健身裤', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bc96997.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('549', '江门新会馆', '【江门新会馆】caxa休闲修身速干裤 透气轻薄运动裤耐磨健身户外裤多袋裤七分裤', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcac92c.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('550', '探路者正江专卖店', '探路者/TOREAD 运动服 短袖户外女运动跑步排汗透气圆领速干T恤TAJF82784', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcc53b9.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('551', '户外途量工厂专卖店', '冲锋裤男户外秋冬防风防水软壳裤女加绒加厚抓绒裤保暖徒步登山裤', '', '79.00', '/upload/goods_img/户外服饰/5db3b8bd362c1.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('552', '探路者正江专卖店', '探路者/TOREADT恤女 夏户外女式超轻透气速干衣圆领T恤短袖KAJG82352', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd44554.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('553', '探路者正江专卖店', '探路者/TOREAD 短袖 18春夏新款户外女式圆领速干透气印花短袖T恤TAJG82939', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd602ab.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('554', '探路者正江专卖店', '探路者/TOREAD夏新款户外运动透气弹力速干女式半袖短袖T恤KAJG82310', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be68f86.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('555', '探路者正江专卖店', '探路者/TOREAD T恤女款 秋季户外短袖女时尚速干透气短袖T恤TAJG82938', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be96a09.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('556', '洋湖轩榭官方旗舰店', '洋湖轩榭 春秋季新款中老年男装连帽冲锋衣爸爸装休闲夹克衫外套男A', '钜惠双十一 感恩惠顾', '126.42', '/upload/goods_img/户外服饰/5db3b8bea6025.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('557', '南城百货专营店', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '158.00', '/upload/goods_img/户外服饰/5db3b8bede68a.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('558', '正江服饰专营店', '包邮韵格NT1021男士紧身训练PRO运动健身跑步长袖弹力速干服纯色衣服', '', '59.00', '/upload/goods_img/户外服饰/5db3b8beeb97d.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('559', '流行饰品运动户外器械', '汤河店 户外冲锋裤男女可脱卸秋冬季加绒加厚保暖软壳防风防水登山滑雪裤', '', '179.00', '/upload/goods_img/户外服饰/5db3b8bf07cf9.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('560', '流行饰品运动户外器械', '汤河店 韩国正品vvc防晒衣女经典薄夏季中长款防晒服户外防紫外线皮肤衣', '', '499.00', '/upload/goods_img/户外服饰/5db3b8bf2bf21.jpg', '1572059516', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('561', '乐颐汇数码专营店', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', '2400万AI高清自拍，麒麟710处理器，炫光渐变色', '989.00', '/upload/goods_img/手机数码/5db3b8700e46c.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('562', '乐颐汇数码专营店', '华为/HUAWEI 畅享9 手机 全网通 4GB+128GB', '6.26英寸珍珠屏 4000mAh大电池', '1099.00', '/upload/goods_img/手机数码/5db3b8731cf7b.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('563', '米果商贸专柜', '折叠式平板电脑支架底座懒人手机支架【颜色随机发货】', '', '9.90', '/upload/goods_img/手机数码/5db3b87337179.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('564', '邮乐韵菲专营店', '（亏本促销）车载手机支架双面吸盘式家居懒人多功能通用可弯曲创意手机支架', '', '1.00', '/upload/goods_img/手机数码/5db3b87345fc4.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('565', '麦尚科技专营店', '手机支架懒人支架卡通创意平板电脑桌面支撑座【款式随机】', '', '9.90', '/upload/goods_img/手机数码/5db3b8734f81e.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('566', '邮乐韵菲专营店', '无线蓝牙耳机迷你超小苹果安卓通用耳机', '送两条充电线+一个收纳盒', '15.90', '/upload/goods_img/手机数码/5db3b873b60d7.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('567', '万品好易购商城', 'XO NB23 八角宝石锌合金数据线', '产品颜色：黑色  白色 宝石外观 不拘一格;  锌合金 更出色；  2.4A极速充电，高效传输文件', '49.00', '/upload/goods_img/手机数码/5db3b873bf931.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('568', '万品好易购商城', 'XO F1 户外Mini蓝牙音箱 经典挂扣 防水 防尘/防摔 抗干扰性强 无线链接 免提通话', '音量调节/音乐播放、暂停/上下曲切换 语音报号/来电铃声/数据输出/直读SD卡', '99.00', '/upload/goods_img/手机数码/5db3b873d7806.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('569', '万品好易购商城', 'XO  PB39 移动电源 8000mAh', '8000mAh大容量 双输出带LED灯  ； 电源保护, 好用更安全； 智能分流 高效输出', '119.00', '/upload/goods_img/手机数码/5db3b8740878f.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('570', '万品好易购商城', 'XO BS8 运动蓝牙耳机源于经典 加以升级 鲨鱼鳍耳翼 舒适牢固', '源于经典 加以升级； 鲨鱼鳍耳翼 舒适牢固 ； 无惧雨水  防水防汗； 蓝牙4.2版本，深度降噪', '169.00', '/upload/goods_img/手机数码/5db3b87419133.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('571', '万品好易购商城', 'XO BS7 运动蓝牙耳机 深度降噪 通话更清晰 轻松操控 随意切换', '强劲的CSR芯片 提升续航能力； 蓝牙4.1版本，深度降噪，通话更清晰； 霍尔磁控开关，智能感应', '199.00', '/upload/goods_img/手机数码/5db3b8742586e.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('572', '万品好易购商城', 'XO A8 蓝牙音箱 智能触控 自由切换 大容量电池 可连续播放约4-6小时 土豪金 星空银 银色', '智能触控，自由切换； 内置1000毫安聚合物电池，全频高清喇叭+低音振膜,可连续播放约4-6小时', '169.00', '/upload/goods_img/手机数码/5db3b874390f2.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('573', '普润家居专营店', 'oppo蓝牙耳机迷你vivo超小隐形运动通用华为无线耳塞超长待机开车', '', '79.00', '/upload/goods_img/手机数码/5db3b874496ae.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('574', '木易生活专柜', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '12.90', '/upload/goods_img/手机数码/5db3b874588e2.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('575', '木易生活专柜', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1*', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1', '15.90', '/upload/goods_img/手机数码/5db3b8746c166.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('576', '北京信酷数码商城专柜', 'iPhone 苹果原装充电器套装/数据线+充电头电源适配器 通用型', '【全国包邮】 充电套装更优惠', '69.00', '/upload/goods_img/手机数码/5db3b874784b9.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('577', '小牛数码家居专柜', '飞利浦/PHILIPS 多功能可伸缩车载手机支架DLK35002', '多功能可伸缩车载手机支架', '68.00', '/upload/goods_img/手机数码/5db3b87484bf4.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('578', '北京信酷数码商城专柜', '苹果 iphone X /XS MAX/XS/XR/钢化膜 全屏全覆盖 手机贴膜', '', '19.00', '/upload/goods_img/手机数码/5db3b87493e28.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('579', '邮乐萍乡馆', '南孚(NANFU)3V纽扣电池两粒 CR2032/CR2025/CR2016锂电池电子汽车钥匙遥控', '奔驰c200l福特 新蒙迪欧 高尔夫7 新马自达昂克赛拉阿特兹 手表奔驰大众汽车钥匙电池', '9.90', '/upload/goods_img/手机数码/5db3b874a670c.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('580', '信酷小米专营店', '小米（MI） 车载充电器快充版 QC3.0 双口输出 智能温度控制 兼容iOS和Android设备', '小米正品 全国包邮', '89.00', '/upload/goods_img/手机数码/5db3b874b8050.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('581', '北京信酷数码商城专柜', '苹果 iPhone6/6S/6Plus/6SPlus/iPhone7/7P防爆钢化玻璃膜高清手机贴膜', '进口AGC玻璃板！超薄钢化玻璃膜！秒杀国产玻璃！', '26.00', '/upload/goods_img/手机数码/5db3b874c207b.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('582', '北京信酷数码商城专柜', 'OPPO手机原装耳机R11/PLUS入耳式线控r11s/r15耳机 白色盒装', '', '38.80', '/upload/goods_img/手机数码/5db3b874d31ef.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('583', '北京信酷数码商城专柜', '华为（HUAWEI）小天鹅无线蓝牙免提通话音箱4.0 便携户外/车载迷你音响AM08', '音·触即发！360°音效技术，音质真实自然，简洁触控操作，支持蓝牙免提通话。', '95.00', '/upload/goods_img/手机数码/5db3b874e280a.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('584', '北京信酷数码商城专柜', '三星 32G内存卡(CLASS10 48MB/s)  手机内存卡32g MicroSD存储卡', '正品行货 支持专柜验货 实行三包政策 轻放心购买', '95.00', '/upload/goods_img/手机数码/5db3b874edfa5.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('585', '北京信酷数码商城专柜', '华为/HUAWEI 华为快速充电套装 4.5V/5A充电头+type-c线  华为充电器', '支持p20/mate10/9pro/p10plus荣耀10/v10/note10等机型', '98.00', '/upload/goods_img/手机数码/5db3b87504947.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('586', '北京信酷数码商城专柜', '小米（MI）小米手环2（黑色）智能运动 防水 心率监测 计步器 久坐提醒', '正品行货 全国包邮', '159.00', '/upload/goods_img/手机数码/5db3b875133ab.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('587', '信酷小米专营店', '小米活塞耳机 清新版 黑色 蓝色 入耳式手机耳机 通用耳麦', '小米正品 全国包邮', '45.00', '/upload/goods_img/手机数码/5db3b8751ef2e.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('588', '信酷小米专营店', '小米支架式自拍杆 灰色 黑色 蓝牙遥控迷你便携带三脚架多功能', '小米正品 全国包邮', '105.00', '/upload/goods_img/手机数码/5db3b875327b2.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('589', '信酷小米专营店', '小米（MI）方盒子蓝牙音箱2 无线迷你随身户外便携客厅家用小音响', '小米正品 全国包邮', '149.00', '/upload/goods_img/手机数码/5db3b87546807.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('590', '信酷小米专营店', '小米（MI）小米运动蓝牙耳机mini 黑色白色 无线蓝牙入耳式运动耳机', '小米正品 全国包邮', '169.00', '/upload/goods_img/手机数码/5db3b8755a85b.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('591', '信酷小米专营店', '小米（MI）小钢炮2代 无线蓝牙便携音箱', '小米正品 全国包邮', '139.00', '/upload/goods_img/手机数码/5db3b87564c6e.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('592', '铁好家居美妆日用百货专营店', '公牛BULL 独立3孔位2USB创意魔方插座 1.5米线GN-UUB122【热卖推荐】', '立体集成结构 小巧轻便 五重保护', '67.00', '/upload/goods_img/手机数码/5db3b87575612.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('596', '邮乐萍乡馆', '南孚 安卓数据线 NF-LM001 小米华为OPPO三星vivo充电器通用', '', '9.90', '/upload/goods_img/手机数码/5db3b875a923e.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('597', '铁好家电数码专营店', '公牛BULL 二合一苹果lighting+micro USB数据线GN-J81N【热卖推荐】', 'MFi官方认证，快速充电，抗折断', '69.00', '/upload/goods_img/手机数码/5db3b875b2e80.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('598', '邮乐萍乡馆', '南孚(NANFU)LR6AA聚能环 5号+7号碱性干电池【共4粒装】', '', '9.90', '/upload/goods_img/手机数码/5db3b875be233.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('599', '岳灵生活专营店', '南孚手机充电宝 10000毫安大容量礼盒装NFCT10', '', '169.00', '/upload/goods_img/手机数码/5db3b875cad56.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('600', '邮乐萍乡馆', '南孚(NANFU)LR03AAA聚能环7号电池碱性干电池12粒装儿童玩具遥控器赛车闹钟智能门锁电池', 'AAA干电池持久电力家用', '27.80', '/upload/goods_img/手机数码/5db3b875d3610.jpg', '1572059524', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('601', '中国农垦官方旗舰店', '买2份送一份【中国农垦】黑龙江北大荒  支豆浆粉早餐豆浆粉 非转基因大豆 五谷豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d338ebc.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('602', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒支装豆浆粉（醇豆浆、红枣味可选） 非转基因大豆', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3432ce.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('603', '牛牛食品专营店', '(8月新货)蒙牛小真果粒125ml*20盒草莓味果粒酸奶小胖丁迷你装', '8月份的新货,超好喝，儿童，果粒，健康营养，', '22.70', '/upload/goods_img/特色美食/5db3b8d34deb1.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('604', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 支装豆浆粉 麦香甜豆浆粉 28g*10袋', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3651ce.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('605', '禾煜食品旗舰店', '禾煜 黄冰糖418g包  冰糖土冰糖  煲汤食材', '黄冰糖买2送1', '15.00', '/upload/goods_img/特色美食/5db3b8d66e304.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('606', '新农哥旗舰店', '【新农哥】板栗仁108gx4袋  休闲零食小吃', '', '26.90', '/upload/goods_img/特色美食/5db3b8d6832f9.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('607', '新农哥旗舰店', '新农哥 每日坚果 混合果仁 缤纷坚果仁175g*2盒  休闲零食', '缤纷美味 一吃钟情', '59.90', '/upload/goods_img/特色美食/5db3b8d68e2c4.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('608', '众天蜂蜜邮乐农品旗舰店', '众天山花蜂蜜500g', '秦岭深处 百花酿造而成 最受欢迎的蜂蜜 性价比极高！', '19.90', '/upload/goods_img/特色美食/5db3b8d6a2ed1.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('609', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 非转基因大豆 豆浆粉 红枣豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d6ae283.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('610', '考拉小哥专营店', '薛小贱 每日坚果25g*1包', '厂家直供、7种混合、日期新鲜', '1.66', '/upload/goods_img/特色美食/5db3b8d6b8e66.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('611', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂五宝茶 益本茶 男人茶养生茶 草本', '【萃涣堂】五宝益本茶 男人茶买2送1五宝茶男人茶枸杞茶玛咖片黄精男肾茶老公八宝茶养生茶 做性福的男人', '19.00', '/upload/goods_img/特色美食/5db3b8d6c8481.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('612', '萃涣堂蒲公英茶专柜', '【滨州馆】寻味山东新鲜现做手工 滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '寻味山东 新鲜现做手工滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '1.00', '/upload/goods_img/特色美食/5db3b8d6cc302.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('613', '正江食品专营店', '寿全斋  红枣姜茶 姜茶 12g*10条', '', '25.00', '/upload/goods_img/特色美食/5db3b8d6debe7.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('614', '阿坝州理县地方扶贫馆', '四川浓香菜籽油 5升农家非转基因5l纯菜子粮油食用油约10斤植物油', '2019新油，滴滴香浓，四川非转基因纯菜籽油', '66.00', '/upload/goods_img/特色美食/5db3b8d6f246b.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('615', '千岛湖品牌农产品馆', '千岛湖 千岛渔娘 糍粑（4味）200g', '买二赠一 糍粑', '15.00', '/upload/goods_img/特色美食/5db3b8d706ecd.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('616', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '0.50', '/upload/goods_img/特色美食/5db3b8d713dd8.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('617', '果蔻食品专营店', '果蔻 每日坚果B款20g/包简装无礼盒成人儿童孕妇混合果仁坚果零食大礼包', '科学配比  营养美味', '1.39', '/upload/goods_img/特色美食/5db3b8d729985.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('618', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '0.50', '/upload/goods_img/特色美食/5db3b8d736890.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('619', '佳林院红枣旗舰店', '【0.4元/袋佳林院泡茶煮粥煲汤枣圈】山东特产乐陵红枣每袋约12克袋装50袋起拍包邮部分偏远地区除外', '佳林院品牌装，泡茶煮粥枣圈，拼团价0.4元/袋，每袋约12克装，50袋起拍，食用方便，经济实惠！', '0.40', '/upload/goods_img/特色美食/5db3b8d798327.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('620', '果蔻食品专营店', '果蔻 每日坚果25g*1包成人儿童孕妇混合坚果混合果仁小吃零食', '', '1.65', '/upload/goods_img/特色美食/5db3b8d7aa43b.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('621', '萃涣堂蒲公英茶专柜', '【滨州馆】红枣黑糖姜茶大姨妈水姜糖女老姜块生姜姜汁姜汤红糖姜枣茶小袋装25克/袋', '姜味浓,红枣多,顺畅暖暖,效果杠杠“冬吃萝卜夏吃姜。”传统组方真材实料。', '0.90', '/upload/goods_img/特色美食/5db3b8dab8392.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('622', '南阳专区专营店', '南阳西峡现摘金桃黄心猕猴桃15枚 （单枚60g-90g）买一送一 共30枚，合并发一箱', '买一赠一活动', '19.90', '/upload/goods_img/特色美食/5db3b8dac3745.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('623', '果然好口福专柜', '宁 福吉 5斤起拍新疆原味生核桃新货 特产薄皮核桃 坚果炒货休闲零食包邮', '新疆薄皮核桃  送夹子', '9.90', '/upload/goods_img/特色美食/5db3b8daea466.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('624', '刘陶生鲜旗舰店', '刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果2', '', '25.50', '/upload/goods_img/特色美食/5db3b8db3a40e.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('625', '丹东邮政农特产品专营店', '2019年丹东新鲜板栗4斤东北农家生板栗毛栗子现摘栗子应季水果干', '', '19.90', '/upload/goods_img/特色美食/5db3b8db3a7f6.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('626', '果然好口福专柜', '宁福吉 新疆和田大枣煲粥枣500克包邮', '', '6.60', '/upload/goods_img/特色美食/5db3b8db578d5.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('627', '小呆妞旗舰店', '预售小呆妞四川蒲江金艳黄心猕猴桃90-110g中果24枚 72内小时发货', '关于售后：签收24小时内后台申请退款请提供坏果和快递单合照，会根据实际损坏赔付', '27.90', '/upload/goods_img/特色美食/5db3b8db63c28.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('628', '萃涣堂蒲公英茶专柜', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包伴手礼花茶茶包组合玫瑰茉莉绿茶袋泡三', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包', '0.90', '/upload/goods_img/特色美食/5db3b8db71303.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('629', '丹东邮政农特产品专营店', '新鲜现挖番薯红黄心密署农家自种蒸煮粉糯香甜沙地地瓜烤烟署5斤', '', '16.80', '/upload/goods_img/特色美食/5db3b8db862f8.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('630', '川锅壹号旗舰店', '川锅壹号辣白菜228g韩国泡菜下饭菜正宗朝鲜口味拌饭菜版面菜', '酸辣可口 老少皆宜', '5.90', '/upload/goods_img/特色美食/5db3b8dbcdf79.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('631', '福香御旗舰店', '福香御 慢生长2018东北大米雪花米10斤真空包邮色选米', '初霜收割，180天慢生长周期，30天鲜磨直达，大米胚乳含量极为丰富，口感软糯香甜。', '27.90', '/upload/goods_img/特色美食/5db3b8dbdb26c.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('632', '兰州鲜合苑百合特产店专营店', '现包现发100%新鲜正宗兰州市七里河区产兰州鲜百合3年生兰州百合农家甜百合，约16颗百合一斤', '兰州鲜百合，无任何添加剂，宝宝也可以放心食用', '19.90', '/upload/goods_img/特色美食/5db3b8dbe8d2f.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('633', '当季鲜果', '黄金奇异果12枚包邮（中果70-90克，拍2件多送6枚，合并发30枚）金艳黄心猕猴桃新鲜水果', '快递随机，不能指定快递，下单后72小时内发货，下雨天顺延，购买前请阅读售后要求，介意慎拍', '9.90', '/upload/goods_img/特色美食/5db3b8dc0be0c.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('634', '丹东邮政农特产品专营店', '东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田', '东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田', '28.80', '/upload/goods_img/特色美食/5db3b8dc17d77.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('635', '川锅壹号旗舰店', '川锅壹号蟹黄酱拌饭酱秃黄油拌面酱蟹粉酱蟹黄膏酱料即食螃蟹酱', '金脂香软 经典美味', '9.90', '/upload/goods_img/特色美食/5db3b8dc2c59c.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('636', '刘陶生鲜旗舰店', '刘陶 云南昭通丑苹果5斤大果（13-15个）新鲜水果', '拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买', '27.00', '/upload/goods_img/特色美食/5db3b8dc365c6.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('637', '福香御旗舰店', '福香御 大米5kg装2018新米圆粒珍珠米寿司香米秋田小町农家东北大米包邮', '', '29.99', '/upload/goods_img/特色美食/5db3b8de5a091.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('638', '刘陶生鲜旗舰店', '刘陶 云南石林人生果圆果净果5斤（25-35个）大果新鲜水果2', '拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买', '25.00', '/upload/goods_img/特色美食/5db3b8de6ec9e.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('639', '刘陶生鲜旗舰店', '刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果特卖', '', '25.50', '/upload/goods_img/特色美食/5db3b8de7ac09.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('640', '萃涣堂蒲公英茶专柜', '【萃涣堂】 蜜桃乌龙茶  水果茶 三角包共蜜桃白桃乌龙茶袋泡花茶包花', '新品上市!独立三角袋泡茶,携带冲泡更便捷!【萃涣堂】 蜜桃乌龙茶 水果茶 三角包', '0.90', '/upload/goods_img/特色美食/5db3b8de97517.jpg', '1572059535', '0', '4');
INSERT INTO `xy_goods_list` VALUES ('641', '特惠美发护发名品', '正品欧莱雅直发膏软化剂定型拉直膏男女不伤发烫发水软化+定型膏', '', '135.00', 'http://10.168.1.254/upload/765fe3ca3b58da80/6b5f971b57722dd9.png', '1581762828', '0', '1');

-- ----------------------------
-- Table structure for xy_goods_list_copy
-- ----------------------------
DROP TABLE IF EXISTS `xy_goods_list_copy`;
CREATE TABLE `xy_goods_list_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) NOT NULL COMMENT '商店名称',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `goods_info` varchar(255) DEFAULT '' COMMENT '商品描述',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_pic` varchar(120) DEFAULT '' COMMENT '商品展示图片',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '上架状态 0不上架 1上架',
  `cid` int(11) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of xy_goods_list_copy
-- ----------------------------
INSERT INTO `xy_goods_list_copy` VALUES ('1', '信酷小米专营店', '小米/MIUI 小米电视4S 43英寸人工智能语音网络平板电视 1GB+8GB HDR 4K超高清', '金属机身', '1.00', '/upload/goods_img/大家电/5db3b89a8d174.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('2', '邮乐安阳馆', '【汤阴县积分用户专享】洗衣机XpB—126-9896S', '', '1.00', '/upload/goods_img/大家电/5db3b89a9f288.jpg', '1578206762', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('3', '海信电器旗舰店', '海信（Hisense）HZ39E35A 39英寸高清手机交互 轻薄金属 WIFI人工智能液晶电视机', '', '1.00', '/upload/goods_img/大家电/5db3b89ab61bd.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('4', '邮滋味如皋馆专柜', '创维9公斤变频滚筒洗衣机  型号：F9015NC-炫金   如皋免费送货上门，南通包邮，华东地区配货', '创维洗衣机，安全健康专家，免费上门安装，绝对优惠，每月线下更有现场特惠活动', '1.00', '/upload/goods_img/大家电/5db3b89b52437.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('5', '邮滋味如皋馆专柜', '创维2P定频立式柜机，型号：KFR-50LW/F2DA1A-3（限如皋地区免费送货上门安装）', '创维定频空调，免费上门安装，绝对优惠，每月更有现场特惠活动', '4.00', '/upload/goods_img/大家电/5db3b89b6e95e.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('6', '创维电视官方旗舰店', '创维/SKYWORTH 58H8M 58英寸4K超高清全面屏防蓝光人工智能语音HDR超薄网络液晶电视', '4K超高清，声像自然，一场声觉革新，视觉体验，光学防蓝光，护眼不偏色', '3.00', '/upload/goods_img/大家电/5db3b89b79d10.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('7', '邮乐洛阳', '【洛阳金融积分兑换】TCL 205升 三门电冰箱 （星空银） BC（邮政网点配送）', '', '1.00', '/upload/goods_img/大家电/5db3b89bc11c1.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('8', '邮滋味如皋馆专柜', '创维9公斤全自动波轮洗衣机，型号XQB90-52BAS淡雅银如皋免费送货上门，南通包邮，华东地区配送', '创维家电大品牌，安全可靠，夏季特惠；每月现场有特惠活动', '1.00', '/upload/goods_img/大家电/5db3b89bcfc24.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('9', '信阳邮约会', '【限信阳地区积分兑换专用，不对外销售】家用洗衣机，图片仅供参考', '', '1.00', '/upload/goods_img/大家电/5db3b89be0d98.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('10', '邮乐安阳馆', '【滑县积分用户专享】创维电器洗衣机9公斤波轮安阳', '', '1.00', '/upload/goods_img/大家电/5db3b89bee474.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('11', '邮乐安阳馆', '美菱3开门冰箱BCD-209M3CX【汤阴县积分兑换专用，其他下单不发货】', '', '1.00', '/upload/goods_img/大家电/5db3b89c06586.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('12', '邮乐安阳馆', '美菱电冰箱209L3CS【安阳县积分兑换用户专用，其他地区发】', '', '1.00', '/upload/goods_img/大家电/5db3b89c16f2a.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('13', '信阳邮约会', '【限信阳地区积分兑换专用，不对外销售】自动洗衣机 家用洗衣机，图片仅供参考', '', '2.00', '/upload/goods_img/大家电/5db3b89c22e95.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('14', '邮乐安阳馆', '【滑县积分用户专享】创维电器电视50寸4K智能安阳', '', '3.00', '/upload/goods_img/大家电/5db3b89c2bb37.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('15', '邮乐安阳馆', '【安阳县积分用户专享】长虹液晶电视55U1', '', '3.00', '/upload/goods_img/大家电/5db3b89f48109.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('16', '海信电器旗舰店', '海信（Hisense）HZ32E30D 32英寸蓝光高清平板液晶电视机 酒店宾馆卧室推荐', '【海信今日限时特惠-到手价788元！】限量200台！抢完即止！', '749.00', '/upload/goods_img/大家电/5db3b89f51194.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('17', '邮滋味如皋馆专柜', '邮乐特卖：庭美家用消毒柜    型号：YTP-280    如皋免费送货上门，南通包邮，华东地区配送', '庭美消毒柜，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238', '755.00', '/upload/goods_img/大家电/5db3b89f5ec57.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('18', '吉舜诚商城专柜', '飞利浦（PHILIPS）  19英寸液晶电视机 显示器两用 hdmi高清接口', '19PFF2650', '799.00', '/upload/goods_img/大家电/5db3b89fb14ba.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('19', '创维集团官方旗舰店', '创维/SKYWORTH 32X3 32英寸窄边非智能老人机蓝光高清节能LED平板液晶电视机工程机', '蓝光高清，经典窄边，节能液晶，简单好用，谁用谁知道，实用耐用款', '799.00', '/upload/goods_img/大家电/5db3b89fc8fa8.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('20', '吉舜诚商城专柜', '飞利浦（PHILIPS）22英寸LED高清液晶平板电视机含底座 黑色', '22PFF2650/T3', '899.00', '/upload/goods_img/大家电/5db3b89fd917b.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('21', '创维集团官方旗舰店', '创维/SKYWORTH 32X6 32英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机', '超值钜惠，高清智能电视，WIFI，酷开系统，10核处理器', '899.00', '/upload/goods_img/大家电/5db3b89fe6086.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('22', '海信电器旗舰店', '海信 (Hisense) HZ32E35A 32英寸AI智能WIFI 轻薄金属 卧室神器高清电视机', '', '899.00', '/upload/goods_img/大家电/5db3b8a0004c2.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('23', '邮滋味如皋馆专柜', '创维邮乐特卖： 32寸液晶电视机，型号：32E381S   如皋免费送货上门，南通包邮，华东地区配货', '创维液晶电视大品牌，夏季特惠；每月现场有特惠活动', '899.00', '/upload/goods_img/大家电/5db3b8a01be30.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('24', '琥麟电器专柜', '海信 XQB60-H3568 6公斤全自动波轮洗衣机', '', '749.00', '/upload/goods_img/大家电/5db3b8a0279b3.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('25', '邮滋味如皋馆专柜', '创维7公斤全自动波轮洗衣机，型号：XQB70-21C淡雅银，如皋免费送货上门，南通包邮，华东地区配送', '创维家电大品牌，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238', '928.00', '/upload/goods_img/大家电/5db3b8a0367fe.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('26', '邮滋味如皋馆专柜', '创维单冷冰柜，型号：BD/C-160雅白，如皋地区免费送货上门安装，南通地区包邮，华东地区配货', '创维冰柜，安全健康专家，免费上门安装，绝对优惠，每月线下更有现场特惠活动', '999.00', '/upload/goods_img/大家电/5db3b8a042f39.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('27', '创维集团官方旗舰店', '创维（SKYWORTH）32H5 32英寸高清HDR 护眼全面屏 AI人工智能语音 网络WIFI 卧', '高清HDR 护眼全面屏 AI人工智能语音 网络WIFI', '999.00', '/upload/goods_img/大家电/5db3b8a0511cd.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('28', '邮滋味如皋馆专柜', '创维/SKYWORTH热水器，型号：DSZF-D5501-80，如皋免费送货上门，南通包邮 创维/', '创维家电大品牌，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238', '999.00', '/upload/goods_img/大家电/5db3b8a07389d.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('29', '琥麟电器专柜', 'Hisense/海信 HB80DA332G8KG公斤大容量家用全自动节能波轮洗衣机', '', '899.00', '/upload/goods_img/大家电/5db3b8a386615.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('30', '琥麟电器专柜', '海信 BCD-163N/B 冰柜冷藏冷冻双温家用商用小型卧式', '', '999.00', '/upload/goods_img/大家电/5db3b8a390a27.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('31', '吉舜诚商城专柜', '东芝（TOSHIBA）  32英寸 蓝光液晶电视 高清平板电视机 东芝电视机', '32L1500C', '1.00', '/upload/goods_img/大家电/5db3b8a69aafd.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('32', '创维集团官方旗舰店', '创维/SKYWORTH 40X6 40英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机', '超值钜惠！高清智能，10核处理器，可以WIFI上网', '1.00', '/upload/goods_img/大家电/5db3b8a9a6b14.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('33', '甲子商城旗舰店', '康佳/KONKA  LED39E330C 39英寸卧室电视高清蓝光节能平板液晶电视', '', '949.00', '/upload/goods_img/大家电/5db3b8a9b22ae.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('34', '邮乐赣州馆', '【不支持邮乐卡支付】创维-彩电-40E1C 40英寸全高清HDR 护眼全面屏 AI人工智能语音', '', '1.00', '/upload/goods_img/大家电/5db3b8a9cf38d.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('35', '琥麟电器专柜', '海信 BCD-177F/Q 177升 双门冰箱', '', '1.00', '/upload/goods_img/大家电/5db3b8a9f0abd.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('36', '创维集团官方旗舰店', '创维/SKYWORTH 43X6 43英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机', '【买电视选创维】高清智能，10核处理器，质量上乘，价格厚道，可以Wifi上网', '1.00', '/upload/goods_img/大家电/5db3b8aa1b4b4.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('37', '创维集团官方旗舰店', '创维（SKYWORTH）40H5 40英寸全高清HDR 护眼全面屏 AI人工智能语音 网络WIFI', '全高清HDR 护眼全面屏 AI人工智能语音', '1.00', '/upload/goods_img/大家电/5db3b8aa26c4f.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('38', '邮乐安阳馆', '市区积分用户专享】创维平板电视32X6', '', '1.00', '/upload/goods_img/大家电/5db3b8aa31c19.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('39', '吉舜诚商城专柜', '飞利浦（PHILIPS）32英寸新品高清LED电视 接口丰富窄边高清LED液晶平板电视机', '32PHF3282/T3', '1.00', '/upload/goods_img/大家电/5db3b8aa3b85c.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('40', '琥麟电器专柜', '海信 BD/BC-308NU/A 冰柜家用 顶开式卧式商用冷藏冷冻柜', '', '1.00', '/upload/goods_img/大家电/5db3b8aa4931f.jpg', '1572059510', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('41', '明凰服饰专营店', '男女冲锋衣工装棉服外套修身加厚款', '邮乐支持微信，支付宝，网银，邮储卡和银联卡支付。（不同商品请分开下单）', '85.00', '/upload/goods_img/户外服饰/5db3b8b22c022.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('42', '户外途量工厂专卖店', '春夏季运动风衣钓鱼防晒衣男女超薄透气皮肤衣防风外套户外速干潮流衣服情侣款皮肤衣', '大码骑行长袖', '29.90', '/upload/goods_img/户外服饰/5db3b8b23604c.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('43', '探路者正江专卖店', '探路者/TOREAD 冲锋裤 运动裤 秋冬户外软壳裤男透气防风保暖徒步裤KAMG91159', '', '428.00', '/upload/goods_img/户外服饰/5db3b8b25312b.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('44', '探路者正江专卖店', '探路者运动服 探路者冲锋衣 19秋冬户外女式防水透湿套绒冲锋衣TAWH92285', '', '839.00', '/upload/goods_img/户外服饰/5db3b8b25d925.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('45', '好看哒专营店', '防晒衣女中长款薄款防晒服', 'FSY-6387', '45.00', '/upload/goods_img/户外服饰/5db3b8b56628b.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('46', '宝仕母婴专营店专柜', 'L户外皮肤衣防紫外线防晒衣男女夏季超薄透气防晒服运动风衣', '', '75.00', '/upload/goods_img/户外服饰/5db3b8b573966.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('47', '好看哒专营店', '防晒衣女夏季新款韩版连帽系带长袖防晒衣糖果色沙滩户外披肩防晒衣', 'FSY-54', '19.90', '/upload/goods_img/户外服饰/5db3b8b88f380.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('48', '户外途量工厂专卖店', '户外速干T恤男 女休闲跑步运动健身短袖大码情侣快干衣排汗透气', '', '22.80', '/upload/goods_img/户外服饰/5db3b8b8abc8f.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('49', '好看哒专营店', '防晒衣 户外薄款防紫外线印花防晒衣', 'FSY-1736', '25.00', '/upload/goods_img/户外服饰/5db3b8b8c0c84.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('50', '好看哒专营店', '防晒衣夏季女蝙蝠袖连帽拉链短款防晒衣', 'FSY-5423', '35.00', '/upload/goods_img/户外服饰/5db3b8b9b16a1.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('51', '好看哒专营店', '防晒衣男士薄款纯色连帽防晒衣', 'FSY-4167', '35.00', '/upload/goods_img/户外服饰/5db3b8b9bbe9c.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('52', '户外途量工厂专卖店', '城徒 户外春夏单层冲锋衣女防晒衣男轻薄防风钓鱼服透气速干外套长袖衫', '', '35.80', '/upload/goods_img/户外服饰/5db3b8ba1b847.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('53', '好看哒专营店', '防晒衣韩版短款薄款连帽长袖防晒衣', 'FSY-5439', '36.00', '/upload/goods_img/户外服饰/5db3b8ba72314.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('54', '好看哒专营店', '防晒衣女中长款涂鸦薄款防晒衣', 'FSY-5282', '36.00', '/upload/goods_img/户外服饰/5db3b8ba99fd5.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('55', '好看哒专营店', '防晒衣女中长款薄款防晒衣', 'FSY-5456', '37.90', '/upload/goods_img/户外服饰/5db3b8baa8e20.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('56', '户外途量工厂专卖店', '秋冬户外男抓绒衣摇粒绒女外套保暖冲锋衣内胆开衫卫衣', '', '39.00', '/upload/goods_img/户外服饰/5db3b8bab267b.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('57', '户外途量工厂专卖店', '户外秋冬季加绒加厚抓绒衣男女摇粒绒保暖抓绒外套开衫冲锋衣内胆', '', '49.00', '/upload/goods_img/户外服饰/5db3b8bae0cb5.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('58', '江门新会馆', '【江门新会馆】caxa断码 两截速干裤女 韩版修身透气徒步快干裤野外登山跑步长裤', '', '50.00', '/upload/goods_img/户外服饰/5db3b8baf06b9.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('59', '宝仕母婴专营店专柜', 'L夏季休闲短裤男宽松5分中裤子男士运动五分裤大码跑步速干沙滩裤', '', '55.00', '/upload/goods_img/户外服饰/5db3b8bb2ba54.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('60', '江门新会馆', '【江门新会馆】caxa修身户外健身速干裤女 快干弹力透气登山大码长裤 弹力户外裤', '', '60.00', '/upload/goods_img/户外服饰/5db3b8bb513ed.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('61', '探路者正江专卖店', '探路者/TOREADt恤女户外夏季快干速干透气运动服TAJG82984', '', '61.00', '/upload/goods_img/户外服饰/5db3b8bb5ac47.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('62', '铁好家居美妆日用百货专营店', '佳钓尼 夏遮阳防晒帽套头面罩透气防紫外线渔夫帽', '', '48.00', '/upload/goods_img/户外服饰/5db3b8bb8e0a3.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('63', '宝仕母婴专营店专柜', '防晒衣男女情侣春夏季防雨风衣超薄透气速干钓鱼防晒服户外皮肤衣MN', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bb9f9e7.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('64', '户外途量工厂专卖店', '城徒 春夏季速干裤男女大码轻薄快干透气户外修身显瘦弹力冲锋裤', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbb3e24.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('65', '宝仕母婴专营店专柜', 'L运动户外夏季速干t恤 男女短袖速干衣快干t恤 吸汗透气', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bbe33ff.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('66', '宝仕母婴专营店专柜', 'L健身房教练速干T恤男女 圆领情侣夏季短袖汗衫', '', '69.00', '/upload/goods_img/户外服饰/5db3b8bc1bca2.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('67', '户外途量工厂专卖店', '城徒 冬季正品户外冲锋裤男女抓绒裤保暖防风防水加厚软壳裤登山裤长裤', '', '75.00', '/upload/goods_img/户外服饰/5db3b8bc42dab.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('68', '江门新会馆', '【江门新会馆】caxa修身弹力女款休闲棉裤 户外休闲快干长裤 女士跑步登山健身裤', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bc96997.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('69', '江门新会馆', '【江门新会馆】caxa休闲修身速干裤 透气轻薄运动裤耐磨健身户外裤多袋裤七分裤', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcac92c.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('70', '探路者正江专卖店', '探路者/TOREAD 运动服 短袖户外女运动跑步排汗透气圆领速干T恤TAJF82784', '', '78.00', '/upload/goods_img/户外服饰/5db3b8bcc53b9.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('71', '户外途量工厂专卖店', '冲锋裤男户外秋冬防风防水软壳裤女加绒加厚抓绒裤保暖徒步登山裤', '', '79.00', '/upload/goods_img/户外服饰/5db3b8bd362c1.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('72', '探路者正江专卖店', '探路者/TOREADT恤女 夏户外女式超轻透气速干衣圆领T恤短袖KAJG82352', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd44554.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('73', '探路者正江专卖店', '探路者/TOREAD 短袖 18春夏新款户外女式圆领速干透气印花短袖T恤TAJG82939', '', '99.00', '/upload/goods_img/户外服饰/5db3b8bd602ab.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('74', '探路者正江专卖店', '探路者/TOREAD夏新款户外运动透气弹力速干女式半袖短袖T恤KAJG82310', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be68f86.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('75', '探路者正江专卖店', '探路者/TOREAD T恤女款 秋季户外短袖女时尚速干透气短袖T恤TAJG82938', '', '99.00', '/upload/goods_img/户外服饰/5db3b8be96a09.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('76', '洋湖轩榭官方旗舰店', '洋湖轩榭 春秋季新款中老年男装连帽冲锋衣爸爸装休闲夹克衫外套男A', '钜惠双十一 感恩惠顾', '126.42', '/upload/goods_img/户外服饰/5db3b8bea6025.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('77', '南城百货专营店', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服', '158.00', '/upload/goods_img/户外服饰/5db3b8bede68a.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('78', '正江服饰专营店', '包邮韵格NT1021男士紧身训练PRO运动健身跑步长袖弹力速干服纯色衣服', '', '59.00', '/upload/goods_img/户外服饰/5db3b8beeb97d.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('79', '流行饰品运动户外器械', '汤河店 户外冲锋裤男女可脱卸秋冬季加绒加厚保暖软壳防风防水登山滑雪裤', '', '179.00', '/upload/goods_img/户外服饰/5db3b8bf07cf9.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('80', '流行饰品运动户外器械', '汤河店 韩国正品vvc防晒衣女经典薄夏季中长款防晒服户外防紫外线皮肤衣', '', '499.00', '/upload/goods_img/户外服饰/5db3b8bf2bf21.jpg', '1572059516', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('81', '乐颐汇数码专营店', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', '2400万AI高清自拍，麒麟710处理器，炫光渐变色', '989.00', '/upload/goods_img/手机数码/5db3b8700e46c.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('82', '乐颐汇数码专营店', '华为/HUAWEI 畅享9 手机 全网通 4GB+128GB', '6.26英寸珍珠屏 4000mAh大电池', '1099.00', '/upload/goods_img/手机数码/5db3b8731cf7b.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('83', '米果商贸专柜', '折叠式平板电脑支架底座懒人手机支架【颜色随机发货】', '', '9.90', '/upload/goods_img/手机数码/5db3b87337179.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('84', '邮乐韵菲专营店', '（亏本促销）车载手机支架双面吸盘式家居懒人多功能通用可弯曲创意手机支架', '', '1.00', '/upload/goods_img/手机数码/5db3b87345fc4.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('85', '麦尚科技专营店', '手机支架懒人支架卡通创意平板电脑桌面支撑座【款式随机】', '', '9.90', '/upload/goods_img/手机数码/5db3b8734f81e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('86', '邮乐韵菲专营店', '无线蓝牙耳机迷你超小苹果安卓通用耳机', '送两条充电线+一个收纳盒', '15.90', '/upload/goods_img/手机数码/5db3b873b60d7.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('87', '万品好易购商城', 'XO NB23 八角宝石锌合金数据线', '产品颜色：黑色  白色 宝石外观 不拘一格;  锌合金 更出色；  2.4A极速充电，高效传输文件', '49.00', '/upload/goods_img/手机数码/5db3b873bf931.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('88', '万品好易购商城', 'XO F1 户外Mini蓝牙音箱 经典挂扣 防水 防尘/防摔 抗干扰性强 无线链接 免提通话', '音量调节/音乐播放、暂停/上下曲切换 语音报号/来电铃声/数据输出/直读SD卡', '99.00', '/upload/goods_img/手机数码/5db3b873d7806.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('89', '万品好易购商城', 'XO  PB39 移动电源 8000mAh', '8000mAh大容量 双输出带LED灯  ； 电源保护, 好用更安全； 智能分流 高效输出', '119.00', '/upload/goods_img/手机数码/5db3b8740878f.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('90', '万品好易购商城', 'XO BS8 运动蓝牙耳机源于经典 加以升级 鲨鱼鳍耳翼 舒适牢固', '源于经典 加以升级； 鲨鱼鳍耳翼 舒适牢固 ； 无惧雨水  防水防汗； 蓝牙4.2版本，深度降噪', '169.00', '/upload/goods_img/手机数码/5db3b87419133.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('91', '万品好易购商城', 'XO BS7 运动蓝牙耳机 深度降噪 通话更清晰 轻松操控 随意切换', '强劲的CSR芯片 提升续航能力； 蓝牙4.1版本，深度降噪，通话更清晰； 霍尔磁控开关，智能感应', '199.00', '/upload/goods_img/手机数码/5db3b8742586e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('92', '万品好易购商城', 'XO A8 蓝牙音箱 智能触控 自由切换 大容量电池 可连续播放约4-6小时 土豪金 星空银 银色', '智能触控，自由切换； 内置1000毫安聚合物电池，全频高清喇叭+低音振膜,可连续播放约4-6小时', '169.00', '/upload/goods_img/手机数码/5db3b874390f2.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('93', '普润家居专营店', 'oppo蓝牙耳机迷你vivo超小隐形运动通用华为无线耳塞超长待机开车', '', '79.00', '/upload/goods_img/手机数码/5db3b874496ae.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('94', '木易生活专柜', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线', '12.90', '/upload/goods_img/手机数码/5db3b874588e2.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('95', '木易生活专柜', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1*', '沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1', '15.90', '/upload/goods_img/手机数码/5db3b8746c166.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('96', '北京信酷数码商城专柜', 'iPhone 苹果原装充电器套装/数据线+充电头电源适配器 通用型', '【全国包邮】 充电套装更优惠', '69.00', '/upload/goods_img/手机数码/5db3b874784b9.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('97', '小牛数码家居专柜', '飞利浦/PHILIPS 多功能可伸缩车载手机支架DLK35002', '多功能可伸缩车载手机支架', '68.00', '/upload/goods_img/手机数码/5db3b87484bf4.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('98', '北京信酷数码商城专柜', '苹果 iphone X /XS MAX/XS/XR/钢化膜 全屏全覆盖 手机贴膜', '', '19.00', '/upload/goods_img/手机数码/5db3b87493e28.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('99', '邮乐萍乡馆', '南孚(NANFU)3V纽扣电池两粒 CR2032/CR2025/CR2016锂电池电子汽车钥匙遥控', '奔驰c200l福特 新蒙迪欧 高尔夫7 新马自达昂克赛拉阿特兹 手表奔驰大众汽车钥匙电池', '9.90', '/upload/goods_img/手机数码/5db3b874a670c.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('100', '信酷小米专营店', '小米（MI） 车载充电器快充版 QC3.0 双口输出 智能温度控制 兼容iOS和Android设备', '小米正品 全国包邮', '89.00', '/upload/goods_img/手机数码/5db3b874b8050.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('101', '北京信酷数码商城专柜', '苹果 iPhone6/6S/6Plus/6SPlus/iPhone7/7P防爆钢化玻璃膜高清手机贴膜', '进口AGC玻璃板！超薄钢化玻璃膜！秒杀国产玻璃！', '26.00', '/upload/goods_img/手机数码/5db3b874c207b.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('102', '北京信酷数码商城专柜', 'OPPO手机原装耳机R11/PLUS入耳式线控r11s/r15耳机 白色盒装', '', '38.80', '/upload/goods_img/手机数码/5db3b874d31ef.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('103', '北京信酷数码商城专柜', '华为（HUAWEI）小天鹅无线蓝牙免提通话音箱4.0 便携户外/车载迷你音响AM08', '音·触即发！360°音效技术，音质真实自然，简洁触控操作，支持蓝牙免提通话。', '95.00', '/upload/goods_img/手机数码/5db3b874e280a.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('104', '北京信酷数码商城专柜', '三星 32G内存卡(CLASS10 48MB/s)  手机内存卡32g MicroSD存储卡', '正品行货 支持专柜验货 实行三包政策 轻放心购买', '95.00', '/upload/goods_img/手机数码/5db3b874edfa5.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('105', '北京信酷数码商城专柜', '华为/HUAWEI 华为快速充电套装 4.5V/5A充电头+type-c线  华为充电器', '支持p20/mate10/9pro/p10plus荣耀10/v10/note10等机型', '98.00', '/upload/goods_img/手机数码/5db3b87504947.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('106', '北京信酷数码商城专柜', '小米（MI）小米手环2（黑色）智能运动 防水 心率监测 计步器 久坐提醒', '正品行货 全国包邮', '159.00', '/upload/goods_img/手机数码/5db3b875133ab.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('107', '信酷小米专营店', '小米活塞耳机 清新版 黑色 蓝色 入耳式手机耳机 通用耳麦', '小米正品 全国包邮', '45.00', '/upload/goods_img/手机数码/5db3b8751ef2e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('108', '信酷小米专营店', '小米支架式自拍杆 灰色 黑色 蓝牙遥控迷你便携带三脚架多功能', '小米正品 全国包邮', '105.00', '/upload/goods_img/手机数码/5db3b875327b2.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('109', '信酷小米专营店', '小米（MI）方盒子蓝牙音箱2 无线迷你随身户外便携客厅家用小音响', '小米正品 全国包邮', '149.00', '/upload/goods_img/手机数码/5db3b87546807.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('110', '信酷小米专营店', '小米（MI）小米运动蓝牙耳机mini 黑色白色 无线蓝牙入耳式运动耳机', '小米正品 全国包邮', '169.00', '/upload/goods_img/手机数码/5db3b8755a85b.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('111', '信酷小米专营店', '小米（MI）小钢炮2代 无线蓝牙便携音箱', '小米正品 全国包邮', '139.00', '/upload/goods_img/手机数码/5db3b87564c6e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('112', '铁好家居美妆日用百货专营店', '公牛BULL 独立3孔位2USB创意魔方插座 1.5米线GN-UUB122【热卖推荐】', '立体集成结构 小巧轻便 五重保护', '67.00', '/upload/goods_img/手机数码/5db3b87575612.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('113', '九洲科瑞数码专营店', '华为 HUAWEI 畅享9 Plus 4GB+128GB', '', '1.00', '/upload/goods_img/手机数码/5db3b8758639e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('114', '九洲科瑞数码专营店', '华为HUAWEI nova4 4800万超广角三摄8GB+128GB', '', '2.00', '/upload/goods_img/手机数码/5db3b875932a9.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('115', '九洲科瑞数码专营店', '华为 HUAWEI P30 Pro 徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128G', '', '4.00', '/upload/goods_img/手机数码/5db3b8759d6bb.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('116', '邮乐萍乡馆', '南孚 安卓数据线 NF-LM001 小米华为OPPO三星vivo充电器通用', '', '9.90', '/upload/goods_img/手机数码/5db3b875a923e.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('117', '铁好家电数码专营店', '公牛BULL 二合一苹果lighting+micro USB数据线GN-J81N【热卖推荐】', 'MFi官方认证，快速充电，抗折断', '69.00', '/upload/goods_img/手机数码/5db3b875b2e80.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('118', '邮乐萍乡馆', '南孚(NANFU)LR6AA聚能环 5号+7号碱性干电池【共4粒装】', '', '9.90', '/upload/goods_img/手机数码/5db3b875be233.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('119', '岳灵生活专营店', '南孚手机充电宝 10000毫安大容量礼盒装NFCT10', '', '169.00', '/upload/goods_img/手机数码/5db3b875cad56.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('120', '邮乐萍乡馆', '南孚(NANFU)LR03AAA聚能环7号电池碱性干电池12粒装儿童玩具遥控器赛车闹钟智能门锁电池', 'AAA干电池持久电力家用', '27.80', '/upload/goods_img/手机数码/5db3b875d3610.jpg', '1572059524', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('121', '中国农垦官方旗舰店', '买2份送一份【中国农垦】黑龙江北大荒  支豆浆粉早餐豆浆粉 非转基因大豆 五谷豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d338ebc.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('122', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒支装豆浆粉（醇豆浆、红枣味可选） 非转基因大豆', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3432ce.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('123', '牛牛食品专营店', '(8月新货)蒙牛小真果粒125ml*20盒草莓味果粒酸奶小胖丁迷你装', '8月份的新货,超好喝，儿童，果粒，健康营养，', '22.70', '/upload/goods_img/特色美食/5db3b8d34deb1.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('124', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 支装豆浆粉 麦香甜豆浆粉 28g*10袋', '早餐豆粉买2份送一份', '15.00', '/upload/goods_img/特色美食/5db3b8d3651ce.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('125', '禾煜食品旗舰店', '禾煜 黄冰糖418g包  冰糖土冰糖  煲汤食材', '黄冰糖买2送1', '15.00', '/upload/goods_img/特色美食/5db3b8d66e304.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('126', '新农哥旗舰店', '【新农哥】板栗仁108gx4袋  休闲零食小吃', '', '26.90', '/upload/goods_img/特色美食/5db3b8d6832f9.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('127', '新农哥旗舰店', '新农哥 每日坚果 混合果仁 缤纷坚果仁175g*2盒  休闲零食', '缤纷美味 一吃钟情', '59.90', '/upload/goods_img/特色美食/5db3b8d68e2c4.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('128', '众天蜂蜜邮乐农品旗舰店', '众天山花蜂蜜500g', '秦岭深处 百花酿造而成 最受欢迎的蜂蜜 性价比极高！', '19.90', '/upload/goods_img/特色美食/5db3b8d6a2ed1.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('129', '中国农垦官方旗舰店', '【中国农垦】黑龙江 北大荒 非转基因大豆 豆浆粉 红枣豆浆粉28g*10袋', '早餐豆粉买2份送一份', '18.00', '/upload/goods_img/特色美食/5db3b8d6ae283.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('130', '考拉小哥专营店', '薛小贱 每日坚果25g*1包', '厂家直供、7种混合、日期新鲜', '1.66', '/upload/goods_img/特色美食/5db3b8d6b8e66.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('131', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂五宝茶 益本茶 男人茶养生茶 草本', '【萃涣堂】五宝益本茶 男人茶买2送1五宝茶男人茶枸杞茶玛咖片黄精男肾茶老公八宝茶养生茶 做性福的男人', '19.00', '/upload/goods_img/特色美食/5db3b8d6c8481.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('132', '萃涣堂蒲公英茶专柜', '【滨州馆】寻味山东新鲜现做手工 滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '寻味山东 新鲜现做手工滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮', '1.00', '/upload/goods_img/特色美食/5db3b8d6cc302.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('133', '正江食品专营店', '寿全斋  红枣姜茶 姜茶 12g*10条', '', '25.00', '/upload/goods_img/特色美食/5db3b8d6debe7.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('134', '阿坝州理县地方扶贫馆', '四川浓香菜籽油 5升农家非转基因5l纯菜子粮油食用油约10斤植物油', '2019新油，滴滴香浓，四川非转基因纯菜籽油', '66.00', '/upload/goods_img/特色美食/5db3b8d6f246b.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('135', '千岛湖品牌农产品馆', '千岛湖 千岛渔娘 糍粑（4味）200g', '买二赠一 糍粑', '15.00', '/upload/goods_img/特色美食/5db3b8d706ecd.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('136', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶', '0.50', '/upload/goods_img/特色美食/5db3b8d713dd8.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('137', '果蔻食品专营店', '果蔻 每日坚果B款20g/包简装无礼盒成人儿童孕妇混合果仁坚果零食大礼包', '科学配比  营养美味', '1.39', '/upload/goods_img/特色美食/5db3b8d729985.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('138', '萃涣堂蒲公英茶专柜', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山', '0.50', '/upload/goods_img/特色美食/5db3b8d736890.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('139', '佳林院红枣旗舰店', '【0.4元/袋佳林院泡茶煮粥煲汤枣圈】山东特产乐陵红枣每袋约12克袋装50袋起拍包邮部分偏远地区除外', '佳林院品牌装，泡茶煮粥枣圈，拼团价0.4元/袋，每袋约12克装，50袋起拍，食用方便，经济实惠！', '0.40', '/upload/goods_img/特色美食/5db3b8d798327.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('140', '果蔻食品专营店', '果蔻 每日坚果25g*1包成人儿童孕妇混合坚果混合果仁小吃零食', '', '1.65', '/upload/goods_img/特色美食/5db3b8d7aa43b.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('141', '萃涣堂蒲公英茶专柜', '【滨州馆】红枣黑糖姜茶大姨妈水姜糖女老姜块生姜姜汁姜汤红糖姜枣茶小袋装25克/袋', '姜味浓,红枣多,顺畅暖暖,效果杠杠“冬吃萝卜夏吃姜。”传统组方真材实料。', '0.90', '/upload/goods_img/特色美食/5db3b8dab8392.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('142', '南阳专区专营店', '南阳西峡现摘金桃黄心猕猴桃15枚 （单枚60g-90g）买一送一 共30枚，合并发一箱', '买一赠一活动', '19.90', '/upload/goods_img/特色美食/5db3b8dac3745.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('143', '果然好口福专柜', '宁 福吉 5斤起拍新疆原味生核桃新货 特产薄皮核桃 坚果炒货休闲零食包邮', '新疆薄皮核桃  送夹子', '9.90', '/upload/goods_img/特色美食/5db3b8daea466.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('144', '刘陶生鲜旗舰店', '刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果2', '', '25.50', '/upload/goods_img/特色美食/5db3b8db3a40e.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('145', '丹东邮政农特产品专营店', '2019年丹东新鲜板栗4斤东北农家生板栗毛栗子现摘栗子应季水果干', '', '19.90', '/upload/goods_img/特色美食/5db3b8db3a7f6.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('146', '果然好口福专柜', '宁福吉 新疆和田大枣煲粥枣500克包邮', '', '6.60', '/upload/goods_img/特色美食/5db3b8db578d5.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('147', '小呆妞旗舰店', '预售小呆妞四川蒲江金艳黄心猕猴桃90-110g中果24枚 72内小时发货', '关于售后：签收24小时内后台申请退款请提供坏果和快递单合照，会根据实际损坏赔付', '27.90', '/upload/goods_img/特色美食/5db3b8db63c28.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('148', '萃涣堂蒲公英茶专柜', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包伴手礼花茶茶包组合玫瑰茉莉绿茶袋泡三', '萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包', '0.90', '/upload/goods_img/特色美食/5db3b8db71303.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('149', '丹东邮政农特产品专营店', '新鲜现挖番薯红黄心密署农家自种蒸煮粉糯香甜沙地地瓜烤烟署5斤', '', '16.80', '/upload/goods_img/特色美食/5db3b8db862f8.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('150', '川锅壹号旗舰店', '川锅壹号辣白菜228g韩国泡菜下饭菜正宗朝鲜口味拌饭菜版面菜', '酸辣可口 老少皆宜', '5.90', '/upload/goods_img/特色美食/5db3b8dbcdf79.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('151', '福香御旗舰店', '福香御 慢生长2018东北大米雪花米10斤真空包邮色选米', '初霜收割，180天慢生长周期，30天鲜磨直达，大米胚乳含量极为丰富，口感软糯香甜。', '27.90', '/upload/goods_img/特色美食/5db3b8dbdb26c.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('152', '兰州鲜合苑百合特产店专营店', '现包现发100%新鲜正宗兰州市七里河区产兰州鲜百合3年生兰州百合农家甜百合，约16颗百合一斤', '兰州鲜百合，无任何添加剂，宝宝也可以放心食用', '19.90', '/upload/goods_img/特色美食/5db3b8dbe8d2f.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('153', '当季鲜果', '黄金奇异果12枚包邮（中果70-90克，拍2件多送6枚，合并发30枚）金艳黄心猕猴桃新鲜水果', '快递随机，不能指定快递，下单后72小时内发货，下雨天顺延，购买前请阅读售后要求，介意慎拍', '9.90', '/upload/goods_img/特色美食/5db3b8dc0be0c.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('154', '丹东邮政农特产品专营店', '东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田', '东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田', '28.80', '/upload/goods_img/特色美食/5db3b8dc17d77.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('155', '川锅壹号旗舰店', '川锅壹号蟹黄酱拌饭酱秃黄油拌面酱蟹粉酱蟹黄膏酱料即食螃蟹酱', '金脂香软 经典美味', '9.90', '/upload/goods_img/特色美食/5db3b8dc2c59c.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('156', '刘陶生鲜旗舰店', '刘陶 云南昭通丑苹果5斤大果（13-15个）新鲜水果', '拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买', '27.00', '/upload/goods_img/特色美食/5db3b8dc365c6.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('157', '福香御旗舰店', '福香御 大米5kg装2018新米圆粒珍珠米寿司香米秋田小町农家东北大米包邮', '', '29.99', '/upload/goods_img/特色美食/5db3b8de5a091.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('158', '刘陶生鲜旗舰店', '刘陶 云南石林人生果圆果净果5斤（25-35个）大果新鲜水果2', '拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买', '25.00', '/upload/goods_img/特色美食/5db3b8de6ec9e.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('159', '刘陶生鲜旗舰店', '刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果特卖', '', '25.50', '/upload/goods_img/特色美食/5db3b8de7ac09.jpg', '1572059535', '0', '1');
INSERT INTO `xy_goods_list_copy` VALUES ('160', '萃涣堂蒲公英茶专柜', '【萃涣堂】 蜜桃乌龙茶  水果茶 三角包共蜜桃白桃乌龙茶袋泡花茶包花', '新品上市!独立三角袋泡茶,携带冲泡更便捷!【萃涣堂】 蜜桃乌龙茶 水果茶 三角包', '0.90', '/upload/goods_img/特色美食/5db3b8de97517.jpg', '1572059535', '0', '1');

-- ----------------------------
-- Table structure for xy_index_msg
-- ----------------------------
DROP TABLE IF EXISTS `xy_index_msg`;
CREATE TABLE `xy_index_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '文本内容',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1平台公告 2平台简介 3抢单规则 4代理合作 5常见问题',
  `addtime` int(10) NOT NULL COMMENT '发表时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0发布 1不发布',
  `author` varchar(10) NOT NULL DEFAULT '' COMMENT '作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='首页内容表';

-- ----------------------------
-- Records of xy_index_msg
-- ----------------------------
INSERT INTO `xy_index_msg` VALUES ('1', '平台公告', '<p style=\"text-align: center;\">平台没有线下客服，有什么问题请咨询在线客服，</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>', '3', '1582282831', '1', 'admin');
INSERT INTO `xy_index_msg` VALUES ('2', '平台简介', '<p>尊敬的用户:<br />\r\n您好!欢迎您来到招财猫APP。 招财猫是一个第三方智能云控主机匹配订单平台,平台与天猫、淘宝、拼多多、京东和美丽说等网购平台商家合作.通过智能云系统将商家订单匹配给平台用户,借此提高商家在各大平台的成交量和信誉度。 改进了传统网购提交订单繁琐的模式,由远程智能云服务器自动化提交订单,平台用户只需要在平台提供真实的收货地址、电话和一些真实的购物信息,传入智能云主机,即可由智能云控制远程电脑机器人自动模拟人工提交订单操作流程, 让网购订单匹配变得更加高效简单!平台每天都会将需要提高曝光度的商家产品放到平台上,提供给平台用户进行抢单。为了规避网购平台的检测,提高订单的真实性,新用户在抢单前必须先完善个人真实信息,并填写真实的收货址。 为了有效的帮助商家提升订单成功率, 规避商家被检查到虚假订单的风险,平台将会根据您当前的操作IP,设备型号对当天的订单进行优化匹配。 所有订单匹配均需要通过智能云算法实现, 请您耐心等待。平台用户可通过推广新人加入平台自动成为平台的代理,成为代理后可以获得额外的提成奖励。 平台用户每提交一个订单,平台都会将商家支付的90%推广费用回馈给用户。</p>', '3', '1582267695', '1', 'admin');
INSERT INTO `xy_index_msg` VALUES ('3', '抢单规则', '<p>尊敬的用户您好:<br />\r\n佣金分配:平台会员所得佣金（请参考会员规则）,提交订单后系统自动将订单金额及佣金一并返还到会员账户上为了提升平台的匹配速度,注册成功7天0抢单记录的账号进行封号处理。同一人银行卡信息请勿重复注册抢单,一经发现将会冻结账户。个人多账户抢单会导致商家封店,影响商家的信誉以及销售单作废,本平台禁止一卡绑定多账户,请各位会员遵守规则,若发现一卡绑定多账户行为给以资金冻结90天,账户永久封号处理。云淘客为了防止有人恶意进行洗黑钱或者套现一系列不法行为,会员每日未完成50单提现系统审核不通过,会员需完成50单方可全额提现,提现审核成功后,到账时间为D+1(次日24点前)到账,具体到账时间以银行为准!</p>', '3', '1581768439', '1', 'admin');
INSERT INTO `xy_index_msg` VALUES ('4', '代理合作', '<p><span style=\"font-size:14px;\"><strong>招财猫平台0投资开启三级代理模式<br />\r\n平台用户可以通过推荐新人成为平台的代理,代理可以获得额外的动态奖励,直推一级用户奖励为一级用户每天所抢订单金额的0.06%,二级用户奖励为二级用户每天所抢订单金额的0.04%,三级用户奖励为三级用户每天所抢订单金额0.02%.</strong></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><strong>注:所有代理下线的会员产生的佣金奖励均为本平台所出,不影响所有代理以及下线会员的佣金,直属动态奖励每天自动结算发放到您的APP钱包账号,详情可在APP内直接咨询在线客服。</strong></span></p>\r\n\r\n<div data-type=\"insert-html\">\r\n<h1>&nbsp;</h1>\r\n</div>', '3', '1582267717', '1', 'admin');
INSERT INTO `xy_index_msg` VALUES ('5', '常见问题', '<p>提现.充值<br />\r\n一关于充值</p>\r\n\r\n<p>充值在首页&quot;充值管理&quot;进行充值。点击&ldquo;充值管理&rdquo;按钮,然后填写充值金额,点击立即充值,根据系统匹配的转账金额进行汇款充值。 务必按照平台提供的账户汇款(账号信息请用复制黏贴),转账成功后上传截图,最后点击&ldquo;提交&rdquo;即可完成。 为保证快速到账,系统会随机匹配您要充值的金额, 请务必按照系统匹配的金额进行充值,否则将不会到账.</p>\r\n\r\n<p>二关于提现</p>\r\n\r\n<p>提现时间为每日09:00---21:00用户提现平台收取提现金额千分之二的手续费!提现在首页&quot;提现管理&quot;进行提现, 提现到账时间为次日23:59前到账,具体到账时间以银行为准。</p>\r\n\r\n<p>三关于订单</p>\r\n\r\n<p>冻结平台将订单匹配给用户的同时,平台将该笔订单的信息提交到商家的后台,为了规避网购平台的监管,若用户在两分钟之内没有提交订单,该笔订单将会被冻结。 需等待系统24小时后自行解冻(解冻流程:进入平台首页--记录--冻结中--解冻),请各位用户知悉。</p>', '5', '1581779334', '1', 'admin');
INSERT INTO `xy_index_msg` VALUES ('6', '新手指南', '<p>详情可查看客服栏说明，充值提现问题可咨询客服24小时在线，</p>', '1', '1582267743', '1', 'admin');
INSERT INTO `xy_index_msg` VALUES ('7', '利息宝规则', '<p>1、每天24点自动产生收益<br />\r\n2、资金可转入转出<br />\r\n3、收益 = 理财宝金额 * 0.09%<br />\r\n4、理财宝转出到余额需要1小时</p>', '1', '1581770642', '0', 'admin');

-- ----------------------------
-- Table structure for xy_io_log
-- ----------------------------
DROP TABLE IF EXISTS `xy_io_log`;
CREATE TABLE `xy_io_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` char(18) NOT NULL,
  `amount` decimal(7,2) NOT NULL COMMENT '支付金额',
  `tran_amount` decimal(7,2) NOT NULL COMMENT '实收金额',
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '1收入(用户充值) 2支出(用户提现)',
  `addtime` int(10) unsigned NOT NULL COMMENT '交易时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='平台收支记录表';

-- ----------------------------
-- Records of xy_io_log
-- ----------------------------
INSERT INTO `xy_io_log` VALUES ('1', 'SY1912031806546099', '4000.00', '3840.00', '1', '1575367651');
INSERT INTO `xy_io_log` VALUES ('2', 'SY1912031824081143', '150.00', '144.00', '1', '1575368785');
INSERT INTO `xy_io_log` VALUES ('3', 'SY1912031845513007', '501.00', '480.96', '1', '1575369977');
INSERT INTO `xy_io_log` VALUES ('4', 'SY1912031851318979', '101.00', '96.96', '1', '1575370511');
INSERT INTO `xy_io_log` VALUES ('5', 'SY1912032002378716', '101.00', '96.96', '1', '1575374628');
INSERT INTO `xy_io_log` VALUES ('6', 'SY1912032013233300', '301.00', '288.96', '1', '1575375225');
INSERT INTO `xy_io_log` VALUES ('7', 'SY1912032053488967', '1001.00', '960.96', '1', '1575377661');
INSERT INTO `xy_io_log` VALUES ('8', 'SY1912032123401294', '100.00', '96.00', '1', '1575379469');
INSERT INTO `xy_io_log` VALUES ('9', 'SY1912032137588136', '3001.00', '2880.96', '1', '1575380346');
INSERT INTO `xy_io_log` VALUES ('10', 'SY1912032150599905', '100.00', '96.00', '1', '1575381109');
INSERT INTO `xy_io_log` VALUES ('11', 'SY1912040904468880', '201.00', '192.96', '1', '1575421508');
INSERT INTO `xy_io_log` VALUES ('12', 'SY1912040911104833', '403.00', '386.88', '1', '1575421894');
INSERT INTO `xy_io_log` VALUES ('13', 'SY1912040911146962', '301.00', '288.96', '1', '1575421898');
INSERT INTO `xy_io_log` VALUES ('14', 'SY1912040913316278', '701.00', '672.96', '1', '1575422030');
INSERT INTO `xy_io_log` VALUES ('15', 'SY1912040927122943', '100.00', '96.00', '1', '1575422887');
INSERT INTO `xy_io_log` VALUES ('16', 'SY1912040934306622', '101.00', '96.96', '1', '1575423378');
INSERT INTO `xy_io_log` VALUES ('17', 'SY1912040938472978', '2500.00', '2400.00', '1', '1575423727');
INSERT INTO `xy_io_log` VALUES ('18', 'SY1912040955485352', '1000.00', '960.00', '1', '1575424781');
INSERT INTO `xy_io_log` VALUES ('19', 'SY1912041004453090', '200.00', '192.00', '1', '1575425125');
INSERT INTO `xy_io_log` VALUES ('20', 'SY1912041005092162', '501.00', '480.96', '1', '1575425190');
INSERT INTO `xy_io_log` VALUES ('21', 'SY1912041036412042', '500.00', '480.00', '1', '1575427031');
INSERT INTO `xy_io_log` VALUES ('22', 'SY1912040937438763', '2001.00', '1920.96', '1', '1575427748');
INSERT INTO `xy_io_log` VALUES ('23', 'SY1912041058367841', '998.00', '958.08', '1', '1575428364');
INSERT INTO `xy_io_log` VALUES ('24', 'SY1912041126341061', '240.00', '230.40', '1', '1575430061');
INSERT INTO `xy_io_log` VALUES ('25', 'SY1912040928465184', '101.00', '96.96', '1', '1575430281');
INSERT INTO `xy_io_log` VALUES ('26', 'SY1912041308486510', '200.00', '192.00', '1', '1575436156');
INSERT INTO `xy_io_log` VALUES ('27', 'SY1912041106101377', '1000.00', '960.00', '1', '1575439127');
INSERT INTO `xy_io_log` VALUES ('28', 'SY1912041421325245', '1001.00', '960.96', '1', '1575440527');
INSERT INTO `xy_io_log` VALUES ('29', 'SY1912041448276020', '547.00', '525.12', '1', '1575442172');
INSERT INTO `xy_io_log` VALUES ('30', 'SY1912041510045098', '300.00', '288.00', '1', '1575443433');
INSERT INTO `xy_io_log` VALUES ('31', 'SY1912041518389400', '101.00', '96.96', '1', '1575443994');
INSERT INTO `xy_io_log` VALUES ('32', 'SY1912041957439437', '2005.00', '1924.80', '1', '1575460699');
INSERT INTO `xy_io_log` VALUES ('33', 'SY1912041852431825', '1000.00', '960.00', '1', '1575461930');
INSERT INTO `xy_io_log` VALUES ('34', 'CO1912031244329732', '184.00', '184.00', '2', '1575483832');
INSERT INTO `xy_io_log` VALUES ('35', 'SY1912051107217488', '1201.00', '1152.96', '1', '1575515283');
INSERT INTO `xy_io_log` VALUES ('36', 'SY1912051115237874', '3000.00', '2880.00', '1', '1575515905');
INSERT INTO `xy_io_log` VALUES ('37', 'SY1912051119217806', '3001.00', '2880.96', '1', '1575515995');
INSERT INTO `xy_io_log` VALUES ('38', 'CO1912050920116917', '115.00', '115.00', '2', '1575516202');
INSERT INTO `xy_io_log` VALUES ('39', 'CO1912041510491991', '582.00', '582.00', '2', '1575548124');
INSERT INTO `xy_io_log` VALUES ('40', 'CO1912040949065387', '213.00', '213.00', '2', '1575599082');
INSERT INTO `xy_io_log` VALUES ('41', 'CO1912041057579306', '382.00', '382.00', '2', '1575599093');
INSERT INTO `xy_io_log` VALUES ('42', 'CO1912041059012065', '333.00', '333.00', '2', '1575599102');
INSERT INTO `xy_io_log` VALUES ('43', 'CO1912041119026778', '1144.00', '1144.00', '2', '1575599107');
INSERT INTO `xy_io_log` VALUES ('44', 'CO1912051636283599', '300.00', '300.00', '2', '1575604375');
INSERT INTO `xy_io_log` VALUES ('45', 'CO1912051352523210', '966.00', '966.00', '2', '1575604532');
INSERT INTO `xy_io_log` VALUES ('46', 'CO1912051308527355', '1067.00', '1067.00', '2', '1575604545');
INSERT INTO `xy_io_log` VALUES ('47', 'CO1912051253082865', '108.00', '108.00', '2', '1575604559');
INSERT INTO `xy_io_log` VALUES ('48', 'CO1912051208138167', '162.00', '162.00', '2', '1575604604');
INSERT INTO `xy_io_log` VALUES ('49', 'CO1912051142109772', '342.00', '342.00', '2', '1575605050');
INSERT INTO `xy_io_log` VALUES ('50', 'CO1912051131222347', '107.00', '107.00', '2', '1575605065');
INSERT INTO `xy_io_log` VALUES ('51', 'CO1912051129149779', '1296.00', '1296.00', '2', '1575605090');
INSERT INTO `xy_io_log` VALUES ('52', 'CO1912051400111435', '106.00', '106.00', '2', '1575610955');
INSERT INTO `xy_io_log` VALUES ('53', 'SY1912061418399195', '200.00', '192.00', '1', '1575613155');
INSERT INTO `xy_io_log` VALUES ('54', 'SY1912061259444913', '3000.00', '2880.00', '1', '1575613850');
INSERT INTO `xy_io_log` VALUES ('55', 'CO1912050957392132', '184.00', '184.00', '2', '1575614156');
INSERT INTO `xy_io_log` VALUES ('56', 'CO1912051419251929', '542.00', '542.00', '2', '1575615960');
INSERT INTO `xy_io_log` VALUES ('57', 'SY1912061512085984', '101.00', '96.96', '1', '1575616576');
INSERT INTO `xy_io_log` VALUES ('58', 'SY1912061526508793', '102.00', '97.92', '1', '1575617546');
INSERT INTO `xy_io_log` VALUES ('59', 'SY1912061529031209', '101.00', '96.96', '1', '1575617564');
INSERT INTO `xy_io_log` VALUES ('60', 'CO1912051022577627', '352.00', '352.00', '2', '1575617723');
INSERT INTO `xy_io_log` VALUES ('61', 'SY1912061554274679', '101.00', '96.96', '1', '1575619058');
INSERT INTO `xy_io_log` VALUES ('62', 'SY1912061607423527', '101.00', '96.96', '1', '1575619841');
INSERT INTO `xy_io_log` VALUES ('63', 'SY1912061628232798', '100.00', '96.00', '1', '1575620964');
INSERT INTO `xy_io_log` VALUES ('64', 'CO1912061603555245', '339.00', '339.00', '2', '1575622417');
INSERT INTO `xy_io_log` VALUES ('65', 'SY1912061937514921', '1001.00', '960.96', '1', '1575632556');
INSERT INTO `xy_io_log` VALUES ('66', 'CO1912050927426370', '213.00', '213.00', '2', '1575634226');
INSERT INTO `xy_io_log` VALUES ('67', 'CO1912050935067764', '1143.00', '1143.00', '2', '1575634231');
INSERT INTO `xy_io_log` VALUES ('68', 'CO1912051015377587', '440.00', '440.00', '2', '1575634235');
INSERT INTO `xy_io_log` VALUES ('69', 'CO1912051019256957', '494.00', '494.00', '2', '1575634241');
INSERT INTO `xy_io_log` VALUES ('70', 'CO1912051021264502', '231.00', '231.00', '2', '1575634246');
INSERT INTO `xy_io_log` VALUES ('71', 'CO1912041023195493', '1070.00', '1070.00', '2', '1575634272');
INSERT INTO `xy_io_log` VALUES ('72', 'CO1912040949065067', '214.00', '214.00', '2', '1575634277');
INSERT INTO `xy_io_log` VALUES ('73', 'CO1912040945442584', '986.00', '986.00', '2', '1575634279');
INSERT INTO `xy_io_log` VALUES ('74', 'CO1912040940293536', '167.00', '167.00', '2', '1575634286');
INSERT INTO `xy_io_log` VALUES ('75', 'CO1912041147378152', '255.00', '255.00', '2', '1575634321');
INSERT INTO `xy_io_log` VALUES ('76', 'SY1912062021305341', '998.00', '958.08', '1', '1575634990');
INSERT INTO `xy_io_log` VALUES ('77', 'SY1912071225081350', '1001.00', '960.96', '1', '1575692904');
INSERT INTO `xy_io_log` VALUES ('78', 'SY1912071352262090', '101.00', '96.96', '1', '1575698123');
INSERT INTO `xy_io_log` VALUES ('79', 'SY1912071306234436', '102.00', '97.92', '1', '1575698230');
INSERT INTO `xy_io_log` VALUES ('80', 'SY1912071454058545', '150.00', '144.00', '1', '1575701805');
INSERT INTO `xy_io_log` VALUES ('81', 'SY1912071605231049', '100.00', '96.00', '1', '1575706334');
INSERT INTO `xy_io_log` VALUES ('82', 'SY1912071945354218', '110.00', '105.60', '1', '1575719289');
INSERT INTO `xy_io_log` VALUES ('83', 'SY1912081120475596', '3001.00', '2880.96', '1', '1575775284');
INSERT INTO `xy_io_log` VALUES ('84', 'SY1912081316284930', '1001.00', '960.96', '1', '1575782295');
INSERT INTO `xy_io_log` VALUES ('85', 'SY1912081438524739', '101.00', '96.96', '1', '1575787233');
INSERT INTO `xy_io_log` VALUES ('86', 'SY1912081446441564', '102.00', '97.92', '1', '1575787890');
INSERT INTO `xy_io_log` VALUES ('87', 'SY1912081522276634', '105.00', '100.80', '1', '1575789846');
INSERT INTO `xy_io_log` VALUES ('88', 'SY1912081523148345', '801.00', '768.96', '1', '1575790153');
INSERT INTO `xy_io_log` VALUES ('89', 'SY1912081755177755', '201.00', '192.96', '1', '1575798954');
INSERT INTO `xy_io_log` VALUES ('90', 'SY1912081119239836', '101.00', '96.96', '1', '1575801313');
INSERT INTO `xy_io_log` VALUES ('91', 'CO1912060950086421', '207.00', '207.00', '2', '1575860513');
INSERT INTO `xy_io_log` VALUES ('92', 'CO1912061116272856', '571.00', '571.00', '2', '1575860521');
INSERT INTO `xy_io_log` VALUES ('93', 'CO1912061120236986', '228.00', '228.00', '2', '1575860527');
INSERT INTO `xy_io_log` VALUES ('94', 'CO1912061318277056', '5075.00', '5075.00', '2', '1575860578');
INSERT INTO `xy_io_log` VALUES ('95', 'CO1912061434094302', '2455.00', '2455.00', '2', '1575860847');
INSERT INTO `xy_io_log` VALUES ('96', 'CO1912061441535610', '341.00', '341.00', '2', '1575860889');
INSERT INTO `xy_io_log` VALUES ('97', 'SY1912091318099221', '101.00', '96.96', '1', '1575868757');
INSERT INTO `xy_io_log` VALUES ('98', 'CO1912091351171459', '5406.00', '5406.00', '2', '1575870749');
INSERT INTO `xy_io_log` VALUES ('99', 'SY1912091517155897', '1002.00', '961.92', '1', '1575875997');
INSERT INTO `xy_io_log` VALUES ('100', 'CO1912061408531910', '9620.00', '9620.00', '2', '1575894273');
INSERT INTO `xy_io_log` VALUES ('101', 'SY1912100902597375', '400.00', '384.00', '1', '1575939880');

-- ----------------------------
-- Table structure for xy_level
-- ----------------------------
DROP TABLE IF EXISTS `xy_level`;
CREATE TABLE `xy_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `order_num` int(12) DEFAULT NULL COMMENT '接单限制',
  `num` decimal(18,2) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `bili` decimal(18,4) DEFAULT NULL COMMENT '比例',
  `level` int(11) DEFAULT NULL COMMENT 'd等级',
  `tixian_ci` int(11) DEFAULT NULL COMMENT '提现次数',
  `tixian_min` decimal(18,2) DEFAULT NULL,
  `tixian_max` decimal(18,2) DEFAULT NULL COMMENT '提现最大金额',
  `num_min` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of xy_level
-- ----------------------------
INSERT INTO `xy_level` VALUES ('1', '普通会员', '30', '0.00', '2020-02-05 17:48:29', '0.0025', '0', '1', '100.00', '10000.00', '1.00');
INSERT INTO `xy_level` VALUES ('2', '初级会员', '40', '88.00', '2020-02-05 17:48:29', '0.0030', '1', '5', '100.00', '20000.00', '1.00');
INSERT INTO `xy_level` VALUES ('3', '高级会员', '50', '188.00', '2020-02-05 17:48:29', '0.0035', '2', '10', '100.00', '50000.00', '1.00');
INSERT INTO `xy_level` VALUES ('4', '尊享会员', '60', '388.00', '2020-02-05 17:48:29', '0.0040', '3', '20', '100.00', '100000.00', '1.00');

-- ----------------------------
-- Table structure for xy_lixibao
-- ----------------------------
DROP TABLE IF EXISTS `xy_lixibao`;
CREATE TABLE `xy_lixibao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `num` decimal(18,5) DEFAULT NULL,
  `addtime` int(10) DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of xy_lixibao
-- ----------------------------
INSERT INTO `xy_lixibao` VALUES ('1', '1', '1.00000', '1581428537', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('2', '1', '1.00000', '1581428542', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('3', '1', '2.00000', '1581428621', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('4', '1', '3.00000', '1581428629', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('5', '1', '2.00000', '1581428751', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('6', '1', '33.00000', '1581428942', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('7', '1', '6.00000', '1581430775', null, '2', '1');
INSERT INTO `xy_lixibao` VALUES ('8', '1', '11.00000', '1581430921', null, '2', '1');
INSERT INTO `xy_lixibao` VALUES ('9', '1', '11.00000', '1581430963', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('10', '1', '0.19500', '1581434554', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('11', '1', '0.19500', '1581434866', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('12', '1', '0.19500', '1581436028', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('13', '1', '0.19500', '1581436056', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('14', '1', '0.19500', '1581438945', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('15', '1', '0.19500', '1581439719', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('16', '15', '500.00000', '1581688447', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('17', '15', '500.00000', '1581688467', null, '2', '1');
INSERT INTO `xy_lixibao` VALUES ('18', '15', '500.00000', '1581688545', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('19', '1', '100.00000', '1581751814', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('20', '1', '139.00000', '1581755999', null, '2', '1');
INSERT INTO `xy_lixibao` VALUES ('21', '1', '1000.00000', '1581779276', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('22', '3', '1000.00000', '1581780603', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('23', '1', '0.90000', '1581785025', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('24', '3', '0.90000', '1581785025', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('25', '1', '0.90000', '1581869402', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('26', '3', '0.90000', '1581869402', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('27', '21', '10591.00000', '1582021899', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('28', '21', '9.53190', '1582042201', null, '3', '1');
INSERT INTO `xy_lixibao` VALUES ('29', '21', '10591.00000', '1582063107', null, '2', '1');
INSERT INTO `xy_lixibao` VALUES ('30', '1', '500.00000', '1583253743', null, '1', '0');
INSERT INTO `xy_lixibao` VALUES ('31', '1', '500.00000', '1583253768', null, '2', '1');
INSERT INTO `xy_lixibao` VALUES ('32', '3', '100.00000', '1584980321', null, '1', '0');

-- ----------------------------
-- Table structure for xy_member_address
-- ----------------------------
DROP TABLE IF EXISTS `xy_member_address`;
CREATE TABLE `xy_member_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '收货姓名',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '收货手机',
  `area` varchar(255) NOT NULL COMMENT '地区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址-详情',
  `is_default` tinyint(1) unsigned DEFAULT '0' COMMENT '默认地址',
  `addtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_xy_member_address_uid` (`uid`) USING BTREE,
  KEY `index_xy_member_address_is_default` (`is_default`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员收货地址';

-- ----------------------------
-- Records of xy_member_address
-- ----------------------------
INSERT INTO `xy_member_address` VALUES ('171', '1', '11', '17319266011', '北京 东城区', '111', '1', '1577626187');
INSERT INTO `xy_member_address` VALUES ('172', '2', 'Liuchao', '18111111111', '陕西 安康 汉滨区', 'Nsnsbbq', '1', '1581622319');
INSERT INTO `xy_member_address` VALUES ('173', '15', 'sd', '13988888888', '北京 东城区', '111', '1', '1581688862');
INSERT INTO `xy_member_address` VALUES ('174', '3', '刘', '18177777777', '陕西 铜川 耀州区', '123456', '1', '1581765289');
INSERT INTO `xy_member_address` VALUES ('175', '16', '张', '13854646464', '北京 东城区', '123456', '1', '1581784890');
INSERT INTO `xy_member_address` VALUES ('176', '4', '张老师', '13855555555', '北京 东城区', '12346', '1', '1581785752');
INSERT INTO `xy_member_address` VALUES ('177', '21', '王先生', '17799590055', '新疆 昌吉回族自治州 昌吉市', '小康村', '1', '1582004154');
INSERT INTO `xy_member_address` VALUES ('178', '19', '刘超群', '18162067222', '新疆 昌吉回族自治州 昌吉市', '北外环世纪康城', '1', '1582026293');
INSERT INTO `xy_member_address` VALUES ('179', '30', '李自亮', '18179921557', '江西 萍乡 安源区', '滨河西路山下五金模具厂', '1', '1582100813');

-- ----------------------------
-- Table structure for xy_message
-- ----------------------------
DROP TABLE IF EXISTS `xy_message`;
CREATE TABLE `xy_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '接收人ID',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '发送人ID',
  `title` varchar(150) NOT NULL COMMENT '信息标题',
  `content` text NOT NULL COMMENT '正文内容',
  `addtime` int(10) NOT NULL COMMENT '发表时间',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '消息类型 1公告 2通知',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-消息表';

-- ----------------------------
-- Records of xy_message
-- ----------------------------
INSERT INTO `xy_message` VALUES ('1', '1', '0', '系统通知', '充值订单SY2002171920182329已被退回，如有疑问请联系客服', '1582012093', '2');
INSERT INTO `xy_message` VALUES ('2', '1', '0', '系统通知', '充值订单SY2002161538091286已被退回，如有疑问请联系客服', '1582012135', '2');
INSERT INTO `xy_message` VALUES ('3', '1', '0', '系统通知', '充值订单SY2002161435375617已被退回，如有疑问请联系客服', '1582012137', '2');
INSERT INTO `xy_message` VALUES ('4', '1', '0', '系统通知', '充值订单SY2002160334038731已被退回，如有疑问请联系客服', '1582012141', '2');
INSERT INTO `xy_message` VALUES ('5', '1', '0', '系统通知', '充值订单SY2002160206443092已被退回，如有疑问请联系客服', '1582012146', '2');
INSERT INTO `xy_message` VALUES ('6', '1', '0', '系统通知', '充值订单SY2002160207338790已被退回，如有疑问请联系客服', '1582012148', '2');
INSERT INTO `xy_message` VALUES ('7', '1', '0', '系统通知', '充值订单SY2002160207385225已被退回，如有疑问请联系客服', '1582012150', '2');
INSERT INTO `xy_message` VALUES ('8', '1', '0', '系统通知', '充值订单SY2002160333294061已被退回，如有疑问请联系客服', '1582012152', '2');
INSERT INTO `xy_message` VALUES ('9', '1', '0', '系统通知', '充值订单SY2002160333391679已被退回，如有疑问请联系客服', '1582012153', '2');
INSERT INTO `xy_message` VALUES ('10', '1', '0', '系统通知', '充值订单SY2002151638245668已被退回，如有疑问请联系客服', '1582012159', '2');
INSERT INTO `xy_message` VALUES ('11', '1', '0', '系统通知', '充值订单SY2002150236158745已被退回，如有疑问请联系客服', '1582012162', '2');
INSERT INTO `xy_message` VALUES ('12', '1', '0', '系统通知', '充值订单SY2002151733413257已被退回，如有疑问请联系客服', '1582012165', '2');
INSERT INTO `xy_message` VALUES ('13', '1', '0', '系统通知', '充值订单SY2002150236135498已被退回，如有疑问请联系客服', '1582012183', '2');
INSERT INTO `xy_message` VALUES ('14', '1', '0', '系统通知', '充值订单SY2002150236069399已被退回，如有疑问请联系客服', '1582012186', '2');
INSERT INTO `xy_message` VALUES ('15', '1', '0', '系统通知', '充值订单SY2002150153506712已被退回，如有疑问请联系客服', '1582012189', '2');
INSERT INTO `xy_message` VALUES ('16', '1', '0', '系统通知', '充值订单SY2002150151462459已被退回，如有疑问请联系客服', '1582012192', '2');
INSERT INTO `xy_message` VALUES ('17', '19', '0', '系统通知', '充值订单SY2002191517449644已被退回，如有疑问请联系客服', '1582096726', '2');
INSERT INTO `xy_message` VALUES ('18', '31', '0', '系统通知', '充值订单SY2002190731523603已被退回，如有疑问请联系客服', '1582096857', '2');
INSERT INTO `xy_message` VALUES ('19', '31', '0', '系统通知', '充值订单SY2002190735352490已被退回，如有疑问请联系客服', '1582096861', '2');
INSERT INTO `xy_message` VALUES ('20', '31', '0', '系统通知', '充值订单SY2002190736143562已被退回，如有疑问请联系客服', '1582096866', '2');
INSERT INTO `xy_message` VALUES ('21', '31', '0', '系统通知', '充值订单SY2002190737093285已被退回，如有疑问请联系客服', '1582096870', '2');
INSERT INTO `xy_message` VALUES ('22', '31', '0', '系统通知', '充值订单SY2002190737249292已被退回，如有疑问请联系客服', '1582096875', '2');
INSERT INTO `xy_message` VALUES ('23', '19', '0', '系统通知', '充值订单SY2002191517315156已被退回，如有疑问请联系客服', '1582096937', '2');
INSERT INTO `xy_message` VALUES ('24', '19', '0', '系统通知', '充值订单SY2002191515091099已被退回，如有疑问请联系客服', '1582096942', '2');
INSERT INTO `xy_message` VALUES ('25', '19', '0', '系统通知', '充值订单SY2002191514532730已被退回，如有疑问请联系客服', '1582096949', '2');
INSERT INTO `xy_message` VALUES ('26', '19', '0', '系统通知', '充值订单SY2002191514423646已被退回，如有疑问请联系客服', '1582096952', '2');
INSERT INTO `xy_message` VALUES ('27', '19', '0', '系统通知', '充值订单SY2002191514354095已被退回，如有疑问请联系客服', '1582096958', '2');
INSERT INTO `xy_message` VALUES ('28', '30', '0', '系统通知', '充值订单SY2002200030016410已被退回，如有疑问请联系客服', '1582195706', '2');
INSERT INTO `xy_message` VALUES ('29', '30', '0', '系统通知', '充值订单SY2002200029328714已被退回，如有疑问请联系客服', '1582195709', '2');
INSERT INTO `xy_message` VALUES ('30', '30', '0', '系统通知', '充值订单SY2002200029455796已被退回，如有疑问请联系客服', '1582195712', '2');
INSERT INTO `xy_message` VALUES ('31', '36', '0', '系统通知', '充值订单SY2002192014348351已被退回，如有疑问请联系客服', '1582195715', '2');
INSERT INTO `xy_message` VALUES ('32', '36', '0', '系统通知', '充值订单SY2002192012386129已被退回，如有疑问请联系客服', '1582195765', '2');
INSERT INTO `xy_message` VALUES ('33', '36', '0', '系统通知', '充值订单SY2002192013466078已被退回，如有疑问请联系客服', '1582195768', '2');
INSERT INTO `xy_message` VALUES ('34', '36', '0', '系统通知', '充值订单SY2002192016557577已被退回，如有疑问请联系客服', '1582195777', '2');
INSERT INTO `xy_message` VALUES ('35', '36', '0', '系统通知', '充值订单SY2002192017485145已被退回，如有疑问请联系客服', '1582195781', '2');
INSERT INTO `xy_message` VALUES ('36', '43', '0', '系统通知', '充值订单SY2002202011215858已被退回，如有疑问请联系客服', '1582282363', '2');
INSERT INTO `xy_message` VALUES ('37', '50', '0', '系统通知', '充值订单SY2002202007004638已被退回，如有疑问请联系客服', '1582282367', '2');
INSERT INTO `xy_message` VALUES ('38', '1', '0', '系统通知', '充值订单SY2003021306169169已被退回，如有疑问请联系客服', '1583125586', '2');
INSERT INTO `xy_message` VALUES ('39', '1', '0', '系统通知', '充值订单SY2003021305492494已被退回，如有疑问请联系客服', '1583125590', '2');

-- ----------------------------
-- Table structure for xy_msg
-- ----------------------------
DROP TABLE IF EXISTS `xy_msg`;
CREATE TABLE `xy_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '文本内容',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1平台公告 2平台简介 3抢单规则 4代理合作 5常见问题',
  `addtime` int(10) NOT NULL COMMENT '发表时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0发布 1不发布',
  `author` varchar(10) NOT NULL DEFAULT '' COMMENT '作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xy_msg
-- ----------------------------

-- ----------------------------
-- Table structure for xy_pay
-- ----------------------------
DROP TABLE IF EXISTS `xy_pay`;
CREATE TABLE `xy_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min` double(18,2) DEFAULT NULL,
  `max` double(18,2) DEFAULT NULL,
  `ewm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of xy_pay
-- ----------------------------
INSERT INTO `xy_pay` VALUES ('1', '支付宝快捷支付', 'zfb', '/public/img/alipay.png', '0.01', '10000.00', 'http://qd.zm297.cn/upload/98aac2253320fd58/cdade835811633ec.png', '1', '/index/ctrl/recharge2?type=zfb');
INSERT INTO `xy_pay` VALUES ('2', '微信快捷支付', 'wx', '/public/img/wx.png', '0.01', '10000.00', 'http://qd.zm297.cn/upload/98aac2253320fd58/cdade835811633ec.png', '1', '/index/ctrl/recharge2?type=wx');
INSERT INTO `xy_pay` VALUES ('3', '银行卡转账', 'card', '/public/img/card.png', '0.01', '10000.00', null, '1', '/index/ctrl/recharge');
INSERT INTO `xy_pay` VALUES ('4', '比特币支付', 'bipay', 'https://cdn.fwtqo.cn/static/web/assets/img/logo/weblogo4x.png', '0.01', '10000.00', null, '0', '/index/ctrl/recharge2?type=bipay');
INSERT INTO `xy_pay` VALUES ('5', 'paysapi支付', 'paysapi', 'https://cdn.bearsoftware.net.cn/paysapi/images/logo_red.png', '0.01', '10000.00', 'http://qd.cn/upload/c03e6f88a46358db/0f716faa5667ee36.png', '0', '/index/ctrl/recharge2?type=paysapi');

-- ----------------------------
-- Table structure for xy_reads
-- ----------------------------
DROP TABLE IF EXISTS `xy_reads`;
CREATE TABLE `xy_reads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '消息ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '读取时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid-uid` (`mid`,`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-消息读取记录表';

-- ----------------------------
-- Records of xy_reads
-- ----------------------------
INSERT INTO `xy_reads` VALUES ('1', '30', '1', '1581577960');
INSERT INTO `xy_reads` VALUES ('2', '31', '15', '1581689736');

-- ----------------------------
-- Table structure for xy_recharge
-- ----------------------------
DROP TABLE IF EXISTS `xy_recharge`;
CREATE TABLE `xy_recharge` (
  `id` char(18) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `real_name` varchar(15) NOT NULL DEFAULT '' COMMENT '充值姓名',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `num` decimal(12,2) NOT NULL COMMENT '充值金额',
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '支付方式 1微信 2支付宝',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '打款凭证',
  `addtime` int(10) NOT NULL COMMENT '下单时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '订单状态 1下单成功 2充值成功 3充值失败',
  `pay_name` varchar(255) DEFAULT NULL,
  `is_vip` int(11) DEFAULT '0',
  `level` int(11) DEFAULT NULL,
  `pay_type` varchar(36) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-充值表';

-- ----------------------------
-- Records of xy_recharge
-- ----------------------------
INSERT INTO `xy_recharge` VALUES ('SY2003021252116602', '1', 'SF_cai0j', '18503043295', '88.00', '1', '', '1583124731', '0', '1', '1', '1', '1', '');
INSERT INTO `xy_recharge` VALUES ('SY2003021305229412', '1', 'SF_cai0j', '18503043295', '100.00', '1', '', '1583125522', '0', '1', 'zfb', '0', null, '');
INSERT INTO `xy_recharge` VALUES ('SY2003021305361557', '1', 'SF_cai0j', '18503043295', '100.00', '1', '', '1583125536', '0', '1', 'zfb', '0', null, '');
INSERT INTO `xy_recharge` VALUES ('SY2003021305492494', '1', 'SF_cai0j', '18503043295', '100.00', '1', '', '1583125549', '1583125590', '3', 'zfb', '0', null, '');
INSERT INTO `xy_recharge` VALUES ('SY2003021306169169', '1', 'SF_cai0j', '18503043295', '100.00', '1', '', '1583125576', '1583125586', '3', 'wx', '0', null, '');
INSERT INTO `xy_recharge` VALUES ('SY2003021326294355', '1', 'SF_cai0j', '18503043295', '100.00', '1', '', '1583126789', '0', '1', 'zfb', '0', null, '');
INSERT INTO `xy_recharge` VALUES ('SY2003021327184681', '1', 'SF_cai0j', '18503043295', '10.00', '1', '', '1583126838', '0', '1', 'woaipay', '0', null, 'alipay');
INSERT INTO `xy_recharge` VALUES ('SY2003021336073817', '2', 'IXX_iqb1', '18028533272', '100.00', '1', '', '1583127367', '0', '1', 'zfb', '0', null, '');

-- ----------------------------
-- Table structure for xy_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `xy_reward_log`;
CREATE TABLE `xy_reward_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` char(18) NOT NULL COMMENT '订单号',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产生交易用户',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交易对象',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '交易数额',
  `lv` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '级差',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '订单类型 1充值订单(推广返佣) 2交易订单(交易返佣)',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '佣金发放状态 0自动发放 1未发放 2已发放',
  `addtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '处理时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='订单佣金发放记录表';

-- ----------------------------
-- Records of xy_reward_log
-- ----------------------------
INSERT INTO `xy_reward_log` VALUES ('1', 'UB2003021308112662', '1', '0', '2517.00', '0', '2', '0', '1583126341', '0');
INSERT INTO `xy_reward_log` VALUES ('2', 'UB2003040050065118', '1', '0', '4396.00', '0', '2', '0', '1583254262', '0');

-- ----------------------------
-- Table structure for xy_script
-- ----------------------------
DROP TABLE IF EXISTS `xy_script`;
CREATE TABLE `xy_script` (
  `script` text NOT NULL COMMENT '代码块',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xy_script
-- ----------------------------
INSERT INTO `xy_script` VALUES ('http://baidu.com/customlivechat/php/app.php?widget-iframe-content', '1');

-- ----------------------------
-- Table structure for xy_users
-- ----------------------------
DROP TABLE IF EXISTS `xy_users`;
CREATE TABLE `xy_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `username` varchar(36) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(36) NOT NULL DEFAULT '' COMMENT '昵称',
  `pwd` char(40) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(16) NOT NULL DEFAULT '' COMMENT '密码盐',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `signiture` varchar(120) NOT NULL DEFAULT '' COMMENT '个性签名',
  `pwd_error_num` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '密码错误次数',
  `allow_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '允许登录时间',
  `real_name` varchar(36) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `id_card_num` char(18) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `top_pic` varchar(96) NOT NULL DEFAULT '' COMMENT '身份证正面图',
  `bot_pic` varchar(96) NOT NULL DEFAULT '' COMMENT '身份证背面图',
  `id_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证状态，0未审核，1审核通过，2审核不通过',
  `invite_code` char(6) NOT NULL DEFAULT '' COMMENT '邀请码',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1启用，2禁用',
  `real_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实名时间',
  `pwd2` char(40) NOT NULL DEFAULT '' COMMENT '提现密码',
  `salt2` char(16) NOT NULL DEFAULT '' COMMENT '提现密码盐',
  `headpic` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `balance` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `freeze_balance` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '账号冻结金额',
  `login_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否登录状态，1：是，0否',
  `recharge_num` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '日充值金额',
  `deposit_num` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '日提现金额',
  `deal_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '交易状态，0交易冻结，1停止交易，2等待交易，3交易中',
  `deal_error` tinyint(1) NOT NULL DEFAULT '0' COMMENT '违规次数',
  `deal_reward_count` int(11) NOT NULL DEFAULT '0' COMMENT '奖励交易次数',
  `deal_count` int(4) NOT NULL DEFAULT '0' COMMENT '当日交易次数',
  `deal_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后交易日期(年月日)',
  `active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '激活状态，0未激活(首次充值发放推广奖励)，1已激活',
  `childs` int(11) NOT NULL DEFAULT '0' COMMENT '直推用户数量',
  `kouchu_balance` decimal(15,2) DEFAULT NULL COMMENT '扣除金额',
  `kouchu_balance_uid` int(11) DEFAULT NULL,
  `show_td` int(11) DEFAULT '1',
  `show_cz` int(11) DEFAULT '1',
  `show_tx` int(11) DEFAULT '1',
  `show_tel` int(11) DEFAULT '1',
  `show_num` int(11) DEFAULT '1',
  `show_tel2` int(11) DEFAULT '1',
  `wx_ewm` varchar(255) DEFAULT NULL,
  `zfb_ewm` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `lixibao_balance` decimal(15,4) DEFAULT '0.0000' COMMENT '利息宝金额',
  `lixibao_dj_balance` decimal(15,4) DEFAULT '0.0000' COMMENT '利息宝冻结金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tel` (`tel`) USING BTREE,
  UNIQUE KEY `invite_code` (`invite_code`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员-用户表';

-- ----------------------------
-- Records of xy_users
-- ----------------------------
INSERT INTO `xy_users` VALUES ('3', '18812345678', '发财猫', '', 'a7b8923c68b5f86de80f01f9a33b3bdd01cc26c8', '42342', '0', '', '0', '0', '', '', '', '', '0', 'LJVNQK', '1583254409', '1', '0', 'ac16084814758cfd73cd3afd5f43a1de5926d412', '7916', '', '3966.00', '5948.84', '1', '0.00', '0.00', '3', '0', '0', '2', '1584979200', '0', '0', null, null, '1', '1', '1', '1', '1', '1', null, null, null, '100.0000', '0.0000');

-- ----------------------------
-- Table structure for xy_user_error
-- ----------------------------
DROP TABLE IF EXISTS `xy_user_error`;
CREATE TABLE `xy_user_error` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `addtime` int(11) NOT NULL COMMENT '记录时间',
  `oid` char(18) DEFAULT '' COMMENT '交易单号',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型 1解封 2违规操作 3冻结',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED COMMENT='会员-违规操作记录表';

-- ----------------------------
-- Records of xy_user_error
-- ----------------------------

-- ----------------------------
-- Table structure for xy_verify_msg
-- ----------------------------
DROP TABLE IF EXISTS `xy_verify_msg`;
CREATE TABLE `xy_verify_msg` (
  `tel` char(11) NOT NULL DEFAULT '' COMMENT '用户ID',
  `msg` char(5) NOT NULL DEFAULT '' COMMENT '验证码',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型，1注册,2修改密码，3修改二级密码',
  PRIMARY KEY (`tel`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of xy_verify_msg
-- ----------------------------
INSERT INTO `xy_verify_msg` VALUES ('18792778070', '30791', '1575340323', '1');
INSERT INTO `xy_verify_msg` VALUES ('18678858033', '52417', '1575340416', '1');
INSERT INTO `xy_verify_msg` VALUES ('15553147890', '73739', '1575340495', '1');
INSERT INTO `xy_verify_msg` VALUES ('17663745274', '33350', '1575340554', '1');
INSERT INTO `xy_verify_msg` VALUES ('18670735894', '36609', '1575340708', '1');
INSERT INTO `xy_verify_msg` VALUES ('15550641849', '97761', '1575340843', '1');
INSERT INTO `xy_verify_msg` VALUES ('15954979746', '81170', '1575340958', '1');
INSERT INTO `xy_verify_msg` VALUES ('19804166629', '22785', '1575340983', '1');
INSERT INTO `xy_verify_msg` VALUES ('18502988107', '26565', '1575341050', '1');
INSERT INTO `xy_verify_msg` VALUES ('15113613222', '37812', '1575341129', '1');
INSERT INTO `xy_verify_msg` VALUES ('15131102773', '77239', '1575341138', '1');
INSERT INTO `xy_verify_msg` VALUES ('18724319280', '15893', '1575341404', '1');
INSERT INTO `xy_verify_msg` VALUES ('15518661001', '91243', '1575341777', '1');
INSERT INTO `xy_verify_msg` VALUES ('15639460689', '44316', '1575341851', '1');
INSERT INTO `xy_verify_msg` VALUES ('13196968090', '96952', '1575341988', '1');
INSERT INTO `xy_verify_msg` VALUES ('17754776299', '83752', '1575342389', '1');
INSERT INTO `xy_verify_msg` VALUES ('13534394277', '62475', '1575343360', '1');
INSERT INTO `xy_verify_msg` VALUES ('13462916156', '53803', '1575344666', '2');
INSERT INTO `xy_verify_msg` VALUES ('15771508176', '11192', '1575344206', '1');
INSERT INTO `xy_verify_msg` VALUES ('18526482199', '22117', '1575345258', '1');
INSERT INTO `xy_verify_msg` VALUES ('15624756444', '68855', '1575345894', '1');
INSERT INTO `xy_verify_msg` VALUES ('18144815503', '38817', '1575346026', '1');
INSERT INTO `xy_verify_msg` VALUES ('15174771594', '76159', '1575346081', '1');
INSERT INTO `xy_verify_msg` VALUES ('18979261828', '77761', '1575346110', '1');
INSERT INTO `xy_verify_msg` VALUES ('18871097976', '97498', '1575346794', '1');
INSERT INTO `xy_verify_msg` VALUES ('17676774196', '53455', '1575348028', '1');
INSERT INTO `xy_verify_msg` VALUES ('13453615149', '11681', '1575348143', '1');
INSERT INTO `xy_verify_msg` VALUES ('18702965296', '81012', '1575352369', '1');
INSERT INTO `xy_verify_msg` VALUES ('18391241006', '74967', '1575353912', '1');
INSERT INTO `xy_verify_msg` VALUES ('13726772691', '55222', '1575354264', '1');
INSERT INTO `xy_verify_msg` VALUES ('18266051110', '64493', '1575355289', '1');
INSERT INTO `xy_verify_msg` VALUES ('18820951680', '54343', '1575356380', '1');
INSERT INTO `xy_verify_msg` VALUES ('13403565225', '58749', '1575356625', '1');
INSERT INTO `xy_verify_msg` VALUES ('13057162368', '95481', '1575356809', '1');
INSERT INTO `xy_verify_msg` VALUES ('13126975906', '32932', '1575357048', '1');
INSERT INTO `xy_verify_msg` VALUES ('15070907432', '16782', '1575357498', '1');
INSERT INTO `xy_verify_msg` VALUES ('18622115296', '42752', '1575357749', '1');
INSERT INTO `xy_verify_msg` VALUES ('18773595001', '64041', '1575358737', '1');
INSERT INTO `xy_verify_msg` VALUES ('15080522292', '38351', '1575359273', '1');
INSERT INTO `xy_verify_msg` VALUES ('15532812527', '17420', '1575359887', '2');
INSERT INTO `xy_verify_msg` VALUES ('13145425172', '44385', '1575363301', '1');
INSERT INTO `xy_verify_msg` VALUES ('15139016780', '92173', '1575365439', '1');
INSERT INTO `xy_verify_msg` VALUES ('18620572780', '49848', '1575365500', '1');
INSERT INTO `xy_verify_msg` VALUES ('13864556268', '37253', '1575367106', '1');
INSERT INTO `xy_verify_msg` VALUES ('18966955603', '11830', '1575376182', '2');
INSERT INTO `xy_verify_msg` VALUES ('18224838905', '10043', '1575367542', '1');
INSERT INTO `xy_verify_msg` VALUES ('18210153750', '78663', '1575367772', '1');
INSERT INTO `xy_verify_msg` VALUES ('18530156244', '90136', '1575370905', '1');
INSERT INTO `xy_verify_msg` VALUES ('13807722001', '29594', '1575373430', '1');
INSERT INTO `xy_verify_msg` VALUES ('18707153172', '39095', '1575373765', '1');
INSERT INTO `xy_verify_msg` VALUES ('13712706001', '97467', '1575373968', '1');
INSERT INTO `xy_verify_msg` VALUES ('19945227387', '73946', '1575374477', '1');
INSERT INTO `xy_verify_msg` VALUES ('13135918208', '36418', '1575376024', '1');
INSERT INTO `xy_verify_msg` VALUES ('15878859199', '40577', '1575376282', '1');
INSERT INTO `xy_verify_msg` VALUES ('18636217260', '10443', '1575376724', '1');
INSERT INTO `xy_verify_msg` VALUES ('18986676876', '63890', '1575376922', '1');
INSERT INTO `xy_verify_msg` VALUES ('15750934594', '52250', '1575377325', '1');
INSERT INTO `xy_verify_msg` VALUES ('18250815422', '69943', '1575378088', '1');
INSERT INTO `xy_verify_msg` VALUES ('13383466129', '48184', '1575379321', '1');
INSERT INTO `xy_verify_msg` VALUES ('15914190547', '44366', '1575380090', '1');
INSERT INTO `xy_verify_msg` VALUES ('13593992929', '56793', '1575380429', '1');
INSERT INTO `xy_verify_msg` VALUES ('18582110498', '82423', '1575382970', '1');
INSERT INTO `xy_verify_msg` VALUES ('18215871824', '97813', '1575383263', '1');
INSERT INTO `xy_verify_msg` VALUES ('18215871024', '22853', '1575383318', '1');
INSERT INTO `xy_verify_msg` VALUES ('18503915382', '51935', '1575384145', '1');
INSERT INTO `xy_verify_msg` VALUES ('13732322002', '46244', '1575384156', '1');
INSERT INTO `xy_verify_msg` VALUES ('18156779351', '12444', '1575384209', '1');
INSERT INTO `xy_verify_msg` VALUES ('13164613103', '18963', '1575384258', '1');
INSERT INTO `xy_verify_msg` VALUES ('13872398015', '28766', '1575384417', '1');
INSERT INTO `xy_verify_msg` VALUES ('18095655267', '79522', '1575384574', '1');
INSERT INTO `xy_verify_msg` VALUES ('18056029767', '88044', '1575384686', '1');
INSERT INTO `xy_verify_msg` VALUES ('18529256945', '92143', '1575384706', '1');
INSERT INTO `xy_verify_msg` VALUES ('18538095444', '94813', '1575384734', '1');
INSERT INTO `xy_verify_msg` VALUES ('15872012091', '30436', '1575384735', '1');
INSERT INTO `xy_verify_msg` VALUES ('17717326389', '44439', '1575384755', '1');
INSERT INTO `xy_verify_msg` VALUES ('13625073168', '96002', '1575384775', '1');
INSERT INTO `xy_verify_msg` VALUES ('17755105296', '71765', '1575384776', '1');
INSERT INTO `xy_verify_msg` VALUES ('18060532553', '24962', '1575384879', '1');
INSERT INTO `xy_verify_msg` VALUES ('15234344737', '32915', '1575384973', '1');
INSERT INTO `xy_verify_msg` VALUES ('13909783253', '35211', '1575384994', '1');
INSERT INTO `xy_verify_msg` VALUES ('18155483903', '21467', '1575385016', '1');
INSERT INTO `xy_verify_msg` VALUES ('13148092700', '94898', '1575385110', '1');
INSERT INTO `xy_verify_msg` VALUES ('13459172353', '20082', '1575385149', '1');
INSERT INTO `xy_verify_msg` VALUES ('18995604223', '27606', '1575385292', '1');
INSERT INTO `xy_verify_msg` VALUES ('17607541657', '54048', '1575385175', '1');
INSERT INTO `xy_verify_msg` VALUES ('19959330263', '23753', '1575385382', '1');
INSERT INTO `xy_verify_msg` VALUES ('18765614062', '24674', '1575385425', '1');
INSERT INTO `xy_verify_msg` VALUES ('19904790953', '46342', '1575385616', '2');
INSERT INTO `xy_verify_msg` VALUES ('15572118183', '26790', '1575385434', '1');
INSERT INTO `xy_verify_msg` VALUES ('13288333150', '13666', '1575385440', '1');
INSERT INTO `xy_verify_msg` VALUES ('17933196139', '46888', '1575385463', '1');
INSERT INTO `xy_verify_msg` VALUES ('13076530485', '39982', '1575385510', '1');
INSERT INTO `xy_verify_msg` VALUES ('17633196139', '58304', '1575385524', '1');
INSERT INTO `xy_verify_msg` VALUES ('13430056062', '20347', '1575385559', '1');
INSERT INTO `xy_verify_msg` VALUES ('13929951029', '88016', '1575385640', '1');
INSERT INTO `xy_verify_msg` VALUES ('17673941509', '53722', '1575385725', '1');
INSERT INTO `xy_verify_msg` VALUES ('13041341344', '57200', '1575385763', '1');
INSERT INTO `xy_verify_msg` VALUES ('13585520903', '77397', '1575385814', '1');
INSERT INTO `xy_verify_msg` VALUES ('13030198973', '82030', '1575385818', '1');
INSERT INTO `xy_verify_msg` VALUES ('13680802397', '58560', '1575385953', '1');
INSERT INTO `xy_verify_msg` VALUES ('15091188141', '17449', '1575386009', '1');
INSERT INTO `xy_verify_msg` VALUES ('15284916832', '97983', '1575386047', '1');
INSERT INTO `xy_verify_msg` VALUES ('13318989378', '11921', '1575386133', '1');
INSERT INTO `xy_verify_msg` VALUES ('15308073235', '99565', '1575386145', '1');
INSERT INTO `xy_verify_msg` VALUES ('15160660880', '96876', '1575386186', '1');
INSERT INTO `xy_verify_msg` VALUES ('18110773763', '94837', '1575386260', '1');
INSERT INTO `xy_verify_msg` VALUES ('13287523873', '66809', '1575386373', '1');
INSERT INTO `xy_verify_msg` VALUES ('19971581026', '78545', '1575386803', '1');
INSERT INTO `xy_verify_msg` VALUES ('17608029485', '48754', '1575386467', '1');
INSERT INTO `xy_verify_msg` VALUES ('18635307994', '94053', '1575386511', '1');
INSERT INTO `xy_verify_msg` VALUES ('15904643108', '88224', '1575386520', '1');
INSERT INTO `xy_verify_msg` VALUES ('15751360155', '64781', '1575386552', '1');
INSERT INTO `xy_verify_msg` VALUES ('18827443327', '51862', '1575386566', '1');
INSERT INTO `xy_verify_msg` VALUES ('17366777570', '43739', '1575386610', '1');
INSERT INTO `xy_verify_msg` VALUES ('13895090472', '68286', '1575386617', '1');
INSERT INTO `xy_verify_msg` VALUES ('17789766218', '51931', '1575386625', '1');
INSERT INTO `xy_verify_msg` VALUES ('15306004857', '42416', '1575386744', '1');
INSERT INTO `xy_verify_msg` VALUES ('18875707075', '38489', '1575386794', '1');
INSERT INTO `xy_verify_msg` VALUES ('18963388038', '28801', '1575386936', '1');
INSERT INTO `xy_verify_msg` VALUES ('18791937521', '63611', '1575387083', '1');
INSERT INTO `xy_verify_msg` VALUES ('19905039420', '28803', '1575387201', '1');
INSERT INTO `xy_verify_msg` VALUES ('18037158031', '73472', '1575387304', '1');
INSERT INTO `xy_verify_msg` VALUES ('18392565454', '77877', '1575387331', '1');
INSERT INTO `xy_verify_msg` VALUES ('18765822915', '25202', '1575387679', '1');
INSERT INTO `xy_verify_msg` VALUES ('17346711411', '33957', '1575387717', '1');
INSERT INTO `xy_verify_msg` VALUES ('19850010293', '40230', '1575387731', '1');
INSERT INTO `xy_verify_msg` VALUES ('13892843146', '35851', '1575387847', '1');
INSERT INTO `xy_verify_msg` VALUES ('14759937161', '64863', '1575387874', '1');
INSERT INTO `xy_verify_msg` VALUES ('15111168832', '55207', '1575388025', '1');
INSERT INTO `xy_verify_msg` VALUES ('15399580361', '84991', '1575388178', '1');
INSERT INTO `xy_verify_msg` VALUES ('18170974240', '32232', '1575388226', '1');
INSERT INTO `xy_verify_msg` VALUES ('18803429334', '90557', '1575388469', '1');
INSERT INTO `xy_verify_msg` VALUES ('18164019797', '32356', '1575388708', '1');
INSERT INTO `xy_verify_msg` VALUES ('18806622251', '46057', '1575388646', '1');
INSERT INTO `xy_verify_msg` VALUES ('18010910585', '90593', '1575388729', '1');
INSERT INTO `xy_verify_msg` VALUES ('15607199575', '29098', '1575388771', '1');
INSERT INTO `xy_verify_msg` VALUES ('19970104071', '51557', '1575388892', '1');
INSERT INTO `xy_verify_msg` VALUES ('15617765057', '14291', '1575388925', '1');
INSERT INTO `xy_verify_msg` VALUES ('13129520953', '98695', '1575389095', '1');
INSERT INTO `xy_verify_msg` VALUES ('13193761917', '13247', '1575389274', '1');
INSERT INTO `xy_verify_msg` VALUES ('15932836398', '16757', '1575389297', '1');
INSERT INTO `xy_verify_msg` VALUES ('17675674194', '48271', '1575389388', '1');
INSERT INTO `xy_verify_msg` VALUES ('18772434077', '42126', '1575389514', '1');
INSERT INTO `xy_verify_msg` VALUES ('18455847157', '33429', '1575390123', '1');
INSERT INTO `xy_verify_msg` VALUES ('18065067086', '93985', '1575389687', '1');
INSERT INTO `xy_verify_msg` VALUES ('15585354001', '73805', '1575389972', '1');
INSERT INTO `xy_verify_msg` VALUES ('17726197713', '31224', '1575389732', '1');
INSERT INTO `xy_verify_msg` VALUES ('18078726673', '27544', '1575389768', '1');
INSERT INTO `xy_verify_msg` VALUES ('13480056839', '46661', '1575390004', '1');
INSERT INTO `xy_verify_msg` VALUES ('15893855359', '22892', '1575414063', '1');
INSERT INTO `xy_verify_msg` VALUES ('18862921030', '35181', '1575390204', '1');
INSERT INTO `xy_verify_msg` VALUES ('13797291615', '73108', '1575390465', '1');
INSERT INTO `xy_verify_msg` VALUES ('13030873575', '12514', '1575390543', '1');
INSERT INTO `xy_verify_msg` VALUES ('19942297125', '29945', '1575390879', '1');
INSERT INTO `xy_verify_msg` VALUES ('18562425119', '54855', '1575390935', '1');
INSERT INTO `xy_verify_msg` VALUES ('13768016411', '81600', '1575391675', '2');
INSERT INTO `xy_verify_msg` VALUES ('18352617410', '14757', '1575391979', '1');
INSERT INTO `xy_verify_msg` VALUES ('13570686531', '75551', '1575393258', '1');
INSERT INTO `xy_verify_msg` VALUES ('13576693713', '74526', '1575393592', '1');
INSERT INTO `xy_verify_msg` VALUES ('18991046144', '26595', '1575393900', '1');
INSERT INTO `xy_verify_msg` VALUES ('18862693152', '87074', '1575394179', '1');
INSERT INTO `xy_verify_msg` VALUES ('13847209367', '55365', '1575394361', '1');
INSERT INTO `xy_verify_msg` VALUES ('18798134529', '92888', '1575394591', '1');
INSERT INTO `xy_verify_msg` VALUES ('15556719270', '79684', '1575394921', '1');
INSERT INTO `xy_verify_msg` VALUES ('17687517663', '58734', '1575395335', '1');
INSERT INTO `xy_verify_msg` VALUES ('17753939288', '29838', '1575396059', '1');
INSERT INTO `xy_verify_msg` VALUES ('13627432037', '37295', '1575398805', '1');
INSERT INTO `xy_verify_msg` VALUES ('15063443037', '59146', '1575403001', '1');
INSERT INTO `xy_verify_msg` VALUES ('13450237659', '28997', '1575406836', '1');
INSERT INTO `xy_verify_msg` VALUES ('13812175104', '52097', '1575408164', '1');
INSERT INTO `xy_verify_msg` VALUES ('18456047063', '55481', '1575409330', '1');
INSERT INTO `xy_verify_msg` VALUES ('18041583488', '49532', '1575409953', '1');
INSERT INTO `xy_verify_msg` VALUES ('15151353425', '44111', '1575410210', '1');
INSERT INTO `xy_verify_msg` VALUES ('18298854896', '24443', '1575410802', '1');
INSERT INTO `xy_verify_msg` VALUES ('15597687690', '54368', '1575412902', '1');
INSERT INTO `xy_verify_msg` VALUES ('15005585464', '97362', '1575412950', '1');
INSERT INTO `xy_verify_msg` VALUES ('17521132454', '44657', '1575413810', '1');
INSERT INTO `xy_verify_msg` VALUES ('18621162843', '11557', '1575414013', '1');
INSERT INTO `xy_verify_msg` VALUES ('18164596090', '85805', '1575414619', '1');
INSERT INTO `xy_verify_msg` VALUES ('15653024123', '32938', '1575414631', '1');
INSERT INTO `xy_verify_msg` VALUES ('18904390246', '92831', '1575414706', '1');
INSERT INTO `xy_verify_msg` VALUES ('15548846997', '61842', '1575414822', '1');
INSERT INTO `xy_verify_msg` VALUES ('18655417757', '48420', '1575416279', '1');
INSERT INTO `xy_verify_msg` VALUES ('13968084260', '66479', '1575417854', '1');
INSERT INTO `xy_verify_msg` VALUES ('18547262862', '42735', '1575418581', '1');
INSERT INTO `xy_verify_msg` VALUES ('13463586722', '64981', '1575419220', '1');
INSERT INTO `xy_verify_msg` VALUES ('13135678096', '53418', '1575419241', '1');
INSERT INTO `xy_verify_msg` VALUES ('15837673023', '23425', '1575419460', '1');
INSERT INTO `xy_verify_msg` VALUES ('18857981073', '68799', '1575419724', '1');
INSERT INTO `xy_verify_msg` VALUES ('18533771925', '66096', '1575420172', '1');
INSERT INTO `xy_verify_msg` VALUES ('13754389382', '30862', '1575420496', '1');
INSERT INTO `xy_verify_msg` VALUES ('15857014724', '19437', '1575420558', '1');
INSERT INTO `xy_verify_msg` VALUES ('17603637936', '62608', '1575420566', '1');
INSERT INTO `xy_verify_msg` VALUES ('17601605765', '91673', '1575420567', '1');
INSERT INTO `xy_verify_msg` VALUES ('13008586333', '68874', '1575420570', '1');
INSERT INTO `xy_verify_msg` VALUES ('13180408695', '20875', '1575420573', '1');
INSERT INTO `xy_verify_msg` VALUES ('13754303185', '30113', '1575420575', '1');
INSERT INTO `xy_verify_msg` VALUES ('13095823266', '44650', '1575420576', '1');
INSERT INTO `xy_verify_msg` VALUES ('13112584699', '38458', '1575420603', '1');
INSERT INTO `xy_verify_msg` VALUES ('18113678037', '40830', '1575420604', '1');
INSERT INTO `xy_verify_msg` VALUES ('18478016687', '66907', '1575420606', '1');
INSERT INTO `xy_verify_msg` VALUES ('17726716422', '36858', '1575420607', '1');
INSERT INTO `xy_verify_msg` VALUES ('19930065600', '80792', '1575420617', '1');
INSERT INTO `xy_verify_msg` VALUES ('15732527080', '87653', '1575420621', '1');
INSERT INTO `xy_verify_msg` VALUES ('13145120198', '97306', '1575420955', '1');
INSERT INTO `xy_verify_msg` VALUES ('18691189652', '73212', '1575421059', '2');
INSERT INTO `xy_verify_msg` VALUES ('18633304008', '30439', '1575420632', '1');
INSERT INTO `xy_verify_msg` VALUES ('15175595181', '53891', '1575420736', '2');
INSERT INTO `xy_verify_msg` VALUES ('13216568620', '35526', '1575420674', '1');
INSERT INTO `xy_verify_msg` VALUES ('18733477678', '49360', '1575534077', '3');
INSERT INTO `xy_verify_msg` VALUES ('15033995368', '56609', '1575420705', '1');
INSERT INTO `xy_verify_msg` VALUES ('15647460823', '52803', '1575420740', '1');
INSERT INTO `xy_verify_msg` VALUES ('18694211383', '45468', '1575420746', '1');
INSERT INTO `xy_verify_msg` VALUES ('18634176177', '23860', '1575420746', '1');
INSERT INTO `xy_verify_msg` VALUES ('13483388388', '89109', '1575421089', '1');
INSERT INTO `xy_verify_msg` VALUES ('19102085875', '66504', '1575420803', '1');
INSERT INTO `xy_verify_msg` VALUES ('18569472179', '80142', '1575553235', '2');
INSERT INTO `xy_verify_msg` VALUES ('15931515411', '81163', '1575421013', '2');
INSERT INTO `xy_verify_msg` VALUES ('19143595209', '14150', '1575420881', '1');
INSERT INTO `xy_verify_msg` VALUES ('13098086136', '85190', '1575420933', '1');
INSERT INTO `xy_verify_msg` VALUES ('15232635732', '66396', '1575420941', '1');
INSERT INTO `xy_verify_msg` VALUES ('17367587462', '85065', '1575420953', '1');
INSERT INTO `xy_verify_msg` VALUES ('17330533231', '70161', '1575420965', '1');
INSERT INTO `xy_verify_msg` VALUES ('17317051217', '70011', '1575420966', '1');
INSERT INTO `xy_verify_msg` VALUES ('13402406624', '95515', '1575420975', '1');
INSERT INTO `xy_verify_msg` VALUES ('15891317723', '12508', '1575421001', '1');
INSERT INTO `xy_verify_msg` VALUES ('18931494111', '41430', '1575421002', '1');
INSERT INTO `xy_verify_msg` VALUES ('18656309528', '23463', '1575421003', '1');
INSERT INTO `xy_verify_msg` VALUES ('15633634354', '20528', '1575421005', '1');
INSERT INTO `xy_verify_msg` VALUES ('18859122245', '68499', '1575421006', '1');
INSERT INTO `xy_verify_msg` VALUES ('18991794577', '84207', '1575421118', '2');
INSERT INTO `xy_verify_msg` VALUES ('13868280371', '43932', '1575421057', '1');
INSERT INTO `xy_verify_msg` VALUES ('17730544971', '29479', '1575421068', '1');
INSERT INTO `xy_verify_msg` VALUES ('15132590296', '21462', '1575421080', '1');
INSERT INTO `xy_verify_msg` VALUES ('15933867330', '90757', '1575421081', '1');
INSERT INTO `xy_verify_msg` VALUES ('18145148329', '71319', '1575421088', '1');
INSERT INTO `xy_verify_msg` VALUES ('17603328719', '95931', '1575421163', '2');
INSERT INTO `xy_verify_msg` VALUES ('17831211650', '18696', '1575421209', '1');
INSERT INTO `xy_verify_msg` VALUES ('15933867338', '92520', '1575421112', '1');
INSERT INTO `xy_verify_msg` VALUES ('13453717842', '85965', '1575421119', '1');
INSERT INTO `xy_verify_msg` VALUES ('13333297793', '78914', '1575421133', '1');
INSERT INTO `xy_verify_msg` VALUES ('18330551323', '60534', '1575421137', '1');
INSERT INTO `xy_verify_msg` VALUES ('13587248800', '79612', '1575421304', '1');
INSERT INTO `xy_verify_msg` VALUES ('13606826652', '16621', '1575421148', '1');
INSERT INTO `xy_verify_msg` VALUES ('17109324195', '13531', '1575421149', '1');
INSERT INTO `xy_verify_msg` VALUES ('15233308910', '50712', '1575421150', '1');
INSERT INTO `xy_verify_msg` VALUES ('18332788844', '82510', '1575421396', '1');
INSERT INTO `xy_verify_msg` VALUES ('17732545524', '63437', '1575421192', '1');
INSERT INTO `xy_verify_msg` VALUES ('15211174670', '14255', '1575421320', '2');
INSERT INTO `xy_verify_msg` VALUES ('13714929803', '50040', '1575421227', '1');
INSERT INTO `xy_verify_msg` VALUES ('15369582621', '47783', '1575421243', '1');
INSERT INTO `xy_verify_msg` VALUES ('18903387497', '73713', '1575421285', '1');
INSERT INTO `xy_verify_msg` VALUES ('18299046213', '18911', '1575421308', '1');
INSERT INTO `xy_verify_msg` VALUES ('15991205535', '65179', '1575421327', '1');
INSERT INTO `xy_verify_msg` VALUES ('13631518558', '69770', '1575421376', '1');
INSERT INTO `xy_verify_msg` VALUES ('18966993754', '65873', '1575421395', '1');
INSERT INTO `xy_verify_msg` VALUES ('17731514116', '95500', '1575421440', '1');
INSERT INTO `xy_verify_msg` VALUES ('18356328869', '19016', '1575421447', '1');
INSERT INTO `xy_verify_msg` VALUES ('18103150502', '19897', '1575421671', '1');
INSERT INTO `xy_verify_msg` VALUES ('18833166903', '95485', '1575421684', '1');
INSERT INTO `xy_verify_msg` VALUES ('15132262294', '93286', '1575421696', '1');
INSERT INTO `xy_verify_msg` VALUES ('13832963623', '59684', '1575421711', '1');
INSERT INTO `xy_verify_msg` VALUES ('18091171937', '20201', '1575421718', '2');
INSERT INTO `xy_verify_msg` VALUES ('17694981824', '52253', '1575421719', '1');
INSERT INTO `xy_verify_msg` VALUES ('15614382743', '53416', '1575421753', '1');
INSERT INTO `xy_verify_msg` VALUES ('15710956333', '34428', '1575421782', '1');
INSERT INTO `xy_verify_msg` VALUES ('15355256196', '93870', '1575421833', '1');
INSERT INTO `xy_verify_msg` VALUES ('19982647831', '92638', '1575421834', '1');
INSERT INTO `xy_verify_msg` VALUES ('15197424788', '20335', '1575421843', '1');
INSERT INTO `xy_verify_msg` VALUES ('18848372827', '11451', '1575421848', '1');
INSERT INTO `xy_verify_msg` VALUES ('17868485271', '54245', '1575421862', '1');
INSERT INTO `xy_verify_msg` VALUES ('17858566965', '14353', '1575421868', '1');
INSERT INTO `xy_verify_msg` VALUES ('18395923697', '29398', '1575421872', '1');
INSERT INTO `xy_verify_msg` VALUES ('15190295149', '75533', '1575422006', '1');
INSERT INTO `xy_verify_msg` VALUES ('15032550062', '81649', '1575421944', '1');
INSERT INTO `xy_verify_msg` VALUES ('18231518006', '94973', '1575422001', '1');
INSERT INTO `xy_verify_msg` VALUES ('13545635340', '88526', '1575422008', '1');
INSERT INTO `xy_verify_msg` VALUES ('18700782952', '60012', '1575422026', '1');
INSERT INTO `xy_verify_msg` VALUES ('13315873314', '27844', '1575422091', '1');
INSERT INTO `xy_verify_msg` VALUES ('15071699653', '80977', '1575422375', '1');
INSERT INTO `xy_verify_msg` VALUES ('15625220328', '99771', '1575422551', '1');
INSERT INTO `xy_verify_msg` VALUES ('15009950190', '36225', '1575422641', '1');
INSERT INTO `xy_verify_msg` VALUES ('17605986907', '56055', '1575422806', '1');
INSERT INTO `xy_verify_msg` VALUES ('18767070748', '87502', '1575422919', '1');
INSERT INTO `xy_verify_msg` VALUES ('15028811711', '43807', '1575423129', '1');
INSERT INTO `xy_verify_msg` VALUES ('13473861564', '40403', '1575423194', '1');
INSERT INTO `xy_verify_msg` VALUES ('18085290425', '77673', '1575423213', '1');
INSERT INTO `xy_verify_msg` VALUES ('13663153492', '95079', '1575423297', '1');
INSERT INTO `xy_verify_msg` VALUES ('18132157772', '30784', '1575423461', '1');
INSERT INTO `xy_verify_msg` VALUES ('19903917471', '63390', '1575423762', '1');
INSERT INTO `xy_verify_msg` VALUES ('18747992978', '92227', '1575423817', '1');
INSERT INTO `xy_verify_msg` VALUES ('17828351453', '38345', '1575423918', '1');
INSERT INTO `xy_verify_msg` VALUES ('18857251703', '27086', '1575424504', '1');
INSERT INTO `xy_verify_msg` VALUES ('15623826779', '12595', '1575424602', '1');
INSERT INTO `xy_verify_msg` VALUES ('18832910853', '93774', '1575424605', '1');
INSERT INTO `xy_verify_msg` VALUES ('15633456736', '19506', '1575424680', '1');
INSERT INTO `xy_verify_msg` VALUES ('13091281822', '40614', '1575424928', '1');
INSERT INTO `xy_verify_msg` VALUES ('17330517373', '91241', '1575424931', '1');
INSERT INTO `xy_verify_msg` VALUES ('18824304489', '66642', '1575425108', '1');
INSERT INTO `xy_verify_msg` VALUES ('15924208594', '47077', '1575425133', '1');
INSERT INTO `xy_verify_msg` VALUES ('15245034612', '74290', '1575425135', '1');
INSERT INTO `xy_verify_msg` VALUES ('17736730377', '32770', '1575425230', '1');
INSERT INTO `xy_verify_msg` VALUES ('15050749944', '39946', '1575460426', '2');
INSERT INTO `xy_verify_msg` VALUES ('14786575101', '31086', '1575425674', '1');
INSERT INTO `xy_verify_msg` VALUES ('19913266623', '39640', '1575425686', '1');
INSERT INTO `xy_verify_msg` VALUES ('18028323293', '97015', '1575425766', '1');
INSERT INTO `xy_verify_msg` VALUES ('17731908791', '25905', '1575425838', '1');
INSERT INTO `xy_verify_msg` VALUES ('13834333337', '90608', '1575425840', '1');
INSERT INTO `xy_verify_msg` VALUES ('18732566351', '18826', '1575425939', '1');
INSERT INTO `xy_verify_msg` VALUES ('18612999483', '22845', '1575425954', '1');
INSERT INTO `xy_verify_msg` VALUES ('15752167666', '91227', '1575428659', '3');
INSERT INTO `xy_verify_msg` VALUES ('15271952893', '29362', '1575426364', '1');
INSERT INTO `xy_verify_msg` VALUES ('13613460074', '25304', '1575426669', '1');
INSERT INTO `xy_verify_msg` VALUES ('13103056732', '89229', '1575426849', '2');
INSERT INTO `xy_verify_msg` VALUES ('13223175213', '70012', '1575426923', '1');
INSERT INTO `xy_verify_msg` VALUES ('17331523234', '91754', '1575426948', '1');
INSERT INTO `xy_verify_msg` VALUES ('18978238398', '61159', '1575427823', '1');
INSERT INTO `xy_verify_msg` VALUES ('19956672077', '70382', '1575428361', '1');
INSERT INTO `xy_verify_msg` VALUES ('13552556054', '41861', '1575428647', '1');
INSERT INTO `xy_verify_msg` VALUES ('15854876290', '31055', '1575428661', '1');
INSERT INTO `xy_verify_msg` VALUES ('15342528830', '47686', '1575434104', '1');
INSERT INTO `xy_verify_msg` VALUES ('13222480078', '84649', '1575428837', '1');
INSERT INTO `xy_verify_msg` VALUES ('17671842569', '58171', '1575428901', '1');
INSERT INTO `xy_verify_msg` VALUES ('19822928011', '29051', '1575428903', '1');
INSERT INTO `xy_verify_msg` VALUES ('15666306649', '79629', '1575428985', '1');
INSERT INTO `xy_verify_msg` VALUES ('15919310449', '31012', '1575429091', '1');
INSERT INTO `xy_verify_msg` VALUES ('17829185368', '21218', '1575429690', '1');
INSERT INTO `xy_verify_msg` VALUES ('15111606505', '11703', '1575429963', '1');
INSERT INTO `xy_verify_msg` VALUES ('18529526508', '96026', '1575430734', '1');
INSERT INTO `xy_verify_msg` VALUES ('18179620835', '47714', '1575430858', '1');
INSERT INTO `xy_verify_msg` VALUES ('18650956118', '20039', '1575431377', '1');
INSERT INTO `xy_verify_msg` VALUES ('15160605899', '66995', '1575431618', '1');
INSERT INTO `xy_verify_msg` VALUES ('13895111238', '21194', '1575432089', '1');
INSERT INTO `xy_verify_msg` VALUES ('17689481192', '52326', '1575432536', '1');
INSERT INTO `xy_verify_msg` VALUES ('18604982332', '75314', '1575432971', '1');
INSERT INTO `xy_verify_msg` VALUES ('17620715534', '78636', '1575433069', '1');
INSERT INTO `xy_verify_msg` VALUES ('13483477555', '17721', '1575433446', '1');
INSERT INTO `xy_verify_msg` VALUES ('17876617764', '18965', '1575434098', '1');
INSERT INTO `xy_verify_msg` VALUES ('15516137590', '18379', '1575437742', '3');
INSERT INTO `xy_verify_msg` VALUES ('15660243754', '13944', '1575434741', '1');
INSERT INTO `xy_verify_msg` VALUES ('18090279072', '32321', '1575434887', '1');
INSERT INTO `xy_verify_msg` VALUES ('15730041339', '48765', '1575435437', '1');
INSERT INTO `xy_verify_msg` VALUES ('18691114044', '79183', '1575435569', '1');
INSERT INTO `xy_verify_msg` VALUES ('18066579182', '99648', '1575435697', '1');
INSERT INTO `xy_verify_msg` VALUES ('18397912511', '32408', '1575435781', '1');
INSERT INTO `xy_verify_msg` VALUES ('13641495104', '63564', '1575435833', '1');
INSERT INTO `xy_verify_msg` VALUES ('18169688929', '97728', '1575437268', '1');
INSERT INTO `xy_verify_msg` VALUES ('17331007488', '56987', '1575437803', '1');
INSERT INTO `xy_verify_msg` VALUES ('15070793327', '71123', '1575437826', '1');
INSERT INTO `xy_verify_msg` VALUES ('15957286636', '42728', '1575437881', '1');
INSERT INTO `xy_verify_msg` VALUES ('18099288975', '87678', '1575437931', '1');
INSERT INTO `xy_verify_msg` VALUES ('13023218973', '40681', '1575438095', '1');
INSERT INTO `xy_verify_msg` VALUES ('18872631767', '24551', '1575438589', '1');
INSERT INTO `xy_verify_msg` VALUES ('17573044321', '96843', '1575439354', '1');
INSERT INTO `xy_verify_msg` VALUES ('15263819448', '91269', '1575439906', '1');
INSERT INTO `xy_verify_msg` VALUES ('18380276519', '14441', '1575440533', '1');
INSERT INTO `xy_verify_msg` VALUES ('18692565454', '52363', '1575440642', '3');
INSERT INTO `xy_verify_msg` VALUES ('13841624752', '85092', '1575440677', '1');
INSERT INTO `xy_verify_msg` VALUES ('13215395554', '30225', '1575441005', '1');
INSERT INTO `xy_verify_msg` VALUES ('15669333015', '39056', '1575441176', '1');
INSERT INTO `xy_verify_msg` VALUES ('13413921934', '32670', '1575443552', '1');
INSERT INTO `xy_verify_msg` VALUES ('18672572065', '87828', '1575443967', '1');
INSERT INTO `xy_verify_msg` VALUES ('13889242328', '76470', '1575444065', '1');
INSERT INTO `xy_verify_msg` VALUES ('15915718348', '49953', '1575444242', '1');
INSERT INTO `xy_verify_msg` VALUES ('17665151090', '36469', '1575452877', '1');
INSERT INTO `xy_verify_msg` VALUES ('17736536161', '53673', '1575452972', '1');
INSERT INTO `xy_verify_msg` VALUES ('15855865596', '27676', '1575454687', '1');
INSERT INTO `xy_verify_msg` VALUES ('13269856680', '83485', '1575455159', '1');
INSERT INTO `xy_verify_msg` VALUES ('13480249478', '16903', '1575455832', '1');
INSERT INTO `xy_verify_msg` VALUES ('13177774065', '13571', '1575456614', '1');
INSERT INTO `xy_verify_msg` VALUES ('15178331570', '54541', '1575456944', '1');
INSERT INTO `xy_verify_msg` VALUES ('17360990253', '77239', '1575457590', '1');
INSERT INTO `xy_verify_msg` VALUES ('17888290226', '80299', '1575458042', '1');
INSERT INTO `xy_verify_msg` VALUES ('13675352630', '41590', '1575458279', '1');
INSERT INTO `xy_verify_msg` VALUES ('13891193020', '83078', '1575458532', '1');
INSERT INTO `xy_verify_msg` VALUES ('18367060036', '24978', '1575460426', '1');
INSERT INTO `xy_verify_msg` VALUES ('17109324202', '97680', '1575460512', '1');
INSERT INTO `xy_verify_msg` VALUES ('13425694548', '48267', '1575461743', '1');
INSERT INTO `xy_verify_msg` VALUES ('15868849401', '27211', '1575461909', '1');
INSERT INTO `xy_verify_msg` VALUES ('13250478287', '40770', '1575462844', '1');
INSERT INTO `xy_verify_msg` VALUES ('17601603806', '59178', '1575463188', '1');
INSERT INTO `xy_verify_msg` VALUES ('18613579782', '92365', '1575464150', '1');
INSERT INTO `xy_verify_msg` VALUES ('15849503735', '90649', '1575464894', '1');
INSERT INTO `xy_verify_msg` VALUES ('13730372514', '15429', '1575465449', '1');
INSERT INTO `xy_verify_msg` VALUES ('18203920486', '84805', '1575466962', '1');
INSERT INTO `xy_verify_msg` VALUES ('18312991996', '94372', '1575466302', '1');
INSERT INTO `xy_verify_msg` VALUES ('18539240874', '77119', '1575466420', '1');
INSERT INTO `xy_verify_msg` VALUES ('15702125031', '14112', '1575468258', '1');
INSERT INTO `xy_verify_msg` VALUES ('18186340442', '47529', '1575468861', '1');
INSERT INTO `xy_verify_msg` VALUES ('13285969560', '14342', '1575468981', '1');
INSERT INTO `xy_verify_msg` VALUES ('15668192597', '31009', '1575469429', '1');
INSERT INTO `xy_verify_msg` VALUES ('19862387747', '99547', '1575470937', '1');
INSERT INTO `xy_verify_msg` VALUES ('15212131997', '76898', '1575475656', '1');
INSERT INTO `xy_verify_msg` VALUES ('15326721627', '97184', '1575477327', '1');
INSERT INTO `xy_verify_msg` VALUES ('15514799222', '63001', '1575478217', '1');
INSERT INTO `xy_verify_msg` VALUES ('13018724894', '87805', '1575480075', '1');
INSERT INTO `xy_verify_msg` VALUES ('18761528305', '88012', '1575500786', '1');
INSERT INTO `xy_verify_msg` VALUES ('13074776305', '35231', '1575502526', '1');
INSERT INTO `xy_verify_msg` VALUES ('18952715676', '19309', '1575506264', '1');
INSERT INTO `xy_verify_msg` VALUES ('13938755811', '14281', '1575507431', '1');
INSERT INTO `xy_verify_msg` VALUES ('15200970586', '56763', '1575511673', '1');
INSERT INTO `xy_verify_msg` VALUES ('15727547608', '82257', '1575512910', '1');
INSERT INTO `xy_verify_msg` VALUES ('13636928552', '86898', '1575514009', '1');
INSERT INTO `xy_verify_msg` VALUES ('18311666289', '15635', '1575515263', '1');
INSERT INTO `xy_verify_msg` VALUES ('18385205989', '25455', '1575516147', '3');
INSERT INTO `xy_verify_msg` VALUES ('13222702076', '40682', '1575516473', '1');
INSERT INTO `xy_verify_msg` VALUES ('18292330752', '46948', '1575516568', '1');
INSERT INTO `xy_verify_msg` VALUES ('13312330228', '10942', '1575516775', '1');
INSERT INTO `xy_verify_msg` VALUES ('18302872790', '54206', '1575521663', '1');
INSERT INTO `xy_verify_msg` VALUES ('13979123576', '16540', '1575522373', '1');
INSERT INTO `xy_verify_msg` VALUES ('15670773136', '88992', '1575522905', '1');
INSERT INTO `xy_verify_msg` VALUES ('17634610141', '66253', '1575523170', '1');
INSERT INTO `xy_verify_msg` VALUES ('15999972408', '17009', '1575523419', '1');
INSERT INTO `xy_verify_msg` VALUES ('18670943264', '88492', '1575523984', '1');
INSERT INTO `xy_verify_msg` VALUES ('18012314332', '95913', '1575526126', '1');
INSERT INTO `xy_verify_msg` VALUES ('18261394162', '70668', '1575526759', '2');
INSERT INTO `xy_verify_msg` VALUES ('17781825563', '44746', '1575526713', '1');
INSERT INTO `xy_verify_msg` VALUES ('15983200156', '76019', '1575526942', '1');
INSERT INTO `xy_verify_msg` VALUES ('18370113021', '32234', '1575527140', '1');
INSERT INTO `xy_verify_msg` VALUES ('15521216409', '65171', '1575527441', '1');
INSERT INTO `xy_verify_msg` VALUES ('13337010494', '73795', '1575527672', '1');
INSERT INTO `xy_verify_msg` VALUES ('15930044724', '12302', '1575527903', '1');
INSERT INTO `xy_verify_msg` VALUES ('18671399792', '41227', '1575527990', '1');
INSERT INTO `xy_verify_msg` VALUES ('13355383991', '17486', '1575528119', '1');
INSERT INTO `xy_verify_msg` VALUES ('13354383991', '45771', '1575528209', '1');
INSERT INTO `xy_verify_msg` VALUES ('18605619489', '73779', '1575531591', '3');
INSERT INTO `xy_verify_msg` VALUES ('18317917137', '54099', '1575529285', '2');
INSERT INTO `xy_verify_msg` VALUES ('15003750445', '71687', '1575529751', '1');
INSERT INTO `xy_verify_msg` VALUES ('15003650445', '49971', '1575529812', '1');
INSERT INTO `xy_verify_msg` VALUES ('18770283508', '97396', '1575529941', '1');
INSERT INTO `xy_verify_msg` VALUES ('15851831427', '53282', '1575531091', '1');
INSERT INTO `xy_verify_msg` VALUES ('18503978172', '43746', '1575531650', '1');
INSERT INTO `xy_verify_msg` VALUES ('18750888027', '93308', '1575532099', '1');
INSERT INTO `xy_verify_msg` VALUES ('18707025688', '99156', '1575532306', '1');
INSERT INTO `xy_verify_msg` VALUES ('17697364761', '12508', '1575532823', '1');
INSERT INTO `xy_verify_msg` VALUES ('13847820311', '83114', '1575535270', '1');
INSERT INTO `xy_verify_msg` VALUES ('19139606630', '27548', '1575538010', '1');
INSERT INTO `xy_verify_msg` VALUES ('18658856648', '31757', '1575538401', '1');
INSERT INTO `xy_verify_msg` VALUES ('18678289385', '40019', '1575539512', '1');
INSERT INTO `xy_verify_msg` VALUES ('13068639181', '36841', '1575540915', '1');
INSERT INTO `xy_verify_msg` VALUES ('15528248198', '21869', '1575542633', '1');
INSERT INTO `xy_verify_msg` VALUES ('17648186653', '55096', '1575543051', '1');
INSERT INTO `xy_verify_msg` VALUES ('15985236989', '18080', '1575542728', '1');
INSERT INTO `xy_verify_msg` VALUES ('15661991209', '51089', '1575542780', '1');
INSERT INTO `xy_verify_msg` VALUES ('15985033973', '89572', '1575542863', '1');
INSERT INTO `xy_verify_msg` VALUES ('14747866408', '32813', '1575543397', '1');
INSERT INTO `xy_verify_msg` VALUES ('13055595534', '68412', '1575544104', '1');
INSERT INTO `xy_verify_msg` VALUES ('19834553336', '24388', '1575544140', '1');
INSERT INTO `xy_verify_msg` VALUES ('18701847413', '22921', '1575544488', '1');
INSERT INTO `xy_verify_msg` VALUES ('13612515286', '24616', '1575545096', '1');
INSERT INTO `xy_verify_msg` VALUES ('15974080179', '47584', '1575547611', '1');
INSERT INTO `xy_verify_msg` VALUES ('13240548273', '16792', '1575547624', '1');
INSERT INTO `xy_verify_msg` VALUES ('13205679501', '58857', '1575549359', '1');
INSERT INTO `xy_verify_msg` VALUES ('17639568781', '26324', '1575549946', '1');
INSERT INTO `xy_verify_msg` VALUES ('15007583650', '64304', '1575550057', '1');
INSERT INTO `xy_verify_msg` VALUES ('15515506574', '42672', '1575550211', '2');
INSERT INTO `xy_verify_msg` VALUES ('13912757473', '39836', '1575550805', '1');
INSERT INTO `xy_verify_msg` VALUES ('13399526890', '12890', '1575551421', '2');
INSERT INTO `xy_verify_msg` VALUES ('17614070638', '92587', '1575551613', '1');
INSERT INTO `xy_verify_msg` VALUES ('15191983071', '90046', '1575553007', '1');
INSERT INTO `xy_verify_msg` VALUES ('17603216760', '97316', '1575554705', '1');
INSERT INTO `xy_verify_msg` VALUES ('15270249034', '28165', '1575555277', '1');
INSERT INTO `xy_verify_msg` VALUES ('18565914063', '37884', '1575557580', '1');
INSERT INTO `xy_verify_msg` VALUES ('17729712535', '61000', '1575559087', '1');
INSERT INTO `xy_verify_msg` VALUES ('18033249958', '73025', '1575567878', '1');
INSERT INTO `xy_verify_msg` VALUES ('13279566913', '47637', '1575572047', '1');
INSERT INTO `xy_verify_msg` VALUES ('18236981845', '47128', '1575580703', '1');
INSERT INTO `xy_verify_msg` VALUES ('17638326466', '87595', '1575596866', '1');
INSERT INTO `xy_verify_msg` VALUES ('15518674889', '48733', '1575597402', '1');
INSERT INTO `xy_verify_msg` VALUES ('13117995372', '40991', '1575600270', '1');
INSERT INTO `xy_verify_msg` VALUES ('13927296938', '13950', '1575601077', '1');
INSERT INTO `xy_verify_msg` VALUES ('18104780587', '84629', '1575601316', '1');
INSERT INTO `xy_verify_msg` VALUES ('13853332099', '12638', '1575601769', '1');
INSERT INTO `xy_verify_msg` VALUES ('14707718873', '29713', '1575602378', '1');
INSERT INTO `xy_verify_msg` VALUES ('15921100850', '34763', '1575602704', '1');
INSERT INTO `xy_verify_msg` VALUES ('15683310712', '14917', '1575603245', '1');
INSERT INTO `xy_verify_msg` VALUES ('13630514724', '20496', '1575603553', '1');
INSERT INTO `xy_verify_msg` VALUES ('13512706980', '61673', '1575604399', '1');
INSERT INTO `xy_verify_msg` VALUES ('18306173075', '81262', '1575604540', '1');
INSERT INTO `xy_verify_msg` VALUES ('13860973358', '28718', '1575608098', '1');
INSERT INTO `xy_verify_msg` VALUES ('18215071177', '73413', '1575610296', '2');
INSERT INTO `xy_verify_msg` VALUES ('15062073857', '58255', '1575610536', '1');
INSERT INTO `xy_verify_msg` VALUES ('15674869826', '32518', '1575611400', '1');
INSERT INTO `xy_verify_msg` VALUES ('13773296794', '28886', '1575611670', '1');
INSERT INTO `xy_verify_msg` VALUES ('15015593191', '28430', '1575613474', '1');
INSERT INTO `xy_verify_msg` VALUES ('13629124174', '23635', '1575617298', '1');
INSERT INTO `xy_verify_msg` VALUES ('13620747457', '34909', '1575614914', '1');
INSERT INTO `xy_verify_msg` VALUES ('19832298531', '40262', '1575615198', '1');
INSERT INTO `xy_verify_msg` VALUES ('13242740704', '68620', '1575615273', '1');
INSERT INTO `xy_verify_msg` VALUES ('18711889473', '82925', '1575615360', '1');
INSERT INTO `xy_verify_msg` VALUES ('18533251536', '69476', '1575616164', '1');
INSERT INTO `xy_verify_msg` VALUES ('18095212356', '50853', '1575623910', '3');
INSERT INTO `xy_verify_msg` VALUES ('17686170649', '34885', '1575620319', '1');
INSERT INTO `xy_verify_msg` VALUES ('13313250678', '57620', '1575620413', '1');
INSERT INTO `xy_verify_msg` VALUES ('17353877880', '43323', '1575620563', '1');
INSERT INTO `xy_verify_msg` VALUES ('13638411683', '49001', '1575624427', '1');
INSERT INTO `xy_verify_msg` VALUES ('15832806221', '87726', '1575626218', '2');
INSERT INTO `xy_verify_msg` VALUES ('15219771845', '83307', '1575625939', '1');
INSERT INTO `xy_verify_msg` VALUES ('15083103120', '13469', '1575632000', '1');
INSERT INTO `xy_verify_msg` VALUES ('15286348317', '29614', '1575629605', '1');
INSERT INTO `xy_verify_msg` VALUES ('18658839662', '40706', '1575630229', '1');
INSERT INTO `xy_verify_msg` VALUES ('18687729085', '62586', '1575630629', '1');
INSERT INTO `xy_verify_msg` VALUES ('13668929949', '91347', '1575631759', '1');
INSERT INTO `xy_verify_msg` VALUES ('15972609270', '72824', '1575631855', '1');
INSERT INTO `xy_verify_msg` VALUES ('17611261208', '21473', '1575631856', '1');
INSERT INTO `xy_verify_msg` VALUES ('13268065990', '27760', '1575633471', '1');
INSERT INTO `xy_verify_msg` VALUES ('18157620873', '75275', '1575634017', '1');
INSERT INTO `xy_verify_msg` VALUES ('18133386267', '12337', '1575635660', '1');
INSERT INTO `xy_verify_msg` VALUES ('18830081358', '40586', '1575636488', '1');
INSERT INTO `xy_verify_msg` VALUES ('14751109308', '36964', '1575637643', '1');
INSERT INTO `xy_verify_msg` VALUES ('18272955568', '99008', '1575640812', '1');
INSERT INTO `xy_verify_msg` VALUES ('13677809200', '43633', '1575640512', '1');
INSERT INTO `xy_verify_msg` VALUES ('18699877076', '20015', '1575644106', '1');
INSERT INTO `xy_verify_msg` VALUES ('15206684882', '56581', '1575646209', '1');
INSERT INTO `xy_verify_msg` VALUES ('18508763225', '43989', '1575650143', '1');
INSERT INTO `xy_verify_msg` VALUES ('17800688708', '69779', '1575657219', '1');
INSERT INTO `xy_verify_msg` VALUES ('18648547369', '28815', '1575657407', '1');
INSERT INTO `xy_verify_msg` VALUES ('13131222957', '58827', '1575679041', '1');
INSERT INTO `xy_verify_msg` VALUES ('18047528848', '31902', '1575679161', '1');
INSERT INTO `xy_verify_msg` VALUES ('13554884924', '84922', '1575681772', '1');
INSERT INTO `xy_verify_msg` VALUES ('13409207321', '43559', '1575682178', '1');
INSERT INTO `xy_verify_msg` VALUES ('17671337490', '69883', '1575686808', '1');
INSERT INTO `xy_verify_msg` VALUES ('13148669529', '55199', '1575688046', '1');
INSERT INTO `xy_verify_msg` VALUES ('13116221874', '88312', '1575697288', '1');
INSERT INTO `xy_verify_msg` VALUES ('18136374050', '34484', '1575699950', '1');
INSERT INTO `xy_verify_msg` VALUES ('13469360423', '31158', '1575701532', '1');
INSERT INTO `xy_verify_msg` VALUES ('15659357091', '86935', '1575701609', '1');
INSERT INTO `xy_verify_msg` VALUES ('18090028098', '30006', '1575702475', '2');
INSERT INTO `xy_verify_msg` VALUES ('18751713300', '38459', '1575704300', '3');
INSERT INTO `xy_verify_msg` VALUES ('13915267424', '27198', '1575707934', '1');
INSERT INTO `xy_verify_msg` VALUES ('13971345610', '33959', '1575708679', '1');
INSERT INTO `xy_verify_msg` VALUES ('15333779351', '16159', '1575709517', '1');
INSERT INTO `xy_verify_msg` VALUES ('18155225273', '11155', '1575711195', '1');
INSERT INTO `xy_verify_msg` VALUES ('19909949873', '10678', '1575711830', '1');
INSERT INTO `xy_verify_msg` VALUES ('15552326234', '51159', '1575712687', '1');
INSERT INTO `xy_verify_msg` VALUES ('17624033682', '36781', '1575718087', '1');
INSERT INTO `xy_verify_msg` VALUES ('18503592400', '23412', '1575718476', '1');
INSERT INTO `xy_verify_msg` VALUES ('18600864120', '11184', '1575719047', '1');
INSERT INTO `xy_verify_msg` VALUES ('17821909673', '18590', '1575719220', '1');
INSERT INTO `xy_verify_msg` VALUES ('18284309713', '30920', '1575719962', '1');
INSERT INTO `xy_verify_msg` VALUES ('15915616902', '91088', '1575722281', '1');
INSERT INTO `xy_verify_msg` VALUES ('13546550374', '77199', '1575723328', '1');
INSERT INTO `xy_verify_msg` VALUES ('17733989722', '33662', '1575769578', '1');
INSERT INTO `xy_verify_msg` VALUES ('17777348826', '59434', '1575775642', '1');
INSERT INTO `xy_verify_msg` VALUES ('19884618793', '47390', '1575778103', '1');
INSERT INTO `xy_verify_msg` VALUES ('18272894677', '62278', '1575783773', '1');
INSERT INTO `xy_verify_msg` VALUES ('13819940455', '34095', '1575783985', '1');
INSERT INTO `xy_verify_msg` VALUES ('18176038132', '74015', '1575784229', '1');
INSERT INTO `xy_verify_msg` VALUES ('15121530969', '14808', '1575785083', '1');
INSERT INTO `xy_verify_msg` VALUES ('17109324121', '24844', '1575786845', '1');
INSERT INTO `xy_verify_msg` VALUES ('13045799260', '23838', '1575789802', '1');
INSERT INTO `xy_verify_msg` VALUES ('17752518764', '58304', '1575792281', '1');
INSERT INTO `xy_verify_msg` VALUES ('18206539390', '45441', '1575793853', '1');
INSERT INTO `xy_verify_msg` VALUES ('18296395441', '73192', '1575794252', '1');
INSERT INTO `xy_verify_msg` VALUES ('15818547702', '59707', '1575798261', '1');
INSERT INTO `xy_verify_msg` VALUES ('15278413992', '76451', '1575798654', '1');
INSERT INTO `xy_verify_msg` VALUES ('18696790487', '51433', '1575800001', '1');
INSERT INTO `xy_verify_msg` VALUES ('18123406351', '73477', '1575800513', '1');
INSERT INTO `xy_verify_msg` VALUES ('13670636859', '35327', '1575800675', '1');
INSERT INTO `xy_verify_msg` VALUES ('15036395913', '46722', '1575801365', '1');
INSERT INTO `xy_verify_msg` VALUES ('18773701706', '88268', '1575801609', '1');
INSERT INTO `xy_verify_msg` VALUES ('19874112882', '74628', '1575802507', '1');
INSERT INTO `xy_verify_msg` VALUES ('18095780810', '94029', '1575804395', '1');
INSERT INTO `xy_verify_msg` VALUES ('18710471219', '50456', '1575806188', '1');
INSERT INTO `xy_verify_msg` VALUES ('18522541184', '46877', '1575812017', '1');
INSERT INTO `xy_verify_msg` VALUES ('13343484221', '19658', '1575816275', '1');
INSERT INTO `xy_verify_msg` VALUES ('18657160407', '22692', '1575821715', '1');
INSERT INTO `xy_verify_msg` VALUES ('17513211162', '48851', '1575828557', '1');
INSERT INTO `xy_verify_msg` VALUES ('17335650158', '73034', '1575839316', '1');
INSERT INTO `xy_verify_msg` VALUES ('15549086722', '49074', '1575842216', '1');
INSERT INTO `xy_verify_msg` VALUES ('17637839905', '80657', '1575847104', '1');
INSERT INTO `xy_verify_msg` VALUES ('18636542255', '17930', '1575851066', '1');
INSERT INTO `xy_verify_msg` VALUES ('13427851386', '80224', '1575855123', '1');
INSERT INTO `xy_verify_msg` VALUES ('15563148989', '63074', '1575859722', '1');
INSERT INTO `xy_verify_msg` VALUES ('18144877589', '58695', '1575861738', '1');
INSERT INTO `xy_verify_msg` VALUES ('18990170450', '86934', '1575866663', '1');
INSERT INTO `xy_verify_msg` VALUES ('13824518533', '37901', '1575867280', '1');
INSERT INTO `xy_verify_msg` VALUES ('18512873992', '16198', '1575869973', '1');
INSERT INTO `xy_verify_msg` VALUES ('13984233489', '19740', '1575870681', '1');
INSERT INTO `xy_verify_msg` VALUES ('17530318803', '15921', '1575872143', '1');
INSERT INTO `xy_verify_msg` VALUES ('13437398583', '90276', '1575875170', '1');
INSERT INTO `xy_verify_msg` VALUES ('13706678260', '18989', '1575876088', '1');
INSERT INTO `xy_verify_msg` VALUES ('13143187425', '27958', '1575876479', '1');
INSERT INTO `xy_verify_msg` VALUES ('18007094336', '80124', '1575877077', '1');
INSERT INTO `xy_verify_msg` VALUES ('17666541762', '40516', '1575878886', '1');
INSERT INTO `xy_verify_msg` VALUES ('15355843635', '67802', '1575881169', '1');
INSERT INTO `xy_verify_msg` VALUES ('13397334761', '66081', '1575881177', '1');
INSERT INTO `xy_verify_msg` VALUES ('13168745169', '24554', '1575882620', '1');
INSERT INTO `xy_verify_msg` VALUES ('18637320030', '79671', '1575884471', '1');
INSERT INTO `xy_verify_msg` VALUES ('15892711857', '90494', '1575886653', '1');
INSERT INTO `xy_verify_msg` VALUES ('18377209858', '49622', '1575889357', '1');
INSERT INTO `xy_verify_msg` VALUES ('15272904689', '52947', '1575890471', '1');
INSERT INTO `xy_verify_msg` VALUES ('13076012463', '33939', '1575892818', '1');
INSERT INTO `xy_verify_msg` VALUES ('13952149780', '70663', '1575897881', '1');
INSERT INTO `xy_verify_msg` VALUES ('15819061397', '81193', '1575898534', '1');
INSERT INTO `xy_verify_msg` VALUES ('18059067857', '90104', '1575898868', '1');
INSERT INTO `xy_verify_msg` VALUES ('13590085152', '52137', '1575907679', '1');
INSERT INTO `xy_verify_msg` VALUES ('13511849091', '29873', '1575921337', '1');
INSERT INTO `xy_verify_msg` VALUES ('18689284659', '84164', '1575932619', '1');
INSERT INTO `xy_verify_msg` VALUES ('15818192442', '55935', '1575934410', '1');
INSERT INTO `xy_verify_msg` VALUES ('17642185696', '32514', '1575937710', '1');
INSERT INTO `xy_verify_msg` VALUES ('15767944014', '66393', '1575937853', '1');
INSERT INTO `xy_verify_msg` VALUES ('15024016873', '50486', '1575938936', '1');
INSERT INTO `xy_verify_msg` VALUES ('15027716060', '47662', '1575939085', '1');
INSERT INTO `xy_verify_msg` VALUES ('15072577913', '10944', '1575939218', '1');
INSERT INTO `xy_verify_msg` VALUES ('19175667020', '94544', '1575939775', '1');
INSERT INTO `xy_verify_msg` VALUES ('15647492636', '61558', '1575940295', '1');
INSERT INTO `xy_verify_msg` VALUES ('15142144267', '88929', '1575944779', '1');
INSERT INTO `xy_verify_msg` VALUES ('15076786518', '18665', '1575946319', '1');
INSERT INTO `xy_verify_msg` VALUES ('18367504539', '85671', '1576234319', '1');
INSERT INTO `xy_verify_msg` VALUES ('17056156072', '54801', '1576473469', '1');
INSERT INTO `xy_verify_msg` VALUES ('13111122221', '68140', '1577369539', '2');
INSERT INTO `xy_verify_msg` VALUES ('13178228091', '51476', '1577370017', '1');
INSERT INTO `xy_verify_msg` VALUES ('17319266010', '78007', '1578156076', '2');
INSERT INTO `xy_verify_msg` VALUES ('17319266011', '18517', '1577701341', '1');
INSERT INTO `xy_verify_msg` VALUES ('18162067222', '34748', '1581753356', '1');
INSERT INTO `xy_verify_msg` VALUES ('13397364436', '92302', '1581939477', '1');
INSERT INTO `xy_verify_msg` VALUES ('17799590055', '91610', '1581943724', '1');
INSERT INTO `xy_verify_msg` VALUES ('13555427443', '51428', '1582006053', '1');
INSERT INTO `xy_verify_msg` VALUES ('18971318257', '66685', '1582008140', '1');
INSERT INTO `xy_verify_msg` VALUES ('18713429578', '33849', '1582011424', '1');
INSERT INTO `xy_verify_msg` VALUES ('13924906465', '66374', '1582012878', '1');
INSERT INTO `xy_verify_msg` VALUES ('13355842573', '61654', '1582014217', '1');
INSERT INTO `xy_verify_msg` VALUES ('18196110725', '54394', '1582014826', '1');
INSERT INTO `xy_verify_msg` VALUES ('17613812632', '39372', '1582021149', '1');
INSERT INTO `xy_verify_msg` VALUES ('13279940228', '72813', '1582025181', '1');
INSERT INTO `xy_verify_msg` VALUES ('15109944280', '37769', '1582025889', '1');
INSERT INTO `xy_verify_msg` VALUES ('18179921557', '57100', '1582036563', '1');
INSERT INTO `xy_verify_msg` VALUES ('18787746394', '81848', '1582068594', '1');
INSERT INTO `xy_verify_msg` VALUES ('15085880992', '68335', '1582077712', '1');
INSERT INTO `xy_verify_msg` VALUES ('13975002077', '93968', '1582079560', '1');
INSERT INTO `xy_verify_msg` VALUES ('18690857342', '38496', '1582099390', '1');
INSERT INTO `xy_verify_msg` VALUES ('13706974676', '45869', '1582103305', '1');
INSERT INTO `xy_verify_msg` VALUES ('18878332859', '26067', '1582130836', '1');
INSERT INTO `xy_verify_msg` VALUES ('13036636363', '84769', '1582196608', '1');
INSERT INTO `xy_verify_msg` VALUES ('18578300330', '73160', '1582195787', '1');
INSERT INTO `xy_verify_msg` VALUES ('15513172965', '83818', '1582195842', '2');
INSERT INTO `xy_verify_msg` VALUES ('18067934183', '95572', '1582195872', '1');
INSERT INTO `xy_verify_msg` VALUES ('18357390628', '27961', '1582196062', '2');
INSERT INTO `xy_verify_msg` VALUES ('17560318296', '65128', '1582196220', '1');
INSERT INTO `xy_verify_msg` VALUES ('15553267532', '84396', '1582196427', '1');
INSERT INTO `xy_verify_msg` VALUES ('13832693652', '82717', '1582196509', '2');
INSERT INTO `xy_verify_msg` VALUES ('18088909565', '87316', '1582196530', '1');
INSERT INTO `xy_verify_msg` VALUES ('18697010718', '95629', '1582196709', '1');
INSERT INTO `xy_verify_msg` VALUES ('18605177436', '22878', '1582197280', '2');
INSERT INTO `xy_verify_msg` VALUES ('15612637576', '51069', '1582256065', '1');
INSERT INTO `xy_verify_msg` VALUES ('15386909655', '21179', '1582199969', '1');
INSERT INTO `xy_verify_msg` VALUES ('19167596247', '77276', '1582197390', '2');
INSERT INTO `xy_verify_msg` VALUES ('19851783116', '98077', '1582198318', '1');
INSERT INTO `xy_verify_msg` VALUES ('18771419838', '55860', '1582198360', '2');
INSERT INTO `xy_verify_msg` VALUES ('13377782973', '94141', '1582243561', '2');
INSERT INTO `xy_verify_msg` VALUES ('13176541256', '86549', '1582200218', '1');
INSERT INTO `xy_verify_msg` VALUES ('18174768455', '43729', '1582198862', '1');
INSERT INTO `xy_verify_msg` VALUES ('18145685838', '94980', '1582199273', '1');
INSERT INTO `xy_verify_msg` VALUES ('18745500058', '81148', '1582199453', '1');
INSERT INTO `xy_verify_msg` VALUES ('17637886685', '97400', '1582200763', '1');
INSERT INTO `xy_verify_msg` VALUES ('18516152834', '57111', '1582218648', '1');
INSERT INTO `xy_verify_msg` VALUES ('18265552032', '56399', '1582241199', '1');
INSERT INTO `xy_verify_msg` VALUES ('18023117730', '17128', '1582241934', '1');
INSERT INTO `xy_verify_msg` VALUES ('19853508852', '96889', '1582242770', '1');
INSERT INTO `xy_verify_msg` VALUES ('15767995920', '48741', '1582263058', '1');
INSERT INTO `xy_verify_msg` VALUES ('18522191895', '38191', '1582263429', '2');
INSERT INTO `xy_verify_msg` VALUES ('18733520151', '61400', '1582263488', '1');
INSERT INTO `xy_verify_msg` VALUES ('15766795920', '39312', '1582263899', '3');
INSERT INTO `xy_verify_msg` VALUES ('15852995151', '16833', '1582274631', '1');
INSERT INTO `xy_verify_msg` VALUES ('18503043295', '25481', '1583254394', '1');
INSERT INTO `xy_verify_msg` VALUES ('18028533272', '16753', '1583126466', '1');
