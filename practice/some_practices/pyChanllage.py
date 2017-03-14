# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-3-24
# pythonchallage 第一关
#  ===============================================================================
# from string import maketrans
# a = maketrans('', '')[97:123]
# b = list(a)
# b.extend(['a', 'b'])
# b.pop(0)
# b.pop(0)
# b = ''.join(b)
# table = maketrans(a, b)
# print "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfy\
# rq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr \
# ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq()\
#  gq pcamkkclbcb. lmu ynnjw ml rfc spj.".translate(table)
# ==============================================================================
# pythonchallage 第二关
# ===============================================================================
# f = open('d:/log/test.txt', 'r')
# string = f.read()
# answer = ''
# for s in string:
#     if s.isalpha():
#         answer += s
# print answer
# ==============================================================================
# pythonchallage 第三关
# ===============================================================================
# import re
# f = open('d:/log/test.txt', 'r')
# ans = ''
# tmp = f.read()
# pattern = re.compile("[a-z][A-Z][A-Z][A-Z][a-z][A-Z][A-Z][A-Z][a-z]")
# temp = ''
# for match in pattern.findall(tmp):
#     temp += match[4]
# print temp
# ==============================================================================
# pythonchallage 第四关
# ===============================================================================
# import urllib2
# import re
# url = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='
# i = 0
# List = ['63579']
# while (i < 400):
#     str1 = urllib2.urlopen('http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='+List[i]).read()
#     print str1
#     pattern = re.compile("[0-9]")
#     a = pattern.findall(str1)
#     str_use = ''.join(a)
#     List.append(str_use)
#     i += 1
# print List[399]
# ==============================================================================
# pythonchallage 第五关
# ===============================================================================