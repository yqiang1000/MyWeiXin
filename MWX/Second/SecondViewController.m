//
//  SecondViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "SecondViewController.h"
#import "Common.h"
#import "ListTableView.h"

@interface SecondViewController ()

@property (nonatomic, strong) ListTableView *tableView;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
    [button addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"编辑" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *menu = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = menu;


}

- (void)viewWillAppear:(BOOL)animated {
    if (self.tableView == nil) {
        self.tableView = [[ListTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [self.view addSubview:self.tableView];
    }
    [self.tableView loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
