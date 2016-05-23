//
//  AVOSCloudManager.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/19.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud.h>
#import "FirendModel.h"

typedef void(^FirendBlock)(NSArray *array,NSError *error);
typedef void(^ExistBlock)(NSInteger *code,NSError *error);
typedef void(^SearchBlock)(NSArray *array,NSError *error);
@interface AVOSCloudManager : NSObject


//属性
@property (nonatomic, strong) AVUser *user;
@property (nonatomic, strong) NSMutableArray *firendList;

//类方法
+ (AVOSCloudManager *)defaultManager;

//添加好友 >>>> 需要判断是否已存在
- (void)addFirend:(NSString *)name;

//获取好友列表
- (void)getAllFirends:(FirendBlock)block;

//判断好友是否已存在
- (void)nameIsExist:(NSString *)name result:(ExistBlock)block;

- (void)searchPerson:(NSString *)name searchResult:(SearchBlock)block;

@end
