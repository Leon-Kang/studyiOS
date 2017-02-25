//
//  ViewController.m
//  LearnThread
//
//  Created by 康梁 on 2017/2/15.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
#import "TicketManager.h"
#import "CustomOperation.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    TicketManager *manager = [[TicketManager alloc] init];
//    [manager startToSale];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(15, 150, 150, 28);
    [button setTitle:@"pThread" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(clickPThread) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *nsThreadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nsThreadButton.frame = CGRectMake(15, 350, 150, 28);
    [nsThreadButton setTitle:@"NSThread" forState:UIControlStateNormal];
    nsThreadButton.backgroundColor = [UIColor blueColor];
    [nsThreadButton addTarget:self action:@selector(clickNSThread) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *gcdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    gcdButton.frame = CGRectMake(15, 450, 150, 28);
    [gcdButton setTitle:@"GCD" forState:UIControlStateNormal];
    gcdButton.backgroundColor = [UIColor blueColor];
    [gcdButton addTarget:self action:@selector(clickGCD) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *opButton = [UIButton buttonWithType:UIButtonTypeCustom];
    opButton.frame = CGRectMake(15, 450, 150, 28);
    [opButton setTitle:@"op" forState:UIControlStateNormal];
    opButton.backgroundColor = [UIColor blueColor];
    [opButton addTarget:self action:@selector(clickOP) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [self.view addSubview:nsThreadButton];
    [self.view addSubview:gcdButton];
    [self.view addSubview:opButton];
}

- (void)clickPThread {
    pthread_t pthread;
    pthread_create(&pthread, NULL, run, NULL);
}

void *run(void *data) {
    for (int i = 0; i <= 10; i++) {
        NSLog(@"%d", i);
    }
    return NULL;
}

- (void)threadPrint {
    NSLog(@"%@", [NSThread currentThread].name);
    for (int i = 0; i <= 10; i++) {
        NSLog(@"%d", i);
        sleep(0.3);
    }
}

- (void)clickNSThread {
    // 1.
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        [self threadPrint];
        NSLog(@"%@", thread.name);
    }];
    [thread setThreadPriority:0.4];
    [thread start];
    // 2.
    [NSThread detachNewThreadWithBlock:^{
        [self threadPrint];
    }];
    // 3.
    [self performSelectorInBackground:@selector(threadPrint) withObject:nil];
}

- (void)clickGCD {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"loading....");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"loaded");
        });
    });
    
    dispatch_queue_t queue = dispatch_queue_create("disptch_custom_queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [self threadPrint];
    });
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [self threadPrint];
    });
    
    dispatch_group_enter(group);
    [self sendRequest:^{
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
}

- (void)clickOP {
    NSInvocationOperation *invocationOP = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(threadPrint) object:nil];
    [invocationOP start];
    
    NSBlockOperation *blockOP = [NSBlockOperation blockOperationWithBlock:^{
        
    }];
    [blockOP start];
    
    if (_operationQueue == nil) {
        [_operationQueue addOperation:blockOP];
    }
    
    [self.operationQueue setMaxConcurrentOperationCount:1];
    
    CustomOperation *customOP = [[CustomOperation alloc] initWithName:@"name"];
    [_operationQueue addOperation:customOP];
}

- (void)sendRequest:(void(^)())block {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
    });
}

@end
