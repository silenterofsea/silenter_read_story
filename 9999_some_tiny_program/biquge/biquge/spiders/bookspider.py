# -*- coding: utf-8 -*-
import scrapy
import re

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
        detail_title = response.xpath("//div[@class='bookname']/h1/text()").extract_first()
        print("detail_title = ", detail_title)
        detail_content = response.xpath("//div[@id='content']/text()").extract()
        detail = ''
        for i in detail_content:
            detail = detail + i

        print("detail = ", detail)

    def parse_book_info(self, response):
        '''爬取图书基本信息'''
        # print("开始爬取图书首页的信息")
        # print(response.body.decode())
        book_infos = response.xpath("//div[@id='maininfo']")
        # book_id = book_infos.xpaht("./")
        book_name = book_infos.xpath("./div[@id='info']/h1/text()").extract_first()
        print(book_name)
        book_author = book_infos.xpath("./div[@id='info']/p[1]/text()").extract_first()
        print(book_author)
        book_status = book_infos.xpath("./div[@id='info']/p[2]/text()").extract_first()
        print(book_status)
        book_last_update_time = book_infos.xpath("./div[@id='info']/p[3]/text()").extract_first()
        print(book_last_update_time)
        book_newest_name = book_infos.xpath("./div[@id='info']/p[4]/a/text()").extract_first()
        print(book_newest_name)
        book_newest_url = book_infos.xpath("./div[@id='info']/p[4]/a/@href").extract_first()
        print(book_newest_url)
        book_desc = book_infos.xpath("./div[@id='intro']/text()").extract_first()
        print(book_desc)
        book_detail_urls = response.xpath("//div[@class='box_con']/div/dl/dd/a")
        print(book_detail_urls)
        # print("我在详情页中了。。。")
        for dd in book_detail_urls:
            # print("我在详情页的for循环中了。。。")
            detail_url = 'http://www.biquge.com.cn' +  dd.xpath("./@href").extract_first()
            print(detail_url)
            yield scrapy.Request(
                detail_url,
                callback = self.parse_book_details
            )

    def parse(self, response):
        '''从起始页面爬取需要读取的图书信息'''
        li_list1 = response.xpath("//div[@class='l']/ul/li/span[@class='s2']/a")
        for li in li_list1:
            # print(li.xpath("./@href").extract_first())
            book_index_url = 'http://www.biquge.com.cn' + li.xpath("./@href").extract_first()
            book_id = re.findall(r"\d+\.?\d*", li.xpath("./@href").extract_first())[0]
            print(book_id)
            print(book_index_url)
            yield scrapy.Request(
                book_index_url,
                callback = self.parse_book_info
            )

        li_list2 = response.xpath("//div[@class='r']/ul/li/span[@class='s2']/a")
        # print("li_list2 = ", li_list2)
        for li in li_list2:
            # print(li.xpath("./@href").extract_first())
            book_index_url = 'http://www.biquge.com.cn' + li.xpath("./@href").extract_first()
            book_id = re.findall(r"\d+\.?\d*", li.xpath("./@href").extract_first())[0]
            print(book_id)
            print(book_index_url)
            yield scrapy.Request(
                book_index_url,
                callback=self.parse_book_info
            )

    def is_book_exist(self):
        pass



