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
# 套接字绑定的IP与端口
s.bind((HOST, PORT))
# 开始TCP监听
s.listen(1)
while 1:
    # 接受TCP连接，并返回新的套接字与IP地址
    conn, addr = s.accept()
    # 输出客户端的IP地址
    print'Connected by', addr
    while 1:
        # 把接收的数据实例化
        data = conn.recv(1024)
        print data
        a = raw_input('请输入回复：')
        # 如果输出结果长度为0，则告诉客户端完成。此用法针对于创建文件或目录，创建成功不会有输出信息
        conn.sendall(a)
# 关闭连接
conn.close()
