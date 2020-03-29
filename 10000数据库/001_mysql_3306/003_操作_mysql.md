### 命令行操作mysql
## mysql数据库操作
```bash
# 链接mysql
mysql -u root -p
# 退出msyql
quit或者exit或者crtl+D


mysql -u root -p
# 查看当前有什么数据库
show databases;
# 显示时间
select now();
# 显示版本信息
select version();

# 创建一个数据库
create database python_test_database charset=utf8;
# 查看是否创建成功
show databases;
# 查看创建数据库的语句
show create database python_test_database;
# 删除数据库
drop database python_test_database;
# 查看是否删除成功
show databases;
# 如果遇到python-04,或者其他的要让mysql看成一个整体的内容 `python-04`
# 就是键盘中左边数字1,左边的那个按键
```

## mysql表操作
```bash
mysql -u root -p
# 查看当前所在的数据库
select database();
create database python07 charset=utf8;
# 进入python07数据库
use python07

# 开始建立表
# 查看当前数据库中所有的表
show tables;
# 创建表
# create table 数据表名字 （字段名 类型 约束， 字段名 类型 约束，字段名 类型 约束， ... ）
create table test_table1 (id int , name varchar(30));
# 查看表结构
desc  test_table1;
# 创建一个稍微复杂的表
create table test_table2 (id int primary key not null auto_increment, name varchar(30));
# 查看当前数据里面的表
show tables;
# 查看test_table2的表结构
desc test_table2;
# 创建students表（id, name, age, high, gender, cls_id）
create table students(
    id int unsigned not null auto_increment primary key,
    name varchar(30),
    age tinyint unsigned,
    high decimal(5,2),
    gender enum("男", "女", "保密") default "保密",
    cls_id int unsigned
);
# 插入一行数据
insert into students values(
    0, "李四", 18, 188.88, "男", 0
);
# 查看一下
select * from students;
# 创建classes表(id, name)
create table classes(
    id int unsigned not null auto_increment primary key,
    name varchar(30)
);
# 插入一个班级信息
insert into classes values(0, "三年二班");
# 查看classes表信息
select * from classes;
# 查看classes表结构
desc classes;
# 删除表
# drop table 表名;
# dorp database 数据库名;
# 忘了drop，好好工作
```
## 修改表结构 (增删改表中列(字段)的信息)
```bash
# 查看表结构
desc students;
# 添加字段 语法： alter table 表名 add 字段名 类型 约束;
alter students add birthday datetime;
desc students;
# 修改字段属性（不修改字段名字） 语法 alter table 表名 modify 原来字段的名字 新的属性 新的约束;
alter table students modify birthday date;
desc students;
# 修改字段名，且修改类型和约束 语法 alter table 表明 change 旧表名 新表名 新类型 新约束
alter table students change birthday birth date default "1990-01-01";
# 删除一个字段，慎重！！！！
# 语法 alter table 表名 drop 字段名字
alter table students drop high;
desc students;
# 查看创建表的方式
show create table students;
# 注意看最后一行
# InnoDB,说明了他的数据库引擎的名字，这个引擎支持事务、行级锁、外键
# MyISAM不支持
# auto_increment:后面的数字说明了，下一个自增的ID，是多少
```
