//
//  RunStateViewController.m
//  ZYNP
//
//  Created by sst on 15/12/31.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "RunStateViewController.h"
#import "EquipmentState.h"

@interface RunStateViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property(nonatomic,strong)EquipmentState*equipentStates;
@property (nonatomic,assign)NSInteger a;
@property(nonatomic,strong)RunOrbitView *runOrbitView;
@property(nonatomic,strong)workStateView*workState;
@property(nonatomic,strong)NSArray *equipmemtStateArray;

@end


@implementation RunStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.runOrbitView.hidden = YES;
    self.workState.hidden = NO;
    [self testData];
    
    //设置segement
   [_segment addTarget:self action:@selector(switchChart:) forControlEvents:UIControlEventValueChanged];
    
    
  
 }

- (RunOrbitView *)runOrbitView
{
    if(!_runOrbitView )
    {
        _runOrbitView =  [[RunOrbitView alloc]initWithFrame:CGRectMake(0,140,375,480)];
        self.runOrbitView.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:_runOrbitView];
    }
    return _runOrbitView;
}

- (workStateView *)workState
{
    if(!_workState )
    {
        _workState=[[workStateView alloc]initWithFrame:CGRectMake(0,140,375,480)];
        self.workState.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:_workState];
    }
    return _workState;
}

//设置segement点击触发的方法
- (void)switchChart:(UISegmentedControl*)sender{
    switch (sender.selectedSegmentIndex) {
        case 0:{
            self.runOrbitView.hidden = YES;
            self.workState.hidden = NO;
        }
            break;
        
        case 1:{
            self.runOrbitView.hidden = NO;
            self.workState.hidden = YES;

        }
            break;
            
        default:
            break;
    }
}


- (void)testData{
    NSString *str=[NSString stringWithFormat:@"http://192.168.0.123:8090/zynp/equipmentLog/findEquipmentLogByDate.xhtml?equiment=B10&date=2015-12-01"];
    //获取网络数据，设置请求对象
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    //获取单例的session
    NSURLSession *session=[NSURLSession sharedSession];
    //创建任务对象发送请求
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //获取状态码
        NSInteger stateCode=[(NSHTTPURLResponse*)response statusCode];
        if (stateCode ==200) {
            NSError *error=nil;
            _equipmemtStateArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
       // NSLog(@"equipmentState:%@",equipmemtStateArray);
            
            //发送通知(设置通知进行传值)
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter]postNotificationName:@"passInformation" object:self userInfo:@{@"_equipmemtStateArray":_equipmemtStateArray}];
            });
     }
    }];
    
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
