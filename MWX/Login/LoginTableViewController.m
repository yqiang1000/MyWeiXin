//
//  LoginTableViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "LoginTableViewController.h"
#import "Common.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LoginTableViewController ()

@end

@implementation LoginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.login.layer.cornerRadius = 5;
    self.login.layer.masksToBounds = YES;
    
    [self createSignal];
    
}

- (void)createSignal {
    RACSignal *accountSignal = [self.account.rac_textSignal map:^id(NSString *text) {
        self.account.backgroundColor = text.length > 0 ? [UIColor orangeColor]:[UIColor clearColor];
        return @(text.length > 0 ? YES: NO);
    }];
    RACSignal *passwordSignal = [self.password.rac_textSignal map:^id(NSString *text) {
        self.password.backgroundColor = text.length > 0 ? [UIColor orangeColor]:[UIColor clearColor];
        return @(text.length > 0 ? YES: NO);
    }];
    
    RACSignal *loginSignal = [[RACSignal combineLatest:@[accountSignal, passwordSignal] reduce:^id(NSNumber *accountNum, NSNumber *passwordNum){
        return @([accountNum boolValue] && [passwordNum boolValue]);
    }] subscribeNext:^(NSNumber *num) {
        
        self.login.alpha = [num boolValue]?1.0:0.5;
        self.login.enabled = [num boolValue];
    }];
    
    [[self.login rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self loginAction];
    }];
    
}

- (void)loginAction {
    
    AVUser *user = [AVUser user];
    [AVUser logInWithUsernameInBackground:_account.text password:_password.text block:^(AVUser *user, NSError *error) {
        if (error) {
            NSLog(@"登陆失败,error:%@",error);
        } else {
            NSLog(@"登陆成功");
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}



@end