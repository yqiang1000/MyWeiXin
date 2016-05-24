//
//  MessageModel.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/24.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL isSelf;
@property (nonatomic, copy) NSString *imageUrl;

@end
