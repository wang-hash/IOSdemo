//
//  CommentManager.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/6.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "CommentManager.h"
#import <UIKit/UIKit.h>
@interface CommentManager () <UITextViewDelegate>

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UITextView *textView;

@end
@implementation CommentManager

+ (CommentManager*) shareManager{
    static CommentManager* manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CommentManager alloc] init];
    });
    return manager;
}

-(instancetype) init{
    self = [super init];
    if(self){
        _backgroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        [_backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_topBackground)]];
        
        [_backgroundView  addSubview: ({
            _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, _backgroundView.bounds.size.height, [UIScreen mainScreen].bounds.size.width, 100)];
            _textView.backgroundColor = [UIColor whiteColor];
            _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            _textView.layer.borderWidth = 5.f;
            _textView.delegate = self;
            _textView;
        })];
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doTextView:) name:UIKeyboardWillShowNotification object:nil];

    }
    return self;
}

-(void) showCommentView{
    
//    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
//    [window addSubview:_backgroundView];
//    [[[[UIApplication sharedApplication] delegate] window] addSubview:_backgroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:_backgroundView];
    [_textView becomeFirstResponder];
}

-(void) _topBackground{
    [_textView resignFirstResponder];
    [_backgroundView removeFromSuperview];
}

-(void) doTextView:(NSNotification *)noti{
    CGFloat duration = [[noti.userInfo objectForKey:UIKeyboardIsLocalUserInfoKey] floatValue];
    CGRect keyboardframe = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"");
    if(keyboardframe.origin.y >= [UIScreen mainScreen].bounds.size.width){
        [UIView animateWithDuration:duration animations:^{
            self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height-keyboardframe.size.height-100, [UIScreen mainScreen].bounds.size.width, 100);
        }];
    }
}

@end
