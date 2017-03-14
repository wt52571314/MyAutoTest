# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-8-29
# 从接口遍历所有组合，获取结果
# ===============================================================================
import json
import requests
import urllib
import re


def split_line():
    """
    输出分割线
    :return:None
    """
    print '*'*50


def login():
    header = {'Accept': '*/*',
              'x-device-info': 'IPhone6/9.3.2/ios/8010122/3',
              'idfa': '8265BFF6-22A9-4003-87AA-0E3688741977',
              'Connection': 'keep-alive',
              'Accept-Encoding': 'gzip;q=1.0, compress;q=0.5',
              'Accept-Language': 'zh-Hans-CN;q=1.0',
              'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
              }
    data_use = 'captcha=&la=0&lo=0&password=111111&username=11100004444'
    r = requests.post('http://jmbx-miracle-app.qa-06.jimu.com/merak/login', data=data_use,
                      headers=header)
    return r.cookies


def read_input(file_index):
    file_patch = 'D:\\log\\xuanji\\input\\input'+str(file_index)+'.txt'
    fp = open(file_patch, 'r')
    split_line()
    print '打开了第'+str(f_index)+'个入参文件'
    split_line()
    return fp


def close_file(fp):
    fp.close()


def save_answer(input_list, file_index, cookies):
    """
    访问接口并判断结果，然后写入文件
    :param input_list: 答案JSON列表
    :return:None
    """
    input_list_use = input_list.readlines()
    answer = {}
    header = {'Accept': '*/*',
              'x-device-info': 'IPhone6/9.3.2/ios/8010122/3',
              'idfa': '8265BFF6-22A9-4003-87AA-0E3688741977',
              'Connection': 'keep-alive',
              'Accept-Encoding': 'gzip;q=1.0, compress;q=0.5',
              'Accept-Language': 'zh-Hans-CN;q=1.0',
              'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
              }
    fp_use = open('D:\\log\\xuanji\\end_result\\end_result'+str(file_index)+'.txt', 'a')
    split_line()
    print '打开了第'+str(f_index)+'个end文件'
    split_line()
    i = 0
    for input_exmple in input_list_use:
        list_use = []
        for item in re.findall(r"\{\D*: \d*, \D*: \d*\}", input_exmple):
            a = eval(item)
            # print 'type(a):'+str(type(a))
            list_use.append(a)
        i += 1
        # print 'type(list_use):'+str(type(list_use))
        answer["answers"] = list_use
        answer["la"] = 0
        answer["lo"] = 0
        # print answer
        # print type(answer)
        try:
            answer_result = requests.post('http://jmbx-miracle-app.qa-06.jimu.com/merak/api/v2/question/saveQuestion',
                                          data=urllib.urlencode(answer), headers=header, cookies=cookies)
            result_use = answer_result.content
            print str(i)+'\n'
            print result_use
            split_line()
            if '稳健' in result_use:
                risk = str(i)+':risk_wj'
            elif '非常保守' in result_use:
                risk = str(i)+':risk_fcbs'
            elif '保守' in result_use:
                risk = str(i)+':risk_bs'
            elif '非常积极' in result_use:
                risk = str(i)+':risk_fcjj'
            elif '积极' in result_use:
                risk = str(i)+':risk_jj'
            elif '成长' in result_use:
                risk = str(i)+':risk_cz'
            else:
                risk = str(i)+':ERROR!'+'*'*50
            fp_use.writelines(risk)
            fp_use.writelines('\n')
        except:
            risk = 'have one trace'+'#'*50
            fp_use.writelines(risk)
            fp_use.writelines('\n')
            pass
    fp_use.close()

if __name__ == '__main__':
    cookie = login()
    for f_index in range(1, 4609):
        fp = read_input(f_index)
        save_answer(fp, f_index, cookie)
        close_file(fp)