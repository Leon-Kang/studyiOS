//
//  Products.h
//  KLArrayKVC
//
//  Created by 康梁 on 16/2/27.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property NSString *name;
@property double price;
@property NSDate *lunchedOn;

- (instancetype)initWithName:(NSString *)name price:(double)price lunchedOn:(NSString *)lunchedOn;

@end
