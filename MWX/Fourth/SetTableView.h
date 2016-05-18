//
//  SetTableView.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/18.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Back)(void);

@interface SetTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (copy, nonatomic) Back back;

@end
