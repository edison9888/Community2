//
//  CreateGuildTableViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-3-4.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@protocol FirstViewControllerDelegate <NSObject>

- (void)firstViewControllerDidCancel:(ViewController *)controller;

@end

@interface CreateGuildTableViewController : UITableViewController

@property (nonatomic, weak) id <FirstViewControllerDelegate> delegate;

- (IBAction)cancelView:(id)sender;

@end
