//
//  main.m
//  KLNSArrayKVC
//
//  Created by 康梁 on 16/2/28.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Product *product_1 = [[Product alloc] initWithName:@"iphone5" price:199.0 lunchedOn:@"2012-09-12"];
        Product *product_2 = [[Product alloc] initWithName:@"iPad Mini" price:329.0 lunchedOn:@"2012-11-02"];
        Product *product_3 = [[Product alloc] initWithName:@"MacBook Pro" price:1699.0 lunchedOn:@"2012-06-11"];
        Product *product_4 = [[Product alloc] initWithName:@"iMac" price:1299 lunchedOn:@"2012-11-02"];
        
        NSArray *products = @[product_1, product_2, product_3, product_4];
        
        NSLog(@"%@", products);
        
        NSLog(@"%@", [products valueForKeyPath:@"@count"]);
        
        NSLog(@"%@", [products valueForKeyPath:@"@sum.price"]);
        
        NSLog(@"%@", [products valueForKeyPath:@"@avg.price"]);
        
        NSLog(@"%@", [products valueForKeyPath:@"@max.price"]);
        
        NSLog(@"%@", [products valueForKeyPath:@"@min.lunchedOn"]);
        
        
        
    }
    return 0;
}


