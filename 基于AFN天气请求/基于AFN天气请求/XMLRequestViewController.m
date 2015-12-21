//
//  XMLRequestViewController.m
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "XMLRequestViewController.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "UIButton+BeautifulButton.h"
#import "XMLDictionary.h"
#import "PrefixHeader.pch"

@interface XMLRequestViewController ()

- (void)layoutUI;
- (void)convertXMLParserToDictionary:(NSXMLParser *)parser;

@end

@implementation XMLRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self layoutUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)layoutUI {
    self.navigationItem.title = kTitleOfXMLRequest;
    
    [self.btnSendRequest beautifulButton:nil];
    
    self.textResult = [[UITextView alloc] init];
    self.textResult.editable = NO;
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.textResult.frame = CGRectMake(5, 64, rect.size.width - 10, rect.size.height - 164);
    self.textResult.font = [UIFont systemFontOfSize:15];
    self.textResult.text = @"点击「发送请求」按钮获取天气信息";
    
    [self.view addSubview:self.textResult];
    
    // 启动网络活动指示器；会根据网络交互情况，实时显示或隐藏网络活动指示器；他通过「通知与消息机制」来实现 [UIApplication sharedApplication].networkActivityIndicatorVisible 的控制
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
}


- (void)convertXMLParserToDictionary:(NSXMLParser *)parser {
    // dictionaryWithXMLParser: 是第三方框架 XMLDictionary 的方法
    NSDictionary *dic = [NSDictionary dictionaryWithXMLParser:parser];
    
    NSMutableString *mStrWeatherInfo = [[NSMutableString alloc] initWithString:@"广州三天天气:\n"];
    
    NSArray *arrWeatherInfo = [dic objectForKey:@"string"];
    
    if (arrWeatherInfo != nil && arrWeatherInfo.count > 22) {
        NSMutableArray *mArrRange = [[NSMutableArray alloc] init];
        
        NSUInteger loc = mStrWeatherInfo.length;
        [mStrWeatherInfo appendFormat:@"\n %@", arrWeatherInfo[6]];
        
        NSUInteger len = mStrWeatherInfo.length - loc;
        NSValue *valuObj = [NSValue valueWithRange:NSMakeRange(loc, len)];
        [mArrRange addObject:valuObj];
        [mStrWeatherInfo appendFormat:@"\n %@", arrWeatherInfo[5]];
        [mStrWeatherInfo appendFormat:@"\n %@", arrWeatherInfo[7]];
        [mStrWeatherInfo appendFormat:@"\n %@", arrWeatherInfo[10]];
        
        loc = mStrWeatherInfo.length;
        [mStrWeatherInfo appendFormat:@"\n \n %@", arrWeatherInfo[13]];
        len = mStrWeatherInfo.length - loc;
        valuObj = [NSValue valueWithRange:NSMakeRange(loc, len)];
        [mArrRange addObject:valuObj];
        [mStrWeatherInfo appendFormat:@"\n %@", arrWeatherInfo[12]];
        [mStrWeatherInfo appendFormat:@"\n %@", arrWeatherInfo[14]];
        
        loc = mStrWeatherInfo.length;
        [mStrWeatherInfo appendFormat:@"\n \n %@", arrWeatherInfo[18]];
        len = mStrWeatherInfo.length - loc;
        valuObj = [NSValue valueWithRange:NSMakeRange(loc, len)];
        [mArrRange addObject:valuObj];
        [mStrWeatherInfo appendFormat:@"\n %@", arrWeatherInfo[17]];
        [mStrWeatherInfo appendFormat:@"\n %@", arrWeatherInfo[19]];
        
        [mStrWeatherInfo appendFormat:@"\n %@", arrWeatherInfo[22]];
        
        // 数据的前10个字符以16.0像素加粗显示；这里使用 UITextView 的 attributedText，而他的 text 无法实现这种需求
        NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithString:mStrWeatherInfo];
        [mAttrStr addAttribute:NSFontAttributeName
                         value:[UIFont boldSystemFontOfSize:16]
                         range:NSMakeRange(0, 10)];
        
        // 数据的日期部分以紫色显示
        for (NSValue *item in mArrRange) {
            NSRange currentRange;
            [item getValue:&currentRange];
            [mAttrStr addAttribute:NSForegroundColorAttributeName
                             value:[UIColor purpleColor]
                             range:currentRange];
        }
        
        // 数据的前10个字符之后的内容全部以15.0像素显示
        [mAttrStr addAttribute:NSFontAttributeName
                         value:[UIFont systemFontOfSize:15]
                         range:NSMakeRange(10, mStrWeatherInfo.length - 10)];
        self.textResult.attributedText = mAttrStr;
        
    } else {
        self.textResult.text = @"请求数据无效";
    }
    
    
}


- (IBAction)sendRequest:(id)sender {
    // AFNetworking 3.0取消了AFHTTPRequestOperation类，以下为自己尝试的AFHTTPSessionManager写法
    NSURL *Url = [NSURL URLWithString:kXMLRequestURLStr];
    // NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:Url.absoluteString parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
           //  NSLog(@"progress %@", downloadProgress);
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
            NSLog(@"JSON: %@", responseObject);
            NSXMLParser *parser = (NSXMLParser *)responseObject;
            // 这里使用了第三方框架 XMLDictionary，他本身继承并实现 NSXMLParserDelegate 委托代理协议，对数据进行遍历处理
             [self convertXMLParserToDictionary:parser];
        }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             
             NSLog(@"JSON %@", error);
            
        }];
}


#pragma mark - NSXMLParserDelegate

// 开始解析 XML 文件，在开始解析 XML 节点前，通过该方法可以做一些初始化工作
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"开始解析MXL文件");
}


// 当解析器对象遇到 XML 的开始标记时，调用这个方法开始解析该节点
- (void)parser:(NSXMLParser *)parser didStartElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(nonnull NSDictionary<NSString *,NSString *> *)attributeDict
{
    NSLog(@"发现节点 %@", elementName);
}


// 当解析器找到开始标记和结束标记之间的字符时，调用这个方法解析当前节点的所有字符
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"解析字符 %@", string);
}


// 当解析器对象遇到 XML 的结束标记时，调用这个方法完成解析该节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"解析节点结束：%@", elementName);
}



// 解析 XML 出错的处理方法
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"错误信息 %@", parseError);
}


// 解析 XML 文件结束
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"解析 XML 文件结束");
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
