import json
import re
from pymysql import connect
from settings import MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE
import datetime

# class DateEncoder(json.JSONEncoder):
#     def default(self, obj):
#         if isinstance(obj, datetime.datetime):
#             return obj.strftime('%Y-%m-%d %H:%M:%S')
#         elif isinstance(obj, date):
#             return obj.strftime("%Y-%m-%d")
#         else:
#             return json.JSONEncoder.default(self, obj)

class Books(object):
    def __init__(self):
        self.conn = connect(host=MYSQL_HOST, port=MYSQL_PORT, user=MYSQL_USER, password=MYSQL_PASSWORD, database=MYSQL_DATABASE, charset='utf8')
        self.cursor=self.conn.cursor()

    def __del__(self):
        self.cursor.close()
        self.conn.close()

    def execute_sql_cate(self, sql):
        data = {}
        books = []
        result = self.cursor.execute(sql)
        for temp in self.cursor.fetchall():
            # print(temp)
            book = {}
            book['id'] = temp[0]
            book['book_id'] = temp[1]
            book['book_cate'] = temp[2]
            book['book_name'] = temp[3]
            book['image_urls'] = temp[4]
            book['book_author'] = temp[5]
            book['book_status'] = temp[6]
            book['book_last_update_time'] = temp[7].strftime('%Y-%m-%d %H:%M:%S')
            book['book_newest_name'] = temp[8]
            book['book_newest_url'] = temp[9]
            middle = temp[10].replace('\n', '<br/>')
            book['book_desc'] = middle.replace('\xa0', '<br/>')
            # book['book_desc'] = temp[10].replace()
            book['image_paths'] = temp[11]
            books.append(book)
        data['code'] = result
        data['books'] = books
        return data

    def show_cate_newest_30(self, cate):
        # 查询不同的分类下 最新更新过的30个文章
        # sql = "select * from book_infos where book_cate = %s order by book_last_update_time limit 30".format(cate)
        # sql = 'select * from book_infos limit 5;'
        sql = "select * from book_infos where book_cate = '{}' order by book_last_update_time limit 30 ;".format(cate)
        data = self.execute_sql_cate(sql)
        # print("data = ", data)
        # print("type(data) = ", type(data))
        # print("time = ", data["books"][0]["book_last_update_time"])
        return data

    def show_book_index(self, book_id):
        sql = "select * from book_infos where book_id = {} ;".format(book_id)
        data = self.execute_sql_cate(sql)
        return data

    def show_book_index_details(self, book_id):
        sql = "select sort_id,detail_title from book_details where book_id = {} order by sort_id;".format(book_id)
        data = {}
        details = []
        result = self.cursor.execute(sql)
        for temp in self.cursor.fetchall():
            # print(temp)
            detail = {}
            detail['sort_id'] = temp[0]
            detail['detail_title'] = temp[1]
            details.append(detail)
        data['code'] = result
        data['details'] = details
        return data

    def show_book_detail(self, book_id, book_detail_id):
        sql = "select * from book_details where book_id={} and sort_id={};".format(book_id, book_detail_id)
        data = {}
        details = []
        result = self.cursor.execute(sql)
        for temp in self.cursor.fetchall():
            # print(temp)
            detail = {}
            detail['book_id'] = temp[1]
            detail['sort_id'] = temp[2]
            detail['detail_title'] = temp[3]
            # result.repalce('\n','<br/>')
            print(type(temp[4]))
            middle = temp[4].replace('\n','<br/>')
            detail['detail_content'] = middle.replace('\xa0','<br/>')
            details.append(detail)
        data['code'] = result
        data['details'] = details
        return data

    def find_next_id(self, book_id, book_detail_id):
        sql = "select sort_id from book_details where book_id={} and sort_id > {} order by sort_id limit 1;".format(book_id, book_detail_id)
        result = self.cursor.execute(sql)
        print("result = ", result)
        # return None
        if result == 0:
            return None
        else:
            data_next = {}
            details = []
            result = self.cursor.execute(sql)
            for temp in self.cursor.fetchall():
                # print(temp)
                detail = {}
                detail['next_id'] = temp[0]
                details.append(detail)
            data_next['code'] = result
            data_next['details'] = details
            return data_next['details'][0]['next_id']

    def find_before_id(self, book_id, book_detail_id):
        sql = "select sort_id from book_details where book_id={} and sort_id < {} order by sort_id desc limit 1;".format(book_id, book_detail_id)
        result = self.cursor.execute(sql)
        print("result = ", result)
        # return None
        if result == 0:
            return None
        else:
            data_before = {}
            details = []
            result = self.cursor.execute(sql)
            for temp in self.cursor.fetchall():
                # print(temp)
                detail = {}
                detail['next_id'] = temp[0]
                details.append(detail)
            data_before['code'] = result
            data_before['details'] = details
            return data_before['details'][0]['next_id']



    def run(self):
        self.show_cate_top_30('xuanhuan')



def main():
    # 1. 创建一个京东商城对象
    books = BookS()
    # 2. 调用这个对象的run方法，让其运行
    books.run()

if __name__ == '__main__':
    main()
