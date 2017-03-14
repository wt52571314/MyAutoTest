# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-12-27
# 实验室
# ===============================================================================
import MySQLdb

connect = MySQLdb.connect(host='172.19.1.115', user='sandbox',
                          passwd='TxHT29VMfn4ZJ6VU', db='sandbox_portfolio_v2_03',
                          port=3386)
cursor = connect.cursor()
data_str = '2016-09-30'
sql = 'SELECT totalAmount FROM profit_info ' \
      'WHERE userId = 1268062 ' \
      'AND updateTime LIKE \'%'+data_str+'%\' ' \
      'ORDER BY updateTime ASC'

cursor.execute(sql)
print cursor.fetchall()
