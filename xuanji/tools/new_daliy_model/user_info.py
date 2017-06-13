# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2017-04-19
# 获取用户信息
# ===============================================================================
import MySQLdb
import warnings
warnings.filterwarnings("ignore")


def get_conn():
    """
    获取数据库连接
    :return: 数据库连接
    """
    connect = MySQLdb.connect(host='172.19.1.115', user='sandbox',
                              passwd='TxHT29VMfn4ZJ6VU', db='sandbox_portfolio_v2',
                              port=3386)
    return connect


def close(connect):
    """
    关闭数据库连接
    :param connect: 需要关闭的数据库连接
    :return: None
    """
    connect.close()


def get_user_tested_result(connect_use, user_id):
    """
    根据user_id获取user_tested_result相关信息
    :param connect_use: 数据库连接
    :param user_id: 用户ID
    :return: 所需数据字典：{last_adj_time：‘’， user_type: ‘’}
    """
    tested_result = dict()
    cursor = connect_use.cursor()
    sql = "SELECT riskLevel, birthday, lastAdjTime, lastAdjScore " \
          "from user_tested_result " \
          "where userId = "+user_id
    cursor.execute(sql)
    cds = cursor.fetchall()
    tested_result['user_type'] = cds[0][0]
    tested_result['birth'] = cds[0][1]
    tested_result['last_adj_time'] = cds[0][2]
    tested_result['last_adj_score'] = cds[0][3]
    return tested_result


def get_user_recommend(connect_use, user_type, aum):
    """
    获取用户对应标杆配比
    :param connect_use: 数据库连接
    :param user_type: 用户类型
    :param aum: 用户资产等级
    :return: 用户标杆配比
    """
    cursor = connect_use.cursor()
    sql = "SELECT bweight " \
          "from user_recommend " \
          "where isUsed = 1 and aum = " + aum + " and user_type = '" + user_type + "'"
    cursor.execute(sql)
    cds = cursor.fetchall()
    return cds[0][0]


if __name__ == '__main__':
    print get_user_recommend(get_conn(), 'EGH', '1')
