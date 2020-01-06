//
//  VideoPlayer.h
//  TestTableView
//
//  Created by wangjingru on 2020/1/5.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface VideoPlayer : NSObject

+(VideoPlayer *)Player;

-(void)PlayerVideoWithUrl:(NSString*) videoUrl attachView:(UIView*)attachView;

@end

NS_ASSUME_NONNULL_END
