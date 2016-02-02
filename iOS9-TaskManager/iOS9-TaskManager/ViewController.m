//
//  ViewController.m
//  iOS9-TaskManager
//
//  Created by 康梁 on 16/2/2.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "ViewController.h"
#import "iCarousel.h"

#define ScreenBounds [UIScreen mainScreen].bounds

@interface ViewController () <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, assign) CGSize taskSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat taskWidth = ScreenBounds.size.width * 5.0f / 7.0f;
    self.taskSize = CGSizeMake(taskWidth, taskWidth * 16.0f / 9.0f);
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.carousel = [[iCarousel alloc] initWithFrame:ScreenBounds];
    [self.view addSubview:self.carousel];
    self.carousel.delegate = self;
    self.carousel.dataSource = self;
    self.carousel.type = iCarouselTypeCustom;
    self.carousel.bounceDistance = 0.1;
    
}


- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return 7;
}

// 计算缩放
- (CGFloat)calcScaleWithOffset:(CGFloat)offset {
    return offset * 0.02f + 1.0f;
}

// 计算位移
- (CGFloat)calcTranslationWithOffset:(CGFloat)offset {
    CGFloat z = 5.0f / 4.0f;
    CGFloat a = 5.0f / 8.0f;
    if (offset >= z / a) {
        // 移出屏幕外
        return 2.0f;
    }
    return 1 / (z - a * offset) - 1 / z;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    UIView *taskView = view;
    if (taskView == nil) {
        taskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.taskSize.width, self.taskSize.height)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:taskView.bounds];
        [taskView addSubview:imageView];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.backgroundColor = [UIColor colorWithWhite:0.8f alpha:0.5];
        taskView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect: imageView.frame cornerRadius:5.0f].CGPath;
        taskView.layer.shadowColor = [UIColor blackColor].CGColor;
        
        UIImage *taskImage = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)index]];
        imageView.image = taskImage;
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = imageView.frame;
        layer.path = [UIBezierPath bezierPathWithRoundedRect: imageView.frame cornerRadius:5.0f].CGPath;
        [imageView.layer setMask:layer];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:taskView.bounds];
        [taskView addSubview:lable];
        lable.text = [@(index) stringValue];
        lable.font = [UIFont systemFontOfSize:48];
        lable.textAlignment = NSTextAlignmentCenter;
        
    }
    return taskView;
}

- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform {
    CGFloat scale = [self calcScaleWithOffset:offset];
    CGFloat translation = [self calcTranslationWithOffset:offset];
    return CATransform3DScale(CATransform3DTranslate(transform, translation * self.taskSize.width, 0, 0), scale, scale, 1.0f);
}

@end
