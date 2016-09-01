# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-8-30
# 创建接口遍历输入文件
# ===============================================================================
import json
import requests


def split_line():
    """
    输出分割线
    :return:None
    """
    print '*'*50


def get_result_in_vector(vector, N, tmp, tmp_result):
    """
    获得所有答案组合（使用算法栈）
    :param vector:所有问题&&答案拼接
    :param N: 从哪个下标开始
    :param tmp:
    :param tmp_result: 临时答案存储列表
    :return:所有答案组合
    """
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


def make_input(input_list):
    """
    构造答案JSON
    :param input_list: get_result_in_vector获取的所有组合
    :return:构造好的答案JSON列表
    """
    input_combine = []
    question = [49, 50, 51, 52, 53, 54, 55, 56, 57, 58]
    for combine in input_list:
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


def save_input(input_com):
    """
    用于存储输入数据
    :param input_com: 构造好的答案JSON列表
    :return:None
    """
    file_index = 0
    counter = 0
    for item in input_com:
        if counter % 4000 == 0:
            file_index += 1
            file_patch = 'D:\\log\\xuanji\\input\\input'+str(file_index)+'.txt'
            file_save = open(file_patch, 'a+')
        file_save.writelines(item)
        file_save.writelines('\n')
        counter += 1
        if counter % 4000 == 0:
            file_save.close()


if __name__ == '__main__':
    arr1 = [1.2, 1.3, 1.4]  # [1.1]
    # arr2 = [2.1, 2.2, 2.3, 2.4, 2.5]
    arr3 = [3.1, 3.2, 3.3, 3.4, 3.5]
    # arr4 = [4.1, 4.2, 4.3, 4.4, 4.5]
    arr5 = [5.1, 5.2, 5.3, 5.4, 5.5]
    arr6 = [6.1, 6.2, 6.3, 6.4, 6.5]
    arr7 = [7.1, 7.2, 7.3, 7.4]
    arr8 = [8.1, 8.2]
    arr9 = [9.1, 9.2]
    arr10 = [10.1, 10.2, 10.3]
    arr11 = [11.1, 11.2]
    arr12 = [12.1, 12.2]
    arr13 = [13.1, 13.2]
    arr14 = [14.1, 14.2, 14.3, 14.4]
    arr15 = [15.1, 15.2, 15.3, 15.4]
    arr16 = [16.1, 16.2, 16.3, 16.4, 16.5, 16.6]
    result = []
    vec_list = []
    vec_list.append(arr1)
    # vec_list.append(arr2)
    vec_list.append(arr3)
    # vec_list.append(arr4)
    vec_list.append(arr5)
    vec_list.append(arr6)
    vec_list.append(arr7)
    vec_list.append(arr8)
    vec_list.append(arr9)
    vec_list.append(arr10)
    vec_list.append(arr11)
    vec_list.append(arr12)
    vec_list.append(arr13)
    vec_list.append(arr14)
    vec_list.append(arr15)
    vec_list.append(arr16)
    tmp_vec = []
    input_use = get_result_in_vector(vec_list, 0, tmp_vec, result)
    save_use = make_input(input_use)
    save_input(save_use)