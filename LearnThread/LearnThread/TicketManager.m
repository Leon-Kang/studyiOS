//
//  TicketManager.m
//  LearnThread
//
//  Created by 康梁 on 2017/2/16.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

#import "TicketManager.h"

static int const Total = 50;

@interface TicketManager ()

@property (nonatomic, assign) int tickets;
@property (nonatomic, assign) int saleCount;

@property (nonatomic, strong) NSThread *threadBJ;
@property (nonatomic, strong) NSThread *threadSH;

@property (nonatomic, strong) NSCondition *condition;

@end

@implementation TicketManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _tickets = Total;
        [self setupThread];
    }
    return self;
}

- (void)setupThread {
    _condition = [[NSCondition alloc] init];
    
    _threadBJ = [[NSThread alloc] initWithBlock:^{
        [self runThread];
    }];
    _threadBJ.name = @"BJ";
    
    _threadSH = [[NSThread alloc] initWithBlock:^{
        [self runThread];
    }];
    _threadSH.name = @"SH";
}

- (void)runThread {
    while (YES) {
        [_condition lock];
//        @synchronized (self) {
            if (_tickets) {
                [NSThread sleepForTimeInterval:0.1];
                _saleCount = Total - --_tickets;
                NSLog(@"%@, %d, %d",[NSThread currentThread].name, _saleCount, _tickets);
            } else {
                break;
            }
//        }
        [_condition unlock];
    }
}

- (void)startToSale {
    [_threadBJ start];
    [_threadSH start];
}

@end
