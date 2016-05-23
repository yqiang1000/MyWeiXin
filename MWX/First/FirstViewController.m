//
//  FirstViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "FirstViewController.h"
#import "Common.h"
#import "AVOSCloudManager.h"
#import <AVIMClient.h>
#import <AVIMConversation.h>
#import <AVIMTextMessage.h>
#import "ChatTableView.h"

@interface FirstViewController ()<AVIMClientDelegate>

@property (nonatomic, strong) AVOSCloudManager *manager;
@property (nonatomic, strong) AVIMClient *client;
@property (nonatomic, strong) ChatTableView *tableView;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [self userIsLogined];
    
    if (_tableView == nil) {
        self.tableView = [[ChatTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
    }
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"微信"];
    
//    [self sendToPengxiuxiu];
    [self receiveMessage];

}


- (void)sendToPengxiuxiu {
    self.client = [[AVIMClient alloc] init];
    [self.client openWithClientId:@"yeqiang" callback:^(BOOL succeeded, NSError *error) {
        [self.client createConversationWithName:@"maoAndmouse" clientIds:@[@"xiuxiu"] callback:^(AVIMConversation *conversation, NSError *error) {
            [conversation sendMessage:[AVIMTextMessage messageWithText:@"hello" attributes:nil] callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"fasongchenggong");
                } else {
                    NSLog(@"fasongshibai:%@",error);
                }
            }];
        }];
    }];
    
}


- (void)receiveMessage {
    self.client = [[AVIMClient alloc] init];
    _client.delegate = self;
    [_client openWithClientId:@"xiuxiu" callback:^(BOOL succeeded, NSError *error) {
        
    }];
}

- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message {
    NSLog(@"%@",message.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
