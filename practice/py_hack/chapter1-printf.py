# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：zhn
# @ Date:2016-6-14
# Python灰帽子-黑客与逆向工程师的Python编程之路源码1.3.2-使用ctypes库调用DLL动态链接库
# ===============================================================================
from ctypes import *
msvcrt = cdll.msvcrt
message_string = 'Hello word!\n'
msvcrt.printf("Testing: %s", message_string)
