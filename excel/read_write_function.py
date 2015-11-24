# -*- coding: utf-8 -*-
__author__ = 'Administrator'
import xlrd
import xlwt
from file_write import file_write

List = []
dir = 'F:\\test\symbols.xls'
dir1 = 'Sheet1'
def read_excel():
    i = 1
    workbook = xlrd.open_workbook(dir)
    sheet_name = workbook.sheet_by_name(dir1)
    print sheet_name
    num = sheet_name.nrows
    while i <= num:
        j = 0
        while j < 15:
            if i <= num:
                str2 = sheet_name.cell(i,0).value
                str1 = sheet_name.cell(i,1).value
                if i%15 == 1:
                    file_write(str1,str2,0)
                elif i%15 == 0:
                    file_write(str1,str2,2)
                else:
                    file_write(str1,str2,1)
                j += 1
            else:
                break
            i += 1

if 1 == 1:
    read_excel()




