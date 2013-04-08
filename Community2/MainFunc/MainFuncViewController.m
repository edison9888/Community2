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
    
    self.navigationController.title = @"DarkBlood公会";
        
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
            [self.view bringSubviewToFront:self.chatView];
            break;
        case 1:
            [self.view bringSubviewToFront:self.postsView];
            break;
        case 2:
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
    [super viewDidUnload];
}

@end
