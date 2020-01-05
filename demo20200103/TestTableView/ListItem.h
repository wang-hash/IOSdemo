//
//  ListItem.h
//  TestTableView
//
//  Created by wangjingru on 2020/1/3.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListItem : NSObject<NSSecureCoding>

@property(nonatomic, strong, readwrite) NSString *category;
@property(nonatomic, strong, readwrite) NSString *picUrl;
@property(nonatomic, strong, readwrite) NSString *unqiueKey;
@property(nonatomic, strong, readwrite) NSString *title;
@property(nonatomic, strong, readwrite) NSString *date;
@property(nonatomic, strong, readwrite) NSString *authorName;
@property(nonatomic, strong, readwrite) NSString *articleUrl;

-(void) configWithDictionary: (NSDictionary *)dictionary;
//- (nullable instancetype)initWithCoder:(NSCoder *)coder;
//- (void)encodeWithCoder:(NSCoder *)coder;

@end

NS_ASSUME_NONNULL_END
