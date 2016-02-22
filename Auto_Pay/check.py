# -*- coding: utf-8 -*-
#===============================================================================
#@ Creator：Hainnan.Zhang
#@ Date:2016-2-22
#结果对比
#===============================================================================
dir_output = {}
dir_result = {}
def check():
    i = 1
    j = 1
    fp_output = open('D:\\log\\output.txt','r')
    fp_result = open('D:\\log\\result.txt','r')
    fp_log = open('D:\\log\\log.txt','w')
    lines_output = fp_output.readlines()
    lines_result = fp_result.readlines()
    for line in lines_output:
        dir_output[i] = str(line)
        i += 1
    for line in lines_result:
        dir_result[j] = str(line)
        j += 1
    for key in dir_result:
        if dir_output[key] == dir_result[key]:
            fp_log.writelines(str('第'+str(key)+'行结果对应无误\n'))
        else:
            fp_log.writelines(str('！！！！！！！！！！！！第'+str(key)+'行结果错误！！！！！！！！！！！\n'))
    fp_log.close()
    fp_result.close()
    fp_output.close()

# if 1 == 1:
#     check()