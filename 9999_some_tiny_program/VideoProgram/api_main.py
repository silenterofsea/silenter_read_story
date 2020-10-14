from flask import Flask, jsonify, request
from config import SQLALCHEMY_DATABASE_URI
from flask_sqlalchemy import SQLAlchemy
import pymysql
import requests
import json



app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False
# app.config.from_object(config)
app.config['SQLALCHEMY_DATABASE_URI'] = SQLALCHEMY_DATABASE_URI
db = SQLAlchemy(app)
pymysql.install_as_MySQLdb()


class WebSites(db.Model):
    __tablename__ = 'websites'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    url = db.Column(db.String(128), nullable=False)
    is_activate = db.Column(db.Boolean, default=True, nullable=False)
    title = db.Column(db.String(128))
    keywords = db.Column(db.String(128))
    description = db.Column(db.String(128))
    baidu_code = db.Column(db.String(256))  # 百度统计代码


# 首页
@app.route('/',methods=['GET'])
def index():
    print('url_root = ', request.url_root)
    print('url = ', request.url)
    context = {
        'title':'',
        'keywords':'',
        'description':'',
        'baidu_code':'',
        'cates': [],  # 其中元素：{‘id’:***, 'text':***,'class_details_20':[{***},{***}]}
        'videos':[]
    }

    resp_cates = requests.get('https://shayuapi.com/api.php/provide/vod/at/json/')
    if resp_cates.status_code == 200:
        resp_cates_json = json.loads(resp_cates.text, encoding='utf-8')
        for cate in resp_cates_json.get('class'):
            context['cates'].append(cate)
    resp_latest = requests.get('https://shayuapi.com/api.php/provide/vod/at/json/?ac=detail&h=24')
    if resp_latest.status_code == 200:
        resp_latest_json = json.loads(resp_latest.text, encoding='utf-8')
        for temp in resp_latest_json.get('list'):
            video = {
                'type_id': temp.get('type_id'),
                'type_name': temp.get('type_name'),
                'vod_id': temp.get('vod_id'),
                'vod_name': temp.get('vod_name'),
                'vod_tag': temp.get('vod_tag'),
                'vod_pic': temp.get('vod_pic'),
                'vod_time': temp.get('vod_time'),
                'vod_play_url': temp.get('vod_play_url').split('$')[1]
            }
            context['videos'].append(video)
    return jsonify(context)

def isDigit(x):
    try:
        x=int(x)
        return isinstance(x,int)
    except ValueError:
        return False


# 分类页面, 注意分页 /cate/1?page=2
@app.route('/cate/<int:cate_id>', methods=['GET'])
def cate(cate_id):
    print('url_root = ', request.url_root)
    print('url = ', request.url)
    if isDigit(request.args.get('page')) == False:
        return 'page type error'
    else:
        page = int(request.args.get('page'))
    print("page = ", page)
    context = {
        'title':'',
        'keywords':'',
        'description':'',
        'baidu_code':'',
        'cates': [],  # 其中元素：{‘id’:***, 'text':***,'class_details_20':[{***},{***}]}
        'videos':[]
    }
    cates_ids = []
    pagecount = ''
    resp_cates = requests.get('https://shayuapi.com/api.php/provide/vod/at/json?t='+str(cate_id))
    if resp_cates.status_code == 200:
        resp_cates_json = json.loads(resp_cates.text, encoding='utf-8')
        pagecount = resp_cates_json.get('pagecount')
        for cate in resp_cates_json.get('class'):
            context['cates'].append(cate)
            cates_ids.append(cate.get('type_id'))
    if cate_id not in  cates_ids:
        return 'error id!'
    print('pagecount= ', pagecount)
    if page > pagecount:
        return 'page is biger than pagecount'
    print('detail url = ', 'https://shayuapi.com/api.php/provide/vod/at/json/?ac=detail&pg='+str(pagecount-page)+'&t='+str(cate_id)+'')
    resp_latest = requests.get('https://shayuapi.com/api.php/provide/vod/at/json/?ac=detail&pg='+str(pagecount-page)+'&t='+str(cate_id)+'')
    if resp_latest.status_code == 200:
        resp_latest_json = json.loads(resp_latest.text, encoding='utf-8')
        for temp in resp_latest_json.get('list'):
            video = {
                'type_id': temp.get('type_id'),
                'type_name': temp.get('type_name'),
                'vod_id': temp.get('vod_id'),
                'vod_name': temp.get('vod_name'),
                'vod_tag': temp.get('vod_tag'),
                'vod_pic': temp.get('vod_pic'),
                'vod_time': temp.get('vod_time'),
                'vod_play_url': temp.get('vod_play_url').split('$')[1]
            }
            context['videos'].append(video)
    return jsonify(context)


