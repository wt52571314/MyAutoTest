# -*- coding=utf-8 -*-
# import unittest
#
#
# class ArithTest (unittest.TestCase):
#     def runTest(self):
#         # Test addition and succeed.
#         self.failUnless(1 + 1 == 2, 'one plus one fails!')
#         self.failIf(1 + 1 != 2, 'one plus one fails again')
#         self.failUnlessEqual(1 + 1, 2, 'more trouble with one plus one!')
#
#
# def suite():
#     suite1 = unittest.TestSuite()
#     suite1.addTest(ArithTest())
#     return suite1
#
#
# if __name__ == '__main__':
#     runner = unittest.TextTestRunner()
#     test_suite = suite()
#     runner.run(test_suite)


def input_score():
    list_score = list()
    while 1 == 1:
        i = raw_input('请输入分数，输入q退出程序！')
        if i != 'q':
            try:
                list_score.append(float(i))
            except:
                print '只能输入数字！'
                pass
        else:
            return list_score


def math_score(list_use):
    j = 0
    for item in list_use:
        j += item
    print '平均分:' + str(j/len(list_use))
    print '最低分:' + str(list_use.sort()[0])

if __name__ == '__main__':
    list_result = input_score()
    math_score(list_result)
