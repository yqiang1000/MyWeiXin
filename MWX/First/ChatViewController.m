//
//  ChatViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ChatViewController.h"
@class FirstViewController;

@implementation ChatViewController


- (void)setModel:(FirendModel *)model {
    [self setTitle:[NSString stringWithFormat:@"%@",model.name]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
    [button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = back;

}

- (void)backAction:(UIButton *)button {
    FirstViewController *firstVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"firstVC"];
    
    [self.navigationController popToViewController:firstVC animated:YES];
}

@end
