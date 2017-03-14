# # # # # -*- coding: utf-8 -*-
# # # # # ===============================================================================
# # # # # @ Creator：Hainnan.Zhang
# # # # # @ Date:2016-8-30
# # # # # 小功能实验室
# # # # # ===============================================================================
# # # # """
# # # # curl -i "http://merak-api.qa-01.jimu.com/api/v1/question/list?ittm=1265343|496B46668017857BE46F8783A0495138" -H "x-device-info: iPhone 5S/9.1.3/ios/8052399/4"
# # # # """
import requests
# import json
# import urllib2
# import cookielib
# header = {'Host': 'merak-jinshi.qa-01.jimu.com',
#           'Connection': 'keep-alive',
#           'Content-Length': 553,
#           'Pragma': 'no-cache',
#           'Cache-Control': 'no-cache',
#           'Accept': '*/*',
#           'Origin': 'http://merak-jinshi.qa-01.jimu.com',
#           'X-Requested-With': 'XMLHttpRequest',
#           'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.82 Safari/537.36',
#           'Content-Type': 'application/json',
#           'Accept-Encoding': 'gzip, deflate',
#           'Accept-Language': 'zh-CN,zh;q=0.8'
#           }
#
# header_login = {'Accept': '*/*',
#                 'x-device-info': 'IPhone6/9.3.2/ios/8010122/3',
#                 'idfa': '8265BFF6-22A9-4003-87AA-0E3688741977',
#                 'Connection': 'keep-alive',
#                 'Accept-Encoding': 'gzip;q=1.0, compress;q=0.5',
#                 'Accept-Language': 'zh-Hans-CN;q=1.0',
#                 'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
#                 }
#
# data_use = 'userName=11100002222&loginPass=111111'
#
# r = requests.post('http://merak-jinshi.qa-01.jimu.com/user/login',
#                   data=data_use, headers=header_login)
#
# # print r.content
# cookie_use = r.cookies
#
#
# payload = [{"questionId": 17, "questionAns": 61},
#            {"questionId": 18, "questionAns": 65},
#            {"questionId": 20, "questionAns": 75},
#            {"questionId": 22, "questionAns": 85},
#            {"questionId": 23, "questionAns": 90},
#            {"questionId": 24, "questionAns": 94},
#            {"questionId": 25, "questionAns": 96},
#            {"questionId": 26, "questionAns": 98},
#            {"questionId": 27, "questionAns": 102},
#            {"questionId": 28, "questionAns": 103},
#            {"questionId": 29, "questionAns": 105},
#            {"questionId": 30, "questionAns": 110},
#            {"questionId": 31, "questionAns": 114},
#            {"questionId": 32, "questionAns": 116},
#            ]
#
# a = requests.post('http://merak-jinshi.qa-01.jimu.com/question/saveQuestion',
#                   headers=header, data=json.dumps(payload), cookies=cookie_use)
# print a.content
#
# b = requests.get('http://merak-jinshi.qa-01.jimu.com/question/result', cookies=cookie_use)
# print str(b.text)
#
#
# # datas = 'riskLevel=BE&age=19'
# # headers = {
# #     'Accept': 'application/json, text/javascript, */*; q=0.01',
# #     'Accept-Encoding': 'gzip, deflate',
# #     'Accept-Language': 'zh-CN,zh;q=0.8',
# #     'Content-Length': 19,
# #     'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
# # }
# # a = requests.post('http://merak-www.qa-01.jimu.com/portfolio',
# #                   data=datas, headers=headers)
# # print a.content
# # # print a.headers


# header = {'Accept': '*/*',
#           'x-device-info': 'IPhone6/9.3.2/ios/8010122/3',
#           'idfa': '8265BFF6-22A9-4003-87AA-0E3688741977',
#           'Connection': 'keep-alive',
#           'Accept-Encoding': 'gzip;q=1.0, compress;q=0.5',
#           'Accept-Language': 'zh-Hans-CN;q=1.0',
#           'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
#           }
# data_use = 'captcha=&la=0&lo=0&password=111111&username=11122226666'
# r = requests.post('http://jmbx-miracle-app.qa-06.jimu.com/merak/login', data=data_use,
#                   headers=header)
# cookie = r.cookies
# data = 'mobile=11100001111&mobileCode=952700&magicCode=A24976FF9EC62F4CFAE8F2E35F900EA9&type=4'
# a = requests.post('http://jmbx-miracle-app.qa-06.jimu.com/jimu/api/v1/security/bind/mobile/smsVerify/v2',
#                   data=data, cookies=cookie, headers=header)
a = requests.post('http://jmbx-miracle-app.qa-01.jimu.com/merak/api/v1/user/forgetTradePassword/verifyIdCard?idCard=152528199204120035')
print type(a.content)
print a.content
