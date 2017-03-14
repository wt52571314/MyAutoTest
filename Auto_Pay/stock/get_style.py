# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-7-13
# 从接口遍历所有组合，获取结果
# ===============================================================================
import json

import requests

from interface_test import login
from InterFace_List import split_line


def get_result_in_vector(vector, N, tmp, tmp_result):
    for i in range(0, len(vector)):
        if i < len(vector[N]):
            tmp.append(vector[N][i])
            if N < len(vector)-1:
                get_result_in_vector(vector, N+1, tmp, tmp_result)
            else:
                one_result = []
                for j in range(0, len(tmp)):
                    one_result.append(tmp[j])
                tmp_result.append(one_result)
            tmp.pop()
        else:
            continue
    return tmp_result


def make_input(fp):
    input_combine = []
    question = [49, 50, 51, 52, 53, 54, 55, 56, 57, 58]
    for combine in fp:
        dir_result = {}
        surveyResult = []
        for index in range(0, len(combine)):
            dir_use = {}
            dir_use['optionId'] = combine[index]
            dir_use['questionId'] = question[index]
            surveyResult.append(dir_use)
        dir_result['surveyResult'] = surveyResult
        input_combine.append(surveyResult)
    return input_combine


def save_answer(input_list, cookie):
    answer = {}
    payload = {
        'Host': 'sj-api-01.jimustock.com',
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': '*/*',
        'Connection': 'keep-alive',
        'Proxy-Connection': 'keep-alive',
        'Accept-Language': 'zh-CN',
    }
    fp_use = open('D:\log\\risk_result.txt', 'a')
    i = 0
    for input_exmple in input_list:
        i += 1
        answer["surveyResult"] = input_exmple
        answer["roboAccountId"] = "54"
        print answer
        try:
            answer_result = requests.post('https://sj-api-01.jimustock.com/api/v1/us/roboAdvisor/postSurveyResult',
                                          data=json.dumps(answer), headers=payload,
                                          cookies=cookie)
            result_use = answer_result.content
            print str(i)+'\n'
            print result_use
            split_line()
            if '稳健' in result_use:
                risk = str(i)+':risk_wj'
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
    arr1 = [283, 284, 285, 286, 287]
    arr2 = [288, 289, 290, 291, 292, 293]
    arr3 = [294, 295]
    arr4 = [296, 297]
    arr5 = [298, 299, 300]
    arr6 = [301, 302]
    arr7 = [303, 304]
    arr8 = [305, 306, 307, 308]
    arr9 = [309, 310, 311, 312]
    arr10 = [313, 314, 315, 316, 317]
    first_dimension = len(arr1) + len(arr2) + len(arr3)
    result = []
    vec_list = []
    vec_list.append(arr1)
    vec_list.append(arr2)
    vec_list.append(arr3)
    vec_list.append(arr4)
    vec_list.append(arr5)
    vec_list.append(arr6)
    vec_list.append(arr7)
    vec_list.append(arr8)
    vec_list.append(arr9)
    vec_list.append(arr10)
    tmp_vec = []
    fp = get_result_in_vector(vec_list, 0, tmp_vec, result)
    input_use = make_input(fp)
    cookies = login()
    save_answer(input_use, cookies)