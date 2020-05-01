import requests
import socket
import urllib
import random
from bs4 import BeautifulSoup
from settings import *


class AmazonClass(object):
    def __init__(self):
        self.password = 'aaaBBBccc123!@#'
        self.target_ulr = 'https://www.amazon.com/'
        pass

    def get_email(self):
        # 获取注册邮箱
        pass

    def get_addr(self):
        # 获取注册地址
        pass

    def get_card(self):
        # 获取信用卡号
        pass

    def get_proxy(self):
        # 获取代理IP
        try:
            res = requests.get(PROXY_POOL_URL)
            if res.status_code == 200:
                return res.text
        except Exception:
            return None

    def get_index_html(self, use_url):
        # 打开首页地址，为了获取cookies去注册
        headers = {
            'User-Agent': USER_AGENTS[random.randint(0, 19)]
        }
        resp = requests.get(url=use_url, headers=headers)
        soup = BeautifulSoup(resp.text, 'lxml')
        print(resp.text)
        print(resp.cookies)
        print(resp.status_code)
        # register_url = soup.select('header.nav-opt-sprite.nav-locale-us.nav-lang-zh.nav-ssl.nav-unrec')
        register_url = soup.find('div', id='nav-belt')
        # register_url = soup.find('ul', id='s-results-list-atf') # .find_all("li")
        print(register_url)

    def run(self):
        email = self.get_email()
        addr = self.get_addr()
        card = self.get_card()
        password = self.password
        self.get_index_html(self.target_ulr)

if __name__ == '__main__':
    ac = AmazonClass()
    ac.run()
