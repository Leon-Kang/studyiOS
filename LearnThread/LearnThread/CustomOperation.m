//
//  CustomOperation.m
//  LearnThread
//
//  Created by 康梁 on 2017/2/18.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

#import "CustomOperation.h"

@interface CustomOperation ()

@property (nonatomic, copy) NSString *operationName;

@end

@implementation CustomOperation

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _operationName = name;
    }
    return self;
}

@end
