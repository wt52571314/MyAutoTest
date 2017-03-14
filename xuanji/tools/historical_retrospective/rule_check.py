# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-17
# 检查是否需要调仓
# ===============================================================================
from rule_config import *
from tools_file import date_diff


def check_rule(user_type_name, rule):
    """
    根据用户类型选定调仓规则
    :param user_type_name: 用户类型名称，如：非常积极型
    :param rule: config文件中的规则列表
    :return: 该用户所对应的所有调仓规则
    """
    user_rule_return = []
    user_rule_dir = user_type[user_type_name]
    for key in user_rule_dir:
        user_rule = user_rule_dir[key]
    for item in user_rule:
        user_rule_return.append(rule[item])
    return user_rule_return


def degree_difference(old_degree, new_degree, deference):
    """
    偏离度计算比对
    :param old_degree: 上一次持有的比例对应标杆计算的总比例
    :param new_degree: 新推的标杆对应的总比例
    :param deference: 调仓对应的偏离度
    :return:是否满足调仓条件
    """
    if abs(float(old_degree)-float(new_degree)) >= deference:
        return True
    else:
        return False


def date_difference(old_date, new_date, deference):
    """
    日期间隔计算比对
    :param old_date: 当前持有组合调仓日期
    :param new_date: 新组合推进日期
    :param deference: 规则中的调仓间隔
    :return:是否满足调仓条件
    """
    if date_diff(new_date, old_date) >= deference:
        return True
    else:
        return False


def score_diff(score_old, score_new, deference):
    """
    模型分差值计算比对
    :param score_old: 当前持有组合模型分值
    :param score_new: 新组合模型分值
    :param deference: 规则中的模型分偏差
    :return:是否满足调仓条件
    """
    if abs(float(score_old) - float(score_new)) >= deference:
        return True
    else:
        return False


def transfer_positions(file_result_old, file_result_new, user_rule_used, is_transfer):
    """
    检查是否调仓
    :param file_result_old: 上次持有的组合
    :param file_result_new: 新推的组合
    :param user_rule_used: 用户对应调仓规则--单条规则
    :param is_transfer: 是否首单，0是首单，其他不是
    :return: 1--调仓，0--不调仓
    """
    if is_transfer == 0:
        return 1
    else:
        # 这块用来检查偏离度
        degree_old = 0
        degree_new = 0
        for Benchmark in user_rule_used['Benchmark']:
            degree_old += float(file_result_old[Benchmark])
            degree_new += float(file_result_new[Benchmark])
        if degree_difference(degree_old, degree_new, user_rule_used['Deviation']):
            pass
        else:
            return 0
        # 这块用来检查日期间隔
        date_new = file_result_new['date']
        date_old = file_result_old['date']
        if date_difference(date_old, date_new, user_rule_used['days']):
            pass
        else:
            return 0
        # 这块用来检查模型分和模型分差值
        score_deference = user_rule_used['score_deference']
        score = user_rule_used['score']
        if score_deference is None:
            if file_result_new['score'] <= -2:
                return 1
            else:
                return 0
        elif score is None:
            if score_diff(file_result_old['score'], file_result_new['score'], score_deference):
                return 1
            else:
                return 0
        else:
            print '规则有误，请检查'
            return -1