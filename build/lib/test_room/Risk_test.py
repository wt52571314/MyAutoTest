# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2016-2-22
# 积木股票风险评测接口测试（冲突的组合）
# ===============================================================================
try:
    assert type(1) == type(4), "broken_int is broken"
except AssertionError:
    print("handle the error here.")