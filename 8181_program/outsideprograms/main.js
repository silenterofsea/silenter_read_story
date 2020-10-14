p 页码,翻页
wd 关键词
cid 分类id
翻页参数是p
p=2 就是第二页


内容接收参数：
参数 ids=数据ID，多个ID逗号分割。
     t=类型ID
     pg=页码
     h=几小时内的数据

列表接收参数：
ac=list
t=类别ID
pg=页码
wd=搜索关键字
h=几小时内的数据
例如： http://域名/api.php/provideod?ac=list&t=1&pg=5   分类ID为1的列表数据第5页

采集地址：https://shayuapi.com/api.php/provide/vod/at/json/
视频列表地址：https://shayuapi.com/api.php/provide/vod/at/json/?ac=list
视频详情地址：https://shayuapi.com/api.php/provide/vod/at/json/?ac=detail
解析接口：https://shayujx.com/?url=


详情页接口：（有分类信息，没有视频链接）
https://shayuapi.com/api.php/provide/vod/at/json/?ids=41092
{
    "code":1,
    "msg":"数据列表",
    "page":1,
    "pagecount":1,
    "limit":"20",
    "total":1,
    "list":[
        {
            "vod_id":41092,
            "vod_name":"来吧爱的盛宴",
            "type_id":27,
            "type_name":"韩国伦理",
            "vod_en":"laibaaideshengyan",
            "vod_time":"2020-10-12 04:20:15",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        }
    ],
    "class":[
        {
            "type_id":1,
            "type_name":"国产情色"
        },
        {
            "type_id":2,
            "type_name":"日本无码"
        },
        {
            "type_id":3,
            "type_name":"日本有码"
        },
        {
            "type_id":20,
            "type_name":"中文字幕"
        },
        {
            "type_id":21,
            "type_name":"网红主播"
        },
        {
            "type_id":22,
            "type_name":"成人动漫"
        },
        {
            "type_id":23,
            "type_name":"欧美情色"
        },
        {
            "type_id":24,
            "type_name":"国模私拍"
        },
        {
            "type_id":25,
            "type_name":"长腿丝袜"
        },
        {
            "type_id":26,
            "type_name":"邻家人妻"
        },
        {
            "type_id":27,
            "type_name":"韩国伦理"
        },
        {
            "type_id":28,
            "type_name":"香港伦理"
        },
        {
            "type_id":31,
            "type_name":"精品推荐"
        }
    ]
}
https://shayuapi.com/api.php/provide/vod/at/json/?ac=detail&ids=41092 
参数说明：	ids=41092	具体视频的ID
返回结果： （没有分类信息，有视频链接）
{
    "code":1,
    "msg":"数据列表",
    "page":1,
    "pagecount":1,
    "limit":"20",
    "total":1,
    // 具体视频的信息
    "list":[
        {
            "vod_id":41092,
            "type_id":27,
            "type_id_1":0,
            "group_id":0,
            "vod_name":"来吧爱的盛宴",
            "vod_sub":"",
            "vod_en":"laibaaideshengyan",
            "vod_status":1,
            "vod_letter":"L",
            "vod_color":"",
            "vod_tag":"",
            "vod_class":"韩国伦理",
            "vod_pic":"https://pic.cnsypic.com/pic/20200817KR-lunli/b113vdHO.png",
            "vod_pic_thumb":"[db:缩略图]",
            "vod_pic_slide":"",
            "vod_actor":"",
            "vod_director":"",
            "vod_writer":"",
            "vod_behind":"",
            "vod_blurb":"",
            "vod_remarks":"",
            "vod_pubdate":"",
            "vod_total":0,
            "vod_serial":"0",
            "vod_tv":"",
            "vod_weekday":"",
            "vod_area":"",
            "vod_lang":"",
            "vod_year":"0",
            "vod_version":"",
            "vod_state":"",
            "vod_author":"",
            "vod_jumpurl":"",
            "vod_tpl":"",
            "vod_tpl_play":"",
            "vod_tpl_down":"",
            "vod_isend":0,
            "vod_lock":0,
            "vod_level":0,
            "vod_copyright":0,
            "vod_points":0,
            "vod_points_play":0,
            "vod_points_down":0,
            "vod_hits":470,
            "vod_hits_day":851,
            "vod_hits_week":400,
            "vod_hits_month":596,
            "vod_duration":"",
            "vod_up":718,
            "vod_down":844,
            "vod_score":"10.0",
            "vod_score_all":7520,
            "vod_score_num":752,
            "vod_time":"2020-10-12 04:20:15",
            "vod_time_add":1602447615,
            "vod_time_hits":0,
            "vod_time_make":0,
            "vod_trysee":0,
            "vod_douban_id":0,
            "vod_douban_score":"0.0",
            "vod_reurl":"",
            "vod_rel_vod":"",
            "vod_rel_art":"",
            "vod_pwd":"",
            "vod_pwd_url":"",
            "vod_pwd_play":"",
            "vod_pwd_play_url":"",
            "vod_pwd_down":"",
            "vod_pwd_down_url":"",
            "vod_content":"",
            "vod_play_from":"sym3u8",
            "vod_play_server":"",
            "vod_play_note":"",
            "vod_play_url":"在线播放$https://3sybf.com/20200817/b113vdHO/index.m3u8",
            "vod_down_from":"",
            "vod_down_server":"",
            "vod_down_note":"",
            "vod_down_url":"",
            "vod_plot":0,
            "vod_plot_name":"",
            "vod_plot_detail":"",
            "type_name":"韩国伦理"
        }
    ]
}

