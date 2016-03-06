//
//  ZKCollectionViewCell.h
//  ZYNP
//
//  Created by sst on 15/12/24.
//  Copyright © 2015年 sst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STEquipmentState.h"
@interface ZKCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)STEquipmentState *stEquipment;
- (void)setStEquipment:(STEquipmentState *)stEquipment;
@end
