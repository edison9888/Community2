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

@synthesize titleTextField, settingTableView, contentTextView;

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
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidUnload
{
    self.titleTextField = nil;
    self.settingTableView = nil;
    self.contentTextView = nil;
    [super viewDidUnload];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
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
            [cell addSubview:tmpSwitch];
            [tmpSwitch addTarget:self action:@selector(switchAlarmSetting:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:tmpSwitch];
            tmpSwitch = nil;
            
        }
            break;
            
        case 1:
        {
            
        }
            break;
            
        case 2:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    // Set up the cell...
    
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
}


@end
