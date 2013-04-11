//
//  PostDetailViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-3-26.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostDetailTableViewCell.h"
#import "PostReplyTableViewCell.h"
#import "PostDetailData.h"
#import "WEPopoverController.h"

@interface PostDetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, WEPopoverControllerDelegate, UIPopoverControllerDelegate>
{
    PostDetailData *_postDetailData;
    NSMutableArray *_repliesArray;
}

@property (nonatomic, strong) WEPopoverController *popoverController;

- (int)addNewReply:(NSString *)replayMessage;


@end
