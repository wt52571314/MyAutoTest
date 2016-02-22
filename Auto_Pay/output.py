# -*- coding: utf-8 -*-
#===============================================================================
#@ Creator：Hainnan.Zhang
#@ Date:2016-2-22
#将结果写入字典
#===============================================================================
dir = {1:[1,2,3,4,5],2:[2,3,4,5,6]}
def Set_Output(dir):
    fp = open('D:\log\output.txt','w')
    for key in dir:
        fp.writelines(str(dir[key])+"\n")
    fp.close()
# if 1 == 1:
#     Set_Output(dir)
