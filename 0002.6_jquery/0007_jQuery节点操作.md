# 节点操作 : 已有节点也可以操作

```js
// 生成节点
var $div = $('<div>这个是由js生成的节点</div>')
var $a = $('<a>')
// 插入页面
$('#div1').append($div) // 通过html的字符串的形式添加节点的效率最高
$('$div1').append($a) // 插入一个空元素，没有class
// 删除节点
```
- .append()  : 在现成元素之后的位置（和当前元素是同级）
- .appendTo() : 做当前元素的子元素。
- .preappend()
- .preappendTo()
- .after()
- .insertAfter()
- .before()
- .insertBefroe()
- 操作已有节点流程，选中你想要改变的节点，然后用to来写
- .remove() 删除选中节点

## 写一个todolist
