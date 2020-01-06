//
//  LoaderObject.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/3.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "LoaderObject.h"
#import "ListItem.h"

@interface LoaderObject()

@end

@implementation LoaderObject

-(void) LoadDataWithFinishBlock:(LoaderObjectFinishBlock)finishBlock{
    
    NSArray<ListItem*> *listData = [self readDataFromLocal];
    if(finishBlock){
        finishBlock(YES, listData);
    }
    
    NSString *str = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *url = [NSURL URLWithString: str];
//    NSURLRequest *request = [NSURLRequest requestWithURL: url];

    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self) wself = self;
    __unused NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __unused __strong typeof(wself) strongSelf = wself;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *dataArray = [((NSDictionary*)[((NSDictionary*) jsonObj) objectForKey:@"result"]) objectForKey:@"data"];

        NSMutableArray *listItemArray = @[].mutableCopy;
        for(__unused NSDictionary *info in dataArray){
            ListItem* listItem = [[ListItem alloc] init];
            [listItem configWithDictionary: info];
            [listItemArray addObject: listItem];

        }

        [wself getSandBox:listItemArray.copy];

        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock){
                finishBlock(error == nil, listItemArray.copy);
            }
        });
        NSLog(@"");
    }];

    [dataTask resume];
}

-(NSArray<ListItem*> *) readDataFromLocal{
    NSArray* pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"Data/list"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSData* readListData = [fileManager contentsAtPath:listDataPath];
    id unarchiveData = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ListItem class], nil]  fromData:readListData error:nil];
    if([unarchiveData isKindOfClass:[NSArray class]] && [unarchiveData count] > 0){
        return (NSArray<ListItem*> *)unarchiveData;
    }
    return nil;
    
}

-(void) getSandBox:(NSArray<ListItem*> *)array{
//    FOUNDATION_EXPORT NSArray<NSString *> *NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde);
    NSArray* pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"Data"];
    
    //创建文件夹
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
//    NSData* listData = [@"abc" dataUsingEncoding:NSUTF16StringEncoding];
    
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
//    [NSKeyedArchiver archiveRootObject:nil toFile:nil];
    
    
    
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
//    NSData* readListData = [fileManager contentsAtPath:listDataPath];
//    __unused id unarchiveData = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ListItem class], nil]  fromData:readListData error:nil];
//
//    NSLog(@"");
//    //查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
//
//    if(fileExist){
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
//
}

@end
