//
//  ViewController.m
//  表情排列
//
//  Created by 康梁 on 15/9/3.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import "ViewController.h"

#define kImgWH 60

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
    
    
    int columns = 3; // 每行三列
    // 每个表情之间的间距 = （控制器view的宽度 - 列数*表情的宽度）/（列数 + 1）
    
    CGFloat margin = (self.view.frame.size.width - columns * kImgWH) / (columns + 1);
    
    CGFloat oneY = 100;
    CGFloat oneX = margin;
    
    for (int i = 0; i < 9; i++) {
        NSString *imageName = [NSString stringWithFormat:@"index%d.ipg",i];
        
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
- (void)addImage:(NSString *)icon x:(CGFloat)x y:(CGFloat)y{
    UIImageView *index = [[UIImageView alloc]init];
    index.image = [UIImage imageNamed:icon];
    index.frame = CGRectMake(x, y, kImgWH, kImgWH);
    [self.view addSubview:index];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)indexChange:(UISegmentedControl *)sender {
    
}
@end
