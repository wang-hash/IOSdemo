//
//  GTDeleteCellView.m
//  Hello world
//
//  Created by wangjingru on 2020/1/2.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t deleteBlock;
@end

@implementation GTDeleteCellView

-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            self.backgroundView.backgroundColor = [UIColor blackColor];
            self.backgroundView.alpha = 0.5;
            [self.backgroundView addGestureRecognizer:({
                UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            self.backgroundView;
        })];
        
        [self addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 0, 0)];
            [self.deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton.backgroundColor = [UIColor blueColor];
            self.deleteButton;
        })];
    }
    
    return self;
}

-(void) showDeleteViewFromPoint:(CGPoint)point clickButton:(dispatch_block_t)clickBlock{
    self.deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    self.deleteBlock = [clickBlock copy];
    [[UIApplication sharedApplication].windows[0] addSubview:self];
    
    
    
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200);
    } completion:^(BOOL finished) {
        
    }];
}

-(void) dismissDeleteView{
    [self removeFromSuperview];
}

-(void)_clickButton{
    if(self.deleteBlock){
        self.deleteBlock();
    }
    [self removeFromSuperview];
}

@end
