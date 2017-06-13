# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-11
# '''获取当前日期前后N天或N月的日期'''
# ===============================================================================
import MySQLdb
import warnings
import json
from tools_list import *
warnings.filterwarnings("ignore")


def get_conn():
    """
    获取数据库连接
    :return: 数据库连接
    """
    connect = MySQLdb.connect(host='172.19.1.115', user='sandbox',
                              passwd='TxHT29VMfn4ZJ6VU', db='sandbox_protfolio_yuebao',
                              port=3386)
    return connect


def close(connect):
    """
    关闭数据库连接
    :param connect: 需要关闭的数据库连接
    :return: None
    """
    connect.close()


def get_nav_list(market, connect_use, start_time, end_time):
    """
    获取某一市场某时间段净值
    :param market: 市场名称--> DEV：成熟市场  EMG：新兴市场  SH000905：中证500  SHSZ300：深沪300  XAU：黄金
    :param connect_use:数据库连接
    :param start_time:开始日期  2016-10-31 00:00:00
    :param end_time:结束日期
    :return:该市场某时间段净值列表
    """
    list_use = []
    cursor = connect_use.cursor()
    sql = "select nav from exponent_nav WHERE exponent_code = '" + \
          market + "' and nav_date >= '" + start_time + "' and nav_date <= '" + end_time + "'"
    cursor.execute(sql)
    cds = cursor.fetchall()
    for i in cds:
        list_use.append(round(i[0], 3))
    return list_use


def get_profit_num():
    return None


def get_model_nav_list(recommend, aum, connect_use, start_time, end_time):
    """
    获取某一模型某时间段净值
    :param recommend: 用户类型：AGH,BEM……
    :param aum: 根据资产值算出的aum
    :param connect_use:数据库连接
    :param start_time:开始日期  2016-10-31 00:00:00
    :param end_time:结束日期
    :return:该市场某时间段净值列表
    """
    list_use = []
    cursor = connect_use.cursor()
    sql = "select month1 from utype_stdhis WHERE user_type = '" + \
          recommend\
          + "' and aum = "+aum+" and create_date >= '" + start_time + "' and create_date <= '" + end_time + "'"

    # sql = "select net_value from utype_stdhis_day WHERE user_type = '" + \
    #       recommend \
    #       + "' and aum = " + aum + " and create_date >= '" + start_time + "' and create_date <= '" + end_time + "'"

    cursor.execute(sql)
    cds = cursor.fetchall()
    # print cds
    for i in cds:
        list_use.append(round(i[0], 3))
    return list_use


def get_monthly_in_dict(connect_use, user_id, trans_date):
    """
    获取计算月入金权重所需字典
    :param connect_use: 数据库连接
    :param user_id: 用户id
    :param trans_date: 当月时间
    :return: 计算入金权重所需字典
    """
    dir_use = dict()
    cursor = connect_use.cursor()
    sql = "SELECT money,transTime FROM trans_detail WHERE userId = "\
          + user_id+" AND transTime LIKE '%"+trans_date+"%' AND transType = 0  " \
          "AND dealStatus <> 2"
    cursor.execute(sql)
    cds = cursor.fetchall()
    for i in cds:
        print i[0]
        print i[1]


def get_recommend_yield_dir(connect_use, user_id, date_use, user_type):
    """
    获取计算资产配置收益率所需要的入参列表
    :param connect_use: 数据库连接
    :param user_id: user_id
    :param date_use: 月底时间
    :param user_type: 用户类型
    :return: recommend_yield_dir:标杆比例收益字典{标杆占比：收益率}
    """
    recommend_yield_dir = dict()
    cursor_recommend = connect_use.cursor()
    sql_recommend = "SELECT bweight from user_recommend where user_type = '"+user_type+"' " \
                    "AND aum = 1 AND updateTime = '"+date_use+"'"
    cursor_recommend.execute(sql_recommend)
    cds_recommend = cursor_recommend.fetchall()
    recommend_dir = json.loads(cds_recommend[0][0]).get('bw')
    # print recommend_dir
    for key in recommend_dir:
        if recommend_dir[key] == 0:
            pass
        else:
            cursor_nav = connect_use.cursor()
            sql_nav = "select nav from exponent_nav WHERE exponent_code = '"+key+"' and " \
                      "nav_date >= '2016-09-01 00:00:00' " \
                      "and nav_date <= '2016-10-31 00:00:00' ORDER BY nav_date ASC"
            cursor_nav.execute(sql_nav)
            cds_nav = cursor_nav.fetchall()
            # print cds_nav
            num1 = (cds_nav[1][0]-cds_nav[0][0])/cds_nav[0][0]
            recommend_yield_dir[round(num1, 4)] = recommend_dir[key]
    return recommend_yield_dir


