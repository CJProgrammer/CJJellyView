//
//  CustomView.m
//  CJJellyView
//
//  Created by CJ on 2017/11/27.
//  Copyright © 2017年 CJ. All rights reserved.
//

#define kArrowHeight 10

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGRect frame = CGRectMake(0, 10, self.bounds.size.width, self.bounds.size.height);
    //获取CGRect矩形坐标最大值和最小值
    float xMin = CGRectGetMinX(frame);
    float yMin = CGRectGetMinY(frame);
    
    float xMax = CGRectGetMaxX(frame);
    float yMax = CGRectGetMaxY(frame);
    
    //使用UIBezierPath类可以创建基于矢量的路径。此类是Core Graphics框架关于path的一个封装。使用此类可以定义简单的形状，如椭圆或者矩形，或者有多个直线和曲线段组成的形状。
    UIBezierPath *popoverPath = [UIBezierPath bezierPath];
    //去设置初始线段的起点
    [popoverPath moveToPoint:CGPointMake(xMin, yMin)];//左上角
    
    CGPoint arrowPoint = CGPointMake(self.bounds.size.width / 2, 2);
    
    /********************向上的箭头**********************/
    //去创建一个形状的线段
    [popoverPath addLineToPoint:CGPointMake(arrowPoint.x - kArrowHeight, yMin)];//left side
    //画一条曲线（贝塞尔曲线）
    [popoverPath addCurveToPoint:arrowPoint
                   controlPoint1:CGPointMake(arrowPoint.x - kArrowHeight, yMin)
                   controlPoint2:arrowPoint];//actual arrow point
    //第一个弧到尖，第二个弧从尖下来
    [popoverPath addCurveToPoint:CGPointMake(arrowPoint.x + kArrowHeight, yMin)
                   controlPoint1:arrowPoint
                   controlPoint2:CGPointMake(arrowPoint.x + kArrowHeight, yMin)];//right side
    /********************向上的箭头**********************/
    
    //接着画直线直到圈起来
    [popoverPath addLineToPoint:CGPointMake(xMax, yMin)];//右上角
    
    [popoverPath addLineToPoint:CGPointMake(xMax, yMax)];//右下角
    
    [popoverPath addLineToPoint:CGPointMake(xMin, yMax)];//左下角
    
    //填充颜色
    [[UIColor redColor] setFill];
    [[UIColor redColor] set];
    [popoverPath fill];
    
    [popoverPath closePath];
    //开始渲染
    [popoverPath stroke];
}

@end
