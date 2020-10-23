from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired


class AdminUserForm(FlaskForm):
    username = StringField(
        'username',
        render_kw={'placeholder': '用户名', 'type':'text'},
        validators=[DataRequired()]
    )
    password = StringField('password', render_kw={'placeholder': '密码', 'type':'password'}, validators=[DataRequired()])
    imagenumber = StringField('imagenumber', render_kw={'placeholder': '不区分大小写', 'type':'text'}, validators=[DataRequired()])
    uuid = StringField('uuid', render_kw={'type':'hidden', 'value':''}, validators=[DataRequired()])
    submit = SubmitField('登录')


class ContactInfoForm(FlaskForm):
    tool = StringField(
        'tool',
        render_kw={'placeholder': '联系工具,比如：QQ', 'type':'text'},
        validators=[DataRequired()]
    )
    info = StringField(
        'info',
        render_kw={'placeholder': '联系方式，比如：QQ号', 'type':'text'},
        validators=[DataRequired()]
    )
    submit = SubmitField('提交')


class AdsInfoForm(FlaskForm):
    target_url = StringField(
        'target_url',
        render_kw={'placeholder': '跳转地址(url)', 'type':'text'},
        validators=[DataRequired()]
    )
    img_url = StringField(
        'img_url',
        render_kw={'placeholder': '图片地址(url)', 'type':'text'},
        validators=[DataRequired()]
    )
    submit = SubmitField('提交')
