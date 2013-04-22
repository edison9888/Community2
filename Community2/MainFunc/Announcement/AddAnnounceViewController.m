//
//  AddAnnounceViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-4-16.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "AddAnnounceViewController.h"
#import "AnnounceData.h"


@interface AddAnnounceViewController ()

@end

@implementation AddAnnounceViewController

@synthesize titleTextField, settingTableView, contentTextView, drawAnnounceView, advancedTimeCell, contentLabel,
            beforeTimePicker, datePicker, beforeTimeSourceArray, dateLabel, beforeTimeLabel, date, aheadOfAlarm, isNeedAlarm, guildName, announceView;

NSTimeInterval tmpAnimationDuration = 0.3;
CGRect         tmpFrame;
NSIndexPath    *tmpIndex;
int            tmpI = 3;

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

    self.contentTextView.layer.borderColor = UIColor.grayColor.CGColor;
    self.contentTextView.layer.borderWidth = 2;
    [self.contentTextView.layer setCornerRadius: 6];
    [self.contentTextView.layer setMasksToBounds:YES];
    
    self.settingTableView.showsHorizontalScrollIndicator = NO;
    self.settingTableView.scrollEnabled = NO;
    self.settingTableView.delegate = self;
    self.settingTableView.dataSource = self;
    
    self.navigationItem.title = @"添加公会";
    
    UIBarButtonItem *addAnnounceBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(clickAddAnnounce)];
    self.navigationItem.rightBarButtonItem = addAnnounceBtnItem;
    addAnnounceBtnItem = nil;
    
    UIBarButtonItem *cancelBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(clickCancelAnnounce)];
    self.navigationItem.leftBarButtonItem = cancelBtnItem;
    cancelBtnItem = nil;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    tmpFrame = self.view.frame;
    tmpFrame.origin.y -= 20;
    tmpFrame.size.height -= 44;
    
    self.beforeTimeSourceArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 10; i++) {
        
        NSString *tmpString = [NSString stringWithFormat:@"%d min  ", i * 10];
        [self.beforeTimeSourceArray addObject:tmpString];
        tmpString = nil;
    }
  
//  delete the draw line for not success
//    NSMutableDictionary *tmpDic = [[NSMutableDictionary alloc] init];
//    [tmpDic setObject:[NSNumber numberWithInt:self.settingTableView.frame.origin.x].stringValue forKey:@"bPx1"];
//    [tmpDic setObject:[NSNumber numberWithInt:self.settingTableView.frame.origin.y].stringValue forKey:@"bPy1"];
//    [tmpDic setObject:[NSNumber numberWithInt:self.settingTableView.frame.origin.x + self.settingTableView.frame.size.width].stringValue forKey:@"bPx2"];
//    [tmpDic setObject:[NSNumber numberWithInt:self.settingTableView.frame.origin.y].stringValue forKey:@"bPy2"];
//    
//    [tmpDic setObject:[NSNumber numberWithInt:self.settingTableView.frame.origin.x].stringValue forKey:@"bPx3"];
//    [tmpDic setObject:[NSNumber numberWithInt:self.settingTableView.frame.origin.y + self.settingTableView.frame.size.height].stringValue forKey:@"bPy3"];
//    
//    [tmpDic setObject:[NSNumber numberWithInt:self.settingTableView.frame.origin.x + self.settingTableView.frame.size.width].stringValue forKey:@"bPx4"];
//    [tmpDic setObject:[NSNumber numberWithInt:self.settingTableView.frame.origin.y + self.settingTableView.frame.size.height].stringValue forKey:@"bPy4"];
//    
//    self.drawAnnounceView = [[DrawAnnounceView alloc] initWithData:self.settingTableView.separatorColor tmpFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) tmpLineDic:tmpDic];
//    
//    tmpDic = nil;
//    
//    [self.view addSubview:self.drawAnnounceView];

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    self.titleTextField = nil;
    self.settingTableView = nil;
    self.contentTextView = nil;
    self.advancedTimeCell = nil;
    self.contentLabel = nil;
    self.beforeTimeSourceArray = nil;
    self.beforeTimePicker = nil;
    self.datePicker = nil;
    self.dateLabel = nil;
    self.beforeTimeLabel = nil;
    self.date = nil;
    self.guildName = nil;
    self.announceView = nil;
    
    [super viewDidUnload];
}

