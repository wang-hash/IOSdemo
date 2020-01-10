//
//  DataCell.h
//  Player
//
//  Created by wangjingru on 2020/1/9.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataCell : UICollectionViewCell

@property(nonatomic, strong) UIImageView *image;
@property(nonatomic, strong, readwrite) UILabel *name;


@end

NS_ASSUME_NONNULL_END
