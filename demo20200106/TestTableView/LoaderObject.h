//
//  LoaderObject.h
//  TestTableView
//
//  Created by wangjingru on 2020/1/3.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ListItem;

typedef void(^LoaderObjectFinishBlock)(BOOL success,NSArray<ListItem*> *dataArray);

@interface LoaderObject : NSObject
-(void) LoadDataWithFinishBlock:(LoaderObjectFinishBlock)finishBlock;
-(void) getSandBox:(NSArray<ListItem*> *)array;
@end

NS_ASSUME_NONNULL_END
