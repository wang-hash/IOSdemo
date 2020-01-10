//
//  Slider.m
//  Player
//
//  Created by wangjingru on 2020/1/10.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "Slider.h"

@interface UIView(Frame)

@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat centerX;
@property(nonatomic, assign) CGFloat centerY;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat top;
@property(nonatomic, assign) CGFloat bottom;
@property(nonatomic, assign) CGFloat left;
@property(nonatomic, assign) CGFloat right;
@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGPoint origin;

@end

#define ButtomWidth 15
@interface Slider()

@property(nonatomic, strong) UIImageView *untrackView;
@property(nonatomic, strong) UIImageView *trackView;
@property(nonatomic, strong) UIImageView *buttom;
@property(nonatomic, assign) CGRect buttomRect;
@property(nonatomic, assign, getter=isSpot) BOOL spot;
@property(nonatomic, copy) void(^changeEvent)(CGFloat value);
@property(nonatomic, copy) void(^endValueEvent)(CGFloat value);

@end

@implementation Slider

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self initData];
        [self setupSubviews];
    }
    return self;
}

-(void) initData{
    _touchRangeEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    _thumbSize = CGSizeMake(ButtomWidth, ButtomWidth);
    _propress = 0.5f;
    _zoom = YES;
    _untrackColor = [UIColor lightGrayColor];
    _trackColor = [UIColor orangeColor];
    _thumbColor = _trackColor;
    _margin = 20.0f;
    _progressLineHeight = 2.0f;
}

-(void) setupSubviews{
    _untrackView = [[UIImageView alloc] init];
    _untrackView.backgroundColor = _untrackColor;
    [self addSubview:_untrackView];
    
    _trackView = [[UIImageView alloc] init];
    _trackView.backgroundColor = _trackColor;
    [self addSubview:_trackView];
    
    _buttom = [[UIImageView alloc] init];
    _buttom.contentMode = UIViewContentModeScaleAspectFit;
    _buttom.backgroundColor = _thumbColor;
    [self addSubview:_buttom];
    
    [self updateSubviewFrame];
}

-(void) updateSubviewFrame{
    _buttom.frame = CGRectMake(_margin + (self.width - _margin * 2) * _propress, 0.5f * (self.height - _thumbSize.height), _thumbSize.width, _thumbSize.height);
    _buttomRect = _buttom.frame;
    _buttom.layer.cornerRadius = _buttom.width*0.5f;
    _buttom.layer.masksToBounds = YES;
    
    _untrackView.frame = CGRectMake(_margin, 0.5f * (self.height - _progressLineHeight), self.width - _margin*2, _progressLineHeight);
    _untrackView.layer.cornerRadius = _buttom.height * 0.5f;
    _untrackView.layer.masksToBounds = YES;
    
    _trackView.frame = CGRectMake(_margin, 0.5f * (self.height - _progressLineHeight), _buttom.centerX - _margin, _progressLineHeight);
    _trackView.layer.cornerRadius = _trackView.height * 0.5;
    _trackView.layer.masksToBounds = YES;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGRect hitFrame = UIEdgeInsetsInsetRect(self.buttomRect, _touchRangeEdgeInsets);
    BOOL isContain = CGRectContainsPoint(hitFrame, point);
    if(isContain){
        self.spot = YES;
        if(self.isZoom){
            [UIView animateWithDuration:0.25 animations:^{
                self.buttom.transform = CGAffineTransformMakeScale(2, 2);
            }];
        }
        [self moveValuePoint:point];
    }else{
        self.spot = NO;
    }
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if(self.isSpot){
        [self moveValuePoint:point];
    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.endValueEvent && self.spot){
        CGFloat progress = (self.buttom.centerX - _margin) / (self.width - _margin * 2);
        self.endValueEvent(progress);
    }
    if(self.isZoom){
        [UIView animateWithDuration:0.25 animations:^{
            self.buttom.transform = CGAffineTransformIdentity;
        }];
    }
}

-(void) moveValuePoint:(CGPoint) point{
    if(point.x  < _margin){
        point.x = _margin;
    }else if(point.x < self.width - _margin){
        point.x = self.width - _margin;
    }
    
    self.buttom.centerX = point.x;
    CGFloat progress = (self.buttom.centerX - _margin) / (self.width - _margin * 2);
    if(self.changeEvent){
        self.changeEvent(progress);
    }
    
    _trackView.x = _margin;
    _trackView.width = _buttom.centerX - _margin;
    
    _buttomRect = CGRectMake(self.buttom.centerX - _thumbSize.width * 0.5f, (self.height - _thumbSize.height)*0.5f, _thumbSize.width, _thumbSize.height);
}

-(void) changeValue:(void(^_Nullable)(CGFloat value))changeEvent endValue:(void(^_Nullable)(CGFloat value))endValue{
    self.changeEvent = changeEvent;
    self.endValueEvent = endValue;
}


-(void) setTouchRangeEdgeInsets:(UIEdgeInsets)touchRangeEdgeInsets{
    _touchRangeEdgeInsets = touchRangeEdgeInsets;
}

-(void) setPropress:(CGFloat)propress{
    _propress = propress;
    [self updateSubviewFrame];
}

-(void) setThumbSize:(CGSize)thumbSize{
    _thumbSize = thumbSize;
    [self updateSubviewFrame];
}

-(void) setUntrackColor:(UIColor *)untrackColor{
    _untrackColor = untrackColor;
    _untrackView.backgroundColor = untrackColor;
}

-(void) setTrackColor:(UIColor *)trackColor{
    _trackColor = trackColor;
    _trackView.backgroundColor = _trackColor;
}
-(void) setThumbColor:(UIColor *)thumbColor{
    _thumbColor = thumbColor;
    _buttom.backgroundColor = _thumbColor;
}

-(void) setProgressLineHeight:(CGFloat)progressLineHeight{
    _progressLineHeight = progressLineHeight;
    [self updateSubviewFrame];
}

-(void) setMargin:(CGFloat)margin{
    _margin = margin;
    [self updateSubviewFrame];
}

-(void) setThumbImage:(UIImage *)thumbImage{
    _thumbImage = thumbImage;
    self.buttom.image = thumbImage;
}

-(void) setUntrackImage:(UIImage *)untrackImage{
    _untrackImage = untrackImage;
    if(untrackImage){
        _untrackView.image = [untrackImage resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    }
}
-(void) setTrackImage:(UIImage *)trackImage{
    _trackImage = trackImage;
    if(trackImage){
        _trackView.image = [trackImage resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    }
}

@end

@implementation UIView(Frame)

-(void) setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void) setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat) x{
    return self.frame.origin.x;
}

-(CGFloat) y{
    return self.frame.origin.y;
}

-(void) setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat) centerX{
    return self.center.x;
}

-(void) setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat) centerY{
    return self.center.y;
}

-(void) setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat) width{
    return self.frame.size.width;
}

-(void) setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat) height{
    return self.frame.size.height;
}

-(void) setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize) size{
    return self.frame.size;
}

-(void) setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(CGPoint) origin{
    return self.frame.origin;
}

-(void) setTop:(CGFloat)top{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

-(CGFloat) top{
    return self.frame.origin.y;
}

-(void) setLeft:(CGFloat)left{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

-(CGFloat) left{
    return self.frame.origin.x;
}

-(void) setBottom:(CGFloat)bottom{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

-(CGFloat) bottom{
    return self.frame.size.height + self.frame.origin.y;
}

-(void) setRight:(CGFloat)right{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

-(CGFloat) right{
    return self.frame.size.width + self.frame.size.width;
}
@end
