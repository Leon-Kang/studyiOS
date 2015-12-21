//
//  ViewController.m
//  图片浏览器
//
//  Created by 康梁 on 15/9/2.
//  Copyright (c) 2015年 kl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *_allDescs;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark 根据plist文件来获得文字描述
    // 1. 获得所有描述(通过解析plist文件来创建数组对象，比如传入文件的全路径)
    
    // 如果要访问项目中资源包里的所有资源，使用mainBundle
    NSBundle *bundle = [NSBundle mainBundle];
    
    // 获得文件的全路径
    NSString *path = [bundle pathForResource:@"descs" ofType:@"plist"];
    
    //加载path所对应的文件来创建数组
    _allDescs = [NSArray arrayWithContentsOfFile:path];
    
    //2. 设置默认的描述
    _imageDesc.text = _allDescs[0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 1.图片 2.序号的更改 3.引用描述的变更
- (IBAction)sliderValueChange:(UISlider *)sender {
    //1. 设置中间的照片
    // 获得图片名称
    // 使用 %.f 不保留任何小数
    NSString *imageName = [NSString stringWithFormat:@"%.f.jpg",sender.value];
    _imageView.image = [UIImage imageNamed:imageName];
//    [_imageView setImage:<#(UIImage *)#>];
    
    //2. 设置序号
    _imageNumber.text = [NSString stringWithFormat:@"%.f/16",sender.value + 1];
    
    //3. 设置描述
    int no = (int)(sender.value + 0.5);
    _imageDesc.text = _allDescs[no];
}


#pragma mark 设置
- (IBAction)setting {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    //1. 取出中点
    CGPoint tempCenter = _settingView.center;
    
    //2. 修改Y值
//    tempCenter.y -= _settingView.frame.size.height;
    
    if (_settingView.frame.origin.y == self.view.frame.size.height) {
        //设置界面暂时看不见
        tempCenter.y -= _settingView.bounds.size.height;
    }else{
        //能看见设置界面
        tempCenter.y += _settingView.bounds.size.height;
    }
    
    //3. 重新赋值
    _settingView.center = tempCenter;
    
    [UIView commitAnimations];
}


#pragma mark 图片缩放slider
- (IBAction)imageSizeChange:(UISlider *)sender {
//    CGRect tempFrame = _imageView.frame;
//    
//    tempFrame.size.width = sender.value * 固定x;
//    y同理；
//    _imageView.frame = tempFrame;
    
    _imageView.transform = CGAffineTransformMakeScale(sender.value, sender.value);
    
}


#pragma mark 夜间模式控制
- (IBAction)nightMode:(UISwitch *)sender {
    
    if (sender.on) {
        //开关--开
        self.view.backgroundColor = [UIColor darkGrayColor];
    }else{
        //开关--关
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
}
@end
