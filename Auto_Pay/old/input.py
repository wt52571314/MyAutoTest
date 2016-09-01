# -*- coding: utf-8 -*-
#===============================================================================
#@ Creator：Hainnan.Zhang
#@ Date:2016-2-22
#读取输入值存入字典
#===============================================================================
def Get_Input():
    i = 1
    mydir = {}
    fp = open('D:\log\input.txt', 'r')
    lines = fp.readlines()
    for line in lines:
        line = str(line)[:-1]
        List = str(line).split(',')
        mydir[i] = List
        i += 1
    fp.close()
    return mydir

# if __name__ == '__main__':
#     a = Get_Input(dir)
#     print a