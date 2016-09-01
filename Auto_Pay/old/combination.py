# - coding: utf-8 -*-
#=======*-========================================================================
#@ Creator：Hainnan.Zhang
#@ Date:2016-3-10
#组合功能实验
#===============================================================================
def get_result_in_vector(vector, N, tmp, tmp_result):
    file = open('D:\log\\input.txt', 'a')
    for i in range(0, len(vector)):
        if i < len(vector[N]):
            tmp.append(vector[N][i])
            if N < len(vector)-1:
                get_result_in_vector(vector, N+1, tmp, tmp_result)
            else:
                one_result = []
                for j in range(0,len(tmp)):
                    one_result.append(tmp[j])
                file.writelines(str(one_result))
                file.writelines('\n')
                #tmp_result.append(one_result)
            tmp.pop()
        else:
            continue
    file.close()


def get_all_combination(List, result):
    tmp_vec = []
    tmp_result = []
    get_result_in_vector(List, 0, tmp_vec, tmp_result)
    for i in range(0, len(tmp_result)):
        result.append([])
        for j in range(0, len(tmp_result[i])):
            result[i].append(tmp_result[i][j])

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
    get_all_combination(vec_list, result)

    # for i in range(0,first_dimension-1):
    #     for j in range(0,2):
    #print result