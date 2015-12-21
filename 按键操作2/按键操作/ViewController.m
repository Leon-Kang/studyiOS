//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖保佑             永无BUG
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？


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

- (void)btnClickWithBlock:(void(^)())block{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    
    block();
    
    [UIView commitAnimations];
    
}
- (IBAction)run:(id)sender {

    
    [self btnClickWithBlock:^{
    //1.先取出frame
    CGRect tempframe = _btn.frame;
    
    //2.取出按钮的tag标记
    long int tag = [sender tag];
    CGFloat delta = 10;
    switch (tag) {
        case 1://up
            tempframe.origin.y -= delta;
            break;
        case 2://right
            tempframe.origin.x += delta;
            break;
        case 3://down
            tempframe.origin.y += delta;
            break;
        case 4://left
            tempframe.origin.x -= delta;
            break;
        default:
            break;
    
    }
    
    //3.重新赋值按钮的frame
    _btn.frame = tempframe;
    
    }];


}

- (IBAction)rotate:(id)sender {

    [self btnClickWithBlock:^{
    long int tag = [sender tag];
    if (10 == tag) {
        _btn.transform = CGAffineTransformRotate(_btn.transform, -M_PI_4);
    }else{
        _btn.transform = CGAffineTransformRotate(_btn.transform, M_PI_4);
    } 
    }];
    
    
    
    
//    _btn.transform = CGAffineTransformRotate(_btn.transform, M_PI_4 * (10 ==tag)? -1 : 1);   利用三目运算判断

}

- (IBAction)scale:(id)sender {

    
    [self btnClickWithBlock:^{
    CGFloat scale = [sender tag] == 30 ? 1.5 :0.5;
    _btn.transform = CGAffineTransformScale(_btn.transform, scale, scale);
    }];
    
//    long int tag = [sender tag];
//    if (30 == tag) {
//        _btn.transform = CGAffineTransformScale(_btn.transform, 1.5, 1.5);
//    }else{
//        _btn.transform = CGAffineTransformScale(_btn.transform, 0.5, 0.5);
//    }
    
}

- (IBAction)reset:(id)sender {
    [self btnClickWithBlock:^{
        _btn.transform = CGAffineTransformIdentity;
    }];
}
@end
