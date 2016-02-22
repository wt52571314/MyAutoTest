#coding=utf-8
#===============================================================================
#@ Creator:zhn
#@ Date:2015-9-21 
#催收结清
#===============================================================================

from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys  

basepath = '*:\\*'
now_time = time.strftime('%Y-%m-%d-%H-%M-%S',time.localtime(time.time()))
filepath = basepath+'\\'+str(now_time)+'end'+'.txt'

browser = webdriver.Firefox()    
url_index = 'https://**********'    
browser.get(url_index)  
browser.maximize_window()  
res_adminname = browser.find_elements_by_xpath("html/body/div[1]/div/div/div/div[2]/form/fieldset/div[1]/input")  
for r_adminname in res_adminname:
    r_adminname.send_keys('admin')
res_admin_password = browser.find_elements_by_xpath("html/body/div[1]/div/div/div/div[2]/form/fieldset/div[2]/input")  
for r_admin_password in res_admin_password:
    r_admin_password.send_keys('******')
res_admin_post = browser.find_elements_by_xpath("html/body/div[1]/div/div/div/div[2]/form/fieldset/button") 
for r_admin_post in res_admin_post:
    r_admin_post.click()
    print '管理员登陆成功'
res_message = browser.find_elements_by_xpath(".//*[@id='side-menu']/li[4]/a")
for r_message in res_message:
    r_message.click()
    print '委案列表'
res_state = browser.find_elements_by_xpath('.//*[@id=\'sel-status\']')   
for r_state in res_state:
    r_state.send_keys(u'委方已确认还款')

        
res_post = browser.find_elements_by_xpath(".//*[@id='page-wrapper']/div/div/div/div[2]/div/input[6]")
for r_post in res_post:
    r_post.click()
    time.sleep(10)
    r_post.click()
    time.sleep(10)
    
res_radio = browser.find_elements_by_xpath(".//*[@id='projects']/tbody/tr[1]/td[1]/input")
for r_radio in res_radio:
    r_radio.click()

res_code = browser.find_elements_by_xpath(".//*[@id='projects']/tbody/tr[1]/td[2]")
for r_code in res_code:
    text = r_code.text

res_end = browser.find_elements_by_xpath(".//*[@id='page-wrapper']/div/div/div/div[3]/form/div/input[5]")
for r_end in res_end:
    r_end.click()
#===============================================================================
# 结果验正֤
#===============================================================================
res_state = browser.find_elements_by_xpath('.//*[@id=\'sel-status\']')   
for r_state in res_state:
    r_state.send_keys(u'催收结清')
    
res_check = browser.find_elements_by_xpath(".//*[@id='projectCode']")
for r_check in res_check:
    r_check.send_keys(str(text))
    
res_post1 = browser.find_elements_by_xpath(".//*[@id='page-wrapper']/div/div/div/div[2]/div/input[6]")
for r_post1 in res_post1:
    time.sleep(10)
    r_post1.click()
    time.sleep(10)

res_check1 = browser.find_elements_by_xpath(".//*[@id='projects']/tbody/tr[1]/td[2]")
for r_check1 in res_check1:
    print text
    if str(text) in r_check1.text:
        f = open(filepath,'w')
        f.writelines(u'The end function is succeed')
    else:
        f = open(filepath,'w')
        f.writelines(u'The end function is filed')
browser.close()
