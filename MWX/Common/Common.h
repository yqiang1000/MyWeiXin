//
//  Common.h
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#ifndef Common_h
#define Common_h

#import <AVOSCloud.h>
#import "LoginTableViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define AppID @"Hx2DAyr1nU45mrDlpPnwdGd7-gzGzoHsz"
#define AppKey @"3vnAfyxLmk0T1mLnaqnX9VaM"
#define MasterKey @"MW8PXFNdfEfWUWXtfPJ79GOP"

#endif /* Common_h */



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






//    对已经存在的用户进行添加
//    AVUser *currentUser = [AVUser currentUser];
//
//    AVQuery *query = [AVQuery queryWithClassName:@"_User"];
//    [query whereKey:@"username" equalTo:@"xudonglin"];
//
//    __block AVUser *firend = [AVUser user];
//
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//
//            NSLog(@"查询成功");
//            firend = [objects firstObject];
//
//            AVRelation *relation = [currentUser relationforKey:@"firends"];
//            [relation addObject:firend];
//
//            [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                if (succeeded) {
//                    NSLog(@"添加成功");
//                } else {
//                    NSLog(@"添加失败:%@",error);
//                }
//            }];
//
//        } else {
//            NSLog(@"查询失败:%@",error);
//        }
//    }];




//    AVUser *currentUser = [AVUser currentUser];
//
//    AVQuery *query = [AVQuery queryWithClassName:@"_User"];
//    [query whereKey:@"username" equalTo:@"xudonglin"];
//
//    __block AVUser *firend = [AVUser user];
//
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//
//            NSLog(@"查询成功");
//            firend = [objects firstObject];
//
//            AVObject *firendList = [[AVObject alloc] initWithClassName:@"FirendsList"];
//            [firendList setObject:currentUser forKey:@"father"];
//            [firendList setObject:firend forKey:@"child"];
//            [firendList saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                if (succeeded) {
//                    NSLog(@"添加成功");
//                } else {
//                    NSLog(@"添加失败:%@",error);
//                }
//            }];
//
//
//
////            AVRelation *relation = [currentUser relationforKey:@"firends"];
////            [relation addObject:firend];
////
////            [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
////                if (succeeded) {
////                    NSLog(@"添加成功");
////                } else {
////                    NSLog(@"添加失败:%@",error);
////                }
////            }];
//
//        } else {
//            NSLog(@"查询失败:%@",error);
//        }
//    }];
//

//- (void)addfirend:(NSString *)name {
//    AVOSCloudManager *manager = [AVOSCloudManager defaultManager];
//    
//    [manager nameIsExist:name result:^(NSInteger *code, NSError *error) {
//        
//        if (!error) {
//            if (code == 0) {
//                NSLog(@"This friend already");
//                
//            } else {
//                NSLog(@"正在添加。。。");
//                [manager addFirend:name];
//            }
//        } else {
//            NSLog(@"出错了:%@",error);
//        }
//        
//    }];
//}
//
//- (void)queryHave:(NSString *)name {
//    
//    AVUser *currentUser = [AVUser currentUser];
//    AVRelation *relation = [currentUser relationforKey:@"firends"];
//    
//    AVQuery *query = [relation query];
//    
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        for (AVUser *firend in objects) {
//            NSLog(@"firendID>>>%@",firend.objectId);
//            NSLog(@"firendName>>>%@",firend.username);
//            NSLog(@"firendTel>>>%@",firend.mobilePhoneNumber);
//        }
//    }];
//    
//}
//
//
//- (void)addUser {
//    
//    NSArray *userName = @[
//                          @"yeqiang",
//                          @"pengxiuxiu",
//                          @"yangxuguang",
//                          @"yangyongzhao",
//                          @"yangaichun",
//                          @"zhangsan",
//                          @"lisi",
//                          @"wangwu",
//                          @"xudonglin",
//                          @"guoyueqi"
//                          ];
//    
//    for (NSInteger i = 0; i < userName.count; i++) {
//        AVUser *user = [[AVUser alloc] initWithClassName:@"_User"];
//        user.username = userName[i];
//        user.password = @"12345";
//        user.mobilePhoneNumber = [NSString stringWithFormat:@"%ld",15355495537+i];
//        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (succeeded) {
//                NSLog(@"%@添加成功",user.username);
//            } else {
//                NSLog(@"%@添加失败:%@",user.username,error);
//            }
//        }];
//    }
//    
//    
//}
//
//- (void)dosomething {
//    
//    __block NSArray *list = [[NSArray alloc] init];
//    self.manager = [AVOSCloudManager defaultManager];
//    [self.manager getAllFirends:^(NSArray *array, NSError *error) {
//        list = array;
//        NSLog(@"%@",list);
//    }];
//    
//}