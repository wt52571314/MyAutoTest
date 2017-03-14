# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-17
# 功能列表
# https://www.lagou.com/jobs/list_%E6%B5%8B%E8%AF%95?city=%E5%8C%97%E4%BA%AC&cl=false&fromSearch=true&labelWords=&suginput=
# ===============================================================================
import requests
from bs4 import BeautifulSoup


def get_content(url_use, *args, **kwargs):
    """
    获取目标url的返回内容content
    :param url_use: 需要访问的url
    :param args: 无键值参数
    :param kwargs: 有键值参数
    :return: url返回的content
    """
    data = None
    cookies = None
    headers = None
    proxies = None
    if kwargs['data'] is not None:
        data = kwargs['data']
    if kwargs['cookies'] is not None:
        cookies = kwargs['cookies']
    if kwargs['headers'] is not None:
        headers = kwargs['headers']
    if kwargs['proxies'] is not None:
        proxies = kwargs['proxies']
    req = requests.get(url_use
                       , data=data
                       , cookies=cookies
                       , headers=headers
                       , proxies=proxies
                       )
    return req.content


def check_html(*args, **kwargs):
    """
    解析html变量，返回Beautifulsoup对象,解析为lxml
    :param args: 无键值参数
    :param kwargs: 有键值参数
    :return: 返回Beautifulsoup对象
    """
    if kwargs['html_code'] is not None:
        soup = BeautifulSoup(kwargs['html_code'], 'lxml')
    elif kwargs['html_path'] is not None:
        soup = BeautifulSoup(open(kwargs['html_path']), 'lxml')
    else:
        print 'Oops!!! No param defined'
    return soup



