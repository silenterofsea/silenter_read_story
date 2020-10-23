from . import flask_views
from flaskmain.utils.commons import login_required, isDigit, is_string_validate, upload_nginx_conf_to_target_server_by_ssh, execute
from flask import render_template,session, abort, request, current_app,jsonify
from flaskmain.models import ServerIPs, AdsKinds, WebsiteInfos
import re
from flaskmain import db




@flask_views.route('/servers', methods=['GET', 'POST', 'DELETE'])
@login_required
def servers():
    # upload_nginx_conf_to_target_server_by_ssh()
    try:
        servers_ips = ServerIPs.query.all()
        ads_kinds = AdsKinds.query.all()
    except Exception as e:
        current_app.logger.error(e)
        abort(404, "数据库错误，联系管理员处理3")
    if request.method == 'POST':
        json_data = request.get_json()
        add_ip = json_data.get('ip')
        add_username = json_data.get('username')
        add_password = json_data.get('password')
        add_port = json_data.get('port')
        add_nickname = json_data.get('nickname')
        # if add_ip is None or add_password is None or add_port is None or add_nickname is None:
        if not all([add_ip, add_password, add_port, add_nickname]):
            return jsonify({'resCode':1, 'message':"失败：参数不完整"})
        print("add_ip = ", add_ip)
        if not re.match(r"^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$", add_ip):
            return jsonify({'resCode':1, 'message':"失败：IP错误"})
        print("add_port = ", int(add_port))
        if not isDigit(add_port):
            return jsonify({'resCode':1, 'message':"失败：端口必须是1-65535之间的整数"})
        if  int(add_port) < 1 or int(add_port) > 65535 :
            return jsonify({'resCode':1, 'message':"失败：端口必须是1-65535之间的整数"})
        if is_string_validate(add_nickname):
            return jsonify({'resCode':1, 'message':"失败：昵称不要包含特殊字符"})
        add_server = ServerIPs()
        add_server.ip = add_ip
        add_server.username = add_username
        add_server.password = add_password
        add_server.port = add_port
        add_server.nickname = add_nickname
        try:
            db.session.add(add_server)
            db.session.commit()
        except Exception as e:
            current_app.logger.error(e)
            return jsonify({'resCode':1, 'message':"失败：数据库错误，联系管理员处理4"})
        return jsonify({'resCode':0, 'message':"提交成功"})
    if request.method == 'DELETE':
        json_data = request.get_json()
        delete_id = json_data.get('id')
        if delete_id is None:
            return jsonify({'resCode':1, 'message':"失败：参数不完整"})
        if not int(delete_id) in [i.id for i in servers_ips]:
            return jsonify({'resCode':1, 'message':"失败：参数错误"})
        # 先删除该服务器下的网站信息
        detele_server_webs = WebsiteInfos.query.filter(WebsiteInfos.ip_id==delete_id).all()
        for delete_web in detele_server_webs:
            db.session.delete(delete_web)
        db.session.commit()
        # 再删除该服务器的信息
        try:
            delete_server = ServerIPs.query.filter_by(id=delete_id).first()
            db.session.delete(delete_server)
            db.session.commit()
        except Exception as e:
            current_app.logger.error(e)
            return jsonify({'resCode':1, 'message':"失败：链接数据库错误，联系管理员处理5"})
        return jsonify({'resCode':0, 'message':"删除成功"})

    context = {
        'title':'服务器基本信息',
        'servers':servers_ips, # 数组形式的
        'ads_kinds':ads_kinds,
    }
    return render_template('servers.html', context=context)


