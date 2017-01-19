//
//  DrawVIEW.m
//  BezierPathTest
//
//  Created by huweidong on 19/1/17.
//  Copyright © 2017年 huweidong. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

//- (void)drawRect:(CGRect)rect{
//    UIColor *color = [UIColor redColor];
//    [color set]; //设置线条颜色
//    
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    aPath.lineWidth = 5.0;
//    
//    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
//    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
//    
//    // Set the starting point of the shape.
//    [aPath moveToPoint:CGPointMake(120.0, 20.0)];
//    
//    // Draw the lines
//    [aPath addLineToPoint:CGPointMake(200.0, 60.0)];
//    [aPath addLineToPoint:CGPointMake(160, 140)];
//    [aPath addLineToPoint:CGPointMake(60.0, 140)];
//    [aPath addLineToPoint:CGPointMake(40.0, 60.0)];
//    [aPath closePath];//第五条线通过调用closePath方法得到的
//    
//    [aPath stroke];//Draws line 根据坐标点连线
////    [aPath fill];
//}

//- (void)drawRect:(CGRect)rect
//{
//    UIColor *color = [UIColor redColor];
//    [color set]; //设置线条颜色
//    
//    //正方形
////    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 100, 100)];
//    //圆弧
////    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150)
////                                                         radius:75
////                                                     startAngle:0
////                                                       endAngle:135.0/360.0*2.0*M_PI
////                                                      clockwise:YES];
//    //曲线
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    [aPath moveToPoint:CGPointMake(20, 100)];
//    
//    [aPath addQuadCurveToPoint:CGPointMake(120, 100) controlPoint:CGPointMake(70, 0)];
//    
//    aPath.lineWidth = 5.0;
//    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
//    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
//    
//    [aPath stroke];
//}

//组合
- (void)drawRect:(CGRect)rect {
    CGSize size = self.bounds.size;
    CGFloat margin = 10;
    //rintf：四舍五入函数
    CGFloat radius = rintf(MIN(size.height - margin, size.width - margin) / 4);
    CGFloat xOffset, yOffset;
    
    CGFloat offset = rintf((size.height - size.width) / 2);
    if (offset > 0) {
        xOffset = (CGFloat)rint(margin / 2);
        yOffset = offset;
    } else {
        xOffset = -offset;
        yOffset = rintf(margin / 2);
    }
    
    [[UIColor redColor] setFill];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(radius * 2 + xOffset, radius + yOffset)
                    radius:radius
                startAngle:(CGFloat)-M_PI
                  endAngle:0
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius * 3 + xOffset, radius * 2 + yOffset)
                    radius:radius
                startAngle:(CGFloat)-M_PI_2
                  endAngle:(CGFloat)M_PI_2
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius * 2 + xOffset, radius * 3 + yOffset)
                    radius:radius
                startAngle:0
                  endAngle:(CGFloat)M_PI
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius + xOffset, radius * 2 + yOffset)
                    radius:radius
                startAngle:(CGFloat)M_PI_2
                  endAngle:(CGFloat)-M_PI_2
                 clockwise:YES];
    [path closePath];
    [path fill];
}

@end
