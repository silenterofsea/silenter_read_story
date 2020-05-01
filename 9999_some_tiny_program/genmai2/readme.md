## 数据库建立
```mysql
-- 创建数据库
create database genmai charset=utf8;
-- 创建表用户表
create table users(
    id int unsigned not null auto_increment primary key,
    username varchar(35) not null,  -- 用户名
    email varchar(50),  -- 邮箱
    password varchar(80),  -- 密码
    is_active tinyint default 0, 
    is_xiaohai tinyint default 0,
    deadline datetime default null
);

-- 创建跟买表
create table users_genmai_infos(
    id int unsigned not null auto_increment primary key,
    userId int unsigned not null,
    foreign key(userId) references users(id),  -- 用户名
    asin varchar(10),  -- 邮箱
    country ENUM("US", "JP", "UK", "DE", "FR", "IT", "ES", "CA", "AU", "MX"),  -- 密码
    genmai_name varchar(20) not null, -- 图片原来位置
    youxian ENUM("AAA级", "AA级", "A级") not null default "AAA级"
);


```