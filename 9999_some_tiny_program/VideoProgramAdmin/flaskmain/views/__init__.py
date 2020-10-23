from flask import Blueprint, render_template
from flask_wtf.csrf import generate_csrf
import re

# 创建蓝图对象
flask_views = Blueprint("views", __name__)
# 导入蓝图的视图函数
from . import passport, image_code, servers, contact, ads


@flask_views.app_errorhandler(404)
def page_not_found_404(e):
    if not re.compile(u'[\u4e00-\u9fa5]').search(str(e)):
        e = "Oops! Page not found."
    context = {
        'title':'404页面',
        'message':e
    }
    return render_template('404.html', context=context)


# 请求钩子
@flask_views.after_request
def after_request(response):
    # 调用函数生成 csrf_token
    csrf_token = generate_csrf()
    # 通过 cookie 将值传给前端
    response.set_cookie("csrf_token", csrf_token)
    return response
