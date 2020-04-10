# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class BiqugeIndexItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    """图书的基本信息类"""
    # 图书id
    book_id = scrapy.Field()
    # 图书标题
    book_name = scrapy.Field()
    # 图书作者
    book_author = scrapy.Field()
    # 图书状态： 连载中/完结等
    book_status = scrapy.Field()
    # 最后更新时间
    book_last_update_time = scrapy.Field()
    # 最后章节名称
    book_newest_name = scrapy.Field()
    # 最后更新的网址
    book_newest_url = scrapy.Field()
    # 图书的描述
    book_desc = scrapy.Field()


class BiqugeDetailsItem(scrapy.Item):
    """记录图书每一章的内容"""
    # 图书id
    book_id = scrapy.Field()
    # 排序标记
    sort_id = scrapy.Field()
    # 图书该章的标题
    detail_title = scrapy.Field()
    # 图书该张的内容
    detail_content = scrapy.Field()
