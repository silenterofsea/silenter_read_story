from werkzeug.routing import BaseConverter
from flask import session, jsonify, g, render_template, current_app
import functools
import re
from flask import flash, redirect, url_for
import paramiko
import os


# 自定义万能转换器（用正则表达式匹配）
class ReConverter(BaseConverter):
    def __init__(self, url_map, regex):
        # 调用父类的初始化方法
        super(ReConverter, self).__init__(url_map)
        # 保存正则表达式
        self.regex = regex


# 检查是否含有特殊字符
def is_string_validate(str):
    string = "~!#$%^&*()_+-*/<>,.[]\/"
    for i in string:
        if i in str:
            # 存在特殊字符串
            return True
    # 不存在特殊字符串
    return False

# 判断字符串是否为正整数，如果是，那么返回true，如果不是，返回False
def isDigit(x):
    try:
        x=int(x)
        return isinstance(x,int)
    except ValueError:
        return False


# 定义验证登录状态的装饰器
def login_required(view_func):
    @functools.wraps(view_func)  # 如果没有这个这个装饰器，那么set_user_avatar这个函数的，set_user_avatar.name会变成wrapper.name
    def wrapper(*args, **kwargs):
        # 判断用户的登录状态
        user_id = session.get("id")
        if user_id is not None:
            # g对象中保存，传递的信息
            g.user_id = user_id
            # 如果用户是登录状态，放行，直接执行视图函数
            return view_func(*args, **kwargs)
        else:
            # 如果用户非登录状态，拒绝，返回json，告诉前端去跳转(API形态)
            # return jsonify(resCode='2', message="用户未登录，前端需要跳转")
            # template模式
            flash('请先登录才能访问哦')
            return redirect(url_for('views.login'))
    return wrapper


"""
@login_required
def set_user_avatar():
    user_id = g.user_id  # 通过g对象就可以获取user_id
    pass
    return jsonify(...)

set_user_avatar()  -> warpper()
"""

#远程执行命令
def execute(server, port, username, password, shellcmd):
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(server, port, username, password)
        stdin, stdout, stderr = ssh.exec_command(shellcmd)
        ssh.close()
    except Exception as e:
        current_app.logger.error(e)
        return jsonify({'resCode':1, 'message':"链接出错，可能是网络问题，稍后重试"})

    return True

#上传文件
def upload(server, port, username, password, localfile, remotefile):

    # 下面这步可能出错
    try:
        t = paramiko.Transport((server, port))
        t.connect(username = username, password = password)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify({'resCode':1, 'message':"链接出错，请检查服务器信息是否正确，用ssh链接一下测试！"})

    sftp = paramiko.SFTPClient.from_transport(t)
    print("localfile = ", localfile)
    print("remotefile = ", remotefile)
    # 下面这步可能出错
    try:
        sftp.put(localfile, remotefile)
    except Exception as e:
        current_app.logger.error(e)
        return jsonify({'resCode':1, 'message':"链接网络出错，请检查服务器所在网络和nginx所在网络！"})
    t.close()
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>return<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
    return True

def upload_nginx_conf_to_target_server_by_ssh(json_for_nginx, conf_name_in_nginx):
    nginx_template_folder = os.path.join(os.path.dirname(__file__), "upload_to_nginx/")
    # /home/alex/silenter_read_story/9999_some_tiny_program/VideoProgramAdmin/flaskmain/utils
    info_for_tempalte = {
    	'server_name' : json_for_nginx['url']
	}
    config_file_name = "test.nginx"
    configstring = render_template("nginx.template", context=info_for_tempalte)
    fp_config = open(nginx_template_folder+config_file_name, 'w')
    fp_config.write(configstring)
    fp_config.close()
    return upload(
        json_for_nginx['ip_nginx'],
        json_for_nginx['port'],
        json_for_nginx['username'],
        json_for_nginx['password'],
        nginx_template_folder+config_file_name,
         "/etc/nginx/conf.d/" + conf_name_in_nginx
    )


"""
>>> from flaskmain.utils.commons import execute
>>> res = execute('194.105.63.33', 22, 'root', '9600451392Aa123!@#)(*&^%', 'nginx -s reload')

"""




if __name__ == '__main__':
    upload_nginx_conf_to_target_server_by_ssh()
