//
//  FirendModel.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/20.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVOSCloudManager.h"

@interface FirendModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *firendID;
@property (strong, nonatomic) NSString *mobile;

- (instancetype)initWith:(AVUser *)user;

@end
