# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-2-22
# 积木股票接口测试实例
# ===============================================================================
from dummy import *
url = 'https://sj-api-02.jimustock.com/api/v1/info?skip=0&take=50&type=realtime '
code, head, res, errcode, final_url = curl.curl2(url)
print 'code:'+str(code)
print 'head:'+str(head)
print 'res:'+str(res)
print 'errcode:'+str(errcode)
print 'final_url:'+str(final_url)