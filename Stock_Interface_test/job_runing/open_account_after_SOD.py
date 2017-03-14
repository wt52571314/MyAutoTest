# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainan.Zhang
# @ Date:2016-8-9
# 一键执行JOB，搞定制作SOD文件之后的JOB
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
    job_list = ['https://sj-console-trade-us.jimustock.com/jobs/transferFundSettlementJob',
                'https://sj-console-trade-us.jimustock.com/jobs/transferFundForOmsJob',
                'https://sj-console-trade-us.jimustock.com/jobs/robotAdvisorGenerateTransferPlanJob',
                'https://sj-console-trade-us.jimustock.com/jobs/robotAdvisorPlaceOrderJob',
                'https://sj-console-trade-us.jimustock.com/jobs/robotAdvisorGeneratePositionHisJob'
                ]
    post_payload = 'launch=Launch&jobParameters=c%3D6666&origin=job'

    post_header = {'Content-Type':	'application/x-www-form-urlencoded; charset=UTF-8'}
    for job in job_list:
        time.sleep(2)
        result = requests.post(job, data=post_payload, headers=post_header)
        # print result.content
        print job
        print 'runed!!!'
        print '*'*50

if __name__ == '__main__':
    job_runing('a=6666')