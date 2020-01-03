//
//  GTDeleteCellView.h
//  Hello world
//
//  Created by wangjingru on 2020/1/2.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView


-(void) showDeleteViewFromPoint:(CGPoint)point clickButton:(dispatch_block_t)clickBlock;

@end

NS_ASSUME_NONNULL_END
