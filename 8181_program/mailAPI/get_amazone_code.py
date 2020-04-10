# -*- coding: utf-8 -*-
import poplib
email='alex123@infiniticloud.net'
password='QWEqwe123!@#'
server=poplib.POP3('mail.infiniticloud.net')
print("链接成功")
server.user(email)
server.pass_(password)
resp, mails, octets = server.list()
index = len(mails)#邮件的总数
#server.dele(index) 删除邮件 dele可以用于删除制定位置的邮件
resp, lines, octets = server.retr(index)#可以取出最新的邮件的信息
msg_content = b'\r\n'.join(lines).decode('utf-8','ignore')  #将邮件组合到一起，生成邮件信息
print(msg_content)


# import imaplib
# import email  #导入两个库
#
#
#
# conn = imaplib.IMAP4(port=143,host='mail.infiniticloud.net')
# print('已连接服务器')
# conn.login('alex123@infiniticloud.net','QWEqwe123!@#')
# print('已登陆')


# import poplib
# from email.parser import Parser
#
# def get_email(email,password,host="mail.infiniticloud.net"):
#     # connect to pop3 server
#     server = poplib.POP3(host)
#     # open debug
#     server.set_debuglevel(1)
#
#     # 身份验证
#     server.user(email)
#     server.pass_(password)
#
#     # 返回邮件总数目和占用服务器的空间大小（字节数）， 通过stat()方法即可
#     # print("Mail counts: {0}, Storage Size: {0}".format(server.stat()))
#
#     # 使用list()返回所有邮件的编号，默认为字节类型的串
#     resp, mails, octets = server.list()
#     # print("响应信息： ", resp)
#     # print("所有邮件简要信息： ", mails)
#     # print("list方法返回数据大小（字节）： ", octets)
#
#     # get the latest, index from 1:
#     index = len(mails)
#     if index < 1:
#         return None
#     resp, lines, octets = server.retr(index)
#
#     # 可以获得整个邮件的原始文本:
#     msg_content = b'\r\n'.join(lines).decode('utf-8')
#     # 解析出邮件:
#     msg = Parser().parsestr(msg_content)
#     # print(msg)
#     # print("解码后的邮件信息:\r\n"+str(msg))
#
#     #close
#     server.close()
#     return msg
#
# if __name__ == '__main__':
#     get_email('xiaohai@infiniticloud.net', 'QWEqwe123!@#')
