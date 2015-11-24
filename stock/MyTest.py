#-*- coding: utf-8 -*-
#===============================================================================
#@ Creator:张海南
#@ Date:2015-11-20
#@ 描述：股票柱状图对比程序
#===============================================================================

import time
from selenium import webdriver
from log import write_log
from selenium.webdriver.common.keys import Keys


browser = webdriver.Firefox()
url_index = 'https://app-test.jimustock.com/#/login'
browser.get(url_index)
browser.maximize_window()
res_username = browser.find_elements_by_xpath("html/body/div[1]/div/main/div/section/article/validate-input[1]/div/input")
for r_username in res_username:
    r_username.send_keys('18070505645')
res_admin_password = browser.find_elements_by_xpath("html/body/div[1]/div/main/div/section/article/validate-input[2]/div/input")
for r_admin_password in res_admin_password:
    r_admin_password.send_keys('bst52571314.com')
res_admin_post = browser.find_elements_by_xpath("html/body/div[1]/div/main/div/section/article/button")
for r_admin_post in res_admin_post:
    r_admin_post.click()
    print '登录成功'
    write_log('=========================================\nlogin succeed\n=======================================','stock_picture')
res_message = browser.find_elements_by_xpath("html/body/div[1]/section/main/main/ng-include[1]/div/div/div[2]/div/div/section[1]/article/div[1]/stock-item[1]/div")
for r_message in res_message:
    r_message.click()
    res_title = browser.find_elements_by_xpath("html/body/div[1]/section/main/main/ng-include[1]/div/div/div[2]/div/div/section[1]/article/div[1]/stock-item[1]/div/div[2]/h6")
    for r_title in res_title:
        text = r_title.text
    print text
    write_log('=========================================\nopen'+text+'succeed\n=======================================','stock_picture')
browser.close()