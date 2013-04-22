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
#import "MainFuncAnnouncementView.h"

@interface AddAnnounceViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) IBOutlet UITextField *titleTextField;
@property (nonatomic, strong) IBOutlet UITextView  *contentTextView;
@property (nonatomic, strong) IBOutlet UITableView *settingTableView;
@property (nonatomic, strong) IBOutlet UILabel     *contentLabel;
@property (nonatomic, strong) UITableViewCell      *advancedTimeCell;
@property (nonatomic, strong) UILabel              *dateLabel;
@property (nonatomic, strong) UILabel              *beforeTimeLabel;

@property (nonatomic, strong) UIDatePicker         *datePicker;
@property (nonatomic, strong) UIPickerView         *beforeTimePicker;
@property (nonatomic, strong) NSMutableArray       *beforeTimeSourceArray;

@property (nonatomic, strong) NSString *date;
@property (nonatomic, assign) NSInteger aheadOfAlarm;
@property (nonatomic, assign) NSInteger isNeedAlarm;
@property (nonatomic, strong) NSString *guildName;

@property (nonatomic, strong) MainFuncAnnouncementView *announceView;

@property (nonatomic, strong) DrawAnnounceView *drawAnnounceView;

- (void)setAnnounceViewId:(id)tmpAnnounceView;

@end
