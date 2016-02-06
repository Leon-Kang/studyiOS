//
//  ViewController.m
//  Testblur
//
//  Created by 康梁 on 16/2/5.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "ViewController.h"
#import "KLViewController.h"

#define Screen [UIScreen mainScreen].bounds

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"testImage"];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.frame = CGRectMake(0, 0, Screen.size.width, Screen.size.height);
    
    [self.view addSubview:imageView];
    
//    UIToolbar *toobar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, Screen.size.width / 2, Screen.size.height)];
//    toobar.barStyle = UIBarStyleBlackTranslucent;
//    [self.view addSubview:toobar];
    UIBlurEffect *effect1 = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView1 = [[UIVisualEffectView alloc] initWithEffect:effect1];
    effectView1.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    effectView1.frame = CGRectMake(0, 0, imageView.frame.size.width / 2, imageView.frame.size.height / 2);
    [imageView addSubview:effectView1];
    
    UIBlurEffect *effect2 = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectView2 = [[UIVisualEffectView alloc] initWithEffect:effect2];
    effectView2.frame = CGRectMake(imageView.frame.size.width / 2, 0, imageView.frame.size.width / 2, imageView.frame.size.height / 2);
    [imageView addSubview:effectView2];
    
    UIBlurEffect *effect3 = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView3 = [[UIVisualEffectView alloc] initWithEffect:effect3];
    effectView3.frame = CGRectMake(0, imageView.frame.size.height / 2, imageView.frame.size.width, imageView.frame.size.height / 2);
    [imageView addSubview:effectView3];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 101, 100, 50)];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchDown];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)present:(id)sender {
    KLViewController *klVC = [[KLViewController alloc] init];
    [self presentViewController:klVC animated:YES completion:nil];
}

@end
