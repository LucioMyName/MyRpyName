//
//  personalMasssageViewController.m
//  ZYNP
//
//  Created by sst on 15/12/30.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "personalMasssageViewController.h"
#import "EditionViewController.h"
@interface personalMasssageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *image;
@property (weak, nonatomic) IBOutlet UITextField *pName;
@property (weak, nonatomic) IBOutlet UISwitch *sex;
@property (weak, nonatomic) IBOutlet UITextField *post;
@property (weak, nonatomic) IBOutlet UITextField *tel;
@property (weak, nonatomic) IBOutlet UITextField *department;
@property(nonatomic,assign)NSInteger Id;

@end

@implementation personalMasssageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"个人信息";
//    self.tabBarController.tabBar.hidden=YES;
}
- (IBAction)clickSaveMassage:(UIButton *)sender {
    NSString *personStr=[NSString stringWithFormat:@"http://192.168.0.123:8090/zynp/appUserInfo/findByProperties.xhtml?userId=%ld",_Id];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
