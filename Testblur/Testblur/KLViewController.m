//
//  KLViewController.m
//  Testblur
//
//  Created by 康梁 on 16/2/5.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "KLViewController.h"
#import <Foundation/Foundation.h>

@interface KLViewController ()


@end

@implementation KLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:17];
    button.frame = CGRectMake(100, 400, 250, 40);
    button.backgroundColor = [UIColor whiteColor];
    // button.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    button.titleLabel.text = @"test";
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:button];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *eV = [[UIVisualEffectView alloc] initWithEffect:effect];
    eV.frame = CGRectMake(0, 0, 250, 40);
    
    [button addSubview:eV];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
