//
//  NumberCountViewController.m
//  ZYNP
//
//  Created by sst on 16/2/22.
//  Copyright © 2016年 sst. All rights reserved.
//

#import "NumberCountViewController.h"
#import "CountTableViewCell.h"
#import "SCJHViewController.h"
#import "NumberCountModel.h"
@interface NumberCountViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *numberCountTableView;
@property(nonatomic,strong)NSMutableArray *numberMutableArray;

@end

@implementation NumberCountViewController

- (NSArray*)numberCountArray{
    if (!_numberCountArray) {
        _numberCountArray=[[NSArray alloc]init];
    }
    return _numberCountArray;
}
- (NSMutableArray*)numberMutableArray{
    if (!_numberMutableArray) {
        _numberMutableArray=[NSMutableArray array];
    }
    return _numberMutableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"计划统计";
    //代码创建tableview
    _numberCountTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,30, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _numberCountTableView.rowHeight=220;
    //设置消除tableview与导航栏之间的空白
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:_numberCountTableView];
    _numberCountTableView.delegate=self;
    _numberCountTableView.dataSource=self;
    //接收上页的传值
   // NSLog(@"numberCountArray:%@",_numberCountArray);
    for (NSDictionary *numberDic in _numberCountArray) {
        NumberCountModel *numberModels=[[NumberCountModel alloc]initWithDictionary:numberDic];
        [self.numberMutableArray addObject:numberModels];
       // NSLog(@"_numberMutableArray:%@",self.numberMutableArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            [_numberCountTableView reloadData];
        });
}
//    for (int i=0; i<[_numberCountArray count]; i++) {
//        NSDictionary *numberDic=_numberCountArray[i];
//        NumberCountModel *numberModels=[[NumberCountModel alloc]initWithDictionary:numberDic];
//                [self.numberMutableArray addObject:numberModels];
//                NSLog(@"_numberMutableArray:%@",self.numberMutableArray);
//        NSLog(@"数组1：%lu",(unsigned long)[_numberCountArray count]);
//        NSLog(@"数组2：%lu",[_numberMutableArray count]);
//    }
}

//数组模型化循环解析


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberMutableArray.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier= @"CountCell";
    CountTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"CountTableViewCell" owner:nil options:nil][0];
        
    }
    
    //设置cell不可响应点击动作
    cell.selectionStyle=UITableViewCellAccessoryNone;
    //  数据绑定
    cell.numberModel=self.numberMutableArray[indexPath.row];
    return cell;
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
