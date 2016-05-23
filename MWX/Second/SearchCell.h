//
//  SearchCell.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirendModel.h"

@interface SearchCell : UITableViewCell

@property (nonatomic, strong) FirendModel *model;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) NSString *resultID;


@end
