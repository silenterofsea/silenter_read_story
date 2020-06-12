import { JSEncrypt } from "jsencrypt";

console.log("in request.js", process.env.VUE_APP_URL);

// export function rasEncrypt(data){
//     let encryptor = new JSEncrypt();
//     // 设置公钥
//     publicKey = process.env.VUE_APP_PUBKEY
//     encryptor.setPublicKey(publicKey);
//     // 加密数据
//     return encryptor.encrypt(data);
// }

// const PUBKEY = '-----BEGIN RSA PUBLIC KEY-----'+ '\n' + 'MIGJAoGBALf3GJOEY0vy3cSa3y5LWlCxwuwcaYTv3lMWjgx2/72r4v/TANIC3j79'+ '\n' +'qCecit/98JhRNig2PX/9KVky72sG+v959CD9hvQyepnBMRvUuTyHqHo7+wN3qNB5'+ '\n' + 'hmzP7uWKufkM4jI1RwSHGgnovSLKhJ0pVPfE7tHoWie9IK9++k/XAgMBAAE='+ '\n' + '-----END RSA PUBLIC KEY-----'

// const PUBKEY = '-----BEGIN RSA PUBLIC KEY-----MIGJAoGBALf3GJOEY0vy3cSa3y5LWlCxwuwcaYTv3lMWjgx2/72r4v/TANIC3j79qCecit/98JhRNig2PX/9KVky72sG+v959CD9hvQyepnBMRvUuTyHqHo7+wN3qNB5hmzP7uWKufkM4jI1RwSHGgnovSLKhJ0pVPfE7tHoWie9IK9++k/XAgMBAAE=-----END RSA PUBLIC KEY-----'

