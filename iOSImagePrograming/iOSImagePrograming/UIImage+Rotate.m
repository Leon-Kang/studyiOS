//
//  UIImage+Rotate.m
//  iOSImagePrograming
//
//  Created by 康梁 on 2016/10/11.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "UIImage+Rotate.h"

#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

double const kImageRotateProportion = 0.01734;

@implementation UIImage (Rotate)

- (UIImage *)imageRotateIndegree:(float)degree {
    // 1. UIImage -> Context
    
    size_t width = (size_t)(self.size.width * self.scale);
    size_t height = (size_t)(self.size.height * self.scale);
    
    size_t bytesPerRow = width * 4;
    CGImageAlphaInfo alphaInfo = kCGImageAlphaPremultipliedFirst;
    // Configration
    CGContextRef bmContext = CGBitmapContextCreate(NULL, width, height, 8, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrderDefault | alphaInfo);
    if (!bmContext) {
        return nil;
    }
    
    CGContextDrawImage(bmContext, CGRectMake(0, 0, width, height), self.CGImage);
    
    // 2. Rotate
    UInt8 *data = (UInt8 *)CGBitmapContextGetData(bmContext);
    vImage_Buffer src = {data, height, width, bytesPerRow};
    vImage_Buffer dest = {data, height, width, bytesPerRow};
    Pixel_8888 bgColor = {0, 0, 0, 0};
    
    vImageRotate_ARGB8888(&src, &dest, NULL, degree, bgColor, kvImageBackgroundColorFill);
    
    // 3. Context -> UIImage
    CGImageRef rotateImageRef = CGBitmapContextCreateImage(bmContext);
    UIImage *rotateImage = [UIImage imageWithCGImage:rotateImageRef scale:self.scale orientation:self.imageOrientation];
    
    return rotateImage;
}

@end
