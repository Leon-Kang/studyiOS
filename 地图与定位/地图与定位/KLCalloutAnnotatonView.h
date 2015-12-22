//
//  KLCalloutAnnotatonView.h
//  地图与定位
//
//  Created by 康梁 on 15/12/22.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "KLCalloutAnnotation.h"

@interface KLCalloutAnnotatonView : MKAnnotationView


@property (nonatomic, strong) KLCalloutAnnotation *calloutAnnotation;

/**
 *    @author kl, 15-12-22 20:12:55
 *
 *    @brief 从缓存取出标注视图
 *
 *    @param mapView mapView
 *
 *    @return annotation
 */
+ (instancetype)calloutViewWithMapView:(MKMapView *)mapView;

@end
