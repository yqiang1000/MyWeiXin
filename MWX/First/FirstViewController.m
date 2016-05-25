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
#import "ChatTableView.h"
#import "ConversationManager.h"
#import "ConverSationModel.h"


@interface FirstViewController ()<AVIMClientDelegate>

@property (nonatomic, strong) AVOSCloudManager *manager;
//@property (nonatomic, strong) AVIMClient *client;
@property (nonatomic, strong) ChatTableView *tableView;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    
    if (![self userIsLogined]) {
        return;
    }
    [self setClient];
    if (_tableView == nil) {
        self.tableView = [[ChatTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
    }
    [self.tableView reloadData];
    
}

- (void)setClient {
    self.client = [AVIMClient defaultClient];
    self.client.delegate = self;
    
    [self.client openWithClientId:[AVUser currentUser].username callback:^(BOOL succeeded, NSError *error) {
        AVIMConversationQuery *query = [self.client conversationQuery];
        [query findConversationsWithCallback:^(NSArray *objects, NSError *error) {
            if (!error) {
                AVIMConversation *conversation = [objects firstObject];

            } else {
                NSLog(@"添加失败:%@",error);
            }
        }];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"微信"];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    self.client = [AVIMClient defaultClient];
    self.client.delegate = self;
//    ConversationManager *manager = [ConversationManager defaultManager];
//    [manager createConversationWithClient:_client WithName:@"guoyueqi" ClientIds:@[@"guoyueqi"] complete:^(AVIMConversation *conversation, BOOL isSave)  {
//        if (isSave) {
//            [manager sendMessageWithConversation:conversation WithMessage:@"hello"];
//        }
//    }];
    
    [self sendMessage];
}

- (void)sendMessage {
    ConversationManager *manager = [ConversationManager defaultManager];
    [self.client openWithClientId:@"guoyueqi" callback:^(BOOL succeeded, NSError *error) {
        
    }];
    
//    manager sendMessageWithConversation:<#(AVIMConversation *)#> WithMessage:<#(NSString *)#>
    
}



- (void)sendToPengxiuxiu:(NSString *)name  {
    if (self.conversationDic == nil) {
        self.conversationDic = [[NSMutableDictionary alloc] init];
    }
    self.client = [AVIMClient defaultClient];
    AVUser *currentUser = [AVUser currentUser];
    [self.client openWithClientId:currentUser.username callback:^(BOOL succeeded, NSError *error) {
        [self.client createConversationWithName:name clientIds:@[name] callback:^(AVIMConversation *conversation, NSError *error) {
            
            [self.conversationDic setObject:conversation.conversationId forKey:conversation.name];
            
            NSUserDefaults *dic = [NSUserDefaults standardUserDefaults];
            [dic setObject:self.conversationDic forKey:@"conversationDic"];
            [dic synchronize];
            
        }];
    }];
    
}


- (void)receiveMessage {
    self.client = [AVIMClient defaultClient];
    self.client.delegate = self;
    [self.client openWithClientId:[AVUser currentUser].username callback:^(BOOL succeeded, NSError *error) {
        
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
