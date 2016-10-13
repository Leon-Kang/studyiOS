//
//  ViewController.m
//  iOSImagePrograming
//
//  Created by 康梁 on 2016/9/25.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "ViewController.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

#import "UIImage+Rotate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self imageTestRotate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showJpgImage {
    UIImage *image = [UIImage imageNamed:@"image1.jpg"];
    // save image to phone's libarary
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    // show image
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 469, 342)];
    imageView.image = image;
    [self.view addSubview:imageView];
}

- (void)transitionPNGImage {
    UIImage *image = [UIImage imageNamed:@"image1.jpg"];
    NSData *imageData = UIImagePNGRepresentation(image);
    // jpg to jpg
//    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    UIImage *imagePng = [UIImage imageWithData:imageData];
    UIImageWriteToSavedPhotosAlbum(imagePng, nil, nil, nil);
}

- (void)imageGIF {
    // 1. get GIF image data
    NSString *gifPathSource = [[NSBundle mainBundle] pathForResource:@"radar" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:gifPathSource];
    CGImageSourceRef sourceRef = CGImageSourceCreateWithData((__bridge CFDataRef)gifData, NULL);
    // 2. take down gif
    size_t count = CGImageSourceGetCount(sourceRef);
    NSLog(@"gif count = %zu", count);
    
    NSMutableArray *imageArr = [NSMutableArray array];
    for (size_t i = 0; i < count; i ++) {
        // 3. transition to UIImage
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(sourceRef, i, NULL);
        UIImage *image = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        [imageArr addObject:image];
        CGImageRelease(imageRef);
    }
    
    // 4. save UIImage to location
    int i = 0;
    for (UIImage *image in imageArr) {
        NSData *data = UIImagePNGRepresentation(image);
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *gifPath = path[0];
        NSString *pathNum = [gifPath stringByAppendingString:[NSString stringWithFormat:@"%d.png", i]];
        i++;
        
        [data writeToFile:pathNum atomically:NO];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    
}

- (void)createGIFImage {
    // 1. get data
    NSArray *imageArr = @[[UIImage imageNamed:@"image1.jpg"], [UIImage imageNamed:@"image2.png"]];
    
    // 2. create gif file
    NSArray *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentStr = document[0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *textDic = [documentStr stringByAppendingString:@"/gif"];
    
    [fileManager createDirectoryAtPath:textDic withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *path = [textDic stringByAppendingString:@"test1.gif"];
    NSLog(@"%@", path);
    
    // 3. config gif
    CGImageDestinationRef destion;
    CFURLRef url = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)path, kCFURLPOSIXPathStyle, false);
    destion = CGImageDestinationCreateWithURL(url, kUTTypeGIF, imageArr.count, NULL);
    
    NSDictionary *frameDic = [NSDictionary dictionaryWithObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.3],(NSString *)kCGImagePropertyGIFDelayTime, nil] forKey:(NSString *)kCGImagePropertyGIFDelayTime];
    
    NSMutableDictionary *gifParmDic = [NSMutableDictionary dictionaryWithCapacity:2];
    [gifParmDic setObject:[NSNumber numberWithBool:YES] forKey:(NSString *)kCGImagePropertyGIFImageColorMap];
    [gifParmDic setObject:(NSString *)kCGImagePropertyColorModelRGB forKey:(NSString *)kCGImagePropertyColorModel];
    [gifParmDic setObject:[NSNumber numberWithInt:8] forKey:(NSString *)kCGImagePropertyDepth];
    [gifParmDic setObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
    
    NSDictionary *gifProperty = [NSDictionary dictionaryWithObject:gifParmDic forKey:(NSString *)kCGImagePropertyGIFDictionary];
    
    // 4. add image to gif
    for (UIImage *image in imageArr) {
        CGImageDestinationAddImage(destion, image.CGImage, (__bridge CFDictionaryRef)frameDic);
    }
    
    CGImageDestinationSetProperties(destion, (__bridge CFDictionaryRef)gifProperty);
    CGImageDestinationFinalize(destion);
    CFRelease(destion);
}

- (void)imageTestRotate {
    UIImage *image = [UIImage imageNamed:@"image2.png"];
    UIImage *imageNew = [image imageRotateIndegree:45 * kImageRotateProportion];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
}

@end
