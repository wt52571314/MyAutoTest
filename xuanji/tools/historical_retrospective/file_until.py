# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-17
# 历史回溯中的文件处理
# ===============================================================================
import xlrd
file_path = 'D:\log\\xuanji\history\\file'
file_name = '\\dailyWeights.xlsx'


def file_read():
    """
    读取给定文件，返回读取结果
    :return:
    """
    user_type = u'非常积极'
    workbook = xlrd.open_workbook(file_path+file_name)
    sheet_name = workbook.sheet_by_name(user_type)
    rows_len = sheet_name.nrows
    columns_len = sheet_name.ncols
    result = {}
    for index_row in range(1, rows_len):
        row_list = []
        for index_column in range(columns_len):
            values = sheet_name.cell(index_row, index_column).value
            if values < 0.0001:
                if values < 0:
                    values = values
                else:
                    values = 0
            elif values > 100:
                values = int(values)
            else:
                values = round(values, 4)
            row_list.append(values)
        result[index_row-1] = row_list
    return user_type, result

# if __name__ == '__main__':
#     a, b = file_read()
#     print a
#     for key in b:
#         print b[key]