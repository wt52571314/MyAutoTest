#!/usr/bin/python
# -*- coding: UTF-8 -*-
import sys
import urllib2
import urllib
import Queue
import threading
import re
exitFlag = 0
md5Data = "86afb66c0acba43f45f68c0554b574bb"
header = {}


def initMd5Url():
        dict = {}
        dict['sss'] = "http://md5.sssie.com/decode"
        dict['dmd5o'] = "http://dmd5.com/md5Util.jsp?method=crack&type=1&md5="
        dict['dmd5t'] = "http://dmd5.com/md5-decrypter.jsp"
        dict['pmd5'] = "http://pmd5.com/"
        dict['cmd5la'] = "http://cmd5.la/"
        dict['md5gift'] = "http://md5.gift/index.php"
        return dict


def httpinfo(url, Postdata, headers, Method="Post"):
    response = None
    if Method == "get":
        req = urllib2.Request(url)
        req.headers = headers
        response = urllib2.urlopen(req)
        return response.read()
    else:
        Postdata = urllib.urlencode(Postdata)
        req = urllib2.Request(url, Postdata, headers)
        response = urllib2.urlopen(req)
        return response.read()


class myThread (threading.Thread):

    def __init__(self, threadID, name, q):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.q = q

    def run(self):
        process_data(self.name,self.q)


def process_data(threadName, q):
    while not exitFlag:
        queueLock.acquire()
        queueLock.release()
        if not workQueue.empty():
            data = q.get()
            if data == "sss":
                # queueLock.release()
                header["Content-Type"] = "application/x-www-form-urlencoded"
                header["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
                header["User-Agent"] = '''Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36
                                        (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'''
                header["Referer"] = "http://md5.sssie.com/decode"
                result = httpinfo(md5Url[data],
                                  {"csrf_token": "", "type": "md5", "password": md5Data,
                                   "submit": "md5%E8%A7%A3%E5%AF%86"}, header, "Post")
                matchObj = re.findall(re.compile('<div\\sclass=\"input-group\">(.*?)</div>',re.M),result.replace('\n','').replace('\r',''))
                if matchObj:
                    print ("SSS：" +matchObj[1]).decode("utf-8")
                    #  queueLock.release()
                else:
                    print "SSS:未查询到".decode("utf-8")
                    queueLock.release()
            if data == "dmd5o":
                # queueLock.release()
                # 第一次请求拿到token
                header["Referer"] = "http://dmd5.com/md5-decrypter.jsp"
                result = httpinfo(md5Url["dmd5o"]+md5Data,None,header,"get");
                # 进行第二次请求解密
                header["Content-Type"] = "application/x-www-form-urlencoded"
                header["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
                header["User-Agent"] = '''Mozilla/5.0 (Windows NT 10.0; WOW64)
                                          AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'''
                header["Referer"] = "http://dmd5.com/md5-decrypter.jsp"
                result = httpinfo(md5Url["dmd5t"],
                                {"_VIEWRESOURSE": "c4c92e61011684fc23405bfd5ebc2b31", "md5": md5Data, "result": result.strip()},
                                header,
                                "post")
                # <div\\sclass=\"alert\\salert-info\".*role=\"alert\">(.*?)</div>
                matchObj = re.findall(re.compile('<p>解密结果：.*?</p>',re.M),result)
                if matchObj:
                    print ("Dmd5："+matchObj[0].replace('<p>', '').replace('</p>', '')).decode("utf-8")
                    #  queueLock.release()
                else:
                    print "Dmd5:未查询到".decode("utf-8")
md5Url = initMd5Url()
threadList = ["Thread-1", "Thread-2"]
nameList = ["sss", "dmd5o"]
queueLock = threading.Lock()
workQueue = Queue.Queue(5)
threads = []


def main(md5):
    global md5Data
    md5Data = md5
    threadID = 1
    # 创建新线程
    for tName in threadList:
        thread = myThread(threadID, tName, workQueue)
        thread.start()
        threads.append(thread)
        threadID += 1
    # 填充队列
    queueLock.acquire()
    for word in nameList:
        workQueue.put(word)
    queueLock.release()
    # 等待队列清空
    while not workQueue.empty():
        pass
    # 通知线程是时候退出
    global exitFlag
    exitFlag = 1
    # 等待所有线程完成
    for t in threads:
        t.join()
    exit(1)

if __name__ == '__main__':
    md5 = sys.argv[1]
    if len(md5) == 16 or len(md5) == 32:
        main(md5)
    else:
        print "MD5输入不正确".decode("utf-8")
        exit(1)
