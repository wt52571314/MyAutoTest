# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator:张海南
# @ Date:2016-4-18
# @ 描述：Android版BBAE语言切换功能测试
#  ===============================================================================
from appium import webdriver
import time


def test(driver):

    # =================================================================================
    # 开始测试
    # =================================================================================
    button_user = driver.find_element_by_id('main2_headicon')   # 右上角我的账户按钮
    # self.assertIsNotNone(el)
    button_user.click()
    time.sleep(2)

    button_preferences = driver.find_element_by_id('account_persented_title')  # 个性设置按钮
    button_preferences.click()
    time.sleep(2)

    button_language = driver.find_element_by_id('account_langvage_colortitle')  # 语言按钮
    button_language.click()
    time.sleep(2)

    text1 = driver.find_element_by_id('titleBarCenterTitle')
    if text1.text == 'Language':
        checked_radio = driver.find_element_by_id('check_cn')
        checked_radio.click()
    else:
        checked_radio = driver.find_element_by_id('check_en')
        checked_radio.click()

    button_back = driver.find_element_by_id('titleBarLeftImage')
    button_back.click()
    time.sleep(2)


if __name__ == '__main__':
    # =======================================================================================
    # 设备初始化
    # ==================================================================================
    desired_caps = {}
    desired_caps['deviceName'] = 'CVH7N16317000930'  # adb devices查到的设备名
    desired_caps['platformName'] = 'Android'
    desired_caps['platformVersion'] = '6.0.2'
    desired_caps['appPackage'] = 'com.bbae.stock'  # 被测App的包名
    desired_caps['appActivity'] = 'com.bbae.stock.activity.AppStartActivity' # 启动时的Activity
    driver_use = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)
    time.sleep(6)
    while 1 == 1:
        test(driver_use)