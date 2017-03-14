/*
Navicat MySQL Data Transfer

Source Server         : xuanji_test
Source Server Version : 50624
Source Host           : 172.19.1.115:3386
Source Database       : sandbox_merak_auth_02

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-09-12 15:18:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(50) NOT NULL COMMENT '用户姓名',
  `pwd_salt` varchar(30) NOT NULL COMMENT '密码盐',
  `pwd_hash` varchar(30) NOT NULL COMMENT '密码哈希',
  `real_name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `status` tinyint(3) unsigned NOT NULL COMMENT '用户状态',
  `device_id` varchar(20) NOT NULL DEFAULT '' COMMENT '林果设备号',
  `email` varchar(50) NOT NULL COMMENT '电子邮箱',
  `phone` varchar(30) NOT NULL DEFAULT '' COMMENT '手机号码',
  `alias` varchar(30) NOT NULL DEFAULT '' COMMENT '别称',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uniq_user_name` (`user_name`),
  KEY `idx_channel_id` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3521393 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for account_role
-- ----------------------------
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE `account_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

-- ----------------------------
-- Table structure for applications
-- ----------------------------
DROP TABLE IF EXISTS `applications`;
CREATE TABLE `applications` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统ID',
  `app_name` varchar(20) NOT NULL COMMENT '系统名字',
  `app_desc` varchar(100) NOT NULL COMMENT '系统描述',
  `right_tree` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限树',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `uniq_app_name` (`app_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='应用系统';

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `ip` varchar(100) NOT NULL COMMENT '用户登录ip地址',
  `caller` tinyint(3) unsigned NOT NULL COMMENT '登录终端类型',
  `site` varchar(50) NOT NULL COMMENT '登录站点',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1688 DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- ----------------------------
-- Table structure for rights
-- ----------------------------
DROP TABLE IF EXISTS `rights`;
CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `right_name` varchar(100) NOT NULL COMMENT '权限名称',
  `right_value` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限值',
  `app_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属APP',
  `del_flag` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `channel_visible` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '其他渠道是否可见（0：不可见，1：可见）',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_app_id` (`app_id`),
  KEY `idx_right_value` (`right_value`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `role_value` int(11) unsigned DEFAULT NULL COMMENT '角色值',
  `app_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '系统ID',
  `data_range` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '数据范围',
  `del_flag` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_app_id` (`app_id`),
  KEY `idx_channel_id` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for role_right
-- ----------------------------
DROP TABLE IF EXISTS `role_right`;
CREATE TABLE `role_right` (
  `right_id` int(11) NOT NULL COMMENT '权限ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`right_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关系表';

-- ----------------------------
-- Table structure for site_configurations
-- ----------------------------
DROP TABLE IF EXISTS `site_configurations`;
CREATE TABLE `site_configurations` (
  `site_id` varchar(100) NOT NULL COMMENT '站点ID',
  `site_name` varchar(100) NOT NULL COMMENT '站点名称',
  `token_key` varchar(200) NOT NULL COMMENT 'token密钥',
  `api_key` varchar(200) NOT NULL COMMENT 'api密钥',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`site_id`),
  KEY `idx_site_name` (`site_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点相关配置表';

-- ----------------------------
-- Table structure for site_errors
-- ----------------------------
DROP TABLE IF EXISTS `site_errors`;
CREATE TABLE `site_errors` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `error` text NOT NULL COMMENT '错误内容',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COMMENT='网站错误记录';

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `sequence_id` int(11) NOT NULL COMMENT '序列ID',
  `sequence_name` varchar(50) NOT NULL COMMENT '序列名称',
  `sequence_value` int(11) NOT NULL COMMENT '序列值',
  PRIMARY KEY (`sequence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序列号';

-- ----------------------------
-- Table structure for tree
-- ----------------------------
DROP TABLE IF EXISTS `tree`;
CREATE TABLE `tree` (
  `tree` int(11) NOT NULL COMMENT '树ID',
  `id` int(11) NOT NULL COMMENT '树节点ID',
  `parent` int(11) unsigned DEFAULT NULL COMMENT '父节点ID',
  `data` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实体ID数据',
  PRIMARY KEY (`tree`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='树结构层级关系表';
