# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator:张海南
# @ Date:2016-09-26
# @ 描述：CSV删除一行
#  ===============================================================================
import csv


def read_csv(read_path):
    """
    读取整个csv文件
    :param read_path: 读取文件位置
    :return: 读出来的列表
    """
    list_read = []
    file_read = file(read_path, 'rb')
    reader = csv.reader(file_read)
    for line in reader:
        list_read.append(line)
    file_read.close()
    return list_read


def write_csv(write_path, list_write):
    """
    重写csv文件，使用覆盖写入
    :param write_path: 写文件的路径
    :param list_write:用于写入的列表
    :return:None
    """
    csvfile = open(write_path, 'wb')
    spamwriter = csv.writer(csvfile, dialect='excel')
    for i in list_write:
        spamwriter.writerow(list(i))
    csvfile.close()


def delete(data_del, list_use):
    """
    按照data删除列表中的某一元素
    :param data_del: 需要删除的data
    :param list_use: 读取出来的list
    :return:删完之后用于写入的list
    """
    for index in range(0, len(list_use)-1):
        if data_del in list_use[index]:
            del list_use[index]
        else:
            pass
    return list_use


if __name__ == '__main__':
    data = raw_input('Data(格式为20160523):')
    Base_path = 'D:\log\excel\PortLevel\\'
    # test ============================================================
    # temp_list = read_csv('D:\log\excel\PortLevel\portLevel_A13.csv')
    # list_to_write = delete(data, temp_list)
    # write_csv('D:\log\excel\PortLevel\portLevel_A13.csv', list_to_write)
    # ==================================================================
    file_name_list = [
        'portLevel_A11.csv',
        'portLevel_A12.csv',
        'portLevel_A13.csv',
        'portLevel_A21.csv',
        'portLevel_A22.csv',
        'portLevel_A23.csv',
        'portLevel_A31.csv',
        'portLevel_A32.csv',
        'portLevel_A33.csv',
        'portLevel_B11.csv',
        'portLevel_B12.csv',
        'portLevel_B13.csv',
        'portLevel_B21.csv',
        'portLevel_B22.csv',
        'portLevel_B23.csv',
        'portLevel_B31.csv',
        'portLevel_B32.csv',
        'portLevel_B33.csv',
        'portLevel_C11.csv',
        'portLevel_C12.csv',
        'portLevel_C13.csv',
        'portLevel_C21.csv',
        'portLevel_C22.csv',
        'portLevel_C23.csv',
        'portLevel_C31.csv',
        'portLevel_C32.csv',
        'portLevel_C33.csv',
        'portLevel_G11.csv',
        'portLevel_G12.csv',
        'portLevel_G13.csv',
        'portLevel_G21.csv',
        'portLevel_G22.csv',
        'portLevel_G23.csv',
        'portLevel_G31.csv',
        'portLevel_G32.csv',
        'portLevel_G33.csv',
        'portLevel_VA11.csv',
        'portLevel_VA12.csv',
        'portLevel_VA13.csv',
        'portLevel_VA21.csv',
        'portLevel_VA22.csv',
        'portLevel_VA23.csv',
        'portLevel_VA31.csv',
        'portLevel_VA32.csv',
        'portLevel_VA33.csv',
        'portLevel_VC11.csv',
        'portLevel_VC12.csv',
        'portLevel_VC13.csv',
        'portLevel_VC21.csv',
        'portLevel_VC22.csv',
        'portLevel_VC23.csv',
        'portLevel_VC31.csv',
        'portLevel_VC32.csv',
        'portLevel_VC33.csv'
    ]
    for name in file_name_list:
        temp_list = read_csv(Base_path+name)
        list_to_write = delete(data, temp_list)
        write_csv(Base_path+name, list_to_write)