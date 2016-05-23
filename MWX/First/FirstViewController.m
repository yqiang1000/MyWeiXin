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


@interface FirstViewController ()<AVIMClientDelegate>

@property (nonatomic, strong) AVOSCloudManager *manager;
@property (nonatomic, strong) AVIMClient *client;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [self userIsLogined];
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
            [conversation sendMessage:[AVIMTextMessage messageWithText:@"hello world" attributes:nil] callback:^(BOOL succeeded, NSError *error) {
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
