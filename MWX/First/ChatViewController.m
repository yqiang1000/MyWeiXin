//
//  ChatViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ChatViewController.h"
#import "FirstViewController.h"
#import "Common.h"
#import <IQKeyboardManager.h>

@implementation ChatViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[IQKeyboardManager sharedManager] setEnable:NO];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification *)notif
{
    NSDictionary *info = [notif userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    CGFloat y = [value CGRectValue].origin.y;
    NSLog(@"y:%f", y);
    NSLog(@"keyBoard:%f", keyboardSize.height);  //216
    ///keyboardWasShown = YES;
    [UIView animateWithDuration:0.05 animations:^{
        self.editView.frame = CGRectMake(0, kHeight - keyboardSize.height - 40, kWidth, 40);
    }];
}

- (void)keyboardWasHidden:(NSNotification *)notif
{
    NSDictionary *info = [notif userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    NSLog(@"keyboardWasHidden keyBoard:%f", keyboardSize.height);
    [UIView animateWithDuration:0.05 animations:^{
        self.editView.frame = CGRectMake(0, kHeight - 40, kWidth, 40);
    }];
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[IQKeyboardManager sharedManager] setEnable:YES];
}

- (void)setModel:(FirendModel *)model {
    [self setTitle:[NSString stringWithFormat:@"%@",model.name]];
    [self setTableView];
    if (_model != model) {
        _model = model;
        [_tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];
    [self setTableView];
    
}

- (void)setTableView {
//    CGRectMake(0, 64, kWidth, kHeight-64-40)
    if (self.tableView == nil) {
        self.tableView = [[TalkTableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 104) style:UITableViewStylePlain];
        [self.view addSubview:self.tableView];
        
    }
    
    if (self.editView == nil) {
        self.editView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40)];
        self.editView.backgroundColor = [UIColor redColor];
        [self.view addSubview:self.editView];
    }
    
}

- (void)setNavi {
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
    [button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = back;
}

- (void)backAction:(UIButton *)button {
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
