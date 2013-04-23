//
//  FinishTableView.h
//  Community2
//
//  Created by 赵 峰 on 13-4-15.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnounceDetailViewController.h"

@interface FinishTableView : UITableView<UITableViewDelegate, UITableViewDataSource, AnnounceDetailDelegate>
{
    UINavigationController *_navigationController;
    NSInteger _detailInteger;
}

@property (nonatomic, strong) NSMutableArray *finishedAnnounceArray;
@property (nonatomic, strong) NSMutableArray *timeSortArrayArray;

- (void)secondInit;
- (void)setNavigationController:(UINavigationController *)naviCtler;
- (void)addNewData:(AnnounceData *)newData;

@end
