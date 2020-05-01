### 样式操作
- css() 可以多个，用空格隔开
- addClass() 可以多个，用空格隔开
- removeClass() 可以多个，用空格隔开
- toggleClass() 可以多个，用空格隔开


```html
<script>
$(function(){
    var $div = $('#box');
    // 读取属性
    var sTr = $div.css('fontSize')
    alert(sTr);

    // 写属性
    $div.css({'fontSize':'80px','color':'red'})

    // 区别只是一个输入一个字典
    // 一个输入一个字符串（样式名字）
    // 所有的样式操作都是这样的
})

</script>


```

## 绑定事件
### click

```html
<script>
$(function(){
    $('#btn').click(function(){
        if($('.box').hasClass('col01')){
            $('.box').removeClass('col01');
        }else {
            $('.box').addClass('col01');
        }
    })
})
// 上下等价
$(function(){
    $('#btn').click(function(){
        $('.box').toggleClass('col01');
    })
})
</script>

```
### 获取索引值

```html
<script>
    $(function(){
        var $li = $('ul li');
        alert($li.length);
        alert($li.eq(3).index());
        alert($li.filter('.myLi').index);
    })
</script>

```
### 写一下选项卡
```html
<script>
    $(function(){
        var $btn = $('.btns input');
        var $div = $('.cons div');
        $btn.click(function(){
            $(this).addClass('current').siblings().removeClass('curernt');
            // 如果直接写 this， 那么这个是原声的this， jQUERY的this 必须要写成 $(this)
            // siblings() 指的是除了当前元素之外的，同级所有元素
            alert($(this).index());
            $div.eq($(this).index()).addClass('active').siblings().removeClass('active');
        })
    })
</script>
```
