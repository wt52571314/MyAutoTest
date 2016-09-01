# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# 积木股票接口List
# ===============================================================================
import json
# passport_url = 'https://passport.bbaecdn.com/authentication/loginOnApp/body'
passport_url = 'https://passport-qa-01.jimustock.com/authentication/loginOnApp/body'
# BaseURL = 'https://api.bbaecdn.com'  # BBAE
# BaseURL = 'https://stock-api.jimustock.com'  # 原积木
# BaseURL = 'https://api-web.bbae.com'  # web

BaseURL = 'https://sj-api-02.jimustock.com'  # 测试环境
List_interface_get = {
    BaseURL+'/api/v1/trade/asset?stockType=1&usAccountID=375': '资产'
    , BaseURL+'/api/v1/security/userInfo': '用户信息'
    , BaseURL+'/api/v1/us/account/getCouponView?usAccountID=375': '我的福利'
    , BaseURL+'/api/v1/trade/positions?paged=false&skip=0&take=5&usAccountID=375': '我的持仓'
    , BaseURL+'/api/v1/info?skip=0&take=5&type=main': '要闻'
    , BaseURL+'/api/v1/info?skip=0&take=5&type=custom': '自选股'
    , BaseURL+'/api/v1/market/getIncreaseList?skip=0&stockType=4&take=5': '中概股涨幅榜'
    , BaseURL+'/api/v1/market/getTimeTrend?days=1&exchangeCode=XNYS&period=1&stockType=1&symbol=BABA': '个股详情'
    , BaseURL+'/api/v1/us/account/baseInfo?usAccountID=375': '开户基础信息'
    , BaseURL+'/api/v1/market/getMarketsInfo': '指数行情'
    , BaseURL+'/api/v1/info?skip=0&type=realtime&take=5&stockList=ACW,XNYS,1,RMGN,XNAS,1,\
                IXIC,,1,DJIA,,1,SPX,,1,AAT,XNYS,1,AAPC,XNAS,1,AAP,XNYS,1,AAME,XNAS,1,AAMC,\
                ARCX,1,AAAP,XNAS,1,A,XNYS,1,T,XNYS,1': '直播新闻'
    , BaseURL+'/api/v1/us/account/getCouponView': '现在正在使用的免佣额度'
    , BaseURL+'/api/v1/us/account/getCouponChangeList?pageNo=0&pageCnt=20': '免佣消费历史'
    , BaseURL+'/api/v1/trade/completedHistory?startDate=05/24/2016&endDate=06/23/2016&filter=\
                0&skip=0&take=20&stockType=1&usAccountID=375': '交易记录之已完成交易'
    , BaseURL+'/api/v1/trade/entrustHistory?skip=0&take=20&stockType=1&usAccountID=66': '交易记录之已报交易'
    , BaseURL+'/api/v1/us/account/getDebtHistory?skip=0&take=20': '预扣款项'
    , BaseURL+'/api/v1/us/account/getApexPdf?usAccountID=375&type=CONFIRM&pageNo=0&pageCnt=50': '相关文档之交易确认'
    , BaseURL+'/api/v1/us/account/getApexPdf?usAccountID=375&type=STATEMENT&pageNo=0&pageCnt=50': '相关文档之账户结单'
    , BaseURL+'/api/v1/us/account/getApexPdf?usAccountID=375&type=TAX&pageNo=0&pageCnt=50': '相关文档之税务文档'
    , BaseURL+'/api/v1/us/account/isBoundUsBank?usAccountID=375': '转出是否绑定银行'
    , BaseURL+'/api/v1/us/account/getAllApexWireBank': '所有转出银行'
    , BaseURL+'/api/v1/us/account/getAddressAndBranch?bankName=%E5%85%B4%E4%B8%9A%E9%93%B6%E8%A1%8C': '所有转出银行对应分行'
    , BaseURL+'/api/v1/market/getAllList?stockType=1&skip=0&reqType=1,2': '知名美股'
    , BaseURL+'/api/v1/market/getAllList?stockType=4&skip=0&reqType=1,2': '中概股'
    , BaseURL+'/api/v1/market/getIncreaseList?stockType=4&skip=0&take=100': '涨幅榜'
    , BaseURL+'/api/v1/market/getDropList?stockType=4&skip=0&take=100': '跌幅榜'
    , BaseURL+'/api/v1/market/portfolioPlanList': '组合列表'
    , BaseURL+'/api/v1/market/portfolioPlan?portfolioPlanId=7': '组合详情'
    , BaseURL+'/api/v1/market/getUSStockDetailInfos?symbols=SPXS,EPV,EWV,UDN': '组合当前价详情'
    , BaseURL+'/api/v1/us/account/transferAccountList': '转户历史'
    , BaseURL+'/api/v1/security/recommendCode': '获取邀请码'
    , BaseURL+'/api/v1/security/recommendHistory??skip=0&take=2147483647': '获取邀请历史'
}

