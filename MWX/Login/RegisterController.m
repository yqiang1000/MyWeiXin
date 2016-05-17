//
//  RegisterController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "RegisterController.h"
#import "Common.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AutoHideHub.h"

@interface RegisterController ()

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.registerButton.layer.cornerRadius = 5;
    self.registerButton.layer.masksToBounds = YES;
    
    [self createSignal];
}

- (void)createSignal {
    RACSignal *accountSignal = [self.account.rac_textSignal map:^id(NSString *text) {
        self.account.backgroundColor = [UIColor clearColor];
        return @(text.length > 0 ? YES: NO);
    }];
    RACSignal *passwordSignal = [self.password.rac_textSignal map:^id(NSString *text) {
        self.password.backgroundColor = [UIColor clearColor];
        return @(text.length > 0 ? YES: NO);
    }];
    
    RACSignal *registerSignal = [[RACSignal combineLatest:@[accountSignal, passwordSignal] reduce:^id(NSNumber *accountNum, NSNumber *passwordNum){
        return @([accountNum boolValue] && [passwordNum boolValue]);
    }] subscribeNext:^(NSNumber *num) {
        
        self.registerButton.alpha = [num boolValue]?1.0:0.5;
        self.registerButton.enabled = [num boolValue];
    }];
    
    [[self.registerButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self registerAction];
    }];
    
}


- (void)registerAction {
    
    AVUser *user = [AVUser user];
    user.username = self.account.text;
    user.password = self.password.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"注册成功");
            [AutoHideHub showAutoHideHubInTop:@"注册成功"];
            [self dismissViewControllerAnimated:YES completion:nil];
            if (self.loginBlock) {
                self.loginBlock();
            }
            
        } else {
            NSLog(@"注册失败");
            [AutoHideHub showAutoHideHubInTop:@"注册失败"];
        }
    }];
    

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

- (IBAction)cancelAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
