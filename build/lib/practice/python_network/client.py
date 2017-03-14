# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-27
# python编程练习-socket
# ===============================================================================
import socket
HOST = '127.0.0.1'
PORT = 50007
# 定义socket类型，网络通信，TCP
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# 要连接的IP与端口
s.connect((HOST, PORT))
while 1:
    # 与人交互，输入命令
    cmd = raw_input("请输入发送给服务器的文字:")
    # 把命令发送给对端
    s.sendall(cmd)
    # 把接收的数据定义为变量
    data = s.recv(1024)
    # 输出变量
    print data
# 关闭连接
s.close()
