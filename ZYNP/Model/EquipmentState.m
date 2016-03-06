//
//  EquipmentState.m
//  ZYNP
//
//  Created by sst on 16/1/25.
//  Copyright © 2016年 sst. All rights reserved.
//

#import "EquipmentState.h"

@implementation EquipmentState
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
//+ (EquipmentState *)setModelWithDictionary:(NSDictionary *)dic{
//    
//    EquipmentState *mode = [[EquipmentState alloc]init];
//    [mode setValuesForKeysWithDictionary:dic];
//    
//    return mode;
//}


//- (void)setStatus:(NSString *)status
//{
//    _status = status.integerValue;
//}

- (instancetype)initWithDictionary:(NSDictionary *)stateDic{
    if ([super init]) {
        [self setValuesForKeysWithDictionary:stateDic];
    }
    return self;
}
- (NSString*)description{
    return [NSString stringWithFormat:@"equipment:%@,startTime:%@,endTime:%@,state:%ld,duration:%ld",self.equipment ,self.startTime,self.endTime,self.status,self.duration];
}
@end
