from flask import render_template, request, flash, jsonify, current_app, make_response,session
from . import flask_views
from flaskmain.models import ContactInfos, AdsKinds, ServerIPs
from flaskmain.forms import ContactInfoForm
from flaskmain import db
from flaskmain.utils.commons import is_string_validate, login_required
# from flaskmain.utils.commons import login_required


@flask_views.route('/contact', methods=['GET', 'POST', 'DELETE'])
@login_required
def contact():
    print("request.method = ", request.method)
    if request.method == 'POST':
        # 获取提交数据
        post_request_dict = request.get_json()
        if post_request_dict is None:
            # 提交的啥玩意儿？
            return jsonify({'resCode': 1, 'message':"请求错误1"})
        tool = post_request_dict.get('tool')
        info = post_request_dict.get('info')
        if tool is None or info is None:
            # 数据不完整
            return jsonify({'resCode': 1, 'message':"请求有误"})
        if is_string_validate(tool) or is_string_validate(info):
            print("return = ", jsonify({'resCode':1,'message':'请勿包含特殊字符1'}))
            return jsonify({'resCode': 1, 'message':"请勿包含特殊字符"})
        contact = ContactInfos()
        contact.tool = tool
        contact.info = info
        try:
            db.session.add(contact)
            db.session.commit()
        except Exception as e:
            current_app.logger.error(e)
            return jsonify({'resCode': 1, 'message':"数据库错误，请联系管理员处理"})
        return jsonify({'resCode':0,'message':'提交成功'})

    if request.method == 'DELETE':
        data_json = request.get_json()
        if  data_json is None:
            return jsonify({'resCode': 1, 'message':"参数错误"})
        contact_id = data_json.get('id')
        if  contact_id is None:
            return jsonify({'resCode': 1, 'message':"参数错误"})
        print("ContactInfos.query.filter_by(id=contact_id).first() = ", ContactInfos.query.filter_by(id=contact_id).first())
        try:
            contact_infos = ContactInfos.query.filter_by(id=contact_id).first()
        except Exception as e:
            current_app.logger.error(e)
            return jsonify({'resCode': 1, 'message':"数据库错误，联系管理员处理"})
        if contact_infos == None:
            # 这个错误，可能是攻击
            return jsonify({'resCode': 1, 'message':"请求错误2"})
        try:
            db.session.delete(contact_infos)
            db.session.commit()
        except Exception as e:
            current_app.logger.error(e)
            return jsonify({'resCode': 1, 'message':"数据库错误，删除失败，联系管理员"})
        return jsonify({'resCode': 0, 'message':"删除成功"})

    form = ContactInfoForm()
    try:
        contacts = ContactInfos.query.all()
        servers_ips = ServerIPs.query.all()
        ads_kinds = AdsKinds.query.all()
    except Exception as e:
        current_app.logger.error(e)
        abort(404, "数据库链接错误，请联系管理员处理2")
    context = {
        'title': "联系方式",
        'ads_kinds':ads_kinds,
        'servers':servers_ips,
        'contacts':contacts
    }
    return render_template('contact.html', context=context, form=form)
