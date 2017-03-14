# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-17
# 调仓规则配置文件
# ===============================================================================
# 文件列名列表
# ===============================================================================
file_title = [
    'date', 'BDF1', 'BDF2', 'BDF3', 'BDE1', 'BDE2', 'BDE3', 'BOF1', 'BOF2', 'BOE1', 'BOE2', 'BC1', 'BC2', 'score'
]
# ===============================================================================
# 除非常保守型以外偏离度计算的标杆
# ===============================================================================
Benchmarking_list1 = ['BDE3', 'BDE2', 'BOE1', 'BOE2', 'BOF2', 'BC1']
# ===============================================================================
# 非常保守型偏离度计算的标杆
# ===============================================================================
Benchmarking_list2 = ['BDF1', 'BDF2', 'BDF3', 'BOF2']
# ===============================================================================
# 触发调仓的规则
# ===============================================================================
dir_rule = {
    'rule1': {'Benchmark': Benchmarking_list1, 'Deviation': 0.3, 'score_deference': 2, 'days': 15, 'score': None}
    , 'rule2': {'Benchmark': Benchmarking_list1, 'Deviation': 0.15, 'score_deference': None, 'days': 15, 'score': -2}
    , 'rule3': {'Benchmark': Benchmarking_list1, 'Deviation': 0.3, 'score_deference': 2, 'days': 15, 'score': None}
    , 'rule4': {'Benchmark': Benchmarking_list1, 'Deviation': 0.15, 'score_deference': None, 'days': 15, 'score': -2}
    , 'rule5': {'Benchmark': Benchmarking_list1, 'Deviation': 0.3, 'score_deference': 2, 'days': 20, 'score': None}
    , 'rule6': {'Benchmark': Benchmarking_list1, 'Deviation': 0.15, 'score_deference': None, 'days': 20, 'score': -2}
    , 'rule7': {'Benchmark': Benchmarking_list1, 'Deviation': 0.275, 'score_deference': 2, 'days': 20, 'score': None}
    , 'rule8': {'Benchmark': Benchmarking_list1, 'Deviation': 0.15, 'score_deference': None, 'days': 20, 'score': -2}
    , 'rule9': {'Benchmark': Benchmarking_list1, 'Deviation': 0.2, 'score_deference': 2, 'days': 25, 'score': None}
    , 'rule10': {'Benchmark': Benchmarking_list1, 'Deviation': 0.1, 'score_deference': None, 'days': 25, 'score': -2}
    , 'rule11': {'Benchmark': Benchmarking_list2, 'Deviation': 0.25, 'score_deference': None, 'days': 25, 'score': None}
}
# ===============================================================================
# 用户类型字典以及其应用的调仓规则
# ===============================================================================
user_type = {
    '非常积极': ['rule1', 'rule2'],
    '积极': ['rule3', 'rule4'],
    '成长': ['rule5', 'rule6'],
    '稳健': ['rule7', 'rule8'],
    '保守': ['rule9', 'rule10'],
    '非常保守': ['rule11']
}