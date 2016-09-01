# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# 模拟浏览器
# ===============================================================================
from Stock_Interface_test.old.interface_test import *
from Stock_Interface_test.old.InterFace_List import *


class MyWeb():
    """
        模拟一个浏览器
    """
    def __init__(self):
        self.header = {
            "User-Agent": "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0"
        }
        self.cookie = cookielib.CookieJar()
        self.cookie_support = urllib2.HTTPCookieProcessor(self.cookie)
        self.opener = urllib2.build_opener(self.cookie_support,
                                           urllib2.HTTPHandler)
        # urllib2.install_opener(self.opener)
 
    def post(self, posturl, dictdata):
        """
        模拟post请求
 
        :param string posturl: url地址
        :param dict dictdata: 发送的数据
        """
        request = urllib2.Request(posturl, dictdata, self.header)
        try:
            content = self.opener.open(request)
            return content
        except Exception, e:
            print ("post:" + str(e))
            return None
 
    def get(self, url):
        """
        模拟get请求
 
        :param url: url地址
        :return content: 常使用read的方法来读取返回数据
        :rtype : instance or None
        """
        request = urllib2.Request(url, None, self.header)
        try:
            content = urllib2.urlopen(request)
            return content
        except Exception, e:
            print ("open:" + str(e))
            return None
 
 
if __name__ == "__main__":
    web = MyWeb()
    code_use = get_magic_code(url_result)
    # print code_use
    ticket_use = get_ticket(code_use, user_name, pwd)
    # print ticket_use
    date_use = 'ticket='+ticket_use
    login = web.post('https://stock-api.jimustock.com/api/v1/security/login', date_use)
    print login.read()
    url = 'https://stock-api.jimu.com/api/v1/us/trade/validateBuy'
    data = 'entrustAmount=1&entrustPrice=0.1&symbol=ACW&usAccountId=66&type=LIMIT&orderTimeInForce=DAY'
    res = web.post(url, data)
    print res.read()