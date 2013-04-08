//
//  FindGuildViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-3-5.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "FindGuildViewController.h"
#import "FindGuildCell.h"

@interface FindGuildViewController ()

@end

@implementation FindGuildViewController

@synthesize delegate;
@synthesize guildTableView, searchTextField;

- (IBAction)cancelView:(id)sender
{
    [self.delegate firstViewControllerDidCancel:self];
}


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
    [self.searchTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setGuildTableView:nil];
    [self setSearchTextField:nil];
    [super viewDidUnload];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"搜索结果";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setBackgroundColor:[UIColor clearColor]];
	static NSString *tableViewIdentifier = @"FindGuildCellIdentifier";
	FindGuildCell *cell = (FindGuildCell *)[tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    
	return cell;
}

@end
