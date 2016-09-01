# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# 积木股票接口测试登录状态模拟模块
# ===============================================================================
import time

from interface_test import *

i = 0
if __name__ == '__main__':
    while True:
        f = open('D:\log\inter_face_test.log', 'a+')
        list_result = main(List)
        for note in list_result:
            if '操作成功' in note:
                print u'成功'
                a = note[note.find('||'):]
                f.write(a+'######succeed')
                f.write('\n')
            else:
                print u'失败'
                b = note[note.find('||'):]
                f.write(b+'#####failed')
                f.write('\n')
            i += 1
            if i < 100:
                pass
            else:
                f.truncate()
        f.close()
        time.sleep(600)