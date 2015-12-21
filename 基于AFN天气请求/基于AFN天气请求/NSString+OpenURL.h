//
//  NSString+OpenURL.h
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (OpenURL)

/**
 *    @author kl, 15-12-21 00:12:21
 *
 *    @brief 打开浏览器
 */
- (void)openByBrowser;
/**
 *    @author kl, 15-12-21 00:12:31
 *
 *    @brief 打开email
 */
- (void)openByEmail;
/**
 *    @author kl, 15-12-21 00:12:46
 *
 *    @brief 打开电话
 */
- (void)openByPhone;
/**
 *    @author kl, 15-12-21 00:12:56
 *
 *    @brief 打开信息
 */
- (void)openByMessage;

@end
