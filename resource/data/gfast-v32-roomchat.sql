/*
Navicat MySQL Data Transfer

Source Server         : localhsot8.0
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : gfast-v32-roomchat

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2023-12-12 11:36:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule` (
  `ptype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v0` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v2` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v3` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v4` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v5` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES ('p', '1', '27', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '28', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '29', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '30', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '1', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '2', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '3', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '4', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '11', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '10', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '12', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '13', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '14', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '15', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '19', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '20', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '21', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '22', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '23', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '24', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '25', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '26', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_3', '1', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_3', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '31', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '32', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '34', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '35', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '33', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_43', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_44', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_45', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_46', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_47', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_31', '9', '', '', '', '');

-- ----------------------------
-- Table structure for message_content
-- ----------------------------
DROP TABLE IF EXISTS `message_content`;
CREATE TABLE `message_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=407 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message_content
-- ----------------------------

-- ----------------------------
-- Table structure for message_list
-- ----------------------------
DROP TABLE IF EXISTS `message_list`;
CREATE TABLE `message_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from` bigint(20) unsigned DEFAULT '0' COMMENT '来源',
  `mtype` tinyint(3) DEFAULT '0' COMMENT '消息类型: 0 用户消息 1 用户进入 2 用户退出 3 错误消息',
  `ctype` tinyint(3) DEFAULT '0' COMMENT '消息格式: 0 字符串 1 图片',
  `msg_time` datetime DEFAULT NULL COMMENT '消息时间',
  `to` bigint(20) unsigned DEFAULT '0' COMMENT '目标用户',
  `message_content_id` bigint(20) DEFAULT '0' COMMENT '消息ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `room_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '房间号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=540 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message_list
-- ----------------------------

-- ----------------------------
-- Table structure for message_room
-- ----------------------------
DROP TABLE IF EXISTS `message_room`;
CREATE TABLE `message_room` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '房间名称',
  `identify` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '房间唯一标识',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identify_unique` (`identify`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message_room
-- ----------------------------

-- ----------------------------
-- Table structure for message_room_member
-- ----------------------------
DROP TABLE IF EXISTS `message_room_member`;
CREATE TABLE `message_room_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned DEFAULT '0' COMMENT '房间ID',
  `user_id` bigint(20) unsigned DEFAULT '0' COMMENT '成员ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_id,user_id` (`room_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message_room_member
-- ----------------------------

-- ----------------------------
-- Table structure for sys_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_rule`;
CREATE TABLE `sys_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型 0目录 1菜单 2按钮',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `is_hide` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示状态',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_link` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `is_iframe` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否内嵌iframe',
  `is_cached` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否缓存',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由重定向地址',
  `is_affix` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否固定',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='菜单节点表';

-- ----------------------------
-- Records of sys_auth_rule
-- ----------------------------
INSERT INTO `sys_auth_rule` VALUES ('1', '0', 'api/v1/system/auth', '权限管理', 'ele-Stamp', '', '', '0', '30', '0', '/system/auth', 'layout/routerView/parent', '0', '', '0', '0', '1', '0', '0', '', '2022-03-24 15:03:37', '2022-04-14 16:29:19');
INSERT INTO `sys_auth_rule` VALUES ('2', '1', 'api/v1/system/auth/menuList', '菜单管理', 'ele-Calendar', '', '', '1', '0', '0', '/system/auth/menuList', 'system/menu/index', '0', '', '0', '0', '1', '', '0', '', '2022-03-24 17:24:13', '2022-03-29 10:54:49');
INSERT INTO `sys_auth_rule` VALUES ('3', '2', 'api/v1/system/menu/add', '添加菜单', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-03-29 16:48:43', '2022-03-29 17:05:19');
INSERT INTO `sys_auth_rule` VALUES ('4', '2', 'api/v1/system/menu/update', '修改菜单', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-03-29 17:04:25', '2022-03-29 18:11:36');
INSERT INTO `sys_auth_rule` VALUES ('10', '1', 'api/v1/system/role/list', '角色管理', 'iconfont icon-juxingkaobei', '', '', '1', '0', '0', '/system/auth/roleList', 'system/role/index', '0', '', '0', '0', '1', '', '0', '', '2022-03-29 18:15:03', '2022-03-30 10:25:34');
INSERT INTO `sys_auth_rule` VALUES ('11', '2', 'api/v1/system/menu/delete', '删除菜单', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:49:10', '2022-04-06 14:49:17');
INSERT INTO `sys_auth_rule` VALUES ('12', '10', 'api/v1/system/role/add', '添加角色', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:49:46', '2022-04-06 14:49:46');
INSERT INTO `sys_auth_rule` VALUES ('13', '10', '/api/v1/system/role/edit', '修改角色', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:50:08', '2022-04-06 14:50:08');
INSERT INTO `sys_auth_rule` VALUES ('14', '10', '/api/v1/system/role/delete', '删除角色', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:50:22', '2022-04-06 14:50:22');
INSERT INTO `sys_auth_rule` VALUES ('15', '1', 'api/v1/system/dept/list', '部门管理', 'iconfont icon-siweidaotu', '', '', '1', '0', '0', '/system/auth/deptList', 'system/dept/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:52:23', '2022-04-07 22:59:20');
INSERT INTO `sys_auth_rule` VALUES ('16', '17', 'aliyun', '阿里云-iframe', 'iconfont icon-diannao1', '', '', '1', '0', '0', '/demo/outLink/aliyun', 'layout/routerView/iframes', '1', '', '0', '1', '1', '', '0', 'https://www.aliyun.com/daily-act/ecs/activity_selection?spm=5176.8789780.J_3965641470.5.568845b58KHj51', '2022-04-06 17:26:29', '2022-04-07 15:27:17');
INSERT INTO `sys_auth_rule` VALUES ('17', '0', 'outLink', '外链测试', 'iconfont icon-zhongduancanshu', '', '', '0', '20', '0', '/demo/outLink', 'layout/routerView/parent', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 15:20:51', '2022-04-14 16:29:07');
INSERT INTO `sys_auth_rule` VALUES ('18', '17', 'tenyun', '腾讯云-外链', 'iconfont icon-shouye_dongtaihui', '', '', '1', '0', '0', '/demo/outLink/tenyun', 'layout/routerView/link', '1', '', '0', '0', '1', '', '0', 'https://cloud.tencent.com/act/new?cps_key=20b1c3842f74986b2894e2c5fcde7ea2&fromSource=gwzcw.3775555.3775555.3775555&utm_id=gwzcw.3775555.3775555.3775555&utm_medium=cpc', '2022-04-07 15:23:52', '2022-04-07 15:27:25');
INSERT INTO `sys_auth_rule` VALUES ('19', '15', 'api/v1/system/dept/add', '添加部门', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:56:39', '2022-04-07 22:56:39');
INSERT INTO `sys_auth_rule` VALUES ('20', '15', 'api/v1/system/dept/edit', '修改部门', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:57:00', '2022-04-07 22:57:00');
INSERT INTO `sys_auth_rule` VALUES ('21', '15', 'api/v1/system/dept/delete', '删除部门', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:57:30', '2022-04-07 22:57:30');
INSERT INTO `sys_auth_rule` VALUES ('22', '1', 'api/v1/system/post/list', '岗位管理', 'iconfont icon-neiqianshujuchucun', '', '', '1', '0', '0', '/system/auth/postList', 'system/post/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:58:46', '2022-04-09 14:26:15');
INSERT INTO `sys_auth_rule` VALUES ('23', '22', 'api/v1/system/post/add', '添加岗位', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:14:49', '2022-04-09 14:14:49');
INSERT INTO `sys_auth_rule` VALUES ('24', '22', 'api/v1/system/post/edit', '修改岗位', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:15:25', '2022-04-09 14:15:25');
INSERT INTO `sys_auth_rule` VALUES ('25', '22', 'api/v1/system/post/delete', '删除岗位', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:15:47', '2022-04-09 14:15:47');
INSERT INTO `sys_auth_rule` VALUES ('26', '1', 'api/v1/system/user/list', '用户管理', 'ele-User', '', '', '1', '0', '0', '/system/auth/user/list', 'system/user/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:19:10', '2022-04-09 14:19:58');
INSERT INTO `sys_auth_rule` VALUES ('27', '0', 'api/v1/system/dict', '系统配置', 'iconfont icon-shuxingtu', '', '', '0', '40', '0', '/system/dict', 'layout/routerView/parent', '0', '', '0', '0', '1', '654', '0', '', '2022-04-14 16:28:51', '2022-04-18 14:40:56');
INSERT INTO `sys_auth_rule` VALUES ('28', '27', 'api/v1/system/dict/type/list', '字典管理', 'iconfont icon-crew_feature', '', '', '1', '0', '0', '/system/dict/type/list', 'system/dict/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-14 16:32:10', '2022-04-16 17:02:50');
INSERT INTO `sys_auth_rule` VALUES ('29', '27', 'api/v1/system/dict/dataList', '字典数据管理', 'iconfont icon-putong', '', '', '1', '0', '1', '/system/dict/data/list/:dictType', 'system/dict/dataList', '0', '', '0', '0', '1', '', '0', '', '2022-04-18 12:04:17', '2022-04-18 14:58:43');
INSERT INTO `sys_auth_rule` VALUES ('30', '27', 'api/v1/system/config/list', '参数管理', 'ele-Cherry', '', '', '1', '0', '0', '/system/config/list', 'system/config/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-18 21:05:20', '2022-04-18 21:13:19');
INSERT INTO `sys_auth_rule` VALUES ('31', '0', 'api/v1/system/monitor', '系统监控', 'iconfont icon-xuanzeqi', '', '', '0', '30', '0', '/system/monitor', 'layout/routerView/parent', '0', '', '0', '0', '1', '', '0', '', '2022-04-19 10:40:19', '2022-04-19 10:44:38');
INSERT INTO `sys_auth_rule` VALUES ('32', '31', 'api/v1/system/monitor/server', '服务监控', 'iconfont icon-shuju', '', '', '1', '0', '0', '/system/monitor/server', 'system/monitor/server/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-19 10:43:32', '2022-04-19 10:44:47');
INSERT INTO `sys_auth_rule` VALUES ('33', '35', 'api/swagger', 'api文档', 'iconfont icon--chaifenlie', '', '', '1', '0', '0', '/system/swagger', 'layout/routerView/iframes', '1', '', '0', '1', '1', '', '0', 'http://localhost:8808/swagger', '2022-04-21 09:23:43', '2022-11-29 17:10:35');
INSERT INTO `sys_auth_rule` VALUES ('34', '31', 'api/v1/system/loginLog/list', '登录日志', 'ele-Finished', '', '', '1', '0', '0', '/system/monitor/loginLog', 'system/monitor/loginLog/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-28 09:59:47', '2022-04-28 09:59:47');
INSERT INTO `sys_auth_rule` VALUES ('35', '0', 'api/v1/system/tools', '系统工具', 'iconfont icon-zujian', '', '', '0', '25', '0', '/system/tools', 'layout/routerView/parent', '0', '', '0', '0', '1', '', '0', '', '2022-10-26 09:29:08', '2022-10-26 10:11:25');
INSERT INTO `sys_auth_rule` VALUES ('38', '31', 'api/v1/system/operLog/list', '操作日志', 'iconfont icon-bolangnengshiyanchang', '', '', '1', '0', '0', '/system/monitor/operLog', 'system/monitor/operLog/index', '0', '', '0', '0', '1', '', '0', '', '2022-12-23 16:19:05', '2022-12-23 16:21:50');
INSERT INTO `sys_auth_rule` VALUES ('39', '31', 'api/v1/system/online/list', '在线用户', 'iconfont icon-skin', '', '', '1', '0', '0', '/system/monitor/userOnlie', 'system/monitor/userOnline/index', '0', '', '0', '0', '1', '', '0', '', '2023-01-11 15:48:06', '2023-01-11 17:02:39');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) DEFAULT '0' COMMENT '系统内置（Y是 N否）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE KEY `uni_config_key` (`config_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '文件上传-文件大小', 'sys.uploadFile.fileSize', '50M', '1', '31', '31', '文件上传大小限制', null, '2021-07-06 14:57:35');
INSERT INTO `sys_config` VALUES ('2', '文件上传-文件类型', 'sys.uploadFile.fileType', 'doc,docx,zip,xls,xlsx,rar,jpg,jpeg,gif,npm,png,mp4', '1', '31', '31', '文件上传后缀类型限制', null, '2022-12-16 09:52:45');
INSERT INTO `sys_config` VALUES ('3', '图片上传-图片类型', 'sys.uploadFile.imageType', 'jpg,jpeg,gif,npm,png', '1', '31', '0', '图片上传后缀类型限制', null, null);
INSERT INTO `sys_config` VALUES ('4', '图片上传-图片大小', 'sys.uploadFile.imageSize', '50M', '1', '31', '31', '图片上传大小限制', null, null);
INSERT INTO `sys_config` VALUES ('11', '静态资源', 'static.resource', '/', '1', '2', '0', '', null, null);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `created_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '奇讯科技', '0', null, '15888888888', 'ry@qq.com', '1', '0', '31', '2021-07-13 15:56:52', '2021-07-13 15:57:05', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', null, '15888888888', 'ry@qq.com', '1', '0', '31', '2021-07-13 15:56:52', '2021-11-04 09:16:38', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('200', '100', '', '大数据', '1', '', '18888888888', 'liou@qq.com', '0', '0', '31', '2021-07-13 15:56:52', '2022-09-16 16:46:57', null);
INSERT INTO `sys_dept` VALUES ('201', '100', '', '开发', '1', null, '18888888888', 'li@qq.com', '0', '31', null, '2021-07-13 15:56:52', '2022-04-07 22:35:21', null);
INSERT INTO `sys_dept` VALUES ('202', '108', '', '外勤', '1', null, '18888888888', 'aa@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('203', '108', '', '行政', '0', '', '18888888888', 'aa@qq.com', '1', '0', '31', '2021-07-13 15:56:52', '2022-09-16 16:46:47', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认（1是 0否）',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` bigint(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '0', '男', '1', 'sys_user_sex', '', '', '0', '1', '31', '2', '备注信息', '2022-04-18 16:46:22', null);
INSERT INTO `sys_dict_data` VALUES ('2', '0', '女', '2', 'sys_user_sex', '', '', '0', '1', '31', '31', '备注信息', null, null);
INSERT INTO `sys_dict_data` VALUES ('3', '0', '保密', '0', 'sys_user_sex', '', '', '1', '1', '31', '31', '备注信息', null, null);
INSERT INTO `sys_dict_data` VALUES ('24', '0', '频道页', '1', 'cms_category_type', '', '', '0', '1', '31', '31', '作为频道页，不可作为栏目发布文章，可添加下级分类', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('25', '0', '发布栏目', '2', 'cms_category_type', '', '', '0', '1', '31', '31', '作为发布栏目，可添加文章', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('26', '0', '跳转栏目', '3', 'cms_category_type', '', '', '0', '1', '31', '31', '不直接发布内容，用于跳转页面', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('27', '0', '单页栏目', '4', 'cms_category_type', '', '', '0', '1', '31', '31', '单页面模式，分类直接显示为文章', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('28', '0', '正常', '0', 'sys_job_status', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('29', '0', '暂停', '1', 'sys_job_status', '', 'default', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('30', '0', '默认', 'DEFAULT', 'sys_job_group', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('31', '0', '系统', 'SYSTEM', 'sys_job_group', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('32', '0', '成功', '1', 'admin_login_status', '', 'default', '0', '1', '31', '31', '', null, '2022-09-16 15:26:01');
INSERT INTO `sys_dict_data` VALUES ('33', '0', '失败', '0', 'admin_login_status', '', 'default', '0', '1', '31', '0', '', null, '2022-09-16 15:26:01');
INSERT INTO `sys_dict_data` VALUES ('34', '0', '成功', '1', 'sys_oper_log_status', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('35', '0', '失败', '0', 'sys_oper_log_status', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('36', '0', '重复执行', '1', 'sys_job_policy', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('37', '0', '执行一次', '2', 'sys_job_policy', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('38', '0', '显示', '0', 'sys_show_hide', null, 'default', '1', '1', '31', '0', null, null, null);
INSERT INTO `sys_dict_data` VALUES ('39', '0', '隐藏', '1', 'sys_show_hide', null, 'default', '0', '1', '31', '0', null, null, null);
INSERT INTO `sys_dict_data` VALUES ('40', '0', '正常', '1', 'sys_normal_disable', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('41', '0', '停用', '0', 'sys_normal_disable', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('49', '0', '是', '1', 'sys_yes_no', '', '', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('50', '0', '否', '0', 'sys_yes_no', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('51', '0', '已发布', '1', 'cms_article_pub_type', '', '', '1', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('54', '0', '未发布', '0', 'cms_article_pub_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('55', '0', '置顶', '1', 'cms_article_attr', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('56', '0', '推荐', '2', 'cms_article_attr', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('57', '0', '普通文章', '0', 'cms_article_type', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('58', '0', '跳转链接', '1', 'cms_article_type', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('59', '0', 'cms模型', '6', 'cms_cate_models', '', '', '0', '1', '1', '1', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('61', '0', '政府工作目标', '1', 'gov_cate_models', '', '', '0', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('62', '0', '系统后台', 'sys_admin', 'menu_module_type', '', '', '1', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('63', '0', '政务工作', 'gov_work', 'menu_module_type', '', '', '0', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('64', '0', '幻灯', '3', 'cms_article_attr', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('65', '0', '[work]测试业务表', 'wf_news', 'flow_type', '', '', '0', '1', '2', '2', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('66', '0', '回退修改', '-1', 'flow_status', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('67', '0', '保存中', '0', 'flow_status', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('68', '0', '流程中', '1', 'flow_status', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('69', '0', '审批通过', '2', 'flow_status', '', '', '0', '1', '31', '2', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('70', '2', '发布栏目', '2', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('71', '3', '跳转栏目', '3', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('72', '4', '单页栏目', '4', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('73', '2', '置顶', '1', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('74', '3', '幻灯', '2', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('75', '4', '推荐', '3', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('76', '1', '一般', '0', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('77', '1', '频道页', '1', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('78', '0', '普通', '0', 'flow_level', '', '', '0', '1', '31', '0', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES ('79', '0', '加急', '1', 'flow_level', '', '', '0', '1', '31', '0', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES ('80', '0', '紧急', '2', 'flow_level', '', '', '0', '1', '31', '0', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES ('81', '0', '特急', '3', 'flow_level', '', '', '0', '1', '31', '31', '', null, '2021-07-20 08:55:25');
INSERT INTO `sys_dict_data` VALUES ('82', '0', '频道页', '1', 'sys_blog_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('83', '0', '发布栏目', '2', 'sys_blog_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('84', '0', '跳转栏目', '3', 'sys_blog_type', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('85', '0', '单页栏目', '4', 'sys_blog_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('87', '0', '[cms]文章表', 'cms_news', 'flow_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('91', '0', '测试一下', '666', 'cms_article_type', '', '', '0', '1', '31', '0', '', '2021-08-03 17:04:12', '2021-08-03 17:04:12');
INSERT INTO `sys_dict_data` VALUES ('92', '0', '缓存测试222', '33333', 'cms_article_type', '', '', '0', '1', '31', '31', '', '2021-08-03 17:16:45', '2021-08-03 17:19:41');
INSERT INTO `sys_dict_data` VALUES ('93', '0', '缓存测试222', '11111', 'cms_article_type', '', '', '0', '1', '31', '31', '', '2021-08-03 17:26:14', '2021-08-03 17:26:26');
INSERT INTO `sys_dict_data` VALUES ('94', '0', '1折', '10', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 11:59:38', '2021-08-14 11:59:38');
INSERT INTO `sys_dict_data` VALUES ('95', '0', '5折', '50', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 11:59:49', '2021-08-14 11:59:49');
INSERT INTO `sys_dict_data` VALUES ('96', '0', '8折', '80', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 12:00:00', '2021-08-14 12:00:00');
INSERT INTO `sys_dict_data` VALUES ('97', '0', '9折', '90', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 12:00:07', '2021-08-14 12:00:07');
INSERT INTO `sys_dict_data` VALUES ('98', '0', '无折扣', '100', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 12:00:16', '2021-08-14 12:00:16');
INSERT INTO `sys_dict_data` VALUES ('99', '0', '不显示', 'none', 'cms_nav_position', '', '', '1', '1', '22', '0', '', '2021-08-31 15:37:35', '2021-08-31 15:37:35');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '顶部导航', 'top', 'cms_nav_position', '', '', '0', '1', '22', '0', '', '2021-08-31 15:37:57', '2021-08-31 15:37:57');
INSERT INTO `sys_dict_data` VALUES ('101', '0', '底部导航', 'bottom', 'cms_nav_position', '', '', '0', '1', '22', '0', '', '2021-08-31 15:38:08', '2021-08-31 15:38:08');
INSERT INTO `sys_dict_data` VALUES ('102', '0', '读取', 'GET', 'sys_oper_log_type', '', '', '0', '1', '31', '31', '', '2022-12-21 11:59:10', '2022-12-23 19:03:02');
INSERT INTO `sys_dict_data` VALUES ('103', '0', '新增', 'POST', 'sys_oper_log_type', '', '', '0', '1', '31', '31', '', '2022-12-21 11:59:22', '2022-12-23 19:03:10');
INSERT INTO `sys_dict_data` VALUES ('104', '0', '修改', 'PUT', 'sys_oper_log_type', '', '', '0', '1', '31', '31', '', '2022-12-21 11:59:32', '2022-12-23 19:03:19');
INSERT INTO `sys_dict_data` VALUES ('105', '0', '删除', 'DELETE', 'sys_oper_log_type', '', '', '0', '1', '31', '31', '', '2022-12-21 11:59:44', '2022-12-23 19:03:27');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '1', '31', '1', '用于选择用户性别', null, null);
INSERT INTO `sys_dict_type` VALUES ('2', '分类类型', 'cms_category_type', '1', '31', '3', '文章分类类型', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_type` VALUES ('3', '任务状态', 'sys_job_status', '1', '31', '31', '任务状态列表', null, null);
INSERT INTO `sys_dict_type` VALUES ('13', '任务分组', 'sys_job_group', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('14', '管理员登录状态', 'admin_login_status', '1', '31', '31', '', null, '2022-09-16 15:26:01');
INSERT INTO `sys_dict_type` VALUES ('15', '操作日志状态', 'sys_oper_log_status', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('16', '任务策略', 'sys_job_policy', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('17', '菜单状态', 'sys_show_hide', '1', '31', '0', '菜单状态', null, null);
INSERT INTO `sys_dict_type` VALUES ('18', '系统开关', 'sys_normal_disable', '1', '31', '31', '系统开关', null, null);
INSERT INTO `sys_dict_type` VALUES ('24', '系统内置', 'sys_yes_no', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('25', '文章发布状态', 'cms_article_pub_type', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('26', '文章附加状态', 'cms_article_attr', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('27', '文章类型', 'cms_article_type', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('28', '文章栏目模型分类', 'cms_cate_models', '1', '1', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('29', '政务工作模型分类', 'gov_cate_models', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('30', '菜单模块类型', 'menu_module_type', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('31', '工作流程类型', 'flow_type', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('32', '工作流程审批状态', 'flow_status', '1', '31', '0', '工作流程审批状态', null, null);
INSERT INTO `sys_dict_type` VALUES ('33', '博客分类类型', 'sys_blog_type', '1', '31', '31', '博客分类中的标志', null, null);
INSERT INTO `sys_dict_type` VALUES ('34', '博客日志标志', 'sys_log_sign', '1', '31', '0', '博客日志管理中的标志数据字典', null, null);
INSERT INTO `sys_dict_type` VALUES ('35', '工作流紧急状态', 'flow_level', '1', '31', '31', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_type` VALUES ('48', '插件商城折扣', 'plugin_store_discount', '1', '31', '0', '', '2021-08-14 11:59:26', '2021-08-14 11:59:26');
INSERT INTO `sys_dict_type` VALUES ('49', 'CMS栏目导航位置', 'cms_nav_position', '1', '22', '0', '', '2021-08-31 15:37:04', '2021-08-31 15:37:04');
INSERT INTO `sys_dict_type` VALUES ('50', '操作日志类型', 'sys_oper_log_type', '1', '31', '0', '', '2022-12-21 11:55:02', '2022-12-21 11:55:02');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` tinyint(4) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `module` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('2', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 11:52:52', '系统后台');
INSERT INTO `sys_login_log` VALUES ('3', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 15:29:54', '系统后台');
INSERT INTO `sys_login_log` VALUES ('4', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 15:53:02', '系统后台');
INSERT INTO `sys_login_log` VALUES ('5', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 15:53:26', '系统后台');
INSERT INTO `sys_login_log` VALUES ('6', '10001', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '1', '登录成功', '2023-12-11 16:02:37', '系统后台');
INSERT INTO `sys_login_log` VALUES ('7', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 17:53:32', '系统后台');
INSERT INTO `sys_login_log` VALUES ('8', '10001', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '1', '登录成功', '2023-12-11 18:03:41', '系统后台');
INSERT INTO `sys_login_log` VALUES ('9', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 18:04:07', '系统后台');
INSERT INTO `sys_login_log` VALUES ('10', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-12 08:38:18', '系统后台');
INSERT INTO `sys_login_log` VALUES ('11', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-12 08:56:28', '系统后台');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('61', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 15:56:35');
INSERT INTO `sys_oper_log` VALUES ('62', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 15:56:35');
INSERT INTO `sys_oper_log` VALUES ('63', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:56:35');
INSERT INTO `sys_oper_log` VALUES ('64', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 15:56:35');
INSERT INTO `sys_oper_log` VALUES ('65', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000001\",\"nickName\":\"10001\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10001\"}', '', '2023-12-11 15:57:23');
INSERT INTO `sys_oper_log` VALUES ('66', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:57:23');
INSERT INTO `sys_oper_log` VALUES ('67', '角色管理', '0', '/api/v1/system/role/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/list?roleName=&roleStatus=&pageNum=1&pageSize=10', '::1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\",\"roleName\":\"\",\"roleStatus\":\"\"}', '', '2023-12-11 15:58:23');
INSERT INTO `sys_oper_log` VALUES ('68', '', '0', '/api/v1/system/role/getParams', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/getParams', '::1', '内网IP', '{}', '', '2023-12-11 15:58:29');
INSERT INTO `sys_oper_log` VALUES ('69', '添加角色', '0', '/api/v1/system/role/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/role/add', '::1', '内网IP', '{\"id\":0,\"listOrder\":0,\"menuIds\":[],\"name\":\"聊天演示\",\"remark\":\"聊天演示\",\"status\":1}', '', '2023-12-11 15:59:11');
INSERT INTO `sys_oper_log` VALUES ('70', '角色管理', '0', '/api/v1/system/role/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/list?roleName=&roleStatus=&pageNum=1&pageSize=10', '::1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\",\"roleName\":\"\",\"roleStatus\":\"\"}', '', '2023-12-11 15:59:11');
INSERT INTO `sys_oper_log` VALUES ('71', '', '0', '/api/v1/system/user/getUserMenus', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getUserMenus', '::1', '内网IP', '{}', '', '2023-12-11 15:59:11');
INSERT INTO `sys_oper_log` VALUES ('72', '', '0', '/api/v1/system/role/getParams', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/getParams', '::1', '内网IP', '{}', '', '2023-12-11 15:59:14');
INSERT INTO `sys_oper_log` VALUES ('73', '', '0', '/api/v1/system/role/get', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/get?id=9', '::1', '内网IP', '{\"id\":\"9\"}', '', '2023-12-11 15:59:14');
INSERT INTO `sys_oper_log` VALUES ('74', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 15:59:37');
INSERT INTO `sys_oper_log` VALUES ('75', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 15:59:37');
INSERT INTO `sys_oper_log` VALUES ('76', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 15:59:37');
INSERT INTO `sys_oper_log` VALUES ('77', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:59:37');
INSERT INTO `sys_oper_log` VALUES ('78', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=43', '::1', '内网IP', '{\"id\":\"43\"}', '', '2023-12-11 15:59:39');
INSERT INTO `sys_oper_log` VALUES ('79', '', '0', '/api/v1/system/user/edit', 'PUT', '1', 'admin', '深圳总公司', '/api/v1/system/user/edit', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000001\",\"nickName\":\"10001\",\"password\":\"-\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"0\",\"status\":1,\"userId\":43,\"userName\":\"10001\"}', '', '2023-12-11 15:59:43');
INSERT INTO `sys_oper_log` VALUES ('80', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:59:43');
INSERT INTO `sys_oper_log` VALUES ('81', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 15:59:59');
INSERT INTO `sys_oper_log` VALUES ('82', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 15:59:59');
INSERT INTO `sys_oper_log` VALUES ('83', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 15:59:59');
INSERT INTO `sys_oper_log` VALUES ('84', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:59:59');
INSERT INTO `sys_oper_log` VALUES ('85', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:06:45');
INSERT INTO `sys_oper_log` VALUES ('86', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:06:45');
INSERT INTO `sys_oper_log` VALUES ('87', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:06:45');
INSERT INTO `sys_oper_log` VALUES ('88', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:06:46');
INSERT INTO `sys_oper_log` VALUES ('89', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:10:24');
INSERT INTO `sys_oper_log` VALUES ('90', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:10:24');
INSERT INTO `sys_oper_log` VALUES ('91', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:10:24');
INSERT INTO `sys_oper_log` VALUES ('92', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:10:24');
INSERT INTO `sys_oper_log` VALUES ('93', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:14:52');
INSERT INTO `sys_oper_log` VALUES ('94', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:14:52');
INSERT INTO `sys_oper_log` VALUES ('95', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:14:52');
INSERT INTO `sys_oper_log` VALUES ('96', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:14:52');
INSERT INTO `sys_oper_log` VALUES ('97', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000002\",\"nickName\":\"10002\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10002\"}', '', '2023-12-11 16:31:53');
INSERT INTO `sys_oper_log` VALUES ('98', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:31:53');
INSERT INTO `sys_oper_log` VALUES ('99', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000003\",\"nickName\":\"10003\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10003\"}', '', '2023-12-11 16:32:23');
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:32:23');
INSERT INTO `sys_oper_log` VALUES ('101', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000004\",\"nickName\":\"10004\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10004\"}', '', '2023-12-11 16:32:49');
INSERT INTO `sys_oper_log` VALUES ('102', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:32:49');
INSERT INTO `sys_oper_log` VALUES ('103', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000005\",\"nickName\":\"10005\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10005\"}', '', '2023-12-11 16:33:36');
INSERT INTO `sys_oper_log` VALUES ('104', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:33:36');
INSERT INTO `sys_oper_log` VALUES ('105', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:40:13');
INSERT INTO `sys_oper_log` VALUES ('106', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:40:13');
INSERT INTO `sys_oper_log` VALUES ('107', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:40:13');
INSERT INTO `sys_oper_log` VALUES ('108', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:40:13');
INSERT INTO `sys_oper_log` VALUES ('109', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:47:01');
INSERT INTO `sys_oper_log` VALUES ('110', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:47:01');
INSERT INTO `sys_oper_log` VALUES ('111', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:47:01');
INSERT INTO `sys_oper_log` VALUES ('112', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:47:01');
INSERT INTO `sys_oper_log` VALUES ('113', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:47:09');
INSERT INTO `sys_oper_log` VALUES ('114', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:47:09');
INSERT INTO `sys_oper_log` VALUES ('115', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:47:09');
INSERT INTO `sys_oper_log` VALUES ('116', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:47:09');
INSERT INTO `sys_oper_log` VALUES ('117', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:54:37');
INSERT INTO `sys_oper_log` VALUES ('118', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:54:37');
INSERT INTO `sys_oper_log` VALUES ('119', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:54:37');
INSERT INTO `sys_oper_log` VALUES ('120', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:54:37');
INSERT INTO `sys_oper_log` VALUES ('121', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 17:52:50');
INSERT INTO `sys_oper_log` VALUES ('122', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 17:52:50');
INSERT INTO `sys_oper_log` VALUES ('123', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 17:52:50');
INSERT INTO `sys_oper_log` VALUES ('124', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 17:52:50');
INSERT INTO `sys_oper_log` VALUES ('125', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 17:58:13');
INSERT INTO `sys_oper_log` VALUES ('126', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 17:58:13');
INSERT INTO `sys_oper_log` VALUES ('127', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 17:58:13');
INSERT INTO `sys_oper_log` VALUES ('128', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 17:58:13');
INSERT INTO `sys_oper_log` VALUES ('129', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 18:00:01');
INSERT INTO `sys_oper_log` VALUES ('130', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 18:00:01');
INSERT INTO `sys_oper_log` VALUES ('131', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 18:00:01');
INSERT INTO `sys_oper_log` VALUES ('132', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 18:00:01');
INSERT INTO `sys_oper_log` VALUES ('133', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 18:04:55');
INSERT INTO `sys_oper_log` VALUES ('134', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 18:04:55');
INSERT INTO `sys_oper_log` VALUES ('135', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 18:04:55');
INSERT INTO `sys_oper_log` VALUES ('136', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 18:04:55');
INSERT INTO `sys_oper_log` VALUES ('137', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-12 10:13:19');
INSERT INTO `sys_oper_log` VALUES ('138', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-12 10:13:19');
INSERT INTO `sys_oper_log` VALUES ('139', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-12 10:13:19');
INSERT INTO `sys_oper_log` VALUES ('140', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-12 10:13:19');
INSERT INTO `sys_oper_log` VALUES ('141', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2023-12-12 10:13:22');
INSERT INTO `sys_oper_log` VALUES ('142', '', '0', '/api/v1/system/user/edit', 'PUT', '1', 'admin', '深圳总公司', '/api/v1/system/user/edit', '::1', '内网IP', '{\"deptId\":109,\"email\":\"123@qq.com\",\"isAdmin\":1,\"mobile\":\"15334455789\",\"nickName\":\"演示账号\",\"password\":\"-\",\"postIds\":[2],\"remark\":\"3\",\"roleIds\":[9],\"sex\":\"2\",\"status\":1,\"userId\":31,\"userName\":\"demo\"}', '', '2023-12-12 10:13:26');
INSERT INTO `sys_oper_log` VALUES ('143', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-12 10:13:26');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '1', '', '0', '0', '2021-07-11 11:32:58', null, null);
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '1', '', '0', '0', '2021-07-12 11:01:26', null, null);
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '1', '', '0', '31', '2021-07-12 11:01:30', '2022-09-16 16:48:18', null);
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', '普通员工', '0', '31', '2021-07-12 11:01:33', '2022-04-08 15:32:23', null);
INSERT INTO `sys_post` VALUES ('5', 'it', 'IT部', '5', '1', '信息部', '31', '31', '2021-07-12 11:09:42', '2022-04-09 12:59:12', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `list_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '0', '超级管理员', '备注', '3', '2022-04-01 11:38:39', '2022-04-28 10:00:15');
INSERT INTO `sys_role` VALUES ('2', '1', '0', '普通管理员', '备注', '3', '2022-04-01 11:38:39', '2022-04-28 10:01:34');
INSERT INTO `sys_role` VALUES ('3', '1', '0', '站点管理员', '站点管理人员', '3', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('4', '1', '0', '初级管理员', '初级管理员', '3', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('5', '1', '0', '高级管理员', '高级管理员', '2', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('8', '1', '0', '区级管理员', '', '2', '2022-04-01 11:38:39', '2022-04-06 09:53:40');
INSERT INTO `sys_role` VALUES ('9', '1', '0', '聊天演示', '聊天演示', '3', '2023-12-11 15:59:11', '2023-12-11 15:59:11');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('5', '103');
INSERT INTO `sys_role_dept` VALUES ('5', '104');
INSERT INTO `sys_role_dept` VALUES ('5', '105');
INSERT INTO `sys_role_dept` VALUES ('8', '105');
INSERT INTO `sys_role_dept` VALUES ('8', '106');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密盐',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `dept_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否后台管理员 1 是  0   否',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT ' 描述信息',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_login` (`user_name`,`deleted_at`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`,`deleted_at`) USING BTREE,
  KEY `user_nickname` (`user_nickname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '13578342363', '超级管理员', '0', 'c567ae329f9929b518759d3bea13f492', 'f9aZTAa8yz', '1', 'yxh669@qq.com', '1', 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-07-19/ccwpeuqz1i2s769hua.jpeg', '101', '', '1', 'asdasfdsaf大发放打发士大夫发按时', '描述信息', '::1', '2023-12-12 08:38:18', '2021-06-22 17:58:00', '2022-11-03 15:44:38', null);
INSERT INTO `sys_user` VALUES ('31', 'demo', '15334455789', '演示账号', '0', '6dd68eea81e0fca319add0bd58c3fdf6', '46PvWe1Sl7', '1', '123@qq.com', '2', 'https://p.qqan.com/up/2020-6/2020061117234279854.jpg', '109', '3', '1', '云南省曲靖市22223', '生活变的再糟糕，也不妨碍我变得更好', '::1', '2023-12-12 08:56:28', '2021-06-22 17:58:00', '2023-12-12 10:13:26', null);
INSERT INTO `sys_user` VALUES ('43', '10001', '18800000001', '张飞', '0', '86c8b432832755a8a1a30b37abd7b350', 'GbDcSwi5pP', '1', '', '0', 'https://p.qqan.com/up/2021-1/20211411391666.jpg', '100', '', '1', '', '', '127.0.0.1', '2023-12-11 18:03:41', '2023-12-11 15:57:22', '2023-12-11 15:59:43', null);
INSERT INTO `sys_user` VALUES ('44', '10002', '18800000002', '赵云', '0', '9bb19a3a6ac101c4b756f6254d75ae52', 'z7ApNfLD7b', '1', '', '0', 'https://p.qqan.com/up/2020-11/20201127157109035.jpg', '100', '', '1', '', '', '', null, '2023-12-11 16:31:52', '2023-12-11 16:31:52', null);
INSERT INTO `sys_user` VALUES ('45', '10003', '18800000003', '关羽', '0', 'b2a9a7a50facd629d661c0fc816bd123', '70CfL5HdbE', '1', '', '0', 'https://p.qqan.com/up/2021-1/2021122135507881.jpg', '100', '', '1', '', '', '', null, '2023-12-11 16:32:23', '2023-12-11 16:32:23', null);
INSERT INTO `sys_user` VALUES ('46', '10004', '18800000004', '曹操', '0', '31d80dd5b6c9c9f5c421f03695331694', '7LFc54F7yz', '1', '', '0', 'https://im.file.raingad.com/avatar/1/654783148796c.png', '100', '', '1', '', '', '', null, '2023-12-11 16:32:49', '2023-12-11 16:32:49', null);
INSERT INTO `sys_user` VALUES ('47', '10005', '18800000005', '孙权', '0', '970373c1046cade51cda5c167c37d1f0', 'bL4TSPf4aS', '1', '', '0', 'https://im.file.raingad.com/avatar/2/656af34e2c199.gif', '100', '', '1', '', '', '', null, '2023-12-11 16:33:36', '2023-12-11 16:33:36', null);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `create_time` datetime DEFAULT NULL COMMENT '登录时间',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `ip` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `explorer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_token` (`token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户在线状态表';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('21', '8efe68bed2804ba03e7e555a5edc43b0', 'epkdiFldUlpTHB1FaL+k85Yny6P4BvdErPPVn0Tv96Chn59/qKQYMyq+jim7OJxodDyuMie8UEw2d8yb31ZrRaO5xA66P6Ypzc79C8de+ks/Mn5Q9G9IxYCB3aTpBkaFEnW2yXv37tru6H402SkJHA==', '2023-12-11 16:02:37', '10001', '127.0.0.1', 'Firefox', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('22', '9b5ffb4d091918a6eb2a4854d6fc41e0', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO3oQ4U2J4GO9GjSn7dcDNHU/fDkF0UuaY/4zxwJggcjvl+hzds7wrjGWzbOeWAPzXoXYmfSpwPn+EilHWmJ1Hp5aUVFZE0FHxYghRa3FjMYwQ==', '2023-12-11 17:53:32', 'demo', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('23', '1bc953f97bfc49bd2c1e8454ee66f930', 'epkdiFldUlpTHB1FaL+k85Yny6P4BvdErPPVn0Tv96Chn59/qKQYMyq+jim7OJxodDyuMie8UEw2d8yb31ZrRe/0Xw3SvMTedhhAkCHzBcNPv91H0nYaga5QClVMAs1U4z6VN2xotH+0dUon/48xDQ==', '2023-12-11 18:03:41', '10001', '127.0.0.1', 'Firefox', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('24', '13eae77b38cfc62bbe0ba153c3554755', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO3oQ4U2J4GO9GjSn7dcDNHU/fDkF0UuaY/4zxwJggcjvmcSp00Y62dkuvj4T2TanokC3hDv+dky6tKZSHbsyHpDj/L8xSVce3zHg9X1ve+jzg==', '2023-12-11 18:04:07', 'demo', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('25', 'e3988e311d2fe6d59f4bc59e526e08d7', '5rrLCPtzPM4tnvlHq+0iav2BDmIrd9QCru7zhgXMkRdI3L4RWTfSEVwwgX3sK5/k7qaR7SDwVipVyygsJk2M2IWEvyy9V1ageJdYj1WWudUzTn9I71pTgc/RlqL1oN+sbucvwJwll+Y4JQZVeOikTg==', '2023-12-12 08:38:18', 'admin', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('26', '097bf7369c3624a8ff302d898297643f', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO3oQ4U2J4GO9GjSn7dcDNHU/fDkF0UuaY/4zxwJggcjvirjAGvS2nnPbRDRQHEingM+YSwJGUUV4+oasS5xIF55W0tZJuS4EdxGyfvdhW9VCw==', '2023-12-12 08:56:28', 'demo', '::1', 'Chrome', 'Windows 10');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '2');
INSERT INTO `sys_user_post` VALUES ('1', '3');
INSERT INTO `sys_user_post` VALUES ('31', '2');
