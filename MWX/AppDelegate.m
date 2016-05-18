//
//  AppDelegate.m
//  MWX
//
//  Created by WeibaYeQiang on 16/5/17.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "AppDelegate.h"
#import "Common.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [AVOSCloud setApplicationId:AppID clientKey:AppKey];
    
//    AVUser *user = [AVUser currentUser];
//    NSArray *nameArr = @[@"xiaoDouYa",@"xiaoLvDou",@"xiaoWuGui"];
//    NSArray *mobileArr = @[@"13298179103",@"1595382923",@"7979e79q77"];
//    if (user != nil) {
//        for (int i = 0; i < 3; i ++) {
//            AVObject *firendList = [[AVObject alloc]initWithClassName:@"List"];
//            [firendList setObject:nameArr[i] forKey:@"name"];
//            [firendList setObject:user.objectId forKey:@"assID"];
//            [firendList setObject:mobileArr[i] forKey:@"mobile"];
//            [firendList saveInBackground];
//        }
//    }
//    NSLog(@"---%@",user.objectId);
    
    
    
    return YES;
}

//- (void)save {
//    AVObject *firendList = [[AVObject alloc] initWithClassName:@"List"];
//    [AVObject saveAllInBackground:_array block:^(BOOL succeeded, NSError *error) {
//        if (error) {
//            NSLog(@"失败:%@",error);
//        } else {
//            NSLog(@"成功");
//            AVRelation *relation = [firendList relationforKey:@"friends"];
//            
//            [relation addObject:_array[12]];
//            [relation addObject:_array[13]];
//            [relation addObject:_array[14]];
//            [relation addObject:_array[15]];
//            [firendList saveInBackground];
//        }
//    }];
//}



- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
