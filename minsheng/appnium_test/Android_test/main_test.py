# -*- coding:utf-8 -*-
# ======================================================================================================
# @Auther:ZHN
# @TIME:2016-11-16
# 民生项目兼容性测试主函数脚本
# =====================================================================================================
from function_list import *
if __name__ == '__main__':
    driver_1 = init(remote_url='http://localhost:4723/wd/hub', uuid='', deviceName='')
    driver_2 = init(remote_url='http://localhost:4724/wd/hub', uuid='', deviceName='')
    login(driver_1)
    login(driver_2)
