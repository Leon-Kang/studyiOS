//
//  ViewController.m
//  表情排列
//
//  Created by 康梁 on 15/9/3.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import "ViewController.h"

// 图片的宽高
#define kImgWH 50

@interface ViewController ()

@end

@implementation ViewController

#pragma mark 控制器的view加载完毕就调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //1. 创建表情
//    UIImageView *one = [[UIImageView alloc]init];
//    one.image = [UIImage imageNamed:@"index0.jpg"];
//    one.frame = CGRectMake(0, 0, 30, 30);
//    [self.view addSubview:one];
    
    // 1. 定义列表、间距
    int columns = 2; // 每行三列
    // 每个表情之间的间距 = （控制器view的宽度 - 列数*表情的宽度）/（列数 + 1）
    CGFloat margin = (self.view.frame.size.width - columns * kImgWH) / (columns + 1);
    
    // 2. 定义第一个表情的位置
    // 第一个表情的X Y值
    CGFloat oneY = 100;
    CGFloat oneX = margin;
    
    // 3. 创建所有的表情
    for (int i = 0; i < 11; i++) {
        
        int no = i % 9;  // no == [0 ,8]
        
        NSString *imageName = [NSString stringWithFormat:@"index%d.jpg",no];
        
        // i这个位置对应的列数
        int col = i % columns;
        // i这个位置对应的行数
        int row = i / columns;
        
        // 列数（col）决定了x
        CGFloat x = oneX + col * (kImgWH + margin);
        // 行数（row）决定了y
        CGFloat y = oneY + row * (kImgWH + margin);
        
        [self addImage:imageName x:x y:y];
    }
    
}

#pragma mark 添加表情 icon:表情图片名
- (void)addImage:(NSString *)icon x:(CGFloat)x y:(CGFloat)y
{
    UIImageView *index = [[UIImageView alloc]init];
    index.image = [UIImage imageNamed:icon];
    index.frame = CGRectMake(x, y, kImgWH, kImgWH);
    [self.view addSubview:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 更改列数
- (IBAction)indexChange:(UISegmentedControl *)sender {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    // 1. 定义列表、间距
    long int columns = (sender.selectedSegmentIndex + 2);
    
    // 每个表情之间的间距 = （控制器view的宽度 - 列数*表情的宽度）/（列数 + 1）
    CGFloat margin = (self.view.frame.size.width - columns * kImgWH) / (columns + 1);
    
    // 2. 定义第一个表情的位置
    // 第一个表情的X Y值
    CGFloat oneY = 100;
    CGFloat oneX = margin;
    
    // 3. 创建所有的表情
    for (int i = 0; i < 11; i++) {
        
        // i这个位置对应的列数
        int col = i % columns;
        // i这个位置对应的行数
        int row = i / columns;
        
        // 列数（col）决定了x
        CGFloat x = oneX + col * (kImgWH + margin);
        // 行数（row）决定了y
        CGFloat y = oneY + row * (kImgWH + margin);
        
        // 取出i位置对应的imageView，设置x，y值；
        // 使用i+1跳过UISegmentedControl
        UIView *child = self.view.subviews[i + 1];
        
        // 取出frame
        CGRect tempF = child.frame;
        
//        tempF.origin.x = x;
//        tempF.origin.y = y;
        tempF.origin = CGPointMake(x, y);
        
        child.frame = tempF;
//        [self addImage:imageName x:x y:y];
    }
    
    [UIView commitAnimations];
}
@end
