/*
Navicat MySQL Data Transfer

Source Server         : xuanji_test
Source Server Version : 50624
Source Host           : 172.19.1.115:3386
Source Database       : sandbox_merak_03

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-10-19 16:30:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_history
-- ----------------------------
DROP TABLE IF EXISTS `act_history`;
CREATE TABLE `act_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `act_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '行为类型',
  `old_value` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '旧值',
  `old_desc` varchar(100) NOT NULL DEFAULT '' COMMENT '旧值描述',
  `new_value` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新值',
  `new_desc` varchar(100) NOT NULL DEFAULT '' COMMENT '新值描述',
  `operator_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '操作人员类型',
  `created_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`user_id`,`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 COMMENT='行为记录';

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `channel_name` varchar(100) NOT NULL DEFAULT '' COMMENT '渠道名称',
  `channel_status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0=无效；1=有效）',
  `channel_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类型（0：一般通道，1：超级通道）',
  `contact_user` varchar(100) NOT NULL DEFAULT '' COMMENT '联系人',
  `contact_phone` varchar(100) NOT NULL DEFAULT '' COMMENT '联系电话',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='渠道信息';

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `DocumentID` int(11) unsigned NOT NULL COMMENT '文档编号',
  `BizType` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '业务类型',
  `EntityID` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '业务实体ID',
  `TagID` int(11) unsigned DEFAULT '0' COMMENT '文档类别ID',
  `FileID` varchar(40) NOT NULL DEFAULT '' COMMENT '文件ID',
  `Filename` varchar(1024) NOT NULL DEFAULT '' COMMENT '文件名称',
  `Description` varchar(500) DEFAULT NULL COMMENT '文档描述',
  `ExpiryDate` datetime DEFAULT NULL COMMENT '过期时间',
  `IsDelete` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `CreateAt` datetime NOT NULL COMMENT '创建时间',
  `CreateBy` int(11) NOT NULL COMMENT '创建人',
  `DeleteAt` datetime DEFAULT NULL COMMENT '删除时间',
  `DeleteBy` int(11) DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`DocumentID`),
  KEY `idx_fileid` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文档信息表';

-- ----------------------------
-- Table structure for exceptions
-- ----------------------------
DROP TABLE IF EXISTS `exceptions`;
CREATE TABLE `exceptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `message` text COMMENT '消息内容',
  `call_stack` text COMMENT '堆栈信息',
  `request_url` varchar(255) NOT NULL DEFAULT '' COMMENT '请求URL',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `except_type` varchar(100) NOT NULL DEFAULT '' COMMENT '异常类',
  `user_agent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User Agent',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'UserID',
  `http_request_method` varchar(10) NOT NULL DEFAULT '' COMMENT '请求类型',
  `status_code` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '状态码',
  `except_host` varchar(50) NOT NULL DEFAULT '' COMMENT '主机名',
  `remote_address` varchar(40) NOT NULL DEFAULT '' COMMENT '远程地址',
  `server_name` varchar(100) NOT NULL DEFAULT '' COMMENT '服务器名字',
  `server_port` int(11) unsigned NOT NULL DEFAULT '80' COMMENT '端口',
  `cookie` varchar(2000) NOT NULL DEFAULT '' COMMENT 'Cookie',
  `content_type` varchar(200) NOT NULL DEFAULT '' COMMENT 'ContentType',
  `browser_lang` varchar(50) NOT NULL DEFAULT '' COMMENT '浏览器语言',
  `referer` varchar(255) NOT NULL DEFAULT '' COMMENT 'Refer',
  `error_category` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '错误级别',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`except_type`),
  KEY `idx_createat` (`create_at`),
  KEY `idx_errorcategory` (`error_category`)
) ENGINE=InnoDB AUTO_INCREMENT=1261 DEFAULT CHARSET=utf8 COMMENT='异常日志表';

-- ----------------------------
-- Table structure for fixed_invest
-- ----------------------------
DROP TABLE IF EXISTS `fixed_invest`;
CREATE TABLE `fixed_invest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '定投状态,0表示已删除, 1表示开启,默认为0',
  `money` decimal(10,0) NOT NULL COMMENT '每次定投金额',
  `invest_day` int(11) NOT NULL COMMENT '定投日',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid_cid` (`user_id`,`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用于存储用户定投信息的表';

-- ----------------------------
-- Table structure for fixed_invest_record
-- ----------------------------
DROP TABLE IF EXISTS `fixed_invest_record`;
CREATE TABLE `fixed_invest_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '定投状态是否成功',
  `try_times` int(11) NOT NULL DEFAULT '0' COMMENT '定投失败次数',
  `money` decimal(10,0) NOT NULL COMMENT '定投金额',
  `create_time` datetime NOT NULL COMMENT '更新时间',
  `trans_no` varchar(50) NOT NULL DEFAULT '' COMMENT '充值订单号',
  PRIMARY KEY (`id`),
  KEY `idx_uid_cid` (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定投记录表';

-- ----------------------------
-- Table structure for fund_account
-- ----------------------------
DROP TABLE IF EXISTS `fund_account`;
CREATE TABLE `fund_account` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `channel_id` int(11) NOT NULL COMMENT '通道id',
  `bank_code` varchar(20) NOT NULL DEFAULT '' COMMENT '银行编码',
  `bank_card_no` varchar(100) NOT NULL DEFAULT '' COMMENT '卡号',
  `contract_no` varchar(50) NOT NULL DEFAULT '' COMMENT '签约号',
  `system_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '子渠道号码',
  `mobile` varchar(100) NOT NULL DEFAULT '' COMMENT '银行预留手机号',
  `transaction_account_id` varchar(100) NOT NULL DEFAULT '' COMMENT '基金交易账户',
  `province` varchar(30) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(50) NOT NULL DEFAULT '' COMMENT '市',
  `created_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) NOT NULL DEFAULT '0' COMMENT '更新人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基金开户信息';

-- ----------------------------
-- Table structure for help_module
-- ----------------------------
DROP TABLE IF EXISTS `help_module`;
CREATE TABLE `help_module` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  `order_by` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_channelId_title` (`channel_id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='帮助中心-模块';

-- ----------------------------
-- Table structure for help_qa
-- ----------------------------
DROP TABLE IF EXISTS `help_qa`;
CREATE TABLE `help_qa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `module_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `question` varchar(50) NOT NULL DEFAULT '' COMMENT '问',
  `answer` text NOT NULL COMMENT '答',
  `order_by` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `created_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_moduleId_question` (`module_id`,`question`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='帮助中心-QA';

-- ----------------------------
-- Table structure for invitation_code
-- ----------------------------
DROP TABLE IF EXISTS `invitation_code`;
CREATE TABLE `invitation_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_id` int(11) NOT NULL COMMENT '渠道id',
  `owner_id` int(11) NOT NULL COMMENT '邀请码所有人',
  `invi_code` varchar(50) NOT NULL COMMENT '邀请码',
  `invi_type` smallint(6) NOT NULL COMMENT '1一次性，2永久',
  `invi_status` smallint(6) NOT NULL COMMENT '1生成、2导出、3使用',
  `invi_times` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `invi_note` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) NOT NULL COMMENT '更新人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2458 DEFAULT CHARSET=utf8 COMMENT='邀请码';

-- ----------------------------
-- Table structure for market_apply
-- ----------------------------
DROP TABLE IF EXISTS `market_apply`;
CREATE TABLE `market_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_name` varchar(30) NOT NULL DEFAULT '' COMMENT '姓名',
  `apply_phone` varchar(30) NOT NULL DEFAULT '' COMMENT '手机号',
  `city_name` varchar(15) NOT NULL DEFAULT '' COMMENT '所在城市',
  `apply_source` varchar(30) NOT NULL DEFAULT '' COMMENT '来源渠道',
  `created_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) NOT NULL DEFAULT '0' COMMENT '更新人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1237 DEFAULT CHARSET=utf8 COMMENT='灵玑活动-报名';

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `channel_id` int(11) NOT NULL COMMENT '渠道id',
  `account` int(11) NOT NULL COMMENT '账户类型',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '追加金额',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) NOT NULL COMMENT '更新人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid_channelid` (`user_id`,`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COMMENT='充值表';

-- ----------------------------
-- Table structure for recommend_level
-- ----------------------------
DROP TABLE IF EXISTS `recommend_level`;
CREATE TABLE `recommend_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `level_code` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '等级CODE',
  `mark_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '标的类型',
  `bonus_amount` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '奖励金额',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='MGM佣金等级配置表';

-- ----------------------------
-- Table structure for recommend_reward_detail
-- ----------------------------
DROP TABLE IF EXISTS `recommend_reward_detail`;
CREATE TABLE `recommend_reward_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `invite_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '邀请人ID',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `invite_channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '邀请人渠道ID',
  `reward_amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '推荐奖励金额',
  `reward_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '奖励状态：0:无奖励,1:审核期内,2:待奖励,3:已奖励,4:推荐失败',
  `trans_no` varchar(36) NOT NULL DEFAULT '' COMMENT '订单流水号（trans_detail表中的transNo）',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `first_recharge_time` datetime DEFAULT NULL COMMENT '用户首次入金时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_channelId_userId` (`channel_id`,`user_id`),
  KEY `idx_invitechannelId_inviteuserId` (`invite_channel_id`,`invite_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='推荐奖励';

-- ----------------------------
-- Table structure for recommend_roster
-- ----------------------------
DROP TABLE IF EXISTS `recommend_roster`;
CREATE TABLE `recommend_roster` (
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `recommend_level` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '推荐等级',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MGM白名单';

-- ----------------------------
-- Table structure for reward_detail
-- ----------------------------
DROP TABLE IF EXISTS `reward_detail`;
CREATE TABLE `reward_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `quarter_no` varchar(20) NOT NULL DEFAULT '' COMMENT '季度编号',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `bonus_base` decimal(6,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '奖励基数（例如：年化0.2%）',
  `random_ratio` decimal(5,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '随机比例',
  `reward_amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '奖励金额',
  `give_amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '赠送金额',
  `grant_amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '发放金额',
  `grant_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '发放状态',
  `start_time` datetime DEFAULT NULL COMMENT '账期开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '账期结束时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '奖励确认日期',
  `grant_time` datetime DEFAULT NULL COMMENT '奖励发放日期',
  `trans_no` varchar(36) NOT NULL DEFAULT '' COMMENT '订单流水号（trans_detail表中的transNo）',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_channelId_userId` (`channel_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1290 DEFAULT CHARSET=utf8 COMMENT='投资者回馈';

-- ----------------------------
-- Table structure for site_message
-- ----------------------------
DROP TABLE IF EXISTS `site_message`;
CREATE TABLE `site_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `title` varchar(35) NOT NULL DEFAULT '' COMMENT '标题',
  `subtitle` varchar(50) NOT NULL DEFAULT '' COMMENT '副标题（描述）',
  `content` text NOT NULL COMMENT '内容',
  `msg_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '信息类型',
  `top` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶（0：不置顶，1：置顶）',
  `available` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用（0：不可用，1：可用）',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `send_to` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '发送给（0:全部，1:指定用户）',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_channelId_title` (`channel_id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Table structure for site_message_status
-- ----------------------------
DROP TABLE IF EXISTS `site_message_status`;
CREATE TABLE `site_message_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `message_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'MessageID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `message_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '信息状态（0：未读，1：已读）',
  `newest` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否最新消息(0 否， 1 是)',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`user_id`,`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59808 DEFAULT CHARSET=utf8 COMMENT='站内信用户状态表';

-- ----------------------------
-- Table structure for sub_account
-- ----------------------------
DROP TABLE IF EXISTS `sub_account`;
CREATE TABLE `sub_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `channel_id` int(11) unsigned NOT NULL COMMENT '渠道id',
  `account` int(11) NOT NULL COMMENT '子账户类型',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) NOT NULL COMMENT '更新人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uchannel_id` (`user_id`,`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1839 DEFAULT CHARSET=utf8 COMMENT='子账户';

-- ----------------------------
-- Table structure for tree_nodes
-- ----------------------------
DROP TABLE IF EXISTS `tree_nodes`;
CREATE TABLE `tree_nodes` (
  `ID` int(11) unsigned NOT NULL,
  `TreeID` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '树ID',
  `PID` int(11) unsigned DEFAULT NULL COMMENT '父节点ID',
  `TreeName` varchar(200) NOT NULL DEFAULT '' COMMENT '节点名称',
  `OrderID` int(11) unsigned DEFAULT '0' COMMENT '顺序号',
  `Obsolete` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`ID`),
  KEY `idx_treeid` (`TreeID`),
  KEY `idx_pid` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Table structure for upload_files
-- ----------------------------
DROP TABLE IF EXISTS `upload_files`;
CREATE TABLE `upload_files` (
  `FileID` varchar(40) NOT NULL COMMENT '文件GUID',
  `FileName` varchar(1024) NOT NULL DEFAULT '' COMMENT '文件名称',
  `FileSize` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `Catalog` varchar(45) NOT NULL DEFAULT '' COMMENT '文件类别',
  `Flag0` int(11) unsigned DEFAULT NULL COMMENT '业务ID',
  `Flag1` int(11) unsigned DEFAULT NULL,
  `Flag2` int(11) unsigned DEFAULT NULL,
  `Flag3` int(11) unsigned DEFAULT NULL,
  `GPS` varchar(500) DEFAULT NULL COMMENT 'GPS信息',
  `Agent` varchar(2048) DEFAULT NULL COMMENT '上传Agent信息',
  `IsMobileDevice` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是否移动设备上传',
  `IsPublic` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是否公开',
  `IsDelete` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `TakeAt` datetime DEFAULT NULL COMMENT '照片拍摄时间',
  `UploadAt` datetime DEFAULT NULL COMMENT '上传时间',
  `UploadBy` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传人',
  `DeleteAt` datetime DEFAULT NULL COMMENT '删除时间',
  `DeleteBy` int(11) unsigned DEFAULT '0' COMMENT '删除人',
  PRIMARY KEY (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号',
  `masked_phone` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号mask',
  `id_card` varchar(100) NOT NULL DEFAULT '' COMMENT '身份证',
  `masked_id_card` varchar(100) NOT NULL DEFAULT '' COMMENT 'mask身份证',
  `real_name` varchar(100) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for user_bindcard
-- ----------------------------
DROP TABLE IF EXISTS `user_bindcard`;
CREATE TABLE `user_bindcard` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `channel_id` int(11) NOT NULL COMMENT '渠道id',
  `withhold_channel` int(11) NOT NULL COMMENT '代扣通道',
  `bank_no` varchar(20) NOT NULL DEFAULT '' COMMENT '银行code',
  `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_card_no` varchar(100) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `phone` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号',
  `bind_status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '绑卡状态',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='绑卡';

-- ----------------------------
-- Table structure for user_channel
-- ----------------------------
DROP TABLE IF EXISTS `user_channel`;
CREATE TABLE `user_channel` (
  `user_id` int(11) NOT NULL COMMENT 'uid',
  `channel_id` int(11) NOT NULL COMMENT '渠道id',
  `trade_password` varchar(100) NOT NULL DEFAULT '' COMMENT '交易密码',
  `fa_id` int(11) NOT NULL DEFAULT '0' COMMENT '理财顾问id',
  `invitation_code` varchar(50) NOT NULL DEFAULT '' COMMENT '邀请码',
  `user_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '客户类型',
  `registered_source` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '注册来源',
  `risk_level` smallint(5) NOT NULL DEFAULT '0' COMMENT '风险等级',
  `manual_risk_level` smallint(5) NOT NULL DEFAULT '0' COMMENT '手动调整风险等级',
  `balance_type` smallint(5) NOT NULL DEFAULT '2' COMMENT '平衡类型',
  `join_status` smallint(5) NOT NULL DEFAULT '1' COMMENT '加入状态,1未加，2进入中，3已加入',
  `test_status` smallint(5) NOT NULL DEFAULT '1' COMMENT '测试状态，1未，2已测',
  `account_status` smallint(5) NOT NULL DEFAULT '1' COMMENT '账户状态，1正常，2欠费，3销户',
  `fund_account_status` smallint(5) NOT NULL DEFAULT '0' COMMENT '基金户状态，0未开，1已开',
  `bind_card_status` smallint(5) NOT NULL DEFAULT '0' COMMENT '绑卡情况0未绑，1已绑',
  `first_status` smallint(5) NOT NULL DEFAULT '0' COMMENT '首单状态,0未，1中，2完成',
  `red_activity_no` varchar(32) NOT NULL DEFAULT '' COMMENT '参加的最后一期活动的编号',
  `red_activity_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '答题状态',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户渠道';

-- ----------------------------
-- Table structure for user_contract
-- ----------------------------
DROP TABLE IF EXISTS `user_contract`;
CREATE TABLE `user_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `channel_id` int(11) NOT NULL COMMENT '渠道id',
  `contract_type` smallint(5) NOT NULL DEFAULT '1' COMMENT '合同类型，1代扣',
  `contract_status` smallint(5) NOT NULL DEFAULT '0' COMMENT '处理状态,0初始，1发送，2生成',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '发大大url',
  `created_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_by` int(11) NOT NULL DEFAULT '0' COMMENT '更新人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_u_c_c` (`user_id`,`channel_id`,`contract_type`),
  KEY `idx_con_status` (`contract_status`)
) ENGINE=InnoDB AUTO_INCREMENT=7464 DEFAULT CHARSET=utf8 COMMENT='合同';

-- ----------------------------
-- Table structure for user_owner_history
-- ----------------------------
DROP TABLE IF EXISTS `user_owner_history`;
CREATE TABLE `user_owner_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `fa_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FAID',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户归属记录表';

-- ----------------------------
-- Table structure for _sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `_sys_sequence`;
CREATE TABLE `_sys_sequence` (
  `SequenceID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SequenceName` varchar(50) NOT NULL COMMENT 'sequence名称',
  `SequenceValue` int(11) NOT NULL COMMENT 'sequence值',
  PRIMARY KEY (`SequenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务主键配置表';
