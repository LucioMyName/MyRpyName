//
//  EquipmentState.h
//  ZYNP
//
//  Created by sst on 16/1/25.
//  Copyright © 2016年 sst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EquipmentState : NSObject
@property(nonatomic,strong)NSString *equipment;
@property(nonatomic,strong)NSDate *startTime;
@property(nonatomic,strong)NSDate *endTime;
@property(nonatomic,assign)NSInteger status;
@property(nonatomic,assign)CGFloat duration;
//@property(nonatomic,assign)NSInteger sequence;
- (instancetype)initWithDictionary:(NSDictionary*)stateDic;
//+(EquipmentState*)setModelWithDictionary:(NSDictionary*)dic;
@end
