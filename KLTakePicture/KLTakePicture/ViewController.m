//
//  ViewController.m
//  KLTakePicture
//
//  Created by 康梁 on 15/12/25.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

/**
 *    @author kl, 15-12-25 13:12:12
 *
 *    @brief 0:拍照, 1:视频
 */
@property (assign, nonatomic) int isVideo;

@property (strong, nonatomic) UIImagePickerController *pickerController;
@property (


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
