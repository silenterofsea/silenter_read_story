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



class BiqugePipeline(object):
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

class ImagePipeline(ImagesPipeline):
    def get_media_requests(self, item, info):
        for image_url in item['image_urls']:
            yield scrapy.Request(image_url)

    def item_completed(self, results, item, info):
        image_paths = [x['path'] for ok, x in results if ok]
        if not image_paths:
            raise DropItem("Item contains no images")
        item['image_paths'] = image_paths
        return item

class BiqugeImagesPipeline(ImagesPipeline):

    def get_media_requests(self, item, info):
        if isinstance(item, BiqugeIndexItem):
            if item['image_urls'] is not None:
                yield Request(item['image_urls'])
        else:
            # 执行到这里说明出错，应该写入日志
            return item


    def item_completed(self, results, item, info):
        image_paths = [x['path'] for ok, x in results if ok]
        if not image_paths:
            raise DropItem("Item contains no images")

        item['image_paths'] = image_paths
        return item
