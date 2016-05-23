//
//  SearchCell.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "SearchCell.h"

@implementation SearchCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(FirendModel *)model {
    if (_model != model) {
        _model = model;
        self.nameLabel.text = model.name;
        self.resultID = model.firendID;
    }
}

@end
