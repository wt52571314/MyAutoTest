#coding=utf-8
#===============================================================================
#@ Creator:zhn
#@ Date:2015-9-21 
#委托方注册用例
#===============================================================================

from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys  

basepath = 'D:\\log'
now_time = time.strftime('%Y-%m-%d-%H-%M-%S',time.localtime(time.time()))
filepath = basepath+'\\'+str(now_time)+'zhuce_weituo.txt'

browser = webdriver.Firefox()    
url_index = 'https://wj-01.zleida.com/'    
browser.get(url_index)  #打开页面
browser.maximize_window()  #浏览器窗口最大化
res_register = browser.find_elements_by_xpath("html/body/div[1]/div/div[2]/a[2]")  #使用xpath查找页面中的div元素
for r_register in res_register:  #  页面中h3元素有多个，所以需要遍历
    r_register.click()
res_type = browser.find_elements_by_xpath(".//*[@id='company_type']") 
for r_type in res_type:
    r_type.send_keys(u'委托方')      
res_cname = browser.find_elements_by_xpath(".//*[@id='company_name']")
for r_cname in res_cname:
    r_cname.send_keys(u'金小额贷款')
res_username = browser.find_elements_by_xpath(".//*[@id='user_name']")
for r_username in res_username:
    r_username.send_keys('qqqwwweee')
res_password = browser.find_elements_by_xpath(".//*[@id='password']")
for r_password in res_password:
    r_password.send_keys('qqqwwweee')
res_admin = browser.find_elements_by_xpath(".//*[@id='chinese_name']")
for r_admin in res_admin:
    r_admin.send_keys(u'王亚琴')
res_mobile = browser.find_elements_by_xpath(".//*[@id='mobile']")
for r_mobile in res_mobile:
    r_mobile.send_keys('18843563578')
res_verificationcode = browser.find_elements_by_xpath(".//*[@id='verificationcode']")
for r_verificationcode in res_verificationcode:
    r_verificationcode.send_keys('1008')    
res_mail = browser.find_elements_by_xpath(".//*[@id='email']")
for r_mail in res_mail:
    r_mail.send_keys('18823573578@189.com')
res_post = browser.find_elements_by_xpath(".//*[@id='reg-form']/div/div[12]/div/input")
for r_post in res_post:
    r_post.click()
#===============================================================================
# 验证
#===============================================================================
res_check = browser.find_elements_by_xpath(".//*[@id='reg-form']/div/div[12]/div/input")
for r_check in res_check:
    if 'jyjxedk' in r_check.text:
        f = open(filepath,'w')
        f.writelines(u'The register function is succeed')
    else:
        f = open(filepath,'w')
        f.writelines(u'The register function is filed')
browser.close()