//
//  ScjhModels.m
//  ZYNP
//
//  Created by sst on 16/1/15.
//  Copyright © 2016年 sst. All rights reserved.
//

#import "ScjhModels.h"

@implementation ScjhModels

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (instancetype)initWithDictionary:(NSDictionary *)scjhDic{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:scjhDic];
    }
    return self;
}
- (NSString*)description{
    return [NSString stringWithFormat:@"orderNumber:%@,produces:%@,prodcutStandard:%@,startTime:%@,endTime:%@,planToCompleteNumber:%ld,rkNumber:%ld",self.woid,self.wlmc,self.wlgg,self.jhkgrq,self.jhwgrq,self.xqsl,self.rksl];
}
@end
