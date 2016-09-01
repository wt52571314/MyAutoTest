# -*- coding: utf-8 -*-
#===============================================================================
#@ Creator：Hainnan.Zhang
#@ Date:2016-2-22
#根据输入输出对照结果
#===============================================================================
from Auto_Pay.old.function import *
from Auto_Pay.old.output import *
from Auto_Pay.old.check import *

if __name__ == '__main__':
    dir_input = Get_Input()
    dir_output = function(dir_input)
    Set_Output(dir_output)
    check()
