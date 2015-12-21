//
//  KLTableViewController.h
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/21.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLTableViewController : UITableViewController


@property (nonatomic, copy) NSArray *arrSimpleName;

- (instancetype)initWithSampleNameArray:(NSArray *)arry;

@end
