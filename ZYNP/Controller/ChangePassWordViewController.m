//
//  ChangePassWordViewController.m
//  ZYNP
//
//  Created by sst on 15/12/30.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "ChangePassWordViewController.h"
#import "personalCenterViewController.h"
@interface ChangePassWordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPassWord;
@property (weak, nonatomic) IBOutlet UITextField *xPassword;
@property (weak, nonatomic) IBOutlet UITextField *nxPassWord;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *passWord;
@property (weak, nonatomic) IBOutlet UILabel *promptInformation;
@property(nonatomic,strong)NSURLSessionUploadTask *upLoadTask;


@end

@implementation ChangePassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *BackItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(clickBack:)];
    self.navigationItem.leftBarButtonItem=BackItem;
    //设置密码隐藏模式
    self.oldPassWord.secureTextEntry=YES;
    self.nxPassWord.secureTextEntry=YES;
    self.xPassword.secureTextEntry=YES;
    _promptInformation.textColor=[UIColor redColor];
}
- (IBAction)clickSave:(UIButton *)sender {
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    //请求原始数据
//    NSString *oldStr=[NSString stringWithFormat:@"http://192.168.0.123:8090/zynp/appUser/userLogin.xhtml?name=%@&password=%@",_name,_passWord];
    NSString *oldStr=[NSString stringWithFormat:@"http://192.168.0.123:8090/zynp/appUser/userLogin.xhtml?name=123&password=1234"];
    //创建NSURL
     NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:oldStr]];
    //创建请求对象
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSInteger statusCode=[(NSHTTPURLResponse*)response statusCode];
        if (statusCode==200) {
            //json数据解析
            NSError *error=nil;
            NSDictionary *oldDic=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSLog(@"改密:%@",oldDic);
            NSDictionary *passWordDic=oldDic[@"data"];
           // NSLog(@"DIC:%@",passWordDic);
            _passWord=passWordDic[@"password"];
           // NSLog(@"Password:%@",_passWord);
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([_passWord isEqualToString:_oldPassWord.text]) {
                    if ([_xPassword.text isEqualToString:_nxPassWord.text]&&_xPassword!=nil) {
//                        //修改密码
//                        NSURL*newURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.0.123:8090/zynp//appUser/modifyPassword.xhtml?name=%@&password=%@",_name,_xPassword]];
//                        
//                        //创建request对象
//                        NSMutableURLRequest *request1=[NSMutableURLRequest requestWithURL:newURL];
//                        //设置请求方式
//                        [request1 setHTTPMethod:@"post"];
//                        //设置超时时间
//                        [request1 setTimeoutInterval:120];
//                        //设置缓存策略
//                        [request1 setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
//                        //创建NSURLSession对象
//                        NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
//                        //设置请求头内容
//                        [request1 setAllHTTPHeaderFields:oldDic];
//                        //构造session
//                        NSURLSession *session1=[NSURLSession sharedSession];
//                        //构造执行任务的task
//                        NSURLSessionDataTask *task=[session1 dataTaskWithRequest:request1 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                            //
//                            if (error==nil) {
//                                NSString *dataStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//                                NSLog(@"12323：%@",dataStr);
//                            }
//                        }];
//                        [task resume];
                   
        [self dismissViewControllerAnimated:YES completion:nil];
                        _promptInformation.text=@"密码修改成功";
                    }else{
                        _promptInformation.text=@"两次输入的密码不一致";
                    }
                }else{
                    _promptInformation.text=@"原密码不正确";
                }
            });
        }
    }];
    
    [dataTask resume];
}
- (void)clickBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];

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
