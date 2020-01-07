//
//  MyNotification.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/6.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "MyNotification.h"
#import <UserNotifications/UserNotifications.h>

@interface MyNotification() <UNUserNotificationCenterDelegate>

@end

@implementation MyNotification

+ (MyNotification*) notificationManager{
    static MyNotification* manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MyNotification alloc] init];
    });
    return manager;
}

-(void) checkNotificationAuthorization{
    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:    UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(granted){
            [self _pushLocalNotification];
        }
    }];
}

-(void) _pushLocalNotification{
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @(1);
    content.title = @"今日头条";
    content.body = @"西瓜食品";
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.f repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"_pushLocalNotification" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"");
    }];

}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    
    completionHandler(UNNotificationPresentationOptionAlert);
}
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler{
    completionHandler();
}

@end
