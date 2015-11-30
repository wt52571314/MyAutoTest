#coding=utf-8
#===============================================================================
#@ Creator:zhn
#@ Date:2015-9-21 
#python编程练习
#===============================================================================
#有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数？都是多少？
# count = 0
# for i in range(1,5):
#     for j in range(1,5):
#         for k in range(1,5):
#             if i != j and j != k and i != k:
#                 print 100*i + 10*j +k
#                 count += 1
# print count
# ======================================================================================================
#一个整数，它加上100后是一个完全平方数，再加上168又是一个完全平方数，请问该数是多少？
# import math
# i = 0
# while True:
#     if math.sqrt(i+100)-int(math.sqrt(i+100)) == 0 and math.sqrt(i+168)-int(math.sqrt(i+168)) == 0:
#         print i
#     i += 1
# =========================================================================================================
#三个整数x,y,z，请把这三个数由大到小输出。使用lambda
# MAXNUM = lambda x,y,z : (x>y and x>z)*x + (y>x and y>z)*y +(z>x and z>y)*z
# MIDNUM = lambda x,y,z : (x>y and x<z)*x + (y>x and y<z)*y +(z>x and z<y)*z
# MINNUM = lambda x,y,z : (x<y and x<z)*x + (y<x and y<z)*y +(z<x and z<y)*z
# a = 10
# b = 20
# c = 30
# print 'the sort is %d,%d,%d'%(MAXNUM(a,b,c),MIDNUM(a,b,c),MINNUM(a,b,c))
#=================================================================================================================
#题目：取一个整数a从右端开始的4～7位。按位与 & ,按位或 |,按位异或 ^ ,按位取反~
# a = 100
# print 100&0x00F0
#=======================================================================================================
#题目：画圆【Tkinter模块】
# if __name__ == '__main__':
#     from Tkinter import *
#
#     canvas = Canvas(width=800, height=600, bg='red')
#     canvas.pack(expand=YES, fill=BOTH)
#     k = 1
#     j = 1
#     for i in range(0,26):
#         canvas.create_oval(310 - k,250 - k,310 + k,250 + k, width=1)
#         k += j
#         j += 0.3
#
#     mainloop()
#========================================================================================================
# 题目：画图
# if __name__  == '__main__':
#     from Tkinter import *
#     canvas = Canvas(width = 300,height = 300,bg = 'green')
#     canvas.pack(expand = YES,fill = BOTH)
#     x0 = 150
#     y0 = 100
#     canvas.create_oval(x0 - 10,y0 - 10,x0 + 10,y0 + 10)
#     canvas.create_oval(x0 - 20,y0 - 20,x0 + 20,y0 + 20)
#     canvas.create_oval(x0 - 50,y0 - 50,x0 + 50,y0 + 50)
#     import math
#     B = 0.809
#     for i in range(16):
#         a = 2 * math.pi / 16 * i
#         x = math.ceil(x0 + 48 * math.cos(a))
#         y = math.ceil(y0 + 48 * math.sin(a) * B)
#         canvas.create_line(x0,y0,x,y,fill = 'red')
#     canvas.create_oval(x0 - 60,y0 - 60,x0 + 60,y0 + 60)
#
#
#     for k in range(501):
#         for i in range(17):
#             a = (2 * math.pi / 16) * i + (2 * math.pi / 180) * k
#             x = math.ceil(x0 + 48 * math.cos(a))
#             y = math.ceil(y0 + 48 + math.sin(a) * B)
#             canvas.create_line(x0,y0,x,y,fill = 'red')
#         for j in range(51):
#             a = (2 * math.pi / 16) * i + (2* math.pi / 180) * k - 1
#             x = math.ceil(x0 + 48 * math.cos(a))
#             y = math.ceil(y0 + 48 * math.sin(a) * B)
#             canvas.create_line(x0,y0,x,y,fill = 'red')
#     mainloop()