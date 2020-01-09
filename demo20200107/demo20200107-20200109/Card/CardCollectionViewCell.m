//
//  CardCollectionViewCell.m
//  Player
//
//  Created by wangjingru on 2020/1/9.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "CardCollectionViewCell.h"
#import <Masonry/Masonry.h>
@implementation CardModel

-(instancetype) init{
    self = [super init];
    if(self){
        _isSelected = NO;
    }
    return self;
}
@end

@interface  CardCollectionViewCell()

//@property(nonatomic, strong, readonly) CardModel *model;
@end

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256),arc4random_uniform(256))

@implementation CardCollectionViewCell


-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor orangeColor];
        self.contentView.backgroundColor = randomColor;
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@10);
        }];
        
    }
    
    return self;
}

@end