def get_product_yield_dir(connect_use, user_id, date_use, user_type):
    """
    获取计算产品超额优选收益率所需要的入参列表
    :param connect_use: 数据库连接
    :param user_id: user_id
    :param date_use: 月底时间
    :param user_type: 用户类型
    :return: recommend_yield_dir:标杆比例收益字典{标杆占比：产品收益率}
    """
    recommend_yield_dir = dict()
    cursor_recommend = connect_use.cursor()
    sql_recommend = "SELECT bweight from user_recommend where user_type = '"+user_type+"' " \
                    "AND aum = 1 AND updateTime = '"+date_use+"'"
    cursor_recommend.execute(sql_recommend)
    cds_recommend = cursor_recommend.fetchall()
    recommend_dir = json.loads(cds_recommend[0][0]).get('bw')
    # print recommend_dir
    for key in recommend_dir:
        if recommend_dir[key] == 0:
            pass
        else:
            cursor_nav = connect_use.cursor()
            sql_nav = "SELECT recovery_nav from product_nav WHERE product_id = (SELECT productId from product_rcmd" \
                      " WHERE benchmarkId = '"+key+"' and isUsed = 1 ORDER BY sequence ASC LIMIT 1) "\
                      "and end_date in ('2016-09-30 00:00:00','2016-10-31 00:00:00') ORDER BY end_date ASC"
            cursor_nav.execute(sql_nav)
            cds_nav = cursor_nav.fetchall()
            # print cds_nav
            if cds_nav[0][0] != 0:
                num1 = (cds_nav[1][0]-cds_nav[0][0])/cds_nav[0][0]
            else:
                num1 = 0
            # print '#'*50
            # print key
            # print round(num1, 4)
            # print '#' * 50
            recommend_yield_dir[round(num1, 4)] = recommend_dir[key]
    return recommend_yield_dir


def get_product_amount(connect_use, user_id, date_use):
    """
    获取产品月底持有份额
    :param connect_use: 数据库连接
    :param user_id: 用户ID
    :param date_use: 月底最后一分钟时间
    :return: 产品份额字典{产品ID：份额}
    """
    product_dir = dict()
    cursor_amount_hold = connect_use.cursor()
    sql_amount_hold = "SELECT pid,sum(holdAmount) as holdAmount " \
                      "from user_asset_detail " \
                      "where userId = '"+user_id+"' and modifyTime <= '" + \
                      date_use + "' and productStatus = 7 " \
                      "GROUP BY pid"
    cursor_amount_hold.execute(sql_amount_hold)
    hold_amount = cursor_amount_hold.fetchall()
    # print hold_amount

    cursor_amount_redeem = connect_use.cursor()
    sql_amount_redeem = "SELECT pid,sum(redeemAmount) as redeemAmount " \
                        "from user_asset_detail " \
                        "where userId = '"+user_id+"' and modifyTime <= '" + \
                        date_use + "' and productStatus = 13 " \
                        "GROUP BY pid"
    cursor_amount_redeem.execute(sql_amount_redeem)
    redeem_amount = cursor_amount_redeem.fetchall()
    # print redeem_amount

    for item_hold in hold_amount:
        sum_amount = item_hold[1]
        for item_redeem in redeem_amount:
            if item_hold[0] == item_redeem[0]:
                sum_amount = sum_amount - item_redeem[1]
            else:
                pass
        if sum_amount != 0:
            product_dir[item_hold[0]] = sum_amount
        else:
            pass
    return product_dir


def get_earnings_month(connect_use, user_id, year, month):
    """
    获取月底投资总市值
    :param connect_use: 数据库连接
    :param user_id: 用户id
    :param year: 年份
    :param month: 月份
    :return:前月底投资总市值
    """
    data_str = get_end_of_month(year, month)
    cursor = connect_use.cursor()
    sql = 'SELECT totalAmount FROM profit_info ' \
          'WHERE userId = '+user_id+' ' \
          'AND updateTime LIKE \'%'+data_str+'%\' ' \
          'ORDER BY updateTime ASC'
    cursor.execute(sql)
    cds = cursor.fetchall()
    for item in cds:
        return round(int(item[0]), 3)


def get_product_price(connect_use, dir_use, date_use):
    """
    根据get_product_amount得出的列表给出各产品所占金额
    :param connect_use:数据库连接
    :param dir_use: get_product_amount得出的列表
    :param date_use: 月底时间
    :return: 产品金额字典{产品ID：金额}
    """
    cursor = connect_use.cursor()
    for key in dir_use:
        sql = "SELECT recovery_nav " \
              "from product_nav " \
              "where product_id = '"+key+"' and end_date = '"+date_use+"'"
        cursor.execute(sql)
        recovery_nav = cursor.fetchall()[0][0]
        dir_use[key] = recovery_nav*dir_use[key]
    return dir_use


def get_result(connect_use, dir_use):
    """
    根据get_product_price得出的列表给出所属标杆与所占比例
    :param connect_use: 数据库连接
    :param dir_use: get_product_price得出的列表
    :return: 标杆占比字典
    """
    cursor = connect_use.cursor()
    dir_temp = dict()
    sum_use = 0
    for key in dir_use:
        sql = "SELECT benchmarkId from product_rcmd" \
              " where productId = '"+key+"' and isUsed = 1"
        cursor.execute(sql)
        recommend = cursor.fetchall()[0][0]
        # print recommend
        price = round(dir_use[key], 6)
        dir_temp[recommend] = price
    for key in dir_temp:
        sum_use += dir_temp[key]
    for key in dir_temp:
        dir_temp[key] = round(dir_temp[key]/sum_use, 4)
    return dir_temp

if __name__ == '__main__':
    # conn = get_conn()
    # get_monthly_in_dict(conn, '1273083', '2016-06')
    #
    # # print '九月底投资总市值：', get_earnings_month(conn, '1270805', 2016, 9)
    # # print '十月底投资总市值：', get_earnings_month(conn, '1270805', 2016, 10)
    # # a = get_product_amount(conn, '1270805', '2016-09-30 23:59:59')
    # # b = get_product_price(conn, a, '2016-09-30 00:00:00')
    # # c = get_result(conn, b)
    # # print c
    # close(conn)
    a = 'szasdfasd'
    print 'aaaa %s %s' % (a, a)
