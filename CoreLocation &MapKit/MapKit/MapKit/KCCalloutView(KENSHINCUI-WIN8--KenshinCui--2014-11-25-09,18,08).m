//
//  KCCalloutView.m
//  MapKit
//
//  Created by Kenshin Cui on 14/3/27.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCCalloutView.h"
#define kSpacing 5
#define kImageWidth 40
#define kLabelWidth 100
#define kLabelHeight 50

@implementation KCCalloutView

-(instancetype)init{
    self=[super init];
    if(self){
        [self layoutUI];
    }
    return self;
}

-(void)layoutUI{
    //左侧添加图标
    UIImage *icon1= [UIImage imageNamed:@"icon_mark1.png"];
    UIImageView *iconView1=[[UIImageView alloc]initWithImage:icon1];
    iconView1.frame=CGRectMake(kSpacing, kSpacing, icon1.size.width, icon1.size.height);
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconView1.frame)+kSpacing, kSpacing, kLabelWidth,kLabelHeight)];
    label1.text=@"CMJ Studio";
    
    UIImage *score1= [UIImage imageNamed:@"icon_Movie_Star_rating.png"];
    UIImageView *scoreView1=[[UIImageView alloc]initWithImage:score1];
    scoreView1.frame=CGRectMake(CGRectGetMaxX(iconView1.frame)+kSpacing, CGRectGetMaxY(label1.frame)+kSpacing, score1.size.width, score1.size.height);
    
    
    
    UIImage *icon2= [UIImage imageNamed:@"icon_mark2.png"];
    UIImageView *iconView2=[[UIImageView alloc]initWithImage:icon2];
    iconView2.frame=CGRectMake(kSpacing, CGRectGetMaxY(iconView1.frame)+kSpacing, icon2.size.width, icon2.size.height);
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconView2.frame)+kSpacing, CGRectGetMaxY(iconView1.frame)+kSpacing, kLabelWidth,kLabelHeight)];
    label2.text=@"CMJ Studio";
    
    UIImage *score2= [UIImage imageNamed:@"icon_Movie_Star_rating.png"];
    UIImageView *scoreView2=[[UIImageView alloc]initWithImage:score2];
    scoreView2.frame=CGRectMake(CGRectGetMaxX(iconView2.frame)+kSpacing, CGRectGetMaxY(label2.frame)+kSpacing, score2.size.width, score2.size.height);
    
    [self addSubview:iconView1];
    [self addSubview:label1];
    [self addSubview:scoreView1];
    [self addSubview:iconView2];
    [self addSubview:label2];
    [self addSubview:scoreView2];
}

-(instancetype)calloutViewWithMapView:(MKMapView *)mapView{
    static NSString *calloutKey=@"calloutKey1";
    KCCalloutView *calloutView=(KCCalloutView *)[mapView dequeueReusableAnnotationViewWithIdentifier:calloutKey];
    if (!calloutView) {
        calloutView=[[KCCalloutView alloc]init];
    }
    return calloutView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
