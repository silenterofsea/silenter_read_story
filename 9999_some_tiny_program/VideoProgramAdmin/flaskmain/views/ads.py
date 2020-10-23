from . import flask_views
from flaskmain import db
from flask import render_template, session, current_app, abort, Response, request,jsonify
from flaskmain.models import AdsKinds, AdsInfos, ServerIPs
from flaskmain.utils.commons import login_required
from flaskmain.forms import AdsInfoForm
import re




@flask_views.route('/ads/<int:kind_id>', methods=['GET', 'DELETE', 'POST'])
@login_required
def ads(kind_id):
    # 判断kind_id是否合法
    try:
        ads_kinds = AdsKinds.query.all()
    except Exception as e:
        current_app.logger.error(e)
        abort(404, "数据库错误，请联系管理员处理")
    if kind_id not in [i.id for i in ads_kinds]:
        abort(404,"参数错误")

    if request.method == 'DELETE':
        print("DELETE")
        json_data = request.get_json()
        delete_id = json_data.get('id')
        if delete_id is None:
            return jsonify({'resCode':1, 'message':"失败：参数无效1"})
        try:
            delete_ad = AdsInfos.query.filter(AdsInfos.id==delete_id,AdsInfos.ads_kind==kind_id).first()
            # delete_ad = AdsInfos.query.filter(id==delete_id,ads_kinds==str(kind_id)).first()
            # existing = User.query.join(User.spaces).filter(User.username=='Bob', Space.name=='Mainspace').first()
        except Exception as e:
            current_app.logger.error(e)
            return jsonify({'resCode':1, 'message':"失败：参数无效2"})
        print("delete_ad = ", delete_ad)
        db.session.delete(delete_ad)
        db.session.commit()
        return jsonify({'resCode':0, 'message':"删除成功"})

    if request.method == 'POST':
        print("POST")
        json_data = request.get_json()
        target_url = json_data.get('target_url')
        img_url = json_data.get('img_url')
        if target_url is None or img_url is None:
            return jsonify({'resCode':1, 'message':"提交失败:参数有误"})

        if not re.match(r'^https?:/{2}\w.+$', target_url) or not re.match(r'^https?:/{2}\w.+$', img_url):
            return jsonify({'resCode':1, 'message':"提交失败:此处需要提交网址！！网址！！！网址！！！"})
        print("target_url = ", target_url)
        print("img_url = ", img_url)
        add_ad = AdsInfos()
        add_ad.target_url = target_url
        add_ad.img_url = img_url
        add_ad.ads_kind = kind_id
        db.session.add(add_ad)
        db.session.commit()
        return jsonify({'resCode':0, 'message':"提交成功"})


    form = AdsInfoForm()
    try:
        titile = AdsKinds.query.filter_by(id=kind_id).first().kind_nickname
        ads = AdsInfos.query.filter(AdsInfos.ads_kind==kind_id).all()
        servers_ips = ServerIPs.query.all()
    except Exception as e:
        current_app.logger.error(e)
        abort(404, "数据库错误，请联系管理员处理")
    context = {
        'title': titile,
        'servers': servers_ips,
        'ads_kinds':ads_kinds,
        'ads': ads
    }
    return render_template('ads.html', context=context, form=form)
