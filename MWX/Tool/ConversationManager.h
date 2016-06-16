//
//  ConversationManager.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/24.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloudIM.h>
#import <AVOSCloud.h>

typedef void(^CompleteBlock)(AVIMConversation *conversation, BOOL isSave);

@interface ConversationManager : NSObject

+ (ConversationManager *)defaultManager;

//create converstaion
- (void)createConversationWithClient:(AVIMClient *)client WithName:(NSString *)name ClientIds:(NSArray *)clientIds complete:(CompleteBlock)block;

//send message
- (void)sendMessageWithConversation:(AVIMConversation *)conversation WithMessage:(NSString *)text;


//get conversation
- (void)queryConversationWithClient:(AVIMClient *)client conversationName:(NSString *)name complete:(CompleteBlock)block;

@end
