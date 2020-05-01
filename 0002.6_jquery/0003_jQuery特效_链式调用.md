## jquery 特殊效果
有些是有参数的

- fadeOut()
- fadeIn()
- fadeToggle()
- hide()
- show()
- toggle()
- slideDown()  ： 菜单时用得多
- slideUp      ： 菜单时用得多
- slideToggle()： 菜单时用得多



```html
<script>
$(function(){
    $('#btn').click(function(){
        $('.box').fadeToggle(1000, 'swing', function(){
            alert('动画结束');
            // 回调函数，如果你动画结束，要做其他事情
            // 比如要进行下一个动画，在这里操作
        })
    })
})
</script>

```

## jquery链式调用（想一下上面一节的选项卡），效率比较高
- 为什么可以采用链式调用？ 因为每次执行完一个操作，jquery都会返回这个jquery对象，可以对这个对象进行下一步操作
- 为什么要采用链式调用？ 因为是异步的。
层级菜单
```html
<script>
$(function(){
    $('.level1').click(function(){
        $(this).next().slideDown().parent().siblings().children('ul').slideUp()
        //$(this) : jQuery的this， 表示你当前点击的是哪个 level1
        //.next()： level1的同级元素的下一个元素（下拉菜单）
        //.slideDown(). 向下展开
        //parent(). 找到父亲元素
        //siblings() 选择除了当前节点之外的所有节点
        //.children('ul') 选择所有节点中的ul元素
        //.slideUp() 关闭其他的所有下拉菜单
        $(this).next().slideToggle().parent().siblings().children('ul').slideUp()
        // 上面这个语句， 反复点击的时候，可能会出现，鼠标离开点击以后，还是一直展开闭合的情况，修正如下
        $(this).next().stop().slideToggle().parent().siblings().children('ul').slideUp()
    })
})
</script>
```
