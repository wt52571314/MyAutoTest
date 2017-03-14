# - coding: utf-8 -*-
# ==============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-9-21
# 比对数据差异
# ===============================================================================
import re

if __name__ == '__main__':
    fp_new = open('D:\log\\xuanji\sql\NEW.sql', 'r')
    fp_old = open('D:\log\\xuanji\sql\OLD.sql', 'r')
    fp_report = open('D:\log\\xuanji\sql\\report.txt', 'a+')
    List_new = fp_new.readlines()
    List_old = fp_old.readlines()
    for index in range(0, len(List_old)):
        str_use = ''
        str_use = re.findall(r'\'\D*_\d*\D*\d*\D*\d', List_new[index])
        print '#'*50
        print str_use[0]
        print List_old[index]
        print '#'*50
        if str_use[0] in List_old[index]:
            fp_report.writelines('line:'+str(index)+'in the file')
        else:
            fp_report.writelines('line:'+str(index)+'ERROR')
        fp_report.writelines('\n')
    fp_report.close()
    fp_new.close()
    fp_old.close()