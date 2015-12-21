//
//  UIButton+BeautifulButton.m
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "UIButton+BeautifulButton.h"

@implementation UIButton (BeautifulButton)

- (void)beautifulButton:(UIColor *)color {
    self.tintColor = color ?: [UIColor darkGrayColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10.0;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1.0;
    
}


@end
