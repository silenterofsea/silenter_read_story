## mysql数据库的备份和数据恢复
### 重中之重： 你必须有一个能对你想要备份的数据库有全部操作权限的账户，不然下面的都白扯。
### 创建一个在哪里都能登录，并且权限和root一样的用户
```python
mysql> CREATE USER 'alexHanter'@'%' IDENTIFIED BY 'qwe123';
Query OK, 0 rows affected (0.02 sec)

mysql> GRANT ALL PRIVILEGES ON *.* TO 'alexHanter'@'%';
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.02 sec)

```
### 第一种情况：你能上服务器（意味着你可以在服务器上用root用户登录）
```python
# 直接在服务器上运行这条命令
mysqldump -u root -p books > books.sql
# 等他运行结束以后，会生成一个book.sql的文件
# 接下来的问题就是通过scp从服务器上把这个文件弄到你想要的地方了
# 简单

# 下面这条命令在本地运行
sudo scp -r root@43.248.8.11:/home/www/mysqlBackup/books.sql /home

```

### 第二种情况，你不能上服务器，那么你必须有一个对你想要备份的数据库有全部操作权限的账户了。
```python
# 在本地运行以下命令
# 情况很多，没有测试通过
mysqldump --opt -h 43.248.8.11 -u alexHanter -p books > books.sql  
```

### 脑残链接   nc
```python
# 在本地输入：
tar -cvzf - /data/orcl/users01.dbf | nc -l 55555


# 在服务器端输入
nc A_IP 55555 | tar xvzf - -C /tmp
# --注意:-czf 后面有一个-，我曾经忘记写，导致1个文件破坏(切记!!!)。这样解压在B机器的/tmp目录。
# --也可以使用j参数替换z，这样解压缩采用bzip2.
# --另外注意端口不要冲突(也就是没有别的应用软件不使用该端口)。



```
