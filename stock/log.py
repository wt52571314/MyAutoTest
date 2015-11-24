#-*- coding: utf-8 -*-
#===============================================================================
#@ Creator:张海南
#@ Date:2015-11-20
#@ 描述：log输出程序
#===============================================================================
import time

Base_path = 'D:\\log'
now_time = time.strftime('%Y-%m-%d-%H-%M-%S',time.localtime(time.time()))
def write_log(note,fname):
    File_path = Base_path+'\\'+str(now_time)+fname+'.log'
    f = open(File_path,'a+')
    f.writelines(note+'\n')
    f.close()

if __name__ == '__main__':
    write_log('hello word','base')