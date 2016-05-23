//
//  FirstViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "FirstViewController.h"
#import "Common.h"
#import "AVOSCloudManager.h"


@interface FirstViewController ()

@property (nonatomic, strong) AVOSCloudManager *manager;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [self userIsLogined];
//    [self queryHave:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"微信"];
    
//    [self addfirend:@"123"];

}

- (void)addfirend:(NSString *)name {
    AVOSCloudManager *manager = [AVOSCloudManager defaultManager];
    
    [manager nameIsExist:name result:^(NSInteger *code, NSError *error) {
        
        if (!error) {
            if (code == 0) {
                NSLog(@"This friend already");
                
            } else {
                NSLog(@"正在添加。。。");
                [manager addFriend:name];
            }
        } else {
            NSLog(@"出错了:%@",error);
        }
        
    }];
}

- (void)queryHave:(NSString *)name {
    
    AVUser *currentUser = [AVUser currentUser];
    AVRelation *relation = [currentUser relationforKey:@"firends"];
    
    AVQuery *query = [relation query];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (AVUser *firend in objects) {
            NSLog(@"firendID>>>%@",firend.objectId);
            NSLog(@"firendName>>>%@",firend.username);
            NSLog(@"firendTel>>>%@",firend.mobilePhoneNumber);
        }
    }];
    
}


- (void)addUser {
    
    NSArray *userName = @[
                          @"yeqiang",
                          @"pengxiuxiu",
                          @"yangxuguang",
                          @"yangyongzhao",
                          @"yangaichun",
                          @"zhangsan",
                          @"lisi",
                          @"wangwu",
                          @"xudonglin",
                          @"guoyueqi"
                           ];
    
    for (NSInteger i = 0; i < userName.count; i++) {
        AVUser *user = [[AVUser alloc] initWithClassName:@"_User"];
        user.username = userName[i];
        user.password = @"12345";
        user.mobilePhoneNumber = [NSString stringWithFormat:@"%ld",15355495537+i];
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"%@添加成功",user.username);
            } else {
                NSLog(@"%@添加失败:%@",user.username,error);
            }
        }];
    }
    
    
}

- (void)dosomething {
    
    __block NSArray *list = [[NSArray alloc] init];
    self.manager = [AVOSCloudManager defaultManager];
    [self.manager getAllFirends:^(NSArray *array, NSError *error) {
        list = array;
        NSLog(@"%@",list);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
