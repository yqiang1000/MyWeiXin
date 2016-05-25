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

@interface ChatViewController : BaseViewController

@property (nonatomic, strong) FirendModel *model;
@property (nonatomic, strong) TalkTableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *editView;

@end
