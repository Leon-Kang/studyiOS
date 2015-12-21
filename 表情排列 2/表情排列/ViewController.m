//
//  ViewController.m
//  表情排列
//
//  Created by 康梁 on 15/9/3.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import "ViewController.h"

// 图片的宽高
#define kImgWH 60
#define kInitCount 13
@interface ViewController ()

@end

@implementation ViewController

#pragma mark 控制器的view加载完毕就调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self adjustImagePosWithColumus:2 add:YES];
    
}

#pragma mark 调整图片位置
- (void)adjustImagePosWithColumus:(long int)columns add:(bool)add
{
    //1. 创建表情
    // 1. 定义列表、间距
    
    // 每个表情之间的间距 = （控制器view的宽度 - 列数*表情的宽度）/（列数 + 1）
    CGFloat margin = (self.view.frame.size.width - columns * kImgWH) / (columns + 1);
    
    // 2. 定义第一个表情的位置
    // 第一个表情的X Y值
    CGFloat oneY = 100;
    CGFloat oneX = margin;
    
    // 3. 创建所有的表情
    for (int i = 0; i < kInitCount; i++) {
        
        // i这个位置对应的列数
        int col = i % columns;
        // i这个位置对应的行数
        int row = i / columns;
        
        // 列数（col）决定了x
        CGFloat x = oneX + col * (kImgWH + margin);
        // 行数（row）决定了y
        CGFloat y = oneY + row * (kImgWH + margin);
//        
        if (add) {
            // 添加新的imageView
            int no = i % 9;  // no == [0 ,8]
            NSString *imageName = [NSString stringWithFormat:@"index%d.jpg",no];
            [self addImage:imageName x:x y:y];
            
        }else{
            // 取出旧的imageView ， 设置 X Y
            
            // 取出i位置对应的imageView，设置x，y值；
            // 使用i+1跳过UISegmentedControl
            UIView *child = self.view.subviews[i + 3];
            // 取出frame
            CGRect tempF = child.frame;
            tempF.origin = CGPointMake(x, y);
            child.frame = tempF;
//            NSLog(@"%@",child.class);
        }
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
    
    [self adjustImagePosWithColumus:(sender.selectedSegmentIndex + 2) add:NO];
    
    [UIView commitAnimations];
}
@end
