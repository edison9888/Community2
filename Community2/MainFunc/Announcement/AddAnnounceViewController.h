//
//  AddAnnounceViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-4-16.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DrawAnnounceView.h"

@interface AddAnnounceViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITextField *titleTextField;
@property (nonatomic, strong) IBOutlet UITextView *contentTextView;
@property (nonatomic, strong) IBOutlet UITableView *settingTableView;
@property (nonatomic, strong) IBOutlet UILabel     *contentLabel;
@property (nonatomic, strong) UITableViewCell *advancedTimeCell;

@property (nonatomic, strong) DrawAnnounceView *drawAnnounceView;

@end
