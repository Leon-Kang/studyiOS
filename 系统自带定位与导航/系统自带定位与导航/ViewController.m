//
//  ViewController.m
//  系统自带定位与导航
//
//  Created by 康梁 on 15/12/22.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface ViewController ()

@property (strong, nonatomic) CLGeocoder *geocoder;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.geocoder = [[CLGeocoder alloc] init];
    [self location];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 在地图上定位
/**
 *    @author kl, 15-12-22 22:12:39
 *
 *    @brief 在地图上定位
 */
- (void)location {
    // 根据str进行地理编译
    [_geocoder geocodeAddressString:@"SHANGHAI" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark = [placemarks firstObject];
        // 定位地标转化为地图的地标
        MKPlacemark *mkPlacemark = [[MKPlacemark alloc] initWithPlacemark:placemark];
        // NSDictionary *options = @{MKLaunchOptionsMapTypeKey:@(MKMapTypeStandard)};
        // MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:mkPlacemark];
        // [mapItem openInMapsWithLaunchOptions:options];
        
#pragma mark - 标记多个位置
        [self.geocoder geocodeAddressString:@"BEIJING" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            CLPlacemark *placemarkB = [placemarks firstObject];
            MKPlacemark *mkPlacemarkB = [[MKPlacemark alloc] initWithPlacemark:placemarkB];
            // NSDictionary *optionsB = @{MKLaunchOptionsMapTypeKey:@(MKMapTypeStandard)};
            
            MKMapItem *mapItemA = [[MKMapItem alloc] initWithPlacemark:mkPlacemark];
            MKMapItem *mapItemB = [[MKMapItem alloc] initWithPlacemark:mkPlacemarkB];
            // [MKMapItem openMapsWithItems:@[mapItemA, mapItemB] launchOptions:optionsB];
            
#pragma mark - 导航
            NSDictionary *optionsC = @{MKLaunchOptionsMapTypeKey:@(MKMapTypeStandard), MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving};
            [MKMapItem openMapsWithItems:@[mapItemA, mapItemB] launchOptions:optionsC];
            
        }];
    }];
}

@end
