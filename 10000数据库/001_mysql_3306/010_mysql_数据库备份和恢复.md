## mysql数据库的备份和数据恢复
### 重中之重： 你必须有一个能对你想要备份的数据库有全部操作权限的账户，或者你能登录数据库所在的服务器。

## 数据库的备份、 以及如何传输到本地
- github，不行 ： github上最大的单个文件是100M
- 直接用scp，不行： scp传送的最大文件不能超过4G
- nc， 速度快，但是直接传送4G文件中途会断开; 目前我还不知道如何一次性批量传送多个文件： 没有成功

```python
# 直接在服务器上运行这条命令
mysqldump -u root -p books > books.sql
# 等他运行结束以后，会生成一个book.sql的文件
# 接下来的问题就是通过scp从服务器上把这个文件弄到你想要的地方了
# 简单

md5sum books.sql
# 这条命令会生成一个hash值，保存一下

cat books.sql | split -b 250M - sql.books.
# 在服务器上运行上面这个命令会把原来的books.sql 分隔成若干个以sql.books.开头的文件

# 下面这条命令，在本地电脑上运行
scp root@服务器IP:/path/to/books.sql/sql.books.* ./
# 把服务器上所有分割好的文件下载到本地

cat sql.books.* > books.sql
# 把所有已经下载好的、分割好的文件，再次合成同一个文件
md5sum books.sql
# 在本地生成的hash值和服务器上生成的hash值对比一下，如果完全一样，备份结束

```

## 数据恢复 （恢复到本地）

```python
mysql -u root -p
# 登录本地的mysql数据库
create database books;
# 创建一个名为books的数据库
exit;
# 退出数据库

# 下面真的在本地开始恢复数据库
mysql -h localhost -u root -p 本地数据库的名字 < .sql文件的路径

mysql -h localhost -u root -p books< ./books.sql

```
