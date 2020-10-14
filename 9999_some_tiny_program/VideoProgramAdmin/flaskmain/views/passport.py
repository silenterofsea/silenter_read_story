from . import flask_views
from flask import render_template, current_app
# from flaskmain.models import TestUser
from flaskmain.models import AdminUsers


# @admin_views.route('/test', methods=['GET'])
# def test():
#     return 'test flask'
# @admin_views.route('test')
# def test():
#     print(current_app.config.get("SAVE_PATH"))
#     user = TestUser.query.filter_by(id=1).first()
#     print("user.user_address.first() = ", user.user_address.first())
#     print("user.user_address.all() = ", user.user_address.all())
#     # print("TestUser.query.filter_by(id=1).first().parent = ", TestUser.query.filter_by(id=1).first().parent)
#     # print("TestUser.query.filter_by(id=1).first().children = ", TestUser.query.filter_by(id=1).first().children)
#     print("用户地址 ：", user.user_address.all())
#     current_app.logger.error("测试错误")
#     addresses = []
#     for temp in user.user_address.all():
#         print("temp:", temp.user_address)
#         addresses.append(temp.user_address)
#     print(addresses)
#     context = {
#         'title': "测试标题",
#         'hinfo': "你好呀",
#         'user_name':user.user_name,
#         'addresses': addresses
#     }
#     return render_template('base.html', context=context)

@flask_views.route('/test_db')
def index():
    user = AdminUsers.query.filter_by(id=1).first()
    if user == None:
        return 'There is no AdminUser !'
    else:
        return user.username
