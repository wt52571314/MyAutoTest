# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：zhn
# @ Date:2016-11-09
# 民生项目接口测试配置文件
# ===============================================================================
Base_url = ''  # 接口基础URL
Login_url = ''  # 登录接口
username = ''   # 用户名
password = ''   # 密码
user_style = ''   # 用户身份
# 代理
proxies = {
    "http": "http://127.0.0.1:8888",
    "https": "http://127.0.0.1:8888"
}
# get方式访问的接口列表
get_list = {
    1: Base_url + '/v2/activity/red/question/list',
    2: Base_url + '',
    3: Base_url + '',
    4: Base_url + '',
    5: Base_url + '',
    6: Base_url + '',
    7: Base_url + '',
    8: Base_url + '',
    9: Base_url + '',
    10: Base_url + '',
    11: Base_url + '',
    12: Base_url + ''
}

# get方式描述
get_note = {
    1: '拉取题目',
    2: '',
    3: '',
    4: '',
    5: '',
    6: '',
    7: '',
    8: '',
    9: '',
    10: '',
    11: '',
    12: ''
}

# get方式检查列表
get_check_list = {
    1: [],
    2: [],
    3: [],
    4: [],
    5: [],
    6: [],
    7: [],
    8: [],
    9: [],
    10: [],
    11: [],
    12: []
}

# post方式接口列表
post_list = {
    1: Base_url+'/v2/question/minshengSave',
    2: Base_url+'',
    3: Base_url+'',
    4: Base_url+'',
    5: Base_url+'',
    6: Base_url+'',
    7: Base_url+'',
    8: Base_url+'',
    9: Base_url+'',
    10: Base_url+'',
    11: Base_url+'',
    12: Base_url+''
}
# post方式请求头
post_payload = {
    1: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    2: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    3: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    4: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    5: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    6: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    7: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    8: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    9: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    10: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    11: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
    12: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
}
# post方式传入参数
post_data = {
    1: '',
    2: '',
    3: '',
    4: '',
    5: '',
    6: '',
    7: '',
    8: '',
    9: '',
    10: '',
    11: '',
    12: ''
}
# post方式描述
post_note = {
    1: '保存测试答案',
    2: '',
    3: '',
    4: '',
    5: '',
    6: '',
    7: '',
    8: '',
    9: '',
    10: '',
    11: '',
    12: ''
}

# post方式检查列表
post_check_list = {
    1: [],
    2: [],
    3: [],
    4: [],
    5: [],
    6: [],
    7: [],
    8: [],
    9: [],
    10: [],
    11: [],
    12: []
}


def split_line():
    """
    :return: None
    输出分割线
    """
    print '*'*50
