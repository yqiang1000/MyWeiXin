//
//  TalkTableView.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/24.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "TalkTableView.h"
#import "TalkCell.h"

@implementation TalkTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
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

    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TalkCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}


@end
