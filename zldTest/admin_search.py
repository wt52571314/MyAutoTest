#coding=utf-8
#===============================================================================
#@ Creator:zhn
#@ Date:2015-9-21 
#委案列表筛选用例
#===============================================================================

from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys  

basepath = '*:\\*'
now_time = time.strftime('%Y-%m-%d-%H-%M-%S',time.localtime(time.time()))
filepath = basepath+'\\'+str(now_time)+'admin_search'+'.txt'

browser = webdriver.Firefox()    
url_index = 'https://*********'    
browser.get(url_index)  #打开页面
browser.maximize_window()  #浏览器窗口最大化
res_adminname = browser.find_elements_by_xpath("html/body/div[1]/div/div/div/div[2]/form/fieldset/div[1]/input")  # 使用xpath查找页面中的用户名
for r_adminname in res_adminname:
    r_adminname.send_keys('admin')
res_admin_password = browser.find_elements_by_xpath("html/body/div[1]/div/div/div/div[2]/form/fieldset/div[2]/input")  # 使用xpath查找页面中的密码
for r_admin_password in res_admin_password:
    r_admin_password.send_keys('*********')
res_admin_post = browser.find_elements_by_xpath("html/body/div[1]/div/div/div/div[2]/form/fieldset/button") #登录按钮
for r_admin_post in res_admin_post:
    r_admin_post.click()
    print '管理员登录成功'
res_message = browser.find_elements_by_xpath(".//*[@id='side-menu']/li[4]/a")
for r_message in res_message:
    r_message.click()
    print '委案列表'
res_state = browser.find_elements_by_xpath('.//*[@id=\'sel-status\']')   
for r_state in res_state:
    r_state.send_keys(u'审核未通过')
res_price = browser.find_elements_by_xpath('.//*[@id=\'sel-overdue\']')
for r_price in res_price:
    r_price.send_keys(u'10万以上')
res_name = browser.find_elements_by_xpath('.//*[@id=\'companyName\']')
for r_name in res_name:
    r_name.send_keys(u'高利贷')
res_city = browser.find_elements_by_xpath('.//*[@id=\'loaneeBusinessCity\']')
for r_city in res_city:
    r_city.send_keys(u'上海')

res_code = browser.find_elements_by_xpath('.//*[@id=\'projectCode\']')
for r_code in res_code:
    r_code.send_keys(u'2015')
        
res_post = browser.find_elements_by_xpath(".//*[@id='page-wrapper']/div/div/div/div[2]/div/input[6]")
for r_post in res_post:
    time.sleep(10)
    r_post.click()
    time.sleep(10)
#===============================================================================
# 结果验证
#===============================================================================
res_check = browser.find_elements_by_xpath(".//*[@id='projects']/tbody/tr[1]/td[2]")
for r_check in res_check:
    if '2015091145300' in r_check.text:
        f = open(filepath,'w')
        f.writelines(u'The search function is succeed')
    else:
        f = open(filepath,'w')
        f.writelines(u'The search function is filed')
