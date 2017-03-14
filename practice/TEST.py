# -*- coding: utf-8 -*-
# import urllib
# web_url = urllib.urlopen('http://tieba.baidu.com/p/4759040895').read()
# print web_url

import time

# print time.clock()
a = time.localtime()

print a
print 'CVE-' + str(a.tm_year) + str(a.tm_mon) + str(a.tm_mday) + '-' + str(a.tm_hour) + str(a.tm_min) + str(a.tm_sec)
