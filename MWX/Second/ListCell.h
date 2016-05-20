//
//  ListCell.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/18.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirendModel.h"

@interface ListCell : UITableViewCell

//@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) FirendModel *model;
@property (strong, nonatomic) NSString *assID;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *mobile;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end
