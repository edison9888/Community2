//
//  PostDetailTableViewCell.h
//  Community2
//
//  Created by 赵 峰 on 13-3-27.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostDetailTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *postDetailTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *postDetailHeadImgView;
@property (strong, nonatomic) IBOutlet UILabel *postDetailAuthorLabel;
@property (strong, nonatomic) IBOutlet UILabel *postDetailDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *postDetailFloorLabel;
@property (strong, nonatomic) IBOutlet UILabel *postDetailContentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *postDetailImgView;

@end
