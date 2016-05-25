//
//  ConverSationModel.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/24.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConverSationModel : NSObject

@property (nonatomic, copy) NSString *conversationId;
@property (nonatomic, copy) NSString *name;
- (instancetype)initWithId:(NSString *)conversationId name:(NSString *)name;

@end
