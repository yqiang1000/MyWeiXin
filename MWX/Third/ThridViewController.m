//
//  ThridViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ThridViewController.h"
#import <AVIMClient.h>
#import <AVIMConversationQuery.h>
#import <AVIMConversation.h>

@interface ThridViewController ()
@property (nonatomic,strong)AVIMClient *client;
@end

@implementation ThridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    
    
    [self getMsg];
    
}

- (void)getMsg{
    NSLog(@"66");
    self.client = [[AVIMClient alloc]init];
    [self.client openWithClientId:@"pengxiuxiu" callback:^(BOOL succeeded, NSError *error) {
        NSLog(@"^^^^%@",self.client);
        AVIMConversationQuery *query = [self.client conversationQuery];
        NSLog(@"&&&&&%@",query);
        [query getConversationById:@"5743fa46df0eea0063aca913" callback:^(AVIMConversation *conversation, NSError *error) {
            NSLog(@"*****%@",conversation);
            [conversation queryMessagesWithLimit:5 callback:^(NSArray *objects, NSError *error) {
                NSLog(@"----%@",objects);
            }];
        }];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
