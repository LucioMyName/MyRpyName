//
//  personalCenterViewController.m
//  ZYNP
//
//  Created by sst on 15/12/30.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "personalCenterViewController.h"
#import "personalMasssageViewController.h"
#import "ChangePassWordViewController.h"
#import "SettingTableViewController.h"

@interface personalCenterViewController ()
//昵称
@property (weak, nonatomic) IBOutlet UILabel *name;
//性别
@property (weak, nonatomic) IBOutlet UILabel *sex;
//职务
@property (weak, nonatomic) IBOutlet UILabel *post;
//联系方式
@property (weak, nonatomic) IBOutlet UILabel *Tel;
//所在部门
@property (weak, nonatomic) IBOutlet UILabel *department;
//照片
@property (weak, nonatomic) IBOutlet UIButton *photo;
@property(nonatomic,strong)NSMutableArray *personCenterArray;

@end

@implementation personalCenterViewController

- (NSMutableArray *)personCenterArray{
    if (_personCenterArray==nil) {
        _personCenterArray=[NSMutableArray array];
    }
    return _personCenterArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getInfomation];
   // [self parseShow];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.userId1=[defaults valueForKey:@"userId"];
//    NSLog(@"userID11111:%@",self.userId1);

    
}
-(void)getInfomation{
    NSString *str=[NSString stringWithFormat:@"http://192.168.0.123:8090/zynp/appUserInfo/findByProperties.xhtml?userId=%@",_userId1];
    //创建NSURLRequest对象
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    //获取单例对象NSURLSession
    NSURLSession *session=[NSURLSession sharedSession];
    //创建任务对象发送请求
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //获取状态码
        NSInteger statusCode=[(NSHTTPURLResponse*)response statusCode];
        if (statusCode==200) {
            //解析Json（NSData---->NSDictionary）
            NSArray *centerArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
           // NSLog(@"%@",centerArray);
            
            //数据即时加载
               dispatch_async(dispatch_get_main_queue(), ^{
                   self.name.text=centerArray[0][@"relName"];
                   self.sex.text=centerArray[0][@"gender"];
                   self.post.text=centerArray[0][@"job"];
                   self.Tel.text=centerArray[0][@"telephone"];
                   self.department.text=centerArray[0][@"department"];

                });
            
        }
    }];
    [dataTask resume];
}
//把个人信息解析显示出来
//-(void)parseShow{
//    _centerModel=[[CenterModel alloc]init];
//    self.name.text=_centerModel.relName;
//    self.sex.text=_centerModel.gender;
//    self.post.text=_centerModel.job;
//    self.Tel.text=_centerModel.telephone;
//    self.department.text=_centerModel.department;
////    self.photo.backgroundColor=centerModel.photo;
//    NSLog(@"222222name:%@",_name.text);
//}
//点击修改个人信息
- (IBAction)clickChangePersonalMassage:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    personalMasssageViewController *pVC=[[personalMasssageViewController alloc]init];
    [self.navigationController pushViewController:pVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
    
    
}
//进入设置页面
- (IBAction)clickEnterSetting:(UIBarButtonItem *)sender {
    self.hidesBottomBarWhenPushed=YES;
    SettingTableViewController *sTVC=[[SettingTableViewController alloc]init];
    
    [self.navigationController pushViewController:sTVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
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
