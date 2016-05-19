//
//  ListCell.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/18.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell


- (void)setObj:(AVObject *)obj {
    if (_obj != obj) {
        _obj = obj;
        [self loadData];
    }

}

- (void)loadData {
    NSDictionary *dic = [self.obj valueForKey:@"localData"];
    self.name.text = dic[@"name"];
    self.assID = dic[@"assID"];
    self.mobile.text = dic[@"mobile"];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
