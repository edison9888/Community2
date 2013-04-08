//
//  FindGuildViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-3-5.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateGuildTableViewController.h"

@interface FindGuildViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id <FirstViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITableView *guildTableView;
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;

- (IBAction)cancelView:(id)sender;

@end
