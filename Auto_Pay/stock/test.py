# # -*- coding: utf-8 -*-
# # ===============================================================================
# # @ Creator：Hainnan.Zhang
# # @ Date:2016-3-24
# # test room
# # ===============================================================================
import requests

from Auto_Pay.stock.interface_test import login


cookie = login()
#
# split_line()
#
payload = {
        'Host': 'bbae-api-develop.bbaecdn.com',
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': '*/*',
        'Connection': 'keep-alive',
        'Proxy-Connection': 'keep-alive',
        'Accept-Language': 'en',
    }
# # answer_result = requests.post('https://sj-api-01.jimustock.com/api/v1/us/roboAdvisor/postSurveyResult',
# #                               data=json.dumps(answer), headers=payload, cookies=cookie)
# # print answer_result.content
# # ===========================================================================================================================
# data_use = {"mediumRiskPercentage": 0, "portfolioId": "30_BAM", "roboAccountId": "122", "highRiskPercentage": 100, "lowRiskPercentage": 0}
a = requests.get('http://bbae-api-develop.bbaecdn.com/api/v1/us/account/riskSurveyQuestion?idType=1',
                headers=payload, cookies=cookie)
# b = requests.get('https://sj-api-01.jimustock.com/api/v1/us/roboAdvisor/getPortfolioDetails?portfolioIds=36_BALH',
#                 headers=payload, cookies=cookie)

print a.content
# print b.content


# # ============================================================================================================================
# # a = requests.get('https://sj-api-01.jimustock.com/api/v1/us/roboAdvisor/getPortfolioDetails?portfolioIds=35_GRM',
# #                  headers=payload)#, cookies=cookie)
# # str1 = a.content
# # print str1
# # split_line()
# b = requests.get('https://sj-api-01.jimustock.com/api/v1/us/roboAdvisor/closeAccount?roboAccountId=122',
#                  headers=payload, cookies=cookie)
# str2 = b.content
# print str2
# # split_line()
# # print str1 == str2

