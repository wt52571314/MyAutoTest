# -*- coding:utf-8 -*-
# ======================================================================================================
# @auther:ZHN
# @TIME:2016-1-23
# appium实例，用于android自动化测试
# =====================================================================================================
import os
import HTMLTestRunner
import unittest
import time
from appium import webdriver
from appium.webdriver.common.touch_action import TouchAction

# Returns abs path relative to this file and not cwd
PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)


class elementA(unittest.TestCase):

    def test_(self):
        # =======================================================================================
        # 设备初始化
        # ==================================================================================
        desired_caps = {}
        desired_caps['deviceName'] = 'CVH7N16317000930'  #adb devices查到的设备名-- GooGle_mobile
        # desired_caps['deviceName'] = 'W8RDU15803002568'   # 华为手机
        desired_caps['platformName'] = 'Android'
        desired_caps['platformVersion'] = '6.0'
        desired_caps['appPackage'] = 'com.bbae.anno'  #被测App的包名
        desired_caps['appActivity'] = 'com.bbae.anno.activity.AppStartActivity' #启动时的Activity
        driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)
        time.sleep(15)
        # =================================================================================
        # 开始测试
        # ======================================================================================
        # button1 = driver.find_element_by_id('main2_headicon')
        # # self.assertIsNotNone(el)
        # button1.click()
        #
        # button_login = driver.find_element_by_id('aboutus_login')
        # button_login.click()
        #
        # text_username = driver.find_element_by_id('login_name')
        # text_username.send_keys('18070505645')
        #
        # text_password = driver.find_element_by_id('login_pwd')
        # text_password.send_keys('111111')
        #
        #
        # text_ok = driver.find_element_by_id('login_pwdShowstatus')
        # text_ok.click()
        #
        # button_pass = driver.find_element_by_id('accountbutton_text')
        # button_pass.click()

        action = TouchAction(driver)
        # move_to一定是相对坐标
        unlock = action.press(x=240, y=915).wait(ms=100)\
            .move_to(x=480, y=0).wait(ms=100)\
            .move_to(x=480, y=0).wait(ms=100)\
            .release()
        print unlock
        unlock.perform()

if __name__ == '__main__':
    test_unit = unittest.TestSuite()        # 定义一个单元测试容器
    test_unit.addTest(elementA("test_"))  # 将测试用例加入到测试容器中
    filename = "D:/log/myAppiumLog.html"        # 定义个报告存放路径，支持相对路径。
    fp = file(filename, 'wb')
    runner = HTMLTestRunner.HTMLTestRunner(stream=fp, title='Report_title', description='Report_description')  # 使用HTMLTestRunner配置参数，输出报告路径、报告标题、描述
    runner.run(test_unit)                 # 自动进行测试