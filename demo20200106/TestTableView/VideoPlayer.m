
//
//  VideoPlayer.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/5.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "VideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoPlayer()

@property(nonatomic, strong, readwrite) AVPlayerItem *playerItem;
@property(nonatomic, strong, readwrite) AVPlayer *player;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;

@end

@implementation VideoPlayer

+(VideoPlayer *)Player{
    static VideoPlayer *avPlayer;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        avPlayer = [[VideoPlayer alloc] init];
    });
    return avPlayer;
}

-(void)PlayerVideoWithUrl:(NSString*) videoUrl attachView:(UIView*)attachView{
    [self stopPlay];
    
    NSURL *url = [NSURL URLWithString:videoUrl];
    AVAsset *asset = [AVAsset assetWithURL: url];
    
    _playerItem = [AVPlayerItem playerItemWithAsset: asset];
    [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
//    CMTime duration = _playerItem.duration; //
//    CGFloat videoDuration = CMTimeGetSeconds(duration);
    
    _player = [AVPlayer playerWithPlayerItem: _playerItem];
    [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度： %@",@(CMTimeGetSeconds(time)));
    }];
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer: _player];
    _playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer: _playerLayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlerPlay) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    NSLog(@"");

}

-(void) stopPlay{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [_playerLayer removeFromSuperlayer];
    [_playerItem removeObserver:self forKeyPath:@"status"];
    [_playerItem removeObserver: self forKeyPath:@"loadedTimeRanges"];
    
    _playerItem = nil;
    _player = nil;
}

-(void)handlerPlay{
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
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
