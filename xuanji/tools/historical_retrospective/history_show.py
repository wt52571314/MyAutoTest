# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-17
# 历史回溯
# ===============================================================================
from file_until import file_read
from rule_check import transfer_positions
from users import User
from rule_config import *


def user_transfer(old_key, old_value, new_key, new_value, user_rule_used):
    """
    用于存储用户调仓记录
    :param old_key: 持有的的方案id
    :param old_value: 持有的方案明细
    :param new_key: 新推来的方案id
    :param new_value: 新推来的方案明细
    :param user_rule_used: 用户用到的调仓规则
    :return: 是否调仓
    """
    user = User()
    user.set_old(old_key, old_value)
    user.set_new(new_key, new_value)
    is_transfer, file_result_old = user.get_old()
    file_result_new = user.get_new()
    if transfer_positions(file_result_old, file_result_new, user_rule_used, is_transfer) == 1:
        return True
    elif transfer_positions(file_result_old, file_result_new, user_rule_used, is_transfer) == 0:
        return False
    else:
        print 'Have an ERROR!! Opps in '+str(new_key)
        return False


def exec_result(file_result):
    """
    格式化方案数据
    :param file_result:从文件读取的方案数据
    :return:格式化好的数据（添加数据对应的key）
    """
    list_used = {}
    for key in file_result:
        dir_used = {}
        for index in range(file_result[key]):
            dir_used[file_title[index]] = file_result[key][index]
        list_used[key] = dir_used
    return list_used


def check_rule(utype):
    """
    用于返回用户类型对应的调仓规则
    :param utype: 用户类型
    :return:调仓规则
    """
    list_used = []
    for key in user_type:
        if key == utype:
            for item in user_type[key]:
                list_used.append(dir_rule[item])
            return list_used