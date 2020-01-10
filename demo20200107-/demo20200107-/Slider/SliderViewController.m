//
//  SliderViewController.m
//  Player
//
//  Created by wangjingru on 2020/1/10.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "SliderViewController.h"
#import "Slider.h"

@interface SliderViewController ()

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Slider *slider = [[Slider alloc] initWithFrame:CGRectMake(20, 200, [UIScreen mainScreen].bounds.size.width - 40, 50)];
    slider.touchRangeEdgeInsets = UIEdgeInsetsMake(-20, -20, -20, -20);
    slider.thumbSize = CGSizeMake(10, 10);
    slider.propress = 0.8;
    slider.margin = 20;
    [self.view addSubview:slider];
    [slider changeValue:^(CGFloat value) {
        NSLog(@">>>>>>>>>>>>>>>>> %f", value);
    } endValue:^(CGFloat value) {
        NSLog(@"end: %f", value);
    }];
    
    Slider *slider2 = [[Slider alloc] initWithFrame:CGRectMake(20, 380, [UIScreen mainScreen].bounds.size.width - 40, 50)];
    slider2.progressLineHeight = 15;
    slider2.thumbSize = CGSizeMake(30, 30);
    slider2.zoom = NO;
    slider2.thumbImage = [UIImage imageNamed:@"icon_feature_ovl"];
    slider2.trackImage = [UIImage imageNamed:@"food"];
    slider2.trackColor = [UIColor colorWithRed:0.29 green:0.42 blue:0.86 alpha:1.00];
    slider2.untrackImage = [UIImage imageNamed:@"food1"];
    [self.view addSubview:slider2];

}


@end
