# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-11-23
# 月报计算工具
# ===============================================================================
import datetime


def get_max_dd(nav_list):
    """
    获取市场最大回撤
    :param nav_list: 净值列表
    :return: 最大回撤率
    """
    length = len(nav_list)
    max_data = nav_list[0]
    max_d = 0
    for i in range(1, length):
        max_data = max(max_data, nav_list[i])
        dd = (max_data - nav_list[i]) / max_data
        if dd > max_d:
            max_d = dd
    return round(max_d, 4)


def get_day_diff(data_use, now_time):
    """
    计算时间差
    :param data_use: 前一时间
    :param now_time: 后一时间
    :return: 时间差
    """
    return (now_time-data_use).days


def get_monthly_profit(before_total, after_total, in_money, out_money, qz_used):
    """
    月收益计算
    :param before_total: 前月底投资总市值
    :param after_total: 本月底投资总市值
    :param in_money: 本月入金金额
    :param out_money: 本月出金金额
    :param qz_used: 当月入金权重
    :return: 本月收益,本月收益率
    """
    profit = round(after_total-before_total+out_money-in_money, 3)
    ratio = round(profit/(qz_used+before_total))
    return profit, ratio


def get_monthly_qz(in_dict, times):
    """
    获取月入金权重
    :param in_dict: 入金字典{时间差：金额}
    :param times: 当月天数
    :return: 月入金权重
    """
    qz = 0
    for key in in_dict:
        num = in_dict[key]*((times-key)/times)
        qz += num
    return qz


def get_asset_allocation_yield(recommend_yield_dir):
    """
    获取资产配置收益率
    :param recommend_yield_dir:标杆比例收益字典{标杆占比：收益率}
    :return:资产配置收益率
    """
    aum = 0
    for key in recommend_yield_dir:
        aum += key*recommend_yield_dir[key]
    return aum


def is_leap_year(year):
    """
    判断闰年
    :param year:年份
    :return: true or false
    """
    if year % 4 == 0:
        return True
    return False


def get_end_of_month(year, month):
    """
    获取月底时间
    :param year:年份
    :param month:月份
    :return:月底时间字符串，格式：2016-09-30
    """
    if month in (1, 3, 5, 7, 8, 10, 12):
        if month == 10 or month == 12:
            return str(year)+'-'+str(month)+'-31'
        else:
            return str(year) + '-0' + str(month) + '-31'
    elif month in (4, 6, 9, 11):
        if month == 11:
            return str(year) + '-' + str(month) + '-30'
        else:
            return str(year) + '-0' + str(month) + '-30'
    elif month == 2:
        if is_leap_year(year):
            return str(year) + '-0' + str(month) + '-29'
        else:
            return str(year) + '-0' + str(month) + '-28'

if __name__ == '__main__':
    print get_end_of_month(2016, 9)
