//
//  ViewController.m
//  按键操作
//
//  Created by 康梁 on 15/8/30.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 控制按钮 上下左右
- (IBAction)up:(id)sender {
    //OC语法规则：不允许直接修改 某个对象中结构体属性的成员
    
    //0.动画(头部-》开始动画)
    [UIView beginAnimations:nil context:nil];
    
    //设置动画执行时间
    [UIView setAnimationDuration:2];
    
    //1.先取出frame
    CGRect tempframe = _btn.frame;
    
    //2.修改y值
    tempframe.origin.y -= 10;
    
    //3.重新赋值按钮的frame
    _btn.frame = tempframe;
    
    //4.动画(尾部--提交动画--执行动画)
    [UIView commitAnimations];
}

- (IBAction)down:(id)sender {
    //0.动画(头部-》开始动画)
    [UIView beginAnimations:nil context:nil];
    
    //设置动画执行时间
    [UIView setAnimationDuration:2];
    
    //1.先取出frame
    CGRect tempframe = _btn.frame;
    
    //2.修改y值
    tempframe.origin.y += 10;
    
    //3.重新赋值按钮的frame
    _btn.frame = tempframe;
    
    //4.动画(尾部--提交动画--执行动画)
    [UIView commitAnimations];

}

- (IBAction)left:(id)sender {
    //0.动画(头部-》开始动画)
    [UIView beginAnimations:nil context:nil];
    
    //设置动画执行时间
    [UIView setAnimationDuration:2];
    
    //1.先取出frame
    CGRect tempframe = _btn.frame;
    
    //2.修改y值
    tempframe.origin.x -= 10;
    
    //3.重新赋值按钮的frame
    _btn.frame = tempframe;
    
    //4.动画(尾部--提交动画--执行动画)
    [UIView commitAnimations];

}

- (IBAction)right:(id)sender {
    //0.动画(头部-》开始动画)
    [UIView beginAnimations:nil context:nil];
    
    //设置动画执行时间
    [UIView setAnimationDuration:2];
    
    //1.先取出frame
    CGRect tempframe = _btn.frame;
    
    //2.修改y值
    tempframe.origin.x += 10;
    
    //3.重新赋值按钮的frame
    _btn.frame = tempframe;
    
    //4.动画(尾部--提交动画--执行动画)
    [UIView commitAnimations];

}
#pragma mark 旋转
- (IBAction)leftRotate:(id)sender {
    
    //弧度 π - M_PI
    //角度 180
    //向左旋转45（逆时针）
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    self.btn.transform = CGAffineTransformRotate(_btn.transform,- M_PI_4);
    [UIView commitAnimations];
}

- (IBAction)rightRotate:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    self.btn.transform = CGAffineTransformRotate(_btn.transform, M_PI_4);
    [UIView commitAnimations];

}
#pragma mark ZOOM
- (IBAction)zoomBig:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    self.btn.transform = CGAffineTransformScale(_btn.transform, 1.5,1.5 );
    [UIView commitAnimations];
}

- (IBAction)zoomSmall:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    _btn.transform = CGAffineTransformScale(_btn.transform, 0.5, 0.5);
    [UIView commitAnimations];
}
@end
