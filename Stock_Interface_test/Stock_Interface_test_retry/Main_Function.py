# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# 积木股票接口测试登录状态模拟模块
# ===============================================================================
from interface_test import *
# import time
i = 0
if __name__ == '__main__':
    # while True:
    f = open('D:\log\inter_face_test.log', 'w')
    cookies = login()
    list_result = main_get(List_get, cookies)
    result_list = main_post(List_post, List_interface_post, List_post_param, List_post_payload, List_post_note, cookies)
    list_result.extend(result_list)
    for note in list_result:
        if "操作成功" in note:
            # print u'成功'
            # split_line()
            a = note[note.find('||'):]
            f.write(a+'######succeed')
            f.write('\n')
        else:
            # print u'失败'
            # split_line()
            b = note[note.find('||'):]
            f.write(b+'#####failed')
            f.write('\n')
        # i += 1
        # if i < 100:
        #     pass
        # else:
        #     f.truncate()
    f.close()
    # time.sleep(600)