# -*- coding: utf-8 -*-
#===============================================================================
#@ Creator：Hainnan.Zhang
#@ Date:2016-2-22
#对输入进行的处理
#===============================================================================
from input import *
import urllib2
def function(dir):
    for key in dir:
        List = []
        List.extend(dir[key])
        i = 0
        url = "https://sj-api-us-01.jimustock.com/api/v1/us/trade/cunQianDev?applicationId="+str(List[i])+"&amount="+str(List[i+1])
        try:
            s = urllib2.urlopen(url).read()
            print s
            print type(s)
        except urllib2.HTTPError,e:
           print e.code
        except urllib2.URLErrror,e:
            print str(e)
        dir[key] = List                                               #此处将返回结果添加至字典
    return dir

if __name__ == '__main__':
     a = function(Get_Input())
     print a