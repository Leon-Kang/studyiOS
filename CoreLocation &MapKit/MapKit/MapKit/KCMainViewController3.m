////
////  KCMainViewController.m
////  MapKit Annotation
////
////  Created by Kenshin Cui on 14/3/27.
////  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
////  37.785834   -122.406417
////  39.92 116.39
//
//#import "KCMainViewController.h"
//#import <CoreLocation/CoreLocation.h>
//#import <MapKit/MapKit.h>
//#import "KCAnnotation.h"
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
//    //添加大头针
//    [self addAnnotation];
//}
//
//#pragma mark 添加大头针 
//-(void)addAnnotation{
//    CLLocationCoordinate2D location1=CLLocationCoordinate2DMake(39.95, 116.35);
//    KCAnnotation *annotation1=[[KCAnnotation alloc]init];
//    annotation1.title=@"CMJ Studio";
//    annotation1.subtitle=@"Kenshin Cui's Studios";
//    annotation1.coordinate=location1;
//    annotation1.image=[UIImage imageNamed:@"icon_pin_floating.png"];
//    [_mapView addAnnotation:annotation1];
//    
//    CLLocationCoordinate2D location2=CLLocationCoordinate2DMake(39.87, 116.35);
//    KCAnnotation *annotation2=[[KCAnnotation alloc]init];
//    annotation2.title=@"Kenshin&Kaoru";
//    annotation2.subtitle=@"Kenshin Cui's Home";
//    annotation2.coordinate=location2;
//    annotation2.image=[UIImage imageNamed:@"icon_paopao_waterdrop_streetscape.png"];
//    [_mapView addAnnotation:annotation2];
//}
//
//#pragma mark - 地图控件代理方法
//#pragma mark 显示大头针时调用，注意方法中的annotation参数是即将显示的大头针对象
//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
//    //由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
//    if ([annotation isKindOfClass:[KCAnnotation class]]) {
//        static NSString *key1=@"AnnotationKey1";
//        MKAnnotationView *annotationView=[_mapView dequeueReusableAnnotationViewWithIdentifier:key1];
//        //如果缓存池中不存在则新建
//        if (!annotationView) {
//            annotationView=[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:key1];
//            annotationView.canShowCallout=true;//允许交互点击
//            annotationView.calloutOffset=CGPointMake(0, 1);//定义详情视图偏移量
//            annotationView.leftCalloutAccessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_classify_cafe.png"]];//定义详情左侧视图
//        }
//
//        //修改大头针视图
//        //重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
//        annotationView.annotation=annotation;
//        annotationView.image=((KCAnnotation *)annotation).image;//设置大头针视图的图片
//        
//        return annotationView;
//    }else {
//        return nil;
//    }
//}
//
//@end
