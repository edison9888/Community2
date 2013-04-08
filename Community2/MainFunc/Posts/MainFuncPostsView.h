//
//  MainFuncPostsView.h
//  Community2
//
//  Created by 赵 峰 on 13-3-14.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostsListTableViewCell.h"

@interface MainFuncPostsView : UIView <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray		*postsArray;
    IBOutlet PostsListTableViewCell *postsListCell;
    UINavigationController *_navigationController;
}

- (void)setNavigationController:(UINavigationController *)naviCtler;

@end
