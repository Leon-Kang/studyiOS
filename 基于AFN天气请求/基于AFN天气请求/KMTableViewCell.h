//
//  KMTableViewCell.h
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/21.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imgVAvatarImage;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblCreatedAt;
@property (weak, nonatomic) IBOutlet UIImageView *imgVLink;

@property (strong, nonatomic) UILabel *lbleText;
@property (strong, nonatomic) NSString *avatarImageStr;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *createdAt;
@property (assign, nonatomic, getter = isHaveLink) BOOL haveLink;



@end
