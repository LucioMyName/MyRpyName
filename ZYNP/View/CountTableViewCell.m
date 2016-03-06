//
//  CountTableViewCell.m
//  ZYNP
//
//  Created by sst on 16/2/22.
//  Copyright © 2016年 sst. All rights reserved.
//

#import "CountTableViewCell.h"

#define kBarLineYColor [UIColor orangeColor]
#define kBarLineGColor [UIColor greenColor]
#define kBarLineBColor [UIColor blueColor]

@interface CountTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *orangeView;
@property(nonatomic,assign)NSInteger rkNumber;
@property(nonatomic,assign)NSInteger planToCompleteNumber;
@property(nonatomic,assign)NSInteger inCompletNumber;
@end

@implementation CountTableViewCell


- (void)awakeFromNib {
    // Initialization code
    
}
- (void)setNumberModel:(NumberCountModel *)numberModel{
    self.orderNumber.text=numberModel.woid;
    self.rkNumber=numberModel.rksl;
    self.planToCompleteNumber=numberModel.xqsl;
    self.inCompletNumber=self.planToCompleteNumber-self.rkNumber;
//    NSLog(@"%ld,%ld,%ld",self.planToCompleteNumber,self.rkNumber,self.inCompletNumber);
    [self drewBarChart];
    
}
- (void)drewBarChart{
    static NSNumberFormatter *barChartFormatter;
    if (!barChartFormatter){
        barChartFormatter = [[NSNumberFormatter alloc] init];
        barChartFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        barChartFormatter.allowsFloats = NO;
        barChartFormatter.maximumFractionDigits = 0;
    }
    self.barChart=[[PNBarChart alloc]initWithFrame:CGRectMake(0, 30, self.contentView.bounds.size.width-90, 190)];
    self.barChart.showLabel = YES;
    self.barChart.backgroundColor = [UIColor clearColor];
    self.barChart.yLabelFormatter = ^(CGFloat yValue){
        return [barChartFormatter stringFromNumber:[NSNumber numberWithFloat:yValue]];
         };
    //坐标轴的数值显示
    self.barChart.showLabel = YES;
    //设置bar 的宽度
     self.barChart.yChartLabelWidth = 30.0;
    //设置Ylabel的位置
    self.barChart.chartMarginLeft = 32.0;
    self.barChart.chartMarginRight = 10.0;
    //设置Xlabel的位置
    self.barChart.chartMarginTop = 5.0;
    self.barChart.chartMarginBottom = 10.0;
    
//    self.barChart.labelMarginTop = 5.0;
    //设置坐标轴(显示)
    self.barChart.showChartBorder = YES;
    [_barChart setXLabels:@[@"已完成",@"未完成",@"总量"]];
    
    [_barChart setYValues:@[[NSNumber numberWithInteger:self.rkNumber],[NSNumber numberWithInteger:self.inCompletNumber],[NSNumber numberWithInteger:self.planToCompleteNumber]]];
    [_barChart setStrokeColors:@[kBarLineYColor,kBarLineGColor,kBarLineBColor]];
    //设置bar背景颜色
    self.barChart.barBackgroundColor=[UIColor whiteColor];
    //柱状图是否动态显示
    self.barChart.isGradientShow = NO;
    //柱状图的数值显示
    self.barChart.isShowNumbers = YES;
    [_barChart strokeChart];
    [self.contentView addSubview:self.barChart];
}
//设置让view或者label点击不会消失
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    self.blueView.backgroundColor = [UIColor blueColor];
    self.greenView.backgroundColor=[UIColor greenColor];
    self.orangeView.backgroundColor=[UIColor orangeColor];
    
}
//设置让view或者label点击不会消失（同时与上面方法设置）
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.blueView.backgroundColor = [UIColor blueColor];
    self.greenView.backgroundColor=[UIColor greenColor];
    self.orangeView.backgroundColor=[UIColor orangeColor];
    
}

@end
