//
//  CardViewLayout.m
//  Player
//
//  Created by wangjingru on 2020/1/8.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "CardViewLayout.h"

#define itemH 150
#define itemInner 65

@interface CardViewLayout ()
@property(nonatomic, strong, readwrite) NSMutableArray <UICollectionViewLayoutAttributes *> *attributes;
@property(nonatomic, strong, readwrite) NSIndexPath *clickIndexPath;

@property(nonatomic, assign) BOOL isEXpand;
@end

@implementation CardViewLayout

-(void) prepareLayout{
    [super prepareLayout];
    self.attributes = [NSMutableArray array];
    NSInteger section = [self.collectionView numberOfSections];
    for(int i=0; i<section; i++){
        NSInteger items = [self.collectionView numberOfItemsInSection:i];
        UICollectionViewLayoutAttributes *header = [self layoutAttributesForSupplementaryViewOfKind:@"CollectionViewSectionHeader" atIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
        if(header){
            [self.attributes addObject:header];
        }
        
        for(int j=0; j<items; j++){
            UICollectionViewLayoutAttributes *item = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i]];
            [self.attributes addObject:item];
        }
        
        UICollectionViewLayoutAttributes *footer = [self layoutAttributesForSupplementaryViewOfKind:@"CollectionViewSectionFooter" atIndexPath:[NSIndexPath indexPathForRow:items-1 inSection:i]];
        if(footer){
            [self.attributes addObject:footer];
        }
    }
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attributes;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    UICollectionViewLayoutAttributes *last = self.attributes.lastObject;
//    attribute.zIndex = indexPath.item*2;
    CGRect frame;
    frame.size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 2*self.padding, itemH);
    CGFloat offserY = indexPath.item == 0 ? 0 : itemInner;
    CGFloat expandH = (self.isEXpand && _clickIndexPath && _clickIndexPath.section == indexPath.section && _clickIndexPath.item + 1 == indexPath.item) ? -20 : offserY;
    
    frame.origin = CGPointMake(self.padding, CGRectGetMaxY(last.frame)-expandH);
    attribute.frame = frame;
    return attribute;
    
    
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    UICollectionViewLayoutAttributes *last = self.attributes.lastObject;
    
    CGRect frame;
    if([elementKind isEqual: @"CollectionViewSectionHeader"]){
        CGFloat headerH = [self.layout_delegate collectionView:self.collectionView reusableHeaderViewForIndexPath:indexPath];
        if(headerH <= 0){
            return nil;
        }
        frame.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, headerH);
    }else if([elementKind isEqual:@"CollectionViewSectionFooter"]){
        CGFloat footerH = [self.layout_delegate collectionView:self.collectionView reusableFooterViewForIndexPath:indexPath];
        if(footerH <= 0){
            return nil;
        }
        
        frame.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, footerH);
    }
    frame.origin = CGPointMake(0, CGRectGetMaxY(last.frame));
    attribute.frame = frame;
    return attribute;
}

-(CGSize) collectionViewContentSize{
    UICollectionViewLayoutAttributes *attribute = self.attributes.lastObject;
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, CGRectGetMaxY(attribute.frame) + 15);
}

-(void) didClickWithIndexPath:(NSIndexPath *)clickIndexPath isExpand:(BOOL) isExpand{
    self.isEXpand = isExpand;
    self.clickIndexPath = self.isEXpand ? clickIndexPath : nil;
    
    [UIView transitionWithView:self.collectionView duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self invalidateLayout];
    } completion:nil];
}

@end
