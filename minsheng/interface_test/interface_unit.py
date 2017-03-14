# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：zhn
# @ Date:2016-11-09
# 民生项目单个接口访问脚本
# ===============================================================================
import requests
import json
import urllib
from base_function import login
from config_list import *

payload = {'Accept': '*/*',
           'Accept-Encoding': 'gzip, deflate, br',
            'Accept-Language': 'zh-CN,zh;q=0.8',
            'Cache-Control': 'no-cache',
            'Connection': 'keep-alive',
            'Content-Length': '38',
            'content-type': 'application/x-www-form-urlencoded',
            'Cookie': 'JSESSIONID=1307A67D07B4E053296E9532106D8E5E',
            'Host': 'm-qa-01.maifenbaoxian.com',
            'Origin': 'https://m-qa-01.maifenbaoxian.com',
            'Pragma': 'no-cache',
            'Referer': 'https://m-qa-01.maifenbaoxian.com/statics/forgetPswdReset',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Mobile Safari/537.36'
           }
# cookie = login(Login_url, username, username, password, user_style)
data = {'phone': '14400002222',
        'password': '333333',
        'confirmPassword': '333333'
        }

url_get = ''
url_post = 'https://m-qa-01.maifenbaoxian.com/api/user/confirm/forgot/password'

data_use1 = json.dumps(data)
data_use2 = urllib.urlencode(data)

req_post = requests.post(url_post, data=data_use2)
# req_get = requests.get(url_get, data=data_use1, cookies=cookie, proxies=proxies)

print req_post.content
