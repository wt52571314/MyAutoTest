# -*- coding: utf-8 -*-
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
from email.header import Header
from email.utils import parseaddr, formataddr
import smtplib
from selenium import webdriver
import time
import os
import traceback

#
# IE_driver = "C:\Program Files\Internet Explorer\IEDriverServer.exe"
# os.environ["webdriver.ie.driver"] = IE_driver
# # 获取当前时间 在后边当主题名字用
date = time.strftime('%Y-%m-%d', time.localtime(time.time()))
text = date+'跑批'
# # 启动浏览器
# driver = webdriver.Ie(IE_driver)
# # 窗口最大化
# driver.maximize_window()
# # 打开网址
# driver.get('http://collection.jimubox.com/')
# time.sleep(2)
# # 输入用用户名密码，点击登陆
# driver.find_element_by_id("userName").send_keys('admin')
# driver.find_element_by_id('password').send_keys('JMbox123456!')
# driver.find_element_by_xpath("//div[contains(concat(' ', @class, ' '), ' account-type ')]//label[1]").click()
# driver.find_element_by_xpath("//button[contains(concat(' ', @class, ' '), ' login-btn ')]").click()
# # 访问跑批界面
# driver.get("http://collection.jimubox.com/systemruntimemonitoring/dailyjoblog/")
# time.sleep(2)
# # 截图，浏览器退出
# driver.get_screenshot_as_file("E:\\a.jpg")
# driver.quit()
# # 定义方法，处理发件人信息


def _format_addr(s):
    print s
    name, addr = parseaddr(s)
    print name
    print addr
    return formataddr((Header(name, 'utf-8').encode(), addr))
from_addr = 'ren1995520@outlook.com'
password = 'rzh110120999'
# to_addr =',' .join(['yinqing.mao@zleida.com','ren1995520@gmail.com'])
to_addr = ',' .join(['ren1995520@gmail.com'])
smtp_server = 'smtp-mail.outlook.com'

msg = MIMEMultipart()
msg['From'] = _format_addr('pythonfans <%s>' % from_addr)
msg['To'] = to_addr


msg['Subject'] = Header(text, 'utf-8').encode()
msg.attach(MIMEText('跑批文件.', 'plain', 'utf-8'))

att = MIMEText(open('E:\\a.jpg', 'rb').read(), 'base64', 'utf-8')
att["Content-Type"] = 'application/octet-stream'
att["Content-Disposition"] = 'attachment; filename="1.jpg"'
msg.attach(att)


try:
    server = smtplib.SMTP(smtp_server, 587)
    server.set_debuglevel(1)
    server.starttls()
    server.login(from_addr, password)
    server.sendmail(from_addr, [to_addr], msg.as_string())
    server.quit()
    print("发送成功")
except Exception, e:
    print e
    traceback.print_exc()
    print("发送失败")