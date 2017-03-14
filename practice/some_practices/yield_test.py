# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：zhn
# @ Date:2016-11-22
# python 生成器实例
# ===============================================================================


def countdown(num):
    print 'Starting'
    while num > 0:
        yield num
        num -= 1

if __name__ == '__main__':
    a = countdown(5)
    print next(a)
    print next(a)
