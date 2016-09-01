# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# post with cookie
# ===============================================================================
import requests

from interface_test import *
from Stock_Interface_test.old.InterFace_List import *

code_use = get_magic_code(url_result)
# print code_use
ticket_use = get_ticket(code_use, user_name, pwd)
# print ticket_use
date_use = {'ticket': ticket_use}
r = requests.post('https://bbae-api.jimustock.com/api/v1/security/login', date_use)
cookie_use = r.cookies
print cookie_use
interface1 = 'https://bbae-api.jimustock.com/api/v1/us/trade/validateBuy'
data1 = {"entrustAmount": 1, "entrustPrice": 0.10, "orderTimeInForce": "DAY", "symbol": "ACW", "type": "LIMIT", "usAccountId": "66"}
response = requests.post(interface1, data=data1, cookies=cookie_use)
print response.content
interface2 = 'https://bbae-api.jimustock.com/api/v1/trade/buy'
data2 = {'usAccountId': 66, 'entrustPrice': 0.1, 'stock': 'ACW,XNYS,1', 'entrustAmount': 1, 'orderTimeInForce': 'DAY', 'type': 'LIMIT', 'expectedCommission': 0.0000}
