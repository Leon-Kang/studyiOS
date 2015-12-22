//
//  KLCalloutAnnotatonView.m
//  地图与定位
//
//  Created by 康梁 on 15/12/22.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLCalloutAnnotatonView.h"


#define kSpacing 5
#define kDetailFontSize 12
#define kViewOffset 80

@interface KLCalloutAnnotatonView ()

@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *detailLable;

@property (nonatomic, strong) UIImageView *rateView;



@end

@implementation KLCalloutAnnotatonView



- (instancetype) init {
    self = [super init];
    if (self) {
        [self layoutUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutUI];
    }
    return self;
}

/**
 *    @author kl, 15-12-22 21:12:10
 *
 *    @brief 页面布局
 */
- (void)layoutUI {
    // 背景
    self.backgroundView = [[UIView alloc] init];
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.backgroundView];
    
    // 左侧添加图标
    self.iconView = [[UIImageView alloc] init];
    [self addSubview:self.iconView];
    
    // 上方详情
    self.detailLable = [[UILabel alloc] init];
    self.detailLable.lineBreakMode = NSLineBreakByWordWrapping;
    self.detailLable.font = [UIFont systemFontOfSize:kDetailFontSize];
    [self addSubview:self.detailLable];
    
    // 下方星级
    self.rateView = [[UIImageView alloc] init];
    [self addSubview:self.rateView];
    
}


+ (instancetype)calloutViewWithMapView:(MKMapView *)mapView {
    static NSString *calloutKey = @"calloutKeyOne";
    KLCalloutAnnotatonView *calloutView = (KLCalloutAnnotatonView *)[mapView dequeueReusableAnnotationViewWithIdentifier:calloutKey];
    if (!calloutView) {
        calloutView = [[KLCalloutAnnotatonView alloc] init];
        
    }
    return calloutView;
}

/**
 *    @author kl, 15-12-22 20:12:01
 *
 *    @brief 当给大头针视图设置大头针模型时可以在此处根据模型设置视图内容
 *
 *    @param annotation 传入的模型
 */
- (void)setCalloutAnnotation:(KLCalloutAnnotation *)annotation
{
    [super setAnnotation:annotation];
    // 根据模型调整布局
    self.iconView.image = annotation.icon;
    self.iconView.frame = CGRectMake(kSpacing, kSpacing, annotation.icon.size.width, annotation.icon.size.height);
    
    self.detailLable.text = annotation.detail;
    float detailWidth = 150;
    CGSize detailSize = [annotation.detail boundingRectWithSize:CGSizeMake(detailWidth, MAXFLOAT)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kDetailFontSize]}
                                                        context:nil].size ;
    
    float detailX = CGRectGetMaxX(self.iconView.frame) + kSpacing;
    
    self.detailLable.frame = CGRectMake(detailX, kSpacing, detailSize.width, detailSize.height);
    
    self.rateView.image = annotation.rate;
    self.rateView.frame = CGRectMake(detailX, CGRectGetMaxY(self.detailLable.frame) + kSpacing, annotation.rate.size.width, annotation.rate.size.height);
    
    
    float backgroundWidth = CGRectGetMaxX(self.detailLable.frame) + kSpacing;
    float backgroundHeight = self.iconView.frame.size.height + 2 * kSpacing;
    
    self.backgroundView.frame = CGRectMake(0, 0, backgroundWidth, backgroundHeight);
    
    self.bounds = CGRectMake(0, 0, backgroundWidth, backgroundWidth + kSpacing);
    
    
}

@end
