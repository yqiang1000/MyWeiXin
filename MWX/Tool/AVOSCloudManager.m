//
//  AVOSCloudManager.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/19.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "AVOSCloudManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation AVOSCloudManager

+ (AVOSCloudManager *)defaultManager {
    static AVOSCloudManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}


- (void)addFriend:(NSString *)name {
    
    //对已经存在的用户进行添加
    AVUser *currentUser = [AVUser currentUser];

    AVQuery *query = [AVQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:name];

    __block AVUser *firend = [AVUser user];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (objects.count != 0) {

            NSLog(@"已查询到目标用户");
            firend = [objects firstObject];

            AVRelation *relation = [currentUser relationforKey:@"firends"];
            [relation addObject:firend];

            [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"添加成功");
                } else {
                    NSLog(@"添加失败:%@",error);
                }
            }];

        } else {
            if (error) {
                NSLog(@"查询失败:%@",error);
            } else {
                NSLog(@"用户不存在");
            }
            
        }
    }];
}

- (void)getAllFirends:(FirendBlock)block {
    
    AVUser *currentUser = [AVUser currentUser];
    AVRelation *relation = [currentUser relationforKey:@"firends"];
    
    AVQuery *query = [relation query];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        _firendList = [[NSMutableArray alloc] init];
        
        for (AVUser *firend in objects) {
            FirendModel *model = [[FirendModel alloc] init];
            
            model.firendID = firend.objectId;
            model.name = firend.username;
            model.mobile = firend.mobilePhoneNumber;
            
            [_firendList addObject:model];
        }
        
        if (block) {
            block(_firendList,error);
        }
    }];
    
}


- (void)nameIsExist:(NSString *)name result:(ExistBlock)block {
    
    AVOSCloudManager *manager = [AVOSCloudManager defaultManager];
    [manager getAllFirends:^(NSArray *array, NSError *error) {
        NSInteger i = 0;
        for (FirendModel *model in array) {
            
            if ([model.name isEqualToString:name]) {
                i = 0;
            } else {
                i = 1;
            }
        }
        if (block) {
            block(&i,error);
        }
    }];
}


@end

