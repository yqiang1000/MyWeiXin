//
//  FirendModel.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/20.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "FirendModel.h"

@implementation FirendModel

- (instancetype)initWith:(AVUser *)user {
    self = [super init];
    if (self) {
        if (user != nil) {
            self.name = user.username;
            self.firendID = user.objectId;
            self.mobile = user.mobilePhoneNumber;
        }
        return self;
    }
    return nil;
}

@end
