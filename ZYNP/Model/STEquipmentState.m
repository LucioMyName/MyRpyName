//
//  STEquipmentState.m
//  ZYNP
//
//  Created by sst on 15/12/24.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "STEquipmentState.h"

@implementation STEquipmentState
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (instancetype)initWithDictionary:(NSDictionary *)eqDic{
    if ([super init]) {
        [self setValuesForKeysWithDictionary:eqDic];
    }
    return self;
}
- (NSString*)description{
    return [NSString stringWithFormat:@"workstate:%@,equipmentName:%@,beltlineID:%@,equipmentID:%@,equipmentData:%@,oporation:%@",self.equipmentData,self.equipmentName,self.beltlineID,self.equipmentID,self.equipmentData,self.oporation];
}
@end
