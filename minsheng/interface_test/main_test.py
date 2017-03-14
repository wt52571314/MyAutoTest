# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：zhn
# @ Date:2016-11-09
# 民生项目接口测试功能模块封装
# ===============================================================================
from config_list import *
from base_function import *
import time


if __name__ == '__main__':
    result_get_list = []
    result_post_list = []
    cookie = login(Login_url, username, password, user_style)
    for key in get_list:
        result_get = get_function(key, get_list[key], get_note[key], cookie, proxies)
        result_get_list.append(result_get)
        time.sleep(1)
    get_log = check(result_get_list, get_check_list)
    split_line()
    print 'get 测试结果：'
    for i in get_log:
        print i
    split_line()
    for key in post_list:
        result_post = post_function(key
                                    , post_list[key]
                                    , post_payload[key]
                                    , post_data[key]
                                    , post_note[key]
                                    , cookie
                                    , proxies)
        result_post_list.append(result_post)
        time.sleep(1)
    post_log = check(result_post_list, post_check_list)
    split_line()
    print 'post 测试结果：'
    for j in post_log:
        print j
    split_line()
    logout()
