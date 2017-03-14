# # coding=utf-8
# # ===============================================================================
# # @ Creator:zhn
# # @ Date:2016-09-29
# # recommend表数据对比，算偏离度
# # ===============================================================================
import re
import json


list_use_start = '''
{"bw":{"BDF1":0.2077,"BDF2":0.0000,"BDF3":0.0000,"BDE1":0.2000,"BDE2":0.2000,"BDE3":0.0000,"BOF2":0.0000,"BOE1":0.2092,"BOE2":0.1831,"BC1":0.0000}}
'''
list_use_end = '''
{"bw":{"BDF1":0.4077,"BDF2":0.0000,"BDF3":0.0000,"BDE1":0.0000,"BDE2":0.0000,"BDE3":0.0000,"BOF2":0.0000,"BOE1":0.4092,"BOE2":0.1831,"BC1":0.0000}}
'''
list_start = []
list_end = []


def get_list(list_show, list_use):
    list_pro = re.findall(r"\{\D*\{.*\}\}", list_use)
    # print list_pro
    for item in list_pro:
        i = json.loads(item)
        for key in i:
            list_show.append(i[key])
    return list_show

if __name__ == '__main__':
    result = 0
    key_list = ["BDE3", "BDE2", "BOE1", "BOE2", "BOF2", "BC1"]  # 非常保守型以外
    # key_list = ["BDF1", "BDF2", "BDF3", "BOF2"]  # 非常保守型
    a = get_list(list_start, list_use_start)
    b = get_list(list_end, list_use_end)
    for key in key_list:
        x = abs(a[0][key]-b[0][key])
        result += x
    print result