//
//  FinishTableView.m
//  Community2
//
//  Created by 赵 峰 on 13-4-15.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "FinishTableView.h"
#import "AnnounceData.h"

@implementation FinishTableView

@synthesize finishedAnnounceArray, timeSortArrayArray;

- (void)setNavigationController:(UINavigationController *)naviCtler
{
    _navigationController = naviCtler;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)secondInit
{
    
    self.finishedAnnounceArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 10; i++)
    {
        AnnounceData *oneAnnounceData = [[AnnounceData alloc] initWithData:@"12-04-15" title:@"公会散财" aheadOfAlarm:10 content:@"根据排名发工资" isNeedAlarm:1 isFinished:1 isExpired:0 guildName:@"DarkBlood"];
        
        [self.finishedAnnounceArray addObject:oneAnnounceData];
    }
    
    self.dataSource = self;
    self.delegate = self;
    
    self.backgroundView = [[UIView alloc] init];
    self.backgroundColor = [UIColor clearColor];
    
    
    //self.backgroundColor = [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
    
}

- (void)addNewData:(AnnounceData *)newData
{
    [self.finishedAnnounceArray addObject:newData];
}

-(void)dealloc
{
    finishedAnnounceArray = nil;
    timeSortArrayArray = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.finishedAnnounceArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = ((AnnounceData *)[self.finishedAnnounceArray objectAtIndex:indexPath.row]).title;
    cell.detailTextLabel.text = ((AnnounceData *)[self.finishedAnnounceArray objectAtIndex:indexPath.row]).date;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    // Set up the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    AnnounceDetailViewController *announceDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"AnnounceDetailView"];
    
    [announceDetailViewController selfInitWithData:[self.finishedAnnounceArray objectAtIndex:indexPath.row] isFinishDetail:YES];
    announceDetailViewController.delegate = self;
    _detailInteger = indexPath.row;
    
    // ...
    // Pass the selected object to the new view controller.
    [_navigationController pushViewController:announceDetailViewController animated:YES];
}

#pragma mark -
#pragma mark Table view methods
- (void)announceDelete
{
    NSLog(@"delete finished announce\n ");
    [self.finishedAnnounceArray removeObjectAtIndex:_detailInteger];
    _detailInteger = -1;
    [self reloadData];
}

- (void)announceUpdate:(AnnounceData *)updateData
{
    NSLog(@"update finished announce\n do nothing!");
}

- (void)announceFinish
{
    NSLog(@"finish finished announce\n do nothing!");
}

@end
