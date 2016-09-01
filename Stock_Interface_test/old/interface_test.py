# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# 积木股票接口测试登录状态模拟模块
# ===============================================================================
import urllib2
import cookielib

from InterFace_List import *


def get_magic_code(url):
    """
    用于获取magicCode
    """
    try:
        s_result = urllib2.urlopen(url).read()
        # print type(s_result)
        # print s_result
        start = s_result.find('Data\":\"')
        end = s_result.find('\",\"DataTime\"')
        magic_code = s_result[start+7:end].replace('%', '%25')
        return magic_code
    except urllib2.HTTPError, e:
        print e.code
    except urllib2.URLError, e:
        print str(e)


def get_ticket(m_code, username, password):
    url = 'https://passport.jimustock.com/authentication/loginOnApp/body'
    data = 'magic_code='+m_code+'&number=1&password='+password+'&userName='+username
    request = urllib2.urlopen(url, data)
    content = request.read()
    # print content
    start_ticket = content.find(':\"[\\\"')
    end_ticket = content.find('\\\"]\"')
    ticket = content[start_ticket+5:end_ticket]
    return ticket


def get_cookie(ticket):
    date_use = 'ticket='+ticket
    cookie_use = cookielib.CookieJar()
    handler = urllib2.HTTPCookieProcessor(cookie_use)
    opener = urllib2.build_opener(handler)
    urllib2.install_opener(opener)
    ff = urllib2.urlopen('https://bbae-api.jimustock.com/api/v1/security/login', date_use)
    # print ff.read()
    str1 = ''
    for cookie in cookie_use:
        b = str(cookie)
        a = b[b.find('ie ')+3:b.find(' for')]
        str1 = str1 + a + ';'
        a = ''
    return str1


def main(list_result):
    code_use = get_magic_code(url_result)
    # print code_use
    ticket_use = get_ticket(code_use, user_name, pwd)
    # print ticket_use
    cookie = get_cookie(ticket_use)
    print cookie
    opener_1 = urllib2.build_opener()
    opener_1.addheaders.append(('Cookie', cookie))
    for interface in List_interface:
        try:
            f1 = opener_1.open(interface)
            list_result.append(f1.read()+'||'+interface)
            # print f1.read()
        except AssertionError:
            print 'One Error in network'
            pass
    return list_result

