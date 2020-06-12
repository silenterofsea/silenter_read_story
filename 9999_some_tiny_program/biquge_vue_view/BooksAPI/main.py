from flask import Flask, jsonify, request
from settings import BOOKS_LIST, RSA_1024_PRIV_KEY, SECRET_KEYS
import json
from book import Books
import re
import rsa
import base64
"""
图书接口说明：
1. 返回数据全部为json
2. 结构如下
    {
        resCode： 0,  #  状态码，非0即错
        data: {  # 数据位置
            ...
            ...
        },
        message: '对本次请求的说明'
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

@app.route('/testcrypt', methods=['POST'])
def testcrypt():
    get_data = json.loads(request.get_data(as_text=True))
    cryptdata = get_data['cryptdata']
    print(cryptdata)
    # print(type(cryptdata))
    # with open('rsa_1024_pri.pem', mode='rb') as f:
    #     pri = f.read()
    #     print("pri = ", pri)
    #     print("type(pri) = ", type(pri))
    #     privkey = rsa.PrivateKey.load_pkcs1(pri)
    # print("RSA_1024_PRIV_KEY = ", RSA_1024_PRIV_KEY)
    # print("type(RSA_1024_PRIV_KEY) = ", type(RSA_1024_PRIV_KEY))
    # print(privkey)
    # print(type(privkey))
    privkey = rsa.PrivateKey.load_pkcs1(RSA_1024_PRIV_KEY)
    msg = rsa.decrypt(base64.b64decode(cryptdata), privkey)
    # msg = rsa.decrypt(base64.b64decode(cryptdata), RSA_1024_PRIV_KEY)
    print(msg)

def get_secret_key(cryptdata):
    # print("cryptdata = ", cryptdata)
    privkey = rsa.PrivateKey.load_pkcs1(RSA_1024_PRIV_KEY)
    msg = rsa.decrypt(base64.b64decode(cryptdata), privkey)
    # msg = rsa.decrypt(base64.b64decode(cryptdata), RSA_1024_PRIV_KEY)
    # print("str(msg) = ", msg.decode().split(":")[1])
    return msg.decode().split(":")[1]

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
    print(resData)
    return jsonify(resData)

# 获取图书分类中图书的信息
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
                # print(data)
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

# 获取图书首页的信息的接口
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
                    'data' : data,
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
                    'data' : data,
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

# 获取图书具体某一章的接口
@app.route('/book/<int:book_id>/<int:sort_id>', methods=['GET', 'POST'])
def get_book_cap(book_id, sort_id):
    if request.method == 'POST':
        get_data = json.loads(request.get_data(as_text=True))
        key = get_data['key']
        print(key)
        if key == 'bookdetail':
            id = int(book_id)
            sort = int(sort_id)
            book = Books()
            data = book.get_book_cap_details(id, sort)
            if data == None:
                resData = {
                    'resCode' : 1,  #  状态码，非0即错
                    'data' : [],
                    'message': "参数有误"
                }
                return jsonify(resData)
            else:
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : data[0],
                    'message': "成功"
                }
                return jsonify(resData)
        elif key == 'caps':
            id = int(book_id)
            sort = int(sort_id)
            book = Books()
            # 获取该图书的名字
            book_name = book.get_book_name_by_id(id)
            if book_name == None:
                resData = {
                    'resCode' : 1,  #  状态码，非0即错
                    'data' : [],
                    'message': "参数有误"
                }
                return jsonify(resData)
            else:
                print(type(book_name))
                print("book_name = ", book_name)
                print("book_name[0] = ", book_name[0])
                print(type(book_name[0]))
                print(book_name[0]['book_name'])
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : {
                        "book_id": id,
                        "book_name": book_name[0]['book_name'],
                        "next_id": '',
                        "before_id": ''
                    },
                    'message': "成功"
                }
                # 获取该图书下一章的ID
                next = book.get_next_id(id, sort)
                if next == None:
                    pass
                else:
                    print("next[0]['sort_id'] = ", next[0]['sort_id'])
                    resData['data']['next_id'] = next[0]['sort_id']
                # 获取该图书上一章的ID
                before = book.get_before_id(id, sort)
                if before == None:
                    pass
                else:
                    print("before[0]['sort_id'] = ", before[0]['sort_id'])
                    resData['data']['before_id'] = before[0]['sort_id']
                return jsonify(resData)
        else:
            return 404
    else:
        return 404

# 检查是否含有特殊字符
def is_string_validate(str):
    sub_str = re.sub(u"([^\u4e00-\u9fa5\u0030-\u0039\u0041-\u005a\u0061-\u007a])","",str)
    return len(sub_str)
# 查询接口
@app.route('/search', methods=['POST'])
def search_infos():
    print("开始搜索！")
    if request.method == 'POST':
        get_data = json.loads(request.get_data(as_text=True))
        key = get_data['key']
        print(key)
        if is_string_validate(key) == len(key):
            # 长度一致，说明没有特殊字符，可以开始进数据库搜索了
            book = Books()
            data = book.get_books_infos_by_key(key)
            if data == None:
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : '',
                    'message': "成功"
                }
                return jsonify(resData)
            else:
                print(data[0])
                resData = {
                    'resCode' : 0,  #  状态码，非0即错
                    'data' : data,
                    'message': "成功"
                }
                return jsonify(resData)
        else:
            # 长度不一致，说明有特殊字符
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

@app.route('/content', methods=['POST'])
def get_content():
    get_data = json.loads(request.get_data(as_text=True))
    cryptdata = get_data['secretKey']
    secret_key = get_secret_key(cryptdata)
    if secret_key in SECRET_KEYS:
        print("运行成功")
    else:
        print("运行失败")
    if request.method == 'POST':
        get_data = json.loads(request.get_data(as_text=True))
        key = get_data['key']
        print(key)
        if key == 'home':
            resData = {
                'resCode' : 0,  #  状态码，非0即错
                'data' : {
                    "title":"风华绝代的嗨小说的首页标题",
                    "keywords": "风华绝代的嗨小说的首页关键词",
                    "description": "风华绝代的嗨小说的首页描述词"
                },
                'message': "成功"
            }
            return jsonify(resData)
        elif key == '/xuanhuan':
            resData = {
                'resCode' : 0,  #  状态码，非0即错
                'data' : {
                    "title":"风华绝代的嗨小说的玄幻小说标题",
                    "keywords": "风华绝代的嗨小说的玄幻小说关键词",
                    "description": "风华绝代的嗨小说的玄幻小说描述词"
                },
                'message': "成功"
            }
            return jsonify(resData)
        elif key == 'bookindex':
            resData = {
                'resCode' : 0,  #  状态码，非0即错
                'data' : {
                    "title":"风华绝代的嗨小说的图书首页标题",
                    "keywords": "风华绝代的嗨小说的图书首页关键词",
                    "description": "风华绝代的嗨小说的图书首页描述词"
                },
                'message': "成功"
            }
            return jsonify(resData)
        elif key == 'bookdetail':
            resData = {
                'resCode' : 0,  #  状态码，非0即错
                'data' : {
                    "title":"风华绝代的嗨小说的图书详情页标题",
                    "keywords": "风华绝代的嗨小说的图书详情页关键词",
                    "description": "风华绝代的嗨小说的图书详情页描述词"
                },
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


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
