//
//  ZKAssemblyLines.m
//  ZYNP
//
//  Created by sst on 15/12/23.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "ZKAssemblyLines.h"

@implementation ZKAssemblyLines
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (instancetype)initWithDictionary:(NSDictionary*)cxDic{
    if ([super init]) {
        [self setValuesForKeysWithDictionary:cxDic];
    }
    return self;
}
- (NSString*)description{
    return [NSString stringWithFormat:@"productLines:%@,orderNumber:%@,produces:%@,prodcutStandard:%@,startTime:%@,endTime:%@,total:%@,storage:%@",self.bmid,self.woid,self.wlmc,self.wlgg,self.sjkgrq,self.sjwgrq,self.xqsl,self.rksl];
    
}

@end
