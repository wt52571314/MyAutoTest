# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-6-14
# python网络编程 第一章练习 获取hostname
#  ===============================================================================
import socket
from binascii import hexlify
host_name = socket.gethostname()
# print host_name
# print socket.gethostbyname(host_name)
# print socket.getprotobyname('tcp1')
a = socket.inet_aton('127.0.0.1')
print hexlify(a)
print socket.inet_ntoa(a)