分类页接口：
https://shayuapi.com/api.php/provide/vod/at/json/?ac=list&cid=1&pg=2
参数说明：	ac=list: 	查询分类页面信息
			cid=1: 		分类页面ID
			pg=2： 		第几页 
返回结果：
{
    "code":1,
    "msg":"数据列表",
    "page":"2",
    "pagecount":1982,
    "limit":"20",
    "total":39640,
    "list":[
        {
            "vod_id":41072,
            "vod_name":"[欧美主播外流]超垂大奶揉揉捏捏~女女蕾丝边自慰舔奶大秀",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiuchaochuidanairourounienienvnvleisibianziweitiannaidaxiu",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41071,
            "vod_name":"[欧美主播外流]妈妈和隔壁的阿姨每晚都打得火热~爱情如火",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiumamahegebideayimeiwandudadehuoreaiqingruhuo",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41070,
            "vod_name":"[欧美主播外流]小模为了生活下海直播情色视讯不想咬咬还是只能忍",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiuxiaomoweiliaoshenghuoxiahaizhiboqingseshixunbuxiangyaoyaohuanshizhinengren",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41069,
            "vod_name":"[欧美主播外流]你抽烟我插屌~各取所需有爽就好~主逼找炮友干炮直播流出！！",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiunichouyanwochadiaogequsuoxuyoushuangjiuhaozhubizhaopaoyouganpaozhiboliuchu",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41068,
            "vod_name":"[欧美主播外流]巨乳大妈的跳蛋与肉棒的第一类接触！！逼逼被呻吟到高潮浪叫！！",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiujurudamadetiaodanyuroubangdediyileijiechubibibeishenyindaogaochaolangjiao",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41067,
            "vod_name":"[欧美主播外流]骚气主播姐妹大秀~全裸自插无限呻吟~就算爽到头发乱了也没关系~",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiusaoqizhubojiemeidaxiuquanluozichawuxianshenyinjiusuanshuangdaotoufaluanliaoyemeiguanxi",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41066,
            "vod_name":"[欧美主播外流]外围嫩模私拍系列！！极品收费自拍视频玩弄小逼逼给你看~",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiuwaiweinenmosipaixiliejipinshoufeizipaishipinwannongxiaobibigeinikan",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41065,
            "vod_name":"[中字]巨乳潜入捜査官 佐山爱",
            "type_id":20,
            "type_name":"中文字幕",
            "vod_en":"zhongzijuruqianrusouchaguanzuoshanai",
            "vod_time":"2020-10-12 04:18:21",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41064,
            "vod_name":"[中字]潜入捜査官 水嶋杏树",
            "type_id":20,
            "type_name":"中文字幕",
            "vod_en":"zhongziqianrusouchaguanshuidaoxingshu",
            "vod_time":"2020-10-12 04:18:21",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41063,
            "vod_name":"[中字]ズコバコ超乱交 初川みなみ",
            "type_id":20,
            "type_name":"中文字幕",
            "vod_en":"zhongzichaoluanjiaochuchuan",
            "vod_time":"2020-10-12 04:18:21",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41062,
            "vod_name":"【初撮り】ネットでAV応募→AV体験撮影",
            "type_id":3,
            "type_name":"日本有码",
            "vod_en":"chucuoAVyingmuAVtiyancuoying",
            "vod_time":"2020-10-12 04:17:11",
            "vod_remarks":"SIRO-3675",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41061,
            "vod_name":"温泉でホテった私の身体をさらに燃え上がらせてちょうだい",
            "type_id":3,
            "type_name":"日本有码",
            "vod_en":"wenquansishentiranshang",
            "vod_time":"2020-10-12 04:17:11",
            "vod_remarks":"010919-834-CARIB",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41060,
            "vod_name":"いくらでラブホ！？ 素人美女はいくら払えば即ラブホOKなのか。ナンパ検証してみた！！ 02",
            "type_id":3,
            "type_name":"日本有码",
            "vod_en":"surenmeinvfanjiOKjianzheng02",
            "vod_time":"2020-10-12 04:17:11",
            "vod_remarks":"DNW-014-A",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41059,
            "vod_name":"りょうこ \/ ガニ股立ちオナ \/ B: 85 W: 60 H: 90",
            "type_id":2,
            "type_name":"日本无码",
            "vod_en":"guliB85W60H90",
            "vod_time":"2020-10-12 04:16:55",
            "vod_remarks":"NYOSHIN_N1734",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41058,
            "vod_name":"かな \/ 潮吹き挑戦！いろんな角度で 吹いてみた \/ B: 84 W: 56 H: 87",
            "type_id":2,
            "type_name":"日本无码",
            "vod_en":"chaochuitiaozhanjiaoduchuiB84W56H87",
            "vod_time":"2020-10-12 04:16:55",
            "vod_remarks":"NYOSHIN_N1730",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41057,
            "vod_name":"しずか \/ あなたのおかずにしてください",
            "type_id":2,
            "type_name":"日本无码",
            "vod_en":"",
            "vod_time":"2020-10-12 04:16:55",
            "vod_remarks":"NYOSHIN_N1718",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41056,
            "vod_name":"音乐学院的兼职穿着上衣感觉很诱惑，丰满奶子骚翘臀，口活很棒上位主动，浪叫不断",
            "type_id":1,
            "type_name":"国产情色",
            "vod_en":"yinlexueyuandejianzhichuanzhuoshangyiganjuehenyouhuofengmannaizisaoqiaotunkouhuohenbangshangweizhudonglangjiaobuduan",
            "vod_time":"2020-10-12 04:16:12",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41055,
            "vod_name":"私立VIP病房里还有性感的小护士可以啪啪啪,有这种护士姐姐待候我这病人,爽啊",
            "type_id":1,
            "type_name":"国产情色",
            "vod_en":"siliVIPbingfanglihuanyouxinggandexiaohushikeyipapapayouzhezhonghushijiejiedaihouwozhebingrenshuanga",
            "vod_time":"2020-10-12 04:16:12",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41054,
            "vod_name":"约炮175cm极品身材学院派校花美女,卧室干到浴室入穴",
            "type_id":1,
            "type_name":"国产情色",
            "vod_en":"yuepao175cmjipinshencaixueyuanpaixiaohuameinvwoshigandaoyushiruxue",
            "vod_time":"2020-10-12 04:16:12",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41053,
            "vod_name":"败家黑丝美女嗜赌如命找老板贷款10万为了多贷点以肉体服务啪啪问她哪爽她说逼爽",
            "type_id":1,
            "type_name":"国产情色",
            "vod_en":"baijiaheisimeinvshidurumingzhaolaobandaikuan10wanweiliaoduodaidianyiroutifuwupapawentanashuangtashuobishuang",
            "vod_time":"2020-10-12 04:16:12",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        }
    ],
    "class":[
        {
            "type_id":1,
            "type_name":"国产情色"
        },
        {
            "type_id":2,
            "type_name":"日本无码"
        },
        {
            "type_id":3,
            "type_name":"日本有码"
        },
        {
            "type_id":20,
            "type_name":"中文字幕"
        },
        {
            "type_id":21,
            "type_name":"网红主播"
        },
        {
            "type_id":22,
            "type_name":"成人动漫"
        },
        {
            "type_id":23,
            "type_name":"欧美情色"
        },
        {
            "type_id":24,
            "type_name":"国模私拍"
        },
        {
            "type_id":25,
            "type_name":"长腿丝袜"
        },
        {
            "type_id":26,
            "type_name":"邻家人妻"
        },
        {
            "type_id":27,
            "type_name":"韩国伦理"
        },
        {
            "type_id":28,
            "type_name":"香港伦理"
        },
        {
            "type_id":31,
            "type_name":"精品推荐"
        }
    ]
}

