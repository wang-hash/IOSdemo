//
//  VideoViewCell.h
//  TestTableView
//
//  Created by wangjingru on 2020/1/4.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoViewCell : UICollectionViewCell

-(void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString*) videoUrl;

@end

NS_ASSUME_NONNULL_END
