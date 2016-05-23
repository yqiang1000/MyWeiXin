//
//  SearchViewController.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/20.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
- (IBAction)cancelAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *searchText;

@end
