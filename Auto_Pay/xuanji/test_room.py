# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-8-30
# 小功能实验室
# ===============================================================================
"""
curl -i "http://merak-api.qa-01.jimu.com/api/v1/question/list?ittm=1265343|496B46668017857BE46F8783A0495138" -H "x-device-info: iPhone 5S/9.1.3/ios/8052399/4"
"""
import requests
header = {'x-device-info': 'iPhone 5S/9.1.3/ios/8052399/4'}
a = requests.get('http://merak-api.qa-01.jimu.com/api/v1/question/list?ittm=1265343|496B46668017857BE46F8783A0495138',
                 headers=header)
print a.content