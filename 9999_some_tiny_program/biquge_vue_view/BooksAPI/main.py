from flask import Flask, jsonify, request
from settings import BOOKS_LIST
import json
from book import Books

"""
图书接口说明：
1. 返回数据全部为json
2. 结构如下
    {
        resCode： 0,  #  状态码，非0即错
        data: {  # 数据位置
            ...
            ...
        }
    }
"""


app = Flask(__name__)
# app.config['JSONIFY_MIMETYPE'] ="application/json;charset=utf-8" #指定浏览器渲染的文件类型，和解码格式；
app.config['JSON_AS_ASCII'] = False



@app.errorhandler(404)
@app.errorhandler(405)
def handler_404_error(err):
    """
    自定义的处理错误的方法
    """
    # 这个函数的返回值会是前端用户看到的结果
    # return "出现了404错误， 错误信息：{}".format(err)
    return "你想干哈？"


@app.route('/books_cates')
def books_cate():
    BooksCate = [
      { "id": 0, "text": '首页', "url": '/' },
      { "id": 1, "text": '玄幻', "url": '/xuanhuan' },
      { "id": 2, "text": '修真', "url": '/xiuzhen' },
      { "id": 3, "text": '都市', "url": '/dushi' },
      { "id": 4, "text": '历史', "url": '/lishi' },
      { "id": 5, "text": '网游', "url": '/wangyou' },
      { "id": 6, "text": '科幻', "url": '/kehuan' },
      { "id": 7, "text": '言情', "url": '/yanqing' },
      { "id": 8, "text": '其他', "url": '/qita' },
      { "id": 9, "text": '完本', "url": '/quanben' }
    ]
    resData = {
        'resCode' : 0,  #  状态码，非0即错
        'data' : BooksCate
    }
    return jsonify(resData)

@app.route('/<string:book_cate>', methods=['GET', 'POST'])
def get_cate_infos(book_cate):
    if request.method == 'POST':
        print("捕获到了POST请求: url = ", book_cate)
        # 获取POST请求中的key，根据book_cate和key，去数据库中查询数据
        get_data = json.loads(request.get_data(as_text=True))
        key = get_data['key']
        print("捕获到了key = ", key)
        if key == "newest":
            if book_cate in BOOKS_LIST:
                print("book_cate in BOOKS_LIST1")
                books = Books()
                data = books.get_cate_newest(book_cate)
                print(data)
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : data,
                    'message': "成功"
                }
                return jsonify(resData)
            else:
                resData = {
                    'resCode' : 1,  #  状态码，非0即错
                    'data' : [],
                    'message': "参数有误"
                }
                return jsonify(resData)
        elif key == "most":
            if book_cate in BOOKS_LIST:
                print("book_cate in BOOKS_LIST2")
                books = Books()
                data = books.get_cate_most(book_cate)
                print(data)
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : data,
                    'message': "成功"
                }
                return jsonify(resData)
            else:
                resData = {
                    'resCode' : 1,  #  状态码，非0即错
                    'data' : [],
                    'message': "参数有误"
                }
                return jsonify(resData)
        else:
            resData = {
                'resCode' : 1,  #  状态码，非0即错
                'data' : [],
                'message': "参数有误"
            }
            return jsonify(resData)
    elif request.method == 'GET':
        print("request.args.get(key) = ", request.args.get('key'))
        key = request.args.get('key')
        if key == "newest":
            if book_cate in BOOKS_LIST:
                print("book_cate in BOOKS_LIST1")
                books = Books()
                data = books.get_cate_newest(book_cate)
                print(data)
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : data,
                    'message': "成功"
                }
                return jsonify(resData)
            else:
                resData = {
                    'resCode' : 1,  #  状态码，非0即错
                    'data' : [],
                    'message': "参数有误"
                }
                return jsonify(resData)
        elif key == "most":
            if book_cate in BOOKS_LIST:
                print("book_cate in BOOKS_LIST2")
                books = Books()
                data = books.get_cate_most(book_cate)
                print(data)
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : data,
                    'message': "成功"
                }
                return jsonify(resData)
            else:
                resData = {
                    'resCode' : 1,  #  状态码，非0即错
                    'data' : [],
                    'message': "参数有误"
                }
                return jsonify(resData)
        else:
            resData = {
                'resCode' : 1,  #  状态码，非0即错
                'data' : [],
                'message': "参数有误"
            }
            return jsonify(resData)

    else:
        return 404

@app.route('/book/<int:book_id>', methods=['POST'])
def get_book_index(book_id):
    if request.method == 'POST':
        # 获取POST请求中的key，根据book_cate和key，去数据库中查询数据
        get_data = json.loads(request.get_data(as_text=True))
        key = get_data['key']
        print("捕获到了key = ", key)
        if key == 'bookindex':
            id = int(book_id)
            book = Books()
            if book.is_book_id_exist(id):
                # 这本书存在于数据库
                data = book.get_book_infos(id)
                print(data)
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : data[0],
                    'message': "成功"
                }
                return jsonify(resData)
            else:
                # 这本书不存在于数据库
                resData = {
                    'resCode' : 1,  #  状态码，非0即错
                    'data' : [],
                    'message': "参数有误"
                }
                return jsonify(resData)
        elif key == 'bookcaps':
            id = int(book_id)
            book = Books()
            if book.is_book_id_exist(id):
                # 这本书存在于数据库
                data = book.get_book_caps(id)
                print(data)
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : data[0],
                    'message': "成功"
                }
                return jsonify(resData)
            else:
                # 这本书不存在于数据库
                resData = {
                    'resCode' : 1,  #  状态码，非0即错
                    'data' : [],
                    'message': "参数有误"
                }
                return jsonify(resData)
        elif key == 'newest20caps':
            id = int(book_id)
            book = Books()
            if book.is_book_id_exist(id):
                # 这本书存在于数据库
                data = book.get_book_newest_20_caps(id)
                print(data)
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : data[0],
                    'message': "成功"
                }
                return jsonify(resData)
            else:
                # 这本书不存在于数据库
                resData = {
                    'resCode' : 1,  #  状态码，非0即错
                    'data' : [],
                    'message': "参数有误"
                }
                return jsonify(resData)
        else:
            return 404
    return 404





if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
