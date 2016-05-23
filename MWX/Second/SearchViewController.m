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

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    AVOSCloudManager *manager = [AVOSCloudManager defaultManager];
    
    [self.searchText.rac_textSignal subscribeNext:^(NSString *text) {
        
    }];
    
}


- (IBAction)cancelAction:(UIButton *)sender {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}




@end
