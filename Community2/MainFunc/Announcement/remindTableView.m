//
//  remindTableView.m
//  Community2
//
//  Created by 赵 峰 on 13-4-15.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "remindTableView.h"

#define REMIND_CELL_TITLE_TAG 101   
#define REMIND_CELL_TIME_TAG  102
#define REMIND_CELL_IMG_TAG   103

@implementation remindTableView

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

    _remindTitleArray = [[NSMutableArray alloc] initWithCapacity:0];
    _remindTimeArray = [[NSMutableArray alloc] initWithCapacity:0];
    _isAlarmArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 10; i++)
    {
        [_remindTitleArray addObject:[NSString stringWithFormat:@"公会战-%d", i+1]];
        [_remindTimeArray addObject:[NSString stringWithFormat:@"12-1-10 下午%d:00", i+1]];

    }
    
    self.neededAnnounceArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 10; i++)
    {
        AnnounceData *oneAnnounceData = [[AnnounceData alloc] initWithData:[NSString stringWithFormat:@"12-1-10 下午%d:00", i+1]
                                                                     title:[NSString stringWithFormat:@"公会战-%d", i+1]
                                                              aheadOfAlarm:10
                                                                   content:@"根据排名发工资"
                                                               isNeedAlarm:1
                                                                isFinished:1
                                                                 isExpired:0
                                                                 guildName:@"DarkBlood"];
        
        [self.neededAnnounceArray addObject:oneAnnounceData];
    }
    
    self.dataSource = self;
    self.delegate = self;
    
    self.backgroundView = [[UIView alloc] init];
    self.backgroundColor = [UIColor clearColor];

    //self.backgroundColor = [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];

}

- (void)addNewAnnounceData:(AnnounceData *)newAnnounceData
{
    [_remindTitleArray addObject:newAnnounceData.title];
    [_remindTimeArray addObject:newAnnounceData.date];
    [self.neededAnnounceArray addObject:newAnnounceData];
    [self reloadData];
}

-(void)dealloc
{
    _navigationController = nil;
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
    return [self.neededAnnounceArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"remindCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        [[NSBundle mainBundle] loadNibNamed:@"remindCell" owner:self options:nil];
        cell = _remindTableCell;
    }
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:REMIND_CELL_TITLE_TAG];
    
//    titleLabel.text = [_remindTitleArray objectAtIndex:indexPath.row];
    titleLabel.text = ((AnnounceData *)[self.neededAnnounceArray objectAtIndex:indexPath.row]).title;
    
    UILabel *timeLabel = (UILabel *)[cell viewWithTag:REMIND_CELL_TIME_TAG];
//    timeLabel.text = [_remindTimeArray objectAtIndex:indexPath.row];
    timeLabel.text = ((AnnounceData *)[self.neededAnnounceArray objectAtIndex:indexPath.row]).date;
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // Set up the cell...

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    AnnounceDetailViewController *announceDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"AnnounceDetailView"];
    [announceDetailViewController selfInitWithData:[self.neededAnnounceArray objectAtIndex:indexPath.row] isFinishDetail:NO];
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
    [self.neededAnnounceArray removeObjectAtIndex:_detailInteger];
    _detailInteger = -1;
    [self reloadData];
}

- (void)announceUpdate:(AnnounceData *)updateData
{
    [self reloadData];
}

- (void)announceFinish
{
    AnnounceData *tmpData = [self.neededAnnounceArray objectAtIndex:_detailInteger];
    [self.neededAnnounceArray removeObjectAtIndex:_detailInteger];
    [self.secondDelegate completeNewAnnounce:tmpData];
    
    _detailInteger = -1;
    [self reloadData];
}

@end
