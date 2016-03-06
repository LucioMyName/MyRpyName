//
//  NumberCountModel.h
//  ZYNP
//
//  Created by sst on 16/2/25.
//  Copyright © 2016年 sst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberCountModel : NSObject
//订单号
@property (nonatomic,strong)NSString *woid;
//总量和入库数量
@property(nonatomic,assign)NSInteger xqsl;
@property(nonatomic,assign)NSInteger  rksl;


- (instancetype)initWithDictionary:(NSDictionary*)numberDic;
@end
