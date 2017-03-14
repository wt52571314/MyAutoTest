# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-7-13
# 所有组合风险测评结果
# ===============================================================================
import sys


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


def get_all_score(list_use):
    list_result = []
    for result_use in list_use:
        # i = 0
        j = 0
        k = 0
        tuple_use = ()
        for index in result_use:
            # i += index[1]
            j += index[2]
            k = index[0]
        tuple_use = (j, k)
        list_result.append(tuple_use)
    return list_result


def save_style(list_score):
    # file_save_action = open('D:\log\\action.txt', 'a')
    file_save_risk = open('D:\log\\risk.txt', 'a')
    i = 0
    # for score_action in list_score:
    #     action_score = score_action[0]
    #     if action_score < 6:
    #         str_action = 'Action_easy'
    #     elif action_score > 16:
    #         str_action = 'Action_hard'
    #     else:
    #         str_action = 'Action_normal'
    #     file_save_action.writelines(str_action)
    #     file_save_action.writelines('\n')
    for index in list_score:
        i += 1
        risk_score = index[0]
        if index[1] == 313:
            str_risk = str(i)+':risk_bs'
        elif index[1] == 314:
            if risk_score < 6:
                str_risk = str(i)+':risk_bs'
            else:
                str_risk = str(i)+':risk_wj'
        elif index[1] == 315:
            if risk_score < 6:
                str_risk = str(i)+':risk_bs'
            elif (risk_score > 5) and (risk_score < 11):
                str_risk = str(i)+':risk_wj'
            else:
                str_risk = str(i)+':risk_cz'
        elif index[1] == 316:
            if risk_score < 6:
                str_risk = str(i)+':risk_bs'
            elif (risk_score > 5) and (risk_score < 11):
                str_risk = str(i)+':risk_wj'
            elif (risk_score > 10) and (risk_score < 15):
                str_risk = str(i)+':risk_cz'
            else:
                str_risk = str(i)+':risk_jj'
        elif index[1] == 317:
            if risk_score < 6:
                str_risk = str(i)+':risk_bs'
            elif (risk_score > 5) and (risk_score < 11):
                str_risk = str(i)+':risk_wj'
            elif (risk_score > 10) and (risk_score < 15):
                str_risk = str(i)+':risk_cz'
            elif (risk_score > 14) and (risk_score < 19):
                str_risk = str(i)+':risk_jj'
            else:
                str_risk = str(i)+':risk_fcjj'
        file_save_risk.writelines(str_risk)
        file_save_risk.writelines('\n')

    # file_save_action.close()
    file_save_risk.close()


if __name__ == '__main__':
    i = 0
    arr1 = [(283, 4, 3), (284, 2, 2), (285, 0, 1), (286, 1, 0), (287, 3, 0)]
    arr2 = [(288, 4, 1), (289, 4, 2), (290, 4, 2), (291, 3, 3), (292, 2, 2), (293, 0, 0)]
    arr3 = [(294, 2, 0), (295, 0, 1)]
    arr4 = [(296, 2, 0), (297, 0, 2)]
    arr5 = [(298, 0, 1), (299, 3, 3), (300, 2, 0)]
    arr6 = [(301, 2, 2), (302, 0, 0)]
    arr7 = [(303, 0, 0), (304, 3, 3)]
    arr8 = [(305, 1, 0), (306, 0, 1), (307, 1, 1), (308, 2, 1)]
    arr9 = [(309, 1, 0), (310, 2, 3), (311, 0, 2), (312, 3, 1)]
    arr10 = [(313, 1, 3), (314, 0, 1), (315, 0, 2), (316, 1, 4), (317, 1, 6)]
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
    result_combine = get_result_in_vector(vec_list, 0, tmp_vec, result)
    f = open('D:\log\\input.txt', 'a')
    for elem in result_combine:
        i += 1
        if i > 3985:
            sys.exit(0)
        f.writelines(str(i)+':'+str(elem))
        f.writelines('\n')
    f.close()
    # print result_combine
    result_score = get_all_score(result_combine)
    # print result_score
    save_style(result_score)

    # for i in range(0,first_dimension-1):
    #     for j in range(0,2):
    #print result