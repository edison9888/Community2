//
//  AnnounceDetailViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-4-22.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "AnnounceDetailViewController.h"

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define NAVBAR_HEIGHT   44
#define SEGBAR_HEIGHT   44

@interface AnnounceDetailViewController ()

@end

@implementation AnnounceDetailViewController

@synthesize contentTextView, finishBtn, deleteBtn, settingTableView, beforeTimeSourceArray, datePicker, beforeTimePicker, advancedTimeCell, dateLabel, beforeTimeLabel, annDate, aheadOfAlarm, isNeedAlarm, titleTextField, annContent, annTitle, detailData;

NSTimeInterval tmpAnimationDuration2 = 0.3;
CGRect         tmpFrame2;
NSIndexPath    *tmpIndex2;
int            tmpI2 = 3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)selfInitWithData:(AnnounceData *)data
{
    self.detailData = data;
    self.annDate = data.date;
    self.annTitle = data.title;
    self.annContent = data.content;
    
    self.aheadOfAlarm = data.aheadOfAlarm;
    self.isNeedAlarm = data.isNeedAlarm;
    self.guildName = data.guildName;
    
    if (!self.isNeedAlarm)
    {
        tmpI2 = 2;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.contentTextView.layer.borderColor = UIColor.grayColor.CGColor;
    self.contentTextView.layer.borderWidth = 2;
    [self.contentTextView.layer setCornerRadius: 6];
    [self.contentTextView.layer setMasksToBounds:YES];
    
    self.settingTableView.showsHorizontalScrollIndicator = NO;
    self.settingTableView.scrollEnabled = NO;
    self.settingTableView.delegate = self;
    self.settingTableView.dataSource = self;
    
    self.navigationItem.title = @"详细通知";
    
    tmpFrame2 = self.view.frame;
    tmpFrame2.origin.y -= 20;
    tmpFrame2.size.height -= 44;
    
    self.beforeTimeSourceArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 10; i++) {
        
        NSString *tmpString = [NSString stringWithFormat:@"%d min  ", i * 10];
        [self.beforeTimeSourceArray addObject:tmpString];
        tmpString = nil;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    self.titleTextField.text = self.annTitle;
    self.contentTextView.text = self.annContent;
    
    UIBarButtonItem *addAnnounceBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickSaveAnnounce)];
    self.navigationItem.rightBarButtonItem = addAnnounceBtnItem;
    addAnnounceBtnItem = nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {

    [self setContentTextView:nil];
    [self setFinishBtn:nil];
    [self setDeleteBtn:nil];
    [self setSettingTableView:nil];
    [self setBeforeTimeSourceArray:nil];
    [self setTitleTextField:nil];
    [self setBeforeTimePicker:nil];
    [self setDatePicker:nil];
    [self setAdvancedTimeCell:nil];
    [self setDateLabel:nil];
    [self setBeforeTimeLabel:nil];
    [self setAnnDate:nil];
    [self setGuildName:nil];
    [self setDetailData:nil];
    
    [super viewDidUnload];
}

//resign first responder when touch anywhere
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches began ");
    if ([self.titleTextField isFirstResponder])
    {
        [self.titleTextField resignFirstResponder];
    }
    else if ([self.contentTextView isFirstResponder])
    {
        [self textViewResign];
    }
}

- (void)textViewResign
{
    [self.contentTextView resignFirstResponder];
    
    [UIView animateWithDuration:tmpAnimationDuration2
                     animations:^{
                         
                         self.view.frame = tmpFrame2;
                         self.finishBtn.alpha = 1;
                         self.deleteBtn.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    
    
}

#pragma mark -
#pragma mark ActionSheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (actionSheet.tag) {
        case 51:
        {
            NSDate *selectDate = self.datePicker.date;
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd   EEEE   a HH:mm"];
            self.dateLabel.text = [dateFormatter stringFromDate:selectDate];
            dateFormatter = nil;
            
        }
            break;
            
        case 52:
        {
            NSInteger seletedNum = [self.beforeTimePicker selectedRowInComponent:0];
            self.beforeTimeLabel.text = [self.beforeTimeSourceArray objectAtIndex:seletedNum];
            self.aheadOfAlarm = seletedNum * 10;
            
            self.aheadOfAlarm = seletedNum * 10;
        }
            
        default:
        {
            
        }
            break;
    }
    
}
#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return (1);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.beforeTimeSourceArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [self.beforeTimeSourceArray objectAtIndex:row];
}

