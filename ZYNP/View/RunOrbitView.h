//
//  RunOrbitView.h
//  ZYNP
//
//  Created by sst on 15/12/31.
//  Copyright © 2015年 sst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RunOrbitView : UIView
@property(nonatomic,strong)NSString *equipment;
@property(nonatomic,strong)NSDate *startTime;
@property(nonatomic,strong)NSDate *endTime;
@property(nonatomic,assign)NSInteger status;
@property(nonatomic,assign)CGFloat duration;
@property(nonatomic,strong)NSArray *eqRunArray;
@property(nonatomic,strong)NSMutableArray *eqRunMutableArray;
@property(nonatomic,assign)CGFloat sumM;
@property(nonatomic,assign)CGFloat sumN;


@end
