from flask_login import UserMixin
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import datetime
from sqlalchemy import text


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://alex1943:qwe123@43.248.8.11/genmai'
db = SQLAlchemy(app)



"""
这个模型类中的设计要和数据库中对应的表相互符合
只能比表中的数据少，但是不能多。(因为这个账户没有创建表的权限，也不要去尝试创建表)
记录一下数据操作：

当然前提你要先进数据库把用户和权限创建好
1.登录服务器
ssh root@43.248.8.11
2.进入数据库
sudo mysql
3.创建一个允许远程登录账户
CREATE USER 'alex1943'@'%' IDENTIFIED BY 'qwe123';
3.创建一个数据库
create database genmai charset=utf8;
4.把这个数据库的增改查的权限给这个账户（注意一下，没有给删除的权限）
GRANT select,insert,update ON genmai.* TO 'alex1943'@'%';
5.进行下面的创建表的操作
6.把users_genmai_infos的删除权限交给alex1943
GRANT select,insert,update,delete ON genmai.users_genmai_infos TO 'alex1943'@'%';
7.刷新一下权限
flush privileges;
8.测试一下
mysql -h 43.248.8.11 -u alex1943 -p
是否链接成功？
链接成功之后是否只能看到一个数据库？
插入一些数据到users，然后尝试删除users表中数据，是否成功？
插入一些数据到users_genmai_infos，然后尝试删除users_genmai_infos表中数据，是否成功？


祝你好运

链接数据库
mysql -h 43.248.8.11 -u alex1943 -p

create database genmai charset=utf8;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT primary key,  -- 主键，自增
  `username` varchar(35) NOT NULL unique,  -- 用户名，唯一
  `password` varchar(80) DEFAULT NULL,  -- 密码，加密之后的保存
  `is_active` BOOLEAN DEFAULT true,   -- 是否激活账户，预留，默认1为可以用
  `is_xiaohai` BOOLEAN DEFAULT false,  -- 是否为超级管理员，预留，默认0,为否
  `deadline` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `user_type` int(1) DEFAULT 0
);

CREATE TABLE `users_genmai_infos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT primary key,  -- 主键 自增
  `user_id` int(10) unsigned NOT NULL,  -- 用户的ID（注意这里本来应该用外建，但是没有，需要程序判断）
  `asin` varchar(10) DEFAULT NULL,  -- 商品标识
  `country` enum('US','JP','UK','DE','FR','IT','ES','CA','AU','MX') DEFAULT NULL,   -- 国家，枚举
  `seller` varchar(20) NOT NULL,   -- 卖家名字
  `youxian` enum('A级','AA级','AAA级') NOT NULL DEFAULT 'A级',
  `is_done` BOOLEAN default false,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP
);

"""


# 第一个问题：按照这种方式创建的alex1943账户，没有创建表的权限，所以不能用SQLAlchemy去创建表
# 第二个问题：实际上应该写一个基类，基类应该有这条信息创建的时间，
            # 最后修改的时间，然后让其他类去继承这个类，放在后面吧
# 第三个问题： 至少还缺少了一张用户类型的表，typeofuser = db.Column(db.Integer)，这边只能有4个值

class genmai(db.Model, UserMixin):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    # username = db.Column(db.String(35), unique=True)
    username = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(80))
    is_active = db.Column(db.Boolean, default=True)
    is_xiaohai = db.Column(db.Boolean, default=False)
    deadline = db.Column(db.DateTime, default=datetime.datetime.now)
    user_type = db.Column(db.Integer, default=0)


class genmai_tasks(db.Model):
    __tablename__ = 'users_genmai_infos'
    id = db.Column(db.Integer, primary_key=True)
    # username = db.Column(db.String(35), unique=True)
    user_id = db.Column(db.Integer)
    asin = db.Column(db.String(10))
    country = db.Column(db.Enum('US','JP','UK','DE','FR','IT','ES','CA','AU','MX'), default='US')  # Column(Enum('python', 'flask'))
    seller = db.Column(db.String(20))
    youxian = db.Column(db.Enum('AAA级','AA级','A级'), default='A级')
    is_done = db.Column(db.Boolean, default=False)
    create_time = db.Column(db.DateTime, default=datetime.datetime.now)
