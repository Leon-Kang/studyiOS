//
//  ViewController.m
//  UIButton和UIImageView的区别
//
//  Created by 康梁 on 15/9/4.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import "ViewController.h"

/*
 1.显示图片
 1>UIImageView只能显示一种图片（图片会默认填充整个UIImageView） 
   调用方法： image\setImage
 2>UIButton能显示两种图片
  * 背景（背景会填充整个UIButton）
    调用方法： setBackroungImage：forState
  * 前置（覆盖在背景上面的图片,按照之前的尺寸显示）
    调用方法： setImage：forState
 
 2.点击事件
   调用方法：addTarget： action： forControlEvent：
 1>UIImageView默认不能响应点击事件
 
 2>UIButton可以响应点击事件
 
 3.使用场合
 以是否需要点击回应选择
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 添加ImageView
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"index0.jpg"];
    imageView.frame = CGRectMake(0, 0, 150, 150);
    [self.view addSubview:imageView];
    
    // 2. UIButton
    UIButton *btn = [[UIButton alloc]init];
    // 设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateNormal];
    // 设置图片
    [btn setImage:[UIImage imageNamed:@"index1.jpg"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(200, 0, 150, 150);
    // 设置文字
    [btn setTitle:@"it's a button" forState:UIControlStateHighlighted];
    
    //增加一个点击监视
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDragInside];
    
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClick:(UIButton *)mybtn{
    NSLog(@"it's my button!!!");
}
@end
