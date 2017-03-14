# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-11-23
# 月报计算主函数
#  print("分类正确率是：%.2f%%"  %(rate*100))
# ===============================================================================
from tools_list import *
from sql_function import *


def data_show(connect, year_num, month_num, u_id):
    """
    获取最大回撤数据
    :param connect: 数据库连接
    :param year_num: 年份
    :param month_num: 月份
    :param u_id: 用户编号
    :return: None
    """
    print '===========================log info================================================'
    print '用户:', u_id, '本月时间:', year_num+'-'+month_num, '相关计算值如下:'
    print month_num+'月底投资总市值：', get_earnings_month(connect, u_id, int(year_num), int(month_num))
    print str(int(month_num)-1)+'月底投资总市值：', get_earnings_month(connect, u_id, int(year_num), int(month_num)-1)
    print '=============================end===================================================='
    close(conn)

if __name__ == '__main__':
    conn = get_conn()
    year = raw_input('请输入年份，如2016：')
    month = raw_input('请输入月份，如9：')
    user_id = raw_input('请输入user_id：')
    data_show(conn, year, month, user_id)
