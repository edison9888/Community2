//
//  MainFuncViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-3-14.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "MainFuncViewController.h"


@interface MainFuncViewController ()

@end

@implementation MainFuncViewController

@synthesize mainFuncSegmentControl, chatView, postsView, announcementView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.mainFuncSegmentControl setTitle:@"消息" forSegmentAtIndex:0];
    [self.mainFuncSegmentControl setTitle:@"贴吧" forSegmentAtIndex:1];
    [self.mainFuncSegmentControl setTitle:@"公告" forSegmentAtIndex:2];
    self.mainFuncSegmentControl.selectedSegmentIndex = 0;
    
    [self.mainFuncSegmentControl addTarget:self action:@selector(controlSegmentPress:) forControlEvents:UIControlEventValueChanged];
    
    [self.postsView setNavigationController:self.navigationController];
    
    self.navigationItem.title = @"DarkBlood";
    
    if (_menu == nil)
    {
        CGRect frame = CGRectMake(0, 0, 200, self.navigationController.navigationBar.bounds.size.height);
        _menu = [[SINavigationMenuView alloc] initWithFrame:frame title:@"DarkBlood"];
        [_menu displayMenuInView:self.view];
        _menu.items = @[@"精华", @"置顶", @"吐槽", @"全部"];
        _menu.delegate = self;
 
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self setHidesBottomBarWhenPushed:NO];
}

- (void)controlSegmentPress:(id)sender
{
    int selectedIndex = [self.mainFuncSegmentControl selectedSegmentIndex];
    
    switch (selectedIndex) {
        case 0:
            self.navigationItem.titleView = nil;
            self.navigationItem.title = @"DarkBlood";
            [self.view bringSubviewToFront:self.chatView];
            break;
        case 1:
            self.navigationItem.titleView = _menu;
            [self.view bringSubviewToFront:self.postsView];
            break;
        case 2:
            self.navigationItem.titleView = nil;
            self.navigationItem.title = @"DarkBlood";
            [self.view bringSubviewToFront:self.announcementView];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMainFuncSegmentControl:nil];
    [self setChatView:nil];
    [self setPostsView:nil];
    [self setAnnouncementView:nil];
    _menu = nil;
    [super viewDidUnload];
}

#pragma mark title menu delegate
- (void)didSelectItemAtIndex:(NSUInteger)index
{
    NSLog(@"did selected item at index %d", index);
}

@end
