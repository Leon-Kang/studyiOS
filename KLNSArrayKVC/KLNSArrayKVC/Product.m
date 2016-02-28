//
//  Products.m
//  KLArrayKVC
//
//  Created by 康梁 on 16/2/27.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype)initWithName:(NSString *)name price:(double)price lunchedOn:(NSString *)lunchedOn {
    self = [super init];
    if (self) {
        self.name = name;
        self.price = price;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-mm-dd"];
        self.lunchedOn = [dateFormatter dateFromString:lunchedOn];
    }
    return self;
}

@end
