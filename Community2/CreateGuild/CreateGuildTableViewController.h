//
//  CreateGuildTableViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-3-4.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FirstViewControllerDelegate <NSObject>

- (void)firstViewControllerDidCancel:(UIViewController *)controller;

@end

@interface CreateGuildTableViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate,UIPickerViewDelegate, UIPickerViewDataSource, UIActionSheetDelegate>

@property (nonatomic, weak) id <FirstViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *guildNameTextFiled;
@property (strong, nonatomic) IBOutlet UILabel *guildGameStyleLabel;
@property (strong, nonatomic) IBOutlet UITextView *guildBriefInfoTextView;

@property (strong, nonatomic) NSString *guildName;
@property (strong, nonatomic) NSString *guildGameStyle;
@property (strong, nonatomic) NSString *guildBriefInfo;

@property (strong, nonatomic) UIPickerView *gameStylePicker;
@property (strong, nonatomic) NSArray *gameStyleSource;

- (IBAction)cancelView:(id)sender;
- (IBAction)nextView:(id)sender;
- (IBAction)switchGameStyleTouched;

@end
