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
    print '开始这一步了！！！'
    question = [17, 18, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]
    # question = [17, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]
    file_index = 0
    counter = 0
    # input_combine = []
    for combine in input_list:
        combine_use = []
        for index_use in range(0, len(combine)):
            str_use = '{\"questionId\": ' + str(question[index_use]) + ', \"questionAns\": ' + str(combine[index_use])+'}, '
            # print str_use
            combine_use.append(str_use)
            # print combine_use
        if counter % 4000 == 0:
            file_index += 1
            file_patch = 'D:\\log\\xuanji\\input\\input'+str(file_index)+'.txt'
            file_save = open(file_patch, 'a+')
        file_save.writelines(combine_use)
        file_save.writelines('\n')
        counter += 1
        if counter % 4000 == 0:
            file_save.close()
    #     input_combine.append(combine_use)
    # return input_combine


def save_input(input_com):
    """
    用于存储输入数据
    :param input_com: 构造好的答案JSON列表
    :return:None
    """
    print '开始存文件了'
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
    arr1 = [61]
    # arr1 = [62, 63, 64]
    arr2 = [65, 66, 67, 68, 69]
    # arr3 = [70, 71, 72, 73, 74]
    arr4 = [75, 76, 77, 78, 79]
    # arr5 = [80, 81, 82, 83, 84]
    arr6 = [85, 86, 87, 88, 89]
    arr7 = [90,  91, 92, 93]
    arr8 = [94, 95]
    arr9 = [96, 97]
    arr10 = [98, 99, 100]
    arr11 = [101, 102]
    arr12 = [103, 104]
    arr13 = [105, 106]
    arr14 = [107, 108, 109, 110]
    arr15 = [111, 112, 113, 114]
    arr16 = [115, 116, 117, 118, 119, 120]
    result = []
    vec_list = []
    vec_list.append(arr1)
    vec_list.append(arr2)
    # vec_list.append(arr3)
    vec_list.append(arr4)
    # vec_list.append(arr5)
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

    make_input(input_use)
    # save_use = make_input(input_use)
    # save_input(save_use)