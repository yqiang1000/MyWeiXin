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
//#import <Masonry.h>

@implementation ChatViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[IQKeyboardManager sharedManager] setEnable:NO];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification *)note
{
//    NSDictionary *info = [notif userInfo];
//    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
//    CGSize keyboardSize = [value CGRectValue].size;
//    CGFloat y = [value CGRectValue].origin.y;
//    NSLog(@"y:%f", y);
//    NSLog(@"keyBoard:%f", keyboardSize.height);  //216
//    ///keyboardWasShown = YES;
//    [UIView animateWithDuration:0.05 animations:^{
//        self.editView.frame = CGRectMake(0, kHeight - keyboardSize.height - 40, kWidth, 40);
//    }];
//
    
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat deltaY=keyBoardRect.size.height;
    
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        
        self.view.transform=CGAffineTransformMakeTranslation(0, -deltaY);
    }];
}

- (void)keyboardWasHidden:(NSNotification *)note
{
//    NSDictionary *info = [notif userInfo];
//    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
//    CGSize keyboardSize = [value CGRectValue].size;
//    NSLog(@"keyboardWasHidden keyBoard:%f", keyboardSize.height);
//    [UIView animateWithDuration:0.05 animations:^{
//        self.editView.frame = CGRectMake(0, kHeight - 40, kWidth, 40);
//    }];
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        self.view.transform = CGAffineTransformIdentity;
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
        self.editView = [[EditView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40)];
//        self.editView.backgroundColor = [UIColor redColor];
        [self.view addSubview:self.editView];
    }
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
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

/*
 亲爱的先生们，
 
 你好吗？我很高兴在这里见到你。
 
 这是从东阳海峡金银丝有限公司百合，我们的工厂位于东阳，中国。我公司是一家专业的金葱粉生产厂家多年的经验。
 
 为您提供稳定的服务和良好的质量，我们的工厂拥有以下优势：
 
 1。我们有超过20年的闪光粉经验。
 
 2。我们有超过100名员工，以满足每月容量100吨，我们有各种各样的闪光，包括所有的大小和颜色。
 
 3。我们有强大的专业团队来支持你。
 
 4。我们有最好的价格，质量好。
 
 欢迎您来我们工厂参观，我期待您的尽快回复。非常感谢，我们相信如果你能给我们机会，我们将成为你的诚实的合作伙伴。
 
 谢谢和最诚挚的问候
 
 莉莉
 
 
 Dear Sirs,
 How are you? I am very glad to meet you here .
 This is Lily from Dongyang Haixia Golden and Silver Silks Co., Ltd , our factory located in Dongyang ,China .Our company is a professional glitter powder manufacturer with years’ experience .
 We are a profession company with many years of experience in glitter powder manufacturer.
 
 In order to provide you with the more stable service and better quality, we have the following advantages:
 
 1. We have more than 20 years experience in glitter powder .
 2. We have more than 100 employees to meet the monthly capacity 100 tons , we have many kinds of glitter , including many different sizes and colors .
 3. We have a strong and professional team just to support you .
 4. We have best price with best quality .
 
 You are welcome to visit our factory, I am looking forward to your reply as soon as possible. Thanks a lot , we do believe that if you can give us the opportunity, we will grasp the chance and to be your honest partner
 
 Thanks & Best regards
 Lily
 */

@end
