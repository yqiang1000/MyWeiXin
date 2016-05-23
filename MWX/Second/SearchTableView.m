//
//  SearchTableView.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "SearchTableView.h"
#import "AVOSCloudManager.h"

@implementation SearchTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return self;
}

- (void)setArray:(NSArray *)array {
    if (_array != array) {
        _array = array;
        [self reloadData];
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SearchCell" owner:self options:nil] firstObject];
        cell.model = _array[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FirendModel *selected = _array[indexPath.row];
    
    NSLog(@"objectID >>> %@",selected.firendID);
    NSLog(@"objectID >>> %@",selected.name);
    AVOSCloudManager *manager = [AVOSCloudManager defaultManager];
    [manager addFirend:selected.name];
    
}

@end
