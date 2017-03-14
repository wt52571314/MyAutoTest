# # # # -*- coding: utf-8 -*-
# # # # ===============================================================================
# # # # @ Creator：Hainnan.Zhang
# # # # @ Date:2016-8-30
# # # # 小功能实验室
# # # # ===============================================================================
# # # """
# # # curl -i "http://merak-api.qa-01.jimu.com/api/v1/question/list?ittm=1265343|496B46668017857BE46F8783A0495138" -H "x-device-info: iPhone 5S/9.1.3/ios/8052399/4"
# # # """
import requests
import urllib
header = {'Accept': '*/*',
          'x-device-info': 'IPhone6/9.3.2/ios/8010122/3',
          'idfa': '8265BFF6-22A9-4003-87AA-0E3688741977',
          'Connection': 'keep-alive',
          'Accept-Encoding': 'gzip;q=1.0, compress;q=0.5',
          'Accept-Language': 'zh-Hans-CN;q=1.0',
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
          }
data_use = 'captcha=&la=0&lo=0&password=111111&username=11111112123'
r = requests.post('http://jmbx-miracle-app.qa-06.jimu.com/merak/login', data=data_use,
                  headers=header)
print r.content
cookie_use = r.cookies
# # proxies = {
# #     "http": "http://127.0.0.1:8888",
# #     "https": "http://127.0.0.1:8888"
# # }
payload = {'answers':
           [{"questionId": 17, "questionAns": 61}, {"questionId": 18, "questionAns": 65}, {"questionId": 20, "questionAns": 75}, {"questionId": 22, "questionAns": 85}, {"questionId": 23, "questionAns": 90}, {"questionId": 24, "questionAns": 95}, {"questionId": 25, "questionAns": 97}, {"questionId": 26, "questionAns": 100}, {"questionId": 27, "questionAns": 101}, {"questionId": 28, "questionAns": 104}, {"questionId": 29, "questionAns": 106}, {"questionId": 30, "questionAns": 108}, {"questionId": 31, "questionAns": 112}, {"questionId": 32, "questionAns": 120}],  'la': 0, 'lo': 0
           }
#
a = requests.post('http://jmbx-miracle-app.qa-06.jimu.com/merak/api/v2/question/saveQuestion',
                  headers=header, data=urllib.urlencode(payload), cookies=cookie_use)
print a.content
#
# datas = 'riskLevel=BE&age=19'
# headers = {
#     'Accept': 'application/json, text/javascript, */*; q=0.01',
#     'Accept-Encoding': 'gzip, deflate',
#     'Accept-Language': 'zh-CN,zh;q=0.8',
#     'Content-Length': 19,
#     'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
# }
# a = requests.post('http://merak-www.qa-01.jimu.com/portfolio',
#                   data=datas, headers=headers)
# print a.content
# print a.headers