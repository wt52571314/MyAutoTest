# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2017-04-19
# 创建04文件
# ===============================================================================
import requests
import json
# TODO 需要完善
url = 'https://anbang-qa-01.hongdianfund.com/api/v1/user/login'
url1 = 'https://anbang-qa-01.hongdianfund.com/api/v1/assets/assetsDetail'
data = 'phone=15070897534&password=1111111a'
headers = {
    'Accept': '*/*',
    'x-device-info': 'nil/nil/7/nil',
    'idfa': '8265BFF6-22A9-4003-87AA-0E3688741977',
    'Connection': 'keep-alive',
    'Accept-Encoding': 'gzip;q=1.0, compress;q=0.5',
    'Accept-Language': 'zh-Hans-CN;q=1.0',
    'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
}
req = requests.post(url, data=data, headers=headers)
token = json.loads(req.content)['data']['token']
key = json.loads(req.content)['data']['key']
cookies = req.cookies
print req.content
print token
print key
print 'there!!!'
headers1 = {
    'x-device-info': 'nil/nil/7/nil',
    'Access-Token': token,
    'Access-Key': key
}
print 'here!!!'
req1 = requests.get(url1, headers=headers1, cookies=cookies)
print req1.content
