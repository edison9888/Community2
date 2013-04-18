//
//  AddAnnounceViewController.m
//  Community2
//
//  Created by 赵 峰 on 13-4-16.
//  Copyright (c) 2013年 赵 峰. All rights reserved.
//

#import "AddAnnounceViewController.h"

@interface AddAnnounceViewController ()

@end

@implementation AddAnnounceViewController

@synthesize titleTextField, settingTableView, contentTextView, drawAnnounceView, advancedTimeCell, contentLabel;

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
    
    [UIView animateWithDuration:tmpAnimationDuration
                     animations:^{
                         
                         self.view.frame = tmpFrame;
                     }
                    completion:^(BOOL finished) {
                        
                    }];
    
    
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
            tmpLabel.text = @"2013年04月17日 星期三 下午18:00";
            tmpLabel.frame = CGRectMake(0, 0, 280, 43);
            tmpLabel.textAlignment = UITextAlignmentCenter;
            [cell addSubview:tmpLabel];
            tmpLabel = nil;
        }
            break;
            
        case 2:
        {
            UILabel *tmpLabel = [[UILabel alloc] init];
            tmpLabel.text = @"提前时间";
            tmpLabel.frame = CGRectMake(0, 0, 140, 43);
            [cell addSubview:tmpLabel];
            tmpLabel = nil;
            
            UILabel *timeLabel = [[UILabel alloc] init];
            timeLabel.text = @"10 min  ";
            timeLabel.frame = CGRectMake(140, 0, 140, 43);
            timeLabel.textAlignment = UITextAlignmentRight;
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
    [self.navigationController popViewControllerAnimated:YES];
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
//        tmpI = 2;
//        [self.settingTableView beginUpdates];
//        [self.settingTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:tmpIndex] withRowAnimation:YES];
//        [self.settingTableView endUpdates];
        
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
