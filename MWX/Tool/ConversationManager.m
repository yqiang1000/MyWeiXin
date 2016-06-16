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
        [manager saveWithDic:[[NSMutableDictionary alloc] init]];
    });
    return manager;
}

- (void)saveWithDic:(NSDictionary *)dic
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:dic forKey:kConversationDic];
}

- (void)createConversationWithClient:(AVIMClient *)client WithName:(NSString *)name ClientIds:(NSArray *)clientIds complete:(CompleteBlock)block {
    
    ConversationManager *manager = [ConversationManager defaultManager];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *conversationDic = [[NSMutableDictionary alloc] initWithDictionary:[userDefaults objectForKey:kConversationDic]];
    
    if ([conversationDic valueForKey:name] == nil) {
        
        NSLog(@"对话不存在，需要重新创建");
        [client createConversationWithName:name clientIds:clientIds callback:^(AVIMConversation *conversation, NSError *error) {
            BOOL isSave = NO;
            if (!error) {
                
                [conversationDic setObject:conversation.conversationId forKey:conversation.name];
                [manager saveWithDic:conversationDic];
                NSLog(@"对话创建并保存成功");
                isSave = YES;
                
            } else {
                NSLog(@"对话创建失败:%@",error);
            }
            if (block){
                block(conversation,isSave);
            }
        }];
        
    } else {
        NSLog(@"对话已存在");
        
    }
    
    
    
    [client openWithClientId:[AVUser currentUser].username callback:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"打开客户端成功");
            [client createConversationWithName:name clientIds:clientIds callback:^(AVIMConversation *conversation, NSError *error) {
                BOOL isSave = NO;
                if (!error) {
                    NSMutableDictionary *conversationDic = [[NSUserDefaults standardUserDefaults] objectForKey:kConversationDic];
                    [conversationDic setObject:conversation.conversationId forKey:conversation.name];
                    
                    [self saveWithDic:conversationDic];
                    
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

//get conversation by conversationName
- (void)queryConversationWithClient:(AVIMClient *)client conversationName:(NSString *)name complete:(CompleteBlock)block {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *conversationDci = [NSMutableDictionary dictionaryWithDictionary:[userDefaults objectForKey:kConversationDic]];
    NSString *conversationId = [conversationDci valueForKey:name];
    //通过conversationId查询到某个对话
    AVIMConversationQuery *query = [client conversationQuery];
    [query getConversationById:conversationId callback:^(AVIMConversation *conversation, NSError *error) {
        if (!error) {
            NSLog(@"与 %@ 的对话查询成功",name);
        } else {
            NSLog(@"与 %@ 的对话查询失败",name);
        }
        if (block) {
            block(conversation, error);
        }
    }];
    
    
}

@end
