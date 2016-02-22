# -*- coding: utf-8 -*-
#===============================================================================
#@ Creator：Hainnan.Zhang
#@ Date:2016-2-22
#对输入进行的处理
#===============================================================================
from input import *
def function(dir):
    for key in dir:
        List = []
        List.extend(dir[key])
        for i in range(0,len(List)):
            a = int(List[i])
            a += 1                                             #此处修改为对某一元素的操作
            List[i] = a
        dir[key] = List                                               #此处将返回结果添加至字典
    return dir

# if __name__ == '__main__':
#      a = function(Get_Input())
#      print a