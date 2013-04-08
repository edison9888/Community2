//
//  DetailGuildTableViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-3-13.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "DetailGuildTableViewController.h"
#import "DetialGuildTableViewCell.h"
#import "MainFuncViewController.h"

@interface DetailGuildTableViewController ()

@end

@implementation DetailGuildTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    //[self setHidesBottomBarWhenPushed:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DetailGuildTableViewCell";
    DetialGuildTableViewCell *cell = (DetialGuildTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        cell = [storyboard instantiateViewControllerWithIdentifier:@"DetailGuildTableViewCell"];
    }
    
    if (indexPath.row == 0)
    {
        switch (indexPath.section) {
            case 0:
                cell.textLabel.text = @"通知";
                cell.detailTextLabel.text = @"1";
                break;
                
            case 1:
                cell.textLabel.text = @"帖子";
                cell.detailTextLabel.text = @"1";
                break;
                
            case 2:
                cell.textLabel.text = @"消息";
                cell.detailTextLabel.text = @"1";
                break;
                
            case 3:
                cell.textLabel.text = @"公会管理";
                cell.detailTextLabel.text = @"1";
                break;
                
            default:
                break;
        }
    }
    else
    {
        cell.textLabel.text = @"*************";
        cell.detailTextLabel.alpha = 0;
    }
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    MainFuncViewController *mainFuncViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainFuncViewController"];
    [self setHidesBottomBarWhenPushed:YES];
    
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:mainFuncViewController animated:YES];
}

@end
