# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
from biquge.items import BiqugeIndexItem, BiqugeDetailsItem
import pymongo
from scrapy.pipelines.images import ImagesPipeline
import os
from scrapy import Request
from scrapy.exceptions import DropItem
import pymysql

"""
图书基本信息： book_infos表中信息
{
	"id" : 自增,
	"book_id" : 45761,
	"book_cate" : "xiuzhen",
	"book_name" : "九叔的掌门大弟子",
	"image_urls" : "https://www.biquge.com.cn/files/article/image/45/45761/45761s.jpg",
	"book_author" : "作    者：莲花山主",
	"book_status" : "状    态：连载中,",
	"book_last_update_time" : "最后更新：2020-04-21 19:06:40",
	"book_newest_name" : "第八十五章：终于到达",
	"book_newest_url" : "/book/45761/447733.html",
	"book_desc" : "\n                携带可成长空间重生清末，成为九叔的掌门大弟子。不断成长，并开山立派。\n\t\t\t",
	"image_paths" : "full/a2a8fbe4a5c01847fb44293891088e1c171bf135.jpg"
}
图书详情页信息： book_details 表中信息
{
	"_id" : ObjectId("5e9edbb0f16879cb082fcb33"),
	"book_id" : 32748,
	"sort_id" : 131839,
	"detail_title" : "第十九章给上门挑衅",
	"detail_content" : "    第十九章给上门挑衅    “放了两个月暑假你以为自己乌鸦变凤凰了？居然敢跟我们这么说话？.....(字数不定)"
}
1. 在数据库中建立一个数据库： create database books charset=utf8;
2. 建立两张表
    2.1 ： create table book_infos(
                id int unsigned not null auto_increment primary key,
                book_id int unsigned not null,
                book_cate varchar(10),  -- 字符串类型，还记得为什么不用var(10)么？
                book_name varchar(25),  -- 图书名称
                image_urls varchar(255), -- 图片原来位置
                book_author varchar(25), -- 图书作者 （需要经过数据清洗）
                book_status varchar(10), -- 图书状态（其实可以用枚举类型）
                book_last_update_time datetime, -- 最后更新时间，（需要经过数据清洗）
                book_newest_name varchar(50), -- 最新章节名称
                book_newest_url varchar(100), -- 最新章节的地址
                book_desc varchar(350), -- 图书描述
                image_paths varchar(50) -- 图片保存路径
            ); 
    2.2 : create table book_details(
                id bigint unsigned not null auto_increment primary key,  -- 想一下这里为什么用bigint
                -- 初始化过程中图书大概有450本，假设每本书有3000章：450X3000，但是这仅仅是初始化的过程。
                -- bigint 0-18446744073709551615 祝你好运
                book_id int unsigned not null,
                sort_id int unsigned not null,  -- 排序标记
                detail_title varchar(50),  -- 该章标题
                detail_content mediumtext  -- 保存内容 
            );
3. 去写代码吧，因为mysql更加严苛，所以先用正则把需要清洗的数据，修改一下
4. 开始写 BiqugeMysqlPipeline 这个类，并在settings中启用它
"""


class BiqugeMysqlPipeline(object):
    def __init__(self, host, database, user, password, port):
        self.host = host
        self.database = database
        self.user = user
        self.password = password
        self.port = port

    @classmethod
    def from_crawler(cls, crawler):
        return cls(
            host=crawler.settings.get('MYSQL_HOST'),
            database=crawler.settings.get('MYSQL_DATABASE'),
            user=crawler.settings.get('MYSQL_USER'),
            password=crawler.settings.get('MYSQL_PASSWORD'),
            port=crawler.settings.get('MYSQL_PORT')
        )
    def open_spider(self, spider):
        self.db = pymysql.connect(self.host, self.user, self.password, self.database, charset='utf8', port=self.port)
        self.cursor = self.db.cursor()

    def close_spider(self, spider):
        self.db.close()

    def process_item(self, item, spider):
        data = dict(item)
        keys = ', '.join(data.keys())
        values = ', '.join(['%s'] * len(data))
        sql = 'insert into %s (%s) values (%s)' % (item.table, keys, values)
        self.cursor.execute(sql, tuple(data.values()))
        self.db.commit()
        return item


class BiqugeMongoPipeline(object):
    def __init__(self, mongo_uri, mongo_db):
        self.mongo_uri = mongo_uri
        self.mongo_db = mongo_db

    @classmethod
    def from_crawler(cls, crawler):
        return cls(
            mongo_uri=crawler.settings.get('MONGO_URI'),
            mongo_db=crawler.settings.get('MONGO_DB')
        )

    def open_spider(self, spider):
        self.client = pymongo.MongoClient(self.mongo_uri)
        self.db = self.client[self.mongo_db]


    def process_item(self, item, spider):
        '''
        1. 如果数据来源不同（有很多个spider爬取而来的时候），那么就用spider来区别
        if spider.name == 'bookspider':
            pass
        elif spider.name == 'afspider':
            pass
        else:
            pass

        2. 如果数据来源一样（来自同一个spider的时候），那么可以用isinstance()来区别
        from items import BiqugeItem
        if isinstance(item, BiqugeItem)
            # 判断传入的item是否符合某个事先定义好的item
            pass
        '''
        # 当前两个数据来子同一个spider，所以我们用第二种方法
        if isinstance(item, BiqugeIndexItem):
            self.db['book_infos'].insert(dict(item))
            return item
        elif isinstance(item, BiqugeDetailsItem):
            self.db['book_details'].insert(dict(item))
            return item
        else:
            # 执行到这里说明出错，应该写入日志
            return item


    def close_spider(self, spider):
        self.client.close()

# class ImagePipeline(ImagesPipeline):
#     def file_path(self, request, response=None, info=None):
#         # 返回文件名，以地址的最后部分作为文件名
#         url = request.url
#         file_name = url.splist('/')[-1]
#         return file_name
#
#     def item_completed(self, results, item, info):
#         image_paths = [x['path'] for ok, x in results if ok]
#         if not image_paths:
#             print('Image Downloader Failed' * 20)
#         return item
#
#     def get_media_requests(self, item, info):
#         if isinstance(item, BiqugeIndexItem):
#             yield Request(item['book_img'])
#         elif isinstance(item, BiqugeDetailsItem):
#             return item
#         else:
#             # 执行到这里说明出错，应该写入日志
#             print("发生未知错误")
#             return item

# class ImagePipeline(ImagesPipeline):
#     def get_media_requests(self, item, info):
#         for image_url in item['image_urls']:
#             yield scrapy.Request(image_url)
#
#     def item_completed(self, results, item, info):
#         image_paths = [x['path'] for ok, x in results if ok]
#         if not image_paths:
#             raise DropItem("Item contains no images")
#         item['image_paths'] = image_paths
#         return item

class BiqugeImagesPipeline(ImagesPipeline):
    """
    这个管道中实现了图片下载，而且如果图片存在并且下载成功，会把图片的在本地的名字
    保存在，image_path这个字段中
    """
    def get_media_requests(self, item, info):
        if isinstance(item, BiqugeIndexItem):
            if item['image_urls'] is not None:
                yield Request(item['image_urls'])
        else:
            pass


    def item_completed(self, results, item, info):
        if isinstance(item, BiqugeDetailsItem):
            print("详情页直接返回")
            return item
        image_paths = [x['path'] for ok, x in results if ok]
        if not image_paths:
            print("没有图片")
        if len(image_paths) > 0:
            item['image_paths'] = image_paths[0]
        return item
