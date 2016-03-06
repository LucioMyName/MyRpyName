//
//  ScjhModels.h
//  ZYNP
//
//  Created by sst on 16/1/15.
//  Copyright © 2016年 sst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScjhModels : NSObject


@property (nonatomic,strong)NSString *woid;
@property (nonatomic,strong)NSString *wlmc;
@property (nonatomic,strong)NSString *wlgg;
@property(nonatomic,strong)NSString *jhkgrq;
@property(nonatomic,strong)NSString *jhwgrq;
@property(nonatomic,assign)NSInteger xqsl;
@property(nonatomic,assign)NSInteger  rksl;


- (instancetype)initWithDictionary:(NSDictionary*)scjhDic;
@end
