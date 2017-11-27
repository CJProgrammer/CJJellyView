//
//  CJJellyView.h
//  CJJellyView
//
//  Created by CJ on 2017/11/27.
//  Copyright © 2017年 CJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJJellyView : UIView

// 动画时间 默认1.0f秒
@property (nonatomic, assign) NSTimeInterval animateDuration;
// 回弹时间 默认0.1f秒
@property (nonatomic, assign) NSTimeInterval jellyDuration;
// 开始比例 默认0.1
@property (nonatomic, assign) CGFloat fromScale;
// 最大的比例 默认1.05
@property (nonatomic, assign) CGFloat toScale;

//点击自己
@property (nonatomic,copy) void (^clickBlock)(void);

/**
 初始化
 
 @param point 从父视图的哪个点开始
 @param anchorPoint 在子视图的哪个点开始（比例换算）
 @param size 视图大小
 @return 返回
 */
- (CJJellyView *)initWithPoint:(CGPoint)point anchorPoint:(CGPoint)anchorPoint size:(CGSize)size;

//显示
- (void)show;

//隐藏
- (void)dismiss;

@end
