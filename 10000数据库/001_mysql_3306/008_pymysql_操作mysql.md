## 安装pymysql
```bash
pip3 install pymysql
```
## 一般流程

```python
# 导入需要的库
from pymysql import *


def main():
    # 创建Connection连接
    conn = connect(host='localhost', port=3306, user='root', password='qwe123', database='jing_dong', charset='utf8')
    # 获得Cusor对象
    cs1 = conn.cursor()

    # 通过调用游标，来执行sql语句
    #  执行select语句
    sql = 'select id, name from goods where id >15'
    count = cs1.execute(sql)
    # 打印受影响的行数
    print(count)
    ## 如果是增删改，那么需要下面
    # conn.commit()

    # 如果返回了，那么在commit()之前，执行下面语句
    # conn.rollback()
    for i in range(count):
        result = cs1.fetchone()
        print(result)


    # 关闭Cursor对象
    cs1.close()
    conn.close()

if __name__ == '__main__':
    main()
```
## 小例子
```python
from pymysql import connect


class JingDong(object):
    def __init__(self):
        self.conn = connect(host='localhost', port=3306, user='root', password='qwe123', database='jing_dong', charset='utf8')
        self.cursor=self.conn.cursor()

    def __del__(self):
        self.cursor.close()
        self.conn.close()

    def execute_sql(self, sql):
        self.cursor.execute(sql)
        for temp in self.cursor.fetchall():
            print(temp)
    @staticmethod        
    def print_menu():
        print("-----------京东查询-----------")
        print("1: 所有的商品")
        print("2: 所有的商品分类")
        print("3: 所有的品牌分类")
        return input("请输入功能对应的序号")

    def show_all_items(self):
        sql = "select * from goods;"
        self.execute_sql(sql)

    def show_all_cates(self):
        sql = "select * from goods_cates;"
        self.execute_sql(sql)

    def show_all_brands(self):
        sql = "select * from goods_brands;"
        self.execute_sql(sql)
    # def show_all_items(self):
    #     sql = "select * from goods;"
    #     self.cursor.execute(sql)
    #     for temp in self.cursor.fetchall():
    #         print(temp)
    #
    # def show_all_cates(self):
    #     sql = "select name from goods_cates;"
    #     self.cursor.execute(sql)
    #     for temp in self.cursor.fetchall():
    #         print(temp)

    def run(self):
        while True:
            num = self.print_menu()
            if num == "1":
                # 查询所有的商品
                self.show_all_items()
            elif num == "2":
                # 查询分类
                self.show_all_cates()
            elif num == "3":
                # 查询品牌分类
                self.show_all_brands()
            else:
                print("输入有误，请重新输入...")



def main():
    # 1. 创建一个京东商城对象
    jd = JingDong()
    # 2. 调用这个对象的run方法，让其运行
    jd.run()

if __name__ == '__main__':
    main()
```
## 防止注入
' 1=1 or '1

不要相信用户的输入

```python
def get_info_by_name(self, find_name):
    sql = 'select * from goods where name=%s'
    self.cursor.execute(sql, [find_name])
```
