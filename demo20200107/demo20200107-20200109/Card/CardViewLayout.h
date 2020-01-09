//
//  CardViewLayout.h
//  Player
//
//  Created by wangjingru on 2020/1/8.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CardCollectionViewLayoutDelegate <NSObject>

@required
-(CGFloat) collectionView:(UICollectionView*) collectionView reusableHeaderViewForIndexPath:(NSIndexPath *)indexPath;

-(CGFloat) collectionView:(UICollectionView*) collectionView reusableFooterViewForIndexPath:(NSIndexPath *)indexPath;
@end


@interface CardViewLayout : UICollectionViewLayout

@property(nonatomic, weak) id<CardCollectionViewLayoutDelegate> layout_delegate;

@property(nonatomic, assign) CGFloat padding;

-(void) didClickWithIndexPath:(NSIndexPath *)clickIndexPath isExpand:(BOOL) isExpand;

@end

NS_ASSUME_NONNULL_END
