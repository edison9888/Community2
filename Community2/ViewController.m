//
//  ViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-2-28.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FirstViewControllerDelegate

- (void)firstViewControllerDidCancel:(ViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CreateGuild"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
		CreateGuildTableViewController *createGuildTableViewController = [[navigationController viewControllers] objectAtIndex:0];
		createGuildTableViewController.delegate = self;
    }
    else if([segue.identifier isEqualToString:@"FindGuild"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
		FindGuildViewController *findGuildViewController = [[navigationController viewControllers] objectAtIndex:0];
		findGuildViewController.delegate = self;
    }
    else if([segue.identifier isEqualToString:@"Login"])
    {
        LoginViewController *loginViewController = segue.destinationViewController;
		loginViewController.delegate = self;
    }
}

@end
