//
//  Slider.h
//  Player
//
//  Created by wangjingru on 2020/1/10.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Slider : UIView
@property(nonatomic, assign) CGSize thumbSize;
@property(nonatomic, assign) UIEdgeInsets touchRangeEdgeInsets;
@property(nonatomic, assign) CGFloat propress;
@property(nonatomic, assign) CGFloat margin;
@property(nonatomic, assign) CGFloat progressLineHeight;
@property(nonatomic, assign, getter=isZoom) BOOL zoom;
@property(nonatomic, nullable, strong) UIColor *untrackColor;
@property(nonatomic, nullable, strong) UIColor *trackColor;
@property(nonatomic, nullable, strong) UIColor *thumbColor;
@property(nonatomic, nullable, strong) UIImage *thumbImage;
@property(nonatomic, nullable, strong) UIImage *untrackImage;
@property(nonatomic, nullable, strong) UIImage *trackImage;

-(void) changeValue:(void(^_Nullable)(CGFloat value))changeEvent
           endValue:(void(^_Nullable)(CGFloat value))endValue;
@end

NS_ASSUME_NONNULL_END
