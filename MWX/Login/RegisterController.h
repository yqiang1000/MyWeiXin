//
//  RegisterController.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LoginBlock)(void);

@interface RegisterController : UITableViewController

- (IBAction)cancelAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@property (copy, nonatomic) LoginBlock loginBlock;

@end
