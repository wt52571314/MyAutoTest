__author__ = 'Administrator'
import urllib2
import time
while True:
    test = urllib2.urlopen('https://www.bbaecdn.com/api/activity')
    print test.read()
    time.sleep(5)