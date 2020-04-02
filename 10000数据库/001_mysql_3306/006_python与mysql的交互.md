## 准备数据
```bash
-- 创建 "京东" 数据库
create database jing_dong charset=utf8;

-- 使用 "京东" 数据库
use jing_dong;

-- 创建一个商品goods数据表
create table goods(
    id int unsigned primary key auto_increment not null,
    name varchar(150) not null,
    cate_name varchar(40) not null,
    brand_name varchar(40) not null,
    price decimal(10,3) not null default 0,
    is_show bit not null default 1,
    is_saleoff bit not null default 0
);

-- 向goods表中插入数据

insert into goods values(0,'r510vc 15.6英寸笔记本','笔记本','华硕','3399',default,default);
insert into goods values(0,'y400n 14.0英寸笔记本电脑','笔记本','联想','4999',default,default);
insert into goods values(0,'g150th 15.6英寸游戏本','游戏本','雷神','8499',default,default);
insert into goods values(0,'x550cc 15.6英寸笔记本','笔记本','华硕','2799',default,default);
insert into goods values(0,'x240 超极本','超级本','联想','4880',default,default);
insert into goods values(0,'u330p 13.3英寸超极本','超级本','联想','4299',default,default);
insert into goods values(0,'svp13226scb 触控超极本','超级本','索尼','7999',default,default);
insert into goods values(0,'ipad mini 7.9英寸平板电脑','平板电脑','苹果','1998',default,default);
insert into goods values(0,'ipad air 9.7英寸平板电脑','平板电脑','苹果','3388',default,default);
insert into goods values(0,'ipad mini 配备 retina 显示屏','平板电脑','苹果','2788',default,default);
insert into goods values(0,'ideacentre c340 20英寸一体电脑 ','台式机','联想','3499',default,default);
insert into goods values(0,'vostro 3800-r1206 台式电脑','台式机','戴尔','2899',default,default);
insert into goods values(0,'imac me086ch/a 21.5英寸一体电脑','台式机','苹果','9188',default,default);
insert into goods values(0,'at7-7414lp 台式电脑 linux ）','台式机','宏碁','3699',default,default);
insert into goods values(0,'z220sff f4f06pa工作站','服务器/工作站','惠普','4288',default,default);
insert into goods values(0,'poweredge ii服务器','服务器/工作站','戴尔','5388',default,default);
insert into goods values(0,'mac pro专业级台式电脑','服务器/工作站','苹果','28888',default,default);
insert into goods values(0,'hmz-t3w 头戴显示设备','笔记本配件','索尼','6999',default,default);
insert into goods values(0,'商务双肩背包','笔记本配件','索尼','99',default,default);
insert into goods values(0,'x3250 m4机架式服务器','服务器/工作站','ibm','6888',default,default);
insert into goods values(0,'商务双肩背包','笔记本配件','索尼','99',default,default);
```
### 随便试试
```msyql
select * from goods where cate_name="超级本";
select name, price where cate_name="超级本";
select distinct cate_name from goods;
select cate_name from goods group by cate_name;
select cate_name, group_concat(name) from goods group by cate_name;
select avg(price) from goods;
select round(avg(price),2) from goods;
# 每个分类中的平均价格
select cate_name, avg(price) from goods group by cate_name;
# 显示每个分类中最大的价格，最小的价格，平均价格
select cate_name, max(price),min(price), avg(price) from goods group by cate_name;
# 显示大于平均价格的商品
select * from goods where price > (select avg(price) from goods);
# 显示每种商品中最贵的商品
select cate_name, max(price) from goods group by cate_name;
# 以上面显示的表格为一张表格，然后去原来的goods中去链接查询
select * from goods inner join (
        select cate_name,max(price) as max_price,min(price) as min_price, avg(price) as avg_price,count(*) as cate_count from goods group by cate_name
    ) as goods_new_info
    on goods_new_info.cate_name=goods.cate_name and goods_new_info.max_price=goods.price;

# 让他好看一点
select goods.name, goods.price, goods.cate_name from goods inner join (
        select cate_name,max(price) as max_price,min(price) as min_price, avg(price) as avg_price,count(*) as cate_count from goods group by cate_name
    ) as goods_new_info
    on goods_new_info.cate_name=goods.cate_name and goods_new_info.max_price=goods.price;
```
