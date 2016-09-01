#!/usr/bin/python  
# -*- coding:utf-8 -*-  
# httplib_test.py  
# author:zhn  
# 2016-02-18  github.com/wt52571314
# 偶有所得。程序名千万不能和包名一致
import httplib
def use_httplib():
    conn = httplib.HTTPConnection("a.jimu.com")
    conn.request("GET", "/")
    r = conn.getresponse()
    print r.getheaders()
if __name__ == '__main__':
    use_httplib()