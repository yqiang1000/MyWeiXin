//
//  FirstViewController.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "FirstViewController.h"
#import "Common.h"
#import <AVOSCloud.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [self userIsLogined];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"微信"];
    
    NSString *string = @"yeqiang10";
    [self addfirend:string];
}

- (void)addfirend:(NSString *)name {

    
//创建的时候给定关系
//    AVObject *studentTom = [[AVObject alloc] initWithClassName:@"Student"];// 学生 Tom
//    [studentTom setObject:@"Tom" forKey:@"name"];
//    
//    [studentTom saveInBackground];
//
//    AVObject *courseLinearAlgebra = [[AVObject alloc] initWithClassName:@"Course"];// 线性代数
//    [courseLinearAlgebra setObject:@"Linear Algebra1" forKey:@"name"];
//    
//    AVObject *courseObjectOrientedProgramming = [[AVObject alloc] initWithClassName:@"Course"];// 面向对象程序设计
//    [courseObjectOrientedProgramming setObject:@"Object-Oriented Programming4" forKey:@"name"];
//    
//    AVObject *courseOperatingSystem = [[AVObject alloc] initWithClassName:@"Course"];// 操作系统
//    [courseOperatingSystem setObject:@"Operating System5" forKey:@"name"];
//    
//    [AVObject saveAllInBackground:@[courseLinearAlgebra,courseObjectOrientedProgramming,courseOperatingSystem] block:^(BOOL succeeded, NSError *error) {
//        if (error) {
//            // 出现错误
//        } else {
//            // 保存成功
//            AVRelation *relation = [studentTom relationforKey:@"coursesChosen"];// 新建一个 AVRelation，用来保存所选的课程
//            [relation addObject:courseLinearAlgebra];
//            [relation addObject:courseObjectOrientedProgramming];
//            [relation addObject:courseOperatingSystem];
//            
//            [studentTom saveInBackground];
//        }
//    }];
    
    
    
//    创建的时候，把已经存在的给定关系
//    AVObject *YE = [[AVObject alloc] initWithClassName:@"Student"];
//    [YE setObject:@"叶强" forKey:@"name"];
//    
//    AVQuery *query = [AVQuery queryWithClassName:@"Student"];
//    [query whereKey:@"name" equalTo:@"Anny"];
//    
//    __block AVObject *person = [[AVObject alloc] initWithClassName:@"Firend"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//            person = (AVObject *)[objects firstObject];
//        }
//    }];
//    
//    [AVObject saveAllInBackground:@[person] block:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            AVRelation *relation = [YE relationforKey:@"firends"];
//            [relation addObject:person];
//            
//            [YE saveInBackground];
//        }
//    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
