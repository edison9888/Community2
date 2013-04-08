//
//  MainFuncViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-3-14.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainFuncChatView.h"
#import "MainFuncPostsView.h"
#import "MainFuncAnnouncementView.h"


@interface MainFuncViewController : UIViewController
{

}
@property (strong, nonatomic) IBOutlet UISegmentedControl *mainFuncSegmentControl;
@property (strong, nonatomic) IBOutlet MainFuncChatView *chatView;
@property (strong, nonatomic) IBOutlet MainFuncPostsView *postsView;
@property (strong, nonatomic) IBOutlet MainFuncAnnouncementView *announcementView;

@end
