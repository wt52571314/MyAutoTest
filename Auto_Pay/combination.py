# - coding: utf-8 -*-
#=======*-========================================================================
#@ Creator：Hainnan.Zhang
#@ Date:2016-3-10
#组合功能实验
#===============================================================================
def get_result_in_vector(vector, N, tmp, tmp_result):
    file = open('D:\log\input.txt', 'a')
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
    arr1 = [1, 2, 3, 4, 5]
    arr2 = [6, 7, 8, 9, 10]
    arr3 = [11, 12]
    arr4 = [13, 14, 15, 16, 17]
    arr5 = [18, 19, 21, 22, 23]
    arr6 = [24, 25]
    arr7 = [26, 27]
    arr8 = [28, 29]
    arr9 = [30, 31, 32]
    arr10 = [33, 34]
    arr11 = [35, 36]
    arr12 = [52, 53]
    arr13 = [37, 38, 39, 40]
    arr14 = [41, 42, 43, 44]
    arr15 = [45, 46, 47, 48, 49, 50, 51]
    first_dimension = len(arr1) + len(arr2) + len(arr3)
    result = []
    vec = []
    vec.append(arr1)
    vec.append(arr2)
    vec.append(arr3)
    vec.append(arr4)
    vec.append(arr5)
    vec.append(arr6)
    vec.append(arr7)
    vec.append(arr8)
    vec.append(arr9)
    vec.append(arr10)
    vec.append(arr11)
    vec.append(arr12)
    vec.append(arr13)
    vec.append(arr14)
    vec.append(arr15)
    get_all_combination(vec, result)

    # for i in range(0,first_dimension-1):
    #     for j in range(0,2):
    #print result