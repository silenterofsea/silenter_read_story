# jQuery
## jQuery 用法思想
- 选择一个元素，然后进行某种操作
- 同一个函数完成取值和赋值
### 感受jQuery
```html
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <title></title>
    <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
    !window.jQuery && document.write('<script src="/lib/jquery/2.0.0/jquery.min.js"><\/script>');
    </script>

    <script>
    // ready 比 window.onload 要快
    // 原因：
    // window.onload： 标签加载完，并且渲染完之后，才运行
    // ready： 标签加载完成之后，就运行
    window.onload = function(){
        var oDiv = document.getElementById('div1');
        alert('原生js弹出的' + oDiv.innerHTML)
    }

    // ready的完整写法
    $(document).ready(function(){
        var oDiv = document.getElementById('div1');
        alert('ready的完整写法弹出的' + oDiv.innerHTML)
    })

    // ready简写
    // $()  === $(document).ready()
    $(function(){
        var oDiv = document.getElementById('div1');
        alert('ready简写弹出的' + oDiv.innerHTML)
    })
    </script>
</head>
<body>

    <div id="div1">Hello jQuery</div>

</body>
</html>


```
# $()  和  $(document).ready() 等价
```js
$(document).ready(function(){

   // 开始写 jQuery 代码...

});

$(function(){
    // jQuery 语句
    // 下面所有例子都在这个里面
});

```
## 选择器

- $('#myID') : 选择id为myId的元素
- $('.myClass')： 选择class为myClass的元素
- $('li')   ： 选择所有li元素
- $('#ul1 li span')： 选择id为ul1下所有li下的span
- $('input[name="first"]') ： 选择name属性为first的元素

## 对选择集进行过滤

- $('div').has('p');  选择包含p元素的div元素
- $('div').not('.myClass'); 选择class不等于myClasss的元素
- $('div').filter('.myClass'); 选择class等于myClass的元素
- $('div').eq(5); 选择第六个元素

## 对选择集转移

- $('div').prev();  //选择div元素紧挨的元素
- $('div').prevall();
- $('div').next()
- $('div').nextAll()
- $('div').parent()
- $('div').children()
- $('div').siblings()
- $('div').find('.myClass');

## 判断是否选择到了元素  用length()来判断

```html
<script>
$(function(){
    var $div1 = $('#div1')
    alert($div1.length);

    // 没有选中元素，jQuery也不会报错， 程序正常运行
    var $div2 = $('#div2')
    alert($div2.length);

    if($div2.length > 0){
        // 有选择到元素，才做操作
    }

})
</script>

<body>
<div id="div1">div元素</div>
</body>
```
