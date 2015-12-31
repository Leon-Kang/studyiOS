//
//  ViewController.m
//  AboutUIAlertController
//
//  Created by 康梁 on 15/12/31.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)alertOneAction:(id)sender;
- (IBAction)alertTwoAction:(id)sender;
- (IBAction)alertThreeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

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

- (IBAction)alertOneAction:(id)sender {
    UIAlertController *alertOne = [UIAlertController alertControllerWithTitle:@"I'm alertOne" message:@"I want to tell you something" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertOne addAction:cancel];
    
    UIAlertAction *certain = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertOne addAction:certain];
    
//    UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"销毁" style:UIAlertActionStyleDestructive handler:nil];
//    [alertOne addAction:destructive];

    [alertOne addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // 监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
        
        // 定制键盘和输入框背景文字及clearButton
        textField.placeholder = @"请输入";
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }];


    [alertOne addTextFieldWithConfigurationHandler:nil];
    [alertOne addTextFieldWithConfigurationHandler:nil];
    [alertOne addTextFieldWithConfigurationHandler:nil];
    [alertOne addTextFieldWithConfigurationHandler:nil];
    [alertOne addTextFieldWithConfigurationHandler:nil];


    
    [self presentViewController:alertOne animated:YES completion:nil];
}

#pragma mark -监听方法
- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification
{
    UITextField *textField = notification.object;
    self.textLabel.text = textField.text;
}

- (IBAction)alertTwoAction:(id)sender {
//    NSString *title = NSLocalizedString(@"AlertTwo", nil);
    UIAlertController *alertTwo = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertTwo addAction:cancel];
    
    UIAlertAction *certain = [UIAlertAction actionWithTitle:@"清空" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        self.textLabel.text = nil;
    }];
    [alertTwo addAction:certain];
    
    
    

    


    
    [self presentViewController:alertTwo animated:YES completion:nil];
    
}

- (IBAction)alertThreeAction:(id)sender {
    
}
@end
