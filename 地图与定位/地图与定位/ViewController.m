//
//  ViewController.m
//  地图与定位
//
//  Created by 康梁 on 15/12/22.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

/**
 *    @author kl, 15-12-22 15:12:01
 *
 *    @brief 地理定位
 */
@property (strong, nonatomic) CLLocationManager *locationManager;

/**
 *    @author kl, 15-12-22 15:12:47
 *
 *    @brief 地理编译与逆地理编译
 */
@property (strong, nonatomic) CLGeocoder *geocoder;



@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#pragma mark - 地理编译部分
    self.geocoder = [[CLGeocoder alloc] init];
    [self getCoordinateByAddress:@"上海"];
    [self getAddressByLatitude:39 longitude:110];
#pragma mark - 地理定位部分
    // 定位管理器
    self.locationManager = [[CLLocationManager alloc] init];
    
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务当前可能尚未打开，请设置打开！");
        return;
    }
    
    
    // 如果没有授权则请求用户授权
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestWhenInUseAuthorization];
    } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        // 设置代理
        self.locationManager.delegate = self;
        // 设置定位精确
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 定位频率,每隔多少米定位一次
        // 这里设置每隔十米定位一次
        CLLocationDistance distance = 10;
        self.locationManager.distanceFilter = distance;
        // 启动跟踪定位
        [self.locationManager startUpdatingLocation];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *    @author kl, 15-12-22 16:12:52
 *
 *    @brief 根据地名确定地理坐标(地理编码)
 *
 *    @param address 输入一个地址
 */
- (void)getCoordinateByAddress:(NSString *)address {
    [self.geocoder geocodeAddressString:address
                      completionHandler:
     ^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
     {
         // 取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
         CLPlacemark *placemark = [placemarks firstObject];
         
         // 位置
         CLLocation *location = placemark.location;
         // 区域
         CLRegion *region = placemark.region;
         // 详细地址信息字典,包含以下部分信息
         NSDictionary *addressDic = placemark.addressDictionary;
         
         // 地名
         // NSString *name=placemark.name;
         // 街道
         // NSString *thoroughfare=placemark.thoroughfare;
         // 街道相关信息，例如门牌等
         // NSString *subThoroughfare=placemark.subThoroughfare;
         // 城市
         // NSString *locality=placemark.locality;
         // 城市相关信息，例如标志性建筑
         // NSString *subLocality=placemark.subLocality;
         // 州
         // NSString *administrativeArea=placemark.administrativeArea;
         // 其他行政区域信息
         // NSString *subAdministrativeArea=placemark.subAdministrativeArea;
         // 邮编
         // NSString *postalCode=placemark.postalCode;
         // 国家编码
         // NSString *ISOcountryCode=placemark.ISOcountryCode;
         // 国家
         // NSString *country=placemark.country;
         // 水源、湖泊
         // NSString *inlandWater=placemark.inlandWater;
         // 海洋
         // NSString *ocean=placemark.ocean;
         // 关联的或利益相关的地标
         // NSArray *areasOfInterest=placemark.areasOfInterest;
         
         NSLog(@"\n 位置 : %@ \n 区域 : %@ \n 详细信息 : %@", location, region, addressDic);
         
     }];
}

/**
 *    @author kl, 15-12-22 16:12:55
 *
 *    @brief 根据坐标取得地名(反地理编码)
 *
 *    @param latitude  纬度
 *    @param longitude 经度
 */
- (void)getAddressByLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude {
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    
    [self.geocoder reverseGeocodeLocation:location
                        completionHandler:
     ^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
     {
         CLPlacemark *placemark = [placemarks firstObject];
         NSLog(@"详细情况 : %@", placemark.addressDictionary);
     }];
}




#pragma mark - CoreLocation 代理

#pragma mark -  跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    // 取出第一个位置
    CLLocation *location = [locations firstObject];
    // 位置坐标
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"经度 = %f, 纬度 = %f, 海拔 = %f, 航向 = %f, 行走速度 = %f", coordinate.longitude, coordinate.latitude, location.altitude, location.course, location.speed);
    
    // 如果不需要实时定位，使用完即使关闭定位服务
    [self.locationManager stopUpdatingLocation];
}























@end
