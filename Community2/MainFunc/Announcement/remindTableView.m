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
    
    self.dataSource = self;
    self.delegate = self;
    
    self.backgroundView = [[UIView alloc] init];
    self.backgroundColor = [UIColor clearColor];
    
    
    //self.backgroundColor = [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];

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
    return 10;
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
    
    titleLabel.text = [_remindTitleArray objectAtIndex:indexPath.row];
    
    UILabel *timeLabel = (UILabel *)[cell viewWithTag:REMIND_CELL_TIME_TAG];
    timeLabel.text = [_remindTimeArray objectAtIndex:indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    

    
    // Set up the cell...

    return cell;
}

@end
