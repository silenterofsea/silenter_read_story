### mysql   关系型数据库
- 一种特殊的存储数据的文件
- 查询速度极快
- 需要一套特殊的工具（RDBMS）来管理存储数据的文件



### RDBMS： Relational Database Management System

关系型数据库使用的一套软件： Mysql、Oracle、 sqlite、 Microsoft SQL Server

RDBMS-client ---> RDBMS-server ---> 特殊的存储数据的文件
mysql        ---> mysql-server ---> 真的存储的位置

### SQL： Structured Query Language(可以操作多种关系型数据库)
SUN公司：  S：斯坦福， U：大学， N：Network

## 安装 配置 服务端 （ubuntu18环境）
```bash
# 安装服务端
sudo apt-get install mysql-server
# 启动服务
sudo service mysql start
# 看一下启动了没
ps -aux | grep mysql
# 关闭mysql服务
sudo service mysql stop
# 重启mysql
sudo service mysql restart
# 配置mysql，之后，记得重启服务器
vim /etc/mysql/mysql.cnf
# 观察上面这个文件中的两个路径，其中第二个文件夹打开看一下
cd /etc/mysql/mysql.conf.d
# 打开这个文件夹中的第一个文件, 真正的配置文件在这个文件里面
vim /etc/mysql/mysql.conf.d/mysqld.cnf
# 其中有两行你要看一下
# 第一个，绑定端口，默认是3306,但是你也知道，可以改
port=3306
# 第二个，绑定IP，如果要让外部需要绑定一个公网IP或者改成0.0.0.0
# 如果是120.0.0.1 那么只有本机能访问
bind_address=127.0.0.1
# 其他的多看看，知道是什么东西之前不要随便动，当然也没有什么难的
```
## 安装 配置 客户端 （ubuntu18环境）
```bash
# 安装客户端
sudo apt-get install mysql-client
# 测试一下是否安装成功
mysql --help
# 链接本地的mysql服务端, 如果你是第一次登录，那么这个时候，一般你是登录不上的
mysql -u root -p
# 接下来我们来解决这个报错
# 第一步，先使用sudo来链接mysql
sudo mysql
# 大致看一下，数据库里面有什么数据库
show databases;
# 切换到管理数据库用户的数据库
use mysql;
# 先大致看一下信息
select * from user \G;



# 然后来看一下关键信息
select User, authentication_string, plugin from user;
# 修改密码和登录方式
update user set authentication_string=password("你想要的密码"),plugin='mysql_native_password' where user='root'
# 最后一步，必须要的，更新权限
flush privileges;
# 退出mysql
quit
# 重新使用你刚刚创建的密码登录测试一下



mysql -u root -p
# 最后补一句，其实这种方式直接修改了root的密码，但是因为root的权限太大了
# 所以真实的使用环境中不会这么操作的
# 一般是新建一个用户，然后给他一定的权限，让他可以登录数据库就可以了
# 但是你不用太过于担心，因为这个的话，如果公司规模大的话，DB会给你一个能登录数据库的账户密码的
# 你就知道怎么连数据库就可以了
# 如果你还想了解怎么分配权限的话，也不是很难，去了解，去发现吧
# 但是这个页面没有了～～
# 祝你好运

mysql 正确的使用方式（永远，永远不要让root可以远程登录）
# 这个命令会让你创建一个能在本地登录的alex1943的帐号，密码为qwe123，并且允许远程登录
CREATE USER 'alex1943'@'%' IDENTIFIED BY 'qwe123';
# 这条命令会让alex1943这个账户会有和root一样的权限
GRANT ALL PRIVILEGES ON *.* TO 'alex1943'@'%';
#刷新权限
FLUSH PRIVILEGES;
# 让数据库允许远程登录
vim /etc/mysql/mysql.conf.d/mysqld.cnf
'''
注释这一行：bind-address:127.0.0.1
'''
慎重使用！！！！！！！！！！！！
# 重启mysql服务
sudo service mysql restart

# 在本地电脑，输入
mysql -h 服务器IP -P 端口 -u alex1943 -p
```

## 图形化工具 ---> navicat

- 挺好用的，但是不建议你“过于”依赖这样的工具
- 数据庞大的时候，也不是很实用
