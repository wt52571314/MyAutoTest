# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2015-9-21
# python编程练习---内置函数练习
# ===============================================================================
import difflib

f1 = file("a.txt", 'r')
f2 = file("b.txt", 'r')
src = f1.read()
dst = f2.read()

# s = difflib.SequenceMatcher(lambda x: x == "", src, dst)
# for tag, i1, i1, j1, j2 in s.get_opcodes():
#     print tag, i1, i1, j1, j2
# print '#'*50
# print s.get_matching_blocks()
#
# diff = difflib.Differ().compare(src, dst)
# print list(diff)

s = difflib.HtmlDiff.make_file(difflib.HtmlDiff(), src, dst)
f = open('diff.html', "w")
f.write(s)
f.close()
