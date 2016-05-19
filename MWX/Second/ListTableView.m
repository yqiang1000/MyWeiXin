//
//  ListTableView.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/18.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ListTableView.h"
#import "ListCell.h"
#import <AVOSCloud.h>

@implementation ListTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)loadData {
    
    
    AVQuery *queue = [AVQuery queryWithClassName:@"List"];
    [queue whereKey:@"assID" equalTo:[AVUser currentUser].objectId];
    [queue findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"success");
            if ([_array isEqualToArray:objects]) {
                return ;
            } else {
                
                _array = [objects mutableCopy];
                [self reloadData];
            }
        } else {
            NSLog(@"faile:%@",error);
        }
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ListCell" owner:self options:nil] lastObject];
        cell.obj = _array[indexPath.row];
    }
    return cell;
}

@end
