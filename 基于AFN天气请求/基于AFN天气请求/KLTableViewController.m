//
//  KLTableViewController.m
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/21.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLTableViewController.h"
#import "XMLRequestViewController.h"
#import "JSONRequestViewController.h"

@interface KLTableViewController ()


- (void)layoutUI;

@end

@implementation KLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (instancetype)initWithSampleNameArray:(NSArray *)arry
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        self.navigationItem.title = @"使用AFNetworking进行数据请求";
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
        
        self.arrSimpleName = arry;
        
    }
    

    
    return self;
}


- (void)layoutUI {
    
}



#pragma mark - UITableViewController

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    CGFloat i = 1;
    return i;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
         return _arrSimpleName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentfier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentfier];
    }
    cell.textLabel.text = self.arrSimpleName[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            XMLRequestViewController *XMLRequestVC = [[XMLRequestViewController alloc] init];
            [self.navigationController pushViewController:XMLRequestVC animated:YES];
        }
            break;
            
        case 1:
        {
            JSONRequestViewController *JSONRequestVC = [[JSONRequestViewController alloc] init];
            [self.navigationController pushViewController:JSONRequestVC animated:YES];
        }
            break;
        default:
            break;
    }
}



//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    double d = 5.0;
//    // double r = d/0.0;
//    CGFloat r = 0;
//    if (isnan(r) || isinf(r)) {
//        // ...
//    }
//    return r;
//}



/*
 类似堆栈的先进后出的原理：
 返回到（上一级）、（任意级）、（根级）导航
 [self.navigationController popViewControllerAnimated:YES];
 [self.navigationController popToViewController:thirdSampleVC animated:YES];
 [self.navigationController popToRootViewControllerAnimated:YES];
 */


@end
