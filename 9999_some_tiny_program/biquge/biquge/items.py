# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

from scrapy import Item, Field


class BiqugeIndexItem(Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    """图书的基本信息类"""
    # 图书id
    book_id = Field()
    # 图书分类
    book_cate = Field()
    # 图书标题
    book_name = Field()
    # 图书图片位置
    image_paths = Field()
    image_urls = Field()  # scrapy 必须有这两个
    images = Field()  # scrapy 必须有这两个
    # 图书作者
    book_author = Field()
    # 图书状态： 连载中/完结等
    book_status = Field()
    # 最后更新时间
    book_last_update_time = Field()
    # 最后章节名称
    book_newest_name = Field()
    # 最后更新的网址
    book_newest_url = Field()
    # 图书的描述
    book_desc = Field()


class BiqugeDetailsItem(Item):
    """记录图书每一章的内容"""
    # 图书id
    book_id = Field()
    # 排序标记
    sort_id = Field()
    # 图书该章的标题
    detail_title = Field()
    # 图书该张的内容
    detail_content = Field()
