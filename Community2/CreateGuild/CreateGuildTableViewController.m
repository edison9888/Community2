//
//  CreateGuildTableViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-3-4.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "CreateGuildTableViewController.h"

@interface CreateGuildTableViewController ()

@end

@implementation CreateGuildTableViewController

@synthesize delegate;
@synthesize guildBriefInfoTextView, guildGameStyleLabel, guildNameTextFiled;
@synthesize guildBriefInfo, guildGameStyle, guildName;
@synthesize gameStylePicker, gameStyleSource;

- (IBAction)cancelView:(id)sender
{
    [self.delegate firstViewControllerDidCancel:self];
}

#pragma mark ActionSheet Delegate Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (actionSheet.tag) {
        case 51:
        {
            UIPickerView *selectedPicker = (UIPickerView *)[actionSheet viewWithTag:101];
            
            int selectedLaunchNum = [selectedPicker selectedRowInComponent:0];
            
            self.guildGameStyleLabel.text = [self.gameStyleSource objectAtIndex:selectedLaunchNum];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return (1);
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.gameStyleSource count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [self.gameStyleSource objectAtIndex:row];
}

- (IBAction)switchGameStyleTouched {
    
    NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n";
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"确定", nil];
    actionSheet.tag = 51;
    [actionSheet showInView:self.view.window];
    self.gameStylePicker =[[UIPickerView alloc] init];
    self.gameStylePicker.delegate = self;
    self.gameStylePicker.dataSource = self;
    self.gameStylePicker.showsSelectionIndicator = YES;
    
    self.gameStylePicker.tag = 101;
    
    [actionSheet addSubview:self.gameStylePicker];
    actionSheet = nil;
    
}


- (IBAction)nextView:(id)sender
{
    NSLog(@"ok!");
}


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
    
    self.gameStyleSource = [[NSArray alloc] initWithObjects:@"MMO", @"RPG", @"ARPG", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}
//
///*
//// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//*/
//
///*
//// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }   
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
//}
//*/
//
///*
//// Override to support rearranging the table view.
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
//{
//}
//*/
//
///*
//// Override to support conditional rearranging of the table view.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the item to be re-orderable.
//    return YES;
//}
//*/
//
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
    
    if([self.guildNameTextFiled isFirstResponder])
    {
        [self.guildNameTextFiled resignFirstResponder];
    }
    if([self.guildBriefInfoTextView isFirstResponder])
    {
        [self.guildBriefInfoTextView resignFirstResponder];
    }
}

- (void)viewDidUnload {
    [self setGuildNameTextFiled:nil];
    [self setGuildGameStyleLabel:nil];
    [self setGuildBriefInfoTextView:nil];
    [self setGuildName:nil];
    [self setGuildBriefInfo:nil];
    [self setGuildGameStyle:nil];
    [self setGameStylePicker:nil];
    [self setGameStyleSource:nil];
    [super viewDidUnload];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches began ");
    if([self.guildNameTextFiled isFirstResponder])
    {
        [self.guildNameTextFiled resignFirstResponder];
    }
    if([self.guildBriefInfoTextView isFirstResponder])
    {
        [self.guildBriefInfoTextView resignFirstResponder];
    }

}

#pragma mark -
#pragma mark TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark -
#pragma mark TextView delegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
}



@end
