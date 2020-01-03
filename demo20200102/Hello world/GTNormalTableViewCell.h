//
//  GTNormalTableViewCell.h
//  Hello world
//
//  Created by wangjingru on 2019/12/31.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol GTNormalTableViewCellDelegate <NSObject>

-(void) tableViewCell: (UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *) deleteButton;

@end


@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

-(void) layoutTableView;

@end

NS_ASSUME_NONNULL_END
