//
//  CountTableViewCell.h
//  ZYNP
//
//  Created by sst on 16/2/22.
//  Copyright © 2016年 sst. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NumberCountModel.h"
#import "PNChartDelegate.h"
#import "PNChart.h"

@interface CountTableViewCell : UITableViewCell

@property(nonatomic,strong)NumberCountModel *numberModel;
@property(nonatomic)PNBarChart *barChart;

@end
