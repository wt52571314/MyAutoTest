# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-7-13
# 检查所有结果是否正确
# ===============================================================================
import sys
if __name__ == '__main__':
    i = 0
    fp_risk = open('D:\log\\risk.txt', 'r')
    fp_result = open('D:\log\\risk_result.txt', 'r')
    fp_log = open('D:\log\\check_result.txt', 'a')
    risk = fp_risk.readlines()
    result = fp_result.readlines()
    for index in range(0, len(risk)):
        i += 1
        if i > 3985:
            sys.exit(0)
        if risk[index] == result[index]:
            fp_log.writelines(str(i)+':succeed')
            fp_log.writelines('\n')
        elif risk[index] != result[index]:
            fp_log.writelines(str(i)+':filed')
            fp_log.writelines('\n')
        else:
            fp_log.writelines(str(i)+':have an error')
            fp_log.writelines('\n')
    fp_risk.close()
    fp_result.close()
    fp_log.close()