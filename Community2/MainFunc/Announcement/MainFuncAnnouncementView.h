//
//  MainFuncAnnouncementView.h
//  Community2
//
//  Created by 赵 峰 on 13-3-14.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "remindTableView.h"
#import "FaceBoardPageControl.h"
#import "FinishTableView.h"
#import "AnnounceData.h"

@interface MainFuncAnnouncementView : UIView<UIScrollViewDelegate, AnnounceFinishDeleage>
{
    UIScrollView         *_announcementScrollView;
    UILabel              *_announceStatusLable;     //finished, reminded
    UILabel              *_finishLable;
    remindTableView      *_remindedTableView;
    FinishTableView      *_finishedTableView;
    FaceBoardPageControl *_facePageControl;
    
    UINavigationController *_navigationController;
}

@property (nonatomic, strong) remindTableView *remindedTableView;

- (void)addNewAnnounce:(AnnounceData *)newAnnounceData;

- (void)setNavigationController:(UINavigationController *)naviCtler;

@end
