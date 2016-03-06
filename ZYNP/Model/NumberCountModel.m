//
//  NumberCountModel.m
//  ZYNP
//
//  Created by sst on 16/2/25.
//  Copyright © 2016年 sst. All rights reserved.
//

#import "NumberCountModel.h"

@implementation NumberCountModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (instancetype)initWithDictionary:(NSDictionary *)numberDic{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:numberDic];
    }
    return self;
}
- (NSString*)description{
    return [NSString stringWithFormat:@"orderNumber:%@,planToCompleteNumber:%ld,rkNumber:%ld",self.woid,self.xqsl,self.rksl];
}
@end
