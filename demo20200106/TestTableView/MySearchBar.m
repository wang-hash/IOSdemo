
//
//  MySearchBar.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/6.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "MySearchBar.h"

@interface MySearchBar() <UITextFieldDelegate>

@property(nonatomic, strong, readwrite) UITextField *textField;

@end

@implementation MySearchBar

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview: ({
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 5, self.bounds.size.width-20, frame.size.height-10)];
            _textField.delegate = self;
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"video.png"]];
            _textField.leftViewMode = UITextFieldViewModeAlways;
            _textField.placeholder = @"今日热点";
            _textField;
        })];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"");
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"");
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"");
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textField resignFirstResponder];
    return YES;
}



@end
