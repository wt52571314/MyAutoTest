# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-17
# 历史回溯需要的工具类集合
# ===============================================================================
import datetime


def date_diff(new_date, old_date):
    year_new = int(new_date[:4])
    year_old = int(old_date[:4])
    month_new = int(new_date[4:6])
    month_old = int(old_date[4:6])
    day_new = int(new_date[6:])
    day_old = int(old_date[6:])

    d_new = datetime.datetime(year=year_new, month=month_new, day=day_new)
    d_old = datetime.datetime(year=year_old, month=month_old, day=day_old)
    return (d_new-d_old).days

if __name__ == '__main__':
    print date_diff('20161029', '20161027')
