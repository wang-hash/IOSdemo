//
//  ImageCell.m
//  Player
//
//  Created by wangjingru on 2020/1/8.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "ImageCell.h"
#import <Masonry/Masonry.h>
@interface  ImageCell()

@property(nonatomic, strong, readwrite) UIImageView *imageView;
@property(nonatomic, strong, readwrite) UILabel *label;
@property(nonatomic, strong, readwrite) UIImageView *labelView;

@end

@implementation ImageCell

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.layer.cornerRadius = 5;
        _imageView.layer.masksToBounds = YES;
        _imageView.image = [UIImage imageNamed:@"Video.png"];
        
        _labelView = [[UIImageView alloc] init];
        _labelView.image = [UIImage imageNamed:@"icon_taglabel"];
        
        _label = [[UILabel alloc] init];
        _label.text = @"活动\n标签";
        _label.numberOfLines = 0;
        _label.font = [UIFont boldSystemFontOfSize:9];
        _label.textColor = [UIColor orangeColor];
        _label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_imageView];
        [self addSubview:_labelView];
        [self.labelView addSubview:_label];
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(10, 0, 0, 0));
        }];
        
        [_labelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageView.mas_left).offset(10);
            make.top.equalTo(self.imageView.mas_top).offset(-2);
            make.height.equalTo(@(42));
            make.width.equalTo(@(34));
        }];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.labelView);
            make.bottom.equalTo(self.labelView).offset(-2);
        }];
    }
    return self;
}

@end
