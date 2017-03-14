/*
Navicat MySQL Data Transfer

Source Server         : xuanji_test
Source Server Version : 50624
Source Host           : 172.19.1.115:3386
Source Database       : sandbox_portfolio_v2

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-10-19 16:29:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adjustment_plan
-- ----------------------------
DROP TABLE IF EXISTS `adjustment_plan`;
CREATE TABLE `adjustment_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userId` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `sellTotal` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '赎回总金额',
  `totalMoney` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '方案总金额',
  `createTime` datetime NOT NULL COMMENT '方案生成时间',
  `planStatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:方案保存;1:方案生效;2:方案执行失效;3:方案调仓中;4:方案调仓失败;5:方案执行成功',
  `updateTime` datetime DEFAULT NULL COMMENT '最新状态更新时间',
  `channelId` varchar(20) NOT NULL DEFAULT '0' COMMENT '用户渠道ID',
  `modelScore` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '模型分数',
  `createType` smallint(6) NOT NULL DEFAULT '0' COMMENT '方案创建类型(与再平衡一致)。0:系统, 1:手工编辑',
  PRIMARY KEY (`id`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=16319 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for adjustment_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `adjustment_plan_detail`;
CREATE TABLE `adjustment_plan_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `fid` varchar(50) NOT NULL DEFAULT '0' COMMENT '方案ID',
  `pid` varchar(50) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `currentMoney` decimal(40,2) NOT NULL DEFAULT '0.00' COMMENT '当前金额',
  `currentShare` decimal(40,2) NOT NULL DEFAULT '0.00' COMMENT '生成方案时当前的份额（只有赎回基金的时候记录）',
  `targetMoney` decimal(40,2) NOT NULL DEFAULT '0.00' COMMENT '目标金额',
  `targetShare` decimal(40,2) NOT NULL DEFAULT '0.00' COMMENT '目标份额(只有赎回的时候才有）',
  `planAction` smallint(6) DEFAULT NULL COMMENT '0:申购基金;1:赎回基金;2:申购P2P;3:赎回P2P',
  `buyPercent` decimal(40,8) DEFAULT NULL COMMENT '申购占比',
  `tryTimes` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '执行次数',
  `isExcuted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否执行',
  `actualBuyMoney` decimal(40,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际购买金额',
  PRIMARY KEY (`id`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=121281 DEFAULT CHARSET=utf8 COMMENT='调整方案';

-- ----------------------------
-- Table structure for adjustment_plan_his
-- ----------------------------
DROP TABLE IF EXISTS `adjustment_plan_his`;
CREATE TABLE `adjustment_plan_his` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `pid` varchar(30) NOT NULL DEFAULT '0' COMMENT '产品id',
  `currentmoney` decimal(40,2) NOT NULL DEFAULT '0.00' COMMENT '当前金额',
  `currentshare` decimal(40,2) NOT NULL DEFAULT '0.00' COMMENT '生成方案时当前的份额（只有赎回基金的时候记录）',
  `targetmoney` decimal(40,2) NOT NULL DEFAULT '0.00' COMMENT '目标金额',
  `targetshare` decimal(40,2) NOT NULL DEFAULT '0.00' COMMENT '目标份额(只有赎回的时候才有）',
  `planAction` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:申购基金;1:赎回基金;2:申购P2P;3:赎回P2P',
  `buyPercent` double(10,4) NOT NULL DEFAULT '0.0000' COMMENT '申购占比',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=104308 DEFAULT CHARSET=utf8 COMMENT='方案历史记录';

-- ----------------------------
-- Table structure for balance_queue
-- ----------------------------
DROP TABLE IF EXISTS `balance_queue`;
CREATE TABLE `balance_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userId` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户id',
  `joinTime` datetime NOT NULL COMMENT '加入时间',
  `execTime` datetime DEFAULT NULL COMMENT '执行时间',
  `balStatus` smallint(6) NOT NULL COMMENT '状态',
  `ruleId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则id',
  `planId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '方案id',
  `noticeFlag` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否已经发起系统通知',
  `channelId` varchar(20) DEFAULT NULL COMMENT '渠道id',
  `balType` smallint(6) NOT NULL DEFAULT '0' COMMENT '再平衡类型。0:手动;1:自动',
  `createType` smallint(6) NOT NULL DEFAULT '0' COMMENT '再平衡创建类型。0:系统, 1:手工编辑',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`userId`,`channelId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4715 DEFAULT CHARSET=utf8 COMMENT='再平衡队列';

-- ----------------------------
-- Table structure for balance_rule
-- ----------------------------
DROP TABLE IF EXISTS `balance_rule`;
CREATE TABLE `balance_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dim` decimal(10,2) unsigned NOT NULL COMMENT '容差比例',
  `isForceAdj` tinyint(1) unsigned NOT NULL COMMENT '是否强调',
  `userType` varchar(10) NOT NULL COMMENT '用户风险类型',
  `singleDim` decimal(10,2) unsigned NOT NULL COMMENT '单标杆容差',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='再平衡规则';

-- ----------------------------
-- Table structure for bankcard_limit
-- ----------------------------
DROP TABLE IF EXISTS `bankcard_limit`;
CREATE TABLE `bankcard_limit` (
  `bankCode` varchar(30) NOT NULL DEFAULT '0' COMMENT '银行编号',
  `singleLimit` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '单笔限额',
  `dayLimit` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '每日限额',
  `monthLimit` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '每月限额',
  `bankName` varchar(40) NOT NULL DEFAULT '' COMMENT '银行名称',
  `updateTime` datetime NOT NULL COMMENT '更新日期',
  PRIMARY KEY (`bankCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行卡限额';

-- ----------------------------
-- Table structure for baseline_month
-- ----------------------------
DROP TABLE IF EXISTS `baseline_month`;
CREATE TABLE `baseline_month` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `benchmarkId` varchar(50) NOT NULL DEFAULT '' COMMENT '标杆ID',
  `baseDate` datetime NOT NULL COMMENT '日期',
  `netValue` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '净值',
  `baseStatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:未完成;1:已经完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11344 DEFAULT CHARSET=utf8 COMMENT='基准线历史';

-- ----------------------------
-- Table structure for benchmarks
-- ----------------------------
DROP TABLE IF EXISTS `benchmarks`;
CREATE TABLE `benchmarks` (
  `benchmark_id` varchar(50) NOT NULL DEFAULT '' COMMENT '标杆ID',
  `benchmark_name` varchar(100) NOT NULL COMMENT '标杆市场名称',
  `benchmark_type` smallint(6) NOT NULL COMMENT '是股型还是债型 0表示股、1表示债',
  `tors` smallint(6) NOT NULL COMMENT '战略还是战术0是战略 1是战术',
  `sequence` int(11) NOT NULL COMMENT '顺序、从0开始依次增加',
  `descrb` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `creator` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新日期',
  `updator` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人',
  `classify` smallint(2) unsigned NOT NULL DEFAULT '0' COMMENT '标杆大分类',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  PRIMARY KEY (`id`),
  KEY `idx_benchmark_id` (`benchmark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='产品打分';

-- ----------------------------
-- Table structure for benchmark_base
-- ----------------------------
DROP TABLE IF EXISTS `benchmark_base`;
CREATE TABLE `benchmark_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `BDF1` decimal(20,6) DEFAULT NULL,
  `BDF2` decimal(20,6) DEFAULT NULL,
  `BDF3` decimal(20,6) DEFAULT NULL,
  `BDE1` decimal(20,6) DEFAULT NULL,
  `BDE2` decimal(20,6) DEFAULT NULL,
  `BDE3` decimal(20,6) DEFAULT NULL,
  `BOF1` decimal(20,6) DEFAULT NULL,
  `BOF2` decimal(20,6) DEFAULT NULL,
  `BOE1` decimal(20,6) DEFAULT NULL,
  `BOE2` decimal(20,6) DEFAULT NULL,
  `BC1` decimal(20,6) DEFAULT NULL,
  `BC2` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for benchmark_month
-- ----------------------------
DROP TABLE IF EXISTS `benchmark_month`;
CREATE TABLE `benchmark_month` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `benchmarkId` varchar(50) NOT NULL DEFAULT '' COMMENT '标杆ID',
  `benchmarkDate` datetime NOT NULL COMMENT '日期',
  `netValue` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '净值',
  `creaseRate` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '增长率',
  `withdrawalRate` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '回撤比例(可以根据上一条去计算）',
  `annualizedRate` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '年化利率',
  `reward` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '报酬率，公式为 (newNAV - 200601NAV) 开 1\\year根号',
  `benchmarkStatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:未完成;1:已经完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10884 DEFAULT CHARSET=utf8 COMMENT='标杆每月汇总';

-- ----------------------------
-- Table structure for benchmark_month_copy
-- ----------------------------
DROP TABLE IF EXISTS `benchmark_month_copy`;
CREATE TABLE `benchmark_month_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmarkId` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL COMMENT '日期',
  `netValue` decimal(20,6) DEFAULT NULL COMMENT '净值',
  `creaseRate` decimal(20,6) DEFAULT NULL COMMENT '增长率',
  `withdrawalRate` decimal(20,6) DEFAULT NULL COMMENT '回撤比例(可以根据上一条去计算）',
  `annualizedRate` decimal(20,6) DEFAULT NULL COMMENT '年化利率',
  `reward` decimal(20,6) DEFAULT NULL COMMENT '报酬率，公式为 (newNAV - 200601NAV) 开 1\\year根号',
  `status` int(11) DEFAULT NULL COMMENT '0表示未完成、1表示已经完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10400 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for benchmark_rlt
-- ----------------------------
DROP TABLE IF EXISTS `benchmark_rlt`;
CREATE TABLE `benchmark_rlt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid1` varchar(255) NOT NULL COMMENT '其中一个benchmarkid',
  `bid2` varchar(255) NOT NULL COMMENT '另一个benchmarkID',
  `cov` decimal(20,6) NOT NULL COMMENT '协方差',
  `prs` decimal(20,6) DEFAULT NULL COMMENT '皮尔逊相关系数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=577 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for benchmark_test
-- ----------------------------
DROP TABLE IF EXISTS `benchmark_test`;
CREATE TABLE `benchmark_test` (
  `code` varchar(255) DEFAULT NULL,
  `benchmarkid` varchar(255) DEFAULT NULL,
  `market` varchar(255) DEFAULT NULL,
  `invest` varchar(255) DEFAULT NULL,
  `ts` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for chart_data
-- ----------------------------
DROP TABLE IF EXISTS `chart_data`;
CREATE TABLE `chart_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `benchmark_id` varchar(20) NOT NULL DEFAULT '' COMMENT '标杆ID',
  `create_date` date NOT NULL COMMENT '日期',
  `net_value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '净值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_id_date` (`benchmark_id`,`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31805 DEFAULT CHARSET=utf8 COMMENT='走势图日数据';

-- ----------------------------
-- Table structure for chart_data_copy
-- ----------------------------
DROP TABLE IF EXISTS `chart_data_copy`;
CREATE TABLE `chart_data_copy` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `BenchmarkId` varchar(20) NOT NULL DEFAULT '' COMMENT '标杆ID',
  `CreateDate` date NOT NULL COMMENT '日期',
  `NetValue` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '净值',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='走势图日数据';

-- ----------------------------
-- Table structure for configuration
-- ----------------------------
DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `conf_name` varchar(100) DEFAULT NULL COMMENT '配置名',
  `conf_value` varchar(100) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`),
  KEY `idx_conf_name` (`conf_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='配置表,用于存储系统配置';

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dicCode` varchar(50) NOT NULL DEFAULT '' COMMENT '字典编码',
  `dicKey` varchar(100) NOT NULL DEFAULT '' COMMENT 'key值,业务表中的标识',
  `dicValue` varchar(255) NOT NULL DEFAULT '' COMMENT 'value值，真正的内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=827 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Table structure for east_money_fund
-- ----------------------------
DROP TABLE IF EXISTS `east_money_fund`;
CREATE TABLE `east_money_fund` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `fund_code` varchar(10) NOT NULL COMMENT '基金的code',
  `nav` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '基金净值',
  `min_buy_limit` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '最小限购金额',
  `max_buy_limit` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '最大申购金额()',
  `trade_status` varchar(50) NOT NULL DEFAULT '' COMMENT '基金交易状态',
  `charge_rate` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '申购费率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='天天基金上抓取的基金数据';

-- ----------------------------
-- Table structure for etl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `etl_job_log`;
CREATE TABLE `etl_job_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_JOB` int(11) DEFAULT NULL,
  `CHANNEL_ID` varchar(255) DEFAULT NULL,
  `JOBNAME` varchar(255) DEFAULT NULL,
  `STATUS` varchar(15) DEFAULT NULL,
  `LINES_READ` bigint(20) DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) DEFAULT NULL,
  `LINES_UPDATED` bigint(20) DEFAULT NULL,
  `LINES_INPUT` bigint(20) DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) DEFAULT NULL,
  `LINES_REJECTED` bigint(20) DEFAULT NULL,
  `ERRORS` bigint(20) DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `ENDDATE` datetime DEFAULT NULL,
  `LOGDATE` datetime DEFAULT NULL,
  `DEPDATE` datetime DEFAULT NULL,
  `REPLAYDATE` datetime DEFAULT NULL,
  `LOG_FIELD` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `IDX_etl_job_log_1` (`ID_JOB`) USING BTREE,
  KEY `IDX_etl_job_log_2` (`ERRORS`,`STATUS`,`JOBNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for etl_job_mark
-- ----------------------------
DROP TABLE IF EXISTS `etl_job_mark`;
CREATE TABLE `etl_job_mark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '0-正在进行，1-表示完成',
  `creator` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for etl_proc_log
-- ----------------------------
DROP TABLE IF EXISTS `etl_proc_log`;
CREATE TABLE `etl_proc_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createat` datetime DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `procedurename` varchar(45) DEFAULT NULL,
  `level` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for etl_push_status
-- ----------------------------
DROP TABLE IF EXISTS `etl_push_status`;
CREATE TABLE `etl_push_status` (
  `bsn_dt` date NOT NULL DEFAULT '0000-00-00' COMMENT '业务日期',
  `push_system` varchar(12) NOT NULL DEFAULT '' COMMENT '推送系统',
  `push_table_name` varchar(50) NOT NULL DEFAULT '',
  `push_status` int(11) DEFAULT NULL COMMENT '推送状态 0正在推送 1推送完成 2推送异常',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `tms` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`bsn_dt`,`push_system`,`push_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for etl_trans_log
-- ----------------------------
DROP TABLE IF EXISTS `etl_trans_log`;
CREATE TABLE `etl_trans_log` (
  `ID_BATCH` int(11) DEFAULT NULL,
  `CHANNEL_ID` varchar(255) DEFAULT NULL,
  `TRANSNAME` varchar(255) DEFAULT NULL,
  `STATUS` varchar(15) DEFAULT NULL,
  `LINES_READ` bigint(20) DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) DEFAULT NULL,
  `LINES_UPDATED` bigint(20) DEFAULT NULL,
  `LINES_INPUT` bigint(20) DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) DEFAULT NULL,
  `LINES_REJECTED` bigint(20) DEFAULT NULL,
  `ERRORS` bigint(20) DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `ENDDATE` datetime DEFAULT NULL,
  `LOGDATE` datetime DEFAULT NULL,
  `DEPDATE` datetime DEFAULT NULL,
  `REPLAYDATE` datetime DEFAULT NULL,
  `LOG_FIELD` mediumtext,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `IDX_etl_trans_log_1` (`ID_BATCH`) USING BTREE,
  KEY `IDX_etl_trans_log_2` (`ERRORS`,`STATUS`,`TRANSNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=586 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for event_message
-- ----------------------------
DROP TABLE IF EXISTS `event_message`;
CREATE TABLE `event_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `event_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '事件类型',
  `event_status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '事件状态',
  `content` varchar(512) NOT NULL DEFAULT '' COMMENT '内容',
  `trans_no` varchar(36) NOT NULL COMMENT '订单号',
  `trans_type` smallint(6) NOT NULL COMMENT '交易类型',
  `has_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已读 0 未读， 1 已读',
  `newest` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否最新 0 否， 1 是',
  `create_at` datetime NOT NULL COMMENT '创建时间,表示的是入库时间',
  `last_update_at` datetime NOT NULL COMMENT '业务更新时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_trans` (`user_id`,`channel_id`,`trans_no`,`trans_type`)
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=utf8 COMMENT='事件消息';

-- ----------------------------
-- Table structure for fee
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `feeType` smallint(6) NOT NULL COMMENT '计费类型',
  `money` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '金额',
  `recTime` datetime NOT NULL COMMENT '计费时间',
  `userId` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `tempId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '费率模板ID',
  `channelId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `totalMoney` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '总资产',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`userId`,`channelId`)
) ENGINE=InnoDB AUTO_INCREMENT=67353 DEFAULT CHARSET=utf8 COMMENT='费用明细';

-- ----------------------------
-- Table structure for fee_template
-- ----------------------------
DROP TABLE IF EXISTS `fee_template`;
CREATE TABLE `fee_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tplName` varchar(50) NOT NULL COMMENT '模板名称',
  `rate` decimal(10,4) NOT NULL COMMENT '费率',
  `workTime` datetime DEFAULT NULL COMMENT '生效时间',
  `effectDays` int(11) DEFAULT NULL COMMENT '生效天数',
  `isValid` tinyint(4) NOT NULL COMMENT '是否可用',
  `modifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `channelId` varchar(20) NOT NULL COMMENT '渠道id',
  `feeType` smallint(6) NOT NULL COMMENT '费用类型。0:管理费;1:顾问费;2:赎回费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='费用模板';

-- ----------------------------
-- Table structure for fundapi_call_log
-- ----------------------------
DROP TABLE IF EXISTS `fundapi_call_log`;
CREATE TABLE `fundapi_call_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_name` varchar(64) NOT NULL DEFAULT '' COMMENT '接口名称',
  `api_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否成功 0否 1是',
  `api_para` varchar(1024) NOT NULL DEFAULT '' COMMENT '传递参数',
  `api_result` text NOT NULL COMMENT '返回结果',
  `start_date` timestamp NOT NULL DEFAULT '2016-01-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_date` timestamp NOT NULL DEFAULT '2016-01-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fundnav_3month
-- ----------------------------
DROP TABLE IF EXISTS `fundnav_3month`;
CREATE TABLE `fundnav_3month` (
  `RecordUniqueID` decimal(20,0) NOT NULL COMMENT '记录唯一标识',
  `FundCode` varchar(20) NOT NULL COMMENT '基金代码',
  `UpdatedDate` datetime NOT NULL COMMENT '截止日期',
  `Navfuquan` decimal(9,4) DEFAULT NULL COMMENT '复权净值@单位:元',
  `DailyReturn` decimal(24,18) DEFAULT NULL COMMENT '每日增长率',
  PRIMARY KEY (`UpdatedDate`,`FundCode`),
  UNIQUE KEY `RecordUniqueID_seq` (`RecordUniqueID`) USING BTREE,
  KEY `index_UpdatedDate` (`UpdatedDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for global_config
-- ----------------------------
DROP TABLE IF EXISTS `global_config`;
CREATE TABLE `global_config` (
  `id` int(11) NOT NULL DEFAULT '0',
  `configId` varchar(50) NOT NULL DEFAULT '' COMMENT '配置编号',
  `configName` varchar(100) NOT NULL DEFAULT '' COMMENT '配置名称',
  `configValue` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `updateTime` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `idx_configId` (`configId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局设置';

-- ----------------------------
-- Table structure for of_monthvalue
-- ----------------------------
DROP TABLE IF EXISTS `of_monthvalue`;
CREATE TABLE `of_monthvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ofCode` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `ofName` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `navfuquan` decimal(20,6) DEFAULT NULL,
  `navacc` decimal(20,6) DEFAULT NULL,
  `netValue` decimal(20,6) DEFAULT NULL,
  `mnetValue` decimal(20,6) DEFAULT NULL COMMENT '修正后的netvalue值',
  `bcmknetValue` decimal(20,6) DEFAULT NULL,
  `ofDate` datetime DEFAULT NULL COMMENT '统计日期',
  `ofStatus` smallint(6) DEFAULT NULL COMMENT '状态',
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1161785 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL,
  `paymentType` smallint(6) NOT NULL COMMENT '缴费类型',
  `payed` decimal(40,4) DEFAULT NULL COMMENT '已经缴费',
  `toPay` decimal(40,4) NOT NULL COMMENT '需缴费',
  `fromDate` datetime(3) DEFAULT NULL COMMENT '开始计费时间',
  `toDate` datetime(3) DEFAULT NULL COMMENT '截止计费时间',
  `payoff` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否缴清0未缴清1已经缴清',
  `channelId` varchar(20) NOT NULL DEFAULT '',
  `paymentStatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '划扣状态。0:未划扣;1:成功;2:失败;3:处理中',
  `orderNum` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1046 DEFAULT CHARSET=utf8 COMMENT='缴费信息';

-- ----------------------------
-- Table structure for plan_deal
-- ----------------------------
DROP TABLE IF EXISTS `plan_deal`;
CREATE TABLE `plan_deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` varchar(32) NOT NULL DEFAULT '' COMMENT '用户id',
  `p2pDrawingDate` datetime DEFAULT NULL COMMENT '发起债转或提现的日期',
  `fid` varchar(32) NOT NULL DEFAULT '' COMMENT '方案id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='债转记录';

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `productId` varchar(50) NOT NULL COMMENT '产品id',
  `productStatus` smallint(6) NOT NULL COMMENT '产品状态',
  `buyMinAmount` decimal(40,4) unsigned DEFAULT NULL COMMENT '最低购买金额',
  `redeemMinAmount` decimal(40,4) DEFAULT NULL COMMENT '最低赎回份额',
  `minHoldAmount` decimal(40,4) unsigned DEFAULT NULL COMMENT '最低持有份额',
  `nav` double(20,4) DEFAULT NULL COMMENT '净值',
  `modifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `addByMoneyAmount` decimal(40,4) unsigned DEFAULT NULL COMMENT '追加金额',
  `buyMaxAmount` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '购买最大金额',
  `addBuyMaxAmount` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '追加购买最大金额',
  `todayTotalAmount` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '单日累计最大金额',
  `stepUnit` int(11) NOT NULL DEFAULT '0' COMMENT '极差',
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品详情';

-- ----------------------------
-- Table structure for product_lable
-- ----------------------------
DROP TABLE IF EXISTS `product_lable`;
CREATE TABLE `product_lable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_id` varchar(50) NOT NULL COMMENT '产品ID',
  `product_code` varchar(50) NOT NULL COMMENT '产品编码',
  `product_name` varchar(50) NOT NULL COMMENT '产品名称',
  `product_type` varchar(30) NOT NULL COMMENT '产品类型',
  `benchmark_id` varchar(50) NOT NULL DEFAULT '' COMMENT '标杆ID',
  `market` smallint(6) NOT NULL DEFAULT '0' COMMENT '市场，详细见字典表。0:国内市场;1:海外市场;2:商品市场',
  `investType` smallint(6) NOT NULL DEFAULT '0' COMMENT '投资类型、详细见字典表',
  `trend` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:做多;1:做空',
  `ts` smallint(6) NOT NULL DEFAULT '0' COMMENT '是战略还是战术。0:战略;1:战术',
  `lever` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否杠杆。0:是;1:否',
  `dsc` varchar(255) NOT NULL DEFAULT '' COMMENT '产品描述',
  `product_level` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:一般;1:精选;2:黑名单',
  `orilevel` smallint(6) NOT NULL DEFAULT '0' COMMENT '原始等级',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_productId` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17880 DEFAULT CHARSET=utf8 COMMENT='产品贴标';

-- ----------------------------
-- Table structure for product_rcmd
-- ----------------------------
DROP TABLE IF EXISTS `product_rcmd`;
CREATE TABLE `product_rcmd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `benchmarkId` varchar(50) NOT NULL COMMENT '标杆市场ID',
  `productId` varchar(50) NOT NULL COMMENT '产品ID',
  `sequence` int(11) NOT NULL COMMENT '排序',
  `date_time` datetime NOT NULL COMMENT '更新日期',
  `descb` varchar(255) NOT NULL DEFAULT '' COMMENT '优选描述',
  `isUsed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否可用 0不可用，1可用',
  `ptype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优黑选类型，0优选，1黑选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=781 DEFAULT CHARSET=utf8 COMMENT='产品推荐表';

-- ----------------------------
-- Table structure for product_rcmd_1
-- ----------------------------
DROP TABLE IF EXISTS `product_rcmd_1`;
CREATE TABLE `product_rcmd_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmarkId` varchar(255) NOT NULL COMMENT '标杆市场ID',
  `productId` varchar(255) NOT NULL COMMENT '产品ID',
  `sequence` int(11) NOT NULL COMMENT '排序',
  `date_time` datetime NOT NULL COMMENT '修改日期',
  `descb` varchar(255) NOT NULL DEFAULT '' COMMENT '优选描述',
  `isused` int(1) NOT NULL DEFAULT '0' COMMENT '是否可用 0不可用，1可用',
  `ptype` int(1) NOT NULL DEFAULT '0' COMMENT '优黑选类型，0优选，1黑选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='产品推荐表';

-- ----------------------------
-- Table structure for product_rcmd_copy
-- ----------------------------
DROP TABLE IF EXISTS `product_rcmd_copy`;
CREATE TABLE `product_rcmd_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmarkId` varchar(255) NOT NULL COMMENT '标杆市场ID',
  `productId` varchar(255) NOT NULL COMMENT '产品ID',
  `sequence` int(11) NOT NULL COMMENT '排序',
  `date_time` datetime NOT NULL COMMENT '修改日期',
  `descb` varchar(255) NOT NULL DEFAULT '' COMMENT '优选描述',
  `isused` int(1) NOT NULL DEFAULT '0' COMMENT '是否可用 0不可用，1可用',
  `ptype` int(1) NOT NULL DEFAULT '0' COMMENT '优黑选类型，0优选，1黑选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='产品推荐表';

-- ----------------------------
-- Table structure for product_rcmd_test
-- ----------------------------
DROP TABLE IF EXISTS `product_rcmd_test`;
CREATE TABLE `product_rcmd_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmarkId` varchar(255) NOT NULL COMMENT '标杆市场ID',
  `productId` varchar(255) NOT NULL COMMENT '产品ID',
  `sequence` int(11) NOT NULL COMMENT '排序',
  `date` datetime NOT NULL COMMENT '修改日期',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '优选描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品推荐表';

-- ----------------------------
-- Table structure for product_rcmd_test1
-- ----------------------------
DROP TABLE IF EXISTS `product_rcmd_test1`;
CREATE TABLE `product_rcmd_test1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmarkId` varchar(255) NOT NULL COMMENT '标杆市场ID',
  `productId` varchar(255) NOT NULL COMMENT '产品ID',
  `sequence` int(11) NOT NULL COMMENT '排序',
  `date_time` datetime NOT NULL COMMENT '修改日期',
  `descb` varchar(255) NOT NULL DEFAULT '' COMMENT '优选描述',
  `isused` int(1) NOT NULL DEFAULT '0' COMMENT '是否可用 0不可用，1可用',
  `ptype` int(1) NOT NULL DEFAULT '0' COMMENT '优黑选类型，0优选，1黑选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1771 DEFAULT CHARSET=utf8 COMMENT='产品推荐表';

-- ----------------------------
-- Table structure for product_score
-- ----------------------------
DROP TABLE IF EXISTS `product_score`;
CREATE TABLE `product_score` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_id` varchar(50) NOT NULL COMMENT '产品id',
  `product_name` varchar(100) NOT NULL COMMENT '产品名称',
  `fund_date` datetime NOT NULL COMMENT '成立日期',
  `benchmark_id` varchar(50) NOT NULL COMMENT '标杆id',
  `benchmark_name` varchar(100) NOT NULL COMMENT '标杆名称',
  `year_return_rate` decimal(20,6) NOT NULL COMMENT '年化收益率',
  `sharpe` decimal(20,6) NOT NULL COMMENT '夏普比率',
  `max_drawdown` decimal(20,6) NOT NULL COMMENT '最大回撤率',
  `volatility` decimal(20,6) NOT NULL COMMENT '波动率',
  `fund_size` decimal(20,6) NOT NULL COMMENT '基金规模',
  `score` decimal(20,6) NOT NULL COMMENT '分数',
  `update_time` datetime NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pid` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2382 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for product_score_choice
-- ----------------------------
DROP TABLE IF EXISTS `product_score_choice`;
CREATE TABLE `product_score_choice` (
  `pid` varchar(255) NOT NULL COMMENT '产品id',
  `benchmarkid` varchar(255) DEFAULT NULL,
  `excessReturn` decimal(20,6) DEFAULT NULL COMMENT '超额报酬',
  `maxDrawdown` decimal(20,6) DEFAULT NULL COMMENT '最大回撤',
  `fundSize` decimal(30,6) DEFAULT NULL COMMENT '基金规模',
  `volatility` decimal(20,6) DEFAULT NULL COMMENT '波动率',
  `sharpe` decimal(20,6) DEFAULT NULL COMMENT 'sharpe指标',
  `score` decimal(20,6) DEFAULT NULL COMMENT '分数',
  `date` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for profit_info
-- ----------------------------
DROP TABLE IF EXISTS `profit_info`;
CREATE TABLE `profit_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userId` varchar(50) NOT NULL COMMENT '用户ID',
  `channelId` varchar(20) NOT NULL COMMENT '渠道ID',
  `totalAmount` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '总资产',
  `profit` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '收益(可能为负数)',
  `yield` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '收益率',
  `updateTime` datetime DEFAULT NULL COMMENT '更新日期',
  `dailyProfit` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '分日收益',
  `dailyCharge` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '分日手续费',
  `award` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '奖励',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`userId`,`channelId`)
) ENGINE=InnoDB AUTO_INCREMENT=135349 DEFAULT CHARSET=utf8 COMMENT='收益情况';

-- ----------------------------
-- Table structure for pz
-- ----------------------------
DROP TABLE IF EXISTS `pz`;
CREATE TABLE `pz` (
  `pid` varchar(255) NOT NULL COMMENT '产品id',
  `benchmarkid` varchar(255) DEFAULT NULL,
  `excessReturn` decimal(20,6) DEFAULT NULL COMMENT '超额报酬',
  `maxDrawdown` decimal(20,6) DEFAULT NULL COMMENT '最大回撤',
  `fundSize` decimal(30,6) DEFAULT NULL COMMENT '基金规模',
  `volatility` decimal(20,6) DEFAULT NULL COMMENT '波动率',
  `sharpe` decimal(20,6) DEFAULT NULL COMMENT 'sharpe指标',
  `score` decimal(20,6) DEFAULT NULL COMMENT '分数',
  `date_time` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定制Trigger信息';

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Calendar信息';

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储CronTrigger，包括Cron表达式和时区信息';

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_STATEFUL` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的Trigger相关信息';

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `IS_STATEFUL` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Job配置信息';

-- ----------------------------
-- Table structure for qrtz_job_listeners
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_listeners`;
CREATE TABLE `qrtz_job_listeners` (
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `JOB_LISTENER` varchar(200) NOT NULL,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`,`JOB_LISTENER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='悲观锁信息';

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已暂停Trigger组信息';

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Scheduler状态信息';

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SIMPLETrigger配置信息';

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Trigger配置信息';

-- ----------------------------
-- Table structure for qrtz_trigger_listeners
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_trigger_listeners`;
CREATE TABLE `qrtz_trigger_listeners` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `TRIGGER_LISTENER` varchar(200) NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_LISTENER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ra_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `ra_whitelist`;
CREATE TABLE `ra_whitelist` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `usr_id` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  `createdBy` bigint(20) NOT NULL COMMENT '创建人',
  `updatedAt` datetime NOT NULL COMMENT '更新时间',
  `updatedBy` bigint(20) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `inMoney` decimal(40,4) NOT NULL COMMENT '金额',
  `inTime` datetime NOT NULL COMMENT '充值时间',
  `rechargeStatus` smallint(6) NOT NULL COMMENT '状态',
  `confirmTime` datetime DEFAULT NULL COMMENT '确定时间',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `channelId` varchar(20) DEFAULT NULL COMMENT '渠道id',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`userId`,`channelId`)
) ENGINE=InnoDB AUTO_INCREMENT=5550 DEFAULT CHARSET=utf8 COMMENT='充值';

-- ----------------------------
-- Table structure for redeem
-- ----------------------------
DROP TABLE IF EXISTS `redeem`;
CREATE TABLE `redeem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `outMoney` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '提现金额',
  `outTime` datetime DEFAULT NULL COMMENT '提现时间',
  `redeemStatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态',
  `confirmTime` datetime DEFAULT NULL COMMENT '确认时间',
  `userId` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户id',
  `channelId` varchar(20) NOT NULL DEFAULT '0' COMMENT '渠道ID',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`userId`,`channelId`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='赎回';

-- ----------------------------
-- Table structure for req_log
-- ----------------------------
DROP TABLE IF EXISTS `req_log`;
CREATE TABLE `req_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` varchar(255) NOT NULL COMMENT '接口地址',
  `params` text COMMENT '参数',
  `createTime` datetime NOT NULL COMMENT '请求时间',
  `calledBy` varchar(20) DEFAULT NULL COMMENT '调用用户',
  `reqCode` smallint(6) NOT NULL DEFAULT '0' COMMENT '响应码',
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256743 DEFAULT CHARSET=utf8 COMMENT='请求日志';

-- ----------------------------
-- Table structure for retry_buy_detail
-- ----------------------------
DROP TABLE IF EXISTS `retry_buy_detail`;
CREATE TABLE `retry_buy_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `business_code` varchar(10) NOT NULL DEFAULT '22' COMMENT '业务名称',
  `customer_no` varchar(50) NOT NULL DEFAULT '' COMMENT '基金客户代码',
  `transaction_account_id` varchar(100) NOT NULL DEFAULT '' COMMENT '基金交易账户',
  `channel_id` varchar(10) NOT NULL DEFAULT '' COMMENT '通道id(支付网点)',
  `bank_card_no` varchar(100) NOT NULL DEFAULT '' COMMENT '卡号',
  `target_product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '目标基金代码',
  `fail_product_code` varchar(50) NOT NULL DEFAULT '' COMMENT '失败基金代码',
  `charge_manage` varchar(4) NOT NULL DEFAULT 'A' COMMENT '收费方式',
  `buy_amount` decimal(40,4) NOT NULL DEFAULT '0.0000' COMMENT '申购金额',
  `network_node_code` varchar(10) NOT NULL DEFAULT '371' COMMENT '网点代码',
  `network_node_name` varchar(50) NOT NULL DEFAULT '积木基金' COMMENT '网点名称',
  `redeem_code` varchar(10) NOT NULL DEFAULT '0' COMMENT '巨额赎回标志',
  `retry_fund_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '处理结果状态 0:未处理, 1:已处理',
  `send_status` int(4) NOT NULL DEFAULT '0' COMMENT '重试申购邮件是否发送:0:未发送,1:已发送',
  `origin_apply_serial_no` varchar(64) NOT NULL DEFAULT '' COMMENT '赎回申购基金的交易流水',
  `apply_serial_no` varchar(64) NOT NULL DEFAULT '' COMMENT '基金确认生成的交易流水',
  `trans_no` varchar(64) NOT NULL DEFAULT '' COMMENT '自己生成的交易流水号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `retryFundStatus` (`retry_fund_status`),
  KEY `sendStatus_applySerialNo` (`send_status`,`apply_serial_no`),
  KEY `customerNOo_channelId` (`customer_no`,`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='基金开户信息';

-- ----------------------------
-- Table structure for return_fee
-- ----------------------------
DROP TABLE IF EXISTS `return_fee`;
CREATE TABLE `return_fee` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL,
  `returned` decimal(40,4) DEFAULT NULL COMMENT '已经返还',
  `toReturn` decimal(40,4) NOT NULL COMMENT '需返还',
  `fromDate` datetime(3) DEFAULT NULL COMMENT '开始计费时间',
  `toDate` datetime(3) DEFAULT NULL COMMENT '截止计费时间',
  `channelId` varchar(20) NOT NULL,
  `feeStatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '费用状态',
  `orderNum` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='返还信息';

-- ----------------------------
-- Table structure for risk_pq_desc
-- ----------------------------
DROP TABLE IF EXISTS `risk_pq_desc`;
CREATE TABLE `risk_pq_desc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `class_name` varchar(100) NOT NULL DEFAULT '' COMMENT '非常保守-PP,保守-CS,稳健-BE,成长-GR,积极-AG,非常积极-EG',
  `psy_quality` int(100) NOT NULL DEFAULT '0' COMMENT '不易受影响-0,会受影响-1，易受影响-2',
  `descb` varchar(255) DEFAULT NULL COMMENT '描述',
  `userType` varchar(10) DEFAULT NULL COMMENT '用户风险类型',
  PRIMARY KEY (`id`),
  KEY `idx_class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='风险承受力';

-- ----------------------------
-- Table structure for risk_volatility
-- ----------------------------
DROP TABLE IF EXISTS `risk_volatility`;
CREATE TABLE `risk_volatility` (
  `risk` varchar(255) NOT NULL COMMENT '风险属性',
  `avgSVolatility` decimal(10,2) NOT NULL COMMENT '战略平均波动',
  `TVolatilityLow` decimal(10,2) NOT NULL COMMENT '战术波动率适配区间下边缘',
  `TVolatilityHigh` decimal(10,2) NOT NULL COMMENT '战术波动率适配区间上边缘',
  PRIMARY KEY (`risk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tac_percent
-- ----------------------------
DROP TABLE IF EXISTS `tac_percent`;
CREATE TABLE `tac_percent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tac` int(11) NOT NULL COMMENT '战术比例',
  `low_age` int(11) NOT NULL COMMENT '年龄下线',
  `up_age` int(11) NOT NULL COMMENT '年龄上限',
  `risk_level` varchar(255) NOT NULL COMMENT '风险属性',
  `psy_quality` int(11) NOT NULL COMMENT '心理承受素质',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for test_answer
-- ----------------------------
DROP TABLE IF EXISTS `test_answer`;
CREATE TABLE `test_answer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `question_id` int(11) NOT NULL COMMENT '所属问题 ID',
  `question_no` smallint(6) NOT NULL COMMENT '所属题目的答案序号',
  `content` varchar(512) DEFAULT NULL COMMENT '答案内容',
  `bias` int(11) NOT NULL COMMENT '投资行为偏差分',
  `risk` int(11) NOT NULL COMMENT '投资风险分',
  `next_qid` int(11) DEFAULT NULL COMMENT '下一题编号',
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是不是新的答案',
  `aum` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '资产等级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `idx_question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='测验答案';

-- ----------------------------
-- Table structure for test_question
-- ----------------------------
DROP TABLE IF EXISTS `test_question`;
CREATE TABLE `test_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` varchar(512) NOT NULL COMMENT '问卷问题。',
  `section` int(11) NOT NULL COMMENT '问题分段，只能为 1 或 2',
  `question_no` int(11) NOT NULL COMMENT '问题编号',
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是不是新的问题',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='测验问题';

-- ----------------------------
-- Table structure for trans_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_detail`;
CREATE TABLE `trans_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `transNO` varchar(36) NOT NULL COMMENT '流水号',
  `pid` varchar(20) DEFAULT NULL COMMENT '产品id',
  `transType` smallint(6) NOT NULL COMMENT '交易类型',
  `money` decimal(40,4) NOT NULL COMMENT '金额',
  `transShare` decimal(40,4) DEFAULT NULL COMMENT '份额',
  `transTime` datetime NOT NULL COMMENT '交易时间',
  `userId` varchar(50) NOT NULL COMMENT '用户id',
  `balId` int(11) DEFAULT NULL COMMENT '再平衡id',
  `dealStatus` smallint(2) NOT NULL COMMENT '交易状态',
  `channelId` varchar(20) DEFAULT NULL COMMENT '渠道id',
  `transAction` smallint(6) DEFAULT NULL COMMENT '0:申购;1:赎回',
  `applySerialNo` varchar(64) DEFAULT '' COMMENT '积木基金申请单据流水号',
  `confTime` datetime DEFAULT NULL COMMENT '确认时间',
  `transDate` datetime DEFAULT NULL COMMENT '交易日期',
  `charge` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '手续费',
  `isFirstAdj` tinyint(1) unsigned DEFAULT '0' COMMENT '是否首单',
  `noticeFlag` smallint(2) unsigned DEFAULT '0',
  `expectedTime` datetime DEFAULT NULL COMMENT '预期完成时间',
  `totalTransNO` varchar(36) NOT NULL DEFAULT '' COMMENT '总订单号',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间,表示的是入库时间',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`userId`,`channelId`)
) ENGINE=InnoDB AUTO_INCREMENT=114059 DEFAULT CHARSET=utf8 COMMENT='交易流水';

-- ----------------------------
-- Table structure for t_kdf_cfg_fundnav
-- ----------------------------
DROP TABLE IF EXISTS `t_kdf_cfg_fundnav`;
CREATE TABLE `t_kdf_cfg_fundnav` (
  `tano` char(2) NOT NULL DEFAULT '',
  `fundcode` char(6) NOT NULL DEFAULT '',
  `sharetype` char(1) NOT NULL DEFAULT '',
  `navtype` char(1) NOT NULL DEFAULT '',
  `navdate` char(8) NOT NULL DEFAULT '',
  `bulletindate` char(8) NOT NULL DEFAULT '',
  `lastfundstatus` char(1) NOT NULL DEFAULT '',
  `lastshare` decimal(16,2) NOT NULL DEFAULT '0.00',
  `lastfundasset` decimal(16,2) NOT NULL DEFAULT '0.00',
  `lastnav` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `status` char(1) NOT NULL DEFAULT '',
  `todayshare` decimal(16,2) NOT NULL DEFAULT '0.00',
  `todayfundasset` decimal(16,2) NOT NULL DEFAULT '0.00',
  `nav` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `totalnav` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `accumulativenav` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `valueline` decimal(16,2) NOT NULL DEFAULT '0.00',
  `guaranteednav` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `guaranteedenddate` char(8) NOT NULL DEFAULT '',
  `fundincome` decimal(16,2) NOT NULL DEFAULT '0.00',
  `fundincomeunit` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `growthrate` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `unassigndiff` decimal(16,2) NOT NULL DEFAULT '0.00',
  `servicefee` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bsn_dt` date DEFAULT NULL COMMENT '业务日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_of_cfg_fund
-- ----------------------------
DROP TABLE IF EXISTS `t_of_cfg_fund`;
CREATE TABLE `t_of_cfg_fund` (
  `T_FUNDCODE` char(9) NOT NULL COMMENT 'TA代码_基金代码',
  `FUNDNAME` varchar(100) DEFAULT '' COMMENT '基金名称',
  `FUNDCODE_INSIDE` varchar(100) DEFAULT '' COMMENT '基金代码(内部)',
  `PFUNDCODE` varchar(100) DEFAULT '' COMMENT '父基金代码',
  `FUNDTYPE` char(1) NOT NULL COMMENT '产品类型,  0普通基金1货币市场基金2短债类基金3债券类基金4指数型基金5保本基金6QDII基金',
  `MANAGERCODE` char(8) NOT NULL COMMENT '管理人代码',
  `FUNDSPONSOR` varchar(100) DEFAULT '' COMMENT '产品发行人',
  `CUSTODIANCODE` varchar(100) DEFAULT '' COMMENT '托管行',
  `FACEVALUE` decimal(16,2) DEFAULT NULL COMMENT '基金面值',
  `CURRENCYTYPE` char(3) NOT NULL COMMENT '结算币种 156-人民币，840-美元344-港元，954-欧元392-日元，826-英镑250-法郎，280-马克',
  `SHARETYPES` varchar(100) DEFAULT NULL COMMENT '份额类别  销售无用',
  `ISSET` int(2) DEFAULT NULL,
  `bsn_dt` date DEFAULT NULL COMMENT '业务日期',
  `tms` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`T_FUNDCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基金信息';

-- ----------------------------
-- Table structure for t_of_cfg_fundnav
-- ----------------------------
DROP TABLE IF EXISTS `t_of_cfg_fundnav`;
CREATE TABLE `t_of_cfg_fundnav` (
  `FUNDCODE` varchar(255) NOT NULL COMMENT '基金代码',
  `SHARETYPE` varchar(255) DEFAULT NULL COMMENT '份额类别',
  `NAVTYPE` varchar(255) DEFAULT NULL COMMENT '基金净值类型',
  `NAVDATE` varchar(100) DEFAULT NULL COMMENT '净值日期',
  `BULLETINDATE` varchar(100) DEFAULT NULL COMMENT '发布日期',
  `LASTFUNDSTATUS` varchar(255) DEFAULT NULL COMMENT '昨日基金状态',
  `LASTSHARE` decimal(16,2) DEFAULT NULL COMMENT '昨日总份额',
  `LASTFUNDASSET` decimal(16,2) DEFAULT NULL COMMENT '昨日总金额',
  `LASTNAV` decimal(7,4) DEFAULT NULL COMMENT '昨日基金净值',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '当日基金状态',
  `TODAYSHARE` decimal(16,2) DEFAULT NULL COMMENT '当日总份额',
  `TODAYFUNDASSET` decimal(16,2) DEFAULT NULL COMMENT '当日总金额',
  `NAV` decimal(7,4) DEFAULT NULL COMMENT '当日基金净值',
  `TOTALNAV` decimal(7,4) DEFAULT NULL COMMENT '累计净值',
  `ACCUMULATIVENAV` decimal(7,4) DEFAULT NULL COMMENT '累计基金单位净值',
  `VALUELINE` decimal(16,2) DEFAULT NULL COMMENT '产品价值线数值',
  `GUARANTEEDNAV` decimal(7,4) DEFAULT NULL COMMENT '保本净值',
  `GUARANTEEDENDDATE` varchar(100) DEFAULT NULL COMMENT '保本到期日',
  `FUNDINCOME` decimal(16,2) DEFAULT NULL COMMENT '货币基金当日收益',
  `FUNDINCOMEUNIT` decimal(7,4) DEFAULT NULL COMMENT '货币基金单位收益率',
  `GROWTHRATE` decimal(9,8) DEFAULT NULL COMMENT '货币基金七日年化收益率',
  `UNASSIGNDIFF` varchar(100) DEFAULT NULL COMMENT '货币基金分配后尾差',
  `SERVICEFEE` decimal(16,2) DEFAULT NULL COMMENT '销售服务费',
  PRIMARY KEY (`FUNDCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ths_fundnav_d
-- ----------------------------
DROP TABLE IF EXISTS `t_ths_fundnav_d`;
CREATE TABLE `t_ths_fundnav_d` (
  `RecordUniqueID` decimal(20,0) NOT NULL COMMENT '记录唯一标识',
  `RecordCreateDate` datetime NOT NULL COMMENT '记录创建日期@记录创建时间',
  `RecordDate2iFinD` datetime DEFAULT NULL COMMENT '记录通讯到用户端日期',
  `FundCode` varchar(20) NOT NULL COMMENT '基金代码',
  `UpdatedDate` datetime NOT NULL COMMENT '截止日期',
  `NavByUnit` decimal(9,4) DEFAULT NULL COMMENT '单位净值@单位:元',
  `NavAcc` decimal(9,4) DEFAULT NULL COMMENT '累计净值@单位:元',
  `NAVFuQuan` decimal(24,10) DEFAULT NULL COMMENT '复权净值@复权净值=复权因子*单位净值',
  `FuQuanFactor` decimal(24,18) DEFAULT NULL COMMENT '基金复权因子',
  `DailyReturn` decimal(24,18) DEFAULT NULL COMMENT '每日增长率',
  `TotalNetAsset` decimal(18,2) DEFAULT NULL COMMENT '基金资产净值',
  `bsn_dt` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UpdatedDate`,`FundCode`),
  UNIQUE KEY `RecordUniqueID_seq` (`RecordUniqueID`) USING BTREE,
  KEY `RecordDate2iFinD` (`RecordDate2iFinD`) USING BTREE,
  KEY `index_UpdatedDate` (`UpdatedDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ths_fundnav_m
-- ----------------------------
DROP TABLE IF EXISTS `t_ths_fundnav_m`;
CREATE TABLE `t_ths_fundnav_m` (
  `RecordUniqueID` decimal(20,0) NOT NULL COMMENT '记录唯一标识',
  `RecordCreateDate` datetime NOT NULL COMMENT '记录创建日期@记录创建时间',
  `RecordDate2iFinD` datetime DEFAULT NULL COMMENT '记录通讯到用户端日期',
  `FundCode` varchar(20) NOT NULL COMMENT '基金代码',
  `UpdatedDate` datetime NOT NULL COMMENT '截止日期',
  `NavByUnit` decimal(9,4) DEFAULT NULL COMMENT '单位净值@单位:元',
  `NavAcc` decimal(9,4) DEFAULT NULL COMMENT '累计净值@单位:元',
  `NAVFuQuan` decimal(24,10) DEFAULT NULL COMMENT '复权净值@复权净值=复权因子*单位净值',
  `FuQuanFactor` decimal(24,18) DEFAULT NULL COMMENT '基金复权因子',
  `DailyReturn` decimal(24,18) DEFAULT NULL COMMENT '每日增长率',
  `TotalNetAsset` decimal(18,2) DEFAULT NULL COMMENT '基金资产净值',
  `bsn_dt` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UpdatedDate`,`FundCode`),
  UNIQUE KEY `RecordUniqueID_seq` (`RecordUniqueID`) USING BTREE,
  KEY `RecordDate2iFinD` (`RecordDate2iFinD`) USING BTREE,
  KEY `index_UpdatedDate` (`UpdatedDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ths_fundportfolio
-- ----------------------------
DROP TABLE IF EXISTS `t_ths_fundportfolio`;
CREATE TABLE `t_ths_fundportfolio` (
  `RecordUniqueID` decimal(20,0) DEFAULT NULL COMMENT '记录唯一标识',
  `FundCode` varchar(20) DEFAULT NULL COMMENT '基金代码',
  `FundName` varchar(80) DEFAULT NULL COMMENT '基金名称',
  `PublishDate` datetime DEFAULT NULL COMMENT '公告日期',
  `UpdatedDate` datetime DEFAULT NULL COMMENT '截止日期',
  `TotalAsset` decimal(18,2) DEFAULT NULL COMMENT '资产总值@单位:元',
  `CurrencyCode` varchar(12) DEFAULT NULL COMMENT '币种代码',
  `bsn_dt` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `idx_RecordUniqueID` (`RecordUniqueID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ths_securitybasics
-- ----------------------------
DROP TABLE IF EXISTS `t_ths_securitybasics`;
CREATE TABLE `t_ths_securitybasics` (
  `RecordUniqueID` decimal(20,0) DEFAULT NULL COMMENT '记录唯一标识',
  `RecordCreateDate` datetime DEFAULT NULL COMMENT '记录创建日期@记录创建时间',
  `RecordDate2iFinD` datetime DEFAULT NULL COMMENT '记录通讯到用户端日期',
  `SecurityIssuer` varchar(20) DEFAULT NULL COMMENT '证券发行主体ID@比如一个发行债券可能在不同的交易所上市，沪深300类似',
  `SecurityCode` varchar(40) DEFAULT NULL COMMENT '证券代码',
  `SecurityNameChi` varchar(200) DEFAULT NULL COMMENT '证券简称(中文)',
  `SecurityPinYinNm` varchar(50) DEFAULT NULL COMMENT '拼音简称',
  `SecurityFullNm` varchar(100) DEFAULT NULL COMMENT '证券全称',
  `SecurityClassID` varchar(12) DEFAULT NULL COMMENT '证券类别编码@关联到F001_THS004',
  `SecurityClass` varchar(60) DEFAULT NULL COMMENT '证券类别@包括:股票（A股、B股、H股）、债券（国债、政策性银行债、央行票据、特种金融债、企业债、可转债、债券回购）、基金（封闭式基金、上市型开放式基金、开放式基金、老基金）、其他；选择时同时程序将名称自动填入，不可直接人工填写或修改',
  `ExchangeMarketID` varchar(12) DEFAULT NULL COMMENT '交易市场编码@关联到F001_THS003，F003_THS003=''212''',
  `ExchangeMarket` varchar(60) DEFAULT NULL COMMENT '交易市场@包括:深交所、上交所、港交所、银行间债券市场、代办股份转让、其他；选择时程序自动将名称填入，不可直接人工填写或修改',
  `IPODate` datetime DEFAULT NULL COMMENT '上市日期',
  `TerminationDate` datetime DEFAULT NULL COMMENT '终止上市日期',
  `IssuingFirmID` varchar(11) DEFAULT NULL COMMENT '发行机构ID@关联到F001_THS002',
  `ListStatusID` varchar(12) DEFAULT NULL COMMENT '上市状态编码@关联到F001_THS003，F003_THS003=''213''',
  `ListStatus` varchar(60) DEFAULT NULL COMMENT '上市状态@包括:正常上市，终止上市，暂停上市，ST，*ST，已发行未上市等',
  `TongHuaShunID` varchar(32) DEFAULT NULL COMMENT '同花顺代码',
  `SecurityID` varchar(32) DEFAULT NULL COMMENT '证券ID',
  `listingOrNot` decimal(1,0) DEFAULT NULL COMMENT '是否上市@0->否；1->是',
  `TerminationYOrN` decimal(1,0) DEFAULT NULL COMMENT '是否摘牌@0->否；1->是',
  `ListingBoardCode` varchar(12) DEFAULT NULL COMMENT '上市板编码@关联到F001_THS003，F003_THS003=''216''',
  `ListingBoardName` varchar(30) DEFAULT NULL COMMENT '上市板名称',
  `CurrencyCode` varchar(12) DEFAULT NULL COMMENT '交易货币代码@关联到F001_THS003，F003_THS003=''518''',
  `CurrencyName` varchar(30) DEFAULT NULL COMMENT '交易货币名称',
  `bsn_dt` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `idx_t_ths_scr_bsc_dt_ID` (`RecordUniqueID`) USING BTREE,
  KEY `idx_t_ths_src_iss_main_id` (`SecurityIssuer`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_usr_ern_statc
-- ----------------------------
DROP TABLE IF EXISTS `t_usr_ern_statc`;
CREATE TABLE `t_usr_ern_statc` (
  `statc_dt` date NOT NULL COMMENT '统计日期',
  `usr_id` varchar(64) NOT NULL COMMENT '用户编号',
  `src_stm_cust_id` varchar(64) NOT NULL COMMENT '源系统客户编号',
  `ast_cgy_code` varchar(50) NOT NULL COMMENT '资产类别代码',
  `rlzd_ern` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '累计已实现收益',
  `unrlzd_ern` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '累计未实现收益',
  `tdy_ern` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '当日收益',
  `crn_val` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '当前市值',
  `ystd_val` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '昨日市值',
  `in_loan_acm_ern` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '在贷累计收益',
  `bsn_dt` date DEFAULT NULL COMMENT '业务日期',
  `tms` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  `tbl_nm` varchar(256) DEFAULT NULL COMMENT '表名',
  `sp_nm` varchar(256) DEFAULT NULL COMMENT '存储过程名',
  KEY `idx_cust_pl_statc_1` (`statc_dt`,`usr_id`,`ast_cgy_code`),
  KEY `idx_cust_pl_statc_2` (`statc_dt`,`src_stm_cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收益统计';

-- ----------------------------
-- Table structure for t_usr_pd_ern_statc_fund
-- ----------------------------
DROP TABLE IF EXISTS `t_usr_pd_ern_statc_fund`;
CREATE TABLE `t_usr_pd_ern_statc_fund` (
  `statc_dt` date DEFAULT NULL COMMENT '统计日期',
  `usr_id` varchar(64) DEFAULT NULL COMMENT '用户编号',
  `src_stm_cust_id` varchar(64) DEFAULT NULL COMMENT '源系统客户编号',
  `ast_cgy_code` varchar(50) DEFAULT NULL COMMENT '资产类别代码',
  `pd_id` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `txn_ac_id` varchar(50) DEFAULT NULL COMMENT '交易账户编号',
  `mkt_make_pos_orig_dt` date DEFAULT NULL COMMENT '持仓开始日期',
  `mkt_make_pos_end_dt` date DEFAULT NULL COMMENT '持仓结束日期',
  `crn_lot` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '当前累计份额',
  `crn_val` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '当前市值',
  `ystd_val` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '昨日市值',
  `avg_lot_cost` decimal(21,8) NOT NULL DEFAULT '0.00000000' COMMENT '平均份额成本',
  `crn_ltst_net_val` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '当前最新净值',
  `acm_tot_cost` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '累计总成本',
  `rlzd_ern` decimal(21,8) NOT NULL DEFAULT '0.00000000' COMMENT '累计已实现收益',
  `unrlzd_ern` decimal(21,8) NOT NULL DEFAULT '0.00000000' COMMENT '累计未实现收益',
  `tdy_ern` decimal(21,8) NOT NULL DEFAULT '0.00000000' COMMENT '当日收益',
  `tdy_ern_1` decimal(21,8) NOT NULL DEFAULT '0.00000000' COMMENT '当日收益(Part1)',
  `tdy_ern_2` decimal(21,8) NOT NULL DEFAULT '0.00000000' COMMENT '当日收益(Part2)',
  `tdy_purchase_amt` decimal(21,4) NOT NULL DEFAULT '0.0000' COMMENT '当日认购金额',
  `bsn_dt` date DEFAULT NULL COMMENT '业务日期',
  `tms` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  `tbl_nm` varchar(256) DEFAULT NULL COMMENT '表名',
  `sp_nm` varchar(256) DEFAULT NULL COMMENT '存储过程名',
  KEY `idx_cust_pd_ern_statc_1` (`statc_dt`,`usr_id`,`ast_cgy_code`,`pd_id`,`txn_ac_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户按产品收益统计(基金)';

-- ----------------------------
-- Table structure for usertype_config
-- ----------------------------
DROP TABLE IF EXISTS `usertype_config`;
CREATE TABLE `usertype_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_type` varchar(50) NOT NULL COMMENT '用户类别',
  `benchmark_bound` varchar(512) NOT NULL COMMENT '标杆市场信息。json格式{"BC1":{"low":"0.5","dr":"1","up":"2.5"},"BC2":{"low":"0.5","dr":"1","up":"2.5"}}',
  `bonds` decimal(10,0) NOT NULL COMMENT '债比',
  `shares` decimal(10,0) NOT NULL COMMENT '股比',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `updator` varchar(64) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='用户资产配置条件配置';

-- ----------------------------
-- Table structure for usertype_config_copy
-- ----------------------------
DROP TABLE IF EXISTS `usertype_config_copy`;
CREATE TABLE `usertype_config_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(64) NOT NULL COMMENT '用户类别',
  `benchmark_bound` varchar(512) NOT NULL COMMENT '标杆市场信息json格式\r\n{"BC1":{"low":"0.5","dr":"1","up":"2.5"},"BC2":{"low":"0.5","dr":"1","up":"2.5"}}',
  `bonds` decimal(10,0) NOT NULL COMMENT '债比',
  `shares` decimal(10,0) NOT NULL COMMENT '股比',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `updator` varchar(64) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='用户资产配置条件配置';

-- ----------------------------
-- Table structure for user_asset
-- ----------------------------
DROP TABLE IF EXISTS `user_asset`;
CREATE TABLE `user_asset` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `magPercent` decimal(10,4) unsigned NOT NULL COMMENT '资产占比',
  `magStartTime` datetime NOT NULL COMMENT '资产托管开始时间',
  `magMoney` decimal(40,4) NOT NULL COMMENT '托管金额',
  `isValid` tinyint(1) NOT NULL COMMENT '是否有效',
  `userId` varchar(50) NOT NULL COMMENT '用户id',
  `modifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `channelId` varchar(20) DEFAULT NULL COMMENT '渠道id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91629 DEFAULT CHARSET=utf8 COMMENT='用户资产';

-- ----------------------------
-- Table structure for user_asset_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_asset_detail`;
CREATE TABLE `user_asset_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `productCode` varchar(50) NOT NULL COMMENT '产品编号',
  `pid` varchar(50) NOT NULL COMMENT '产品id',
  `userId` varchar(50) NOT NULL COMMENT '用户id',
  `productStatus` smallint(2) NOT NULL COMMENT ' 产品状态',
  `buyAmount` decimal(40,4) DEFAULT NULL COMMENT '申购金额',
  `holdAmount` decimal(40,4) DEFAULT NULL COMMENT '持有份额',
  `redeemAmount` decimal(40,4) DEFAULT NULL COMMENT '赎回份额',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `channelId` varchar(20) DEFAULT NULL COMMENT '渠道id',
  `applySerialNo` varchar(36) DEFAULT NULL COMMENT '交易流水号',
  `redeemMoney` decimal(40,4) unsigned DEFAULT NULL COMMENT '赎回金额',
  `transDate` datetime DEFAULT NULL COMMENT '交易日期',
  PRIMARY KEY (`id`),
  KEY `idx_userId_channelId` (`userId`,`channelId`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=21122 DEFAULT CHARSET=utf8 COMMENT='用户资产详情';

-- ----------------------------
-- Table structure for user_asset_info
-- ----------------------------
DROP TABLE IF EXISTS `user_asset_info`;
CREATE TABLE `user_asset_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `channel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `total_asset` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '总资产',
  `total_recharge` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '入金总金额',
  `first_recharge_time` datetime DEFAULT NULL COMMENT '首次入金时间',
  `again_recharge_time` datetime DEFAULT NULL COMMENT '再次 入金时间',
  `total_redeem` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '提现总金额',
  `total_purchase_fee` decimal(40,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '申购费总金额',
  `newset` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否是最新数据',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1116 DEFAULT CHARSET=utf8 COMMENT='用户资产收益明细';

-- ----------------------------
-- Table structure for user_recommend
-- ----------------------------
DROP TABLE IF EXISTS `user_recommend`;
CREATE TABLE `user_recommend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_type` varchar(50) NOT NULL DEFAULT '' COMMENT '用户类型',
  `aum` tinyint(4) NOT NULL COMMENT '资产评级',
  `bweight` varchar(255) DEFAULT NULL COMMENT '保存一个json字符串,里面包含每个标杆和标杆对应的比例',
  `maxdrawdown` decimal(20,6) DEFAULT '0.000000' COMMENT '最大提现',
  `revenue` decimal(20,6) DEFAULT '0.000000' COMMENT '收益',
  `volatility` decimal(20,6) DEFAULT '0.000000' COMMENT '波动',
  `score` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '每一类的一个打分，用于预警',
  `updateTime` date NOT NULL COMMENT '更新日期',
  `forceTurn` smallint(6) DEFAULT '0' COMMENT '0非1是强制调仓',
  `isUsed` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19349 DEFAULT CHARSET=utf8 COMMENT='用户方案推荐';

-- ----------------------------
-- Table structure for user_recommend_his
-- ----------------------------
DROP TABLE IF EXISTS `user_recommend_his`;
CREATE TABLE `user_recommend_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_type` varchar(255) DEFAULT NULL,
  `bweight` varchar(255) DEFAULT NULL COMMENT '保存一个json字符串,里面包含每个标杆和标杆对应的比例',
  `revenue` decimal(20,6) DEFAULT '0.000000',
  `volatility` decimal(20,6) DEFAULT '0.000000',
  `score` decimal(20,6) DEFAULT NULL COMMENT '每一类的一个打分，用于预警',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `forceTurn` int(11) DEFAULT NULL COMMENT '0非1是强制调仓',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5477 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_tested_result
-- ----------------------------
DROP TABLE IF EXISTS `user_tested_result`;
CREATE TABLE `user_tested_result` (
  `userId` varchar(255) NOT NULL COMMENT '用户id',
  `channelId` varchar(20) NOT NULL DEFAULT '0',
  `testScore` int(11) NOT NULL DEFAULT '0' COMMENT '测试得分',
  `riskLevel` varchar(10) NOT NULL COMMENT '风险属性,具体含义详见字典表code为 RISK_LEVEL',
  `testDate` datetime NOT NULL COMMENT '测试日期',
  `birthday` date DEFAULT NULL COMMENT '用户的出生日期',
  `joinTime` datetime DEFAULT NULL COMMENT '加入时间',
  `balType` smallint(2) unsigned NOT NULL DEFAULT '0' COMMENT '再平衡类型。0:手动;1:自动',
  `lastAdjTime` datetime DEFAULT NULL COMMENT '最近调仓时间',
  `lastAdjScore` decimal(5,2) DEFAULT NULL COMMENT '上次调仓时模型的分值',
  `riskScore` int(11) DEFAULT NULL COMMENT '风险打分',
  `pyScore` int(11) DEFAULT NULL COMMENT '心理打分',
  `firtAdj` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否首单',
  `sellingFlag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提现。0:不提现;1:发起提现',
  `sellingTime` datetime DEFAULT NULL COMMENT '确认提现时间',
  `arrears` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否欠费',
  `testRiskType` varchar(10) DEFAULT NULL COMMENT '测试风险类型',
  `testAum` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '测试的资产等级',
  `userType` varchar(10) DEFAULT NULL COMMENT '用户风险类型',
  `userStatus` smallint(2) DEFAULT NULL COMMENT '用户状态',
  `custno` varchar(20) DEFAULT NULL COMMENT '基金用户编号',
  `instId` varchar(20) DEFAULT NULL,
  `modifyrtTime` datetime DEFAULT NULL COMMENT '修改风险属性时间',
  `systemno` varchar(20) DEFAULT NULL COMMENT '调用基金接口的系统编号',
  `modifybalTime` datetime DEFAULT NULL COMMENT '修改再平衡时间',
  `forceTurn` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否强制调仓。0:非;1:是',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_userId_channelId` (`userId`,`channelId`)
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8 COMMENT='用户测试后分数的保存和风险属性的保存';

-- ----------------------------
-- Table structure for user_types
-- ----------------------------
DROP TABLE IF EXISTS `user_types`;
CREATE TABLE `user_types` (
  `user_type` varchar(50) NOT NULL COMMENT '用户类别ID',
  `risk_level` varchar(50) DEFAULT NULL COMMENT '风险属性,具体详见字典表',
  `age_low` int(11) NOT NULL COMMENT '年龄下线',
  `age_up` int(11) NOT NULL COMMENT '年龄上限',
  `descb` varchar(255) DEFAULT NULL COMMENT '描述',
  `psy_quality` int(100) DEFAULT NULL COMMENT '0:不易受影响;1:会受影响;2:易受影响',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  PRIMARY KEY (`id`),
  KEY `idx_user_type` (`user_type`),
  KEY `idx_r_a_a` (`risk_level`,`age_up`,`age_low`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户类型表';

-- ----------------------------
-- Table structure for usr_ern_statc_acc
-- ----------------------------
DROP TABLE IF EXISTS `usr_ern_statc_acc`;
CREATE TABLE `usr_ern_statc_acc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statc_dt` date NOT NULL COMMENT '统计日期',
  `usr_id` varchar(64) NOT NULL COMMENT '用户编号',
  `rlzd_ern` decimal(21,8) DEFAULT NULL COMMENT '累计已实收益',
  `unrlzd_ern` decimal(21,8) DEFAULT NULL COMMENT '累计未实收益',
  `p2p_tdy_ern` decimal(21,8) DEFAULT NULL,
  `tdy_ern` decimal(21,8) DEFAULT NULL COMMENT '当日收益率',
  `acc_y_ern` decimal(21,8) NOT NULL DEFAULT '0.00000000' COMMENT '今年累积收益率',
  `acc_y_ern_all` decimal(21,8) NOT NULL DEFAULT '0.00000000' COMMENT '累积收益率',
  PRIMARY KEY (`id`),
  KEY `idx_cust_pl_statc_1` (`statc_dt`,`usr_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24148 DEFAULT CHARSET=utf8 COMMENT='用户收益统计汇总';

-- ----------------------------
-- Table structure for usr_ern_statc_acc_copy
-- ----------------------------
DROP TABLE IF EXISTS `usr_ern_statc_acc_copy`;
CREATE TABLE `usr_ern_statc_acc_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statc_dt` date NOT NULL COMMENT '统计日期',
  `usr_id` varchar(64) NOT NULL COMMENT '用户编号',
  `rlzd_ern` decimal(21,8) DEFAULT NULL COMMENT '累计已实收益',
  `unrlzd_ern` decimal(21,8) DEFAULT NULL COMMENT '累计未实收益',
  `tdy_ern` decimal(21,8) DEFAULT NULL COMMENT '当日收益率',
  `acc_y_ern` decimal(21,8) DEFAULT NULL COMMENT '累积收益率',
  PRIMARY KEY (`id`),
  KEY `idx_cust_pl_statc_1` (`statc_dt`,`usr_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21097 DEFAULT CHARSET=utf8 COMMENT='用户收益统计汇总';

-- ----------------------------
-- Table structure for us_benchmarks
-- ----------------------------
DROP TABLE IF EXISTS `us_benchmarks`;
CREATE TABLE `us_benchmarks` (
  `benchmark_id` varchar(50) NOT NULL DEFAULT '',
  `benchmark_name` varchar(255) NOT NULL COMMENT '标杆市场名称',
  `benchmarkType` smallint(6) NOT NULL COMMENT '是股型还是债型。0:股;1:债',
  `tors` int(11) NOT NULL COMMENT '战略还是战术0是战略 1是战术',
  `sequence` int(11) NOT NULL COMMENT '顺序、从0开始依次增加',
  `descrb` varchar(255) NOT NULL COMMENT '描述',
  `create_time` datetime NOT NULL,
  `creator` varchar(50) NOT NULL,
  `update_time` datetime NOT NULL,
  `updator` varchar(50) NOT NULL,
  PRIMARY KEY (`benchmark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='美股标杆基础信息';

-- ----------------------------
-- Table structure for us_benchmark_month
-- ----------------------------
DROP TABLE IF EXISTS `us_benchmark_month`;
CREATE TABLE `us_benchmark_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmarkDate` datetime NOT NULL COMMENT '日期',
  `netvalue` decimal(20,6) NOT NULL COMMENT '标杆的净值',
  `savg` decimal(20,6) NOT NULL,
  `lavg` decimal(20,6) NOT NULL,
  `eps` decimal(20,6) NOT NULL COMMENT '标杆的每股营收标杆的每股营收',
  `bb_pf` decimal(20,6) NOT NULL COMMENT '标杆的预期价格',
  `ccy` decimal(20,6) NOT NULL COMMENT '标杆所对应之汇率',
  `eps_forcast` decimal(20,6) NOT NULL COMMENT '预期每股营收',
  `benchmarkId` varchar(50) NOT NULL COMMENT '标杆id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11671 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for us_bhmk_base_bb_pf
-- ----------------------------
DROP TABLE IF EXISTS `us_bhmk_base_bb_pf`;
CREATE TABLE `us_bhmk_base_bb_pf` (
  `date` datetime DEFAULT NULL,
  `SPX` decimal(20,6) DEFAULT NULL,
  `SXXP` decimal(20,6) DEFAULT NULL,
  `NKY` decimal(20,6) DEFAULT NULL,
  `AS51` decimal(20,6) DEFAULT NULL,
  `MXLA` decimal(20,6) DEFAULT NULL,
  `MXMU` decimal(20,6) DEFAULT NULL,
  `MSEUEGFA` decimal(20,6) DEFAULT NULL,
  `SHSZ300` decimal(20,6) DEFAULT NULL,
  `BCOM` decimal(20,6) DEFAULT NULL,
  `XAU` decimal(20,6) DEFAULT NULL,
  `REI` decimal(20,6) DEFAULT NULL,
  `HW00` decimal(20,6) DEFAULT NULL,
  `IP00` decimal(20,6) DEFAULT NULL,
  `G0BC` decimal(20,6) DEFAULT NULL,
  `VMRXX` decimal(20,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for us_bhmk_base_ccy
-- ----------------------------
DROP TABLE IF EXISTS `us_bhmk_base_ccy`;
CREATE TABLE `us_bhmk_base_ccy` (
  `date` datetime DEFAULT NULL,
  `SPX` decimal(20,6) DEFAULT NULL,
  `SXXP` decimal(20,6) DEFAULT NULL,
  `NKY` decimal(20,6) DEFAULT NULL,
  `AS51` decimal(20,6) DEFAULT NULL,
  `MXLA` decimal(20,6) DEFAULT NULL,
  `MXMU` decimal(20,6) DEFAULT NULL,
  `MSEUEGFA` decimal(20,6) DEFAULT NULL,
  `SHSZ300` decimal(20,6) DEFAULT NULL,
  `BCOM` decimal(20,6) DEFAULT NULL,
  `XAU` decimal(20,6) DEFAULT NULL,
  `REI` decimal(20,6) DEFAULT NULL,
  `HW00` decimal(20,6) DEFAULT NULL,
  `IP00` decimal(20,6) DEFAULT NULL,
  `G0BC` decimal(20,6) DEFAULT NULL,
  `VMRXX` decimal(20,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for us_bhmk_base_eps
-- ----------------------------
DROP TABLE IF EXISTS `us_bhmk_base_eps`;
CREATE TABLE `us_bhmk_base_eps` (
  `date` datetime DEFAULT NULL,
  `SPX` decimal(20,6) DEFAULT NULL,
  `SXXP` decimal(20,6) DEFAULT NULL,
  `NKY` decimal(20,6) DEFAULT NULL,
  `AS51` decimal(20,6) DEFAULT NULL,
  `MXLA` decimal(20,6) DEFAULT NULL,
  `MXMU` decimal(20,6) DEFAULT NULL,
  `MSEUEGFA` decimal(20,6) DEFAULT NULL,
  `SHSZ300` decimal(20,6) DEFAULT NULL,
  `BCOM` decimal(20,6) DEFAULT NULL,
  `XAU` decimal(20,6) DEFAULT NULL,
  `REI` decimal(20,6) DEFAULT NULL,
  `HW00` decimal(20,6) DEFAULT NULL,
  `IP00` decimal(20,6) DEFAULT NULL,
  `G0BC` decimal(20,6) DEFAULT NULL,
  `VMRXX` decimal(20,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for us_bhmk_base_eps_forcast
-- ----------------------------
DROP TABLE IF EXISTS `us_bhmk_base_eps_forcast`;
CREATE TABLE `us_bhmk_base_eps_forcast` (
  `date` datetime DEFAULT NULL,
  `SPX` decimal(20,6) DEFAULT NULL,
  `SXXP` decimal(20,6) DEFAULT NULL,
  `NKY` decimal(20,6) DEFAULT NULL,
  `AS51` decimal(20,6) DEFAULT NULL,
  `MXLA` decimal(20,6) DEFAULT NULL,
  `MXMU` decimal(20,6) DEFAULT NULL,
  `MSEUEGFA` decimal(20,6) DEFAULT NULL,
  `SHSZ300` decimal(20,6) DEFAULT NULL,
  `BCOM` decimal(20,6) DEFAULT NULL,
  `XAU` decimal(20,6) DEFAULT NULL,
  `REI` decimal(20,6) DEFAULT NULL,
  `HW00` decimal(20,6) DEFAULT NULL,
  `IP00` decimal(20,6) DEFAULT NULL,
  `G0BC` decimal(20,6) DEFAULT NULL,
  `VMRXX` decimal(20,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for us_bhmk_base_spot
-- ----------------------------
DROP TABLE IF EXISTS `us_bhmk_base_spot`;
CREATE TABLE `us_bhmk_base_spot` (
  `date` datetime DEFAULT NULL,
  `SPX` decimal(20,6) DEFAULT NULL,
  `SXXP` decimal(20,6) DEFAULT NULL,
  `NKY` decimal(20,6) DEFAULT NULL,
  `AS51` decimal(20,6) DEFAULT NULL,
  `MXLA` decimal(20,6) DEFAULT NULL,
  `MXMU` decimal(20,6) DEFAULT NULL,
  `MSEUEGFA` decimal(20,6) DEFAULT NULL,
  `SHSZ300` decimal(20,6) DEFAULT NULL,
  `BCOM` decimal(20,6) DEFAULT NULL,
  `XAU` decimal(20,6) DEFAULT NULL,
  `REI` decimal(20,6) DEFAULT NULL,
  `HW00` decimal(20,6) DEFAULT NULL,
  `IP00` decimal(20,6) DEFAULT NULL,
  `G0BC` decimal(20,6) DEFAULT NULL,
  `VMRXX` decimal(20,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for us_product_rcmd
-- ----------------------------
DROP TABLE IF EXISTS `us_product_rcmd`;
CREATE TABLE `us_product_rcmd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmarkId` varchar(50) NOT NULL DEFAULT '' COMMENT '标杆市场ID',
  `productId` varchar(50) NOT NULL DEFAULT '' COMMENT '产品ID',
  `sequence` int(11) NOT NULL COMMENT '排序',
  `updateDate` datetime NOT NULL COMMENT '修改日期',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '优选描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COMMENT='美股产品推荐表';

-- ----------------------------
-- Table structure for us_usertype_config
-- ----------------------------
DROP TABLE IF EXISTS `us_usertype_config`;
CREATE TABLE `us_usertype_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(64) NOT NULL COMMENT '用户类别',
  `benchmark_bound` varchar(1024) NOT NULL COMMENT '标杆市场信息json格式\r\n{"BC1":{"low":"0.5","dr":"1","up":"2.5"},"BC2":{"low":"0.5","dr":"1","up":"2.5"}}',
  `bonds` decimal(10,0) NOT NULL COMMENT '债比',
  `shares` decimal(10,0) NOT NULL COMMENT '股比',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `updator` varchar(64) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='美股用户资产配置条件配置';

-- ----------------------------
-- Table structure for us_user_recommend
-- ----------------------------
DROP TABLE IF EXISTS `us_user_recommend`;
CREATE TABLE `us_user_recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_type` varchar(50) NOT NULL DEFAULT '' COMMENT '用户类型',
  `bweight` varchar(255) DEFAULT NULL COMMENT '保存一个json字符串,里面包含每个标杆和标杆对应的比例',
  `maxdrawdown` decimal(20,6) DEFAULT '0.000000',
  `revenue` decimal(20,6) DEFAULT '0.000000',
  `volatility` decimal(20,6) DEFAULT '0.000000',
  `score` decimal(20,6) DEFAULT NULL COMMENT '每一类的一个打分，用于预警',
  `updateTime` datetime DEFAULT NULL,
  `forceTurn` int(11) DEFAULT '0' COMMENT '0非1是强制调仓',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4722 DEFAULT CHARSET=utf8 COMMENT='用户方案推荐';

-- ----------------------------
-- Table structure for us_user_recommend_his
-- ----------------------------
DROP TABLE IF EXISTS `us_user_recommend_his`;
CREATE TABLE `us_user_recommend_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_type` varchar(50) NOT NULL DEFAULT '' COMMENT '用户类型',
  `bweight` varchar(255) DEFAULT NULL COMMENT '保存一个json字符串,里面包含每个标杆和标杆对应的比例',
  `revenue` decimal(20,6) DEFAULT '0.000000',
  `volatility` decimal(20,6) DEFAULT '0.000000',
  `score` decimal(20,6) DEFAULT NULL COMMENT '每一类的一个打分，用于预警',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `forceTurn` int(11) DEFAULT NULL COMMENT '0非1是强制调仓',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8583 DEFAULT CHARSET=utf8 COMMENT='用户方案推荐历史';

-- ----------------------------
-- Table structure for us_utype_stdhis
-- ----------------------------
DROP TABLE IF EXISTS `us_utype_stdhis`;
CREATE TABLE `us_utype_stdhis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) NOT NULL COMMENT '用户类型',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `month1` decimal(10,0) NOT NULL COMMENT '第一个月',
  `month2` decimal(10,0) NOT NULL COMMENT '第二个月',
  `month3` decimal(10,0) NOT NULL COMMENT '第三个月',
  `shareNote` varchar(255) DEFAULT NULL COMMENT '资产份额描述Json',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48051 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for utype_stdhis
-- ----------------------------
DROP TABLE IF EXISTS `utype_stdhis`;
CREATE TABLE `utype_stdhis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_type` varchar(50) NOT NULL COMMENT '用户类型',
  `aum` tinyint(4) NOT NULL COMMENT '资产评级',
  `create_date` date NOT NULL COMMENT '创建日期',
  `month1` decimal(10,0) NOT NULL COMMENT '第一个月',
  `month2` decimal(10,0) NOT NULL COMMENT '第二个月',
  `month3` decimal(10,0) NOT NULL COMMENT '第三个月',
  `shareNote` varchar(255) DEFAULT NULL COMMENT '份额信息Json',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_type_date` (`user_type`,`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114242 DEFAULT CHARSET=utf8 COMMENT='模型历史';

-- ----------------------------
-- Table structure for utype_stdhis_day
-- ----------------------------
DROP TABLE IF EXISTS `utype_stdhis_day`;
CREATE TABLE `utype_stdhis_day` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_type` varchar(50) NOT NULL COMMENT '用户类型',
  `aum` tinyint(4) NOT NULL COMMENT '资产评级',
  `create_date` date NOT NULL COMMENT '创建日期',
  `net_value` decimal(10,0) NOT NULL COMMENT '净值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_type_aum_date` (`user_type`,`aum`,`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1416499 DEFAULT CHARSET=utf8 COMMENT='模型历史';

-- ----------------------------
-- Table structure for validate_queue
-- ----------------------------
DROP TABLE IF EXISTS `validate_queue`;
CREATE TABLE `validate_queue` (
  `fid` varchar(255) NOT NULL COMMENT '方案id',
  `uid` varchar(255) NOT NULL COMMENT '用户id',
  `p2pMoney` decimal(10,0) DEFAULT NULL COMMENT 'p2p申购基金',
  `minRate` decimal(10,0) DEFAULT NULL COMMENT '最小利率',
  `validateStatus` smallint(6) DEFAULT NULL COMMENT '状态默认。0 1:执行成功;2:失败',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
