/*
 Navicat Premium Data Transfer

 Source Server         : 个人阿里云
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 39.96.113.74:3306
 Source Schema         : xyyl-erp

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 09/02/2021 16:49:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base
-- ----------------------------
DROP TABLE IF EXISTS `base`;
CREATE TABLE `base`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `weigh` int(11) NULL DEFAULT NULL COMMENT '权重/排序',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=隐藏,2=显示,3=弃用',
  `open_time` int(11) NULL DEFAULT NULL COMMENT '开启时间',
  `finish_time` int(11) NULL DEFAULT NULL COMMENT '过期时间',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多图',
  `switch` tinyint(1) NULL DEFAULT 2 COMMENT '开关:1=启用',
  `class_list` enum('1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '分类:1=基本类',
  `label_list` set('1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标签:1=基本标签',
  `json` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '示范表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_admin
-- ----------------------------
DROP TABLE IF EXISTS `erp_admin`;
CREATE TABLE `erp_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(11) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_admin
-- ----------------------------
INSERT INTO `erp_admin` VALUES (1, 'root', '开发者', 'df54dbe0a07a5499bdc2f27fc7566d12', 'd4e439', '/assets/img/title.png', 'linxyyl@163.com', 0, 1612860007, '116.18.23.127', 1607494716, 1612860029, '', 'normal');
INSERT INTO `erp_admin` VALUES (2, 'admin', 'admin', '21ac50fa870647692df49f542301097a', 'm0anVN', '/assets/img/admin.jpg', 'admin@admin.com', 0, 1612860033, '116.18.23.127', 1607494716, 1612860033, 'bd9ea036-9d14-473b-aaff-3afff7c2937d', 'normal');

-- ----------------------------
-- Table structure for erp_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `erp_admin_log`;
CREATE TABLE `erp_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_attachment
-- ----------------------------
DROP TABLE IF EXISTS `erp_attachment`;
CREATE TABLE `erp_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filesize` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(11) NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_attachment
-- ----------------------------
INSERT INTO `erp_attachment` VALUES (3, 1, 0, '/uploads/20210209/8b75ab495e1c331f691082c464c7ee1d.jpg', '500', '667', 'jpg', 0, 26240, 'image/jpeg', '{\"name\":\"u=2980929284,185161147&amp;fm=26&amp;gp=0.jpg\"}', 1612847365, 1612847365, 1612847365, 'local', 'f03d1b4de6d44006221b7d3d7e3573c239c9ccdf');

-- ----------------------------
-- Table structure for erp_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `erp_auth_group`;
CREATE TABLE `erp_auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则ID',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_auth_group
-- ----------------------------
INSERT INTO `erp_auth_group` VALUES (1, 0, 'Admin group', '*', 1607494716, 1607494716, 'normal');
INSERT INTO `erp_auth_group` VALUES (2, 1, '超级管理组', '1,2,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,148,149,150,151,152,153,154,158,159,160,161,162,163,164,168,169,170,171,172,173,174,177,178,179,180,181,182,183,187,188,189,190,191,192,193,221,222,223,224,225,226,227,228,231,256,257,258,259,260,261,262,263,264,265,266,267,268,271,272,273,274,275,276,277,281,282,283,284,285,286,287,290,291,292,293,294,295,296,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,351,352,5,147,126,124,157,167,136,186,220,195,230,255,270,280,279,289,316,333,350,245', 1607494716, 1612860024, 'normal');

-- ----------------------------
-- Table structure for erp_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `erp_auth_group_access`;
CREATE TABLE `erp_auth_group_access`  (
  `uid` int(11) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(11) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_auth_group_access
-- ----------------------------
INSERT INTO `erp_auth_group_access` VALUES (1, 1);
INSERT INTO `erp_auth_group_access` VALUES (2, 2);

-- ----------------------------
-- Table structure for erp_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `erp_auth_rule`;
CREATE TABLE `erp_auth_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由规则',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 360 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_auth_rule
-- ----------------------------
INSERT INTO `erp_auth_rule` VALUES (1, 'file', 0, 'dashboard', '', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1607494716, 1607494716, 143, 'normal');
INSERT INTO `erp_auth_rule` VALUES (2, 'file', 0, 'general', '', 'General', 'fa fa-cogs', '', '', 1, 1607494716, 1607494716, 137, 'normal');
INSERT INTO `erp_auth_rule` VALUES (4, 'file', 123, 'addon', '', '插件管理', 'fa fa-rocket', '', 'Addon tips', 1, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (5, 'file', 0, 'auth', '', '权限管理', 'fa fa-group', '', '', 1, 1607494716, 1607494716, 99, 'normal');
INSERT INTO `erp_auth_rule` VALUES (6, 'file', 2, 'general/config', 'general.config/index', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1607494716, 1607494716, 60, 'normal');
INSERT INTO `erp_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'general.attachment/index', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1607494716, 1607494716, 53, 'normal');
INSERT INTO `erp_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'general.profile/index', 'Profile', 'fa fa-user', '', '', 1, 1607494716, 1607494716, 34, 'normal');
INSERT INTO `erp_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'auth.admin/index', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1607494716, 1607494716, 118, 'normal');
INSERT INTO `erp_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'auth.adminlog/index', '管理员日志', 'fa fa-list-alt', '', 'Admin log tips', 0, 1607494716, 1607494716, 113, 'hidden');
INSERT INTO `erp_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'auth.group/index', 'Group', 'fa fa-group', '', 'Group tips', 1, 1607494716, 1607494716, 109, 'normal');
INSERT INTO `erp_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'auth.rule/index', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1607494716, 1607494716, 104, 'normal');
INSERT INTO `erp_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', '', 'View', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 136, 'normal');
INSERT INTO `erp_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', '', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 135, 'normal');
INSERT INTO `erp_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', '', 'Delete', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 133, 'normal');
INSERT INTO `erp_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', '', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 134, 'normal');
INSERT INTO `erp_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', '', 'Multi', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 132, 'normal');
INSERT INTO `erp_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'general.config/index', 'View', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 52, 'normal');
INSERT INTO `erp_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'general.config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 51, 'normal');
INSERT INTO `erp_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'general.config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 50, 'normal');
INSERT INTO `erp_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'general.config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 49, 'normal');
INSERT INTO `erp_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'general.config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 48, 'normal');
INSERT INTO `erp_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'general.attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1607494716, 1607494716, 59, 'normal');
INSERT INTO `erp_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'general.attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 58, 'normal');
INSERT INTO `erp_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'general.attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 57, 'normal');
INSERT INTO `erp_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'general.attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 56, 'normal');
INSERT INTO `erp_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'general.attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 55, 'normal');
INSERT INTO `erp_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'general.attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 54, 'normal');
INSERT INTO `erp_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'general.profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 33, 'normal');
INSERT INTO `erp_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'general.profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 32, 'normal');
INSERT INTO `erp_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'general.profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 31, 'normal');
INSERT INTO `erp_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'general.profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 30, 'normal');
INSERT INTO `erp_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'general.profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 29, 'normal');
INSERT INTO `erp_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'general.profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 28, 'normal');
INSERT INTO `erp_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'auth.admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1607494716, 1607494716, 117, 'normal');
INSERT INTO `erp_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'auth.admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 116, 'normal');
INSERT INTO `erp_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'auth.admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 115, 'normal');
INSERT INTO `erp_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'auth.admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 114, 'normal');
INSERT INTO `erp_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'auth.adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1607494716, 1607494716, 112, 'normal');
INSERT INTO `erp_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'auth.adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 111, 'normal');
INSERT INTO `erp_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'auth.adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 110, 'normal');
INSERT INTO `erp_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'auth.group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1607494716, 1607494716, 108, 'normal');
INSERT INTO `erp_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'auth.group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 107, 'normal');
INSERT INTO `erp_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'auth.group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 106, 'normal');
INSERT INTO `erp_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'auth.group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 105, 'normal');
INSERT INTO `erp_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'auth.rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1607494716, 1607494716, 103, 'normal');
INSERT INTO `erp_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'auth.rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 102, 'normal');
INSERT INTO `erp_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'auth.rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 101, 'normal');
INSERT INTO `erp_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'auth.rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 100, 'normal');
INSERT INTO `erp_auth_rule` VALUES (55, 'file', 4, 'addon/index', '', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (56, 'file', 4, 'addon/add', '', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (57, 'file', 4, 'addon/edit', '', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (58, 'file', 4, 'addon/del', '', 'Delete', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (59, 'file', 4, 'addon/downloaded', '', 'Local addon', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (60, 'file', 4, 'addon/state', '', 'Update state', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (63, 'file', 4, 'addon/config', '', 'Setting', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', '', 'Refresh', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (65, 'file', 4, 'addon/multi', '', 'Multi', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (66, 'file', 0, 'user', '', '会员管理', 'fa fa-list', '', '', 1, 1607494716, 1607494716, 0, 'hidden');
INSERT INTO `erp_auth_rule` VALUES (67, 'file', 66, 'user/user', 'user.user/index', 'User', 'fa fa-user', '', '', 1, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'user.user/index', 'View', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'user.user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'user.user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'user.user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'user.user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (73, 'file', 66, 'user/group', 'user.group/index', 'User group', 'fa fa-users', '', '', 1, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'user.group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'user.group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'user.group/index', 'View', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'user.group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'user.group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'user.rule/index', '会员规则', 'fa fa-gg', '', '', 1, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'user.rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'user.rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'user.rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'user.rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'user.rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (85, 'file', 123, 'command', '', '在线命令管理', 'fa fa-terminal', '', '', 1, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (86, 'file', 85, 'command/index', 'command.index/index', '查看', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (87, 'file', 85, 'command/add', 'command.add/index', '添加', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (88, 'file', 85, 'command/detail', 'command.detail/index', '详情', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (89, 'file', 85, 'command/execute', 'command.execute/index', '运行', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (90, 'file', 85, 'command/del', 'command.del/index', '删除', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (91, 'file', 85, 'command/multi', 'command.multi/index', '批量更新', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (92, 'file', 123, 'general/databasebak', 'general.databasebak/index', '数据库管理', 'fa fa-database', '', '可在线进行一些简单的数据库表优化或修复,查看表结构和数据。也可以进行SQL语句的操作', 1, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (93, 'file', 92, 'general/databasebak/index', 'general.databasebak/index', '查看', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (94, 'file', 92, 'general/databasebak/query', 'general.databasebak/query', '查询', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (95, 'file', 92, 'general/databasebak/backup', 'general.databasebak/backup', '备份', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (96, 'file', 92, 'general/databasebak/restore', 'general.databasebak/restore', '恢复', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (97, 'file', 123, 'general/crontab', 'general.crontab/index', '定时任务', 'fa fa-tasks', '', '类似于Linux的Crontab定时任务,可以按照设定的时间进行任务的执行,目前支持四种任务:请求URL、执行SQL、执行Shell、执行Function', 1, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (98, 'file', 97, 'general/crontab/index', 'general.crontab/index', '查看', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (99, 'file', 97, 'general/crontab/add', 'general.crontab/add', '添加', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (100, 'file', 97, 'general/crontab/edit', 'general.crontab/edit', '编辑 ', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (101, 'file', 97, 'general/crontab/del', 'general.crontab/del', '删除', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (102, 'file', 97, 'general/crontab/multi', 'general.crontab/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (123, 'file', 0, 'developer', '', '开发工具', 'fa fa-codepen', '', '', 1, 1607494716, 1607494716, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (124, 'menu', 0, 'erp', '', '进销存管理', 'fa fa-object-group', '', '', 1, 1607495574, 1607495643, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (126, 'menu', 124, 'goods', '', '商品管理', 'fa fa-shopping-cart', '', '', 1, NULL, 1607591340, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (136, 'menu', 126, 'goods/goods_brand', 'goods.goods_brand/index', '商品品牌', 'fa fa-font-awesome', '', '', 1, NULL, 1607585194, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (147, 'menu', 126, 'goods/goods_place', 'goods.goods_place/index', '商品产地', 'fa fa-location-arrow', '', '', 1, NULL, 1607586091, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (148, 'menu', 147, 'goods/goods_place/index', 'goods.goods_place/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (149, 'menu', 147, 'goods/goods_place/recyclebin', 'goods.goods_place/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (150, 'menu', 147, 'goods/goods_place/add', 'goods.goods_place/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (151, 'menu', 147, 'goods/goods_place/edit', 'goods.goods_place/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (152, 'menu', 147, 'goods/goods_place/del', 'goods.goods_place/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (153, 'menu', 147, 'goods/goods_place/destroy', 'goods.goods_place/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (154, 'menu', 147, 'goods/goods_place/restore', 'goods.goods_place/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (155, 'menu', 147, 'goods/goods_place/multi', 'goods.goods_place/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (157, 'menu', 126, 'goods/goods_type', 'goods.goods_type/index', '商品分类', 'fa fa-bars', '', '', 1, NULL, 1607591370, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (158, 'menu', 157, 'goods/goods_type/index', 'goods.goods_type/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (159, 'menu', 157, 'goods/goods_type/recyclebin', 'goods.goods_type/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (160, 'menu', 157, 'goods/goods_type/add', 'goods.goods_type/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (161, 'menu', 157, 'goods/goods_type/edit', 'goods.goods_type/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (162, 'menu', 157, 'goods/goods_type/del', 'goods.goods_type/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (163, 'menu', 157, 'goods/goods_type/destroy', 'goods.goods_type/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (164, 'menu', 157, 'goods/goods_type/restore', 'goods.goods_type/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (165, 'menu', 157, 'goods/goods_type/multi', 'goods.goods_type/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (167, 'menu', 126, 'goods/goods_unit', 'goods.goods_unit/index', '商品单位', 'fa fa-ticket', '', '', 1, NULL, 1607589728, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (168, 'menu', 167, 'goods/goods_unit/index', 'goods.goods_unit/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (169, 'menu', 167, 'goods/goods_unit/recyclebin', 'goods.goods_unit/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (170, 'menu', 167, 'goods/goods_unit/add', 'goods.goods_unit/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (171, 'menu', 167, 'goods/goods_unit/edit', 'goods.goods_unit/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (172, 'menu', 167, 'goods/goods_unit/del', 'goods.goods_unit/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (173, 'menu', 167, 'goods/goods_unit/destroy', 'goods.goods_unit/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (174, 'menu', 167, 'goods/goods_unit/restore', 'goods.goods_unit/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (175, 'menu', 167, 'goods/goods_unit/multi', 'goods.goods_unit/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (177, 'menu', 136, 'goods/goods_brand/index', 'goods.goods_brand/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (178, 'menu', 136, 'goods/goods_brand/recyclebin', 'goods.goods_brand/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (179, 'menu', 136, 'goods/goods_brand/add', 'goods.goods_brand/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (180, 'menu', 136, 'goods/goods_brand/edit', 'goods.goods_brand/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (181, 'menu', 136, 'goods/goods_brand/del', 'goods.goods_brand/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (182, 'menu', 136, 'goods/goods_brand/destroy', 'goods.goods_brand/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (183, 'menu', 136, 'goods/goods_brand/restore', 'goods.goods_brand/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (184, 'menu', 136, 'goods/goods_brand/multi', 'goods.goods_brand/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (186, 'menu', 126, 'goods/goods', 'goods.goods/index', '商品列表', 'fa fa-align-justify', '', '', 1, NULL, 1607593115, 99, 'normal');
INSERT INTO `erp_auth_rule` VALUES (187, 'menu', 186, 'goods/goods/index', 'goods.goods/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (188, 'menu', 186, 'goods/goods/recyclebin', 'goods.goods/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (189, 'menu', 186, 'goods/goods/add', 'goods.goods/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (190, 'menu', 186, 'goods/goods/edit', 'goods.goods/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (191, 'menu', 186, 'goods/goods/del', 'goods.goods/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (192, 'menu', 186, 'goods/goods/destroy', 'goods.goods/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (193, 'menu', 186, 'goods/goods/restore', 'goods.goods/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (194, 'menu', 186, 'goods/goods/multi', 'goods.goods/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (195, 'menu', 124, 'stock', '', '仓库管理', 'fa fa-home', '', '', 1, NULL, 1612447681, 55, 'normal');
INSERT INTO `erp_auth_rule` VALUES (220, 'menu', 195, 'stock/stock', 'stock.stock/index', '仓库列表', 'fa fa-th-list', '', '', 1, NULL, 1612447817, 99, 'normal');
INSERT INTO `erp_auth_rule` VALUES (221, 'menu', 220, 'stock/stock/index', 'stock.stock/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (222, 'menu', 220, 'stock/stock/stockinit', 'stock.stock/stockinit', '商品初始化', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (223, 'menu', 220, 'stock/stock/recyclebin', 'stock.stock/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (224, 'menu', 220, 'stock/stock/add', 'stock.stock/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (225, 'menu', 220, 'stock/stock/edit', 'stock.stock/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (226, 'menu', 220, 'stock/stock/del', 'stock.stock/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (227, 'menu', 220, 'stock/stock/destroy', 'stock.stock/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (228, 'menu', 220, 'stock/stock/restore', 'stock.stock/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (229, 'menu', 220, 'stock/stock/multi', 'stock.stock/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (230, 'menu', 195, 'stock/stock_goods', 'stock.stock_goods/index', '仓库商品查看', 'fa fa-tasks', '', '', 1, NULL, 1612447828, 98, 'normal');
INSERT INTO `erp_auth_rule` VALUES (231, 'menu', 230, 'stock/stock_goods/index', 'stock.stock_goods/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (232, 'menu', 230, 'stock/stock_goods/add', 'stock.stock_goods/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (233, 'menu', 230, 'stock/stock_goods/edit', 'stock.stock_goods/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (234, 'menu', 230, 'stock/stock_goods/del', 'stock.stock_goods/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (235, 'menu', 230, 'stock/stock_goods/multi', 'stock.stock_goods/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (245, 'menu', 124, 'order', '', '订单管理', 'fa fa-list', '', '', 1, NULL, 1612447466, 99, 'normal');
INSERT INTO `erp_auth_rule` VALUES (255, 'menu', 195, 'stock/stock_check', 'stock.stock_check/index', '仓库盘点', 'fa fa-calculator', '', '', 1, NULL, 1612447872, 199, 'normal');
INSERT INTO `erp_auth_rule` VALUES (256, 'menu', 255, 'stock/stock_check/index', 'stock.stock_check/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (257, 'menu', 255, 'stock/stock_check/submitverify', 'stock.stock_check/submitverify', '提交审核', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (258, 'menu', 255, 'stock/stock_check/confirmverify', 'stock.stock_check/confirmverify', '确认审核', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (259, 'menu', 255, 'stock/stock_check/rejectverify', 'stock.stock_check/rejectverify', '审核驳回', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (260, 'menu', 255, 'stock/stock_check/againverify', 'stock.stock_check/againverify', '复审', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (261, 'menu', 255, 'stock/stock_check/confirmput', 'stock.stock_check/confirmput', '确认入库', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (262, 'menu', 255, 'stock/stock_check/cancelput', 'stock.stock_check/cancelput', '入库取消', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (263, 'menu', 255, 'stock/stock_check/recyclebin', 'stock.stock_check/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (264, 'menu', 255, 'stock/stock_check/add', 'stock.stock_check/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (265, 'menu', 255, 'stock/stock_check/edit', 'stock.stock_check/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (266, 'menu', 255, 'stock/stock_check/del', 'stock.stock_check/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (267, 'menu', 255, 'stock/stock_check/destroy', 'stock.stock_check/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (268, 'menu', 255, 'stock/stock_check/restore', 'stock.stock_check/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (269, 'menu', 255, 'stock/stock_check/multi', 'stock.stock_check/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (270, 'menu', 195, 'stock/stock_transfer', 'stock.stock_transfer/index', '仓库调拨', 'fa fa-exchange', '', '', 1, NULL, 1612447880, 188, 'normal');
INSERT INTO `erp_auth_rule` VALUES (271, 'menu', 270, 'stock/stock_transfer/index', 'stock.stock_transfer/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (272, 'menu', 270, 'stock/stock_transfer/recyclebin', 'stock.stock_transfer/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (273, 'menu', 270, 'stock/stock_transfer/add', 'stock.stock_transfer/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (274, 'menu', 270, 'stock/stock_transfer/edit', 'stock.stock_transfer/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (275, 'menu', 270, 'stock/stock_transfer/del', 'stock.stock_transfer/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (276, 'menu', 270, 'stock/stock_transfer/destroy', 'stock.stock_transfer/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (277, 'menu', 270, 'stock/stock_transfer/restore', 'stock.stock_transfer/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (278, 'menu', 270, 'stock/stock_transfer/multi', 'stock.stock_transfer/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (279, 'menu', 124, 'pss', '', '销购管理', 'fa fa-retweet', '', '', 1, 1610960614, 1612447663, 88, 'normal');
INSERT INTO `erp_auth_rule` VALUES (280, 'menu', 279, 'pss/company', 'pss.company/index', '客户管理', 'fa fa-address-book', '', '', 1, NULL, 1610960691, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (281, 'menu', 280, 'pss/company/index', 'pss.company/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (282, 'menu', 280, 'pss/company/recyclebin', 'pss.company/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (283, 'menu', 280, 'pss/company/add', 'pss.company/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (284, 'menu', 280, 'pss/company/edit', 'pss.company/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (285, 'menu', 280, 'pss/company/del', 'pss.company/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (286, 'menu', 280, 'pss/company/destroy', 'pss.company/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (287, 'menu', 280, 'pss/company/restore', 'pss.company/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (288, 'menu', 280, 'pss/company/multi', 'pss.company/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (289, 'menu', 279, 'pss/supplier', 'pss.supplier/index', '供应商管理', 'fa fa-home\r', '', '', 1, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (290, 'menu', 289, 'pss/supplier/index', 'pss.supplier/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (291, 'menu', 289, 'pss/supplier/recyclebin', 'pss.supplier/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (292, 'menu', 289, 'pss/supplier/add', 'pss.supplier/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (293, 'menu', 289, 'pss/supplier/edit', 'pss.supplier/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (294, 'menu', 289, 'pss/supplier/del', 'pss.supplier/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (295, 'menu', 289, 'pss/supplier/destroy', 'pss.supplier/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (296, 'menu', 289, 'pss/supplier/restore', 'pss.supplier/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (297, 'menu', 289, 'pss/supplier/multi', 'pss.supplier/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (316, 'menu', 279, 'pss/sell', 'pss.sell/index', '销售管理', 'fa fa-yen', '', '', 1, NULL, 1612447511, 98, 'normal');
INSERT INTO `erp_auth_rule` VALUES (317, 'menu', 316, 'pss/sell/index', 'pss.sell/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (318, 'menu', 316, 'pss/sell/submitverify', 'pss.sell/submitverify', '提交审核', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (319, 'menu', 316, 'pss/sell/confirmverify', 'pss.sell/confirmverify', '确认审核', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (320, 'menu', 316, 'pss/sell/rejectverify', 'pss.sell/rejectverify', '审核驳回', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (321, 'menu', 316, 'pss/sell/againverify', 'pss.sell/againverify', '复审', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (322, 'menu', 316, 'pss/sell/confirmpay', 'pss.sell/confirmpay', '确认支付', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (323, 'menu', 316, 'pss/sell/cancelpay', 'pss.sell/cancelpay', '支付取消', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (324, 'menu', 316, 'pss/sell/confirmput', 'pss.sell/confirmput', '确认入库', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (325, 'menu', 316, 'pss/sell/cancelput', 'pss.sell/cancelput', '取消入库', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (326, 'menu', 316, 'pss/sell/recyclebin', 'pss.sell/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (327, 'menu', 316, 'pss/sell/add', 'pss.sell/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (328, 'menu', 316, 'pss/sell/edit', 'pss.sell/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (329, 'menu', 316, 'pss/sell/del', 'pss.sell/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (330, 'menu', 316, 'pss/sell/destroy', 'pss.sell/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (331, 'menu', 316, 'pss/sell/restore', 'pss.sell/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (332, 'menu', 316, 'pss/sell/multi', 'pss.sell/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (333, 'menu', 279, 'pss/purchase', 'pss.purchase/index', '采购管理', 'fa fa-cart-arrow-down', '', '', 1, NULL, 1612447519, 99, 'normal');
INSERT INTO `erp_auth_rule` VALUES (334, 'menu', 333, 'pss/purchase/index', 'pss.purchase/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (335, 'menu', 333, 'pss/purchase/submitverify', 'pss.purchase/submitverify', '提交审核', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (336, 'menu', 333, 'pss/purchase/confirmverify', 'pss.purchase/confirmverify', '确认审核', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (337, 'menu', 333, 'pss/purchase/rejectverify', 'pss.purchase/rejectverify', '审核驳回', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (338, 'menu', 333, 'pss/purchase/againverify', 'pss.purchase/againverify', '复审', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (339, 'menu', 333, 'pss/purchase/confirmpay', 'pss.purchase/confirmpay', '确认支付', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (340, 'menu', 333, 'pss/purchase/cancelpay', 'pss.purchase/cancelpay', '支付取消', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (341, 'menu', 333, 'pss/purchase/confirmput', 'pss.purchase/confirmput', '确认入库', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (342, 'menu', 333, 'pss/purchase/cancelput', 'pss.purchase/cancelput', '取消入库', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (343, 'menu', 333, 'pss/purchase/recyclebin', 'pss.purchase/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (344, 'menu', 333, 'pss/purchase/add', 'pss.purchase/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (345, 'menu', 333, 'pss/purchase/edit', 'pss.purchase/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (346, 'menu', 333, 'pss/purchase/del', 'pss.purchase/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (347, 'menu', 333, 'pss/purchase/destroy', 'pss.purchase/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (348, 'menu', 333, 'pss/purchase/restore', 'pss.purchase/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (349, 'menu', 333, 'pss/purchase/multi', 'pss.purchase/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (350, 'menu', 245, 'order/order', 'order.order/index', '订单管理', 'fa fa-align-justify', '', '', 1, NULL, 1612447446, 99, 'normal');
INSERT INTO `erp_auth_rule` VALUES (351, 'menu', 350, 'order/order/index', 'order.order/index', '查看', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (352, 'menu', 350, 'order/order/info', 'order.order/info', '详细信息', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (353, 'menu', 350, 'order/order/recyclebin', 'order.order/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (354, 'menu', 350, 'order/order/add', 'order.order/add', '添加', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (355, 'menu', 350, 'order/order/edit', 'order.order/edit', '编辑', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (356, 'menu', 350, 'order/order/del', 'order.order/del', '删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (357, 'menu', 350, 'order/order/destroy', 'order.order/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (358, 'menu', 350, 'order/order/restore', 'order.order/restore', '还原', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');
INSERT INTO `erp_auth_rule` VALUES (359, 'menu', 350, 'order/order/multi', 'order.order/multi', '批量更新', 'fa fa-circle-o', '', '', 0, NULL, NULL, 0, 'normal');

-- ----------------------------
-- Table structure for erp_command
-- ----------------------------
DROP TABLE IF EXISTS `erp_command`;
CREATE TABLE `erp_command`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '命令',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回结果',
  `executetime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行时间',
  `createtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` enum('successed','failured') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线命令表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_command
-- ----------------------------
INSERT INTO `erp_command` VALUES (53, 'menu', '[\"--controller=pss\\/Sell\"]', 'php think menu --controller=pss/Sell', '', 1612446208, 1612446208, 1612446208, 'successed');
INSERT INTO `erp_command` VALUES (54, 'menu', '[\"--controller=pss\\/Purchase\"]', 'php think menu --controller=pss/Purchase', '', 1612446503, 1612446503, 1612446503, 'successed');
INSERT INTO `erp_command` VALUES (55, 'menu', '[\"--controller=order\\/Order\"]', 'php think menu --controller=order/Order', '', 1612446751, 1612446751, 1612446751, 'successed');

-- ----------------------------
-- Table structure for erp_company
-- ----------------------------
DROP TABLE IF EXISTS `erp_company`;
CREATE TABLE `erp_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `phone` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=隐藏,2=显示,3=弃用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_company
-- ----------------------------
INSERT INTO `erp_company` VALUES (4, '奥特小卖部', '13636363366', '奥特100号', 1612448987, 1612448987, NULL, '2', '');

-- ----------------------------
-- Table structure for erp_config
-- ----------------------------
DROP TABLE IF EXISTS `erp_config`;
CREATE TABLE `erp_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_config
-- ----------------------------
INSERT INTO `erp_config` VALUES (2, 'beian', 'basic', 'Beian', '', 'string', '', '', '', '');
INSERT INTO `erp_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `erp_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `erp_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `erp_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `erp_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `erp_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"Email\":\"email\",\"example\":\"Example\" }', '', '', '');
INSERT INTO `erp_config` VALUES (24, 'version', 'basic', '版本号', '', 'string', '1.0.0', '', '', '');
INSERT INTO `erp_config` VALUES (25, 'request_number', 'basic', '访问次数', '', '', '1368', '访问次数', '', '');

-- ----------------------------
-- Table structure for erp_crontab
-- ----------------------------
DROP TABLE IF EXISTS `erp_crontab`;
CREATE TABLE `erp_crontab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '延迟秒数执行',
  `maximums` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大执行次数 0为不限',
  `executes` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已经执行的次数',
  `createtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `begintime` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `endtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `executetime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后执行时间',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_crontab
-- ----------------------------
INSERT INTO `erp_crontab` VALUES (1, 'fun', '执行控制器方法', 'appapicontrollerDemo@test', '* * * * *', 0, 0, 0, 1607494716, 1607494716, 1607494716, 3786883200, 1607494716, 3, 'normal');

-- ----------------------------
-- Table structure for erp_ems
-- ----------------------------
DROP TABLE IF EXISTS `erp_ems`;
CREATE TABLE `erp_ems`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_goods
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods`;
CREATE TABLE `erp_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名',
  `num` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品货号',
  `price` float(10, 2) NULL DEFAULT 0.00 COMMENT '价格',
  `describe` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `weigh` int(11) NULL DEFAULT NULL COMMENT '权重/排序',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=隐藏,2=显示,3=弃用',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `brand_id` int(11) NULL DEFAULT NULL COMMENT '品牌',
  `place_id` int(11) NULL DEFAULT NULL COMMENT '产地',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '类型',
  `unit_id` int(11) NULL DEFAULT NULL COMMENT '单位',
  `quantity` int(11) NULL DEFAULT 0 COMMENT '单位数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '示范表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods
-- ----------------------------
INSERT INTO `erp_goods` VALUES (10, '卤鸡蛋', 'XBL0909123123', 200.00, '', 11, 1612447386, 1612847383, NULL, '2', '/uploads/20210209/8b75ab495e1c331f691082c464c7ee1d.jpg', 6, 6, 4, 6, 1, '');
INSERT INTO `erp_goods` VALUES (11, '泡椒凤爪', 'FZ68686868', 400.00, '', 10, 1612447976, 1612447984, NULL, '2', '', 6, 6, 4, 6, 1, '');

-- ----------------------------
-- Table structure for erp_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_brand`;
CREATE TABLE `erp_goods_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '名称',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '描述',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=隐藏,2=显示,3=弃用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '商品品牌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_brand
-- ----------------------------
INSERT INTO `erp_goods_brand` VALUES (6, '乡巴佬', '', 1612447340, 1612447340, NULL, '2', '');

-- ----------------------------
-- Table structure for erp_goods_place
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_place`;
CREATE TABLE `erp_goods_place`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '产地名称',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '描述',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=隐藏,2=显示,3=弃用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '商品产地' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_place
-- ----------------------------
INSERT INTO `erp_goods_place` VALUES (6, '东莞', '', 1612447309, 1612447309, NULL, '2', '');

-- ----------------------------
-- Table structure for erp_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_type`;
CREATE TABLE `erp_goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分类名称',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '描述',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=隐藏,2=显示,3=弃用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_type
-- ----------------------------
INSERT INTO `erp_goods_type` VALUES (4, '食品', '', 1612447301, 1612447301, NULL, '2', '');

-- ----------------------------
-- Table structure for erp_goods_unit
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_unit`;
CREATE TABLE `erp_goods_unit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '单位名称',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '描述',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=隐藏,2=显示,3=弃用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '商品单位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_unit
-- ----------------------------
INSERT INTO `erp_goods_unit` VALUES (6, '箱', '', 1612447266, 1612447266, NULL, '2', '');
INSERT INTO `erp_goods_unit` VALUES (7, '吨', '', 1612447273, 1612447273, NULL, '2', '');

-- ----------------------------
-- Table structure for erp_migrations
-- ----------------------------
DROP TABLE IF EXISTS `erp_migrations`;
CREATE TABLE `erp_migrations`  (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_migrations
-- ----------------------------
INSERT INTO `erp_migrations` VALUES (120201010163205, 'Admin', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (220201010163205, 'AdminLog', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (320201010163205, 'Attachment', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (420201010163205, 'AuthGroup', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (520201010163205, 'AuthGroupAccess', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (620201010163205, 'AuthRule', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (720201010163205, 'Command', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (820201010163205, 'Config', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (920201010163205, 'Crontab', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (1020201010163205, 'Ems', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (1120201010163205, 'Sms', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (1220201010163205, 'User', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (1320201010163205, 'UserGroup', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (1420201010163205, 'UserMoneyLog', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (1520201010163205, 'UserRule', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (1620201010163205, 'UserScoreLog', '2020-12-09 14:18:35', '2020-12-09 14:18:35', 0);
INSERT INTO `erp_migrations` VALUES (1720201010163205, 'UserToken', '2020-12-09 14:18:35', '2020-12-09 14:18:36', 0);
INSERT INTO `erp_migrations` VALUES (1920201010163205, 'WechatUser', '2020-12-09 14:18:36', '2020-12-09 14:18:36', 0);

-- ----------------------------
-- Table structure for erp_order
-- ----------------------------
DROP TABLE IF EXISTS `erp_order`;
CREATE TABLE `erp_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group` enum('1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组:1=盘点,2=调拨,3=销售,4=采购',
  `type` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型:1=出库,2=入库',
  `number` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_token` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单token',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=未入库,2=已入库,3=已取消',
  `json` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_order
-- ----------------------------
INSERT INTO `erp_order` VALUES (40, '1', '2', 'PD21020422153347572052', 'pd90kD%1Qt17xxK1D5f2263$8CQ3@CDlg6DC70I6FzE7RRfq9]6dJ168ApOA1972j4dNiQZ5F=1081E5IDL37!5F0D87I2EFAs7*x98u7yA243FFM09(2aV8ETd37Pf[', 1612448143, 1612448143, NULL, '2', NULL, NULL);
INSERT INTO `erp_order` VALUES (41, '1', '2', 'PD21020422162587052643', 'pd843DCTPrupBFlnFweFeFe17d4jZg1C1*h9b96Ht8W0cvSBc3xNBEYA11q$Ei0v6jC4ufEBFdt8oAJ86O0BS5cBA60826(Gd073CA7J60i2245yH%CD6C3Bh81El1!m', 1612448192, 1612448192, NULL, '2', NULL, NULL);
INSERT INTO `erp_order` VALUES (42, '2', '1', 'DB21020422270519820654', 'db1cc217cS6fAf05k4J4K45cw42si@5DG=2EqI007M%F5jBCru3c75DybF9[5FB81BE4s904oFD26F2RSH55e30d(9]T9c0eFf8B6BXbd2kCWp40F1ZE75bFf!F5C5F2', 1612448834, 1612448834, NULL, '2', NULL, NULL);
INSERT INTO `erp_order` VALUES (43, '2', '2', 'DB21020422270519820654', 'db1cc217cS6fAf05k4J4K45cw42si@5DG=2EqI007M%F5jBCru3c75DybF9[5FB81BE4s904oFD26F2RSH55e30d(9]T9c0eFf8B6BXbd2kCWp40F1ZE75bFf!F5C5F2', 1612448834, 1612448834, NULL, '2', NULL, NULL);
INSERT INTO `erp_order` VALUES (44, '4', '2', 'CG21020422301589270563', 'cg7a7FC7wBR8FE69ccA2O7E2Cb88sAWE1EB0a5$2jJZ!13D27%3bPB8f4bI65=46f45CjtX6eWA6fFE4A24D33(.xa27c0BH632hL3]C3Y1qfh@Fc7016MSAgf3jp027', 1612449027, 1612449027, NULL, '2', NULL, NULL);
INSERT INTO `erp_order` VALUES (45, '3', '1', 'XS21020422311485693970', 'xsc99D62dE0AdUcC5m3d=.k52%5z]vauBb461a1c98PFH*2G84SF7B2tVAeWc21.iMXb(1dw6D6JA7!35Cj4TA53El41e0bh89D4fK52fD1oDIB7fSFEIc80pn5T9E35', 1612449088, 1612449088, NULL, '2', NULL, NULL);

-- ----------------------------
-- Table structure for erp_purchase
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase`;
CREATE TABLE `erp_purchase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人ID',
  `supplier_id` int(11) NOT NULL DEFAULT 0 COMMENT '供应商id',
  `stock_id` int(11) NULL DEFAULT NULL COMMENT '采购仓库',
  `stock_goods_id` int(11) NULL DEFAULT NULL COMMENT '仓库库存商品id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品信息id',
  `goods_number` int(11) NULL DEFAULT 0 COMMENT '采购商品数量',
  `goods_price` float(10, 2) NULL DEFAULT 0.00 COMMENT '商品采购单价',
  `other_price` float(10, 2) NULL DEFAULT 0.00 COMMENT '其他费用',
  `transport_price` float(10, 2) NULL DEFAULT 0.00 COMMENT '运输费用',
  `amount_price` float(10, 2) NULL DEFAULT 0.00 COMMENT '订单总价',
  `status` enum('1','2','3','4','5','6','7','8','9') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态:1=草稿,2=审核中,3=审核通过,4=审核未通过,5=等待支付,6=支付完成,7=支付取消,8=出库完成,9=出库取消',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `order_token` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单token',
  `code` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '订单编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_purchase
-- ----------------------------
INSERT INTO `erp_purchase` VALUES (23, 1, 5, 9, 27, 10, 1000, 200.00, 0.00, 0.00, 200000.00, '8', 1612449015, 1612449027, NULL, '', 'cg7a7FC7wBR8FE69ccA2O7E2Cb88sAWE1EB0a5$2jJZ!13D27%3bPB8f4bI65=46f45CjtX6eWA6fFE4A24D33(.xa27c0BH632hL3]C3Y1qfh@Fc7016MSAgf3jp027', 'CG21020422301589270563');

-- ----------------------------
-- Table structure for erp_sell
-- ----------------------------
DROP TABLE IF EXISTS `erp_sell`;
CREATE TABLE `erp_sell`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人ID',
  `company_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `stock_id` int(11) NULL DEFAULT NULL COMMENT '销售仓库',
  `stock_goods_id` int(11) NULL DEFAULT NULL COMMENT '仓库库存商品id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品信息id',
  `goods_number` int(11) NULL DEFAULT 0 COMMENT '销售商品数量',
  `goods_price` float(10, 2) NULL DEFAULT 0.00 COMMENT '商品销售单价',
  `other_price` float(10, 2) NULL DEFAULT 0.00 COMMENT '其他费用',
  `transport_price` float(10, 2) NULL DEFAULT 0.00 COMMENT '运输费用',
  `amount_price` float(10, 2) NULL DEFAULT 0.00 COMMENT '订单总价',
  `status` enum('1','2','3','4','5','6','7','8','9') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态:1=草稿,2=审核中,3=审核通过,4=审核未通过,5=等待支付,6=支付完成,7=支付取消,8=出库完成,9=出库取消',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `order_token` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单token',
  `code` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '订单编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_sell
-- ----------------------------
INSERT INTO `erp_sell` VALUES (19, 1, 4, 8, 29, 10, 20, 250.00, 0.00, 0.00, 5000.00, '8', 1612449074, 1612449088, NULL, '', 'xsc99D62dE0AdUcC5m3d=.k52%5z]vauBb461a1c98PFH*2G84SF7B2tVAeWc21.iMXb(1dw6D6JA7!35Cj4TA53El41e0bh89D4fK52fD1oDIB7fSFEIc80pn5T9E35', 'XS21020422311485693970');

-- ----------------------------
-- Table structure for erp_sms
-- ----------------------------
DROP TABLE IF EXISTS `erp_sms`;
CREATE TABLE `erp_sms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_stock
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock`;
CREATE TABLE `erp_stock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '仓库名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '详细地址',
  `weigh` int(11) NULL DEFAULT NULL COMMENT '权重/排序',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=隐藏,2=显示,3=弃用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_stock
-- ----------------------------
INSERT INTO `erp_stock` VALUES (8, '南城仓库', '南城路001', 8, 1612448065, 1612448065, NULL, '2', '');
INSERT INTO `erp_stock` VALUES (9, '凤岗仓库', '凤岗路002', 9, 1612448092, 1612448092, NULL, '2', '');

-- ----------------------------
-- Table structure for erp_stock_check
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_check`;
CREATE TABLE `erp_stock_check`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `stock_id` int(11) NOT NULL COMMENT '仓库ID',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人ID',
  `code` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '订单编号',
  `order_token` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单token',
  `status` enum('1','2','3','4','5','6','7') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态:1=草稿,2=审核中,3=审核通过,4=审核未通过,5=等待出入库,6=入库完成,7=入库取消',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `stock_goods_id` int(11) NULL DEFAULT NULL COMMENT '仓库商品id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `number` int(11) NULL DEFAULT 0 COMMENT '商品数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库盘点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_stock_check
-- ----------------------------
INSERT INTO `erp_stock_check` VALUES (27, 8, 1, 'PD21020422153347572052', 'pd90kD%1Qt17xxK1D5f2263$8CQ3@CDlg6DC70I6FzE7RRfq9]6dJ168ApOA1972j4dNiQZ5F=1081E5IDL37!5F0D87I2EFAs7*x98u7yA243FFM09(2aV8ETd37Pf[', '6', 1612448133, 1612448143, NULL, 29, 10, 200, '测试200箱卤鸡蛋');
INSERT INTO `erp_stock_check` VALUES (28, 9, 1, 'PD21020422162587052643', 'pd843DCTPrupBFlnFweFeFe17d4jZg1C1*h9b96Ht8W0cvSBc3xNBEYA11q$Ei0v6jC4ufEBFdt8oAJ86O0BS5cBA60826(Gd073CA7J60i2245yH%CD6C3Bh81El1!m', '6', 1612448185, 1612448192, NULL, 28, 11, 1000, '凤岗仓库进货凤爪');

-- ----------------------------
-- Table structure for erp_stock_goods
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_goods`;
CREATE TABLE `erp_stock_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `stock_id` int(11) NOT NULL COMMENT '仓库名',
  `goods_id` int(11) NOT NULL COMMENT '商品',
  `number` int(11) NULL DEFAULT 0 COMMENT '商品数量',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_stock_goods
-- ----------------------------
INSERT INTO `erp_stock_goods` VALUES (27, 9, 10, 1000, 1612448099, 1612449027, NULL);
INSERT INTO `erp_stock_goods` VALUES (28, 9, 11, 800, 1612448099, 1612448834, NULL);
INSERT INTO `erp_stock_goods` VALUES (29, 8, 10, 180, 1612448104, 1612449088, NULL);
INSERT INTO `erp_stock_goods` VALUES (30, 8, 11, 200, 1612448104, 1612448834, NULL);

-- ----------------------------
-- Table structure for erp_stock_transfer
-- ----------------------------
DROP TABLE IF EXISTS `erp_stock_transfer`;
CREATE TABLE `erp_stock_transfer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人ID',
  `out_stock_id` int(11) NOT NULL DEFAULT 0 COMMENT '调出仓库ID',
  `get_stock_id` int(11) NOT NULL DEFAULT 0 COMMENT '接收仓库ID',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `stock_goods_id` int(11) NULL DEFAULT NULL COMMENT '仓库商品id',
  `code` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '订单编号',
  `order_token` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单token',
  `status` enum('1','2','3','4','5','6','7') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态:1=草稿,2=审核中,3=审核通过,4=审核未通过,5=等待出入库,6=入库完成,7=入库取消',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `number` int(11) NULL DEFAULT 0 COMMENT '商品数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库调拨表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_stock_transfer
-- ----------------------------
INSERT INTO `erp_stock_transfer` VALUES (19, 1, 9, 8, 11, 28, 'DB21020422270519820654', 'db1cc217cS6fAf05k4J4K45cw42si@5DG=2EqI007M%F5jBCru3c75DybF9[5FB81BE4s904oFD26F2RSH55e30d(9]T9c0eFf8B6BXbd2kCWp40F1ZE75bFf!F5C5F2', '6', 1612448825, 1612448834, NULL, 200, '');
INSERT INTO `erp_stock_transfer` VALUES (20, 2, 8, 9, 10, 29, 'DB21020512023225721003', 'db268F2oE31B1KZB7323lJ56o7282E6IB04e98=z2GWGh4fC3bvEX35$4O457Bu3!93A3ETE0m80@10ef37q6AnntF963F75U77*AxCep6v00A6b]3fLB077ei24U7yB', '1', 1612497752, 1612497752, NULL, 10, '');

-- ----------------------------
-- Table structure for erp_supplier
-- ----------------------------
DROP TABLE IF EXISTS `erp_supplier`;
CREATE TABLE `erp_supplier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `phone` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '状态:1=隐藏,2=显示,3=弃用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_supplier
-- ----------------------------
INSERT INTO `erp_supplier` VALUES (5, '南城批发部', '13131313311', '东莞001', 1612448935, 1612495203, NULL, '2', '');

-- ----------------------------
-- Table structure for erp_user
-- ----------------------------
DROP TABLE IF EXISTS `erp_user`;
CREATE TABLE `erp_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(11) NOT NULL COMMENT '上次登录时间',
  `logintime` int(11) NOT NULL DEFAULT 0 COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(11) NOT NULL COMMENT '加入时间',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_user_group
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_group`;
CREATE TABLE `erp_user_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限节点',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_money_log`;
CREATE TABLE `erp_user_money_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员余额变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_rule`;
CREATE TABLE `erp_user_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(11) NULL DEFAULT NULL COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_score_log`;
CREATE TABLE `erp_user_score_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(11) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(11) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_user_token
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_token`;
CREATE TABLE `erp_user_token`  (
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Token',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(11) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员Token表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
