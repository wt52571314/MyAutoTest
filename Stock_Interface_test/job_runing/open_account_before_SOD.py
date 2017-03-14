# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：Hainan.Zhang
# @ Date:2016-8-9
# 一键执行JOB，搞定制作SOD文件之前的JOB
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
    job_list = ['http://stock-console-trade-us.qa-01.bbaecdn.com/jobs/updateApexAccountInfoJob',
                'http://stock-console-trade-us.qa-01.bbaecdn.com/jobs/robotAdvisorAccountCreateJob',
                'http://stock-console-trade-us.qa-01.bbaecdn.com/jobs/robotAdvisorAccountStatusRefreshJob',
                'http://stock-console-trade-us.qa-01.bbaecdn.com/jobs/initTransferFundJob',
                'http://stock-console-trade-us.qa-01.bbaecdn.com/jobs/transferFundToTrexFileJob',
                'http://stock-console-trade-us.qa-01.bbaecdn.com/jobs/generateTrexFileJob'
                ]
    post_payload = {'jobParameters': str_use,
                    'launch': 'Launch',
                    'origin': 'job'
                   }

    post_header = {'Content-Type':	'application/x-www-form-urlencoded; charset=UTF-8'}
    for job in job_list:
        time.sleep(5)
        result = requests.post(job, data=post_payload, headers=post_header)
        print job
        print 'runed!!!'
        print '*'*50

if __name__ == '__main__':
    job_runing('a=6666')