# Scrapy: 让爬虫更快（多线程）、 更强
- scrapy是一个爬取网站、提取结构化数据的框架
- 模块：
- 框架： 有很多模块
- Twised： (扭曲)  异步请求
-- 异步：
-- 非阻塞： func1是一个耗时操作，如果程序要等待func1执行结束，那么就是阻塞状态;如果程序不等待func1执行结束，那么就是非阻塞状态。如果有func1、2、3...如果都是非阻塞的状态，那么就是异步过程。
- 简单来说，阻塞和非阻塞指的是一个方法，而异步和同步指的是整个过程。

## Scrapy的工作流程 （数据如何流动）

1. url队列 （Scheduler: 其中保存的是request对象、包括数据，代理等等，把request对象传递给Downloader）
2. 发送请求获取响应 （Downloader： 接受到来自Scheduler的request对象，获取到response对象，把response对象传递给Spider）
3. 提取数据、 提取url地址  （Spider： 接受到来自Download的response，提取数据items，传递给Item Pipline; 提取url地址，把url地址组装成request对象，传递给Scheduler）
4. 数据队列，保存数据 （Item Pipeline：接受到Spider传递来的items，清理数据，保存进数据库）

Scrapy Engine: 上面四个模块之间交流全部通过Scrapy Engine，而不是两个模块之间直接交流：解耦合。某个模块有问题，不会影响其他模块。

Download Middlewares: Scrapy Engine 和 Downloader之间的中间件。也就是说不管是Scrapy Engine到Downloader，还是反过来，数据总是先经过Download Middlewares。(可以给response对象做其他操作)

Spider Middlewares: Scrapy Engine 和 Spider之间的中间件。也就是说不管是Scrapy Engine到Spider，还是反过来，数据总是先经过Spider Middlewares。

## 你一般需要写什么？
- Spider ： 你要爬什么
- Item Pileline ： 你要用什么来保存数据
- Download Middlewares ： 添加代理
- Spider Middlewares： 自定义request请求，过滤reponse

## 安装
```python
# 先进入虚拟环境
pip3 install scrapy
# 创建一个scrapy项目
scrapy startproject 项目名
scrapy startproject alexScrapy
cd alexScrapy
# 新建一个爬虫： scrapy genspider 爬虫名字(一般以域名命名，因为域名唯一) 爬虫的域名(用来确定范围)
scrapy genspider itcast itcast.cn
# 启动爬虫： scrapy crewl 爬虫名字
scrapy crewl itcast
# 输出信息较多，我们可以在 settings.py 文件中添加一行
LOG_LEVEL = "WARNING"
# 使用pipeline要在 settings.py 中去掉注释
"""
ITEM_PIPELINES = {
   'jimSpider.pipelines.JimspiderPipeline': 300,
}
# 可以定义多个pipeline，数字越小，那么越靠近Scrapy Engine
# 换句话说，谁数字小，数据先经过谁
# 自定义爬虫文件中的， parse方法不能修改名字
# pipelines.py文件中的process_item方法不能修改名字
# 为什么需要多个pipeline？？？
# 因为用scrapy的时候经常不是只使用一个spider的
# 因此爬取下来的内容可能会需要不同的pipeline来处理
# 如何区别是由哪个爬虫传进去的item呢？
# spider.name中包含了，传入的item的spider的名字，可以根据这个来判断
"""
```
## logging 模块的使用
- 在settings.py 中设置 LOG_LEVEL = "WARNING"，这样只有大于warning的才会输出
- 在settings.py 中设置 LOG_FILE = "./log.log" ,如果你设置了这步，那么在终端中不会有输出，只会输出在log.log这个文件中

```python
import logging

# 创建一个logger实例，并且把”当前文件名字”作为参数传给他，就是为了区别这个log来自哪个文件
logger = logging.getLogger(__name__)
# loggin 是python内置的一个模块，可以直接使用
# 你可以把这个当成是print(),只不过这个logging会写入一个文件
logging.warning()
logging.debug()
logging.info()
```

普通项目中使用
```python
import logging
logging.basicConfig(...)  # 网上找
logger = logging.getLogger(__name__)
# 然后你在任何py文件中条用looger即可
```
## item.py 的定义
```python
1. 如果页面中有tbody要小心，这个tbody很肯能在页面中是没有的。
2. isinstance(item, myspideritem), 可以用这个方法来判断是否符合某个定义好的item，这样也可以用来区分不同的item不同的处理。
3. 使用定义的item需要先导入item
```

## Scrapy 中的DEBUG信息

## Scrapy Shell： 方法或者参数用法不明的时候，可以在这里调试
```bash
# 进入的语法： scrapy shell 你要爬取的完整url地址
```
## Scrapy Setting.py
