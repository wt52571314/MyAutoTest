# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2017-04-19
# 功能实验室
# ===============================================================================
import re

if __name__ == '__main__':
    str_use = '''<AppSheetSerialNo                        Description="申请单编号"                                 Type="string"       Length="24"       Decimal=""      Default=""  To="ParamByName('ordersno').AsString := Copy(AppSheetSerialNo,17,8);ParamByName('sendsn').AsString := AppSheetSerialNo"/>'''
    list_note = re.findall(r'Description=\"\D+\"', str_use)
    print list_note[0][13:-62]
