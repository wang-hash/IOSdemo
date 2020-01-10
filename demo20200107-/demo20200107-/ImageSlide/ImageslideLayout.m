//
//  ImageslideLayout.m
//  Player
//
//  Created by wangjingru on 2020/1/9.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "ImageslideLayout.h"


static CGFloat const ActiveDistance = 80;
static CGFloat const ScaleFactor = 0.2;

@interface ImageslideLayout()

@end

@implementation ImageslideLayout

-(instancetype) init{
    self = [super init];
    if(self){
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.frame.size;
    for(UICollectionViewLayoutAttributes *attributes in array){
        if(CGRectIntersectsRect(attributes.frame, rect)){
            attributes.alpha  =0.5;
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            CGFloat normalizedDistance = distance / ActiveDistance;
            
            if(ABS(distance) < ActiveDistance){
                CGFloat zoom = 1 + ScaleFactor * (1- ABS(normalizedDistance));
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex = 1;
                attributes.alpha = 1.0;
            }
        }
    }
    return array;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
