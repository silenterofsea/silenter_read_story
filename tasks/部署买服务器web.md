## 进入centOS
```python

number=WH36-7OW8-YW36-5TTA secretID=SormxoCKuop5RarB secretKey=246zvAEz7jmTXLlE0ot69b0c9vbEnvjm bash -c "$(curl https://download.zkeys.com/zkeys/zkeys_cloud/install_zkeys.sh)"
# number： 主控序列号
# secretID： Secretld  （你发我的这个是错误的）
# secretKey ：ecretKey
```

## 修改mysql密码： xiaohai1943
```

mysql  #输入后密码为空，可直接回车
UPDATE mysql.user SET password=PASSWORD("密码") where user='root';
flush privileges;
```
## 配置域名
```python
vi /data/app/nginx/conf/nginx.conf +67
systemctl restart nginx
```
