## requests 模拟登录
- 直接携带cookies请求页面
- 找接口发送post请求存储cookies
## selenium 模拟登录
找到相应input标签，输入账户密码，点击click按钮登录

## scrapy 模拟登录
- 直接携带cookies
- 找到post请求，存储cookies
- 使用selenium

```python
# 设置user-agent
class RandomUserAgent(object):
    def process_request(self, request, spider):
        useragent = random.choice(USER_AGENT_LIST)
        request.headers["User-Agent"] = useragent
# 设置代理
class ProxyMiddleware(object):
    def process_request(self, request, spider):
        request.meta["proxy"] = "http://123.23.44.54:9999"
```
