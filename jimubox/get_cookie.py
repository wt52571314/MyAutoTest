# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-5-26
# 积木盒子自动收钱工具（cookie获取）
# ===============================================================================
from source_list import *
import urllib
import urllib2


def get_ticket(url):
    payload = {
        'username': username
        , 'password': password
        , 'agreeContract': 'on'
    }
    payload_use = 'site=B662B0F090BE31C1DCB6A13D70E81429&'+urllib.urlencode(payload)+'&redirectUrl=https://www.jimu.com/User/AssetOverview'
    request = urllib2.urlopen(BaseUrl_passport, payload_use)
    str = request.read()
    start = str.find('ticket')+10
    end = str.find('var rawTop')
    str_second = str[start:end]
    # print str_second
    end_second = str_second.find('";')
    # print end_second
    # print str_second[:end_second]
    return str_second[:end_second]

if __name__ == '__main__':
    print get_ticket(BaseUrl_passport)