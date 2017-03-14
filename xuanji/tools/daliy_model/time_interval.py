# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-11
# '''获取当前日期前后N天或N月的日期'''
# ===============================================================================
import datetime


def get_days_before_today(n):
    """
    date format = "YYYY-MM-DD HH:MM:SS"
    """
    now = datetime.datetime.now()
    if n < 0:
        return datetime.datetime(now.year, now.month, now.day, now.hour, now.minute, now.second)
    else:
        n_days_before = now - datetime.timedelta(days=n)
        return datetime.datetime(n_days_before.year
                                 , n_days_before.month
                                 , n_days_before.day
                                 , n_days_before.hour
                                 , n_days_before.minute
                                 , n_days_before.second)


def get_days_before_day(date_input, n):
    n_days_before = date_input - datetime.timedelta(days=n)
    return datetime.datetime(n_days_before.year
                             , n_days_before.month
                             , n_days_before.day
                             , n_days_before.hour
                             , n_days_before.minute
                             , n_days_before.second)


def get_day_diff(data_use, now):

    return (now-data_use).days

if __name__ == '__main__':
    date_use = datetime.datetime(year=2016, month=11, day=18)
    now = datetime.datetime(year=2016, month=11, day=30)
    print get_day_diff(date_use, now)
    # print get_days_before_today(20)
    # date_use = datetime.datetime(year=2015, month=10, day=9)
    # print get_days_before_day(date_use, 2)