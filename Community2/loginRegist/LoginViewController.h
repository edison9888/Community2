//
//  LoginViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-3-11.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateGuildTableViewController.h"

@interface LoginViewController : UIViewController

@property (nonatomic, weak) id <FirstViewControllerDelegate> delegate;

- (IBAction)cancelView:(id)sender;

@end
