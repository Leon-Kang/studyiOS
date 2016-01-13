//
//  KCMainViewController.m
//  CoreLocation
//
//  Created by Kenshin Cui on 14-03-27.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCMainViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface KCMainViewController ()<CLLocationManagerDelegate>{

//    CLLocationManager *_locationManager;
}
@property (nonatomic,strong ) CLLocationManager *locationManager;

@end

@implementation KCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
}

-(void)viewDidAppear:(BOOL)animated{
    //定位管理器
    _locationManager=[[CLLocationManager alloc]init];
    
    //设置代理
    _locationManager.delegate=self;
    
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [_locationManager requestWhenInUseAuthorization];
//        [_locationManager requestAlwaysAuthorization];
    }
    
//    if([CLLocationManager locationServicesEnabled]){
        //启动跟踪定位
        [_locationManager startUpdatingLocation];
//    }else{
//        NSLog(@"定位服务当前不可用，可以通过设置进行打开！");
//    }

}

-(void)showTip:(NSString *)msg{
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    UIAlertController *alertControl=[UIAlertController alertControllerWithTitle:@"系统提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addAction:okAction];
    [self presentViewController:alertControl animated:YES completion:nil];
}

#pragma mark - CoreLocation 代理
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
//可以通过模拟器设置一个虚拟位置，否则在模拟器中无法调用此方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"%@",locations);
}

@end
