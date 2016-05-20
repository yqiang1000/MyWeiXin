//
//  ListCell.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/18.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell


- (void)setModel:(FirendModel *)model {
    if (_model != model) {
        _model = model;
        self.name.text = _model.name;
        self.assID = _model.firendID;
        self.mobile.text = _model.mobile;
    }

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
