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

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ListTableView *tableView = [[ListTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
