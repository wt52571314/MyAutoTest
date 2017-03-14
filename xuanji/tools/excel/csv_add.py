# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator:张海南
# @ Date:2016-09-26
# @ 描述：CSV增加一行
#  ===============================================================================
import xlrd


def write_append(pro_name, end_name):
    import csv
    with open(end_name, 'ab+') as csvfile:
        spamwriter = csv.writer(csvfile, dialect='excel')
        spamwriter.writerow(pro_name)
    csvfile.close()


def get_pro_name(pro_file_use):
    list_use = []
    workbook = xlrd.open_workbook(pro_file_use)
    sheet_name = workbook.sheet_by_name('Sheet1')
    for i in range(0, sheet_name.nrows):
        list_temp = []
        for j in range(0, 5):
            if j == 0:
                list_temp.append(int(sheet_name.cell(i, j).value))
            else:
                list_temp.append(float(sheet_name.cell(i, j).value))
        list_use.append(list_temp)
    return list_use

if __name__ == "__main__":
    pro_file = 'D:\log\excel\input.xls'
    pro_name = get_pro_name(pro_file)

    Base_path = 'D:\log\excel\PortLevel\\'
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
    for index in range(0, len(file_name_list)):
        print index
        # print pro_name[index]
        # print Base_path+file_name_list[index]
        write_append(pro_name[index], Base_path+file_name_list[index])
