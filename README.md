# LZScaleHeader
可拉伸的表头视图
#####另有`swift`版本[LZScaleHeader_swift](https://github.com/LQQZYY/LZScaleHeader_swift)
基于UIScrollView扩展的类目,只需一句代码,即可添加表头视图

```Objective-C
[table addScaleHeaderWithImage:[UIImage imageNamed:@"9c16fdfaaf51f3de3b5b8e0d94eef01f3b2979e9.jpg"]];
```
也可以添加自定义的视图,当然,背景图片还是有的
```Objective-C
[table addScaleHeaderWithImage:[UIImage imageNamed:@"9c16fdfaaf51f3de3b5b8e0d94eef01f3b2979e9.jpg"] andCoverView:label];
```

关于表头的高度,可通过以下属性设置:
```Objective-C
@property (nonatomic,assign)CGFloat headerHeight;
```
具体实现,可参考代码,效果图如下
![](https://github.com/LQQZYY/LZScaleHeader/blob/master/testttt.gif)
