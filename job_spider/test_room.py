# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-17
# 爬虫项目实验室
# ===============================================================================
# from bs4 import BeautifulSoup
#
# html_code = '''
# <html><head><title>The Dormouse's story</title></head>
# <body>
# <p class="title"><b>The Dormouse's story</b></p>
#
# <p class="story">Once upon a time there were three little sisters; and their names were
# <a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>,
# <a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
# <a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
# and they lived at the bottom of a well.</p>
#
# <p class="story">...</p>
# '''
#
# soup = BeautifulSoup(html_code, 'xml')
# # print soup.prettify()
# a = soup.a
# print a.get('href')

# coding=utf-8
# 请不要在意为毛要清洁这么多次


def clean1(times):
    """
    就假装是扫地吧，这种函数命名方式，千万别学习
    :param times: 次数
    :return: None
    """
    print '已完成扫地次数:', str(times)


def clean2(times):
    """
    默默的装作洗抽油烟机
    :param times: 次数
    :return: None
    """
    print '已洗抽油烟机次数', str(times)


def call_clean(times, function_name):
    """
    这个很重要，这个就是家政公司的业务系统，要啥业务都得在这说
    这个是实现回调函数的核心
    :param times:次数
    :param function_name:回调函数名
    :return:调用的函数结果
    """
    return function_name(times)

if __name__ == '__main__':
    call_clean(100, clean2)  # 给我洗100次抽油烟机，好吧，很变态
