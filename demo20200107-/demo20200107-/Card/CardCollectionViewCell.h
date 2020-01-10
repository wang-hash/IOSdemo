//
//  CardCollectionViewCell.h
//  Player
//
//  Created by wangjingru on 2020/1/9.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardModel: NSObject
@property(nonatomic, assign, readwrite) BOOL isSelected;
@end

@interface CardCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong, readwrite) UILabel *titleLabel;
//@property(nonatomic, strong, readwrite)
@end

NS_ASSUME_NONNULL_END
