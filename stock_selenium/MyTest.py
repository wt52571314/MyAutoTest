#-*- coding: utf-8 -*-
# #===============================================================================
# #@ Creator:张海南
# #@ Date:2015-11-20
# #@ 描述：股票柱状图对比程序
# #===============================================================================
#
# import time
# from selenium import webdriver
# from log import write_log
# from selenium.webdriver.common.keys import Keys
#
# text = ''
# browser = webdriver.Firefox()
# url_index = 'https://app-test.jimustock.com/#/login'
# browser.get(url_index)
# browser.maximize_window()
# time.sleep(5)
# res_username = browser.find_elements_by_xpath("html/body/div[1]/div/main/div/section/article/validate-input[1]/div/input")
# for r_username in res_username:
#     r_username.send_keys('18070505645')
# res_admin_password = browser.find_elements_by_xpath("html/body/div[1]/div/main/div/section/article/validate-input[2]/div/input")
# for r_admin_password in res_admin_password:
#     r_admin_password.send_keys('bst52571314.com')
# res_admin_post = browser.find_elements_by_xpath("html/body/div[1]/div/main/div/section/article/button")
# for r_admin_post in res_admin_post:
#     r_admin_post.click()
#     print '登录成功'
#     write_log('=========================================\nlogin succeed\n=======================================','stock_picture')
# #====================================================下一步============================================================================================================================
# time.sleep(25)
# res_message = browser.find_elements_by_xpath("html/body/div[1]/section/main/main/ng-include[1]/div/div/div[2]/div/div/section[1]/article/div[1]/stock-item[1]/div")
# print res_message
# for r_message in res_message:
#     r_message.click()
#     print '指数打开'
#     time.sleep(5)
# res_title = browser.find_elements_by_css_selector(".stock-detail.ng-scope")
# print res_title
# print 'yes'
# for r_title in res_title:
#     print 'gogogo!'
#     text = r_title.fill
#     print 'ok'
# print text
# write_log('=========================================\nopen'+text+'succeed\n=======================================','stock_picture')
# browser.close()

def input_score():
    list_score = list()
    while 1 == 1:
        i = raw_input('请输入分数，输入q退出程序！')
        if i != 'q':
            try:
                list_score.append(float(i))
            except:
                print '只能输入数字！'
                pass
        else:
            return list_score


def math_score(list_use):
    j = 0
    for item in list_use:
        j += item
    print '平均分:' + str(j/len(list_use))
    list_use.sort()
    print '最低分:' + str(list_use[0])

if __name__ == '__main__':
    list_result = input_score()
    math_score(list_result)

