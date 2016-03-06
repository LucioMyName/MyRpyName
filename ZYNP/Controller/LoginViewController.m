//
//  LoginViewController.m
//  ZYNP
//
//  Created by sst on 15/12/25.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "LoginViewController.h"
#import "ZKViewController.h"
#import "SCJHViewController.h"
#import "personalCenterViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *preserveBtn;
@property (weak, nonatomic) IBOutlet UILabel *remindLabel;
@property(nonatomic,strong)NSMutableArray   *loginArray;
@end

@implementation LoginViewController

-(NSMutableArray*)loginArray{
    if (!_loginArray) {
        _loginArray=[NSMutableArray array];
    }
    return _loginArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置textfield的一次性X号清空
    _userName.clearButtonMode=UITextFieldViewModeAlways;
    _passWord.clearButtonMode=UITextFieldViewModeAlways;
    self.tabBarController.tabBar.hidden=YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //不记住状态
    isRember=NO;
    
}
  
- (IBAction)userName:(id)sender {
    [_userName becomeFirstResponder];
    
}
- (IBAction)passWord:(id)sender {
    
    [self login:sender];
    
}

//保存登录信息按钮
- (IBAction)preserve:(UIButton *)sender {
    if (isRember==NO) {
        [sender setBackgroundImage:[UIImage imageNamed:@"checkbox_normal.png"] forState:UIControlStateNormal];
        isRember =YES;
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"checkbox_pressed.png"] forState:UIControlStateNormal];
        isRember=NO;
    }
    
    
    
}
//登录按钮
- (IBAction)login:(UIButton *)sender {
    [self.view endEditing:YES];
    //获取网络数据
    NSString *name=_userName.text;
    NSString *passWord=_passWord.text;
    if (name.length==0||passWord.length==0) {
        _remindLabel.text=@"用户名或者密码不能为空";
    }else{
        NSString  *loginstr=[NSString stringWithFormat:@"http://192.168.0.123:8090/zynp/appUser/userLogin.xhtml?name=%@&password=%@",name,passWord];
        NSLog(@"name:%@,%@",name,passWord);
        //创建请求对象
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:loginstr]];
        //获取单例对象session
        NSURLSession *session=[NSURLSession sharedSession];
        //创建任务对象发生请求
        NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            //获取状态吗
//            NSLog(@"1111data:%@",data);
            NSInteger statusCode=[(NSHTTPURLResponse*)response statusCode];
            if (statusCode==200) {
                //json数据解析
                NSError *error=nil;
                NSDictionary *loginDic=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                dispatch_async(dispatch_get_main_queue(), ^{
                    bool bol=[loginDic[@"success"] boolValue];
                    if (bol==true) {
                        _userId=loginDic[@"data"][@"id"];
                      //  NSLog(@"Id=%@",_userId);
                        //向个人中心页面传值id
                        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
                        [defaults setObject:_userId forKey:@"userId"];
                        //保存数据实现永久储存
                        [defaults synchronize];

                        _remindLabel.text=@"登录成功";
                        //登录成功点击跳转
                        UIStoryboard *lStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                        UIViewController *tabBar = [lStoryboard instantiateViewControllerWithIdentifier:@"TabBarVC"];
                        [self presentViewController:tabBar animated:YES completion:^{
                            
                        }];
                        
                    }else if(bol==false){
                        _remindLabel.text=@"请重新登录";
                    }
                });
            }
        }];
        [dataTask resume];
    }
//NSLog(@"Id=%@",_userId);
    }
    
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
