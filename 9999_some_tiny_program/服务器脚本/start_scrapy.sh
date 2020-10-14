#! /bin/bash
ps -ef |grep scrapy |grep -v grep
if [ $? -ne 0 ];then
    echo "start process....."
else
    nohup scrapy crawl bookspider  >> bookspider.log 2>&1 &
fi


while :
do
    jobs -l | grep 2bookspider | grep Done
    if [ $? -ne 0 ];then
        # 如果查询为空，执行下面语句
        echo "并没有已经完成的2bookspider，所以这里什么都不做"
        # cd /home/programs/2biquge
        # rm -rf 2bookspider.log
        # source scrapy_lenv/bin/activate
        # nohup scrapy crawl bookspider  >> 2bookspider.log 2>&1 &
        # jobs -l
    else
        # do nothing
        echo "有已经完成的2bookspider，需要kill这个进程"
        ppp=$(jobs -l | grep 2bookspider | grep Done | gawk '{print $2}')
        echo "需要kill的pid = " $ppp
        kill -9 $ppp
        jobs -l
        jobs -l
    fi

    jobs -l | grep 2bookspider | grep -v Done
    if [ $? -ne 0 ];then
        # 如果查询为空，执行下面语句
        cd /home/programs/2biquge
        rm -rf 2bookspider.log
        source scrapy_lenv/bin/activate
        nohup scrapy crawl bookspider  >> 2bookspider.log 2>&1 &
        jobs -l
    else
        # do nothing
        echo "do nothing"
    fi

    jobs -l | grep 0bookspider | grep Done
    if [ $? -ne 0 ];then
        # 如果查询为空，执行下面语句
        echo "并没有已经完成的0bookspider，所以这里什么都不做"
        # cd /home/programs/2biquge
        # rm -rf 2bookspider.log
        # source scrapy_lenv/bin/activate
        # nohup scrapy crawl bookspider  >> 2bookspider.log 2>&1 &
        # jobs -l
    else
        # do nothing
        echo "有已经完成的0bookspider，需要kill这个进程"
        ppp=$(jobs -l | grep 0bookspider | grep Done | gawk '{print $2}')
        echo "需要kill的pid = " $ppp
        kill -9 $ppp
        jobs -l
        jobs -l
    fi

    jobs -l | grep 0bookspider | grep -v Done
    if [ $? -ne 0 ];then
        cd /home/programs/biquge
        rm -rf 0bookspider.log
        source scrapy_lenv/bin/activate
        nohup scrapy crawl bookspider  >> 0bookspider.log 2>&1 &
        jobs -l
    else
        # do nothing
        echo "do nothing"
    fi

    jobs -l | grep 1bookspider | grep Done
    if [ $? -ne 0 ];then
        # 如果查询为空，执行下面语句
        echo "并没有已经完成的1bookspider，所以这里什么都不做"
        # cd /home/programs/2biquge
        # rm -rf 2bookspider.log
        # source scrapy_lenv/bin/activate
        # nohup scrapy crawl bookspider  >> 2bookspider.log 2>&1 &
        # jobs -l
    else
        # do nothing
        echo "有已经完成的bookspider，需要kill这个进程"
        ppp=$(jobs -l | grep 1bookspider | grep Done | gawk '{print $2}')
        echo "需要kill的pid = " $ppp
        kill -9 $ppp
        jobs -l
        jobs -l
    fi

    jobs -l | grep 1bookspider | grep -v Done
    if [ $? -ne 0 ];then
        cd /home/programs/1biquge
        rm -rf 1bookspider.log
        source scrapy_lenv/bin/activate
        nohup scrapy crawl bookspider  >> 1bookspider.log 2>&1 &
        jobs -l
    else
        # do nothing
        echo "do nothing"
    fi

    echo "休息5分钟"
    sleep 300  #等3秒后执行下一条
done
