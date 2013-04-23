//
//  AnnounceDetailViewController.h
//  Community2
//
//  Created by 赵 峰 on 13-4-22.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AnnounceData.h"
#import "remindTableView.h"

@protocol AnnounceDetailDelegate <NSObject>

- (void)announceDelete;
- (void)announceUpdate:(AnnounceData *)updateData;
- (void)announceFinish;

@end

@interface AnnounceDetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITableView *settingTableView;
@property (strong, nonatomic) IBOutlet UITextView  *contentTextView;
@property (strong, nonatomic) IBOutlet UIButton    *finishBtn;
@property (strong, nonatomic) IBOutlet UIButton    *deleteBtn;

@property (nonatomic, strong) UIDatePicker         *datePicker;
@property (nonatomic, strong) UIPickerView         *beforeTimePicker;
@property (nonatomic, strong) NSMutableArray       *beforeTimeSourceArray;

@property (nonatomic, strong) UITableViewCell      *advancedTimeCell;
@property (nonatomic, strong) UILabel              *dateLabel;
@property (nonatomic, strong) UILabel              *beforeTimeLabel;

@property (nonatomic, strong) NSString *annDate;
@property (nonatomic, assign) NSInteger aheadOfAlarm;
@property (nonatomic, assign) NSInteger isNeedAlarm;
@property (nonatomic, strong) NSString *guildName;
@property (nonatomic, strong) NSString *annTitle;
@property (nonatomic, strong) NSString *annContent;

@property (nonatomic, assign) BOOL isFinishDetail;

@property (nonatomic, weak) id<AnnounceDetailDelegate> delegate;
@property (nonatomic, strong) AnnounceData *detailData;

- (IBAction)clickFinishBtn:(id)sender;
- (IBAction)clickDeleteBtn:(id)sender;

- (void)selfInitWithData:(AnnounceData *)data isFinishDetail:(BOOL)isFinishDetail;


@end
