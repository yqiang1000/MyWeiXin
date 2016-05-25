//
//  BaseViewController.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVIMClient.h>

@interface BaseViewController : UIViewController

@property (strong, nonatomic) AVIMClient *client;
- (BOOL)userIsLogined;

@end
