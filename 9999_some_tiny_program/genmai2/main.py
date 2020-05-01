from flask import Flask, render_template, redirect, url_for, request, flash, abort
# from flask_bootstrap import Bootstrap  # 放弃使用Bootsrtap， 感觉太SB了
from forms import LoginForm, RegisterForm, TaskForm
from models import genmai,genmai_tasks
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
import re
from flask_wtf.csrf import CSRFProtect
from flask_sqlalchemy import SQLAlchemy
from everyone_needed import test_inject_sql_username_string

# app = Flask(__name__, static_folder='/static', static_url_path='/static')
app = Flask(import_name=__name__,
            static_url_path='/', # 配置静态文件的访问 url 前缀
            static_folder='static',    # 配置静态文件的文件夹
            template_folder='templates') # 配置模板文件的文件夹

app.config['WTF_CSRF_ENABLED'] = False
app.config['WTF_CSRF_SECRET_KEY'] = 'a random string'
# app.config['WTF_CSRF_ENABLED'] = False
app.config['SECRET_KEY'] = 'Thisissupposedtobesecret!'
# bootstrap = Bootstrap(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://alex1943:qwe123@43.248.8.11/genmai'
db = SQLAlchemy(app)


csrf = CSRFProtect(app)

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'



@login_manager.user_loader
def load_user(user_id):
    return genmai.query.get(int(user_id))




@app.errorhandler(404)
def page_not_found(e):
    return render_template('/back/404.html'),404
@app.errorhandler(500)
def page_not_found(e):
    return render_template('500.html'),500



@app.route('/')
def index():
    # return render_template('index_login.html')
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    # 判断用户是否已经登录
    # if current_user.name:
    #     return redirect(url_for('index'))
    form = LoginForm()
    if form.validate_on_submit() and request.method == 'POST':
        # TODO: 再次判断用户输入是否合法，只能输入大写小写字母，数字，@，下划线
        print(form.username.data)
        if test_inject_sql_username_string(form.username.data):
            flash('不存在类似的用户名，请勿尝试注入')
            return redirect('/')
        # 判断用户是否存在于数据库
        print(form.username.data)
        user = genmai.query.filter_by(username=form.username.data).first()
        print(user)
        if user is not None:
            print('user.is_xiaohai = ',user.is_xiaohai)
            print('user.is_active = ',user.is_active)
            # 判断用户输入密码是否正确
            if check_password_hash(user.password, form.password.data):
                login_user(user, remember=True)
                return redirect(url_for('back'))
            else:
                flash('用户名或者密码错误，请重新输入')
                return redirect('/')
        else:
            flash('您的账户不存在，或者密码错误，请确认后重新登录，或者点击注册页面')
            return redirect('/')
    # get请求的返回
    return render_template('index_login.html', form=form)

@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm()
    if form.validate_on_submit() and request.method == 'POST':
        # TODO: 再次判断用户输入是否合法，只能输入大写小写字母，数字，@，下划线
        if test_inject_sql_username_string(form.username.data):
            flash('不合法的用户名，请修改您的用户名再次尝试，请勿尝试注入')
            return redirect('/')

        user = genmai.query.filter_by(username=form.username.data).first()
        if user:
            flash('用户已经存在，请换一个用户名！')
            return redirect(url_for('register'))
        # print(form.username.data)
        # print(request.form['csrf_token'])
        username = form.username.data
        password = form.password.data
        hashed_password = generate_password_hash(form.password.data, method='sha256')
        new_user = genmai(username=form.username.data, password=hashed_password)
        db.session.add(new_user)
        db.session.commit()
        return render_template('back/index.html')
    return render_template('index_register.html', form=form)



@app.route('/back')
@login_required
def back():
    print(current_user.username)
    print(current_user.password)
    print(current_user.is_active)
    print(current_user.is_xiaohai)
    print(current_user.deadline)
    print(current_user.user_type)

    return render_template('back/index.html')


@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))

@app.route('/targets', methods=['GET', 'POST'])
@login_required
def targets():
    print(request)
    print(request.method)
    tasks = genmai_tasks.query.filter_by(user_id=current_user.id).all()
    for task in tasks:
        print(task.id)
    print(tasks)
    form = TaskForm()
    return render_template('back/targets.html', form=form, tasks=tasks)

@app.route('/add_task', methods=['GET', 'POST'])
@login_required
def add_task():
    print('add_task')
    form = TaskForm()
    print(form.validate_on_submit())
    print(request.method)
    if request.method == 'POST' and form.validate_on_submit():
        if current_user.id is None:
            abort(404)
        user = genmai.query.filter_by(id=current_user.id).first()
        if user is None:  # 因为没有设置外建，所以这里一定要去查询一下
            abort(404)

        # TODO: 检测一下输入是否合法
        if test_inject_sql_username_string(request.form['asin']) and test_inject_sql_username_string(request.form['seller']):
            flash('不合法的输入，请勿尝试注入')
            return redirect('/')

        new_task = genmai_tasks(
                        user_id=user.id,
                        asin=request.form['asin'],
                        country=request.form['country'],
                        seller=request.form['seller'],
                        youxian=request.form['youxian']
                    )
        db.session.add(new_task)
        db.session.commit()

        print(current_user.id)
        print(current_user.username)
        print(request.form)
        print(request.form['asin'])
        print(request.form['country'])
        print(request.form['seller'])
        print(request.form['youxian'])
        return redirect(url_for('targets'))
    else:
        abort(404)


@app.route('/delete')
@login_required
def delete():
    print("request.args.get('q') = ", request.args.get('q'))
    if current_user.id is None:
        abort(404)
    user = genmai.query.filter_by(id=current_user.id).first()
    if user is None:  # 因为没有设置外建，所以这里一定要去查询一下
        abort(404)

    # TODO: 检测一下输入是否合法
    if test_inject_sql_username_string(request.args.get('q')):
        flash('不合法的输入，请勿尝试注入')
        return redirect('/')

    delete_task = genmai_tasks.query.filter_by(id=int(request.args.get('q'))).first()
    if delete_task is not None:
        from models import db
        db.session.delete(delete_task)
        db.session.commit()
        return redirect(url_for('targets'))
    else:
        abort(404)



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=1944, debug=True)
