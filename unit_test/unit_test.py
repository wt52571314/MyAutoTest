# - coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainnan.Zhang
# @ Date:2017-01-19
# 单元测试实例
# ===============================================================================
import unittest
from need_test_func import add, sub


class mytest(unittest.TestCase):

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_sum(self):
        self.assertEqual(sum(1, 2), 2, 'test sum fail')

    def test_sub(self):
        self.assertEqual(sub(2, 1), 1, 'test sub fail')

if __name__ == '__main__':
    unittest.main()
