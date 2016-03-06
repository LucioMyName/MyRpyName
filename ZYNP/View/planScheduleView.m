//
//  planScheduleView.m
//  ZYNP
//
//  Created by sst on 15/12/29.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "planScheduleView.h"
#import "SCJDViewController.h"
@implementation planScheduleView
//每次对value传值，都要刷新界面，展现新的圆环
- (void)setValue:(CGFloat)value{
    _value=value;
    //实时数据更新绘图（即界面刷新）
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect{
    UIBezierPath *bPath=[UIBezierPath bezierPath];
    [bPath addArcWithCenter:CGPointMake(170, 145) radius:110 startAngle:0 endAngle:M_PI_2*4*_value clockwise:YES];
    bPath.lineWidth=70;
    [[UIColor orangeColor]setStroke];
    [bPath stroke];
    UIBezierPath *cPath=[UIBezierPath bezierPath];
    [cPath addArcWithCenter:CGPointMake(170, 145) radius:110 startAngle:M_PI_2*4*_value endAngle:M_PI_2*4 clockwise:YES];
    cPath.lineWidth=70;
    [[UIColor greenColor]setStroke];
        [cPath stroke];
}
- (void)setNeedsLayout{
    [self.viewForFirstBaselineLayout removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
