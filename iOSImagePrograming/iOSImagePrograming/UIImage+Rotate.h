//
//  UIImage+Rotate.h
//  iOSImagePrograming
//
//  Created by 康梁 on 2016/10/11.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import <UIKit/UIKit.h>

extern double const kImageRotateProportion;

@interface UIImage (Rotate)

- (UIImage *)imageRotateIndegree:(float)degree;

@end
