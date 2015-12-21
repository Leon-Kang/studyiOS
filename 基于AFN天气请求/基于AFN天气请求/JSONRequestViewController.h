//
//  JSONRequestViewController.h
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSONRequestViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *mArrCell;
@property (strong, nonatomic) UILabel *lblEmptyDataMsg;

@property (strong, nonatomic) UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIButton *btnSendRequest;

@end
