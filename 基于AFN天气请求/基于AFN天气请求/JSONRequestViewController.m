//
//  JSONRequestViewController.m
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "JSONRequestViewController.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "KMTableViewCell.h"
#import "UIButton+BeautifulButton.h"
#import "NSString+OpenURL.h"
#import "PrefixHeader.pch"


static NSString *cellIdentifier = @"cellIdentifier";

@interface JSONRequestViewController ()

- (void)layoutUI;
- (NSString *)displayTimeFromCreatedAt:(NSString *)createdAt;
- (void)loadData:(NSArray *)arrData;


@end

@implementation JSONRequestViewController

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
    self.navigationItem.title = kTitleOfJSONRequest;
    
    [self.btnSendRequest beautifulButton:nil];
    
    self.mArrCell = [[NSMutableArray alloc] initWithCapacity:0];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGRect fram = CGRectMake(5.0, 64, rect.size.width - 10.0, rect.size.height - 164.0);
    self.tableView = [[UITableView alloc] initWithFrame:fram style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // 设置边距，解决单元格分割线默认偏移像素过多的问题
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        // 设置单元格（上左下右）内边距
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        // 设置单元格（上左下右）外边距
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    [self.view addSubview:self.tableView];
    
    // 注册可复用的单元格
    UINib *nib = [UINib nibWithNibName:@"KMTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    
    // 空数据时，显示的内容
    self.lblEmptyDataMsg = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    
    CGPoint newPoint = self.lblEmptyDataMsg.center;
    newPoint.y -= 45;
    self.lblEmptyDataMsg.center = newPoint;
    
    self.lblEmptyDataMsg.text = @"点击「发送请求」按钮获取全球新闻信息";
    self.lblEmptyDataMsg.textColor = [UIColor grayColor];
    self.lblEmptyDataMsg.textAlignment = NSTextAlignmentCenter;
    self.lblEmptyDataMsg.font = [UIFont systemFontOfSize:16];
    
    [self.view addSubview:self.lblEmptyDataMsg];
    
    // 点击单元格时，显示的新闻信息详细内容
    fram = CGRectMake(10, CGRectGetMidY(rect) - 200, rect.size.width - 20, 400);
    self.webView = [[UIWebView alloc] initWithFrame:fram];
    self.webView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.webView.layer.borderWidth = 1.0;
    
    self.webView.delegate = self;
    self.webView.hidden = YES;
    
    [self.view addSubview:self.webView];
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
}


- (NSString *)displayTimeFromCreatedAt:(NSString *)createdAt {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-DD' T 'HH:mm:ss"];
    
    NSDate *date = [dateFormatter dateFromString:createdAt];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interVal = [timeZone secondsFromGMTForDate:date];
    
    date = [date dateByAddingTimeInterval:interVal];
    [dateFormatter setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
    NSString *displayTime = [dateFormatter stringFromDate:date];
    
    return displayTime;
}


- (void)loadData:(NSArray *)arrData {
    self.mArrCell = [[NSMutableArray alloc] init];
    
    [arrData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        NSMutableDictionary *mDicCell = [[NSMutableDictionary alloc] init];
        
        NSDictionary *dicRoot = (NSDictionary *)obj;
        
        NSArray *arrLink = [dicRoot valueForKey:@"entities.links"];
        
        [mDicCell setValue:[NSString stringWithFormat:@"%@?w=80&h=80",
                            [dicRoot valueForKeyPath:@"user.avatar_image.url"]]
                    forKey:kAvatarImageStr];
        
        [mDicCell setValue:[dicRoot valueForKeyPath:@"user.name"]
                     forKey:kName];
        
        [mDicCell setValue:[dicRoot valueForKeyPath:@"text"]
                     forKey:kText];
        
        [mDicCell setValue:arrLink.count > 0 ? [arrLink[0] valueForKey:@"url"] : @""
                    forKey:kLink];
        
        [mDicCell setValue:[self displayTimeFromCreatedAt:[dicRoot valueForKey:@"created_at"]]
                    forKey:kCreatedAt];
        
        [self.mArrCell addObject:mDicCell];
        
    }];
    
    [self.tableView reloadData];
}


- (IBAction)sendRequest:(id)sender {
    self.lblEmptyDataMsg.text = @"加载中~~~~~";
    self.webView.hidden = YES;
    
    // 这里因为使用了AFNetwoking 3.0 不再支持AFHTTPRequestOperation和AFHTTPRequestOperationManager, 两种方法都不能使用,也是需要重写的部分
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    [manager GET:kJSONRequestURLStr parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
            NSLog(@"Progress %@", downloadProgress);
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"JSON %@", responseObject);
            
            NSDictionary *dic = (NSDictionary *)responseObject;
            [self loadData:(NSArray *)dic[@"data"]];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"Error %@", error);
            
        }];
    
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.webView.hidden = YES;
}



#pragma mark - TableView

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"全球新闻信息列表(what?)";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = self.mArrCell.count;
    self.lblEmptyDataMsg.hidden = count > 0;
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KMTableViewCell *cell = [[KMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:cellIdentifier];
    
    NSMutableDictionary *mDicCell = self.mArrCell[indexPath.row];
    cell.avatarImageStr = mDicCell[kAvatarImageStr];
    cell.name = mDicCell[kName];
    cell.text = mDicCell[kText];
    cell.createdAt = mDicCell[kCreatedAt];
    cell.haveLink = [mDicCell[kLink] length] > 0;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *mDicCell = self.mArrCell[indexPath.row];
    NSString *link = mDicCell[kLink];
    
    if (link.length > 0) {
        // 使用浏览器打开网址
        // [link openByBrowser];
        
        
        // 使用 WebView 打开网址；由于这里很多网址是外国的，存在有的访问不了、有的访问慢导致加载超时的情况
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:link]];
        [self.webView loadRequest:request];
        
        self.webView.hidden = NO;
        
    }
}

#pragma mark - WebView

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    kApplication.networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    kApplication.networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error %@", error);
    
    webView.hidden = YES;
    kApplication.networkActivityIndicatorVisible = NO;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示错误" message:@"网络连接错误" preferredStyle:0];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    
    [self.view addSubview:alert.view];
    
    
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
