# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator:张海南
# @ Date:2017-04-10
# @ 描述：最优提现数值计算
#  ===============================================================================
import re
import json

list_use_start = '''
{"bw":{"BDF1":0.4999,"BDF2":0.0940,"BDF3":0.1060,"BDE1":0.1319,"BDE2":0.0000,"BDE3":0.0000,"BOF2":0.0926,"BOE1":0.0756,"BOE2":0.0000,"BC1":0.0000}}
'''
dir_recommend = {
    'BC1': '黄金',
    'BC2': '全球商品投资--原物料',
    'BDE1':	'国内多元资产',
    'BDE2':	'国内大盘股',
    'BDE3':	'国内中小盘股',
    'BDF1':	'国内现金类资产',
    'BDF2':	'国内高评级债券',
    'BDF3':	'国内高收益债券',
    'BOE1':	'海外成熟市场股票',
    'BOE2':	'海外新兴市场股票',
    'BOF1':	'海外中、高等评债权投资',
    'BOF2':	'海外高收益债券',
    'BC3':	'房地产市场',
    'BDE4':	'国内股其它',
    'BDF4':	'国内现金类其它',
    'BDF5':	'国内债其它',
    'BOE3':	'海外股权市场其它',
    'BC4': '原油市场',
    'BOF3':	'海外债其它'
}


def get_list(list_use):
    list_pro = re.findall(r"\{\D*\{.*\}\}", list_use)
    # print list_pro
    recommend = json.loads(list_pro[0])
    return recommend['bw']


def get_money(money, rate):
    return money*rate

if __name__ == '__main__':
    money_use = 152082.57
    recommend_use = get_list(list_use_start)
    print '=============最优提现测试数据=================='
    print "账户总钱数：" + str(money_use)
    for key in recommend_use:
        if recommend_use[key] > 0:
            print str(dir_recommend[key]) + ': ' + str(get_money(money_use, recommend_use[key]))
