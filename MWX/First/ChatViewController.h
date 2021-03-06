//
//  ChatViewController.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "BaseViewController.h"
#import "FirendModel.h"
#import "TalkTableView.h"
#import "EditView.h"

@interface ChatViewController : BaseViewController

@property (nonatomic, strong) FirendModel *model;
@property (nonatomic, strong) TalkTableView *tableView;
@property (nonatomic, strong) EditView *editView;

@end
