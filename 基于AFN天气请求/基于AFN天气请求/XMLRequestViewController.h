//
//  XMLRequestViewController.h
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLRequestViewController : UIViewController <NSXMLParserDelegate>

@property (strong, nonatomic) UITextView *textResult;
@property (strong, nonatomic) IBOutlet UIButton *btnSendRequest;

@end
