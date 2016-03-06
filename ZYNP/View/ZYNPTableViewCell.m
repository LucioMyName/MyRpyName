//
//  ZYNPTableViewCell.m
//  ZYNP
//
//  Created by sst on 15/12/22.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "ZYNPTableViewCell.h"
#import "ZKViewController.h"
#import "ZKAssemblyLines.h"
@interface ZYNPTableViewCell ()
//生产线
@property (weak, nonatomic) IBOutlet UILabel *productLines;
//订单号
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
//产品
@property (weak, nonatomic) IBOutlet UILabel *produces;
//产品规格
@property (weak, nonatomic) IBOutlet UILabel *prodcutStandard;
//开始时间
@property (weak, nonatomic) IBOutlet UILabel *startTimes;
//结束时间
@property (weak, nonatomic) IBOutlet UILabel *endTimes;
//总量
@property (weak, nonatomic) IBOutlet UIView *total;
//入库
@property (weak, nonatomic) IBOutlet UIView *storage;
//未完成
@property (weak, nonatomic) IBOutlet UIView *incomplete;
@property(nonatomic,strong)NSString *productLinsId;
@end
@implementation ZYNPTableViewCell



//重写set方法。完成数据的赋值操作
- (void)setZkAssemblyLines:(ZKAssemblyLines *)zkAssemblyLines{
    
    self.productLines.text=zkAssemblyLines.bmid;
    self.orderNumber.text=zkAssemblyLines.woid;
    self.produces.text=zkAssemblyLines.wlmc;
    self.prodcutStandard.text=zkAssemblyLines.wlgg;
    self.startTimes.text=zkAssemblyLines.sjkgrq;
    self.endTimes.text=zkAssemblyLines.sjwgrq;
    self.total.backgroundColor=[UIColor blueColor];
    self.storage.backgroundColor=[UIColor greenColor];
    self.incomplete.backgroundColor=[UIColor orangeColor];
    //NSLog(@"%@,%@,%@",self.productLines.text,self.orderNumber.text,self.produces.text);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
