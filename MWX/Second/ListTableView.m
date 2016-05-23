//
//  ListTableView.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/18.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ListTableView.h"
#import "ListCell.h"
#import "AVOSCloudManager.h"
#import "UIView+UIViewController.h"
#import "ChatViewController.h"

@implementation ListTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.array = [[NSArray alloc] init];
    }
    return self;
}

- (void)loadData {
    AVOSCloudManager *manager = [AVOSCloudManager defaultManager];
    [manager getAllFirends:^(NSArray *array, NSError *error) {
        
        if (!error) {
            self.array = [array copy];
            [self reloadData];
        } else {
            NSLog(@"查找好友列表失败:%@",error);
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
        cell.model = _array[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatViewController *chatVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ChatVC"];
    chatVC.model = _array[indexPath.row];
    [self.viewController.navigationController pushViewController:chatVC animated:YES];
}

@end
