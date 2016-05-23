//
//  SetTableView.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/18.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "SetTableView.h"
#import "SetCell.h"
#import "ChangeThemeViewCell.h"
#import <AVOSCloud.h>

@implementation SetTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section ? 44:80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    SetCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"setCell1"];
//    SetCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"setCell2"];
    SetCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"setCell3"];
    ChangeThemeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"theme"];
    
    if (indexPath.section == 0) {
        if (cell1 == nil) {
            cell1 = [[[NSBundle mainBundle] loadNibNamed:@"SetCell" owner:self options:nil] firstObject];
        }
        return cell1;
    } else if (indexPath.section == 1) {
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ChangeThemeViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    } else {
        if (cell3 == nil) {
            cell3 = [[[NSBundle mainBundle] loadNibNamed:@"SetCell" owner:self options:nil] lastObject];
        }
        return cell3;
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        self.click();
    }
    if (indexPath.section == 2) {
        if (self.back) {
            self.back();
        }
    }
}

@end
