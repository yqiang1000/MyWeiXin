//
//  FirstViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "FirstViewController.h"
#import "Common.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"微信"];
    
    AVUser *user = [AVUser currentUser];
    if (user == nil) {
        LoginTableViewController *loginVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginVC"];
        [self presentViewController:loginVC animated:YES completion:nil];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
