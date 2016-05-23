//
//  SearchViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/20.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "SearchViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AVOSCloudManager.h"
#import "SearchTableView.h"
#import "Common.h"

@interface SearchViewController ()

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) SearchTableView *tableView;

@end

@implementation SearchViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.tableView == nil) {
        self.tableView = [[SearchTableView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64) style:UITableViewStylePlain];
        [self.view addSubview:self.tableView];
        _tableView.array = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.searchText.rac_textSignal subscribeNext:^(NSString *text) {
        [self searchPeople:text];
    }];
    
}

- (void)searchPeople:(NSString *)text {
    if (text.length == 0) {
        _tableView.array = nil;
        return;
    }
    
    self.array = [[NSArray alloc] init];
    AVOSCloudManager *manager = [AVOSCloudManager defaultManager];
    [manager searchPerson:text searchResult:^(NSArray *array, NSError *error) {
        
        if (array.count > 0) {
            _array = [array copy];
            _tableView.array = _array;
        } else {
            NSLog(@"匹配失败：%@",error);
            _tableView.array = nil;
        }
    }];
}


- (IBAction)cancelAction:(UIButton *)sender {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}




@end
