//
//  TalkTableView.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/24.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "TalkTableView.h"
#import "TalkCell.h"
#import "MessageModel.h"

@implementation TalkTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row%2 ? 50 : 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TalkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"talkCell"];
//    MessageModel *model = _data[indexPath.row];
    if (cell == nil) {
//        if (model.isSelf) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TalkCell" owner:self options:nil] lastObject];
//        } else {
//            cell = [[[NSBundle mainBundle] loadNibNamed:@"TalkCell" owner:self options:nil] firstObject];
//        }
    }
    return cell;
}


@end
