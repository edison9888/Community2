//
//  GuildsMainViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-3-11.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "GuildsMainViewController.h"
#import "LastGuildListCell.h"
#import "DetailGuildTableViewController.h"

@interface GuildsMainViewController ()

@end

@implementation GuildsMainViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    else if (section == 1)
    {
        return 3;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"最新";
    }
    else if(section == 1)
    {
        return @"全部";
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setBackgroundColor:[UIColor clearColor]];
	static NSString *tableViewIdentifier = @"LastGuildCellIdentifier";
	LastGuildListCell *cell = (LastGuildListCell *)[tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    if (cell == nil)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        cell = [storyboard instantiateViewControllerWithIdentifier:@"LastGuildCellIdentifier"];
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: tableViewIdentifier];
    }
    
    if (indexPath.section == 0)
    {
        cell.guildImgView.image = [UIImage imageNamed:@"guildImg.jpg"];
        
    }
    else if (indexPath.section == 1)
    {
        cell.guildImgView.image = [UIImage imageNamed:@"guildImg2.jpg"];
    }
        

    
    //    cell.textOne.textColor  = [titleColor objectAtIndex:indexPath.row];
    //	cell.textOne.text       = [user objectAtIndex:indexPath.row];
    //    cell.textTwo.text       = [message objectAtIndex:indexPath.row];
    //    cell.timeLabel.text     = [msgTime objectAtIndex:indexPath.row];
    //
    //    NSLog(@"tableview numberofRowsInsection: set cell");
    //    //config chat message label
    //    UILabel *label      = cell.textTwo;
    //    label.lineBreakMode = UILineBreakModeWordWrap;
    //    label.numberOfLines = 0;
    //    //    CGRect labelFrame   = label.frame;
    //    //    label.frame         = labelFrame;
    //    CGRect cellFrame    = cell.frame;
    //    [label sizeToFit];
    //    if(label.frame.size.height + 30 > cellFrame.size.height)
    //    {
    //        NSLog(@"tableview numberofRowsInsection: set cell——2");
    //        cellFrame.size.height = label.frame.size.height + 30;
    //        cell.frame = cellFrame;
    //        cell.cellMid.frame = CGRectMake(0, 10, 320, cellFrame.size.height-20);
    //        cell.cellButtom.frame = CGRectMake(0, cellFrame.size.height-10, 320, 10);
    //    }
    //    else
    //    {
    //        //        //
    //        //        cell.cellMid.frame = CGRectMake(0, 10, 320, cellFrame.size.height-20);
    //        //        cell.cellButtom.frame = CGRectMake(0, cellFrame.size.height-10, 320, 10);
    //    }
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    DetailGuildTableViewController *detailGuildTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"DetailGuildTableView"];

     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailGuildTableViewController animated:YES];
    

}

//-(void)presentTimelineViewController:(BOOL)animated
//{
//    UIStoryboard*storyboard = [UIStoryboardstoryboardWithName:@"MainStoryboard"bundle:nil];
//    TopicTableViewController*topicViewController = [storyboardinstantiateViewControllerWithIdentifier:@"TopicTableViewController"];
//    。。。
//    
//    [self.navigationControllerpushViewController:topicViewControlleranimated:animated];
//}

- (void)viewDidUnload {
    [self setGuildsMainTableView:nil];
    [super viewDidUnload];
}
@end