from . import flask_views
from flask import render_template, current_app, redirect, url_for, request, flash,session, abort
from flaskmain.models import AdminUsers, AdsKinds, ServerIPs
import re
from flaskmain.forms import AdminUserForm
from flaskmain.utils.commons import login_required
from .image_code import get_image_number


@flask_views.route('/test_db')
def test_db():
    user = AdminUsers.query.filter_by(id=1).first()
    if user == None:
        return 'There is no AdminUser !'
    else:
        return user.username


@flask_views.route('/', methods=['GET', 'POST'])
# 没有使用login_manager的版本
@flask_views.route('/login', methods=['GET', 'POST'])
def login():
    try:
        user_id = session['id']
    except:
        user_id = None
    if user_id is not None:
        return redirect(url_for('views.index'))
    form = AdminUserForm()
    context = {
        'title': '登录页面'
    }
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        imagenumber = request.form.get('imagenumber')
        uuid = request.form.get('uuid')
        # 判断参数是否完整
        if not all([username, password, imagenumber, uuid]):
            # 此时参数不完整
            flash('参数不完整！')
            return render_template('/login.html', context=context, form=form)
        # 判断用户名是否包含特殊字符
        if re.search(r'[?*/\\<>:"|]', username) is not None:
            flash("用户名不能包含特殊字符")
            return render_template('/login.html', context=context, form=form)
        image_number_in_redis = get_image_number(uuid)
        if image_number_in_redis == None:
            # 这边涉及到去数据库取数据，但是这个方法在读取数据库出错的情况下，会返回None，所以这边没有用try，直接用返回值来判断
            flash("发生未知错误，刷新后重试")
            return render_template('/login.html', context=context, form=form)
        if image_number_in_redis.lower() != imagenumber.lower():
            flash("验证码错误")
            return render_template('/login.html', context=context, form=form)

        try:
            user = AdminUsers.query.filter_by(username=username).first()
        except Exception as e:
            current_app.logger.error(e)
            flash("数据库异常，请联系管理员")
            return render_template('/login.html', context=context, form=form)

        if user is None or not user.check_password(password):
            flash("用户名不存在，或者密码错误")
            return render_template('/login.html', context=context, form=form)

        session['id'] = user.id
        session['username'] = user.username
        # session['is_super_user'] = user.is_super_user
        return redirect(url_for('views.index'))
    return render_template('/login.html', context=context, form=form)


# 不使用login_manager的版本
@flask_views.route('/logout')
@login_required
def logout():
    session.clear()
    return redirect(url_for('views.login'))


# 后台首页
@flask_views.route('/index')
@login_required
def index():
    try:
        ads_kinds = AdsKinds.query.all()
        servers_ips = ServerIPs.query.all()
    except Exception as e:
        current_app.logger.error(e)
        abort(404, "数据库链接错误，联系管理员处理1")
    context = {
        'title': "后台首页",
        'servers':servers_ips,
        'ads_kinds':ads_kinds
    }
    return render_template('index.html', context=context)
