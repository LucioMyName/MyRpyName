//
//  workStateView.m
//  ZYNP
//
//  Created by sst on 15/12/31.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "workStateView.h"
#import "EquipmentState.h"

@implementation workStateView

-(NSMutableArray*)eqMutableArray{
    if (!_eqMutableArray) {
        _eqMutableArray=[NSMutableArray array];
    }
    return _eqMutableArray;
}
//设置通知接听
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passInformation:) name:@"passInformation" object:nil];
    }
    return self;
}

- (void)passInformation:(NSNotification*)notification{
    self.eqStateArray=[[notification userInfo] objectForKey:@"_equipmemtStateArray"];
    [self setNeedsDisplay];
    //  NSLog(@"11221213:%@",self.eqStateArray);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    self.eqStateArray=[defaults valueForKey:@"_equipmemtStateArray"];
//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passInformation:) name:@"passInformation" object:nil];

  // NSLog(@"11:%@",self.eqStateArray);
    for (NSDictionary *stateDic in _eqStateArray) {
        EquipmentState *equipmentStates=[[EquipmentState alloc]initWithDictionary:stateDic];
        [self.eqMutableArray addObject:equipmentStates];
        if (equipmentStates.status==0) {
            _sum0=_sum0+equipmentStates.duration;
        }else if (equipmentStates.status==1){
            _sum1=_sum1+equipmentStates.duration;
        }else if (equipmentStates.status==2){
            _sum2=_sum2+equipmentStates.duration;
        }else if (equipmentStates.status==3){
            _sum3=_sum3+equipmentStates.duration;
        }else if (equipmentStates.status==22){
            _sum22=_sum22+equipmentStates.duration;
        }else if (equipmentStates.status==23){
            _sum23=_sum23+equipmentStates.duration;
        }else{
            _sumN=_sumN+equipmentStates.duration;
        }
    }
    _sumM=(_sum0+_sum1+_sum2+_sum3+_sum22+_sum23+_sumN)*1.0;
    //画图
        if (_sumM!=0) {
            
            UIBezierPath *bPath=[UIBezierPath bezierPath];
            [bPath addArcWithCenter:CGPointMake(190, 200) radius:110 startAngle:0 endAngle:M_PI_2*4*((_sum0+_sumN)/_sumM) clockwise:YES];
            bPath.lineWidth=70;
            [[UIColor grayColor]setStroke];
            [bPath stroke];
            UIBezierPath *cPath=[UIBezierPath bezierPath];
            [cPath addArcWithCenter:CGPointMake(190, 200) radius:110 startAngle:M_PI_2*4*((_sum0+_sumN)/_sumM) endAngle:M_PI_2*4*((_sum1+_sum2)/_sumM) clockwise:YES];
            cPath.lineWidth=70;
            [[UIColor orangeColor]setStroke];
            [cPath stroke];
            UIBezierPath *dPath=[UIBezierPath bezierPath];
            [bPath addArcWithCenter:CGPointMake(190, 200) radius:110 startAngle:M_PI_2*4*((_sum1+_sum2)/_sumM) endAngle:M_PI_2*4*(_sum3/_sumM) clockwise:YES];
            dPath.lineWidth=70;
            [[UIColor greenColor]setStroke];
            [dPath stroke];
            UIBezierPath *ePath=[UIBezierPath bezierPath];
            [ePath addArcWithCenter:CGPointMake(190, 200) radius:110 startAngle:M_PI_2*4*(_sum3/_sumM) endAngle:M_PI_2*4*((_sum22+_sum23)/_sumM) clockwise:YES];
            ePath.lineWidth=70;
            [[UIColor redColor]setStroke];
            [ePath stroke];
        }
}

- (void)setNeedsLayout{
    [self.viewForFirstBaselineLayout removeFromSuperview];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
