# -*- coding=utf-8 -*-
# import requests
# import json
#
# base_url = 'http://jdz-portfolio-v2.qa-06.jimu.com'
# url = '/user/saveQuestionAns/v2'
# header = {'Accept': '*/*',
#           'idfa': '8265BFF6-22A9-4003-87AA-0E3688741977',
#           'Connection': 'keep-alive',
#           'Accept-Encoding': 'gzip;q=1.0, compress;q=0.5',
#           'Accept-Language': 'zh-Hans-CN;q=1.0',
#           'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
#           }
# data = """
# {"answers":"[{"questionId":"17","questionAns":"62"},{"questionId":"19","questionAns":"72"},{"questionId"
# :"21","questionAns":"82"},{"questionId":"22","questionAns":"87"},{"questionId":"23","questionAns":"93"
# },{"questionId":"24","questionAns":"95"},{"questionId":"25","questionAns":"96"},{"questionId":"26","questionAns"
# :"99"},{"questionId":"27","questionAns":"102"},{"questionId":"28","questionAns":"104"},{"questionId"
# :"29","questionAns":"105"},{"questionId":"30","questionAns":"109"},{"questionId":"31","questionAns":"113"
# },{"questionId":"32","questionAns":"119"}]","channelId":"1001","questionType":1,"uid":"1285550"}
# """
# req = requests.post(base_url+url, data=json.dumps(data))
# print req.content

a = {
    1: '工商银行',
    2: '农业银行',
    3: '中国银行',
    4: '建设银行',
    5: '交通银行',
    6: '招商银行',
    7: '邮储银行',
    8: '兴业银行',
    9: '中信银行',
    10: '光大银行',
    11: '民生银行',
    12: '浦发银行',
    13: '平安银行',
    14: '华夏银行',
    15: '广发银行',
    16: '上海银行',
    17: '北京银行'
}

b = {
    1: 6001,
    2: 6002,
    3: 6003,
    4: 6004,
    5: 6005,
    6: 6006,
    7: 6007,
    8: 6008,
    9: 6009,
    10: 6010,
    11: 6011,
    12: 6012,
    13: 6013,
    14: 6014,
    15: 6015,
    16: 6016,
    17: 6017
}
dir_use = {}
for key in range(1, 18):
    dir_use[b[key]] = a[key]
print dir_use
