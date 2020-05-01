## animate 动画 （写法与css()一样）

animate()其实就是按照一定的时间，修改css属性，来达到动画的效果

所以他的写法和css是一样的

不同的地方在与，animate有时间参数，有动画形式参数，回调函数（下一步要做什么）


## 尺寸相关，滚动事件

- width() height()  获取元素的高和宽 盒子内容的尺寸
- innerWidth() innerHeight() 加上padding
- outerWidth() outerHeight() 加上padding + border 盒子的真是尺寸，最常用
- outerWidth(true) outerHeight(true) 加上padding + border + margin

### offset()  0004_获取元素的绝对位置.html

### 加入购物车动画   0004_购物车动画.html （多看，花了很多心思写了备注）
###  可视区和文档的宽高： 有什么区别？？一个网页可以很长，可以网下翻页，但是可视区不变，除非拖动浏览器。但是宽度是一样的
- $(window).width()
- $(window).height()
- $(document).width()
- $(document).height()

### 页面滚动距离

- $(document).scrollTop()  : 往上移动的距离： 被遮住的部分，或者在显示之外的部分
- $(document).scrollLeft() ： 往左移动的距离： 被遮住的部分，或者在显示之外的部分

```js
// menu 悬停
$(function(){
    $(window).scroll(function(){
        var iNum = $(document).scrollTop();
        document.title = iNum;
        if($(document).scrollTop() > 200){
            $('.menu').css({
                'position': 'fixed',
                'left': '50%',
                'top':0,
                'marginLeft': -480
            });
            $('.menu_back').show();
            $('.totop').fadeIn();
        }else{
            $('.menu').css({
                'position': 'static',
                'marginLeft': 'auto'
            });
            $('.menu_back').hide();
            $('.totop').fadeOut();
        }
    })

    $('.totop').click(function(){
        $('html,body').animate({'scrollTop':0}) // 固定写法
    })

})

```
