//
//  ConversationManager.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/24.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ConversationManager.h"

#define kConversationDic @"conversationDic"

@implementation ConversationManager

+ (ConversationManager *)defaultManager {
    static ConversationManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
        [ConversationManager saveWithDic:[[NSMutableDictionary alloc] init]];
    });
    return manager;
}

+ (void)saveWithDic:(NSDictionary *)dic
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:dic forKey:kConversationDic];
}

- (void)createConversationWithClient:(AVIMClient *)client WithName:(NSString *)name ClientIds:(NSArray *)clientIds complete:(CompleteBlock)block {
    [client openWithClientId:[AVUser currentUser].username callback:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"打开客户端成功");
            [client createConversationWithName:name clientIds:clientIds callback:^(AVIMConversation *conversation, NSError *error) {
                BOOL isSave = NO;
                if (!error) {
                    NSMutableDictionary *conversationDic = [[NSUserDefaults standardUserDefaults] objectForKey:kConversationDic];
                    [conversationDic setObject:conversation.conversationId forKey:conversation.name];
                    
                    [[self class] saveWithDic:conversationDic];
                    
                    NSLog(@"聊天创建并保存成功");
                    isSave = YES;
                } else {
                    NSLog(@"聊天创建失败:%@",error);
                }
                if (block){
                    block(conversation,isSave);
                }
            }];
        } else {
            NSLog(@"打开客户端失败:%@",error);
        }
    }];
}


//send message
- (void)sendMessageWithConversation:(AVIMConversation *)conversation WithMessage:(NSString *)text {
    [conversation sendMessage:[AVIMTextMessage messageWithText:text attributes:nil] callback:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"发送成功");
        } else {
            NSLog(@"发送失败:%@",error);
        }
    }];
}


- (void)queryConversationWithClient:(AVIMClient *)client Name:(NSString *)name complete:(CompleteBlock)block {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *conversationDci = [NSMutableDictionary dictionaryWithDictionary:[userDefaults objectForKey:kConversationDic]];
    NSString *conversationId = [conversationDci valueForKey:name];
    
//    client openWithClientId:<#(NSString *)#> callback:<#^(BOOL succeeded, NSError *error)callback#>
    
    
}

@end
