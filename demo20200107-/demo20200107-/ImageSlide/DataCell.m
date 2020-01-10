//
//  DataCell.m
//  Player
//
//  Created by wangjingru on 2020/1/9.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "DataCell.h"
#import <Masonry/Masonry.h>
@interface DataCell ()

@end

@implementation DataCell

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUp];
    }
    return self;
}

-(void) setUp{
    self.image = [[UIImageView alloc] init];
    self.image.backgroundColor = [UIColor clearColor];
    self.image.contentMode = UIViewContentModeCenter;
    self.image.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    self.name = [[UILabel alloc] init];
    self.name.font = [UIFont systemFontOfSize:20];
    self.name.textColor = [UIColor blackColor];
    self.name.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_image];
    [self addSubview: _name];
    
    //
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(30);
//        make.bottom.equalTo(_name.mas_top).offset(-10);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(_image.mas_bottom).offset(10);
//        make.bottom.equalTo(self.contentView).offset(-20);
    }];
    
}

@end
