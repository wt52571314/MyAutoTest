# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：zhn
# @ Date:2016-11-09
# 民生项目接口测试功能模块封装
# ===============================================================================
from config_list import *
import requests


def login(login_url, l_username, l_password, l_user_style):
    """
    登录模块
    :param login_url: 登录接口
    :param l_username: 用户名
    :param l_password: 密码
    :param l_user_style: 用户类型
    :return: 登录获得的cookie
    """
    data = 'username='+str(l_username)+'password='+str(l_password)+'user_style='+str(l_user_style)
    payload = {}
    login_request = requests.post(login_url, data=data, headers=payload)
    cookies = login_request.cookies
    return cookies


def get_function(index_num, interface, note, cookie, proxies):
    """
    get方式实现模块
    :param index_num: 接口key，代表第几个接口
    :param interface: get方式访问的接口
    :param note: get方式访问的接口对应描述
    :param cookie: 登录获取的cookie
    :param proxies: 代理
    :return: 测试结果
    """
    return None


def post_function(index_num, interface, payload, data, note, cookie, proxies):
    """
    post实现方式
    :param index_num: 接口key，代表第几个接口
    :param interface: 用于post方式的接口
    :param payload: post方式请求头
    :param data: post方式数据
    :param note: post方式描述
    :param cookie: 登录获取的cookies
    :param proxies: 代理
    :return: 测试结果
    """
    return None


def check(result_list, check_list):
    """
    检查输出
    :param result_list: post或者get方式返回的测试结果
    :param check_list: 用于检查结果的数据
    :return: 检查结果-是否通过
    """
    return None


def logout():
    return None

#
# if __name__ == '__main__':
#     print 'test'