@flask_views.route('/server/<int:server_id>', methods=['GET', 'POST','DELETE'])
@login_required
def server(server_id):
    try:
        servers_ips = ServerIPs.query.all()
        ads_kinds = AdsKinds.query.all()
    except Exception as e:
        current_app.logger.error(e)
        abort(404, "数据库错误，联系管理员处理10")

    if not server_id in [i.id for i in servers_ips]:
        abort(404, "参数不合法")

    if request.method == 'POST':
        json_data = request.get_json()
        add_url = json_data.get('url')
        add_title = json_data.get('title')
        add_keywords = json_data.get('keywords')
        add_description = json_data.get('description')
        add_baidu_code = json_data.get('baidu_code')
        add_baidu_post_code = json_data.get('baidu_post_code')
        if not all([add_url, add_title, add_keywords, add_description, add_baidu_code, baidu_post_code]):
            return jsonify({'resCode':1, 'message':"失败: 数据不完整"})
        webinfos = WebsiteInfos()
        webinfos.url = add_url
        webinfos.title = add_title
        webinfos.keywords = add_keywords
        webinfos.description = add_description
        webinfos.baidu_code = add_baidu_code
        webinfos.ip_id = server_id
        webinfos.baidu_post_code = add_baidu_post_code
        # todo: 给指定服务器发送ssh请求，生产nginx配置文件
        server = ServerIPs.query.filter_by(id=server_id).first()
        print(">>>>>>>>>>>>>>>>>>>>",add_url,"<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
        json_for_nginx = {
        	"url" : add_url,
        	"ip_nginx" : server.ip,
            "username" : server.username,
            "password" : server.password,
            "port" : server.port,
    	}
        print(">>>>>>>>>>>>>>>>>>>>",json_for_nginx,"<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
        print(">>>>>>>>>>>>>>>>>>>>",type(json_for_nginx),"<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
        print(">>>>>>>>>>>>>>>>>>>>",json_for_nginx["url"],"<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
        resp = upload_nginx_conf_to_target_server_by_ssh(json_for_nginx, add_url+".conf")
        if resp is not True:
            return resp
        # todo: 给指定服务器发送ssh请求，生产nginx配置文件
        # todo:重新加载nginx配置 ngixn -s reload
        # execute('194.105.63.33', 22, 'root', '9600451392Aa123!@#)(*&^%', 'nginx -s reload')
        res = execute(server.ip, server.port, server.username, server.password, 'nginx -s reload')
        if res is not True:
            return res
        try:
            db.session.add(webinfos)
            db.session.commit()
        except Exception as e:
            current_app.logger.error(e)
            return jsonify({'resCode':1, 'message':"失败: 数据库链接错误，联系管理员处理7"})
        return jsonify({'resCode':0, 'message':"添加成功!"})

    if request.method == 'DELETE':
        json_data = request.get_json()
        delete_id = json_data.get('id')
        if delete_id is None:
            return jsonify({'resCode':1, 'message':"失败: 参数不完整"})
        try:
            webs = WebsiteInfos.query.filter(WebsiteInfos.ip_id==server_id).all()
        except Exception as e:
            current_app.logger.error(e)
            return jsonify({'resCode':1, 'message':"失败：数据库错误，联系管理员处理9"})
        if not int(delete_id) in [i.id for i in webs]:
            return jsonify({'resCode':1, 'message':"失败：参数错误"})
        try:
            delete_web = WebsiteInfos.query.filter_by(id=delete_id).first()
            db.session.delete(delete_web)
            db.session.commit()
        except Exception as e:
            current_app.logger.error(e)
            return jsonify({'resCode':1, 'message':"失败：数据库错误，联系管理员处理10"})
        return jsonify({'resCode':0, 'message':"删除成功"})


    try:
        current_server = ServerIPs.query.filter_by(id=server_id).first()
        webs = WebsiteInfos.query.filter(WebsiteInfos.ip_id==server_id).all()
    except Exception as e:
        current_app.logger.error(e)
        abort(404, "数据库错误，联系管理员处理6")



    context = {
        'title': current_server.nickname+"网站信息",
        'servers':servers_ips, # 数组形式的
        'ads_kinds':ads_kinds,
        'webs': webs
    }
    return render_template('server.html', context=context)
