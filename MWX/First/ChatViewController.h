//
//  ChatViewController.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirendModel.h"
#import "TalkTableView.h"

@interface ChatViewController : UIViewController

@property (nonatomic, strong) FirendModel *model;
@property (nonatomic, strong) TalkTableView *tableView;

@end
