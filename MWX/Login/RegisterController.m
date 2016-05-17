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
    
    [[[[self.registerButton rac_signalForControlEvents:UIControlEventTouchUpInside] doNext:^(id x) {
        self.registerButton.enabled = NO;
        self.registerButton.alpha = 0.5;
    }] flattenMap:^RACStream *(id value) {
        return [self registerSignal];
    }] subscribeNext:^(NSError *error) {
        self.registerButton.enabled = YES;
        self.registerButton.alpha = 1.0;
        if (!error) {
            NSLog(@"注册成功");
            [AutoHideHub showAutoHideHubInTop:@"注册成功"];
            if (self.loginBlock) {
                self.loginBlock();
            }
            [self cancelAction:nil];
        } else {
            NSLog(@"注册失败,error:%@",error);
            NSString *string = [error.userInfo valueForKey:@"error"];
            [AutoHideHub showAutoHideHubInTop:string];
        }
    }];
    
}


- (RACSignal *)registerSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AVUser *user = [AVUser user];
        user.username = self.account.text;
        user.password = self.password.text;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            [subscriber sendNext:error];
            [subscriber sendCompleted];
        }];
        return nil;
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