List_interface_post = {
    1: BaseURL+'/api/v1/security/password/change'
    , 2: BaseURL+'/api/v1/security/password/change'
    , 3: BaseURL+'/api/v1/security/mobileCaptcha'
    , 4: BaseURL+'/api/v1/us/update_email/sendOldCaptcha'
    , 5: BaseURL+'/api/v1/us/trade/sendWireInMail'
    , 6: BaseURL+'/api/v1/market/portfolio/add'
    , 7: BaseURL+'/api/v1/market/portfolio/del'
    , 8: BaseURL+'/api/v1/market/portfolio/sort'
}
List_post_param = {
    1: 'new=222222&old=111111'
    , 2: 'new=111111&old=222222'
    , 3: 'mobile=15210025291'
    , 4: 'usAccountID=375'
    , 5: json.dumps({"apexAccountAddress": "One Dallas Center 350N. St Paul, Suite 1300, Dallas, TX 75201","apexAccountName":"Apex","apexAccountNumber":"3713286","apexBankAddress":"111 W Monroe St, Chicago,IL60603","apexBankName":"BMO Harris Bank","apexSwiftCode":"HATRUS44","usAccountId":"66","userBankInfoUrl":"https://bbae.com/faq/article/650","userBankName":"招行香港"})
    , 6: 'symbol=%5B%7B%22exchangeCode%22%3A%22XNYS%22%2C%22symbol%22%3A%22R%22%2C%22type%22%3A%221%22%7D%5D'
    , 7: 'symbol=%5B%7B%22exchangeCode%22%3A%22XNYS%22%2C%22symbol%22%3A%22R%22%2C%22type%22%3A%221%22%7D%5D'
    , 8: 'symbol=%5B%7B%22exchangeCode%22%3A%22XNYS%22%2C%22symbol%22%3A%22F%22%2C%22type%22%3A%221%22%7D%2C%7B%22exchangeCode%22%3A%22ARCX%22%2C%22symbol%22%3A%22AAMC%22%2C%22type%22%3A%221%22%7D%5D&'
}

List_post_note = {
    1: '修改密码'
    , 2: '密码还原'
    , 3: '发送手机验证码'
    , 4: '验证旧邮箱'
    , 5: '发送入金邮件'
    , 6: '添加自选股'
    , 7: '删除自选股'
    , 8: '自选股排序'
}

List_post_payload = {
    1: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
    , 2: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
    , 3: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
    , 4: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
    , 5: {'Content-Type': 'application/json; charset=UTF-8'}
    , 6: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
    , 7: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
    , 8: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
}
user_name = '11711771177'
pwd = '111111'

# 获取magic_code的URL
url_result = BaseURL+'/api/v1/security/magicCode'
List_get = []
List_post = []


def split_line():
    """
    输出分界线
    :return: NULL
    """
    print '*'*50