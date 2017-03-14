# -*- coding: utf-8 -*-
__author__ = 'Administrator'
dir = 'F:\\test\\result.txt'
def file_write(str1,str2,sign):
    # @param sign: 0代表左半边加【
    # 1代表什么都不加，
    # 2代表右半边加】
    # 3代表分割=========================
    f = open(dir,'a+')
    if sign == 0:
        f.writelines('[{\"exchangeCode\":\"'+str1+'\",\"type\":\"1\",\"symbol\":\"'+str2+'\"},')
    elif sign == 1:
        f.writelines('{\"exchangeCode\":\"'+str1+'\",\"type\":\"1\",\"symbol\":\"'+str2+'\"},')
    elif sign == 2:
        f.writelines('{\"exchangeCode\":\"'+str1+'\",\"type\":\"1\",\"symbol\":\"'+str2+'\"}]\n')
    elif sign == 3:
        f.writelines('=======================================================================\n')
    f.close()
