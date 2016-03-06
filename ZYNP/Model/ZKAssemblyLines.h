//
//  ZKAssemblyLines.h
//  ZYNP
//
//  Created by sst on 15/12/23.
//  Copyright © 2015年 sst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKAssemblyLines : NSObject
//生产线
@property(nonatomic,strong)NSString *bmid;
//订单号
@property (nonatomic,strong)NSString *woid;
//产品
@property (nonatomic,strong)NSString *wlmc;
//产品规格
@property (nonatomic,strong)NSString *wlgg;
//开始时间
@property(nonatomic,strong)NSString *sjkgrq;
//完成时间
@property(nonatomic,strong)NSString *sjwgrq;
//总量
@property(nonatomic,strong)NSNumber *xqsl;
//入库量
@property(nonatomic,strong)NSNumber *rksl;
//id
@property(nonatomic,strong)NSString *id;
//
//未完成量
//@property(nonatomic,strong)NSNumber *incomplete;
//解析json的方法
- (instancetype)initWithDictionary:(NSDictionary*)cxDic;



@end
