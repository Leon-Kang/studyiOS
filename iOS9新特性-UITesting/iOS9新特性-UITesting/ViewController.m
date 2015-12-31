//
//  ViewController.m
//  iOS9新特性-UITesting
//
//  Created by 康梁 on 15/12/28.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;

- (IBAction)loginAction:(id)sender;

- (IBAction)switchAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *pushBotton;
- (IBAction)pushAction:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;



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

- (IBAction)loginAction:(id)sender {
    
    if ([self.userName.text isEqualToString:@"kl"] && [self.userPassword.text isEqualToString:@"kl"]) {
        NSLog(@"登陆成功");
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"fails" preferredStyle:1];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
         
         
    }
    
    
    
}

- (IBAction)switchAction:(id)sender {
    self.pushBotton.enabled = [self.switchButton isOn];
    
    
}

- (IBAction)pushAction:(id)sender {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = @"vcr";
    [self.navigationController pushViewController:vc animated:YES];
}
@end
