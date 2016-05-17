//
//  BaseTabBarController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "BaseTabBarController.h"
#import "Common.h"
#define Num 4

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTabBar];
}

- (void)setTabBar {
    
    for (UIView *view in self.tabBar.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
    }
    
    
    
    NSArray *bNames = @[@"微信",@"通讯录",@"发现",@"我"];
    CGFloat bWidth = kWidth / Num;
    UIImageView *selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, bWidth, 49)];
    selectView.backgroundColor = [UIColor darkGrayColor];
    [self.tabBar addSubview:selectView];
    
    for (NSInteger i = 0; i < Num; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * bWidth, 0, bWidth, 49)];
        
        [button setTitle:bNames[i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor purpleColor]];
        button.tag = i;
        [button addTarget:self action:@selector(barButtonSelectd:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
    }
}


- (void)barButtonSelectd:(UIButton *)button {
    NSInteger tag = button.tag;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
