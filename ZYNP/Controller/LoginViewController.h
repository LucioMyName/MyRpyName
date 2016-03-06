//
//  LoginViewController.h
//  ZYNP
//
//  Created by sst on 15/12/25.
//  Copyright © 2015年 sst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

{//记住登录状态  NO是不记住 YES是记住密码
    
    BOOL isRember;
}
@property(nonatomic,strong)NSNumber *userId;
@end