首页接口：
https://shayuapi.com/api.php/provide/vod/at/json/
返回结果：
{
    "code":1,
    "msg":"数据列表",
    "page":1,
    "pagecount":1982,
    "limit":"20",
    "total":39640,
    // 最新更新的20部视频
    "list":[
        {
            "vod_id":41092,
            "vod_name":"来吧爱的盛宴",
            "type_id":27,
            "type_name":"韩国伦理",
            "vod_en":"laibaaideshengyan",
            "vod_time":"2020-10-12 04:20:15",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41091,
            "vod_name":"周边旅馆",
            "type_id":27,
            "type_name":"韩国伦理",
            "vod_en":"zhoubianlvguan",
            "vod_time":"2020-10-12 04:20:15",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41090,
            "vod_name":"至尊卡的服务",
            "type_id":27,
            "type_name":"韩国伦理",
            "vod_en":"zhizunkadefuwu",
            "vod_time":"2020-10-12 04:20:15",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41089,
            "vod_name":"抓住好吃的",
            "type_id":27,
            "type_name":"韩国伦理",
            "vod_en":"zhuazhuhaochide",
            "vod_time":"2020-10-12 04:20:15",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41088,
            "vod_name":"演播室的故事",
            "type_id":27,
            "type_name":"韩国伦理",
            "vod_en":"yanboshidegushi",
            "vod_time":"2020-10-12 04:20:15",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41087,
            "vod_name":"出租欧巴桑任肏到中出43",
            "type_id":26,
            "type_name":"邻家人妻",
            "vod_en":"chuzuoubasangrencaodaozhongchu43",
            "vod_time":"2020-10-12 04:19:53",
            "vod_remarks":"MEKO-110",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41086,
            "vod_name":"搭讪欲求不满熟女妻肏到湿！28",
            "type_id":26,
            "type_name":"邻家人妻",
            "vod_en":"dashanyuqiubumanshunvqicaodaoshi28",
            "vod_time":"2020-10-12 04:19:53",
            "vod_remarks":"MEKO-111",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41085,
            "vod_name":"会员制人妻玄関ピンサロワタシのお口で気持ちよくしてあげる2",
            "type_id":26,
            "type_name":"邻家人妻",
            "vod_en":"huiyuanzhirenqixuanguankouqichi2",
            "vod_time":"2020-10-12 04:19:53",
            "vod_remarks":"AQMB-010",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41084,
            "vod_name":"ネットでAV応!募→AV体験撮影302",
            "type_id":25,
            "type_name":"长腿丝袜",
            "vod_en":"AVyingmuAVtiyancuoying302",
            "vod_time":"2020-10-12 04:19:36",
            "vod_remarks":"SIRO-3064",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41083,
            "vod_name":"カリビアンコムプ^レミアム040517_002性欲旺盛な淫乱むすめの事情",
            "type_id":25,
            "type_name":"长腿丝袜",
            "vod_en":"040517002xingyuwangshengyinluanshiqing",
            "vod_time":"2020-10-12 04:19:36",
            "vod_remarks":"040517_002",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41082,
            "vod_name":"捏你奶头强制内射骑乘位高!挑癡女OL篇若菜奈央",
            "type_id":25,
            "type_name":"长腿丝袜",
            "vod_en":"nieninaitouqiangzhineisheqichengweigaotiaochinvOLpianruocainaiyang",
            "vod_time":"2020-10-12 04:19:36",
            "vod_remarks":"TYOD-346",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41081,
            "vod_name":"My Step Sisters Gift",
            "type_id":23,
            "type_name":"欧美情色",
            "vod_en":"MyStepSistersGift",
            "vod_time":"2020-10-12 04:19:20",
            "vod_remarks":"NUBILES-PORN_2019-09-07_MY_STEP_SISTERS_GIFT",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41080,
            "vod_name":"Can We Make It Up To You?",
            "type_id":23,
            "type_name":"欧美情色",
            "vod_en":"CanWeMakeItUpToYou",
            "vod_time":"2020-10-12 04:19:20",
            "vod_remarks":"TUSHY_2019-09-14_CAN_WE_MAKE_IT_UP_TO_YOU",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41079,
            "vod_name":"Take Your Shot",
            "type_id":23,
            "type_name":"欧美情色",
            "vod_en":"TakeYourShot",
            "vod_time":"2020-10-12 04:19:20",
            "vod_remarks":"NUBILEFILMS_2019-09-07_TAKE_YOUR_SHOT",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41078,
            "vod_name":"中字无码-双子母性本能1",
            "type_id":22,
            "type_name":"成人动漫",
            "vod_en":"zhongziwumashuangzimuxingbenneng1",
            "vod_time":"2020-10-12 04:19:04",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41077,
            "vod_name":"中字-少女们的茶道性爱",
            "type_id":22,
            "type_name":"成人动漫",
            "vod_en":"zhongzishaonvmendechadaoxingai",
            "vod_time":"2020-10-12 04:19:04",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41076,
            "vod_name":"中字-令人心动的房东小姐姐1",
            "type_id":22,
            "type_name":"成人动漫",
            "vod_en":"zhongzilingrenxindongdefangdongxiaojiejie1",
            "vod_time":"2020-10-12 04:19:04",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41075,
            "vod_name":"[欧美主播外流]衬衫下的绝赞胸器！！奶都比他的脸还大了！！",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiuchenshanxiadejuezanxiongqinaidubitadelianhuandaliao",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41074,
            "vod_name":"[欧美主播外流]一看就是未成年，超纤细女孩直播，好像吃了药，一直摇头晃脑",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiuyikanjiushiweichengnianchaoxianxinvhaizhibohaoxiangchiliaoyaoyizhiyaotouhuangnao",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        },
        {
            "vod_id":41073,
            "vod_name":"[欧美主播外流]藏不住的巨乳~媚眼正妹顶着巨乳在床上上用湿穴勾引你",
            "type_id":21,
            "type_name":"网红主播",
            "vod_en":"oumeizhubowailiucangbuzhudejurumeiyanzhengmeidingzhuojuruzaichuangshangshangyongshixuegouyinni",
            "vod_time":"2020-10-12 04:18:40",
            "vod_remarks":"",
            "vod_play_from":"sym3u8"
        }
    ],
    // 分类页面 
    "class":[
        {
            "type_id":1,
            "type_name":"国产情色"
        },
        {
            "type_id":2,
            "type_name":"日本无码"
        },
        {
            "type_id":3,
            "type_name":"日本有码"
        },
        {
            "type_id":20,
            "type_name":"中文字幕"
        },
        {
            "type_id":21,
            "type_name":"网红主播"
        },
        {
            "type_id":22,
            "type_name":"成人动漫"
        },
        {
            "type_id":23,
            "type_name":"欧美情色"
        },
        {
            "type_id":24,
            "type_name":"国模私拍"
        },
        {
            "type_id":25,
            "type_name":"长腿丝袜"
        },
        {
            "type_id":26,
            "type_name":"邻家人妻"
        },
        {
            "type_id":27,
            "type_name":"韩国伦理"
        },
        {
            "type_id":28,
            "type_name":"香港伦理"
        },
        {
            "type_id":31,
            "type_name":"精品推荐"
        }
    ]
}