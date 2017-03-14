# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator：zhn
# @ Date:2016-11-09
# 民生项目小功能实验室
# ===============================================================================
# import shelve
#
#
# def store_person(db):
#     """
#     Query user for data and store it in the shelf object
#     """
#     pid = raw_input('Enter unique ID number: ')
#     person = dict()
#     person['name'] = raw_input('Enter name: ')
#     person['age'] = raw_input('Enter age: ')
#     person['phone'] = raw_input('Enter phone number: ')
#     db[pid] = person
#
#
# def lookup_person(db):
#     """
#     Query user for ID and desired field, and fetch the corresponding data from
#     the shelf object
#     """
#     pid = raw_input('Enter ID number: ')
#     field = raw_input('What would you like to know? (name, age, phone) ')
#     field = field.strip().lower()
#     print field.capitalize() + ':', \
#         db[pid][field]
#
#
# def print_help():
#     print 'The available commons are: '
#     print 'store  :Stores information about a person'
#     print 'lookup :Looks up a person from ID number'
#     print 'quit   :Save changes and exit'
#     print '?      :Print this message'
#
#
# def enter_command():
#     cmd = raw_input('Enter command (? for help): ')
#     cmd = cmd.strip().lower()
#     return cmd
#
#
# def main():
#     database = shelve.open('database.dat')
#     try:
#         while True:
#             cmd = enter_command()
#             if cmd == 'store':
#                 store_person(database)
#             elif cmd == 'lookup':
#                 lookup_person(database)
#             elif cmd == '?':
#                 print_help()
#             elif cmd == 'quit':
#                 return
#     finally:
#         database.close()
import requests
import urllib
if __name__ == '__main__':
    payload = {
        'Host': 'www.lagou.com',
        'User-Agent': 'Mozilla / 5.0(WindowsNT6.1;WOW64;rv:50.0) Gecko / 20100101Firefox / 50.0',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Encoding': 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3'
    }

    data_use = {
        'gj': '3年及以下',
        'xl': '本科',
        'px': 'default',
        'yx': '15k-25k',
        'gx': '全职',
        'city': '北京'
    }

    r = requests.get('https://www.lagou.com/jobs/list_测试'
                     , data='gj=3年及以下&xl=本科&px=default&yx=15k-25k&gx=全职&city=北京'
                     , headers=payload
                     )
    print r.content
