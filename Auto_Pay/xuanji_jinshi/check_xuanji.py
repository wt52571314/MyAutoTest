# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-8-30
# 检查所有结果是否正确
# ===============================================================================
import time
import re


def make_report():
    """
    对比接口返回结果和预期结果，生成对比报告
    :return:None
    """
    pro_file_patch = 'D:\\log\\xuanji\\pro_result\\pro_result'
    end_file_patch = 'D:\\log\\xuanji\\end_result\\end_result'
    report_file_patch = 'D:\\log\\xuanji\\report\\report'
    file_index = 0
    while file_index < 1:
        pro_list_v2 = []
        end_list_v2 = []
        file_index += 1
        fp_pro = open(pro_file_patch+str(file_index)+'.txt', 'r')
        fp_end = open(end_file_patch+str(file_index)+'.txt', 'r')
        fp_report = open(report_file_patch+str(file_index)+'.txt', 'a+')
        # print len(fp_pro.readlines())
        pro_list = fp_pro.readlines()
        end_list = fp_end.readlines()
        for num in range(0, len(pro_list)):
            a = re.findall(r":\D*_\D*", pro_list[num])
            pro_list_v2.append(a)
            b = re.findall(r":\D*_\D*", end_list[num])
            end_list_v2.append(b)
        # print pro_list
        # print end_list
        for index in range(0, len(pro_list_v2)):
            if pro_list_v2[index] == end_list_v2[index]:
                # print '11111'
                fp_report.writelines(
                    time.strftime("%Y-%m-%d %X", time.localtime())+'$$the line '+str(index+1)+' is ok'
                )
                fp_report.writelines('\n')
            else:
                # print ''
                fp_report.writelines(
                    time.strftime("%Y-%m-%d %X", time.localtime())+'$$the line '+str(index+1)+' is filed'
                )
                fp_report.writelines('\n')
        fp_report.close()
        fp_end.close()
        fp_pro.close()


def check():
    """
    检查对比报告，输出所有有误的地方
    :return:None
    """
    report_file_patch = 'D:\\log\\xuanji\\report\\report'
    fp = open('D:\\log\\xuanji\\report.txt', 'a+')
    for file_index in range(1, 2):
        fp_report = open(report_file_patch+str(file_index)+'.txt', 'r')
        for line in fp_report.readlines():
            if 'filed' in line:
                print '报告文件'+str(file_index)+'有误：'+line
                fp.writelines('报告文件'+str(file_index)+'有误：'+line)
                fp.writelines('\n')
                print '*'*50
            elif 'ok' in line:
                pass
            else:
                print 'Oops!!!'
                print '!'*50
    fp.close()


if __name__ == '__main__':
    make_report()
    check()