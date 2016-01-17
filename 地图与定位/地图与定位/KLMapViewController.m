//
//  KLMapViewController.m
//  地图与定位
//
//  Created by 康梁 on 15/12/22.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLMapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "KLAnnotation.h"
#import "KLCalloutAnnotation.h"
#import "KLCalloutAnnotatonView.h"

@interface KLMapViewController () <MKMapViewDelegate>


@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) MKMapView *mapView;



@end

@implementation KLMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initGUI];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *    @author kl, 15-12-22 17:12:40
 *
 *    @brief 添加地图控件
 */
- (void)initGUI {
    CGRect rect = [UIScreen mainScreen].bounds;
    self.mapView = [[MKMapView alloc] initWithFrame:rect];
    [self.view addSubview:self.mapView];
    
    // delegate
    self.mapView.delegate = self;
    
    // 请求定位服务
    self.locationManager = [[CLLocationManager alloc] init];
    if (![CLLocationManager locationServicesEnabled] ||
        [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    // 用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    // 地图类型
    self.mapView.mapType = MKMapTypeStandard;
    
    // 添加大头针
    [self addAnnotation];
    
}


/**
 *    @author kl, 15-12-22 17:12:25
 *
 *    @brief 添加大头针
 */
-(void)addAnnotation {
    CLLocationCoordinate2D locationOne = CLLocationCoordinate2DMake(39.00, 117.00);
    KLAnnotation *annotationOne = [[KLAnnotation alloc] init];
    annotationOne.title = @"ME";
    annotationOne.subTitle = @"subTitle";
    annotationOne.coordinate = locationOne;
    annotationOne.image = [UIImage imageNamed:@"index0.jpg"];
    annotationOne.icon = [UIImage imageNamed:@"index3.jpg"];
    annotationOne.detail = @"It's detail";
    annotationOne.rate = [UIImage imageNamed:@" "];
    [self.mapView addAnnotation:annotationOne];
    
    CLLocationCoordinate2D locationTwo = CLLocationCoordinate2DMake(30, 119);
    KLAnnotation *annotationTwo = [[KLAnnotation alloc] init];;
    annotationTwo.title = @"ME-2";
    annotationTwo.subTitle = @"subTitle";
    annotationTwo.coordinate = locationTwo;
    annotationTwo.image = [UIImage imageNamed:@"index1.jpg"];
    annotationTwo.icon = [UIImage imageNamed:@"index3.jpg"];
    annotationTwo.detail = @"It's detail";
    annotationTwo.rate = [UIImage imageNamed:@" "];
    [self.mapView addAnnotation:annotationTwo];
}




#pragma mark - 地图代理

/**
 *    @author kl, 15-12-22 17:12:08
 *
 *    @brief 更新用户位置，只要用户改变则调用此方法（包括第一次定位到用户位置）
 *
 *    @param mapView      mapView
 *    @param userLocation userLocation
 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%@", userLocation);
    
    // 设置地图显示范围(如果不进行区域设置会自动显示区域范围并指定当前用户位置为地图中心点)
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.location.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    
}

/**
 *    @author kl, 15-12-22 18:12:55
 *
 *    @brief 显示大头针时调用
 *
 *    @param mapView    mapView
 *    @param annotation 即将显示的大头针对象
 *
 *    @return 显示的大头针
 */
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // 由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    if ([annotation isKindOfClass:[KLAnnotation class]]) {
        static NSString *keyOne = @"AnnotationOne";
        
        MKAnnotationView *annotationView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:keyOne];
        
        // 如果缓存池中不存在则新建
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:keyOne];
            // 允许交互点击
            annotationView.canShowCallout = YES;
            // 定义详情视图偏移量
            annotationView.calloutOffset = CGPointMake(0, 1);
            // 定义详情左侧视图
            annotationView.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"index3.jpg"]];
        }
        
        // 修改大头针视图
        // 重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
        annotationView.annotation = annotation;
        // 设置大头针视图的图片
        annotationView.image = ((KLAnnotation *)annotation).image;
        
        return annotationView;
    } else {
        return nil;
    }
    
}

#pragma mark - 选中大头针时触发

/**
 *    @author kl, 15-12-22 21:12:57
 *
 *    @brief 点击一般的大头针KCAnnotation时添加一个大头针作为所点大头针的弹出详情视图
 *
 *    @param mapView napView
 *    @param view    详情大头针
 */
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    KLAnnotation *annotation = view.annotation;
    
    if ([view.annotation isKindOfClass:[KLAnnotation class]]) {
        // 添加详情大头针，渲染此大头针视图时将此模型对象赋值给自定义大头针视图完成自动布局
        KLCalloutAnnotation *annontationOne = [[KLCalloutAnnotation alloc] init];
        annontationOne.icon = annotation.icon;
        annontationOne.detail = annotation.detail;
        annontationOne.rate = annotation.rate;
        annontationOne.coordinate = view.annotation.coordinate;
        
        [mapView addAnnotation:annontationOne];
    }
}

// 取消选中时触发
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    [self removeCustomAnnotation];
}


/**
 *    @author kl, 15-12-22 21:12:54
 *
 *    @brief 移除所用自定义大头针
 */
- (void)removeCustomAnnotation {
    [self.mapView.annotations enumerateObjectsUsingBlock:
    ^(id<MKAnnotation>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[KLCalloutAnnotation class]]) {
            [self.mapView removeAnnotation:obj];
        }
    }];
}


@end
