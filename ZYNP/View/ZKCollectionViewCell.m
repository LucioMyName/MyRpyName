//
//  ZKCollectionViewCell.m
//  ZYNP
//
//  Created by sst on 15/12/24.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "ZKCollectionViewCell.h"

@interface ZKCollectionViewCell ()
//设备状态图片
@property (weak, nonatomic) IBOutlet UIImageView *equipmentState;
//设备名称
@property (weak, nonatomic) IBOutlet UILabel *equipmentName;
@property(nonatomic,strong)NSString *equipmentId;
@property(nonatomic,strong)NSNumber *workState;
@property(nonatomic,strong)NSDictionary *equipmentDic;
@property(nonatomic,strong)NSNumber *equipmentStateNumeber;

@end
@implementation ZKCollectionViewCell
- (void)setStEquipment:(STEquipmentState *)stEquipment{
    self.equipmentName.text=stEquipment.equipmentName;
    self.equipmentId=stEquipment.beltlineID;
    self.equipmentStateNumeber=stEquipment.oporation;

            if ([self.equipmentStateNumeber compare:[NSNumber numberWithInt:0]]==NSOrderedSame) {
                self.equipmentState.image=[UIImage imageNamed:@"guanji.png"];
            }else if([self.equipmentStateNumeber compare:[NSNumber numberWithInt:1]]==NSOrderedSame){
                self.equipmentState.image=[UIImage imageNamed:@"daiji.png"];
            }
            else if([self.equipmentStateNumeber compare:[NSNumber numberWithInt:2]]==NSOrderedSame){
                self.equipmentState.image=[UIImage imageNamed:@"daiji.png"];
            }else if([self.equipmentStateNumeber compare:[NSNumber numberWithInt:3]]==NSOrderedSame){
                self.equipmentState.image=[UIImage imageNamed:@"yunxing.png"];
            }else if([self.equipmentStateNumeber compare:[NSNumber numberWithInt:22]]==NSOrderedSame){
                self.equipmentState.image=[UIImage imageNamed:@"baojing.png"];
            }
            else if([self.equipmentStateNumeber compare:[NSNumber numberWithInt:23]]==NSOrderedSame){
                self.equipmentState.image=[UIImage imageNamed:@"baojing.png"];
            }else {
                self.equipmentState.image=[UIImage imageNamed:@"guanji.png"];
            }
        }

//
//
//    if (stEquipment.equipmentData.count!=0) {
//        self.workState=[stEquipment.equipmentData objectForKey:@"workstate"];
//        NSLog(@"work:%@",self.workState);
//        //判断equipmentdata是否存在
//        if (self.workState!=nil&&[self.workState compare:[NSNumber numberWithInt:0]]== NSOrderedSame) {
//            self.equipmentState.image=[UIImage imageNamed:@"guanji.png"];
//        }else if((self.workState!=nil&&[self.workState compare:[NSNumber numberWithInt:1]]== NSOrderedSame)||(self.workState!=nil&&[self.workState compare:[NSNumber numberWithInt:2]]== NSOrderedSame)){
//            self.equipmentState.image=[UIImage imageNamed:@"daiji.png"];
//        }else if(self.workState!=nil&&[self.workState compare:[NSNumber numberWithInt:3]]== NSOrderedSame){
//            self.equipmentState.image=[UIImage imageNamed:@"yunxing.png"];
//        }else if(self.workState!=nil&&[self.workState compare:[NSNumber numberWithInt:22]]== NSOrderedSame){
//            self.equipmentState.image=[UIImage imageNamed:@"baojing.png"];
//        }else{
//            self.equipmentState.image=[UIImage imageNamed:@"guanji.png"];
//        }
//    }else{
//        self.equipmentState.image=[UIImage imageNamed:@"guanji.png"];
//    }



- (void)awakeFromNib {
    // Initialization code
}

@end
