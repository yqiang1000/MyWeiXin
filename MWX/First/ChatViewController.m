//
//  ChatViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ChatViewController.h"
#import "FirstViewController.h"

@implementation ChatViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)setModel:(FirendModel *)model {
    [self setTitle:[NSString stringWithFormat:@"%@",model.name]];
    [self setTableView];
    if (_model != model) {
        _model = model;
        [_tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];
    [self setTableView];
    
}

- (void)setTableView {
    if (self.tableView == nil) {
        self.tableView = [[TalkTableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
    }
}

- (void)setNavi {
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
    [button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = back;
}

- (void)backAction:(UIButton *)button {
    
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.selectedIndex = 0;
    
}

@end
