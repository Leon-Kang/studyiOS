//
//  ViewController.m
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"
#import "XMLRequestViewController.h"
#import "JSONRequestViewController.h"

@interface ViewController ()


// - (void)layoutUI;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // [self layoutUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//- (instancetype)initWithSampleNameArray:(NSArray *)arry
//{
//    self = [super initWithStyle:UITableViewStyleGrouped];
//    
//    if (self) {
//        self.navigationItem.title = @"使用AFNetworking进行数据请求";
//        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
//        
//        self.arrSimpleName = arry;
//        
//    }
//    
//    
//    
//    return self;
//}
//
//
//- (void)layoutUI {
//    
//}
//
//
//
//#pragma mark - UITableViewController
//
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
//{
//    return 0.1;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.arrSimpleName.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *cellIdentfier = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentfier];
//    }
//    cell.textLabel.text = self.arrSimpleName[indexPath.row];
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    switch (indexPath.row) {
//        case 0:
//        {
//            XMLRequestViewController *XMLRequestVC = [[XMLRequestViewController alloc] init];
//            [self.navigationController pushViewController:XMLRequestVC animated:YES];
//        }
//            break;
//            
//        case 1:
//        {
//            JSONRequestViewController *JSONRequestVC = [[JSONRequestViewController alloc] init];
//            [self.navigationController pushViewController:JSONRequestVC animated:YES];
//        }
//            break;
//        default:
//            break;
//    }
//}
//
//
//
//
//
//
///*
// 类似堆栈的先进后出的原理：
// 返回到（上一级）、（任意级）、（根级）导航
// [self.navigationController popViewControllerAnimated:YES];
// [self.navigationController popToViewController:thirdSampleVC animated:YES];
// [self.navigationController popToRootViewControllerAnimated:YES];
// */
















@end