#pragma mark Table view methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.titleTextField isFirstResponder])
    {
        [tv deselectRowAtIndexPath:indexPath animated:NO];
        [self.titleTextField resignFirstResponder];
    }
    else if ([self.contentTextView isFirstResponder])
    {
        [tv deselectRowAtIndexPath:indexPath animated:NO];
        [self textViewResign];
    }
    else
    {
        switch (indexPath.row)
        {
            case 0:
                break;
            case 1:
            {
                NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n";
                UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"完成", nil];
                actionSheet.tag = 51;
                [actionSheet showInView:self.view.window];
                
                NSDate *curDate = [NSDate date];
                self.datePicker = [[UIDatePicker alloc] init];
                datePicker.datePickerMode = UIDatePickerModeDateAndTime;
                NSDate *maxDate = [[NSDate alloc] initWithTimeIntervalSinceNow:10 * 365 * 24 * 60 * 60];
                
                datePicker.minimumDate = curDate;
                datePicker.maximumDate = maxDate;
                [datePicker setDate:curDate animated:YES];
                self.datePicker.tag = 101;
                
                [actionSheet addSubview:self.datePicker];
                actionSheet = nil;
                
            }
                break;
                
            case 2:
            {
                NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n";
                UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"完成", nil];
                actionSheet.tag = 52;
                [actionSheet showInView:self.view.window];
                
                self.beforeTimePicker = [[UIPickerView alloc] init];
                self.beforeTimePicker.delegate = self;
                self.beforeTimePicker.dataSource = self;
                self.beforeTimePicker.showsSelectionIndicator = YES;
                self.beforeTimePicker.tag = 102;
                [self.beforeTimePicker selectRow:1 inComponent:0 animated:NO];
                
                [actionSheet addSubview:self.beforeTimePicker];
                actionSheet = nil;
            }
                break;
            default:
                break;
                
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tmpI2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.row) {
        case 0:
        {
            UILabel *tmpLabel = [[UILabel alloc] init];
            tmpLabel.text = @"时间提醒";
            tmpLabel.frame = CGRectMake(0, 0, 127, 43);
            tmpLabel.font = [UIFont systemFontOfSize:20];
            [cell addSubview:tmpLabel];
            tmpLabel = nil;
            
            UISwitch *tmpSwitch = [[UISwitch alloc] init];
            tmpSwitch.frame = CGRectMake(203, 8, 79, 27);
            tmpSwitch.on = self.isNeedAlarm;
            [cell addSubview:tmpSwitch];
            [tmpSwitch addTarget:self action:@selector(switchAlarmSetting:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:tmpSwitch];
            tmpSwitch = nil;
            
        }
            break;
            
        case 1:
        {
            UILabel *tmpLabel = [[UILabel alloc] init];
            
//            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateFormat:@"yyyy-MM-dd   EEEE   a HH:mm"];
//            tmpLabel.text = [dateFormatter stringFromDate:[NSDate date]];
            tmpLabel.text = self.annDate;
            
            //            tmpLabel.text = @"2013年04月17日 星期三 下午18:00";
            tmpLabel.frame = CGRectMake(0, 0, 280, 43);
            tmpLabel.textAlignment = UITextAlignmentCenter;
            self.dateLabel = tmpLabel;
            [cell addSubview:tmpLabel];
            tmpLabel = nil;
//            dateFormatter = nil;
        }
            break;
            
        case 2:
        {
            UILabel *tmpLabel = [[UILabel alloc] init];
            tmpLabel.text = @"提前时间";
            tmpLabel.frame = CGRectMake(12, 0, 140, 43);
            [cell addSubview:tmpLabel];
            tmpLabel = nil;
            
            UILabel *timeLabel = [[UILabel alloc] init];
//            timeLabel.text = @"10 min  ";
            timeLabel.text = [NSString stringWithFormat:@"%d min  ", self.aheadOfAlarm];
            timeLabel.frame = CGRectMake(140, 0, 135, 43);
            timeLabel.textAlignment = UITextAlignmentRight;
            self.beforeTimeLabel = timeLabel;
            [cell addSubview:timeLabel];
            timeLabel = nil;
            
            tmpIndex2 = indexPath;
            
            self.advancedTimeCell = cell;
        }
            break;
            
        default:
            break;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark Button event
- (IBAction)clickFinishBtn:(id)sender {
 
    NSLog(@"save");
    [self.delegate announceFinish];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickDeleteBtn:(id)sender {
    
    NSLog(@"delete");
    [self.delegate announceDelete];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickSaveAnnounce
{
    self.detailData.date = self.dateLabel.text;
    self.detailData.title = self.titleTextField.text;
    self.detailData.content = self.contentTextView.text;
    self.detailData.isNeedAlarm = self.isNeedAlarm;
    self.detailData.aheadOfAlarm = self.aheadOfAlarm;
    
    NSLog(@"save");
    [self.delegate announceUpdate:self.detailData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)switchAlarmSetting:(id)sender
{
    NSLog(@"switch");
    UISwitch *tmpSwitcher = (UISwitch *)sender;
    if (!tmpSwitcher.isOn)
    {
        
        [UIView animateWithDuration:tmpAnimationDuration2
                         animations:^{
                           
                             self.advancedTimeCell.alpha = 0;                           
                             
                         }
                         completion:^(BOOL finished) {
                             
                         }];
        self.isNeedAlarm = 0;
    }
    else
    {
        //        tmpI = 3;
        //        [self.settingTableView reloadData];
        
        [UIView animateWithDuration:tmpAnimationDuration2
                         animations:^{
                             
                             self.advancedTimeCell.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             
                         }];
        self.isNeedAlarm = 1;
    }
    
}

#pragma mark -
#pragma mark UIWindow Keyboard Notifications

- (void)keyboardWillShow:(NSNotification *)notification
{
    
    if ([self.contentTextView isFirstResponder])
    {
        
        CGRect beginFrame = [[[notification userInfo] valueForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        CGRect endFrame = [[[notification userInfo] valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
        NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        
        [UIView beginAnimations:@"RS_showKeyboardAnimation" context:nil];
        [UIView setAnimationCurve:animationCurve];
        [UIView setAnimationDuration:animationDuration];
        
        int detaY = endFrame.origin.y - beginFrame.origin.y;
        if (SCREEN_HEIGHT == 480)
        {
            if (abs(detaY) < 200)
            {
                detaY = 0;
            }
            else
            {
                detaY += 40;
            }
            
        }
        else
        {
            if (abs(detaY) < 200)
            {
                detaY = 0;
            }
        }
        
            
        
        self.view.frame = CGRectMake(self.view.frame.origin.x + (endFrame.origin.x - beginFrame.origin.x),
                                     self.view.frame.origin.y + detaY,
                                     self.view.frame.size.width,
                                     self.view.frame.size.height);
        
        [UIView commitAnimations];
        self.finishBtn.alpha = 0;
        self.deleteBtn.alpha = 0;
    }
	
}
@end
