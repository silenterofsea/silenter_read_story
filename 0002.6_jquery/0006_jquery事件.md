# 绑定事件 ： bind()
- blur() 元素失去焦点
- focus() 元素获得焦点
- mouseover()
- mouseout()
- mouseenter() 移动到子元素的时候不会触发，一般用这个
- mouseleave() 移动到子元素的时候不会触发，一般用这个
- hover()
- ready()
- resize()  $(window).resize(function(){}) 这个事件一般不需要绑定在ready里面
- scroll()
- submit()

```js
 $(function(){
    // $(.con2).hover(function(){这里写移入}, function(){这里写移出})
    $(.con2).hover(function(){
        // 这里写移入
    }, function(){
        // 这里写移出
    })
})
```



```js

// 绑定触发事件
$(function(){
    $('#btn').click(function(){

    })

    $('#btn').bind('click', function(){

    })

    $('#btn').bind('click mouseover', function(){

    })

})

// 解除绑定事件
$(function(){
    $('#btn').click(function(){

    })

    $('#btn').bind('click', function(){

    })

    $('#btn').bind('click mouseover', function(){
        $(this).unbind('mouseover')
    })

})

```
## 事件冒泡 （查看‘弹窗.html’）
- 为什么会有“时间冒泡”这个问题？ 因为页面元素往往有嵌套。可以用来事件委托（下一个小节）。
- 注意点，时间冒泡，是通过标签的层级往上一级传。
- 如何阻止事件冒泡？  event.stopPropagation();
```js
$(function(){
    $('son').click(function(event){
        alert(1);
        // 通过event的stopPropagation()方法来组织事件上传
        event.stopPropagation();
        // 阻止默认行为
        event.preventDefault();


        // 又可以u阻止 事件冒泡，也可以阻止默认行为
        return false;
    })
})
```

## 事件委托 : .delegate('选择器（选中需要代理的具体元素）'， ‘委托事件’， function(){})

- 提高性能，减少代码。把一些相同的操作交给父级元素
- 新加入的子元素拥有相同的操作
```js
$(function(){  // 这个函数的作用是在点击到每个li的时候，让li的背景色发生变化
               // 缺点就是有多少个li，他会去绑定多少次事件
               // 动态添加一个li元素的时候， 新建的li元素不会有这个绑定事件
               // 性能很差
    $('ul li').click(function(){
        $(this).css({'background-color': 'red'})
    })
})

$(function(){  // 用事件委托的方式，处理这个事件
               // 只绑定一次，速度快， 性能高
                // 动态添加一个li元素，依然有这个事件
    $('ul').delegate('li', 'click', function(){
        $(this).css({'background-color': 'red'})
    })
})
```
