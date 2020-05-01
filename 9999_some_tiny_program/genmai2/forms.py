from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField, SelectField
from wtforms.validators import InputRequired, Email, Length, EqualTo, Required,DataRequired




class LoginForm(FlaskForm):
    username = StringField(
                'username',
                render_kw={
                    'id':'exampleInputEmail1',
                    'placeholder': '请输入您的用户名：建议使用邮箱',
                    'type':'text',
                    'class': 'form-control'
                },
                validators=[
                    InputRequired("用户名不能为空！"),
                    Length(min=5, max=20, message="请确认您的用户名输入是否正确,5-20位")
                ])
    # <input type="email" class="form-control" id="exampleInputEmail1" placeholder="请输入您的用户名">
    password = PasswordField(
                'password',
                render_kw={
                    'id':'exampleInputPassword1',
                    'placeholder':'密码为8到12位的数字和字母',
                    'type': 'password',
                    'class': 'form-control'
                },
                validators=[
                    InputRequired("密码不能为空！"),
                    Length(min=8, max=20, message="请确认您的密码是否输入正确")
                ])
    # <input type="password" class="form-control" id="exampleInputPassword1" placeholder="密码为8到12位的数字和字母">
    submit = SubmitField('登录',render_kw={'type':'submit', 'class':'btn btn-info col-md-3'})

class RegisterForm(FlaskForm):
    username = StringField(
        'username',
        validators=[
            InputRequired("用户名不能为空！"),
            Length(min=5, max=20, message="请确认您的用户名输入是否正确,5-20位")
        ])
    # username = StringField('username', render_kw={'class': 'form-control'}, validators=[InputRequired(), Length(min=4, max=35)])
    password = PasswordField(
        'password',
        validators=[
            InputRequired("密码不能为空"),
            Length(min=8, max=80, message="长度不符合,8-20位")
        ]
    )
    password2 = PasswordField(
        'password2',
        validators=[
            EqualTo('password', message='两次输入不一致')
        ]
    )
    submit = SubmitField('注册')

class TaskForm(FlaskForm):
    asin =  StringField(
        'asin',
        validators=[InputRequired("asin不能为空！")]
    )
    country = SelectField(
            'country',
            validators=[DataRequired('请选择国家')],
            choices=[(1, 'US'), (2, 'JP'), (3, 'UK'),(4, 'DE'), (5, 'FR'), (6, 'IT'),(7, 'ES'), (8, 'CA'), (9, 'AU'),(10, 'MX')],
            # 'US','JP','UK','DE','FR','IT','ES','CA','AU','MX'
            default = 1,
            coerce=int
        )
    # country = StringField(
    #     'country',
    #     validators=[
    #         InputRequired("卖家不能为空！")
    #     ])
    seller = StringField(
        'seller',
        validators=[InputRequired("卖家不能为空！")]
    )
    youxian = SelectField(
            'youxian',
            validators=[DataRequired('请选择优先级')],
            choices=[(1, 'A级'), (2, 'AA级'), (3, 'AAA级')],
            default = 1,
            coerce=int
        )
    # youxian = StringField(
    #     'youxian',
    #     validators=[
    #         InputRequired("卖家不能为空！")
    #     ])
    submit = SubmitField('提交任务a !!!')


"""
tag = SelectField(
        label='类别',
        validators=[DataRequired('请选择标签')],
        render_kw={
            'class': 'form-control'
        },
        choices=[(1, '情感'), (2, '星座'), (3, '爱情')],
        default = 3,
        coerce=int

    )

这里务必注意coerce选项的添加，否则提交时，下拉表单中的内容无法通过validate_on_submit的 验证。
"""
