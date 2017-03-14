# -*- coding:utf-8 -*-
# ======================================================================================================
# @Auther:ZHN
# @TIME:2016-11-15
# 民生项目兼容性测试所需要的功能列表
# appium -a 127.0.0.1 -p 4236 -bp 4237 -U 192.168.210.156:5555 --no-reset
# appium -a 127.0.0.1 -p 4725 -bp 4726 -U DLQ0216326007703 --no-reset
# chrome://inspect
# =====================================================================================================
from appium import webdriver
from appium.webdriver.common.touch_action import TouchAction
import time
import os


def init(**kwargs):
    """
    初始化测试环境
    :param kwargs: 启动driver的服务连接，设备名称和uuid
    :return:返回webderiver实例
    """
    desired_caps = {}
    desired_caps['deviceName'] = kwargs['deviceName']  # adb devices查到的设备名-- GooGle_mobile
    desired_caps['uuid'] = kwargs['uuid']
    # desired_caps['browserName'] = 'browser'
    desired_caps['platformName'] = 'Android'
    desired_caps['platformVersion'] = '6.0'
    desired_caps['appPackage'] = 'com.UCMobile'  # 被测App的包名
    desired_caps['appActivity'] = 'com.UCMobile.main.UCMobile'  # 启动时的Activity
    # desired_caps['unicodeKeyboard'] = True
    # desired_caps['resetKeyboard'] = True
    driver = webdriver.Remote(kwargs['remote_url'], desired_caps)
    return driver


def screen_short(name, path, device_name):
    """
    通过adb命令截屏
    :param name: 截屏文件名
    :param path: 截屏本地保存路径
    :param device_name: 设备名称
    :return: None
    """
    os.system('adb -s '+device_name+' shell screencap -p /sdcard/'+name+'.png')
    os.system('adb -s '+device_name+' pull /sdcard/test.png '+path+name+'.png')


def key_event(key):
    if key == '.':
        os.system('adb shell input keyevent KEYCODE_PERIOD')
    else:
        os.system('adb shell input keyevent KEYCODE_'+key)
    time.sleep(0.5)


def login(driver):
    """
    登录
    :param driver:
    :return:
    """
    url = 'WWW.BAIDU.COM'
    action = TouchAction(driver)
    # move_to一定是相对坐标
    input_1 = driver.find_element_by_xpath(
        '//android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.view.View'
    )
    input_1.click()
    time.sleep(1)
    input_url = driver.find_element_by_name('搜索或输入网址')
    input_url.click()
    time.sleep(1)
    for item in url:
        key_event(item)
    key_event('ENTER')
    key_event('ENTER')
    time.sleep(1)


if __name__ == '__main__':
    print 'test'
    # driver_1 = init(remote_url='http://localhost:4236/wd/hub'
    #                 , uuid='192.168.210.156:5555'
    #                 , deviceName='192.168.210.156:5555')
    driver_2 = init(remote_url='http://localhost:4725/wd/hub'
                    , uuid='DLQ0216326007703'
                    , deviceName='DLQ0216326007703')
    time.sleep(10)
    # login(driver_1)
    login(driver_2)
    # screen_short('test', 'D:/log/', '192.168.210.156:5555')
