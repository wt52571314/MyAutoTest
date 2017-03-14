# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator:张海南
# @ Date:2016-12-26
# @ 描述：异步任务实例
# ===============================================================================
import time
from celery import Celery
import os

broker = 'redis://127.0.0.1:6379'
backend = 'redis://137.0.0.1:6379/0'
app = Celery('my_task', broker=broker, backend=backend)
@app.task
def add(x, y):
    time.sleep(5)
    return x+y

# os.system('celery worker -A tasks --loglevel=info')
