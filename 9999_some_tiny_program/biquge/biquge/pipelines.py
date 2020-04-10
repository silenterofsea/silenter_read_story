# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
from biquge.items import BiqugeIndexItem, BiqugeDetailsItem
import pymongo



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