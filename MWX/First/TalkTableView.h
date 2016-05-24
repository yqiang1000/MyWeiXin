//
//  TalkTableView.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/24.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalkTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *data;

@end
