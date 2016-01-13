////
////  KCMainViewController.m
////  MapKit
////
////  Created by Kenshin Cui on 14/3/27.
////  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
////
//
//#import "KCMainViewController.h"
//#import <CoreLocation/CoreLocation.h>
//#import <MapKit/MapKit.h>
//
//@interface KCMainViewController ()<MKMapViewDelegate>{
//    CLLocationManager *_locationManager;
//    MKMapView *_mapView;
//}
//
//@end
//
//@implementation KCMainViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    [self initGUI];
//}
//
//#pragma mark 添加地图控件
//-(void)initGUI{
//    CGRect rect=[UIScreen mainScreen].bounds;
//    _mapView=[[MKMapView alloc]initWithFrame:rect];
//    [self.view addSubview:_mapView];
//    //设置代理
//    _mapView.delegate=self;
//    
//    //请求定位服务
//    _locationManager=[[CLLocationManager alloc]init];
//    if(![CLLocationManager locationServicesEnabled]||[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusAuthorizedWhenInUse){
//        [_locationManager requestWhenInUseAuthorization];
//    }
//    
//    //用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
//    _mapView.userTrackingMode=MKUserTrackingModeFollow;
//    
//    //设置地图类型
//    _mapView.mapType=MKMapTypeStandard;
//    
//}
//
//#pragma mark - 地图控件代理方法
//#pragma mark 更新用户位置，只要用户改变则调用此方法（包括第一次定位到用户位置）
//-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
//    
//    NSLog(@"%@",userLocation);
//    //设置地图显示范围(如果不进行区域设置会自动显示区域范围并指定当前用户位置为地图中心点)
//    //    MKCoordinateSpan span=MKCoordinateSpanMake(0.01, 0.01);
//    //    MKCoordinateRegion region=MKCoordinateRegionMake(userLocation.location.coordinate, span);
//    //    [_mapView setRegion:region animated:true];
//}
//
//@end
