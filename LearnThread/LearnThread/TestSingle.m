//
//  TestSingle.m
//  LearnThread
//
//  Created by 康梁 on 2017/2/18.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

#import "TestSingle.h"

@implementation TestSingle

+ (instancetype)defaultSingle {
    static dispatch_once_t onceToken;
    __block TestSingle *single = nil;
    dispatch_once(&onceToken, ^{
        single = [[TestSingle alloc] init];
    });
    return single;
}

@end
