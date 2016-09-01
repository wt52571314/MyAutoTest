# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# post with cookie
# ===============================================================================
from interface_test import *
from InterFace_List import *
import requests
import json


def buy():
    # payload_validateBuy = {
    #     "entrustAmount": "1", "entrustPrice": "1.39",
    #     "symbol": "ACW",
    #     "usAccountId": 375,
    #     "type": "LIMIT",
    #     "orderTimeInForce": "DAY"
    # }
    payload_buy = {"entrustAmount":1,
    "entrustPrice":1.43,
    "expectedCommission":1.9899999999999999911182158029987476766109466552734375,
    "orderTimeInForce":"DAY",
    "portfolioPlanId":0,
    "stock":"ACW,,1",
    "symbol":"ACW",
    "type":"MARKET",
    "usAccountId":"375"}
    # {
    #     "entrustPrice": "1.435",
    #     "stock": "ACW,XNYS,1",
    #     "entrustAmount": "1",
    #     "orderTimeInForce": "DAY",
    #     "type": "LIMIT",
    #     "expectedCommission": "1.9899999999999999911182158029987476766109466552734375"
    # }

    # {payload_add = {
    #     "exchangeCode": "XNYS",
    #     "type": "1",
    #     "symbol": "ACW"
    # }

    cookie = login()

    header = {
        'Accept-Language': 'zh-CN',
        'Content-Type': 'application/json; charset=UTF-8',
        'User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 6.0; HUAWEI NXT-DL00 Build/HUAWEINXT-DL00)',
        'Host': 'sj-api-01.jimustock.com',
        'Connection': 'Keep-Alive',
        'Accept-Encoding': 'gzip',
        'Content-Length': 226
    }
    # print type(json.dumps(payload_validateBuy))
    # validateBuy = requests.post(BaseURL+'/api/v1/us/trade/validateBuy', data=json.dumps(payload_validateBuy),
    #                             headers=header, cookies=cookie)
    buy_sure = requests.post(BaseURL+'/api/v1/trade/buy', data=json.dumps(payload_buy),
                             headers=header, cookies=cookie)
    # # add = requests.post(BaseURL+'/api/v1/market/portfolio/add', data=payload_add, cookies=cookie)
    # print validateBuy.content
    print buy_sure.content
    # # print add.content
if __name__ == '__main__':
    buy()