//
//  FourthViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "FourthViewController.h"
#import "ThemeTableViewController.h"
#import "Common.h"
#import "SetTableView.h"
#import "ThemeManager.h"

@interface FourthViewController ()

@property (strong, nonatomic) SetTableView *tableView;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我";
    
    self.tableView = [[SetTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    self.tableView.back = ^{
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf action];
        
    };
    
    self.tableView.click = ^{
        [weakSelf jumpToController];
    };
    
}


- (void)action {
    [AVUser logOut];
    [self userIsLogined];
}

- (void)jumpToController{
    ThemeTableViewController *theme = [[ThemeTableViewController alloc]init];
    [self.navigationController pushViewController:theme animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
