//
//  SCJDViewController.m
//  ZYNP
//
//  Created by sst on 15/12/28.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "SCJDViewController.h"
#import "planScheduleView.h"
#import "workStateView.h"
@interface SCJDViewController ()

@property (weak, nonatomic) IBOutlet planScheduleView *planScheduleView;
@property (weak, nonatomic) IBOutlet UILabel *producutStandard;
@property (weak, nonatomic) IBOutlet UILabel *rkNumber;
@property (weak, nonatomic) IBOutlet UILabel *incompleteNumber;
@property (weak, nonatomic) IBOutlet UILabel *planToCompleteNumber;

@end

@implementation SCJDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置进度的item的页面标题
    self.navigationItem.title=@"计划进度";
    
    self.producutStandard.text=_scjhM.wlgg;
    self.planToCompleteNumber.text=[NSString stringWithFormat:@"%ld",_scjhM.xqsl];
    self.rkNumber.text=[NSString stringWithFormat:@"%ld",_scjhM.rksl];
    self.incompleteNumber.text=[NSString stringWithFormat:@"%ld",_scjhM.xqsl-_scjhM.rksl];
    _planScheduleView.value=(_scjhM.rksl*1.0)/_scjhM.xqsl;
  //  NSLog(@"%f",_planScheduleView.value);
    
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