export function rasEncrypt(data) {
  console.log(data);
  // 有效公钥
  // var publicKey = "MIIBCgKCAQEAk03pHfgs2BWC2G1dfdjzrYIXATeTK3EoMI8dFk/EbnV6WluLSjTbY0IDWRfDq9zaPTlMLY3xwa8oVOgxLc0hCskPF7XGrkiHTx1Y0SEjggQJzqSdq53Rdl6Jsk4mzvzQ0pan2lunX437KqvXzUlAodRVVQZcEsAswFkUzrhj4kktbkUy9ejciS6Vm891vmNlvzN+bw9EFLmtDobzNsFR2ue1Iz0sX0dcLInnFuFGdJJPY7abBdpKTJCC1hISuD/QCTLaVREEmj6POhlake+U3V0yY54EwtYj/vjwZFNvmfKBZDj1+4cosk+eyae3nHz/CnyPzMYdc5+ewR39LSNXlQIDAQAB"
  // 测试公钥
  // var publicKey = "-----BEGIN RSA PUBLIC KEY-----\n"+"MIICXQIBAAKBgQDlOJu6TyygqxfWT7eLtGDwajtNFOb9I5XRb6khyfD1Yt3YiCgQWMNW649887VGJiGr/L5i2osbl8C9+WJTeucF+S76xFxdU6jE0NQ+Z+zEdhUTooNRaY5nZiu5PgDB0ED/ZKBUSLKL7eibMxZtMlUDHjm4gwQco1KRMDSmXSMkDwIDAQABAoGAfY9LpnuWK5Bs50UVep5c93SJdUi82u7yMx4iHFMc/Z2hfenfYEzu+57fI4fvxTQ//5DbzRR/XKb8ulNv6+CHyPF31xk7YOBfkGI8qjLoq06V+FyBfDSwL8KbLyeHm7KUZnLNQbk8yGLzB3iYKkRHlmUanQGaNMIJziWOkN+N9dECQQD0ONYRNZeuM8zd\n"+"-----END RSA PUBLIC KEY-----"
  // var publicKey = "MIICXQIBAAKBgQDlOJu6TyygqxfWT7eLtGDwajtNFOb9I5XRb6khyfD1Yt3YiCgQWMNW649887VGJiGr/L5i2osbl8C9+WJTeucF+S76xFxdU6jE0NQ+Z+zEdhUTooNRaY5nZiu5PgDB0ED/ZKBUSLKL7eibMxZtMlUDHjm4gwQco1KRMDSmXSMkDwIDAQABAoGAfY9LpnuWK5Bs50UVep5c93SJdUi82u7yMx4iHFMc/Z2hfenfYEzu+57fI4fvxTQ//5DbzRR/XKb8ulNv6+CHyPF31xk7YOBfkGI8qjLoq06V+FyBfDSwL8KbLyeHm7KUZnLNQbk8yGLzB3iYKkRHlmUanQGaNMIJziWOkN+N9dECQQD0ONYRNZeuM8zd"  
  // var publicKey = "-----BEGIN RSA PUBLIC KEY-----\n" +  "MIICXQIBAAKBgQDlOJu6TyygqxfWT7eLtGDwajtNFOb9I5XRb6khyfD1Yt3YiCgQ\n"+"WMNW649887VGJiGr/L5i2osbl8C9+WJTeucF+S76xFxdU6jE0NQ+Z+zEdhUTooNR\n"+"aY5nZiu5PgDB0ED/ZKBUSLKL7eibMxZtMlUDHjm4gwQco1KRMDSmXSMkDwIDAQAB\n"+"AoGAfY9LpnuWK5Bs50UVep5c93SJdUi82u7yMx4iHFMc/Z2hfenfYEzu+57fI4fv\n"+"xTQ//5DbzRR/XKb8ulNv6+CHyPF31xk7YOBfkGI8qjLoq06V+FyBfDSwL8KbLyeH\n"+"m7KUZnLNQbk8yGLzB3iYKkRHlmUanQGaNMIJziWOkN+N9dECQQD0ONYRNZeuM8zd\n"+"-----END RSA PUBLIC KEY-----" 
  // var publicKey = `-----BEGIN RSA PUBLIC KEY-----MIIBCgKCAQEAigz0Q/APSzSG7NknI6fsXvbF87F+dtWClaizm6Z+2rIkwVuZBPyRSjD5bLXDXb2wTLd/8KH6W+SMZHOLr1S+Qitkh/IukolWsPthVnBsu1J/K1IC1Rtkh0TYYtZki4wpJzWn/mbMOep8RXAxgPu67kKhkSxD6q6j3rL3Bs3/Ltc8+2Qco/8YUmwuEGNZfJQod/IMXl+DCd8/9fycMg68gVzwLLJvpQvpEtr/5nRg1LdxIg9KowFc0/IfD8Fq3j/LNyjb7JUVgc6bpXhNKJDN/0T7cYtQx23VArkeYi8a71fjnuaxy3bc+UQ7cZwV38JBW3GafJNR986jzNIXNMXEqwIDAQAB-----END RSA PUBLIC KEY-----`
  // 有效的公钥
  // var publicKey = `-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC8ygMKjJLSUpnfXqt8lRSAdDxAHWKi9GbTFkCbAjkRCR6VUakxxXLXHQUtPCizKcvNpuYqZ5bO8LEgpY7SL3JEdEI9OuMnZ6ToeHPfcHeS+EgN0oYmdQ49RB5wZkcBEFk80OBEAM6VhnE0IuHGkU5ko9oPHq3boEQ3Ej6r3T+UhQIDAQAB-----END PUBLIC KEY-----`
  // var publicKey = `-----BEGIN PUBLIC KEY-----MIGJAoGBAJr2Vuf1ZV3h5HToRnDQFPc3B5tHDBiluRqCq3/3GBOzRUeYWmZIQFluctLkDMMccYOD7Auiy50I1PVdGpztXC8smaOZ2RU2RygxnrNU5P+rilSYV3ye22kgfAIBplMjEGBt2UqK8UvmTwrajcYneVvFGvmEyZN4ZHFP/QqCK6xvAgMBAAE=-----END PUBLIC KEY-----`
  var publicKey = `MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDdiiO8MlYk38spTrv7ZhHQM+pCSuVY9UiSebn7KTS285U54QvwsutudYxil29gabeNv/BMv+3n4ByGAnGm2vVE6RYsLwOsWaXqIO3pcUUeonUKvD5hpQfiJ/uGDVOeSeDPQFU5GJW/5YFfrmsyEOC4gJcJNldETq1GcvutjXv3kwIDAQAB`
  let jse = new JSEncrypt();
  jse.setPublicKey(publicKey);
  var str = jse.encrypt(data);
  console.log("加密数据：" + str)
  return str
 
}
