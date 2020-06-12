import rsa
import base64


# 生成公钥私钥匙的过程
pubkey, privkey = rsa.newkeys(1024)

# pub = base64.encodebytes(pubkey.save_pkcs1())
# pri = base64.encodebytes(privkey.save_pkcs1())
pub = pubkey.save_pkcs1()
pri = privkey.save_pkcs1('PEM')

with open('pubkey.pem', mode='wb') as f, open('privkey.pem', mode='wb') as f1:
    f.write(pub)
    f1.write(pri)

"""
# MIGJAoGBALSm64RyLYSrm0AAS6wqC7Zwj85naaCPIi9WuVJ7KyISBKG76DsRHsOsSUSSoBLZHh6uaAx8DcK7+9TR6DpuraML8fvap4GhKbRNwOtprg7z4ZGpdOY2wT+HUePYGOhWCgT+QsgS7N6eaiTdP+2/MkqK1Q4RuI0mJZY4G89lWho1AgMBAAE=
# MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDC7kw8r6tq43pwApYvkJ5laljaN9BZb21TAIfT/vexbobzH7Q8SUdP5uDPXEBKzOjx2L28y7Xs1d9v3tdPfKI2LR7PAzWBmDMn8riHrDDNpUpJnlAGUqJG9ooPn8j7YNpcxCa1iybOlc2kEhmJn5uwoanQq+CA6agNkqly2H4j6wIDAQAB
"""

"""
with open('pubkey.pem', mode='rb') as f, open('privkey.pem', mode='rb') as f1:
    pub = f.read()
    pri = f1.read()
    pubkey = rsa.PublicKey.load_pkcs1(pub)
    privkey = rsa.PrivateKey.load_pkcs1(pri)

print(pubkey)
print(privkey)
print(type(pubkey))
# print(base64.b64decode(pubkey))
# print(base64.b64decode(privkey))
"""

# 生成RSA公钥和秘钥,经过base64转码
# (pubkey, privkey) = rsa.newkeys(512)

# 经过base64编码
# pubkey = base64.encodebytes(pubkey.save_pkcs1())
# privkey = base64.encodebytes(privkey.save_pkcs1())
