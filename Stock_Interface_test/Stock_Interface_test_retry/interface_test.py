# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# bbae接口测试登录状态模拟模块
# ===============================================================================
import urllib2
# BBAE
from InterFace_List import *
# 智能投顾
# from InterFace_List_Robot import *
import requests


def get_magic_code(url):
    """
    用于获取magicCode
    """
    response = requests.get(url)
    s_result = response.content
    # print type(s_result)
    # print s_result
    start = s_result.find('Data\":\"')
    end = s_result.find('\",\"DataTime\"')
    magic_code = s_result[start+7:end].replace('%', '%25')
    return magic_code


def get_ticket(m_code, username, password):
    """
    :param m_code:获取的magicCode
    :param username:用户名
    :param password:密码
    :return:登录使用的tokeyn
    """
    data = 'magic_code='+m_code+'&number=1&password='+password+'&userName='+username
    request = urllib2.urlopen(passport_url, data)
    content = request.read()
    start_ticket = content.find(':\"[\\\"')
    end_ticket = content.find('\\\"]\"')
    ticket = content[start_ticket+5:end_ticket]
    return ticket


def get_cookie(ticket):
    """
    :param ticket: tokeyn
    :return:登录后的cookie
    """
    date_use = {'ticket': ticket}
    r = requests.post(BaseURL+'/api/v1/security/login', date_use)
    cookie_use = r.cookies
    # print cookie_use
    return cookie_use


def login():
    """
    模拟登陆动作
    返回cookie=
    """
    code_use = get_magic_code(url_result)
    if code_use:
        print 'magic_code获取成功'
        print code_use
        split_line()
    else:
        print 'magic_code获取失败'
        return 0
    # print code_use
    ticket_use = get_ticket(code_use, user_name, pwd)
    if ticket_use:

        print 'ticket获取成功'
        print ticket_use
        split_line()
    else:
        print 'ticket获取失败'
        return 0
    # print ticket_use
    cookie = get_cookie(ticket_use)
    if cookie:
        print 'cookie获取成功'
        print cookie
        split_line()
        return cookie
    else:
        print 'cookie获取失败'
        return 0


def main_get(list_result, cookies):
    """
    用于模拟get请求，返回结果
    :param list_result:空列表，用于存储结果
    :param cookies: 登陆后的cookie
    :return:访问结果
    """
    for key in List_interface_get:
        try:
            f1 = requests.get(key, cookies=cookies)
            if f1:
                print f1.content
                print List_interface_get[key]+'接口访问成功'
                split_line()
            list_result.append(f1.content+'||'+key)
            # print f1.read()
        except AssertionError:
            print 'One Error in get'
            pass
    return list_result


def main_post(result_list, url_list, param_list, payload_list, note_list, cookies):
    """
    模拟post请求
    :param result_list: 结果字典
    :param url_list: 接口字典
    :param param_list: 入参字典
    :param payload_list: header字典
    :param notelist: 描述字典
    :param cookies: 登录获取的cookie
    :return:填充完成的结果列表
    """
    user_info = requests.post(url=BaseURL+'/api/v1/security/userInfo', cookies=cookies)
    if user_info:
        print user_info.content
        print '用户信息获取成功'
        split_line()
    else:
        print 'One Error in post'
    for key in range(1, 9):
        a = requests.post(url=url_list[key], data=param_list[key], headers=payload_list[key], cookies=cookies)
        try:
            if a.content:
                print a.content
                print note_list[key]+'接口访问成功'
                split_line()
            result_list.append(a.content+'||'+url_list[key])
        except AssertionError:
            print 'One Error in post'
            pass
    return result_list



# if __name__ == '__main__':
#     cookie = login()
#     main_post(List_post, List_interface_post, List_post_param, List_post_payload, List_post_note, cookie)
#     # main_get(List, cookie)