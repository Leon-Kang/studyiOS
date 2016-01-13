//
//  KCCalloutView.m
//  MapKit
//
//  Created by Kenshin Cui on 14/3/27.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCCalloutAnnotationView.h"
#define kSpacing 5
#define kDetailFontSize 12
#define kViewOffset 80

@interface KCCalloutAnnotationView(){
    UIView *_backgroundView;
    UIImageView *_iconView;
    UILabel *_detailLabel;
    UIImageView *_rateView;
}

@end

@implementation KCCalloutAnnotationView

-(instancetype)init{
    if(self=[super init]){
        [self layoutUI];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self layoutUI];
    }
    return self;
}

-(void)layoutUI{
    //背景
    _backgroundView=[[UIView alloc]init];
    _backgroundView.backgroundColor=[UIColor whiteColor];
    //左侧添加图标
    _iconView=[[UIImageView alloc]init];
    
    //上方详情
    _detailLabel=[[UILabel alloc]init];
    _detailLabel.lineBreakMode=NSLineBreakByWordWrapping;
    //[_text sizeToFit];
    _detailLabel.font=[UIFont systemFontOfSize:kDetailFontSize];
    
    //下方星级
    _rateView=[[UIImageView alloc]init];
    
    [self addSubview:_backgroundView];
    [self addSubview:_iconView];
    [self addSubview:_detailLabel];
    [self addSubview:_rateView];
}

+(instancetype)calloutViewWithMapView:(MKMapView *)mapView{
    static NSString *calloutKey=@"calloutKey1";
    KCCalloutAnnotationView *calloutView=(KCCalloutAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:calloutKey];
    if (!calloutView) {
        calloutView=[[KCCalloutAnnotationView alloc]init];
    }
    return calloutView;
}

#pragma mark 当给大头针视图设置大头针模型时可以在此根据模型设置视图内容
-(void)setAnnotation:(KCCalloutAnnotation *)annotation{
    [super setAnnotation:annotation];
    //根据模型调整布局
    _iconView.image=annotation.icon;
    _iconView.frame=CGRectMake(kSpacing, kSpacing, annotation.icon.size.width, annotation.icon.size.height);
    
    _detailLabel.text=annotation.detail;
    float detailWidth=150.0;
    CGSize detailSize= [annotation.detail boundingRectWithSize:CGSizeMake(detailWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kDetailFontSize]} context:nil].size;
    float detailX=CGRectGetMaxX(_iconView.frame)+kSpacing;
    _detailLabel.frame=CGRectMake(detailX, kSpacing, detailSize.width, detailSize.height);
    _rateView.image=annotation.rate;
    _rateView.frame=CGRectMake(detailX, CGRectGetMaxY(_detailLabel.frame)+kSpacing, annotation.rate.size.width, annotation.rate.size.height);
    
    float backgroundWidth=CGRectGetMaxX(_detailLabel.frame)+kSpacing;
    float backgroundHeight=_iconView.frame.size.height+2*kSpacing;
    _backgroundView.frame=CGRectMake(0, 0, backgroundWidth, backgroundHeight);
    self.bounds=CGRectMake(0, 0, backgroundWidth, backgroundHeight+kViewOffset);
    
}
@end