# 详情页
@app.route('/detail/<int:detail_id>', methods=['GET'])
def detail(detail_id):
    print('url_root = ', request.url_root)
    print('url = ', request.url)
    context = {
        'title':'',
        'keywords':'',
        'description':'',
        'baidu_code':'',
        'cates': [],  # 其中元素：{‘id’:***, 'text':***,'class_details_20':[{***},{***}]}
        'videos':''
    }

    resp_cates = requests.get('https://shayuapi.com/api.php/provide/vod/at/json/')
    if resp_cates.status_code == 200:
        resp_cates_json = json.loads(resp_cates.text, encoding='utf-8')
        for cate in resp_cates_json.get('class'):
            context['cates'].append(cate)
    resp_latest = requests.get('https://shayuapi.com/api.php/provide/vod/at/json/?ac=detail&ids='+ str(detail_id) +'')
    if resp_latest.status_code == 200:
        resp_latest_json = json.loads(resp_latest.text, encoding='utf-8')
        if len(resp_latest_json.get('list')) == 0:
            return 'id error'
        context['video'] = resp_latest_json.get('list')[0]
    return jsonify(context)

# 速度过慢可能抛弃
# @app.route('/', methods=['GET'])
# def index():
#     resp = requests.get('https://shayuapi.com/api.php/provide/vod/at/json/')
#     context = {
#         'title':'',
#         'keywords':'',
#         'description':'',
#         'baidu_code':'',
#         'kinds': [],  # 其中元素：{‘id’:***, 'text':***,'class_details_20':[{***},{***}]}
#     }
#     if resp.status_code == 200:
#         print(type(resp.text))
#         # print(resp.text.decode(encoding='UTF-8'))
#         # print(json.loads(resp.text, encoding='utf-8'))
#         resp_json = json.loads(resp.text, encoding='utf-8')
#         print(type(resp_json))
#         for temp in resp_json.get('class'):
#             print(temp)
#             print(type(temp))
#             kind = {
#                 'id':'',
#                 'text':'',
#                 'kind_details_20':[]
#             }
#             print(temp.get('id'))
#             kind['id'] = temp.get('type_id')
#             kind['text'] = temp.get('type_name')
#             detail_resp = requests.get('https://shayuapi.com/api.php/provide/vod/at/json?ac=detail&t=' + str(temp.get('type_id')))
#             detail_resp_json = json.loads(detail_resp.text, encoding='utf-8')
#             for detail in detail_resp_json.get('list'):
#                 list = {
#                     'type_id':detail.get('type_id'),
#                     'type_name': detail.get('type_name'),
#                     'vod_name': detail.get('vod_name'),
#                     'vod_pic': detail.get('vod_pic'),
#                     'vod_play_url': detail.get('vod_play_url'),
#                     'vod_tag': detail.get('vod_tag'),
#                     'vod_time': detail.get('vod_time')
#                 }
#                 kind['kind_details_20'].append(list)
#             context['kinds'].append(kind)
#         return context
#     return 'Hello Flask'



if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8083, debug=True)
