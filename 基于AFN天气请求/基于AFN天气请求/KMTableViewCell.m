//
//  KMTableViewCell.m
//  基于AFN天气请求
//
//  Created by 康梁 on 15/12/21.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KMTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "SDImageCache.h"

static UIImage *placeholderImage;
static CGFloat widthOfLabel;

@implementation KMTableViewCell

- (void)awakeFromNib {
    // Initialization code
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        placeholderImage = [UIImage imageNamed:@"JSON"];
        widthOfLabel = [UIScreen mainScreen].bounds.size.width - 100;
    });
    
    self.imgVAvatarImage.layer.masksToBounds = YES;
    self.imgVAvatarImage.layer.borderWidth = 10.0;
    
    self.lbleText = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 23.0, widthOfLabel, 42.0)];
    self.lbleText.numberOfLines = 2;
    self.lbleText.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.lbleText];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)setAvatarImageStr:(NSString *)avatarImageStr {
    if (![self.avatarImageStr isEqualToString:avatarImageStr]) {
        _avatarImageStr = [avatarImageStr copy];
        
        NSURL *avatarImageURL = [NSURL URLWithString:self.avatarImageStr];
        // NSData *avatarImageData = [NSData dataWithContentsOfURL:avatarImageURL];
        // self.imgVAvatarImage.image = [UIImage imageWithData:avatarImageData scale:2];
        
        // 优化缓存考虑，使用第二种
        // 方法 1 - 使用AFNetworking 框架：UIImageView+AFNetworking
        // [self.imgVAvatarImage setImageWithURL:avatarImageURL placeholderImage:placeholderImage];
        
        // 方法 2 - 使用SDWebImage 框架：UIImageView+WebCache
        [self.imgVAvatarImage sd_setImageWithURL:avatarImageURL placeholderImage:placeholderImage];
    }
}


- (void)setName:(NSString *)name {
    _name = [name copy];
    self.lblName.text = name;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    self.lbleText.text = text;
}

- (void)setCreatedAt:(NSString *)createdAt {
    _createdAt = [createdAt copy];
    self.lblCreatedAt.text = createdAt;
}

- (void)setHaveLink:(BOOL)haveLink {
    _haveLink = haveLink;
    self.imgVLink.hidden = haveLink;
}













@end
