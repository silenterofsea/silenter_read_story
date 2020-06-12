1 // 私钥
2 openssl genrsa -out rsa_1024_priv.pem 1024
3 // cat rsa_1024_priv.pem 读取私钥内容
4 // 公钥
5 openssl rsa -pubout -in rsa_1024_priv.pem -out rsa_1024_pub.pem
6 // cat rsa_1024_pub.pem 读取公钥内容
