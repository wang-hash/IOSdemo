//
//  MyLocation.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/6.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "MyLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface MyLocation ()<CLLocationManagerDelegate>
@property(nonatomic, strong, readwrite) CLLocationManager *manager;

@end

@implementation MyLocation

+(MyLocation *)locationManager{
    static MyLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[MyLocation alloc] init];
    });
    return location;
}

-(instancetype)init{
    self = [super init];
    if(self){
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

-(void) checkLocationAuthorization{
    //判断系统
    if(![CLLocationManager locationServicesEnabled]){
        //引导跳转
    }
    
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        [self.manager requestWhenInUseAuthorization];
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status API_AVAILABLE(ios(4.2), macos(10.7)){
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        [self.manager startUpdatingLocation];
        NSLog(@"");
    }else if(status == kCLAuthorizationStatusDenied){
        [self.manager requestWhenInUseAuthorization];
    }
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations firstObject];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"");
    }];
    [self.manager stopUpdatingLocation];
}


@end
