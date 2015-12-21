//
//  ViewController.h
//  图片浏览器
//
//  Created by 康梁 on 15/9/2.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)sliderValueChange:(UISlider *)sender;

- (IBAction)setting;


- (IBAction)imageSizeChange:(UISlider *)sender;

- (IBAction)nightMode:(UISwitch *)sender;



@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *imageNumber;

@property (weak, nonatomic) IBOutlet UILabel *imageDesc;

@property (weak, nonatomic) IBOutlet UIView *settingView;




@end

