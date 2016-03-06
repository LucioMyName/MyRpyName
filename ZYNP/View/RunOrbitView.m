//
//  RunOrbitView.m
//  ZYNP
//
//  Created by sst on 15/12/31.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "RunOrbitView.h"
#import "EquipmentState.h"

//当前绘图的进度
static CGFloat currentProgess = 0;

//每个扇形对应的颜色(6种)
#define OneColor [UIColor grayColor]
#define TwoColor [UIColor orangeColor]
#define ThreeColor [UIColor greenColor]
#define FourColor [UIColor redColor]




@interface RunOrbitView()


/**  记录上次绘画的进度*/
@property (assign, nonatomic) CGFloat lastProgress;

/**  绘画的Bezier曲线*/
//@property (strong, nonatomic) UIBezierPath *bezierPath;


@end

@implementation RunOrbitView


#pragma mark - 懒加载
//- (UIBezierPath *)bezierPath
//{
//    if(!_bezierPath )
//    {
//        _bezierPath =  [UIBezierPath bezierPath];
//    }
//    return _bezierPath;
//}


- (NSMutableArray*)eqRunMutableArray
{
    if (!_eqRunMutableArray) {
        _eqRunMutableArray=[NSMutableArray array];
    }
    return _eqRunMutableArray;
}


#pragma mark - 处理通知
//设置通知接听(V1）
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passInformation:) name:@"passInformation" object:nil];
    }
    return self;
}


- (void)passInformation:(NSNotification*)notification
{
    self.eqRunArray =[[notification userInfo] objectForKey:@"_equipmemtStateArray"];
    

    //计算总和
    for (int i=0; i<[_eqRunArray count]; i++)
    {
        NSDictionary *stateDic=_eqRunArray[i];
        EquipmentState *equipmentStates=[[EquipmentState alloc]initWithDictionary:stateDic];
        [self.eqRunMutableArray addObject:equipmentStates];
        if (equipmentStates.status>=0) {
            _sumM += equipmentStates.duration;
        }
    }
    
    [self setNeedsDisplay];
}


#pragma mark - 绘图
- (void)drawWithModel: (EquipmentState *)model
{
    
    switch (model.status) {
        case 0:
            [self drawWithColor:OneColor withModel:model];
            NSLog(@"0000:%ld",model.status);
            break;
        case 1:
            [self drawWithColor:TwoColor withModel:model];
            NSLog(@"1111:%ld",model.status);
            break;
        case 2:
            [self drawWithColor:TwoColor withModel:model];
            NSLog(@"2222:%ld",model.status);
            break;
        case 3:
            [self drawWithColor:ThreeColor withModel:model];
            NSLog(@"3333:%ld",model.status);
            break;
        case 22:
            [self drawWithColor:FourColor withModel:model];
            NSLog(@"4444:%ld",model.status);
            break;
        case 33:
            [self drawWithColor:FourColor withModel:model];
            NSLog(@"5555:%ld",model.status);
            break;
            
        default:
            NSLog(@"没对应的颜色");
            break;
    }
    
}

- (void)drawWithColor: (UIColor *)color withModel: (EquipmentState *)model
{
    currentProgess = (model.duration/self.sumM) * (M_PI * 2);
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(190, 200) radius:110 startAngle:self.lastProgress endAngle:currentProgess clockwise:YES];
    // //实心渲染
    //[path addLineToPoint:CGPointMake(190, 200)];
    path.lineWidth=70;
    [color set];
    //空心渲染
    [path stroke];
    // //实心渲染
    //[path fill];
    //记录当前进度
    self.lastProgress += currentProgess;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    //分别绘制扇形图
    for (EquipmentState *model in self.eqRunMutableArray)
    {
        [self drawWithModel:model];
    }
}


//不用通知时删除
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
