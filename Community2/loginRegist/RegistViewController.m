//
//  RegistViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-5-10.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches began ");
    if([self.emailTextField isFirstResponder])
    {
        [self.emailTextField resignFirstResponder];
    }
    if([self.passwordTextField isFirstResponder])
    {
        [self.passwordTextField resignFirstResponder];
    }
    if([self.confirmPWTextField isFirstResponder])
    {
        [self.confirmPWTextField resignFirstResponder];
    }
    if([self.nickNameTextField isFirstResponder])
    {
        [self.nickNameTextField resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setEmailTextField:nil];
    [self setPasswordTextField:nil];
    [self setConfirmPWTextField:nil];
    [self setNickNameTextField:nil];
    [super viewDidUnload];
}
@end
