//
//  ViewController.h
//  按键操作
//
//  Created by 康梁 on 15/8/30.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)run:(id)sender;

- (IBAction)rotate:(id)sender;

- (IBAction)scale:(id)sender;

- (IBAction)reset:(id)sender;

@end

