//
//  VideoViewCell.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/4.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "VideoViewCell.h"
#import "VideoPlayer.h"
#import "VideoToolBar.h"

@interface VideoViewCell()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, copy, readwrite) NSString *videoUrl;
@property(nonatomic, strong, readwrite) VideoToolBar *toolBar;
@end

@implementation VideoViewCell

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview: ({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - VideoToolBarHeight)];
            _coverView;
        })];
        
        [self addSubview: ({
            _toolBar = [[VideoToolBar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, VideoToolBarHeight)];
            _toolBar;
        })];
    }
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapForPlay)];
    [self addGestureRecognizer:tapGesture];
    
    return self;
}

-(void) dealloc{
    
}

-(void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString*) videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
//    [_toolBar layoutWithModel:nil];
//    _toolBar.backgroundColor = [UIColor redColor];
}

-(void) tapForPlay{
    [[VideoPlayer Player] PlayerVideoWithUrl:_videoUrl attachView:_coverView];
    NSLog(@"");
}

@end
