//
//  MainFuncAnnouncementView.m
//  Community2
//
//  Created by 赵 峰 on 13-3-14.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "MainFuncAnnouncementView.h"

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define NAVBAR_HEIGHT   44
#define SEGBAR_HEIGHT   44

@implementation MainFuncAnnouncementView

@synthesize remindedTableView;

- (void)setNavigationController:(UINavigationController *)naviCtler
{
    _navigationController = naviCtler;
    
    [_remindedTableView setNavigationController:_navigationController];
    [_finishedTableView setNavigationController:_navigationController];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return [self initSelf];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
    }
    return [self initSelf];
}

- (id)initSelf
{
    _announcementScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT - NAVBAR_HEIGHT - SEGBAR_HEIGHT - 20)];
    _announcementScrollView.pagingEnabled = YES;
    _announcementScrollView.contentSize = CGSizeMake(320 * 2, SCREEN_HEIGHT - NAVBAR_HEIGHT - SEGBAR_HEIGHT - 20);
    _announcementScrollView.showsHorizontalScrollIndicator = NO;
    _announcementScrollView.showsVerticalScrollIndicator = NO;
    _announcementScrollView.delegate = self;
    
    _announceStatusLable = [[UILabel alloc] init];
    _announceStatusLable.text = @"提醒";
    _announceStatusLable.textColor = [UIColor redColor];
    _announceStatusLable.font = [UIFont systemFontOfSize:26];
    _announceStatusLable.frame = CGRectMake(20, 20, 280, 38);
    
    [_announcementScrollView addSubview:_announceStatusLable];
    
    _finishLable = [[UILabel alloc] init];
    _finishLable.text = @"完成";
    _finishLable.textColor = [UIColor redColor];
    _finishLable.font = [UIFont systemFontOfSize:26];
    _finishLable.frame = CGRectMake(20 + 320, 20, 280, 38);
    
    [_announcementScrollView addSubview:_finishLable];
    
    
    _remindedTableView = [[remindTableView alloc] initWithFrame:CGRectMake(20, 66, 280, 250) style:UITableViewStyleGrouped];
    [_remindedTableView secondInit];
    _remindedTableView.secondDelegate = self;
    
    [_announcementScrollView addSubview:_remindedTableView];
    
    _finishedTableView = [[FinishTableView alloc] initWithFrame:CGRectMake(20 + 320, 66, 280, 250) style:UITableViewStyleGrouped];
    [_finishedTableView secondInit];
    
    [_announcementScrollView addSubview:_finishedTableView];
    
    [self addSubview:_announcementScrollView];
    
    _facePageControl = [[FaceBoardPageControl alloc] initWithFrame:CGRectMake(110, self.frame.size.height - 20 - 44, 100, 20)];
    [_facePageControl addTarget:self
                         action:@selector(pageChange:)
               forControlEvents:UIControlEventValueChanged];
    _facePageControl.numberOfPages = 2;
    _facePageControl.currentPage = 0;
        
    [self addSubview:_facePageControl];

    return self;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [_facePageControl setCurrentPage:_announcementScrollView.contentOffset.x / 320];
    [_facePageControl updateCurrentPageDisplay];
}

- (void)pageChange:(id)sender
{
    [_announcementScrollView setContentOffset:CGPointMake(_facePageControl.currentPage * 320, 0) animated:YES];
    [_facePageControl setCurrentPage:_facePageControl.currentPage];
}

-(void)dealloc
{
    _announcementScrollView = nil;
    _announceStatusLable = nil;
    _finishedTableView = nil;
    _remindedTableView = nil;
    _finishLable = nil;
    _facePageControl = nil;
    _navigationController = nil;

}

- (void)addNewAnnounce:(AnnounceData *)newAnnounceData
{
    [_remindedTableView addNewAnnounceData:newAnnounceData];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark -
#pragma mark AnnounceFinishDeleage
- (void)completeNewAnnounce:(AnnounceData *)data
{
    [_finishedTableView addNewData:data];
    [_finishedTableView reloadData];
}

@end
