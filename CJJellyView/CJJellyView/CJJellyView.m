//
//  CJJellyView.m
//  CJJellyView
//
//  Created by CJ on 2017/11/27.
//  Copyright © 2017年 CJ. All rights reserved.
//

#import "CJJellyView.h"

@implementation CJJellyView

// 初始化
- (CJJellyView *)initWithPoint:(CGPoint)point anchorPoint:(CGPoint)anchorPoint size:(CGSize)size {
    self = [super init];
    if (self) {
        
        _animateDuration = 1;
        _jellyDuration = 0.1;
        _fromScale = 0.1;
        _toScale = 1.05;
        
        self.frame = CGRectMake(point.x - size.width / 2, point.y - size.height / 2, size.width, size.height);
        //设置锚点
        self.layer.anchorPoint = anchorPoint;
        
        //添加点击手势
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSelf)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setAnimateDuration:(NSTimeInterval)animateDuration {
    _animateDuration = animateDuration;
}

- (void)setJellyDuration:(NSTimeInterval)jellyDuration {
    _jellyDuration = jellyDuration;
}

- (void)setFromScale:(CGFloat)fromScale {
    _fromScale = fromScale;
}

- (void)setToScale:(CGFloat)toScale {
    _toScale = toScale;
}

// 点击
- (void)tapSelf {
    
    if (self.clickBlock) {
        self.clickBlock();
    }
    
    [self dismiss];
}

//显示
- (void)show {
    //动画效果实现
    self.transform = CGAffineTransformMakeScale(_fromScale, _fromScale);
    
    [UIView animateWithDuration:_animateDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeScale(_toScale, _toScale);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:_jellyDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}

//隐藏
- (void)dismiss {
    [self removeFromSuperview];
}

@end
