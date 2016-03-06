//
//  SCJHCell.m
//  ZYNP
//
//  Created by sst on 15/12/24.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "SCJHCell.h"
#import "SCJDViewController.h"
@interface SCJHCell ()
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UILabel *produces;
@property (weak, nonatomic) IBOutlet UILabel *productStandard;
@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property(nonatomic,assign)NSInteger rkNumber;
@property(nonatomic,assign)NSInteger planToCompleteNumber;

@end

@implementation SCJHCell

- (void)setScjhModel:(ScjhModels *)scjhModel{
    self.orderNumber.text=scjhModel.woid;
    self.produces.text=scjhModel.wlmc;
    self.productStandard.text=scjhModel.wlgg;
    self.startTime.text=scjhModel.jhkgrq;
    self.endTime.text=scjhModel.jhwgrq;
    self.rkNumber=scjhModel.rksl;
    self.planToCompleteNumber=scjhModel.xqsl;
    
    //NSLog(@"11:%@ 22:%@ %@ %@ %@,%ld,%ld",self.orderNumber.text,self.produces.text,self.productStandard.text,self.startTime.text,self.endTime.text,self.rkNumber,self.planToCompleteNumber);
 
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
