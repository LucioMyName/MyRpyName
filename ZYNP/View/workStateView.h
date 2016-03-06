//
//  workStateView.h
//  ZYNP
//
//  Created by sst on 15/12/31.
//  Copyright © 2015年 sst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface workStateView : UIView
@property (nonatomic,assign)CGFloat sum0;
@property (nonatomic,assign)CGFloat sum1;
@property (nonatomic,assign)CGFloat sum2;
@property (nonatomic,assign)CGFloat sum3;
@property (nonatomic,assign)CGFloat sum22;
@property (nonatomic,assign)CGFloat sum23;
@property (nonatomic,assign)CGFloat sumN;
@property (nonatomic,assign)CGFloat sumM;
@property(nonatomic,strong)NSString *equipment;
@property(nonatomic,strong)NSDate *startTime;
@property(nonatomic,strong)NSDate *endTime;
@property(nonatomic,assign)NSInteger status;
@property(nonatomic,assign)CGFloat duration;
@property(nonatomic,strong)NSArray *eqStateArray;
@property(nonatomic,strong)NSMutableArray *eqMutableArray;
@end
