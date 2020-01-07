//
//  VideoToolBar.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/5.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "VideoToolBar.h"

@interface VideoToolBar ()
@property(nonatomic, strong, readwrite) UIImageView *nickImageView;
@property(nonatomic, strong, readwrite) UILabel *nickLabel;

@property(nonatomic, strong, readwrite) UIImageView *commentImageView;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;

@property(nonatomic, strong, readwrite) UIImageView *likeImageView;
@property(nonatomic, strong, readwrite) UILabel *likeLabel;

@property(nonatomic, strong, readwrite) UIImageView *shareImageView;
@property(nonatomic, strong, readwrite) UILabel *shareLabel;
@end

@implementation VideoToolBar

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview: ({
            _nickImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _nickImageView.layer.masksToBounds = YES;
            _nickImageView.layer.cornerRadius = 15;
            _nickImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _nickImageView;
        })];
        [self addSubview: ({
            _nickLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            _nickLabel.font = [UIFont systemFontOfSize:15];
            _nickLabel.textColor = [UIColor lightGrayColor];
            _nickLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _nickLabel;
        })];
        
        [self addSubview: ({
            _commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _commentImageView.layer.masksToBounds = YES;
            _commentImageView.layer.cornerRadius = 15;
            _commentImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _commentImageView;
        })];
        [self addSubview: ({
            _commentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            _commentLabel.font = [UIFont systemFontOfSize:15];
            _commentLabel.textColor = [UIColor lightGrayColor];
            _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _commentLabel;
        })];
        
        [self addSubview: ({
            _likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _likeImageView.layer.masksToBounds = YES;
            _likeImageView.layer.cornerRadius = 15;
            _likeImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _likeImageView;
        })];
        [self addSubview: ({
            _likeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            _likeLabel.font = [UIFont systemFontOfSize:15];
            _likeLabel.textColor = [UIColor lightGrayColor];
            _likeLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _likeLabel;
        })];
        
        [self addSubview: ({
            _shareImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _shareImageView.layer.masksToBounds = YES;
            _shareImageView.layer.cornerRadius = 15;
            _shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _shareImageView;
        })];
        [self addSubview: ({
            _shareLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            _shareLabel.font = [UIFont systemFontOfSize:15];
            _shareLabel.textColor = [UIColor lightGrayColor];
            _shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _shareLabel;
        })];
    }
    return self;
}

-(void) layoutWithModel:(id)model{
    
    //    @property(nonatomic, strong, readwrite) UIImageView *nickImageView;
    //    @property(nonatomic, strong, readwrite) UILabel *nickLabel;
    //
    //    @property(nonatomic, strong, readwrite) UIImageView *commentImageView;
    //    @property(nonatomic, strong, readwrite) UILabel *commentLabel;
    //
    //    @property(nonatomic, strong, readwrite) UIImageView *likeImageView;
    //    @property(nonatomic, strong, readwrite) UILabel *likeLabel;
    //
    //    @property(nonatomic, strong, readwrite) UIImageView *shareImageView;
    //    @property(nonatomic, strong, readwrite) UILabel *shareLabel;
    
    _nickImageView.image = [UIImage imageNamed:@"video.png"];
//    _nickImageView.backgroundColor = [UIColor redColor];
    _nickLabel.text = @"视频";
    
    _commentImageView.image = [UIImage imageNamed:@"video.png"];
//    _commentImageView.backgroundColor = [UIColor blueColor];
    _commentLabel.text = @"25";

    _likeImageView.image = [UIImage imageNamed:@"video.png"];
//    _likeImageView.backgroundColor = [UIColor blueColor];
    _likeLabel.text = @"100";

    _shareImageView.image = [UIImage imageNamed:@"video.png"];
//    _shareImageView.backgroundColor = [UIColor blueColor];
    _shareLabel.text = @"分享";
//
    [NSLayoutConstraint activateConstraints:@[
                [NSLayoutConstraint constraintWithItem:_nickImageView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                  attribute:NSLayoutAttributeCenterY
                                  multiplier:1
                                    constant:0],
                [NSLayoutConstraint constraintWithItem:_nickImageView
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                  attribute:NSLayoutAttributeLeft
                                  multiplier:1
                                    constant:15],
                [NSLayoutConstraint constraintWithItem:_nickImageView
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                  multiplier:1
                                    constant:30],
                [NSLayoutConstraint constraintWithItem:_nickImageView
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                  multiplier:1
                                    constant:30],
                [NSLayoutConstraint constraintWithItem:_nickLabel
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                    toItem:_nickImageView
                                  attribute:NSLayoutAttributeCenterY
                                  multiplier:1
                                    constant:0],
                [NSLayoutConstraint constraintWithItem:_nickLabel
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                   toItem:_nickImageView
                                  attribute:NSLayoutAttributeRight
                                  multiplier:1
                                    constant:0]
                
    ]];
    NSString *vflString = @"H:|-15-[_nickImageView]-0-[_nickLabel]-(>=0)-[_commentImageView(==_nickImageView)]-0-[_commentLabel]-15-[_likeImageView(==_nickImageView)]-0-[_likeLabel]-15-[_shareImageView(==_nickImageView)]-0-[_shareLabel]-15-|";
    
    [NSLayoutConstraint activateConstraints: [NSLayoutConstraint constraintsWithVisualFormat:vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_nickImageView,_nickLabel,_commentImageView,_commentLabel,_likeImageView,_likeLabel,_shareImageView,_shareLabel)]];
    
}

@end
