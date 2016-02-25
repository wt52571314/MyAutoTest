#!/user/bin/env python

from socket import *

HOST = 'localhost'
PORT = 21567
BUFSIZ = 1024
ADDR = (HOST,PORT)

tcpCliScok = socket(AF_INET,SOCK_STREAM)
tcpCliScok.connect(ADDR)

while True:
    data = raw_input('> ')
    if not data:
        break
    tcpCliScok.send(data)
    data = tcpCliScok.recv(BUFSIZ)
    if not data:
        break
    print data

tcpCliScok.close()
