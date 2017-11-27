# CJJellyView
一个果冻弹窗效果，可以自定义位置和弹出方向，添加任意内容，几行代码就可以搞定！
效果图：
![CJJellyView.gif](https://github.com/CJProgrammer/CJJellyView/blob/master/CJJellyView.gif)

```
/**
 初始化
 
 @param point 从父视图的哪个点开始
 @param anchorPoint 在子视图的哪个点开始（比例换算）
 @param size 视图大小
 @return 返回
 */
- (CJJellyView *)initWithPoint:(CGPoint)point anchorPoint:(CGPoint)anchorPoint size:(CGSize)size;
```

使用：
```
_jellyView = [[CJJellyView alloc]initWithPoint:CGPointMake(self.view.frame.size.width/2, 294) anchorPoint:CGPointMake(0.5, 1) size:CGSizeMake(188, 34)];

UIImageView * imageView = [[UIImageView alloc]initWithFrame:_jellyView.bounds];
imageView.image = [UIImage imageNamed:@"appstore_comment_image"];
[_jellyView addSubview:imageView];
[_jellyView setClickBlock:^{
    // 点击回调
}];
[self.view addSubview:_jellyView];
```
