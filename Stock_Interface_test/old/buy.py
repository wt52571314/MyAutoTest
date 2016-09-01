# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# 积木股票接口测试买
# ===============================================================================
from Stock_Interface_test.old.interface_test import *
from Stock_Interface_test.old.InterFace_List import *
code_use = get_magic_code(url_result)
# print code_use
ticket_use = get_ticket(code_use, user_name, pwd)
# print ticket_use
date_use = 'ticket='+ticket_use
cookie_use = cookielib.CookieJar()
handler = urllib2.HTTPCookieProcessor()
opener = urllib2.build_opener(handler)
urllib2.install_opener(opener)
ff = opener.open('https://stock-api.jimustock.com/api/v1/security/login', date_use)
# interface = 'https://stock-api.jimu.com/api/v1/market/getStockDetailInfo?exchangeCode=XNYS&stockType=1&symbol=ACW'
interface1 = 'https://stock-api.jimu.com/api/v1/us/trade/validateBuy'
data1 = 'entrustAmount=1&entrustPrice=0.1&symbol=ACW&usAccountId=66&type=LIMIT&orderTimeInForce=DAY'
interface2 = 'https://stock-api.jimu.com/api/v1/trade/buy'
data2 = 'usAccountId=66&entrustPrice=0.1&stock=ACW,XNYS,1&entrustAmount=1&orderTimeInForce=DAY&type=LIMIT&expectedCommission=0.8800'
# f = urllib2.urlopen(interface)
# print f.read()
f3 = urllib2.Request(url=interface1, data=data1)
ff = opener.open(f3)
print ff.read()
f2 = urllib2.Request(interface2, data2)
ff = opener.open(f2)
print ff.read()