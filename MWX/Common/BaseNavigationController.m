//
//  BaseNavigationController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UINavigationBar+Awesome.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:20 weight:2],
                                              };
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor colorWithRed:44.0/255.0 green:151.0/255.0 blue:235.0/255.0 alpha:1.0]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
