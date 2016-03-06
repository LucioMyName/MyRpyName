//
//  SCJHViewController.m
//  ZYNP
//
//  Created by sst on 15/12/24.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "SCJHViewController.h"
#import "SCJHCell.h"
#import "SCJDViewController.h"
#import "ScjhModels.h"
#import "planScheduleView.h"
#import "NumberCountViewController.h"
@interface SCJHViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *scjhMutArray;
@property(nonatomic,strong)NSDictionary *scjhDic;
@property(nonatomic,strong)SCJHCell *scjhCell;
@property(nonatomic,strong)UITableView *scjhTableView;
@property(nonatomic,strong)NSArray *scjhArray;
@end

@implementation SCJHViewController
- (NSMutableArray*)scjhMutArray{
    if (_scjhMutArray==nil) {
        _scjhMutArray=[NSMutableArray array];
    }
    return _scjhMutArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _scjhTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, self.view.bounds.size.height-40) style:UITableViewStyleGrouped];
    [self.view addSubview:_scjhTableView];
    _scjhTableView.rowHeight=140;
    _scjhTableView.delegate=self;
    _scjhTableView.dataSource=self;
    [self getJSONData];
}
- (void)getJSONData{
    //创建请求对象
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.123:8090/zynp/plan/findByProperties.xhtml"]];
    //获取单例对象session
    NSURLSession *session=[NSURLSession sharedSession];
    //创建任务对象发送请求
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //获取状态码
        NSInteger statusCode=[(NSHTTPURLResponse*)response statusCode];
        if (statusCode==200) {
            NSError *error=nil;
            //解析json，(NSData--->NSArray)
            _scjhArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
           // NSLog(@"%@",_scjhArray);
            //self.scjhMutArray=[NSMutableArray array];
            for (NSDictionary *scjhDic in _scjhArray) {
                ScjhModels *scjhModels=[[ScjhModels alloc]initWithDictionary:scjhDic];
                [_scjhMutArray addObject:scjhModels];
             // NSLog(@"scjhM:%@",self.scjhMutArray);
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [_scjhTableView reloadData];
            });
        }
    }];
    [dataTask resume];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.scjhMutArray.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString *identifier=@"scjhCell";
    SCJHCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"SCJHCell" owner:nil options:nil][0];
    }
    //数据绑定
    
    cell.scjhModel=_scjhMutArray[indexPath.row];
    return cell;
}
//点击tableviewcell的跳转事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.hidesBottomBarWhenPushed=YES;
    ScjhModels *scjhM=self.scjhMutArray[indexPath.row];
    SCJDViewController *scjdVc=[[SCJDViewController alloc]init];
    scjdVc.scjhM=scjhM;
    [self.navigationController pushViewController:scjdVc animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
//跳转到数据统计页面
- (IBAction)clickEnterCountPage:(UIBarButtonItem *)sender {
    //跳转
    self.hidesBottomBarWhenPushed=YES;
    NumberCountViewController *ncVC=[[NumberCountViewController alloc]init];
    ncVC.numberCountArray=self.scjhArray;
    [self.navigationController pushViewController:ncVC animated:YES];
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
