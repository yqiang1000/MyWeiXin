//
//  EditView.m
//  MWX
//
//  Created by WeibaYeQiang on 16/6/23.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "EditView.h"
#import <Masonry.h>

@implementation EditView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
        
        [self setSubViews];
    }
    return self;
}

- (UIButton *)buttonWith:(NSString *)normal hightLight:(NSString *)hightLight action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightLight] forState:UIControlStateHighlighted];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}

- (void)setSubViews {
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"toolbar_bottom_bar"]];
    
    self.text = [UITextField new];
    [self addSubview:_text];
    self.voice = [UIButton new];
    [self.voice setBackgroundColor:[UIColor yellowColor]];
    [self addSubview:self.voice];
    self.emoji = [UIButton new];
    [self.emoji setBackgroundColor:[UIColor yellowColor]];
    [self addSubview:self.emoji];
    self.more = [UIButton new];
    [self.more setBackgroundColor:[UIColor yellowColor]];
    [self addSubview:self.more];
    
    CGFloat padding = 5;
    
    [_voice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(padding);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.top.equalTo(self.mas_top).offset(padding);
        make.width.equalTo(@30);
    }];
    
    [_more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-padding);
        make.top.equalTo(self.mas_top).offset(padding);
        make.width.equalTo(@30);
    }];
    
    [_emoji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.top.equalTo(self.mas_top).offset(padding);
        make.right.equalTo(_more.mas_left).offset(-padding);
        make.width.equalTo(@30);
        
    }];
    
    [_text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.equalTo(_voice.mas_right).offset(padding);
        make.right.equalTo(_emoji.mas_left).offset(-padding);
    }];
    
}

-(void)editView:(EditView *)editView textFiledReturn:(UITextField *)textFiled {
    
    
}
-(void)editView:(EditView *)editView textFiledBegin:(UITextField *)textFiled {
    
}
-(void)beginRecord {
    
}
-(void)finishRecord {
    
}


@end
