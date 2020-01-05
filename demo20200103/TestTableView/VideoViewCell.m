//
//  VideoViewCell.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/4.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "VideoViewCell.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoViewCell()
@property(nonatomic, strong, readwrite) AVPlayerItem *playerItem;
@property(nonatomic, strong, readwrite) AVPlayer *player;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, copy, readwrite) NSString *videoUrl;
@end

@implementation VideoViewCell

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview: ({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _coverView;
        })];
    }
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapForPlay)];
    [self addGestureRecognizer:tapGesture];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlerPlay) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    return self;
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_playerItem removeObserver:self forKeyPath:@"status"];
    [_playerItem removeObserver: self forKeyPath:@"loadedTimeRanges"];
}

-(void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString*) videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
}

-(void) tapForPlay{
    NSURL *url = [NSURL URLWithString:_videoUrl];
    AVAsset *asset = [AVAsset assetWithURL: url];
    
    _playerItem = [AVPlayerItem playerItemWithAsset: asset];
    [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    CMTime duration = _playerItem.duration; //
    CGFloat videoDuration = CMTimeGetSeconds(duration);
    
    _player = [AVPlayer playerWithPlayerItem: _playerItem];
    [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度： %@",@(CMTimeGetSeconds(time)));
    }];
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer: _player];
    _playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer: _playerLayer];
    
    NSLog(@"");
}

-(void)handlerPlay{
    [_playerLayer removeFromSuperlayer];
    _playerItem = nil;
    _player = nil;
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"status"]){
        if(((NSNumber*)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay){
            [_player play];
        }else{
            NSLog(@"");
        }
    }else if([keyPath isEqualToString: @"loadedTimeRanges"]){
        NSLog(@"缓冲： %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end
