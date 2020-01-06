//
//  ListItem.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/3.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "ListItem.h"
#import <Foundation/NSObject.h>

//@interface ListItem()
//
//@end

@implementation ListItem

- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if(self){
        self.category = [coder decodeObjectForKey: @"category"];
        self.picUrl = [coder decodeObjectForKey: @"picUrl"];
        self.unqiueKey = [coder decodeObjectForKey: @"unqiueKey"];
        self.title = [coder decodeObjectForKey: @"title"];
        self.date = [coder decodeObjectForKey: @"date"];
        self.authorName = [coder decodeObjectForKey: @"authorName"];
        self.articleUrl = [coder decodeObjectForKey: @"articleUrl"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
    [coder encodeObject:self.unqiueKey forKey:@"unqiueKey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.articleUrl forKey:@"articleUrl"];
}

+ (BOOL)supportsSecureCoding {
    return true;
}


-(void) configWithDictionary: (NSDictionary *)dictionary{
    self.category = [dictionary objectForKey: @"category"];
    self.picUrl = [dictionary objectForKey: @"thumbnail_pic_s"];
    self.unqiueKey = [dictionary objectForKey: @"uniquekey"];
    self.title = [dictionary objectForKey: @"title"];
    self.date = [dictionary objectForKey: @"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey: @"url"];
}

@end
