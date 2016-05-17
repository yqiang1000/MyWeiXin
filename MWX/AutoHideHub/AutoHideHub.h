//
//  AutoHideHub.h
//  rrdTK
//
//  Created by yangaichun on 16/2/1.
//  Copyright © 2016年 com.weiba66. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AutoHideHub : NSObject


// 在最上层视图显示一个自动消失的hub
+(void)showAutoHideHubInTop:(NSString *)msg;


// 显示一个自动消失的hub
+(void)showAutoHideHub:(NSString *)msg InView:(UIView *)view;

@end
