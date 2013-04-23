//
//  remindTableView.h
//  Community2
//
//  Created by 赵 峰 on 13-4-15.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnounceData.h"
#import "AnnounceDetailViewController.h"

@protocol AnnounceDetailDelegate <NSObject>

- (void)announceDelete;
- (void)announceUpdate:(AnnounceData *)updateData;
- (void)announceFinish;

@end

@protocol AnnounceFinishDeleage <NSObject>

- (void)completeNewAnnounce:(AnnounceData *)data;

@end

@interface remindTableView : UITableView <UITableViewDelegate, UITableViewDataSource, AnnounceDetailDelegate>
{
    NSMutableArray *_remindTitleArray;
    NSMutableArray *_remindTimeArray;
    NSMutableArray *_isAlarmArray;
    
    IBOutlet UITableViewCell *_remindTableCell;
    UINavigationController *_navigationController;
    
    NSInteger _detailInteger;
}

@property (nonatomic, strong) NSMutableArray *neededAnnounceArray;
@property (nonatomic, weak) id<AnnounceFinishDeleage> secondDelegate;

- (void)secondInit;

- (void)addNewAnnounceData:(AnnounceData *)newAnnounceData;

- (void)setNavigationController:(UINavigationController *)naviCtler;

@end
