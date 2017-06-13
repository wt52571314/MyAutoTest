# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-09-01
# JSON累加
# ===============================================================================
import re
import json
list_use = '''
{"bw":{"BDF1":0.3000,"BDF2":0.3000,"BDF3":0.0000,"BDE1":0.4000,"BDE2":0.0000,"BDE3":0.0000,"BOF2":0.0000,"BOE1":0.0000,"BOE2":0.0000,"BC1":0.0000}}
{"bw":{"BDF1":0.0000,"BDF2":0.3000,"BDF3":0.0000,"BDE1":0.0000,"BDE2":0.0000,"BDE3":0.0000,"BOF2":0.0000,"BOE1":0.0000,"BOE2":0.3000,"BC1":0.4000}}
{"bw":{"BDF1":0.25,"BDF2":0.0000,"BDF3":0.0542,"BDE1":0,"BDE3":0,"BDE4":0.3548,"BOF1":0,"BOE3":0.091,"BOE1":0,"BOE2":0,"BC1":0,"BC2":0.25,"BDE1":0}}
{"bw":{"BDF1":0.1856,"BDF2":0.1595,"BDF3":0.0000,"BDE2":0.0000,"BDE3":0.0000,"BDE4":0.0000,"BOF1":0.1917,"BOE3":0.0000,"BOE1":0.1088,"BOE2":0.1644,"BC1":0.1900,"BC2":0.0000,"BDE1":0.0000}}
'''

list_h = []

list_pro = re.findall(r"\{\D*\{.*\}\}", list_use)
for item in list_pro:
    i = json.loads(item)
    for key in i:
        # print key
        list_h.append(i[key])
for item_1 in list_h:
    a = 0
    for key in item_1:
        a += item_1[key]
    print a
