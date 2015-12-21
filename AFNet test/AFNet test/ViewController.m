//
//  ViewController.m
//  AFNet test
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建一个AFN对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //设置是否信任与无效或过期的 SSL 证书的服务器。默认为否。
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    // 添加网络请求头的设定有如下方法(AFNetworking 设置header)
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.responseSerializer setValue:@"application/json; charset=utf-8" forKey:@"Content-Type"];
    
    // 然后只要将服务器的地址填写好,parameters参数写好,就可以POST数据到服务器了.不用担心更新UI时需要主线程的问题,回调函数将在主线程中进行.
    [manager POST:@"MY SERVER URL" parameters:self
       constructingBodyWithBlock:
     ^(id<AFMultipartFormData>  _Nonnull formData)
     {
         
         
         
     } progress:
     ^(NSProgress * _Nonnull uploadProgress)
     {
         
         
         
     } success:
     ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         
         
         
     } failure:
     ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
         
         
     }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
