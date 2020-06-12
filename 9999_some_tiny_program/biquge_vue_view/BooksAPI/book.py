from pymysql import connect
from pymysql.cursors import DictCursor  # 返回的是json数据（字典）
from settings import MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE


class Books(object):
    def __init__(self):
        self.conn = connect(host=MYSQL_HOST, port=MYSQL_PORT, user=MYSQL_USER, password=MYSQL_PASSWORD, database=MYSQL_DATABASE, charset='utf8')
        self.cursor=self.conn.cursor(DictCursor)  # 返回的是json数据（字典）

    def __del__(self):
        self.cursor.close()
        self.conn.close()

    # def execute_sql_cate(self, sql):
    #     data = {}
    #     books = []
    #     result = self.cursor.execute(sql)

    def get_cate_newest(self, cate):
        sql = "select book_last_update_time,book_name,book_newest_name, book_id,book_newest_url  from book_infos where book_cate = '{}' order by book_last_update_time desc limit 30 ;".format(cate)
        self.cursor.execute(sql)
        data = []
        for temp in self.cursor.fetchall():
            # print(temp)
            data.append(temp)
        return data

    def get_cate_most(self, cate):
        sql = "select book_name,book_author,book_id from book_infos where book_cate = '{}' order by book_author desc limit 30 ;".format(cate)
        self.cursor.execute(sql)
        data = []
        for temp in self.cursor.fetchall():
            # print(temp)
            data.append(temp)
        return data

    def is_book_id_exist(self, book_id):  # 其实这样判断是不对的，应该用布隆过滤
        sql = "select * from book_infos where book_id = '{}' ;".format(book_id)
        res = self.cursor.execute(sql)
        if res == 1:
            return True
        else:
            return False

    def get_book_infos(self, book_id):
        sql = "select * from book_infos where book_id = '{}' ;".format(book_id)
        self.cursor.execute(sql)
        data = []
        for temp in self.cursor.fetchall():
            # print(temp)
            data.append(temp)
        return data

    def get_book_caps(self, book_id):
        sql = "select sort_id,detail_title from book_details where book_id = '{}' order by sort_id;".format(book_id)
        self.cursor.execute(sql)
        data = []
        for temp in self.cursor.fetchall():
            # print(temp)
            data.append(temp)
        return data

    def get_book_newest_20_caps(self, book_id):
        sql = "select sort_id,detail_title from book_details where book_id = '{}' order by sort_id desc limit 20;".format(book_id)
        self.cursor.execute(sql)
        data = []
        for temp in self.cursor.fetchall():
            # print(temp)
            data.append(temp)
        return data

    def get_book_cap_details(self, book_id, book_sort):
        sql = "select * from book_details where book_id = '{}' and sort_id='{}'  limit 1;".format(book_id, book_sort)
        rep = self.cursor.execute(sql)
        if rep == 0:
            return None
        else:
            data = []
            for temp in self.cursor.fetchall():
                # print(temp)
                data.append(temp)
            return data

    def get_book_name_by_id(self, book_id):
        sql = "select book_name from book_infos where book_id = '{}'  limit 1;".format(book_id)
        rep = self.cursor.execute(sql)
        if rep == 0:
            # 说明这个传入的参数有问题，数据库中没有这个图书信息
            return None
        else:
            data = []
            for temp in self.cursor.fetchall():
                # print(temp)
                data.append(temp)
            print(data)
            return data

    def get_next_id(self, book_id, sort_id):
        sql = "select sort_id from book_details where book_id = '{}' and sort_id > '{}' order by sort_id limit 1;".format(book_id, sort_id)
        rep = self.cursor.execute(sql)
        if rep == 0:
            # 说明这个传入的参数有问题，数据库中没有这个图书信息
            return None
        else:
            data = []
            for temp in self.cursor.fetchall():
                # print(temp)
                data.append(temp)
            return data

    def get_before_id(self, book_id, sort_id):
        sql = "select sort_id from book_details where book_id = '{}' and sort_id < '{}' order by sort_id limit 1;".format(book_id, sort_id)
        rep = self.cursor.execute(sql)
        if rep == 0:
            # 说明这个传入的参数有问题，数据库中没有这个图书信息
            return None
        else:
            data = []
            for temp in self.cursor.fetchall():
                # print(temp)
                data.append(temp)
            return data

    def get_books_infos_by_key(self, key):
        sql = "select * from book_infos where book_name = '{}' or book_author='{}';".format(key, key)
        rep = self.cursor.execute(sql)
        if rep == 0:
            # 说明这个传入的参数有问题，数据库中没有这个图书信息
            return None
        else:
            data = []
            for temp in self.cursor.fetchall():
                # print(temp)
                data.append(temp)
            return data

    
