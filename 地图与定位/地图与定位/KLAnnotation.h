//
//  KLAnnotation.h
//  地图与定位
//
//  Created by 康梁 on 15/12/22.
//  Copyright © 2015年 kl. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>




/**
 *    @author kl, 15-12-22 20:12:03
 *
 *    @brief 大头针模型
 */
@interface KLAnnotation : NSObject <MKAnnotation>

/**
 *    @author kl, 15-12-22 20:12:55
 *
 *    @brief 显示位置
 */
@property (nonatomic) CLLocationCoordinate2D coordinate;

/**
 *    @author kl, 15-12-22 20:12:30
 *
 *    @brief 大标题
 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;

/**
 *    @author kl, 15-12-22 17:12:45
 *
 *    @brief 在创建大头针时使用的图片属性
 */
@property (nonatomic, strong) UIImage *image;

/**
 *    @author kl, 15-12-22 20:12:38
 *
 *    @brief 左侧详情图标
 */
@property (nonatomic, strong) UIImage *icon;

/**
 *    @author kl, 15-12-22 20:12:30
 *
 *    @brief 大头针详情描述
 */
@property (nonatomic, copy) NSString *detail;

/**
 *    @author kl, 15-12-22 20:12:31
 *
 *    @brief 星级评价
 */
@property (nonatomic, strong) UIImage *rate;



@end
