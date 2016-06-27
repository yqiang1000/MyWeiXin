//
//  EditView.h
//  MWX
//
//  Created by WeibaYeQiang on 16/6/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditView;

@protocol EditViewDelegate <NSObject>

-(void)editView:(EditView *)editView textFiledReturn:(UITextField *)textFiled;
-(void)editView:(EditView *)editView textFiledBegin:(UITextField *)textFiled;
-(void)beginRecord;
-(void)finishRecord;

@end


@interface EditView : UIView<EditViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) UITextField *text;
@property (strong, nonatomic) UIButton *emoji;
@property (strong, nonatomic) UIButton *more;
@property (strong, nonatomic) UIButton *voice;
@property (strong, nonatomic) UIButton *speak;

@property (assign, nonatomic) id<EditViewDelegate> delegate;



@end

