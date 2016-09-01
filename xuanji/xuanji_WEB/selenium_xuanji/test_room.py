# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-8-26
# 璇玑自动化实验室，用于实验一些小功能
# ===============================================================================
from selenium import webdriver
import time
import os
IE_driver = "C:\Program Files\Internet Explorer\IEDriverServer.exe"
os.environ["webdriver.ie.driver"] = IE_driver


def control():
    driver = webdriver.Ie(IE_driver)
    print '打开网页'
    driver.get('http://www.baidu.com')
    print "size config"
    driver.set_window_size(480, 800)
    print '打开第二个网页'
    driver.get('http://www.example.com')
    print '返回第一个网页'
    driver.back()
    print '前进到第二个网页'
    driver.forward()

    time.sleep(10)
    driver.quit()

if __name__ == '__main__':
    control()
    print 'ok'