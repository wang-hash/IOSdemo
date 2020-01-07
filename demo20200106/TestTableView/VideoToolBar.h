//
//  VideoToolBar.h
//  TestTableView
//
//  Created by wangjingru on 2020/1/5.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define VideoToolBarHeight 60
@interface VideoToolBar : UIView

-(instancetype) initWithFrame:(CGRect)frame;
-(void) layoutWithModel:(id)model;

@end

NS_ASSUME_NONNULL_END
