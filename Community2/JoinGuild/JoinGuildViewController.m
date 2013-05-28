//
//  JoinGuildViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-5-10.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "JoinGuildViewController.h"

@interface JoinGuildViewController ()

@end

@implementation JoinGuildViewController

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

- (void)viewDidUnload {
    [self setAuthCodeTextField:nil];
    [super viewDidUnload];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches began ");
    if([self.authCodeTextField isFirstResponder])
    {
        [self.authCodeTextField resignFirstResponder];
    }
}
@end
