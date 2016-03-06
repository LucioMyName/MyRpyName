//
//  STZKCollectionViewController.m
//  ZYNP
//
//  Created by sst on 15/12/24.
//  Copyright © 2015年 sst. All rights reserved.
//

#import "STZKCollectionViewController.h"
#import "ZKViewController.h"
#import "ZKCollectionViewCell.h"
#import "RunStateViewController.h"
#import "STEquipmentState.h"
@interface STZKCollectionViewController ()

@property(nonatomic,strong)NSMutableArray *equipmentArray;

@end

@implementation STZKCollectionViewController
//ES是equipment state的简写
static NSString * const reuseIdentifier = @"ESCell";
- (NSMutableArray*)equipmentArray{
    if (_equipmentArray) {
        _equipmentArray=[NSMutableArray array];
    }
    return _equipmentArray;
}
-(id)init{
    UICollectionViewFlowLayout *layout=[UICollectionViewFlowLayout new];
    layout.itemSize=CGSizeMake(120,140);
    layout.sectionInset=UIEdgeInsetsMake(20, 20, 20, 20);
    return [self initWithCollectionViewLayout:layout];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=[NSString stringWithFormat:@"%@线设备状态",_zkLine.bmid];

    self.collectionView.backgroundColor=[UIColor whiteColor];
    //设置视图cell到collectionview
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZKCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self getEquipmentInformation];
    
}
- (void)getEquipmentInformation{
    //创建请求对象
    NSString *str=[NSString stringWithFormat:@"http://192.168.0.123:8090/zynp/equipment/findByBeltlineId.xhtml?beltlineId=%@",_zkLine.bmid];
    NSURLRequest *requst=[NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    //获取单例session
    NSURLSession *session=[NSURLSession sharedSession];
    //创建任务对象发送请求
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:requst completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //获取状态码
        NSInteger StatudeCode=[(NSHTTPURLResponse *)response statusCode];
        if (StatudeCode ==200) {
            NSError *error=nil;
            NSArray *eqArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
          // NSLog(@"eq:%@",eqArray);
            
            self.equipmentArray=[NSMutableArray array];
            for (NSDictionary *eqDic in eqArray) {
                STEquipmentState *stEqState=[[STEquipmentState alloc]initWithDictionary:eqDic];
                [_equipmentArray addObject:stEqState];
           //     NSLog(@"st:%@",_equipmentArray);
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }
    } ];
    [dataTask resume];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 2;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   ZKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    //数据绑定
    cell.stEquipment=_equipmentArray[indexPath.row];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
//点击跳转事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.hidesBottomBarWhenPushed=YES;
    RunStateViewController *rSVC=[[RunStateViewController alloc]init];
    [self.navigationController pushViewController:rSVC animated:YES];
}
//设置点击触发的方法
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    ZKViewController *zkVC=[ZKViewController new];
//    [self.navigationController presentViewController:zkVC animated:YES completion:nil];
//}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
