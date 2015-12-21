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
- (IBAction)up:(id)sender;
- (IBAction)down:(id)sender;
- (IBAction)left:(id)sender;
- (IBAction)right:(id)sender;

- (IBAction)leftRotate:(id)sender;
- (IBAction)rightRotate:(id)sender;
- (IBAction)zoomBig:(id)sender;
- (IBAction)zoomSmall:(id)sender;

@end

