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
#import "RegisterController.h"
#import "AutoHideHub.h"

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
//        self.account.backgroundColor = text.length > 0 ? [UIColor orangeColor]:[UIColor clearColor];
        return @(text.length > 0 ? YES: NO);
    }];
    RACSignal *passwordSignal = [self.password.rac_textSignal map:^id(NSString *text) {
//        self.password.backgroundColor = text.length > 0 ? [UIColor orangeColor]:[UIColor clearColor];
        return @(text.length > 0 ? YES: NO);
    }];
    
    RACSignal *loginSignal = [[RACSignal combineLatest:@[accountSignal, passwordSignal] reduce:^id(NSNumber *accountNum, NSNumber *passwordNum){
        return @([accountNum boolValue] && [passwordNum boolValue]);
    }] subscribeNext:^(NSNumber *num) {
        
        
        
        self.login.alpha = [num boolValue]?1.0:0.5;
        self.login.enabled = [num boolValue];
    }];
    
    [[[[self.login rac_signalForControlEvents:UIControlEventTouchUpInside] doNext:^(id x) {
        self.login.alpha = 0.5;
        self.login.enabled = NO;
    }] flattenMap:^RACStream *(id value) {
        return [self signInSignal];
    }] subscribeNext:^(NSError *error) {
        self.login.alpha = 1.0;
        self.login.enabled = YES;
        if (!error) {
            [AutoHideHub showAutoHideHubInTop:@"登陆成功"];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSLog(@"登陆失败,error:%@",error);
            [AutoHideHub showAutoHideHubInTop:@"用户名或密码错误"];
        }
    }];
    
    [[self.registerButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self registerAction];
    }];
    
}

#pragma mark - login

- (RACSignal *)signInSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [AVUser logInWithUsernameInBackground:self.account.text password:self.password.text block:^(AVUser *user, NSError *error) {
            
            [subscriber sendNext:error];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}


#pragma mark - register
- (void)registerAction {
    
    RegisterController *registerController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"registerVC"];
    registerController.loginBlock = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    [self presentViewController:registerController animated:YES completion:nil];
    
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
    return 6;
}



@end
