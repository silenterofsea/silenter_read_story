from flask import Flask, jsonify, request, render_template,redirect, url_for
import json
from settings import BOOKS_LIST
from mysqlclass import Books
# pip install Flask-PyMongo 记得安装

app = Flask(__name__)


@app.errorhandler(404)
def handler_404_error(err):  # 必须接受一个参数，名称随意
    """自定义的处理错误的方法"""
    # 这个函数的返回值会是前端用户看到的结果
    return "出现了404错误， 错误信息：{}".format(err)

# 首页接口
@app.route("/index")
@app.route("/")
@app.route("/book")
def index():
    return '<h2>欢迎来到Alex的图书世界</h2>'
# {
# 	"_id" : ObjectId("5e9ebe30ce1379a9e64e33d3"),
# 	"book_id" : 44745,
# 	"book_cate" : "xuanhuan",
# 	"book_name" : "我的系统能具现",
# 	"image_urls" : "https://www.biquge.com.cn/files/article/image/44/44745/44745s.jpg",
# 	"book_author" : "作    者：我要签约",
# 	"book_status" : "状    态：连载中,",
# 	"book_last_update_time" : "最后更新：2020-04-21 14:32:47",
# 	"book_newest_name" : "第一百零二章 极道灭魔，涅槃再生（求订阅月票）",
# 	"book_newest_url" : "/book/44745/446031.html",
# 	"book_desc" : "\n                “我要叶天帝的荒古圣体，肉身无双，金色苦海，仙王异象，苦海种金莲，徒手接帝兵……”“叮咚！”“检测到宿主强烈愿望，大皇天系统激活。”“荒古圣体体质搜索中……”“荒古圣体搜索失败！此方世界并不存在此种体质！”“根据宿主对荒古圣体的理解，荒古圣体创造中……”“荒古圣体奋斗努力目标生成，当前具现进度百分之一。”“有志者事竟成，皇天定不负！”“付出就有回报！”“望宿主多多努力，早日实现奋斗努力目标。”于是……江川飘了，前世幻想当中的各种至强体质神功秘法被他一一具现出来。甚至有时他还加上了自己的独特想法。本书又名《\n\t\t\t",
# 	"image_paths" : "full/e96fb73f82c03827d1f33e05ebe3d0288b39c09b.jpg"
# }

# 分类页接口
@app.route("/<string:book_cate>")
def book_class(book_cate):
    print(book_cate)
    for i in range(len(BOOKS_LIST)):
        if book_cate == BOOKS_LIST[i]:
            print(BOOKS_LIST[i])
            book = Books()
            print(book.show_cate_newest_30(book_cate))
            print(type(book.show_cate_newest_30(book_cate)))
            data = book.show_cate_newest_30(book_cate)
            # return json.dumps(book.show_cate_newest_30(book_cate)).encode('utf-8').decode('unicode_escape')
            cate_list = BOOKS_LIST
            return render_template(
                # 渲染模板语言
                "cate.html",
                title='hello world',
                data = data,
                cate_list=cate_list
            )
    # if book_cate in BOOKS_LIST:
    #     return "OK"
    return book_cate
    # if book_class:
    #     book_cate_info = mongo.db.book_infos.find({'book_cate': book_cate})
    #     if book_cate_info:
    #         return jsonify(book_index_info)
    # else:
    #     return 404

# 图书首页接口
@app.route("/<int:book_id>")
def book_index(book_id):
    if isinstance(book_id, int):
        book = Books()
        data_index = book.show_book_index(book_id)
        data_details = book.show_book_index_details(book_id)
        return render_template(
            "book_index.html",
            data_index=data_index,
            data_details=data_details
        )
    else:
        return 404


# 图书每一章接口
@app.route("/<int:book_id>/<int:book_detail_id>")
def book_detail(book_id, book_detail_id):
    if isinstance(book_id, int) and isinstance(book_detail_id, int):
        book = Books()
        data_detail = book.show_book_detail(book_id, book_detail_id)
        next_detail_id = book.find_next_id(book_id, book_detail_id)
        before_detail_id = book.find_before_id(book_id, book_detail_id)
        next_id = book_id
        before_id = book_id
        if before_detail_id == None:
            pass
        else:
            before_id = before_detail_id

        if next_detail_id == None:
            pass
        else:
            next_id = next_detail_id
        print(data_detail)
        return render_template(
            "book_detail.html",
            data_detail=data_detail,
            next_id = next_id,
            before_id=before_id
        )
    else:
        return 404




if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
