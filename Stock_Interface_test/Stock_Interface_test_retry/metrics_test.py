# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# bbae监控系统测试（接口访问）
# ===============================================================================
from interface_test import *
from InterFace_List import BaseURL
import requests


def do_get(url=None, cookie=None):
    get_result = requests.get(url, cookies=cookie)
    print get_result.content


def do_post(url=None, data=None, payload=None, cookie=None):
    post_result = requests.post(url, data=data, headers=payload, cookies=cookie)
    print post_result.content

if __name__ == '__main__':
    cookies = login()
    # do_get(BaseURL+'/api/v1/market/getTimeTrend?days=1&exchangeCode=XNYS&period=1&stockType=1&symbol=BABA')
    do_post(url='https://sj-api-01.jimustock.com/api/v1/us/account/sendEmailCaptcha', data='Email=hainan.zhang%40jimubox.com&usAccountID=320&', payload={'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}, cookie=cookies)
