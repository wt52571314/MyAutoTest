# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainan.Zhang
# @ Date:2016-8-9
# 执行job
# ================================================================================
import requests
# import time
post_payload = 'launch=Launch&jobParameters=c%3D33&origin=job'
post_header = {'Content-Type':	'application/x-www-form-urlencoded; charset=UTF-8'}
a = requests.post('http://stock-console-trade-us.qa-01.bbaecdn.com/jobs/transferFundSettlementJob',
                  data=post_payload, headers=post_header)
print a.content
