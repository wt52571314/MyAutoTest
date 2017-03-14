# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator:张海南
# @ Date:2016-6-18
# @ 描述：不断重复登录登出过程
# @ 创建原因：环信客服线程不安全，导致登出崩溃
#  ===============================================================================
import time
from function_list import gesture, login, init


def logout(driver):
    gesture(driver)
    time.sleep(2)
    gesture(driver)
    time.sleep(2)
    button_account = driver.find_element_by_id('com.bbae.anno:id/accountset_title')
    button_account.click()
    time.sleep(2)
    button_logout = driver.find_element_by_id('com.bbae.anno:id/account_logout')
    button_logout.click()
    time.sleep(2)
    button_sure = driver.find_element_by_id('com.bbae.anno:id/positiveButton')
    button_sure.click()
    time.sleep(2)
    button_login = driver.find_element_by_id('com.bbae.anno:id/aboutus_login')
    button_login.click()
    time.sleep(2)
    text_username = driver.find_element_by_id('login_name')
    text_username.send_keys('18070505645')
    time.sleep(2)
    text_password = driver.find_element_by_id('login_pwd')
    text_password.send_keys('111111')
    time.sleep(2)
    text_ok = driver.find_element_by_id('login_pwdShowstatus')
    text_ok.click()
    time.sleep(2)
    button_pass = driver.find_element_by_id('accountbutton_text')
    button_pass.click()
    time.sleep(10)

if __name__ == '__main__':
    # =======================================================================================
    # 设备初始化
    # ==================================================================================
    driver_use = init()
    time.sleep(15)
    login(driver_use)
    time.sleep(10)
    while 1 == 1:
        logout(driver_use)
