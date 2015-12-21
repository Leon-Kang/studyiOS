//
//  ViewController.m
//  联系人管理
//
//  Created by 康梁 on 15/9/6.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import "ViewController.h"

#define kDuration 0.3
#define kRowH 50
#define kName 10

@interface ViewController (){
    NSArray *_allNames;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _allNames = @[@"s",@"j",@"a",@"e",@"i"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 添加一行
- (IBAction)add:(UIBarButtonItem *)sender {
    
    // 0. 取出最后一个子控件
    UIView *last = [self.view.subviews lastObject];
    // 这行的Y = 最后一个子控件的Y + 最后一个子控件的高度 +间距
    CGFloat rowY = (last.frame.origin.y + last.frame.size.height + 1);
    
    // 1. 创建一行
    UIView *rowView = [self createRowView];
    rowView.frame = CGRectMake(0, rowY, 375, 50);
    
    // 2. 添加一行到控制器的view中
    [self.view addSubview:rowView];
    
    // 3. 让删除Item有效
    _removeItem.enabled = YES;
    
    // 4. 执行动画
    rowView.frame = CGRectMake(375, rowY, 375, 50);
    rowView.alpha = 0;
    
    // 4.1 开始动画

    
    [UIView animateWithDuration:kDuration animations:^{
        rowView.frame = CGRectMake(0, rowY, 375, 50);
        rowView.alpha = 1;
    }];
    
}

#pragma mark 创建一行
- (UIView *)createRowView{
    // 1. 创建blu父控件
    UIView *rowView = [[UIView alloc] init];
    rowView.backgroundColor = [UIColor blueColor];
    
    // 2. 添加名字
    UILabel *name = [[UILabel alloc]init];
    name.frame = CGRectMake(0, 0, 375, kRowH);
    name.backgroundColor = [UIColor clearColor];
    name.tag = kName;
    
    // 随机名字
    int nameIndex = arc4random_uniform(5);
    name.text = _allNames[nameIndex];
    // 文字居中
    name.textAlignment = NSTextAlignmentCenter;
    [rowView addSubview:name];
    
    // 3. 显示头像
    UIButton *icon = [UIButton buttonWithType:UIButtonTypeCustom];
    icon.frame = CGRectMake(20, 0, 50, kRowH);
    // 随机产生文件名
    int ramdomIndex = arc4random_uniform(11);
    NSString *iconName = [NSString stringWithFormat:@"index%d.jpg",ramdomIndex];
    // 设置图片
    [icon setImage:[UIImage imageNamed:iconName]forState:UIControlStateNormal];
    // 添加监听
    [icon addTarget:self action:@selector(iconClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [rowView addSubview:icon];
    return rowView;
}

#pragma mark 监听按钮点击
- (void)iconClick:(UIButton *)btn{
    // 1. 取得按钮的父控件 (因为label和btn处在同一个父控件中)
    
    // 2. 获取文本标签
    UILabel *label = (UILabel *)[btn.superview viewWithTag:kName];
    
    // 3. 打印
    NSLog(@"name is %@",label.text);
}

#pragma mark 删除一行
- (IBAction)remove:(UIBarButtonItem *)sender {
    
    // 1. 取出最后一个子控件
    UIView *last = [self.view.subviews lastObject];
    
    // 2. 移除这个子控件

    
    [UIView animateWithDuration:kDuration animations:^{
        CGRect tempF = last.frame;
        tempF.origin.x = 375;
        last.frame = tempF;
        
        last.alpha = 0;
    } completion:^(BOOL finished) {
        [last removeFromSuperview];
        _removeItem.enabled = self.view.subviews.count > 1;
    }];

}
@end
