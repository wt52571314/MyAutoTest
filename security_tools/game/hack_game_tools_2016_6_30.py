__author__ = 'Administrator'
import requests
import sys
# a = '0123456789'
# print list(a)
list_a = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
          'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
           '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
list_b = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
          'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
           '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
for i in list_a:
    for j in list_b:
        print 'http://www.cn-hack.cn/'+str(i)+str(j)+'/'
        a = requests.get('http://www.cn-hack.cn/'+str(i)+str(j)+'/')
        if 'IIS 7.5' not in a.content:
            print a.content
            sys.exit()