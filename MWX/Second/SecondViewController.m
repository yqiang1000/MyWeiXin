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
    
    self.tableView = [[ListTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];

}

- (void)viewWillAppear:(BOOL)animated {
    if (self.tableView == nil) {
        self.tableView = [[ListTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    [self.tableView loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
