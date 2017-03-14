# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-8-29
# 所有组合风险测评结果
# ===============================================================================
import sys


def get_result_in_vector(vector, N, tmp, tmp_result):
    """
    :param vector:所有组合的拼接
    :param N:从几开始
    :param tmp:
    :param tmp_result: 空列表，暂时存储结果
    :return:所有组合
    获取所有组合结果
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


def get_all_score(list_use):
    """
    算分用的
    :param list_use:组合结果【（题号，分数）】
    :return:【（组合分数， 16题选项）】
    """
    list_result = []
    for result_use in list_use:
        option = 0
        score = 0
        for index in result_use:
            score += index[1]
            option = index[0]
        tuple_use = (score, option)
        list_result.append(tuple_use)
    return list_result


def get_style(list_score):
    """
    存储结果
    :param list_score: 【（分数， 16题选项）】
    :return:风险结果
    """
    # file_save_risk = open('D:\log\\risk.txt', 'a')
    result = []
    i = 0
    for index in list_score:
        i += 1
        risk_score = index[0]
        if index[1] == 16.1:
            str_risk = str(i)+':risk_bs'
        elif index[1] == 16.2:
            if risk_score < 1:
                str_risk = str(i)+':risk_bs'
            else:
                str_risk = str(i)+':risk_bs'
        elif index[1] == 16.3:
            if risk_score < 1:
                str_risk = str(i)+':risk_bs'
            elif (risk_score >= 1) and (risk_score <= 5):
                str_risk = str(i)+':risk_bs'
            else:
                str_risk = str(i)+':risk_wj'
        elif index[1] == 16.4:
            if risk_score < 1:
                str_risk = str(i)+':risk_bs'
            elif (risk_score >= 1) and (risk_score <= 5):
                str_risk = str(i)+':risk_bs'
            elif (risk_score >= 6) and (risk_score <= 10):
                str_risk = str(i)+':risk_wj'
            else:
                str_risk = str(i)+':risk_cz'
        elif index[1] == 16.5:
            if risk_score < 1:
                str_risk = str(i)+':risk_bs'
            elif (risk_score >= 1) and (risk_score <= 10):
                str_risk = str(i)+':risk_wj'
            elif (risk_score >= 11) and (risk_score <= 15):
                str_risk = str(i)+':risk_cz'
            else:
                str_risk = str(i)+':risk_jj'
        elif index[1] == 16.6:
            if risk_score < 1:
                str_risk = str(i)+':risk_bs'
            elif (risk_score >= 1) and (risk_score <= 5):
                str_risk = str(i)+':risk_wj'
            elif (risk_score >= 6) and (risk_score <= 15):
                str_risk = str(i)+':risk_cz'
            elif (risk_score >= 16) and (risk_score <= 20):
                str_risk = str(i)+':risk_jj'
            else:
                str_risk = str(i)+':risk_jj'
        result.append(str_risk)
    return result


def write_file(result_so):
    """
    写文件，分文件
    :param result_so:分数结果
    :return:None
    """
    file_index = 0
    counter = 0
    for elem in result_so:
        if counter % 4000 == 0:
            file_index += 1
            file_patch = 'D:\log\\xuanji\pro_result\pro_result'+str(file_index)+'.txt'
            file_save = open(file_patch, 'a+')
        file_save.writelines(elem)
        file_save.writelines('\n')
        counter += 1
        if counter % 4000 == 0:
            file_save.close()


if __name__ == '__main__':
    """
    :arg: arr[]:里面是元组，元组第一项是题号，第二项是投资风险分
    """
    i = 0
    arr1 = [(1.1, 0)]  # [(1.2, -1), (1.3, -2), (1.4, 0)]
    arr2 = [(2.1, -2), (2.2, -1), (2.3, 0), (2.4, 1), (2.5, 2)]
    # arr3 = [(3.1, -2), (3.2, -1), (3.3, 0), (3.4, 1), (3.5, 1)]
    arr4 = [(4.1, -2), (4.2, -1), (4.3, 0), (4.4, 0), (4.5, 1)]
    # arr5 = [(5.1, -2), (5.2, -1), (5.3, 0), (5.4, 0), (5.5, 1)]
    arr6 = [(6.1, 3), (6.2, 2), (6.3, 1), (6.4, 0), (6.5, -1)]
    arr7 = [(7.1, 0), (7.2, 2), (7.3, 3), (7.4, 1)]
    arr8 = [(8.1, 0), (8.2, 1)]
    arr9 = [(9.1, 0), (9.2, 2)]
    arr10 = [(10.1, 0), (10.2, 2), (10.3, 3)]
    arr11 = [(11.1, 2), (11.2, 0)]
    arr12 = [(12.1, 0), (12.2, 0)]
    arr13 = [(13.1, 0), (13.2, 3)]
    arr14 = [(14.1, 0), (14.2, 2), (14.3, 1), (14.4, 1)]
    arr15 = [(15.1, 0), (15.2, 3), (15.3, 2), (15.4, 1)]
    arr16 = [(16.1, 0), (16.2, 1), (16.3, 2), (16.4, 3), (16.5, 4), (16.6, 6)]
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
    result_combine = get_result_in_vector(vec_list, 0, tmp_vec, result)

    # f = open('D:\log\\input.txt', 'a')
    # for elem in result_combine:
    #     i += 1
    #     if i > 3985:
    #         sys.exit(0)
    #     f.writelines(str(i)+':'+str(elem))
    #     f.writelines('\n')
    # f.close()
    # print result_combine
    result_score = get_all_score(result_combine)
    # print result_score
    result_so = get_style(result_score)
    write_file(result_so)
    # # for i in range(0,first_dimension-1):
    # #     for j in range(0,2):
    # #print result

