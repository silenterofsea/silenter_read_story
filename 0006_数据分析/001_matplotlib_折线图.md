## matplotlib 初体验
```python
from matplotlib import plot as plt

x = range(2,26,2)
y = [15,13,14,5,17,20,25,26,26,27,22,18,15]

# 绘制图片
plt.plot(x, y)


# 展示图片
plt.show()

```

## 有几个问题
- 设置图片大小 ： plt.figure(figsize=(20, 8), dpi=80) # diont per inch
- 图片保存到本地 : plt.savefig("./sig_size.png") # （".sig_size.svg"）,尽量保存为svg的格式
- 描述信息
-- 设置x轴的刻度： plt.xticks(x)
-- 设置y轴的刻度： plt.yticks(range(min(y), max(y)+ 1))
- 调整x、y的刻度距离
- 线条样式
- 标记出特殊的点
- 给图片添加一个水印

## 小试牛刀1
a = [random(25, 30) for i in range(120)]
