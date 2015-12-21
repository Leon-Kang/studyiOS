//
//  ViewController.h
//  联系人管理
//
//  Created by 康梁 on 15/9/6.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// 添加
- (IBAction)add:(UIBarButtonItem *)sender;

// 删除
- (IBAction)remove:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *removeItem;



@end

