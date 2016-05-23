//
//  SearchTableView.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchCell.h"

@interface SearchTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray *array;

@end
