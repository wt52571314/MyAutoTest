# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：zhn
# @ Date:2016-11-09
# 民生项目金证系统生成ta文件--索引文件
# ===============================================================================
from config import *
# "indexname + '_' + rpttacode + '_' + dbtid + '_' + yyyymmdd + '.TXT'"


def create_file(ta_list, date_use):
    """
    创建索引文件
    :param ta_list: 需要创建索引文件的Ta列表
    :param date_use: 结算时间
    :return:
    """
    send_list = list()
    for item in ta_list:
        send_list.append(ta_code_dir[item])
    for ta_code in send_list:
        file_path = 'OFI_' + str(ta_code) + '_' + receiver + '_' + date_use + '.TXT'
        fp = open(file_path, 'a+')
        fp.writelines('OFDCFIDX\n')
        fp.writelines('20  \n')
        fp.writelines(str(ta_code) + '       \n')
        fp.writelines(receiver + '      \n')
        fp.writelines(date_use+'\n')
        fp.writelines('003\n')
        fp.writelines('OFD_' + str(ta_code) + '_' + receiver + '_' + date_use + '02.TXT\n')
        fp.writelines('OFD_' + str(ta_code) + '_' + receiver + '_' + date_use + '04.TXT\n')
        fp.writelines('OFD_' + str(ta_code) + '_' + receiver + '_' + date_use + '06.TXT\n')
        fp.writelines('OFDCFEND\n')
        fp.close()

if __name__ == '__main__':
    create_file(ta_name_need, date)
