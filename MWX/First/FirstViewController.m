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
//#import <AVIMClient.h>
//#import <AVIMConversation.h>
//#import <AVIMTextMessage.h>
#import "ChatTableView.h"
#import <AVOSCloudIM.h>

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
    

//    self.client = [AVIMClient defaultClient];
//    _client.delegate = self;
//    [self.client openWithClientId:@"yeqiang" callback:^(BOOL succeeded, NSError *error) {
//        AVIMConversationQuery *query = [self.client conversationQuery];
//        [query findConversationsWithCallback:^(NSArray *objects, NSError *error) {
//            if (!error) {
//                NSLog(@"添加成功");
//                NSLog(@"%@",objects);
//                AVIMConversation *conversation = [objects firstObject];
////                conversation.creator;
//            } else {
//                NSLog(@"添加失败:%@",error);
//            }
//        }];
//    }];
//    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"微信"];
    
    [self sendToPengxiuxiu:@"pengxiuxiu"];
//    [self receiveMessage];

}


- (void)sendToPengxiuxiu:(NSString *)name  {

    self.client = [AVIMClient defaultClient];
    AVUser *currentUser = [AVUser currentUser];
    [self.client openWithClientId:currentUser.username callback:^(BOOL succeeded, NSError *error) {
        [self.client createConversationWithName:name clientIds:@[name] callback:^(AVIMConversation *conversation, NSError *error) {
            [conversation sendMessage:[AVIMTextMessage messageWithText:@"nice to meet you" attributes:nil] callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功");
                } else {
                    NSLog(@"发送失败:%@",error);
                }
            }];
        }];
    }];
    
}


- (void)receiveMessage {
    self.client = [AVIMClient defaultClient];
    _client.delegate = self;
    [_client openWithClientId:[AVUser currentUser].username callback:^(BOOL succeeded, NSError *error) {
        
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
