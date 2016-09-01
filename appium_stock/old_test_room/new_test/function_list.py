# -*- coding:utf-8 -*-
# ======================================================================================================
# @Auther:ZHN
# @TIME:2016-6-27
# 股票自动化所使用的功能列表
# =====================================================================================================
from appium import webdriver
from appium.webdriver.common.touch_action import TouchAction
import time


def init():
    """
    初始化测试环境
    :return:返回webderiver实例
    """
    desired_caps = {}
    desired_caps['deviceName'] = 'CVH7N16317000930'  # adb devices查到的设备名-- GooGle_mobile
    # desired_caps['deviceName'] = 'W8RDU15803002568'   # 华为手机
    desired_caps['platformName'] = 'Android'
    desired_caps['platformVersion'] = '6.0'
    desired_caps['appPackage'] = 'com.bbae.anno'  # 被测App的包名
    desired_caps['appActivity'] = 'com.bbae.anno.activity.AppStartActivity' # 启动时的Activity
    driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)
    return driver


def login(driver):
    """
    bbae登录功能
    :param driver: 初始化获取的webdriver
    :return:no
    """
    button1 = driver.find_element_by_id('main2_headicon')
    # self.assertIsNotNone(el)
    button1.click()

    button_login = driver.find_element_by_id('aboutus_login')
    button_login.click()

    text_username = driver.find_element_by_id('login_name')
    text_username.send_keys('******')

    text_password = driver.find_element_by_id('login_pwd')
    text_password.send_keys('******')

    text_ok = driver.find_element_by_id('login_pwdShowstatus')
    text_ok.click()

    button_pass = driver.find_element_by_id('accountbutton_text')
    button_pass.click()


def gesture(driver):
    """
    画手势密码,现在为第一排一横线，华为nexus6P手机，其他手机需要更换坐标点
    :param driver: 初始化获取的webdriver
    :return:no
    """
    action = TouchAction(driver)
    # move_to一定是相对坐标
    unlock = action.press(x=240, y=915).wait(ms=100)\
        .move_to(x=480, y=0).wait(ms=100)\
        .move_to(x=480, y=0).wait(ms=100)\
        .release()
    unlock.perform()


def language_change(driver):
    """
    情况下切换语言的功能
    :param driver: 初始化获取的webdriver
    :return:no
    """
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


def style_change(driver):
    """
    黑白风格切换
    :param driver: 初始化获取的webdriver
    :return:no
    """
    button_user = driver.find_element_by_id('main2_headicon')   # 右上角我的账户按钮
    # self.assertIsNotNone(el)
    button_user.click()
    time.sleep(2)

    button_preferences = driver.find_element_by_id('account_persented_title')  # 个性设置按钮
    button_preferences.click()
    time.sleep(2)

    button_style = driver.find_element_by_id('com.bbae.anno:id/account_style_togglebutton')  # 黑白风格按钮
    button_style.click()
    time.sleep(2)


def stock_color_change(driver):
    """
    股票涨跌颜色切换
    :param driver: 初始化获取的webdriver
    :return:no
    """
    button_user = driver.find_element_by_id('main2_headicon')   # 右上角我的账户按钮
    # self.assertIsNotNone(el)
    button_user.click()
    time.sleep(2)

    button_preferences = driver.find_element_by_id('account_persented_title')  # 个性设置按钮
    button_preferences.click()
    time.sleep(2)

    button_color_in = driver.find_element_by_id('')   # 涨跌颜色入口
    button_color_in.click()
    time.sleep(2)

    button_color = driver.find_element_by_id('com.bbae.anno:id/account_style_togglebutton')  # 股票颜色按钮
    button_color.click()
    time.sleep(2)


def language_size_change(driver):
    """
    字体大小切换
    :param driver: 初始化获取的webdriver
    :return:no
    """
    button_user = driver.find_element_by_id('main2_headicon')   # 右上角我的账户按钮
    # self.assertIsNotNone(el)
    button_user.click()
    time.sleep(2)

    button_preferences = driver.find_element_by_id('account_persented_title')  # 个性设置按钮
    button_preferences.click()
    time.sleep(2)

    button_size = driver.find_element_by_id('com.bbae.anno:id/account_textsize_togglebutton')  # 字体大小按钮
    button_size.click()
    time.sleep(2)
