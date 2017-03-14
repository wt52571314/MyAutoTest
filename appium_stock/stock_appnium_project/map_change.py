# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator:张海南
# @ Date:2016-4-18
# @ 描述：分时五日切换
# @ 创建原因：分时五日快速切换会导致应用崩溃，该脚本切换速率下，应用不应崩溃
#  ===============================================================================
import time
from function_list import gesture, init
import random


def test(driver):

    text = random.choice(['分时', '五日', '日K', '周K', '月K'])
    if text == '分时':
        button_fs = driver.find_element_by_xpath("//android.widget.TextView[contains(@text,'分时')]")
        button_fs.click()
    elif text == '五日':
        button_wr = driver.find_element_by_xpath("//android.widget.TextView[contains(@text,'五日')]")
        button_wr.click()
    elif text == '日K':
        button_rk = driver.find_element_by_xpath("//android.widget.TextView[contains(@text,'日K')]")
        button_rk.click()
    elif text == '周K':
        button_zk = driver.find_element_by_xpath("//android.widget.TextView[contains(@text,'周K')]")
        button_zk.click()
    elif text == '月K':
        button_yk = driver.find_element_by_xpath("//android.widget.TextView[contains(@text,'月K')]")
        button_yk.click()

if __name__ == '__main__':
    driver_use = init()  # 设备初始化
    time.sleep(15)
    gesture(driver_use)  # 手势密码解锁，一道横线，若不是请修改该方法
    time.sleep(5)
    button_stock = driver_use.find_element_by_id('com.bbae.anno:id/attentionitem_name')  # 自选列表第一条股票
    button_stock.click()
    time.sleep(3)
    while 1 == 1:
        test(driver_use)
