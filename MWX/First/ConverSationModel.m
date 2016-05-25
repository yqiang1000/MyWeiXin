//
//  ConverSationModel.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/24.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ConverSationModel.h"

@implementation ConverSationModel

- (instancetype)initWithId:(NSString *)conversationId name:(NSString *)name {
    self = [super init];
    if (self) {
        self.conversationId = conversationId;
        self.name = name;
    }
    return self;
}

@end
