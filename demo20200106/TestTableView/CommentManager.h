//
//  CommentManager.h
//  TestTableView
//
//  Created by wangjingru on 2020/1/6.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentManager : NSObject
+ (CommentManager*) shareManager;
-(void) showCommentView;
@end

NS_ASSUME_NONNULL_END
