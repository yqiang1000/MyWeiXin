//
//  BaseViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "BaseViewController.h"
#import "Common.h"
#import "AutoHideHub.h"
#import "ThemeManager.h"
#import "ListTableView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [self userIsLogined];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChange) name:kThemeChange object:nil];
    
}

-(void)themeChange {
    ThemeManager *manager = [ThemeManager shareInstance];
    
    UIImage *image = [manager getThemeImage:@"bg_home.jpg"];
    
    for (ListTableView *tableview in self.view.subviews) {
        
        tableview.backgroundColor = [UIColor colorWithPatternImage:image];
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)userIsLogined {

    AVUser *user = [AVUser currentUser];
    __block BOOL isLoad = NO;
    if (user == nil) {
        LoginTableViewController *loginVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginVC"];
        [self presentViewController:loginVC animated:YES completion:nil];
        isLoad = NO;
    } else {
        self.client = [AVIMClient defaultClient];
        [self.client openWithClientId:[AVUser currentUser].username callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                isLoad = YES;
            } else {
                NSLog(@"登录失败：%@",error);
                isLoad = NO;
            }
        }];
    }
    return isLoad;
}



@end
