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
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"toolbar_bottom_bar.png"]];
    
    self.text = [UITextField new];
    self.text.returnKeyType = UIReturnKeySend;
    self.text.background = [UIImage imageNamed:@"chat_bottom_textfield.png"];
    [self addSubview:_text];
    
    self.voice = [UIButton new];
    self.voice = [self buttonWith:@"chat_bottom_voice_nor.png" hightLight:@"chat_bottom_voice_press.png" action:@selector(voiceBtnPress:)];
    self.text.delegate = self;
    [self addSubview:self.voice];
    
    
    self.emoji = [UIButton new];
    self.emoji = [self buttonWith:@"chat_bottom_smile_nor.png" hightLight:@"chat_bottom_smile_press.png" action:@selector(emojiBtnPress:)];
    [self addSubview:self.emoji];
    
    
    self.more = [UIButton new];
    self.more = [self buttonWith:@"chat_bottom_up_nor.png" hightLight:@"chat_bottom_up_press.png" action:@selector(moreBtnPress:)];
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
    
    self.speak = [[UIButton alloc] initWithFrame:self.text.bounds];
    self.speak = [self buttonWith:nil hightLight:nil action:@selector(speakBtnPress:)];
    [self addSubview:self.speak];
    
    [_speak addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    
}


- (void)voiceBtnPress:(UIButton *)voice {
    NSString *nomarl, *hightLight;
    if (self.speak.hidden == YES) {
        self.speak.hidden = NO;
        self.text.hidden = YES;
    
        nomarl = @"chat_bottom_keyboard_nor.png";
        hightLight = @"chat_bottom_keyboard_press.png";
    } else {
        self.speak.hidden = YES;
        self.text.hidden = NO;
        nomarl = @"chat_bottom_voice_nor.png";
        hightLight = @"chat_bottom_voice_press.png";
    }
    [voice setImage:[UIImage imageNamed:nomarl] forState:UIControlStateNormal];
    [voice setImage:[UIImage imageNamed:hightLight] forState:UIControlStateHighlighted];
}

- (void)emojiBtnPress:(UIButton *)emoji {
    NSLog(@"表情");
    
}

- (void)moreBtnPress:(UIButton *)more {
    
}
- (void)speakBtnPress:(UIButton *)speak {
    
}

- (void)touchDown:(UIButton *)speak {
    NSLog(@"hello");
}
- (void)editView:(EditView *)editView textFiledReturn:(UITextField *)textFiled {
    
    
}
-(void)editView:(EditView *)editView textFiledBegin:(UITextField *)textFiled {
    
}
-(void)beginRecord {
    
}
-(void)finishRecord {
    
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([self.delegate respondsToSelector:@selector(editView:textFiledBegin:)]){
        
        [self.delegate editView:self textFiledBegin:self.text];
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([self.delegate respondsToSelector:@selector(editView:textFiledReturn:)]){
        [self.delegate editView:self textFiledReturn:self.text];
    }
    return YES;
}


@end
