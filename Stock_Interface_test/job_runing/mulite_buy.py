# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainan.Zhang
# @ Date:2016-8-10
# 一键执行JOB，调仓\下单
# ================================================================================
import requests
import time
import json


def job_runing(str_use):
    """
    一键跑JOB
    :param str_input: Spring Batch 需要的参数
    :return:无
    """
    job_list = ['https://sj-console-trade-us.jimustock.com/jobs/robotAdvisorGenerateTransferPlanJob',
                'https://sj-console-trade-us.jimustock.com/jobs/robotAdvisorPlaceOrderJob',
                'https://sj-console-trade-us.jimustock.com/jobs/robotAdvisorGeneratePositionHisJob'
                ]
    post_payload = 'launch=Launch&jobParameters='+str_use+'&origin=job'
    print post_payload

    # post_header = {'Content-Type':	'application/x-www-form-urlencoded; charset=UTF-8'}
    # for job in job_list:
    #     time.sleep(2)
    #     result = requests.post(job, data=post_payload, headers=post_header)
    #     print result.content
    #     print job
    #     print 'runed!!!'
    #     print '*'*50

if __name__ == '__main__':
    job_runing('c%3D6666')