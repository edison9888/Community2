//
//  PostsListTableViewCell.h
//  Community2
//
//  Created by 赵 峰 on 13-3-25.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostsListTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *postListTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *postListInfoBriefLabel;
@property (strong, nonatomic) IBOutlet UILabel *postListAuth;
@property (strong, nonatomic) IBOutlet UIImageView *likeImgView;
@property (strong, nonatomic) IBOutlet UIImageView *replyImgView;
@property (strong, nonatomic) IBOutlet UILabel *likeNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *replayNumLabel;


@end
