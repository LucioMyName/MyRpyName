//
//  STEquipmentState.h
//  ZYNP
//
//  Created by sst on 15/12/24.
//  Copyright © 2015年 sst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STEquipmentState : NSObject
@property(nonatomic,strong)NSNumber *oporation;
@property(nonatomic,assign)NSNumber *workState;
@property(nonatomic,strong)NSString *equipmentName;
@property(nonatomic,strong)NSString *beltlineID;
@property(nonatomic,strong)NSString *equipmentID;
@property(nonatomic,strong)NSDictionary *equipmentData;

- (instancetype)initWithDictionary:(NSDictionary *)eqDic;
@end
