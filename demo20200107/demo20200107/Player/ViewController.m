//
//  ViewController.m
//  Player
//
//  Created by wangjingru on 2020/1/6.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "LabelView.h"
#import "ImageCollectionView.h"

#define angle2radion(angle) ((angle) / 180.0 * M_PI)

#define perSecondA 6

#define perMintueA 6

#define perHourA 30

#define perMinHourA 0.5

#define timerInterval 3.0f

@interface ViewController ()
@property (nonatomic, strong, readwrite) UIView *clockView;
@property (nonatomic, strong, readwrite) CALayer *secondLayer;
@property (nonatomic, strong, readwrite) CALayer *mintueLayer;
@property (nonatomic, strong, readwrite) CALayer *hourLayer;

@property (nonatomic, strong, readwrite) NSTimer *timer;
@property (nonatomic, readwrite) NSInteger selectIndex;
@property (nonatomic, strong, readwrite) LabelView *labelView;


@property (nonatomic, strong, readwrite) UICollectionView *collectionView;
//@property (nonatomic, strong, readwrite) NSTimer *timer2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self testLabelView];
//    [self testCollectionView];
}

-(void) testCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(100, 100, 100, 100) collectionViewLayout:layout];
//    [_collectionView setContentOffset:CGPointMake(-100, -100)];
    [_collectionView setContentOffset:CGPointMake(100, 0) animated:YES];
    _collectionView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_collectionView];
}

-(void) dealloc{
    [self cancelTimer];
}

-(void) cancelTimer{
    if(!_timer){
        
    }else{
    
    [_timer invalidate];
    _timer = nil;
    }
    
//    if(!_timer2){
//        return;
//    }else{
//        [_timer2 invalidate];
//        _timer2 = nil;
//    }
}

-(void) startTimer{
    if(_timer){
        return;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(changeLabelView) userInfo:nil repeats:YES];
    
}

-(void) changeLabelView{
    _selectIndex++;
    [_labelView setIndex:_selectIndex % 5];
}

-(void) testLabelView{
    _labelView = [[LabelView alloc] init];
    [self.view addSubview:_labelView];
    [_labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(300));
        make.centerX.equalTo(self.view);
        make.height.equalTo(@(3));
    }];
    [_labelView setAllCount: 5];
    _selectIndex = 0;
    [self startTimer];
}

-(void) testMasonry{
        UIView *view = [[UIView alloc] init];
    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view);
            make.left.equalTo(@(100));
            make.right.equalTo(@(-100));
            make.height.equalTo(@(15));
        }];
}

-(void) ShowClock{
    self.view.backgroundColor = [UIColor whiteColor];

    _clockView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _clockView.backgroundColor = [UIColor yellowColor];

    [self setHourLayer];
    
    [self setMintueLayer];
    
    [self setSecondLayer];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];

    [self.view addSubview: _clockView];
    [self timeChange];
}

-(void) setHourLayer{
    CALayer *layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor blackColor].CGColor;
    
    layer.anchorPoint = CGPointMake(0.5, 1);
    
    float width = _clockView.bounds.size.width;
    layer.position = CGPointMake(width/2,width/2);
    layer.bounds = CGRectMake(0, 0, 4, width/2-40);
    layer.cornerRadius = 4;
    [_clockView.layer addSublayer: layer];
    _hourLayer = layer;
}

-(void) setMintueLayer{
    CALayer *layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor blackColor].CGColor;
    
    layer.anchorPoint = CGPointMake(0.5, 1);
    
    float width = _clockView.bounds.size.width;
    layer.position = CGPointMake(width/2,width/2);
    layer.bounds = CGRectMake(0, 0, 4, width/2-20);
    layer.cornerRadius = 4;
    [_clockView.layer addSublayer: layer];
    _mintueLayer = layer;
}

-(void) setSecondLayer{
    CALayer *layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    layer.anchorPoint = CGPointMake(0.5, 1);
    
    float width = _clockView.bounds.size.width;
    layer.position = CGPointMake(width/2,width/2);
    layer.bounds = CGRectMake(0, 0, 1, width/2-20);
//    layer.cornerRadius = 2;
    [_clockView.layer addSublayer: layer];
    _secondLayer = layer;
}

#pragma mark -

-(void) timeChange{
    NSDate *Date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmp = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:Date];
    
    NSInteger second = cmp.second;
    CGFloat secondA = second * perSecondA;
    
    NSInteger minute = cmp.minute;
    CGFloat minuteA = minute * perMintueA;
    
    NSInteger hour = cmp.hour;
    CGFloat hourA = hour * perHourA + minute * perMinHourA;
    
    _secondLayer.transform = CATransform3DMakeRotation(angle2radion(secondA), 0, 0, 1);
    _mintueLayer.transform = CATransform3DMakeRotation(angle2radion(minuteA), 0, 0, 1);
    _hourLayer.transform = CATransform3DMakeRotation(angle2radion(hourA), 0, 0, 1);
}


@end
