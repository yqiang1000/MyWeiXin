//
//  AutoHideHub.m
//  rrdTK
//
//  Created by yangaichun on 16/2/1.
//  Copyright © 2016年 com.weiba66. All rights reserved.
//

#import "AutoHideHub.h"
#import "MBProgressHUD.h"

#define ShowTime 1.5       //显示时间

@implementation AutoHideHub


// 在最上层视图显示一个自动消失的hub
+(void)showAutoHideHubInTop:(NSString *)msg;{
    [self showAutoHideHub:msg InView:[UIApplication sharedApplication].keyWindow];
}



+(void)showAutoHideHub:(NSString *)msg InView:(UIView *)view;{
    MBProgressHUD *hub;
    if (view) {
        hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hub.mode = MBProgressHUDModeText;
        hub.labelText = msg;
        hub.removeFromSuperViewOnHide = YES;
        [hub hide:YES afterDelay:ShowTime];
    }
}

@end
