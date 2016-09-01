# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainan.Zhang
# @ Date:2016-2-25
# Appium测试框架主功能
# ================================================================================
from function_list import init, login, gesture
from test_list import widget_dir
import sys


def main(driver, test_list):
    """
    :param driver: 初始化手机获得的driver
    :param test_list:需要的控件描述列表，按操作顺序（用例）排列
    :return:None
    Appium测试框架主功能
    """
    for item in test_list:
        if widget_dir[item]:
            action = driver.find_element_by_id(widget_dir[item][0])
            if widget_dir[item][1] == 1:
                action.click()
                print item + '功能点击成功'
            elif widget_dir[item][1] == 2:
                action.send_keys(widget_dir[item][2])
            else:
                print '你操作类型写错了吧'
                sys.exit(0)
        else:
            print '没找到你要的功能'
            sys.exit(0)


if __name__ == '__main__':
    test_list = ['搜索按钮', '搜索内容', '第一条结果']
    driver = init()
    login(driver)
    gesture(driver)
    gesture(driver)
    main(driver, test_list)