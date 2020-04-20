# -*- coding: utf-8 -*-
import scrapy
import re
from copy import deepcopy
from biquge.items import BiqugeIndexItem, BiqugeDetailsItem

class BookspiderSpider(scrapy.Spider):
    name = 'bookspider'
    allowed_domains = ['biquge.com.cn']
    start_urls = [
        'http://www.biquge.com.cn/xuanhuan/'
        # 'http://www.biquge.com.cn/xiuzhen/',
        # 'http://www.biquge.com.cn/dushi/',
        # 'http://www.biquge.com.cn/lishi/',
        # 'http://www.biquge.com.cn/wangyou/',
        # 'http://www.biquge.com.cn/kehuan/',
        # 'http://www.biquge.com.cn/yanqing/',
        # 'http://www.biquge.com.cn/qita/',
        # 'http://www.biquge.com.cn/quanben/'
    ]

    def parse_book_details(self, response):
        '''爬取图书每一页信息'''
        item = BiqugeDetailsItem()
        book_id = response.meta["book_id"]
        sort_id = response.meta["sort_id"]
        item['book_id'] = int(book_id)
        item['sort_id'] = int(sort_id)
        detail_title = response.xpath("//div[@class='bookname']/h1/text()").extract_first()
        # print("detail_title = ", detail_title)
        item['detail_title'] = detail_title
        detail_content = response.xpath("//div[@id='content']/text()").extract()
        detail = ''
        for i in detail_content:
            detail = detail + i
        item["detail_content"] = detail
        # print("detail = ", detail)
        yield item

    def parse_book_info(self, response):
        '''爬取图书基本信息'''
        # # print("开始爬取图书首页的信息")
        # # print(response.body.decode())
        item = BiqugeIndexItem()
        book_id = response.meta["book_id"]
        item["book_id"] = int(book_id)
        book_cate = response.meta["book_cate"]
        item["book_cate"] = book_cate


        book_infos = response.xpath("//div[@id='maininfo']")
        # book_id = book_infos.xpaht("./")
        book_name = book_infos.xpath("./div[@id='info']/h1/text()").extract_first()
        # print(book_name)
        item["book_name"] = book_name
        url = response.xpath("//div[@id='fmimg']/img/@src").extract_first()
        item["image_urls"] = url
        book_author = book_infos.xpath("./div[@id='info']/p[1]/text()").extract_first()
        # print(book_author)
        item["book_author"] = book_author
        book_status = book_infos.xpath("./div[@id='info']/p[2]/text()").extract_first()
        # print(book_status)
        item["book_status"] = book_status
        book_last_update_time = book_infos.xpath("./div[@id='info']/p[3]/text()").extract_first()
        # print(book_last_update_time)
        item["book_last_update_time"] = book_last_update_time
        book_newest_name = book_infos.xpath("./div[@id='info']/p[4]/a/text()").extract_first()
        # print(book_newest_name)
        item["book_newest_name"] = book_newest_name
        book_newest_url = book_infos.xpath("./div[@id='info']/p[4]/a/@href").extract_first()
        # print(book_newest_url)
        item["book_newest_url"] = book_newest_url
        book_desc = book_infos.xpath("./div[@id='intro']/text()").extract_first()
        # print(book_desc)
        item["book_desc"] = book_desc
        book_detail_urls = response.xpath("//div[@class='box_con']/div/dl/dd/a")
        # print(book_detail_urls)
        yield item
        # # print("我在详情页中了。。。")
        for dd in book_detail_urls:
            # # print("我在详情页的for循环中了。。。")
            detail_url = 'http://www.biquge.com.cn' +  dd.xpath("./@href").extract_first()
            sort_id = re.findall(r"(\d+)\.html", dd.xpath("./@href").extract_first())[0]
            # print(sort_id)
            # print(detail_url)
            yield scrapy.Request(
                detail_url,
                callback = self.parse_book_details,
                meta={"book_id": deepcopy(book_id), "sort_id": deepcopy(sort_id)}
            )

    def parse(self, response):
        '''从起始页面爬取需要读取的图书信息'''
        li_list1 = response.xpath("//div[@class='l']/ul/li/span[@class='s2']/a")
        book_cate = re.findall("biquge.com.cn/(.*?)/", response.url)[0]
        for li in li_list1:
            # # print(li.xpath("./@href").extract_first())
            book_index_url = 'http://www.biquge.com.cn' + li.xpath("./@href").extract_first()

            book_id = re.findall(r"\d+\.?\d*", li.xpath("./@href").extract_first())[0]
            # print(book_id)
            # print(book_index_url)
            yield scrapy.Request(
                book_index_url,
                callback = self.parse_book_info,
                meta={"book_id": deepcopy(book_id), "book_cate": book_cate}
            )

        li_list2 = response.xpath("//div[@class='r']/ul/li/span[@class='s2']/a")
        # # print("li_list2 = ", li_list2)
        for li in li_list2:
            # # print(li.xpath("./@href").extract_first())
            book_index_url = 'http://www.biquge.com.cn' + li.xpath("./@href").extract_first()
            book_id = re.findall(r"\d+\.?\d*", li.xpath("./@href").extract_first())[0]
            # print(book_id)
            # print(book_index_url)
            yield scrapy.Request(
                book_index_url,
                callback=self.parse_book_info,
                meta={"book_id": deepcopy(book_id), "book_cate": book_cate}
            )

    def is_book_exist(self):
        pass
