//
//  NSString+OpenURL.m
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "NSString+OpenURL.h"
#import <UIKit/UIKit.h>

@implementation NSString (OpenURL)




+ (void)open:(NSString *)openURLStr {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:openURLStr]];
}

- (void)openByBrowser {
    [NSString open:self];
}

- (void)openByEmail {
    [NSString open:[NSString stringWithFormat:@"mailto://%@", self]];
}

- (void)openByMessage {
    [NSString open:[NSString stringWithFormat:@"sms://%@", self]];
}

- (void)openByPhone {
    [NSString open:[NSString stringWithFormat:@"tel://%@", self]];
}

@end
