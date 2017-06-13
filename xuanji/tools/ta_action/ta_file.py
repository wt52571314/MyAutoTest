# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2017-04-19
# 获取用户信息
# ===============================================================================
import re
str_use = \
"""
<AppSheetSerialNo                        Description="申请单编号"                                 Type="string"       Length="24"       Decimal=""      Default=""  To="ParamByName('ordersno').AsString := Copy(AppSheetSerialNo,17,8);ParamByName('sendsn').AsString := AppSheetSerialNo"/>
<TransactionCfmDate                      Description="交易确认日期"                               Type="string"       Length="8"        Decimal=""      Default=""  To="ParamByName('matchdate').AsString := TransactionCfmDate"/>
<CurrencyType                            Description="结算币种"                                   Type="string"       Length="3"        Decimal=""      Default=""  To="ParamByName('moneytype').AsString := '0'"/>
<ConfirmedVol                            Description="基金账户交易确认份数"                       Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('matchqty').AsString := FloatToStr(ConfirmedVol)"/>
<ConfirmedAmount                         Description="每笔交易确认金额"                           Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('confirmedamt').AsString := FloatToStr(ConfirmedAmount)"/>
<FundCode                                Description="基金代码"                                   Type="string"       Length="6"        Decimal=""      Default=""  To="ParamByName('ofcode').AsString := FundCode"/>
<LargeRedemptionFlag                     Description="巨额赎回处理标志"                           Type="string"       Length="1"        Decimal=""      Default=""  To="ParamByName('redeemtype').AsString := LargeRedemptionFlag"/>
<TransactionDate                         Description="交易发生日期"                               Type="string"       Length="8"        Decimal=""      Default=""  To="ParamByName('orderdate').AsString := TransactionDate"/>
<TransactionTime                         Description="交易发生时间"                               Type="string"       Length="6"        Decimal=""      Default=""/>
<ReturnCode                              Description="交易处理返回代码"                           Type="string"       Length="4"        Decimal=""      Default=""  To="ParamByName('errcode').AsString := ReturnCode"/>
<TransactionAccountID                    Description="投资人基金交易帐号"                         Type="string"       Length="17"       Decimal=""      Default=""  To="ParamByName('transacc').AsString := TransactionAccountID"/>
<DistributorCode                         Description="销售人代码"                                 Type="string"       Length="9"        Decimal=""      Default=""/>
<ApplicationVol                          Description="申请基金份数"                               Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('orderqty').AsString := FloatToStr(ApplicationVol)"/>
<ApplicationAmount                       Description="申请金额"                                   Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('orderamt').AsString := FloatToStr(ApplicationAmount)"/>
<BusinessCode                            Description="业务代码"                                   Type="string"       Length="3"        Decimal=""      Default=""  To="ParamByName('trdid').AsString := '240'+BusinessCode"/>
<TAAccountID                             Description="投资人基金帐号"                             Type="string"       Length="12"       Decimal=""      Default=""  To="ParamByName('taacc').AsString := TAAccountID"/>
<TASerialNO                              Description="TA确认交易流水号"                           Type="string"       Length="20"       Decimal=""      Default=""  To="ParamByName('tasn').AsString := TASerialNO"/>
<BusinessFinishFlag                      Description="业务过程完全结束标识"                       Type="string"       Length="1"        Decimal=""      Default=""  To="ParamByName('finishflag').AsString := BusinessFinishFlag"/>
<DiscountRateOfCommission                Description="销售佣金折扣率"                             Type="float"        Length="5"        Decimal="4"     Default=""  To="ParamByName('discratio').AsString := FloatToStr(DiscountRateOfCommission)"/>
<DepositAcct                             Description="投资人在销售人处用于交易的资金帐号"         Type="string"       Length="19"       Decimal=""      Default=""/>
<RegionCode                              Description="交易所在地区编号"                           Type="string"       Length="4"        Decimal=""      Default=""  To="ParamByName('regioncode').AsString := RegionCode"/>
<DownLoaddate                            Description="交易数据下传日期"                           Type="string"       Length="8"        Decimal=""      Default=""/>
<Charge                                  Description="手续费"                                     Type="float"        Length="10"       Decimal="2"     Default=""  To="ParamByName('fee').AsString := FloatToStr(CHARGE)"/>
<AgencyFee                               Description="代理费"                                     Type="float"        Length="10"       Decimal="2"     Default=""  To="ParamByName('agentfee').AsString := FloatToStr(AGENCYFEE)"/>
<NAV                                     Description="基金单位净值"                               Type="float"        Length="7"        Decimal="4"     Default=""  To="ParamByName('nav').AsString := FloatToStr(NAV)"/>
<BranchCode                              Description="网点号码"                                   Type="string"       Length="9"        Decimal=""      Default=""/>
<OriginalAppSheetNo                      Description="原申请单编号"                               Type="string"       Length="24"       Decimal=""      Default=""  To="ParamByName('oldsn').AsString := OriginalAppSheetNo"/>
<OriginalSubsDate                        Description="原申购日期"                                 Type="string"       Length="8"        Decimal=""      Default=""  To="ParamByName('oldoperdate').AsString := OriginalSubsDate"/>
<OtherFee1                               Description="其他费用1"                                  Type="float"        Length="10"       Decimal="2"     Default=""  To="ParamByName('otherfee1').AsString := OTHERFEE1"/>
<IndividualOrInstitution                 Description="个人/机构标志"                              Type="string"       Length="1"        Decimal=""      Default=""  To="ParamByName('acctype').AsString := IndividualOrInstitution"/>
<RedemptionDateInAdvance                 Description="预约赎回日期"                               Type="string"       Length="8"        Decimal=""      Default=""/>
<StampDuty                               Description="印花税"                                     Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('feestamptax').AsString := FloatToStr(StampDuty)"/>
<ValidPeriod                             Description="交易申请有效天数"                           Type="float"        Length="2"        Decimal=""      Default=""/>
<RateFee                                 Description="费率"                                       Type="float"        Length="9"        Decimal="8"     Default=""/>
<TotalBackendLoad                        Description="交易后端收费总额"                           Type="float"        Length="16"       Decimal="2"     Default=""/>
<OriginalSerialNo                        Description="TA的原确认流水号"                           Type="string"       Length="20"       Decimal=""      Default=""/>
<Specification                           Description="摘要/说明"                                  Type="string"       Length="60"       Decimal=""      Default=""/>
<DateOfPeriodicSubs                      Description="定期定额申购日期"                           Type="string"       Length="8"        Decimal=""      Default=""/>
<TargetDistributorCode                   Description="对方销售人代码"                             Type="string"       Length="9"        Decimal=""      Default=""  To="ParamByName('otherdbtid').AsString := TargetDistributorCode"/>
<TargetBranchCode                        Description="对方网点号"                                 Type="string"       Length="9"        Decimal=""      Default=""  To="ParamByName('otherorgid').AsString := TargetBranchCode"/>
<TargetTransactionAccountID              Description="对方销售人处投资人基金交易帐号"             Type="string"       Length="17"       Decimal=""      Default=""  To="ParamByName('othertransacc').AsString := TARGETTRANSACTIONACCOUNTID"/>
<TargetRegionCode                        Description="对方所在地区编号"                           Type="string"       Length="4"        Decimal=""      Default=""/>
<TransferDirection                       Description="转入/转出标识"                              Type="string"       Length="1"        Decimal=""      Default=""/>
<DefDividendMethod                       Description="默认分红方式"                               Type="string"       Length="1"        Decimal=""      Default=""  To="ParamByName('dividmethod').AsString := DefDividendMethod"/>
<DividendRatio                           Description="红利比例"                                   Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('dividratio').AsString := FloatToStr(DividendRatio)"/>
<Interest                                Description="基金账户利息金额"                           Type="float"        Length="10"       Decimal="2"     Default=""  To="ParamByName('awardintr').AsString := FloatToStr(Interest)"/>
<VolumeByInterest                        Description="基金账户利息金额转份额"                     Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('volumebyinterest').AsString := FloatToStr(VolumeByInterest)"/>
<InterestTax                             Description="利息税"                                     Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('tax').AsString := FloatToStr(InterestTax)"/>
<TradingPrice                            Description="交易价格"                                   Type="float"        Length="7"        Decimal="4"     Default=""  To="ParamByName('matchprice').AsString := FloatToStr(TradingPrice)"/>
<FreezingDeadline                        Description="冻结截止日期"                               Type="string"       Length="8"        Decimal=""      Default=""/>
<FrozenCause                             Description="冻结原因"                                   Type="string"       Length="1"        Decimal=""      Default=""  To="ParamByName('frzreason').AsString := FrozenCause"/>
<Tax                                     Description="税金"                                       Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('tax').AsString := FloatToStr(Tax)"/>
<TargetNAV                               Description="目标基金的单位净值"                         Type="float"        Length="7"        Decimal="4"     Default=""  To="ParamByName('otherofnav').AsString := FloatToStr(TARGETNAV)"/>
<TargetFundPrice                         Description="目标基金的价格"                             Type="float"        Length="7"        Decimal="4"     Default=""  To="ParamByName('otherofprice').AsString := FloatToStr(TARGETFUNDPRICE)"/>
<CfmVolOfTargetFund                      Description="目标基金的确认份数"                         Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('transqty').AsString := FloatToStr(CFMVOLOFTARGETFUND)"/>
<MinFee                                  Description="最少收费"                                   Type="float"        Length="10"       Decimal="2"     Default=""/>
<OtherFee2                               Description="其他费用2"                                  Type="float"        Length="16"       Decimal="2"     Default=""  To="ParamByName('otherfee2').AsString := OTHERFEE2"/>
<OriginalAppDate                         Description="原申请日期"                                 Type="string"       Length="8"        Decimal=""      Default=""/>
<TransferFee                             Description="过户费"                                     Type="float"        Length="10"       Decimal="2"     Default=""  To="ParamByName('tafee').AsString := TRANSFERFEE"/>
<FromTAFlag                              Description="是否注册登记人发起业务标志"                 Type="string"       Length="1"        Decimal=""      Default=""  To= "if BusinessCode='130' then  ParamByName('agentoper').AsString := '0' else ParamByName('agentoper').AsString := FROMTAFLAG; "/>
<ShareClass                              Description="收费方式"                                   Type="string"       Length="1"        Decimal=""      Default=""  To="ParamByName('shareclass').AsString := ShareClass"/>
<DetailFlag                              Description="数据明细标志"                               Type="string"       Length="1"        Decimal=""      Default=""  To="ParamByName('dealflag').AsString := DetailFlag"/>
<RedemptionInAdvanceFlag                 Description="预约赎回标志"                               Type="string"       Length="1"        Decimal=""      Default=""/>
<FrozenMethod                            Description="冻结方式"                                   Type="string"       Length="1"        Decimal=""      Default=""/>
<OriginalCfmDate                         Description="TA的原确认日期"                             Type="string"       Length="8"        Decimal=""      Default=""/>
<RedemptionReason                        Description="强行赎回原因"                               Type="string"       Length="1"        Decimal=""      Default=""/>
<CodeOfTargetFund                        Description="转换时的目标基金代码"                       Type="string"       Length="6"        Decimal=""      Default=""   To="ParamByName('otherofcode').AsString := CodeOfTargetFund"/>
<TotalTransFee                           Description="交易确认费用合计"                           Type="float"        Length="10"       Decimal="2"     Default=""/>
<VarietyCodeOfPeriodicSubs               Description="定时定额品种代码"                           Type="string"       Length="5"        Decimal=""      Default=""   To=""/>
<SerialNoOfPeriodicSubs                  Description="定时定额申购序号"                           Type="string"       Length="5"        Decimal=""      Default=""   To=""/>
<RationType                              Description="定期定额种类"                               Type="string"       Length="1"        Decimal=""      Default=""   To=""/>
<TargetTAAccountID                       Description="对方基金账号"                               Type="string"       Length="12"       Decimal=""      Default=""   To="ParamByName('othertaacc').AsString := TargetTAAccountID"/>
<TargetRegistrarCode                     Description="对方TA代码"                                 Type="string"       Length="2"        Decimal=""      Default=""   To="ParamByName('targetregistrarcode').AsString := TargetRegistrarCode"/>
<NetNo                                   Description="操作（清算）网点编号"                       Type="string"       Length="9"        Decimal=""      Default=""   To=""/>
<CustomerNo                              Description="TA客户编号"                                 Type="string"       Length="12"       Decimal=""      Default=""   To=""/>
<TargetShareType                         Description="对方基金份额类别"                           Type="string"       Length="1"        Decimal=""      Default=""   To="ParamByName('targetsharetype').AsString := TargetShareType"/>
<RationProtocolNo                        Description="定期定额协议号"                             Type="string"       Length="20"       Decimal=""      Default=""   To=""/>
<BeginDateOfPeriodicSubs                 Description="定时定额申购起始日期"                       Type="string"       Length="8"        Decimal=""      Default=""   To=""/>
<EndDateOfPeriodicSubs                   Description="定时定额申购终止日期"                       Type="string"       Length="8"        Decimal=""      Default=""   To=""/>
<SendDayOfPeriodicSubs                   Description="定时定额申购每月发送日"                     Type="float"        Length="2"        Decimal=""      Default=""   To=""/>
<Broker                                  Description="经纪人"                                     Type="string"       Length="12"       Decimal=""      Default=""   To=""/>
<SalesPromotion                          Description="促销活动代码"                               Type="string"       Length="3"        Decimal=""      Default=""   To=""/>
<AcceptMethod                            Description="受理方式"                                   Type="string"       Length="1"        Decimal=""      Default=""   To=""/>
<ForceRedemptionType                     Description="强制赎回类型"                               Type="string"       Length="1"        Decimal=""      Default=""   To=""/>
<AlternationDate                         Description="最后更新日"                                 Type="string"       Length="8"        Decimal=""      Default=""   To=""/>
<TakeIncomeFlag                          Description="带走收益标志"                               Type="string"       Length="1"        Decimal=""      Default=""   To=""/>
<PurposeOfPeSubs                         Description="定投目的"                                   Type="string"       Length="40"       Decimal=""      Default=""   To=""/>
<FrequencyOfPeSubs                       Description="定投频率"                                   Type="float"        Length="5"        Decimal=""      Default=""   To=""/>
<PeriodSubTimeUnit                       Description="定投周期单位"                               Type="string"       Length="1"        Decimal=""      Default=""   To=""/>
<BatchNumOfPeSubs                        Description="定投期数"                                   Type="float"        Length="16"       Decimal="2"     Default=""   To=""/>
<CapitalMode                             Description="资金方式"                                   Type="string"       Length="2"        Decimal=""      Default=""   To=""/>
<DetailCapticalMode                      Description="明细资金方式"                               Type="string"       Length="2"        Decimal=""      Default=""   To=""/>
<BackenloadDiscount                      Description="补差费折扣率"                               Type="float"        Length="5"        Decimal="4"     Default=""   To="ParamByName('backenloaddiscount').AsString := BackenloadDiscount"/>
<CombineNum                              Description="组合编号"                                   Type="string"       Length="6"        Decimal=""      Default=""   To=""/>
<RefundAmount                            Description="退款金额"                                   Type="float"        Length="16"       Decimal="2"     Default=""   To=""/>
<SalePercent                             Description="配售比例"                                   Type="float"        Length="8"        Decimal="5"     Default=""   To=""/>
<ManagerRealRatio                        Description="实际计算折扣"                               Type="float"        Length="7"        Decimal="4"     Default=""   To=""/>
<ChangeFee                               Description="转换费"                                     Type="float"        Length="16"       Decimal="2"     Default=""   To="ParamByName('changefee').AsString := ChangeFee"/>
<RecuperateFee                           Description="补差费"                                     Type="float"        Length="16"       Decimal="2"     Default=""   To="ParamByName('recuperatefee').AsString := RecuperateFee"/>
<AchievementPay                          Description="业绩报酬"                                   Type="float"        Length="16"       Decimal="2"     Default=""   To="ParamByName('achievementpay').AsString := AchievementPay"/>
<AchievementCompen                       Description="业绩补偿"                                   Type="float"        Length="16"       Decimal="2"     Default=""   To="ParamByName('achievementcompen').AsString := AchievementCompen"/>
<SharesAdjustmentFlag                    Description="份额强制调整标志"                           Type="string"       Length="1"        Decimal=""      Default=""   To=""/>
<GeneralTASerialNO                       Description="总TA确认流水号"                             Type="string"       Length="20"       Decimal=""      Default=""   To=""/>
<UndistributeMonetaryIncome              Description="货币基金未付收益金额"                       Type="float"        Length="16"       Decimal="2"     Default=""   To=""/>
<UndistributeMonetaryIncomeFlag          Description="货币基金未付收益金额正负"                   Type="string"       Length="1"        Decimal=""      Default=""   To=""/>
<BreachFee                               Description="违约金"                                     Type="float"        Length="16"       Decimal="2"     Default=""   To="ParamByName('breachfee').AsString := BreachFee"/>
<BreachFeeBackToFund                     Description="违约金归基金资产金额"                       Type="float"        Length="16"       Decimal="2"     Default=""   To="ParamByName('breachfeebacktofund').AsString := BreachFeeBackToFund"/>
<PunishFee                               Description="惩罚性费用"                                 Type="float"        Length="16"       Decimal="2"     Default=""   To="ParamByName('punishfee').AsString := PunishFee"/>
<TradingMethod                           Description="使用的交易手段"                             Type="string"       Length="8"        Decimal=""      Default=""   To=""/>
<ChangeAgencyFee                         Description="转换代理费"                                 Type="float"        Length="16"       Decimal="2"     Default=""   To=""/>
<RecuperateAgencyFee                     Description="补差代理费"                                 Type="float"        Length="16"       Decimal="2"     Default=""   To="ParamByName('recuperateagencyfee').AsString := RecuperateAgencyFee"/>
<ErrorDetail                             Description="出错详细信息"                               Type="string"       Length="60"       Decimal=""      Default=""   To="ParamByName('remark').AsString := ErrorDetail"/>
<LargeBuyFlag                            Description="巨额购买处理标志"                           Type="string"       Length="1"        Decimal=""      Default=""   To=""/>
<RaiseInterest                           Description="认购期间利息"                               Type="float"        Length="16"       Decimal="2"     Default=""   To="ParamByName('raiseinterest').AsString := RaiseInterest"/>
<FeeCalculator                           Description="计费人"                                     Type="string"       Length="1"        Decimal=""      Default=""   To=""/>
<ShareRegisterDate                       Description="份额注册日期"                               Type="string"       Length="8"        Decimal=""      Default=""  />
<RecordNo                                Description="记录号"                                 Type="integer"  Length="8"    Decimal="0"   Default=""
  To="ParamByName('tacode').AsString:=TaCode;" Visible="False"/>
"""

if __name__ == '__main__':
    list_note = re.findall(r'Length=\"\d+\"', str_use)
    for i in range(0, len(list_note)):
        print list_note[i][8:-1]
