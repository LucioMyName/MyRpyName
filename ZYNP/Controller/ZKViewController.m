//
//  ZKViewController.m
//  ZYNP
//
//  Created by sst on 15/12/22.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "ZKViewController.h"
#import "ZKAssemblyLines.h"
#import "ZYNPTableViewCell.h"
#import "STZKCollectionViewController.h"
@interface ZKViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)ZYNPTableViewCell *ZKCell;
@property(nonatomic,strong)NSMutableArray *cxMutArray;
@property(nonatomic,strong)UITableView *zktableView;
@end

@implementation ZKViewController

- (NSMutableArray*) cxMutArray{
    if (_cxMutArray==nil) {
        _cxMutArray=[NSMutableArray array];
    }
    return _cxMutArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _zktableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, self.view.bounds.size.height-40) style:UITableViewStyleGrouped];
    _zktableView.rowHeight=140;
    [self.view addSubview:_zktableView];
    _zktableView.delegate=self;
    _zktableView.dataSource=self;
    [self getJSONData];
}

//数据处理
-(void)getJSONData{
    //创建NSURLRequest对象
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.123:8090/zynp/plan/findByProperties.xhtml?status=%E7%94%9F%E4%BA%A7"]];
    //获取单例对象NSURLSession
    NSURLSession *session=[NSURLSession sharedSession];
    //创建任务对象发送请求
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //获取状态码
        NSInteger statusCode=[(NSHTTPURLResponse*)response statusCode];
        if (statusCode==200) {
            //解析Json（NSData---->NSArray）
            NSError *error=nil;
            NSArray *cxArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
           // NSLog(@"%@",cxArray);
//            self.cxMutArray=[NSMutableArray array];
            for (NSDictionary *cxDic in cxArray) {
                ZKAssemblyLines *zkLines=[[ZKAssemblyLines alloc]initWithDictionary:cxDic];
                [self.cxMutArray addObject:zkLines];
            
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [_zktableView reloadData];
            });
             //NSLog(@"CX:%@",_cxMutArray);
            
        }
    }];
    [dataTask resume];
}

//创建组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//创建行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cxMutArray.count;
}
//创建行的内容】
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier=@"ZKCell";
    ZYNPTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"ZYNPTableViewCell" owner:nil options:nil][0];
        
    }
    //数据绑定
    cell.zkAssemblyLines=_cxMutArray[indexPath.row];
    
    return cell;
}
//设置点击跳转事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.hidesBottomBarWhenPushed=YES;
    ZKAssemblyLines *zkLines=self.cxMutArray[indexPath.row];
    STZKCollectionViewController *stzkVc=[[STZKCollectionViewController alloc]init];
    stzkVc.zkLine=zkLines;
    [self.navigationController pushViewController:stzkVc animated:YES];
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
