//
//  UIButton+BeautifulButton.h
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIButton (BeautifulButton)

/**
 *    @author kl, 15-12-21 00:12:12
 *
 *    @brief 根据按钮颜色，返回文字颜色的圆角按钮
 *
 *    @param color 按钮文字颜色；nil 为深灰色
 */
- (void)beautifulButton:(UIColor *)color;

@end