- (void)setAnnounceViewId:(id)tmpAnnounceView
{
    self.announceView = tmpAnnounceView;
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
    
    [UIView animateWithDuration:tmpAnimationDuration
                     animations:^{
                         
                         self.view.frame = tmpFrame;
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
    return tmpI;
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
            tmpSwitch.on = YES;
            [cell addSubview:tmpSwitch];
            [tmpSwitch addTarget:self action:@selector(switchAlarmSetting:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:tmpSwitch];
            tmpSwitch = nil;
            
        }
            break;
            
        case 1:
        {
            UILabel *tmpLabel = [[UILabel alloc] init];
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd   EEEE   a HH:mm"];
            tmpLabel.text = [dateFormatter stringFromDate:[NSDate date]];
            
//            tmpLabel.text = @"2013年04月17日 星期三 下午18:00";
            tmpLabel.frame = CGRectMake(0, 0, 280, 43);
            tmpLabel.textAlignment = UITextAlignmentCenter;
            self.dateLabel = tmpLabel;
            [cell addSubview:tmpLabel];
            tmpLabel = nil;
            dateFormatter = nil;
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
            timeLabel.text = @"10 min  ";
            timeLabel.frame = CGRectMake(140, 0, 135, 43);
            timeLabel.textAlignment = UITextAlignmentRight;
            self.beforeTimeLabel = timeLabel;
            [cell addSubview:timeLabel];
            timeLabel = nil;
            
            tmpIndex = indexPath;
            
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
- (void)clickAddAnnounce
{
    NSString *tmpDate = self.dateLabel.text;
    NSString *tmpTitle = self.titleTextField.text;
    NSInteger tmpAheadOfAlarm = self.aheadOfAlarm;
    NSString *tmpContent = self.contentTextView.text;
    NSInteger tmpIsAlarmed = self.isNeedAlarm;
    
    AnnounceData *newData = [[AnnounceData alloc] initWithData:tmpDate title:tmpTitle aheadOfAlarm:tmpAheadOfAlarm content:tmpContent isNeedAlarm:tmpIsAlarmed isFinished:0 isExpired:0 guildName:@"随便"];
    
    [self.announceView addNewAnnounce:newData];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    tmpDate = nil;
    tmpTitle = nil;
    tmpContent = nil;
}

- (void)clickCancelAnnounce
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)switchAlarmSetting:(id)sender
{
    NSLog(@"switch");
    UISwitch *tmpSwitcher = (UISwitch *)sender;
    if (!tmpSwitcher.isOn)
    {
        
        [UIView animateWithDuration:tmpAnimationDuration
                         animations:^{
                             
                             CGRect tmpRect = self.contentTextView.frame;
                             tmpRect.origin.y -= 40;
                             self.contentTextView.frame = tmpRect;
                             
                             tmpRect = self.contentLabel.frame;
                             tmpRect.origin.y -= 40;
                             self.contentLabel.frame = tmpRect;
                             
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
        
        [UIView animateWithDuration:tmpAnimationDuration
                         animations:^{
                             
                             CGRect tmpRect = self.contentTextView.frame;
                             tmpRect.origin.y += 40;
                             self.contentTextView.frame = tmpRect;
                             
                             tmpRect = self.contentLabel.frame;
                             tmpRect.origin.y += 40;
                             self.contentLabel.frame = tmpRect;
                             
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
        
        self.view.frame = CGRectMake(self.view.frame.origin.x + (endFrame.origin.x - beginFrame.origin.x),
                                     self.view.frame.origin.y + (endFrame.origin.y - beginFrame.origin.y),
                                     self.view.frame.size.width,
                                     self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
	
}


@end
