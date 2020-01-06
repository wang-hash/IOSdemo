//
//  NormalViewCell.h
//  TestTableView
//
//  Created by wangjingru on 2020/1/2.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ListItem;

@interface NormalViewCell : UITableViewCell

-(void) showViewWithItem:(ListItem*) item;

@end

NS_ASSUME_NONNULL_END
