//
//  ViewController.m
//  iOS9新特性-搜索
//
//  Created by 康梁 on 15/12/18.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"
#import "Friend.h"
#import <CoreSpotlight/CoreSpotlight.h>

#define ScreenWidht [UIScreen mainScreen].bounds.size.width
#define ScreenHeighr [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // m
    self.dataArray = [self tableDataSource];
    // v
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, ScreenWidht, ScreenHeighr - 20)];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    [self saveFriend];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)tableDataSource {
    int i = 0;
    NSArray *nameArray = @[@"1", @"2", @"3", @"4"];
    NSMutableArray *friendArray = [[NSMutableArray alloc] init];
    for (NSString *item in nameArray) {
        Friend *mfriend = [[Friend alloc] init];
        mfriend.name = item;
        mfriend.image = [UIImage imageNamed:[NSString stringWithFormat:@"index%d.jpg", i++]];
        mfriend.webUrl = @"www.666.com";
        mfriend.f_id = [NSString stringWithFormat:@"%d", i];
        
        [friendArray addObject:mfriend];
    }
    
    return friendArray = nil ? nil : friendArray;
}

- (void)saveFriend {
    // 1
    NSMutableArray <CSSearchableItem *> *searchableItem = [NSMutableArray array];
    // 2
    for (Friend *item in self.dataArray) {
        CSSearchableItemAttributeSet *attribute = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"image"];
        attribute.title = item.name;
        attribute.contentDescription = item.webUrl;
        attribute.thumbnailData = UIImageJPEGRepresentation(item.image, 0);
        CSSearchableItem *sItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:item.f_id domainIdentifier:@"小黄" attributeSet:attribute];
        [searchableItem addObject:sItem];
    }
    // 3
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchableItem completionHandler:^(NSError *error){
        if (error != nil) {
            NSLog(@"%@", error);
        }
        
    }];
}

- (void)loadImage:(NSString *)f_id {
    Friend *someFriend = nil;
    for (Friend *item in self.dataArray) {
        if ([item.f_id isEqualToString:f_id]) {
            someFriend = item;
            break;
        }
    }
    if (someFriend) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 300, 50, 50)];
        imageView.image = someFriend.image;
        [self.view addSubview:imageView];
    }
}

#pragma mark  ----tabview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"大黄";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    Friend *friendCell = [self.dataArray objectAtIndex:indexPath.row];
    cell.imageView.image = friendCell.image;
    cell.textLabel.text = friendCell.name;
    cell.detailTextLabel.text = friendCell.webUrl;
    return cell;
}



@end
