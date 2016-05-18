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
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [self userIsLogined];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"微信"];
    
    AVUser *user = [AVUser user];

    
//    
//    AVQuery *queue = [[AVQuery alloc] initWithClassName:@"_User"];
//    self.array = [[NSMutableArray alloc] init];
//    __weak typeof(self) wself = self;
//    [queue findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        __strong typeof(self) sself = wself;
//        
//        if (!error) {
//            sself.array = [objects mutableCopy];
//            [sself save];
//        } else {
//            NSLog(@"%@",error);
//        }
//    }];
    
}


//- (void)save {
//    AVObject *firendList = [[AVObject alloc] initWithClassName:@"firendList"];
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
