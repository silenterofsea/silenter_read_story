## 视图 （解决数据库修改，而程序不修改的情况）
- 只能查询，不能更新。（修改不如直接改单张的表）
- 视图就是一张抽象出来的表，不存在，但是你去查询，它就存在了
- 语法： create view 视图名称 as select语句;
- 视图命名：建议以 "v_" 开头
- 查看视图： show tables
- 删除视图： dorp view 视图名字

```bash
select * from goods as g left join goods_cates as c on g.cate_id=c.id left join goods_brands as b on g.brand_id=b.id;
select g.*, c.name as cate_name, b.name as brand_name from goods as g left join goods_cates as c on g.cate_id=c.id left join goods_brands as b on g.brand_id=b.id;
# 创建视图
create view v_goods_infos as select g.*, c.name as cate_name, b.name as brand_name from goods as g left join goods_cates as c on g.cate_id=c.id left join goods_brands as b on g.brand_id=b.id;
select * from v_goods_infos;
```
## 事务 （解决高并发的问题，必须是Innodb数据库引擎）
- 要么全部执行，要么一个都不执行
- ACID
-- Atiomicity:原子性;
-- Consistency:一致性;（不会冲突）
-- Isolation：隔离性;（锁）
-- Durability:持久性;（修改以后保存进数据库）

```bash
# 开启事务
begin;
... # 执行语句
... # 执行语句
... # 执行语句
# 提交事务
commit;
# 如果不想提交，或者执行语句的过程中有错误
rollback;
commit和rollback之间只能有一个执行，要么提交，要么回滚
```
具体的例子
```bash
# 新建一张money表
create table money (
    id int unsigned not null primary key auto_increment,
    num int unsigned not null
);
# 插入一些数据
insert into money values (0, 100),(0,200),(0,0);
# 开启一个事务
begin;
update money set num=num-100 where id =1;
update money set num=num+100 where id=2;
# 这个时候打开另外一个窗口，尝试对id=1的num进行操作
# 回滚
rollback;
# 这个时候再用另外一个窗口，尝试对id=1的num进行操作

# 再来一次
# 开启一个事务
begin;
update money set num=num-100 where id =1;
update money set num=num+100 where id=2;
commit;
select * from money;
```


# 索引 （快速查询）B-tree
- 一种依附与表的特殊文件（空间会变大，但是时间会减少：空间换时间）
- 索引能提高查询的效率，但是会影响插入更新删除的效率。
```bash
create table test_index (title varchar(20))
```

```python
from pymysql import connect


def main():
    conn = connect(host='localhost', port=3306, user='root', password='qwe123', database='python07', charset='utf8')

    cursor = conn.cursor()
    for i in range(100000):
        cursor.execute("insert into test_index values ('haha-%d')" % i)
    conn.commit()
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()
```

```bash
select * from test_index;
# 开启操作时间监视
set profiling=1;
select * from test_index where title='haha-99999';
# 查看具体使用的时间
show profiles;
desc test_index;
# 为表test_index的titile字段创建索引
create index title_index on test_index(title(20))
# 语法： create index 索引名字 on 表名字（字段名）：索引名称建议 -- 字段名_表名
# 查看表中有哪些索引
show index from title_index;
# 删除索引
drop index 索引名称 on 表名;
drop index title_index on test_index;
```

## 账户管理
```bash
# 链接mysql数据库
mysql -u root -p
# 使用系统自带的mysql数据库
use mysql
# 查看一下user表信息
desc user;
# 查询一下user表中的信息
select * from user;
# 查询一下user表中的关键信息
select user, host, authentication_string from user;
# user 字段中显示的是登录的用户名
# host 字段中显示的是允许登录的主机： % 表示允许远程登录
# authentication_string 表示登录的密码

# 添加一个用户
grant 权限列表 on 数据库 to '用户名'@'访问主机' identified by '密码';
# 实际操作一下 权限赋值需要登录 root 用户操作
# 创建一个jindongonly的用户让他对jing_dong数据库所有表格有查询的权限，允许它远程登录
grant select on jing_dong.* to 'jindongonly'@'%' identified by 'qwe123';
# 创建一个用户jingdong对jing_dong数据库拥有全部权限
grant all privileges on jing_dong.* to 'jingdong'@'%' identified by 'qwe123';
# 添加权限
grant update on jing_dong.* to 'jindongonly'@'%' with grant option;
flush privileges;
# 修改密码
update user set authentication_string = password('123456') where User = 'jingdongonly';
# 如果远程链接还是，链接不上
# 去查看mysql.conf的配置文件，看看有没有绑定本地IP
```

## 主从服务器 master-slave
- 解决服务器出现的意外情况（备份）
- 对不同的用户，分配不同的数据库（负载均衡）
- 主服务器可以修改内容，从服务器无法修改内容，只能查询

```python
# 在主服务器上： 先备份原来数据库上的数据 在终端中执行
mysqldump -u root -p 数据库名字 > python.sql
# 恢复数据, 先创建好数据库，然后在终端中执行
mysql -u root -p 新数据库名称 < python.sql
# 主从正式开始：
# 先在主服务器上，把数据保存出来
mysqldump -u root -p qwe123 --all-databases --lock-all-tables > ~/master_db.sql
# 在主服务器上： 修改
sudo vim /etc/mysql/mysql.conf.d/mysql.cnf
# 在主服务器上： 保证下面两行没有注释
# server-id =1
# log_bin = /var/log/mysql/mysql-bin.log
grant replication slave on *.* to 'slave'@'%' identified by 'slave';
flush privileges;
# 在主服务器上，重启mysql服务
sudo service mysql restart

# 在从服务器
mysql -u root -p < master_db.sql
# 在从服务器上配置
sudo vim /etc/mysql/mysql.conf.d/mysql.cnf

# server-id =2
# # log_bin = /var/log/mysql/mysql-bin.log
# 注意： server-id 要和主服务器上不一样
# 注意： log_bin这行在从服务器上要注释掉

change master to master_host='主服务器IP', master_user='slave', master_password='slave',master_log_file='AAAA',master_log_pos=BBBB;
# 关于AAAA和BBBB：
# 在主服务器上输入：
# show master status;
# 其中File：为AAAA中的内容
# Position：为BBBB中的内容


# 在从服务器上重启mysql
sudo service mysql restart
# 查看是否配置成功
show slave status \G;

# Slave_IO_Runing=Yes
# Slave_SQL_Runing=Yes
# 则主从创建成功;
# 如果创建不成功，请反复确认用户名，密码是否正确;
# 确认AAAA、BBBB是否在正确（AAAA、BBBB必须在主服务器上查找信息）


```
