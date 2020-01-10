//
//  CardCollectionReusableView.m
//  Player
//
//  Created by wangjingru on 2020/1/9.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "CardCollectionReusableView.h"
#import <Masonry/Masonry.h>

@interface CardCollectionReusableView()

@property(nonatomic, strong, readwrite) UILabel *label;

@end

@implementation CardCollectionReusableView

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor blueColor];
        self.label = [[UILabel alloc] init];
        self.label.font = [UIFont systemFontOfSize: 14];
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

-(void) setViewTitle:(NSString*) title{
    _label.text  = title;
}

@end
