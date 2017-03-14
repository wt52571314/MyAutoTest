/*
 Navicat Premium Data Transfer

 Source Server         : kf_开发
 Source Server Type    : MySQL
 Source Server Version : 50537
 Source Host           : 172.19.1.115
 Source Database       : sandbox_stock_trade_us

 Target Server Type    : MySQL
 Target Server Version : 50537
 File Encoding         : utf-8

 Date: 08/12/2016 11:39:16 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `alias_email`
-- ----------------------------
DROP TABLE IF EXISTS `alias_email`;
CREATE TABLE `alias_email` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `alias` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  UNIQUE KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `alias_email1`
-- ----------------------------
DROP TABLE IF EXISTS `alias_email1`;
CREATE TABLE `alias_email1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `alias` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId_uniq` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `apex_pdf_info`
-- ----------------------------
DROP TABLE IF EXISTS `apex_pdf_info`;
CREATE TABLE `apex_pdf_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '积木账号id',
  `apex_account_id` varchar(255) NOT NULL COMMENT 'apex的accountId',
  `doc_date` datetime DEFAULT NULL COMMENT '文档时间',
  `doc_type` varchar(32) DEFAULT NULL COMMENT '文档类型（2，104）',
  `title` varchar(500) NOT NULL COMMENT '文件名称',
  `apex_url` varchar(500) NOT NULL COMMENT 'apex的pdf地址',
  `store_path` varchar(500) DEFAULT NULL COMMENT '积木的url地址',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `apex_pdf_user_id` (`user_id`),
  KEY `apex_pdf_apex_account_id` (`apex_account_id`),
  KEY `apex_pdf_doc_date` (`doc_date`)
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=utf8 COMMENT='协议的pdf';

-- ----------------------------
--  Table structure for `apex_trex`
-- ----------------------------
DROP TABLE IF EXISTS `apex_trex`;
CREATE TABLE `apex_trex` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Client_Id` varchar(4) NOT NULL DEFAULT '' COMMENT 'jimu client Id',
  `Dr_Batch_B` varchar(2) NOT NULL DEFAULT '' COMMENT 'IA 从用户的账户输入到jimu账户  MG 从JIMU账户转到用户账户',
  `Dr_Entry` varchar(3) NOT NULL DEFAULT '' COMMENT '从用户的账户输入到jimu账户  JRL 从JIMU账户转到用户账户',
  `Dr_Acct` varchar(32) NOT NULL DEFAULT '' COMMENT '转出账户',
  `Amount` decimal(16,4) NOT NULL COMMENT '转账金额',
  `Dr_Tr1` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `Dr_Tr2` varchar(255) NOT NULL DEFAULT '' COMMENT '说明内容,格式为 "VS 7XJ-"输入账户的apexId',
  `Cr_Batch_B` varchar(2) NOT NULL DEFAULT '' COMMENT 'IA 从用户的账户输入到jimu账户  MG 从JIMU账户转到用户账户',
  `Cr_Entry` varchar(3) NOT NULL DEFAULT '' COMMENT '从用户的账户输入到jimu账户  JRL 从JIMU账户转到用户账户',
  `Cr_Acct` varchar(32) NOT NULL DEFAULT '' COMMENT '转入账户',
  `Cr_Tr1` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `Cr_Tr2` varchar(255) NOT NULL DEFAULT '' COMMENT '此字段只用于免佣返现,为转入账户apexId',
  `status` int(11) DEFAULT NULL COMMENT '0 未发送，1 已经发送',
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `apex_wire_bank`
-- ----------------------------
DROP TABLE IF EXISTS `apex_wire_bank`;
CREATE TABLE `apex_wire_bank` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `UserId` int(11) NOT NULL COMMENT '用户id',
  `ApplicationId` int(11) NOT NULL COMMENT '申请美股账号id',
  `DisbursementType` varchar(255) DEFAULT NULL COMMENT '支付类型',
  `BeneficiaryName` varchar(255) DEFAULT NULL COMMENT '受益人',
  `BeneficiaryAccount` varchar(500) DEFAULT NULL COMMENT '受益人账户',
  `BeneficiaryProvince` varchar(255) DEFAULT NULL COMMENT '受益人省',
  `BeneficiaryPostalCode` varchar(255) DEFAULT NULL COMMENT '受益人邮箱',
  `BeneficiaryCity` varchar(255) DEFAULT NULL COMMENT '受益人城市',
  `BeneficiaryCountry` varchar(255) DEFAULT NULL COMMENT '受益人国家',
  `BeneficiaryAddresses` varchar(500) DEFAULT NULL COMMENT '受益人地址',
  `BeneficiaryThirdParty` tinyint(1) NOT NULL COMMENT '是否是第三方',
  `RecipientBankId` varchar(255) DEFAULT NULL COMMENT '收款行id',
  `RecipientBankType` varchar(255) DEFAULT NULL COMMENT '收款行类型',
  `RecipientBankCountry` varchar(255) DEFAULT NULL COMMENT '收款行国家',
  `RecipientBankProvince` varchar(255) DEFAULT NULL COMMENT '收款行省',
  `RecipientBankCity` varchar(255) DEFAULT NULL COMMENT '收款行省事',
  `RecipientPostalCode` varchar(255) DEFAULT NULL COMMENT '收款行邮编',
  `RecipientBankName` varchar(255) DEFAULT NULL COMMENT '收款行名称',
  `RecipientBankAdditionalInfo` varchar(500) DEFAULT NULL COMMENT '收款行额外信息',
  `CreateDate` datetime NOT NULL COMMENT '创建时间',
  `UpdateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `UpdateBy` datetime DEFAULT NULL COMMENT '更新人',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`Id`),
  KEY `Apex_Wire_UserId` (`UserId`),
  KEY `Apex_Wire_ApplicationId` (`ApplicationId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `apex_wire_log`
-- ----------------------------
DROP TABLE IF EXISTS `apex_wire_log`;
CREATE TABLE `apex_wire_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `UserId` int(11) NOT NULL COMMENT '用户id',
  `JmtId` varchar(50) NOT NULL COMMENT 'JMT_  ${UUID}',
  `ApplicationId` int(11) NOT NULL COMMENT '申请id',
  `JsonData` varchar(2000) NOT NULL COMMENT '发送的json串,缺少apexAccount',
  `CreateDate` datetime NOT NULL COMMENT '创建时间',
  `Status` varchar(255) NOT NULL COMMENT '1:申请中；2：已提交；3：积木拒绝；4：apex拒绝；5：已取消；6：已退回；7：已转出；',
  `Success` tinyint(1) DEFAULT NULL COMMENT '调用apex是否成功',
  `Msg` varchar(2000) DEFAULT NULL COMMENT '返回信息',
  `TransferId` varchar(255) DEFAULT NULL COMMENT '电汇提现的id（apex）',
  `SignatureUrl` varchar(500) NOT NULL COMMENT '签名地址',
  `tradie_status` int(11) DEFAULT '0' COMMENT '是否同步Tradie WS,0为未同步，1为已经同步',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `apex_wire_log_jmtid` (`JmtId`),
  KEY `apex_wire_log_applicationId` (`ApplicationId`) USING BTREE,
  KEY `apex_wire_log_status` (`Status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1089 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `apex_wire_status_log`
-- ----------------------------
DROP TABLE IF EXISTS `apex_wire_status_log`;
CREATE TABLE `apex_wire_status_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `TRANSFER_ID` varchar(255) NOT NULL COMMENT 'JMT_${uuid}',
  `OLD_STATUS` varchar(255) NOT NULL COMMENT '旧的状态',
  `NEW_STATUS` varchar(255) NOT NULL COMMENT '新的状态',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27628 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bank_swift`
-- ----------------------------
DROP TABLE IF EXISTS `bank_swift`;
CREATE TABLE `bank_swift` (
  `id` int(11) NOT NULL COMMENT 'id',
  `BankorInst` varchar(71) DEFAULT NULL COMMENT '银行名称（英）',
  `City` varchar(14) DEFAULT NULL COMMENT '城市（英）',
  `ProvinceName` varchar(8) DEFAULT NULL COMMENT '省',
  `CityName` varchar(8) DEFAULT NULL COMMENT '城市',
  `Branch` varchar(255) DEFAULT NULL COMMENT '地址',
  `SwiftCode` varchar(11) DEFAULT NULL COMMENT '银行代码',
  `BranchName` varchar(20) DEFAULT NULL COMMENT '分行名称',
  `BankName` varchar(16) DEFAULT NULL COMMENT '银行名称',
  `Address` varchar(255) DEFAULT NULL COMMENT '地址',
  `Postcode` int(11) DEFAULT NULL COMMENT '邮编',
  UNIQUE KEY `bank_swift_code` (`SwiftCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `beta_user`
-- ----------------------------
DROP TABLE IF EXISTS `beta_user`;
CREATE TABLE `beta_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `us_application_id` int(11) NOT NULL,
  `apex_account_id` varchar(64) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL COMMENT '1为未导入，2为已经导入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cashback`
-- ----------------------------
DROP TABLE IF EXISTS `cashback`;
CREATE TABLE `cashback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `apex_account_id` varchar(11) DEFAULT NULL,
  `process_date` date DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL COMMENT '返现金额',
  `status` int(11) DEFAULT NULL COMMENT '0返现金额已经生成，但未真实返现。 1已经返现',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cashback_type` int(11) DEFAULT NULL COMMENT '返现类型 1 佣金返现，2 新手任务返现 3 推荐人返现',
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`process_date`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cashback_type`
-- ----------------------------
DROP TABLE IF EXISTS `cashback_type`;
CREATE TABLE `cashback_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_number` varchar(20) NOT NULL COMMENT '佣金劵序列号',
  `amount` decimal(16,4) NOT NULL COMMENT '佣金劵金额',
  `currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT '金额单位：0：美元，1：人民币',
  `use_expired_date` date NOT NULL COMMENT '使用的截止日期',
  `activate_expired_date` date NOT NULL COMMENT '激活的截止日期',
  `create_time` datetime NOT NULL COMMENT '佣金劵的创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '佣金劵状态：0：可用，1:已用',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '积木用户ID',
  `activate_time` datetime DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_number` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `coupon_change_log`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_change_log`;
CREATE TABLE `coupon_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `change_amount` decimal(16,4) NOT NULL COMMENT '变动金额',
  `occur_time` datetime NOT NULL COMMENT '变动发生时间',
  `change_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '变动的类型：0：交易，1:佣金劵',
  `detail_id` varchar(255) NOT NULL DEFAULT '' COMMENT '详情ID，当类型为coupon时，该字段存储序列号，当为trade时，存储orderId',
  `apex_account_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'APEX账户ID，当类型为trade时，该值为必填。',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `debt_change_log`
-- ----------------------------
DROP TABLE IF EXISTS `debt_change_log`;
CREATE TABLE `debt_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT 'jimu id',
  `change_amount` decimal(16,4) NOT NULL COMMENT '此次变动金额',
  `after_change_amount` decimal(16,4) NOT NULL COMMENT '变化之后负债金额',
  `description` varchar(255) DEFAULT NULL COMMENT '变动说明',
  `create_time` datetime NOT NULL COMMENT '扣除时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ext582`
-- ----------------------------
DROP TABLE IF EXISTS `ext582`;
CREATE TABLE `ext582` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_number` char(12) DEFAULT NULL COMMENT 'Customer Account Number with firm number and dash prepended',
  `office_code` char(3) DEFAULT NULL COMMENT 'Office/Branch code related to the account',
  `registered_rep_code` char(3) DEFAULT NULL COMMENT 'Code to identify registered rep for the account',
  `entry_type_code` char(2) DEFAULT NULL COMMENT 'BatchCode & EntryCode',
  `currency_code` char(3) DEFAULT NULL COMMENT 'Currency code for the transaction',
  `amount` decimal(28,10) DEFAULT NULL COMMENT 'Cash Transaction Amount',
  `description` varchar(30) DEFAULT NULL COMMENT 'Transaction Description',
  `process_date` date DEFAULT NULL COMMENT 'Date the transaction was processed.',
  `account_type` char(1) DEFAULT NULL COMMENT 'Account type bucket within an account',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ext869`
-- ----------------------------
DROP TABLE IF EXISTS `ext869`;
CREATE TABLE `ext869` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `AccountNumber` char(12) DEFAULT NULL,
  `AccountType` char(1) DEFAULT NULL,
  `Amount` decimal(28,10) DEFAULT NULL,
  `Description` varchar(30) DEFAULT NULL,
  `CurrencyCode` char(3) DEFAULT NULL,
  `ProcessDate` date DEFAULT NULL,
  `ProcessDateStr` char(10) DEFAULT NULL,
  `BatchCode` char(3) DEFAULT NULL,
  `Cusip` char(12) DEFAULT NULL,
  `EntryDate` date DEFAULT NULL,
  `EntryDateStr` varchar(10) DEFAULT NULL,
  `SourceProgram` char(6) DEFAULT NULL,
  `UserID` char(8) DEFAULT NULL,
  `ActivityIndicator` char(1) DEFAULT NULL,
  `OfficeCode` char(3) DEFAULT NULL,
  `ACATSControlNumber` char(14) DEFAULT NULL,
  `ActionCode` char(1) DEFAULT NULL,
  `CheckNumber` char(5) DEFAULT NULL,
  `ContraAccountNumber` char(12) DEFAULT NULL,
  `ContraAccountTypeCode` char(1) DEFAULT NULL,
  `ContraCurrencyCode` char(3) DEFAULT NULL,
  `CorrWindowCode` char(1) DEFAULT NULL,
  `CurrentPaydownFactor` decimal(9,8) DEFAULT NULL,
  `DivTaxTypeCode` char(1) DEFAULT NULL,
  `DTCNumber` char(4) DEFAULT NULL,
  `DTCNumberExp` char(4) DEFAULT NULL,
  `EffectiveDate` date DEFAULT NULL,
  `EffectiveDateStr` varchar(10) DEFAULT NULL,
  `EnteredBy` char(3) DEFAULT NULL,
  `EntryTypeCode` char(2) DEFAULT NULL,
  `FeeIndicator` char(1) DEFAULT NULL,
  `Firm` char(2) DEFAULT NULL,
  `ForeignCode` char(1) DEFAULT NULL,
  `FundsUserCode` char(2) DEFAULT NULL,
  `GLPostStatusCode` char(1) DEFAULT NULL,
  `HistoryEntryCode` char(1) DEFAULT NULL,
  `InterestEffectiveDate` date DEFAULT NULL,
  `InterestEffectiveDateStr` varchar(10) DEFAULT NULL,
  `LastPaydownFactor` decimal(9,8) DEFAULT NULL,
  `MDHIndicator` char(1) DEFAULT NULL,
  `MergeEntryCode` char(1) DEFAULT NULL,
  `MAgentIndicator` char(1) DEFAULT NULL,
  `MoneyMarketCode` char(3) DEFAULT NULL,
  `MutualFundPostIndicator` char(1) DEFAULT NULL,
  `OriginalQuantity` decimal(19,5) DEFAULT NULL,
  `OverrideIndicator` char(1) DEFAULT NULL,
  `PasMergeEntryCode` char(1) DEFAULT NULL,
  `PayTypeCode` char(1) DEFAULT NULL,
  `Price` decimal(19,10) DEFAULT NULL,
  `RecTypeCode` char(1) DEFAULT NULL,
  `RegisteredRepCode` char(3) DEFAULT NULL,
  `RRCategoryCode` smallint(6) DEFAULT NULL,
  `SequenceNumber` int(11) DEFAULT NULL,
  `SMAChangeAmount` decimal(28,10) DEFAULT NULL,
  `StatementIndicator` char(1) DEFAULT NULL,
  `StatusCode` char(1) DEFAULT NULL,
  `TaxOverrideCode` char(1) DEFAULT NULL,
  `TaxYear` char(10) DEFAULT NULL,
  `TerminalID` char(15) DEFAULT NULL,
  `ThirdPartyCode` char(1) DEFAULT NULL,
  `TradeDate` char(10) DEFAULT NULL,
  `Tradenumber` char(5) DEFAULT NULL,
  `UserEntryDate` date DEFAULT NULL,
  `UserEntryDateStr` varchar(10) DEFAULT NULL,
  `WireFundsCode` char(1) DEFAULT NULL,
  `WithholdTaxIndicator` char(1) DEFAULT NULL,
  `WithholdTaxTypeCode` char(1) DEFAULT NULL,
  `CorrespondentOfficeID` int(11) DEFAULT NULL,
  `CorrespondentID` int(11) DEFAULT NULL,
  `RegisteredRepCode2` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ext869_ix1` (`AccountNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=5177 DEFAULT CHARSET=utf8 COMMENT='现金变动表';

-- ----------------------------
--  Table structure for `ext872`
-- ----------------------------
DROP TABLE IF EXISTS `ext872`;
CREATE TABLE `ext872` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AccountNumber` varchar(13) NOT NULL COMMENT 'AccountNumber',
  `ProcessDate` datetime NOT NULL COMMENT 'ProcessDate',
  `Firm` varchar(4) NOT NULL COMMENT 'Firm ',
  `CorrespondentID` varchar(17) NOT NULL COMMENT 'CorrespondentID',
  `CorrespondentOfficeID` varchar(23) NOT NULL COMMENT 'CorrespondentOfficeID',
  `CorrespondentCode` varchar(23) NOT NULL COMMENT 'CorrespondentCode',
  `OfficeCode` varchar(11) NOT NULL COMMENT 'OfficeCode',
  `RegisteredRepCode` varchar(19) NOT NULL COMMENT 'RegisteredRepCode ',
  `AccountType` varchar(13) NOT NULL COMMENT 'AccountType',
  `BuySellCode` varchar(13) NOT NULL COMMENT 'BuySellCode',
  `TradeDate` datetime NOT NULL COMMENT 'TradeDate ',
  `TradeNumber` varchar(15) NOT NULL COMMENT 'TradeNumber ',
  `ExecutionTime` varchar(15) NOT NULL COMMENT 'ExecutionTime',
  `Cusip` varchar(12) NOT NULL COMMENT 'Cusip',
  `Symbol` varchar(35) NOT NULL COMMENT 'Symbol ',
  `Quantity` varchar(40) NOT NULL COMMENT 'Quantity',
  `Price` varchar(40) NOT NULL COMMENT 'Price ',
  `MarketCode` varchar(12) NOT NULL COMMENT 'MarketCode',
  `CapacityCode` varchar(14) NOT NULL COMMENT 'CapacityCode ',
  `CommissionGrossCalculated` varchar(50) NOT NULL COMMENT 'CommissionGrossCalculated',
  `CommissionGrossEntered` varchar(40) NOT NULL COMMENT 'CommissionGrossEntered ',
  `SettlementDate` datetime NOT NULL COMMENT 'SettlementDate ',
  `CurrencyCode` varchar(14) NOT NULL COMMENT 'CurrencyCode',
  `PrincipalAmount` varchar(50) NOT NULL COMMENT 'PrincipalAmount',
  `NetAmount` varchar(50) NOT NULL COMMENT 'NetAmount',
  `FeeSec` varchar(50) NOT NULL COMMENT 'FeeSec',
  `FeeMisc` varchar(50) NOT NULL COMMENT 'FeeMisc',
  `Fee1` varchar(50) NOT NULL COMMENT 'Fee1 ',
  `Fee2` varchar(50) NOT NULL COMMENT 'Fee2',
  `Fee3` varchar(50) NOT NULL COMMENT 'Fee3 ',
  `Fee4` varchar(50) NOT NULL COMMENT 'Fee4 ',
  `Fee5` varchar(50) NOT NULL COMMENT 'Fee5 ',
  `EntryDate` datetime NOT NULL COMMENT 'EntryDate',
  `ShortDescription` varchar(18) NOT NULL COMMENT 'ShortDescription ',
  `TrailerCode` varchar(13) NOT NULL COMMENT 'TrailerCode ',
  `TradeIntrest` varchar(20) NOT NULL COMMENT 'TradeIntrest',
  `ExecutingBrokerBack` varchar(21) NOT NULL COMMENT 'ExecutingBrokerBack ',
  `SecurityTypeCode` varchar(18) NOT NULL COMMENT 'SecurityTypeCode',
  `CommissionRRCategory` varchar(22) NOT NULL COMMENT 'CommissionRRCategory',
  `Reallowance` varchar(20) NOT NULL COMMENT 'Reallowance ',
  `CommissionEntered` varchar(50) NOT NULL COMMENT 'CommissionEntered',
  `ShortName` varchar(11) NOT NULL COMMENT 'ShortName ',
  `Factor` varchar(20) NOT NULL COMMENT 'Factor ',
  `CommissionNet` varchar(20) NOT NULL COMMENT 'CommissionNet',
  `Trailer` varchar(35) NOT NULL COMMENT 'Trailer',
  `ExecutingBrokerFront` varchar(22) NOT NULL COMMENT 'ExecutingBrokerFront',
  `FeeMF` varchar(20) NOT NULL COMMENT 'FeeMF',
  `ClearingSymbol` varchar(35) NOT NULL COMMENT 'ClearingSymbol ',
  `Repo` varchar(20) NOT NULL COMMENT 'Repo ',
  `Description1` varchar(30) NOT NULL COMMENT 'Description1 ',
  `SecuritySubType` varchar(17) NOT NULL COMMENT 'SecuritySubType',
  `InstructionsTradeLegendCode` varchar(29) NOT NULL COMMENT 'InstructionsTradeLegendCode',
  `Country` varchar(70) NOT NULL COMMENT 'Country',
  `ISIN` varchar(35) NOT NULL COMMENT 'ISIN ',
  `LanguageID` varchar(12) NOT NULL COMMENT 'LanguageID',
  `InstructionsSpecial1` varchar(22) NOT NULL COMMENT 'InstructionsSpecial1',
  `InstructionsSpecial2` varchar(22) NOT NULL COMMENT 'InstructionsSpecial2',
  `OriginalTradeNumber` varchar(21) NOT NULL COMMENT 'OriginalTradeNumber ',
  `TradeLegendCode` varchar(29) NOT NULL COMMENT 'TradeLegendCode',
  `OptionSymbolRoot` varchar(18) NOT NULL COMMENT 'OptionSymbolRoot',
  `DisplaySymbol` varchar(50) NOT NULL COMMENT 'DisplaySymbol',
  `StrikePrice` varchar(20) NOT NULL COMMENT 'StrikePrice',
  `CallPut` varchar(9) NOT NULL COMMENT 'CallPut',
  `ExpirationDeliveryDate` datetime NOT NULL COMMENT 'ExpirationDeliveryDate',
  `OptionContractDate` datetime NOT NULL COMMENT 'OptionContractDate',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Trade Activity';

-- ----------------------------
--  Table structure for `ext981`
-- ----------------------------
DROP TABLE IF EXISTS `ext981`;
CREATE TABLE `ext981` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `OvernightBuyingPowerID` int(11) DEFAULT NULL,
  `AccountNumber` char(12) DEFAULT NULL,
  `Firm` char(2) DEFAULT NULL,
  `OfficeCode` char(3) DEFAULT NULL,
  `CorrespondentCode` char(4) DEFAULT NULL,
  `ProcessDate` datetime DEFAULT NULL,
  `CurrencyCode` char(3) DEFAULT NULL,
  `TotalEquity` decimal(28,10) DEFAULT NULL,
  `MarginEquity` decimal(28,10) DEFAULT NULL,
  `MarginRequirement` decimal(28,10) DEFAULT NULL,
  `MarginExcessEquity` decimal(28,10) DEFAULT NULL,
  `CashEquity` decimal(28,10) DEFAULT NULL,
  `CashRequirement` decimal(28,10) DEFAULT NULL,
  `CashExcessEquity` decimal(28,10) DEFAULT NULL,
  `MarginRequirementWithConcentration` decimal(28,10) DEFAULT NULL,
  `MarginExcessEquityWithConcentration` decimal(28,10) DEFAULT NULL,
  `OvernightBuyingPowerCalculated` decimal(28,10) DEFAULT NULL,
  `OvernightBuyingPowerIssued` decimal(28,10) DEFAULT NULL,
  `DayTradeBuyingPowerIssued` decimal(28,10) DEFAULT NULL,
  `RegTBuyingPowerCalculated` decimal(28,10) DEFAULT NULL,
  `RegTBuyingPowerIssued` decimal(28,10) DEFAULT NULL,
  `OvernightFactorCalculated` decimal(28,10) DEFAULT NULL,
  `OvernightFactorIssued` decimal(28,10) DEFAULT NULL,
  `DayTradeFactorCalculated` decimal(28,10) DEFAULT NULL,
  `DayTradeFactorIssued` decimal(28,10) DEFAULT NULL,
  `MarginEquityPercent` decimal(28,10) DEFAULT NULL,
  `PositionMarketValue` decimal(28,10) DEFAULT NULL,
  `LongEquityMarketValue` decimal(28,10) DEFAULT NULL,
  `ShortEquityMarketValue` decimal(28,10) DEFAULT NULL,
  `LongOptionMarketValue` decimal(28,10) DEFAULT NULL,
  `ShortOptionMarketValue` decimal(28,10) DEFAULT NULL,
  `TotalTradeBalance` decimal(28,10) DEFAULT NULL,
  `TotalSettleBalance` decimal(28,10) DEFAULT NULL,
  `CashTradeBalance` decimal(28,10) DEFAULT NULL,
  `MarginTradeBalance` decimal(28,10) DEFAULT NULL,
  `ShortTradeBalance` decimal(28,10) DEFAULT NULL,
  `MoneyMarketTradeBalance` decimal(28,10) DEFAULT NULL,
  `CashSettleBalance` decimal(28,10) DEFAULT NULL,
  `MarginSettleBalance` decimal(28,10) DEFAULT NULL,
  `ShortSettleBalance` decimal(28,10) DEFAULT NULL,
  `MoneyMarketSettleBalance` decimal(28,10) DEFAULT NULL,
  `FreeCash` decimal(28,10) DEFAULT NULL,
  `SMA` decimal(28,10) DEFAULT NULL,
  `AvailableToWithdraw` decimal(28,10) DEFAULT NULL,
  `FutureBalance` decimal(28,10) DEFAULT NULL,
  `FutureEquity` decimal(28,10) DEFAULT NULL,
  `FutureRequirement` decimal(28,10) DEFAULT NULL,
  `OptionsRequirement` decimal(28,10) DEFAULT NULL,
  `NonOptionsRequirement` decimal(28,10) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  `NonOptionsRequirementNotConcentrated` decimal(28,10) DEFAULT NULL,
  `TypeIUnavailableCashProceeds` decimal(28,10) DEFAULT NULL,
  `TypeIIUnavailableCashProceeds` decimal(28,10) DEFAULT NULL,
  `NetBalance` decimal(28,10) DEFAULT NULL,
  `SMACommitted` decimal(28,10) DEFAULT NULL,
  `HighWaterMark` decimal(28,10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ext981_ix1` (`AccountNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=36047 DEFAULT CHARSET=utf8 COMMENT='买入结算';

-- ----------------------------
--  Table structure for `ext982`
-- ----------------------------
DROP TABLE IF EXISTS `ext982`;
CREATE TABLE `ext982` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `AccountNumber` char(12) DEFAULT NULL,
  `Firm` char(2) DEFAULT NULL,
  `StrategyId` int(11) DEFAULT NULL,
  `StrategySequence` int(11) DEFAULT NULL,
  `AccountType` char(12) DEFAULT NULL,
  `CUSIP` char(12) DEFAULT NULL,
  `TradeQuantity` decimal(28,10) DEFAULT NULL,
  `Symbol` varchar(35) DEFAULT NULL,
  `Description` varchar(40) DEFAULT NULL,
  `ClosingPrice` decimal(28,10) DEFAULT NULL,
  `MarketValue` decimal(28,10) DEFAULT NULL,
  `SecurityTypeCode` char(50) DEFAULT NULL,
  `UnderlyingSymbol` char(50) DEFAULT NULL,
  `StrikePrice` decimal(28,10) DEFAULT NULL,
  `ISIN` char(12) DEFAULT NULL,
  `ChangeAmount` decimal(28,10) DEFAULT NULL,
  `PositionType` char(50) DEFAULT NULL,
  `ProcessDate` datetime DEFAULT NULL,
  `IsSelling` char(1) DEFAULT NULL,
  `MaintenanceRequirement` decimal(28,10) DEFAULT NULL,
  `ConcentrationRequirement` decimal(28,10) DEFAULT NULL,
  `OptionStrategy` varchar(50) DEFAULT NULL,
  `OptionLeg` varchar(10) DEFAULT NULL,
  `StrategyMaintenanceRequirement` decimal(28,10) DEFAULT NULL,
  `StrategyConcentrationRequirement` decimal(28,10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ext982_ix1` (`AccountNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=84033 DEFAULT CHARSET=utf8 COMMENT='持仓结算';

-- ----------------------------
--  Table structure for `mandatory_action`
-- ----------------------------
DROP TABLE IF EXISTS `mandatory_action`;
CREATE TABLE `mandatory_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `firm` char(2) DEFAULT NULL COMMENT 'Unique Identifier of brokerage client',
  `cusip` char(12) DEFAULT NULL COMMENT 'External Identifier of the New/Receiving Security involved in the Corporate Action',
  `cusip_old` char(12) DEFAULT NULL COMMENT 'External Identifier of the Old/Delivering Security involved in the Corporate Action',
  `symbol` char(12) DEFAULT NULL COMMENT 'Ticker Symbol of the New/Receiving Security involved in the Corporate Action',
  `symbol_old` char(12) DEFAULT NULL COMMENT 'Ticker Symbol of the Old/Delivering Security involved in the Corporate Action',
  `short_description` char(15) DEFAULT NULL COMMENT 'First 15 characters of the first line of the security description of the New/Receiving Security involved in the Corporate Action',
  `short_description_old` char(15) DEFAULT NULL COMMENT 'First 15 characters of the first line of the security description of the Old/Delivering Security involved in the Corporate Action',
  `isin` char(12) DEFAULT NULL COMMENT 'External Identifier of the New/Receiving Security involved in the Corporate Action',
  `expiration_date` datetime DEFAULT NULL COMMENT 'ExpirationDate of the announcement.  N/A for Mandatory Corporate Actions',
  `process_date` datetime DEFAULT NULL COMMENT 'Date on which the Corporate Action Announcement was entered into the system.',
  `to_market` char(8) DEFAULT NULL COMMENT 'The Exchange on which the New/Receiving Securitiy is listed',
  `from_market` char(8) DEFAULT NULL COMMENT 'The Exchange on which the Old/Delivering Securitiy is listed',
  `country_code` char(2) DEFAULT NULL COMMENT 'CountryCode of Security Issue of New/Receiving Security involved in the Corporate Action',
  `country_code_old` char(2) DEFAULT NULL COMMENT 'CountryCode of Security Issue of Old/Delivering Security involved in the Corporate Action',
  `stock_factor` decimal(28,10) DEFAULT NULL COMMENT 'The rate used to determine number of shares received',
  `cash_factor` decimal(28,10) DEFAULT NULL COMMENT 'The rate used to determine the dollar amount received',
  `payable_date` datetime DEFAULT NULL COMMENT 'The date on which dividends are distributed',
  `settlement_date` datetime DEFAULT NULL COMMENT 'The date on which dividend distributions are settled in the account (typically 3 business days after PayableDate)',
  `last_change_date` datetime DEFAULT NULL COMMENT 'The most recent date that the corporate action entry was updated',
  `corporate_action` varchar(50) DEFAULT NULL COMMENT 'A short description of the type of CorporateAction listed:\nSymbol Change\nReorg\nStock Split\nSpinoff\nMarket Change\nStock Merger\nReverse Split\nName Change\nCash Merger\nCusip Change\nStock Dividend',
  `corporate_action_message` varchar(4000) DEFAULT NULL COMMENT 'The Corporate Action announcement details provided by the vendor',
  `record_date` datetime DEFAULT NULL COMMENT 'The date on which positions are recorded in order to calculate entitlement',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `margin_call_250`
-- ----------------------------
DROP TABLE IF EXISTS `margin_call_250`;
CREATE TABLE `margin_call_250` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_number` char(12) DEFAULT NULL COMMENT 'Customer Account Number',
  `account_name` varchar(40) DEFAULT NULL COMMENT 'Account Holder Name',
  `call_amount` decimal(28,10) DEFAULT NULL COMMENT 'Dollar amount of Call',
  `call_type` char(2) DEFAULT NULL COMMENT 'Call Types',
  `trade_date` datetime DEFAULT NULL COMMENT 'Trade Date Called Issued',
  `due_date` datetime DEFAULT NULL COMMENT 'Date call becomes past due',
  `reg_tdate` datetime DEFAULT NULL COMMENT 'Date associated Fed Call is due',
  `process_date` date DEFAULT NULL COMMENT 'process Date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=948 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `name_base_dump`
-- ----------------------------
DROP TABLE IF EXISTS `name_base_dump`;
CREATE TABLE `name_base_dump` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_number` char(12) DEFAULT NULL COMMENT 'Customer Account Number',
  `record_type_code` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `record_type_sub_type_code` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `rr_index_code` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `office_code` char(3) DEFAULT NULL COMMENT 'Branch Code',
  `registered_rep_code` char(3) DEFAULT NULL COMMENT 'Registered Rep Code',
  `federal_id_indicator` char(1) DEFAULT NULL COMMENT 'Social Security, Social Insurance, Tax Identification code.',
  `tax_id_number` char(9) DEFAULT NULL COMMENT 'Tax ID number',
  `name_index` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `short_name` char(10) DEFAULT NULL COMMENT 'Short Name on Account',
  `party_index` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `related_party` char(5) DEFAULT NULL COMMENT 'When Address1-4 is DEPOSIT ACCOUNT then DEPOS, otherwise related party from detail description',
  `account_name` varchar(40) DEFAULT NULL COMMENT 'Name of account owner',
  `address_line1` varchar(40) DEFAULT NULL COMMENT 'Address Line 1 on Account',
  `address_line2` varchar(40) DEFAULT NULL COMMENT 'Address Line 2 on Account',
  `address_line3` varchar(40) DEFAULT NULL COMMENT 'Address Line 3 on Account',
  `address_line4` varchar(40) DEFAULT NULL COMMENT 'Address Line 4 on Account',
  `city` varchar(20) DEFAULT NULL COMMENT 'City',
  `state` char(2) DEFAULT NULL COMMENT 'State',
  `zip_code` char(9) DEFAULT NULL COMMENT 'ZipCode',
  `irs_control` char(4) DEFAULT NULL COMMENT 'Name control.',
  `multi_rrs` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `knd` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `map_account` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `fee` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `mm_sweep` char(1) DEFAULT NULL COMMENT 'When cash_management_cd BLANK, 0 or NULL then N else value populated with S.',
  `del` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `pay` char(1) DEFAULT NULL COMMENT 'Calculation based on sell code:\nsell code 06 = V\nsell code 07 = H\nsell code 08 = P\nsell code 09 = P\nsell code 11 = I',
  `div` char(1) DEFAULT NULL COMMENT 'Dividend code',
  `pri` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `val_cash_position` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `account_class` char(1) DEFAULT NULL COMMENT 'Account Class',
  `account_balance_category` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `print_statement` char(1) DEFAULT NULL COMMENT 'Print statement (electronic statement code)',
  `fund_principal` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `fund_interest` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `discretion` char(1) DEFAULT NULL COMMENT 'Used for IRS processing. Discretionary account indication: "Y" - yes, BLANK - "N" not coded (default).',
  `portfolio_indicator` char(1) DEFAULT NULL,
  `ira` char(1) DEFAULT NULL COMMENT 'Retirement plan code',
  `credit_interest_sweep` char(1) DEFAULT NULL COMMENT 'Cash sweep',
  `money_sweep` char(1) DEFAULT NULL COMMENT 'Cash sweep',
  `option_level` char(1) DEFAULT NULL COMMENT 'Option Level',
  `exposure` smallint(6) DEFAULT NULL COMMENT 'Amount of option exposure limit',
  `ny_tax` char(1) DEFAULT NULL COMMENT 'New York state residency',
  `state_tax` char(1) DEFAULT NULL COMMENT 'USA tax withholding (S line) indicator. WithholdingCode',
  `irs_code` char(1) DEFAULT NULL COMMENT 'USA tax withholding (S line) indicator. WithholdingCode',
  `fed_type_code` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `non_objecting` char(1) DEFAULT NULL COMMENT 'Object to disclosure code. 1 = client responded and objects to disclosure. 2 = client responded and does not object. Blank = client has not resp onded and does not object to disclosure (default).',
  `irs_exempt` char(1) DEFAULT NULL COMMENT 'USA tax withholding (S line) indicator. WithholdingCode',
  `foreign_code` char(1) DEFAULT NULL COMMENT 'If principal account owners W8 form certification has a valid date then Y, otherwise N',
  `mature` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `fund_fees` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `option_limit` smallint(6) DEFAULT NULL COMMENT 'Amount of option exposure limit',
  `forward_limit` smallint(6) DEFAULT NULL COMMENT 'NOT USED',
  `suppress_confirm` char(1) DEFAULT NULL COMMENT 'Confirm hold code.',
  `restrict_reason_code` char(1) DEFAULT NULL COMMENT 'Reason for account restriction',
  `commission_schedule` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `w8` char(1) DEFAULT NULL COMMENT 'W8 JOINT and PRINCIPAL forms on file',
  `fund_dividend` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `fund_mature` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `joint` char(1) DEFAULT NULL COMMENT 'Joint Agreement Code',
  `legal` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `margin` char(1) DEFAULT NULL COMMENT 'Margin Agreement form on file',
  `option_code` char(1) DEFAULT NULL COMMENT 'Option Trading Agreement on file',
  `corp_res` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `loan` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `np_loan` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `commodites` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `power_attorney` char(1) DEFAULT NULL COMMENT 'Indication that power of attorney papers are on file.',
  `int_futures` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `cur_futures` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `seg_code` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `pub_entity` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `trade_authorize` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `trade_account_authorize` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `forward_del` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `repo` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `customer` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `risk_disclose` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `non_cash_disclose` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `hedge_letter` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `unsolicited` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `partnership` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `sole_owner` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `fed_funds` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `safe_keeping` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `ach` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `mas` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `dvp` char(1) DEFAULT NULL,
  `disclosure_statement` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `sweep` char(1) DEFAULT NULL COMMENT 'When cash management code is BLANK then BLANK, when cash management code is Z then N everything else is Y',
  `fund_rate_class` char(2) DEFAULT NULL COMMENT 'NOT USED',
  `sic_code` char(4) DEFAULT NULL COMMENT 'NOT USED',
  `user_code1` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `user_code2` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `user_code3` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `user_code4` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `user_code5` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `user_code6` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `instituion` char(5) DEFAULT NULL COMMENT 'Institutional/DTC account number',
  `agent_bank` char(5) DEFAULT NULL COMMENT 'Institutional/DTC account number',
  `customer_account` char(12) DEFAULT NULL COMMENT 'NOT USED',
  `aba_number` char(9) DEFAULT NULL COMMENT 'NOT USED',
  `alternate_account_typea` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `aba_numberb` char(9) DEFAULT NULL COMMENT 'NOT USED',
  `alternate_account_typeb` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `telco_extension1` char(4) DEFAULT NULL COMMENT 'Phone extension code (2)',
  `telco_extension2` char(4) DEFAULT NULL COMMENT 'Phone extension code (1)',
  `restr_date` datetime DEFAULT NULL COMMENT 'Restriction end date',
  `open_d_date` datetime DEFAULT NULL COMMENT 'Record open date',
  `last_change_date` datetime DEFAULT NULL COMMENT 'Record change date',
  `last_activty_date` datetime DEFAULT NULL COMMENT 'Record last activity date',
  `last_trade_date` datetime DEFAULT NULL COMMENT 'NOT USED',
  `stock_borrow_loan` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `inventory_carry_type` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `number_id` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `address_indicator` char(1) DEFAULT NULL COMMENT 'Indicator of which Address Line the physical address will start in.',
  `telco_code1` char(1) DEFAULT NULL COMMENT 'Code for Telephone 1',
  `telco_code2` char(1) DEFAULT NULL COMMENT 'Code for Telephone 2',
  `telco_area_code1` char(3) DEFAULT NULL COMMENT 'Area Code for Telephone 1',
  `telco_exchange1` char(3) DEFAULT NULL COMMENT 'Area Exchange for Telephone 1',
  `telco_base1` char(4) DEFAULT NULL COMMENT 'Area Base for Telephone 1',
  `telco_area_code2` char(3) DEFAULT NULL COMMENT 'Area Code for Telephone 2',
  `telco_exchange2` char(3) DEFAULT NULL COMMENT 'Area Exchange for Telephone 2',
  `telco_base2` char(4) DEFAULT NULL COMMENT 'Area Base for Telephone 2',
  `day_trade_counter` smallint(6) DEFAULT NULL COMMENT 'NOT USED',
  `old_system_account_number` char(10) DEFAULT NULL,
  `alternate_accountb` char(12) DEFAULT NULL COMMENT 'NOT USED',
  `alternate_accounta` char(12) DEFAULT NULL COMMENT 'NOT USED',
  `closed_date` datetime DEFAULT NULL COMMENT 'Date the account was closed',
  `pre_eff_ayy` datetime DEFAULT NULL COMMENT 'NOT USED',
  `pre_eff_byy` datetime DEFAULT NULL COMMENT 'NOT USED',
  `tefra_change_yy` datetime DEFAULT NULL COMMENT 'Last date the accounts tefra was changed',
  `bank_fail_report` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `issuer_status` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `arb_code` char(1) DEFAULT NULL COMMENT 'NOT USED',
  `process_date` datetime DEFAULT NULL COMMENT 'Date of the report',
  `account_nature` char(2) DEFAULT NULL COMMENT 'Apex Account Nature for Account',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1030 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `portfolio_plan_log`
-- ----------------------------
DROP TABLE IF EXISTS `portfolio_plan_log`;
CREATE TABLE `portfolio_plan_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '积木平台用户ID',
  `tradier_user_id` varchar(255) NOT NULL COMMENT 'tradier用户ID',
  `tradier_account_id` varchar(255) NOT NULL COMMENT 'tradier账户ID',
  `us_account_id` int(11) NOT NULL COMMENT '积木用户ID',
  `stock_code` varchar(30) NOT NULL COMMENT '股票代码',
  `entrust_price` decimal(16,4) NOT NULL COMMENT '委托价格',
  `entrust_amount` int(11) NOT NULL COMMENT '委托数量',
  `trade_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '委托类型：1，买。2，卖。',
  `order_id` int(11) NOT NULL COMMENT '交易委托代码',
  `entrust_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间',
  `expected_commission` decimal(16,4) NOT NULL COMMENT '预计佣金',
  `portfolio_plan_id` int(11) NOT NULL COMMENT '活动ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8 COMMENT='交易记录';

-- ----------------------------
--  Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL DEFAULT '0',
  `question` varchar(768) DEFAULT NULL,
  `english_question` varchar(768) DEFAULT NULL,
  `qOrder` int(11) DEFAULT NULL,
  `qType` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `appField` varchar(300) DEFAULT NULL,
  `question_category` int(11) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `expression` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `question_bak`
-- ----------------------------
DROP TABLE IF EXISTS `question_bak`;
CREATE TABLE `question_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL COMMENT '风险调查问题',
  `qOrder` int(11) NOT NULL COMMENT '问题顺序',
  `qType` int(11) NOT NULL COMMENT '问题类型',
  `parentId` int(11) DEFAULT NULL COMMENT '父问题',
  `appField` varchar(100) DEFAULT NULL COMMENT '对应apex字段',
  `title` varchar(100) DEFAULT NULL COMMENT '题目',
  `expression` varchar(500) DEFAULT NULL COMMENT '表达式',
  PRIMARY KEY (`id`),
  KEY `question_qtype` (`qType`) USING BTREE,
  KEY `question_parentId` (`parentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='用户风险调查';

-- ----------------------------
--  Table structure for `question_gb`
-- ----------------------------
DROP TABLE IF EXISTS `question_gb`;
CREATE TABLE `question_gb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL COMMENT '风险调查问题',
  `qOrder` int(11) NOT NULL COMMENT '问题顺序',
  `qType` int(11) NOT NULL COMMENT '问题类型',
  `parentId` int(11) DEFAULT NULL COMMENT '父问题',
  `appField` varchar(100) DEFAULT NULL COMMENT '对应apex字段',
  `title` varchar(100) DEFAULT NULL COMMENT '题目',
  `expression` varchar(500) DEFAULT NULL COMMENT '表达式',
  `question_category` int(11) NOT NULL DEFAULT '0' COMMENT '问题种类. 0美股开户使用(包括ssn/身份证), 1代表智能投顾使用',
  `english_question` varchar(200) NOT NULL DEFAULT '' COMMENT '英文问题',
  `english_title` varchar(200) NOT NULL DEFAULT '' COMMENT '英文提示',
  `sub_category` varchar(100) NOT NULL DEFAULT '' COMMENT '问题分类',
  `question_id` varchar(100) NOT NULL COMMENT 'question表的逻辑id',
  PRIMARY KEY (`id`),
  KEY `idx_qtype` (`qType`) USING BTREE,
  KEY `idx_parentId` (`parentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='用户风险调查';

-- ----------------------------
--  Table structure for `question_option`
-- ----------------------------
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option` (
  `id` int(11) NOT NULL DEFAULT '0',
  `optionValue` varchar(768) DEFAULT NULL,
  `english_value` varchar(768) DEFAULT NULL,
  `optionOrder` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `apexValue` varchar(768) DEFAULT NULL,
  `expression` varchar(3072) DEFAULT NULL,
  `behavior` int(11) DEFAULT NULL,
  `risk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionId` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `question_option_cn`
-- ----------------------------
DROP TABLE IF EXISTS `question_option_cn`;
CREATE TABLE `question_option_cn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optionValue` varchar(256) NOT NULL COMMENT '选项名称',
  `englishValue` varchar(256) DEFAULT NULL,
  `optionOrder` int(11) NOT NULL,
  `questionId` int(11) NOT NULL COMMENT '问题ID',
  `apexValue` varchar(256) DEFAULT NULL COMMENT '提交apex值',
  `expression` varchar(500) DEFAULT NULL COMMENT '表达式',
  `behavior` int(11) DEFAULT NULL,
  `risk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_option_optionValue` (`optionValue`(255)) USING BTREE,
  KEY `question_option_questionId` (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8 COMMENT='用户风险调查问卷大选项';

-- ----------------------------
--  Table structure for `question_option_gb`
-- ----------------------------
DROP TABLE IF EXISTS `question_option_gb`;
CREATE TABLE `question_option_gb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optionValue` varchar(256) NOT NULL COMMENT '选项名称',
  `optionOrder` int(11) NOT NULL,
  `questionId` int(11) NOT NULL COMMENT '问题ID',
  `apexValue` varchar(256) DEFAULT NULL COMMENT '提交apex值',
  `expression` varchar(500) DEFAULT NULL COMMENT '表达式',
  `english_value` varchar(256) NOT NULL DEFAULT '' COMMENT '英文选项',
  `option_id` int(11) NOT NULL COMMENT 'option表的逻辑id',
  PRIMARY KEY (`id`),
  KEY `idx_optionValue` (`optionValue`(100)) USING BTREE,
  KEY `idx_questionId` (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COMMENT='用户风险调查问卷大选项';

-- ----------------------------
--  Table structure for `ra_account_daily_pnl_history`
-- ----------------------------
DROP TABLE IF EXISTS `ra_account_daily_pnl_history`;
CREATE TABLE `ra_account_daily_pnl_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) NOT NULL COMMENT 'jimu id',
  `oms_account_id` varchar(255) NOT NULL COMMENT 'oms账户id',
  `pnl_date` date NOT NULL COMMENT '盈亏日期',
  `cost_basic` decimal(16,4) NOT NULL COMMENT '入金金额-成本',
  `total_assets` decimal(16,4) NOT NULL COMMENT '总资产',
  `daily_percent_change` decimal(16,4) NOT NULL COMMENT '盈亏百分百',
  `created_time` datetime NOT NULL COMMENT '记录创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_omsAccountId_pnlDate` (`oms_account_id`,`pnl_date`) USING BTREE,
  KEY `idx_userId` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='智能投顾用户每日持仓盈亏历史';

-- ----------------------------
--  Table structure for `ra_fund_transfer`
-- ----------------------------
DROP TABLE IF EXISTS `ra_fund_transfer`;
CREATE TABLE `ra_fund_transfer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `robo_account_id` int(11) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `from_account` varchar(32) NOT NULL DEFAULT '',
  `to_account` varchar(32) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `status` int(11) NOT NULL COMMENT '0:未转账 1:转账中 2:apex转账成功 3:转账失败 4:OMS转账成功',
  `fund_transfer_type` int(11) NOT NULL COMMENT '转账类型，0:首次入金 1:正常转账 2:退出清算',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `robo_account_id` (`robo_account_id`),
  KEY `idx_createtime` (`create_time`),
  KEY `idx_status_transfertype` (`status`,`fund_transfer_type`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ra_portfolio_model`
-- ----------------------------
DROP TABLE IF EXISTS `ra_portfolio_model`;
CREATE TABLE `ra_portfolio_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `content` longtext NOT NULL COMMENT '投资模型',
  `insert_date` datetime DEFAULT NULL COMMENT '插入日期',
  `version` bigint(20) NOT NULL COMMENT '大数据版本号',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '使用状态 0: 未使用',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ra_position_his`
-- ----------------------------
DROP TABLE IF EXISTS `ra_position_his`;
CREATE TABLE `ra_position_his` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'jimu id',
  `ra_account_id` int(11) NOT NULL COMMENT 'robot advisor account id',
  `portfolio_model_type` varchar(10) DEFAULT '',
  `position` varchar(2048) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_raaccountid` (`ra_account_id`) USING BTREE,
  KEY `idx_createtime` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ra_risk_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `ra_risk_mapping`;
CREATE TABLE `ra_risk_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '风险类型',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '权重',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '中文类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ra_transfer_plan_his`
-- ----------------------------
DROP TABLE IF EXISTS `ra_transfer_plan_his`;
CREATE TABLE `ra_transfer_plan_his` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT 'jimu id',
  `ra_account_id` int(11) DEFAULT NULL COMMENT 'robot advisor account id',
  `oms_account_id` varchar(20) DEFAULT '' COMMENT 'oms账户id',
  `portfolio_model_type` varchar(10) DEFAULT '',
  `symbol` varchar(10) DEFAULT '',
  `price` decimal(16,4) DEFAULT NULL,
  `trade_type` int(2) NOT NULL COMMENT '委托类型：0，买。1，卖。',
  `trade_amount` decimal(16,2) NOT NULL COMMENT '数量',
  `plan_type` int(2) NOT NULL COMMENT '计划类型：1，正常下单。2，微调下单',
  `status` int(2) NOT NULL COMMENT '状态:0待下单,1下单中,2下单完成3,更新持仓完成',
  `oms_group_order_id` int(20) DEFAULT '-1',
  `oms_order_id` int(20) DEFAULT '-1',
  `oms_order_status` int(11) DEFAULT '-1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=957 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ra_user_investment_info`
-- ----------------------------
DROP TABLE IF EXISTS `ra_user_investment_info`;
CREATE TABLE `ra_user_investment_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `robo_advisor_account_id` int(11) NOT NULL,
  `risk_score` int(11) NOT NULL,
  `invest_type` int(11) NOT NULL,
  `low_risk_rate` int(11) DEFAULT NULL,
  `medium_risk_rate` int(11) DEFAULT NULL,
  `high_risk_rate` int(11) DEFAULT NULL,
  `portfolio_model_type` varchar(10) DEFAULT '',
  `new_portfolio_model_type` varchar(10) DEFAULT '' COMMENT '新的投资模型,在用户确认调仓后更新到portfolio_model_type',
  `initial_fund` int(11) DEFAULT NULL,
  `position_status` int(11) DEFAULT '0' COMMENT '调仓状态 参考:RobotAdvisorInvestTypeStatusEnum类',
  `update_apex_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 不要更新，1需要更新，2更新中，3更新都完成',
  `init_fund_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 未入金  1 账号已经创建，可以入金 2 已经入金完成',
  `create_time` datetime DEFAULT NULL COMMENT '记录创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  `last_notice_time` datetime DEFAULT NULL COMMENT '投资模型变更后最后通知用户的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `robo_advisor_account_id` (`robo_advisor_account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COMMENT='投顾用户投资信息表';

-- ----------------------------
--  Table structure for `resources`
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `robot_advisor_account`
-- ----------------------------
DROP TABLE IF EXISTS `robot_advisor_account`;
CREATE TABLE `robot_advisor_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `application_id` int(11) NOT NULL COMMENT '申请id',
  `user_id` int(11) NOT NULL COMMENT 'jimu id',
  `apex_account_id` varchar(255) DEFAULT '' COMMENT 'Apex账户id',
  `apex_request_id` varchar(255) DEFAULT '' COMMENT 'Apex请求id',
  `oms_user_id` varchar(255) DEFAULT '' COMMENT 'oms用户id',
  `oms_account_id` varchar(255) DEFAULT '' COMMENT 'oms账户id',
  `account_status` tinyint(4) DEFAULT '0',
  `apex_verify_status` tinyint(4) DEFAULT NULL COMMENT 'Apex验证状态 0：未提交  1：已提交  2: 审核中 3：已通过  4：已拒绝  5：已冻结',
  `apex_original_status` varchar(30) DEFAULT '' COMMENT 'Apex原始状态',
  `reject_msg` varchar(2000) DEFAULT '' COMMENT 'Apex拒绝原因',
  `sketch_ids` varchar(1000) DEFAULT '[]' COMMENT '黑名单ID列表',
  `biz_id` varchar(255) DEFAULT NULL COMMENT '版本号(1位数字)+业务ID(2位数字)+序列(4位数字)+JIMU userId(目前6位数字)',
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `security_base`
-- ----------------------------
DROP TABLE IF EXISTS `security_base`;
CREATE TABLE `security_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cusip` char(12) DEFAULT NULL COMMENT 'Unique Identifier for a security',
  `market_symbol` char(12) DEFAULT NULL COMMENT 'External identifier of security.',
  `short_description` char(15) DEFAULT NULL COMMENT 'Line of security description text',
  `security_type_code` char(1) DEFAULT NULL COMMENT 'Security Type',
  `cmp_qual_code` char(1) DEFAULT NULL COMMENT 'SecuritySubType',
  `sec_qual_code` char(1) DEFAULT NULL COMMENT 'SecuritySubType',
  `margin_eligible_code` char(1) DEFAULT NULL COMMENT 'Code to determine marginability of issue',
  `margin100_req_code` char(1) DEFAULT NULL COMMENT 'Code to determine 100% margin requirement',
  `foreign_code` char(1) DEFAULT NULL COMMENT 'Code to determine if the issue is Canadian',
  `dtc_eligble_code` char(1) DEFAULT NULL COMMENT 'Determines if security is eligble to be held at DTC',
  `listed_market_code` char(1) DEFAULT NULL COMMENT 'ListedMarketCode',
  `book_entry_code` char(1) DEFAULT NULL COMMENT 'BookEntryCode',
  `re_org_code` char(1) DEFAULT NULL COMMENT 'Indicates security went through a corporate action',
  `product` char(4) DEFAULT NULL COMMENT 'Determines if security is a Class Stock',
  `tax_code` char(1) DEFAULT NULL COMMENT 'TaxCode',
  `closing_price` decimal(19,10) DEFAULT NULL COMMENT 'Closing Price of Security',
  `description1` varchar(30) DEFAULT NULL COMMENT 'Line 1 of Security Description',
  `description2` varchar(30) DEFAULT NULL COMMENT 'Line 2 of Security Description',
  `description3` varchar(30) DEFAULT NULL COMMENT 'Line 3 of Security Description',
  `last_change_date` char(10) DEFAULT NULL COMMENT 'Date of last change to security',
  `last_trade_date` char(10) DEFAULT NULL COMMENT 'Date of last trade to security',
  `last_price_date` char(10) DEFAULT NULL COMMENT 'Date of last price of security',
  `sic_code` char(4) DEFAULT NULL COMMENT 'SICCode',
  `foreign_country` char(2) DEFAULT NULL COMMENT 'CountryCode',
  `cmo_remic_indicator` char(1) DEFAULT NULL COMMENT 'Indicates security is a remic',
  `old_security_number` char(10) DEFAULT NULL COMMENT 'Internally generated security identifier',
  `conversion_factor` decimal(9,4) DEFAULT NULL COMMENT 'Options factor used to determine underlying share total',
  `routing` char(4) DEFAULT NULL COMMENT 'Security Exchange Code',
  `underlying_cusip` char(12) DEFAULT NULL COMMENT 'Option Equity Security Identifier',
  `strike_price` decimal(19,10) DEFAULT NULL COMMENT 'Option Strike Price',
  `expire_date` datetime DEFAULT NULL COMMENT 'Option Expiration Date',
  `process_date` datetime DEFAULT NULL COMMENT 'Batch Processing Date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `stock_activity_870`
-- ----------------------------
DROP TABLE IF EXISTS `stock_activity_870`;
CREATE TABLE `stock_activity_870` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_number` char(12) DEFAULT NULL COMMENT 'Customer Account Number',
  `currency_code` char(3) DEFAULT NULL COMMENT 'Currency code for the transaction',
  `account_type` char(1) DEFAULT NULL COMMENT 'Account type bucket within an account',
  `entry_date` date DEFAULT NULL COMMENT 'Entry Date of the transaction',
  `cusip` char(12) DEFAULT NULL COMMENT 'Unique Identifier for a security',
  `sequence_number` int(11) DEFAULT NULL COMMENT 'SYSTEM GENERATED SEQUENCE NUMBER.',
  `trade_date` date DEFAULT NULL COMMENT 'Trade Date for the Transaction',
  `tradenumber` char(5) DEFAULT NULL COMMENT 'Trade number for transaction',
  `settle_date` date DEFAULT NULL COMMENT 'Settle Date for the transaction',
  `trade_settle_basis` char(1) DEFAULT NULL COMMENT 'Receive orDeliver of securities.  R for receive, D for delivery',
  `trailer` varchar(25) DEFAULT NULL COMMENT 'Trailer associated with the trade',
  `quantity` decimal(19,5) DEFAULT NULL COMMENT 'Quantity of shares for the transaction',
  `security_type_code` char(1) DEFAULT NULL COMMENT 'Security Type',
  `entered_date` date DEFAULT NULL COMMENT 'Date of activity entering the system',
  `source_program` char(6) DEFAULT NULL COMMENT 'Source of the transaction (e.g. input screen)',
  `entry_type` char(2) DEFAULT NULL COMMENT 'batch_cd',
  `terminal_id` char(15) DEFAULT NULL COMMENT 'BPSA Batch Code + Entry Code',
  `user_id` char(8) DEFAULT NULL COMMENT 'User id, for online only',
  `issue_date` date DEFAULT NULL,
  `certificate_short_desc` varchar(25) DEFAULT NULL COMMENT 'TLE Miscellaneous test used for corporate actions, etc. Current values may include: 1) CSS KEY (DIVIDENDS/REORG) - DV PREFIX; 2) LEAPS SECURITY XREF NO - LP PREFIX ; 3) TRID M, SPIN O DATA - FOR MARGIN; 4) TRUST-FREE-RECEIVE COST-BASIS - TC PREFIX',
  `sma_change_amount` decimal(28,10) DEFAULT NULL COMMENT 'closing price of the security * .50',
  `sma_change_price` decimal(19,10) DEFAULT NULL COMMENT 'closing price of the security',
  `re_investment_amount` decimal(28,10) DEFAULT NULL COMMENT 'Total amount for reinventment transactions',
  `dtc_number_exp` char(4) DEFAULT NULL COMMENT 'Entry code for P&S transactions. Can be system generated or defined by client B1.',
  `sequence_cusip_number` char(9) DEFAULT NULL COMMENT 'ADP Number',
  `sequence_entry_date` date DEFAULT NULL COMMENT 'Date of the transaction',
  `process_date` date DEFAULT NULL COMMENT 'Date the transaction was processed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `survey_result`
-- ----------------------------
DROP TABLE IF EXISTS `survey_result`;
CREATE TABLE `survey_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usAccountId` int(11) NOT NULL COMMENT '用户ID',
  `questionId` int(11) NOT NULL,
  `optionId` int(11) DEFAULT NULL COMMENT '用户选项',
  `input` varchar(256) DEFAULT NULL COMMENT '用户输入',
  PRIMARY KEY (`id`),
  KEY `survey_result_accountId` (`usAccountId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5006 DEFAULT CHARSET=utf8 COMMENT='用户风险调查结果';

-- ----------------------------
--  Table structure for `survey_result_log`
-- ----------------------------
DROP TABLE IF EXISTS `survey_result_log`;
CREATE TABLE `survey_result_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationLogId` int(20) NOT NULL COMMENT '用户Id',
  `questionId` bigint(20) NOT NULL,
  `optionId` bigint(20) DEFAULT NULL COMMENT '用户选项',
  `input` varchar(256) DEFAULT NULL COMMENT '用户输入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17733 DEFAULT CHARSET=utf8 COMMENT='用户风险调查日志';

-- ----------------------------
--  Table structure for `trade_activity`
-- ----------------------------
DROP TABLE IF EXISTS `trade_activity`;
CREATE TABLE `trade_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AccountNumber` varchar(13) NOT NULL COMMENT 'AccountNumber',
  `ProcessDate` datetime NOT NULL COMMENT 'ProcessDate',
  `Firm` varchar(4) NOT NULL COMMENT 'Firm ',
  `CorrespondentID` varchar(17) NOT NULL COMMENT 'CorrespondentID',
  `CorrespondentOfficeID` varchar(23) NOT NULL COMMENT 'CorrespondentOfficeID',
  `CorrespondentCode` varchar(23) NOT NULL COMMENT 'CorrespondentCode',
  `OfficeCode` varchar(11) NOT NULL COMMENT 'OfficeCode',
  `RegisteredRepCode` varchar(19) NOT NULL COMMENT 'RegisteredRepCode ',
  `AccountType` varchar(13) NOT NULL COMMENT 'AccountType',
  `BuySellCode` varchar(13) NOT NULL COMMENT 'BuySellCode',
  `TradeDate` datetime NOT NULL COMMENT 'TradeDate ',
  `TradeNumber` varchar(15) NOT NULL COMMENT 'TradeNumber ',
  `ExecutionTime` varchar(15) NOT NULL COMMENT 'ExecutionTime',
  `Cusip` varchar(12) NOT NULL COMMENT 'Cusip',
  `Symbol` varchar(35) NOT NULL COMMENT 'Symbol ',
  `Quantity` varchar(40) NOT NULL COMMENT 'Quantity',
  `Price` varchar(40) NOT NULL COMMENT 'Price ',
  `MarketCode` varchar(12) NOT NULL COMMENT 'MarketCode',
  `CapacityCode` varchar(14) NOT NULL COMMENT 'CapacityCode ',
  `CommissionGrossCalculated` varchar(50) NOT NULL COMMENT 'CommissionGrossCalculated',
  `CommissionGrossEntered` varchar(40) NOT NULL COMMENT 'CommissionGrossEntered ',
  `SettlementDate` datetime NOT NULL COMMENT 'SettlementDate ',
  `CurrencyCode` varchar(14) NOT NULL COMMENT 'CurrencyCode',
  `PrincipalAmount` varchar(50) NOT NULL COMMENT 'PrincipalAmount',
  `NetAmount` varchar(50) NOT NULL COMMENT 'NetAmount',
  `FeeSec` varchar(50) NOT NULL COMMENT 'FeeSec',
  `FeeMisc` varchar(50) NOT NULL COMMENT 'FeeMisc',
  `Fee1` varchar(50) NOT NULL COMMENT 'Fee1 ',
  `Fee2` varchar(50) NOT NULL COMMENT 'Fee2',
  `Fee3` varchar(50) NOT NULL COMMENT 'Fee3 ',
  `Fee4` varchar(50) NOT NULL COMMENT 'Fee4 ',
  `Fee5` varchar(50) NOT NULL COMMENT 'Fee5 ',
  `EntryDate` datetime NOT NULL COMMENT 'EntryDate',
  `ShortDescription` varchar(18) NOT NULL COMMENT 'ShortDescription ',
  `TrailerCode` varchar(13) NOT NULL COMMENT 'TrailerCode ',
  `TradeIntrest` varchar(20) NOT NULL COMMENT 'TradeIntrest',
  `ExecutingBrokerBack` varchar(21) NOT NULL COMMENT 'ExecutingBrokerBack ',
  `SecurityTypeCode` varchar(18) NOT NULL COMMENT 'SecurityTypeCode',
  `CommissionRRCategory` varchar(22) NOT NULL COMMENT 'CommissionRRCategory',
  `Reallowance` varchar(20) NOT NULL COMMENT 'Reallowance ',
  `CommissionEntered` varchar(50) NOT NULL COMMENT 'CommissionEntered',
  `ShortName` varchar(11) NOT NULL COMMENT 'ShortName ',
  `Factor` varchar(20) NOT NULL COMMENT 'Factor ',
  `CommissionNet` varchar(20) NOT NULL COMMENT 'CommissionNet',
  `Trailer` varchar(35) NOT NULL COMMENT 'Trailer',
  `ExecutingBrokerFront` varchar(22) NOT NULL COMMENT 'ExecutingBrokerFront',
  `FeeMF` varchar(20) NOT NULL COMMENT 'FeeMF',
  `ClearingSymbol` varchar(35) NOT NULL COMMENT 'ClearingSymbol ',
  `Repo` varchar(20) NOT NULL COMMENT 'Repo ',
  `Description1` varchar(30) NOT NULL COMMENT 'Description1 ',
  `SecuritySubType` varchar(17) NOT NULL COMMENT 'SecuritySubType',
  `InstructionsTradeLegendCode` varchar(29) NOT NULL COMMENT 'InstructionsTradeLegendCode',
  `Country` varchar(70) NOT NULL COMMENT 'Country',
  `ISIN` varchar(35) NOT NULL COMMENT 'ISIN ',
  `LanguageID` varchar(12) NOT NULL COMMENT 'LanguageID',
  `InstructionsSpecial1` varchar(22) NOT NULL COMMENT 'InstructionsSpecial1',
  `InstructionsSpecial2` varchar(22) NOT NULL COMMENT 'InstructionsSpecial2',
  `OriginalTradeNumber` varchar(21) NOT NULL COMMENT 'OriginalTradeNumber ',
  `TradeLegendCode` varchar(29) NOT NULL COMMENT 'TradeLegendCode',
  `OptionSymbolRoot` varchar(18) NOT NULL COMMENT 'OptionSymbolRoot',
  `DisplaySymbol` varchar(50) NOT NULL COMMENT 'DisplaySymbol',
  `StrikePrice` varchar(20) NOT NULL COMMENT 'StrikePrice',
  `CallPut` varchar(9) NOT NULL COMMENT 'CallPut',
  `ExpirationDeliveryDate` datetime DEFAULT NULL COMMENT 'ExpirationDeliveryDate',
  `OptionContractDate` datetime DEFAULT NULL COMMENT 'OptionContractDate',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12923 DEFAULT CHARSET=utf8 COMMENT='Trade Activity,交易明细';

-- ----------------------------
--  Table structure for `trade_entrust`
-- ----------------------------
DROP TABLE IF EXISTS `trade_entrust`;
CREATE TABLE `trade_entrust` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '积木平台用户ID',
  `tradier_user_id` varchar(255) NOT NULL COMMENT 'tradier用户ID',
  `tradier_account_id` varchar(255) NOT NULL COMMENT 'tradier账户ID',
  `us_account_id` int(11) NOT NULL COMMENT '积木用户ID',
  `stock_code` varchar(30) NOT NULL COMMENT '股票代码',
  `entrust_price` decimal(16,4) NOT NULL COMMENT '委托价格',
  `entrust_amount` int(11) NOT NULL COMMENT '委托数量',
  `trade_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '委托类型：1，买。2，卖。',
  `order_type` tinyint(1) DEFAULT NULL COMMENT '订单类型:1.MARKET,3.LIMIT',
  `order_time_in_force` tinyint(1) DEFAULT NULL COMMENT '订单结单类型:1.DAY,2.GTC,3.IOC,4.GTD,5.FOK',
  `order_id` int(11) NOT NULL DEFAULT '-1' COMMENT '交易委托代码',
  `entrust_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间',
  `expected_commission` decimal(16,4) NOT NULL COMMENT '预计佣金',
  `actual_commission` decimal(16,4) DEFAULT NULL COMMENT '实际佣金',
  `order_status` tinyint(1) DEFAULT NULL COMMENT '订单状态:1待处理,2已取消,3已完成,4废单,6异常订单',
  `settle_status` tinyint(1) DEFAULT NULL COMMENT '结算状态:0未结算,1已结算',
  `message` varchar(512) DEFAULT NULL COMMENT '订单信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8 COMMENT='交易记录';

-- ----------------------------
--  Table structure for `trade_entrust_cancel`
-- ----------------------------
DROP TABLE IF EXISTS `trade_entrust_cancel`;
CREATE TABLE `trade_entrust_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '积木平台用户ID',
  `tradier_user_id` varchar(255) NOT NULL COMMENT 'tradier用户ID',
  `tradier_account_id` varchar(255) NOT NULL COMMENT 'tradier账户ID',
  `us_account_id` int(11) NOT NULL COMMENT '积木用户ID',
  `order_id` int(11) NOT NULL COMMENT '交易委托代码',
  `cancel_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '撤单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=665 DEFAULT CHARSET=utf8 COMMENT='交易撤单记录';

-- ----------------------------
--  Table structure for `transfer_log`
-- ----------------------------
DROP TABLE IF EXISTS `transfer_log`;
CREATE TABLE `transfer_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(64) NOT NULL COMMENT '金额',
  `transferType` int(11) NOT NULL COMMENT '转账类型',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `clearingAccountId` varchar(64) NOT NULL COMMENT '转账ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8 COMMENT='转账历史';

-- ----------------------------
--  Table structure for `us_account`
-- ----------------------------
DROP TABLE IF EXISTS `us_account`;
CREATE TABLE `us_account` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ApplicationId` int(11) NOT NULL COMMENT '申请id',
  `UserId` int(11) NOT NULL COMMENT 'jimu id',
  `ApexAccountId` varchar(255) NOT NULL COMMENT 'Apex账户id',
  `ApexRequestId` varchar(255) NOT NULL COMMENT 'Apex请求id',
  `TradierUserId` varchar(255) NOT NULL DEFAULT '' COMMENT 'tradier用户id',
  `TradierAccountId` varchar(255) NOT NULL DEFAULT '' COMMENT 'tradier账户id',
  `ApexVerifyStatus` tinyint(4) NOT NULL COMMENT 'Apex验证状态 0：未提交  1：已提交  2: 审核中 3：已通过  4：已拒绝  5：已冻结',
  `ApexAccountType` tinyint(4) NOT NULL COMMENT '0: cash 1: margin',
  `ApexOriginalStatus` varchar(30) NOT NULL COMMENT 'Apex原始状态',
  `RejectMsg` varchar(2000) NOT NULL DEFAULT '' COMMENT 'Apex拒绝原因',
  `SketchIds` varchar(1000) NOT NULL DEFAULT '[]' COMMENT '黑名单ID列表',
  `commission_percent` int(5) NOT NULL DEFAULT '100' COMMENT '佣金百分比，该字段需除100',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ApplicationId` (`ApplicationId`),
  UNIQUE KEY `UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `us_account_cancel_log`
-- ----------------------------
DROP TABLE IF EXISTS `us_account_cancel_log`;
CREATE TABLE `us_account_cancel_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ApplicationId` int(11) NOT NULL COMMENT '申请id',
  `UserId` int(11) NOT NULL COMMENT 'jimu id',
  `ApexAccountId` varchar(255) NOT NULL COMMENT 'Apex账户id',
  `ApexRequestId` varchar(255) NOT NULL COMMENT 'Apex请求id',
  `TradierUserId` varchar(255) NOT NULL DEFAULT '' COMMENT 'tradier用户id',
  `TradierAccountId` varchar(255) NOT NULL DEFAULT '' COMMENT 'tradier账户id',
  `ApexVerifyStatus` tinyint(4) NOT NULL COMMENT 'Apex验证状态 0：未提交  1：已提交  2: 审核中 3：已通过  4：已拒绝  5：已冻结',
  `ApexAccountType` tinyint(4) NOT NULL COMMENT '0: cash 1: margin',
  `ApexOriginalStatus` varchar(30) NOT NULL COMMENT 'Apex原始状态',
  `RejectMsg` varchar(255) NOT NULL DEFAULT '' COMMENT 'Apex拒绝原因',
  `SketchIds` varchar(1000) NOT NULL DEFAULT '[]' COMMENT '黑名单ID列表',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ApplicationId` (`ApplicationId`),
  KEY `UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 COMMENT='用户账户销户日志表';

-- ----------------------------
--  Table structure for `us_account_update_log`
-- ----------------------------
DROP TABLE IF EXISTS `us_account_update_log`;
CREATE TABLE `us_account_update_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `request_id` varchar(255) NOT NULL COMMENT '该次请求ID',
  `user_id` int(11) NOT NULL COMMENT '积木平台用户ID',
  `us_account_id` int(11) NOT NULL COMMENT '积木账户ID',
  `apex_account_id` varchar(255) NOT NULL COMMENT 'apex账户ID',
  `given_name` varchar(20) NOT NULL COMMENT '名字',
  `family_name` varchar(20) NOT NULL COMMENT '姓',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `original_status` varchar(30) NOT NULL COMMENT '原始状态',
  `message` varchar(1000) NOT NULL DEFAULT '' COMMENT '消息提示',
  `post_apex_json` varchar(3000) DEFAULT NULL COMMENT '请求apexJson串',
  `request_type` int(11) DEFAULT NULL COMMENT '更改apex请求类型 null,1为正常更新请求，2为投顾账户开户请求',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL,
  `email` varchar(200) NOT NULL DEFAULT '' COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_UPDATE_LOG` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='账户更新日志表';

-- ----------------------------
--  Table structure for `us_application`
-- ----------------------------
DROP TABLE IF EXISTS `us_application`;
CREATE TABLE `us_application` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` int(11) NOT NULL COMMENT '积木平台用户ID',
  `LastName` varchar(100) NOT NULL DEFAULT '' COMMENT '姓',
  `FirstName` varchar(100) NOT NULL DEFAULT '' COMMENT '名',
  `FormerName` varchar(200) NOT NULL DEFAULT '' COMMENT '曾用名',
  `IdentityCard` varchar(100) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL COMMENT '生日',
  `Sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：男性;  1: 女性  2：未知',
  `Nation` varchar(200) NOT NULL DEFAULT '' COMMENT '民族',
  `Company` varchar(500) NOT NULL DEFAULT '' COMMENT '公司',
  `StreetAddress` varchar(500) NOT NULL DEFAULT '' COMMENT '地址',
  `City` varchar(200) NOT NULL DEFAULT '' COMMENT '城市',
  `Area` varchar(200) NOT NULL DEFAULT '' COMMENT '省',
  `Education` varchar(200) NOT NULL DEFAULT '' COMMENT '学历',
  `MaritalStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：未婚，1：已婚，2：离异, 3: 丧偶',
  `NativePlace` varchar(500) NOT NULL DEFAULT '' COMMENT '籍贯',
  `BirthPlace` varchar(500) NOT NULL DEFAULT '' COMMENT '出生地',
  `Email` varchar(200) NOT NULL DEFAULT '' COMMENT '邮箱',
  `EmailIsVerified` tinyint(4) NOT NULL DEFAULT '0' COMMENT '邮箱是否验证 0: 未验证 1: 已验证',
  `SignaturePath` varchar(500) NOT NULL DEFAULT '' COMMENT '签名路径',
  `IdentityCardFrontPath` varchar(500) NOT NULL DEFAULT '' COMMENT '身份证正面照',
  `IdentityCardBackPath` varchar(500) NOT NULL DEFAULT '' COMMENT '身份证背面照',
  `TradierUserId` varchar(150) NOT NULL DEFAULT '' COMMENT '客户账户ID',
  `JimuVerifyStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'jimu验证状态 0：未提交  1：已提交  2：已通过  3：已拒绝  4：已冻结',
  `UpdateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `RejectCode` char(2) DEFAULT '' COMMENT '00: 全未通过， 01：身份证通过，资料未通过，10：资料通过，身份证未通过',
  `RejectMsg` varchar(500) DEFAULT '' COMMENT '拒绝说明',
  `OpenTime` datetime DEFAULT NULL COMMENT '账户开通时间',
  `RealAddress` varchar(300) NOT NULL DEFAULT '' COMMENT '地址的拼音',
  `GivenName` varchar(200) NOT NULL DEFAULT '' COMMENT '名字拼音',
  `FamilyName` varchar(100) NOT NULL DEFAULT '' COMMENT '姓拼音',
  `Mobile` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号码',
  `CityPinYin` varchar(200) NOT NULL DEFAULT '' COMMENT '城市的拼音',
  `RegFrom` int(11) DEFAULT NULL COMMENT '注册来源-2B商户ID',
  `ExtAccountID` varchar(50) DEFAULT NULL COMMENT '2B商户的用户ID',
  `Citizenship` varchar(200) NOT NULL DEFAULT 'CHN' COMMENT '出生国家',
  `Country` varchar(200) NOT NULL DEFAULT 'CHN' COMMENT '住址国家',
  `PostalCode` varchar(50) NOT NULL DEFAULT '' COMMENT '邮编',
  `TaxRate` decimal(10,0) NOT NULL DEFAULT '10' COMMENT '税率',
  `IdType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: 身份证  1: ssn',
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`) USING BTREE,
  KEY `RegFrom_ExtAccountID` (`RegFrom`,`ExtAccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `us_application_cancel_log`
-- ----------------------------
DROP TABLE IF EXISTS `us_application_cancel_log`;
CREATE TABLE `us_application_cancel_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` int(11) NOT NULL COMMENT '积木平台用户ID',
  `LastName` varchar(100) NOT NULL DEFAULT '' COMMENT '姓',
  `FirstName` varchar(100) NOT NULL DEFAULT '' COMMENT '名',
  `FormerName` varchar(200) NOT NULL DEFAULT '' COMMENT '曾用名',
  `IdentityCard` varchar(100) DEFAULT NULL COMMENT '省份证号',
  `DateOfBirth` datetime DEFAULT NULL COMMENT '生日',
  `Sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：男性;  1: 女性  2：未知',
  `Nation` varchar(200) NOT NULL DEFAULT '' COMMENT '民族',
  `Company` varchar(500) NOT NULL DEFAULT '' COMMENT '公司',
  `StreetAddress` varchar(500) NOT NULL DEFAULT '' COMMENT '地址',
  `City` varchar(200) NOT NULL DEFAULT '' COMMENT '城市',
  `Area` varchar(200) NOT NULL DEFAULT '' COMMENT '省',
  `Education` varchar(200) NOT NULL DEFAULT '' COMMENT '学历',
  `MaritalStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：未婚，1：已婚，2：离异, 3: 丧偶',
  `NativePlace` varchar(500) NOT NULL DEFAULT '' COMMENT '籍贯',
  `BirthPlace` varchar(500) NOT NULL DEFAULT '' COMMENT '出生地',
  `Email` varchar(200) NOT NULL DEFAULT '' COMMENT '邮箱',
  `EmailIsVerified` tinyint(4) NOT NULL DEFAULT '0' COMMENT '邮箱是否验证 0: 未验证 1: 已验证',
  `SignaturePath` varchar(500) NOT NULL DEFAULT '' COMMENT '签名路径',
  `IdentityCardFrontPath` varchar(500) NOT NULL DEFAULT '' COMMENT '身份证正面照',
  `IdentityCardBackPath` varchar(500) NOT NULL DEFAULT '' COMMENT '身份证背面照',
  `TradierUserId` varchar(150) NOT NULL DEFAULT '' COMMENT '客户账户ID',
  `JimuVerifyStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'jimu验证状态 0：未提交  1：已提交  2：已通过  3：已拒绝  4：已冻结',
  `UpdateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `RejectCode` char(2) DEFAULT '' COMMENT '00: 全未通过， 01：身份证通过，资料未通过，10：资料通过，身份证未通过',
  `RejectMsg` varchar(500) DEFAULT '' COMMENT '拒绝说明',
  `RealAddress` varchar(300) NOT NULL DEFAULT '' COMMENT '地址的拼音',
  `OpenTime` datetime DEFAULT NULL COMMENT '账户开通时间',
  `GivenName` varchar(200) NOT NULL DEFAULT '' COMMENT '名字拼音',
  `FamilyName` varchar(100) NOT NULL DEFAULT '' COMMENT '姓拼音',
  `Mobile` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号码',
  `CityPinYin` varchar(200) NOT NULL DEFAULT '' COMMENT '城市的拼音',
  `Operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `OperateTime` datetime NOT NULL COMMENT '操作时间',
  `RegFrom` varchar(200) DEFAULT NULL,
  `Citizenship` varchar(200) NOT NULL DEFAULT 'CHN' COMMENT '出生国家',
  `Country` varchar(200) NOT NULL DEFAULT 'CHN' COMMENT '住址国家',
  `PostalCode` varchar(50) NOT NULL DEFAULT '' COMMENT '邮编',
  `TaxRate` decimal(10,0) NOT NULL DEFAULT '10' COMMENT '税率',
  `IdType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: 身份证  1: ssn',
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COMMENT='用户申请销户日志表';

-- ----------------------------
--  Table structure for `us_application_data`
-- ----------------------------
DROP TABLE IF EXISTS `us_application_data`;
CREATE TABLE `us_application_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `application_id` int(11) NOT NULL COMMENT '申请ID',
  `data_path` varchar(255) NOT NULL COMMENT '资料地址',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '资料类型',
  PRIMARY KEY (`id`),
  KEY `applicationId` (`application_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `us_application_log`
-- ----------------------------
DROP TABLE IF EXISTS `us_application_log`;
CREATE TABLE `us_application_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ApplicationId` int(11) NOT NULL COMMENT '申请id',
  `UserId` int(11) NOT NULL COMMENT '积木平台用户ID',
  `LastName` varchar(100) NOT NULL DEFAULT '' COMMENT '姓',
  `FirstName` varchar(100) NOT NULL DEFAULT '' COMMENT '名',
  `FormerName` varchar(200) NOT NULL DEFAULT '' COMMENT '曾用名',
  `IdentityCard` varchar(100) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL COMMENT '生日',
  `Sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：男性;  1: 女性  2：未知',
  `Nation` varchar(200) NOT NULL DEFAULT '' COMMENT '民族',
  `Company` varchar(500) NOT NULL DEFAULT '' COMMENT '公司',
  `StreetAddress` varchar(500) NOT NULL DEFAULT '' COMMENT '地址',
  `City` varchar(200) NOT NULL DEFAULT '' COMMENT '城市',
  `Area` varchar(200) NOT NULL DEFAULT '' COMMENT '省',
  `Education` varchar(200) NOT NULL DEFAULT '' COMMENT '学历',
  `MaritalStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：未婚，1：已婚，2：离异, 3: 丧偶',
  `NativePlace` varchar(500) NOT NULL DEFAULT '' COMMENT '籍贯',
  `BirthPlace` varchar(500) NOT NULL DEFAULT '' COMMENT '出生地',
  `Email` varchar(200) NOT NULL DEFAULT '' COMMENT '邮箱',
  `EmailIsVerified` tinyint(4) NOT NULL DEFAULT '0' COMMENT '邮箱是否验证 0: 未验证 1: 已验证',
  `SignaturePath` varchar(500) NOT NULL DEFAULT '' COMMENT '签名路径',
  `IdentityCardFrontPath` varchar(500) NOT NULL DEFAULT '' COMMENT '身份证正面照',
  `IdentityCardBackPath` varchar(500) NOT NULL DEFAULT '' COMMENT '身份证背面照',
  `TradierUserId` varchar(150) NOT NULL DEFAULT '' COMMENT '客户账户ID',
  `JimuVerifyStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'jimu验证状态 0：未提交  1：已提交  2：已通过  3：已拒绝  4：已冻结',
  `ApexVerifyStatus` tinyint(4) DEFAULT NULL COMMENT 'Apex验证状态 0：未提交  1：已提交  2: 审核中 3：已通过  4：已拒绝  5：已冻结',
  `UpdateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `RejectCode` char(2) DEFAULT '' COMMENT '00: 全未通过， 01：身份证通过，资料未通过，10：资料通过，身份证未通过',
  `RejectMsg` varchar(500) DEFAULT '',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `StackTrace` varchar(5000) NOT NULL DEFAULT '' COMMENT '堆栈信息',
  `OpenTime` datetime DEFAULT NULL COMMENT '账户开通时间',
  `GivenName` varchar(200) NOT NULL DEFAULT '' COMMENT '名字拼音',
  `FamilyName` varchar(100) NOT NULL DEFAULT '' COMMENT '姓拼音',
  `Mobile` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号码',
  `CityPinYin` varchar(200) NOT NULL DEFAULT '' COMMENT '城市的拼音',
  `ApexAccountId` varchar(255) NOT NULL DEFAULT '' COMMENT 'Apex账户id',
  `ApexRequestId` varchar(255) NOT NULL DEFAULT '' COMMENT 'Apex请求id',
  `TradierAccountId` varchar(255) NOT NULL DEFAULT '' COMMENT 'tradier账户id',
  `ApexAccountType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: cash 1: margin',
  `ApexOriginalStatus` varchar(30) NOT NULL DEFAULT '' COMMENT 'Apex原始状态',
  `ApexRejectMsg` varchar(2000) NOT NULL DEFAULT '' COMMENT 'Apex拒绝原因',
  `SketchIds` varchar(1000) NOT NULL DEFAULT '[]' COMMENT '黑名单ID列表',
  `RealAddress` varchar(300) NOT NULL DEFAULT '' COMMENT '地址的拼音',
  `Citizenship` varchar(200) NOT NULL DEFAULT 'CHN' COMMENT '出生国家',
  `Country` varchar(200) NOT NULL DEFAULT 'CHN' COMMENT '住址国家',
  `PostalCode` varchar(50) NOT NULL DEFAULT '' COMMENT '邮编',
  `TaxRate` decimal(10,0) NOT NULL DEFAULT '10' COMMENT '税率',
  `IdType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: 身份证  1: ssn',
  PRIMARY KEY (`Id`),
  KEY `Unique` (`UserId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=365662 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `total_amount` decimal(16,4) NOT NULL COMMENT '佣金劵总金额',
  `frozen_amount` decimal(16,4) NOT NULL COMMENT '佣金劵冻结金额',
  `last_clearing_time` datetime DEFAULT NULL COMMENT '最后一次的结算时间',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号，用于处理并发操作',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_USER_COUPON` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_detail_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_detail_info`;
CREATE TABLE `user_detail_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `apex_account_id` varchar(64) NOT NULL DEFAULT '',
  `application_id` int(11) NOT NULL,
  `subscription_mail` int(11) DEFAULT NULL COMMENT '用户是否订阅邮件: 0没有订阅 1有订阅',
  `trnsfr_ccunt` int(11) DEFAULT NULL COMMENT '用户是否转过户，0无，1转过',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `apex_account_id` (`apex_account_id`),
  UNIQUE KEY `application_id` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_tradier`
-- ----------------------------
DROP TABLE IF EXISTS `user_tradier`;
CREATE TABLE `user_tradier` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` int(11) NOT NULL COMMENT 'jimu id',
  `TradierUserId` varchar(255) NOT NULL COMMENT 'tradier用户id',
  `coupon_free_date` date DEFAULT NULL COMMENT '免佣到期时间',
  `commission_sync_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '佣金百分比和免佣同步状态，0：未同步，1：已同步',
  `max_commission` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金最大值，超过部分自动返现',
  `max_commission_exp_date` date DEFAULT NULL COMMENT '佣金最大值的过期时间',
  `channel` varchar(20) NOT NULL DEFAULT '' COMMENT '渠道',
  `password` varchar(32) DEFAULT NULL COMMENT 'proTrader用户密码',
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `voluntary_action_report`
-- ----------------------------
DROP TABLE IF EXISTS `voluntary_action_report`;
CREATE TABLE `voluntary_action_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_number` char(12) DEFAULT NULL COMMENT 'Code for account holder (customer or firm). Right justified, leading zeroes.',
  `firm` char(2) DEFAULT NULL COMMENT 'Unique Identifier of brokerage client',
  `account_name` varchar(40) DEFAULT NULL COMMENT 'Account Holders Full Name',
  `total_share_quantity` decimal(28,10) DEFAULT NULL COMMENT 'The Total Settled Position in the Account as-of RecordDate',
  `office_name` varchar(55) DEFAULT NULL COMMENT 'Client Branch/Office Name',
  `office_code` char(2) DEFAULT NULL COMMENT '3-character code representing Clients Branch/Office.',
  `cusip` char(12) DEFAULT NULL COMMENT 'External Identifier of the New/Receiving Security involved in the Corporate Action',
  `symbol` char(12) DEFAULT NULL COMMENT 'Ticker Symbol of the New/Receiving Security involved in the Corporate Action',
  `short_description` char(15) DEFAULT NULL COMMENT 'First 15 characters of the first line of the security description of the New/Receiving Security involved in the Corporate Action',
  `isin` char(12) DEFAULT NULL COMMENT 'External Identifier of the New/Receiving Security involved in the Corporate Action',
  `corporate_action` varchar(50) DEFAULT NULL COMMENT 'A short description of the type of CorporateAction listed:\nSymbol Change\nReorg\nStock Split\nSpinoff\nMarket Change\nStock Merger\nReverse Split\nName Change\nCash Merger\nCusip Change\nStock Dividend',
  `country_code` char(2) DEFAULT NULL COMMENT 'CountryCode of Security Issue of New/Receiving Security involved in the Corporate Action',
  `record_date` datetime DEFAULT NULL COMMENT 'The date on which positions are recorded in order to calculate entitlement',
  `expiration_date` datetime DEFAULT NULL COMMENT 'ExpirationDate of the announcement.',
  `reorg_cut_off_date` datetime DEFAULT NULL COMMENT 'ExpirationDate of the announcement.  Same as ExpirationDate',
  `redemption_date` datetime DEFAULT NULL COMMENT 'NOT USED',
  `process_date` datetime DEFAULT NULL COMMENT 'Date on which the Corporate Action Announcement was entered into the system.',
  `last_change_date` datetime DEFAULT NULL COMMENT 'The most recent date that the corporate action entry was updated',
  `corporate_action_message` varchar(4000) DEFAULT NULL COMMENT 'The Corporate Action announcement details provided by the vendor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `withdraw_request`
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_request`;
CREATE TABLE `withdraw_request` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `apex_wire_log_id` int(11) NOT NULL COMMENT '提现请求ID',
  `operation_id` int(11) NOT NULL COMMENT 'protrade id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `apex_wire_log_id` (`apex_wire_log_id`),
  UNIQUE KEY `operation_id` (`operation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10045 DEFAULT CHARSET=utf8 COMMENT='提现对应 protrade 请求表';

SET FOREIGN_KEY_CHECKS = 1;
