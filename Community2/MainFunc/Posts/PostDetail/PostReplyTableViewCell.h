//
//  PostReplyTableViewCell.h
//  Community2
//
//  Created by 赵 峰 on 13-3-27.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostReplyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *postReplyHeadImgView;
@property (strong, nonatomic) IBOutlet UILabel *postReplyAuthorLabel;
@property (strong, nonatomic) IBOutlet UILabel *postReplyDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *postReplyFloorLabel;
@property (strong, nonatomic) IBOutlet UILabel *postReplyContentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *postReplyImgView;

@end
