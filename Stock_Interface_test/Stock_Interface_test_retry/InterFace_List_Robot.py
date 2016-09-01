# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-7-12
# BBAE智能投顾接口List
# ===============================================================================
import json
BaseURL = 'https://api.bbaecdn.com'  # BBAE
# BaseURL = 'https://stock-api.jimustock.com'  # 原积木
# BaseURL = 'https://api-web.bbae.com'  # web
# BaseURL = 'https://sj-api-02.jimustock.com'  # 测试环境
List_interface_get = {
    BaseURL+'/api/v1/security/userInfo': '获取用户信息'
    , BaseURL+'/api/v1/us/roboAdvisor/getAccountId': '智能投顾账户标识获取'
    , BaseURL+'/api/v1/us/roboAdvisor/getAllFilled?roboAccountId=': '投顾账户开户信息获取'   # 未完善
    , BaseURL+'/api/v1/us/roboAdvisor/getRiskSurvey': '风险评测问题列表'
    , BaseURL+'/api/v1/us/roboAdvisor/getPortfolioList?investmentStyleId=&roboAccountId=': '根据投资风格获取投资组合'   # 未完善
    , BaseURL+'/api/v1/us/roboAdvisor/getPortfolioDetails?portfolioIds=': '获取投资组合数组详情'   # 未完善
    , BaseURL+'/api/v1/us/roboAdvisor/getAccountTrends?roboAccountId=': '获取智能投顾账户盈亏走势列表'   # 未完善
    , BaseURL+'/api/v1/us/roboAdvisor/getAccountInfo?roboAccountId=': '获取智能投顾账户信息'   # 未完善
    , BaseURL+'/api/v1/us/roboAdvisor/getPortfolioUpdateHistory?roboAccountId=&skip=&take=': '查询调仓记录'   # 未完善
    , BaseURL+'/api/v1/us/roboAdvisor/surveyResult': '查询用户风测结果'
    , BaseURL+'/api/v1/trade/assetByUser': '获取用户总资产'
}

# List_interface_post = {
#     1: BaseURL+'/api/v1/security/password/change'
#     , 2: BaseURL+'/api/v1/security/password/change'
#     , 3: BaseURL+'/api/v1/security/mobileCaptcha'
#     , 4: BaseURL+'/api/v1/us/update_email/sendOldCaptcha'
#     , 5: BaseURL+'/api/v1/us/trade/sendWireInMail'
#     , 6: BaseURL+'/api/v1/market/portfolio/add'
#     , 7: BaseURL+'/api/v1/market/portfolio/del'
#     , 8: BaseURL+'/api/v1/market/portfolio/sort'
# }
# List_post_param = {
#     1: 'new=222222&old=111111'
#     , 2: 'new=111111&old=222222'
#     , 3: 'mobile=18070505645'
#     , 4: 'usAccountID=66'
#     , 5: json.dumps({"apexAccountAddress":"One Dallas Center 350N. St Paul, Suite 1300, Dallas, TX 75201","apexAccountName":"Apex","apexAccountNumber":"3713286","apexBankAddress":"111 W Monroe St, Chicago,IL60603","apexBankName":"BMO Harris Bank","apexSwiftCode":"HATRUS44","usAccountId":"66","userBankInfoUrl":"https://bbae.com/faq/article/650","userBankName":"招行香港"})
#     , 6: 'symbol=%5B%7B%22exchangeCode%22%3A%22XNYS%22%2C%22symbol%22%3A%22R%22%2C%22type%22%3A%221%22%7D%5D'
#     , 7: 'symbol=%5B%7B%22exchangeCode%22%3A%22XNYS%22%2C%22symbol%22%3A%22R%22%2C%22type%22%3A%221%22%7D%5D'
#     , 8: 'symbol=%5B%7B%22exchangeCode%22%3A%22XNYS%22%2C%22symbol%22%3A%22F%22%2C%22type%22%3A%221%22%7D%2C%7B%22exchangeCode%22%3A%22ARCX%22%2C%22symbol%22%3A%22AAMC%22%2C%22type%22%3A%221%22%7D%5D&'
# }
#
# List_post_note = {
#     1: '修改密码'
#     , 2: '密码还原'
#     , 3: '发送手机验证码'
#     , 4: '验证旧邮箱'
#     , 5: '发送入金邮件'
#     , 6: '添加自选股'
#     , 7: '删除自选股'
#     , 8: '自选股排序'
# }
#
# List_post_payload = {
#     1: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
#     , 2: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
#     , 3: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
#     , 4: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
#     , 5: {'Content-Type': 'application/json; charset=UTF-8'}
#     , 6: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
#     , 7: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
#     , 8: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
# }
user_name = '18070505645'
pwd = '111111'
url_result = BaseURL+'/api/v1/security/magicCode'
List_get = []
List_post = []


def split_line():
    print '*'*50